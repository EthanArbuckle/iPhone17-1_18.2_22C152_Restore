@interface PLDuetServiceImpl
- (PLService)duetService;
- (PLXPCListenerOperatorComposition)eventListener;
- (PLXPCResponderOperatorComposition)energyResponder;
- (void)setDuetService:(id)a3;
- (void)setEnergyResponder:(id)a3;
- (void)setEventListener:(id)a3;
- (void)stopService;
@end

@implementation PLDuetServiceImpl

- (void)stopService
{
}

- (PLService)duetService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_duetService);
  return (PLService *)WeakRetained;
}

- (void)setDuetService:(id)a3
{
}

- (PLXPCListenerOperatorComposition)eventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEventListener:(id)a3
{
}

- (PLXPCResponderOperatorComposition)energyResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnergyResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyResponder, 0);
  objc_storeStrong((id *)&self->_eventListener, 0);
  objc_destroyWeak((id *)&self->_duetService);
}

@end