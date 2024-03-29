# Automatic Graph Tracking in Dynamic Probabilistic Programs via Source Transformations

  This thesis presents a novel approach for the implementation of a tracking system to
  facilitate program analysis, based on program transformations. The approach is then applied to a
  specific problem in the field of probabilistic programming.

  The main contribution is a general system for the extraction of rich computation graphs in the
  Julia programming language, based on a transformation of the intermediate representation (IR) used
  by the compiler.  These graphs contain a slice of the whole recursive structure of any Julia
  program in terms of executed IR instructions, including control flow operations.  The system is
  flexible enough to be used for multiple purposes that require dynamic program analysis or abstract
  interpretation, such as automatic differentiation or dependency analysis.

  The second part of the thesis describes the application of this graph tracking system to
  probabilistic programs written for Turing.jl, a probabilistic programming system implemented as an
  embedded language within Julia.  Through this, an executed Turing model can be analysed, and the
  dependency structure of involved random variables be extracted from it.  Given this structure,
  analytical Gibbs conditionals can be calculated for a large set of models and passed to Turing's
  inference mechanism, where they are used in Markov Chain Monte Carlo samplers approximating the
  modeled distribution.
