@interface SXPresentableMail
- (NSString)recipient;
- (NSString)subject;
- (SXPresentableMail)initWithRecipient:(id)a3 subject:(id)a4;
@end

@implementation SXPresentableMail

- (SXPresentableMail)initWithRecipient:(id)a3 subject:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXPresentableMail;
  v9 = [(SXPresentableMail *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recipient, a3);
    objc_storeStrong((id *)&v10->_subject, a4);
  }

  return v10;
}

- (NSString)recipient
{
  return self->_recipient;
}

- (NSString)subject
{
  return self->_subject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end