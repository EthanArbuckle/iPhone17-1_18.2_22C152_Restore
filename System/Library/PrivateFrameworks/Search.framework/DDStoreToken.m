@interface DDStoreToken
- (BOOL)canceled;
- (DDStoreToken)initWithStore:(id)a3;
- (SPDataDetectorsDataStore)store;
- (unint64_t)type;
- (void)cancel;
- (void)setCanceled:(BOOL)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation DDStoreToken

- (DDStoreToken)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDStoreToken;
  v6 = [(DDStoreToken *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v7->_type = 8;
  }

  return v7;
}

- (void)cancel
{
  self->_canceled = 1;
}

- (SPDataDetectorsDataStore)store
{
  return (SPDataDetectorsDataStore *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
}

@end