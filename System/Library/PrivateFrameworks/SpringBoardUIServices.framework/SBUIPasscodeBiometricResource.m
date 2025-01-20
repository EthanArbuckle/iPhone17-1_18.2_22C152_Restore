@interface SBUIPasscodeBiometricResource
- (BOOL)hasBiometricAuthenticationCapabilityEnabled;
- (BOOL)hasEnrolledIdentities;
- (BOOL)hasMesaSupport;
- (BOOL)hasPearlSupport;
- (BOOL)hasPoseidonSupport;
- (BOOL)isFingerDetectEnabled;
- (BOOL)isFingerOn;
- (BOOL)isMatchingAllowed;
- (BOOL)isMatchingEnabled;
- (BOOL)isPearlDetectEnabled;
- (BOOL)isPeriocularMatchingEnabled;
- (SBUIPasscodeBiometricResource)initWithBiometricResource:(id)a3 overrideMatchingAssertionFactory:(id)a4;
- (id)acquireFaceDetectionWantedAssertionForReason:(id)a3;
- (id)acquireFingerDetectionWantedAssertionForReason:(id)a3;
- (id)acquireFingerDetectionWantedAssertionForReason:(id)a3 HIDEventsOnly:(BOOL)a4;
- (id)acquireMatchingAssertionWithMode:(unint64_t)a3 reason:(id)a4;
- (id)acquireSimulatedLockoutAssertionWithLockoutState:(unint64_t)a3 forReason:(id)a4;
- (unint64_t)biometricLockoutState;
- (void)addObserver:(id)a3;
- (void)refreshMatchMode;
- (void)removeObserver:(id)a3;
- (void)resumeMatchingAdvisory:(BOOL)a3;
- (void)resumeMatchingForAssertion:(id)a3 advisory:(BOOL)a4;
@end

@implementation SBUIPasscodeBiometricResource

- (SBUIPasscodeBiometricResource)initWithBiometricResource:(id)a3 overrideMatchingAssertionFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUIPasscodeBiometricResource;
  v9 = [(SBUIPasscodeBiometricResource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_biometricResource, a3);
    objc_storeStrong((id *)&v10->_overrideMatchingAssertionFactory, a4);
  }

  return v10;
}

- (BOOL)hasEnrolledIdentities
{
  return [(SBUIBiometricResource *)self->_biometricResource hasEnrolledIdentities];
}

- (BOOL)hasBiometricAuthenticationCapabilityEnabled
{
  return [(SBUIBiometricResource *)self->_biometricResource hasBiometricAuthenticationCapabilityEnabled];
}

- (BOOL)isFingerOn
{
  return [(SBUIBiometricResource *)self->_biometricResource isFingerOn];
}

- (BOOL)isFingerDetectEnabled
{
  return [(SBUIBiometricResource *)self->_biometricResource isFingerDetectEnabled];
}

- (BOOL)hasMesaSupport
{
  return [(SBUIBiometricResource *)self->_biometricResource hasMesaSupport];
}

- (BOOL)hasPoseidonSupport
{
  return [(SBUIBiometricResource *)self->_biometricResource hasPoseidonSupport];
}

- (BOOL)hasPearlSupport
{
  return [(SBUIBiometricResource *)self->_biometricResource hasPearlSupport];
}

- (BOOL)isPearlDetectEnabled
{
  return [(SBUIBiometricResource *)self->_biometricResource isPearlDetectEnabled];
}

- (BOOL)isMatchingAllowed
{
  return [(SBUIBiometricResource *)self->_biometricResource isMatchingAllowed];
}

- (BOOL)isMatchingEnabled
{
  return [(SBUIBiometricResource *)self->_biometricResource isMatchingEnabled];
}

- (unint64_t)biometricLockoutState
{
  return [(SBUIBiometricResource *)self->_biometricResource biometricLockoutState];
}

- (BOOL)isPeriocularMatchingEnabled
{
  return [(SBUIBiometricResource *)self->_biometricResource isPeriocularMatchingEnabled];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (id)acquireFingerDetectionWantedAssertionForReason:(id)a3
{
  return [(SBUIBiometricResource *)self->_biometricResource acquireFingerDetectionWantedAssertionForReason:a3];
}

- (id)acquireFingerDetectionWantedAssertionForReason:(id)a3 HIDEventsOnly:(BOOL)a4
{
  return [(SBUIBiometricResource *)self->_biometricResource acquireFingerDetectionWantedAssertionForReason:a3 HIDEventsOnly:a4];
}

- (id)acquireFaceDetectionWantedAssertionForReason:(id)a3
{
  return [(SBUIBiometricResource *)self->_biometricResource acquireFaceDetectionWantedAssertionForReason:a3];
}

- (id)acquireMatchingAssertionWithMode:(unint64_t)a3 reason:(id)a4
{
  overrideMatchingAssertionFactory = self->_overrideMatchingAssertionFactory;
  if (!overrideMatchingAssertionFactory) {
    overrideMatchingAssertionFactory = self->_biometricResource;
  }
  v6 = [overrideMatchingAssertionFactory acquireMatchingAssertionWithMode:a3 reason:a4];
  return v6;
}

- (id)acquireSimulatedLockoutAssertionWithLockoutState:(unint64_t)a3 forReason:(id)a4
{
  return [(SBUIBiometricResource *)self->_biometricResource acquireSimulatedLockoutAssertionWithLockoutState:a3 forReason:a4];
}

- (void)refreshMatchMode
{
}

- (void)resumeMatchingForAssertion:(id)a3 advisory:(BOOL)a4
{
}

- (void)resumeMatchingAdvisory:(BOOL)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMatchingAssertionFactory, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
}

@end