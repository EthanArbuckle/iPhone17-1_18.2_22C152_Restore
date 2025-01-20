@interface MRTextInputMessage
- (MRTextInputMessage)initWithActionType:(unint64_t)a3 text:(id)a4;
- (NSString)text;
- (unint64_t)actionType;
- (unint64_t)type;
@end

@implementation MRTextInputMessage

- (MRTextInputMessage)initWithActionType:(unint64_t)a3 text:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MRTextInputMessage;
  v7 = [(MRProtocolMessage *)&v10 init];
  if (v7)
  {
    v8 = objc_alloc_init(_MRTextInputMessageProtobuf);
    [(_MRTextInputMessageProtobuf *)v8 setText:v6];
    [(_MRTextInputMessageProtobuf *)v8 setActionType:a3];
    [(MRProtocolMessage *)v7 setUnderlyingCodableMessage:v8];
  }
  return v7;
}

- (unint64_t)actionType
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unint64_t v3 = (int)[v2 actionType];

  return v3;
}

- (NSString)text
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (unint64_t)type
{
  return 25;
}

@end