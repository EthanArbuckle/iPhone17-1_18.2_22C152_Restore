@interface NIServerVisionInternalSessionRequest
- (NIServerVisionInternalSessionRequest)initWithIdentifier:(id)a3 observer:(id)a4;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
@end

@implementation NIServerVisionInternalSessionRequest

- (NIServerVisionInternalSessionRequest)initWithIdentifier:(id)a3 observer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("-[NIServerVisionInternalSessionRequest initWithIdentifier:observer:]", "NIServerVisionInternalSession.mm", 222, "identifier");
  }
  v12.receiver = self;
  v12.super_class = (Class)NIServerVisionInternalSessionRequest;
  v9 = [(NIServerVisionInternalSessionRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeWeak((id *)&v10->_observer, v8);
  }

  return v10;
}

- (void)dealloc
{
  v3 = +[_InternalVisionSession sharedInstance];
  [v3 unregisterObserverWithIdentifier:self->_identifier];

  v4.receiver = self;
  v4.super_class = (Class)NIServerVisionInternalSessionRequest;
  [(NIServerVisionInternalSessionRequest *)&v4 dealloc];
}

- (void)activate
{
  id v4 = +[_InternalVisionSession sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [v4 registerObserver:WeakRetained withIdentifier:self->_identifier];
}

- (void)invalidate
{
  id v3 = +[_InternalVisionSession sharedInstance];
  [v3 unregisterObserverWithIdentifier:self->_identifier];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end