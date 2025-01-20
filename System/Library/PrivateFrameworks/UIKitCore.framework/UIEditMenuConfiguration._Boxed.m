@interface UIEditMenuConfiguration._Boxed
- (id)copyWithZone:(void *)a3;
@end

@implementation UIEditMenuConfiguration._Boxed

- (id)copyWithZone:(void *)a3
{
  sub_18590CE30((uint64_t)self->value, (uint64_t)v5);
  _s6_BoxedCMa();
  id result = (id)swift_allocObject();
  long long v4 = v5[1];
  *((_OWORD *)result + 1) = v5[0];
  *((_OWORD *)result + 2) = v4;
  *((void *)result + 6) = v6;
  return result;
}

@end