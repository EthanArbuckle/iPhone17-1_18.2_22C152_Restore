@interface _SBPendingMesaUnlockBehaviorUnlockRequest
- (SBAuthenticationFeedback)feedback;
- (SBBiometricUnlockBehavior)behavior;
- (_SBPendingMesaUnlockBehaviorUnlockRequest)initWithBehavior:(id)a3 request:(id)a4 feedback:(id)a5;
- (id)request;
@end

@implementation _SBPendingMesaUnlockBehaviorUnlockRequest

- (_SBPendingMesaUnlockBehaviorUnlockRequest)initWithBehavior:(id)a3 request:(id)a4 feedback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_SBPendingMesaUnlockBehaviorUnlockRequest;
  v12 = [(_SBPendingMesaUnlockBehaviorUnlockRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_behavior, a3);
    objc_storeStrong(&v13->_request, a4);
    objc_storeStrong((id *)&v13->_feedback, a5);
  }

  return v13;
}

- (SBBiometricUnlockBehavior)behavior
{
  return self->_behavior;
}

- (id)request
{
  return self->_request;
}

- (SBAuthenticationFeedback)feedback
{
  return self->_feedback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong(&self->_request, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
}

@end