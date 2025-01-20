@interface SBSHomeScreenServiceInstalledWebClipsObservationAssertion
- (BOOL)isInvalidated;
- (SBSHomeScreenService)service;
- (SBSHomeScreenServiceInstalledWebClipsObservationAssertion)initWithObserver:(id)a3 service:(id)a4;
- (SBSHomeScreenServiceInstalledWebClipsObserver)observer;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
- (void)setService:(id)a3;
@end

@implementation SBSHomeScreenServiceInstalledWebClipsObservationAssertion

- (SBSHomeScreenServiceInstalledWebClipsObservationAssertion)initWithObserver:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSHomeScreenServiceInstalledWebClipsObservationAssertion;
  v8 = [(SBSHomeScreenServiceInstalledWebClipsObservationAssertion *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeWeak((id *)&v9->_service, v7);
  }

  return v9;
}

- (void)dealloc
{
  if (![(SBSHomeScreenServiceInstalledWebClipsObservationAssertion *)self isInvalidated])
  {
    v3 = SBLogCommon();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4) {
      NSLog(&cfstr_ShouldBeInvali.isa);
    }
  }
  [(SBSHomeScreenServiceInstalledWebClipsObservationAssertion *)self invalidate];
  v5.receiver = self;
  v5.super_class = (Class)SBSHomeScreenServiceInstalledWebClipsObservationAssertion;
  [(SBSHomeScreenServiceInstalledWebClipsObservationAssertion *)&v5 dealloc];
}

- (void)invalidate
{
  if (![(SBSHomeScreenServiceInstalledWebClipsObservationAssertion *)self isInvalidated])
  {
    id v3 = [(SBSHomeScreenServiceInstalledWebClipsObservationAssertion *)self service];
    [v3 removeInstalledWebClipsObservationAssertion:self];
    [(SBSHomeScreenServiceInstalledWebClipsObservationAssertion *)self setService:0];
    [(SBSHomeScreenServiceInstalledWebClipsObservationAssertion *)self setInvalidated:1];
  }
}

- (SBSHomeScreenServiceInstalledWebClipsObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (SBSHomeScreenServiceInstalledWebClipsObserver *)WeakRetained;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (SBSHomeScreenService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (SBSHomeScreenService *)WeakRetained;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_observer);
}

@end