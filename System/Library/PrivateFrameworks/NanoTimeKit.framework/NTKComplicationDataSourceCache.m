@interface NTKComplicationDataSourceCache
+ (NTKComplicationDataSourceCache)sharedInstance;
- (Class)_dataSourceClassForComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5;
- (Class)dataSourceClassForComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5;
- (NTKComplicationDataSourceCache)init;
- (void)_invalidateCache;
- (void)dealloc;
@end

@implementation NTKComplicationDataSourceCache

+ (NTKComplicationDataSourceCache)sharedInstance
{
  if (sharedInstance_onceToken_15 != -1) {
    dispatch_once(&sharedInstance_onceToken_15, &__block_literal_global_114);
  }
  v2 = (void *)sharedInstance_instance_1;
  return (NTKComplicationDataSourceCache *)v2;
}

void __48__NTKComplicationDataSourceCache_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = v0;
}

- (NTKComplicationDataSourceCache)init
{
  v13.receiver = self;
  v13.super_class = (Class)NTKComplicationDataSourceCache;
  v2 = [(NTKComplicationDataSourceCache *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    lock_cache = v3->_lock_cache;
    v3->_lock_cache = (NSMutableDictionary *)v4;

    objc_initWeak(&location, v3);
    v6 = (const char *)[(id)*MEMORY[0x1E4F79ED0] UTF8String];
    v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__NTKComplicationDataSourceCache_init__block_invoke;
    v10[3] = &unk_1E62C0DD0;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch(v6, &v3->_capabilitiesChangedNotificationToken, v7, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __38__NTKComplicationDataSourceCache_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateCache];
}

- (void)dealloc
{
  notify_cancel(self->_capabilitiesChangedNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)NTKComplicationDataSourceCache;
  [(NTKComplicationDataSourceCache *)&v3 dealloc];
}

- (Class)dataSourceClassForComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v8 = a5;
  v9 = objc_opt_new();
  v10 = [v8 nrDeviceUUID];
  [v9 setNrDeviceUUID:v10];

  [v9 setComplicationType:a3];
  [v9 setComplicationFamily:a4];
  os_unfair_lock_lock(&self->_lock);
  id v11 = [(NSMutableDictionary *)self->_lock_cache objectForKeyedSubscript:v9];
  os_unfair_lock_unlock(&self->_lock);
  if (v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
    char v13 = [v11 isEqual:v12];

    v14 = (objc_class *)v11;
    if (v13)
    {
      v15 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v14 = [(NTKComplicationDataSourceCache *)self _dataSourceClassForComplicationType:a3 family:a4 forDevice:v8];
    os_unfair_lock_lock(&self->_lock);
    if (v14)
    {
      [(NSMutableDictionary *)self->_lock_cache setObject:v14 forKeyedSubscript:v9];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [(NSMutableDictionary *)self->_lock_cache setObject:v16 forKeyedSubscript:v9];
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  v15 = v14;
LABEL_9:

  return v15;
}

- (void)_invalidateCache
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_lock_cache removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (Class)_dataSourceClassForComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  if (_dataSourceClassForComplicationType_family_forDevice__onceToken != -1) {
    dispatch_once(&_dataSourceClassForComplicationType_family_forDevice__onceToken, &__block_literal_global_45);
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  id v8 = +[NTKBundleComplicationManager sharedManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__NTKComplicationDataSourceCache__dataSourceClassForComplicationType_family_forDevice___block_invoke_2;
  v20[3] = &unk_1E62C6650;
  v20[4] = &v21;
  v20[5] = a3;
  [v8 enumerateBundlesForComplicationFamily:a4 device:v7 withBlock:v20];

  if (*((unsigned char *)v22 + 24))
  {
    id v9 = 0;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = (id)_dataSourceClassForComplicationType_family_forDevice____dataSourceClasses;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
LABEL_7:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        if (objc_msgSend(v14, "acceptsComplicationType:withFamily:forDevice:", a3, a4, v7, (void)v16)) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v25 count:16];
          if (v11) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      v14 = 0;
    }

    id v9 = v14;
  }
  _Block_object_dispose(&v21, 8);

  return (Class)v9;
}

void __87__NTKComplicationDataSourceCache__dataSourceClassForComplicationType_family_forDevice___block_invoke()
{
  v2[10] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:10];
  v1 = (void *)_dataSourceClassForComplicationType_family_forDevice____dataSourceClasses;
  _dataSourceClassForComplicationType_family_forDevice____dataSourceClasses = v0;
}

void __87__NTKComplicationDataSourceCache__dataSourceClassForComplicationType_family_forDevice___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, unsigned char *a5)
{
  id v12 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v10 && [v10 integerValue] == *(void *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (void).cxx_destruct
{
}

@end