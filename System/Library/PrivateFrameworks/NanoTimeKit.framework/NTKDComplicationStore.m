@interface NTKDComplicationStore
+ (void)cleanupOrphanedStoresWithCurrentDeviceUUIDs:(id)a3;
- (BOOL)_queue_hasSampleTemplateForKey:(id)a3 family:(int64_t)a4;
- (BOOL)hasSampleTemplateForClientIdentifier:(id)a3 descriptor:(id)a4 family:(int64_t)a5;
- (NSString)collectionIdentifier;
- (NSUUID)deviceUUID;
- (NTKDComplicationStore)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4;
- (float)version;
- (id)_descriptorForKey:(id)a3;
- (id)_queue_complicationDescriptorsForClientIdentifier:(id)a3;
- (id)_queue_sampleDataForKey:(id)a3 family:(int64_t)a4;
- (id)_queue_sampleTemplateForKey:(id)a3 family:(int64_t)a4;
- (id)_queue_sampleTemplateReferenceForKey:(id)a3 family:(int64_t)a4;
- (id)clients;
- (id)complicationDescriptorsForClientIdentifier:(id)a3;
- (id)complicationSampleDataForClientID:(id)a3 descriptor:(id)a4 shouldInflate:(BOOL)a5;
- (id)sampleTemplateForClientIdentifier:(id)a3 descriptor:(id)a4 family:(int64_t)a5;
- (void)_enumerateAllKeysForClientID:(id)a3 usingBlock:(id)a4;
- (void)_faultInAllClientData;
- (void)_faultInComplicationDescriptorsForClientID:(id)a3;
- (void)_faultInSampleDataForKey:(id)a3;
- (void)_onObserverQueue_async:(id)a3;
- (void)_onQueue_async:(id)a3;
- (void)_queue_clearRemovalsThroughSeqId:(id)a3;
- (void)_queue_incrementSeqId;
- (void)_queue_loadFullCollectionForObserver:(id)a3;
- (void)_queue_notifyDidRemoveComplicationForKey:(id)a3 skipSyncObserver:(BOOL)a4;
- (void)_queue_notifyDidUpdateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4 skipSyncObserver:(BOOL)a5;
- (void)_queue_notifyDidUpdateSampleTemplateReference:(id)a3 forKey:(id)a4 family:(int64_t)a5 skipSyncObserver:(BOOL)a6;
- (void)_queue_playbackChangesForObserver:(id)a3 fromSeqId:(id)a4;
- (void)_removeComplicationForKey:(id)a3 skipSyncObserver:(BOOL)a4;
- (void)_setupObserver:(id)a3 withSeqId:(id)a4 reloadSeqId:(id)a5;
- (void)_updateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4 skipSyncObserver:(BOOL)a5;
- (void)_updateLocalizableSampleData:(id)a3 forKey:(id)a4 family:(int64_t)a5 template:(id)a6 skipSyncObserver:(BOOL)a7;
- (void)_updateLocalizableSampleData:(id)a3 forKey:(id)a4 skipSyncObserver:(BOOL)a5;
- (void)_updateLocalizableSampleDataTemplate:(id)a3 forKey:(id)a4 family:(int64_t)a5 skipSyncObserver:(BOOL)a6;
- (void)_validateManifestEntries;
- (void)addObserver:(id)a3 withSeqId:(id)a4;
- (void)clearSyncObserver;
- (void)removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setSyncObserver:(id)a3 withSeqId:(id)a4;
- (void)setVersion:(float)a3;
- (void)synchronize;
- (void)updateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4;
- (void)updateLocalizableSampleDataTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6;
- (void)withoutNotifyingSyncObserverRemoveComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4;
- (void)withoutNotifyingSyncObserverSetComplicationSampleData:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5;
- (void)withoutNotifyingUpdateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4;
- (void)withoutNotifyingUpdateLocalizableSampleDataTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6;
@end

@implementation NTKDComplicationStore

+ (void)cleanupOrphanedStoresWithCurrentDeviceUUIDs:(id)a3
{
  id v3 = a3;
  v4 = sub_1000288A8();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000288FC;
  block[3] = &unk_100060A90;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

- (NTKDComplicationStore)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)NTKDComplicationStore;
  v8 = [(NTKDComplicationStore *)&v46 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    collectionIdentifier = v8->_collectionIdentifier;
    v8->_collectionIdentifier = v9;

    objc_storeStrong((id *)&v8->_deviceUUID, a4);
    id v11 = +[NSString stringWithFormat:@"com.apple.ntkd.complicationstore.%p", v8];
    v12 = (const char *)[v11 UTF8String];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v14;

    v16 = +[NSString stringWithFormat:@"com.apple.ntkd.complicationstore.observercallback.%p", v8];

    id v17 = v16;
    v18 = (const char *)[v17 UTF8String];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    observerCallbackQueue = v8->_observerCallbackQueue;
    v8->_observerCallbackQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = +[NSHashTable weakObjectsHashTable];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v22;

    uint64_t v24 = +[NSMutableDictionary dictionary];
    clientToSampleData = v8->_clientToSampleData;
    v8->_clientToSampleData = (NSMutableDictionary *)v24;

    v8->_clientToSampleDataLock._os_unfair_lock_opaque = 0;
    uint64_t v26 = +[NSMutableDictionary dictionary];
    clientIDtoComplicationDescriptors = v8->_clientIDtoComplicationDescriptors;
    v8->_clientIDtoComplicationDescriptors = (NSMutableDictionary *)v26;

    v8->_clientIDtoComplicationDescriptorsLock._os_unfair_lock_opaque = 0;
    uint64_t v28 = sub_100028F80(v8->_collectionIdentifier, v8->_deviceUUID);
    storeDirectory = v8->_storeDirectory;
    v8->_storeDirectory = (NSString *)v28;

    v30 = sub_1000288A8();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028FFC;
    block[3] = &unk_100060A90;
    v31 = v8;
    v45 = v31;
    dispatch_sync(v30, block);

    v32 = [[NTKDComplicationStoreComplicationDescriptorMigrator alloc] initWithCollectionIdentifier:v8->_collectionIdentifier deviceUUID:v8->_deviceUUID];
    [(NTKDComplicationStoreComplicationDescriptorMigrator *)v32 run];
    v33 = [(NSString *)v8->_storeDirectory stringByAppendingPathComponent:@"sequence-id.string"];
    uint64_t v34 = sub_10001BEB4((uint64_t)v33);
    seqId = v31->_seqId;
    v31->_seqId = (NSNumber *)v34;

    v36 = [(NSString *)v8->_storeDirectory stringByAppendingPathComponent:@"reset-sequence-id.string"];
    uint64_t v37 = sub_10001BEB4((uint64_t)v36);
    resetSeqId = v31->_resetSeqId;
    v31->_resetSeqId = (NSNumber *)v37;

    uint64_t v39 = sub_1000290F8(v8->_storeDirectory);
    manifest = v31->_manifest;
    v31->_manifest = (_NTKDComplicationCollectionManifest *)v39;

    uint64_t v41 = sub_10002919C(v8->_storeDirectory);
    removals = v31->_removals;
    v31->_removals = (NSMutableDictionary *)v41;

    [(NTKDComplicationStore *)v31 _validateManifestEntries];
    [(NTKDComplicationStore *)v31 _faultInAllClientData];
  }
  return v8;
}

- (void)_validateManifestEntries
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(_NTKDComplicationCollectionManifest *)self->_manifest clientIds];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000294DC;
  v5[3] = &unk_100061E30;
  v5[4] = self;
  v5[5] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];

  if (*((unsigned char *)v7 + 24))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100029A70;
    v4[3] = &unk_100060A90;
    v4[4] = self;
    [(NTKDComplicationStore *)self _onQueue_async:v4];
  }
  _Block_object_dispose(&v6, 8);
}

- (void)_faultInAllClientData
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(_NTKDComplicationCollectionManifest *)self->_manifest clientIds];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        [(NTKDComplicationStore *)self _faultInComplicationDescriptorsForClientID:v8];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100029D70;
        v9[3] = &unk_100061E58;
        v9[4] = self;
        [(NTKDComplicationStore *)self _enumerateAllKeysForClientID:v8 usingBlock:v9];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_faultInSampleDataForKey:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientToSampleDataLock);
  id v5 = [(NSMutableDictionary *)self->_clientToSampleData objectForKeyedSubscript:v4];
  if (!v5)
  {
    uint64_t v6 = [(_NTKDComplicationCollectionManifest *)self->_manifest familiesWithSampleTemplateForKey:v4];
    id v5 = [objc_alloc((Class)NTKComplicationSampleData) initWithSupportedFamilies:v6];
    [(NSMutableDictionary *)self->_clientToSampleData setObject:v5 forKey:v4];
  }
  os_unfair_lock_unlock(&self->_clientToSampleDataLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = objc_msgSend(v5, "supportedFamilies", 0);
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) integerValue];
        long long v13 = [v5 templatePathForFamily:v12];
        if (!v13)
        {
          long long v13 = sub_100029F48(self->_storeDirectory, v4);
          if (v13) {
            [v5 setTemplatePath:v13 forFamily:v12];
          }
        }

        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_faultInComplicationDescriptorsForClientID:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  uint64_t v6 = [(_NTKDComplicationCollectionManifest *)self->_manifest complicationDescriptorIdentifiersForClientIdentifier:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = sub_100029734(self->_storeDirectory, v4, *(void **)(*((void *)&v15 + 1) + 8 * (void)v10));
        if (v11) {
          [v5 addObject:v11];
        }

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  p_clientIDtoComplicationDescriptorsLock = &self->_clientIDtoComplicationDescriptorsLock;
  os_unfair_lock_lock(&self->_clientIDtoComplicationDescriptorsLock);
  clientIDtoComplicationDescriptors = self->_clientIDtoComplicationDescriptors;
  id v14 = [v5 copy];
  [(NSMutableDictionary *)clientIDtoComplicationDescriptors setObject:v14 forKey:v4];

  os_unfair_lock_unlock(p_clientIDtoComplicationDescriptorsLock);
}

- (void)_enumerateAllKeysForClientID:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  os_unfair_lock_lock(&self->_clientIDtoComplicationDescriptorsLock);
  id v8 = [(NSMutableDictionary *)self->_clientIDtoComplicationDescriptors objectForKeyedSubscript:v6];
  id v9 = [v8 copy];

  os_unfair_lock_unlock(&self->_clientIDtoComplicationDescriptorsLock);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002A320;
  v17[3] = &unk_100061E80;
  id v10 = v6;
  id v18 = v10;
  id v11 = v7;
  id v19 = v11;
  dispatch_queue_t v20 = &v21;
  [v9 enumerateObjectsUsingBlock:v17];
  if (!*((unsigned char *)v22 + 24))
  {
    id v12 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:v10 complicationIdentifier:CLKDefaultComplicationIdentifier];
    long long v13 = [(_NTKDComplicationCollectionManifest *)self->_manifest familiesWithSampleTemplateForKey:v12];
    if (v13)
    {
      id v14 = objc_alloc((Class)NTKComplicationKey);
      long long v15 = +[CLKComplicationDescriptor legacyComplicationDescriptorWithSupportedFamilies:v13];
      id v16 = [v14 initWithClientIdentifier:v10 descriptor:v15];

      (*((void (**)(id, id))v11 + 2))(v11, v16);
    }
  }
  _Block_object_dispose(&v21, 8);
}

- (id)complicationSampleDataForClientID:(id)a3 descriptor:(id)a4 shouldInflate:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    id v8 = a4;
    id v9 = a3;
    id v10 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:v9 descriptor:v8];

    [(NTKDComplicationStore *)self _faultInSampleDataForKey:v10];
    p_clientToSampleDataLock = &self->_clientToSampleDataLock;
    os_unfair_lock_lock(&self->_clientToSampleDataLock);
    id v12 = [(NSMutableDictionary *)self->_clientToSampleData objectForKeyedSubscript:v10];
    long long v13 = v12;
    if (v5)
    {
      uint64_t v14 = [v12 inflatedCopy];

      long long v13 = (void *)v14;
    }
    os_unfair_lock_unlock(p_clientToSampleDataLock);
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (void)addObserver:(id)a3 withSeqId:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A584;
  v7[3] = &unk_100060C58;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NTKDComplicationStore *)v8 _onQueue_async:v7];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A6E8;
  v7[3] = &unk_100060AB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)setSyncObserver:(id)a3 withSeqId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A7B8;
  block[3] = &unk_100060C58;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (void)_setupObserver:(id)a3 withSeqId:(id)a4 reloadSeqId:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8) {
    goto LABEL_4;
  }
  if ([v8 isEqual:self->_seqId]) {
    goto LABEL_6;
  }
  if (!sub_10001C0DC(v8, v9)) {
    [(NTKDComplicationStore *)self _queue_playbackChangesForObserver:v10 fromSeqId:v8];
  }
  else {
LABEL_4:
  }
    [(NTKDComplicationStore *)self _queue_loadFullCollectionForObserver:v10];
LABEL_6:
}

- (void)clearSyncObserver
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A930;
  block[3] = &unk_100060A90;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (float)version
{
  uint64_t v6 = 0;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002A9EC;
  v5[3] = &unk_100061898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setVersion:(float)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002AB08;
  v3[3] = &unk_100061900;
  v3[4] = self;
  float v4 = a3;
  [(NTKDComplicationStore *)self _onQueue_async:v3];
}

- (id)clients
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = sub_10002ACB4;
  id v10 = sub_10002ACC4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002ACCC;
  v5[3] = &unk_100061898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)sampleTemplateForClientIdentifier:(id)a3 descriptor:(id)a4 family:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:v9 descriptor:v8];

  uint64_t v19 = 0;
  dispatch_queue_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_10002ACB4;
  uint64_t v23 = sub_10002ACC4;
  id v24 = 0;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002AE90;
  v15[3] = &unk_100061EA8;
  v15[4] = self;
  id v16 = v10;
  long long v17 = &v19;
  int64_t v18 = a5;
  id v12 = v10;
  dispatch_sync(queue, v15);
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v13;
}

- (BOOL)hasSampleTemplateForClientIdentifier:(id)a3 descriptor:(id)a4 family:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:v9 descriptor:v8];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002B014;
  v14[3] = &unk_100061EA8;
  v14[4] = self;
  id v15 = v10;
  id v16 = &v18;
  int64_t v17 = a5;
  id v12 = v10;
  dispatch_sync(queue, v14);
  LOBYTE(queue) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)queue;
}

- (id)complicationDescriptorsForClientIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10002ACB4;
  id v16 = sub_10002ACC4;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B160;
  block[3] = &unk_100061950;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)updateLocalizableSampleDataTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:v11 descriptor:v10];

  [(NTKDComplicationStore *)self _updateLocalizableSampleDataTemplate:v12 forKey:v13 family:a6 skipSyncObserver:0];
}

- (void)updateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4
{
}

- (void)removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:v7 descriptor:v6];

  [(NTKDComplicationStore *)self _removeComplicationForKey:v8 skipSyncObserver:0];
}

- (void)withoutNotifyingSyncObserverSetComplicationSampleData:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:v9 descriptor:v8];

  if (v11 && v9) {
    [(NTKDComplicationStore *)self _updateLocalizableSampleData:v11 forKey:v10 skipSyncObserver:1];
  }
}

- (void)withoutNotifyingUpdateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4
{
}

- (void)withoutNotifyingUpdateLocalizableSampleDataTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:v11 descriptor:v10];

  [(NTKDComplicationStore *)self _updateLocalizableSampleDataTemplate:v12 forKey:v13 family:a6 skipSyncObserver:1];
}

- (void)withoutNotifyingSyncObserverRemoveComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:v7 descriptor:v6];

  [(NTKDComplicationStore *)self _removeComplicationForKey:v8 skipSyncObserver:1];
}

- (void)_updateLocalizableSampleData:(id)a3 forKey:(id)a4 skipSyncObserver:(BOOL)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002B5E0;
  v10[3] = &unk_1000619A0;
  id v11 = a3;
  id v12 = self;
  id v13 = a4;
  BOOL v14 = a5;
  id v8 = v13;
  id v9 = v11;
  [(NTKDComplicationStore *)self _onQueue_async:v10];
}

- (void)_updateLocalizableSampleData:(id)a3 forKey:(id)a4 family:(int64_t)a5 template:(id)a6 skipSyncObserver:(BOOL)a7
{
  id v12 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002C204;
  v16[3] = &unk_100061ED0;
  v16[4] = self;
  id v17 = a4;
  id v19 = a6;
  int64_t v20 = a5;
  id v18 = v12;
  BOOL v21 = a7;
  id v13 = v19;
  id v14 = v12;
  id v15 = v17;
  [(NTKDComplicationStore *)self _onQueue_async:v16];
}

- (void)_updateLocalizableSampleDataTemplate:(id)a3 forKey:(id)a4 family:(int64_t)a5 skipSyncObserver:(BOOL)a6
{
  BOOL v6 = a6;
  id v12 = a4;
  id v10 = a3;
  os_unfair_lock_lock(&self->_clientToSampleDataLock);
  id v11 = [(NSMutableDictionary *)self->_clientToSampleData objectForKey:v12];
  if (!v11)
  {
    id v11 = [objc_alloc((Class)NTKComplicationSampleData) initWithSupportedFamilies:&__NSArray0__struct];
    [(NSMutableDictionary *)self->_clientToSampleData setObject:v11 forKey:v12];
  }
  os_unfair_lock_unlock(&self->_clientToSampleDataLock);
  [v11 setTemplate:v10 forFamily:a5];
  [(NTKDComplicationStore *)self _updateLocalizableSampleData:v11 forKey:v12 family:a5 template:v10 skipSyncObserver:v6];
}

- (void)_updateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4 skipSyncObserver:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 copy];
  os_unfair_lock_lock(&self->_clientIDtoComplicationDescriptorsLock);
  clientIDtoComplicationDescriptors = self->_clientIDtoComplicationDescriptors;
  if (v10) {
    [(NSMutableDictionary *)clientIDtoComplicationDescriptors setObject:v10 forKey:v9];
  }
  else {
    [(NSMutableDictionary *)clientIDtoComplicationDescriptors removeObjectForKey:v9];
  }
  os_unfair_lock_unlock(&self->_clientIDtoComplicationDescriptorsLock);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002C740;
  v15[3] = &unk_100061BD0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  BOOL v19 = a5;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  [(NTKDComplicationStore *)self _onQueue_async:v15];
}

- (void)_removeComplicationForKey:(id)a3 skipSyncObserver:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002CE20;
  v6[3] = &unk_100061118;
  id v7 = self;
  id v8 = a3;
  BOOL v9 = a4;
  id v5 = v8;
  [(NTKDComplicationStore *)v7 _onQueue_async:v6];
}

- (id)_descriptorForKey:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientIDtoComplicationDescriptorsLock);
  clientIDtoComplicationDescriptors = self->_clientIDtoComplicationDescriptors;
  BOOL v6 = [v4 clientIdentifier];
  id v7 = [(NSMutableDictionary *)clientIDtoComplicationDescriptors objectForKeyedSubscript:v6];
  id v8 = [v7 count];

  os_unfair_lock_unlock(&self->_clientIDtoComplicationDescriptorsLock);
  if (!v8)
  {
    BOOL v9 = [v4 clientIdentifier];
    [(NTKDComplicationStore *)self _faultInComplicationDescriptorsForClientID:v9];
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_10002ACB4;
  v33 = sub_10002ACC4;
  id v34 = 0;
  id v10 = [v4 clientIdentifier];
  id v11 = [(NTKDComplicationStore *)self complicationDescriptorsForClientIdentifier:v10];
  uint64_t v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_10002D490;
  uint64_t v26 = &unk_100061EF8;
  id v12 = v4;
  id v27 = v12;
  uint64_t v28 = &v29;
  [v11 enumerateObjectsUsingBlock:&v23];

  id v13 = (void *)v30[5];
  if (!v13)
  {
    p_clientToSampleDataLock = &self->_clientToSampleDataLock;
    os_unfair_lock_lock(&self->_clientToSampleDataLock);
    id v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_clientToSampleData, "objectForKeyedSubscript:", v12, v23, v24, v25, v26);
    os_unfair_lock_unlock(p_clientToSampleDataLock);
    id v16 = [v15 supportedFamilies];
    id v17 = objc_alloc((Class)CLKComplicationDescriptor);
    id v18 = [v12 complicationIdentifier];
    id v19 = [v17 initWithIdentifier:v18 displayName:&stru_100062B50 supportedFamilies:v16];
    int64_t v20 = (void *)v30[5];
    v30[5] = (uint64_t)v19;

    id v13 = (void *)v30[5];
  }
  id v21 = v13;

  _Block_object_dispose(&v29, 8);

  return v21;
}

- (void)synchronize
{
}

- (void)_onQueue_async:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.complicationstore.asyncwork");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D5FC;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)_onObserverQueue_async:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.complicationstore.asyncobservercallback");
  observerCallbackQueue = self->_observerCallbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D6E0;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerCallbackQueue, block);
}

- (void)_queue_incrementSeqId
{
  id v3 = +[NSNumber numberWithUnsignedInteger:(char *)[(NSNumber *)self->_seqId unsignedIntegerValue] + 1];
  seqId = self->_seqId;
  self->_seqId = v3;

  id v5 = self->_seqId;
  id v6 = [(NSString *)self->_storeDirectory stringByAppendingPathComponent:@"sequence-id.string"];
  sub_10001E86C((uint64_t)v5, v6);
}

- (id)_queue_sampleDataForKey:(id)a3 family:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    os_unfair_lock_lock(&self->_clientToSampleDataLock);
    id v7 = [(NSMutableDictionary *)self->_clientToSampleData objectForKeyedSubscript:v6];
    uint64_t v8 = [v7 templatePathForFamily:a4];
    if (v8)
    {
      BOOL v9 = (void *)v8;
    }
    else
    {
      BOOL v9 = sub_100029F48(self->_storeDirectory, v6);
      if (v9)
      {
        if (!v7)
        {
          id v10 = [(_NTKDComplicationCollectionManifest *)self->_manifest familiesWithSampleTemplateForKey:v6];
          id v7 = [objc_alloc((Class)NTKComplicationSampleData) initWithSupportedFamilies:v10];
          [(NSMutableDictionary *)self->_clientToSampleData setObject:v7 forKey:v6];
        }
        [v7 setTemplatePath:v9 forFamily:a4];
      }
    }
    os_unfair_lock_unlock(&self->_clientToSampleDataLock);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_queue_sampleTemplateForKey:(id)a3 family:(int64_t)a4
{
  id v5 = -[NTKDComplicationStore _queue_sampleDataForKey:family:](self, "_queue_sampleDataForKey:family:", a3);
  id v6 = [v5 templateForFamily:a4];

  return v6;
}

- (id)_queue_sampleTemplateReferenceForKey:(id)a3 family:(int64_t)a4
{
  id v5 = -[NTKDComplicationStore _queue_sampleDataForKey:family:](self, "_queue_sampleDataForKey:family:", a3);
  id v6 = [v5 templateReferenceForFamily:a4];

  return v6;
}

- (BOOL)_queue_hasSampleTemplateForKey:(id)a3 family:(int64_t)a4
{
  if (!a3) {
    return 0;
  }
  p_clientToSampleDataLock = &self->_clientToSampleDataLock;
  id v7 = a3;
  os_unfair_lock_lock(p_clientToSampleDataLock);
  uint64_t v8 = [(NSMutableDictionary *)self->_clientToSampleData objectForKeyedSubscript:v7];

  LOBYTE(a4) = [v8 hasTemplateForFamily:a4];
  os_unfair_lock_unlock(p_clientToSampleDataLock);

  return a4;
}

- (id)_queue_complicationDescriptorsForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_clientIDtoComplicationDescriptorsLock);
    id v5 = [(NSMutableDictionary *)self->_clientIDtoComplicationDescriptors objectForKeyedSubscript:v4];
    os_unfair_lock_unlock(&self->_clientIDtoComplicationDescriptorsLock);
    if (!v5)
    {
      [(NTKDComplicationStore *)self _faultInComplicationDescriptorsForClientID:v4];
      os_unfair_lock_lock(&self->_clientIDtoComplicationDescriptorsLock);
      id v5 = [(NSMutableDictionary *)self->_clientIDtoComplicationDescriptors objectForKeyedSubscript:v4];
      os_unfair_lock_unlock(&self->_clientIDtoComplicationDescriptorsLock);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_queue_clearRemovalsThroughSeqId:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  removals = self->_removals;
  BOOL v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_10002DB94;
  id v12 = &unk_100061F40;
  id v7 = v4;
  id v13 = v7;
  id v8 = v5;
  id v14 = v8;
  [(NSMutableDictionary *)removals enumerateKeysAndObjectsUsingBlock:&v9];
  if (objc_msgSend(v8, "count", v9, v10, v11, v12))
  {
    [(NSMutableDictionary *)self->_removals removeObjectsForKeys:v8];
    sub_10002D12C(self->_storeDirectory, self->_removals);
  }
}

- (void)_queue_playbackChangesForObserver:(id)a3 fromSeqId:(id)a4
{
  id v34 = a3;
  id v6 = a4;
  +[NSMutableDictionary dictionary];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10002E0F4;
  v59[3] = &unk_100061AB0;
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  id v60 = v29;
  id v7 = objc_retainBlock(v59);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = [(_NTKDComplicationCollectionManifest *)self->_manifest clientIds];
  id v32 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v56;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v56 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v8;
        BOOL v9 = *(void **)(*((void *)&v55 + 1) + 8 * v8);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        uint64_t v10 = [(_NTKDComplicationCollectionManifest *)self->_manifest complicationDescriptorIdentifiersForClientIdentifier:v9];
        id v11 = [v10 countByEnumeratingWithState:&v51 objects:v62 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v52;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v52 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = sub_10002CD30(self->_storeDirectory, v9, *(void **)(*((void *)&v51 + 1) + 8 * i));
              id v16 = sub_10001BEB4((uint64_t)v15);

              if (v16 && sub_10001C0DC(v6, v16))
              {
                v48[0] = _NSConcreteStackBlock;
                v48[1] = 3221225472;
                v48[2] = sub_10002E170;
                v48[3] = &unk_1000610F0;
                v48[4] = self;
                v48[5] = v9;
                id v49 = v34;
                id v50 = v16;
                ((void (*)(void *, id, void *))v7[2])(v7, v50, v48);
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v51 objects:v62 count:16];
          }
          while (v12);
        }

        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_10002E26C;
        v44[3] = &unk_100061F90;
        v44[4] = self;
        id v45 = v6;
        v47 = v7;
        id v46 = v34;
        [(NTKDComplicationStore *)self _enumerateAllKeysForClientID:v9 usingBlock:v44];

        uint64_t v8 = v33 + 1;
      }
      while ((id)(v33 + 1) != v32);
      id v32 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v32);
  }

  removals = self->_removals;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10002E60C;
  v39[3] = &unk_100061FB8;
  id v18 = v6;
  id v40 = v18;
  id v19 = v7;
  id v43 = v19;
  uint64_t v41 = self;
  id v20 = v34;
  id v42 = v20;
  [(NSMutableDictionary *)removals enumerateKeysAndObjectsUsingBlock:v39];
  id v21 = [v29 allKeys];
  uint64_t v22 = [v21 sortedArrayUsingComparator:&stru_100061FD8];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v23 = v22;
  id v24 = [v23 countByEnumeratingWithState:&v35 objects:v61 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = [v29 objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * (void)j)];
        v28[2]();
      }
      id v25 = [v23 countByEnumeratingWithState:&v35 objects:v61 count:16];
    }
    while (v25);
  }
}

- (void)_queue_loadFullCollectionForObserver:(id)a3
{
  id v4 = a3;
  id v5 = self->_seqId;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002E928;
  v8[3] = &unk_100060C58;
  v8[4] = self;
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [(NTKDComplicationStore *)self _onObserverQueue_async:v8];
}

- (void)_queue_notifyDidUpdateSampleTemplateReference:(id)a3 forKey:(id)a4 family:(int64_t)a5 skipSyncObserver:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = self->_seqId;
  uint64_t v13 = self->_syncObserver;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10002EC48;
  v33[3] = &unk_100062000;
  BOOL v40 = a6;
  uint64_t v22 = v13;
  id v34 = v22;
  long long v35 = self;
  id v14 = v12;
  long long v36 = v14;
  id v15 = v10;
  id v37 = v15;
  id v16 = v11;
  id v38 = v16;
  int64_t v39 = a5;
  [(NTKDComplicationStore *)self _onObserverQueue_async:v33];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = self->_observers;
  id v17 = [(NSHashTable *)obj countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v20);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10002ED1C;
        v24[3] = &unk_100061C48;
        v24[4] = v21;
        v24[5] = self;
        id v25 = v15;
        id v26 = v16;
        int64_t v28 = a5;
        id v27 = v14;
        -[NTKDComplicationStore _onObserverQueue_async:](self, "_onObserverQueue_async:", v24, v22);

        id v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [(NSHashTable *)obj countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v18);
  }
}

- (void)_queue_notifyDidUpdateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4 skipSyncObserver:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self->_seqId;
  id v11 = self->_syncObserver;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10002F018;
  v30[3] = &unk_100061BF8;
  BOOL v36 = a5;
  id v20 = v11;
  long long v31 = v20;
  long long v32 = self;
  id v12 = v10;
  uint64_t v33 = v12;
  id v13 = v8;
  id v34 = v13;
  id v14 = v9;
  id v35 = v14;
  [(NTKDComplicationStore *)self _onObserverQueue_async:v30];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = self->_observers;
  id v15 = [(NSHashTable *)obj countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v18);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10002F040;
        v22[3] = &unk_100061190;
        v22[4] = v19;
        v22[5] = self;
        id v23 = v13;
        id v24 = v14;
        id v25 = v12;
        [(NTKDComplicationStore *)self _onObserverQueue_async:v22];

        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSHashTable *)obj countByEnumeratingWithState:&v26 objects:v37 count:16];
    }
    while (v16);
  }
}

- (void)_queue_notifyDidRemoveComplicationForKey:(id)a3 skipSyncObserver:(BOOL)a4
{
  id v6 = a3;
  id v7 = self->_seqId;
  id v8 = self->_syncObserver;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002F284;
  v25[3] = &unk_100061BD0;
  BOOL v30 = a4;
  uint64_t v17 = v8;
  long long v26 = v17;
  long long v27 = self;
  id v9 = v7;
  long long v28 = v9;
  id v10 = v6;
  id v29 = v10;
  [(NTKDComplicationStore *)self _onObserverQueue_async:v25];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = self->_observers;
  id v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v15);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10002F344;
        v18[3] = &unk_1000610F0;
        v18[4] = v16;
        v18[5] = self;
        id v19 = v10;
        id v20 = v9;
        [(NTKDComplicationStore *)self _onObserverQueue_async:v18];

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSHashTable *)v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v13);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_removals, 0);
  objc_storeStrong((id *)&self->_clientIDtoComplicationDescriptors, 0);
  objc_storeStrong((id *)&self->_clientToSampleData, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_observerCallbackQueue, 0);
  objc_storeStrong((id *)&self->_syncObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_resetSeqId, 0);
  objc_storeStrong((id *)&self->_seqId, 0);
  objc_storeStrong((id *)&self->_storeDirectory, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end