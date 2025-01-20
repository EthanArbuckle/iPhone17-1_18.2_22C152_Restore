@interface MRPlaybackSessionResponseMessage
- (MRPlaybackSession)playbackSession;
- (MRPlaybackSessionResponseMessage)initWithPlaybackSession:(id)a3;
- (unint64_t)type;
@end

@implementation MRPlaybackSessionResponseMessage

- (MRPlaybackSessionResponseMessage)initWithPlaybackSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRPlaybackSessionResponseMessage;
  v5 = [(MRProtocolMessage *)&v9 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MRPlaybackSessionResponseMessageProtobuf);
    v7 = [v4 protobuf];
    [(_MRPlaybackSessionResponseMessageProtobuf *)v6 setPlaybackSession:v7];

    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v6];
  }

  return v5;
}

- (MRPlaybackSession)playbackSession
{
  v3 = [MRPlaybackSession alloc];
  id v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 playbackSession];
  v6 = [(MRPlaybackSession *)v3 initWithProtobuf:v5];

  return v6;
}

- (unint64_t)type
{
  return 71;
}

@end