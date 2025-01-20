@interface GTURLAccessProvider
- (BOOL)_sharesFileSystemWith:(id)a3 remoteConnection:(id)a4;
- (GTURLAccessProvider)initWithServiceProvider:(id)a3 connectionProvider:(id)a4 serviceVendor:(id)a5;
- (id)makeURL:(id)a3;
- (id)urlForPath:(id)a3;
- (void)copyIdentifier:(id)a3 toDevice:(id)a4 allowLocalURL:(BOOL)a5 completionHandler:(id)a6;
- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4;
- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
@end

@implementation GTURLAccessProvider

- (GTURLAccessProvider)initWithServiceProvider:(id)a3 connectionProvider:(id)a4 serviceVendor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v10 && v11)
  {
    v22.receiver = self;
    v22.super_class = (Class)GTURLAccessProvider;
    v14 = [(GTURLAccessProvider *)&v22 init];
    if (v14)
    {
      os_log_t v15 = os_log_create("com.apple.gputools.transport", "URLAccessProvider");
      log = v14->_log;
      v14->_log = (OS_os_log *)v15;

      uint64_t v17 = objc_opt_new();
      registeredURLs = v14->_registeredURLs;
      v14->_registeredURLs = (NSMutableDictionary *)v17;

      uint64_t v19 = +[GTDeviceProperties uniqueDeviceID];
      deviceUDID = v14->_deviceUDID;
      v14->_deviceUDID = (NSString *)v19;

      objc_storeStrong((id *)&v14->_serviceProvider, a3);
      objc_storeStrong((id *)&v14->_connectionProvider, a4);
      objc_storeStrong((id *)&v14->_serviceVendor, a5);
    }
    self = v14;
    v13 = self;
  }

  return v13;
}

- (id)urlForPath:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_registeredURLs;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredURLs, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * v9), (void)v14);
      id v11 = [v10 path];
      unsigned __int8 v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }

      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v10 = 0;
  }

  return v10;
}

- (BOOL)_sharesFileSystemWith:(id)a3 remoteConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  unsigned __int8 v9 = 0;
  if (v6 && v7)
  {
    if ([(NSString *)self->_deviceUDID isEqualToString:v6])
    {
      unsigned __int8 v9 = 1;
    }
    else
    {
      id v10 = [(GTServiceProvider *)self->_serviceProvider allServices];
      id v11 = filteredArrayByService(v10, (Protocol *)&OBJC_PROTOCOL___GTSimulatorDeviceBrowser);
      unsigned __int8 v12 = [v11 firstObject];

      serviceVendor = self->_serviceVendor;
      long long v14 = [v12 serviceProperties];
      long long v15 = [(GTServiceVendor *)serviceVendor getSimulatorDeviceBrowserService:v14];

      unsigned __int8 v9 = [v15 isSimulatorDevice:v6];
    }
  }

  return v9;
}

- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = v6;
  if (!v8) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  unsigned __int8 v9 = [v8 scheme];
  unsigned int v10 = [v9 isEqualToString:@"gtsandboxid"];

  if (v10 && ([v8 host], id v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    unsigned __int8 v12 = [v8 path];

    if (v12)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        sub_10001161C();
      }
      uint64_t v13 = [(NSMutableDictionary *)self->_registeredURLs objectForKeyedSubscript:v8];
      if (v13)
      {
        long long v14 = (void *)v13;
        long long v15 = +[NSFileManager defaultManager];
        long long v16 = [v14 path];
        unsigned int v17 = [v15 fileExistsAtPath:v16];

        log = self->_log;
        if (v17)
        {
          if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
            sub_10001154C();
          }
          v7[2](v7, v14);
LABEL_37:

          goto LABEL_17;
        }
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
          sub_1000115B4();
        }

        [(NSMutableDictionary *)self->_registeredURLs removeObjectForKey:v8];
      }
      long long v14 = [v8 host];
      v27 = [(GTConnectionProvider *)self->_connectionProvider connectionForDeviceUDID:v14];
      v28 = v27;
      if (v27)
      {
        v29 = allServicesForDeviceUDID(v27, v14);
        v30 = filteredArrayByService(v29, (Protocol *)&OBJC_PROTOCOL___GTURLAccessProvider);
        v31 = [v30 firstObject];

        if (v31)
        {
          v32 = [GTURLAccessProviderXPCProxy alloc];
          v33 = [v31 serviceProperties];
          v34 = [(GTURLAccessProviderXPCProxy *)v32 initWithConnection:v28 remoteProperties:v33];

          if ([(GTURLAccessProvider *)self _sharesFileSystemWith:v14 remoteConnection:v28])
          {
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472;
            v54[2] = sub_100009BB4;
            v54[3] = &unk_100034890;
            v54[4] = self;
            v35 = &v55;
            id v36 = v8;
            id v55 = v36;
            v37 = (id *)&v56;
            v56 = v7;
            [(GTURLAccessProviderXPCProxy *)v34 securityScopedURLFromSandboxID:v36 completionHandler:v54];
          }
          else
          {
            char v46 = objc_opt_respondsToSelector();
            deviceUDID = self->_deviceUDID;
            if (v46)
            {
              v51[0] = _NSConcreteStackBlock;
              v51[1] = 3221225472;
              v51[2] = sub_100009C24;
              v51[3] = &unk_1000348B8;
              v51[4] = self;
              v35 = (id *)&v53;
              v53 = v7;
              v37 = &v52;
              id v52 = v8;
              [(GTURLAccessProviderXPCProxy *)v34 copyIdentifier:v52 toDevice:deviceUDID completionHandler:v51];
            }
            else
            {
              v48[0] = _NSConcreteStackBlock;
              v48[1] = 3221225472;
              v48[2] = sub_100009E10;
              v48[3] = &unk_1000348E0;
              v48[4] = self;
              v35 = (id *)&v50;
              v50 = v7;
              v37 = &v49;
              id v49 = v8;
              [(GTURLAccessProviderXPCProxy *)v34 transferIdentifier:v49 toDevice:deviceUDID completionHandler:v48];
            }
          }
        }
        else
        {
          v38 = self->_log;
          if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR)) {
            sub_100011514(v38, v39, v40, v41, v42, v43, v44, v45);
          }
          v7[2](v7, 0);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          sub_1000114AC();
        }
        v7[2](v7, 0);
      }

      goto LABEL_37;
    }
  }
  else
  {
LABEL_13:
  }
  uint64_t v19 = self->_log;
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
    sub_100011474(v19, v20, v21, v22, v23, v24, v25, v26);
  }
  v7[2](v7, 0);
LABEL_17:
}

- (id)makeURL:(id)a3
{
  ++dword_100041CF8;
  id v4 = a3;
  v5 = [v4 path];
  id v6 = +[NSCharacterSet URLPathAllowedCharacterSet];
  id v7 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v6];

  id v8 = +[NSString stringWithFormat:@"%@://%@/%@?id=%u", @"gtsandboxid", self->_deviceUDID, v7, dword_100041CF8];
  unsigned __int8 v9 = +[NSURL URLWithString:v8];
  [(NSMutableDictionary *)self->_registeredURLs setObject:v4 forKeyedSubscript:v9];

  return v9;
}

- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A074;
  v9[3] = &unk_100034908;
  id v10 = a5;
  id v8 = v10;
  [(GTURLAccessProvider *)self copyIdentifier:a3 toDevice:a4 allowLocalURL:0 completionHandler:v9];
}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 allowLocalURL:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v67 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  id v12 = v10;
  id v13 = a6;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100011900();
  }
  long long v14 = [(NSMutableDictionary *)self->_registeredURLs objectForKeyedSubscript:v9];
  if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100011898();
  }
  long long v15 = [(GTConnectionProvider *)v11->_connectionProvider connectionForDeviceUDID:v12];
  v68 = v15;
  if (v15)
  {
    long long v16 = v15;
    uint64_t v17 = sub_10000A84C(v15, v12, v11->_connectionProvider);
    v18 = v11;
    v64 = (void *)v17;
    v65 = v14;
    if (v17)
    {
      uint64_t v19 = (void *)v17;
      id v62 = v9;
      v63 = v18;
      v60 = v13;
      id v61 = v12;
      uint64_t v20 = [GTFileWriterServiceXPCProxy alloc];
      uint64_t v21 = [v19 serviceProperties];
      v66 = [(GTFileWriterServiceXPCProxy *)v20 initWithConnection:v16 remoteProperties:v21];

      if (([v14 startAccessingSecurityScopedResource] & 1) == 0
        && os_log_type_enabled((os_log_t)v63->_log, OS_LOG_TYPE_DEBUG))
      {
        sub_100011830();
      }
      id v22 = v14;
      uint64_t v23 = +[NSFileManager defaultManager];
      NSURLResourceKey v24 = NSURLIsDirectoryKey;
      v94[0] = NSURLIsDirectoryKey;
      v94[1] = NSURLFileSizeKey;
      v94[2] = NSURLIsSymbolicLinkKey;
      uint64_t v25 = +[NSArray arrayWithObjects:v94 count:3];
      uint64_t v26 = [v23 enumeratorAtURL:v22 includingPropertiesForKeys:v25 options:0 errorHandler:&stru_100034B28];

      id v70 = objc_alloc_init((Class)NSMutableArray);
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id obj = v26;
      id v27 = [obj countByEnumeratingWithState:&v85 objects:v93 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v86;
        uint64_t v69 = *(void *)v86;
        do
        {
          v30 = 0;
          id v71 = v28;
          do
          {
            if (*(void *)v86 != v29) {
              objc_enumerationMutation(obj);
            }
            v31 = *(void **)(*((void *)&v85 + 1) + 8 * (void)v30);
            id v83 = 0;
            id v84 = 0;
            [v31 getResourceValue:&v84 forKey:v24 error:&v83];
            id v33 = v84;
            id v34 = v83;
            if (([v33 BOOLValue] & 1) == 0)
            {
              id v81 = 0;
              id v82 = 0;
              [v31 getResourceValue:&v82 forKey:NSURLIsSymbolicLinkKey error:&v81];
              id v35 = v82;
              id v73 = v81;

              id v36 = sub_1000112C4(v31, v22);
              if ([v35 BOOLValue])
              {
                id v37 = [v31 URLByResolvingSymlinksInPath];
                sub_1000112C4(v37, v22);
                v38 = (GTFileEntry *)objc_claimAutoreleasedReturnValue();
                uint64_t v39 = [[GTFileEntry alloc] initWithLink:v36 destination:v38];
                [v70 addObject:v39];
              }
              else
              {
                id v79 = 0;
                v80 = 0;
                [v31 getResourceValue:&v80 forKey:NSURLFileSizeKey error:&v79];
                id v40 = v22;
                uint64_t v41 = v80;
                id v37 = v79;
                id v42 = v41;
                uint64_t v43 = [GTFileEntry alloc];
                id v44 = [v42 unsignedIntegerValue];

                id v45 = v44;
                id v22 = v40;
                NSURLResourceKey v24 = NSURLIsDirectoryKey;
                v38 = [(GTFileEntry *)v43 initWithPath:v36 fileSize:v45];
                [v70 addObject:v38];
              }

              id v34 = v73;
              id v28 = v71;
              uint64_t v29 = v69;
            }

            v30 = (char *)v30 + 1;
          }
          while (v28 != v30);
          id v28 = [obj countByEnumeratingWithState:&v85 objects:v93 count:16];
        }
        while (v28);
      }

      id v46 = [v70 copy];
      [v22 stopAccessingSecurityScopedResource];
      v47 = objc_opt_new();
      if (v67 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v48 = [v22 path];
        deviceUDID = v63->_deviceUDID;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        v77[2] = sub_10000A91C;
        v77[3] = &unk_100034908;
        v50 = &v78;
        id v13 = v60;
        id v78 = v60;
        [(GTFileWriterServiceXPCProxy *)v66 startTransfer:v46 basePath:v48 fromDevice:deviceUDID options:v47 completionHandler:v77];
      }
      else
      {
        id v55 = [v22 path];
        v56 = v63->_deviceUDID;
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472;
        v74[2] = sub_10000A92C;
        v74[3] = &unk_100034930;
        v50 = &v76;
        id v13 = v60;
        id v76 = v60;
        id v75 = v22;
        [(GTFileWriterServiceXPCProxy *)v66 initiateTransfer:v46 basePath:v55 fromDevice:v56 options:v47 completionHandler:v74];

        v48 = v75;
      }

      id v12 = v61;
      id v9 = v62;
      v57 = v66;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_ERROR)) {
        sub_1000117C8();
      }
      NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
      v58 = +[NSString stringWithFormat:@"Missing file writer service for device: %@", v12];
      v90 = v58;
      v59 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
      v57 = +[NSError errorWithDomain:@"com.apple.gputools.urlaccessprovider" code:1 userInfo:v59];

      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v57);
    }

    v54 = v64;
    v51 = v65;
  }
  else
  {
    v51 = v14;
    if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_ERROR)) {
      sub_100011760();
    }
    NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
    id v52 = +[NSString stringWithFormat:@"Missing connection for device: %@", v12];
    v92 = v52;
    v53 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    v54 = +[NSError errorWithDomain:@"com.apple.gputools.urlaccessprovider" code:0 userInfo:v53];

    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v54);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceVendor, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_registeredURLs, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end