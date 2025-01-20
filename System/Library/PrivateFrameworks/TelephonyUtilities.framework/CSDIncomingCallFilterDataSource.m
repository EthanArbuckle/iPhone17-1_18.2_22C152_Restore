@interface CSDIncomingCallFilterDataSource
- (BOOL)isDestinationIDAllowedThroughDoNotDisturb:(id)a3 providerIdentifier:(id)a4;
- (CSDIncomingCallFilterDataSource)init;
- (DNDEventBehaviorResolutionService)behaviorResolutionService;
- (NSString)networkCountryCode;
- (TUCallProviderManager)callProviderManager;
- (id)_callFilterIdentifier;
- (void)dealloc;
- (void)setFilterBlock:(id)a3;
@end

@implementation CSDIncomingCallFilterDataSource

- (CSDIncomingCallFilterDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSDIncomingCallFilterDataSource;
  v2 = [(CSDIncomingCallFilterDataSource *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[DNDEventBehaviorResolutionService serviceForClientIdentifier:TUBundleIdentifierCallServicesDaemon];
    behaviorResolutionService = v2->_behaviorResolutionService;
    v2->_behaviorResolutionService = (DNDEventBehaviorResolutionService *)v3;

    v5 = (TUCallProviderManager *)objc_alloc_init((Class)TUCallProviderManager);
    callProviderManager = v2->_callProviderManager;
    v2->_callProviderManager = v5;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [(CSDIncomingCallFilterDataSource *)self _callFilterIdentifier];
  ICFUnregisterCallFilterResultBlockWithIdentifier();

  v4.receiver = self;
  v4.super_class = (Class)CSDIncomingCallFilterDataSource;
  [(CSDIncomingCallFilterDataSource *)&v4 dealloc];
}

- (id)_callFilterIdentifier
{
  return +[NSString stringWithFormat:@"%@.%@.%p", TUBundleIdentifierCallServicesDaemon, objc_opt_class(), self];
}

- (void)setFilterBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDIncomingCallFilterDataSource *)self _callFilterIdentifier];
  ICFRegisterCallFilterResultBlockWithIdentifier();
}

- (NSString)networkCountryCode
{
  return (NSString *)_TUNetworkCountryCode(self, a2);
}

- (BOOL)isDestinationIDAllowedThroughDoNotDisturb:(id)a3 providerIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(CSDIncomingCallFilterDataSource *)self callProviderManager];
  v9 = [v8 providerWithIdentifier:v6];

  id v10 = [v9 bundleIdentifier];
  if (!v10)
  {
    unsigned int v11 = [v9 isTelephonyProvider];
    v12 = (void *)TUBundleIdentifierMobilePhoneApplication;
    if (!v11) {
      v12 = v6;
    }
    id v10 = v12;
  }
  id v13 = objc_alloc_init((Class)DNDMutableClientEventDetails);
  [v13 setBundleIdentifier:v10];
  [v13 setType:1];
  id v14 = objc_alloc_init((Class)DNDMutableContactHandle);
  if ([v7 destinationIdIsPhoneNumber]) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  [v14 setType:v15];
  [v14 setValue:v7];

  [v13 setSender:v14];
  v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "isDestinationIDAllowedThroughDoNotDisturb: provider=%@", buf, 0xCu);
  }

  v17 = sub_100008DCC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "isDestinationIDAllowedThroughDoNotDisturb: bundleID=%@", buf, 0xCu);
  }

  v18 = sub_100008DCC();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "isDestinationIDAllowedThroughDoNotDisturb: eventDetails=%@", buf, 0xCu);
  }

  v19 = [(CSDIncomingCallFilterDataSource *)self behaviorResolutionService];
  id v25 = 0;
  v20 = [v19 resolveBehaviorForEventDetails:v13 error:&v25];
  id v21 = v25;

  if (v20)
  {
    BOOL v22 = [v20 interruptionSuppression] == 0;
  }
  else
  {
    v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] Error encountered resolving behavior via DND. Defaulting isDestinationIDAllowedThroughDoNotDisturb to YES. error=%@", buf, 0xCu);
    }

    BOOL v22 = 1;
  }

  return v22;
}

- (DNDEventBehaviorResolutionService)behaviorResolutionService
{
  return self->_behaviorResolutionService;
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callProviderManager, 0);

  objc_storeStrong((id *)&self->_behaviorResolutionService, 0);
}

@end