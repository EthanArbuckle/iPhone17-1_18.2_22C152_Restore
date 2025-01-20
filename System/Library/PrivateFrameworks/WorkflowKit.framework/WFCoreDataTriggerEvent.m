@interface WFCoreDataTriggerEvent
+ (id)fetchRequest;
- (id)descriptor;
@end

@implementation WFCoreDataTriggerEvent

- (id)descriptor
{
  v3 = [WFTriggerEvent alloc];
  v4 = [(WFCoreDataTriggerEvent *)self identifier];
  v5 = [(WFCoreDataTriggerEvent *)self trigger];
  v6 = [v5 identifier];
  v7 = [(WFCoreDataTriggerEvent *)self eventInfo];
  uint64_t v8 = [(WFCoreDataTriggerEvent *)self confirmed];
  v9 = [(WFCoreDataTriggerEvent *)self dateCreated];
  v10 = [(WFTriggerEvent *)v3 initWithIdentifier:v4 triggerID:v6 eventInfo:v7 confirmed:v8 dateCreated:v9];

  return v10;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"TriggerEvent"];
}

@end