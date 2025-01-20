@interface MBiTunesStoreKVS
+ (id)iTunesStoreKVS;
+ (id)mergeKnownAccountsByDSID:(id)a3 into:(id)a4;
- (MBiTunesStoreKVS)init;
- (SSKeyValueStore)KVS;
- (id)knownAccounts;
- (id)knownAccountsByDSID;
- (id)valueForDomain:(id)a3 key:(id)a4;
- (void)dealloc;
- (void)removeAllValues;
- (void)setKnownAccounts:(id)a3;
- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5;
- (void)setValuesWithDictionary:(id)a3 forDomain:(id)a4;
@end

@implementation MBiTunesStoreKVS

+ (id)iTunesStoreKVS
{
  v2 = objc_alloc_init(MBiTunesStoreKVS);
  return v2;
}

- (MBiTunesStoreKVS)init
{
  v4.receiver = self;
  v4.super_class = (Class)MBiTunesStoreKVS;
  v2 = [(MBiTunesStoreKVS *)&v4 init];
  if (v2) {
    v2->_KVS = (SSKeyValueStore *)objc_alloc_init((Class)SSKeyValueStore);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBiTunesStoreKVS;
  [(MBiTunesStoreKVS *)&v3 dealloc];
}

- (id)valueForDomain:(id)a3 key:(id)a4
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3052000000;
  v22 = sub_10024FB24;
  v23 = sub_10024FB34;
  uint64_t v24 = 0;
  v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    id v26 = a3;
    __int16 v27 = 2112;
    id v28 = a4;
    __int16 v29 = 2112;
    uint64_t v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Getting value %@/%@ from %@", buf, 0x20u);
    objc_opt_class();
    _MBLog();
  }
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  KVS = self->_KVS;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10024FB40;
  v18[3] = &unk_100417378;
  v18[4] = v9;
  v18[5] = &v19;
  [(SSKeyValueStore *)KVS getValueForDomain:a3 key:a4 usingBlock:v18];
  MBSemaphoreWaitForever();
  if (v20[5])
  {
    v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = v20[5];
      *(_DWORD *)buf = 138413058;
      id v26 = a3;
      __int16 v27 = 2112;
      id v28 = a4;
      __int16 v29 = 2112;
      uint64_t v30 = v12;
      __int16 v31 = 2112;
      uint64_t v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Found value %@/%@ from %@: %@", buf, 0x2Au);
      objc_opt_class();
      _MBLog();
    }
  }
  else
  {
    v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      id v26 = a3;
      __int16 v27 = 2112;
      id v28 = a4;
      __int16 v29 = 2112;
      uint64_t v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Didn't find value %@/%@ in %@", buf, 0x20u);
      objc_opt_class();
      _MBLog();
    }
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  dispatch_semaphore_t v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = objc_opt_class();
    *(_DWORD *)buf = 138413058;
    id v20 = a4;
    __int16 v21 = 2112;
    id v22 = a5;
    __int16 v23 = 2112;
    uint64_t v24 = v10;
    __int16 v25 = 2112;
    id v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Setting value %@/%@ in %@: %@", buf, 0x2Au);
    objc_opt_class();
    _MBLog();
  }
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  KVS = self->_KVS;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10024FD90;
  v14[3] = &unk_1004173A0;
  v14[4] = v11;
  v14[5] = &v15;
  [(SSKeyValueStore *)KVS setValue:a3 forDomain:a4 key:a5 completionBlock:v14];
  MBSemaphoreWaitForever();
  if (!*((unsigned char *)v16 + 24))
  {
    id v13 = [objc_alloc((Class)MBException) initWithCode:1, @"Failed to set value %@/%@ in %@", a4, a5, objc_opt_class() format];
    objc_exception_throw(v13);
  }
  _Block_object_dispose(&v15, 8);
}

- (void)setValuesWithDictionary:(id)a3 forDomain:(id)a4
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    id v18 = a4;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting values with dictionary %@ in %@: %@", buf, 0x20u);
    objc_opt_class();
    _MBLog();
  }
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  KVS = self->_KVS;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10024FF98;
  v12[3] = &unk_1004173A0;
  v12[4] = v9;
  v12[5] = &v13;
  [(SSKeyValueStore *)KVS setValuesWithDictionary:a3 forDomain:a4 completionBlock:v12];
  MBSemaphoreWaitForever();
  if (!*((unsigned char *)v14 + 24))
  {
    id v11 = [objc_alloc((Class)MBException) initWithCode:1, @"Failed to set values with dictionary %@/%@ in %@", a4, objc_opt_class(), a3 format];
    objc_exception_throw(v11);
  }
  _Block_object_dispose(&v13, 8);
}

- (void)removeAllValues
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing all values from %@", buf, 0xCu);
    objc_opt_class();
    _MBLog();
  }
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  KVS = self->_KVS;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10025016C;
  v8[3] = &unk_1004173A0;
  v8[4] = v5;
  v8[5] = &v9;
  [(SSKeyValueStore *)KVS removeAllValuesWithCompletionBlock:v8];
  MBSemaphoreWaitForever();
  if (!*((unsigned char *)v10 + 24))
  {
    id v7 = [objc_alloc((Class)MBException) initWithCode:1, @"Failed to remove all values from %@", objc_opt_class() format];
    objc_exception_throw(v7);
  }
  _Block_object_dispose(&v9, 8);
}

+ (id)mergeKnownAccountsByDSID:(id)a3 into:(id)a4
{
  v6 = +[NSMutableDictionary dictionaryWithDictionary:a4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (![a4 objectForKeyedSubscript:v11]) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:v11], v11);
        }
      }
      id v8 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v6;
}

- (id)knownAccounts
{
  id v2 = [(MBiTunesStoreKVS *)self valueForDomain:@"com.apple.mobile.iTunes.store" key:@"KnownAccounts"];
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = MBGetDefaultLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 138412802;
      CFStringRef v16 = @"com.apple.mobile.iTunes.store";
      __int16 v17 = 2112;
      CFStringRef v18 = @"KnownAccounts";
      __int16 v19 = 2112;
      uint64_t v20 = objc_opt_class();
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@/%@ not an array in %@", buf, 0x20u);
LABEL_16:
      objc_opt_class();
      _MBLog();
      return 0;
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = [v2 countByEnumeratingWithState:&v11 objects:v21 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v12;
LABEL_5:
      uint64_t v6 = 0;
      while (1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v4 == (id)++v6)
        {
          id v4 = [v2 countByEnumeratingWithState:&v11 objects:v21 count:16];
          if (v4) {
            goto LABEL_5;
          }
          return v2;
        }
      }
      id v8 = MBGetDefaultLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      uint64_t v9 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      CFStringRef v16 = @"com.apple.mobile.iTunes.store";
      __int16 v17 = 2112;
      CFStringRef v18 = @"KnownAccounts";
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@/%@ item not a dictionary in %@", buf, 0x20u);
      goto LABEL_16;
    }
  }
  return v2;
}

- (id)knownAccountsByDSID
{
  id v2 = [(MBiTunesStoreKVS *)self knownAccounts];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v2 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [v3 countByEnumeratingWithState:&v19 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"DSPersonID", v14, v15, v16, v17, v18);
        if (v10)
        {
          [(NSMutableDictionary *)v4 setObject:v9 forKeyedSubscript:v10];
        }
        else
        {
          long long v11 = MBGetDefaultLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = objc_opt_class();
            *(_DWORD *)buf = 138413314;
            CFStringRef v24 = @"DSPersonID";
            __int16 v25 = 2112;
            CFStringRef v26 = @"com.apple.mobile.iTunes.store";
            __int16 v27 = 2112;
            CFStringRef v28 = @"KnownAccounts";
            __int16 v29 = 2112;
            uint64_t v30 = v9;
            __int16 v31 = 2112;
            uint64_t v32 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ not in %@/%@ value in %@: %@", buf, 0x34u);
            __int16 v17 = v9;
            uint64_t v18 = objc_opt_class();
            CFStringRef v15 = @"com.apple.mobile.iTunes.store";
            CFStringRef v16 = @"KnownAccounts";
            CFStringRef v14 = @"DSPersonID";
            _MBLog();
          }
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v19 objects:v33 count:16];
    }
    while (v6);
  }
  return v4;
}

- (void)setKnownAccounts:(id)a3
{
}

- (SSKeyValueStore)KVS
{
  return self->_KVS;
}

@end