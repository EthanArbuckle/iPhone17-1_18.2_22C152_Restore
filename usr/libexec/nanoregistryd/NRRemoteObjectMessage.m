@interface NRRemoteObjectMessage
- (IDSProtobuf)protobuf;
- (NRRemoteObjectMessage)initWithProtobuf:(id)a3 andIDSBTUUID:(id)a4;
- (NSUUID)idsBTUUID;
- (void)setIdsBTUUID:(id)a3;
- (void)setProtobuf:(id)a3;
@end

@implementation NRRemoteObjectMessage

- (NRRemoteObjectMessage)initWithProtobuf:(id)a3 andIDSBTUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NRRemoteObjectMessage;
  v9 = [(NRRemoteObjectMessage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_protobuf, a3);
    objc_storeStrong((id *)&v10->_idsBTUUID, a4);
  }

  return v10;
}

- (IDSProtobuf)protobuf
{
  return self->_protobuf;
}

- (void)setProtobuf:(id)a3
{
}

- (NSUUID)idsBTUUID
{
  return self->_idsBTUUID;
}

- (void)setIdsBTUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsBTUUID, 0);

  objc_storeStrong((id *)&self->_protobuf, 0);
}

@end