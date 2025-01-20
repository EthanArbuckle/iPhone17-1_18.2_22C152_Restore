@interface MBCKSaveInfo
- (CKRecord)record;
- (MBCKSaveDelegate)delegate;
- (NSDate)retryDate;
- (NSError)error;
- (double)uploadProgress;
- (id)completion;
- (id)description;
- (int64_t)savePolicy;
- (unint64_t)assetSize;
- (unint64_t)recordSize;
- (unint64_t)saveAttempts;
- (unint64_t)state;
- (void)setAssetSize:(unint64_t)a3;
- (void)setCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setRecord:(id)a3;
- (void)setRecordSize:(unint64_t)a3;
- (void)setRetryDate:(id)a3;
- (void)setSaveAttempts:(unint64_t)a3;
- (void)setSavePolicy:(int64_t)a3;
- (void)setState:(unint64_t)a3;
- (void)setUploadProgress:(double)a3;
@end

@implementation MBCKSaveInfo

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  id v4 = objc_alloc((Class)NSString);
  v5 = [(MBCKSaveInfo *)self record];
  v6 = [v5 recordID];
  v7 = [v6 recordName];
  id v8 = [v4 initWithFormat:@"recordName=%@", v7];
  [v3 addObject:v8];

  id v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"state=%lu", -[MBCKSaveInfo state](self, "state"));
  [v3 addObject:v9];

  id v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"sp=%ld", -[MBCKSaveInfo savePolicy](self, "savePolicy"));
  [v3 addObject:v10];

  id v11 = objc_alloc((Class)NSString);
  uint64_t v12 = objc_opt_class();
  v13 = [v3 componentsJoinedByString:@", "];
  id v14 = [v11 initWithFormat:@"<%@: %p; %@>", v12, self, v13];

  return v14;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (int64_t)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(int64_t)a3
{
  self->_savePolicy = a3;
}

- (MBCKSaveDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MBCKSaveDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDate)retryDate
{
  return self->_retryDate;
}

- (void)setRetryDate:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (unint64_t)saveAttempts
{
  return self->_saveAttempts;
}

- (void)setSaveAttempts:(unint64_t)a3
{
  self->_saveAttempts = a3;
}

- (unint64_t)recordSize
{
  return self->_recordSize;
}

- (void)setRecordSize:(unint64_t)a3
{
  self->_recordSize = a3;
}

- (unint64_t)assetSize
{
  return self->_assetSize;
}

- (void)setAssetSize:(unint64_t)a3
{
  self->_assetSize = a3;
}

- (double)uploadProgress
{
  return self->_uploadProgress;
}

- (void)setUploadProgress:(double)a3
{
  self->_uploadProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_retryDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end