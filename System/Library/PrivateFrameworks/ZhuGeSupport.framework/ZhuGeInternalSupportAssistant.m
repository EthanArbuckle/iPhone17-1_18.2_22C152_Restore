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
  if (recursiveMutex_aToken != -1) {
    dispatch_once(&recursiveMutex_aToken, &__block_literal_global_2);
  }
  return (_opaque_pthread_mutex_t *)&_recursiveMutex;
}

uint64_t __47__ZhuGeInternalSupportAssistant_recursiveMutex__block_invoke()
{
  return initPthreadRecursiveMutex(&_recursiveMutex);
}

+ (void)setDylibHandler:(void *)a3
{
  _dylibHandler = (uint64_t)a3;
}

+ (void)dylibHandler
{
  return (void *)_dylibHandler;
}

+ (void)setXpcProxy:(id)a3
{
}

+ (id)xpcProxy
{
  return (id)_xpcProxy;
}

+ (void)setCacheList:(id)a3
{
}

+ (NSMutableArray)cacheList
{
  return (NSMutableArray *)(id)_cacheList;
}

+ (BOOL)isInternalAssistant
{
  return 1;
}

+ (id)classList
{
  return &unk_1F1A9F698;
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
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  if ([a1 dylibHandler])
  {
    dlclose((void *)[a1 dylibHandler]);
    [a1 setDylibHandler:0];
  }
  [a1 setXpcProxy:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = objc_msgSend(a1, "cacheList", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) clearCache];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
}

+ (id)getInternalSupportPath
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v43 = 0;
  if (isZhuGeInRestoreOS())
  {
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getInternalSupportPath]", 135, @"Skip retrieving internal support path in restoreOS", v4, v5, v6, v37);
    id v7 = 0;
    long long v8 = 0;
LABEL_27:
    id v33 = 0;
    goto LABEL_28;
  }
  if ([v3 fileExistsAtPath:getInternalSupportPath_oldInternalSupportPath isDirectory:&v43])BOOL v9 = v43 == 0; {
  else
  }
    BOOL v9 = 1;
  if (!v9)
  {
    long long v8 = (__CFString *)(id)getInternalSupportPath_oldInternalSupportPath;
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getInternalSupportPath]", 142, @"Retrieving unchanged internal supported path: %@", v29, v30, v31, (uint64_t)v8);
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
      uint64_t v21 = [v33 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v39 != v23) {
              objc_enumerationMutation(v33);
            }
            v25 = v8;
            long long v8 = [NSString stringWithFormat:@"%@%@", *(void *)(*((void *)&v38 + 1) + 8 * i), v8, (void)v38];
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
          uint64_t v22 = [v33 countByEnumeratingWithState:&v38 objects:v44 count:16];
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
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getInternalSupportPath]", v28, v27, v18, v19, v20, v37);
    long long v8 = 0;
  }
  else
  {
    id v7 = 0;
    id v33 = 0;
LABEL_31:
    objc_storeStrong((id *)&getInternalSupportPath_oldInternalSupportPath, v8);
    ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getInternalSupportPath]", 174, @"ZhuGe internal support path is updated to: %@", v34, v35, v36, (uint64_t)v8);
    [a1 executeCacheRefresh];
  }
LABEL_28:
  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);

  return v8;
}

+ (void)getDylibHandlerWithError:(id *)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
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
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getDylibHandlerWithError:]", 207, @"Failed to get ZhuGe internal support path for dylib handler!", v11, v12, v13, v23);
        id v20 = [MEMORY[0x1E4F28C58] errorWithZhuGeErrorCode:43 underlyingError:0];
        id v9 = 0;
        goto LABEL_10;
      }
      uint64_t v14 = NSString;
      v24[0] = v10;
      v24[1] = @"libZhuGeInternalArmory.dylib";
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      uint64_t v16 = [v14 pathWithComponents:v15];

      if ([a1 dylibHandler])
      {
        dlclose((void *)[a1 dylibHandler]);
        [a1 setDylibHandler:0];
      }
      id v9 = v16;
      objc_msgSend(a1, "setDylibHandler:", dlopen((const char *)objc_msgSend(v9, "UTF8String"), 1));
      if (![a1 dylibHandler])
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getDylibHandlerWithError:]", 218, @"Failed to dlopen ZhuGe internal armory dylib!", v17, v18, v19, v23);
        id v20 = [MEMORY[0x1E4F28C58] errorWithZhuGeErrorCode:13 underlyingError:0];
LABEL_10:
        *a3 = v20;
      }
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getDylibHandlerWithError:]", 194, @"error p-pointer is nil!", v5, v6, v7, v23);
    long long v8 = 0;
    id v9 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
  uint64_t v21 = (void *)[a1 dylibHandler];

  return v21;
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
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [a1 setCacheList:v5];
    }
    uint64_t v6 = [a1 cacheList];
    char v7 = [v6 containsObject:v9];

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
  v48[2] = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  if (isZhuGeInRestoreOS()) {
    goto LABEL_9;
  }
  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]", 273, @"error p-pointer is nil!", v5, v6, v7, v39);
LABEL_9:
    id v9 = 0;
    id v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  *a3 = 0;
  long long v8 = [a1 xpcProxy];

  id v9 = 0;
  id v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  if (v8) {
    goto LABEL_10;
  }
  uint64_t v13 = [a1 getInternalSupportPath];
  id v9 = (void *)v13;
  if (v13)
  {
    uint64_t v17 = NSString;
    v48[0] = v13;
    v48[1] = @"ZhuGeInternalService.xpc";
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
    uint64_t v19 = [v17 pathWithComponents:v18];

    id v10 = v19;
    [v10 UTF8String];
    xpc_add_bundle();
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.ZhuGeInternalService"];
    if (v11)
    {
      uint64_t v23 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1AA27D0];
      [v11 setRemoteObjectInterface:v23];

      v44 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v43 = objc_opt_class();
      uint64_t v42 = objc_opt_class();
      uint64_t v41 = objc_opt_class();
      uint64_t v40 = objc_opt_class();
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = objc_opt_class();
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = objc_opt_class();
      uint64_t v12 = objc_msgSend(v44, "setWithObjects:", v43, v42, v41, v40, v24, v25, v26, v27, v28, objc_opt_class(), 0);
      uint64_t v29 = [v11 remoteObjectInterface];
      [v29 setClasses:v12 forSelector:sel_setBulkKeys_getValuesAndError_ argumentIndex:0 ofReply:1];

      uint64_t v30 = [v11 remoteObjectInterface];
      [v30 setClasses:v12 forSelector:sel_setBulkMGKeys_getValuesAndError_ argumentIndex:0 ofReply:1];

      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __54__ZhuGeInternalSupportAssistant_getXpcProxyWithError___block_invoke;
      v47[3] = &__block_descriptor_40_e5_v8__0l;
      v47[4] = a1;
      [v11 setInvalidationHandler:v47];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __54__ZhuGeInternalSupportAssistant_getXpcProxyWithError___block_invoke_2;
      v46[3] = &__block_descriptor_40_e5_v8__0l;
      v46[4] = a1;
      [v11 setInterruptionHandler:v46];
      [v11 activate];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __54__ZhuGeInternalSupportAssistant_getXpcProxyWithError___block_invoke_3;
      v45[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v45[4] = a1;
      uint64_t v31 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v45];
      [a1 setXpcProxy:v31];

      v32 = [a1 xpcProxy];

      if (v32) {
        goto LABEL_10;
      }
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]", 339, @"Failed to get proxy for \"%@\"!", v33, v34, v35, @"com.apple.ZhuGeInternalService");
      id v36 = [MEMORY[0x1E4F28C58] errorWithZhuGeErrorCode:66 underlyingError:0];
      goto LABEL_16;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]", 297, @"Failed to connect \"%@\"!", v20, v21, v22, @"com.apple.ZhuGeInternalService");
    id v36 = [MEMORY[0x1E4F28C58] errorWithZhuGeErrorCode:67 underlyingError:0];
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]", 286, @"Failed to get ZhuGe internal support path for xpc proxy!", v14, v15, v16, v39);
    id v36 = [MEMORY[0x1E4F28C58] errorWithZhuGeErrorCode:43 underlyingError:0];
    id v10 = 0;
    uint64_t v11 = 0;
  }
  uint64_t v12 = 0;
LABEL_16:
  *a3 = v36;
LABEL_10:
  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
  uint64_t v37 = [a1 xpcProxy];

  return v37;
}

uint64_t __54__ZhuGeInternalSupportAssistant_getXpcProxyWithError___block_invoke(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex]);
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]_block_invoke", 317, @"Connection to \"%@\" invalidated!", v2, v3, v4, @"com.apple.ZhuGeInternalService");
  [*(id *)(a1 + 32) setXpcProxy:0];
  uint64_t v5 = (pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex];
  return pthread_mutex_unlock(v5);
}

uint64_t __54__ZhuGeInternalSupportAssistant_getXpcProxyWithError___block_invoke_2(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex]);
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]_block_invoke_2", 323, @"Connection to \"%@\" interrupted!", v2, v3, v4, @"com.apple.ZhuGeInternalService");
  [*(id *)(a1 + 32) setXpcProxy:0];
  uint64_t v5 = (pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex];
  return pthread_mutex_unlock(v5);
}

uint64_t __54__ZhuGeInternalSupportAssistant_getXpcProxyWithError___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  pthread_mutex_lock((pthread_mutex_t *)[v3 recursiveMutex]);
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]_block_invoke_3", 333, @"Internal connection failed to provide a synchronized proxy, error : %@!", v5, v6, v7, (uint64_t)v4);

  [*(id *)(a1 + 32) setXpcProxy:0];
  long long v8 = (pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex];
  return pthread_mutex_unlock(v8);
}

@end