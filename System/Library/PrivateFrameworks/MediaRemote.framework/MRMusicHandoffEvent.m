@interface MRMusicHandoffEvent
- (MRMusicHandoffEvent)initWithProtobuf:(id)a3;
- (MRMusicHandoffEvent)initWithProtobufData:(id)a3;
- (MRMusicHandoffEvent)initWithType:(int64_t)a3;
- (NSData)protobufData;
- (NSString)sessionIdentifier;
- (_MRMusicHandoffEventProtobuf)protobuf;
- (int64_t)type;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation MRMusicHandoffEvent

- (MRMusicHandoffEvent)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRMusicHandoffEvent;
  result = [(MRMusicHandoffEvent *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (MRMusicHandoffEvent)initWithProtobufData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    objc_super v5 = [[_MRMusicHandoffEventProtobuf alloc] initWithData:v4];

    self = [(MRMusicHandoffEvent *)self initWithProtobuf:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRMusicHandoffEvent)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRMusicHandoffEvent;
  objc_super v5 = [(MRMusicHandoffEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 sessionIdentifier];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    v5->_type = (int)[v4 type];
  }

  return v5;
}

- (NSData)protobufData
{
  v2 = [(MRMusicHandoffEvent *)self protobuf];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (_MRMusicHandoffEventProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRMusicHandoffEventProtobuf);
  [(_MRMusicHandoffEventProtobuf *)v3 setType:[(MRMusicHandoffEvent *)self type]];
  id v4 = [(MRMusicHandoffEvent *)self sessionIdentifier];
  [(_MRMusicHandoffEventProtobuf *)v3 setSessionIdentifier:v4];

  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end