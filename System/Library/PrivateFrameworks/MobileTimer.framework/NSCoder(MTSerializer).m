@interface NSCoder(MTSerializer)
- (uint64_t)mtType;
@end

@implementation NSCoder(MTSerializer)

- (uint64_t)mtType
{
  return 1;
}

@end