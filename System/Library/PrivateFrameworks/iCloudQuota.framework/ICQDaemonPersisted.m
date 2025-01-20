@interface ICQDaemonPersisted
+ (NSDictionary)_placeholderPersistenceDictionary;
+ (NSMutableDictionary)_mutablePlaceholderPersistanceDictionary;
+ (NSString)persistenceDomain;
+ (double)defaultCallbackInterval;
+ (id)_placeholderObject;
+ (id)persistedObject;
+ (id)userDefaults;
+ (void)clearPersistedObject;
- (BOOL)failedToFetchFromServer;
- (BOOL)isExpired;
- (BOOL)isValidForAccount:(id)a3;
- (ICQDaemonPersisted)initWithDictionary:(id)a3;
- (NSDate)expirationDate;
- (NSDate)retrievalDate;
- (NSDictionary)_persistenceDictionary;
- (NSDictionary)failureDetails;
- (NSDictionary)serverDictionary;
- (NSMutableDictionary)_mutablePersistenceDictionary;
- (NSNumber)_cachedQuotaAvailable;
- (NSString)accountAltDSID;
- (double)_callbackIntervalFromServerObject:(id)a3;
- (double)callbackInterval;
- (id)_initWithAccount:(id)a3 error:(id)a4;
- (id)_initWithAccount:(id)a3 serverDictionary:(id)a4;
- (id)_initWithAccountAltDSID:(id)a3 error:(id)a4;
- (void)persistObject;
- (void)setAccountAltDSID:(id)a3;
- (void)setCallbackInterval:(double)a3;
- (void)setFailedToFetchFromServer:(BOOL)a3;
- (void)setFailureDetails:(id)a3;
- (void)setRetrievalDate:(id)a3;
- (void)setServerDictionary:(id)a3;
@end

@implementation ICQDaemonPersisted

+ (void)clearPersistedObject
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "Clearing persisted object for %{public}@", (uint8_t *)&v8, 0xCu);
  }
  v5 = [a1 userDefaults];
  v6 = [a1 persistenceKey];
  [v5 removeObjectForKey:v6];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"ICQDaemonOfferPersistedNotificationName" object:0];
}

+ (id)persistedObject
{
  v3 = [a1 userDefaults];
  id v4 = [a1 persistenceKey];
  v5 = [v3 valueForKey:v4];

  if (v5) {
    v6 = (void *)[objc_alloc((Class)a1) initWithDictionary:v5];
  }
  else {
    v6 = 0;
  }

  return v6;
}

+ (id)userDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ICQDaemonPersisted_userDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userDefaults_onceToken != -1) {
    dispatch_once(&userDefaults_onceToken, block);
  }
  v2 = (void *)userDefaults_defaults;
  return v2;
}

void __34__ICQDaemonPersisted_userDefaults__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = [*(id *)(a1 + 32) persistenceDomain];
  uint64_t v3 = [v2 initWithSuiteName:v5];
  id v4 = (void *)userDefaults_defaults;
  userDefaults_defaults = v3;
}

+ (id)_placeholderObject
{
  id v3 = objc_alloc((Class)a1);
  id v4 = [a1 _placeholderPersistenceDictionary];
  id v5 = (void *)[v3 initWithDictionary:v4];

  return v5;
}

- (void)persistObject
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_opt_class();
    id v5 = v4;
    v6 = [(id)objc_opt_class() persistenceKey];
    v7 = [(id)objc_opt_class() persistenceDomain];
    int v12 = 138543874;
    v13 = v4;
    __int16 v14 = 2112;
    v15 = v6;
    __int16 v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "Persisting %{public}@ using key %@ at location %@", (uint8_t *)&v12, 0x20u);
  }
  int v8 = [(ICQDaemonPersisted *)self _persistenceDictionary];
  id v9 = [(id)objc_opt_class() userDefaults];
  uint64_t v10 = [(id)objc_opt_class() persistenceKey];
  [v9 setObject:v8 forKey:v10];

  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"ICQDaemonOfferPersistedNotificationName" object:0];
}

- (NSDate)expirationDate
{
  id v3 = [(ICQDaemonPersisted *)self retrievalDate];
  [(ICQDaemonPersisted *)self callbackInterval];
  id v4 = objc_msgSend(v3, "dateByAddingTimeInterval:");

  return (NSDate *)v4;
}

- (BOOL)isExpired
{
  id v2 = [(ICQDaemonPersisted *)self expirationDate];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [v2 compare:v3] == -1;

  return v4;
}

- (BOOL)isValidForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQDaemonPersisted *)self accountAltDSID];
  v6 = objc_msgSend(v4, "aa_altDSID");

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

+ (NSString)persistenceDomain
{
  return (NSString *)@"com.apple.cloud.quota";
}

+ (double)defaultCallbackInterval
{
  return 86400.0;
}

- (ICQDaemonPersisted)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ICQDaemonPersisted;
  id v5 = [(ICQDaemonPersisted *)&v22 init];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = v5;
      id v5 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v6 = [v4 objectForKey:@"retrievalDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v9 = _ICQGetLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v6;
          _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "bad retrieval date %@", buf, 0xCu);
        }
LABEL_9:

        uint64_t v10 = [v4 objectForKey:@"callbackInterval"];
        if (v10)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            int v12 = _ICQGetLogSystem();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v10;
              _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "bad callbackInterval %@", buf, 0xCu);
            }

            goto LABEL_17;
          }
          [v10 doubleValue];
        }
        else
        {
          [(id)objc_opt_class() defaultCallbackInterval];
        }
        v5->_callbackInterval = v11;
LABEL_17:
        uint64_t v13 = _ICQStringFromDictionaryKey(v4, @"altDSID", &stru_1F2DCE430);
        accountAltDSID = v5->_accountAltDSID;
        v5->_accountAltDSID = (NSString *)v13;

        v15 = [v4 objectForKey:@"serverDict"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v16 = v15;
          p_super = &v5->_serverDictionary->super;
          v5->_serverDictionary = v16;
        }
        else
        {
          uint64_t v18 = _ICQGetLogSystem();
          p_super = v18;
          if (v15)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
              -[ICQDaemonPersisted initWithDictionary:]((uint64_t)v15, p_super);
            }
          }
          else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D5851000, p_super, OS_LOG_TYPE_DEFAULT, "persisted offer missing server dict", buf, 2u);
          }
        }

        v5->_failedToFetchFromServer = _ICQIntegerFromDictionaryKey(v4, @"failedToFetchFromServer", 0) != 0;
        uint64_t v19 = [v4 objectForKey:@"failureDetails"];
        failureDetails = v5->_failureDetails;
        v5->_failureDetails = (NSDictionary *)v19;

        if (!v5->_retrievalDate || !v5->_serverDictionary)
        {

          id v5 = 0;
        }

        goto LABEL_30;
      }
      int v8 = (void *)MEMORY[0x1E4F1C9C8];
      [v6 doubleValue];
      objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
      v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    id v9 = &v5->_retrievalDate->super;
    v5->_retrievalDate = v7;
    goto LABEL_9;
  }
LABEL_31:

  return v5;
}

- (id)_initWithAccount:(id)a3 serverDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICQDaemonPersisted;
  int v8 = [(ICQDaemonPersisted *)&v13 init];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [(ICQDaemonPersisted *)v8 setRetrievalDate:v9];

    uint64_t v10 = [v7 objectForKeyedSubscript:@"callbackInterval"];
    [(ICQDaemonPersisted *)v8 _callbackIntervalFromServerObject:v10];
    -[ICQDaemonPersisted setCallbackInterval:](v8, "setCallbackInterval:");

    double v11 = objc_msgSend(v6, "aa_altDSID");
    [(ICQDaemonPersisted *)v8 setAccountAltDSID:v11];

    [(ICQDaemonPersisted *)v8 setServerDictionary:v7];
  }

  return v8;
}

- (id)_initWithAccount:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "aa_altDSID");
  id v8 = [(ICQDaemonPersisted *)self _initWithAccountAltDSID:v7 error:v6];

  return v8;
}

- (id)_initWithAccountAltDSID:(id)a3 error:(id)a4
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ICQDaemonPersisted;
  id v8 = [(ICQDaemonPersisted *)&v20 init];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [(ICQDaemonPersisted *)v8 setRetrievalDate:v9];

    [(id)objc_opt_class() defaultCallbackInterval];
    -[ICQDaemonPersisted setCallbackInterval:](v8, "setCallbackInterval:");
    [(ICQDaemonPersisted *)v8 setAccountAltDSID:v6];
    uint64_t v10 = [(id)objc_opt_class() _placeholderPersistenceDictionary];
    [(ICQDaemonPersisted *)v8 setServerDictionary:v10];

    [(ICQDaemonPersisted *)v8 setFailedToFetchFromServer:1];
    if (v7)
    {
      v21[0] = @"ErrorDomain";
      uint64_t v11 = [v7 domain];
      int v12 = (void *)v11;
      if (v11) {
        objc_super v13 = (__CFString *)v11;
      }
      else {
        objc_super v13 = &stru_1F2DCE430;
      }
      v22[0] = v13;
      v21[1] = @"ErrorCode";
      __int16 v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "code"));
      v22[1] = v14;
      v21[2] = @"ErrorDescription";
      uint64_t v15 = [v7 localizedDescription];
      __int16 v16 = (void *)v15;
      if (v15) {
        v17 = (__CFString *)v15;
      }
      else {
        v17 = &stru_1F2DCE430;
      }
      v22[2] = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
      [(ICQDaemonPersisted *)v8 setFailureDetails:v18];
    }
  }

  return v8;
}

+ (NSMutableDictionary)_mutablePlaceholderPersistanceDictionary
{
  id v2 = (void *)[&unk_1F2DE0748 mutableCopy];
  return (NSMutableDictionary *)v2;
}

- (NSMutableDictionary)_mutablePersistenceDictionary
{
  v13[5] = *MEMORY[0x1E4F143B8];
  if (self->_retrievalDate && self->_serverDictionary)
  {
    v13[0] = self->_retrievalDate;
    v12[0] = @"retrievalDate";
    v12[1] = @"callbackInterval";
    uint64_t v3 = [NSNumber numberWithDouble:self->_callbackInterval];
    id v4 = (void *)v3;
    accountAltDSID = @"invalid";
    serverDictionary = self->_serverDictionary;
    if (self->_accountAltDSID) {
      accountAltDSID = (__CFString *)self->_accountAltDSID;
    }
    v13[1] = v3;
    v13[2] = accountAltDSID;
    v12[2] = @"altDSID";
    v12[3] = @"serverDict";
    v13[3] = serverDictionary;
    v12[4] = @"failedToFetchFromServer";
    id v7 = [NSNumber numberWithBool:self->_failedToFetchFromServer];
    v13[4] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];
    id v9 = (void *)[v8 mutableCopy];

    failureDetails = self->_failureDetails;
    if (failureDetails) {
      [v9 setObject:failureDetails forKeyedSubscript:@"failureDetails"];
    }
  }
  else
  {
    id v9 = 0;
  }
  return (NSMutableDictionary *)v9;
}

- (double)_callbackIntervalFromServerObject:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() defaultCallbackInterval];
  double v5 = v4;
  if (objc_opt_respondsToSelector())
  {
    [v3 doubleValue];
    if (fabs(v6) != INFINITY)
    {
      [v3 doubleValue];
      double v5 = 3600.0;
      if (v7 >= 3600.0)
      {
        double v5 = v7;
        if (v7 > 2592000.0) {
          double v5 = 2592000.0;
        }
      }
    }
  }

  return v5;
}

- (NSNumber)_cachedQuotaAvailable
{
  id v2 = [(ICQDaemonPersisted *)self serverDictionary];
  id v3 = [v2 objectForKeyedSubscript:@"quotaInfo"];
  double v4 = [v3 objectForKeyedSubscript:@"totalAvailable"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
    }
    else
    {
      uint64_t v5 = 0;
    }

    double v4 = (void *)v5;
  }
  return (NSNumber *)v4;
}

- (NSDate)retrievalDate
{
  return self->_retrievalDate;
}

- (void)setRetrievalDate:(id)a3
{
}

- (double)callbackInterval
{
  return self->_callbackInterval;
}

- (void)setCallbackInterval:(double)a3
{
  self->_callbackInterval = a3;
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (void)setAccountAltDSID:(id)a3
{
}

- (NSDictionary)serverDictionary
{
  return self->_serverDictionary;
}

- (void)setServerDictionary:(id)a3
{
}

- (BOOL)failedToFetchFromServer
{
  return self->_failedToFetchFromServer;
}

- (void)setFailedToFetchFromServer:(BOOL)a3
{
  self->_failedToFetchFromServer = a3;
}

- (NSDictionary)failureDetails
{
  return self->_failureDetails;
}

- (void)setFailureDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureDetails, 0);
  objc_storeStrong((id *)&self->_serverDictionary, 0);
  objc_storeStrong((id *)&self->_accountAltDSID, 0);
  objc_storeStrong((id *)&self->_retrievalDate, 0);
}

+ (NSDictionary)_placeholderPersistenceDictionary
{
  id v2 = [a1 _mutablePlaceholderPersistanceDictionary];
  id v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (NSDictionary)_persistenceDictionary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(ICQDaemonPersisted *)self _mutablePersistenceDictionary];
  double v4 = (void *)[v3 copy];

  int v5 = [MEMORY[0x1E4F28F98] propertyList:v4 isValidForFormat:200];
  double v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "validated persistence dictionary", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    if (v7)
    {
      int v14 = 138412290;
      uint64_t v15 = (uint64_t)v4;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "persistence dictionary is invalid: %@", (uint8_t *)&v14, 0xCu);
    }

    id v8 = objc_alloc((Class)objc_opt_class());
    id v9 = [(ICQDaemonPersisted *)self accountAltDSID];
    uint64_t v10 = (void *)[v8 _initWithAccountAltDSID:v9 error:0];
    uint64_t v11 = [v10 _mutablePersistenceDictionary];
    uint64_t v12 = [v11 copy];

    double v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      uint64_t v15 = v12;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "returning failure dictionary: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    double v4 = (void *)v12;
  }

  return (NSDictionary *)v4;
}

- (void)initWithDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D5851000, a2, OS_LOG_TYPE_DEBUG, "bad server dict %@", (uint8_t *)&v2, 0xCu);
}

@end