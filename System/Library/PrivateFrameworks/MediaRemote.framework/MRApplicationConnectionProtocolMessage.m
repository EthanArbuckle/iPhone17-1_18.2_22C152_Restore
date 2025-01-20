@interface MRApplicationConnectionProtocolMessage
- (MRApplicationConnectionContext)context;
- (MRApplicationConnectionMessage)message;
- (MRApplicationConnectionProtocolMessage)initWithMessage:(id)a3 connectionContext:(id)a4;
- (unint64_t)type;
@end

@implementation MRApplicationConnectionProtocolMessage

- (MRApplicationConnectionProtocolMessage)initWithMessage:(id)a3 connectionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MRApplicationConnectionProtocolMessage;
  v8 = [(MRProtocolMessage *)&v13 init];
  if (v8)
  {
    v9 = objc_alloc_init(_MRApplicationConnectionProtocolMessageProtobuf);
    v10 = [v6 protobuf];
    [(_MRApplicationConnectionProtocolMessageProtobuf *)v9 setApplicationMessage:v10];

    v11 = [v7 protobuf];
    [(_MRApplicationConnectionProtocolMessageProtobuf *)v9 setContext:v11];

    [(MRProtocolMessage *)v8 setUnderlyingCodableMessage:v9];
  }

  return v8;
}

- (unint64_t)type
{
  return 135;
}

- (MRApplicationConnectionContext)context
{
  v3 = [MRApplicationConnectionContext alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 context];
  id v6 = [(MRApplicationConnectionContext *)v3 initWithProtobuf:v5];

  return v6;
}

- (MRApplicationConnectionMessage)message
{
  v3 = [MRApplicationConnectionMessage alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 applicationMessage];
  id v6 = [(MRApplicationConnectionMessage *)v3 initWithProtobuf:v5];

  return v6;
}

@end