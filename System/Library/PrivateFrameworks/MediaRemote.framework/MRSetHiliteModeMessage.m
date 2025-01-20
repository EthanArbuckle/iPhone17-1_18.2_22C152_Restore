@interface MRSetHiliteModeMessage
- (BOOL)hiliteMode;
- (MRSetHiliteModeMessage)initWithHiliteMode:(BOOL)a3;
- (unint64_t)type;
@end

@implementation MRSetHiliteModeMessage

- (MRSetHiliteModeMessage)initWithHiliteMode:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRSetHiliteModeMessage;
  v4 = [(MRProtocolMessage *)&v7 init];
  if (v4)
  {
    v5 = objc_alloc_init(_MRSetHiliteModeMessageProtobuf);
    [(_MRSetHiliteModeMessageProtobuf *)v5 setHiliteMode:v3];
    [(MRProtocolMessage *)v4 setUnderlyingCodableMessage:v5];
  }
  return v4;
}

- (BOOL)hiliteMode
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  char v3 = [v2 hiliteMode];

  return v3;
}

- (unint64_t)type
{
  return 40;
}

@end