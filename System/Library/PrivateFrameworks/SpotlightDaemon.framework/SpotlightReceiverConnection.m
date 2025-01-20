@interface SpotlightReceiverConnection
+ (void)setup;
- (BOOL)_wantsBundleID:(id)a3;
- (BOOL)_wantsContentType:(id)a3;
- (BOOL)canRun;
- (BOOL)disabled;
- (BOOL)setupComplete;
- (BOOL)setupStarted;
- (BOOL)skipFileProviderItems;
- (BOOL)unresponsive;
- (BOOL)wantsHTML;
- (BOOL)wantsText;
- (NSArray)contentTypes;
- (NSSet)INIntentClassNames;
- (NSSet)bundleIDs;
- (OS_dispatch_queue)senderQueue;
- (OS_dispatch_semaphore)setupSemaphore;
- (SpotlightReceiverConnection)initWithServiceName:(id)a3 clientID:(int64_t)a4 wantsText:(BOOL)a5 wantsHTML:(BOOL)a6;
- (double)minDate;
- (int)supportedJobs;
- (unsigned)requestCount;
- (void)addInteraction:(id)a3 intentClassName:(id)a4 bundleID:(id)a5 protectionClass:(id)a6;
- (void)addUserActions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4;
- (void)deleteAllUserActivities:(id)a3;
- (void)deleteFromBundle:(id)a3;
- (void)deleteFromBundle:(id)a3 contentType:(id)a4 identifiers:(id)a5;
- (void)deleteFromBundle:(id)a3 domainIdentifiers:(id)a4;
- (void)deleteFromBundle:(id)a3 encodedIdentifiers:(id)a4;
- (void)deleteFromBundle:(id)a3 sinceDate:(id)a4;
- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4 retainedData:(id)a5;
- (void)dictionary:(id)a3 setDecoderData:(id)a4 forKey:(const char *)a5 sizeKey:(const char *)a6;
- (void)disableReceiver;
- (void)donateRelevantActions:(id)a3 bundleID:(id)a4;
- (void)enableReceiver;
- (void)handleError:(id)a3;
- (void)indexFromBundle:(id)a3 protectionClass:(id)a4 items:(id)a5 itemsContent:(id)a6;
- (void)invalidationHandler;
- (void)purgeFromBundle:(id)a3 identifiers:(id)a4;
- (void)receiverRequestComplete;
- (void)receiverRequestStart;
- (void)runOnSenderQueue:(id)a3;
- (void)setMinDate:(double)a3;
- (void)setSetupComplete:(BOOL)a3;
- (void)setSetupSemaphore:(id)a3;
- (void)setSetupStarted:(BOOL)a3;
- (void)setSkipFileProviderItems:(BOOL)a3;
- (void)setWantsHTML:(BOOL)a3;
- (void)setWantsText:(BOOL)a3;
- (void)setupComplete:(BOOL)a3;
- (void)startSetup;
@end

@implementation SpotlightReceiverConnection

uint64_t __66__SpotlightReceiverConnection_deleteFromBundle_domainIdentifiers___block_invoke_107(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

uint64_t __48__SpotlightReceiverConnection_runOnSenderQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addInteraction:(id)a3 intentClassName:(id)a4 bundleID:(id)a5 protectionClass:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((self->_supportedJobs & 0x80) != 0)
  {
    BOOL v14 = [(SpotlightReceiverConnection *)self unresponsive];
    if (v11)
    {
      if (!v14
        && (![(NSSet *)self->_INIntentClassNames count]
         || [(NSSet *)self->_INIntentClassNames containsObject:v11]))
      {
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __87__SpotlightReceiverConnection_addInteraction_intentClassName_bundleID_protectionClass___block_invoke;
        v15[3] = &unk_264506598;
        id v16 = v10;
        id v17 = v11;
        id v18 = v12;
        id v19 = v13;
        v20 = self;
        [(SpotlightReceiverConnection *)self runOnSenderQueue:v15];
      }
    }
  }
}

- (void)indexFromBundle:(id)a3 protectionClass:(id)a4 items:(id)a5 itemsContent:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12
    && (self->_supportedJobs & 1) != 0
    && [(SpotlightReceiverConnection *)self _wantsBundleID:v10]
    && ![(SpotlightReceiverConnection *)self unresponsive])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __82__SpotlightReceiverConnection_indexFromBundle_protectionClass_items_itemsContent___block_invoke;
    v14[3] = &unk_264506598;
    v14[4] = self;
    id v15 = v12;
    id v16 = v10;
    id v17 = v11;
    id v18 = v13;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v14];
  }
}

- (BOOL)disabled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_disabled);
  return v2 & 1;
}

- (BOOL)canRun
{
  if (self->_setupComplete) {
    goto LABEL_2;
  }
  [(SpotlightReceiverConnection *)self startSetup];
  v5 = [(SpotlightReceiverConnection *)self setupSemaphore];
  if (v5)
  {
    unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_disabled);
    if ((v6 & 1) == 0)
    {
      if (sReceiverSetupTimeout) {
        dispatch_time_t v7 = -1;
      }
      else {
        dispatch_time_t v7 = dispatch_time(0, 10000000000);
      }
      dispatch_semaphore_wait(v5, v7);
      if (self->_setupComplete)
      {

LABEL_2:
        unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_disabled);
        return (v3 & 1) == 0;
      }
      senderQueue = self->_senderQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __37__SpotlightReceiverConnection_canRun__block_invoke;
      block[3] = &unk_2645063F8;
      block[4] = self;
      dispatch_async(senderQueue, block);
    }
  }

  return 0;
}

- (void)deleteFromBundle:(id)a3 domainIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count]
    && (self->_supportedJobs & 4) != 0
    && [(SpotlightReceiverConnection *)self _wantsBundleID:v6]
    && ![(SpotlightReceiverConnection *)self unresponsive])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__SpotlightReceiverConnection_deleteFromBundle_domainIdentifiers___block_invoke;
    v8[3] = &unk_2645064D0;
    id v9 = v7;
    id v10 = v6;
    id v11 = self;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v8];
  }
}

- (BOOL)_wantsBundleID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    bundleIDs = self->_bundleIDs;
    if (bundleIDs) {
      char v6 = [(NSSet *)bundleIDs containsObject:v4];
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)unresponsive
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_disabled);
  if (v2) {
    return 1;
  }
  BOOL result = 0;
  unsigned int v5 = atomic_load(&self->_requestCount);
  if (sReceiverRequestMax) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = 32;
  }
  if (v5 && (sReceiverRequestMax & 1) == 0 && v5 > v6)
  {
    [(SpotlightReceiverConnection *)self disableReceiver];
    return 1;
  }
  return result;
}

- (void)runOnSenderQueue:(id)a3
{
  id v4 = a3;
  senderQueue = self->_senderQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SpotlightReceiverConnection_runOnSenderQueue___block_invoke;
  block[3] = &unk_264506548;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(senderQueue, v7);
}

- (void)receiverRequestComplete
{
  unsigned int add = atomic_fetch_add((atomic_uint *volatile)&self->_requestCount, 0xFFFFFFFF);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_disabled);
  if (v3)
  {
    if (sReceiverRequestMax) {
      unsigned int v4 = 0;
    }
    else {
      unsigned int v4 = 16;
    }
    if (add <= v4) {
      [(SpotlightReceiverConnection *)self enableReceiver];
    }
  }
}

void __82__SpotlightReceiverConnection_indexFromBundle_protectionClass_items_itemsContent___block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = (id *)(a1 + 32);
  if ([*(id *)(*(void *)(a1 + 32) + 96) count])
  {
    unsigned __int8 v3 = *(void **)(a1 + 40);
    BOOL v4 = *(double *)(*(void *)(a1 + 32) + 120) == 0.0;
    if (v3)
    {
      [v3 obj];
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
    }
    unsigned int Count = _MDPlistArrayGetCount();
    if (Count)
    {
      unsigned int v10 = Count;
      unsigned int v11 = 1;
      unint64_t v12 = 0x267EC6000uLL;
      while (1)
      {
        long long v27 = 0uLL;
        uint64_t v28 = 0;
        id v13 = *(void **)(a1 + 40);
        if (v13)
        {
          [v13 obj];
        }
        else
        {
          uint64_t v24 = 0;
          uint64_t v25 = 0;
          uint64_t v26 = 0;
        }
        _MDPlistArrayGetPlistObjectAtIndex();
        long long v22 = v27;
        uint64_t v23 = v28;
        if (_MDPlistGetPlistObjectType() != 240) {
          goto LABEL_27;
        }
        long long v22 = v27;
        uint64_t v23 = v28;
        if (_MDPlistArrayGetCount() < 3) {
          goto LABEL_27;
        }
        long long v22 = 0uLL;
        uint64_t v23 = 0;
        _MDPlistArrayGetPlistObjectAtIndex();
        long long v20 = 0uLL;
        uint64_t v21 = 0;
        if (_MDPlistGetPlistObjectType() != 241) {
          goto LABEL_27;
        }
        long long v20 = 0uLL;
        uint64_t v21 = 0;
        if (*((unsigned char *)*v2 + *(int *)(v12 + 1540)))
        {
          long long v18 = v22;
          uint64_t v19 = v23;
          if (_MDPlistDictionaryGetPlistObjectForKey()) {
            return;
          }
        }
        long long v18 = v22;
        uint64_t v19 = v23;
        if (_MDPlistDictionaryGetPlistObjectForKey())
        {
          unint64_t v14 = v12;
          long long v18 = v20;
          uint64_t v19 = v21;
          id v15 = (void *)_MDPlistContainerCopyObject();
          int v5 = [*v2 _wantsContentType:v15];
          if (!v4 && (v5 & 1) != 0)
          {
            long long v18 = v22;
            uint64_t v19 = v23;
            if (_MDPlistDictionaryGetPlistObjectForKey())
            {
              long long v18 = v20;
              uint64_t v19 = v21;
              _MDPlistDateGetValue();
              BOOL v4 = v16 >= *((double *)*v2 + 15);
              int v5 = v4;
            }
            else
            {
              BOOL v4 = 1;
              int v5 = 1;
            }
          }

          unint64_t v12 = v14;
        }
        else
        {
LABEL_27:
          int v5 = 0;
        }
        if (v11 < v10)
        {
          ++v11;
          if (!v5) {
            continue;
          }
        }
        goto LABEL_5;
      }
    }
  }
  else
  {
    BOOL v4 = 1;
    int v5 = 1;
LABEL_5:
    if (v5 && v4)
    {
      id v6 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __82__SpotlightReceiverConnection_indexFromBundle_protectionClass_items_itemsContent___block_invoke_cold_1(a1, v2);
      }

      xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v7, "command", "j");
      xpc_dictionary_set_uint64(v7, "jt", 1uLL);
      xpc_dictionary_set_string(v7, "b", (const char *)[*(id *)(a1 + 48) UTF8String]);
      if ([*(id *)(a1 + 56) length]) {
        xpc_dictionary_set_string(v7, "pc", (const char *)[*(id *)(a1 + 56) UTF8String]);
      }
      [*(id *)(a1 + 32) dictionary:v7 setDecoderData:*(void *)(a1 + 40) forKey:"i" sizeKey:"i-size"];
      [*(id *)(a1 + 32) dictionary:v7 setDecoderData:*(void *)(a1 + 64) forKey:"c" sizeKey:"c-size"];
      [*(id *)(a1 + 32) receiverRequestStart];
      v8 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __82__SpotlightReceiverConnection_indexFromBundle_protectionClass_items_itemsContent___block_invoke_101;
      v17[3] = &unk_264506570;
      v17[4] = v8;
      [v8 sendMessageAsync:v7 completion:v17];
    }
  }
}

- (BOOL)_wantsContentType:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v4 = (__CFString *)a3;
  if (v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([(NSMutableSet *)self->_positiveSet containsObject:v4] & 1) == 0)
  {
    if (([(NSMutableSet *)self->_negativeSet containsObject:v4] & 1) == 0)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      int v5 = self->_contentTypes;
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            if (UTTypeConformsTo(v4, *(CFStringRef *)(*((void *)&v12 + 1) + 8 * i)))
            {
              -[NSMutableSet addObject:](self->_positiveSet, "addObject:", v4, (void)v12);

              goto LABEL_16;
            }
          }
          uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }

      -[NSMutableSet addObject:](self->_negativeSet, "addObject:", v4, (void)v12);
    }
    BOOL v10 = 0;
  }
  else
  {
LABEL_16:
    BOOL v10 = 1;
  }

  return v10;
}

- (void)dictionary:(id)a3 setDecoderData:(id)a4 forKey:(const char *)a5 sizeKey:(const char *)a6
{
  xpc_object_t xdict = a3;
  id v9 = a4;
  BOOL v10 = [v9 backingStore];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v11 = [v10 xpcData];
  if (!v11) {
    goto LABEL_5;
  }
  long long v12 = (void *)v11;
  if (MEMORY[0x223C48A20]() != MEMORY[0x263EF86F8])
  {

LABEL_5:
    id v13 = [v9 data];
    uint64_t v14 = [v13 bytes];
    if (v14)
    {
      long long v15 = (const void *)v14;
      size_t v16 = [v13 length];
      if (v16) {
        xpc_dictionary_set_data(xdict, a5, v15, v16);
      }
    }

    long long v12 = 0;
    goto LABEL_9;
  }
  uint64_t v17 = [v10 dataSize];
  xpc_dictionary_set_value(xdict, a5, v12);
  if (v17) {
    xpc_dictionary_set_uint64(xdict, a6, v17);
  }
LABEL_9:
}

void __87__SpotlightReceiverConnection_addInteraction_intentClassName_bundleID_protectionClass___block_invoke(id *a1)
{
  unsigned __int8 v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __87__SpotlightReceiverConnection_addInteraction_intentClassName_bundleID_protectionClass___block_invoke_cold_1((uint64_t)a1, v2);
  }

  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 0x80uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)[a1[6] UTF8String]);
  if ([a1[7] length]) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[a1[7] UTF8String]);
  }
  xpc_dictionary_set_string(v3, "icl", (const char *)[a1[5] UTF8String]);
  xpc_dictionary_set_data(v3, "ins", (const void *)[a1[4] bytes], objc_msgSend(a1[4], "length"));
  [a1[8] receiverRequestStart];
  id v4 = a1[8];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__SpotlightReceiverConnection_addInteraction_intentClassName_bundleID_protectionClass___block_invoke_119;
  v5[3] = &unk_264506570;
  v5[4] = v4;
  [v4 sendMessageAsync:v3 completion:v5];
}

void __66__SpotlightReceiverConnection_deleteFromBundle_domainIdentifiers___block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __66__SpotlightReceiverConnection_deleteFromBundle_domainIdentifiers___block_invoke_cold_1();
  }

  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 4uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)[*(id *)(a1 + 40) UTF8String]);
  id v4 = objc_alloc_init(MEMORY[0x263F02A30]);
  [v4 encodeObject:*(void *)(a1 + 32)];
  objc_msgSend(MEMORY[0x263F02B30], "dictionary:setPlistContainer:forKey:sizeKey:", v3, objc_msgSend(v4, "plistContainer"), "ids", "ids-size");
  [*(id *)(a1 + 48) receiverRequestStart];
  int v5 = *(void **)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__SpotlightReceiverConnection_deleteFromBundle_domainIdentifiers___block_invoke_107;
  v6[3] = &unk_264506570;
  v6[4] = v5;
  [v5 sendMessageAsync:v3 completion:v6];
}

- (void)receiverRequestStart
{
}

uint64_t __82__SpotlightReceiverConnection_indexFromBundle_protectionClass_items_itemsContent___block_invoke_101(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

+ (void)setup
{
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_3);
  }
}

void __36__SpotlightReceiverConnection_setup__block_invoke()
{
  v0 = objc_alloc_init(SpotlightSenderState);
  v1 = (void *)sSpotlightSenderState;
  sSpotlightSenderState = (uint64_t)v0;

  unsigned __int8 v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  if ([v2 BOOLForKey:@"CSDisableReceiverLimit"])
  {
    xpc_object_t v3 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "### RECEIVER LIMITS DISABLED with CSDisableReceiverLimit preference ### ", v14, 2u);
    }

    sReceiverRequestMax = 1;
    sReceiverSetupTimeout = 1;
  }
  if (([v2 BOOLForKey:@"CSDisableBackgroundHarvestingForCoreDuet"] & 1) == 0)
  {
    id v4 = [[SpotlightReceiverConnection alloc] initWithServiceName:@"com.apple.corespotlight.receiver.coreduet" clientID:1 wantsText:0 wantsHTML:0];
    int v5 = (void *)sCoreDuetConnection;
    sCoreDuetConnection = (uint64_t)v4;

    [(id)sCoreDuetConnection setSkipFileProviderItems:1];
    [(id)sCoreDuetConnection setMinDate:CFAbsoluteTimeGetCurrent() + -4838400.0];
  }
  if (([v2 BOOLForKey:@"CSDisableBackgroundHarvestingForIntelligentSuggestions"] & 1) == 0)
  {
    uint64_t v6 = [[SpotlightReceiverConnection alloc] initWithServiceName:@"com.apple.corespotlight.receiver.suggestions" clientID:2 wantsText:1 wantsHTML:1];
    uint64_t v7 = (void *)sSuggestionsConnection;
    sSuggestionsConnection = (uint64_t)v6;
  }
  if (([v2 BOOLForKey:@"CSDisableBackgroundHarvestingForAssets"] & 1) == 0)
  {
    uint64_t v8 = [[SpotlightReceiverConnection alloc] initWithServiceName:@"com.apple.corespotlight.receiver.photos" clientID:4 wantsText:0 wantsHTML:0];
    id v9 = (void *)sAssetsConnection;
    sAssetsConnection = (uint64_t)v8;
  }
  if (([v2 BOOLForKey:@"CSDisableBackgroundHarvestingForImages"] & 1) == 0)
  {
    BOOL v10 = [[SpotlightReceiverConnection alloc] initWithServiceName:@"com.apple.corespotlight.receiver.images" clientID:3 wantsText:0 wantsHTML:0];
    uint64_t v11 = (void *)sImagesConnection;
    sImagesConnection = (uint64_t)v10;
  }
  if (([v2 BOOLForKey:@"CSDisableBackgroundHarvestingForTest"] & 1) == 0)
  {
    long long v12 = [[SpotlightReceiverConnection alloc] initWithServiceName:@"com.apple.corespotlight.receiver.corespotlight" clientID:0 wantsText:1 wantsHTML:1];
    id v13 = (void *)sCoreSpotlightConnection;
    sCoreSpotlightConnection = (uint64_t)v12;
  }
}

- (void)invalidationHandler
{
  v1 = [a1 serviceName];
  OUTLINED_FUNCTION_3_0(&dword_21F1CE000, v2, v3, "##### connection invalidated \"%@\"", v4, v5, v6, v7, 2u);
}

uint64_t __50__SpotlightReceiverConnection_invalidationHandler__block_invoke(uint64_t result)
{
  return result;
}

- (void)setupComplete:(BOOL)a3
{
  if (!a3) {
    [(SpotlightReceiverConnection *)self disableReceiver];
  }
  self->_setupComplete = a3;
  uint64_t v5 = [(SpotlightReceiverConnection *)self setupSemaphore];
  if (v5)
  {
    uint64_t v6 = v5;
    dispatch_semaphore_signal(v5);
    [(SpotlightReceiverConnection *)self setSetupSemaphore:0];
    uint64_t v5 = v6;
  }
}

- (void)handleError:(id)a3
{
  string = xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x263EF86B0]);
  uint64_t v6 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    [(SpotlightReceiverConnection *)(uint64_t)string handleError:v6];
  }

  if (a3 == (id)MEMORY[0x263EF86A8] && MEMORY[0x263EF86A0] != MEMORY[0x263EF86A8]) {
    [(SpotlightReceiverConnection *)self setupComplete:0];
  }
}

- (void)startSetup
{
  if (!self->_setupStarted)
  {
    senderQueue = self->_senderQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__SpotlightReceiverConnection_startSetup__block_invoke;
    block[3] = &unk_2645063F8;
    void block[4] = self;
    dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
    dispatch_async(senderQueue, v3);
  }
}

void __41__SpotlightReceiverConnection_startSetup__block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 75))
  {
    *(unsigned char *)(v1 + 75) = 1;
    id v3 = objc_alloc(NSURL);
    uint64_t v4 = NSString;
    uint64_t v5 = NSHomeDirectory();
    uint64_t v6 = [*(id *)(a1 + 32) serviceName];
    uint64_t v7 = [v4 stringWithFormat:@"%@/%s/%@.plist", v5, "Library/Spotlight/CoreSpotlight", v6];
    uint64_t v8 = (void *)[v3 initFileURLWithPath:v7];

    if (v8)
    {
      id v9 = [NSDictionary dictionaryWithContentsOfURL:v8 error:0];
    }
    else
    {
      id v9 = 0;
    }
    BOOL v10 = getSystemVersionString();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v9 objectForKeyedSubscript:@"rcv"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 integerValue] == 1)
      {
        long long v12 = [v9 objectForKeyedSubscript:@"sv"];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v10 isEqualToString:v12])
        {

          id v13 = [v9 objectForKeyedSubscript:@"jt"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v14 = [v13 integerValue];

            if (!v14) {
              goto LABEL_15;
            }
          }
          else
          {

            int v14 = 0;
          }
          long long v15 = [v9 objectForKeyedSubscript:@"bids"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 count])
          {
            int v43 = v14;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            id v20 = v15;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v61 objects:v71 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v62;
              while (2)
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v62 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

                    goto LABEL_15;
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v61 objects:v71 count:16];
                if (v22) {
                  continue;
                }
                break;
              }
            }

            int v14 = v43;
          }
          size_t v16 = [v9 objectForKeyedSubscript:@"cts"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v16 count])
          {
            int v44 = v14;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            obuint64_t j = v16;
            uint64_t v25 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v58;
              while (2)
              {
                for (uint64_t j = 0; j != v26; ++j)
                {
                  if (*(void *)v58 != v27) {
                    objc_enumerationMutation(obj);
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

                    goto LABEL_16;
                  }
                }
                uint64_t v26 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
                if (v26) {
                  continue;
                }
                break;
              }
            }

            int v14 = v44;
          }
          long long v18 = [v9 objectForKeyedSubscript:@"icls"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 count])
          {
            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            id v45 = v18;
            uint64_t v29 = [v45 countByEnumeratingWithState:&v53 objects:v69 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              id obja = *(id *)v54;
              while (2)
              {
                for (uint64_t k = 0; k != v30; ++k)
                {
                  if (*(id *)v54 != obja) {
                    objc_enumerationMutation(v45);
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

                    goto LABEL_17;
                  }
                }
                uint64_t v30 = [v45 countByEnumeratingWithState:&v53 objects:v69 count:16];
                if (v30) {
                  continue;
                }
                break;
              }
            }
          }
          *(_DWORD *)(*(void *)(a1 + 32) + 80) = v14;
          uint64_t v32 = [v15 copy];
          uint64_t v33 = *(void *)(a1 + 32);
          v34 = *(void **)(v33 + 88);
          *(void *)(v33 + 88) = v32;

          uint64_t v35 = [v16 copy];
          uint64_t v36 = *(void *)(a1 + 32);
          v37 = *(void **)(v36 + 96);
          *(void *)(v36 + 96) = v35;

          uint64_t v38 = [v18 copy];
          uint64_t v39 = *(void *)(a1 + 32);
          v40 = *(void **)(v39 + 104);
          *(void *)(v39 + 104) = v38;

          v41 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v42 = [*(id *)(a1 + 32) serviceName];
            *(_DWORD *)buf = 138412546;
            v66 = v42;
            __int16 v67 = 2112;
            v68 = v9;
            _os_log_impl(&dword_21F1CE000, v41, OS_LOG_TYPE_INFO, "### RECEIVER %@ setup from cache %@", buf, 0x16u);
          }
          [*(id *)(a1 + 32) enableReceiver];
          [*(id *)(a1 + 32) setupComplete:1];
          goto LABEL_18;
        }
      }
    }
LABEL_15:
    long long v15 = 0;
LABEL_16:
    size_t v16 = 0;
LABEL_17:
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    long long v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v18, "command", "s");
    uint64_t v19 = *(void **)(a1 + 32);
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __41__SpotlightReceiverConnection_startSetup__block_invoke_76;
    v48[3] = &unk_264506520;
    v48[4] = v19;
    CFAbsoluteTime v52 = Current;
    id v49 = v8;
    id v50 = v10;
    id v51 = v9;
    [v19 sendMessageAsync:v18 completion:v48];

LABEL_18:
  }
}

void __41__SpotlightReceiverConnection_startSetup__block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
    string = 0;
    uint64_t v6 = -1;
    goto LABEL_5;
  }
  int64_t int64 = xpc_dictionary_get_int64(v3, "status");
  if (int64)
  {
    uint64_t v6 = int64;
    string = xpc_dictionary_get_string(v4, "ed");
LABEL_5:
    uint64_t v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v46 = [*(id *)(a1 + 32) serviceName];
      *(_DWORD *)buf = 138412802;
      id v49 = v46;
      __int16 v50 = 2048;
      *(void *)id v51 = v6;
      *(_WORD *)&v51[8] = 2080;
      *(void *)&v51[10] = string;
      _os_log_error_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_ERROR, "### RECEIVER %@ setup error %ld domain %s", buf, 0x20u);
    }
    uint64_t v9 = 0;
    BOOL v10 = (id *)(a1 + 32);
    goto LABEL_29;
  }
  BOOL v10 = (id *)(a1 + 32);
  *(_DWORD *)(*(void *)(a1 + 32) + 80) = xpc_dictionary_get_uint64(v4, "jt");
  uint64_t v11 = (void *)MEMORY[0x263F02B30];
  long long v12 = xpc_dictionary_get_array(v4, "bids");
  uint64_t v13 = [v11 copyNSStringSetFromXPCArray:v12];
  int v14 = *(void **)(*(void *)(a1 + 32) + 88);
  *((void *)*v10 + 11) = v13;

  long long v15 = (void *)MEMORY[0x263F02B30];
  size_t v16 = xpc_dictionary_get_array(v4, "cts");
  uint64_t v17 = [v15 copyNSStringArrayFromXPCArray:v16];
  long long v18 = *(void **)(*(void *)(a1 + 32) + 96);
  *((void *)*v10 + 12) = v17;

  if ((*(_WORD *)(*(void *)(a1 + 32) + 80) & 0x780) != 0)
  {
    uint64_t v19 = (void *)MEMORY[0x263F02B30];
    id v20 = xpc_dictionary_get_array(v4, "icls");
    uint64_t v21 = [v19 copyNSStringSetFromXPCArray:v20];
    uint64_t v22 = (void *)*((void *)*v10 + 13);
    *((void *)*v10 + 13) = v21;
  }
  uint64_t v23 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = [*v10 serviceName];
    int v25 = *((_DWORD *)*v10 + 20);
    uint64_t v26 = *((void *)*v10 + 11);
    uint64_t v27 = *((void *)*v10 + 12);
    uint64_t v28 = *((void *)*v10 + 13);
    *(_DWORD *)buf = 138413314;
    id v49 = v24;
    __int16 v50 = 1024;
    *(_DWORD *)id v51 = v25;
    *(_WORD *)&v51[4] = 2112;
    *(void *)&v51[6] = v26;
    *(_WORD *)&v51[14] = 2112;
    *(void *)&v51[16] = v27;
    __int16 v52 = 2112;
    uint64_t v53 = v28;
    _os_log_impl(&dword_21F1CE000, v23, OS_LOG_TYPE_INFO, "client: %@, supportedJobTypes: 0x%x bundleIDs: %@, contentTypes: %@, INIntentClassNames:  %@", buf, 0x30u);
  }
  uint64_t v29 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = [*(id *)(a1 + 32) serviceName];
    CFAbsoluteTime v31 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
    *(_DWORD *)buf = 138412546;
    id v49 = v30;
    __int16 v50 = 2048;
    *(CFAbsoluteTime *)id v51 = v31;
    _os_log_impl(&dword_21F1CE000, v29, OS_LOG_TYPE_INFO, "### RECEIVER %@ setup time %f ####", buf, 0x16u);
  }
  if (*(void *)(a1 + 40) && *(void *)(a1 + 48))
  {
    uint64_t v32 = objc_opt_new();
    [v32 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"sv"];
    [v32 setObject:&unk_26D0C8F20 forKeyedSubscript:@"rcv"];
    uint64_t v33 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1 + 32) + 80)];
    [v32 setObject:v33 forKeyedSubscript:@"jt"];

    v34 = *(void **)(a1 + 32);
    uint64_t v35 = (void *)v34[11];
    if (v35)
    {
      uint64_t v36 = [v35 allObjects];
      [v32 setObject:v36 forKeyedSubscript:@"bids"];

      v34 = *v10;
    }
    uint64_t v37 = v34[12];
    if (v37)
    {
      [v32 setObject:v37 forKeyedSubscript:@"cts"];
      v34 = *v10;
    }
    uint64_t v38 = v34[13];
    if (v38) {
      [v32 setObject:v38 forKeyedSubscript:@"icls"];
    }
    uint64_t v39 = *(void *)(a1 + 40);
    id v47 = 0;
    char v40 = [v32 writeToURL:v39 error:&v47];
    id v41 = v47;
    v42 = logForCSLogCategoryDefault();
    int v43 = v42;
    if (v40)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        int v44 = [*(id *)(a1 + 32) serviceName];
        uint64_t v45 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        id v49 = v44;
        __int16 v50 = 2112;
        *(void *)id v51 = v45;
        _os_log_impl(&dword_21F1CE000, v43, OS_LOG_TYPE_INFO, "### RECEIVER %@ write %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      __41__SpotlightReceiverConnection_startSetup__block_invoke_76_cold_1((uint64_t *)(a1 + 40), (uint64_t)v41, v43);
    }
  }
  [*v10 enableReceiver];
  uint64_t v9 = 1;
LABEL_29:
  [*v10 setupComplete:v9];
}

- (SpotlightReceiverConnection)initWithServiceName:(id)a3 clientID:(int64_t)a4 wantsText:(BOOL)a5 wantsHTML:(BOOL)a6
{
  id v9 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SpotlightReceiverConnection;
  BOOL v10 = [(CSXPCConnection *)&v20 initWithMachServiceName:v9];
  if (v10)
  {
    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v9 UTF8String], v12);
    senderQueue = v10->_senderQueue;
    v10->_senderQueue = (OS_dispatch_queue *)v13;

    long long v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    positiveSet = v10->_positiveSet;
    v10->_positiveSet = v15;

    uint64_t v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    negativeSet = v10->_negativeSet;
    v10->_negativeSet = v17;

    v10->_wantsText = a5;
    v10->_wantsHTML = a6;
    [(SpotlightReceiverConnection *)v10 startSetup];
  }
  return v10;
}

- (void)disableReceiver
{
  uint64_t v1 = [a1 serviceName];
  OUTLINED_FUNCTION_3_0(&dword_21F1CE000, v2, v3, "### DISABLING UNRESPONSIVE RECEIVER %@ ####", v4, v5, v6, v7, 2u);
}

- (void)enableReceiver
{
  uint64_t v1 = [a1 serviceName];
  OUTLINED_FUNCTION_3_0(&dword_21F1CE000, v2, v3, "### RESUMING UNRESPONSIVE RECEIVER %@ ####", v4, v5, v6, v7, 2u);
}

unsigned char *__37__SpotlightReceiverConnection_canRun__block_invoke(uint64_t a1)
{
  BOOL result = *(unsigned char **)(a1 + 32);
  if (!result[76]) {
    return (unsigned char *)[result disableReceiver];
  }
  return result;
}

- (void)deleteFromBundle:(id)a3 encodedIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && (self->_supportedJobs & 2) != 0
    && [(SpotlightReceiverConnection *)self _wantsBundleID:v6]
    && ![(SpotlightReceiverConnection *)self unresponsive])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __67__SpotlightReceiverConnection_deleteFromBundle_encodedIdentifiers___block_invoke;
    v8[3] = &unk_2645064D0;
    id v9 = v6;
    BOOL v10 = self;
    id v11 = v7;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v8];
  }
}

void __67__SpotlightReceiverConnection_deleteFromBundle_encodedIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __67__SpotlightReceiverConnection_deleteFromBundle_encodedIdentifiers___block_invoke_cold_1(a1);
  }

  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 2uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)[*(id *)(a1 + 32) UTF8String]);
  [*(id *)(a1 + 40) dictionary:v3 setDecoderData:*(void *)(a1 + 48) forKey:"ids" sizeKey:"ids-size"];
  [*(id *)(a1 + 40) receiverRequestStart];
  uint64_t v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__SpotlightReceiverConnection_deleteFromBundle_encodedIdentifiers___block_invoke_104;
  v5[3] = &unk_264506570;
  v5[4] = v4;
  [v4 sendMessageAsync:v3 completion:v5];
}

uint64_t __67__SpotlightReceiverConnection_deleteFromBundle_encodedIdentifiers___block_invoke_104(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

- (void)deleteFromBundle:(id)a3 contentType:(id)a4 identifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 count]
    && (self->_supportedJobs & 2) != 0
    && [(SpotlightReceiverConnection *)self _wantsBundleID:v8]
    && [(SpotlightReceiverConnection *)self _wantsContentType:v9]
    && ![(SpotlightReceiverConnection *)self unresponsive])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __72__SpotlightReceiverConnection_deleteFromBundle_contentType_identifiers___block_invoke;
    v11[3] = &unk_2645065C0;
    id v12 = v10;
    id v13 = v8;
    id v14 = v9;
    long long v15 = self;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v11];
  }
}

void __72__SpotlightReceiverConnection_deleteFromBundle_contentType_identifiers___block_invoke(uint64_t a1)
{
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __72__SpotlightReceiverConnection_deleteFromBundle_contentType_identifiers___block_invoke_cold_1();
  }

  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 2uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)[*(id *)(a1 + 40) UTF8String]);
  id v4 = objc_alloc_init(MEMORY[0x263F02A30]);
  [v4 encodeObject:*(void *)(a1 + 32)];
  objc_msgSend(MEMORY[0x263F02B30], "dictionary:setPlistContainer:forKey:sizeKey:", v3, objc_msgSend(v4, "plistContainer"), "ids", "ids-size");
  [*(id *)(a1 + 56) receiverRequestStart];
  uint64_t v5 = *(void **)(a1 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__SpotlightReceiverConnection_deleteFromBundle_contentType_identifiers___block_invoke_106;
  v6[3] = &unk_264506570;
  v6[4] = v5;
  [v5 sendMessageAsync:v3 completion:v6];
}

uint64_t __72__SpotlightReceiverConnection_deleteFromBundle_contentType_identifiers___block_invoke_106(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

- (void)purgeFromBundle:(id)a3 identifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count]
    && (self->_supportedJobs & 0x20) != 0
    && [(SpotlightReceiverConnection *)self _wantsBundleID:v6]
    && ![(SpotlightReceiverConnection *)self unresponsive])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__SpotlightReceiverConnection_purgeFromBundle_identifiers___block_invoke;
    v8[3] = &unk_2645064D0;
    id v9 = v7;
    id v10 = v6;
    id v11 = self;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v8];
  }
}

void __59__SpotlightReceiverConnection_purgeFromBundle_identifiers___block_invoke(uint64_t a1)
{
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __59__SpotlightReceiverConnection_purgeFromBundle_identifiers___block_invoke_cold_1();
  }

  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 0x20uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)[*(id *)(a1 + 40) UTF8String]);
  id v4 = objc_alloc_init(MEMORY[0x263F02A30]);
  [v4 encodeObject:*(void *)(a1 + 32)];
  objc_msgSend(MEMORY[0x263F02B30], "dictionary:setPlistContainer:forKey:sizeKey:", v3, objc_msgSend(v4, "plistContainer"), "ids", "ids-size");
  [*(id *)(a1 + 48) receiverRequestStart];
  uint64_t v5 = *(void **)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__SpotlightReceiverConnection_purgeFromBundle_identifiers___block_invoke_108;
  v6[3] = &unk_264506570;
  v6[4] = v5;
  [v5 sendMessageAsync:v3 completion:v6];
}

uint64_t __59__SpotlightReceiverConnection_purgeFromBundle_identifiers___block_invoke_108(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

- (void)addUserActions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((self->_supportedJobs & 0x40) != 0
    && [v8 count]
    && ![(SpotlightReceiverConnection *)self unresponsive])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __71__SpotlightReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke;
    v11[3] = &unk_2645065C0;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    long long v15 = self;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v11];
  }
}

void __71__SpotlightReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke(id *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __71__SpotlightReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke_cold_1();
  }

  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 0x40uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)[a1[5] UTF8String]);
  if ([a1[6] length]) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[a1[6] UTF8String]);
  }
  id v4 = objc_alloc_init(MEMORY[0x263F02A30]);
  [v4 beginArray];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = a1[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        [v4 beginArray];
        id v11 = [v10 action];
        [v4 encodeObject:v11];

        id v12 = [v10 item];
        id v13 = [v12 attributeSet];
        [v4 encodeObject:v13];

        [v4 endArray];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  [v4 endArray];
  objc_msgSend(MEMORY[0x263F02B30], "dictionary:setPlistContainer:forKey:sizeKey:", v3, objc_msgSend(v4, "plistContainer"), "a", "a-size");
  [a1[7] receiverRequestStart];
  id v14 = a1[7];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__SpotlightReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke_111;
  v15[3] = &unk_264506570;
  void v15[4] = v14;
  [v14 sendMessageAsync:v3 completion:v15];
}

uint64_t __71__SpotlightReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke_111(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

- (void)deleteAllUserActivities:(id)a3
{
  id v4 = a3;
  if (v4 && (self->_supportedJobs & 0x1000) != 0 && ![(SpotlightReceiverConnection *)self unresponsive])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __55__SpotlightReceiverConnection_deleteAllUserActivities___block_invoke;
    v5[3] = &unk_2645065E8;
    id v6 = v4;
    uint64_t v7 = self;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v5];
  }
}

void __55__SpotlightReceiverConnection_deleteAllUserActivities___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) serviceName];
    *(_DWORD *)buf = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "deleteAllUserActivities bundleID: %@, client: %@", buf, 0x16u);
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "j");
  xpc_dictionary_set_uint64(v5, "jt", 0x1000uLL);
  xpc_dictionary_set_string(v5, "b", (const char *)[*(id *)(a1 + 32) UTF8String]);
  [*(id *)(a1 + 40) receiverRequestStart];
  id v6 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SpotlightReceiverConnection_deleteAllUserActivities___block_invoke_112;
  v7[3] = &unk_264506570;
  v7[4] = v6;
  [v6 sendMessageAsync:v5 completion:v7];
}

uint64_t __55__SpotlightReceiverConnection_deleteAllUserActivities___block_invoke_112(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4 retainedData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8
    && v9
    && (self->_supportedJobs & 0x2000) != 0
    && ![(SpotlightReceiverConnection *)self unresponsive])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __99__SpotlightReceiverConnection_deleteUserActivitiesWithPersistentIdentifiers_bundleID_retainedData___block_invoke;
    v11[3] = &unk_2645065C0;
    id v12 = v9;
    id v13 = self;
    id v14 = v8;
    id v15 = v10;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v11];
  }
}

void __99__SpotlightReceiverConnection_deleteUserActivitiesWithPersistentIdentifiers_bundleID_retainedData___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) serviceName];
    *(_DWORD *)buf = 138412546;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "deleteUserActivities bundleID: %@, client: %@", buf, 0x16u);
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "j");
  xpc_dictionary_set_uint64(v5, "jt", 0x2000uLL);
  xpc_dictionary_set_string(v5, "b", (const char *)[*(id *)(a1 + 32) UTF8String]);
  [*(id *)(a1 + 40) dictionary:v5 setDecoderData:*(void *)(a1 + 48) forKey:"ids" sizeKey:"ids-size"];
  [*(id *)(a1 + 40) receiverRequestStart];
  id v6 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __99__SpotlightReceiverConnection_deleteUserActivitiesWithPersistentIdentifiers_bundleID_retainedData___block_invoke_113;
  v7[3] = &unk_264506610;
  v7[4] = v6;
  id v8 = *(id *)(a1 + 56);
  [v6 sendMessageAsync:v5 completion:v7];
}

id __99__SpotlightReceiverConnection_deleteUserActivitiesWithPersistentIdentifiers_bundleID_retainedData___block_invoke_113(uint64_t a1)
{
  return self;
}

- (void)deleteFromBundle:(id)a3 sinceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && (self->_supportedJobs & 0x10) != 0
    && [(SpotlightReceiverConnection *)self _wantsBundleID:v6]
    && ![(SpotlightReceiverConnection *)self unresponsive])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__SpotlightReceiverConnection_deleteFromBundle_sinceDate___block_invoke;
    v8[3] = &unk_2645064D0;
    id v9 = v7;
    id v10 = v6;
    __int16 v11 = self;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v8];
  }
}

void __58__SpotlightReceiverConnection_deleteFromBundle_sinceDate___block_invoke(id *a1)
{
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__SpotlightReceiverConnection_deleteFromBundle_sinceDate___block_invoke_cold_1((uint64_t)a1);
  }

  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 0x10uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)[a1[5] UTF8String]);
  [a1[4] timeIntervalSince1970];
  xpc_dictionary_set_date(v3, "d", (uint64_t)v4);
  [a1[6] receiverRequestStart];
  id v5 = a1[6];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__SpotlightReceiverConnection_deleteFromBundle_sinceDate___block_invoke_115;
  v6[3] = &unk_264506570;
  v6[4] = v5;
  [v5 sendMessageAsync:v3 completion:v6];
}

uint64_t __58__SpotlightReceiverConnection_deleteFromBundle_sinceDate___block_invoke_115(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

- (void)deleteFromBundle:(id)a3
{
  id v4 = a3;
  if ((self->_supportedJobs & 8) != 0
    && [(SpotlightReceiverConnection *)self _wantsBundleID:v4]
    && ![(SpotlightReceiverConnection *)self unresponsive])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __48__SpotlightReceiverConnection_deleteFromBundle___block_invoke;
    v5[3] = &unk_2645065E8;
    id v6 = v4;
    id v7 = self;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v5];
  }
}

void __48__SpotlightReceiverConnection_deleteFromBundle___block_invoke(uint64_t a1)
{
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __48__SpotlightReceiverConnection_deleteFromBundle___block_invoke_cold_1(a1);
  }

  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 8uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)[*(id *)(a1 + 32) UTF8String]);
  [*(id *)(a1 + 40) receiverRequestStart];
  id v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__SpotlightReceiverConnection_deleteFromBundle___block_invoke_116;
  v5[3] = &unk_264506570;
  void v5[4] = v4;
  [v4 sendMessageAsync:v3 completion:v5];
}

uint64_t __48__SpotlightReceiverConnection_deleteFromBundle___block_invoke_116(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

uint64_t __87__SpotlightReceiverConnection_addInteraction_intentClassName_bundleID_protectionClass___block_invoke_119(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((self->_supportedJobs & 0x100) != 0 && ![(SpotlightReceiverConnection *)self unresponsive])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke;
    v11[3] = &unk_2645065C0;
    id v12 = v9;
    id v13 = v10;
    id v14 = self;
    id v15 = v8;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v11];
  }
}

void __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke(id *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    id v5 = [a1[6] serviceName];
    uint64_t v6 = [a1[7] count];
    *(_DWORD *)buf = 138413058;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    long long v16 = v5;
    __int16 v17 = 2048;
    uint64_t v18 = v6;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "deleteInteractionsWithIdentifiers, bundleID: %@, protectionClass: %@, client: %@, identifiers number: %lu", buf, 0x2Au);
  }
  id v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke_cold_1((uint64_t)a1, v7);
  }

  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "command", "j");
  xpc_dictionary_set_uint64(v8, "jt", 0x100uLL);
  xpc_dictionary_set_string(v8, "b", (const char *)[a1[4] UTF8String]);
  if ([a1[5] length]) {
    xpc_dictionary_set_string(v8, "pc", (const char *)[a1[5] UTF8String]);
  }
  [MEMORY[0x263F02B30] dictionary:v8 setStringArray:a1[7] forKey:"ids"];
  [a1[6] receiverRequestStart];
  id v9 = a1[6];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke_120;
  v10[3] = &unk_264506570;
  v10[4] = v9;
  [v9 sendMessageAsync:v8 completion:v10];
}

uint64_t __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke_120(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((self->_supportedJobs & 0x200) != 0 && ![(SpotlightReceiverConnection *)self unresponsive])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __95__SpotlightReceiverConnection_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke;
    v11[3] = &unk_2645065C0;
    id v12 = v9;
    id v13 = v10;
    id v14 = self;
    id v15 = v8;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v11];
  }
}

void __95__SpotlightReceiverConnection_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke(id *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    id v5 = [a1[6] serviceName];
    uint64_t v6 = [a1[7] count];
    *(_DWORD *)buf = 138413058;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    long long v16 = v5;
    __int16 v17 = 2048;
    uint64_t v18 = v6;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "deleteInteractionsWithGroupIdentifiers, bundleID: %@, protectionClass: %@, client: %@, identifiers number: %lu", buf, 0x2Au);
  }
  id v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke_cold_1((uint64_t)a1, v7);
  }

  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "command", "j");
  xpc_dictionary_set_uint64(v8, "jt", 0x200uLL);
  xpc_dictionary_set_string(v8, "b", (const char *)[a1[4] UTF8String]);
  if ([a1[5] length]) {
    xpc_dictionary_set_string(v8, "pc", (const char *)[a1[5] UTF8String]);
  }
  [MEMORY[0x263F02B30] dictionary:v8 setStringArray:a1[7] forKey:"ids"];
  [a1[6] receiverRequestStart];
  id v9 = a1[6];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __95__SpotlightReceiverConnection_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke_121;
  v10[3] = &unk_264506570;
  v10[4] = v9;
  [v9 sendMessageAsync:v8 completion:v10];
}

uint64_t __95__SpotlightReceiverConnection_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke_121(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((self->_supportedJobs & 0x400) != 0 && ![(SpotlightReceiverConnection *)self unresponsive])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __81__SpotlightReceiverConnection_deleteAllInteractionsWithBundleID_protectionClass___block_invoke;
    v8[3] = &unk_2645064D0;
    id v9 = v6;
    id v10 = v7;
    __int16 v11 = self;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v8];
  }
}

void __81__SpotlightReceiverConnection_deleteAllInteractionsWithBundleID_protectionClass___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    id v5 = [a1[6] serviceName];
    *(_DWORD *)buf = 138412802;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "deleteAllInteractionsWithBundleID, bundleID: %@, protectionClass: %@, client: %@", buf, 0x20u);
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "command", "j");
  xpc_dictionary_set_uint64(v6, "jt", 0x400uLL);
  xpc_dictionary_set_string(v6, "b", (const char *)[a1[4] UTF8String]);
  if ([a1[5] length]) {
    xpc_dictionary_set_string(v6, "pc", (const char *)[a1[5] UTF8String]);
  }
  [a1[6] receiverRequestStart];
  id v7 = a1[6];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__SpotlightReceiverConnection_deleteAllInteractionsWithBundleID_protectionClass___block_invoke_122;
  v8[3] = &unk_264506570;
  void v8[4] = v7;
  [v7 sendMessageAsync:v6 completion:v8];
}

uint64_t __81__SpotlightReceiverConnection_deleteAllInteractionsWithBundleID_protectionClass___block_invoke_122(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

- (void)donateRelevantActions:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int supportedJobs = self->_supportedJobs;
  if ((supportedJobs & 0x800) != 0)
  {
    uint64_t v9 = 2048;
  }
  else
  {
    if ((supportedJobs & 0x4000) == 0) {
      goto LABEL_7;
    }
    uint64_t v9 = 0x4000;
  }
  if (![(SpotlightReceiverConnection *)self unresponsive])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62__SpotlightReceiverConnection_donateRelevantActions_bundleID___block_invoke;
    v10[3] = &unk_264506638;
    id v11 = v6;
    id v12 = v7;
    __int16 v13 = self;
    uint64_t v14 = v9;
    [(SpotlightReceiverConnection *)self runOnSenderQueue:v10];
  }
LABEL_7:
}

void __62__SpotlightReceiverConnection_donateRelevantActions_bundleID___block_invoke(uint64_t a1)
{
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __62__SpotlightReceiverConnection_donateRelevantActions_bundleID___block_invoke_cold_1(a1);
  }

  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", *(void *)(a1 + 56));
  xpc_dictionary_set_string(v3, "b", (const char *)[*(id *)(a1 + 40) UTF8String]);
  xpc_dictionary_set_value(v3, "ra", *(xpc_object_t *)(a1 + 32));
  [*(id *)(a1 + 48) receiverRequestStart];
  id v4 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__SpotlightReceiverConnection_donateRelevantActions_bundleID___block_invoke_124;
  v5[3] = &unk_264506570;
  void v5[4] = v4;
  [v4 sendMessageAsync:v3 completion:v5];
}

uint64_t __62__SpotlightReceiverConnection_donateRelevantActions_bundleID___block_invoke_124(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiverRequestComplete];
}

- (NSSet)bundleIDs
{
  return self->_bundleIDs;
}

- (NSArray)contentTypes
{
  return self->_contentTypes;
}

- (NSSet)INIntentClassNames
{
  return self->_INIntentClassNames;
}

- (int)supportedJobs
{
  return self->_supportedJobs;
}

- (OS_dispatch_queue)senderQueue
{
  return self->_senderQueue;
}

- (unsigned)requestCount
{
  return atomic_load(&self->_requestCount);
}

- (BOOL)wantsHTML
{
  return self->_wantsHTML;
}

- (void)setWantsHTML:(BOOL)a3
{
  self->_wantsHTML = a3;
}

- (BOOL)wantsText
{
  return self->_wantsText;
}

- (void)setWantsText:(BOOL)a3
{
  self->_wantsText = a3;
}

- (BOOL)setupStarted
{
  return self->_setupStarted;
}

- (void)setSetupStarted:(BOOL)a3
{
  self->_setupStarted = a3;
}

- (BOOL)setupComplete
{
  return self->_setupComplete;
}

- (void)setSetupComplete:(BOOL)a3
{
  self->_setupComplete = a3;
}

- (BOOL)skipFileProviderItems
{
  return self->_skipFileProviderItems;
}

- (void)setSkipFileProviderItems:(BOOL)a3
{
  self->_skipFileProviderItems = a3;
}

- (double)minDate
{
  return self->_minDate;
}

- (void)setMinDate:(double)a3
{
  self->_minDate = a3;
}

- (OS_dispatch_semaphore)setupSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSetupSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupSemaphore, 0);
  objc_storeStrong((id *)&self->_senderQueue, 0);
  objc_storeStrong((id *)&self->_INIntentClassNames, 0);
  objc_storeStrong((id *)&self->_contentTypes, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_negativeSet, 0);
  objc_storeStrong((id *)&self->_positiveSet, 0);
}

- (void)handleError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a2 serviceName];
  int v6 = 136315394;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_21F1CE000, a3, OS_LOG_TYPE_ERROR, "### Connection error %s for %@ ####", (uint8_t *)&v6, 0x16u);
}

void __41__SpotlightReceiverConnection_startSetup__block_invoke_76_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21F1CE000, log, OS_LOG_TYPE_ERROR, "### RECEIVER write to %@ error %@", (uint8_t *)&v4, 0x16u);
}

void __82__SpotlightReceiverConnection_indexFromBundle_protectionClass_items_itemsContent___block_invoke_cold_1(uint64_t a1, id *a2)
{
  uint64_t v2 = [*a2 serviceName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_21F1CE000, v3, v4, "indexItems, bundleID: %@, protectionClass: %@, client: %@", v5, v6, v7, v8, v9);
}

void __67__SpotlightReceiverConnection_deleteFromBundle_encodedIdentifiers___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) serviceName];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9(&dword_21F1CE000, v2, v3, "deleteEncodedIdentifiersFromBundle, bundleID: %@, client: %@", v4, v5, v6, v7, v8);
}

void __72__SpotlightReceiverConnection_deleteFromBundle_contentType_identifiers___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(v1);
  uint64_t v2 = [*(id *)(v0 + 56) serviceName];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_8(&dword_21F1CE000, v3, v4, "deleteIdentifiersFromBundle, count: %d bundleID: %@, contentType: %@ client: %@", v5, v6, v7, v8, v9);
}

void __66__SpotlightReceiverConnection_deleteFromBundle_domainIdentifiers___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(v1);
  uint64_t v2 = [*(id *)(v0 + 48) serviceName];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_21F1CE000, v3, v4, "deleteDomainIdentifiersFromBundle, count: %d bundleID: %@, client: %@", v5, v6, v7, v8, v9);
}

void __59__SpotlightReceiverConnection_purgeFromBundle_identifiers___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(v1);
  uint64_t v2 = [*(id *)(v0 + 48) serviceName];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7(&dword_21F1CE000, v3, v4, "purgeFromBundle, count: %d bundleID: %@, client: %@", v5, v6, v7, v8, v9);
}

void __71__SpotlightReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(v1);
  uint64_t v2 = [*(id *)(v0 + 56) serviceName];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_8(&dword_21F1CE000, v3, v4, "addUserActions, count: %d bundleID: %@, protectionClass: %@, client: %@", v5, v6, v7, v8, v9);
}

void __58__SpotlightReceiverConnection_deleteFromBundle_sinceDate___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 48) serviceName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_21F1CE000, v2, v3, "deleteFromBundle, sinceDate: %@, bundleID: %@, client: %@", v4, v5, v6, v7, v8);
}

void __48__SpotlightReceiverConnection_deleteFromBundle___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) serviceName];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9(&dword_21F1CE000, v2, v3, "deleteFromBundle, bundleID: %@, client: %@", v4, v5, v6, v7, v8);
}

void __87__SpotlightReceiverConnection_addInteraction_intentClassName_bundleID_protectionClass___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = [*(id *)(a1 + 64) serviceName];
  int v8 = 134219010;
  uint64_t v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = v4;
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  __int16 v14 = 2112;
  uint64_t v15 = v6;
  __int16 v16 = 2112;
  __int16 v17 = v7;
  _os_log_debug_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_DEBUG, "addInteraction, interaction: %p(%@), bundleID: %@, protectionClass: %@, client: %@", (uint8_t *)&v8, 0x34u);
}

void __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_DEBUG, "identifiers: %@", (uint8_t *)&v3, 0xCu);
}

void __62__SpotlightReceiverConnection_donateRelevantActions_bundleID___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 48) serviceName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_21F1CE000, v2, v3, "donateRelevantActions data: %p, bundleID: %@ client: %@", v4, v5, v6, v7, v8);
}

@end