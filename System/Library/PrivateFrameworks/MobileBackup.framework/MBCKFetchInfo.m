@interface MBCKFetchInfo
- (CKRecordID)recordID;
- (MBCKFetchInfo)init;
- (NSDate)retryDate;
- (NSError)error;
- (NSError)operationError;
- (NSMutableArray)callbacks;
- (id)description;
- (unint64_t)assetSize;
- (unint64_t)fetchAttempts;
- (unint64_t)state;
- (void)setAssetSize:(unint64_t)a3;
- (void)setCallbacks:(id)a3;
- (void)setError:(id)a3;
- (void)setFetchAttempts:(unint64_t)a3;
- (void)setOperationError:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRetryDate:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation MBCKFetchInfo

- (MBCKFetchInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)MBCKFetchInfo;
  v2 = [(MBCKFetchInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    callbacks = v2->_callbacks;
    v2->_callbacks = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  id v4 = objc_alloc((Class)NSString);
  v5 = [(MBCKFetchInfo *)self recordID];
  objc_super v6 = [v5 recordName];
  id v7 = [v4 initWithFormat:@"recordName=%@", v6];
  [v3 addObject:v7];

  id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"state=%lu", -[MBCKFetchInfo state](self, "state"));
  [v3 addObject:v8];

  id v9 = objc_alloc((Class)NSString);
  uint64_t v10 = objc_opt_class();
  v11 = [v3 componentsJoinedByString:@", "];
  id v12 = [v9 initWithFormat:@"<%@: %p; %@>", v10, self, v11];

  return v12;
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

- (unint64_t)assetSize
{
  return self->_assetSize;
}

- (void)setAssetSize:(unint64_t)a3
{
  self->_assetSize = a3;
}

- (unint64_t)fetchAttempts
{
  return self->_fetchAttempts;
}

- (void)setFetchAttempts:(unint64_t)a3
{
  self->_fetchAttempts = a3;
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

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (void)setCallbacks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_retryDate, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end