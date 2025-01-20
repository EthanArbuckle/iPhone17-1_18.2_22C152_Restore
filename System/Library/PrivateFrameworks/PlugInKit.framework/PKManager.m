@interface PKManager
+ (id)defaultManager;
+ (id)managerForUser:(unsigned int)a3;
- (BOOL)releaseHold:(id)a3 flags:(unint64_t)a4 withError:(id *)a5;
- (BOOL)releaseHold:(id)a3 withError:(id *)a4;
- (BOOL)terminatePlugInAtURL:(id)a3 withError:(id *)a4;
- (PKDaemonClient)client;
- (PKExternalProviders)external;
- (PKManager)initWithDaemon:(id)a3;
- (PKManager)initWithDaemon:(id)a3 externalProviders:(id)a4;
- (PKManager)initWithExternalProviders:(id)a3;
- (id)containingAppForExtensionProperties:(id)a3;
- (id)containingAppForPlugInConnectedTo:(id)a3;
- (id)containingAppForPlugInWithPid:(int)a3;
- (id)forceHoldPlugIn:(id)a3 withError:(id *)a4;
- (id)holdPlugInsInApplication:(id)a3 withError:(id *)a4;
- (id)holdPlugInsWithExtensionPointName:(id)a3 error:(id *)a4;
- (id)holdPlugInsWithExtensionPointName:(id)a3 platforms:(id)a4 terminate:(BOOL)a5 error:(id *)a6;
- (id)informationForPlugInWithPid:(int)a3;
- (id)initForService:(const char *)a3;
- (id)initForUser:(unsigned int)a3;
- (id)terminatePlugInsInApplication:(id)a3 options:(int64_t)a4 withError:(id *)a5;
- (void)forceHoldPlugIn:(id)a3 result:(id)a4;
- (void)holdPlugInsInApplication:(id)a3 result:(id)a4;
- (void)holdPlugInsWithExtensionPointName:(id)a3 platforms:(id)a4 terminate:(BOOL)a5 result:(id)a6;
- (void)holdPlugInsWithExtensionPointName:(id)a3 result:(id)a4;
- (void)holdRequest:(id)a3 extensionPointName:(id)a4 platforms:(id)a5 flags:(unint64_t)a6 result:(id)a7;
- (void)holdRequest:(id)a3 flags:(unint64_t)a4 result:(id)a5;
- (void)registerPlugInAtURL:(id)a3 result:(id)a4;
- (void)registerPlugInsInBundle:(id)a3 result:(id)a4;
- (void)releaseHold:(id)a3;
- (void)releaseHold:(id)a3 reply:(id)a4;
- (void)setClient:(id)a3;
- (void)terminatePlugInsInApplication:(id)a3 options:(int64_t)a4 result:(id)a5;
- (void)unregisterPlugInAtURL:(id)a3 result:(id)a4;
- (void)unregisterPlugInsInBundle:(id)a3 result:(id)a4;
- (void)updateExtensionStatesForPlugIns:(id)a3 result:(id)a4;
@end

@implementation PKManager

+ (id)defaultManager
{
  if (qword_1EB2BE0F0 != -1) {
    dispatch_once(&qword_1EB2BE0F0, &unk_1F0C15530);
  }
  v2 = (void *)qword_1EB2BE0E8;
  return v2;
}

+ (id)managerForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_1E9CD2AE0 != -1) {
    dispatch_once(&qword_1E9CD2AE0, &unk_1F0C15570);
  }
  v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v3];
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1E9CD2AF0);
  id v5 = [(id)qword_1E9CD2AE8 objectForKey:v4];
  if (!v5)
  {
    id v5 = [[PKManager alloc] initForUser:v3];
    [(id)qword_1E9CD2AE8 setObject:v5 forKey:v4];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1E9CD2AF0);

  return v5;
}

- (id)initForService:(const char *)a3
{
  v4 = [[PKDaemonClient alloc] initWithServiceName:a3];
  id v5 = [(PKManager *)self initWithDaemon:v4];

  return v5;
}

- (id)initForUser:(unsigned int)a3
{
  v4 = [[PKDaemonClient alloc] initWithServiceName:0 user:*(void *)&a3];
  id v5 = [(PKManager *)self initWithDaemon:v4];

  return v5;
}

- (PKManager)initWithDaemon:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = [(PKManager *)self initWithDaemon:v4 externalProviders:v5];

  return v6;
}

- (PKManager)initWithDaemon:(id)a3 externalProviders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKManager;
  v8 = [(PKManager *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(PKManager *)v8 setClient:v6];
    objc_storeStrong((id *)&v9->_external, a4);
  }

  return v9;
}

- (PKManager)initWithExternalProviders:(id)a3
{
  id v4 = a3;
  id v5 = [[PKDaemonClient alloc] initWithServiceName:0];
  id v6 = [(PKManager *)self initWithDaemon:v5 externalProviders:v4];

  return v6;
}

- (void)registerPlugInAtURL:(id)a3 result:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PKManager *)self client];
  objc_initWeak(&location, v8);

  objc_initWeak(&from, self);
  v9 = pklog_handle_for_category(12);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v6 path];
    *(_DWORD *)buf = 134218242;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1B38B0000, v9, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> register plugin at [%@]", buf, 0x16u);
  }
  objc_super v11 = [(PKManager *)self client];
  v12 = (void *)MEMORY[0x1E4F1C978];
  v13 = [v6 path];
  v14 = [v12 arrayWithObject:v13];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B38CE69C;
  v17[3] = &unk_1E6059928;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  id v15 = v6;
  id v18 = v15;
  id v16 = v7;
  id v19 = v16;
  [v11 addPlugIns:v14 reply:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)unregisterPlugInAtURL:(id)a3 result:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PKManager *)self client];
  objc_initWeak(&location, v8);

  objc_initWeak(&from, self);
  v9 = pklog_handle_for_category(12);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v6 path];
    *(_DWORD *)buf = 134218242;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1B38B0000, v9, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> unregister plugin at [%@]", buf, 0x16u);
  }
  objc_super v11 = [(PKManager *)self client];
  v12 = (void *)MEMORY[0x1E4F1C978];
  v13 = [v6 path];
  v14 = [v12 arrayWithObject:v13];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B38CEA3C;
  v17[3] = &unk_1E6059928;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  id v15 = v6;
  id v18 = v15;
  id v16 = v7;
  id v19 = v16;
  [v11 removePlugIns:v14 reply:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)registerPlugInsInBundle:(id)a3 result:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v28 = a4;
  if (v6) {
    [MEMORY[0x1E4F28B50] bundleWithURL:v6];
  }
  else {
  id v7 = [MEMORY[0x1E4F28B50] mainBundle];
  }
  v8 = pklog_handle_for_category(12);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 path];
    v10 = [v7 bundlePath];
    *(_DWORD *)buf = 134218498;
    v43 = self;
    __int16 v44 = 2112;
    v45 = v9;
    __int16 v46 = 2112;
    id v47 = v10;
    _os_log_impl(&dword_1B38B0000, v8, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> register plugins in bundle at [%@] resolved to [%@]", buf, 0x20u);
  }
  v29 = [v7 builtInPlugInsURL];
  objc_super v11 = [(PKManager *)self external];
  v12 = [v11 filesystem];
  id v40 = 0;
  v13 = [v12 contentsOfDirectoryAtURL:v29 includingPropertiesForKeys:0 options:4 error:&v40];
  id v27 = v40;

  if (v13)
  {
    v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v15 = v13;
    unint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v37;
      do
      {
        uint64_t v18 = 0;
        if (v16 <= 1) {
          uint64_t v19 = 1;
        }
        else {
          uint64_t v19 = v16;
        }
        do
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(v15);
          }
          id v20 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v18), "path", v27);
          [v14 addObject:v20];

          ++v18;
        }
        while (v19 != v18);
        unint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v16);
    }

    if ([v14 count])
    {
      id v21 = [(PKManager *)self client];
      objc_initWeak((id *)buf, v21);

      objc_initWeak(&location, self);
      v22 = [(PKManager *)self client];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = sub_1B38CF06C;
      v30[3] = &unk_1E6059928;
      objc_copyWeak(&v33, (id *)buf);
      objc_copyWeak(&v34, &location);
      id v31 = v7;
      id v32 = v28;
      [v22 addPlugIns:v14 reply:v30];

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v24 = pklog_handle_for_category(12);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = [v7 bundlePath];
        *(_DWORD *)buf = 134218242;
        v43 = self;
        __int16 v44 = 2112;
        v45 = v25;
        _os_log_impl(&dword_1B38B0000, v24, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> register plugins in bundle at [%@] completed, there were no plugins in that bundle", buf, 0x16u);
      }
      (*((void (**)(id, void))v28 + 2))(v28, 0);
    }
  }
  else
  {
    v23 = pklog_handle_for_category(12);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = [v7 bundlePath];
      *(_DWORD *)buf = 134218498;
      v43 = self;
      __int16 v44 = 2112;
      v45 = v26;
      __int16 v46 = 2112;
      id v47 = v27;
      _os_log_error_impl(&dword_1B38B0000, v23, OS_LOG_TYPE_ERROR, "<PKManager:%p> register plugins in bundle at [%@] failed to fetch candidates: %@", buf, 0x20u);
    }
    (*((void (**)(id, id))v28 + 2))(v28, v27);
  }
}

- (void)unregisterPlugInsInBundle:(id)a3 result:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v26 = a4;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28B50] mainBundle];
    id v6 = [v7 bundleURL];
  }
  v8 = pklog_handle_for_category(12);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 path];
    *(_DWORD *)buf = 134218242;
    long long v39 = self;
    __int16 v40 = 2112;
    v41 = v9;
    _os_log_impl(&dword_1B38B0000, v8, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> unregister plugins in bundle at [%@]", buf, 0x16u);
  }
  v10 = [(PKManager *)self external];
  objc_super v11 = [v10 ls];
  v12 = [v11 applicationProxyForBundleURL:v6];

  v13 = [v12 plugInKitPlugins];
  v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = v13;
  unint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v34;
    do
    {
      uint64_t v18 = 0;
      if (v16 <= 1) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = v16;
      }
      do
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v15);
        }
        id v20 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v18), "bundleURL", v26);
        id v21 = [v20 path];
        [v14 addObject:v21];

        ++v18;
      }
      while (v19 != v18);
      unint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v16);
  }

  if ([v14 count])
  {
    v22 = [(PKManager *)self client];
    objc_initWeak((id *)buf, v22);

    objc_initWeak(&location, self);
    v23 = [(PKManager *)self client];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B38CF5C0;
    v27[3] = &unk_1E6059928;
    objc_copyWeak(&v30, (id *)buf);
    objc_copyWeak(&v31, &location);
    id v28 = v6;
    id v29 = v26;
    [v23 removePlugIns:v14 reply:v27];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v24 = pklog_handle_for_category(12);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [v6 path];
      *(_DWORD *)buf = 134218242;
      long long v39 = self;
      __int16 v40 = 2112;
      v41 = v25;
      _os_log_impl(&dword_1B38B0000, v24, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> unregister plugins in bundle at [%@] completed, there were plugins in that bundle registered with LaunchServices", buf, 0x16u);
    }
    (*((void (**)(id, void))v26 + 2))(v26, 0);
  }
}

- (id)informationForPlugInWithPid:(int)a3
{
  uint64_t v3 = (void *)MEMORY[0x1F4188790](self, a2, *(void *)&a3);
  uint64_t v5 = v4;
  id v6 = v3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = [v3 external];
  v8 = [v7 launch];
  v9 = objc_msgSend(v8, "copy_extension_properties_for_pid:", v5);

  if (v9 && (string = xpc_dictionary_get_string(v9, (const char *)*MEMORY[0x1E4F14928])) != 0)
  {
    objc_super v11 = string;
    v12 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v13 = (void *)[v12 mutableCopy];

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithFileSystemRepresentation:v11 isDirectory:1 relativeToURL:0];
    id v15 = [v6 external];
    unint64_t v16 = [v15 ls];
    uint64_t v17 = [v16 plugInKitProxyForURL:v14];

    uint64_t v18 = [v17 containingBundle];
    uint64_t v19 = v18;
    if (v18)
    {
      id v20 = [v18 bundleURL];
      id v21 = [v20 path];
      [v13 setObject:v21 forKeyedSubscript:@"ContainingPath"];

      v22 = [v19 bundleIdentifier];
      [v13 setObject:v22 forKeyedSubscript:@"ContainingIdentifier"];
    }
    int int64 = xpc_dictionary_get_int64(v9, (const char *)*MEMORY[0x1E4F14920]);
    if (int64 && proc_pidpath(int64, buffer, 0x1000u) >= 1)
    {
      id v24 = objc_alloc(MEMORY[0x1E4F1CB10]);
      v25 = [NSString stringWithUTF8String:buffer];
      id v26 = (void *)[v24 initFileURLWithPath:v25];

      if (v26 && (v27 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle(), (id v28 = v27) != 0))
      {
        id v29 = CFBundleCopyBundleURL(v27);
        id v30 = [v29 path];
        [v13 setObject:v30 forKeyedSubscript:@"HostPath"];

        [v13 setObject:CFBundleGetIdentifier(v28) forKeyedSubscript:@"XPCExtensionHostBundleIdentifier"];
        CFRelease(v28);
      }
      else
      {
        id v29 = [NSString stringWithUTF8String:buffer];
        [v13 setObject:v29 forKeyedSubscript:@"HostPath"];
      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)containingAppForPlugInConnectedTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKManager *)self external];
  id v6 = [v5 launch];
  id v7 = objc_msgSend(v6, "copy_extension_properties:", v4);

  v8 = [(PKManager *)self containingAppForExtensionProperties:v7];

  return v8;
}

- (id)containingAppForPlugInWithPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(PKManager *)self external];
  id v6 = [v5 launch];
  id v7 = objc_msgSend(v6, "copy_extension_properties_for_pid:", v3);

  v8 = [(PKManager *)self containingAppForExtensionProperties:v7];

  return v8;
}

- (id)containingAppForExtensionProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14928]);
  if (!string) {
    goto LABEL_7;
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithFileSystemRepresentation:string isDirectory:1 relativeToURL:0];
  v8 = [(PKManager *)self external];
  v9 = [v8 ls];
  v10 = [v9 plugInKitProxyForURL:v7];

  objc_super v11 = [v10 containingBundle];
  v12 = v11;
  if (v11)
  {
    v8 = [v11 bundleIdentifier];
  }

  if (!v12) {
LABEL_7:
  }
    v8 = 0;

  return v8;
}

- (void)holdPlugInsInApplication:(id)a3 result:(id)a4
{
}

- (void)holdPlugInsWithExtensionPointName:(id)a3 platforms:(id)a4 terminate:(BOOL)a5 result:(id)a6
{
  if (a5) {
    uint64_t v7 = 36;
  }
  else {
    uint64_t v7 = 32;
  }
  [(PKManager *)self holdRequest:0 extensionPointName:a3 platforms:a4 flags:v7 result:a6];
}

- (void)holdPlugInsWithExtensionPointName:(id)a3 result:(id)a4
{
}

- (void)forceHoldPlugIn:(id)a3 result:(id)a4
{
}

- (void)terminatePlugInsInApplication:(id)a3 options:(int64_t)a4 result:(id)a5
{
  id v10 = a3;
  v8 = (void (**)(id, void, void *))a5;
  if (a4)
  {
    v9 = pkError(18, @"unrecognized option to terminatePlugInsInApplication");
    v8[2](v8, 0, v9);
  }
  [(PKManager *)self holdRequest:v10 flags:4 result:v8];
}

- (id)holdPlugInsInApplication:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1B38B78CC;
  id v21 = sub_1B38B7884;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_1B38B78CC;
  id v15 = sub_1B38B7884;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B38CFEB8;
  v10[3] = &unk_1E6059950;
  v10[4] = &v17;
  v10[5] = &v11;
  [(PKManager *)self holdRequest:v6 flags:10 result:v10];
  if (!v18[5])
  {
    if (a4)
    {
      uint64_t v7 = (void *)v12[5];
      if (v7) {
        *a4 = v7;
      }
    }
  }
  id v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)holdPlugInsWithExtensionPointName:(id)a3 platforms:(id)a4 terminate:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_1B38B78CC;
  id v27 = sub_1B38B7884;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1B38B78CC;
  id v21 = sub_1B38B7884;
  id v22 = 0;
  if (v7) {
    uint64_t v12 = 44;
  }
  else {
    uint64_t v12 = 40;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B38D0104;
  v16[3] = &unk_1E6059950;
  v16[4] = &v23;
  v16[5] = &v17;
  [(PKManager *)self holdRequest:0 extensionPointName:v10 platforms:v11 flags:v12 result:v16];
  if (!v24[5])
  {
    if (a6)
    {
      uint64_t v13 = (void *)v18[5];
      if (v13) {
        *a6 = v13;
      }
    }
  }
  id v14 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

- (id)holdPlugInsWithExtensionPointName:(id)a3 error:(id *)a4
{
  id v4 = [(PKManager *)self holdPlugInsWithExtensionPointName:a3 platforms:MEMORY[0x1E4F1CBF0] terminate:1 error:a4];
  return v4;
}

- (id)forceHoldPlugIn:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1B38B78CC;
  id v21 = sub_1B38B7884;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_1B38B78CC;
  id v15 = sub_1B38B7884;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B38D035C;
  v10[3] = &unk_1E6059950;
  v10[4] = &v17;
  v10[5] = &v11;
  [(PKManager *)self holdRequest:v6 flags:9 result:v10];
  if (!v18[5])
  {
    if (a4)
    {
      BOOL v7 = (void *)v12[5];
      if (v7) {
        *a4 = v7;
      }
    }
  }
  id v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (BOOL)terminatePlugInAtURL:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1B38B78CC;
  uint64_t v25 = sub_1B38B7884;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_1B38B78CC;
  uint64_t v19 = sub_1B38B7884;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1B38D05C0;
  v14[3] = &unk_1E6059950;
  v14[4] = &v21;
  v14[5] = &v15;
  [(PKManager *)self holdRequest:v6 flags:29 result:v14];
  BOOL v7 = (void *)v16[5];
  if (v22[5])
  {
    v16[5] = 0;

    uint64_t v8 = v22[5];
    v9 = (id *)(v16 + 5);
    id obj = (id)v16[5];
    BOOL v10 = [(PKManager *)self releaseHold:v8 flags:24 withError:&obj];
    objc_storeStrong(v9, obj);
    if (v10)
    {
      BOOL v11 = 1;
      goto LABEL_10;
    }
    BOOL v11 = 0;
    if (a4)
    {
      BOOL v7 = (void *)v16[5];
      if (v7)
      {
LABEL_9:
        BOOL v11 = 0;
        *a4 = v7;
      }
    }
  }
  else
  {
    BOOL v11 = 0;
    if (a4 && v7) {
      goto LABEL_9;
    }
  }
LABEL_10:
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (id)terminatePlugInsInApplication:(id)a3 options:(int64_t)a4 withError:(id *)a5
{
  id v8 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1B38B78CC;
  uint64_t v25 = sub_1B38B7884;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_1B38B78CC;
  uint64_t v19 = sub_1B38B7884;
  id v20 = 0;
  if (a4)
  {
    uint64_t v9 = pkError(18, @"unrecognized option to terminatePlugInsInApplication");
    BOOL v10 = (void *)v16[5];
    v16[5] = v9;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B38D080C;
    v14[3] = &unk_1E6059950;
    v14[4] = &v21;
    v14[5] = &v15;
    [(PKManager *)self holdRequest:v8 flags:12 result:v14];
  }
  if (!v22[5])
  {
    if (a5)
    {
      BOOL v11 = (void *)v16[5];
      if (v11) {
        *a5 = v11;
      }
    }
  }
  id v12 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (void)holdRequest:(id)a3 flags:(unint64_t)a4 result:(id)a5
{
}

- (void)holdRequest:(id)a3 extensionPointName:(id)a4 platforms:(id)a5 flags:(unint64_t)a6 result:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = (void (**)(id, void, void *))a7;
  id v16 = [(PKManager *)self client];
  objc_initWeak(&location, v16);

  if (v12)
  {
    uint64_t v17 = [v12 path];
  }
  else
  {
    uint64_t v17 = v13;
  }
  id v18 = v17;
  if (v12) {

  }
  uint64_t v19 = pklog_handle_for_category(11);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v33 = self;
    __int16 v34 = 2112;
    id v35 = v18;
    __int16 v36 = 2048;
    unint64_t v37 = a6;
    _os_log_impl(&dword_1B38B0000, v19, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> hold request for [%@] with flags: 0x%llx", buf, 0x20u);
  }

  if (v13) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = v12 != 0;
  }
  if (v20)
  {
    if (v12 && v13)
    {
      uint64_t v21 = pkError(18, @"Malformed hold request: only one of URL or extension point allowed");
      v15[2](v15, 0, v21);
    }
    else
    {
      if (v12)
      {
        id v22 = [v12 path];
        BOOL v23 = v22 == 0;

        if (v23)
        {
          uint64_t v21 = pkError(18, @"Malformed NSURL passed by the client.");
          v15[2](v15, 0, v21);
          goto LABEL_22;
        }
        id v24 = [v12 path];
        id v31 = v24;
        uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      }
      else
      {
        uint64_t v21 = 0;
      }
      uint64_t v25 = [(PKManager *)self client];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1B38D0C1C;
      v26[3] = &unk_1E6059978;
      objc_copyWeak(v29, &location);
      v26[4] = self;
      id v27 = v18;
      v29[1] = (id)a6;
      id v28 = v15;
      [v25 holdPlugins:v21 extensionPointName:v13 platforms:v14 flags:a6 reply:v26];

      objc_destroyWeak(v29);
    }
  }
  else
  {
    uint64_t v21 = pkError(18, @"Malformed hold request: must supply URL or extension point");
    v15[2](v15, 0, v21);
  }
LABEL_22:

  objc_destroyWeak(&location);
}

- (void)releaseHold:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PKManager.m", 509, @"bad plugin hold token:%@", v5 object file lineNumber description];
  }
  id v6 = [(PKManager *)self client];
  objc_initWeak(&location, v6);

  BOOL v7 = [(PKManager *)self client];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B38D1068;
  v10[3] = &unk_1E60599A0;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  id v8 = v5;
  id v11 = v8;
  [v7 releaseHold:v8 flags:0 reply:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)releaseHold:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PKManager.m", 523, @"bad plugin hold token:%@", v7 object file lineNumber description];
  }
  uint64_t v9 = [(PKManager *)self client];
  objc_initWeak(&location, v9);

  BOOL v10 = [(PKManager *)self client];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1B38D1328;
  v14[3] = &unk_1E60599C8;
  objc_copyWeak(&v17, &location);
  v14[4] = self;
  id v11 = v7;
  id v15 = v11;
  id v12 = v8;
  id v16 = v12;
  [v10 releaseHold:v11 flags:0 reply:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (BOOL)releaseHold:(id)a3 flags:(unint64_t)a4 withError:(id *)a5
{
  id v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PKManager.m", 538, @"bad plugin hold token:%@", v9 object file lineNumber description];
  }
  BOOL v10 = [(PKManager *)self client];
  objc_initWeak(&location, v10);

  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1B38B78CC;
  uint64_t v25 = sub_1B38B7884;
  id v26 = 0;
  id v11 = [(PKManager *)self client];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B38D166C;
  v17[3] = &unk_1E60599F0;
  uint64_t v19 = &v21;
  objc_copyWeak(&v20, &location);
  void v17[4] = self;
  id v12 = v9;
  id v18 = v12;
  [v11 releaseHold:v12 flags:a4 reply:v17];

  if (a5)
  {
    id v13 = (void *)v22[5];
    if (v13) {
      *a5 = v13;
    }
  }
  BOOL v14 = v22[5] == 0;

  objc_destroyWeak(&v20);
  _Block_object_dispose(&v21, 8);

  objc_destroyWeak(&location);
  return v14;
}

- (BOOL)releaseHold:(id)a3 withError:(id *)a4
{
  return [(PKManager *)self releaseHold:a3 flags:8 withError:a4];
}

- (void)updateExtensionStatesForPlugIns:(id)a3 result:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = pklog_handle_for_category(10);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1B38B0000, v8, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> bulk update extension states: %@", buf, 0x16u);
  }

  id v9 = [(PKManager *)self client];
  objc_initWeak((id *)buf, v9);

  BOOL v10 = [(PKManager *)self client];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B38D1984;
  v13[3] = &unk_1E60599C8;
  objc_copyWeak(&v16, (id *)buf);
  v13[4] = self;
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v10 bulkSetPluginAnnotations:v11 reply:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (PKDaemonClient)client
{
  return (PKDaemonClient *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClient:(id)a3
{
}

- (PKExternalProviders)external
{
  return (PKExternalProviders *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_external, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end