@interface _CAFdConnectionProxy
- (BOOL)_isRegisteredForPluginID:(id)a3 instanceID:(id)a4;
- (BOOL)takeAssertions;
- (CAFCarDataClient)remoteProxy;
- (CAFDCarDataServiceAgent)agent;
- (NSDate)lastAssertion;
- (NSMutableDictionary)registrations;
- (NSMutableSet)assertions;
- (NSString)description;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)proxyQueue;
- (_CAFdConnectionProxy)initWithConnection:(id)a3 agent:(id)a4;
- (id)registrationsForPluginID:(id)a3;
- (os_unfair_lock_s)assertionsLock;
- (os_unfair_lock_s)registrationsLock;
- (void)addRegistrationToPluginID:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6;
- (void)createAssertionWithAction:(id)a3;
- (void)didNotifyPluginID:(id)a3 instanceID:(id)a4 value:(id)a5;
- (void)didRequestPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 withResponse:(id)a6;
- (void)didUpdateConfig:(id)a3;
- (void)didUpdateCurrentCarConfig:(id)a3;
- (void)didUpdatePluginID:(id)a3 values:(id)a4;
- (void)fetchCurrentCarConfigWithReply:(id)a3;
- (void)invalidateAndRemoveAssertions;
- (void)notifyPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 priority:(id)a6;
- (void)readFromPluginID:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6;
- (void)removeRegistrationFromPluginID:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6;
- (void)requestPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 priority:(id)a6 withResponse:(id)a7;
- (void)setAgent:(id)a3;
- (void)setAssertions:(id)a3;
- (void)setAssertionsLock:(os_unfair_lock_s)a3;
- (void)setConnection:(id)a3;
- (void)setLastAssertion:(id)a3;
- (void)setProxyQueue:(id)a3;
- (void)setRegistrations:(id)a3;
- (void)setRegistrationsLock:(os_unfair_lock_s)a3;
- (void)writeToPluginID:(id)a3 values:(id)a4 priority:(id)a5 withResponse:(id)a6;
@end

@implementation _CAFdConnectionProxy

- (_CAFdConnectionProxy)initWithConnection:(id)a3 agent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)_CAFdConnectionProxy;
  v9 = [(_CAFdConnectionProxy *)&v30 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeWeak((id *)&v10->_agent, v8);
    v10->_registrationsLock._os_unfair_lock_opaque = 0;
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    registrations = v10->_registrations;
    v10->_registrations = v11;

    v10->_lastAssertion = (NSDate *)+[NSDate distantPast];
    v10->_assertionsLock._os_unfair_lock_opaque = 0;
    uint64_t v13 = +[NSMutableSet set];
    assertions = v10->_assertions;
    v10->_assertions = (NSMutableSet *)v13;

    v15 = [v7 valueForEntitlement:@"com.apple.private.carp.wake"];
    v10->_takeAssertions = [v15 BOOLValue];

    id v16 = +[NSString stringWithFormat:@"com.apple.caraccessoryframework.CAFdConnectionProxy-%p", v10];
    v17 = (const char *)[v16 UTF8String];
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
    proxyQueue = v10->_proxyQueue;
    v10->_proxyQueue = (OS_dispatch_queue *)v19;

    v21 = CAFCarDataServiceInterface();
    [v7 setExportedInterface:v21];

    v22 = CAFCarDataClientInterface();
    [v7 setRemoteObjectInterface:v22];

    [v7 setExportedObject:v10];
    objc_initWeak(&location, v10);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __49___CAFdConnectionProxy_initWithConnection_agent___block_invoke;
    v27[3] = &unk_100034CC0;
    objc_copyWeak(&v28, &location);
    [v7 setInterruptionHandler:v27];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __49___CAFdConnectionProxy_initWithConnection_agent___block_invoke_29;
    v25[3] = &unk_100034CC0;
    objc_copyWeak(&v26, &location);
    [v7 setInvalidationHandler:v25];
    v23 = CAFDLogging();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Activating connection %{public}@", buf, 0xCu);
    }

    [v7 activate];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)invalidateAndRemoveAssertions
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Invalidate and remove assertions for conexion: %@", v2, v3, v4, v5, v6);
}

- (void)createAssertionWithAction:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = +[NSDate now];
  if (![(_CAFdConnectionProxy *)self takeAssertions]
    || ([(_CAFdConnectionProxy *)self lastAssertion],
        uint8_t v6 = objc_claimAutoreleasedReturnValue(),
        [v5 timeIntervalSinceDate:v6],
        double v8 = v7,
        v6,
        v8 < 1.0))
  {
    if (!v4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  [(_CAFdConnectionProxy *)self setLastAssertion:v5];
  v9 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.caraccessoryd" name:@"WakeClient"];
  v21 = v9;
  v10 = +[NSArray arrayWithObjects:&v21 count:1];

  v11 = [(_CAFdConnectionProxy *)self connection];
  v12 = +[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", [v11 processIdentifier]);

  id v13 = [objc_alloc((Class)RBSAssertion) initWithExplanation:@"CAFd wakes up clients" target:v12 attributes:v10];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __50___CAFdConnectionProxy_createAssertionWithAction___block_invoke;
  v20[3] = &unk_100034CE8;
  v20[4] = self;
  [v13 setInvalidationHandler:v20];
  v14 = [(_CAFdConnectionProxy *)self agent];
  [v14 _observeAssertion:v13];

  id v19 = 0;
  [v13 acquireWithError:&v19];
  id v15 = v19;
  if (v15)
  {
    id v16 = CAFDAssertionLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[_CAFdConnectionProxy createAssertionWithAction:]();
    }
  }
  else
  {
    os_unfair_lock_lock(&self->_assertionsLock);
    v17 = [(_CAFdConnectionProxy *)self assertions];
    [v17 addObject:v13];

    v18 = CAFDAssertionLogging();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[_CAFdConnectionProxy createAssertionWithAction:](self, v18);
    }

    os_unfair_lock_unlock(&self->_assertionsLock);
  }

  if (v4 && !v15) {
LABEL_14:
  }
    v4[2](v4);
LABEL_15:
}

- (CAFCarDataClient)remoteProxy
{
  uint64_t v2 = [(_CAFdConnectionProxy *)self connection];
  id v3 = [v2 remoteObjectProxy];
  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___CAFCarDataClient]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFCarDataClient *)v4;
}

- (NSString)description
{
  id v3 = [(_CAFdConnectionProxy *)self lastAssertion];
  id v4 = +[NSDate distantPast];
  if ([v3 isEqualToDate:v4])
  {
    uint64_t v5 = @"NONE";
  }
  else
  {
    uint8_t v6 = [(_CAFdConnectionProxy *)self lastAssertion];
    [v6 timeIntervalSinceNow];
    uint64_t v5 = +[NSString stringWithFormat:@"%.3f", v7];
  }
  uint64_t v8 = objc_opt_class();
  v9 = [(_CAFdConnectionProxy *)self connection];
  id v10 = [v9 processIdentifier];
  unsigned int v11 = [(_CAFdConnectionProxy *)self takeAssertions];
  CFStringRef v12 = @"NO";
  if (v11) {
    CFStringRef v12 = @"YES";
  }
  id v13 = +[NSString stringWithFormat:@"<%@ %p: pid=%d takeAssertions=%@ lastAssertion=%@>", v8, self, v10, v12, v5];

  return (NSString *)v13;
}

- (void)fetchCurrentCarConfigWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  uint64_t v5 = [(_CAFdConnectionProxy *)self agent];
  uint8_t v6 = [v5 currentCar];

  if (v6)
  {
    if ([v6 isConfigured])
    {
      id v7 = v6;
      uint64_t v8 = CAFDDataLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[_CAFdConnectionProxy fetchCurrentCarConfigWithReply:]();
      }
    }
    else
    {
      id v10 = [(_CAFdConnectionProxy *)self agent];
      unsigned int v11 = [v10 allowPartialConfiguration];

      if (v11)
      {
        id v7 = v6;
        uint64_t v8 = CAFDDataLogging();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[_CAFdConnectionProxy fetchCurrentCarConfigWithReply:]();
        }
      }
      else
      {
        id v7 = [v6 copyWithoutPlugins];
        uint64_t v8 = CAFDDataLogging();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[_CAFdConnectionProxy fetchCurrentCarConfigWithReply:].cold.4();
        }
      }
    }

    if (v4) {
      v4[2](v4, v7);
    }
  }
  else
  {
    v9 = CAFDDataLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_CAFdConnectionProxy fetchCurrentCarConfigWithReply:]();
    }

    if (v4) {
      v4[2](v4, 0);
    }
  }
}

- (void)addRegistrationToPluginID:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_unfair_lock_lock(&self->_registrationsLock);
  v14 = CAFDDataLogging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138544130;
    v21 = self;
    __int16 v22 = 2114;
    id v23 = v10;
    __int16 v24 = 2050;
    id v25 = [v11 count];
    __int16 v26 = 2114;
    id v27 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}@: add registration pluginID: %{public}@ instanceIDs count %{public}lu with priority: %{public}@", (uint8_t *)&v20, 0x2Au);
  }

  id v15 = [(_CAFdConnectionProxy *)self registrations];
  id v16 = [v15 objectForKeyedSubscript:v10];

  if (v16)
  {
    [v16 addObjectsFromArray:v11];
  }
  else
  {
    id v17 = [objc_alloc((Class)NSMutableSet) initWithArray:v11];
    v18 = [(_CAFdConnectionProxy *)self registrations];
    [v18 setObject:v17 forKeyedSubscript:v10];
  }
  os_unfair_lock_unlock(&self->_registrationsLock);
  id v19 = [(_CAFdConnectionProxy *)self agent];
  [v19 _addRegistration:v10 instanceIDs:v11 priority:v12 withResponse:v13];
}

- (void)removeRegistrationFromPluginID:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_unfair_lock_lock(&self->_registrationsLock);
  v14 = CAFDDataLogging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138544130;
    v21 = self;
    __int16 v22 = 2114;
    id v23 = v10;
    __int16 v24 = 2050;
    id v25 = [v11 count];
    __int16 v26 = 2114;
    id v27 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}@ remove registration pluginID: %{public}@ instanceIDs count %{public}lu with priority: %{public}@", buf, 0x2Au);
  }

  id v15 = [(_CAFdConnectionProxy *)self registrations];
  id v16 = [v15 objectForKeyedSubscript:v10];

  if (v16)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __89___CAFdConnectionProxy_removeRegistrationFromPluginID_instanceIDs_priority_withResponse___block_invoke;
    v18[3] = &unk_100034D10;
    id v19 = v16;
    [v11 enumerateObjectsUsingBlock:v18];
    os_unfair_lock_unlock(&self->_registrationsLock);
    id v17 = [(_CAFdConnectionProxy *)self agent];
    [v17 _removeRegistration:v10 instanceIDs:v11 priority:v12 withResponse:v13];
  }
  else
  {
    os_unfair_lock_unlock(&self->_registrationsLock);
  }
}

- (void)readFromPluginID:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(_CAFdConnectionProxy *)self agent];
  id v15 = [v14 _getClient:v10];

  if (v15)
  {
    [v15 readInstanceIDs:v11 priority:v12 withResponse:v13];
  }
  else
  {
    id v16 = CAFDDataLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v21 = self;
      __int16 v22 = 2114;
      id v23 = v10;
      __int16 v24 = 2114;
      id v25 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: Read request for pluginID: %{public}@ with priority: %{public}@ failed due to missing plugin", buf, 0x20u);
    }

    if (v13)
    {
      id v17 = [(_CAFdConnectionProxy *)self proxyQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __75___CAFdConnectionProxy_readFromPluginID_instanceIDs_priority_withResponse___block_invoke;
      block[3] = &unk_100034D38;
      id v19 = v13;
      dispatch_async(v17, block);
    }
  }
}

- (void)writeToPluginID:(id)a3 values:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(_CAFdConnectionProxy *)self agent];
  id v15 = [v14 _getClient:v10];

  if (v15)
  {
    [v15 writeValues:v11 priority:v12 withResponse:v13];
  }
  else
  {
    id v16 = CAFDDataLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v21 = self;
      __int16 v22 = 2114;
      id v23 = v10;
      __int16 v24 = 2114;
      id v25 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: Write request for pluginID: %{public}@ with priority: %{public}@ failed due to missing plugin", buf, 0x20u);
    }

    if (v13)
    {
      id v17 = [(_CAFdConnectionProxy *)self proxyQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __69___CAFdConnectionProxy_writeToPluginID_values_priority_withResponse___block_invoke;
      block[3] = &unk_100034D38;
      id v19 = v13;
      dispatch_async(v17, block);
    }
  }
}

- (void)requestPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 priority:(id)a6 withResponse:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(_CAFdConnectionProxy *)self agent];
  v18 = [v17 _getClient:v12];

  if (v18)
  {
    [v18 requestInstanceID:v13 value:v14 priority:v15 withResponse:v16];
  }
  else
  {
    id v19 = CAFDDataLogging();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      __int16 v24 = self;
      __int16 v25 = 2112;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v13;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@: Request pluginID: %@ instanceID: %@ with priority: %@ failed due to missing plugin", buf, 0x2Au);
    }

    if (v16)
    {
      int v20 = [(_CAFdConnectionProxy *)self proxyQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __79___CAFdConnectionProxy_requestPluginID_instanceID_value_priority_withResponse___block_invoke;
      block[3] = &unk_100034D38;
      id v22 = v16;
      dispatch_async(v20, block);
    }
  }
}

- (void)notifyPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 priority:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(_CAFdConnectionProxy *)self agent];
  id v15 = [v14 _getClient:v10];

  if (v15)
  {
    [v15 notifyInstanceID:v11 value:v12 priority:v13];
  }
  else
  {
    id v16 = CAFDDataLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138413058;
      v18 = self;
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v11;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@: Notify pluginID: %@ instanceID: %@ with priority: %@ failed due to missing plugin", (uint8_t *)&v17, 0x2Au);
    }
  }
}

- (void)didUpdateCurrentCarConfig:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_registrationsLock);
  uint64_t v5 = [(_CAFdConnectionProxy *)self registrations];
  [v5 removeAllObjects];

  os_unfair_lock_unlock(&self->_registrationsLock);
  uint8_t v6 = CAFDLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ didUpdateCurrentCarConfig: %{public}@", buf, 0x16u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __50___CAFdConnectionProxy_didUpdateCurrentCarConfig___block_invoke;
  v8[3] = &unk_100034D60;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(_CAFdConnectionProxy *)self createAssertionWithAction:v8];
}

- (void)didUpdateConfig:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CAFDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint8_t v6 = [v4 allKeys];
    id v7 = [v6 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543618;
    __int16 v12 = self;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ didUpdateConfig: [%{public}@]", buf, 0x16u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __40___CAFdConnectionProxy_didUpdateConfig___block_invoke;
  v9[3] = &unk_100034D60;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(_CAFdConnectionProxy *)self createAssertionWithAction:v9];
}

- (void)didUpdatePluginID:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_registrationsLock);
  id v8 = [(_CAFdConnectionProxy *)self registrations];
  id v9 = [v8 objectForKeyedSubscript:v6];
  id v10 = [v9 copy];

  os_unfair_lock_unlock(&self->_registrationsLock);
  if (v10)
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __49___CAFdConnectionProxy_didUpdatePluginID_values___block_invoke;
    v16[3] = &unk_100034D88;
    id v17 = v10;
    id v12 = v11;
    id v18 = v12;
    [v7 enumerateKeysAndObjectsUsingBlock:v16];
    if ([v12 count])
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __49___CAFdConnectionProxy_didUpdatePluginID_values___block_invoke_2;
      v13[3] = &unk_100034DB0;
      v13[4] = self;
      id v14 = v6;
      id v15 = v12;
      [(_CAFdConnectionProxy *)self createAssertionWithAction:v13];
    }
  }
}

- (void)didRequestPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 withResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(_CAFdConnectionProxy *)self _isRegisteredForPluginID:v10 instanceID:v11])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __73___CAFdConnectionProxy_didRequestPluginID_instanceID_value_withResponse___block_invoke;
    v15[3] = &unk_100034DD8;
    v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    id v19 = v13;
    [(_CAFdConnectionProxy *)self createAssertionWithAction:v15];
  }
  else
  {
    id v14 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v14);
  }
}

- (void)didNotifyPluginID:(id)a3 instanceID:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(_CAFdConnectionProxy *)self _isRegisteredForPluginID:v8 instanceID:v9])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __59___CAFdConnectionProxy_didNotifyPluginID_instanceID_value___block_invoke;
    v11[3] = &unk_100034E00;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    [(_CAFdConnectionProxy *)self createAssertionWithAction:v11];
  }
}

- (BOOL)_isRegisteredForPluginID:(id)a3 instanceID:(id)a4
{
  p_registrationsLock = &self->_registrationsLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_registrationsLock);
  id v9 = [(_CAFdConnectionProxy *)self registrations];
  id v10 = [v9 objectForKeyedSubscript:v8];

  LOBYTE(v8) = [v10 containsObject:v7];
  os_unfair_lock_unlock(p_registrationsLock);
  return (char)v8;
}

- (id)registrationsForPluginID:(id)a3
{
  p_registrationsLock = &self->_registrationsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_registrationsLock);
  id v6 = [(_CAFdConnectionProxy *)self registrations];
  id v7 = [v6 objectForKeyedSubscript:v5];

  id v8 = [v7 copy];
  os_unfair_lock_unlock(p_registrationsLock);

  return v8;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (CAFDCarDataServiceAgent)agent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_agent);

  return (CAFDCarDataServiceAgent *)WeakRetained;
}

- (void)setAgent:(id)a3
{
}

- (os_unfair_lock_s)registrationsLock
{
  return self->_registrationsLock;
}

- (void)setRegistrationsLock:(os_unfair_lock_s)a3
{
  self->_registrationsLock = a3;
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
}

- (OS_dispatch_queue)proxyQueue
{
  return self->_proxyQueue;
}

- (void)setProxyQueue:(id)a3
{
}

- (os_unfair_lock_s)assertionsLock
{
  return self->_assertionsLock;
}

- (void)setAssertionsLock:(os_unfair_lock_s)a3
{
  self->_assertionsLock = a3;
}

- (BOOL)takeAssertions
{
  return self->_takeAssertions;
}

- (NSMutableSet)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
}

- (NSDate)lastAssertion
{
  return self->_lastAssertion;
}

- (void)setLastAssertion:(id)a3
{
  self->_lastAssertion = (NSDate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_proxyQueue, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_destroyWeak((id *)&self->_agent);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)createAssertionWithAction:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%{public}@ Assertion acquirement error: %{public}@", v1, 0x16u);
}

- (void)createAssertionWithAction:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  id v4 = [a1 assertions];
  [v4 count];
  int v6 = 138543618;
  id v7 = a1;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, a2, v5, "%{public}@ Assertion acquired. active count=%lu", (uint8_t *)&v6);
}

- (void)fetchCurrentCarConfigWithReply:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "%{public}@: No car", v2, v3, v4, v5, v6);
}

- (void)fetchCurrentCarConfigWithReply:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "%{public}@: Current car: %{public}@ with config");
}

- (void)fetchCurrentCarConfigWithReply:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "%{public}@: Current car: %{public}@ with incomplete config");
}

- (void)fetchCurrentCarConfigWithReply:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "%{public}@: Current car: %{public}@ without config");
}

@end