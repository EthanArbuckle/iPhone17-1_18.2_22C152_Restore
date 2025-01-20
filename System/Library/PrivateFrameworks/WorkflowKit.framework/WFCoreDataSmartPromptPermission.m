@interface WFCoreDataSmartPromptPermission
+ (id)fetchRequest;
@end

@implementation WFCoreDataSmartPromptPermission

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SmartPromptPermission"];
}

@end