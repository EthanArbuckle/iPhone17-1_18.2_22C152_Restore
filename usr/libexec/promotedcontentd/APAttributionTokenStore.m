@interface APAttributionTokenStore
+ (id)storageLock;
- (APAttributionTokenStore)initWithStorage:(id)a3;
- (APAttributionTokenStore)initWithStorage:(id)a3 andSize:(unsigned int)a4;
- (APSettingsStorableProtocol)storage;
- (BOOL)addTokens:(id)a3 isDetailed:(BOOL)a4 error:(id *)a5;
- (id)getToken:(BOOL)a3 error:(id *)a4;
- (unint64_t)tokenCount:(BOOL)a3 error:(id *)a4;
- (unsigned)size;
- (void)setSize:(unsigned int)a3;
- (void)setStorage:(id)a3;
@end

@implementation APAttributionTokenStore

- (APAttributionTokenStore)initWithStorage:(id)a3
{
  return [(APAttributionTokenStore *)self initWithStorage:a3 andSize:0];
}

- (APAttributionTokenStore)initWithStorage:(id)a3 andSize:(unsigned int)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APAttributionTokenStore;
  v8 = [(APAttributionTokenStore *)&v13 init];
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v8->_storage, a3);
      v9->_size = a4;
    }
    else
    {
      v10 = APLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Attempting to initialize token store without a storage backing", v12, 2u);
      }
    }
  }

  return v9;
}

+ (id)storageLock
{
  if (qword_100288988 != -1) {
    dispatch_once(&qword_100288988, &stru_100234140);
  }
  v2 = (void *)qword_100288980;

  return v2;
}

- (id)getToken:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v6 = +[APAttributionTokenStore storageLock];
  [v6 lock];

  id v7 = @"com.apple.ap.pc.attribution.tokenCache.standard";
  if (v4) {
    id v7 = @"com.apple.ap.pc.attribution.tokenCache.detailed";
  }
  v8 = v7;
  v9 = APLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = +[APKeychainSettings settingsForThisDeviceOnly:v8];
    *(_DWORD *)buf = 136643075;
    v40 = "-[APAttributionTokenStore getToken:error:]";
    __int16 v41 = 2112;
    id v42 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{sensitive}s Using keychain settings %@", buf, 0x16u);
  }
  v11 = [(APAttributionTokenStore *)self storage];
  v12 = +[APKeychainSettings settingsForThisDeviceOnly:v8];
  id v38 = 0;
  objc_super v13 = [v11 valueForKey:v8 settings:v12 error:&v38];
  id v14 = v38;

  if (v14 && [v14 code] != (id)-25300)
  {
    v15 = APLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v14 code];
      v17 = [v14 localizedDescription];
      *(_DWORD *)buf = 136643331;
      v40 = "-[APAttributionTokenStore getToken:error:]";
      __int16 v41 = 2048;
      id v42 = v16;
      __int16 v43 = 2114;
      v44 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{sensitive}s Error reading tokens from cache code %ld: %{public}@", buf, 0x20u);
    }
    id v18 = [v14 code];
    v19 = [v14 localizedDescription];
    v20 = +[NSString stringWithFormat:@"Error reading tokens from cache code %ld: %@", v18, v19];
    v21 = [v14 userInfo];
    CreateDiagnosticReport();
  }
  if (v13 && [v13 count])
  {
    id v22 = [v13 mutableCopy];
    v23 = [v22 lastObject];
    [v22 removeLastObject];

    v24 = [(APAttributionTokenStore *)self storage];
    v25 = +[APKeychainSettings settingsForThisDeviceOnly:v8];
    id v37 = 0;
    [v24 setValue:v22 forKey:v8 settings:v25 error:&v37];
    id v14 = v37;

    if (v14)
    {
      v26 = APLogForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (const char *)[v14 code];
        v28 = [v14 localizedDescription];
        *(_DWORD *)buf = 134218242;
        v40 = v27;
        __int16 v41 = 2114;
        id v42 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Error setting tokens to cache code %ld: %{public}@", buf, 0x16u);
      }
      id v29 = [v14 code];
      v30 = [v14 localizedDescription];
      v31 = +[NSString stringWithFormat:@"Error setting tokens to cache code %ld: %@", v29, v30];
      v32 = [v14 userInfo];
      CreateDiagnosticReport();

      v33 = +[APAttributionTokenStore storageLock];
      [v33 unlock];

      id v34 = 0;
    }
    else
    {
      v35 = +[APAttributionTokenStore storageLock];
      [v35 unlock];

      id v34 = v23;
    }
  }
  else
  {
    id v22 = +[APAttributionTokenStore storageLock];
    [v22 unlock];
    id v34 = 0;
  }

  return v34;
}

- (unint64_t)tokenCount:(BOOL)a3 error:(id *)a4
{
  v6 = @"com.apple.ap.pc.attribution.tokenCache.standard";
  if (a3) {
    v6 = @"com.apple.ap.pc.attribution.tokenCache.detailed";
  }
  id v7 = v6;
  v8 = +[APAttributionTokenStore storageLock];
  [v8 lock];

  v9 = [(APAttributionTokenStore *)self storage];
  v10 = +[APKeychainSettings settingsForThisDeviceOnly:v7];
  id v17 = 0;
  v11 = [v9 valueForKey:v7 settings:v10 error:&v17];

  id v12 = v17;
  objc_super v13 = +[APAttributionTokenStore storageLock];
  [v13 unlock];

  if (v11)
  {
    id v14 = [v11 count];
  }
  else
  {
    id v15 = [v12 code];
    id v14 = 0;
    if (a4 && v15 != (id)-25300)
    {
      id v14 = 0;
      *a4 = v12;
    }
  }

  return (unint64_t)v14;
}

- (BOOL)addTokens:(id)a3 isDetailed:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = @"com.apple.ap.pc.attribution.tokenCache.standard";
  if (v6) {
    v9 = @"com.apple.ap.pc.attribution.tokenCache.detailed";
  }
  v10 = v9;
  v11 = +[APAttributionTokenStore storageLock];
  [v11 lock];

  id v12 = APLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_super v13 = +[APKeychainSettings settingsForThisDeviceOnly:v10];
    *(_DWORD *)buf = 136643075;
    v44 = "-[APAttributionTokenStore addTokens:isDetailed:error:]";
    __int16 v45 = 2112;
    id v46 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{sensitive}s Using keychain settings %@", buf, 0x16u);
  }
  id v14 = [(APAttributionTokenStore *)self storage];
  id v15 = +[APKeychainSettings settingsForThisDeviceOnly:v10];
  id v40 = 0;
  id v16 = [v14 valueForKey:v10 settings:v15 error:&v40];
  id v17 = v40;

  if (!v17 || [v17 code] == (id)-25300)
  {

    id v18 = +[NSMutableArray array];
    [v18 addObjectsFromArray:v16];
    [v18 addObjectsFromArray:v8];
    id v19 = [v18 count];
    if ((unint64_t)v19 <= [(APAttributionTokenStore *)self size])
    {
      v24 = [(APAttributionTokenStore *)self storage];
      v25 = +[APKeychainSettings settingsForThisDeviceOnly:v10];
      id v39 = 0;
      [v24 setValue:v18 forKey:v10 settings:v25 error:&v39];
      id v17 = v39;

      if (!v17)
      {
        v20 = +[APAttributionTokenStore storageLock];
        [v20 unlock];
        BOOL v33 = 1;
        goto LABEL_18;
      }
      v26 = APLogForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (const char *)[v17 code];
        v28 = [v17 localizedDescription];
        *(_DWORD *)buf = 134218242;
        v44 = v27;
        __int16 v45 = 2114;
        id v46 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Error setting tokens to refill cache code %ld: %{public}@", buf, 0x16u);
      }
      id v29 = [v17 code];
      v30 = [v17 localizedDescription];
      v31 = +[NSString stringWithFormat:@"Error setting tokens to refill cache code %ld: %@", v29, v30];
      v32 = [v17 userInfo];
      CreateDiagnosticReport();

      v20 = +[APAttributionTokenStore storageLock];
      [v20 unlock];
    }
    else
    {
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%{sensitive}s Adding more tokens than space available in cache %lu", "-[APAttributionTokenStore addTokens:isDetailed:error:]", [v18 count]);
      v21 = APLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v44 = (const char *)v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      if (a5)
      {
        NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
        id v42 = v20;
        id v22 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        *a5 = +[NSError errorWithDomain:@"com.apple.ap.attribution.token" code:1300 userInfo:v22];
      }
      v23 = +[APAttributionTokenStore storageLock];
      [v23 unlock];

      id v17 = 0;
    }
    BOOL v33 = 0;
LABEL_18:

    goto LABEL_24;
  }
  id v34 = APLogForCategory();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    id v35 = [v17 code];
    v36 = [v17 localizedDescription];
    *(_DWORD *)buf = 136643331;
    v44 = "-[APAttributionTokenStore addTokens:isDetailed:error:]";
    __int16 v45 = 2048;
    id v46 = v35;
    __int16 v47 = 2114;
    v48 = v36;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%{sensitive}s Error reading tokens from cache code %ld: %{public}@", buf, 0x20u);
  }
  id v37 = [v17 userInfo];
  CreateDiagnosticReport();

  if (a5) {
    *a5 = v17;
  }
  id v18 = +[APAttributionTokenStore storageLock];
  [v18 unlock];
  BOOL v33 = 0;
LABEL_24:

  return v33;
}

- (APSettingsStorableProtocol)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (unsigned)size
{
  return self->_size;
}

- (void)setSize:(unsigned int)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
}

@end