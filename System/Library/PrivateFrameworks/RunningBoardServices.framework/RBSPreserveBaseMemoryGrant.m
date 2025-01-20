@interface RBSPreserveBaseMemoryGrant
+ (id)grant;
@end

@implementation RBSPreserveBaseMemoryGrant

+ (id)grant
{
  v2 = (void *)[objc_alloc((Class)a1) _init];
  return v2;
}

@end