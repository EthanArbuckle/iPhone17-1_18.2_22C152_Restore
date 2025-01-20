@interface PXUserDefaultsStandardDataSource
+ (PXUserDefaultsStandardDataSource)sharedInstance;
- (NSDate)currentDate;
- (PXUserDefaultsStandardDataSource)init;
- (id)_initAsSharedInstance;
- (id)persistedValueForKey:(id)a3;
- (void)setPersistedValue:(id)a3 forKey:(id)a4;
@end

@implementation PXUserDefaultsStandardDataSource

void __57__PXUserDefaultsStandardDataSource_persistedValueForKey___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)persistedValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__253825;
  v16 = __Block_byref_object_dispose__253826;
  id v17 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PXUserDefaultsStandardDataSource_persistedValueForKey___block_invoke;
  v9[3] = &unk_1E5DD0588;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (PXUserDefaultsStandardDataSource)sharedInstance
{
  if (sharedInstance_onceToken_253842 != -1) {
    dispatch_once(&sharedInstance_onceToken_253842, &__block_literal_global_205_253843);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance_253844;
  return (PXUserDefaultsStandardDataSource *)v2;
}

void __50__PXUserDefaultsStandardDataSource_sharedInstance__block_invoke()
{
  id v0 = [[PXUserDefaultsStandardDataSource alloc] _initAsSharedInstance];
  v1 = (void *)sharedInstance_sharedInstance_253844;
  sharedInstance_sharedInstance_253844 = (uint64_t)v0;
}

- (id)_initAsSharedInstance
{
  v7.receiver = self;
  v7.super_class = (Class)PXUserDefaultsStandardDataSource;
  uint64_t v2 = [(PXUserDefaultsStandardDataSource *)&v7 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.photos.userdefaults-datasource-queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setPersistedValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__PXUserDefaultsStandardDataSource_setPersistedValue_forKey___block_invoke;
  v11[3] = &unk_1E5DD32A8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);
}

void __61__PXUserDefaultsStandardDataSource_setPersistedValue_forKey___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

- (NSDate)currentDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] date];
}

- (PXUserDefaultsStandardDataSource)init
{
  dispatch_queue_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXUserDefaults.m", 307, @"%s is not available as initializer", "-[PXUserDefaultsStandardDataSource init]");

  abort();
}

@end