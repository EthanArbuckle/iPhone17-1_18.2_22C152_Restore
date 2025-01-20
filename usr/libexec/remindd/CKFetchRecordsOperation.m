@interface CKFetchRecordsOperation
- (id)ic_shortLoggingOperationName;
- (void)ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031;
@end

@implementation CKFetchRecordsOperation

- (void)ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031
{
  v3.receiver = self;
  v3.super_class = (Class)CKFetchRecordsOperation;
  [(CKFetchRecordsOperation *)&v3 ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031];
  [(CKFetchRecordsOperation *)self setPerRecordCompletionBlock:0];
  [(CKFetchRecordsOperation *)self setPerRecordProgressBlock:0];
  [(CKFetchRecordsOperation *)self setFetchRecordsCompletionBlock:0];
}

- (id)ic_shortLoggingOperationName
{
  return ICCKOperationShortClassNameCKFetchRecordsOperation;
}

@end