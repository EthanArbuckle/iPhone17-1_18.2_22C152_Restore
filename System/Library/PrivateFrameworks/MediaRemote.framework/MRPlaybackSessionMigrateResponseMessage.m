@interface MRPlaybackSessionMigrateResponseMessage
- (MRPlaybackSessionMigrateRequest)request;
- (MRPlaybackSessionMigrateResponseMessage)initWithRequest:(id)a3;
- (unint64_t)type;
@end

@implementation MRPlaybackSessionMigrateResponseMessage

- (MRPlaybackSessionMigrateResponseMessage)initWithRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRPlaybackSessionMigrateResponseMessage;
  v5 = [(MRProtocolMessage *)&v9 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MRPlaybackSessionMigrateResponseMessageProtobuf);
    v7 = [v4 protobuf];
    [(_MRPlaybackSessionMigrateResponseMessageProtobuf *)v6 setRequest:v7];

    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v6];
  }

  return v5;
}

- (MRPlaybackSessionMigrateRequest)request
{
  v3 = [MRPlaybackSessionMigrateRequest alloc];
  id v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 request];
  v6 = [(MRPlaybackSessionMigrateRequest *)v3 initWithProtobuf:v5];

  return v6;
}

- (unint64_t)type
{
  return 74;
}

@end