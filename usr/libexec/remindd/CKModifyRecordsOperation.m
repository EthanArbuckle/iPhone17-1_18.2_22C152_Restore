@interface CKModifyRecordsOperation
- (id)ic_shortLoggingOperationName;
- (void)ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031;
@end

@implementation CKModifyRecordsOperation

- (void)ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031
{
  v3.receiver = self;
  v3.super_class = (Class)CKModifyRecordsOperation;
  [(CKModifyRecordsOperation *)&v3 ic_removeAllCKCompletionBlocksButNotTheNSOperationCompletionBlock_50200031];
  [(CKModifyRecordsOperation *)self setPerRecordSaveBlock:0];
  [(CKModifyRecordsOperation *)self setPerRecordProgressBlock:0];
  [(CKModifyRecordsOperation *)self setModifyRecordsCompletionBlock:0];
}

- (id)ic_shortLoggingOperationName
{
  return ICCKOperationShortClassNameCKModifyRecordsOperation;
}

@end