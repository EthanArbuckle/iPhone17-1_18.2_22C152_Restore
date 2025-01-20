@interface MBCKDeleteInfo
- (CKRecordID)recordID;
- (MBCKDeleteInfo)init;
- (NSDate)retryDate;
- (NSError)error;
- (NSMutableArray)callbacks;
- (unint64_t)deleteAttempts;
- (unint64_t)state;
- (void)setCallbacks:(id)a3;
- (void)setDeleteAttempts:(unint64_t)a3;
- (void)setError:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRetryDate:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation MBCKDeleteInfo

- (MBCKDeleteInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)MBCKDeleteInfo;
  v2 = [(MBCKDeleteInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    callbacks = v2->_callbacks;
    v2->_callbacks = (NSMutableArray *)v3;
  }
  return v2;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSDate)retryDate
{
  return self->_retryDate;
}

- (void)setRetryDate:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (void)setCallbacks:(id)a3
{
}

- (unint64_t)deleteAttempts
{
  return self->_deleteAttempts;
}

- (void)setDeleteAttempts:(unint64_t)a3
{
  self->_deleteAttempts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_retryDate, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end