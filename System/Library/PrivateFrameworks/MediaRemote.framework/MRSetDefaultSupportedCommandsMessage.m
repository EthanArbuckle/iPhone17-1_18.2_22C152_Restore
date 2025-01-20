@interface MRSetDefaultSupportedCommandsMessage
- (MRSetDefaultSupportedCommandsMessage)initWithDefaultSupportedCommands:(id)a3 forPlayerPath:(id)a4 encoding:(int64_t)a5;
- (MRSetDefaultSupportedCommandsMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4;
- (NSArray)supportedCommands;
- (NSString)bundleID;
- (unint64_t)type;
@end

@implementation MRSetDefaultSupportedCommandsMessage

- (MRSetDefaultSupportedCommandsMessage)initWithDefaultSupportedCommands:(id)a3 forPlayerPath:(id)a4 encoding:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MRSetDefaultSupportedCommandsMessage;
  v10 = [(MRProtocolMessage *)&v17 init];
  if (v10)
  {
    v11 = [[MRNowPlayingState alloc] initWithPlayerPath:v9];
    state = v10->_state;
    v10->_state = v11;

    [(MRNowPlayingState *)v10->_state setSupportedCommands:v8];
    v13 = [v9 client];
    v14 = [v13 bundleIdentifier];
    [(MRNowPlayingState *)v10->_state setDisplayID:v14];

    v15 = [(MRNowPlayingState *)v10->_state protobufWithEncoding:a5];
    [(MRProtocolMessage *)v10 setUnderlyingCodableMessage:v15];
  }
  return v10;
}

- (MRSetDefaultSupportedCommandsMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRSetDefaultSupportedCommandsMessage;
  v7 = [(MRProtocolMessage *)&v11 initWithUnderlyingCodableMessage:v6 error:a4];
  if (v7)
  {
    id v8 = [[MRNowPlayingState alloc] initWithProtobuf:v6];
    state = v7->_state;
    v7->_state = v8;
  }
  return v7;
}

- (NSArray)supportedCommands
{
  return [(MRNowPlayingState *)self->_state supportedCommands];
}

- (NSString)bundleID
{
  return [(MRNowPlayingState *)self->_state displayID];
}

- (unint64_t)type
{
  return 72;
}

- (void).cxx_destruct
{
}

@end