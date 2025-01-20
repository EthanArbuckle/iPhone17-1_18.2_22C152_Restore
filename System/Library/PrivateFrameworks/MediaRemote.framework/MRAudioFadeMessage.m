@interface MRAudioFadeMessage
- (MRAudioFadeMessage)initWithPlayerPath:(id)a3 fadeType:(int64_t)a4;
- (MRPlayerPath)playerPath;
- (int64_t)fadeType;
- (unint64_t)type;
@end

@implementation MRAudioFadeMessage

- (MRAudioFadeMessage)initWithPlayerPath:(id)a3 fadeType:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRAudioFadeMessage;
  v7 = [(MRProtocolMessage *)&v11 init];
  if (v7)
  {
    v8 = objc_alloc_init(_MRAudioFadeMessageProtobuf);
    v9 = [v6 protobuf];
    [(_MRAudioFadeMessageProtobuf *)v8 setPlayerPath:v9];

    [(_MRAudioFadeMessageProtobuf *)v8 setFadeType:a4];
    [(MRProtocolMessage *)v7 setUnderlyingCodableMessage:v8];
  }
  return v7;
}

- (MRPlayerPath)playerPath
{
  v3 = [MRPlayerPath alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 playerPath];
  id v6 = [(MRPlayerPath *)v3 initWithProtobuf:v5];

  return v6;
}

- (int64_t)fadeType
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  int64_t v3 = (int)[v2 fadeType];

  return v3;
}

- (unint64_t)type
{
  return 106;
}

@end