@interface SXPresentableMessage
- (NSString)message;
- (NSString)recipient;
- (SXPresentableMessage)initWithRecipient:(id)a3 message:(id)a4;
@end

@implementation SXPresentableMessage

- (SXPresentableMessage)initWithRecipient:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXPresentableMessage;
  v8 = [(SXPresentableMessage *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    recipient = v8->_recipient;
    v8->_recipient = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    message = v8->_message;
    v8->_message = (NSString *)v11;
  }
  return v8;
}

- (NSString)recipient
{
  return self->_recipient;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end