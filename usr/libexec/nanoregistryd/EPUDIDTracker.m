@interface EPUDIDTracker
- (BOOL)UDIDChanged;
- (EPUDIDTracker)init;
- (EPUDIDTracker)initWithCachedEPUDID:(id)a3 systemEPUDID:(id)a4;
- (void)cacheUDID;
@end

@implementation EPUDIDTracker

- (EPUDIDTracker)init
{
  v3 = [[NRPreferences alloc] initWithDomain:@"com.apple.nanoregistry"];
  v4 = [(NRPreferences *)v3 objectForKeyedSubscript:@"testDeviceUDID"];

  if (v4)
  {
    v5 = [EPUDIDData alloc];
    v6 = [(NRPreferences *)v3 objectForKeyedSubscript:@"testDeviceUDID"];
    v7 = [(EPUDIDData *)v5 initWithUDID:v6];
  }
  else
  {
    v6 = +[NRDataFilePaths pathToNanoRegistryUDIDFile];
    v7 = [[EPUDIDData alloc] initFromFile:v6];
    if (!v7)
    {
      v8 = nr_daemon_log();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        v10 = nr_daemon_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412290;
          v20 = v6;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failure getting EPUDID from file %@", (uint8_t *)&v19, 0xCu);
        }
      }
    }
  }

  v11 = (void *)MGCopyAnswer();
  v12 = v11;
  if (v11 && [v11 length])
  {
    v13 = [[EPUDIDData alloc] initWithUDID:v12];
  }
  else
  {
    v14 = nr_daemon_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (v15)
    {
      v16 = nr_daemon_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000FA304((uint64_t)v12, v16);
      }
    }
    v13 = 0;
  }
  v17 = [(EPUDIDTracker *)self initWithCachedEPUDID:v7 systemEPUDID:v13];

  return v17;
}

- (EPUDIDTracker)initWithCachedEPUDID:(id)a3 systemEPUDID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EPUDIDTracker;
  BOOL v9 = [(EPUDIDTracker *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cachedEPUDID, a3);
    objc_storeStrong((id *)&v10->_systemEPUDID, a4);
  }

  return v10;
}

- (void)cacheUDID
{
  if (self->_systemEPUDID)
  {
    cachedEPUDID = self->_cachedEPUDID;
    if (cachedEPUDID && -[EPUDIDData isEqual:](cachedEPUDID, "isEqual:"))
    {
      v4 = nr_daemon_log();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

      if (!v5) {
        return;
      }
      v6 = nr_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "EPUDIDTracker cached EPUDID is up-to-date, no need to cache to disk", buf, 2u);
      }
      goto LABEL_28;
    }
    id v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      BOOL v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        systemEPUDID = self->_systemEPUDID;
        *(_DWORD *)buf = 138412290;
        v25 = systemEPUDID;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Caching %@ to disk", buf, 0xCu);
      }
    }
    v6 = +[NRDataFilePaths pathToNanoRegistryUDIDFile];
    v11 = +[NSKeyedArchiver secureArchivedDataWithRootObject:self->_systemEPUDID];
    objc_super v12 = v11;
    if (v11)
    {
      id v23 = 0;
      unsigned __int8 v13 = [v11 writeToFile:v6 options:268435457 error:&v23];
      id v14 = v23;
      if (v14) {
        unsigned __int8 v15 = 0;
      }
      else {
        unsigned __int8 v15 = v13;
      }
      if ((v15 & 1) == 0)
      {
        v16 = nr_daemon_log();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

        if (v17)
        {
          v18 = nr_daemon_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_1000FA404((uint64_t)v6, v14, v18);
          }
        }
      }
    }
    else
    {
      v21 = nr_daemon_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (!v22) {
        goto LABEL_28;
      }
      objc_super v12 = nr_daemon_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000FA3C0(v12);
      }
    }
  }
  else
  {
    int v19 = nr_daemon_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (!v20) {
      return;
    }
    v6 = nr_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000FA37C(v6);
    }
  }
LABEL_28:
}

- (BOOL)UDIDChanged
{
  cachedEPUDID = self->_cachedEPUDID;
  if (cachedEPUDID)
  {
    if (self->_systemEPUDID) {
      LOBYTE(cachedEPUDID) = !-[EPUDIDData isEqual:](cachedEPUDID, "isEqual:");
    }
    else {
      LOBYTE(cachedEPUDID) = 0;
    }
  }
  return (char)cachedEPUDID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemEPUDID, 0);

  objc_storeStrong((id *)&self->_cachedEPUDID, 0);
}

@end