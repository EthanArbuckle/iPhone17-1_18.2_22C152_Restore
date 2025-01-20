@interface SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion
- (BOOL)isInvalidated;
- (SBSHomeScreenService)service;
- (SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion)initWithObserver:(id)a3 service:(id)a4;
- (SBSHomeScreenServiceLayoutAvailableObserver)observer;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
- (void)setService:(id)a3;
@end

@implementation SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion

- (SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion)initWithObserver:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion;
  v8 = [(SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion *)&v11 init];
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
  if (![(SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion *)self isInvalidated])
  {
    v3 = SBLogCommon();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4) {
      NSLog(&cfstr_ShouldBeInvali.isa);
    }
  }
  [(SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion *)self invalidate];
  v5.receiver = self;
  v5.super_class = (Class)SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion;
  [(SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion *)&v5 dealloc];
}

- (void)invalidate
{
  if (![(SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion *)self isInvalidated])
  {
    id v3 = [(SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion *)self service];
    [v3 removeHomeScreenLayoutAvailabilityObservationAssertion:self];
    [(SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion *)self setService:0];
    [(SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion *)self setInvalidated:1];
  }
}

- (SBSHomeScreenServiceLayoutAvailableObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (SBSHomeScreenServiceLayoutAvailableObserver *)WeakRetained;
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