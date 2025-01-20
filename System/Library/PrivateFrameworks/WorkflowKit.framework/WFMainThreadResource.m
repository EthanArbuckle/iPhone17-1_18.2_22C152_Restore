@interface WFMainThreadResource
+ (BOOL)isSingleton;
- (BOOL)isAvailable;
@end

@implementation WFMainThreadResource

+ (BOOL)isSingleton
{
  return 1;
}

- (BOOL)isAvailable
{
  return 1;
}

@end