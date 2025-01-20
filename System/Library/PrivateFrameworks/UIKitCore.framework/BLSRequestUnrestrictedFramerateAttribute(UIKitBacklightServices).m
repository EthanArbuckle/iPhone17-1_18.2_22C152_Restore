@interface BLSRequestUnrestrictedFramerateAttribute(UIKitBacklightServices)
+ (id)requestUnrestrictedFramerateForScene:()UIKitBacklightServices;
@end

@implementation BLSRequestUnrestrictedFramerateAttribute(UIKitBacklightServices)

+ (id)requestUnrestrictedFramerateForScene:()UIKitBacklightServices
{
  id v4 = a3;
  id v5 = [a1 alloc];
  v6 = [v4 _FBSScene];

  v7 = (void *)[v5 initWithFBSScene:v6];
  return v7;
}

@end