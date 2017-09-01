# Classification of a prime number in the Pari-GP Programming Language

## How to install Pari-GP (On Ubuntu)
```
sudo apt-get install pari-gp
```

## How to run

In `gp` console:
```
\r prime_classes.gp
p=2017
iswhatprime(p)
```

To run the script from a Linux shell (e.g., for automation), use `gp`'s 
`-q` option:
```
$ (cat prime_classes.gp; echo "p=2017;"; echo "iswhatprime(p)") | gp -q
```

