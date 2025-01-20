@interface AppReceipt
+ (BOOL)_writeReceipt:(id)a3 withContainerDirectory:(id)a4 style:(int64_t)a5;
+ (BOOL)writeReceipt:(id)a3 forBundleIdentifier:(id)a4 style:(int64_t)a5;
+ (BOOL)writeReceipt:(id)a3 forStoreKitClient:(id)a4;
@end

@implementation AppReceipt

+ (BOOL)writeReceipt:(id)a3 forBundleIdentifier:(id)a4 style:(int64_t)a5
{
  if (![a3 length] || !objc_msgSend(a4, "length"))
  {
    id v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14) {
      id v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (!v16) {
      return 0;
    }
LABEL_16:
    int v43 = 138412546;
    uint64_t v44 = objc_opt_class();
    __int16 v45 = 2112;
    id v46 = a4;
    LODWORD(v37) = 22;
    v17 = (void *)_os_log_send_and_compose_impl();
    if (v17)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v43, v37);
      free(v17);
      SSFileLog();
    }
    return 0;
  }
  id v9 = +[LSApplicationProxy applicationProxyForIdentifier:a4];
  if (!v9)
  {
    id v20 = +[SSLogConfig sharedDaemonConfig];
    if (!v20) {
      id v20 = +[SSLogConfig sharedConfig];
    }
    unsigned int v21 = [v20 shouldLog];
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    if (!os_log_type_enabled((os_log_t)[v20 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v22 &= 2u;
    }
    if (!v22) {
      return 0;
    }
    goto LABEL_16;
  }
  id v10 = v9;
  if ((objc_msgSend(objc_msgSend(v9, "appState"), "isValid") & 1) == 0)
  {
    id v11 = +[LSPlugInKitProxy pluginKitProxyForIdentifier:a4];
    if (v11
      && (v12 = v11,
          id v13 = objc_msgSend(objc_msgSend(v11, "containingBundle"), "bundleType"),
          [v13 isEqualToString:LSUserApplicationType]))
    {
      id v10 = [v12 containingBundle];
    }
    else
    {
      id v23 = +[SSLogConfig sharedDaemonConfig];
      if (!v23) {
        id v23 = +[SSLogConfig sharedConfig];
      }
      unsigned int v24 = [v23 shouldLog];
      if ([v23 shouldLogToDisk]) {
        int v25 = v24 | 2;
      }
      else {
        int v25 = v24;
      }
      if (!os_log_type_enabled((os_log_t)[v23 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v25 &= 2u;
      }
      if (v25)
      {
        int v43 = 138412546;
        uint64_t v44 = objc_opt_class();
        __int16 v45 = 2112;
        id v46 = a4;
        LODWORD(v37) = 22;
        v36 = &v43;
        uint64_t v26 = _os_log_send_and_compose_impl();
        if (v26)
        {
          v27 = (void *)v26;
          v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v43, v37);
          free(v27);
          v36 = (int *)v28;
          SSFileLog();
        }
      }
    }
  }
  id v29 = objc_msgSend(v10, "dataContainerURL", v36);
  if (v29) {
    unsigned __int8 v18 = [a1 _writeReceipt:a3 withContainerDirectory:v29 style:a5];
  }
  else {
    unsigned __int8 v18 = 0;
  }
  id v30 = [v10 plugInKitPlugins];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v31 = [v30 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v39;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = [*(id *)(*((void *)&v38 + 1) + 8 * i) dataContainerURL];
        if (v35) {
          [a1 _writeReceipt:a3 withContainerDirectory:v35 style:a5];
        }
      }
      id v32 = [v30 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v32);
  }
  return v18;
}

+ (BOOL)writeReceipt:(id)a3 forStoreKitClient:(id)a4
{
  id v7 = [a4 receiptDirectoryPath];
  uint64_t v8 = [a4 isSandboxed];
  if ([v7 length])
  {
    id v9 = +[NSURL fileURLWithPath:v7 isDirectory:1];
    return [a1 _writeReceipt:a3 withContainerDirectory:v9 style:v8];
  }
  else
  {
    id v11 = [a4 bundleIdentifier];
    return [a1 writeReceipt:a3 forBundleIdentifier:v11 style:v8];
  }
}

+ (BOOL)_writeReceipt:(id)a3 withContainerDirectory:(id)a4 style:(int64_t)a5
{
  if ([a3 length])
  {
    uint64_t v27 = 0;
    v32[0] = NSFileOwnerAccountName;
    v32[1] = NSFileGroupOwnerAccountName;
    v33[0] = @"mobile";
    v33[1] = @"mobile";
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    id v9 = [a4 URLByAppendingPathComponent:@"StoreKit" isDirectory:1];
    id v10 = objc_alloc_init((Class)NSFileManager);
    unsigned __int8 v11 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:v8 error:&v27];
    if (v11)
    {
      if (a5 == 1) {
        CFStringRef v12 = @"sandboxReceipt";
      }
      else {
        CFStringRef v12 = @"receipt";
      }
      id v13 = [v9 URLByAppendingPathComponent:v12 isDirectory:0];
      unsigned int v14 = [a3 writeToURL:v13 atomically:1];
      BOOL v15 = 0;
      if (!v14) {
        goto LABEL_29;
      }
      id v16 = +[SSLogConfig sharedDaemonConfig];
      if (!v16) {
        id v16 = +[SSLogConfig sharedConfig];
      }
      unsigned int v17 = [v16 shouldLog];
      if ([v16 shouldLogToDisk]) {
        int v18 = v17 | 2;
      }
      else {
        int v18 = v17;
      }
      if (!os_log_type_enabled((os_log_t)[v16 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        v18 &= 2u;
      }
      if (!v18
        || (uint64_t v19 = objc_opt_class(),
            int v28 = 138412546,
            uint64_t v29 = v19,
            __int16 v30 = 2112,
            id v31 = v13,
            LODWORD(v26) = 22,
            (id v20 = (void *)_os_log_send_and_compose_impl()) == 0))
      {
        BOOL v15 = 1;
LABEL_29:

        return v15;
      }
    }
    else
    {
      id v21 = +[SSLogConfig sharedDaemonConfig];
      if (!v21) {
        id v21 = +[SSLogConfig sharedConfig];
      }
      unsigned int v22 = [v21 shouldLog];
      if ([v21 shouldLogToDisk]) {
        int v23 = v22 | 2;
      }
      else {
        int v23 = v22;
      }
      if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v23 &= 2u;
      }
      if (!v23
        || (uint64_t v24 = objc_opt_class(),
            int v28 = 138412546,
            uint64_t v29 = v24,
            __int16 v30 = 2112,
            id v31 = v9,
            LODWORD(v26) = 22,
            (id v20 = (void *)_os_log_send_and_compose_impl()) == 0))
      {
        BOOL v15 = 0;
        goto LABEL_29;
      }
    }
    +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v28, v26);
    free(v20);
    SSFileLog();
    BOOL v15 = v11;
    goto LABEL_29;
  }
  return 0;
}

@end