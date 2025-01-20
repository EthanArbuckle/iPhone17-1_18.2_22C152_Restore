@interface MRAudioFadeResponseMessage
- (MRAudioFadeResponseMessage)initWithFadeDuration:(int64_t)a3 error:(id)a4;
- (int64_t)fadeDuration;
- (unint64_t)type;
@end

@implementation MRAudioFadeResponseMessage

- (MRAudioFadeResponseMessage)initWithFadeDuration:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MRAudioFadeResponseMessage;
  v7 = [(MRProtocolMessage *)&v10 init];
  if (v7)
  {
    v8 = objc_alloc_init(_MRAudioFadeResponseMessageProtobuf);
    [(_MRAudioFadeResponseMessageProtobuf *)v8 setFadeDuration:a3];
    [(MRProtocolMessage *)v7 setError:v6];
    [(MRProtocolMessage *)v7 setUnderlyingCodableMessage:v8];
  }
  return v7;
}

- (int64_t)fadeDuration
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  int64_t v3 = [v2 fadeDuration];

  return v3;
}

- (unint64_t)type
{
  return 107;
}

@end