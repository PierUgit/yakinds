program yaktest
use yakinds
implicit none


print 100, "r_default        ",r_default
print 100, "r_doubleprecision",r_doubleprecision
print 100, "r_half           ",r_single
print 100, "r_single         ",r_single
print 100, "r_sesqui         ",r_sesqui
print 100, "r_double         ",r_double
print 100, "r_extended       ",r_extended
print 100, "r_doubledouble   ",r_doubledouble
print 100, "r_quad           ",r_quad
print*
print 100, "i_default        ",i_default
print 100, "i_shorter        ",i_shorter
print 100, "i_short          ",i_short
print 100, "i_medium         ",i_medium
print 100, "i_long           ",i_long
print 100, "i_longer         ",i_longer
print*
print 100, "l_default        ",l_default
print 100, "l_short          ",l_short

100 format(A," =",I3)

end
