@interface CLPCPolicyInterface
+ (id)createClient:(id *)a3;
@end

@implementation CLPCPolicyInterface

+ (id)createClient:(id *)a3
{
  id v3 = [(CLPCUserClient *)[CLPCPolicyClient alloc] init:a3];
  return v3;
}

@end