@interface OSChargingPredictorServiceXPCProxy
- (NSObject)target;
- (OSChargingPredictorServiceXPCProxy)initWithObserver:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)setTarget:(id)a3;
@end

@implementation OSChargingPredictorServiceXPCProxy

- (OSChargingPredictorServiceXPCProxy)initWithObserver:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OSChargingPredictorServiceXPCProxy;
  id v3 = a3;
  v4 = [(OSChargingPredictorServiceXPCProxy *)&v6 init];
  objc_storeWeak((id *)&v4->_target, v3);

  return v4;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return WeakRetained;
}

- (NSObject)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end