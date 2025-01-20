@interface SKADatabasePendingPublishRequest
- (NSData)payloadData;
- (NSDate)dateCreated;
- (NSString)statusTypeIdentifier;
- (NSString)statusUniqueIdentifier;
- (SKADatabasePendingPublishRequest)initWithCoreDataPendingPublishRequest:(id)a3;
- (SKADatabasePendingPublishRequest)initWithStatusTypeIdentifier:(id)a3 dateCreated:(id)a4 payloadData:(id)a5 statusUniqueIdentifier:(id)a6 retryCount:(int64_t)a7;
- (int64_t)retryCount;
@end

@implementation SKADatabasePendingPublishRequest

- (SKADatabasePendingPublishRequest)initWithCoreDataPendingPublishRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 statusTypeIdentifier];
  v6 = [v4 dateCreated];
  v7 = [v4 payloadData];
  v8 = [v4 statusUniqueIdentifier];
  int v9 = [v4 retryCount];

  v10 = [(SKADatabasePendingPublishRequest *)self initWithStatusTypeIdentifier:v5 dateCreated:v6 payloadData:v7 statusUniqueIdentifier:v8 retryCount:v9];
  return v10;
}

- (SKADatabasePendingPublishRequest)initWithStatusTypeIdentifier:(id)a3 dateCreated:(id)a4 payloadData:(id)a5 statusUniqueIdentifier:(id)a6 retryCount:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SKADatabasePendingPublishRequest;
  v16 = [(SKADatabasePendingPublishRequest *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    statusTypeIdentifier = v16->_statusTypeIdentifier;
    v16->_statusTypeIdentifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    dateCreated = v16->_dateCreated;
    v16->_dateCreated = (NSDate *)v19;

    objc_storeStrong((id *)&v16->_payloadData, a5);
    uint64_t v21 = [v15 copy];
    statusUniqueIdentifier = v16->_statusUniqueIdentifier;
    v16->_statusUniqueIdentifier = (NSString *)v21;

    v16->_retryCount = a7;
  }

  return v16;
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (NSString)statusUniqueIdentifier
{
  return self->_statusUniqueIdentifier;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
}

@end