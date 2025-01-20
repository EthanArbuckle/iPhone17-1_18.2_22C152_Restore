@interface CKFetchDatabaseChangesOperation
- (id)ic_loggingValues;
- (id)ic_shortLoggingOperationName;
- (void)ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031;
@end

@implementation CKFetchDatabaseChangesOperation

- (id)ic_loggingValues
{
  v10.receiver = self;
  v10.super_class = (Class)CKFetchDatabaseChangesOperation;
  v3 = [(CKFetchDatabaseChangesOperation *)&v10 ic_loggingValues];
  id v4 = [v3 mutableCopy];

  v5 = [(CKFetchDatabaseChangesOperation *)self previousServerChangeToken];

  if (v5)
  {
    v6 = [(CKFetchDatabaseChangesOperation *)self previousServerChangeToken];
    v7 = [v6 data];
    v8 = [v7 base64EncodedStringWithOptions:0];
  }
  else
  {
    v8 = @"(none)";
  }
  [v4 setObject:v8 forKeyedSubscript:@"serverChangeToken"];

  return v4;
}

- (void)ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031
{
  v3.receiver = self;
  v3.super_class = (Class)CKFetchDatabaseChangesOperation;
  [(CKFetchDatabaseChangesOperation *)&v3 ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031];
  [(CKFetchDatabaseChangesOperation *)self setRecordZoneWithIDChangedBlock:0];
  [(CKFetchDatabaseChangesOperation *)self setRecordZoneWithIDWasDeletedBlock:0];
  [(CKFetchDatabaseChangesOperation *)self setFetchDatabaseChangesCompletionBlock:0];
}

- (id)ic_shortLoggingOperationName
{
  return ICCKOperationShortClassNameCKFetchDatabaseChangesOperation;
}

@end