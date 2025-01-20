@interface MRPlaybackSessionMigrateEndMessage
- (MRPlaybackSessionMigrateEndMessage)initWithRequest:(id)a3 error:(id)a4 playerPath:(id)a5;
- (MRPlaybackSessionRequest)request;
- (MRPlayerPath)playerPath;
- (NSError)error;
- (unint64_t)type;
@end

@implementation MRPlaybackSessionMigrateEndMessage

- (MRPlaybackSessionMigrateEndMessage)initWithRequest:(id)a3 error:(id)a4 playerPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MRPlaybackSessionMigrateEndMessage;
  v11 = [(MRProtocolMessage *)&v17 init];
  if (v11)
  {
    v12 = objc_alloc_init(_MRPlaybackSessionMigrateEndMessageProtobuf);
    v13 = [v8 protobuf];
    [(_MRPlaybackSessionMigrateEndMessageProtobuf *)v12 setRequest:v13];

    -[_MRPlaybackSessionMigrateEndMessageProtobuf setErrorCode:](v12, "setErrorCode:", [v9 code]);
    v14 = [v9 localizedDescription];
    [(_MRPlaybackSessionMigrateEndMessageProtobuf *)v12 setErrorDescription:v14];

    v15 = [v10 protobuf];
    [(_MRPlaybackSessionMigrateEndMessageProtobuf *)v12 setPlayerPath:v15];

    [(MRProtocolMessage *)v11 setUnderlyingCodableMessage:v12];
  }

  return v11;
}

- (MRPlaybackSessionRequest)request
{
  v3 = [MRPlaybackSessionRequest alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 request];
  v6 = [(MRPlaybackSessionRequest *)v3 initWithProtobuf:v5];

  return v6;
}

- (MRPlayerPath)playerPath
{
  v3 = [MRPlayerPath alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 playerPath];
  v6 = [(MRPlayerPath *)v3 initWithProtobuf:v5];

  return v6;
}

- (NSError)error
{
  v3 = [(MRProtocolMessage *)self underlyingCodableMessage];
  if ([v3 errorCode] < 1)
  {
    id v9 = 0;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
    v5 = [(MRProtocolMessage *)self underlyingCodableMessage];
    uint64_t v6 = [v5 errorCode];
    v7 = [(MRProtocolMessage *)self underlyingCodableMessage];
    id v8 = [v7 errorDescription];
    id v9 = (void *)[v4 initWithMRError:v6 description:v8];
  }

  return (NSError *)v9;
}

- (unint64_t)type
{
  return 76;
}

@end