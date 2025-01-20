@interface PendingIDSProtobuf
+ (id)pendingIDSProtobufMessageTypeToString:(unint64_t)a3;
- (IDSDevice)fromIDSDevice;
- (IDSProtobuf)idsProtobuf;
- (NSDate)receivedDate;
- (PendingIDSProtobuf)initWithIDSProtobuf:(id)a3 ofType:(unint64_t)a4 from:(id)a5 receivedAt:(id)a6;
- (id)description;
- (unint64_t)messageType;
@end

@implementation PendingIDSProtobuf

- (PendingIDSProtobuf)initWithIDSProtobuf:(id)a3 ofType:(unint64_t)a4 from:(id)a5 receivedAt:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PendingIDSProtobuf;
  v14 = [(PendingIDSProtobuf *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_idsProtobuf, a3);
    v15->_messageType = a4;
    objc_storeStrong((id *)&v15->_receivedDate, a6);
    objc_storeStrong((id *)&v15->_fromIDSDevice, a5);
  }

  return v15;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  receivedDate = self->_receivedDate;
  v5 = [(IDSProtobuf *)self->_idsProtobuf context];
  v6 = [v5 outgoingResponseIdentifier];
  v7 = +[PendingIDSProtobuf pendingIDSProtobufMessageTypeToString:self->_messageType];
  id v8 = [v3 initWithFormat:@"PendingIDSProtobuf for IDSProtobuf received at: %@, GUID: %@, type: %@", receivedDate, v6, v7];

  return v8;
}

+ (id)pendingIDSProtobufMessageTypeToString:(unint64_t)a3
{
  if (a3 > 4) {
    return @"Undefined";
  }
  else {
    return off_10003D278[a3];
  }
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (IDSProtobuf)idsProtobuf
{
  return self->_idsProtobuf;
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (IDSDevice)fromIDSDevice
{
  return self->_fromIDSDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromIDSDevice, 0);
  objc_storeStrong((id *)&self->_idsProtobuf, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
}

@end