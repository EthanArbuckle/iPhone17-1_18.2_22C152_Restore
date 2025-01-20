@interface DataStreamBulkSendOpenSessionResult
- (DataStreamBulkSendOpenSessionResult)initWithSession:(id)a3 payload:(id)a4;
- (DataStreamBulkSendSession)session;
- (NSDictionary)payload;
- (id)attributeDescriptions;
@end

@implementation DataStreamBulkSendOpenSessionResult

- (DataStreamBulkSendOpenSessionResult)initWithSession:(id)a3 payload:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DataStreamBulkSendOpenSessionResult;
  v9 = [(DataStreamBulkSendOpenSessionResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_payload, a4);
  }

  return v10;
}

- (id)attributeDescriptions
{
  id v3 = objc_alloc((Class)HMFAttributeDescription);
  v4 = [(DataStreamBulkSendOpenSessionResult *)self session];
  id v5 = [v3 initWithName:@"session" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc((Class)HMFAttributeDescription);
  id v7 = [(DataStreamBulkSendOpenSessionResult *)self payload];
  id v8 = [v6 initWithName:@"payload" value:v7];
  v11[1] = v8;
  v9 = +[NSArray arrayWithObjects:v11 count:2];

  return v9;
}

- (DataStreamBulkSendSession)session
{
  return self->_session;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end