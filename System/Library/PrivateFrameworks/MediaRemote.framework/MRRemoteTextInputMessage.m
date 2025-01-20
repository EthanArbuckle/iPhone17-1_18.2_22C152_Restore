@interface MRRemoteTextInputMessage
- (MRRemoteTextInputMessage)initWithVersion:(unint64_t)a3 data:(id)a4;
- (NSData)data;
- (unint64_t)type;
- (unint64_t)version;
@end

@implementation MRRemoteTextInputMessage

- (MRRemoteTextInputMessage)initWithVersion:(unint64_t)a3 data:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MRRemoteTextInputMessage;
  v7 = [(MRProtocolMessage *)&v10 init];
  if (v7)
  {
    v8 = objc_alloc_init(_MRRemoteTextInputMessageProtobuf);
    [(_MRRemoteTextInputMessageProtobuf *)v8 setVersion:a3];
    [(_MRRemoteTextInputMessageProtobuf *)v8 setData:v6];
    [(MRProtocolMessage *)v7 setUnderlyingCodableMessage:v8];
  }
  return v7;
}

- (unint64_t)version
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unint64_t v3 = [v2 version];

  return v3;
}

- (NSData)data
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unint64_t v3 = [v2 data];

  return (NSData *)v3;
}

- (unint64_t)type
{
  return 67;
}

@end