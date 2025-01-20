@interface CSDVoIPApplicationMessageContext
- (BKSProcessAssertion)assertion;
- (BOOL)applicationShouldPostIncomingCall;
- (CSDVoIPApplicationMessage)message;
- (CSDVoIPApplicationMessageContext)initWithMessage:(id)a3 assertion:(id)a4 applicationShouldPostIncomingCall:(BOOL)a5;
@end

@implementation CSDVoIPApplicationMessageContext

- (CSDVoIPApplicationMessageContext)initWithMessage:(id)a3 assertion:(id)a4 applicationShouldPostIncomingCall:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSDVoIPApplicationMessageContext;
  v11 = [(CSDVoIPApplicationMessageContext *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_message, a3);
    objc_storeStrong((id *)&v12->_assertion, a4);
    v12->_applicationShouldPostIncomingCall = a5;
  }

  return v12;
}

- (BOOL)applicationShouldPostIncomingCall
{
  return self->_applicationShouldPostIncomingCall;
}

- (BKSProcessAssertion)assertion
{
  return self->_assertion;
}

- (CSDVoIPApplicationMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_assertion, 0);
}

@end