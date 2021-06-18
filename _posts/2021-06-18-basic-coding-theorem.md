---
layout: post
title:  "A short proof on an elementary coding theorem"
date: 2021-06-18
---

The proof of achievability of channel coding theorem for a binary memoryless channel, due to Claude Shannon, marks the beginning of information theory.
Nowadays, this result is originally proven based on typicality and asymptotic
equipartition property.
which is formalized in today’s textbooks by the asymptotic
equipartition property (AEP). The way information theory is
introduced in most textbooks and graduate courses, 
Such cource usually first introduce to the student concepts such as entropy, mutual information, typicality, and so on, which are used in the proof.
It is instructive to present here a very short proof based on random coding argument.

Suppose

$$c = T m + z$$

Here, $$m$$ is the message, which is iid, taking values $$0, 1$$ with probability $$p$$.
$$T$$ the linear block code, $$c$$ the code, $$z$$ the iid Gaussian noise with standard deviation $$\sigma$$.
For concreteness,

$$c, z \in \mathbb{B} ^{n \cdot 1},
\quad T \in \mathbb{B} ^{n \cdot k}
\quad m \in \mathbb{B} ^{k \cdot 1}$$

It can also be written as

$$c = M t + z,
\quad t \in \mathbb{B} ^{n \cdot k}
\quad m \in \mathbb{B} ^{k \cdot 1}$$

where (if we borrow the Matlab notation for subvectors)

$$t_{1: k} = T_{1, 1: k},
\quad t_{k+1: 2k} = T_{2, 1: k}
\quad \cdots t_{nk -k +1: nk} = T_{n, 1: k}$$

$$M_{1, 1:k} = M_{2, k+1: 2k} = \dotsb = M_{n, nk -k +1: nk} = m$$

$$M_{i,j} = 0 \quad \mathrm{otherwise}$$

Now, suppose we can show that all of the components of $$M t$$ has weight at least $$n p$$, that is, at least $$n p$$ entries are nonzero.
Then by the weak law of large numbers, the probability that the number of transmission errors exceeds
$$p n$$ is vanishing.

We consider instead what such unwanted values of $$t$$ are.
Well, those elements with weight less than $$pn$$ cannot exceed this many,

$$N_c =\sum _{i=1} ^{pn} \binom {n} {i}$$

By Stirling's formula,

$$\binom {n} {i}
=\sqrt{\frac {n} {2 \pi i (n-i)}} \frac {n^n} {i^i (n-i) ^ {n-i}}$$

It is an exercise left to the reader, to show that, agreeing the expression of entropy,

$$\log_2 N_c = - n p \log_2 p - n (1-p) \log_2 (1-p)$$

The rest is easy: For each $$t$$, the number of nonzero $$M$$ is at most

$$N_M = 2^k - 1$$

For each $$c, M$$, the number of solution of $$t$$ is

$$N_M = 2^{nk - n}$$

Thus, the unwanted $$t$$ cannot exceed this many:

$$N_c N_M N_t \leq 2^{nk} - 1$$

That is to say, there is at least $$2^{nk} - (2^{nk} - 1) = 1$$ solution of $$t$$, for which the weight of $$c$$ exceeds $$np$$.

## Reference

Minyue Fu and Jun Ning, *A Simple Proof of a Fundamental Coding Theorem*, retrieved online.

