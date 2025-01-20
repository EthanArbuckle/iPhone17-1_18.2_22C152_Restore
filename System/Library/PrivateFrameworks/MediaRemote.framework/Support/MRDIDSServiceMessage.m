@interface MRDIDSServiceMessage
- (BOOL)replyWithData:(id)a3 priority:(int64_t)a4;
- (IDSDevice)device;
- (MRDIDSService)service;
- (MRDIDSServiceMessage)initWithID:(id)a3 data:(id)a4 device:(id)a5 service:(id)a6;
- (NSData)data;
- (NSNumber)messageID;
- (void)setService:(id)a3;
@end

@implementation MRDIDSServiceMessage

- (MRDIDSServiceMessage)initWithID:(id)a3 data:(id)a4 device:(id)a5 service:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MRDIDSServiceMessage;
  v14 = [(MRDIDSServiceMessage *)&v20 init];
  if (v14)
  {
    v15 = (NSNumber *)[v10 copy];
    messageID = v14->_messageID;
    v14->_messageID = v15;

    v17 = (NSData *)[v11 copy];
    data = v14->_data;
    v14->_data = v17;

    objc_storeStrong((id *)&v14->_service, a6);
    objc_storeStrong((id *)&v14->_device, a5);
  }

  return v14;
}

- (BOOL)replyWithData:(id)a3 priority:(int64_t)a4
{
  return [(MRDIDSService *)self->_service _sendMessage:a3 device:self->_device type:0 destination:0 session:0 options:0 priority:a4 replyID:self->_messageID response:0];
}

- (IDSDevice)device
{
  return self->_device;
}

- (NSData)data
{
  return self->_data;
}

- (NSNumber)messageID
{
  return self->_messageID;
}

- (MRDIDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end