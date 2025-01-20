@interface TLDMobileAssetManager
- (TLDMobileAssetManager)init;
- (unint64_t)installedAssetVersion;
- (void)downloadAsset:(id)a3;
- (void)findBestAssetFrom:(id)a3 skipDownload:(BOOL)a4;
- (void)moveFileAtomically:(id)a3 toLocation:(id)a4;
- (void)moveInstalledAsset:(id)a3 withVersion:(unint64_t)a4;
- (void)queryAndFindBestAsset:(BOOL)a3;
- (void)setInstalledAssetVersion:(unint64_t)a3;
@end

@implementation TLDMobileAssetManager

- (void)setInstalledAssetVersion:(unint64_t)a3
{
  self->_installedAssetVersion = a3;
}

- (unint64_t)installedAssetVersion
{
  return self->_installedAssetVersion;
}

- (void)moveInstalledAsset:(id)a3 withVersion:(unint64_t)a4
{
  id v6 = a3;
  [(TLDMobileAssetManager *)self setInstalledAssetVersion:a4];
  v7 = sub_100046C94();
  if (v7)
  {
    v8 = [v6 getLocalFileUrl];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      v11 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Read Asset at %@", (uint8_t *)&v10, 0xCu);
      if (!v8) {
        goto LABEL_5;
      }
    }
    else if (!v8)
    {
LABEL_5:

      goto LABEL_6;
    }
    v9 = [v8 URLByAppendingPathComponent:@"DafsaData.bin" isDirectory:0];
    [(TLDMobileAssetManager *)self moveFileAtomically:v9 toLocation:v7];

    goto LABEL_5;
  }
LABEL_6:
}

- (void)moveFileAtomically:(id)a3 toLocation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 URLByAppendingPathExtension:@"tmp"];
  v8 = +[NSFileManager defaultManager];
  [v8 removeItemAtURL:v7 error:0];

  v9 = +[NSFileManager defaultManager];
  id v16 = 0;
  unsigned __int8 v10 = [v9 copyItemAtURL:v5 toURL:v7 error:&v16];
  id v11 = v16;

  if (v10)
  {
    v12 = +[NSFileManager defaultManager];
    id v15 = v11;
    unsigned __int8 v13 = [v12 replaceItemAtURL:v6 withItemAtURL:v7 backupItemName:0 options:1 resultingItemURL:0 error:&v15];
    id v14 = v15;

    if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Replacing a file at location %@ failed. Error %@", buf, 0x16u);
    }
    id v11 = v14;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Copying from a file at location %@ failed. Error %@", buf, 0x16u);
  }
}

- (void)downloadAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attributes];
  id v6 = [v5 objectForKeyedSubscript:ASAttributeContentVersion];
  unsigned int v7 = [v6 intValue];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Asset download requested", buf, 2u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000472F0;
  v8[3] = &unk_1000B58C0;
  v8[4] = self;
  unsigned int v9 = v7;
  [v4 startDownload:v8];
}

- (void)findBestAssetFrom:(id)a3 skipDownload:(BOOL)a4
{
  id v5 = a3;
  v28 = self;
  unint64_t v33 = [(TLDMobileAssetManager *)self installedAssetVersion];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v36 objects:v50 count:16];
  if (v6)
  {
    v29 = 0;
    v30 = 0;
    unint64_t v32 = 0;
    uint64_t v7 = *(void *)v37;
    uint64_t v8 = ASAttributeCompatibilityVersion;
    uint64_t v9 = ASAttributeContentVersion;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v12 = [v11 attributes];
        unsigned __int8 v13 = [v12 objectForKeyedSubscript:v8];
        signed int v14 = [v13 intValue];

        id v15 = [v11 attributes];
        id v16 = [v15 objectForKeyedSubscript:v9];
        signed int v17 = [v16 intValue];

        unint64_t v18 = v17;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          id v24 = [v11 state];
          unint64_t v25 = [(TLDMobileAssetManager *)v28 installedAssetVersion];
          *(_DWORD *)buf = 134219008;
          unint64_t v41 = (unint64_t)v24;
          __int16 v42 = 2048;
          unint64_t v43 = v18;
          __int16 v44 = 2048;
          unint64_t v45 = v25;
          __int16 v46 = 2048;
          unint64_t v47 = v33;
          __int16 v48 = 2048;
          unint64_t v49 = v32;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Asset (state %ld  Version %ld),  Current version %ld,  best installed version %ld,  best not installed version %ld", buf, 0x34u);
        }
        if (v14 == 3)
        {
          if ([v11 state] == (id)2)
          {
            if (v33 < v18)
            {
              id v19 = v11;
              if (v32 <= v18)
              {

                v29 = 0;
                unint64_t v32 = 0;
              }
              if (v30)
              {
                id v20 = [v30 attributes];
                v21 = [v20 objectForKeyedSubscript:v9];

                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  unint64_t v41 = (unint64_t)v21;
                  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Purging asset version %@", buf, 0xCu);
                }
                v34[0] = _NSConcreteStackBlock;
                v34[1] = 3221225472;
                v34[2] = sub_1000479EC;
                v34[3] = &unk_1000B5898;
                id v22 = v21;
                id v35 = v22;
                [v30 purge:v34];
              }
              v30 = v19;
              unint64_t v33 = v18;
            }
          }
          else if (v32 < v18 && v33 < v18)
          {
            id v23 = v11;

            v29 = v23;
            unint64_t v32 = v18;
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          unint64_t v41 = v18;
          __int16 v42 = 2048;
          unint64_t v43 = v14;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Asset version %lu has compatibilty version set to %lu. Not supported on the current OS", buf, 0x16u);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v36 objects:v50 count:16];
    }
    while (v6);

    if (v29 && !a4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v41 = v32;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Download best not installed asset ver %lu", buf, 0xCu);
      }
      [(TLDMobileAssetManager *)v28 downloadAsset:v29];
    }
    if (v30)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v41 = v33;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Read installed asset ver %lu", buf, 0xCu);
      }
      [(TLDMobileAssetManager *)v28 moveInstalledAsset:v30 withVersion:v33];
    }
    else
    {
      v30 = 0;
    }
    v26 = v29;
  }
  else
  {

    v26 = 0;
    v30 = 0;
  }
}

- (void)queryAndFindBestAsset:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.TopLevelDomainDafsa"];
  [v5 returnTypes:2];
  id v6 = [v5 queryMetaDataSync];
  unsigned int v7 = [v5 isCatalogFetchedWithinThePastFewDays:5];
  if (v6) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = v7;
  }
  if (v8 != 1)
  {
LABEL_9:
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100047C8C;
    v12[3] = &unk_1000B5870;
    v12[4] = self;
    BOOL v13 = v3;
    +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.TopLevelDomainDafsa" then:v12];
    goto LABEL_10;
  }
  uint64_t v9 = [v5 results];
  id v10 = [v9 count];

  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Empty results for asset update query", buf, 2u);
    }
    goto LABEL_9;
  }
  id v11 = [v5 results];
  [(TLDMobileAssetManager *)self findBestAssetFrom:v11 skipDownload:v3];

LABEL_10:
}

- (TLDMobileAssetManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)TLDMobileAssetManager;
  v2 = [(TLDMobileAssetManager *)&v10 init];
  if (v2)
  {
    sub_100046C94();
    id v3 = objc_claimAutoreleasedReturnValue();
    int v4 = open((const char *)[v3 fileSystemRepresentation], 0);
    int v5 = v4;
    if (v4 != -1)
    {
      unsigned int v12 = 0;
      ssize_t v6 = read(v4, &v12, 4uLL);
      close(v5);
      if (v6 != -1)
      {
        if (v12 >= 0x10000) {
          uint64_t v7 = v12 - 0x10000;
        }
        else {
          uint64_t v7 = 0;
        }

        p_installedAssetVersion = &v2->_installedAssetVersion;
        if (v7 >= 0x2C) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error reading the TLD Asset version", buf, 2u);
      }
    }

    p_installedAssetVersion = &v2->_installedAssetVersion;
LABEL_12:
    uint64_t v7 = 44;
LABEL_13:
    void *p_installedAssetVersion = v7;
  }
  return v2;
}

@end