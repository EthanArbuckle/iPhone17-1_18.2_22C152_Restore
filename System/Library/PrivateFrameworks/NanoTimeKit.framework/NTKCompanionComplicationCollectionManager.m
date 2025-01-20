@interface NTKCompanionComplicationCollectionManager
+ (id)sharedBundleComplicationCollectionForDevice:(id)a3;
+ (id)sharedComplicationCollectionForDevice:(id)a3;
+ (id)sharedComplicationCollectionWithIdentifier:(id)a3 forDevice:(id)a4;
+ (id)sharedWidgetComplicationCollectionForDevice:(id)a3;
@end

@implementation NTKCompanionComplicationCollectionManager

+ (id)sharedComplicationCollectionWithIdentifier:(id)a3 forDevice:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (sharedComplicationCollectionWithIdentifier_forDevice__onceToken != -1) {
    dispatch_once(&sharedComplicationCollectionWithIdentifier_forDevice__onceToken, &__block_literal_global_146);
  }
  v7 = [v6 nrDeviceUUID];
  if (v7)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sharedComplicationCollectionWithIdentifier_forDevice__lock);
    v8 = [MEMORY[0x1E4F19A30] currentDevice];
    v9 = [v8 nrDeviceUUID];
    int v10 = [v7 isEqual:v9];

    v11 = [(id)sharedComplicationCollectionWithIdentifier_forDevice__collectionsByDeviceUUID objectForKey:v7];
    if (!v11)
    {
      v11 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      [(id)sharedComplicationCollectionWithIdentifier_forDevice__collectionsByDeviceUUID setObject:v11 forKey:v7];
    }
    if (v7 == (void *)sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceUUID) {
      int v12 = 0;
    }
    else {
      int v12 = v10;
    }
    if (v12 == 1)
    {
      int v22 = v10;
      id v23 = v6;
      objc_storeStrong((id *)&sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceUUID, v7);
      [(id)sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceCollections removeAllObjects];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v13 = [v11 keyEnumerator];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            v19 = [v11 objectForKey:v18];
            [(id)sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceCollections setObject:v19 forKey:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v15);
      }

      id v6 = v23;
      int v10 = v22;
    }
    v20 = [v11 objectForKey:v5];
    if (!v20)
    {
      v20 = [[NTKComplicationCollection alloc] initWithCollectionIdentifier:v5 deviceUUID:v7];
      [v11 setObject:v20 forKey:v5];
      if (v10) {
        [(id)sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceCollections setObject:v20 forKey:v5];
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sharedComplicationCollectionWithIdentifier_forDevice__lock);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)sharedComplicationCollectionForDevice:(id)a3
{
  return (id)[a1 sharedComplicationCollectionWithIdentifier:@"RemoteComplicationsV2" forDevice:a3];
}

+ (id)sharedBundleComplicationCollectionForDevice:(id)a3
{
  return (id)[a1 sharedComplicationCollectionWithIdentifier:@"BundleComplications" forDevice:a3];
}

void __98__NTKCompanionComplicationCollectionManager_sharedComplicationCollectionWithIdentifier_forDevice___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedComplicationCollectionWithIdentifier_forDevice__collectionsByDeviceUUID;
  sharedComplicationCollectionWithIdentifier_forDevice__collectionsByDeviceUUID = v0;

  uint64_t v2 = objc_opt_new();
  v3 = (void *)sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceCollections;
  sharedComplicationCollectionWithIdentifier_forDevice__activeDeviceCollections = v2;
}

+ (id)sharedWidgetComplicationCollectionForDevice:(id)a3
{
  return (id)[a1 sharedComplicationCollectionWithIdentifier:@"WidgetComplications" forDevice:a3];
}

@end