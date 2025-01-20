@interface WFCoreDataRunEvent
+ (id)fetchRequest;
- (id)descriptor;
@end

@implementation WFCoreDataRunEvent

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"ShortcutRunEvent"];
}

- (id)descriptor
{
  v3 = [WFWorkflowRunEvent alloc];
  v4 = [(WFCoreDataRunEvent *)self identifier];
  v5 = [(WFCoreDataRunEvent *)self shortcut];
  v6 = [v5 descriptor];
  v7 = [(WFCoreDataRunEvent *)self source];
  v8 = [(WFCoreDataRunEvent *)self date];
  v9 = [(WFCoreDataRunEvent *)self trigger];
  v10 = [v9 identifier];
  v11 = [(WFWorkflowRunEvent *)v3 initWithIdentifier:v4 workflow:v6 source:v7 date:v8 triggerID:v10 outcome:(int)[(WFCoreDataRunEvent *)self outcome]];

  return v11;
}

@end