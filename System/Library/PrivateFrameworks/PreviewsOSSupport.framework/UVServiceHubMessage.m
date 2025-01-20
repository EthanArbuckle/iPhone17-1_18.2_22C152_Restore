@interface UVServiceHubMessage
- (NSSecureCoding)payload;
- (NSString)messageType;
- (UVServiceHubMessage)initWithMessageType:(id)a3 payload:(id)a4 replyHandler:(id)a5;
- (id)replyHandler;
@end

@implementation UVServiceHubMessage

- (UVServiceHubMessage)initWithMessageType:(id)a3 payload:(id)a4 replyHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UVServiceHubMessage;
  v12 = [(UVServiceHubMessage *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_messageType, a3);
    objc_storeStrong((id *)&v13->_payload, a4);
    v14 = _Block_copy(v11);
    id replyHandler = v13->_replyHandler;
    v13->_id replyHandler = v14;
  }
  return v13;
}

- (NSString)messageType
{
  return self->_messageType;
}

- (NSSecureCoding)payload
{
  return self->_payload;
}

- (id)replyHandler
{
  return self->_replyHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replyHandler, 0);
  objc_storeStrong((id *)&self->_payload, 0);

  objc_storeStrong((id *)&self->_messageType, 0);
}

@end