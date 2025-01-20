@interface CLAuthorizationDatabase
+ (BOOL)keyPath:(id)a3 sharesAuthWithKeyPath:(id)a4;
+ (id)authorizationDatabaseWithFilename:(id)a3 withDataProtectionClass:(int)a4;
- (BOOL)BOOLForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(BOOL)a5;
- (BOOL)_CLCommonIsBundleSystemService:(id)a3;
- (BOOL)_isBundlePathReachable:(id)a3;
- (BOOL)_isValidAuthLimitedKeyPath:(id)a3;
- (BOOL)_removeDictionaryAtKeyPath:(id)a3 shouldLog:(BOOL)a4;
- (BOOL)dictionaryExistsAtKeyPath:(id)a3;
- (BOOL)expensivelyGetIdentifyingInformation:(client_identifying_information *)a3 forClient:(id)a4;
- (BOOL)hasValueForKey:(id)a3 atKeyPath:(id)a4;
- (BOOL)isBundlePathRegisteredSystemService:(id)a3;
- (BOOL)isKeyPathRegisteredSystemService:(id)a3;
- (BOOL)migrateDictionaryAtKeyPath:(id)a3 toKeyPath:(id)a4 forceMigrationOnAuthCollision:(BOOL)a5;
- (BOOL)removeDictionaryAtKeyPath:(id)a3;
- (BOOL)setupDictionary:(id)a3 atKeyPath:(id)a4;
- (CLAuthorizationDatabase)initWithFilename:(id)a3 withDataProtectionClass:(int)a4;
- (NSArray)_getDefaultDeniedSystemServices;
- (NSMutableDictionary)alternateIdentitiesMap;
- (NSMutableDictionary)systemServicesMap;
- (double)doubleForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(double)a5;
- (float)floatForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(float)a5;
- (float)migrationVersionNumber;
- (id)_ckpToAccessGivenKey:(id)a3 andInputKeyPath:(id)a4;
- (id)_dictionaryForKey:(id)a3 atKeyPath:(id)a4;
- (id)_valueForKey:(id)a3 atKeyPath:(id)a4;
- (id)allUsers;
- (id)arrayForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5;
- (id)dataForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5;
- (id)dictionaryForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5;
- (id)getStateSummary;
- (id)getUsersODUUIDs;
- (id)primaryKeyPathForAuthLimitedKeyPath:(id)a3;
- (id)readonlyStoreAtKeyPath:(id)a3;
- (id)registerClient:(id)a3 fromAuthSync:(BOOL)a4;
- (id)registerSubIdentity:(id)a3 withType:(char)a4 forAnchorKeyPath:(id)a5;
- (id)registeredKeyPathForClientIdentifier:(id)a3;
- (id)stringForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5;
- (int)intForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(int)a5;
- (int64_t)longForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(int64_t)a5;
- (signed)shortForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(signed __int16)a5;
- (unint64_t)clientCount;
- (void)_cacheAlternativeIdentities;
- (void)_cacheSystemServicesMap;
- (void)_deriveAndCacheSystemServicesMap;
- (void)_internalMigrationClearUnknownKeys;
- (void)_internalMigrationLegacyKeys;
- (void)_internalMigrationRegisterAllClients;
- (void)_setUpDefaultDeniedSystemServices;
- (void)_setValue:(id)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)_setupSystemServiceDictionaries;
- (void)cacheInfoPlistKeysForClient:(id)a3;
- (void)clear;
- (void)completeMigration;
- (void)iterateAllAnchorKeyPathsWithBlock:(id)a3;
- (void)iterateIdentitiesRelatedToKeyPath:(id)a3 withBlock:(id)a4;
- (void)performFullSystemServiceSetup;
- (void)removeUser:(id)a3;
- (void)removeValueForKey:(id)a3 atKeyPath:(id)a4;
- (void)setAlternateIdentitiesMap:(id)a3;
- (void)setArray:(id)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setBool:(BOOL)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setData:(id)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setDictionary:(id)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setDouble:(double)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setFloat:(float)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setInt:(int)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setInternalKeyMigrationComplete;
- (void)setLong:(int64_t)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setMigrationVersionNumber;
- (void)setShort:(signed __int16)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setString:(id)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setSystemServicesMap:(id)a3;
@end

@implementation CLAuthorizationDatabase

- (id)dataForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5
{
  id v6 = [(CLAuthorizationDatabase *)self _valueForKey:a3 atKeyPath:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return a5;
  }
  id v7 = v6;

  return v7;
}

- (void)setInt:(int)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  v8 = +[NSNumber numberWithInt:*(void *)&a3];

  [(CLAuthorizationDatabase *)self _setValue:v8 forKey:a4 atKeyPath:a5];
}

- (void)setDictionary:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  v8 = +[NSDictionary dictionaryWithDictionary:a3];

  [(CLAuthorizationDatabase *)self _setValue:v8 forKey:a4 atKeyPath:a5];
}

- (id)dictionaryForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5
{
  id v6 = [(CLAuthorizationDatabase *)self _valueForKey:a3 atKeyPath:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return a5;
  }
  id v7 = v6;

  return v7;
}

- (void)iterateAllAnchorKeyPathsWithBlock:(id)a3
{
  id v4 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] allKeys];
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v9];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ![v11 objectForKeyedSubscript:@"AnchorKeyPath"]
          && ![v11 objectForKeyedSubscript:@"PrimaryKeyPath"]
          && ![v11 objectForKeyedSubscript:@"AuthLimitingKeyPath"])
        {
          (*((void (**)(id, CLClientKeyPath *, char *))a3 + 2))(a3, +[CLClientKeyPath clientKeyPathWithClientKey:v9], &v17);
          if (v17)
          {
            return;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
}

- (int)intForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(int)a5
{
  id v6 = [(CLAuthorizationDatabase *)self _valueForKey:a3 atKeyPath:a4];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a5;
  }

  return [v6 intValue];
}

- (BOOL)expensivelyGetIdentifyingInformation:(client_identifying_information *)a3 forClient:(id)a4
{
  sub_1000E1294((uint64_t *)v44, (uint64_t)"GetIdentifyingInformation", 0);
  if ([a4 executablePath])
  {
    char v6 = 0;
    goto LABEL_51;
  }
  v42 = 0;
  v43 = 0;
  if ([a4 bundleId])
  {
    id v7 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:objc_msgSend(a4, "bundleId") error:&v43];
  }
  else
  {
    if (![a4 bundlePath])
    {
      v8 = 0;
      goto LABEL_16;
    }
    id v7 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithURL:+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", objc_msgSend(a4, "bundlePath"), 1) error:&v43];
  }
  v8 = v7;
  if (v7)
  {
    id v9 = [[objc_msgSend(v7, "containingBundleRecord") bundleIdentifier];
    if (v9) {
      a3->id var0 = v9;
    }
    id v11 = [v8 containingBundleRecord];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    char v13 = 1;
    if (v12) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
LABEL_16:
  char v13 = 0;
LABEL_17:
  if (![a4 bundleId])
  {
    char v19 = 0;
    id v12 = 0;
    goto LABEL_35;
  }
  id v12 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:[a4 bundleId] allowPlaceholder:0 error:&v42];
  if (!v12)
  {
    char v19 = 0;
    goto LABEL_35;
  }
LABEL_19:
  a3->id var0 = [v12 bundleIdentifier];
  if ([v12 URL]) {
    a3->id var1 = [v12 URL].path;
  }
  if ([v12 executableURL]) {
    a3->id var2 = [[[v12 executableURL] path];
  }
  a3->BOOL var5 = [v12 appClipMetadata] != 0;
  id v14 = [v12 applicationExtensionRecords];
  if (v14)
  {
    id v15 = +[NSMutableArray array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v16 = [v14 countByEnumeratingWithState:&v38 objects:v63 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v39;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          [v15 addObject:[*(id *)(*((void *)&v38 + 1) + 8 * i) effectiveBundleIdentifier]];
        }
        id v16 = [v14 countByEnumeratingWithState:&v38 objects:v63 count:16];
      }
      while (v16);
    }
    a3->id var4 = v15;
  }
  char v19 = 1;
LABEL_35:
  if ([a4 bundleId] && !a3->var0)
  {
    a3->id var0 = [a4 bundleId];
  }
  else if ([a4 bundlePath] && !a3->var1)
  {
    a3->id var1 = [a4 bundlePath];
  }
  char v6 = v19 | v13;
  if (v6)
  {
    id v20 = a3->var0;
    id v21 = a3->var1;
    id v22 = a3->var2;
    id v23 = a3->var4;
    id v24 = a3->var3;

    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    uint64_t v25 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
    {
      id var0 = a3->var0;
      id var1 = a3->var1;
      id var2 = a3->var2;
      id var3 = a3->var3;
      id var4 = a3->var4;
      BOOL var5 = a3->var5;
      *(_DWORD *)buf = 68290818;
      __int16 v47 = 2082;
      int v46 = 0;
      v48 = "";
      __int16 v49 = 2114;
      id v50 = a4;
      __int16 v51 = 2114;
      id v52 = var0;
      __int16 v53 = 2114;
      id v54 = var1;
      __int16 v55 = 2114;
      id v56 = var2;
      __int16 v57 = 2114;
      id v58 = var3;
      __int16 v59 = 2114;
      id v60 = var4;
      __int16 v61 = 1026;
      BOOL v62 = var5;
      v32 = "{\"msg%{public}.0s\":\"#GetIdentifyingInfo found identifying information for client\", \"ClientKeyPath\":%{p"
            "ublic, location:escape_only}@, \"bundleId\":%{public, location:escape_only}@, \"bundlePath\":%{public, locat"
            "ion:escape_only}@, \"executablePath\":%{public, location:escape_only}@, \"platformSpecificBundleId\":%{publi"
            "c, location:escape_only}@, \"pluginBundleIds\":%{public, location:escape_only}@, \"isAppClip\":%{public}hhd}";
      v33 = v25;
      os_log_type_t v34 = OS_LOG_TYPE_DEBUG;
      uint32_t v35 = 84;
LABEL_50:
      _os_log_impl((void *)&_mh_execute_header, v33, v34, v32, buf, v35);
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    uint64_t v36 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68290050;
      int v46 = 0;
      __int16 v47 = 2082;
      v48 = "";
      __int16 v49 = 2114;
      id v50 = a4;
      __int16 v51 = 2114;
      id v52 = v43;
      __int16 v53 = 2114;
      id v54 = v42;
      __int16 v55 = 2114;
      id v56 = 0;
      v32 = "{\"msg%{public}.0s\":\"#GetIdentifyingInfo LaunchServices does not have an application record for client\", "
            "\"ClientKeyPath\":%{public, location:escape_only}@, \"extensionRecordError\":%{public, location:escape_only}"
            "@, \"applicationRecordError\":%{public, location:escape_only}@, \"companionAppRecordError\":%{public, locati"
            "on:escape_only}@}";
      v33 = v36;
      os_log_type_t v34 = OS_LOG_TYPE_INFO;
      uint32_t v35 = 58;
      goto LABEL_50;
    }
  }
LABEL_51:
  sub_1000E1098(v44);
  return v6;
}

- (void)removeValueForKey:(id)a3 atKeyPath:(id)a4
{
  id v6 = [(CLAuthorizationDatabase *)self _dictionaryForKey:a3 atKeyPath:a4];
  if (v6)
  {
    [v6 removeObjectForKey:a3];
    [(CLPersistentDictionary *)self markModifiedDirty];
  }
}

- (BOOL)hasValueForKey:(id)a3 atKeyPath:(id)a4
{
  return [[-[CLAuthorizationDatabase _dictionaryForKey:atKeyPath:](self, "_dictionaryForKey:atKeyPath:", a3, a4) objectForKeyedSubscript:a3] != 0;
}

- (double)doubleForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(double)a5
{
  id v6 = [(CLAuthorizationDatabase *)self _valueForKey:a3 atKeyPath:a4];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a5;
  }

  [v6 doubleValue];
  return result;
}

- (BOOL)BOOLForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(BOOL)a5
{
  id v6 = [(CLAuthorizationDatabase *)self _valueForKey:a3 atKeyPath:a4];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a5;
  }

  return [v6 BOOLValue];
}

- (void)_setValue:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  if (a3)
  {
    id v8 = [(CLAuthorizationDatabase *)self _dictionaryForKey:a4 atKeyPath:a5];
    if (v8)
    {
      id v9 = v8;
      if ((objc_msgSend(a3, "isEqual:", objc_msgSend(v8, "objectForKeyedSubscript:", a4)) & 1) == 0)
      {
        [v9 setObject:a3 forKeyedSubscript:a4];
        [(CLPersistentDictionary *)self markModifiedDirty];
      }
    }
  }
}

- (void)setDouble:(double)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  id v8 = +[NSNumber numberWithDouble:a3];

  [(CLAuthorizationDatabase *)self _setValue:v8 forKey:a4 atKeyPath:a5];
}

- (void)iterateIdentitiesRelatedToKeyPath:(id)a3 withBlock:(id)a4
{
  if ([a3 isAuthLimited])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    id v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289282;
      __int16 v22 = 2082;
      id v23 = "";
      __int16 v24 = 2114;
      id v25 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning iterateIdentitiesRelatedToKeyPath passed auth limited keyPath\", \"keyPath\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  else
  {
    id v8 = [a3 anchorKeyPath];
    if ([(CLAuthorizationDatabase *)self dictionaryExistsAtKeyPath:v8])
    {
      (*((void (**)(id, id))a4 + 2))(a4, v8);
      id v9 = [(CLAuthorizationDatabase *)self arrayForKey:@"SubIdentities" atKeyPath:v8 defaultValue:0];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            (*((void (**)(id, CLClientKeyPath *))a4 + 2))(a4, +[CLClientKeyPath clientKeyPathWithClientKey:v14]);
          }
          id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v11);
      }
    }
  }
}

- (id)arrayForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5
{
  id v6 = [(CLAuthorizationDatabase *)self _valueForKey:a3 atKeyPath:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return a5;
  }
  id v7 = v6;

  return v7;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  id v8 = +[NSNumber numberWithBool:a3];

  [(CLAuthorizationDatabase *)self _setValue:v8 forKey:a4 atKeyPath:a5];
}

- (void)setArray:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  id v8 = +[NSArray arrayWithArray:a3];

  [(CLAuthorizationDatabase *)self _setValue:v8 forKey:a4 atKeyPath:a5];
}

- (id)_valueForKey:(id)a3 atKeyPath:(id)a4
{
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  id v8 = [(CLAuthorizationDatabase *)self _ckpToAccessGivenKey:a3 andInputKeyPath:a4];
  if ([v8 isValidCKP]) {
    id v9 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", [v8 clientKey]);
  }
  else {
    id v9 = (id)qword_102484F98;
  }
  id v10 = [v9 objectForKeyedSubscript:a3];

  return v10;
}

- (id)_dictionaryForKey:(id)a3 atKeyPath:(id)a4
{
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  id v8 = [(CLAuthorizationDatabase *)self _ckpToAccessGivenKey:a3 andInputKeyPath:a4];
  if ([v8 isValidCKP]) {
    id v9 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", [v8 clientKey]);
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)registeredKeyPathForClientIdentifier:(id)a3
{
  id v3 = a3;
  if ([a3 isValidCKP])
  {
    id v5 = [v3 clientAnchor];
    id v6 = [v3 subIdentityId];
    if ([(CLAuthorizationDatabase *)self dictionaryExistsAtKeyPath:v3]) {
      return v3;
    }
    if ([v3 isAuthLimited])
    {
      if (![(CLAuthorizationDatabase *)self _isValidAuthLimitedKeyPath:v3])
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230DA40);
        }
        id v7 = qword_102419538;
        if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
          return +[CLClientKeyPath nullClientKeyPath];
        }
        uint64_t v14 = 68289282;
        *(_WORD *)id v15 = 2082;
        *(void *)&v15[2] = "";
        *(_WORD *)&v15[10] = 2114;
        *(void *)&v15[12] = v3;
        id v8 = "{\"msg%{public}.0s\":\"#Warning #ClientResolution the passed value is an invalid auth-limited identity. Res"
             "olving to #nullCKP\", \"InputCKP\":%{public, location:escape_only}@}";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0x1Cu);
        return +[CLClientKeyPath nullClientKeyPath];
      }
      return v3;
    }
    if ([(NSMutableDictionary *)[(CLAuthorizationDatabase *)self systemServicesMap] objectForKeyedSubscript:v6]|| [(NSMutableDictionary *)[(CLAuthorizationDatabase *)self systemServicesMap] objectForKeyedSubscript:v5])
    {
      id v10 = [(NSMutableDictionary *)[(CLAuthorizationDatabase *)self systemServicesMap] objectForKeyedSubscript:v6];
      id v11 = [(CLAuthorizationDatabase *)self systemServicesMap];
      if (v10)
      {
        id v12 = v6;
LABEL_27:
        id v13 = [(NSMutableDictionary *)v11 objectForKeyedSubscript:v12];
        return v13;
      }
    }
    else
    {
      if (v6)
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230DA40);
        }
        id v7 = qword_102419538;
        if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
          return +[CLClientKeyPath nullClientKeyPath];
        }
        uint64_t v14 = 68289282;
        *(_WORD *)id v15 = 2082;
        *(void *)&v15[2] = "";
        *(_WORD *)&v15[10] = 2114;
        *(void *)&v15[12] = v3;
        id v8 = "{\"msg%{public}.0s\":\"#Warning #ClientResolution the passed keyPath is an unregistered subIdentity. Resolv"
             "ing to #nullCKP\", \"InputCKP\":%{public, location:escape_only}@}";
        goto LABEL_9;
      }
      if (![(NSMutableDictionary *)[(CLAuthorizationDatabase *)self alternateIdentitiesMap] objectForKeyedSubscript:v5])
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230DA40);
        }
        id v7 = qword_102419538;
        if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
          return +[CLClientKeyPath nullClientKeyPath];
        }
        uint64_t v14 = 68289282;
        *(_WORD *)id v15 = 2082;
        *(void *)&v15[2] = "";
        *(_WORD *)&v15[10] = 2114;
        *(void *)&v15[12] = v3;
        id v8 = "{\"msg%{public}.0s\":\"#Warning #ClientResolution the passed keyPath is not registered. Resolving to #nullC"
             "KP\", \"InputCKP\":%{public, location:escape_only}@}";
        goto LABEL_9;
      }
      id v11 = [(CLAuthorizationDatabase *)self alternateIdentitiesMap];
    }
    id v12 = v5;
    goto LABEL_27;
  }

  return +[CLClientKeyPath nullClientKeyPath];
}

- (id)_ckpToAccessGivenKey:(id)a3 andInputKeyPath:(id)a4
{
  id v4 = a4;
  id v7 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", [a4 clientKey]);
  if (([v4 isValidCKP] & 1) == 0)
  {
LABEL_8:
    return +[CLClientKeyPath nullClientKeyPath];
  }
  if ([v4 isAuthLimited])
  {
    if ([(CLAuthorizationDatabase *)self _isValidAuthLimitedKeyPath:v4])
    {
      if ([(id)qword_102484F88 containsObject:a3])
      {
        return [v4 limitingCKP];
      }
      else
      {
        id v11 = [(CLAuthorizationDatabase *)self systemServicesMap];
        id v12 = [v4 nestedBundlePath];
        return [(NSMutableDictionary *)v11 objectForKeyedSubscript:v12];
      }
    }
    goto LABEL_8;
  }
  if (!v7)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    id v10 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 68289538;
      v13[1] = 0;
      __int16 v14 = 2082;
      id v15 = "";
      __int16 v16 = 2114;
      id v17 = a3;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning accessing unknown or null client in CLAuthorizationDatabase. No-op'ing\", \"key\":%{public, location:escape_only}@, \"keyPath\":%{public, location:escape_only}@}", (uint8_t *)v13, 0x26u);
    }
    return +[CLClientKeyPath nullClientKeyPath];
  }
  if (![v4 isAuthSharingSubIdentity]
    || ![(id)qword_102484F90 containsObject:a3])
  {
    return v4;
  }
  id v9 = [[-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(v4, "clientKey")) objectForKeyedSubscript:@"AnchorKeyPath"];

  return +[CLClientKeyPath clientKeyPathWithClientKey:v9];
}

+ (BOOL)keyPath:(id)a3 sharesAuthWithKeyPath:(id)a4
{
  id v4 = a4;
  id v5 = a3;
  if ([a3 isEqual:a4])
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  unsigned int v7 = [v5 isAuthSharingSubIdentity];
  unsigned int v6 = [v4 isAuthSharingSubIdentity];
  if (v7 && v6)
  {
    id v5 = [v5 anchorKeyPath];
LABEL_10:
    id v4 = [v4 anchorKeyPath];
    goto LABEL_11;
  }
  if (!v7)
  {
    if (!v6) {
      return v6;
    }
    goto LABEL_10;
  }
  id v5 = [v5 anchorKeyPath];
LABEL_11:

  LOBYTE(v6) = [v5 isEqual:v4];
  return v6;
}

- (BOOL)dictionaryExistsAtKeyPath:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  if (a3 && _os_feature_enabled_impl() && ![a3 userName])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    id v8 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68290051;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 2114;
      id v16 = [a3 userName];
      __int16 v17 = 2114;
      id v18 = a3;
      __int16 v19 = 2082;
      id v20 = "assert";
      __int16 v21 = 2081;
      __int16 v22 = "(!keyPath || (!_os_feature_enabled_impl(\"CoreLocation\", \"cl_pula\") || keyPath.userName))";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula enabled.\", \"userName\":%{public, location:escape_only}@, \"ClientKeyPath\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230DA40);
      }
    }
    id v9 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      id v10 = [a3 userName];
      *(_DWORD *)uint64_t buf = 68290051;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 2114;
      id v16 = v10;
      __int16 v17 = 2114;
      id v18 = a3;
      __int16 v19 = 2082;
      id v20 = "assert";
      __int16 v21 = 2081;
      __int16 v22 = "(!keyPath || (!_os_feature_enabled_impl(\"CoreLocation\", \"cl_pula\") || keyPath.userName))";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula enabled.", "{\"msg%{public}.0s\":\"#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula enabled.\", \"userName\":%{public, location:escape_only}@, \"ClientKeyPath\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230DA40);
      }
    }
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO)) {
      sub_101A9FD70((uint64_t)[a3 userName], (uint64_t)a3, (uint64_t)buf);
    }
    abort_report_np();
    __break(1u);
  }
  id v6 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", [a3 clientKey]);

  return v6 != 0;
}

- (id)readonlyStoreAtKeyPath:(id)a3
{
  if (a3 && _os_feature_enabled_impl() && ![a3 userName]) {
    sub_101A9FDD0(a3);
  }
  id v5 = (NSMutableDictionary *)-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", [a3 clientKey]);
  if ([a3 isAuthLimited]
    && [(CLAuthorizationDatabase *)self _isValidAuthLimitedKeyPath:a3])
  {
    id v6 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", [a3 nestedBundlePath]);
    id v7 = [a3 limitingCKP];
    id result = 0;
    if (v6 && v7)
    {
      id v5 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", [v6 clientKey]));
      if ([v6 isAuthSharingSubIdentity])
      {
        id v9 = [[-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(v6, "clientKey")) objectForKeyedSubscript:@"AnchorKeyPath"];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v10 = (void *)qword_102484F90;
        id v11 = [(id)qword_102484F90 countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v36;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v36 != v13) {
                objc_enumerationMutation(v10);
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", [v35 objectForKeyedSubscript:v9], [v35 objectForKeyedSubscript:v9]);
            }
            id v12 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
          }
          while (v12);
        }
      }
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      __int16 v15 = (void *)qword_102484F88;
      id v16 = [(id)qword_102484F88 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v32;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v32 != v18) {
              objc_enumerationMutation(v15);
            }
            [-[NSMutableDictionary setObject:forKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(v7, "clientKey")), "objectForKeyedSubscript:", *(void *)(*((void *)&v31 + 1) + 8 * (void)j)), *(void *)(*((void *)&v31 + 1) + 8 * (void)j));
          }
          id v17 = [v15 countByEnumeratingWithState:&v31 objects:v40 count:16];
        }
        while (v17);
      }
      return +[CLKeyValueStore storeWithDictionary:v5];
    }
  }
  else
  {
    if (v5)
    {
      if ([a3 isAuthSharingSubIdentity])
      {
        id v20 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:@"AnchorKeyPath"];
        id v5 = +[NSMutableDictionary dictionaryWithDictionary:v5];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        __int16 v21 = (void *)qword_102484F90;
        id v22 = [(id)qword_102484F90 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v28;
          do
          {
            for (k = 0; k != v23; k = (char *)k + 1)
            {
              if (*(void *)v28 != v24) {
                objc_enumerationMutation(v21);
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", [v27 objectForKeyedSubscript:k]);
            }
            id v23 = [v21 countByEnumeratingWithState:&v27 objects:v39 count:16];
          }
          while (v23);
        }
      }
      return +[CLKeyValueStore storeWithDictionary:v5];
    }
    uint64_t v26 = qword_102484F98;
    return +[CLKeyValueStore storeWithDictionary:v26];
  }
  return result;
}

- (BOOL)_isValidAuthLimitedKeyPath:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", [a3 nestedBundlePath]);
  if (v5)
  {
    id v6 = [a3 limitingCKP];
    LOBYTE(v5) = [(CLAuthorizationDatabase *)self dictionaryExistsAtKeyPath:v6];
  }
  return (char)v5;
}

- (BOOL)isKeyPathRegisteredSystemService:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  if (([a3 isValidCKP] & 1) != 0 && (id v6 = objc_msgSend(a3, "bundlePath")) != 0)
  {
    id v7 = [a3 subIdentityId];
    id v8 = [(NSMutableDictionary *)[(CLAuthorizationDatabase *)self systemServicesMap] objectForKeyedSubscript:v6];
    id v9 = [(NSMutableDictionary *)[(CLAuthorizationDatabase *)self systemServicesMap] objectForKeyedSubscript:v7];
    if (v7) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    BOOL v12 = !v10 && v8 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (NSMutableDictionary)systemServicesMap
{
  return self->_systemServicesMap;
}

- (id)primaryKeyPathForAuthLimitedKeyPath:(id)a3
{
  if (!-[CLAuthorizationDatabase _isValidAuthLimitedKeyPath:](self, "_isValidAuthLimitedKeyPath:")
    || (id result = -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", [a3 nestedBundlePath])) == 0)
  {
    return +[CLClientKeyPath nullClientKeyPath];
  }
  return result;
}

- (NSMutableDictionary)alternateIdentitiesMap
{
  return self->_alternateIdentitiesMap;
}

- (NSArray)_getDefaultDeniedSystemServices
{
  CFStringRef v1 = @"/System/Library/LocationBundles/AppGenius.bundle";
  return +[NSArray arrayWithObjects:&v1 count:1];
}

+ (id)authorizationDatabaseWithFilename:(id)a3 withDataProtectionClass:(int)a4
{
  id v4 = [objc_alloc((Class)a1) initWithFilename:a3 withDataProtectionClass:*(void *)&a4];

  return v4;
}

- (CLAuthorizationDatabase)initWithFilename:(id)a3 withDataProtectionClass:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (qword_102484F80 != -1) {
    dispatch_once(&qword_102484F80, &stru_10230DA20);
  }
  v10.receiver = self;
  v10.super_class = (Class)CLAuthorizationDatabase;
  id v7 = [(CLPersistentDictionary *)&v10 initWithFilename:a3 withDataProtectionClass:v4];
  if ([(NSMutableDictionary *)[(CLPersistentDictionary *)v7 underlyingDictionary] objectForKeyedSubscript:@"MigrationVersionNumber"])
  {
    [(CLAuthorizationDatabase *)v7 _internalMigrationClearUnknownKeys];
  }
  else
  {
    [(CLAuthorizationDatabase *)v7 _internalMigrationLegacyKeys];
    [(CLAuthorizationDatabase *)v7 setInternalKeyMigrationComplete];
    [(CLPersistentDictionary *)v7 persist];
  }
  [(CLAuthorizationDatabase *)v7 migrationVersionNumber];
  if (v8 < 15.0) {
    [(CLAuthorizationDatabase *)v7 _internalMigrationRegisterAllClients];
  }
  [(CLAuthorizationDatabase *)v7 _cacheSystemServicesMap];
  [(CLAuthorizationDatabase *)v7 _cacheAlternativeIdentities];
  return v7;
}

- (float)migrationVersionNumber
{
  id v2 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:@"MigrationVersionNumber"];

  [v2 floatValue];
  return result;
}

- (void)setInternalKeyMigrationComplete
{
  id v2 = [(CLPersistentDictionary *)self underlyingDictionary];

  [(NSMutableDictionary *)v2 setObject:&off_102393A28 forKeyedSubscript:@"MigrationVersionNumber"];
}

- (void)setMigrationVersionNumber
{
  LODWORD(v2) = 1097859072;
  uint64_t v4 = +[NSNumber numberWithFloat:v2];
  id v5 = [(CLPersistentDictionary *)self underlyingDictionary];

  [(NSMutableDictionary *)v5 setObject:v4 forKeyedSubscript:@"MigrationVersionNumber"];
}

- (void)completeMigration
{
  [(CLAuthorizationDatabase *)self setMigrationVersionNumber];

  [(CLPersistentDictionary *)self persist];
}

- (void)clear
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10230DA40);
  }
  id v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#AuthorizationDatabaseDroppingData Clearing entire database", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    __int16 v6 = 0;
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAuthorizationDatabase clear]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CLAuthorizationDatabase;
  [(CLPersistentDictionary *)&v5 clear];
  [(CLAuthorizationDatabase *)self setAlternateIdentitiesMap:+[NSMutableDictionary dictionary]];
  [(CLAuthorizationDatabase *)self setSystemServicesMap:+[NSMutableDictionary dictionary]];
  [(CLAuthorizationDatabase *)self setMigrationVersionNumber];
  [(CLPersistentDictionary *)self markModifiedDirty];
  [(CLPersistentDictionary *)self persist];
}

- (BOOL)setupDictionary:(id)a3 atKeyPath:(id)a4
{
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  if (a4 && _os_feature_enabled_impl() && ![a4 userName])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    uint64_t v13 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68290051;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2114;
      id v21 = [a4 userName];
      __int16 v22 = 2114;
      id v23 = a4;
      __int16 v24 = 2082;
      id v25 = "assert";
      __int16 v26 = 2081;
      long long v27 = "(!keyPath || (!_os_feature_enabled_impl(\"CoreLocation\", \"cl_pula\") || keyPath.userName))";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula enabled.\", \"userName\":%{public, location:escape_only}@, \"ClientKeyPath\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230DA40);
      }
    }
    __int16 v14 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      id v15 = [a4 userName];
      *(_DWORD *)uint64_t buf = 68290051;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2114;
      id v21 = v15;
      __int16 v22 = 2114;
      id v23 = a4;
      __int16 v24 = 2082;
      id v25 = "assert";
      __int16 v26 = 2081;
      long long v27 = "(!keyPath || (!_os_feature_enabled_impl(\"CoreLocation\", \"cl_pula\") || keyPath.userName))";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula enabled.", "{\"msg%{public}.0s\":\"#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula enabled.\", \"userName\":%{public, location:escape_only}@, \"ClientKeyPath\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230DA40);
      }
    }
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO)) {
      sub_101A9FD70((uint64_t)[a4 userName], (uint64_t)a4, (uint64_t)buf);
    }
    abort_report_np();
    __break(1u);
  }
  if (![a4 isValidCKP]
    || ([a4 isAuthLimited] & 1) != 0
    || -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", [a4 clientKey]))
  {
    BOOL v8 = 0;
  }
  else
  {
    objc_super v10 = +[NSMutableDictionary dictionaryWithDictionary:a3];
    if ([a4 subIdentityId])
    {
      id v11 = [objc_msgSend(a4, "anchorKeyPath") clientKey];
      if (![(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v11])[(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] setObject:+[NSMutableDictionary dictionary] forKeyedSubscript:v11]; {
      id v12 = [[-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v11) objectForKeyedSubscript:@"SubIdentities"];
      }
      if (!v12)
      {
        [(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v11)) setObject:+[NSMutableArray array](NSMutableArray, "array") forKeyedSubscript:@"SubIdentities"];
        id v12 = [[-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v11) objectForKeyedSubscript:@"SubIdentities"];
      }
      [v12 addObject:[a4 clientKey]];
      [(NSMutableDictionary *)v10 setObject:v11 forKeyedSubscript:@"AnchorKeyPath"];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "setObject:forKeyedSubscript:", v10, [a4 clientKey]);
    [(CLPersistentDictionary *)self markModifiedDirty];
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)removeDictionaryAtKeyPath:(id)a3
{
  return [(CLAuthorizationDatabase *)self _removeDictionaryAtKeyPath:a3 shouldLog:1];
}

- (BOOL)_removeDictionaryAtKeyPath:(id)a3 shouldLog:(BOOL)a4
{
  BOOL v4 = a4;
  id v33 = objc_alloc_init((Class)NSAutoreleasePool);
  if (a3 && _os_feature_enabled_impl() && ![a3 userName])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    long long v29 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      uint64_t buf = 68290051;
      __int16 v45 = 2082;
      int v46 = "";
      __int16 v47 = 2114;
      id v48 = [a3 userName];
      __int16 v49 = 2114;
      id v50 = a3;
      __int16 v51 = 2082;
      id v52 = "assert";
      __int16 v53 = 2081;
      id v54 = "(!keyPath || (!_os_feature_enabled_impl(\"CoreLocation\", \"cl_pula\") || keyPath.userName))";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula enabled.\", \"userName\":%{public, location:escape_only}@, \"ClientKeyPath\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x3Au);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230DA40);
      }
    }
    long long v30 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      id v31 = [a3 userName];
      uint64_t buf = 68290051;
      __int16 v45 = 2082;
      int v46 = "";
      __int16 v47 = 2114;
      id v48 = v31;
      __int16 v49 = 2114;
      id v50 = a3;
      __int16 v51 = 2082;
      id v52 = "assert";
      __int16 v53 = 2081;
      id v54 = "(!keyPath || (!_os_feature_enabled_impl(\"CoreLocation\", \"cl_pula\") || keyPath.userName))";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula enabled.", "{\"msg%{public}.0s\":\"#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula enabled.\", \"userName\":%{public, location:escape_only}@, \"ClientKeyPath\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x3Au);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230DA40);
      }
    }
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO)) {
      sub_101A9FD70((uint64_t)[a3 userName], (uint64_t)a3, (uint64_t)&buf);
    }
    abort_report_np();
    __break(1u);
LABEL_61:
    dispatch_once(&qword_102419530, &stru_10230DA40);
LABEL_27:
    __int16 v18 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      uint64_t buf = 68289282;
      __int16 v45 = 2082;
      int v46 = "";
      __int16 v47 = 2114;
      id v48 = a3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Attempting to remove System Service from #AuthDatabase! Refusing removal.\", \"System Service\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230DA40);
      }
    }
    __int16 v19 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      uint64_t buf = 68289282;
      __int16 v45 = 2082;
      int v46 = "";
      __int16 v47 = 2114;
      id v48 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Attempting to remove System Service from #AuthDatabase! Refusing removal.", "{\"msg%{public}.0s\":\"Attempting to remove System Service from #AuthDatabase! Refusing removal.\", \"System Service\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
    goto LABEL_32;
  }
  id v7 = [a3 clientKey];
  if (![(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v7])
  {
LABEL_32:
    BOOL v20 = 0;
    goto LABEL_49;
  }
  if ([a3 bundlePath])
  {
    unsigned int v8 = [objc_msgSend(objc_msgSend(a3, "bundlePath"), "isEqualToString:", objc_msgSend(objc_msgSend(a3, "bundlePath"), "stringByResolvingSymlinksInPath")) ^ 1];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    id v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289538;
      __int16 v45 = 2082;
      int v46 = "";
      __int16 v47 = 2114;
      id v48 = a3;
      __int16 v49 = 2114;
      id v50 = [a3 bundlePath];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthDatabase bundle path is a symlink, so it can be removed\", \"keyPath\":%{public, location:escape_only}@, \"bundlePath\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
    }
  }
  else
  {
    unsigned int v8 = 0;
  }
  if (((![(CLAuthorizationDatabase *)self BOOLForKey:@"isSystemService" atKeyPath:a3 defaultValue:0] | v8) & 1) == 0)
  {
    if (qword_102419530 == -1) {
      goto LABEL_27;
    }
    goto LABEL_61;
  }
  id v10 = [[-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v7) objectForKeyedSubscript:@"SubIdentities"];
  id v11 = [[-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v7) objectForKeyedSubscript:@"AnchorKeyPath"];
  id v32 = v7;
  if (v10)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v12 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v39;
      do
      {
        __int16 v14 = 0;
        do
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v14);
          if (v4)
          {
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
            id v16 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v15];
              uint64_t buf = 68289538;
              __int16 v45 = 2082;
              int v46 = "";
              __int16 v47 = 2114;
              id v48 = v15;
              __int16 v49 = 2114;
              id v50 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabaseDroppingData Removing dictionary for key\", \"Key\":%{public, location:escape_only}@, \"Dictionary\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
            }
          }
          [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] removeObjectForKey:v15];
          __int16 v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v21 = v11;
    if (v11
      && objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v11), "objectForKeyedSubscript:", @"SubIdentities"))
    {
      [objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v21), "objectForKeyedSubscript:", @"SubIdentities") removeObject:v7];
    }
  }
  id v22 = [[-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v32) objectForKeyedSubscript:@"PluginBundleIds"];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v23 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v35;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v22);
        }
        [(NSMutableDictionary *)[(CLAuthorizationDatabase *)self alternateIdentitiesMap] removeObjectForKey:*(void *)(*((void *)&v34 + 1) + 8 * i)];
      }
      id v23 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v23);
  }
  if (v4)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    __int16 v26 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v32];
      uint64_t buf = 68289538;
      __int16 v45 = 2082;
      int v46 = "";
      __int16 v47 = 2114;
      id v48 = v32;
      __int16 v49 = 2114;
      id v50 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabaseDroppingData Removing dictionary for key\", \"Key\":%{public, location:escape_only}@, \"Dictionary\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
    }
  }
  [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] removeObjectForKey:v32];
  [(CLPersistentDictionary *)self markModifiedDirty];
  BOOL v20 = 1;
LABEL_49:

  return v20;
}

- (unint64_t)clientCount
{
  return (unint64_t)[(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] count]- 1;
}

- (void)cacheInfoPlistKeysForClient:(id)a3
{
  objc_super v5 = (__CFBundle *)sub_10120A238([(CLAuthorizationDatabase *)self stringForKey:@"PlatformSpecificBundleId" atKeyPath:a3 defaultValue:0], [(CLAuthorizationDatabase *)self stringForKey:@"BundleId" atKeyPath:a3 defaultValue:0], (const __CFString *)[(CLAuthorizationDatabase *)self stringForKey:@"BundlePath" atKeyPath:a3 defaultValue:0], 0);
  if (v5)
  {
    __int16 v6 = v5;
    v8[0] = @"NSLocationDefaultAccuracyReduced";
    v8[1] = @"NSLocationRequireExplicitServiceSession";
    v8[2] = @"CLDisableAuthorizationRequests";
    id v7 = sub_101209F38(v5, +[NSArray arrayWithObjects:v8 count:3]);
    if ([objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", @"NSLocationDefaultAccuracyReduced"), "BOOLValue"])-[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, @"DefaultAccuracyReduced", a3); {
    if ([objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", @"NSLocationRequireExplicitServiceSession"), "BOOLValue"])-[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, @"ExplicitServiceSession", a3);
    }
    if ([objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", @"CLDisableAuthorizationRequests"), "BOOLValue"])-[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, @"AuthRequestsDisabled", a3)) {
    CFRelease(v6);
    }
  }
}

- (id)registerClient:(id)a3 fromAuthSync:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (![a3 isValidCKP] || objc_msgSend(v5, "subIdentityId"))
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    id v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#Warning #RegisterClientKeyPath passed in un-registerable client. Returning #nullCKP.", (uint8_t *)&buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230DA40);
      }
      *(_WORD *)__int16 v49 = 0;
      v42 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAuthorizationDatabase registerClient:fromAuthSync:]", "%s\n", v42);
      if (v42 != (char *)&buf) {
        free(v42);
      }
    }
    return +[CLClientKeyPath nullClientKeyPath];
  }
  if ([(CLAuthorizationDatabase *)self isKeyPathRegisteredSystemService:v5]) {
    return v5;
  }
  if (![v5 isAuthLimited])
  {
    id v19 = [v5 bundlePath];
    id v20 = [v5 executablePath];
    id v21 = v20;
    uint64_t buf = 0;
    memset(&buf_8[16], 0, 17);
    *(void *)buf_8 = v19;
    *(void *)&buf_8[8] = v20;
    if (v19)
    {
      unsigned __int8 v22 = [(CLAuthorizationDatabase *)self _CLCommonIsBundleSystemService:v19];
      if (!v21)
      {
        if (v22)
        {
          int v43 = 1;
          goto LABEL_42;
        }
        [(CLAuthorizationDatabase *)self expensivelyGetIdentifyingInformation:&buf forClient:v5];
        if ([(CLAuthorizationDatabase *)self _isBundlePathReachable:v19])
        {
LABEL_41:
          int v43 = 0;
LABEL_42:
          if ([v5 bundleId]
            && (id v27 = [v5 bundleId], (objc_msgSend(v27, "isEqual:", buf) & 1) == 0))
          {
            id v29 = [v5 userName];
            long long v28 = +[CLClientKeyPath clientKeyPathWithUserName:v29 clientAnchor:buf anchorType:105];
          }
          else
          {
            long long v28 = (CLClientKeyPath *)[v5 anchorKeyPath];
          }
          long long v30 = v28;
          unsigned __int8 v31 = [(CLAuthorizationDatabase *)self dictionaryExistsAtKeyPath:v28];
          [(CLAuthorizationDatabase *)self setupDictionary:&__NSDictionary0__struct atKeyPath:v30];
          [(CLAuthorizationDatabase *)self setString:buf forKey:@"BundleId" atKeyPath:v30];
          [(CLAuthorizationDatabase *)self setString:*(void *)buf_8 forKey:@"BundlePath" atKeyPath:v30];
          [(CLAuthorizationDatabase *)self setString:*(void *)&buf_8[8] forKey:@"Executable" atKeyPath:v30];
          if (buf_8[32]) {
            [(CLAuthorizationDatabase *)self setBool:1 forKey:@"IsAppClip" atKeyPath:v30];
          }
          if (*(void *)&buf_8[24])
          {
            [(CLAuthorizationDatabase *)self setArray:*(void *)&buf_8[24] forKey:@"PluginBundleIds" atKeyPath:v30];
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v32 = *(void **)&buf_8[24];
            id v33 = [*(id *)&buf_8[24] countByEnumeratingWithState:&v44 objects:v48 count:16];
            if (v33)
            {
              id v34 = v33;
              uint64_t v35 = *(void *)v45;
              do
              {
                for (i = 0; i != v34; i = (char *)i + 1)
                {
                  if (*(void *)v45 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  [(NSMutableDictionary *)[(CLAuthorizationDatabase *)self alternateIdentitiesMap] setObject:v30 forKeyedSubscript:*(void *)(*((void *)&v44 + 1) + 8 * i)];
                }
                id v34 = [v32 countByEnumeratingWithState:&v44 objects:v48 count:16];
              }
              while (v34);
            }
          }
          if ((v31 & 1) == 0) {
            [(CLAuthorizationDatabase *)self setBool:1 forKey:@"SuppressShowingInSettings" atKeyPath:v30];
          }
          if (v43)
          {
            if (qword_102419520 != -1) {
              dispatch_once(&qword_102419520, &stru_10230DA60);
            }
            long long v37 = qword_102419528;
            if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)__int16 v49 = 68289538;
              int v50 = 0;
              __int16 v51 = 2082;
              id v52 = "";
              __int16 v53 = 2114;
              id v54 = v5;
              __int16 v55 = 2114;
              id v56 = v30;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"System Service connected and registering; We failed to find it while enumerating "
                "bundles.\", \"inputCKP\":%{public, location:escape_only}@, \"registeredCKP\":%{public, location:escape_only}@}",
                v49,
                0x26u);
              if (qword_102419520 != -1) {
                dispatch_once(&qword_102419520, &stru_10230DA60);
              }
            }
            long long v38 = qword_102419528;
            if (os_signpost_enabled((os_log_t)qword_102419528))
            {
              *(_DWORD *)__int16 v49 = 68289538;
              int v50 = 0;
              __int16 v51 = 2082;
              id v52 = "";
              __int16 v53 = 2114;
              id v54 = v5;
              __int16 v55 = 2114;
              id v56 = v30;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "System Service connected and registering; We failed to find it while enumerating bundles.",
                "{\"msg%{public}.0s\":\"System Service connected and registering; We failed to find it while enumerating "
                "bundles.\", \"inputCKP\":%{public, location:escape_only}@, \"registeredCKP\":%{public, location:escape_only}@}",
                v49,
                0x26u);
            }
            [(CLAuthorizationDatabase *)self setBool:1 forKey:@"isSystemService" atKeyPath:v30];
            -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "setObject:forKeyedSubscript:", v30, [v5 bundlePath]);
          }
          else
          {
            [(CLAuthorizationDatabase *)self cacheInfoPlistKeysForClient:v30];
          }
          [(CLAuthorizationDatabase *)self removeValueForKey:@"TimeMissing" atKeyPath:v30];
          if ([(CLAuthorizationDatabase *)self BOOLForKey:@"SyncedAuthForUninstalledApp" atKeyPath:v5 defaultValue:0])
          {
            [(CLAuthorizationDatabase *)self removeValueForKey:@"SyncedAuthForUninstalledApp" atKeyPath:v30];
          }
          return v30;
        }
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230DA40);
        }
        uint64_t v39 = qword_102419538;
        if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
          return +[CLClientKeyPath nullClientKeyPath];
        }
        *(_DWORD *)__int16 v49 = 68289282;
        int v50 = 0;
        __int16 v51 = 2082;
        id v52 = "";
        __int16 v53 = 2114;
        id v54 = v19;
        id v15 = "{\"msg%{public}.0s\":\"#Warning #RegisterClientKeyPath Registering a bundle path which is not known by lau"
              "nch services and is not reachable!\", \"BundlePath\":%{public, location:escape_only}@}";
        p_uint64_t buf = v49;
        id v17 = v39;
        goto LABEL_75;
      }
    }
    else if (!v20)
    {
      if ([(CLAuthorizationDatabase *)self expensivelyGetIdentifyingInformation:&buf forClient:v5])
      {
        goto LABEL_41;
      }
      if ([(CLAuthorizationDatabase *)self BOOLForKey:@"SyncedAuthForUninstalledApp" atKeyPath:v5 defaultValue:0])
      {
        return v5;
      }
      unsigned int v24 = [(CLAuthorizationDatabase *)self dictionaryExistsAtKeyPath:v5];
      if (v4)
      {
        if (v24)
        {
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_10230DA40);
          }
          id v25 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)__int16 v49 = 68289282;
            int v50 = 0;
            __int16 v51 = 2082;
            id v52 = "";
            __int16 v53 = 2114;
            id v54 = v5;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#RegisterClientKeyPath uninstalled app registering from auth sync, but it already exists\", \"ClientKeyPath\":%{public, location:escape_only}@}", v49, 0x1Cu);
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
          }
          __int16 v26 = qword_102419538;
          if (os_signpost_enabled((os_log_t)qword_102419538))
          {
            *(_DWORD *)__int16 v49 = 68289282;
            int v50 = 0;
            __int16 v51 = 2082;
            id v52 = "";
            __int16 v53 = 2114;
            id v54 = v5;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#RegisterClientKeyPath uninstalled app registering from auth sync, but it already exists", "{\"msg%{public}.0s\":\"#RegisterClientKeyPath uninstalled app registering from auth sync, but it already exists\", \"ClientKeyPath\":%{public, location:escape_only}@}", v49, 0x1Cu);
          }
          [(CLAuthorizationDatabase *)self setBool:1 forKey:@"SyncedAuthForUninstalledApp" atKeyPath:v5];
        }
        else
        {
          [(CLAuthorizationDatabase *)self setupDictionary:&__NSDictionary0__struct atKeyPath:v5];
          [(CLAuthorizationDatabase *)self setBool:1 forKey:@"SyncedAuthForUninstalledApp" atKeyPath:v5];
          -[CLAuthorizationDatabase setString:forKey:atKeyPath:](self, "setString:forKey:atKeyPath:", [v5 bundleId], @"BundleId", v5);
        }
        return v5;
      }
      if (v24)
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230DA40);
        }
        long long v40 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v49 = 68289538;
          int v50 = 0;
          __int16 v51 = 2082;
          id v52 = "";
          __int16 v53 = 2114;
          id v54 = v5;
          __int16 v55 = 2114;
          id v56 = [(CLAuthorizationDatabase *)self readonlyStoreAtKeyPath:v5];
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning #RegisterClientKeyPath The client already exists but is not known by the system; Setting as missing client\", \"ClientKeyPath\":%{public, location:escape_only}@, \"ExistingClientDict\""
            ":%{public, location:escape_only}@}",
            v49,
            0x26u);
        }
        [(CLAuthorizationDatabase *)self setDouble:@"TimeMissing" forKey:v5 atKeyPath:CFAbsoluteTimeGetCurrent()];
        return v5;
      }
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230DA40);
      }
      uint64_t v41 = qword_102419538;
      if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
        return +[CLClientKeyPath nullClientKeyPath];
      }
      *(_DWORD *)__int16 v49 = 68289282;
      int v50 = 0;
      __int16 v51 = 2082;
      id v52 = "";
      __int16 v53 = 2114;
      id v54 = v5;
      id v15 = "{\"msg%{public}.0s\":\"#Warning #RegisterClientKeyPath Attempting to register a client not known by the syst"
            "em. Deferring authorization & registration until they connect with an identity known by the system. Resolvin"
            "g to #nullCKP.\", \"ClientKeyPath\":%{public, location:escape_only}@}";
      p_uint64_t buf = v49;
      id v17 = v41;
LABEL_75:
      uint32_t v18 = 28;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v15, p_buf, v18);
      return +[CLClientKeyPath nullClientKeyPath];
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    uint64_t v23 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      return +[CLClientKeyPath nullClientKeyPath];
    }
    *(_DWORD *)__int16 v49 = 68289538;
    int v50 = 0;
    __int16 v51 = 2082;
    id v52 = "";
    __int16 v53 = 2114;
    id v54 = v5;
    __int16 v55 = 2114;
    id v56 = [(CLAuthorizationDatabase *)self readonlyStoreAtKeyPath:v5];
    id v15 = "{\"msg%{public}.0s\":\"#Warning #RegisterClientKeyPath Client is known by executable; they must be a daemon or"
          " system client that should be masquerading. Deferring authorization & registration until they connect with a v"
          "alid identity. Removing any existing client entry and returning #nullCKP.\", \"ClientKeyPath\":%{public, locat"
          "ion:escape_only}@, \"ExistingClientDict\":%{public, location:escape_only}@}";
    p_uint64_t buf = v49;
    id v17 = v23;
    uint32_t v18 = 38;
    goto LABEL_27;
  }
  id v9 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", [v5 nestedBundlePath]);
  id v10 = [v5 limitingCKP];
  unsigned int v11 = [(CLAuthorizationDatabase *)self dictionaryExistsAtKeyPath:v9];
  unsigned int v12 = [(CLAuthorizationDatabase *)self dictionaryExistsAtKeyPath:v10];
  unsigned int v13 = v12;
  if (!v11 || (v12 & 1) == 0)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    uint64_t v14 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      return +[CLClientKeyPath nullClientKeyPath];
    }
    uint64_t buf = 68290050;
    *(_WORD *)buf_8 = 2082;
    *(void *)&buf_8[2] = "";
    *(_WORD *)&buf_8[10] = 2114;
    *(void *)&buf_8[12] = v9;
    *(_WORD *)&buf_8[20] = 1026;
    *(_DWORD *)&buf_8[22] = v11;
    *(_WORD *)&buf_8[26] = 2114;
    *(void *)&buf_8[28] = v10;
    __int16 v59 = 1026;
    unsigned int v60 = v13;
    id v15 = "{\"msg%{public}.0s\":\"#Warning #RegisterClientKeyPath passed auth-limited keyPath with unregistered primary o"
          "r limiting keyPaths Returning #nullCKP.\", \"Primary\":%{public, location:escape_only}@, \"PrimaryRegistered\""
          ":%{public}hhd, \"Limiting\":%{public, location:escape_only}@, \"LimitingRegistered\":%{public}hhd}";
    p_uint64_t buf = (uint8_t *)&buf;
    id v17 = v14;
    uint32_t v18 = 50;
    goto LABEL_27;
  }
  return v5;
}

- (id)registerSubIdentity:(id)a3 withType:(char)a4 forAnchorKeyPath:(id)a5
{
  uint64_t v6 = a4;
  if ([a5 subIdentityId]
    || ![(CLAuthorizationDatabase *)self dictionaryExistsAtKeyPath:a5])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    id v10 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 68289282;
      v12[1] = 0;
      __int16 v13 = 2082;
      uint64_t v14 = "";
      __int16 v15 = 2114;
      id v16 = a5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning #RegisterSubIdentity The passed anchor has a subIdentity or the anchor is not registered\", \"Anchor\":%{public, location:escape_only}@}", (uint8_t *)v12, 0x1Cu);
    }
    return +[CLClientKeyPath nullClientKeyPath];
  }
  else
  {
    id v9 = [a5 clientKeyPathWithReplacementSubIdentityId:a3 subIdentityType:v6];
    [(CLAuthorizationDatabase *)self setupDictionary:&__NSDictionary0__struct atKeyPath:v9];
  }
  return v9;
}

- (BOOL)migrateDictionaryAtKeyPath:(id)a3 toKeyPath:(id)a4 forceMigrationOnAuthCollision:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  if (![a3 isValidCKP]
    || ![a4 isValidCKP]
    || [a3 subIdentityId]
    || [a4 subIdentityId])
  {
    goto LABEL_5;
  }
  id v12 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", [a3 clientKey]);
  if (v12)
  {
    id v13 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", [a4 clientKey]);
    if (![v13 objectForKeyedSubscript:@"Authorization"])
    {
LABEL_15:
      sub_101086D34(v12, v13, @"BundleId");
      sub_101086D34(v12, v13, @"BundlePath");
      sub_101086D34(v12, v13, @"Executable");
      sub_101086D34(v12, v13, @"PlatformSpecificBundleId");
      sub_101086D34(v12, v13, @"PluginBundleIds");
      sub_101086D34(v12, v13, @"IsAppClip");
      [(CLAuthorizationDatabase *)self removeDictionaryAtKeyPath:a4];
      [(CLAuthorizationDatabase *)self setupDictionary:v12 atKeyPath:a4];
LABEL_17:
      [(CLAuthorizationDatabase *)self removeDictionaryAtKeyPath:a3];
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230DA40);
      }
      __int16 v15 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 68289538;
        int v22 = 0;
        __int16 v23 = 2082;
        unsigned int v24 = "";
        __int16 v25 = 2114;
        id v26 = a3;
        __int16 v27 = 2114;
        id v28 = a4;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Client migration successful\", \"fromClient\":%{public, location:escape_only}@, \"toClient\":%{public, location:escape_only}@}", (uint8_t *)&v21, 0x26u);
      }
      BOOL v10 = 1;
      goto LABEL_6;
    }
    if (v5)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230DA40);
      }
      uint64_t v14 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 68290050;
        __int16 v23 = 2082;
        int v22 = 0;
        unsigned int v24 = "";
        __int16 v25 = 2114;
        id v26 = a4;
        __int16 v27 = 2114;
        id v28 = a3;
        __int16 v29 = 1026;
        unsigned int v30 = [[objc_msgSend(v12, "objectForKeyedSubscript:", @"Authorization") intValue];
        __int16 v31 = 1026;
        unsigned int v32 = [[v13 objectForKeyedSubscript:@"Authorization"] intValue];
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning Migrating to client that already has auth. Mitigation requested - will keep the authorization of the 'to' client\", \"toClient\":%{public, location:escape_only}@, \"fromClient\":%{public, location:escape_only}@, \"RemovedAuth\":%{public}d, \"KeptAuth\":%{public}d}", (uint8_t *)&v21, 0x32u);
      }
      [v12 setObject:objc_msgSend(v13, "objectForKeyedSubscript:", @"Authorization") forKeyedSubscript:@"Authorization"];
      goto LABEL_15;
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    uint64_t v16 = qword_102419538;
    BOOL v10 = 0;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 68289794;
      int v22 = 0;
      __int16 v23 = 2082;
      unsigned int v24 = "";
      __int16 v25 = 2114;
      id v26 = a3;
      __int16 v27 = 2114;
      id v28 = a4;
      __int16 v29 = 1026;
      unsigned int v30 = [[objc_msgSend(v13, "objectForKeyedSubscript:", @"Authorization") intValue];
      id v17 = "{\"msg%{public}.0s\":\"#warning Migrating to client that already has auth. Not migrating.\", \"fromClient\":"
            "%{public, location:escape_only}@, \"toClient\":%{public, location:escape_only}@, \"Auth\":%{public}d}";
      uint32_t v18 = v16;
      uint32_t v19 = 44;
LABEL_30:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, v19);
LABEL_5:
      BOOL v10 = 0;
    }
  }
  else
  {
    if (v5) {
      goto LABEL_17;
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    uint64_t v20 = qword_102419538;
    BOOL v10 = 0;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 68289538;
      int v22 = 0;
      __int16 v23 = 2082;
      unsigned int v24 = "";
      __int16 v25 = 2114;
      id v26 = a3;
      __int16 v27 = 2114;
      id v28 = a4;
      id v17 = "{\"msg%{public}.0s\":\"fromClient not found, skipping migration\", \"fromClient\":%{public, location:escape_"
            "only}@, \"toClient\":%{public, location:escape_only}@}";
      uint32_t v18 = v20;
      uint32_t v19 = 38;
      goto LABEL_30;
    }
  }
LABEL_6:

  return v10;
}

- (signed)shortForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(signed __int16)a5
{
  id v6 = [(CLAuthorizationDatabase *)self _valueForKey:a3 atKeyPath:a4];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a5;
  }

  return (unsigned __int16)[v6 shortValue];
}

- (int64_t)longForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(int64_t)a5
{
  id v6 = [(CLAuthorizationDatabase *)self _valueForKey:a3 atKeyPath:a4];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a5;
  }

  return (int64_t)[v6 longValue];
}

- (float)floatForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(float)a5
{
  id v6 = [(CLAuthorizationDatabase *)self _valueForKey:a3 atKeyPath:a4];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a5;
  }

  [v6 floatValue];
  return result;
}

- (id)stringForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5
{
  id v6 = [(CLAuthorizationDatabase *)self _valueForKey:a3 atKeyPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return +[NSString stringWithString:v6];
  }
  else if (objc_opt_respondsToSelector())
  {
    return [v6 stringValue];
  }
  else
  {
    return a5;
  }
}

- (void)setShort:(signed __int16)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  unsigned int v8 = +[NSNumber numberWithShort:a3];

  [(CLAuthorizationDatabase *)self _setValue:v8 forKey:a4 atKeyPath:a5];
}

- (void)setLong:(int64_t)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  unsigned int v8 = +[NSNumber numberWithLong:a3];

  [(CLAuthorizationDatabase *)self _setValue:v8 forKey:a4 atKeyPath:a5];
}

- (void)setFloat:(float)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  unsigned int v8 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  [(CLAuthorizationDatabase *)self _setValue:v8 forKey:a4 atKeyPath:a5];
}

- (void)setString:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
}

- (void)setData:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  unsigned int v8 = +[NSData dataWithData:a3];

  [(CLAuthorizationDatabase *)self _setValue:v8 forKey:a4 atKeyPath:a5];
}

- (id)getUsersODUUIDs
{
  return 0;
}

- (id)allUsers
{
  id v3 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v4 = [(CLPersistentDictionary *)self underlyingDictionary];
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 68289026;
    long long v15 = v6;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v9);
        [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v11 = +[CLClientKeyPath clientKeyPathWithClientKey:v10];
          if ([(CLClientKeyPath *)v11 userName])
          {
            if ((objc_msgSend(v3, "containsObject:", -[CLClientKeyPath userName](v11, "userName")) & 1) == 0) {
              [v3 addObject:-[CLClientKeyPath userName](v11, "userName")];
            }
          }
          else
          {
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
            id v12 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t buf = v15;
              int v21 = 0;
              __int16 v22 = 2082;
              __int16 v23 = "";
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#AuthorizationDatabase got a nil username while iterating through authorization database, skipping\"}", buf, 0x12u);
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_10230DA40);
              }
            }
            id v13 = qword_102419538;
            if (os_signpost_enabled((os_log_t)qword_102419538))
            {
              *(_DWORD *)uint64_t buf = v15;
              int v21 = 0;
              __int16 v22 = 2082;
              __int16 v23 = "";
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AuthorizationDatabase got a nil username while iterating through authorization database, skipping", "{\"msg%{public}.0s\":\"#AuthorizationDatabase got a nil username while iterating through authorization database, skipping\"}", buf, 0x12u);
            }
          }
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v7);
  }
  return v3;
}

- (void)removeUser:(id)a3
{
  if (_os_feature_enabled_impl())
  {
    id v5 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] allKeys];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v27 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v16;
      *(void *)&long long v7 = 68289538;
      long long v14 = v7;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v10);
          [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v11];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && [(NSString *)[+[CLClientKeyPath clientKeyPathWithClientKey:v11] userName] isEqualToString:a3])
          {
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
            id v12 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
            {
              id v13 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v11];
              *(_DWORD *)uint64_t buf = v14;
              int v20 = 0;
              __int16 v21 = 2082;
              __int16 v22 = "";
              __int16 v23 = 2114;
              uint64_t v24 = v11;
              __int16 v25 = 2114;
              id v26 = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabaseDroppingData Removing dictionary for key\", \"Key\":%{public, location:escape_only}@, \"Dictionary\":%{public, location:escape_only}@}", buf, 0x26u);
            }
            [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] removeObjectForKey:v11];
          }
          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v5 countByEnumeratingWithState:&v15 objects:v27 count:16];
      }
      while (v8);
    }
    [(CLPersistentDictionary *)self markModifiedDirty];
  }
}

- (BOOL)isBundlePathRegisteredSystemService:(id)a3
{
  return a3
      && [(NSMutableDictionary *)[(CLAuthorizationDatabase *)self systemServicesMap] objectForKeyedSubscript:a3] != 0;
}

- (void)performFullSystemServiceSetup
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10230DA40);
  }
  id v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#SetupSystemService #AuthorizationDatabase performing full setup of system services", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    BOOL v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAuthorizationDatabase performFullSystemServiceSetup]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLAuthorizationDatabase *)self _deriveAndCacheSystemServicesMap];
  [(CLAuthorizationDatabase *)self _setupSystemServiceDictionaries];
  [(CLAuthorizationDatabase *)self _setUpDefaultDeniedSystemServices];
}

- (void)_deriveAndCacheSystemServicesMap
{
  uint64_t v3 = sub_100B40A78();

  [(CLAuthorizationDatabase *)self setSystemServicesMap:v3];
}

- (void)_setUpDefaultDeniedSystemServices
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(CLAuthorizationDatabase *)self _getDefaultDeniedSystemServices];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v5 = 68289282;
    long long v14 = v5;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v8);
        id v10 = [(NSMutableDictionary *)[(CLAuthorizationDatabase *)self systemServicesMap] objectForKeyedSubscript:v9];
        if (v10)
        {
          id v11 = v10;
          if (![(CLAuthorizationDatabase *)self _valueForKey:@"Authorization" atKeyPath:v10])[(CLAuthorizationDatabase *)self setInt:1 forKey:@"Authorization" atKeyPath:v11]; {
        }
          }
        else
        {
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_10230DA40);
          }
          id v12 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)uint64_t buf = v14;
            int v20 = 0;
            __int16 v21 = 2082;
            __int16 v22 = "";
            __int16 v23 = 2114;
            uint64_t v24 = v9;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabase #SystemServiceSetup default denied system service not in systemServicesMap\", \"BundlePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
          }
          id v13 = qword_102419538;
          if (os_signpost_enabled((os_log_t)qword_102419538))
          {
            *(_DWORD *)uint64_t buf = v14;
            int v20 = 0;
            __int16 v21 = 2082;
            __int16 v22 = "";
            __int16 v23 = 2114;
            uint64_t v24 = v9;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AuthorizationDatabase #SystemServiceSetup default denied system service not in systemServicesMap", "{\"msg%{public}.0s\":\"#AuthorizationDatabase #SystemServiceSetup default denied system service not in systemServicesMap\", \"BundlePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v6);
  }
}

- (void)_setupSystemServiceDictionaries
{
  id obj = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] allKeys];
  id v96 = +[NSMutableDictionary dictionary];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v2 = [obj countByEnumeratingWithState:&v123 objects:v141 count:16];
  if (v2)
  {
    uint64_t v89 = *(void *)v124;
    do
    {
      id v3 = 0;
      do
      {
        if (*(void *)v124 != v89) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v123 + 1) + 8 * (void)v3);
        id v5 = objc_alloc_init((Class)NSAutoreleasePool);
        id v6 = +[CLClientKeyPath clientKeyPathWithClientKey:v4];
        uint64_t v7 = [(CLClientKeyPath *)v6 bundlePath];
        if (v7)
        {
          id v8 = [(CLClientKeyPath *)v6 nestedBundlePath];
          if (!v8)
          {
            [(CLAuthorizationDatabase *)self migrationVersionNumber];
            if (v9 >= (float)10)
            {
              id v8 = v7;
            }
            else
            {
              id v8 = v7;
              if (objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v6, "clientKey")), "objectForKeyedSubscript:", @"SubIdentities"))
              {
                goto LABEL_27;
              }
            }
          }
          if ([(NSMutableDictionary *)[(CLAuthorizationDatabase *)self systemServicesMap] objectForKeyedSubscript:v8])
          {
            goto LABEL_22;
          }
          if ([(CLAuthorizationDatabase *)self _valueForKey:@"isSystemService" atKeyPath:v6])
          {
            if ([(CLAuthorizationDatabase *)self _CLCommonIsBundleSystemService:v8])
            {
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_10230DA40);
              }
              long long v16 = qword_102419538;
              if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)uint64_t buf = 68289282;
                int v132 = 0;
                __int16 v133 = 2082;
                v134 = "";
                __int16 v135 = 2114;
                v136 = (CLClientKeyPath *)v8;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase has record of legitimate system service not found in systemServicesMap\", \"SystemService\":%{public, location:escape_only}@}", buf, 0x1Cu);
                if (qword_102419530 != -1) {
                  dispatch_once(&qword_102419530, &stru_10230DA40);
                }
              }
              long long v17 = qword_102419538;
              if (os_signpost_enabled((os_log_t)qword_102419538))
              {
                *(_DWORD *)uint64_t buf = 68289282;
                int v132 = 0;
                __int16 v133 = 2082;
                v134 = "";
                __int16 v135 = 2114;
                v136 = (CLClientKeyPath *)v8;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#SystemServiceSetup #AuthorizationDatabase has record of legitimate system service not found in systemServicesMap", "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase has record of legitimate system service not found in systemServicesMap\", \"SystemService\":%{public, location:escape_only}@}", buf, 0x1Cu);
              }
LABEL_22:
              id v12 = [(CLClientKeyPath *)v6 subIdentityId];
              id v13 = v6;
              if (v12) {
                id v13 = [(CLClientKeyPath *)v6 anchorKeyPath];
              }
              id v14 = [(CLAuthorizationDatabase *)self _valueForKey:@"Authorization" atKeyPath:v13];
              id v15 = [[-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v6, "clientKey")) mutableCopy];
              [v15 removeObjectForKey:@"SubIdentities"];
              [v15 removeObjectForKey:@"AnchorKeyPath"];
              if (v14) {
                [v15 setObject:v14 forKeyedSubscript:@"Authorization"];
              }
              [v96 setObject:v15 forKeyedSubscript:v8];
              goto LABEL_27;
            }
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
            __int16 v21 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 68289282;
              int v132 = 0;
              __int16 v133 = 2082;
              v134 = "";
              __int16 v135 = 2114;
              v136 = (CLClientKeyPath *)v8;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning #SystemServiceSetup #AuthorizationDatabase has record of bundlePath which was previously known as a system service but currently is not considered a system service. Removing System Service privileges.\", \"BundlePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
            }
            [(CLAuthorizationDatabase *)self removeValueForKey:@"isSystemService" atKeyPath:v6];
            [(CLAuthorizationDatabase *)self removeValueForKey:@"AnchorKeyPath" atKeyPath:v6];
            [(CLAuthorizationDatabase *)self removeValueForKey:@"SubIdentities" atKeyPath:v6];
            id v22 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:[(CLClientKeyPath *)v6 clientKey]];
            [(CLAuthorizationDatabase *)self _removeDictionaryAtKeyPath:v6 shouldLog:0];
            if ([(CLAuthorizationDatabase *)self _isBundlePathReachable:v8])
            {
              [(CLAuthorizationDatabase *)self setupDictionary:v22 atKeyPath:+[CLClientKeyPath clientKeyPathWithUserName:[(CLClientKeyPath *)v6 userName] clientAnchor:v8 anchorType:112]];
              goto LABEL_27;
            }
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
            uint64_t v23 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 68289282;
              int v132 = 0;
              __int16 v133 = 2082;
              v134 = "";
              __int16 v135 = 2114;
              v136 = (CLClientKeyPath *)v8;
              long long v19 = v23;
              int v20 = "{\"msg%{public}.0s\":\"#Warning #SystemServiceSetup #AuthorizationDatabaseDroppingData bundlePath pr"
                    "eviously known as system service is not reachable on disk. Removing record.\", \"BundlePath\":%{publ"
                    "ic, location:escape_only}@}";
              goto LABEL_52;
            }
          }
          else
          {
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
            uint64_t v18 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 68289282;
              int v132 = 0;
              __int16 v133 = 2082;
              v134 = "";
              __int16 v135 = 2114;
              v136 = (CLClientKeyPath *)v8;
              long long v19 = v18;
              int v20 = "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase bundlePath client was not and curr"
                    "ently is not a system service. Skipping.\", \"BundlePath\":%{public, location:escape_only}@}";
LABEL_52:
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x1Cu);
            }
          }
        }
        else if ([(CLAuthorizationDatabase *)self BOOLForKey:@"isSystemService" atKeyPath:v6 defaultValue:0])
        {
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_10230DA40);
          }
          id v10 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)uint64_t buf = 68289282;
            int v132 = 0;
            __int16 v133 = 2082;
            v134 = "";
            __int16 v135 = 2114;
            v136 = v6;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabase #SystemServiceSetup Clients known by anything other than bundle path CANNOT be System Services! Removing isSystemService flag\", \"Client\":%{public, location:escape_only}@}", buf, 0x1Cu);
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
          }
          id v11 = qword_102419538;
          if (os_signpost_enabled((os_log_t)qword_102419538))
          {
            *(_DWORD *)uint64_t buf = 68289282;
            int v132 = 0;
            __int16 v133 = 2082;
            v134 = "";
            __int16 v135 = 2114;
            v136 = v6;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AuthorizationDatabase #SystemServiceSetup Clients known by anything other than bundle path CANNOT be System Services! Removing isSystemService flag", "{\"msg%{public}.0s\":\"#AuthorizationDatabase #SystemServiceSetup Clients known by anything other than bundle path CANNOT be System Services! Removing isSystemService flag\", \"Client\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
          [(CLAuthorizationDatabase *)self removeValueForKey:@"isSystemService" atKeyPath:v6];
        }
LABEL_27:

        id v3 = (char *)v3 + 1;
      }
      while (v2 != v3);
      id v24 = [obj countByEnumeratingWithState:&v123 objects:v141 count:16];
      id v2 = v24;
    }
    while (v24);
  }
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v25 = [obj countByEnumeratingWithState:&v119 objects:v140 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v120;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v120 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v119 + 1) + 8 * i);
        id v29 = objc_alloc_init((Class)NSAutoreleasePool);
        unsigned int v30 = +[CLClientKeyPath clientKeyPathWithClientKey:v28];
        if (objc_msgSend(v96, "objectForKeyedSubscript:", -[CLClientKeyPath bundlePath](v30, "bundlePath")))
        {
          [(CLAuthorizationDatabase *)self removeValueForKey:@"isSystemService" atKeyPath:v30];
          [(CLAuthorizationDatabase *)self _removeDictionaryAtKeyPath:v30 shouldLog:0];
        }
      }
      id v25 = [obj countByEnumeratingWithState:&v119 objects:v140 count:16];
    }
    while (v25);
  }
  id v82 = +[NSMutableSet set];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  v87 = [(CLAuthorizationDatabase *)self systemServicesMap];
  id obja = [(NSMutableDictionary *)v87 countByEnumeratingWithState:&v115 objects:v139 count:16];
  if (obja)
  {
    uint64_t v90 = *(void *)v116;
    do
    {
      for (j = 0; j != obja; j = (char *)j + 1)
      {
        if (*(void *)v116 != v90) {
          objc_enumerationMutation(v87);
        }
        uint64_t v32 = *(void *)(*((void *)&v115 + 1) + 8 * (void)j);
        id v33 = objc_alloc_init((Class)NSAutoreleasePool);
        id v34 = (CLClientKeyPath *)[(NSMutableDictionary *)[(CLAuthorizationDatabase *)self systemServicesMap] objectForKeyedSubscript:v32];
        if (![(CLClientKeyPath *)v34 subIdentityId])
        {
          id v35 = [v96 objectForKeyedSubscript:v32];
          if ([(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:[(CLClientKeyPath *)v34 clientKey]])
          {
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
            long long v36 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
            {
              id v37 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:[(CLClientKeyPath *)v34 clientKey]];
              *(_DWORD *)uint64_t buf = 68289538;
              int v132 = 0;
              __int16 v133 = 2082;
              v134 = "";
              __int16 v135 = 2114;
              v136 = v34;
              __int16 v137 = 2114;
              id v138 = v37;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase setting up system services; the destin"
                "ation key path exists, but didn't we just remove it??\", \"Client\":%{public, location:escape_only}@, \""
                "Dictionary\":%{public, location:escape_only}@}",
                buf,
                0x26u);
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_10230DA40);
              }
            }
            long long v38 = qword_102419538;
            if (os_signpost_enabled((os_log_t)qword_102419538))
            {
              id v39 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:[(CLClientKeyPath *)v34 clientKey]];
              *(_DWORD *)uint64_t buf = 68289538;
              int v132 = 0;
              __int16 v133 = 2082;
              v134 = "";
              __int16 v135 = 2114;
              v136 = v34;
              __int16 v137 = 2114;
              id v138 = v39;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#SystemServiceSetup #AuthorizationDatabase setting up system services; the destination key path exists, "
                "but didn't we just remove it??",
                "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase setting up system services; the destin"
                "ation key path exists, but didn't we just remove it??\", \"Client\":%{public, location:escape_only}@, \""
                "Dictionary\":%{public, location:escape_only}@}",
                buf,
                0x26u);
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_10230DA40);
              }
            }
            long long v40 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v41 = [(CLClientKeyPath *)v34 clientKey];
              id v42 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:[(CLClientKeyPath *)v34 clientKey]];
              *(_DWORD *)uint64_t buf = 68289538;
              int v132 = 0;
              __int16 v133 = 2082;
              v134 = "";
              __int16 v135 = 2114;
              v136 = v41;
              __int16 v137 = 2114;
              id v138 = v42;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabaseDroppingData Removing dictionary for key\", \"Key\":%{public, location:escape_only}@, \"Dictionary\":%{public, location:escape_only}@}", buf, 0x26u);
            }
            [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] removeObjectForKey:[(CLClientKeyPath *)v34 clientKey]];
          }
          [(CLAuthorizationDatabase *)self setupDictionary:v35 atKeyPath:v34];
          [(CLAuthorizationDatabase *)self setBool:1 forKey:@"isSystemService" atKeyPath:v34];
          [(CLAuthorizationDatabase *)self setString:v32 forKey:@"BundlePath" atKeyPath:v34];
          [v96 removeObjectForKey:v32];
          [v82 addObject:v34];
        }
      }
      id obja = [(NSMutableDictionary *)v87 countByEnumeratingWithState:&v115 objects:v139 count:16];
    }
    while (obja);
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v83 = [(CLAuthorizationDatabase *)self systemServicesMap];
  id objb = [(NSMutableDictionary *)v83 countByEnumeratingWithState:&v111 objects:v130 count:16];
  if (objb)
  {
    uint64_t v91 = *(void *)v112;
    do
    {
      for (k = 0; k != objb; k = (char *)k + 1)
      {
        if (*(void *)v112 != v91) {
          objc_enumerationMutation(v83);
        }
        uint64_t v44 = *(void *)(*((void *)&v111 + 1) + 8 * (void)k);
        id v45 = objc_alloc_init((Class)NSAutoreleasePool);
        long long v46 = (CLClientKeyPath *)[(NSMutableDictionary *)[(CLAuthorizationDatabase *)self systemServicesMap] objectForKeyedSubscript:v44];
        id v47 = [v96 objectForKeyedSubscript:v44];
        if ([(CLClientKeyPath *)v46 subIdentityId])
        {
          if ([(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:[(CLClientKeyPath *)v46 clientKey]])
          {
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
            id v48 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
            {
              id v49 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:[(CLClientKeyPath *)v46 clientKey]];
              *(_DWORD *)uint64_t buf = 68289538;
              int v132 = 0;
              __int16 v133 = 2082;
              v134 = "";
              __int16 v135 = 2114;
              v136 = v46;
              __int16 v137 = 2114;
              id v138 = v49;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase setting up system services; the destin"
                "ation key path exists, but didn't we just remove it??\", \"Client\":%{public, location:escape_only}@, \""
                "Dictionary\":%{public, location:escape_only}@}",
                buf,
                0x26u);
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_10230DA40);
              }
            }
            int v50 = qword_102419538;
            if (os_signpost_enabled((os_log_t)qword_102419538))
            {
              id v51 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:[(CLClientKeyPath *)v46 clientKey]];
              *(_DWORD *)uint64_t buf = 68289538;
              int v132 = 0;
              __int16 v133 = 2082;
              v134 = "";
              __int16 v135 = 2114;
              v136 = v46;
              __int16 v137 = 2114;
              id v138 = v51;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#SystemServiceSetup #AuthorizationDatabase setting up system services; the destination key path exists, "
                "but didn't we just remove it??",
                "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase setting up system services; the destin"
                "ation key path exists, but didn't we just remove it??\", \"Client\":%{public, location:escape_only}@, \""
                "Dictionary\":%{public, location:escape_only}@}",
                buf,
                0x26u);
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_10230DA40);
              }
            }
            id v52 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v53 = [(CLClientKeyPath *)v46 clientKey];
              id v54 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:[(CLClientKeyPath *)v46 clientKey]];
              *(_DWORD *)uint64_t buf = 68289538;
              int v132 = 0;
              __int16 v133 = 2082;
              v134 = "";
              __int16 v135 = 2114;
              v136 = v53;
              __int16 v137 = 2114;
              id v138 = v54;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabaseDroppingData Removing dictionary for key\", \"Key\":%{public, location:escape_only}@, \"Dictionary\":%{public, location:escape_only}@}", buf, 0x26u);
            }
            [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] removeObjectForKey:[(CLClientKeyPath *)v46 clientKey]];
          }
          [(CLAuthorizationDatabase *)self setupDictionary:v47 atKeyPath:v46];
          [(CLAuthorizationDatabase *)self setBool:1 forKey:@"isSystemService" atKeyPath:v46];
          [(CLAuthorizationDatabase *)self setString:v44 forKey:@"BundlePath" atKeyPath:v46];
          [v96 removeObjectForKey:v44];
        }
      }
      id objb = [(NSMutableDictionary *)v83 countByEnumeratingWithState:&v111 objects:v130 count:16];
    }
    while (objb);
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v55 = [v96 countByEnumeratingWithState:&v107 objects:v129 count:16];
  if (v55)
  {
    uint64_t v56 = *(void *)v108;
    do
    {
      for (m = 0; m != v55; m = (char *)m + 1)
      {
        if (*(void *)v108 != v56) {
          objc_enumerationMutation(v96);
        }
        uint64_t v58 = *(void *)(*((void *)&v107 + 1) + 8 * (void)m);
        id v59 = objc_alloc_init((Class)NSAutoreleasePool);
        unsigned int v60 = +[CLClientKeyPath clientKeyPathWithUserName:0 clientAnchor:v58 anchorType:112];
        -[CLAuthorizationDatabase setupDictionary:atKeyPath:](self, "setupDictionary:atKeyPath:", [v96 objectForKeyedSubscript:v58], v60);
        [(CLAuthorizationDatabase *)self setBool:1 forKey:@"isSystemService" atKeyPath:v60];
        [(CLAuthorizationDatabase *)self setString:v58 forKey:@"BundlePath" atKeyPath:v60];
      }
      id v55 = [v96 countByEnumeratingWithState:&v107 objects:v129 count:16];
    }
    while (v55);
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v85 = [v82 countByEnumeratingWithState:&v103 objects:v128 count:16];
  if (v85)
  {
    uint64_t v84 = *(void *)v104;
    *(void *)&long long v61 = 68289282;
    long long v81 = v61;
    do
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v104 != v84)
        {
          uint64_t v63 = v62;
          objc_enumerationMutation(v82);
          uint64_t v62 = v63;
        }
        uint64_t v86 = v62;
        v97 = *(CLClientKeyPath **)(*((void *)&v103 + 1) + 8 * v62);
        id v88 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:[(CLClientKeyPath *)v97 clientKey]];
        id v64 = [v88 objectForKeyedSubscript:@"Authorization"];
        if (v64) {
          LODWORD(v64) = [[objc_msgSend(v88, "objectForKeyedSubscript:", @"Authorization") intValue];
        }
        BOOL v65 = v64 == 1;
        BOOL objc = v64 == 4;
        id v66 = [v88 objectForKeyedSubscript:@"SubIdentities"];
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id v67 = [v66 countByEnumeratingWithState:&v99 objects:v127 count:16];
        if (v67)
        {
          uint64_t v68 = *(void *)v100;
          do
          {
            v69 = 0;
            do
            {
              if (*(void *)v100 != v68) {
                objc_enumerationMutation(v66);
              }
              v70 = *(void **)(*((void *)&v99 + 1) + 8 * (void)v69);
              id v71 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v70];
              if ([v71 objectForKeyedSubscript:@"Authorization"])
              {
                unsigned int v72 = [[objc_msgSend(v71, "objectForKeyedSubscript:", @"Authorization") intValue];
                if (v72 == 4)
                {
                  if (qword_102419530 != -1) {
                    dispatch_once(&qword_102419530, &stru_10230DA40);
                  }
                  v74 = qword_102419538;
                  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)uint64_t buf = 68289538;
                    int v132 = 0;
                    __int16 v133 = 2082;
                    v134 = "";
                    __int16 v135 = 2114;
                    v136 = v97;
                    __int16 v137 = 2114;
                    id v138 = v70;
                    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase System service group contains Allowed entity\", \"Group\":%{public, location:escape_only}@, \"AllowedMember\":%{public, location:escape_only}@}", buf, 0x26u);
                  }
                  BOOL objc = 1;
                }
                else if (v72 == 1)
                {
                  if (qword_102419530 != -1) {
                    dispatch_once(&qword_102419530, &stru_10230DA40);
                  }
                  v73 = qword_102419538;
                  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)uint64_t buf = 68289538;
                    int v132 = 0;
                    __int16 v133 = 2082;
                    v134 = "";
                    __int16 v135 = 2114;
                    v136 = v97;
                    __int16 v137 = 2114;
                    id v138 = v70;
                    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase System service group contains Denied entity\", \"Group\":%{public, location:escape_only}@, \"DeniedMember\":%{public, location:escape_only}@}", buf, 0x26u);
                  }
                  BOOL v65 = 1;
                }
              }
              [v71 removeObjectForKey:@"SupportedAuthorizationMask"];
              [v71 removeObjectForKey:@"Authorization"];
              v69 = (char *)v69 + 1;
            }
            while (v67 != v69);
            id v67 = [v66 countByEnumeratingWithState:&v99 objects:v127 count:16];
          }
          while (v67);
        }
        if (v65)
        {
          [v88 setObject:&off_1023939E0 forKeyedSubscript:@"Authorization"];
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_10230DA40);
          }
          uint64_t v75 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
          {
            v76 = [(CLClientKeyPath *)v97 bundlePath];
            *(_DWORD *)uint64_t buf = v81;
            int v132 = 0;
            __int16 v133 = 2082;
            v134 = "";
            __int16 v135 = 2114;
            v136 = v76;
            v77 = v75;
            v78 = "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase Setting system service group to Deni"
                  "ed because at least one entity was denied\", \"Group\":%{public, location:escape_only}@}";
LABEL_149:
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, v78, buf, 0x1Cu);
          }
        }
        else if (objc)
        {
          [v88 setObject:&off_102393A40 forKeyedSubscript:@"Authorization"];
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_10230DA40);
          }
          uint64_t v79 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
          {
            v80 = [(CLClientKeyPath *)v97 bundlePath];
            *(_DWORD *)uint64_t buf = v81;
            int v132 = 0;
            __int16 v133 = 2082;
            v134 = "";
            __int16 v135 = 2114;
            v136 = v80;
            v77 = v79;
            v78 = "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase Setting system service group to Allo"
                  "wed because at least one entity was allowed, and none were denied\", \"Group\":%{public, location:escape_only}@}";
            goto LABEL_149;
          }
        }
        [v88 removeObjectForKey:@"SupportedAuthorizationMask"];
        uint64_t v62 = v86 + 1;
      }
      while ((id)(v86 + 1) != v85);
      id v85 = [v82 countByEnumeratingWithState:&v103 objects:v128 count:16];
    }
    while (v85);
  }
}

- (BOOL)_CLCommonIsBundleSystemService:(id)a3
{
  return sub_100102484((__CFString *)a3);
}

- (BOOL)_isBundlePathReachable:(id)a3
{
  id v3 = +[NSURL fileURLWithPath:a3 isDirectory:1];

  return [(NSURL *)v3 checkResourceIsReachableAndReturnError:0];
}

- (void)_cacheSystemServicesMap
{
  [(CLAuthorizationDatabase *)self setSystemServicesMap:+[NSMutableDictionary dictionary]];
  id v3 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] allKeys];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v5 = 68289282;
    long long v14 = v5;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v8);
        [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = +[CLClientKeyPath clientKeyPathWithClientKey:v9];
          if ([(CLAuthorizationDatabase *)self BOOLForKey:@"isSystemService" atKeyPath:v10 defaultValue:0])
          {
            id v11 = [(CLAuthorizationDatabase *)self stringForKey:@"BundlePath" atKeyPath:v10 defaultValue:0];
            if (v11)
            {
              [(NSMutableDictionary *)[(CLAuthorizationDatabase *)self systemServicesMap] setObject:v10 forKeyedSubscript:v11];
            }
            else
            {
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_10230DA40);
              }
              id v12 = qword_102419538;
              if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)uint64_t buf = v14;
                int v20 = 0;
                __int16 v21 = 2082;
                id v22 = "";
                __int16 v23 = 2114;
                id v24 = v10;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabase Clients known by anything other than bundle path CANNOT be cached as System Services! Removing isSystemService flag\", \"Client\":%{public, location:escape_only}@}", buf, 0x1Cu);
                if (qword_102419530 != -1) {
                  dispatch_once(&qword_102419530, &stru_10230DA40);
                }
              }
              id v13 = qword_102419538;
              if (os_signpost_enabled((os_log_t)qword_102419538))
              {
                *(_DWORD *)uint64_t buf = v14;
                int v20 = 0;
                __int16 v21 = 2082;
                id v22 = "";
                __int16 v23 = 2114;
                id v24 = v10;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AuthorizationDatabase Clients known by anything other than bundle path CANNOT be cached as System Services! Removing isSystemService flag", "{\"msg%{public}.0s\":\"#AuthorizationDatabase Clients known by anything other than bundle path CANNOT be cached as System Services! Removing isSystemService flag\", \"Client\":%{public, location:escape_only}@}", buf, 0x1Cu);
              }
              [(CLAuthorizationDatabase *)self removeValueForKey:@"isSystemService" atKeyPath:v10];
            }
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v6);
  }
}

- (void)_cacheAlternativeIdentities
{
  [(CLAuthorizationDatabase *)self setAlternateIdentitiesMap:+[NSMutableDictionary dictionary]];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] allKeys];
  id v3 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    CFStringRef v15 = @"PluginBundleIds";
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v6);
        [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = +[CLClientKeyPath clientKeyPathWithClientKey:v7];
          uint64_t v9 = [(CLAuthorizationDatabase *)self alternateIdentitiesMap];
          id v10 = [(CLAuthorizationDatabase *)self arrayForKey:v15 atKeyPath:v8 defaultValue:&__NSArray0__struct];
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v18;
            do
            {
              long long v14 = 0;
              do
              {
                if (*(void *)v18 != v13) {
                  objc_enumerationMutation(v10);
                }
                [(NSMutableDictionary *)v9 setObject:v8 forKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * (void)v14)];
                long long v14 = (char *)v14 + 1;
              }
              while (v12 != v14);
              id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v12);
          }
        }
        id v6 = (char *)v6 + 1;
      }
      while (v6 != v4);
      id v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }
}

- (void)_internalMigrationLegacyKeys
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10230DA40);
  }
  id v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v38 = 2082;
    id v39 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Starting #AuthDatabaseMigration_0\"}", buf, 0x12u);
  }
  id v4 = [(CLPersistentDictionary *)self underlyingDictionary];
  id obj = [(NSMutableDictionary *)v4 allKeys];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v34;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_10230DA40);
          }
          uint64_t v13 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)uint64_t buf = 68289282;
            *(_DWORD *)&uint8_t buf[4] = 0;
            __int16 v38 = 2082;
            id v39 = "";
            __int16 v40 = 2114;
            uint64_t v41 = v8;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Top-level clients.plist key is not NSString. Removing key\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
          }
          long long v14 = qword_102419538;
          if (os_signpost_enabled((os_log_t)qword_102419538))
          {
            *(_DWORD *)uint64_t buf = 68289282;
            *(_DWORD *)&uint8_t buf[4] = 0;
            __int16 v38 = 2082;
            id v39 = "";
            __int16 v40 = 2114;
            uint64_t v41 = v8;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Top-level clients.plist key is not NSString. Removing key", "{\"msg%{public}.0s\":\"Top-level clients.plist key is not NSString. Removing key\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
          goto LABEL_30;
        }
        if (sub_1004BF638(v8) || ([v8 isEqualToString:@"root"] & 1) != 0)
        {
LABEL_18:
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_10230DA40);
          }
          id v12 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 68289282;
            *(_DWORD *)&uint8_t buf[4] = 0;
            __int16 v38 = 2082;
            id v39 = "";
            __int16 v40 = 2114;
            uint64_t v41 = v8;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Top-level clients.plist key is userified. Removing key\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
LABEL_30:
          [(NSMutableDictionary *)v4 removeObjectForKey:v8];
          goto LABEL_31;
        }
        sub_100105D0C(buf);
        if (SBYTE3(v41) >= 0) {
          uint64_t v9 = buf;
        }
        else {
          uint64_t v9 = *(uint8_t **)buf;
        }
        unsigned int v10 = [v8 containsString:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9)];
        unsigned int v11 = v10;
        if (SBYTE3(v41) < 0)
        {
          operator delete(*(void **)buf);
          if (v11) {
            goto LABEL_18;
          }
        }
        else if (v10)
        {
          goto LABEL_18;
        }
        CFStringRef v15 = (CLClientKeyPath *)[(NSMutableDictionary *)v4 objectForKeyedSubscript:v8];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_10230DA40);
          }
          long long v18 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
          {
            long long v19 = (CLClientKeyPath *)[(NSMutableDictionary *)v4 objectForKeyedSubscript:v8];
            *(_DWORD *)uint64_t buf = 68289538;
            *(_DWORD *)&uint8_t buf[4] = 0;
            __int16 v38 = 2082;
            id v39 = "";
            __int16 v40 = 2114;
            uint64_t v41 = v8;
            __int16 v42 = 2114;
            int v43 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration Top-level clients.plist value is not NSDictionary. Removing entry.\", \"key\":%{public, location:escape_only}@, \"value\":%{public, location:escape_only}@}", buf, 0x26u);
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
          }
          long long v20 = qword_102419538;
          if (os_signpost_enabled((os_log_t)qword_102419538))
          {
            long long v21 = (CLClientKeyPath *)[(NSMutableDictionary *)v4 objectForKeyedSubscript:v8];
            *(_DWORD *)uint64_t buf = 68289538;
            *(_DWORD *)&uint8_t buf[4] = 0;
            __int16 v38 = 2082;
            id v39 = "";
            __int16 v40 = 2114;
            uint64_t v41 = v8;
            __int16 v42 = 2114;
            int v43 = v21;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AuthDatabaseMigration Top-level clients.plist value is not NSDictionary. Removing entry.", "{\"msg%{public}.0s\":\"#AuthDatabaseMigration Top-level clients.plist value is not NSDictionary. Removing entry.\", \"key\":%{public, location:escape_only}@, \"value\":%{public, location:escape_only}@}", buf, 0x26u);
          }
          goto LABEL_30;
        }
        long long v16 = +[NSString stringWithUTF8String:"com.apple.locationd.bundle-"];
        long long v17 = +[NSString stringWithUTF8String:"com.apple.locationd.executable-"];
        if (([v8 isEqualToString:v16] & 1) != 0
          || [v8 isEqualToString:v17])
        {
          goto LABEL_30;
        }
        if ([v8 hasPrefix:v16])
        {
          id v22 = [[v8 substringFromIndex:-[NSString length](v16, "length")];
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_10230DA40);
          }
          long long v23 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 68289538;
            *(_DWORD *)&uint8_t buf[4] = 0;
            __int16 v38 = 2082;
            id v39 = "";
            __int16 v40 = 2114;
            uint64_t v41 = v8;
            __int16 v42 = 2114;
            int v43 = v15;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration migration found bundle path key. Removing prefix\", \"oldKey\":%{public, location:escape_only}@, \"anchorDictionary\":%{public, location:escape_only}@}", buf, 0x26u);
          }
          uint64_t v24 = 112;
        }
        else if ([v8 hasPrefix:v17])
        {
          id v22 = [[v8 substringFromIndex:-[NSString length](v17, "length")];
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_10230DA40);
          }
          id v25 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 68289538;
            *(_DWORD *)&uint8_t buf[4] = 0;
            __int16 v38 = 2082;
            id v39 = "";
            __int16 v40 = 2114;
            uint64_t v41 = v8;
            __int16 v42 = 2114;
            int v43 = v15;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration migration found executable key. Removing prefix\", \"oldKey\":%{public, location:escape_only}@, \"anchorDictionary\":%{public, location:escape_only}@}", buf, 0x26u);
          }
          uint64_t v24 = 101;
        }
        else
        {
          if (objc_msgSend(v8, "isEqualToString:", -[CLClientKeyPath objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", @"BundlePath")))
          {
            uint64_t v24 = 112;
          }
          else if (objc_msgSend(v8, "isEqualToString:", -[CLClientKeyPath objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", @"Executable")))
          {
            uint64_t v24 = 101;
          }
          else
          {
            if ((objc_msgSend(v8, "isEqualToString:", -[CLClientKeyPath objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", @"BundleId")) & 1) == 0)
            {
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_10230DA40);
              }
              uint64_t v26 = qword_102419538;
              if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)uint64_t buf = 68289538;
                *(_DWORD *)&uint8_t buf[4] = 0;
                __int16 v38 = 2082;
                id v39 = "";
                __int16 v40 = 2114;
                uint64_t v41 = v8;
                __int16 v42 = 2114;
                int v43 = v15;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration migration anchor type not defined in the anchor's dictionary; defaulting to bundleId\", \"anchor\":%{public, location:escape_only}@, \"value\":%{public, locat"
                  "ion:escape_only}@}",
                  buf,
                  0x26u);
              }
            }
            uint64_t v24 = 105;
          }
          id v22 = v8;
        }
        [(CLClientKeyPath *)v15 removeObjectForKey:@"SubIdentities"];
        __int16 v27 = +[CLClientKeyPath clientKeyPathWithClientAnchor:v22 anchorType:v24];
        [(NSMutableDictionary *)v4 setObject:v15 forKeyedSubscript:[(CLClientKeyPath *)v27 clientKey]];
        [(NSMutableDictionary *)v4 removeObjectForKey:v8];
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10230DA40);
        }
        uint64_t v28 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289538;
          *(_DWORD *)&uint8_t buf[4] = 0;
          __int16 v38 = 2082;
          id v39 = "";
          __int16 v40 = 2114;
          uint64_t v41 = v8;
          __int16 v42 = 2114;
          int v43 = v27;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration migration from legacy clients.plist representation - successfully migrated client representation\", \"oldKey\":%{public, location:escape_only}@, \"newKey\":%{public, location:escape_only}@}", buf, 0x26u);
        }
LABEL_31:
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v29 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
      id v5 = v29;
    }
    while (v29);
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10230DA40);
  }
  unsigned int v30 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#AuthDatabaseMigration_0 successfully migrated from legacy clients.plist", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230DA40);
    }
    __int16 v31 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAuthorizationDatabase _internalMigrationLegacyKeys]", "%s\n", v31);
    if (v31 != (char *)buf) {
      free(v31);
    }
  }
}

- (void)_internalMigrationClearUnknownKeys
{
  id v3 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] allKeys];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    CFStringRef v16 = @"SubIdentities";
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v7);
        [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = +[CLClientKeyPath clientKeyPathWithClientKey:v8];
          if ([(CLClientKeyPath *)v9 isValidCKP])
          {
            if (![(CLClientKeyPath *)v9 isAuthLimited]) {
              goto LABEL_25;
            }
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
            unsigned int v10 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
            {
              id v11 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v8];
              *(_DWORD *)uint64_t buf = 68289538;
              int v22 = 0;
              __int16 v23 = 2082;
              uint64_t v24 = "";
              __int16 v25 = 2114;
              uint64_t v26 = v8;
              __int16 v27 = 2114;
              id v28 = v11;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration found auth limited key. Removing from database\", \"key\":%{public, location:escape_only}@, \"value\":%{public, location:escape_only}@}", buf, 0x26u);
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_10230DA40);
              }
            }
            id v12 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
            {
LABEL_23:
              id v15 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v8];
              *(_DWORD *)uint64_t buf = 68289538;
              int v22 = 0;
              __int16 v23 = 2082;
              uint64_t v24 = "";
              __int16 v25 = 2114;
              uint64_t v26 = v8;
              __int16 v27 = 2114;
              id v28 = v15;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabaseDroppingData Removing dictionary for key\", \"Key\":%{public, location:escape_only}@, \"Dictionary\":%{public, location:escape_only}@}", buf, 0x26u);
            }
          }
          else
          {
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
            uint64_t v13 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
            {
              id v14 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v8];
              *(_DWORD *)uint64_t buf = 68289538;
              int v22 = 0;
              __int16 v23 = 2082;
              uint64_t v24 = "";
              __int16 v25 = 2114;
              uint64_t v26 = v8;
              __int16 v27 = 2114;
              id v28 = v14;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration found key without anchor. Removing from database\", \"key\":%{public, location:escape_only}@, \"value\":%{public, location:escape_only}@}", buf, 0x26u);
            }
            [objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v8), "objectForKeyedSubscript:", @"AnchorKeyPath")) objectForKeyedSubscript:v16) removeObject:v8];
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_10230DA40);
            }
            id v12 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_23;
            }
          }
          [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] removeObjectForKey:v8];
          [(CLPersistentDictionary *)self markModifiedDirty];
        }
LABEL_25:
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v29 count:16];
    }
    while (v5);
  }
}

- (void)_internalMigrationRegisterAllClients
{
  id v3 = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] allKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v8];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && !objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v8), "objectForKeyedSubscript:", @"isSystemService"))
        {
          uint64_t v9 = +[CLClientKeyPath clientKeyPathWithClientKey:v8];
          if (![(CLClientKeyPath *)v9 subIdentityId]
            && (objc_msgSend(-[CLAuthorizationDatabase registerClient:fromAuthSync:](self, "registerClient:fromAuthSync:", v9, 0), "isValidCKP") & 1) == 0)
          {
            [(CLAuthorizationDatabase *)self removeDictionaryAtKeyPath:v9];
          }
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)getStateSummary
{
  id v11 = +[NSMutableDictionary dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] allKeys];
  id v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [(NSMutableDictionary *)[(CLPersistentDictionary *)self underlyingDictionary] objectForKeyedSubscript:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = +[CLClientKeyPath clientKeyPathWithClientKey:v7];
          id v9 = [[objc_msgSend(-[CLAuthorizationDatabase readonlyStoreAtKeyPath:](self, "readonlyStoreAtKeyPath:", v8), "dictionary") mutableCopy];
          if (![v9 objectForKeyedSubscript:@"IsAppClip"]) {
            [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:@"IsAppClip"];
          }
          if (![v9 objectForKeyedSubscript:@"isSystemService"]) {
            [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isSystemService"];
          }
          if (![v9 objectForKeyedSubscript:@"isHarvestableSystemService"]) {
            [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isHarvestableSystemService"];
          }
          if (![v9 objectForKeyedSubscript:@"SuppressShowingInSettings"]) {
            [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:@"SuppressShowingInSettings"];
          }
          if (![v9 objectForKeyedSubscript:@"Authorization"]) {
            [v9 setObject:&off_102393A58 forKeyedSubscript:@"Authorization"];
          }
          if (![v9 objectForKeyedSubscript:@"CorrectiveCompensationEnabled"]) {
            [v9 setObject:&off_1023939F8 forKeyedSubscript:@"CorrectiveCompensationEnabled"];
          }
          if (![v9 objectForKeyedSubscript:@"IncidentalUseMode"]) {
            [v9 setObject:&off_102393A70 forKeyedSubscript:@"IncidentalUseMode"];
          }
          if (![v9 objectForKeyedSubscript:@"LocationButtonUseMode"]) {
            [v9 setObject:&off_1023939F8 forKeyedSubscript:@"LocationButtonUseMode"];
          }
          if (![v9 objectForKeyedSubscript:@"InUseLevel"]) {
            [v9 setObject:&off_1023939F8 forKeyedSubscript:@"InUseLevel"];
          }
          [v11 setObject:v9 forKeyedSubscript:-[CLClientKeyPath clientKey](v8, "clientKey")];
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  return v11;
}

- (void)setSystemServicesMap:(id)a3
{
}

- (void)setAlternateIdentitiesMap:(id)a3
{
}

@end