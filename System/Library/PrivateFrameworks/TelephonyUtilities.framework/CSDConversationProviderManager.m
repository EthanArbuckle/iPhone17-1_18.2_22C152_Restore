@interface CSDConversationProviderManager
+ (CSDConversationProviderManager)sharedInstance;
+ (id)errorForDisabledPseudonyms;
+ (id)errorForUnregisteredProviderIdentifier:(id)a3;
- (CSDConversationProviderManager)init;
- (CSDSharedConversationServerBag)serverBag;
- (NSMutableDictionary)pidToCachedProviderIdentifiers;
- (NSMutableDictionary)pidToProcessHandle;
- (NSMutableDictionary)pidToProviderIdentifiers;
- (NSMutableDictionary)providerIdentifierToProvider;
- (TUFeatureFlags)featureFlags;
- (id)beginListeningBlock;
- (id)conversationProviderForIdentifier:(id)a3;
- (id)providerIdentifiersForClient:(id)a3;
- (id)serviceForProvider:(id)a3;
- (id)tuConversationProviderForIdentifier:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (void)createProcessMonitorIfNecessary:(id)a3 forClient:(id)a4;
- (void)doesHandle:(id)a3 correspondToConversationProvider:(id)a4 completionHandler:(id)a5;
- (void)generatePseudonymHandleForConversationProvider:(id)a3 expiryDuration:(double)a4 URI:(id)a5 completionHandler:(id)a6;
- (void)registerConversationProvider:(id)a3 completionHandler:(id)a4;
- (void)renewPseudonymHandle:(id)a3 forConversationProvider:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6;
- (void)revokePseudonymHandle:(id)a3 forConversationProvider:(id)a4 completionHandler:(id)a5;
- (void)setBeginListeningBlock:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setServerBag:(id)a3;
- (void)startTrackingClient:(id)a3 forProviderIdentifier:(id)a4;
- (void)stopTrackingClient:(id)a3;
@end

@implementation CSDConversationProviderManager

+ (CSDConversationProviderManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A7984;
  block[3] = &unk_1005057B8;
  block[4] = a1;
  if (qword_10058C500 != -1) {
    dispatch_once(&qword_10058C500, block);
  }
  v2 = (void *)qword_10058C4F8;

  return (CSDConversationProviderManager *)v2;
}

- (CSDConversationProviderManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)CSDConversationProviderManager;
  v2 = [(CSDConversationProviderManager *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    providerIdentifierToProvider = v3->_providerIdentifierToProvider;
    v3->_providerIdentifierToProvider = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pidToProviderIdentifiers = v3->_pidToProviderIdentifiers;
    v3->_pidToProviderIdentifiers = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pidToCachedProviderIdentifiers = v3->_pidToCachedProviderIdentifiers;
    v3->_pidToCachedProviderIdentifiers = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pidToProcessHandle = v3->_pidToProcessHandle;
    v3->_pidToProcessHandle = v10;

    v12 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v3->_featureFlags;
    v3->_featureFlags = v12;

    v14 = objc_alloc_init(CSDSharedConversationServerBag);
    serverBag = v3->_serverBag;
    v3->_serverBag = v14;
  }
  return v3;
}

- (void)startTrackingClient:(id)a3 forProviderIdentifier:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_accessorLock);
  v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v21 processIdentifier]);
  v8 = [(CSDConversationProviderManager *)self providerIdentifierToProvider];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    v10 = [(CSDConversationProviderManager *)self pidToProviderIdentifiers];
    v11 = [v10 objectForKeyedSubscript:v7];

    if (!v11)
    {
      id v12 = objc_alloc_init((Class)NSMutableSet);
      v13 = [(CSDConversationProviderManager *)self pidToProviderIdentifiers];
      [v13 setObject:v12 forKeyedSubscript:v7];
    }
    v14 = [(CSDConversationProviderManager *)self pidToProviderIdentifiers];
    v15 = [v14 objectForKeyedSubscript:v7];
    id v16 = [v6 copy];
    [v15 addObject:v16];
  }
  else
  {
    objc_super v17 = [(CSDConversationProviderManager *)self pidToCachedProviderIdentifiers];
    v18 = [v17 objectForKeyedSubscript:v7];

    if (!v18)
    {
      id v19 = objc_alloc_init((Class)NSMutableSet);
      v20 = [(CSDConversationProviderManager *)self pidToCachedProviderIdentifiers];
      [v20 setObject:v19 forKeyedSubscript:v7];
    }
    v14 = [(CSDConversationProviderManager *)self pidToCachedProviderIdentifiers];
    v15 = [v14 objectForKeyedSubscript:v7];
    id v16 = [v6 copy];
    [v15 addObject:v16];
  }

  [(CSDConversationProviderManager *)self createProcessMonitorIfNecessary:v7 forClient:v21];
  os_unfair_lock_unlock(&self->_accessorLock);
}

- (void)stopTrackingClient:(id)a3
{
  id v9 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 processIdentifier]);
  id v6 = [(CSDConversationProviderManager *)self pidToProcessHandle];
  [v6 setObject:0 forKeyedSubscript:v5];

  v7 = [(CSDConversationProviderManager *)self pidToProviderIdentifiers];
  [v7 setObject:0 forKeyedSubscript:v5];

  v8 = [(CSDConversationProviderManager *)self pidToCachedProviderIdentifiers];
  [v8 setObject:0 forKeyedSubscript:v5];

  os_unfair_lock_unlock(p_accessorLock);
}

- (id)providerIdentifiersForClient:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v6 = [(CSDConversationProviderManager *)self pidToProviderIdentifiers];
  id v7 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", objc_msgSend(v4, "processIdentifier"));
  v8 = [v6 objectForKeyedSubscript:v7];
  id v9 = [v8 copy];
  v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = objc_alloc_init((Class)NSSet);
  }
  id v12 = v11;

  os_unfair_lock_unlock(p_accessorLock);

  return v12;
}

- (void)registerConversationProvider:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  v8 = [v6 identifier];
  id v9 = [(CSDConversationProviderManager *)self conversationProviderForIdentifier:v8];

  if (v9)
  {
    v10 = [v6 identifier];
    id v11 = +[NSString stringWithFormat:@"Already registered provider for identifier: %@", v10];

    NSErrorUserInfoKey v19 = NSLocalizedFailureReasonErrorKey;
    v20 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v13 = +[NSError errorWithDomain:@"CSDConversationProviderManager" code:1 userInfo:v12];

    v7[2](v7, v13);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001A80D8;
    v15[3] = &unk_100509850;
    v15[4] = self;
    id v16 = [[CSDConversationProvider alloc] initWithProvider:v6];
    id v17 = v6;
    v18 = v7;
    id v11 = v16;
    v14 = objc_retainBlock(v15);
    [(CSDConversationProvider *)v11 registerWithIDSWithCompletionHandler:v14];
  }
}

- (id)conversationProviderForIdentifier:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v6 = [(CSDConversationProviderManager *)self providerIdentifierToProvider];
  id v7 = [v6 objectForKeyedSubscript:v4];

  os_unfair_lock_unlock(p_accessorLock);

  return v7;
}

- (id)tuConversationProviderForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CSDConversationProviderManager *)self conversationProviderForIdentifier:v4];
  id v6 = v5;
  if (v5) {
    [v5 tuProvider];
  }
  else {
  id v7 = +[TUConversationProvider providerForIdentifier:v4];
  }

  return v7;
}

- (void)generatePseudonymHandleForConversationProvider:(id)a3 expiryDuration:(double)a4 URI:(id)a5 completionHandler:(id)a6
{
  id v22 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(CSDConversationProviderManager *)self serverBag];
  v13 = [v22 identifier];
  unsigned __int8 v14 = [v12 gftaasPseudonymsEnabled:v13];

  if ((v14 & 1) == 0)
  {
    v15 = [(id)objc_opt_class() errorForDisabledPseudonyms];
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v15);
  }
  os_unfair_lock_lock(&self->_accessorLock);
  id v16 = [(CSDConversationProviderManager *)self providerIdentifierToProvider];
  id v17 = [v22 identifier];
  v18 = [v16 objectForKeyedSubscript:v17];

  if (v18)
  {
    [v18 generatePseudonymHandleForConversationWithExpiryDuration:v10 URI:v11 completionHandler:a4];
    os_unfair_lock_unlock(&self->_accessorLock);
  }
  else
  {
    NSErrorUserInfoKey v19 = [v22 identifier];
    id v20 = [v19 copy];

    os_unfair_lock_unlock(&self->_accessorLock);
    id v21 = [(id)objc_opt_class() errorForUnregisteredProviderIdentifier:v20];
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v21);
  }
}

- (void)renewPseudonymHandle:(id)a3 forConversationProvider:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  unsigned __int8 v14 = [(CSDConversationProviderManager *)self providerIdentifierToProvider];
  v15 = [v10 identifier];
  id v16 = [v14 objectForKeyedSubscript:v15];

  if (v16)
  {
    [v16 renewPseudonymHandle:v21 expirationDate:v11 completionHandler:v12];
  }
  else
  {
    id v17 = objc_opt_class();
    v18 = [v10 identifier];
    id v19 = [v18 copy];
    id v20 = [v17 errorForUnregisteredProviderIdentifier:v19];
    (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0, 0, v20);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)revokePseudonymHandle:(id)a3 forConversationProvider:(id)a4 completionHandler:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v11 = [(CSDConversationProviderManager *)self providerIdentifierToProvider];
  id v12 = [v8 identifier];
  v13 = [v11 objectForKeyedSubscript:v12];

  if (v13)
  {
    [v13 revokePseudonymHandle:v17 completionHandler:v9];
  }
  else
  {
    unsigned __int8 v14 = objc_opt_class();
    v15 = [v8 identifier];
    id v16 = [v14 errorForUnregisteredProviderIdentifier:v15];
    v9[2](v9, 0, v16);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)doesHandle:(id)a3 correspondToConversationProvider:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v12 = [(CSDConversationProviderManager *)self providerIdentifierToProvider];
  v13 = [v9 identifier];
  unsigned __int8 v14 = [v12 objectForKeyedSubscript:v13];
  id v15 = [v14 copy];

  if (v15)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001A8B5C;
    v19[3] = &unk_100509878;
    id v20 = v10;
    [v15 isPseudonymHandleForProvider:v8 completionHandler:v19];
  }
  else
  {
    id v16 = objc_opt_class();
    id v17 = [v9 identifier];
    v18 = [v16 errorForUnregisteredProviderIdentifier:v17];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v18);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (id)serviceForProvider:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (([v4 isDefaultProvider] & 1) != 0
    || ([(CSDConversationProviderManager *)self featureFlags],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 groupFacetimeAsAServiceEnabled],
        v6,
        (v7 & 1) == 0))
  {
    id v11 = +[CSDFaceTimeMultiwayIDSService sharedInstance];
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = [v4 isDefaultProvider];
      CFStringRef v15 = @"NO";
      if (v14) {
        CFStringRef v15 = @"YES";
      }
      int v18 = 138412546;
      CFStringRef v19 = v15;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "provider.isDefaultProvider: %@, provider: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    id v8 = [(CSDConversationProviderManager *)self providerIdentifierToProvider];
    id v9 = [v4 identifier];
    id v10 = [v8 objectForKeyedSubscript:v9];
    id v11 = [v10 service];

    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(CSDConversationProviderManager *)self providerIdentifierToProvider];
      int v18 = 138412802;
      CFStringRef v19 = v11;
      __int16 v20 = 2112;
      id v21 = v4;
      __int16 v22 = 2112;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "service: %@, provider: %@, providerIdentifierToProvider: %@", (uint8_t *)&v18, 0x20u);
    }
  }

  if (TUSimulatedModeEnabled())
  {
    uint64_t v16 = +[CSDSimulatedIDSService sharedInstance];

    id v11 = (__CFString *)v16;
  }
  os_unfair_lock_unlock(p_accessorLock);

  return v11;
}

- (void)setBeginListeningBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  id v5 = objc_retainBlock(v4);
  id beginListeningBlock = self->_beginListeningBlock;
  self->_id beginListeningBlock = v5;

  unsigned __int8 v7 = [(CSDConversationProviderManager *)self providerIdentifierToProvider];
  id v8 = [v7 allValues];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v12);
        unsigned int v14 = [(CSDConversationProviderManager *)self beginListeningBlock];
        CFStringRef v15 = [v13 service];
        ((void (**)(void, void *))v14)[2](v14, v15);

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_accessorLock);
}

+ (id)errorForUnregisteredProviderIdentifier:(id)a3
{
  v3 = +[NSString stringWithFormat:@"Did not register GFT Provider with identifier: %@", a3];
  NSErrorUserInfoKey v7 = NSLocalizedFailureReasonErrorKey;
  id v8 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v5 = +[NSError errorWithDomain:@"CSDConversationProviderManager" code:0 userInfo:v4];

  return v5;
}

+ (id)errorForDisabledPseudonyms
{
  NSErrorUserInfoKey v5 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v6 = @"Pseudonym creation is not enabled";
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v3 = +[NSError errorWithDomain:@"CSDConversationProviderManager" code:0 userInfo:v2];

  return v3;
}

- (void)createProcessMonitorIfNecessary:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationProviderManager *)self pidToProcessHandle];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    objc_initWeak(&location, self);
    id v10 = +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", [v7 processIdentifier]);
    uint64_t v11 = +[RBSProcessHandle handleForIdentifier:v10 error:0];

    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    CFStringRef v15 = sub_1001A92D8;
    long long v16 = &unk_1005098A0;
    objc_copyWeak(&v17, &location);
    [v11 monitorForDeath:&v13];
    id v12 = [(CSDConversationProviderManager *)self pidToProcessHandle];
    [v12 setObject:v11 forKeyedSubscript:v6];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (id)beginListeningBlock
{
  return self->_beginListeningBlock;
}

- (NSMutableDictionary)providerIdentifierToProvider
{
  return self->_providerIdentifierToProvider;
}

- (NSMutableDictionary)pidToProviderIdentifiers
{
  return self->_pidToProviderIdentifiers;
}

- (NSMutableDictionary)pidToCachedProviderIdentifiers
{
  return self->_pidToCachedProviderIdentifiers;
}

- (NSMutableDictionary)pidToProcessHandle
{
  return self->_pidToProcessHandle;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (CSDSharedConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_pidToProcessHandle, 0);
  objc_storeStrong((id *)&self->_pidToCachedProviderIdentifiers, 0);
  objc_storeStrong((id *)&self->_pidToProviderIdentifiers, 0);
  objc_storeStrong((id *)&self->_providerIdentifierToProvider, 0);

  objc_storeStrong(&self->_beginListeningBlock, 0);
}

@end