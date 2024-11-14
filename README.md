# Yet Another KINDS 1.0.0

The module provides REAL / INTEGER / LOGICAL kind constants, based on three principles:
- The kinds are based on precision and range requirements, without any reference
  to the sizes in memory (apart for the LOGICAL kinds), so that the codes can focus
  on the numerical properties only.
- The default kinds (kind(0.0), kind(0d0), kind(0), kind(.false.)) are given priority
  as long as they fit the requirements, so that it maximizes the compatibility with the
  legacy librairies that typically use these kinds
- The kinds are always defined (>0): if the requirements for a kind cannot be
  met, the kind with the requirements that are just below is selected.  
  The advantage of this approach is that codes that use these kinds can always 
  be compiled. The downside is that one has to test the actual precision/range at 
  runtime and make a decision.

## REAL kind constants
|                   |                             |                                |      |
|-------------------|-----------------------------|--------------------------------|------|
| r_default         | the default real            | (kind(1.0))                    |      |
| r_doubleprecision | the "double precision" real | (kind(1d0))                    |      |
| r_half            | half precision              | precision >= 3,  range >= 5    |      |    
| r_single          | single precision            | precision >= 6,  range >= 37   | (**) |
| r_sesqui          | 1.5x precision              | precision >= 10, range >= 37   | (**) |
| r_double          | double precision            | precision >= 12, range >= 100  | (* x)|
| r_extended        | extended precision          | precision >= 18, range >= 100  | (* x)|
| r_doubledouble    | double-double precision     | precision >= 24, range >= 100  |   (x)|
| r_quad            | quadruple precision         | precision >= 24, range >= 1000 |   (x)|

(**) : these kinds are necessarily either r_default or r_doubleprecision  
(*) : these kinds are r_default or r_doubleprecision in priority (if possible)  
(x) : no guarantee to meet the requirements

Note that Fortran standard:
- *recommends* precision(0.0) >= 6,  range(0.0) >= 37
- *requires*   precision(0d0) >= 10, range(0d0) >= 37

### Fallbacks
- r_double  falls back to r_sesqui if the requirements are not met
- r_extended  falls back to r_double if the requirements are not met
- r_doubledouble falls back to r_extended if the requirements are not met
- r_quad  falls back to r_doubledouble if the requirements are not met
 
## INTEGER kind constants
|                   |                             |                                |      |
|-------------------|-----------------------------|--------------------------------|------|
| i_default         | the default integer         | (kind(0))                      |      |
| i_shorter         |                             | range >= 2                     |      |
| i_short           |                             | range >= 4                     |      |
| i_medium          |                             | range >= 9                     | (*)  |    
| i_long            |                             | range >= 18                    | (*)  |  
| i_longer          |                             | range >= 36                    | (x)  |  

(*) : these kinds are i_default in priority (if possible)  
(x) : no guarantee to meet the requirements

Note that the standard requires the compilers to provide an integer with a range >= 18.
Consequently, only i_longer is not guaranteed to meet the requirements (in that case, 
it falls back to i_long).

## LOGICAL kind constants
|                   |                                                 | 
|-------------------|-------------------------------------------------|
| l_default         | the default kind                                |
| l_short           | currently =c_bool from the iso_c_binding module |
