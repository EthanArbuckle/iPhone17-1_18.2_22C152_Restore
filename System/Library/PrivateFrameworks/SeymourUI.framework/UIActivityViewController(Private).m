@interface UIActivityViewController(Private)
- (uint64_t)smu_setSharingAsCollapsed;
@end

@implementation UIActivityViewController(Private)

- (uint64_t)smu_setSharingAsCollapsed
{
  return [a1 setSharingStyle:1];
}

@end