@interface WFCoreDataWorkflowActions
+ (id)fetchRequest;
@end

@implementation WFCoreDataWorkflowActions

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"ShortcutActions"];
}

@end