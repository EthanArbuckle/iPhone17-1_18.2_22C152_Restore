@interface TVRDClientProcessConnection
- (NSMutableSet)mutableIdentifiers;
- (NSSet)deviceIdentifiers;
- (NSString)description;
- (NSXPCConnection)xpcConnection;
- (SBSRemoteAlertHandle)alertHandle;
- (TVRCXPCResponseProtocol)remoteObjectProxy;
- (TVRDClientProcessConnection)initWithXPCConnection:(id)a3 delegate:(id)a4;
- (TVRDClientProcessConnectionDelegate)delegate;
- (id)_processNameForPid:(int)a3;
- (void)_invalidateRemoteAlertHandle;
- (void)_removeAllIdentifiers;
- (void)_removeIdentifier:(id)a3;
- (void)addItemForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5;
- (void)beginDeviceQueryWithResponse:(id)a3;
- (void)cancelAuthChallengeForDeviceWithIdentifier:(id)a3;
- (void)closeConnectionToDeviceWithIdentifier:(id)a3 withType:(unint64_t)a4;
- (void)dealloc;
- (void)enableFindingSession:(BOOL)a3 forDeviceIdentifier:(id)a4;
- (void)enableTVRemoteOnLockscreen:(BOOL)a3 forDeviceIdentifier:(id)a4;
- (void)endDeviceQuery;
- (void)fetchActiveMREndpointUIDWithCompletion:(id)a3;
- (void)fetchUpNextInfoForDeviceWithIdentifier:(id)a3 paginationToken:(id)a4 completion:(id)a5;
- (void)fulfillAuthChallengeForDeviceWithIdentifier:(id)a3 withLocallyEnteredCode:(id)a4;
- (void)getConnectionStatusToDeviceWithIdentifier:(id)a3 response:(id)a4;
- (void)getSuggestedDevicesWithResponse:(id)a3;
- (void)launchViewServiceForDeviceWithIdentifier:(id)a3;
- (void)markAsWatchedForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5;
- (void)openConnectionToDeviceWithIdentifier:(id)a3 connectionContext:(int64_t)a4;
- (void)playItem:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)removeInterestForDeviceWithIdentifier:(id)a3;
- (void)removeItemForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5;
- (void)sendButtonEvent:(id)a3 toDeviceWithIdentifier:(id)a4;
- (void)sendEvent:(id)a3 toDeviceWithIdentifier:(id)a4 options:(id)a5 response:(id)a6;
- (void)sendGameControllerEvent:(id)a3 toDeviceWithIdentifier:(id)a4;
- (void)sendInputReturnKeyToDeviceWithIdentifier:(id)a3;
- (void)sendInputText:(id)a3 toDeviceWithIdentifier:(id)a4;
- (void)sendInputTextPayload:(id)a3 toDeviceWithIdentifier:(id)a4;
- (void)sendTouchEvent:(id)a3 toDeviceWithIdentifier:(id)a4;
- (void)setAlertHandle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMutableIdentifiers:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation TVRDClientProcessConnection

- (TVRDClientProcessConnection)initWithXPCConnection:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)TVRDClientProcessConnection;
  v9 = [(TVRDClientProcessConnection *)&v30 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mutableIdentifiers = v10->_mutableIdentifiers;
    v10->_mutableIdentifiers = v11;

    objc_storeStrong((id *)&v10->_xpcConnection, a3);
    xpcConnection = v10->_xpcConnection;
    v14 = +[TVRCXPCProtocolManager requestInterface];
    [(NSXPCConnection *)xpcConnection setExportedInterface:v14];

    [(NSXPCConnection *)v10->_xpcConnection setExportedObject:v10];
    v15 = v10->_xpcConnection;
    v16 = +[TVRCXPCProtocolManager responseInterface];
    [(NSXPCConnection *)v15 setRemoteObjectInterface:v16];

    objc_initWeak(&location, v10);
    v17 = v10->_xpcConnection;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke;
    v27[3] = &unk_10001C5D8;
    objc_copyWeak(&v28, &location);
    [(NSXPCConnection *)v17 setInterruptionHandler:v27];
    v18 = v10->_xpcConnection;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke_2;
    v25[3] = &unk_10001C5D8;
    objc_copyWeak(&v26, &location);
    [(NSXPCConnection *)v18 setInvalidationHandler:v25];
    uint64_t v19 = [(NSXPCConnection *)v10->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_1];
    remoteObjectProxy = v10->_remoteObjectProxy;
    v10->_remoteObjectProxy = (TVRCXPCResponseProtocol *)v19;

    if (+[TVRCFeatures isPersistOnLockScreenEnabled])
    {
      v21 = _TVRDXPCLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Persist on Lock Screen Internal Setting is turned on", v24, 2u);
      }

      v22 = +[TVRDAssertionManager sharedInstance];
      [v22 acquireLockScreenAssertion];
    }
    [(NSXPCConnection *)v10->_xpcConnection resume];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _TVRDXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v4, 2u);
  }

  [WeakRetained _removeAllIdentifiers];
  id v3 = objc_loadWeakRetained(WeakRetained + 1);
  [v3 clientConnectionSeveredConnection:WeakRetained];
}

void __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _TVRDXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated", v4, 2u);
  }

  [WeakRetained _removeAllIdentifiers];
  id v3 = objc_loadWeakRetained(WeakRetained + 1);
  [v3 clientConnectionSeveredConnection:WeakRetained];
}

void __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke_3(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke_3_cold_1((uint64_t)v2, v3);
  }
}

- (void)dealloc
{
  id v3 = +[TVRDAssertionManager sharedInstance];
  [v3 releaseLockScreenAssertion];

  v4.receiver = self;
  v4.super_class = (Class)TVRDClientProcessConnection;
  [(TVRDClientProcessConnection *)&v4 dealloc];
}

- (NSString)description
{
  id v3 = +[BSDescriptionBuilder builderWithObject:self];
  objc_super v4 = [(TVRDClientProcessConnection *)self xpcConnection];
  v5 = -[TVRDClientProcessConnection _processNameForPid:](self, "_processNameForPid:", [v4 processIdentifier]);
  v6 = [(TVRDClientProcessConnection *)self xpcConnection];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@:%d", v5, [v6 processIdentifier]);

  [v3 appendString:v7 withName:@"process"];
  id v8 = [v3 build];

  return (NSString *)v8;
}

- (id)_processNameForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (proc_name(a3, buffer, 0x100u))
  {
    objc_super v4 = +[NSString stringWithUTF8String:buffer];
  }
  else
  {
    v5 = +[NSNumber numberWithInt:v3];
    objc_super v4 = [v5 stringValue];
  }

  return v4;
}

- (NSSet)deviceIdentifiers
{
  return +[NSSet setWithSet:self->_mutableIdentifiers];
}

- (void)openConnectionToDeviceWithIdentifier:(id)a3 connectionContext:(int64_t)a4
{
  v6 = (TVRDClientProcessConnection *)a3;
  id v7 = _TVRDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Open connection to device %{public}@", (uint8_t *)&v12, 0xCu);
  }

  if ([(NSMutableSet *)self->_mutableIdentifiers containsObject:v6])
  {
    id v8 = _TVRDXPCLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(TVRDClientProcessConnection *)self deviceIdentifiers];
      int v12 = 138412802;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v6;
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ is already interested in identifier %{public}@. All interested IDs - %@", (uint8_t *)&v12, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained clientConnection:self reiteratedInterestInDeviceIdentifier:v6 connectionContext:a4];
  }
  else
  {
    [(NSMutableSet *)self->_mutableIdentifiers addObject:v6];
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 clientConnection:self addedInterestedDeviceIdentifier:v6 connectionContext:a4];

    notify_post("com.apple.TVRemoteCore.connectionRequested");
  }
}

- (void)closeConnectionToDeviceWithIdentifier:(id)a3 withType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = _TVRDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = v6;
    __int16 v20 = 2048;
    unint64_t v21 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Close connection to device %{public}@ with type %ld", buf, 0x16u);
  }

  if ([(NSMutableSet *)self->_mutableIdentifiers containsObject:v6])
  {
    if (a4 == 1
      && (+[TVRCFeatures isWakeToRemoteOnLockScreenDisabled] & 1) == 0)
    {
      __int16 v14 = _TVRDXPCLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Disconnect type for device %@ is unknown. Acquiring lock screen assertion.", buf, 0xCu);
      }

      id v8 = +[TVRDAssertionManager sharedInstance];
      [v8 acquireLockScreenAssertion];
      goto LABEL_19;
    }
    if (+[TVRCFeatures isPersistOnLockScreenEnabled])
    {
      id v8 = _TVRDXPCLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "Persist on Lock Screen Internal Setting is turned on. Skipping releasing lock screen assertion.";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      }
    }
    else
    {
      v10 = +[TVRDAssertionManager sharedInstance];
      unsigned int v11 = [v10 isLockScreenAssertionActive];

      id v8 = _TVRDXPCLog();
      BOOL v12 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Releasing lock screen assertion in 1 second", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        dispatch_time_t v13 = dispatch_time(0, 1000000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __78__TVRDClientProcessConnection_closeConnectionToDeviceWithIdentifier_withType___block_invoke;
        block[3] = &unk_10001C5D8;
        objc_copyWeak(&v17, (id *)buf);
        dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
        objc_destroyWeak(&v17);
        objc_destroyWeak((id *)buf);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_WORD *)buf = 0;
        v9 = "Lock screen assertion is inactive";
        goto LABEL_18;
      }
    }
LABEL_19:

LABEL_20:
    [(NSMutableSet *)self->_mutableIdentifiers removeObject:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained clientConnection:self removedInterestedDeviceIdentifier:v6];
  }
}

uint64_t __78__TVRDClientProcessConnection_closeConnectionToDeviceWithIdentifier_withType___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && ![WeakRetained[4] count])
  {
    v2 = +[TVRDAssertionManager sharedInstance];
    [v2 releaseLockScreenAssertion];
  }

  return _objc_release_x1();
}

- (void)fulfillAuthChallengeForDeviceWithIdentifier:(id)a3 withLocallyEnteredCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fulfill auth challenge for device %@ with locally-entered code %{public}@", (uint8_t *)&v10, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self receivedAuthChallengeLocallyEnteredCode:v7 forDeviceIdentifier:v6];
}

- (void)cancelAuthChallengeForDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = _TVRDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cancel auth challenge for device %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self cancelledAuthChallengeForDeviceIdentifier:v4];
}

- (void)sendButtonEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Send button event %{public}@ to device %@", (uint8_t *)&v10, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self requestsSendingButtonEvent:v6 toDeviceIdentifier:v7];
}

- (void)sendTouchEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained clientConnection:self requestsSendingTouchEvent:v8 toDeviceIdentifier:v7];
}

- (void)sendGameControllerEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Send game controller event %{public}@ device %@", (uint8_t *)&v10, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self requestsSendingGameControllerEvent:v6 toDeviceIdentifier:v7];
}

- (void)sendInputText:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Send input text '%@' to device %@", (uint8_t *)&v10, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self requestsSendingInputText:v6 toDeviceIdentifier:v7];
}

- (void)sendInputReturnKeyToDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = _TVRDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Send return key to device %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self requestsSendingInputReturnKeyToDeviceIdentifier:v4];
}

- (void)sendInputTextPayload:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Send data payload %@ to device %@", (uint8_t *)&v10, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self requestsSendingInputDataPayload:v6 toDeviceIdentifier:v7];
}

- (void)beginDeviceQueryWithResponse:(id)a3
{
  id v4 = a3;
  v5 = _TVRDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v8 = 136315394;
    v9 = "-[TVRDClientProcessConnection beginDeviceQueryWithResponse:]";
    __int16 v10 = 2112;
    id v11 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s with delegate:%@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  [v7 clientConnectionRequestsStartingDeviceQuery:self withResponse:v4];
}

- (void)endDeviceQuery
{
  uint64_t v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v6 = 136315394;
    id v7 = "-[TVRDClientProcessConnection endDeviceQuery]";
    __int16 v8 = 2112;
    id v9 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s with delegate:%@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = objc_loadWeakRetained((id *)&self->_delegate);
  [v5 clientConnectionRequestsEndingDeviceQuery:self];
}

- (void)getSuggestedDevicesWithResponse:(id)a3
{
  id v4 = a3;
  id v5 = _TVRDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client requests suggested device", v7, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self requestsSuggestedDeviceWithResponse:v4];
}

- (void)removeInterestForDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = _TVRDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing device identifier: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  [(TVRDClientProcessConnection *)self _removeIdentifier:v4];
  int v6 = _TVRDXPCLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(TVRDClientProcessConnection *)self mutableIdentifiers];
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device identifiers interested to connect: %@", (uint8_t *)&v12, 0xCu);
  }
  __int16 v8 = [(TVRDClientProcessConnection *)self mutableIdentifiers];
  if ([v8 count]) {
    goto LABEL_10;
  }
  id v9 = +[TVRDAssertionManager sharedInstance];
  unsigned int v10 = [v9 isLockScreenAssertionActive];

  if (v10)
  {
    id v11 = _TVRDXPCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Releasing lock screen assertion", (uint8_t *)&v12, 2u);
    }

    __int16 v8 = +[TVRDAssertionManager sharedInstance];
    [v8 releaseLockScreenAssertion];
LABEL_10:
  }
}

- (void)fetchActiveMREndpointUIDWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[TVRCMediaRemoteEndpointManager sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __70__TVRDClientProcessConnection_fetchActiveMREndpointUIDWithCompletion___block_invoke;
  v6[3] = &unk_10001C620;
  id v7 = v3;
  id v5 = v3;
  [v4 fetchActiveEndpointWithCompletion:v6];
}

uint64_t __70__TVRDClientProcessConnection_fetchActiveMREndpointUIDWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendEvent:(id)a3 toDeviceWithIdentifier:(id)a4 options:(id)a5 response:(id)a6
{
  p_delegate = &self->_delegate;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained clientConnection:self requestsSendingEvent:v14 toDeviceWithIdentifier:v13 options:v12 response:v11];
}

- (void)launchViewServiceForDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = _TVRDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    id v14 = "-[TVRDClientProcessConnection launchViewServiceForDeviceWithIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s, deviceIdentifier=%@", (uint8_t *)&v13, 0x16u);
  }

  id v6 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.TVRemoteUIService" viewControllerClassName:@"TVRemoteAlertViewController"];
  id v7 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [v8 setObject:&off_10001D1F0 forKeyedSubscript:@"deviceType"];
  [v8 setObject:&off_10001D208 forKeyedSubscript:@"launchContext"];
  [v8 setObject:&off_10001D1F0 forKeyedSubscript:@"deviceIdentifierType"];
  if ([v4 length]) {
    [v8 setObject:v4 forKeyedSubscript:@"deviceIdentifier"];
  }
  id v9 = +[NSDictionary dictionaryWithDictionary:v8];
  [v7 setUserInfo:v9];

  id v10 = +[SBSRemoteAlertHandle newHandleWithDefinition:v6 configurationContext:v7];
  [v10 registerObserver:self];
  id v11 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  id v12 = _TVRDXPCLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Activating view service context", (uint8_t *)&v13, 2u);
  }

  [v10 activateWithContext:v11];
  [(TVRDClientProcessConnection *)self setAlertHandle:v10];
}

- (void)enableTVRemoteOnLockscreen:(BOOL)a3 forDeviceIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = _TVRDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v10 = 136315394;
    id v11 = "-[TVRDClientProcessConnection enableTVRemoteOnLockscreen:forDeviceIdentifier:]";
    __int16 v12 = 2112;
    id v13 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s with delegate:%@", (uint8_t *)&v10, 0x16u);
  }
  if (+[TVRCFeatures isPersistOnLockScreenEnabled])
  {
    id v9 = _TVRDXPCLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Skipping. PersistOnLockScreen Internal Setting is turned on", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 clientConnection:self requestsEnablingRemoteOnLockscreen:v4 forDeviceWithIdentifier:v6];
  }
}

- (void)getConnectionStatusToDeviceWithIdentifier:(id)a3 response:(id)a4
{
  p_delegate = &self->_delegate;
  int v10 = (void (**)(id, id))a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v9 = [WeakRetained clientConnection:self isConnectedToDeviceWithIdentifier:v7];

  v10[2](v10, v9);
}

- (void)enableFindingSession:(BOOL)a3 forDeviceIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = _TVRDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"Disable";
    if (v4) {
      CFStringRef v8 = @"Enable";
    }
    int v10 = 138412546;
    CFStringRef v11 = v8;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ finding session for device %{public}@", (uint8_t *)&v10, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self requestsEnablingFindingSession:v4 forDeviceWithIdentifier:v6];
}

- (void)fetchUpNextInfoForDeviceWithIdentifier:(id)a3 paginationToken:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  CFStringRef v11 = _TVRDXPCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Returning UpNext info", v13, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self fetchUpNextInfoForDeviceWithIdentifier:v10 paginationToken:v9 completion:v8];
}

- (void)markAsWatchedForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFStringRef v11 = _TVRDXPCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v9;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Marking %@ as watched on %{public}@", (uint8_t *)&v13, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self markAsWatchedForDeviceWithIdentifier:v8 mediaIdentifier:v9 completion:v10];
}

- (void)addItemForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFStringRef v11 = _TVRDXPCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v9;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Adding %@ to UpNext %{public}@", (uint8_t *)&v13, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self addItemForDeviceWithIdentifier:v8 mediaIdentifier:v9 completion:v10];
}

- (void)removeItemForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFStringRef v11 = _TVRDXPCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v9;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing %@ from UpNext %{public}@", (uint8_t *)&v13, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self removeItemForDeviceWithIdentifier:v8 mediaIdentifier:v9 completion:v10];
}

- (void)playItem:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFStringRef v11 = _TVRDXPCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Playing %@ on %{public}@", (uint8_t *)&v13, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnection:self playItem:v8 deviceIdentifier:v9 completion:v10];
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  BOOL v4 = _TVRDXPCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[TVRDClientProcessConnection remoteAlertHandleDidDeactivate:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(TVRDClientProcessConnection *)self _invalidateRemoteAlertHandle];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  id v6 = _TVRDXPCLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[TVRDClientProcessConnection remoteAlertHandle:didInvalidateWithError:]((uint64_t)v5, v6);
  }

  [(TVRDClientProcessConnection *)self _invalidateRemoteAlertHandle];
}

- (void)_invalidateRemoteAlertHandle
{
  id v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[TVRDClientProcessConnection _invalidateRemoteAlertHandle]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  BOOL v4 = [(TVRDClientProcessConnection *)self alertHandle];
  [v4 unregisterObserver:self];

  id v5 = [(TVRDClientProcessConnection *)self alertHandle];
  [v5 invalidate];

  [(TVRDClientProcessConnection *)self setAlertHandle:0];
}

- (void)_removeAllIdentifiers
{
  id v3 = [(TVRDClientProcessConnection *)self deviceIdentifiers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [(TVRDClientProcessConnection *)self _removeIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientConnectionRequestsEndingDeviceQuery:self];

  id v9 = _TVRDXPCLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [(NSMutableSet *)self->_mutableIdentifiers count];
    *(_DWORD *)buf = 67109120;
    unsigned int v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "After removing all identifiers for connection, counted set now has %d elements.", buf, 8u);
  }
}

- (void)_removeIdentifier:(id)a3
{
  id v5 = a3;
  if (-[NSMutableSet containsObject:](self->_mutableIdentifiers, "containsObject:"))
  {
    [(NSMutableSet *)self->_mutableIdentifiers removeObject:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained clientConnection:self removedInterestedDeviceIdentifier:v5];
  }
}

- (TVRDClientProcessConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRDClientProcessConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRCXPCResponseProtocol)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSMutableSet)mutableIdentifiers
{
  return self->_mutableIdentifiers;
}

- (void)setMutableIdentifiers:(id)a3
{
}

- (SBSRemoteAlertHandle)alertHandle
{
  return self->_alertHandle;
}

- (void)setAlertHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong((id *)&self->_mutableIdentifiers, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __62__TVRDClientProcessConnection_initWithXPCConnection_delegate___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed getting remote object proxy %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)remoteAlertHandle:(uint64_t)a1 didInvalidateWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[TVRDClientProcessConnection remoteAlertHandle:didInvalidateWithError:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s, error=%@", (uint8_t *)&v2, 0x16u);
}

@end