@interface NTKComplicationCollection
+ (id)_bundleForWatchKitAppID:(id)a3;
+ (id)lsSDKVersionForApplicationID:(id)a3;
+ (id)newWidgetCollection;
+ (id)sharedBundleCollection;
+ (id)sharedRemoteCollection;
- (BOOL)hasLoaded;
- (BOOL)hasSampleTemplateForClientIdentifier:(id)a3 descriptor:(id)a4 family:(int64_t)a5;
- (NSString)collectionIdentifier;
- (NSUUID)deviceUUID;
- (NTKComplicationCollection)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4;
- (id)_fetchOrCreateSampleDataForClientIdentifier:(id)a3 descriptor:(id)a4 family:(int64_t)a5;
- (id)_sampleDataForClientIdentifier:(id)a3 descriptor:(id)a4;
- (id)clients;
- (id)clientsSupportingFamily:(int64_t)a3;
- (id)complicationDescriptorsForClientIdentifier:(id)a3;
- (id)sampleTemplateForClientIdentifier:(id)a3 descriptor:(id)a4 applicationID:(id)a5 family:(int64_t)a6;
- (id)supportedTemplateFamiliesForClientIdentifier:(id)a3 descriptor:(id)a4;
- (void)_cleanupOrphanedSampleTemplatesForClientIdentifier:(id)a3;
- (void)_handleConnectionInterrupted;
- (void)_notifyLoaded;
- (void)_notifyReloaded;
- (void)_notifyRemovedComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4;
- (void)_notifyUpdateComplicationDescriptorsForClientIdentifier:(id)a3;
- (void)_notifyUpdateComplicationSampleTemplateForClientIdentifier:(id)a3 descriptor:(id)a4;
- (void)_performOrEnqueueUpdate:(id)a3;
- (void)_register;
- (void)_registerIfNeeded;
- (void)_removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4;
- (void)_sendToDaemonRemoveComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4;
- (void)_sendToDaemonUpdatedComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4;
- (void)_sendToDaemonUpdatedSampleDataTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6;
- (void)_setComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4;
- (void)_setLocalizedSampleTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6;
- (void)_setLocalizedSampleTemplateReference:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6;
- (void)_throwIfNotLoaded:(SEL)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)loadFullCollectionWithLocalizableSampleTemplates:(id)a3 complicationDescriptors:(id)a4 seqId:(id)a5;
- (void)performAfterLoad:(id)a3;
- (void)removeAllComplicationSampleTemplatesExceptThoseWithClientIdentifiers:(id)a3;
- (void)removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4;
- (void)removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4 seqId:(id)a5;
- (void)removeObserver:(id)a3;
- (void)resumeUpdatesFromDaemon;
- (void)setComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4;
- (void)setLocalizableSampleTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6;
- (void)suspendUpdatesFromDaemon;
- (void)updateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4 seqId:(id)a5;
- (void)updateSampleTemplateReference:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6 seqId:(id)a7;
@end

@implementation NTKComplicationCollection

- (NTKComplicationCollection)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)NTKComplicationCollection;
  v9 = [(NTKComplicationCollection *)&v44 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collectionIdentifier, a3);
    objc_storeStrong((id *)&v10->_deviceUUID, a4);
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    loadCallbacks = v10->_loadCallbacks;
    v10->_loadCallbacks = (NSMutableArray *)v13;

    v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    observersLock = v10->_observersLock;
    v10->_observersLock = v15;

    v17 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v10->_lock;
    v10->_lock = v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    localizeableSampleDataTemplates = v10->_localizeableSampleDataTemplates;
    v10->_localizeableSampleDataTemplates = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    complicationDescriptors = v10->_complicationDescriptors;
    v10->_complicationDescriptors = (NSMutableDictionary *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nanotimekit.complicationstoreserver" options:4096];
    connection = v10->_connection;
    v10->_connection = (NSXPCConnection *)v23;

    v25 = v10->_connection;
    v26 = NTKComplicationStoreServerInterface();
    [(NSXPCConnection *)v25 setRemoteObjectInterface:v26];

    v27 = v10->_connection;
    v28 = NTKComplicationStoreClientInterface();
    [(NSXPCConnection *)v27 setExportedInterface:v28];

    v29 = [[_NTKComplicationStoreClientProxy alloc] initWithWeakProxy:v10];
    [(NSXPCConnection *)v10->_connection setExportedObject:v29];
    objc_initWeak(&location, v10);
    v30 = v10->_connection;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke;
    v40[3] = &unk_1E62C1A18;
    objc_copyWeak(&v42, &location);
    id v31 = v7;
    id v41 = v31;
    [(NSXPCConnection *)v30 setInterruptionHandler:v40];
    v32 = v10->_connection;
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_22;
    v38 = &unk_1E62BFF20;
    id v39 = v31;
    [(NSXPCConnection *)v32 setInvalidationHandler:&v35];
    [(NSXPCConnection *)v10->_connection resume];
    [(NTKComplicationCollection *)v10 _register];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)_handleDaemonDidLaunchNotification_0, @"com.apple.nanotimekit.daemondidlaunch", 0, (CFNotificationSuspensionBehavior)0);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  return v10;
}

void __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_2;
  v2[3] = &unk_1E62C1A18;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_2_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
  }

  [WeakRetained _handleConnectionInterrupted];
}

void __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_22(uint64_t a1)
{
  v2 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_22_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.nanotimekit.daemondidlaunch", 0);
  v4.receiver = self;
  v4.super_class = (Class)NTKComplicationCollection;
  [(NTKComplicationCollection *)&v4 dealloc];
}

+ (id)sharedRemoteCollection
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NTKComplicationCollection_sharedRemoteCollection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRemoteCollection_onceToken != -1) {
    dispatch_once(&sharedRemoteCollection_onceToken, block);
  }
  v2 = (void *)sharedRemoteCollection___sharedRemoteCollection;
  return v2;
}

void __51__NTKComplicationCollection_sharedRemoteCollection__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithCollectionIdentifier:@"RemoteComplicationsV2" deviceUUID:0];
  v2 = (void *)sharedRemoteCollection___sharedRemoteCollection;
  sharedRemoteCollection___sharedRemoteCollection = v1;
}

+ (id)newWidgetCollection
{
  id v2 = objc_alloc((Class)a1);
  return (id)[v2 initWithCollectionIdentifier:@"WidgetComplications" deviceUUID:0];
}

+ (id)sharedBundleCollection
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NTKComplicationCollection_sharedBundleCollection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBundleCollection_onceToken != -1) {
    dispatch_once(&sharedBundleCollection_onceToken, block);
  }
  id v2 = (void *)sharedBundleCollection___sharedBundleCollection;
  return v2;
}

void __51__NTKComplicationCollection_sharedBundleCollection__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithCollectionIdentifier:@"BundleComplications" deviceUUID:0];
  id v2 = (void *)sharedBundleCollection___sharedBundleCollection;
  sharedBundleCollection___sharedBundleCollection = v1;
}

- (void)addObserver:(id)a3
{
  observersLock = self->_observersLock;
  id v5 = a3;
  [(NSLock *)observersLock lock];
  [(NSHashTable *)self->_observers addObject:v5];

  uint64_t v6 = self->_observersLock;
  [(NSLock *)v6 unlock];
}

- (void)removeObserver:(id)a3
{
  observersLock = self->_observersLock;
  id v5 = a3;
  [(NSLock *)observersLock lock];
  [(NSHashTable *)self->_observers removeObject:v5];

  uint64_t v6 = self->_observersLock;
  [(NSLock *)v6 unlock];
}

- (void)performAfterLoad:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__NTKComplicationCollection_performAfterLoad___block_invoke;
    v6[3] = &unk_1E62C2290;
    v6[4] = self;
    id v7 = v4;
    [(NTKComplicationCollection *)self _performOrEnqueueUpdate:v6];
  }
}

void __46__NTKComplicationCollection_performAfterLoad___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 96))
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void **)(v1 + 64);
    id v4 = (id)[*(id *)(a1 + 40) copy];
    [v3 addObject:v4];
  }
}

+ (id)lsSDKVersionForApplicationID:(id)a3
{
  id v3 = a3;
  id v20 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v20];
  id v5 = v20;
  if (v4)
  {
    uint64_t v6 = [v4 SDKVersion];
    id v7 = 0;
    if (v6) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  uint64_t v8 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[NTKComplicationCollection lsSDKVersionForApplicationID:]();
  }

  id v19 = 0;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v3 error:&v19];
  id v7 = v19;
  if (v9)
  {
    uint64_t v6 = [v9 SDKVersion];
  }
  else
  {
    v10 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[NTKComplicationCollection lsSDKVersionForApplicationID:]();
    }

    uint64_t v6 = 0;
  }

  if (!v6)
  {
LABEL_12:
    uint64_t v11 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[NTKComplicationCollection lsSDKVersionForApplicationID:]((uint64_t)v3, v11, v12, v13, v14, v15, v16, v17);
    }
  }
LABEL_15:

  return v6;
}

- (id)clients
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = [(NSMutableDictionary *)self->_localizeableSampleDataTemplates allKeys];
  [(NSRecursiveLock *)self->_lock unlock];
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "length", (void)v13)) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [v4 allObjects];

  return v11;
}

- (id)clientsSupportingFamily:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA80] set];
  [(NSRecursiveLock *)self->_lock lock];
  localizeableSampleDataTemplates = self->_localizeableSampleDataTemplates;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __53__NTKComplicationCollection_clientsSupportingFamily___block_invoke;
  long long v13 = &unk_1E62C6498;
  id v14 = v5;
  int64_t v15 = a3;
  id v7 = v5;
  [(NSMutableDictionary *)localizeableSampleDataTemplates enumerateKeysAndObjectsUsingBlock:&v10];
  [(NSRecursiveLock *)self->_lock unlock];
  uint64_t v8 = [v7 allObjects];

  return v8;
}

void __53__NTKComplicationCollection_clientsSupportingFamily___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 allValues];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__NTKComplicationCollection_clientsSupportingFamily___block_invoke_2;
  v9[3] = &unk_1E62C6470;
  id v7 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v10 = v7;
  id v11 = v5;
  id v8 = v5;
  [v6 enumerateObjectsUsingBlock:v9];
}

void __53__NTKComplicationCollection_clientsSupportingFamily___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 supportedFamilies];
  id v7 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    *a4 = 1;
  }
}

- (id)supportedTemplateFamiliesForClientIdentifier:(id)a3 descriptor:(id)a4
{
  id v4 = [(NTKComplicationCollection *)self _sampleDataForClientIdentifier:a3 descriptor:a4];
  id v5 = [v4 supportedFamilies];

  return v5;
}

- (BOOL)hasSampleTemplateForClientIdentifier:(id)a3 descriptor:(id)a4 family:(int64_t)a5
{
  uint64_t v6 = [(NTKComplicationCollection *)self _sampleDataForClientIdentifier:a3 descriptor:a4];
  LOBYTE(a5) = [v6 hasTemplateForFamily:a5];

  return a5;
}

- (id)sampleTemplateForClientIdentifier:(id)a3 descriptor:(id)a4 applicationID:(id)a5 family:(int64_t)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v31 = a5;
  v30 = [(NTKComplicationCollection *)self _sampleDataForClientIdentifier:v10 descriptor:a4];
  uint64_t v29 = [v30 templateForFamily:a6];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = +[NTKCompanionAppLibrary sharedAppLibrary];
  uint64_t v12 = [v11 thirdPartyApps];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v13)
  {
LABEL_14:

    uint64_t v23 = (void *)v29;
    v22 = v30;
    goto LABEL_20;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v33;
LABEL_3:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v33 != v15) {
      objc_enumerationMutation(v12);
    }
    uint64_t v17 = *(void **)(*((void *)&v32 + 1) + 8 * v16);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    id v18 = v17;
    id v19 = [v18 complicationClientIdentifier];
    if (([v19 isEqualToString:v10] & 1) == 0)
    {

      goto LABEL_11;
    }
    id v20 = [v18 watchApplicationIdentifier];
    int v21 = [v20 isEqualToString:v31];

    if (v21) {
      break;
    }
LABEL_11:

LABEL_12:
    if (v14 == ++v16)
    {
      uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v14) {
        goto LABEL_3;
      }
      goto LABEL_14;
    }
  }
  uint64_t v24 = [v18 urlToWatchKitBundle];
  v25 = (void *)v24;
  if (v24)
  {
    v26 = [MEMORY[0x1E4F28B50] bundleWithURL:v24];
  }
  else
  {
    v26 = 0;
  }
  uint64_t v23 = (void *)v29;
  v22 = v30;

  if (v26)
  {
    id v27 = +[NTKComplicationBundleHelper localizedComplicationTemplateForTemplate:v29 bundle:v26 localization:0];

    goto LABEL_21;
  }
LABEL_20:
  id v27 = v23;
LABEL_21:

  return v27;
}

- (id)complicationDescriptorsForClientIdentifier:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  uint64_t v6 = [(NSMutableDictionary *)self->_complicationDescriptors objectForKey:v5];

  id v7 = (void *)[v6 copy];
  [(NSRecursiveLock *)self->_lock unlock];
  return v7;
}

+ (id)_bundleForWatchKitAppID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v26 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v26];
  id v5 = v26;
  if (!v4)
  {
    uint64_t v6 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[NTKComplicationCollection _bundleForWatchKitAppID:v6];
    }
    goto LABEL_14;
  }
  uint64_t v6 = [v4 applicationExtensionRecords];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (!v7)
  {
LABEL_14:
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  id v19 = v5;
  id v20 = v4;
  id v21 = v3;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v13 = [v12 extensionPointRecord];
      uint64_t v14 = [v13 name];
      int v15 = [v14 isEqualToString:@"com.apple.watchkit"];

      if (v15)
      {
        uint64_t v16 = [v12 URL];
        uint64_t v17 = [MEMORY[0x1E4F28B50] bundleWithURL:v16];

        uint64_t v9 = (void *)v17;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  }
  while (v8);
  id v4 = v20;
  id v3 = v21;
  id v5 = v19;
LABEL_15:

  return v9;
}

- (void)setLocalizableSampleTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6
{
  if (a3)
  {
    id v10 = a5;
    id v12 = a4;
    id v11 = a3;
    [(NTKComplicationCollection *)self _setLocalizedSampleTemplate:v11 forClientIdentifier:v12 descriptor:v10 family:a6];
    [(NTKComplicationCollection *)self _sendToDaemonUpdatedSampleDataTemplate:v11 forClientIdentifier:v12 descriptor:v10 family:a6];

    [(NTKComplicationCollection *)self _notifyUpdateComplicationSampleTemplateForClientIdentifier:v12 descriptor:v10];
  }
}

- (void)setComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection, setting %@ descriptors for %@", (uint8_t *)&v9, 0x16u);
    }

    [(NTKComplicationCollection *)self _setComplicationDescriptors:v6 forClientIdentifier:v7];
    [(NTKComplicationCollection *)self _sendToDaemonUpdatedComplicationDescriptors:v6 forClientIdentifier:v7];
    [(NTKComplicationCollection *)self _notifyUpdateComplicationDescriptorsForClientIdentifier:v7];
    [(NTKComplicationCollection *)self _cleanupOrphanedSampleTemplatesForClientIdentifier:v7];
  }
}

- (void)removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [(NTKComplicationCollection *)self _throwIfNotLoaded:a2];
  int v9 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 identifier];
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection, removing complication sample templates for %@, %@", (uint8_t *)&v11, 0x16u);
  }
  [(NTKComplicationCollection *)self _removeComplicationSampleTemplatesForClientIdentifier:v7 descriptor:v8];
  [(NTKComplicationCollection *)self _sendToDaemonRemoveComplicationSampleTemplatesForClientIdentifier:v7 descriptor:v8];
  [(NTKComplicationCollection *)self _notifyRemovedComplicationSampleTemplatesForClientIdentifier:v7 descriptor:v8];
}

- (void)removeAllComplicationSampleTemplatesExceptThoseWithClientIdentifiers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = [(NSMutableDictionary *)self->_localizeableSampleDataTemplates allKeys];
  [(NSRecursiveLock *)self->_lock unlock];
  id v6 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection, removing all complication sample templates except those with client identifiers %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (([v4 containsObject:v12] & 1) == 0)
        {
          __int16 v13 = [(NTKComplicationCollection *)self complicationDescriptorsForClientIdentifier:v12];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __98__NTKComplicationCollection_removeAllComplicationSampleTemplatesExceptThoseWithClientIdentifiers___block_invoke;
          v14[3] = &unk_1E62C64C0;
          v14[4] = self;
          v14[5] = v12;
          [v13 enumerateObjectsUsingBlock:v14];

          [(NTKComplicationCollection *)self _cleanupOrphanedSampleTemplatesForClientIdentifier:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

uint64_t __98__NTKComplicationCollection_removeAllComplicationSampleTemplatesExceptThoseWithClientIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeComplicationSampleTemplatesForClientIdentifier:*(void *)(a1 + 40) descriptor:a2];
}

- (id)_fetchOrCreateSampleDataForClientIdentifier:(id)a3 descriptor:(id)a4 family:(int64_t)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v10 = [(NTKComplicationCollection *)self _sampleDataForClientIdentifier:v8 descriptor:v9];
  if (!v10)
  {
    int v11 = [NTKComplicationSampleData alloc];
    uint64_t v12 = [NSNumber numberWithInteger:a5];
    v16[0] = v12;
    __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v10 = [(NTKComplicationSampleData *)v11 initWithSupportedFamilies:v13];

    uint64_t v14 = [(NSMutableDictionary *)self->_localizeableSampleDataTemplates objectForKeyedSubscript:v8];
    if (!v14)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_localizeableSampleDataTemplates setObject:v14 forKeyedSubscript:v8];
    }
    [v14 setObject:v10 forKeyedSubscript:v9];
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return v10;
}

- (void)_setLocalizedSampleTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6
{
  id v10 = a3;
  id v11 = [(NTKComplicationCollection *)self _fetchOrCreateSampleDataForClientIdentifier:a4 descriptor:a5 family:a6];
  [v11 setTemplate:v10 forFamily:a6];
}

- (void)_setLocalizedSampleTemplateReference:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6
{
  id v10 = a3;
  id v12 = [(NTKComplicationCollection *)self _fetchOrCreateSampleDataForClientIdentifier:a4 descriptor:a5 family:a6];
  id v11 = [v10 path];

  [v12 setTemplatePath:v11 forFamily:a6];
}

- (void)_setComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4
{
  id v9 = a3;
  lock = self->_lock;
  id v7 = a4;
  [(NSRecursiveLock *)lock lock];
  complicationDescriptors = self->_complicationDescriptors;
  if (v9) {
    [(NSMutableDictionary *)complicationDescriptors setObject:v9 forKey:v7];
  }
  else {
    [(NSMutableDictionary *)complicationDescriptors removeObjectForKey:v7];
  }

  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_cleanupOrphanedSampleTemplatesForClientIdentifier:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = [(NTKComplicationCollection *)self clients];
  char v6 = [v5 containsObject:v4];

  id v7 = [(NSMutableDictionary *)self->_localizeableSampleDataTemplates objectForKey:v4];
  id v8 = [(NSMutableDictionary *)self->_complicationDescriptors objectForKey:v4];
  id v9 = (void *)MEMORY[0x1E4F1CA80];
  id v10 = [v7 allKeys];
  id v11 = [v9 setWithArray:v10];

  id v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  [v11 minusSet:v12];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__NTKComplicationCollection__cleanupOrphanedSampleTemplatesForClientIdentifier___block_invoke;
  v14[3] = &unk_1E62C64E8;
  char v17 = v6;
  id v15 = v4;
  long long v16 = self;
  id v13 = v4;
  [v11 enumerateObjectsUsingBlock:v14];
  [(NSRecursiveLock *)self->_lock unlock];
}

void __80__NTKComplicationCollection__cleanupOrphanedSampleTemplatesForClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(a1 + 48)
    || ([v3 identifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqualToString:*MEMORY[0x1E4F19658]],
        v5,
        (v6 & 1) == 0))
  {
    id v7 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [v4 identifier];
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection, removing orphaned sample data for %@, %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 40) removeComplicationSampleTemplatesForClientIdentifier:*(void *)(a1 + 32) descriptor:v4];
  }
}

- (void)_removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 identifier];
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection, removing complication sample data for %@, %@", (uint8_t *)&v11, 0x16u);
  }
  [(NSRecursiveLock *)self->_lock lock];
  int v10 = [(NSMutableDictionary *)self->_localizeableSampleDataTemplates objectForKey:v6];
  [v10 removeObjectForKey:v7];
  if (![v10 count]) {
    [(NSMutableDictionary *)self->_localizeableSampleDataTemplates removeObjectForKey:v6];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)suspendUpdatesFromDaemon
{
  if (!self->_updatesEnqueuedWhileSuspended)
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    updatesEnqueuedWhileSuspended = self->_updatesEnqueuedWhileSuspended;
    self->_updatesEnqueuedWhileSuspended = v3;
  }
  self->_updatesSuspended = 1;
}

- (void)resumeUpdatesFromDaemon
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_updatesEnqueuedWhileSuspended;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_updatesEnqueuedWhileSuspended removeAllObjects];
  self->_updatesSuspended = 0;
}

- (void)_sendToDaemonUpdatedSampleDataTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  [(NTKComplicationCollection *)self _registerIfNeeded];
  id v13 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v13 updateLocalizableSampleDataTemplate:v12 forClientIdentifier:v11 descriptor:v10 family:a6];
}

- (void)_sendToDaemonUpdatedComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NTKComplicationCollection *)self _registerIfNeeded];
  id v8 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v8 updateComplicationDescriptors:v7 forClientIdentifier:v6];
}

- (void)_sendToDaemonRemoveComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(NTKComplicationCollection *)self _registerIfNeeded];
  id v8 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = [v7 identifier];
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection, telling daemon to remove complication sample templates for %@, %@", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v10 removeComplicationSampleTemplatesForClientIdentifier:v6 descriptor:v7];
}

- (void)loadFullCollectionWithLocalizableSampleTemplates:(id)a3 complicationDescriptors:(id)a4 seqId:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    collectionIdentifier = self->_collectionIdentifier;
    *(_DWORD *)buf = 138412290;
    long long v23 = collectionIdentifier;
    _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection %@ load full data", buf, 0xCu);
  }

  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  NTKValidateDictionary(v8, v13, v14);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __108__NTKComplicationCollection_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId___block_invoke;
  v18[3] = &unk_1E62C32F8;
  v18[4] = self;
  id v19 = v10;
  id v20 = v9;
  id v21 = v8;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  [(NTKComplicationCollection *)self _performOrEnqueueUpdate:v18];
}

void __108__NTKComplicationCollection_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 32) lock];
  uint64_t v2 = [*(id *)(a1 + 48) mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  [*(id *)(*(void *)(a1 + 32) + 32) unlock];
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = *(void **)(a1 + 56);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __108__NTKComplicationCollection_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId___block_invoke_2;
  id v15 = &unk_1E62C6538;
  id v7 = v5;
  id v16 = v7;
  id v17 = *(id *)(a1 + 48);
  [v6 enumerateKeysAndObjectsUsingBlock:&v12];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "lock", v12, v13, v14, v15);
  uint64_t v8 = [v7 mutableCopy];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  [*(id *)(*(void *)(a1 + 32) + 32) unlock];
  int v11 = *(unsigned char **)(a1 + 32);
  if (v11[96])
  {
    [v11 _notifyReloaded];
  }
  else
  {
    v11[96] = 1;
    [*(id *)(a1 + 32) _notifyLoaded];
  }
}

void __108__NTKComplicationCollection_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v5 clientIdentifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    id v10 = *(void **)(a1 + 32);
    int v11 = [v5 clientIdentifier];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v12 = *(void **)(a1 + 40);
  uint64_t v13 = [v5 clientIdentifier];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  long long v25 = __108__NTKComplicationCollection_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId___block_invoke_3;
  id v26 = &unk_1E62C6510;
  id v15 = v5;
  id v27 = v15;
  id v16 = v9;
  id v28 = v16;
  id v17 = v6;
  id v29 = v17;
  v30 = &v31;
  [v14 enumerateObjectsUsingBlock:&v23];

  if (!*((unsigned char *)v32 + 24))
  {
    long long v18 = objc_msgSend(v15, "complicationIdentifier", v23, v24, v25, v26, v27, v28);
    int v19 = [v18 isEqualToString:*MEMORY[0x1E4F19658]];

    if (v19)
    {
      id v20 = (void *)MEMORY[0x1E4F196C8];
      id v21 = [v17 supportedFamilies];
      uint64_t v22 = [v20 legacyComplicationDescriptorWithSupportedFamilies:v21];

      [v16 setObject:v17 forKeyedSubscript:v22];
    }
  }

  _Block_object_dispose(&v31, 8);
}

void __108__NTKComplicationCollection_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v6 = [v9 identifier];
  id v7 = [*(id *)(a1 + 32) complicationIdentifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    [*(id *)(a1 + 40) setObject:*(void *)(a1 + 48) forKeyedSubscript:v9];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)updateSampleTemplateReference:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6 seqId:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v12)
  {
    if (v13)
    {
      if (v14)
      {
LABEL_4:
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        void v16[2] = __103__NTKComplicationCollection_updateSampleTemplateReference_forClientIdentifier_descriptor_family_seqId___block_invoke;
        v16[3] = &unk_1E62C6560;
        v16[4] = self;
        id v17 = v15;
        id v18 = v12;
        id v19 = v13;
        id v20 = v14;
        int64_t v21 = a6;
        [(NTKComplicationCollection *)self _performOrEnqueueUpdate:v16];

        goto LABEL_5;
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ must be non-nil", @"ClientIdentifier" format];
      if (v14) {
        goto LABEL_4;
      }
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ must be non-nil", @"ComplicationDescriptor" format];
    goto LABEL_4;
  }
LABEL_5:
}

uint64_t __103__NTKComplicationCollection_updateSampleTemplateReference_forClientIdentifier_descriptor_family_seqId___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _setLocalizedSampleTemplateReference:*(void *)(a1 + 48) forClientIdentifier:*(void *)(a1 + 56) descriptor:*(void *)(a1 + 64) family:*(void *)(a1 + 72)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  return [v2 _notifyUpdateComplicationSampleTemplateForClientIdentifier:v3 descriptor:v4];
}

- (void)updateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4 seqId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ must be non-nil", @"CLKComplicationDescriptor" format];
    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ must be non-nil", @"ClientIdentifier" format];
    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = objc_opt_class();
  NTKValidateArray(v8, v11);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__NTKComplicationCollection_updateComplicationDescriptors_forClientIdentifier_seqId___block_invoke;
  v15[3] = &unk_1E62C32F8;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(NTKComplicationCollection *)self _performOrEnqueueUpdate:v15];
}

uint64_t __85__NTKComplicationCollection_updateComplicationDescriptors_forClientIdentifier_seqId___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _setComplicationDescriptors:*(void *)(a1 + 48) forClientIdentifier:*(void *)(a1 + 56)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  return [v2 _notifyUpdateComplicationDescriptorsForClientIdentifier:v3];
}

- (void)removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4 seqId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ must be non-nil", @"ClientIdentifier" format];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__NTKComplicationCollection_removeComplicationSampleTemplatesForClientIdentifier_descriptor_seqId___block_invoke;
  v14[3] = &unk_1E62C32F8;
  void v14[4] = self;
  id v15 = v10;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(NTKComplicationCollection *)self _performOrEnqueueUpdate:v14];
}

uint64_t __99__NTKComplicationCollection_removeComplicationSampleTemplatesForClientIdentifier_descriptor_seqId___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _removeComplicationSampleTemplatesForClientIdentifier:*(void *)(a1 + 48) descriptor:*(void *)(a1 + 56)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  return [v2 _notifyRemovedComplicationSampleTemplatesForClientIdentifier:v3 descriptor:v4];
}

- (void)_notifyUpdateComplicationSampleTemplateForClientIdentifier:(id)a3 descriptor:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_hasLoaded)
  {
    [(NSLock *)self->_observersLock lock];
    id v8 = (void *)[(NSHashTable *)self->_observers copy];
    [(NSLock *)self->_observersLock unlock];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v14, "complicationCollection:didUpdateSampleTemplateForClient:descriptor:", self, v6, v7, (void)v15);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)_notifyUpdateComplicationDescriptorsForClientIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasLoaded)
  {
    [(NSLock *)self->_observersLock lock];
    id v5 = (void *)[(NSHashTable *)self->_observers copy];
    [(NSLock *)self->_observersLock unlock];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v11, "complicationCollection:didUpdateComplicationDescriptorsForClient:", self, v4, (void)v12);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_notifyRemovedComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_hasLoaded)
  {
    [(NSLock *)self->_observersLock lock];
    uint64_t v8 = (void *)[(NSHashTable *)self->_observers copy];
    [(NSLock *)self->_observersLock unlock];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v14, "complicationCollection:didRemoveSampleTemplatesForClient:descriptor:", self, v6, v7, (void)v15);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)_notifyLoaded
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_observersLock lock];
  uint64_t v3 = (void *)[(NSHashTable *)self->_observers copy];
  [(NSLock *)self->_observersLock unlock];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 complicationCollectionDidLoad:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = (void *)[(NSMutableArray *)self->_loadCallbacks copy];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v14++) + 16))();
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  [(NSMutableArray *)self->_loadCallbacks removeAllObjects];
  loadCallbacks = self->_loadCallbacks;
  self->_loadCallbacks = 0;
}

- (void)_notifyReloaded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_observersLock lock];
  uint64_t v3 = (void *)[(NSHashTable *)self->_observers copy];
  [(NSLock *)self->_observersLock unlock];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "complicationCollectionDidReload:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)_sampleDataForClientIdentifier:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__35;
  long long v22 = __Block_byref_object_dispose__35;
  id v23 = 0;
  uint64_t v8 = [(NSMutableDictionary *)self->_localizeableSampleDataTemplates objectForKeyedSubscript:v6];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __71__NTKComplicationCollection__sampleDataForClientIdentifier_descriptor___block_invoke;
  uint64_t v15 = &unk_1E62C6588;
  id v9 = v7;
  id v16 = v9;
  long long v17 = &v18;
  [v8 enumerateKeysAndObjectsUsingBlock:&v12];

  [(NSRecursiveLock *)self->_lock unlock];
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __71__NTKComplicationCollection__sampleDataForClientIdentifier_descriptor___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([a2 isEqual:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (void)_register
{
  uint64_t v3 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v3 registerForCollectionIdentifier:self->_collectionIdentifier deviceUUID:self->_deviceUUID withSeqId:self->_seqId];

  self->_registrationNeeded = 0;
}

- (void)_registerIfNeeded
{
  if (self->_registrationNeeded) {
    [(NTKComplicationCollection *)self _register];
  }
}

- (void)_handleConnectionInterrupted
{
  self->_registrationNeeded = 1;
}

- (void)_throwIfNotLoaded:(SEL)a3
{
  if (!self->_hasLoaded)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3B8];
    id v7 = [(NTKComplicationCollection *)self collectionIdentifier];
    id v6 = NSStringFromSelector(a3);
    [v4 raise:v5, @"Attempt to modify complication collection (%@) before it has loaded (sel = %@)", v7, v6 format];
  }
}

- (void)_performOrEnqueueUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__NTKComplicationCollection__performOrEnqueueUpdate___block_invoke;
  v6[3] = &unk_1E62C2290;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __53__NTKComplicationCollection__performOrEnqueueUpdate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 80))
  {
    uint64_t v2 = *(void **)(v1 + 88);
    id v5 = (id)[*(id *)(a1 + 40) copy];
    uint64_t v3 = _Block_copy(v5);
    [v2 addObject:v3];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (NSUUID)deviceUUID
{
  return self->_deviceUUID;
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_updatesEnqueuedWhileSuspended, 0);
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_loadCallbacks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_complicationDescriptors, 0);
  objc_storeStrong((id *)&self->_localizeableSampleDataTemplates, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_seqId, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_22_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)lsSDKVersionForApplicationID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)lsSDKVersionForApplicationID:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Error acquiring application extension record with bundle id %@: %@");
}

+ (void)lsSDKVersionForApplicationID:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Error acquiring application record with bundle id %@: %@");
}

+ (void)_bundleForWatchKitAppID:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, a2, a3, "Couldn't fetch record for bundle %@ - %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end