@interface WFCoreDataTrigger
+ (id)fetchRequest;
+ (id)recordPropertyMap;
- (id)descriptor;
- (id)trigger;
@end

@implementation WFCoreDataTrigger

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Trigger"];
}

- (id)trigger
{
  v2 = [(WFCoreDataTrigger *)self data];
  v3 = +[WFTrigger triggerWithSerializedData:v2];

  return v3;
}

- (id)descriptor
{
  v19 = [WFConfiguredTrigger alloc];
  v18 = [(WFCoreDataTrigger *)self identifier];
  v3 = [(WFCoreDataTrigger *)self shortcut];
  v4 = [v3 workflowID];
  v5 = [(WFCoreDataTrigger *)self trigger];
  unsigned int v17 = [(WFCoreDataTrigger *)self shouldPrompt];
  uint64_t v6 = [(WFCoreDataTrigger *)self shouldNotify];
  uint64_t v7 = [(WFCoreDataTrigger *)self shouldRecur];
  char v8 = [(WFCoreDataTrigger *)self enabled];
  int v9 = [(WFCoreDataTrigger *)self source];
  int v10 = [(WFCoreDataTrigger *)self notificationLevel];
  char v11 = [(WFCoreDataTrigger *)self editableShortcut];
  v12 = [(WFCoreDataTrigger *)self selectedEntryMetadata];
  BYTE4(v16) = v11;
  HIDWORD(v15) = v9;
  LODWORD(v16) = v10;
  LOBYTE(v15) = v8;
  v13 = -[WFConfiguredTrigger initWithIdentifier:workflowID:trigger:shouldPrompt:shouldNotify:shouldRecur:enabled:triggerSource:notificationLevel:editableShortcut:selectedEntryMetadata:](v19, "initWithIdentifier:workflowID:trigger:shouldPrompt:shouldNotify:shouldRecur:enabled:triggerSource:notificationLevel:editableShortcut:selectedEntryMetadata:", v18, v4, v5, v17, v6, v7, v15, v16, v12);

  return v13;
}

+ (id)recordPropertyMap
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"triggerData";
  v5[0] = @"data";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

@end