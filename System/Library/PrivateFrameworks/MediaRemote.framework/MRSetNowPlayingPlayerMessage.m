@interface MRSetNowPlayingPlayerMessage
- (MRPlayerPath)playerPath;
- (MRSetNowPlayingPlayerMessage)initWithPlayerPath:(id)a3;
- (unint64_t)type;
@end

@implementation MRSetNowPlayingPlayerMessage

- (MRSetNowPlayingPlayerMessage)initWithPlayerPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRSetNowPlayingPlayerMessage;
  v5 = [(MRProtocolMessage *)&v10 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MRSetNowPlayingPlayerMessageProtobuf);
    v7 = [v4 skeleton];
    v8 = [v7 protobuf];
    [(_MRSetNowPlayingPlayerMessageProtobuf *)v6 setPlayerPath:v8];

    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v6];
  }

  return v5;
}

- (MRPlayerPath)playerPath
{
  v3 = [MRPlayerPath alloc];
  id v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 playerPath];
  v6 = [(MRPlayerPath *)v3 initWithProtobuf:v5];

  return v6;
}

- (unint64_t)type
{
  return 47;
}

@end