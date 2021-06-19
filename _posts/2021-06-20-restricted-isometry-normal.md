---
layout: post
title:  "Restricted isometry of iid normal matrix"
date: 2021-06-19
---

Sometimes a vector $$x$$ is "crowded" in a given basis $$U$$, but $$y = V U x U ^{-1} V ^{-1}$$ is "sparse" in the transformed basis $$V$$, that is to say, most entries of $$x$$ are $$0$$.
In such case, for a good approximation, we may take only the largest components of $$y$$ in the basis $$V$$ for reconstruction.
The field of compressive sensing aims to reconstruct such underdetermined linear system, when the sparsity of solution guarantees successful recovery for most cases.
Since more measurements are required to recover signal $$x$$ while fewer suffice in the sparse basis $$y$$, compressive sensing might save space complexity.
Such advantage can be useful in medical imaging, for example, since it is not only expensive, but also harmful to the patient, to take too many images, while the accuracy is also critical to the diagnosis.

But, even if we are sure that $$U$$ exists, its construction is another thing.
To be precise, we say $$x$$ is $$s$$ sparse, if only at most $$s$$ components of $$x$$ is nonzero.
It is shown that in the noiseless case, various convex minimization program may recover the signal $$x$$ efficiently, under overwhelming probability.

We say that $$Q$$ satisfies $$\delta$$ restricted isometry property (hereafter $$\delta$$ RIP) of sparsity s if for all $$s$$ sparse $$x$$,

$$(1 - \delta) \| x \|_2^2 \leq \| Q x \|_2^2 \leq (1 + \delta) \| x \|_2^2$$

It helps to think that $$Q$$ is almost unitary up to relative error $$\delta$$.

Such RIP matrices are known to be suitable for compressive sensing.
While it is generally difficult to show a given matrices have RIP, there are results that a family of randomly generated matrices have RIP.

We show here that iid normal matrix $$Q \in \mathbb{R}^{N \cdot M}$$ have RIP.
Without loss of generality, let

$$Q_{i,j} \sim \mathrm{normal} (0, 1^2)$$

Absorb suitable constants so that $$\| x \|_2 = 1$$.
By Chernoff bound, for every $$s$$ sparse $$x$$, for every $$\alpha >0$$,

$$q
\equiv \mathbb{P} \left[ \| Q x \|_2^2 \geq (1 + \delta) \right]
\leq e ^{-\alpha (1 + \delta)}
\mathbb{E} \exp \left( \alpha \| Q x \|_2^2 \right)$$

Now, if $$x_{i_t}$$ is nonzero for $$i_1, \dotsc, i_s$$,

$$\mathbb{E} \exp \left( \| Q x \|_2^2 \right)
=\mathbb{E} \exp \left[ \alpha x_{i_1}^2 \| Q_{1:N, i_1} \|_2^2
+ \alpha x_{i_2}^2 \| Q_{1:N, i_2} \|_2^2
\dotsb + \alpha x_{i_s}^2 \| Q_{1:N, i_s} \|_2^2 \right]$$

$$=\mathbb{E} \exp \left[ \alpha x_{i_1}^2 \| Q_{1:N, i_1} \|_2^2 \right]
\cdot \mathbb{E} \exp \left[ \alpha x_{i_2}^2 \| Q_{1:N, i_2} \|_2^2 \right]
\cdot \dotsb \cdot \mathbb{E} \exp \left[ \alpha x_{i_s}^2 \| Q_{1:N, i_s} \|_2^2 \right]$$

The first term can be found by plugging in the MGF of chi- square distribution

$$\mathbb{E} \exp \left[ \alpha x_{i_1}^2 \| Q_{1:N, i_1} \|_2^2 \right]
=(1 - 2 \alpha x_{i_1} ^2) ^{-N/2}$$

Similarly, for the rest,

$$q = e ^{-\alpha (1 + \delta)}
\left[ (1 - 2 \alpha x_{i_1} ^2) \cdot \dotsb \cdot (1 - 2 \alpha x_{i_s} ^2) \right] ^{-N/2}
$$

By the nature of alternating series,

$$q
\leq e^{-\alpha (1 + \delta)} (1 - 2\alpha) ^ {-N/2}$$

We simply plug in

$$\alpha = \frac {N} {1 + \delta}$$

Asymptotically, this gives, in view of the property of natural base $$e$$,

$$q
\leq e^{-N} \left( \frac {2N} {1 + \delta} \right) ^ {-N/2}
\left( 1 - \frac {1 + \delta} {2N} \right) ^ {-(2N/(1+\delta) ((1+\delta)/4)}
\approx 0 \cdot 0 \cdot e ^{-(1+\delta)/4} \to 0$$

Similarly, by Chernoff bound, for every $$s$$ sparse $$x$$, for every $$\alpha <0$$,

$$\mathbb{P} \left[ \| Q x \|_2^2 \leq (1 - \delta) \right]
\leq e ^{-\alpha (1 - \delta)}
\mathbb{E} \exp \left( \alpha \| Q x \|_2^2 \right)$$

A similar derivation shows that the tail probability mass vanishes, and the details are left to the reader.

## Reference

Achlioptas, Dimitris. "Database-friendly random projections: Johnson-Lindenstrauss with binary coins." *Journal of computer and System Sciences*, **66**, no 4 (2003).

Baraniuk, Richard, Mark Davenport, Ronald DeVore, and Michael Wakin. "A simple proof of the restricted isometry property for random matrices." *Constructive Approximation*, **28**, no 3 (2008).

