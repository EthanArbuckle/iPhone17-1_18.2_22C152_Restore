@interface SSUIServiceRequest
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)entitlement;
@end

@implementation SSUIServiceRequest

+ (id)entitlement
{
  id v2 = (id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Bare SSUIServiceRequest sent to SSUIServiceServer" userInfo:0];
  return 0;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end