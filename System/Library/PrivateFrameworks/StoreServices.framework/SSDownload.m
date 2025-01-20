@interface SSDownload
+ (int64_t)_existsMessage;
+ (int64_t)_getExternalValuesMessage;
+ (int64_t)_getValueMessage;
+ (int64_t)_setExternalValuesMessage;
+ (int64_t)_setValuesMessage;
- (BOOL)addAsset:(id)a3 forType:(id)a4;
- (BOOL)isBackgroundNetworkingUserInitiated;
- (BOOL)isCancelable;
- (BOOL)isEligibleForRestore:(id *)a3;
- (BOOL)isExternal;
- (BOOL)removeAsset:(id)a3;
- (NSArray)assets;
- (NSDictionary)_localAssets;
- (SSDownload)initWithDownloadMetadata:(id)a3;
- (SSDownload)initWithPersistentIdentifier:(int64_t)a3;
- (SSDownloadMetadata)metadata;
- (SSDownloadPolicy)downloadPolicy;
- (SSDownloadStatus)status;
- (SSXPCConnection)_XPCConnection;
- (double)estimatedSecondsRemaining;
- (double)percentComplete;
- (id)_errorWithData:(id)a3;
- (id)_errorWithXPCReply:(id)a3;
- (id)_initWithLocalPropertyValues:(id)a3;
- (id)_newAssetWithURL:(id)a3 assetType:(id)a4;
- (id)assetsForType:(id)a3;
- (id)backgroundNetworkingJobGroupName;
- (id)copyXPCEncoding;
- (id)downloadIdentifier;
- (id)downloadPhaseIdentifier;
- (id)failureError;
- (id)networkConstraints;
- (int64_t)bytesDownloaded;
- (int64_t)bytesTotal;
- (int64_t)downloadSizeLimit;
- (int64_t)persistentIdentifier;
- (void)_addCachedExternalValues:(id)a3;
- (void)_addCachedPropertyValues:(id)a3;
- (void)_applyPhase:(id)a3 toStatus:(id)a4;
- (void)_resetLocalIVars;
- (void)_resetStatus;
- (void)dealloc;
- (void)pause;
- (void)prioritizeAboveDownload:(id)a3 completionBlock:(id)a4;
- (void)restart;
- (void)resume;
- (void)setBackgroundNetworkingJobGroupName:(id)a3;
- (void)setBackgroundNetworkingUserInitiated:(BOOL)a3;
- (void)setDownloadHandler:(id)a3 completionBlock:(id)a4;
- (void)setDownloadPolicy:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNetworkConstraints:(id)a3;
- (void)setValuesWithStoreDownloadMetadata:(id)a3;
@end

@implementation SSDownload

- (SSDownload)initWithPersistentIdentifier:(int64_t)a3
{
  v3 = [(SSEntity *)self _initWithPersistentIdentifier:a3];
  v4 = v3;
  if (v3 && !v3->super._connection)
  {
    if (initWithPersistentIdentifier__sOnce != -1) {
      dispatch_once(&initWithPersistentIdentifier__sOnce, &__block_literal_global_1);
    }
    v4->super._connection = (SSXPCConnection *)(id)initWithPersistentIdentifier__sConnection;
  }
  return v4;
}

SSXPCConnection *__43__SSDownload_initWithPersistentIdentifier___block_invoke()
{
  result = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  initWithPersistentIdentifier__sConnection = (uint64_t)result;
  return result;
}

- (id)_initWithLocalPropertyValues:(id)a3
{
  CFArrayRef v4 = SSXPCCreateCFObjectFromXPCObject((const __CFDictionary *)a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = (void *)[(__CFArray *)v4 objectForKey:@"0"]) != 0)
  {
    v6 = -[SSEntity _initWithPersistentIdentifier:](self, "_initWithPersistentIdentifier:", [v5 longLongValue]);
    if (v6)
    {
      uint64_t v7 = [(__CFArray *)v4 objectForKey:@"1"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = (id)v6[4];
        if (!v8)
        {
          id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v6[4] = v8;
        }
        [v8 addEntriesFromDictionary:v7];
      }
      uint64_t v9 = [(__CFArray *)v4 objectForKey:@"2"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (id)v6[3];
        if (!v10)
        {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v6[3] = v10;
        }
        [v10 addEntriesFromDictionary:v9];
      }
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownload;
  [(SSEntity *)&v3 dealloc];
}

- (BOOL)addAsset:(id)a3 forType:(id)a4
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __31__SSDownload_addAsset_forType___block_invoke;
  v13[3] = &unk_1E5BA7578;
  v13[4] = self;
  v13[5] = a4;
  v13[6] = a3;
  v13[7] = &v14;
  dispatch_sync(dispatchQueue, v13);
  if (*((unsigned char *)v15 + 24))
  {
    uint64_t v8 = [a3 _legacyAssetType];
    if (v8)
    {
      if ([a4 isEqualToString:@"media"]
        && ![(SSEntity *)self valueForProperty:@"1"])
      {
        uint64_t v9 = 0;
        id v10 = @"other";
        while (__DownloadKindMapping[v9] != v8)
        {
          v9 += 2;
          if (v9 == 28) {
            goto LABEL_10;
          }
        }
        id v10 = (__CFString *)__DownloadKindMapping[v9 + 1];
LABEL_10:
        [(SSEntity *)self setValue:v10 forProperty:@"1"];
      }
    }
  }
  char v11 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v11;
}

void __31__SSDownload_addAsset_forType___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  if (!*(void *)(v1 + 8))
  {
    objc_super v3 = *(void **)(v1 + 64);
    if (!v3)
    {
      *(void *)(a1[4] + 64) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      objc_super v3 = *(void **)(a1[4] + 64);
    }
    CFArrayRef v4 = (void *)[v3 objectForKey:a1[5]];
    if (v4)
    {
      [v4 addObject:a1[6]];
    }
    else
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a1[6], 0);
      [*(id *)(a1[4] + 64) setObject:v5 forKey:a1[5]];
    }
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

- (id)assetsForType:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v8 = v7;
    }
    else {
      int v8 = v7 & 2;
    }
    if (v8)
    {
      LODWORD(v35) = 136446210;
      *(void *)((char *)&v35 + 4) = "-[SSDownload assetsForType:]";
      LODWORD(v26) = 12;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        id v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v35, v26);
        free(v10);
        SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  *(void *)&long long v35 = 0;
  *((void *)&v35 + 1) = &v35;
  uint64_t v36 = 0x3052000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  uint64_t v39 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  uint64_t v34 = 0;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SSDownload_assetsForType___block_invoke;
  block[3] = &unk_1E5BA75A8;
  block[6] = &v29;
  block[7] = &v35;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(dispatchQueue, block);
  if (v30[5])
  {
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v19, "0", 11);
    xpc_dictionary_set_int64(v19, "1", self->super._pid);
    SSXPCDictionarySetCFObject(v19, "2", (__CFString *)a3);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v21 = dispatch_semaphore_create(0);
    v22 = (void *)v30[5];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __28__SSDownload_assetsForType___block_invoke_2;
    v27[3] = &unk_1E5BA75D0;
    v27[5] = v21;
    v27[6] = &v29;
    v27[4] = v20;
    [v22 sendMessage:v19 withReply:v27];
    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v21);
    id v23 = v20;
    *(void *)(*((void *)&v35 + 1) + 40) = v23;

    xpc_release(v19);
  }
  id v24 = *(id *)(*((void *)&v35 + 1) + 40);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v24;
}

id __28__SSDownload_assetsForType___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  objc_super v3 = *(void **)(v2 + 8);
  if (v3)
  {
    id result = v3;
    uint64_t v5 = a1[6];
  }
  else
  {
    id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 64), "objectForKey:", a1[5]), "copy");
    uint64_t v5 = a1[7];
  }
  *(void *)(*(void *)(v5 + 8) + 40) = result;
  return result;
}

intptr_t __28__SSDownload_assetsForType___block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590])
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "0");
    if (value)
    {
      int v7 = value;
      size_t count = xpc_array_get_count(value);
      if (count)
      {
        size_t v9 = count;
        for (size_t i = 0; i != v9; ++i)
        {
          id v11 = [(SSEntity *)[SSDownloadAsset alloc] _initWithPersistentIdentifier:xpc_array_get_int64(v7, i)];
          [v11 _becomeManagedOnConnection:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
          [*(id *)(a1 + 32) addObject:v11];
        }
      }
    }
  }
  CFArrayRef v4 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v4);
}

- (id)backgroundNetworkingJobGroupName
{
  return [(SSEntity *)self valueForProperty:@"s"];
}

- (int64_t)bytesDownloaded
{
  int64_t result = [(SSEntity *)self valueForExternalProperty:@"0"];
  if (result)
  {
    return [(id)result longLongValue];
  }
  return result;
}

- (int64_t)bytesTotal
{
  int64_t result = [(SSEntity *)self valueForExternalProperty:@"1"];
  if (result)
  {
    return [(id)result longLongValue];
  }
  return result;
}

- (id)downloadPhaseIdentifier
{
  return [(SSEntity *)self valueForProperty:@"I"];
}

- (SSDownloadPolicy)downloadPolicy
{
  id v2 = [(SSEntity *)self valueForExternalProperty:@"7"];
  objc_super v3 = (objc_class *)objc_opt_class();
  ObjectWithArchivedData = (void *)SSCodingCreateObjectWithArchivedData((uint64_t)v2, v3);
  return (SSDownloadPolicy *)ObjectWithArchivedData;
}

- (int64_t)downloadSizeLimit
{
  id v2 = [(SSEntity *)self valueForExternalProperty:@"8"];
  if (!v2) {
    return 0;
  }
  return [v2 longLongValue];
}

- (double)estimatedSecondsRemaining
{
  id v2 = [(SSEntity *)self valueForExternalProperty:@"2"];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (id)failureError
{
  id v3 = [(SSEntity *)self valueForProperty:@"J"];
  return [(SSDownload *)self _errorWithData:v3];
}

- (BOOL)isCancelable
{
  v9[5] = *MEMORY[0x1E4F143B8];
  int v3 = [(SSEntity *)self _isManaged];
  if (v3)
  {
    v9[0] = @"AA";
    v9[1] = @"P";
    v9[2] = @"M";
    v9[3] = @"I";
    v9[4] = @"9";
    [(SSEntity *)self getValues:v5 forProperties:v9 count:5];
    if (!v5[0] || (int v3 = [v5[0] BOOLValue]) != 0)
    {
      if (v8 && !v5[1] || v6 && ([v6 BOOLValue] & 1) != 0)
      {
        LOBYTE(v3) = 0;
      }
      else if (([v7 isEqualToString:@"SSDownloadPhaseWaiting"] & 1) != 0 {
             || ([v7 isEqualToString:@"SSDownloadPhaseDataRestore"] & 1) != 0
      }
             || ([v7 isEqualToString:@"SSDownloadPhaseDownloading"] & 1) != 0
             || ([v7 isEqualToString:@"SSDownloadPhasePaused"] & 1) != 0
             || ([v7 isEqualToString:@"SSDownloadPhasePreflight"] & 1) != 0)
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        LOBYTE(v3) = [v7 isEqualToString:@"SSDownloadPhaseFailed"];
      }
    }
  }
  return v3;
}

- (BOOL)isEligibleForRestore:(id *)a3
{
  CFArrayRef v4 = [[SSRestoreContentItem alloc] initWithRestoreDownload:self];
  LOBYTE(a3) = [(SSRestoreContentItem *)v4 isEligibleForRestore:a3];

  return (char)a3;
}

- (id)networkConstraints
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v3 = objc_alloc_init(SSNetworkConstraints);
  CFArrayRef v4 = [(SSDownloadPolicy *)[(SSDownload *)self downloadPolicy] policyRules];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        size_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v10 = (void *)[v9 networkTypes];
        uint64_t v11 = [v9 downloadSizeLimit];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v10);
              }
              -[SSNetworkConstraints setSizeLimit:forNetworkType:](v3, "setSizeLimit:forNetworkType:", v11, [*(id *)(*((void *)&v17 + 1) + 8 * j) integerValue]);
            }
            uint64_t v13 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v13);
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void)pause
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v6 = v5;
    }
    else {
      int v6 = v5 & 2;
    }
    if (v6)
    {
      LODWORD(v21) = 136446210;
      *(void *)((char *)&v21 + 4) = "-[SSDownload pause]";
      LODWORD(v19) = 12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v21, v19);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  *(void *)&long long v21 = 0;
  *((void *)&v21 + 1) = &v21;
  uint64_t v22 = 0x3052000000;
  long long v23 = __Block_byref_object_copy__0;
  long long v24 = __Block_byref_object_dispose__0;
  uint64_t v25 = 0;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__SSDownload_pause__block_invoke;
  block[3] = &unk_1E5BA7688;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(dispatchQueue, block);
  if (*(void *)(*((void *)&v21 + 1) + 40))
  {
    xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v17, "0", 17);
    xpc_object_t v18 = xpc_array_create(0, 0);
    xpc_array_set_int64(v18, 0xFFFFFFFFFFFFFFFFLL, self->super._pid);
    xpc_dictionary_set_value(v17, "1", v18);
    xpc_release(v18);
    [*(id *)(*((void *)&v21 + 1) + 40) sendMessage:v17 withReply:&__block_literal_global_117];
    xpc_release(v17);
  }
  else
  {
    [(SSEntity *)self setValue:@"SSDownloadPhasePaused" forProperty:@"I"];
  }
  _Block_object_dispose(&v21, 8);
}

id __19__SSDownload_pause__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (double)percentComplete
{
  id v2 = [(SSEntity *)self valueForExternalProperty:@"4"];
  [v2 doubleValue];
  return result;
}

- (int64_t)persistentIdentifier
{
  return self->super._pid;
}

- (void)prioritizeAboveDownload:(id)a3 completionBlock:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v10 = v9;
    }
    else {
      int v10 = v9 & 2;
    }
    if (v10)
    {
      LODWORD(v28) = 136446210;
      *(void *)((char *)&v28 + 4) = "-[SSDownload prioritizeAboveDownload:completionBlock:]";
      LODWORD(v24) = 12;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v28, v24);
        free(v12);
        SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = &v28;
  uint64_t v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__0;
  uint64_t v31 = __Block_byref_object_dispose__0;
  uint64_t v32 = 0;
  if (a3) {
    a3 = (id)[a3 persistentIdentifier];
  }
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke;
  block[3] = &unk_1E5BA76D8;
  block[4] = self;
  block[5] = &v28;
  void block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  if (*(void *)(*((void *)&v28 + 1) + 40))
  {
    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v21, "0", 28);
    xpc_dictionary_set_int64(v21, "1", self->super._pid);
    xpc_dictionary_set_int64(v21, "2", (int64_t)a3);
    uint64_t v22 = *(void **)(*((void *)&v28 + 1) + 40);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke_3;
    v25[3] = &unk_1E5BA7750;
    v25[4] = self;
    v25[5] = a4;
    [v22 sendMessage:v21 withReply:v25];
    xpc_release(v21);
  }
  else if (a4)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke_2;
    v26[3] = &unk_1E5BA7700;
    v26[4] = a4;
    dispatch_async(global_queue, v26);
  }
  _Block_object_dispose(&v28, 8);
}

uint64_t __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = *(id *)(a1[4] + 8);

  uint64_t result = [objc_alloc(MEMORY[0x1E4F28ED0]) initWithLongLong:a1[6]];
  *(void *)(a1[4] + 80) = result;
  return result;
}

uint64_t __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = [*(id *)(a1 + 32) _errorWithXPCReply:a2];
    global_queue = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke_4;
    v6[3] = &unk_1E5BA7728;
    uint64_t v5 = *(void *)(a1 + 40);
    v6[4] = v3;
    v6[5] = v5;
    dispatch_async(global_queue, v6);
  }
}

uint64_t __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)removeAsset:(id)a3
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  dispatchQueue = self->super._dispatchQueue;
  char v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SSDownload_removeAsset___block_invoke;
  block[3] = &unk_1E5BA77A0;
  block[4] = self;
  block[5] = a3;
  void block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __26__SSDownload_removeAsset___block_invoke(int8x16_t *a1)
{
  uint64_t v1 = a1[2].i64[0];
  if (!*(void *)(v1 + 8))
  {
    uint64_t v3 = (void *)[*(id *)(v1 + 64) copy];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __26__SSDownload_removeAsset___block_invoke_2;
    v4[3] = &unk_1E5BA7778;
    int8x16_t v5 = vextq_s8(a1[2], a1[2], 8uLL);
    uint64_t v6 = a1[3].i64[0];
    [v3 enumerateKeysAndObjectsUsingBlock:v4];
  }
}

uint64_t __26__SSDownload_removeAsset___block_invoke_2(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 indexOfObjectIdenticalTo:a1[4]];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    [a3 removeObjectAtIndex:result];
    uint64_t result = [a3 count];
    if (!result) {
      uint64_t result = [*(id *)(a1[5] + 64) removeObjectForKey:a2];
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)resume
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3052000000;
  char v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  uint64_t v12 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __20__SSDownload_resume__block_invoke;
  v6[3] = &unk_1E5BA7688;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dispatchQueue, v6);
  if (v8[5])
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "0", 19);
    xpc_object_t v5 = xpc_array_create(0, 0);
    xpc_array_set_int64(v5, 0xFFFFFFFFFFFFFFFFLL, self->super._pid);
    xpc_dictionary_set_value(v4, "1", v5);
    xpc_release(v5);
    [(id)v8[5] sendMessage:v4 withReply:&__block_literal_global_121];
    xpc_release(v4);
  }
  else
  {
    [(SSEntity *)self setValue:0 forProperty:@"I"];
  }
  _Block_object_dispose(&v7, 8);
}

id __20__SSDownload_resume__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)restart
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3052000000;
  char v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  uint64_t v12 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __21__SSDownload_restart__block_invoke;
  v6[3] = &unk_1E5BA7688;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dispatchQueue, v6);
  if (v8[5])
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "0", 20);
    xpc_object_t v5 = xpc_array_create(0, 0);
    xpc_array_set_int64(v5, 0xFFFFFFFFFFFFFFFFLL, self->super._pid);
    xpc_dictionary_set_value(v4, "1", v5);
    xpc_release(v5);
    [(id)v8[5] sendMessage:v4 withReply:&__block_literal_global_123];
    xpc_release(v4);
  }
  _Block_object_dispose(&v7, 8);
}

id __21__SSDownload_restart__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setBackgroundNetworkingJobGroupName:(id)a3
{
  id v4 = (id)[a3 copy];
  [(SSEntity *)self setValue:v4 forProperty:@"s"];
}

- (void)setDownloadHandler:(id)a3 completionBlock:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v10 = v9;
    }
    else {
      int v10 = v9 & 2;
    }
    if (v10)
    {
      LODWORD(v29) = 136446210;
      *(void *)((char *)&v29 + 4) = "-[SSDownload setDownloadHandler:completionBlock:]";
      LODWORD(v25) = 12;
      uint64_t v24 = &v29;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v29, v25);
        free(v12);
        SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = &v29;
  uint64_t v30 = 0x3052000000;
  uint64_t v31 = __Block_byref_object_copy__0;
  uint64_t v32 = __Block_byref_object_dispose__0;
  uint64_t v33 = 0;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SSDownload_setDownloadHandler_completionBlock___block_invoke;
  block[3] = &unk_1E5BA7688;
  block[4] = self;
  block[5] = &v29;
  dispatch_sync(dispatchQueue, block);
  if (*(void *)(*((void *)&v29 + 1) + 40))
  {
    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v21, "0", 23);
    xpc_dictionary_set_int64(v21, "1", self->super._pid);
    if (a3) {
      xpc_dictionary_set_int64(v21, "2", [a3 handlerIdentifier]);
    }
    uint64_t v22 = *(void **)(*((void *)&v29 + 1) + 40);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __49__SSDownload_setDownloadHandler_completionBlock___block_invoke_3;
    v26[3] = &unk_1E5BA77D0;
    v26[4] = a4;
    objc_msgSend(v22, "sendMessage:withReply:", v21, v26, v24);
    xpc_release(v21);
  }
  else
  {
    -[SSEntity setValue:forProperty:](self, "setValue:forProperty:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(a3, "handlerIdentifier")), @"O");
    if (a4)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __49__SSDownload_setDownloadHandler_completionBlock___block_invoke_2;
      v27[3] = &unk_1E5BA7700;
      v27[4] = a4;
      dispatch_async(global_queue, v27);
    }
  }
  _Block_object_dispose(&v29, 8);
}

id __49__SSDownload_setDownloadHandler_completionBlock___block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __49__SSDownload_setDownloadHandler_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__SSDownload_setDownloadHandler_completionBlock___block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  if (*(void *)(a1 + 32))
  {
    if (xpc_dictionary_get_BOOL(xdict, "0")) {
      CFArrayRef v4 = 0;
    }
    else {
      CFArrayRef v4 = SSXPCDictionaryCopyCFObject(xdict, "1");
    }
    global_queue = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__SSDownload_setDownloadHandler_completionBlock___block_invoke_4;
    v7[3] = &unk_1E5BA7728;
    uint64_t v6 = *(void *)(a1 + 32);
    v7[4] = v4;
    v7[5] = v6;
    dispatch_async(global_queue, v7);
  }
}

uint64_t __49__SSDownload_setDownloadHandler_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setDownloadPolicy:(id)a3
{
  id ArchivableData = SSCodingCreateArchivableData(a3);
  id v4 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v5 = (uint64_t)ArchivableData;
  if (!ArchivableData) {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v6 = objc_msgSend(v4, "initWithObjectsAndKeys:", v5, @"7", 0);
  [(SSEntity *)self setExternalValuesWithDictionary:v6];
}

- (void)setNetworkConstraints:(id)a3
{
  if (a3)
  {
    id v4 = [[SSDownloadPolicy alloc] initWithNetworkConstraints:a3];
    [(SSDownload *)self setDownloadPolicy:v4];
  }
  else
  {
    -[SSDownload setDownloadPolicy:](self, "setDownloadPolicy:");
  }
}

- (void)setValuesWithStoreDownloadMetadata:(id)a3
{
  id v4 = (id)[a3 newDownloadProperties];
  [(SSEntity *)self setValuesWithDictionary:v4];
}

+ (int64_t)_existsMessage
{
  return 52;
}

+ (int64_t)_getExternalValuesMessage
{
  return 27;
}

+ (int64_t)_getValueMessage
{
  return 13;
}

+ (int64_t)_setExternalValuesMessage
{
  return 32;
}

+ (int64_t)_setValuesMessage
{
  return 24;
}

- (void)_addCachedExternalValues:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SSDownload__addCachedExternalValues___block_invoke;
  v4[3] = &unk_1E5BA7448;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

void *__39__SSDownload__addCachedExternalValues___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 24) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  id result = (void *)[v2 addEntriesFromDictionary:*(void *)(a1 + 40)];
  if (*(void *)(*(void *)(a1 + 32) + 88))
  {
    id result = (void *)[*(id *)(a1 + 40) objectForKey:@"4"];
    if (result)
    {
      id v4 = *(void **)(*(void *)(a1 + 32) + 88);
      [result floatValue];
      return objc_msgSend(v4, "setPercentComplete:");
    }
  }
  return result;
}

- (void)_addCachedPropertyValues:(id)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SSDownload__addCachedPropertyValues___block_invoke;
  v4[3] = &unk_1E5BA7448;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __39__SSDownload__addCachedPropertyValues___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 32) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  uint64_t result = [v2 addEntriesFromDictionary:*(void *)(a1 + 40)];
  if (*(void *)(*(void *)(a1 + 32) + 88))
  {
    uint64_t v4 = [*(id *)(a1 + 40) objectForKey:@"K"];
    uint64_t v5 = [*(id *)(a1 + 40) objectForKey:@"I"];
    if (v5)
    {
      [*(id *)(a1 + 32) _applyPhase:v5 toStatus:*(void *)(*(void *)(a1 + 32) + 88)];
    }
    else if (!v4)
    {
      goto LABEL_13;
    }
    uint64_t v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) objectForKey:@"I"];
    id v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) objectForKey:@"K"];
    if (v7)
    {
      char v8 = [v7 BOOLValue];
      int v9 = *(void **)(*(void *)(a1 + 32) + 88);
      if (v8)
      {
LABEL_9:
        uint64_t v10 = [v6 isEqualToString:@"SSDownloadPhaseDownloading"];
LABEL_12:
        [v9 setPausable:v10];
LABEL_13:
        uint64_t result = [*(id *)(a1 + 40) objectForKey:@"J"];
        if (result)
        {
          uint64_t v12 = result;
          uint64_t v13 = *(void **)(a1 + 32);
          uint64_t v14 = (void *)v13[11];
          uint64_t v15 = [v13 _errorWithData:v12];
          return [v14 setError:v15];
        }
        return result;
      }
    }
    else
    {
      int v11 = [*(id *)(*(void *)(a1 + 32) + 88) isPausable];
      int v9 = *(void **)(*(void *)(a1 + 32) + 88);
      if (v11) {
        goto LABEL_9;
      }
    }
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  return result;
}

- (void)_resetLocalIVars
{
  self->_localAssets = 0;
  self->_prioritizeAboveDownload = 0;
  v3.receiver = self;
  v3.super_class = (Class)SSDownload;
  [(SSEntity *)&v3 _resetLocalIVars];
}

- (id)_newAssetWithURL:(id)a3 assetType:(id)a4
{
  uint64_t v5 = [(SSURLRequestProperties *)[SSMutableURLRequestProperties alloc] initWithURL:a3];
  [(SSMutableURLRequestProperties *)v5 setITunesStoreRequest:1];
  uint64_t v6 = [[SSDownloadAsset alloc] initWithURLRequestProperties:v5];
  [(SSEntity *)v6 setValue:a4 forProperty:@"e"];

  return v6;
}

- (SSDownload)initWithDownloadMetadata:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SSDownload;
  uint64_t v4 = [(SSEntity *)&v16 init];
  uint64_t v5 = v4;
  if (v4)
  {
    [(SSDownload *)v4 setValuesWithStoreDownloadMetadata:a3];
    uint64_t v6 = [a3 sinfs];
    if (v6) {
      uint64_t v7 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:0];
    }
    else {
      uint64_t v7 = 0;
    }
    char v8 = (void *)[a3 primaryAssetURL];
    if (objc_msgSend((id)objc_msgSend(v8, "host"), "length"))
    {
      id v9 = [(SSDownload *)v5 _newAssetWithURL:v8 assetType:@"media"];
      uint64_t v10 = v9;
      if (v7) {
        [v9 setValue:v7 forProperty:@"B"];
      }
      [(SSDownload *)v5 addAsset:v10 forType:@"media"];
    }
    int v11 = (void *)[a3 fullSizeImageURL];
    if (objc_msgSend((id)objc_msgSend(v11, "host"), "length"))
    {
      id v12 = [(SSDownload *)v5 _newAssetWithURL:v11 assetType:@"artwork"];
      [(SSDownload *)v5 addAsset:v12 forType:@"artwork"];
    }
    uint64_t v13 = (void *)[a3 podcastFeedURL];
    if (objc_msgSend((id)objc_msgSend(v13, "host"), "length"))
    {
      id v14 = [(SSDownload *)v5 _newAssetWithURL:v13 assetType:@"xmlfeed"];
      [(SSDownload *)v5 addAsset:v14 forType:@"xmlfeed"];
    }
  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->super._pid);
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__SSDownload_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E5BA7448;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __29__SSDownload_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "1", *(__CFString **)(*(void *)(a1 + 40) + 32));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "2", *(__CFString **)(*(void *)(a1 + 40) + 64));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "3", *(__CFString **)(*(void *)(a1 + 40) + 80));
  id v2 = *(void **)(a1 + 32);
  xpc_object_t v3 = *(__CFString **)(*(void *)(a1 + 40) + 24);
  SSXPCDictionarySetCFObject(v2, "4", v3);
}

- (NSArray)assets
{
  return 0;
}

- (id)downloadIdentifier
{
  return (id)[MEMORY[0x1E4F28ED0] numberWithLongLong:self->super._pid];
}

- (BOOL)isBackgroundNetworkingUserInitiated
{
  id v2 = [(SSEntity *)self valueForProperty:@"W"];
  return (objc_opt_respondsToSelector() & 1) == 0 || [v2 intValue] != -1;
}

- (BOOL)isExternal
{
  return [(SSEntity *)self valueForProperty:@"9"] == 0;
}

- (SSDownloadMetadata)metadata
{
  uint64_t result = self->_metadata;
  if (!result)
  {
    uint64_t v4 = objc_alloc_init(SSDownloadMetadata);
    self->_metadata = v4;
    [(SSDownloadMetadata *)v4 setValuesFromDownload:self];
    return self->_metadata;
  }
  return result;
}

- (void)setBackgroundNetworkingUserInitiated:(BOOL)a3
{
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInt:(a3 - 1)];
  [(SSDownload *)self setValue:v4 forKey:@"W"];
}

- (void)setMetadata:(id)a3
{
  -[SSDownload setValuesWithStoreDownloadMetadata:](self, "setValuesWithStoreDownloadMetadata:");
  metadata = self->_metadata;
  if (metadata) {
    BOOL v6 = metadata == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {

    self->_metadata = (SSDownloadMetadata *)a3;
  }
}

- (SSDownloadStatus)status
{
  v23[4] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = __Block_byref_object_copy__0;
  long long v20 = __Block_byref_object_dispose__0;
  uint64_t v21 = 0;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__SSDownload_status__block_invoke;
  block[3] = &unk_1E5BA7688;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(dispatchQueue, block);
  uint64_t v4 = (void *)v17[5];
  if (!v4)
  {
    uint64_t v5 = objc_alloc_init(SSDownloadStatus);
    v17[5] = (uint64_t)v5;
    v23[0] = @"I";
    v23[1] = @"J";
    v23[2] = @"a";
    v23[3] = @"K";
    [(SSEntity *)self getValues:v22 forProperties:v23 count:4];
    objc_msgSend((id)v17[5], "setContentRestricted:", objc_msgSend(v22[2], "BOOLValue"));
    objc_msgSend((id)v17[5], "setError:", -[SSDownload _errorWithData:](self, "_errorWithData:", v22[1]));
    BOOL v6 = objc_alloc_init(SSOperationProgress);
    if ([v22[0] isEqualToString:@"SSDownloadPhaseDownloading"]) {
      -[SSOperationProgress setCanPause:](v6, "setCanPause:", [v22[3] BOOLValue]);
    }
    [(SSDownload *)self percentComplete];
    [(SSOperationProgress *)v6 setNormalizedCurrentValue:(uint64_t)(v7 * 100.0)];
    [(SSOperationProgress *)v6 setNormalizedMaxValue:100];
    [(id)v17[5] setOperationProgress:v6];

    [(SSDownload *)self _applyPhase:v22[0] toStatus:v17[5]];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    for (uint64_t i = 0; i != 4; ++i)
    {
      id v10 = v22[i];
      if (v10) {
        [v8 setObject:v10 forKey:v23[i]];
      }
    }
    int v11 = self->super._dispatchQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __20__SSDownload_status__block_invoke_2;
    v14[3] = &unk_1E5BA77A0;
    v14[4] = self;
    v14[5] = v8;
    v14[6] = &v16;
    dispatch_sync(v11, v14);

    uint64_t v4 = (void *)v17[5];
  }
  id v12 = v4;
  _Block_object_dispose(&v16, 8);
  return v12;
}

id __20__SSDownload_status__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 88);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __20__SSDownload_status__block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  xpc_object_t v3 = *(void **)(v2 + 32);
  if (v3)
  {
    [v3 addEntriesFromDictionary:a1[5]];
    uint64_t v2 = a1[4];
  }

  id result = *(id *)(*(void *)(a1[6] + 8) + 40);
  *(void *)(a1[4] + 88) = result;
  return result;
}

- (NSDictionary)_localAssets
{
  uint64_t v2 = (void *)[(NSMutableDictionary *)self->_localAssets copy];
  return (NSDictionary *)v2;
}

- (void)_resetStatus
{
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SSDownload__resetStatus__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

void __26__SSDownload__resetStatus__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 88))
  {
    [*(id *)(v1 + 24) removeObjectForKey:@"4"];
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:@"K"];
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:@"I"];
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:@"J"];
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:@"a"];

    *(void *)(*(void *)(a1 + 32) + 88) = 0;
  }
}

- (SSXPCConnection)_XPCConnection
{
  return self->super._connection;
}

- (void)_applyPhase:(id)a3 toStatus:(id)a4
{
  objc_msgSend(a4, "setFailed:", objc_msgSend(a3, "isEqualToString:", @"SSDownloadPhaseFailed"));
  objc_msgSend(a4, "setPaused:", objc_msgSend(a3, "isEqualToString:", @"SSDownloadPhasePaused"));
  if ([a3 isEqualToString:@"SSDownloadPhaseInstalling"])
  {
    uint64_t v6 = 1;
  }
  else if ([a3 isEqualToString:@"SSDownloadPhaseDownloading"])
  {
    uint64_t v6 = 2;
  }
  else
  {
    if (![a3 isEqualToString:@"SSDownloadPhaseUploading"]) {
      return;
    }
    uint64_t v6 = 3;
  }
  [a4 setOperationType:v6];
}

- (id)_errorWithData:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    ObjectWithArchivedData = (void *)SSCodingCreateObjectWithArchivedData((uint64_t)a3, v4);
  }
  else
  {
    ObjectWithArchivedData = 0;
  }
  return ObjectWithArchivedData;
}

- (id)_errorWithXPCReply:(id)a3
{
  if (!a3) {
    goto LABEL_3;
  }
  uint64_t v4 = MEMORY[0x1A62689E0](a3, a2);
  uint64_t v5 = MEMORY[0x1E4F14590];
  if (v4 != MEMORY[0x1E4F14590]) {
    goto LABEL_3;
  }
  if (xpc_dictionary_get_BOOL(a3, "0")) {
    return 0;
  }
  xpc_object_t value = xpc_dictionary_get_value(a3, "1");
  if (!value
    || (xpc_object_t v8 = value, MEMORY[0x1A62689E0]() != v5)
    || (id result = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithXPCEncoding:v8]) == 0)
  {
LABEL_3:
    return (id)SSError(@"SSErrorDomain", 100, 0, 0);
  }
  return result;
}

@end