@interface MRDXPCUIController
- (BOOL)hasGroupSessionLowPowerAssertion;
- (BOOL)hasGroupSessionNearbyAssertion;
- (BOOL)hasLockScreenControlsAssertion;
- (BOOL)hasQuickControlsAssertion;
- (BOOL)hasRouteRecommendationAssertion;
- (BOOL)hasScreenMirroringQuickControlsAssertion;
- (BOOL)hasUIAssertions;
- (MRDXPCUIController)initWithDelegate:(id)a3;
- (MROSTransaction)transaction;
- (MRUIServerXPCProtocol)server;
- (NSXPCConnection)xpcConnection;
- (id)acquireQuickControlsAssertion;
- (id)delegate;
- (id)synchronousServer;
- (os_unfair_lock_s)lock;
- (void)_updateTransaction;
- (void)acquireGroupSessionLowPowerPlatterAssertion;
- (void)acquireGroupSessionNearbyAssertionForSession:(id)a3;
- (void)acquireLockScreenControlsAssertion;
- (void)acquireRouteRecommendationAssertionForIdentifiers:(id)a3;
- (void)acquireScreenMirroringQuickControlsAssertion;
- (void)dealloc;
- (void)nearbyGroupSessionDismissed:(id)a3;
- (void)releaseGroupSessionLowPowerPlatterAssertion;
- (void)releaseGroupSessionNearbyAssertion;
- (void)releaseLockScreenControlsAssertion;
- (void)releaseQuickControlsAssertion;
- (void)releaseRouteRecommendationAssertion;
- (void)releaseScreenMirroringQuickControlsAssertion;
- (void)routeRecommendationDismissed;
- (void)setHasGroupSessionLowPowerAssertion:(BOOL)a3;
- (void)setHasGroupSessionNearbyAssertion:(BOOL)a3;
- (void)setHasLockScreenControlsAssertion:(BOOL)a3;
- (void)setHasQuickControlsAssertion:(BOOL)a3;
- (void)setHasRouteRecommendationAssertion:(BOOL)a3;
- (void)setHasScreenMirroringQuickControlsAssertion:(BOOL)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MRDXPCUIController

- (MRDXPCUIController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRDXPCUIController;
  v5 = [(MRDXPCUIController *)&v8 init];
  if (v5)
  {
    v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRUIController][D] <%p> Initializing XPC controller.", buf, 0xCu);
    }

    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak(&v5->_delegate, v4);
  }

  return v5;
}

- (void)dealloc
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRUIController][D] <%p> Dealloc.", buf, 0xCu);
  }

  id v4 = [(MRDXPCUIController *)self server];
  if ([(MRDXPCUIController *)self hasLockScreenControlsAssertion])
  {
    v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100331F04();
    }

    [v4 releaseLockScreenControlsAssertionWithReply:&stru_10041F8D8];
  }
  if ([(MRDXPCUIController *)self hasQuickControlsAssertion])
  {
    v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100331E9C();
    }

    [v4 releaseQuickControlsAssertionWithReply:&stru_10041F8F8];
  }
  if ([(MRDXPCUIController *)self hasScreenMirroringQuickControlsAssertion])
  {
    v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100331E34();
    }

    [v4 releaseScreenMirroringQuickControlsAssertionWithReply:&stru_10041F918];
  }
  if ([(MRDXPCUIController *)self hasRouteRecommendationAssertion])
  {
    objc_super v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100331DCC();
    }

    [v4 releaseRouteRecommendationAssertionWithReply:&stru_10041F938];
  }
  if ([(MRDXPCUIController *)self hasGroupSessionLowPowerAssertion])
  {
    v9 = _MRLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100331D64();
    }

    [v4 releaseGroupSessionLowPowerPlatterAssertionWithReply:&stru_10041F958];
  }
  v10 = [(MRDXPCUIController *)self xpcConnection];
  [v10 invalidate];

  v11.receiver = self;
  v11.super_class = (Class)MRDXPCUIController;
  [(MRDXPCUIController *)&v11 dealloc];
}

- (void)_updateTransaction
{
  if ([(MRDXPCUIController *)self hasUIAssertions])
  {
    id v3 = objc_alloc((Class)MROSTransaction);
    id v4 = +[NSString stringWithFormat:@"com.apple.mediaremoted.UIController.%p", self];
    id v5 = [v3 initWithName:v4];
    [(MRDXPCUIController *)self setTransaction:v5];

    id v6 = [(MRDXPCUIController *)self transaction];
    MRRegisterTransaction();
  }
  else
  {
    [(MRDXPCUIController *)self setTransaction:0];
  }
}

- (BOOL)hasUIAssertions
{
  if ([(MRDXPCUIController *)self hasQuickControlsAssertion]
    || [(MRDXPCUIController *)self hasScreenMirroringQuickControlsAssertion]
    || [(MRDXPCUIController *)self hasLockScreenControlsAssertion])
  {
    return 1;
  }

  return [(MRDXPCUIController *)self hasRouteRecommendationAssertion];
}

- (NSXPCConnection)xpcConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    id v5 = +[MRDUIServer sharedServer];
    id v6 = [v5 listener];
    v7 = [v6 endpoint];

    objc_super v8 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v7];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    objc_super v11 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v12 = MSVPropertyListDataClasses();
    [v11 unionSet:v12];

    v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MRUIClientXPCProtocol];
    v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MRUIServerXPCProtocol];
    [v14 setClasses:v11 forSelector:"acquireGroupSessionNearbyAssertionForSession:withReply:" argumentIndex:0 ofReply:0];
    [v13 setClasses:v11 forSelector:"nearbyGroupSessionDismissed:" argumentIndex:0 ofReply:0];
    v15 = +[MSVWeakProxy proxyWithObject:self protocol:&OBJC_PROTOCOL___MRUIClientXPCProtocol];
    [(NSXPCConnection *)v8 setExportedObject:v15];

    [(NSXPCConnection *)v8 setExportedInterface:v13];
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v14];
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100171418;
    v21[3] = &unk_1004171D0;
    objc_copyWeak(&v22, &location);
    [(NSXPCConnection *)v8 setInterruptionHandler:v21];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001714E4;
    v19[3] = &unk_1004171D0;
    objc_copyWeak(&v20, &location);
    [(NSXPCConnection *)v8 setInvalidationHandler:v19];
    [(NSXPCConnection *)v8 resume];
    v16 = self->_xpcConnection;
    self->_xpcConnection = v8;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

    xpcConnection = self->_xpcConnection;
  }
  v17 = xpcConnection;
  os_unfair_lock_unlock(p_lock);

  return v17;
}

- (MRUIServerXPCProtocol)server
{
  id v3 = [(MRDXPCUIController *)self xpcConnection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100171660;
  v6[3] = &unk_100415F80;
  v6[4] = self;
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  return (MRUIServerXPCProtocol *)v4;
}

- (id)synchronousServer
{
  id v3 = [(MRDXPCUIController *)self xpcConnection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001717D0;
  v6[3] = &unk_100415F80;
  v6[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v6];

  return v4;
}

- (void)acquireLockScreenControlsAssertion
{
  id v3 = +[MRSharedSettings currentSettings];
  unsigned __int8 v4 = [v3 supportManyRecommendationsPlatters];

  if ((v4 & 1) == 0 && [(MRDXPCUIController *)self hasRouteRecommendationAssertion]) {
    [(MRDXPCUIController *)self releaseRouteRecommendationAssertion];
  }
  [(MRDXPCUIController *)self setHasLockScreenControlsAssertion:1];
  id v5 = [(MRDXPCUIController *)self server];
  [v5 acquireLockScreenControlsAssertionWithReply:&stru_10041F978];

  [(MRDXPCUIController *)self _updateTransaction];
}

- (void)releaseLockScreenControlsAssertion
{
  [(MRDXPCUIController *)self setHasLockScreenControlsAssertion:0];
  id v3 = [(MRDXPCUIController *)self server];
  [v3 releaseLockScreenControlsAssertionWithReply:&stru_10041F998];

  [(MRDXPCUIController *)self _updateTransaction];
}

- (void)routeRecommendationDismissed
{
  id v2 = [(MRDXPCUIController *)self delegate];
  [v2 routeRecommendationDismissed];
}

- (id)acquireQuickControlsAssertion
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100171B04;
  objc_super v11 = sub_100171B14;
  id v12 = 0;
  id v3 = [(MRDXPCUIController *)self synchronousServer];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100171B1C;
  v6[3] = &unk_10041F9C0;
  v6[4] = &v7;
  [v3 acquireQuickControlsAssertionWithReply:v6];

  [(MRDXPCUIController *)self _updateTransaction];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)releaseQuickControlsAssertion
{
  [(MRDXPCUIController *)self setHasQuickControlsAssertion:0];
  id v3 = [(MRDXPCUIController *)self server];
  [v3 releaseQuickControlsAssertionWithReply:&stru_10041F9E0];

  [(MRDXPCUIController *)self _updateTransaction];
}

- (void)acquireScreenMirroringQuickControlsAssertion
{
  [(MRDXPCUIController *)self setHasScreenMirroringQuickControlsAssertion:1];
  id v3 = [(MRDXPCUIController *)self server];
  [v3 acquireScreenMirroringQuickControlsAssertionWithReply:&stru_10041FA00];

  [(MRDXPCUIController *)self _updateTransaction];
}

- (void)releaseScreenMirroringQuickControlsAssertion
{
  [(MRDXPCUIController *)self setHasScreenMirroringQuickControlsAssertion:0];
  id v3 = [(MRDXPCUIController *)self server];
  [v3 releaseScreenMirroringQuickControlsAssertionWithReply:&stru_10041FA20];

  [(MRDXPCUIController *)self _updateTransaction];
}

- (void)acquireGroupSessionNearbyAssertionForSession:(id)a3
{
  id v4 = a3;
  [(MRDXPCUIController *)self setHasGroupSessionNearbyAssertion:1];
  id v5 = [(MRDXPCUIController *)self server];
  [v5 acquireGroupSessionNearbyAssertionForSession:v4 withReply:&stru_10041FA40];

  [(MRDXPCUIController *)self _updateTransaction];
}

- (void)releaseGroupSessionNearbyAssertion
{
  [(MRDXPCUIController *)self setHasGroupSessionNearbyAssertion:0];
  id v3 = [(MRDXPCUIController *)self server];
  [v3 releaseGroupSessionNearbyAssertionWithReply:&stru_10041FA60];

  [(MRDXPCUIController *)self _updateTransaction];
}

- (void)acquireGroupSessionLowPowerPlatterAssertion
{
  [(MRDXPCUIController *)self setHasGroupSessionLowPowerAssertion:1];
  id v3 = [(MRDXPCUIController *)self server];
  [v3 acquireGroupSessionLowPowerPlatterAssertionWithReply:&stru_10041FA80];

  [(MRDXPCUIController *)self _updateTransaction];
}

- (void)releaseGroupSessionLowPowerPlatterAssertion
{
  [(MRDXPCUIController *)self setHasGroupSessionLowPowerAssertion:0];
  id v3 = [(MRDXPCUIController *)self server];
  [v3 releaseGroupSessionLowPowerPlatterAssertionWithReply:&stru_10041FAA0];

  [(MRDXPCUIController *)self _updateTransaction];
}

- (void)nearbyGroupSessionDismissed:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDXPCUIController *)self delegate];
  [v5 nearbyGroupSessionDismissed:v4];
}

- (void)acquireRouteRecommendationAssertionForIdentifiers:(id)a3
{
  id v7 = a3;
  id v4 = +[MRSharedSettings currentSettings];
  unsigned __int8 v5 = [v4 supportManyRecommendationsPlatters];

  if ((v5 & 1) != 0 || ![(MRDXPCUIController *)self hasLockScreenControlsAssertion])
  {
    [(MRDXPCUIController *)self setHasRouteRecommendationAssertion:1];
    id v6 = [(MRDXPCUIController *)self server];
    [v6 acquireRouteRecommendationAssertionForIdentifiers:v7 withReply:&stru_10041FAC0];

    [(MRDXPCUIController *)self _updateTransaction];
  }
}

- (void)releaseRouteRecommendationAssertion
{
  [(MRDXPCUIController *)self setHasRouteRecommendationAssertion:0];
  id v3 = [(MRDXPCUIController *)self server];
  [v3 releaseRouteRecommendationAssertionWithReply:&stru_10041FAE0];

  [(MRDXPCUIController *)self _updateTransaction];
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (MROSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (BOOL)hasLockScreenControlsAssertion
{
  return self->_hasLockScreenControlsAssertion;
}

- (void)setHasLockScreenControlsAssertion:(BOOL)a3
{
  self->_hasLockScreenControlsAssertion = a3;
}

- (BOOL)hasQuickControlsAssertion
{
  return self->_hasQuickControlsAssertion;
}

- (void)setHasQuickControlsAssertion:(BOOL)a3
{
  self->_hasQuickControlsAssertion = a3;
}

- (BOOL)hasScreenMirroringQuickControlsAssertion
{
  return self->_hasScreenMirroringQuickControlsAssertion;
}

- (void)setHasScreenMirroringQuickControlsAssertion:(BOOL)a3
{
  self->_hasScreenMirroringQuickControlsAssertion = a3;
}

- (BOOL)hasGroupSessionNearbyAssertion
{
  return self->_hasGroupSessionNearbyAssertion;
}

- (void)setHasGroupSessionNearbyAssertion:(BOOL)a3
{
  self->_hasGroupSessionNearbyAssertion = a3;
}

- (BOOL)hasGroupSessionLowPowerAssertion
{
  return self->_hasGroupSessionLowPowerAssertion;
}

- (void)setHasGroupSessionLowPowerAssertion:(BOOL)a3
{
  self->_hasGroupSessionLowPowerAssertion = a3;
}

- (BOOL)hasRouteRecommendationAssertion
{
  return self->_hasRouteRecommendationAssertion;
}

- (void)setHasRouteRecommendationAssertion:(BOOL)a3
{
  self->_hasRouteRecommendationAssertion = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end