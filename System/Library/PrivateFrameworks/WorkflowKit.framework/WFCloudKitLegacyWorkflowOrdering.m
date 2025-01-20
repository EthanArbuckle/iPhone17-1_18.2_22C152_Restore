@interface WFCloudKitLegacyWorkflowOrdering
+ (id)recordBasename;
+ (id)recordType;
- (WFCloudKitLegacyWorkflowOrdering)initWithZoneID:(id)a3 orderedWorkflowIDs:(id)a4;
@end

@implementation WFCloudKitLegacyWorkflowOrdering

+ (id)recordBasename
{
  return @"WFOrdering";
}

+ (id)recordType
{
  return @"ShortcutOrdering";
}

- (WFCloudKitLegacyWorkflowOrdering)initWithZoneID:(id)a3 orderedWorkflowIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFCloudKitLegacyWorkflowOrdering.m", 32, @"Invalid parameter not satisfying: %@", @"zoneID" object file lineNumber description];
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"WFOrdering" zoneID:v7];
  v10 = [(WFCloudKitBaseOrdering *)self initWithIdentifier:v9 orderedWorkflowIDs:v8 orderedFolderIDs:0];

  return v10;
}

@end