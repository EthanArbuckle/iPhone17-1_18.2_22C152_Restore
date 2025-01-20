@interface WFCoreDataWorkflowIcon
+ (id)fetchRequest;
@end

@implementation WFCoreDataWorkflowIcon

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"ShortcutIcon"];
}

@end