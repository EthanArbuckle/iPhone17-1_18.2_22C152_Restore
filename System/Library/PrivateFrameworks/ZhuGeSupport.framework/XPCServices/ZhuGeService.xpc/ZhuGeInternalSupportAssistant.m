@interface ZhuGeInternalSupportAssistant
+ (BOOL)isInternalAssistant;
+ (NSMutableArray)cacheList;
+ (_opaque_pthread_mutex_t)recursiveMutex;
+ (id)armoryClassName;
+ (id)classList;
+ (id)getInternalSupportPath;
+ (id)getXpcProxyWithError:(id *)a3;
+ (id)serviceXpcName;
+ (id)xpcProxy;
+ (void)dylibHandler;
+ (void)executeCacheRefresh;
+ (void)getDylibHandlerWithError:(id *)a3;
+ (void)registerCacheRefresh:(id)a3;
+ (void)setCacheList:(id)a3;
+ (void)setDylibHandler:(void *)a3;
+ (void)setXpcProxy:(id)a3;
@end

@implementation ZhuGeInternalSupportAssistant

+ (_opaque_pthread_mutex_t)recursiveMutex
{
  if (qword_10001A048 != -1) {
    dispatch_once(&qword_10001A048, &stru_1000143E0);
  }
  return (_opaque_pthread_mutex_t *)&unk_10001A050;
}

+ (void)setDylibHandler:(void *)a3
{
  qword_10001A090 = (uint64_t)a3;
}

+ (void)dylibHandler
{
  return (void *)qword_10001A090;
}

+ (void)setXpcProxy:(id)a3
{
}

+ (id)xpcProxy
{
  return (id)qword_10001A098;
}

+ (void)setCacheList:(id)a3
{
}

+ (NSMutableArray)cacheList
{
  return (NSMutableArray *)(id)qword_10001A0A0;
}

+ (BOOL)isInternalAssistant
{
  return 1;
}

+ (id)classList
{
  return &off_100017630;
}

+ (id)armoryClassName
{
  return @"OBJC_CLASS_$_ZhuGeInternalArmory";
}

+ (id)serviceXpcName
{
  return @"com.apple.ZhuGeInternalService";
}

+ (void)executeCacheRefresh
{
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  if ([a1 dylibHandler])
  {
    dlclose([a1 dylibHandler]);
    [a1 setDylibHandler:0];
  }
  [a1 setXpcProxy:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = objc_msgSend(a1, "cacheList", 0);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) clearCache];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
}

+ (id)getInternalSupportPath
{
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  v3 = +[NSFileManager defaultManager];
  char v43 = 0;
  if (isZhuGeInRestoreOS())
  {
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getInternalSupportPath]", 135, @"Skip retrieving internal support path in restoreOS", v4, v5, v6, v37);
    id v7 = 0;
    long long v8 = 0;
LABEL_27:
    id v33 = 0;
    goto LABEL_28;
  }
  if ([v3 fileExistsAtPath:qword_10001A0A8 isDirectory:&v43]) {
    BOOL v9 = v43 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    long long v8 = (__CFString *)(id)qword_10001A0A8;
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getInternalSupportPath]", 142, @"Retrieving unchanged internal supported path: %@", v29, v30, v31, (uint64_t)v8);
    id v7 = 0;
    goto LABEL_27;
  }
  long long v8 = @"/usr/local/ZhuGe/ZhuGeInternalSupport";
  if ([v3 fileExistsAtPath:@"/usr/local/ZhuGe/ZhuGeInternalSupport" isDirectory:&v43])BOOL v17 = v43 == 0; {
  else
  }
    BOOL v17 = 1;
  if (v17)
  {
    id v42 = 0;
    getZhuGeFDIPathsWithError(&v42, v10, v11, v12, v13, v14, v15, v16);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = v42;
    if (v33)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v33 = v33;
      id v21 = [v33 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v39;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v39 != v23) {
              objc_enumerationMutation(v33);
            }
            v25 = v8;
            long long v8 = +[NSString stringWithFormat:@"%@%@", *(void *)(*((void *)&v38 + 1) + 8 * i), v8, (void)v38];
            if ([v3 fileExistsAtPath:v8 isDirectory:&v43]) {
              BOOL v26 = v43 == 0;
            }
            else {
              BOOL v26 = 1;
            }
            if (!v26)
            {

              goto LABEL_31;
            }

            long long v8 = v25;
          }
          id v22 = [v33 countByEnumeratingWithState:&v38 objects:v44 count:16];
        }
        while (v22);
      }

      v27 = @"Didn't find ZhuGe internal Support Path";
      uint64_t v28 = 167;
    }
    else
    {
      v27 = @"Failed to get FDI paths";
      uint64_t v28 = 155;
    }
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getInternalSupportPath]", v28, v27, v18, v19, v20, v37);
    long long v8 = 0;
  }
  else
  {
    id v7 = 0;
    id v33 = 0;
LABEL_31:
    objc_storeStrong((id *)&qword_10001A0A8, v8);
    ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getInternalSupportPath]", 174, @"ZhuGe internal support path is updated to: %@", v34, v35, v36, (uint64_t)v8);
    [a1 executeCacheRefresh];
  }
LABEL_28:
  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);

  return v8;
}

+ (void)getDylibHandlerWithError:(id *)a3
{
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  if (a3)
  {
    *a3 = 0;
    long long v8 = 0;
    id v9 = 0;
    if (![a1 dylibHandler])
    {
      uint64_t v10 = [a1 getInternalSupportPath];
      long long v8 = (void *)v10;
      if (!v10)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getDylibHandlerWithError:]", 207, @"Failed to get ZhuGe internal support path for dylib handler!", v11, v12, v13, v22);
        id v19 = +[NSError errorWithZhuGeErrorCode:43 underlyingError:0];
        id v9 = 0;
        goto LABEL_10;
      }
      v23[0] = v10;
      v23[1] = @"libZhuGeInternalArmory.dylib";
      uint64_t v14 = +[NSArray arrayWithObjects:v23 count:2];
      uint64_t v15 = +[NSString pathWithComponents:v14];

      if ([a1 dylibHandler])
      {
        dlclose([a1 dylibHandler]);
        [a1 setDylibHandler:0];
      }
      id v9 = v15;
      objc_msgSend(a1, "setDylibHandler:", dlopen((const char *)objc_msgSend(v9, "UTF8String"), 1));
      if (![a1 dylibHandler])
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getDylibHandlerWithError:]", 218, @"Failed to dlopen ZhuGe internal armory dylib!", v16, v17, v18, v22);
        id v19 = +[NSError errorWithZhuGeErrorCode:13 underlyingError:0];
LABEL_10:
        *a3 = v19;
      }
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getDylibHandlerWithError:]", 194, @"error p-pointer is nil!", v5, v6, v7, v22);
    long long v8 = 0;
    id v9 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
  id v20 = [a1 dylibHandler];

  return v20;
}

+ (void)registerCacheRefresh:(id)a3
{
  id v9 = a3;
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  if ((isZhuGeInRestoreOS() & 1) == 0)
  {
    uint64_t v4 = [a1 cacheList];

    if (!v4)
    {
      id v5 = objc_alloc_init((Class)NSMutableArray);
      [a1 setCacheList:v5];
    }
    uint64_t v6 = [a1 cacheList];
    unsigned __int8 v7 = [v6 containsObject:v9];

    if ((v7 & 1) == 0)
    {
      long long v8 = [a1 cacheList];
      [v8 addObject:v9];
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
}

+ (id)getXpcProxyWithError:(id *)a3
{
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  if (isZhuGeInRestoreOS()) {
    goto LABEL_9;
  }
  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]", 273, @"error p-pointer is nil!", v5, v6, v7, v38);
LABEL_9:
    id v9 = 0;
    id v10 = 0;
    id v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  *a3 = 0;
  long long v8 = [a1 xpcProxy];

  id v9 = 0;
  id v10 = 0;
  id v11 = 0;
  uint64_t v12 = 0;
  if (v8) {
    goto LABEL_10;
  }
  uint64_t v13 = [a1 getInternalSupportPath];
  id v9 = (void *)v13;
  if (v13)
  {
    v46[0] = v13;
    v46[1] = @"ZhuGeInternalService.xpc";
    uint64_t v17 = +[NSArray arrayWithObjects:v46 count:2];
    uint64_t v18 = +[NSString pathWithComponents:v17];

    id v10 = v18;
    [v10 UTF8String];
    xpc_add_bundle();
    id v11 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.ZhuGeInternalService"];
    if (v11)
    {
      uint64_t v22 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ZhuGeInternalServiceProtocol];
      [v11 setRemoteObjectInterface:v22];

      uint64_t v42 = objc_opt_class();
      uint64_t v41 = objc_opt_class();
      uint64_t v40 = objc_opt_class();
      uint64_t v39 = objc_opt_class();
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = objc_opt_class();
      uint64_t v27 = objc_opt_class();
      uint64_t v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v42, v41, v40, v39, v23, v24, v25, v26, v27, objc_opt_class(), 0);
      uint64_t v28 = [v11 remoteObjectInterface];
      [v28 setClasses:v12 forSelector:"setBulkKeys:getValuesAndError:" argumentIndex:0 ofReply:1];

      uint64_t v29 = [v11 remoteObjectInterface];
      [v29 setClasses:v12 forSelector:"setBulkMGKeys:getValuesAndError:" argumentIndex:0 ofReply:1];

      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1000054B4;
      v45[3] = &unk_100014400;
      v45[4] = a1;
      [v11 setInvalidationHandler:v45];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10000553C;
      v44[3] = &unk_100014400;
      v44[4] = a1;
      [v11 setInterruptionHandler:v44];
      [v11 activate];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000055C4;
      v43[3] = &unk_100014420;
      v43[4] = a1;
      uint64_t v30 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v43];
      [a1 setXpcProxy:v30];

      uint64_t v31 = [a1 xpcProxy];

      if (v31) {
        goto LABEL_10;
      }
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]", 339, @"Failed to get proxy for \"%@\"!", v32, v33, v34, @"com.apple.ZhuGeInternalService");
      id v35 = +[NSError errorWithZhuGeErrorCode:66 underlyingError:0];
      goto LABEL_16;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]", 297, @"Failed to connect \"%@\"!", v19, v20, v21, @"com.apple.ZhuGeInternalService");
    id v35 = +[NSError errorWithZhuGeErrorCode:67 underlyingError:0];
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]", 286, @"Failed to get ZhuGe internal support path for xpc proxy!", v14, v15, v16, v38);
    id v35 = +[NSError errorWithZhuGeErrorCode:43 underlyingError:0];
    id v10 = 0;
    id v11 = 0;
  }
  uint64_t v12 = 0;
LABEL_16:
  *a3 = v35;
LABEL_10:
  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
  uint64_t v36 = [a1 xpcProxy];

  return v36;
}

@end