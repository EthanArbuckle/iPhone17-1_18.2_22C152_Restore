@interface SCUIInterventionViewController(UserSafety)
+ (uint64_t)viewControllerWithWorkflow:()UserSafety assetType:contextDictionary:;
@end

@implementation SCUIInterventionViewController(UserSafety)

+ (uint64_t)viewControllerWithWorkflow:()UserSafety assetType:contextDictionary:
{
  return [MEMORY[0x263F67DC0] viewControllerWithWorkflow:a3 contextDictionary:a5];
}

@end