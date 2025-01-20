@interface SpotlightDaemonServer
+ (id)sharedDaemonServer;
- (BOOL)handleJob:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 completionHandler:(id)a6;
- (BOOL)haveDaemonForBundleID:(id)a3 jobType:(int64_t)a4;
- (id)connectionForBundleID:(id)a3 jobType:(int64_t)a4;
- (id)connectionForClientType:(int64_t)a3 jobType:(int64_t)a4;
- (int64_t)clientTypeForBundleID:(id)a3 jobType:(int64_t)a4;
- (void)enumerateConnections:(id)a3 jobType:(int64_t)a4;
- (void)handleJob:(id)a3 protectionClass:(id)a4 perClientCompletionHandler:(id)a5 completionHandler:(id)a6;
- (void)issueReindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 reason:(id)a5 acknowledgementHandler:(id)a6;
- (void)issueReindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6;
- (void)notifyUpdatesForItems:(id)a3 bundleID:(id)a4 interestedAttributeMask:(int64_t)a5 acknowledgementHandler:(id)a6;
- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)provideFileURLsForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifiers:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)updateFileProviderBundleIDs:(id)a3;
@end

@implementation SpotlightDaemonServer

+ (id)sharedDaemonServer
{
  if (sharedDaemonServer_onceToken != -1) {
    dispatch_once(&sharedDaemonServer_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedDaemonServer_sSpotlightDaemonServer;
  return v2;
}

void __43__SpotlightDaemonServer_sharedDaemonServer__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedDaemonServer_sSpotlightDaemonServer;
  sharedDaemonServer_sSpotlightDaemonServer = v0;

  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v2 = 1u;
  do
  {
    v3 = [NSString stringWithUTF8String:*((void *)&sDisabledClientCStrings + v2)];
    int v4 = [v5 BOOLForKey:v3];

    if (v4) {
      sDisabledConnections[v2] = 1;
    }
    ++v2;
  }
  while (v2 != 11);
}

- (BOOL)handleJob:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 completionHandler:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 jobType];
  v15 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v39 = v14;
    __int16 v40 = 2112;
    id v41 = v11;
    _os_log_impl(&dword_21F1CE000, v15, OS_LOG_TYPE_DEFAULT, "Handle job type %ld from %@", buf, 0x16u);
  }

  BOOL v16 = 0;
  if ([(SpotlightDaemonServer *)self haveDaemonForBundleID:v11 jobType:v14])
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 1;
    switch(v14)
    {
      case 1:
        v20 = [v10 identifiersToReindex];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_3;
        v32[3] = &unk_264506548;
        v21 = &v33;
        id v33 = v13;
        [(SpotlightDaemonServer *)self issueReindexItemsWithIdentifiers:v20 bundleID:v11 protectionClass:v12 acknowledgementHandler:v32];
        goto LABEL_14;
      case 2:
        v20 = [v10 reason];
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_2;
        v34[3] = &unk_264506548;
        v21 = &v35;
        id v35 = v13;
        [(SpotlightDaemonServer *)self issueReindexAllItemsForBundleID:v11 protectionClass:v12 reason:v20 acknowledgementHandler:v34];
        goto LABEL_14;
      case 6:
        uint64_t v17 = 1;
        goto LABEL_8;
      case 7:
        goto LABEL_10;
      case 8:
        uint64_t v19 = 3;
LABEL_10:
        uint64_t v18 = v19;
        goto LABEL_11;
      case 14:
LABEL_8:
        v20 = [v10 providerIdentifier];
        v22 = [v10 providerType];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_4;
        v30[3] = &unk_264509660;
        v21 = &v31;
        id v31 = v13;
        [(SpotlightDaemonServer *)self provideDataForBundleID:v11 protectionClass:v12 itemIdentifier:v20 typeIdentifier:v22 options:v17 completionHandler:v30];

        goto LABEL_14;
      case 15:
LABEL_11:
        v20 = [v10 providerIdentifier];
        v23 = [v10 providerType];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_5;
        v28[3] = &unk_264509660;
        v21 = &v29;
        id v29 = v13;
        [(SpotlightDaemonServer *)self provideFileURLForBundleID:v11 protectionClass:v12 itemIdentifier:v20 typeIdentifier:v23 options:v18 completionHandler:v28];
        goto LABEL_13;
      case 16:
        v20 = [v10 providerIdentifiers];
        v23 = [v10 providerType];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_6;
        v26[3] = &unk_264509660;
        v21 = &v27;
        id v27 = v13;
        [(SpotlightDaemonServer *)self provideFileURLsForBundleID:v11 protectionClass:v12 itemIdentifiers:v20 typeIdentifier:v23 options:1 completionHandler:v26];
LABEL_13:

        goto LABEL_14;
      case 17:
        v20 = [v10 updatedItems];
        uint64_t v25 = [v10 updatedItemsMask];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke;
        v36[3] = &unk_264506548;
        v21 = &v37;
        id v37 = v13;
        [(SpotlightDaemonServer *)self notifyUpdatesForItems:v20 bundleID:v11 interestedAttributeMask:v25 acknowledgementHandler:v36];
LABEL_14:

        BOOL v16 = 1;
        break;
      default:
        break;
    }
  }

  return v16;
}

uint64_t __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v7 = v3;
    if (v3)
    {
      id v5 = (void *)[MEMORY[0x263F02B30] copyNSDataForKey:"d" fromXPCDictionary:v3];
      uint64_t v4 = *(void *)(a1 + 32);
    }
    else
    {
      id v5 = 0;
    }
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);

    id v3 = v7;
  }
  return MEMORY[0x270F9A758](v4, v3);
}

uint64_t __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v7 = v3;
    if (v3)
    {
      id v5 = (void *)[MEMORY[0x263F02B30] copyNSDataForKey:"u" fromXPCDictionary:v3];
      uint64_t v4 = *(void *)(a1 + 32);
    }
    else
    {
      id v5 = 0;
    }
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);

    id v3 = v7;
  }
  return MEMORY[0x270F9A758](v4, v3);
}

uint64_t __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v7 = v3;
    if (v3)
    {
      id v5 = (void *)[MEMORY[0x263F02B30] copyNSDataForKey:"brs" fromXPCDictionary:v3];
      uint64_t v4 = *(void *)(a1 + 32);
    }
    else
    {
      id v5 = 0;
    }
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);

    id v3 = v7;
  }
  return MEMORY[0x270F9A758](v4, v3);
}

- (int64_t)clientTypeForBundleID:(id)a3 jobType:(int64_t)a4
{
  id v5 = a3;
  if (clientTypeForBundleID_jobType__onceToken != -1) {
    dispatch_once(&clientTypeForBundleID_jobType__onceToken, &__block_literal_global_24);
  }
  if (byte_267EC7139 || ([v5 hasPrefix:@"com.apple.people."] & 1) == 0)
  {
    if (byte_267EC713A || ([v5 isEqualToString:@"com.apple.mobileslideshow"] & 1) == 0)
    {
      if (byte_267EC713B || ([v5 isEqualToString:@"com.apple.mobilecal"] & 1) == 0)
      {
        if (!byte_267EC713C
          && [v5 isEqualToString:@"com.apple.MobileSMS"]
          && (clientTypeForBundleID_jobType__messagesDaemonEnabled & 1) != 0)
        {
          int64_t v6 = 4;
        }
        else if (byte_267EC713D || ([v5 isEqualToString:@"com.apple.mobilemail"] & 1) == 0)
        {
          if (byte_267EC713E || ([v5 isEqualToString:@"com.apple.Stickers"] & 1) == 0)
          {
            if (byte_267EC713F
              || ([v5 isEqualToString:@"com.apple.usernotificationsd"] & 1) == 0)
            {
              if (byte_267EC7140 || ([(id)fileProviderBundleIDs containsObject:v5] & 1) == 0)
              {
                if (byte_267EC7141 || ([v5 hasPrefix:@"com.apple.search.csdaemon"] & 1) == 0)
                {
                  if (!byte_267EC7142
                    && [v5 hasPrefix:@"com.apple.search.csreceiver"]
                    && (+[SpotlightSender connectionForClient:0 jobType:a4], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
                  {
                    int64_t v6 = 10;
                  }
                  else
                  {
                    int64_t v6 = 0;
                  }
                }
                else
                {
                  int64_t v6 = 9;
                }
              }
              else
              {
                int64_t v6 = 8;
              }
            }
            else
            {
              int64_t v6 = 7;
            }
          }
          else
          {
            int64_t v6 = 6;
          }
        }
        else
        {
          int64_t v6 = 5;
        }
      }
      else
      {
        int64_t v6 = 3;
      }
    }
    else
    {
      int64_t v6 = 2;
    }
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

uint64_t __55__SpotlightDaemonServer_clientTypeForBundleID_jobType___block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  clientTypeForBundleID_jobType__messagesDaemonEnabled = result;
  return result;
}

- (id)connectionForClientType:(int64_t)a3 jobType:(int64_t)a4
{
  if ((unint64_t)(a3 - 1) > 9)
  {
    id v6 = 0;
  }
  else
  {
    block[5] = v4;
    uint64_t v11 = v5;
    if (a3 == 10)
    {
      id v6 = +[SpotlightSender connectionForClient:0 jobType:a4];
    }
    else
    {
      v8 = (dispatch_once_t *)((char *)&connectionForClientType_jobType__onceTokens + 8 * a3);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__SpotlightDaemonServer_connectionForClientType_jobType___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a3;
      if (*v8 != -1)
      {
        int64_t v9 = a3;
        dispatch_once(v8, block);
        a3 = v9;
      }
      id v6 = (id)sConnections[a3];
    }
  }
  return v6;
}

void __57__SpotlightDaemonServer_connectionForClientType_jobType___block_invoke(uint64_t a1)
{
  if (!sDisabledConnections[*(void *)(a1 + 32)])
  {
    uint64_t v2 = [SDXPCClientConnection alloc];
    id v6 = [NSString stringWithUTF8String:*((void *)&sConnectionStrings + *(void *)(a1 + 32))];
    uint64_t v3 = [(SDXPCClientConnection *)v2 initWithServiceName:v6 clientType:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = (void *)sConnections[v4];
    sConnections[v4] = v3;
  }
}

- (id)connectionForBundleID:(id)a3 jobType:(int64_t)a4
{
  int64_t v6 = -[SpotlightDaemonServer clientTypeForBundleID:jobType:](self, "clientTypeForBundleID:jobType:", a3);
  return [(SpotlightDaemonServer *)self connectionForClientType:v6 jobType:a4];
}

- (BOOL)haveDaemonForBundleID:(id)a3 jobType:(int64_t)a4
{
  return [(SpotlightDaemonServer *)self clientTypeForBundleID:a3 jobType:a4] != 0;
}

- (void)issueReindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 reason:(id)a5 acknowledgementHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  uint64_t v14 = [(SpotlightDaemonServer *)self connectionForBundleID:v10 jobType:2];
  if (v14)
  {
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v15, "command", "ri");
    if (v11) {
      xpc_dictionary_set_string(v15, "pc", (const char *)[v11 UTF8String]);
    }
    if (v12)
    {
      BOOL v16 = [NSString stringWithFormat:@"[SP-reindex] %@", v12];
    }
    else
    {
      BOOL v16 = @"[SP-reindex] reason unavailable";
    }
    uint64_t v17 = v16;
    xpc_dictionary_set_string(v15, "rire", (const char *)[(__CFString *)v17 UTF8String]);
    xpc_dictionary_set_string(v15, "b", (const char *)[v10 UTF8String]);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __103__SpotlightDaemonServer_issueReindexAllItemsForBundleID_protectionClass_reason_acknowledgementHandler___block_invoke;
    v18[3] = &unk_264509660;
    uint64_t v19 = v13;
    [v14 sendMessageAsync:v15 completion:v18];
  }
  else if (v13)
  {
    v13[2](v13);
  }
}

uint64_t __103__SpotlightDaemonServer_issueReindexAllItemsForBundleID_protectionClass_reason_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)issueReindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  uint64_t v14 = [(SpotlightDaemonServer *)self connectionForBundleID:v11 jobType:1];
  if (v14 && [v10 count])
  {
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v15, "command", "ri");
    if (v12) {
      xpc_dictionary_set_string(v15, "pc", (const char *)[v12 UTF8String]);
    }
    xpc_dictionary_set_string(v15, "b", (const char *)[v11 UTF8String]);
    [MEMORY[0x263F02B30] dictionary:v15 setStringArray:v10 forKey:"idsa"];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __106__SpotlightDaemonServer_issueReindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke;
    v16[3] = &unk_264509660;
    uint64_t v17 = v13;
    [v14 sendMessageAsync:v15 completion:v16];
  }
  else if (v13)
  {
    v13[2](v13);
  }
}

uint64_t __106__SpotlightDaemonServer_issueReindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)enumerateConnections:(id)a3 jobType:(int64_t)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void (**)(id, void, void *))a3;
  uint64_t v6 = 0;
  p_info = &OBJC_METACLASS___CSDecryptInfo.info;
  *(void *)&long long v8 = 138412290;
  long long v19 = v8;
  unint64_t v9 = 0x263F08000uLL;
  do
  {
    if (v6 == 8)
    {
      id v10 = [(__objc2_class_ro *)p_info[440] allObjects];
    }
    else
    {
      id v11 = [*(id *)(v9 + 2880) stringWithCString:*((void *)&sBundleStrings + v6) encoding:134217984];
      v29[0] = v11;
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
    }
    if (sDisabledConnections[v6])
    {
      id v12 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        v28 = v10;
        _os_log_impl(&dword_21F1CE000, v12, OS_LOG_TYPE_DEFAULT, "Skipping disabled connection for %@", buf, 0xCu);
      }
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v20 = v10;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            uint64_t v18 = -[SpotlightDaemonServer connectionForClientType:jobType:](self, "connectionForClientType:jobType:", v6, a4, v19);
            v5[2](v5, v17, v18);
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v14);
        p_info = (__objc2_class_ro **)(&OBJC_METACLASS___CSDecryptInfo + 32);
        unint64_t v9 = 0x263F08000;
      }
      id v10 = v20;
    }

    ++v6;
  }
  while (v6 != 11);
}

- (void)handleJob:(id)a3 protectionClass:(id)a4 perClientCompletionHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_group_t v14 = dispatch_group_create();
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __96__SpotlightDaemonServer_handleJob_protectionClass_perClientCompletionHandler_completionHandler___block_invoke;
  v26[3] = &unk_264509970;
  id v15 = v10;
  id v27 = v15;
  dispatch_group_t v28 = v14;
  id v29 = self;
  id v30 = v11;
  id v31 = v12;
  id v16 = v12;
  id v17 = v11;
  uint64_t v18 = v14;
  -[SpotlightDaemonServer enumerateConnections:jobType:](self, "enumerateConnections:jobType:", v26, [v15 jobType]);
  qos_class_t v19 = qos_class_self();
  v20 = dispatch_get_global_queue(v19, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__SpotlightDaemonServer_handleJob_protectionClass_perClientCompletionHandler_completionHandler___block_invoke_72;
  block[3] = &unk_264507168;
  id v24 = v15;
  id v25 = v13;
  id v21 = v13;
  id v22 = v15;
  dispatch_group_notify(v18, v20, block);
}

void __96__SpotlightDaemonServer_handleJob_protectionClass_perClientCompletionHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 length])
  {
    uint64_t v4 = [*(id *)(a1 + 32) excludedBundleIDs];
    char v5 = [v4 containsObject:v3];

    if ((v5 & 1) == 0)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      uint64_t v6 = *(void **)(a1 + 32);
      id v7 = *(void **)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __96__SpotlightDaemonServer_handleJob_protectionClass_perClientCompletionHandler_completionHandler___block_invoke_2;
      v13[3] = &unk_264509948;
      id v14 = v6;
      id v9 = v3;
      id v15 = v9;
      id v17 = *(id *)(a1 + 64);
      id v16 = *(id *)(a1 + 40);
      if (([v7 handleJob:v14 bundleID:v9 protectionClass:v8 completionHandler:v13] & 1) == 0)
      {
        id v10 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          uint64_t v19 = v11;
          __int16 v20 = 2112;
          id v21 = v9;
          _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_DEFAULT, "Performing job:%@ failed for daemon client \"%@\"", buf, 0x16u);
        }

        uint64_t v12 = *(void *)(a1 + 64);
        if (v12) {
          (*(void (**)(uint64_t, id, void, void))(v12 + 16))(v12, v9, 0, 0);
        }
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
      }
    }
  }
}

void __96__SpotlightDaemonServer_handleJob_protectionClass_perClientCompletionHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = logForCSLogCategoryIndex();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v17 = 138412802;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    id v22 = v6;
    uint64_t v11 = "Failed performing job:%@ for daemon client \"%@\": %@";
    uint64_t v12 = v7;
    uint32_t v13 = 32;
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    int v17 = 138412546;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    uint64_t v20 = v15;
    uint64_t v11 = "Done performing job:%@ for daemon client \"%@\"";
    uint64_t v12 = v7;
    uint32_t v13 = 22;
  }
  _os_log_impl(&dword_21F1CE000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
LABEL_7:

  uint64_t v16 = *(void *)(a1 + 56);
  if (v16) {
    (*(void (**)(uint64_t, void, id, id))(v16 + 16))(v16, *(void *)(a1 + 40), v5, v6);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __96__SpotlightDaemonServer_handleJob_protectionClass_perClientCompletionHandler_completionHandler___block_invoke_72(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "Done performing job:%@ with daemon clients", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if ([v14 length])
  {
    if ([v16 length])
    {
      uint64_t v19 = [(SpotlightDaemonServer *)self connectionForBundleID:v14 jobType:6];
      if (v19)
      {
        xpc_object_t v20 = (xpc_object_t)v19;
        xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v21, "command", "pd");
        if (v15) {
          xpc_dictionary_set_string(v21, "pc", (const char *)[v15 UTF8String]);
        }
        xpc_dictionary_set_string(v21, "b", (const char *)[v14 UTF8String]);
        xpc_dictionary_set_string(v21, "id", (const char *)[v16 UTF8String]);
        if ([v17 length]) {
          xpc_dictionary_set_string(v21, "t", (const char *)[v17 UTF8String]);
        }
        if (a7) {
          xpc_dictionary_set_uint64(v21, "po", a7);
        }
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __120__SpotlightDaemonServer_provideDataForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
        v24[3] = &unk_264509660;
        id v25 = v18;
        [v20 sendMessageAsync:v21 completion:v24];

        goto LABEL_13;
      }
    }
  }
  uint64_t v22 = [(id)*MEMORY[0x263F07F70] UTF8String];
  if (v18)
  {
    uint64_t v23 = (const char *)v22;
    xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v20, "status", 4099);
    xpc_dictionary_set_string(v20, "ed", v23);
    (*((void (**)(id, xpc_object_t))v18 + 2))(v18, v20);
LABEL_13:
  }
}

uint64_t __120__SpotlightDaemonServer_provideDataForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if ([v14 length])
  {
    if ([v16 length])
    {
      uint64_t v19 = [(SpotlightDaemonServer *)self connectionForBundleID:v14 jobType:7];
      if (v19)
      {
        xpc_object_t v20 = (xpc_object_t)v19;
        xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v21, "command", "pu");
        if (v15) {
          xpc_dictionary_set_string(v21, "pc", (const char *)[v15 UTF8String]);
        }
        xpc_dictionary_set_string(v21, "b", (const char *)[v14 UTF8String]);
        xpc_dictionary_set_string(v21, "id", (const char *)[v16 UTF8String]);
        if ([v17 length]) {
          xpc_dictionary_set_string(v21, "t", (const char *)[v17 UTF8String]);
        }
        if (a7) {
          xpc_dictionary_set_uint64(v21, "po", a7);
        }
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __123__SpotlightDaemonServer_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
        v24[3] = &unk_264509660;
        id v25 = v18;
        [v20 sendMessageAsync:v21 completion:v24];

        goto LABEL_13;
      }
    }
  }
  uint64_t v22 = [(id)*MEMORY[0x263F07F70] UTF8String];
  if (v18)
  {
    uint64_t v23 = (const char *)v22;
    xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v20, "status", 4099);
    xpc_dictionary_set_string(v20, "ed", v23);
    (*((void (**)(id, xpc_object_t))v18 + 2))(v18, v20);
LABEL_13:
  }
}

uint64_t __123__SpotlightDaemonServer_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)provideFileURLsForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifiers:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if ([v14 length])
  {
    if ([v16 count])
    {
      uint64_t v19 = [(SpotlightDaemonServer *)self connectionForBundleID:v14 jobType:7];
      if (v19)
      {
        xpc_object_t v20 = (xpc_object_t)v19;
        xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v21, "command", "pus");
        if (v15) {
          xpc_dictionary_set_string(v21, "pc", (const char *)[v15 UTF8String]);
        }
        xpc_dictionary_set_string(v21, "b", (const char *)[v14 UTF8String]);
        [MEMORY[0x263F02B30] dictionary:v21 setStringArray:v16 forKey:"idsa"];
        if ([v17 length]) {
          xpc_dictionary_set_string(v21, "t", (const char *)[v17 UTF8String]);
        }
        if (a7) {
          xpc_dictionary_set_uint64(v21, "po", a7);
        }
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __125__SpotlightDaemonServer_provideFileURLsForBundleID_protectionClass_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke;
        v24[3] = &unk_264509660;
        id v25 = v18;
        [v20 sendMessageAsync:v21 completion:v24];

        goto LABEL_13;
      }
    }
  }
  uint64_t v22 = [(id)*MEMORY[0x263F07F70] UTF8String];
  if (v18)
  {
    uint64_t v23 = (const char *)v22;
    xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v20, "status", 4099);
    xpc_dictionary_set_string(v20, "ed", v23);
    (*((void (**)(id, xpc_object_t))v18 + 2))(v18, v20);
LABEL_13:
  }
}

uint64_t __125__SpotlightDaemonServer_provideFileURLsForBundleID_protectionClass_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)notifyUpdatesForItems:(id)a3 bundleID:(id)a4 interestedAttributeMask:(int64_t)a5 acknowledgementHandler:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(void))a6;
  uint32_t v13 = [(SpotlightDaemonServer *)self connectionForBundleID:v11 jobType:17];
  id v14 = logForCSLogCategoryDaemonClient();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  id v16 = logForCSLogCategoryDaemonClient();
  id v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    if (v10)
    {
      uint64_t v18 = [v10 count];
      if (v11)
      {
LABEL_5:
        uint64_t v19 = (const char *)[v11 UTF8String];
LABEL_8:
        *(_DWORD *)buf = 134218498;
        uint64_t v24 = v18;
        __int16 v25 = 2048;
        int64_t v26 = a5;
        __int16 v27 = 2080;
        dispatch_group_t v28 = v19;
        _os_signpost_emit_with_name_impl(&dword_21F1CE000, v17, OS_SIGNPOST_EVENT, v15, "NotifyClient", "count:%ld, mask:0x%lx, bid:%s", buf, 0x20u);
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v18 = 0;
      if (v11) {
        goto LABEL_5;
      }
    }
    uint64_t v19 = "";
    goto LABEL_8;
  }
LABEL_9:

  if (v13)
  {
    xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v20, "command", "siu");
    if ([v10 count]) {
      [MEMORY[0x263F02B30] dictionary:v20 setArray:v10 forKey:"si"];
    }
    if (a5) {
      xpc_dictionary_set_uint64(v20, "iam", a5);
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __103__SpotlightDaemonServer_notifyUpdatesForItems_bundleID_interestedAttributeMask_acknowledgementHandler___block_invoke;
    v21[3] = &unk_264509660;
    uint64_t v22 = v12;
    [v13 sendMessageAsync:v20 completion:v21];
  }
  else if (v12)
  {
    v12[2](v12);
  }
}

uint64_t __103__SpotlightDaemonServer_notifyUpdatesForItems_bundleID_interestedAttributeMask_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateFileProviderBundleIDs:(id)a3
{
  id v3 = a3;
  uint64_t v4 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SpotlightDaemonServer updateFileProviderBundleIDs:]((uint64_t)v3, v4);
  }

  uint64_t v5 = [v3 copy];
  uint64_t v6 = (void *)fileProviderBundleIDs;
  fileProviderBundleIDs = v5;
}

- (void)updateFileProviderBundleIDs:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_DEBUG, "New list of fileProvider bundle IDs: %@", (uint8_t *)&v2, 0xCu);
}

@end