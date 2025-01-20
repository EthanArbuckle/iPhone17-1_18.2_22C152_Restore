@interface NewsRegionCheck
- (BOOL)isSatisfied;
@end

@implementation NewsRegionCheck

- (BOOL)isSatisfied
{
  uint64_t v2 = sub_1AFFC8E48();
  char v3 = sub_1AFED9644(v2);
  swift_release();
  return v3 & 1;
}

@end