@interface MRSetNowPlayingClientMessage
- (MRClient)client;
- (MRSetNowPlayingClientMessage)initWithClient:(id)a3;
- (unint64_t)type;
@end

@implementation MRSetNowPlayingClientMessage

- (MRSetNowPlayingClientMessage)initWithClient:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRSetNowPlayingClientMessage;
  v5 = [(MRProtocolMessage *)&v10 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MRSetNowPlayingClientMessageProtobuf);
    v7 = [v4 skeleton];
    v8 = [v7 protobuf];
    [(_MRSetNowPlayingClientMessageProtobuf *)v6 setClient:v8];

    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v6];
  }

  return v5;
}

- (MRClient)client
{
  v3 = [MRClient alloc];
  id v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 client];
  v6 = [(MRClient *)v3 initWithProtobuf:v5];

  return v6;
}

- (unint64_t)type
{
  return 46;
}

@end