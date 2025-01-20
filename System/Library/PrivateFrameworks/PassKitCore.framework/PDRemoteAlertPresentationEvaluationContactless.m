@interface PDRemoteAlertPresentationEvaluationContactless
- (PDRemoteAlertPresentationEvaluationContactless)init;
@end

@implementation PDRemoteAlertPresentationEvaluationContactless

- (PDRemoteAlertPresentationEvaluationContactless)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDRemoteAlertPresentationEvaluationContactless;
  result = [(PDRemoteAlertPresentationEvaluationContactless *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_informativeActiveAssertion, 0);
  objc_storeStrong((id *)&self->_informativeForegroundAssertion, 0);
  objc_storeStrong((id *)&self->_unlockSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end