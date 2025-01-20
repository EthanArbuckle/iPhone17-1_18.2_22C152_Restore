@interface CKFetchRecordZoneChangesOperation(IC)
- (id)ic_loggingValues;
- (id)ic_shortLoggingDescription;
- (uint64_t)ic_removeAllCompletionBlocks;
@end

@implementation CKFetchRecordZoneChangesOperation(IC)

- (id)ic_loggingValues
{
  v9.receiver = a1;
  v9.super_class = (Class)&off_1F1FA02B8;
  v2 = objc_msgSendSuper2(&v9, sel_ic_loggingValues);
  v3 = (void *)[v2 mutableCopy];

  v4 = [a1 configurationsByRecordZoneID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CKFetchRecordZoneChangesOperation_IC__ic_loggingValues__block_invoke;
  v7[3] = &unk_1E64A65C0;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (id)ic_shortLoggingDescription
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [a1 operationID];
  v6 = [v2 stringWithFormat:@"<%@ %@>", v4, v5];

  return v6;
}

- (uint64_t)ic_removeAllCompletionBlocks
{
  v3.receiver = a1;
  v3.super_class = (Class)&off_1F1FA02B8;
  objc_msgSendSuper2(&v3, sel_ic_removeAllCompletionBlocks);
  [a1 setRecordWasChangedBlock:0];
  [a1 setRecordWithIDWasDeletedBlock:0];
  [a1 setFetchRecordZoneChangesCompletionBlock:0];
  [a1 setRecordZoneFetchCompletionBlock:0];
  return [a1 setRecordZoneChangeTokensUpdatedBlock:0];
}

@end