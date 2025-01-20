@interface WFWalletTransactionTrigger(BiomeContext)
+ (uint64_t)registerContextSyncClient;
+ (uint64_t)unregisterContextSyncClient;
- (id)publisherWithScheduler:()BiomeContext;
- (id)remotePublisherWithScheduler:()BiomeContext;
- (id)transactionIdentifierWithEvent:()BiomeContext;
- (uint64_t)hasRemotePublisher;
- (uint64_t)isPassIdentifierValid:()BiomeContext;
- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:;
@end

@implementation WFWalletTransactionTrigger(BiomeContext)

- (uint64_t)isPassIdentifierValid:()BiomeContext
{
  id v4 = a3;
  v5 = [a1 selectedPassUniqueIDs];
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v33 = a4;
  v8 = a5;
  v9 = [v7 eventBody];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_8;
    }
  }

  v10 = [v7 eventBody];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = getWFTriggersLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[WFWalletTransactionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
        _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Found remote event converting to BMWalletTransaction", buf, 0xCu);
      }

      id v12 = objc_alloc(MEMORY[0x1E4F50190]);
      v13 = [v10 passUniqueID];
      v14 = [v10 passLocalizedDescription];
      uint64_t v15 = [v10 transactionType];
      v16 = [v10 transactionID];
      uint64_t v17 = [v10 merchantType];
      v18 = [v10 poiCategory];
      v9 = (void *)[v12 initWithPassUniqueID:v13 passLocalizedDescription:v14 transactionType:v15 transactionID:v16 merchantType:v17 poiCategory:v18];

LABEL_8:
      v19 = getWFTriggersLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v9 passUniqueID];
        int v21 = [v9 transactionType];
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "-[WFWalletTransactionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2112;
        v47 = v20;
        __int16 v48 = 2048;
        uint64_t v49 = v21;
        _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_DEFAULT, "%s Received wallet transaction event %@ for trigger. pass unique id: %@; transactionType: %lu",
          buf,
          0x2Au);
      }
      v22 = [v9 passUniqueID];
      int v23 = [a1 isPassIdentifierValid:v22];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v47) = 1;
      uint64_t v42 = 0;
      v43 = &v42;
      uint64_t v44 = 0x2020000000;
      char v45 = 1;
      if ([v9 transactionType] == 1)
      {
        v24 = [a1 selectedMerchantTypes];
        unint64_t v25 = [v24 count];
        v26 = WFAllWalletTransactionMerchantTypes();
        if (v25 >= [v26 count])
        {
          BOOL v28 = 0;
        }
        else
        {
          v27 = [a1 selectedMerchantTypes];
          BOOL v28 = [v27 count] != 0;
        }
      }
      else
      {
        BOOL v28 = 0;
      }
      if ([v9 transactionType] == 1)
      {
        v30 = [a1 selectedMerchants];
        BOOL v31 = [v30 count] != 0;

        if (v28) {
          goto LABEL_27;
        }
      }
      else
      {
        BOOL v31 = 0;
        if (v28) {
          goto LABEL_27;
        }
      }
      if (!v31)
      {
        BOOL v32 = v23 && *(unsigned char *)(*(void *)&buf[8] + 24) && *((unsigned char *)v43 + 24) != 0;
        v8[2](v8, v32);
        goto LABEL_30;
      }
LABEL_27:
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __101__WFWalletTransactionTrigger_BiomeContext__shouldFireInResponseToEvent_triggerIdentifier_completion___block_invoke;
      v35[3] = &unk_1E65402F8;
      char v39 = v23;
      BOOL v40 = v28;
      v36 = v8;
      v37 = buf;
      v35[4] = a1;
      BOOL v41 = v31;
      v38 = &v42;
      [a1 eventInfoForEvent:v7 completion:v35];

LABEL_30:
      _Block_object_dispose(&v42, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_31;
    }
  }

  v29 = getWFTriggersLogObject();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[WFWalletTransactionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
    _os_log_impl(&dword_1C7D7E000, v29, OS_LOG_TYPE_DEFAULT, "%s No wallet transaction event received for trigger; not firing.",
      buf,
      0xCu);
  }

  v8[2](v8, 0);
LABEL_31:
}

- (id)transactionIdentifierWithEvent:()BiomeContext
{
  id v3 = a3;
  id v4 = [v3 eventBody];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  id v7 = NSNumber;
  [v3 timestamp];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v9 = [v8 stringValue];

  if (v6)
  {
    v10 = [v6 transactionID];
  }
  else
  {
    v11 = [v3 eventBody];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
    id v13 = v12;

    v10 = [v13 transactionID];
  }
  if (v10) {
    v14 = v10;
  }
  else {
    v14 = v9;
  }
  id v15 = v14;

  return v15;
}

- (id)remotePublisherWithScheduler:()BiomeContext
{
  id v3 = a3;
  if ([(id)objc_opt_class() registerContextSyncClient])
  {
    id v4 = BiomeLibrary();
    v5 = [v4 ContextSync];
    id v6 = [v5 WalletTransaction];
    id v7 = [v6 DSLPublisher];

    if (v7)
    {
      v8 = [v7 subscribeOn:v3];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)hasRemotePublisher
{
  return 1;
}

- (id)publisherWithScheduler:()BiomeContext
{
  id v3 = a3;
  id v4 = BiomeLibrary();
  v5 = [v4 Wallet];
  id v6 = [v5 Transaction];

  id v7 = [v6 DSLPublisher];
  v8 = [v7 subscribeOn:v3];

  return v8;
}

+ (uint64_t)unregisterContextSyncClient
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v0 = BiomeLibrary();
  v1 = [v0 Wallet];
  v2 = [v1 Transaction];

  id v3 = [v2 DSLPublisher];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F5AC60]) initWithClientName:@"com.apple.shortcuts"];
  id v14 = 0;
  uint64_t v5 = [v4 unregisterForUpdates:v3 withIdentifier:@"com.apple.shortcuts" forDeviceTypes:4 withError:&v14];
  id v6 = v14;
  id v7 = getWFTriggersLogObject();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "+[WFWalletTransactionTrigger(BiomeContext) unregisterContextSyncClient]";
      v9 = "%s Successfully unregistered from context sync client";
      v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1C7D7E000, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "+[WFWalletTransactionTrigger(BiomeContext) unregisterContextSyncClient]";
    __int16 v17 = 2112;
    id v18 = v6;
    v9 = "%s Failed to unregister client with error: %@";
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }

  return v5;
}

+ (uint64_t)registerContextSyncClient
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v0 = BiomeLibrary();
  v1 = [v0 Wallet];
  v2 = [v1 Transaction];

  id v3 = [v2 DSLPublisher];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F5AC60]) initWithClientName:@"com.apple.shortcuts"];
  id v14 = 0;
  uint64_t v5 = [v4 registerForUpdates:v3 withIdentifier:@"com.apple.shortcuts" shouldWake:1 forDeviceTypes:4 withError:&v14];
  id v6 = v14;
  id v7 = getWFTriggersLogObject();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "+[WFWalletTransactionTrigger(BiomeContext) registerContextSyncClient]";
      v9 = "%s Successfully registered for updates with context sync client";
      v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1C7D7E000, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "+[WFWalletTransactionTrigger(BiomeContext) registerContextSyncClient]";
    __int16 v17 = 2112;
    id v18 = v6;
    v9 = "%s Failed register for updates from context sync client with error: %@";
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }

  return v5;
}

@end