@interface WFCoreDataWorkflowQuarantine
+ (id)fetchRequest;
@end

@implementation WFCoreDataWorkflowQuarantine

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"ShortcutQuarantine"];
}

@end