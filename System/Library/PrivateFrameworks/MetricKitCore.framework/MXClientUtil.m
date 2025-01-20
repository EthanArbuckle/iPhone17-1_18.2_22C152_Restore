@interface MXClientUtil
- (BOOL)_hasClientInClientDictionary;
- (BOOL)_isClientAvailableFromPersistence;
- (BOOL)hasClientForBundleID:(id)a3;
- (BOOL)isClientAvailableForBundleID:(id)a3;
- (MXClientUtil)init;
- (NSDictionary)clientDictionary;
- (NSDictionary)clientTeamIDs;
- (NSUserDefaults)userDefaults;
- (OS_os_log)logHandle;
- (id)_retrieveClientAvailablity;
- (id)_retrieveClientDictionary;
- (id)_retrieveTeamIDsDictionary;
- (id)allClients;
- (id)teamIDForBundleID:(id)a3;
- (void)_hasClientInClientDictionary;
- (void)_initClientCollection;
- (void)_persistClientAvailability;
- (void)_persistClientAvailabilityWithAvailability:(BOOL)a3;
- (void)_persistClientDictionary;
- (void)_persistTeamIDsDictionary;
- (void)_randomReportClientRegistrationForBundleID:(id)a3;
- (void)_updateClientAsAvailableFromPersistence;
- (void)_updateClientAsNotAvailableFromPersistence;
- (void)_updateClientDictionaryWithBundleID:(id)a3;
- (void)_updateTeamIDsDictionaryWithTeamID:(id)a3 forBundleID:(id)a4;
- (void)registerClientForBundleID:(id)a3;
- (void)removeClientFromPersistenceForBundleID:(id)a3;
- (void)reportMetricKitUsageForBundleID:(id)a3;
- (void)reportPayloadDeliveriesSuccessWithSuccessCount:(unint64_t)a3;
- (void)setClientDictionary:(id)a3;
- (void)setClientTeamIDs:(id)a3;
- (void)setLogHandle:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation MXClientUtil

- (BOOL)hasClientForBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(MXClientUtil *)self clientDictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)_isClientAvailableFromPersistence
{
  v2 = [(MXClientUtil *)self _retrieveClientAvailablity];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)_retrieveClientAvailablity
{
  v2 = (void *)CFPreferencesCopyValue(@"MXClientsAvailable", @"com.apple.metrickitd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);

  return v2;
}

- (BOOL)isClientAvailableForBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(MXClientUtil *)self clientDictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  LOBYTE(v4) = [v6 BOOLValue];
  return (char)v4;
}

- (NSDictionary)clientDictionary
{
  return self->_clientDictionary;
}

- (void)_updateClientAsAvailableFromPersistence
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22BB49000, log, OS_LOG_TYPE_ERROR, "Clients available was in a bad state.\n", v1, 2u);
}

- (void)_persistClientDictionary
{
  v2 = [(MXClientUtil *)self clientDictionary];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE68];
  CFPreferencesSetValue(@"MXClientDataRetrieved", v2, @"com.apple.metrickitd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);

  CFPreferencesSynchronize(@"com.apple.metrickitd", @"mobile", v3);
  _CFPreferencesFlushCachesForIdentifier();

  _CFPreferencesFlushCachesForIdentifier();
}

- (MXClientUtil)init
{
  v8.receiver = self;
  v8.super_class = (Class)MXClientUtil;
  v2 = [(MXClientUtil *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

    os_log_t v5 = os_log_create("com.apple.metrickit", "client.utility");
    logHandle = v2->_logHandle;
    v2->_logHandle = (OS_os_log *)v5;

    if (!v2->_logHandle) {
      objc_storeStrong((id *)&v2->_logHandle, &_os_log_internal);
    }
    [(MXClientUtil *)v2 _initClientCollection];
    [(MXClientUtil *)v2 _initTeamCollection];
    [(MXClientUtil *)v2 _persistClientAvailability];
  }
  return v2;
}

- (void)_initClientCollection
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_22BB49000, a2, OS_LOG_TYPE_DEBUG, "Client Dict: %@", (uint8_t *)&v3, 0xCu);
}

- (void)registerClientForBundleID:(id)a3
{
  id v4 = a3;
  [(MXClientUtil *)self _randomReportClientRegistrationForBundleID:v4];
  [(MXClientUtil *)self _updateClientDictionaryWithBundleID:v4];
}

- (id)allClients
{
  uint64_t v2 = [(MXClientUtil *)self clientDictionary];
  int v3 = [v2 allKeys];

  return v3;
}

- (id)teamIDForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MXClientUtil *)self clientTeamIDs];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)removeClientFromPersistenceForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MXClientUtil *)self clientDictionary];
  v6 = (void *)[v5 mutableCopy];

  [v6 removeObjectForKey:v4];
  v7 = [NSDictionary dictionaryWithDictionary:v6];
  [(MXClientUtil *)self setClientDictionary:v7];

  [(MXClientUtil *)self _persistClientDictionary];
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXClientUtil removeClientFromPersistenceForBundleID:]((uint64_t)v4, logHandle);
  }
}

- (void)reportMetricKitUsageForBundleID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __48__MXClientUtil_reportMetricKitUsageForBundleID___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"scheduledClient";
  v5[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportPayloadDeliveriesSuccessWithSuccessCount:(unint64_t)a3
{
}

id __63__MXClientUtil_reportPayloadDeliveriesSuccessWithSuccessCount___block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x263EF8340];
  v11[0] = @"clientDictionaryOverallCount";
  uint64_t v2 = NSNumber;
  id v3 = [*(id *)(a1 + 32) clientDictionary];
  id v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "count"));
  v12[0] = v4;
  v11[1] = @"clientDictionarySuccessCount";
  uint64_t v5 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v12[1] = v5;
  v11[2] = @"clientDictionaryFailureCount";
  v6 = NSNumber;
  v7 = [*(id *)(a1 + 32) clientDictionary];
  objc_super v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "count") - *(void *)(a1 + 40));
  v12[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (id)_retrieveClientDictionary
{
  uint64_t v2 = (void *)CFPreferencesCopyValue(@"MXClientDataRetrieved", @"com.apple.metrickitd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);

  return v2;
}

- (id)_retrieveTeamIDsDictionary
{
  uint64_t v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"MXClientTeamID"];
  id v3 = (void *)[v2 mutableCopy];

  return v3;
}

- (void)_persistClientAvailability
{
  if ([(MXClientUtil *)self _hasClientInClientDictionary])
  {
    [(MXClientUtil *)self _updateClientAsAvailableFromPersistence];
  }
  else
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_INFO, "No clients found. Resetting client availability key\n", v4, 2u);
    }
    [(MXClientUtil *)self _updateClientAsNotAvailableFromPersistence];
  }
}

- (BOOL)_hasClientInClientDictionary
{
  id v3 = [(MXClientUtil *)self clientDictionary];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG)) {
      -[MXClientUtil _hasClientInClientDictionary](logHandle);
    }
  }
  return v4 != 0;
}

- (void)_updateClientDictionaryWithBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MXClientUtil *)self clientDictionary];
  id v8 = (id)[v5 mutableCopy];

  v6 = [NSNumber numberWithBool:1];
  [v8 setValue:v6 forKey:v4];

  v7 = [NSDictionary dictionaryWithDictionary:v8];
  [(MXClientUtil *)self setClientDictionary:v7];

  [(MXClientUtil *)self _persistClientDictionary];
}

- (void)_updateTeamIDsDictionaryWithTeamID:(id)a3 forBundleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MXClientUtil *)self clientTeamIDs];
  id v10 = (id)[v8 mutableCopy];

  [v10 setValue:v7 forKey:v6];
  v9 = [NSDictionary dictionaryWithDictionary:v10];
  [(MXClientUtil *)self setClientTeamIDs:v9];

  [(MXClientUtil *)self _persistTeamIDsDictionary];
}

- (void)_updateClientAsNotAvailableFromPersistence
{
}

- (void)_persistClientAvailabilityWithAvailability:(BOOL)a3
{
  id v3 = (const void *)[NSNumber numberWithBool:a3];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE68];
  CFPreferencesSetValue(@"MXClientsAvailable", v3, @"com.apple.metrickitd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);
  CFPreferencesSynchronize(@"com.apple.metrickitd", @"mobile", v4);
  _CFPreferencesFlushCachesForIdentifier();

  _CFPreferencesFlushCachesForIdentifier();
}

- (void)_persistTeamIDsDictionary
{
  userDefaults = self->_userDefaults;
  id v3 = [(MXClientUtil *)self clientTeamIDs];
  [(NSUserDefaults *)userDefaults setObject:v3 forKey:@"MXClientTeamID"];
}

- (void)_randomReportClientRegistrationForBundleID:(id)a3
{
  id v3 = a3;
  if ((int)arc4random_uniform(0x64u) <= 9)
  {
    id v4 = v3;
    AnalyticsSendEventLazy();
  }
}

id __59__MXClientUtil__randomReportClientRegistrationForBundleID___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"bundleID";
  v5[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)setClientDictionary:(id)a3
{
}

- (NSDictionary)clientTeamIDs
{
  return self->_clientTeamIDs;
}

- (void)setClientTeamIDs:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserDefaults:(id)a3
{
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_clientTeamIDs, 0);

  objc_storeStrong((id *)&self->_clientDictionary, 0);
}

- (void)removeClientFromPersistenceForBundleID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22BB49000, a2, OS_LOG_TYPE_DEBUG, "removing Application: %@ from clients", (uint8_t *)&v2, 0xCu);
}

- (void)_hasClientInClientDictionary
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_22BB49000, log, OS_LOG_TYPE_DEBUG, "Client Dictionary count > 0", v1, 2u);
}

@end