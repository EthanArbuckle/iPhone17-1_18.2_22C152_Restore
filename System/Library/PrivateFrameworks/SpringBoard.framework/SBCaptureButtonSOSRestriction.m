@interface SBCaptureButtonSOSRestriction
- (SBCaptureButtonSOSRestriction)initWithCoordinator:(id)a3;
- (void)SOSEventHandlerStateDidChange:(id)a3;
- (void)invalidate;
@end

@implementation SBCaptureButtonSOSRestriction

- (SBCaptureButtonSOSRestriction)initWithCoordinator:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBCaptureButtonSOSRestriction;
  v3 = [(SBCaptureButtonInternalRestrictionGlue *)&v9 initWithCoordinator:a3];
  if (v3)
  {
    uint64_t v4 = +[SBSOSEventHandler sharedInstance];
    SOSEventHandler = v3->_SOSEventHandler;
    v3->_SOSEventHandler = (SBSOSEventHandler *)v4;

    uint64_t v6 = [(SBSOSEventHandler *)v3->_SOSEventHandler addObserver:v3];
    SOSMonitoringAssertion = v3->_SOSMonitoringAssertion;
    v3->_SOSMonitoringAssertion = (BSInvalidatable *)v6;
  }
  return v3;
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)SBCaptureButtonSOSRestriction;
  [(SBCaptureButtonInternalRestrictionGlue *)&v4 invalidate];
  [(BSInvalidatable *)self->_SOSMonitoringAssertion invalidate];
  SOSMonitoringAssertion = self->_SOSMonitoringAssertion;
  self->_SOSMonitoringAssertion = 0;
}

- (void)SOSEventHandlerStateDidChange:(id)a3
{
  if ([a3 isSOSActive])
  {
    [(SBCaptureButtonInternalRestrictionGlue *)self acquireRestriction:@"SOSIsActive"];
  }
  else
  {
    [(SBCaptureButtonInternalRestrictionGlue *)self relinquishRestriction];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SOSMonitoringAssertion, 0);
  objc_storeStrong((id *)&self->_SOSEventHandler, 0);
}

@end