@interface SBDashBoardOrientationController
- (void)cancelOrientationUpdateDeferral;
- (void)deferOrientationUpdatesWithReason:(id)a3;
- (void)noteInterfaceOrientationChanged:(int64_t)a3 duration:(double)a4 logMessage:(id)a5;
@end

@implementation SBDashBoardOrientationController

- (void)deferOrientationUpdatesWithReason:(id)a3
{
  id v8 = a3;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRolePipelineManager") & 1) == 0)
  {
    v4 = (void *)SBApp;
    v5 = self->_deferOrientationUpdatesAssertion;
    v6 = [v4 deviceOrientationUpdateDeferralAssertionWithReason:v8];
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = v6;

    [(BSInvalidatable *)v5 invalidate];
  }
}

- (void)cancelOrientationUpdateDeferral
{
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRolePipelineManager") & 1) == 0)
  {
    [(BSInvalidatable *)self->_deferOrientationUpdatesAssertion invalidate];
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = 0;
  }
}

- (void)noteInterfaceOrientationChanged:(int64_t)a3 duration:(double)a4 logMessage:(id)a5
{
  id v7 = a5;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRolePipelineManager") & 1) == 0) {
    [(id)SBApp noteInterfaceOrientationChanged:a3 duration:v7 logMessage:a4];
  }
}

- (void).cxx_destruct
{
}

@end