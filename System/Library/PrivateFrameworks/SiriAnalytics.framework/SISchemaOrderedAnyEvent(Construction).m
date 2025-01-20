@interface SISchemaOrderedAnyEvent(Construction)
+ (id)orderedAnyEventWithAnyEvent:()Construction timestamp:;
+ (id)orderedAnyEventWithAnyEvent:()Construction timestamp:clockIdentifier:;
@end

@implementation SISchemaOrderedAnyEvent(Construction)

+ (id)orderedAnyEventWithAnyEvent:()Construction timestamp:
{
  v5 = (objc_class *)MEMORY[0x1E4FA1290];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v9 = [v6 loggingRepresentation];

  [v8 setTimestamp:v9];
  id v10 = objc_alloc_init(MEMORY[0x1E4FA12D8]);
  [v10 setMetadata:v8];
  [v10 setEvent:v7];

  return v10;
}

+ (id)orderedAnyEventWithAnyEvent:()Construction timestamp:clockIdentifier:
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[SiriAnalyticsLogicalTimeStamp alloc] initWithMachAbsoluteTime:a4 clockIdentifier:v7];

  id v10 = [MEMORY[0x1E4FA12D8] orderedAnyEventWithAnyEvent:v8 timestamp:v9];

  return v10;
}

@end