@interface SBHardwareButtonZStackClient
- (BSInvalidatable)hardwareButtonObserverAssertion;
- (SBFZStackParticipant)zStackParticipant;
- (SBFZStackResolver)zStackResolver;
- (SBHardwareButtonService)hardwareButtonService;
- (SBHardwareButtonZStackClient)initWithZStackResolver:(id)a3 hardwareButtonService:(id)a4;
- (void)_updateZStackParticipant;
- (void)dealloc;
- (void)setHardwareButtonObserverAssertion:(id)a3;
- (void)setZStackParticipant:(id)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBHardwareButtonZStackClient

- (void)_updateZStackParticipant
{
  v3 = [(SBHardwareButtonZStackClient *)self zStackParticipant];

  v4 = [(SBHardwareButtonZStackClient *)self hardwareButtonService];
  int v5 = [v4 hasConsumersForHomeButtonSinglePress];

  if (!v3 || (v5 & 1) != 0)
  {
    if (v3) {
      int v7 = 0;
    }
    else {
      int v7 = v5;
    }
    if (v7 == 1)
    {
      v8 = [(SBHardwareButtonZStackClient *)self zStackResolver];
      if (v8)
      {
        id v10 = v8;
        v9 = [v8 acquireParticipantWithIdentifier:5 delegate:self];
        [(SBHardwareButtonZStackClient *)self setZStackParticipant:v9];

        v8 = v10;
      }
    }
  }
  else
  {
    v6 = [(SBHardwareButtonZStackClient *)self zStackParticipant];
    [v6 invalidate];

    [(SBHardwareButtonZStackClient *)self setZStackParticipant:0];
  }
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (SBHardwareButtonService)hardwareButtonService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hardwareButtonService);
  return (SBHardwareButtonService *)WeakRetained;
}

- (SBHardwareButtonZStackClient)initWithZStackResolver:(id)a3 hardwareButtonService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBHardwareButtonZStackClient;
  v8 = [(SBHardwareButtonZStackClient *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_zStackResolver, v6);
    objc_storeWeak((id *)&v9->_hardwareButtonService, v7);
    [(SBHardwareButtonZStackClient *)v9 _updateZStackParticipant];
    uint64_t v10 = [v7 addObserver:v9];
    hardwareButtonObserverAssertion = v9->_hardwareButtonObserverAssertion;
    v9->_hardwareButtonObserverAssertion = (BSInvalidatable *)v10;
  }
  return v9;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_hardwareButtonObserverAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBHardwareButtonZStackClient;
  [(SBHardwareButtonZStackClient *)&v3 dealloc];
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v4 = a4;
  [v4 setActivationPolicyForParticipantsBelow:0];
  [v4 setHomeGestureConsumption:1];
}

- (SBFZStackResolver)zStackResolver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zStackResolver);
  return (SBFZStackResolver *)WeakRetained;
}

- (void)setZStackParticipant:(id)a3
{
}

- (BSInvalidatable)hardwareButtonObserverAssertion
{
  return self->_hardwareButtonObserverAssertion;
}

- (void)setHardwareButtonObserverAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareButtonObserverAssertion, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_destroyWeak((id *)&self->_hardwareButtonService);
  objc_destroyWeak((id *)&self->_zStackResolver);
}

@end