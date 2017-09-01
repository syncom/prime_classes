/* Determine the category of prime classes

Author: Ning Shang (syncom.dev@gmail.com)

*/


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A balanced prime is a prime number with equal-sized prime
\\ gaps above and below it
\\ Returns 1 if p is balanced, 0 if p is not balanced
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
isbalanced(p)=
a = precprime(p-1);
b = nextprime(p+1);
if (p == (a + b)/2, return(1), return(0));
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A prime number p is called a Chen prime if p + 2 is either 
\\ a prime or a product of two primes 
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
ischen(p)=
q = p + 2;
if (isprime(q), return(1),
  m = factor(q);
  s = matsize(m);
  if (s[1] == 1 && m[1, 2] == 2, return(1));
  if (s[1] == 2 && m[1,2] == 1 && m[2,2] == 1, return(1));
  return(0);
);
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A circular prime is a prime number with the property that 
\\ the number generated at each intermediate step when 
\\ cyclically permuting its (base 10) digits will be prime
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
iscircular(p)=
if (!isprime(p), return(0));
n = floor(log(p)/log(10));
for (i = 1, n, 
  r = p % 10;
  s = floor(p / 10);
  p = s + r * 10^n;
  if (!isprime(p), return(0))
);
return(1);
}


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ Cousin primes are prime numbers that differ by four
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
hascousin(p)=
if (isprime(p+4) || isprime(p-4), return(1), return(0));
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A cuban prime is a prime number of the form 3n^2+3n+1 or
\\ 3n^2 + 1, n > 0
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
iscuban(p)=
ub = ceil(sqrt(p/3));
for (i=1, ub,
  if ( p == 3*i^2 + 3*i + 1 || p == 3*i^2 + 1, return(1))
);
return(0);
}


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A Cullen number is a natural number of the form n*2^n + 1
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
iscullen(p)=
ub = floor(log(p)/log(2));
for (i = 0, ub, 
  if (i*2^i+1 == p, return(1))
);
return(0);
}


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A Friedlander-Iwaniec prime is a prime number of the form
\\ a^2 + b^4
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
isfriedlanderiwaniec(p)=
ub = ceil(p^(1/4));
for (b = 1, ub,
  if (issquare(p - b^4), return(1))
);
return(0);
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A twin prime is a prime that has a prime gap of two
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
hastwin(p)=
if (isprime(p+2) || isprime(p-2), return(1), return(0));
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A Mersenne prime is a prime of the form 2^n-1
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
ismersenne(p)=
n = ceil(log(p+1)/log(2));
if (p+1 == 2^n || p+1 == 2^(n-1), return(1), return(0));
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A double Mersenne prime is a prime of the form 2^(2^n-1)-1,
\\ where n is a prime.
\\ The algorithm below takes a pragmatic approach; there might
\\ be double Mersenne primes other than the 4 tested, however,
\\ they would be too large for current primality tests to
\\ verify
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
doublemersennenumber(p)=2^(2^p-1)-1;
}
{
isdoublemersenne(p)=
if (p == doublemersennenumber(2) ||
    p == doublemersennenumber(3) ||
    p == doublemersennenumber(5) ||
    p == doublemersennenumber(7), 
    return(1), return(0));
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ An Eisenstein prime that is a natural prime is of the
\\ form 3*n-1
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
iseisenstein(p)=
if (p % 3 == 2, return(1), return(0));
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A factorial prime is a prime number that is one less or 
\\ one more than a factorial
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
isfactorial(p)=
n = ceil(log(p+1)/log(2))+1;
for (i = 0, n, 
fi = i!;
if (fi == p+1 || fi == p-1, return(1))
);
return(0);
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A Fermat prime is a prime of the form 2^(2^n)+1
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
isfermat(p)=
if (p==3 || p==5 || p==17 || p==257 || p==65537, 
return(1), return(0));
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A Fibonacci prime is a Fibonacci number that is a prime
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
isfibonacci(p)=
i=1;
n = fibonacci(i);
while(n<=p, 
if (n == p, return(1));
i = i + 1;
n = fibonacci(i);
);
return(0);
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A Fortunate number is the smallest integer m > 1 such that, 
\\ for a given positive integer n, pn# + m is a prime number, 
\\ where the primorial pn# is the product of the first n prime 
\\ numbers. So far all known Fortunate numbers are prime.
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
isfortunate(p)=
pn = precprime(p-1);
forprime(x=2, pn,
  primorial = prodeuler(y=2, x, y);
  test = 0;
  if (nextprime(primorial+2) == primorial + p, return(1));
);
return(0);
}


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A Gaussian prime that is also a natural prime is of the 
\\ form 4*n+3
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
isgaussian(p)=
if (p % 4 == 3, return(1), return(0));
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A good prime is a prime number whose square is greater 
\\ than the product of any two primes at the same number of 
\\ positions before and after it in the sequence of primes
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
isgood(p)=
if (p==2, return(0));
n=0;
forprime(x=2, p, n = n+1);
for (i=1, n-1, 
  if ( p^2 <= prime(n-i) * prime(n+i), return(0));
);
return(1);
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A happy number is a number defined by the following process: 
\\ Starting with any positive integer, replace the number by 
\\ the sum of the squares of its digits, and repeat the process 
\\ until the number either equals 1 (where it will stay), or it 
\\ loops endlessly in a cycle that does not include 1. Those 
\\ numbers for which this process ends in 1 are happy numbers, 
\\ while those that do not end in 1 are unhappy numbers (or sad 
\\ numbers). A happy prime is a happy number that is prime.
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
happy(n)=
s=0;
q=n;
while (q != 0,
  r = q % 10;
  q = q\10;
  s = s + r^2;
);
return(s);
}
{
ishappy(p)=
if (p == 1, return(1));
if (p == 4, return(0));
return(ishappy(happy(p)));
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A Lucas prime is a Lucas number that is a prime
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
lucas(n)=
if (n < 0, return(0));
if (n == 0, return(2));
if (n == 1, return(1));
return(lucas(n-1) + lucas(n-2));
}

{
islucas(p)=
if (p==1 || p == 2, return(1));
i=2;
n = lucas(i);
while(n<=p, 
if (n == p, return(1));
i = i + 1;
n = lucas(i);
);
return(0);
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A primorial prime is a prime number of the form pn# ± 1,
\\ where pn# is the primorial of pn (the product of the first 
\\ n primes).
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
isprimorial(p)=
if (p == 2, return(1));
ub = ceil(log(p+1)/log(2));
for (i=1, ub, 
  primorial = prod(x=1, i, prime(x));
  if (primorial == p+1 || primorial == p-1, return(1));
);
return(0);
}


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A Pythagorean prime is a prime number of the form 4n + 1.
\\ Pythagorean primes are exactly the odd prime numbers that
\\ are the sum of two squares.
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
ispythagorean(p)=
if ( p % 4 == 1, return(1), return(0));
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A safe prime is a prime number of the form 2p + 1, where p
\\ is also a prime
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
issafe(p)=
if (p==2, return(0));
q = (p-1)/2;
if (isprime(q), return(1), return(0));
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A prime number p is a Sophie Germain prime if 2p + 1 is
\\ also prime
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
issophiegermain(p)=
if (isprime(2*p + 1), return(1), return(0));
}


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ A prime number p is a Woodall prime if p is of the form
\\ n*2^n -1 for some positive integer n
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
iswoodall(p)=
x = ceil(log(p+1)/log(2));
ub = x -1;
lb = floor((x-1)/2);
for (i=lb, ub,
  if (p == i*2^i - 1, return(1))
);
return(0);
}


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ What prime is it?
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
{
iswhatprime(p)=
if (p<=0, print("input must be positive"); return);
if (!isprime(p), print(p, " is not a prime"); return);
print(p, " is a prime");
if (isbalanced(p), print("    a balanced prime"));
if (ischen(p), print("    a Chen prime"));
if (iscircular(p), print("    a circular prime"));
if (iscuban(p), print("    a cuban prime"));
if (iscullen(p), print("    a Cullen prime"));
if (isfriedlanderiwaniec(p), print("    a Friedlander-Iwaniec prime"));
if (ismersenne(p), print("    a Mersenne prime"));
if (isdoublemersenne(p), print("    a double Mersenne prime"));
if (iseisenstein(p), print("    an Eisenstein prime"));
if (isfactorial(p), print("    a factorial prime"));
if (isfermat(p), print("    a Fermat prime"));
if (isfibonacci(p), print("    a Fibonacci prime"));
\\if (isfortunate(p), print("    a Fortunate prime"));
if (isgaussian(p), print("    a Gaussian prime"));
if (isgood(p), print("    a good prime"));
if (ishappy(p), print("    a happy prime"));
if (islucas(p), print("    a Lucas prime"));
if (isprimorial(p), print("    a primorial prime"));
if (ispythagorean(p), print("    a Pythagorean prime"));
if (issafe(p), print("    a safe prime"));
if (issophiegermain(p), print("    a Sophie Germain prime"));
if (iswoodall(p), print("    a Woodall prime"));
if (hastwin(p), print("    has a twin prime"));
if (hascousin(p), print("    has a cousin prime"));

}
