@interface MRPlaybackSessionMigrateBeginMessage
- (MRPlaybackSessionMigrateBeginMessage)initWithRequest:(id)a3 playerPath:(id)a4;
- (MRPlaybackSessionRequest)request;
- (MRPlayerPath)playerPath;
- (unint64_t)type;
@end

@implementation MRPlaybackSessionMigrateBeginMessage

- (MRPlaybackSessionMigrateBeginMessage)initWithRequest:(id)a3 playerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MRPlaybackSessionMigrateBeginMessage;
  v8 = [(MRProtocolMessage *)&v13 init];
  if (v8)
  {
    v9 = objc_alloc_init(_MRPlaybackSessionMigrateBeginMessageProtobuf);
    v10 = [v6 protobuf];
    [(_MRPlaybackSessionMigrateBeginMessageProtobuf *)v9 setRequest:v10];

    v11 = [v7 protobuf];
    [(_MRPlaybackSessionMigrateBeginMessageProtobuf *)v9 setPlayerPath:v11];

    [(MRProtocolMessage *)v8 setUnderlyingCodableMessage:v9];
  }

  return v8;
}

- (MRPlaybackSessionRequest)request
{
  v3 = [MRPlaybackSessionRequest alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 request];
  id v6 = [(MRPlaybackSessionRequest *)v3 initWithProtobuf:v5];

  return v6;
}

- (MRPlayerPath)playerPath
{
  v3 = [MRPlayerPath alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 playerPath];
  id v6 = [(MRPlayerPath *)v3 initWithProtobuf:v5];

  return v6;
}

- (unint64_t)type
{
  return 75;
}

@end