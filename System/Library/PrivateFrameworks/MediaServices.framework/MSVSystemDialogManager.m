@interface MSVSystemDialogManager
+ (id)sharedManager;
- (MSVSystemDialogManager)init;
- (id)systemDialogForUserNotification:(__CFUserNotification *)a3;
- (void)dealloc;
- (void)registerSystemDialog:(id)a3 forUserNotification:(__CFUserNotification *)a4;
- (void)unregisterSystemDialogWithUserNotification:(__CFUserNotification *)a3;
@end

@implementation MSVSystemDialogManager

- (void).cxx_destruct
{
}

- (void)unregisterSystemDialogWithUserNotification:(__CFUserNotification *)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__MSVSystemDialogManager_unregisterSystemDialogWithUserNotification___block_invoke;
  v4[3] = &unk_1E5ADA2F0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

void __69__MSVSystemDialogManager_unregisterSystemDialogWithUserNotification___block_invoke(uint64_t a1)
{
}

- (id)systemDialogForUserNotification:(__CFUserNotification *)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4087;
  v11 = __Block_byref_object_dispose__4088;
  id v12 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MSVSystemDialogManager_systemDialogForUserNotification___block_invoke;
  block[3] = &unk_1E5ADA990;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(serialQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __58__MSVSystemDialogManager_systemDialogForUserNotification___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 8), *(const void **)(a1 + 48));
  return MEMORY[0x1F41817F8]();
}

- (void)registerSystemDialog:(id)a3 forUserNotification:(__CFUserNotification *)a4
{
  id v6 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MSVSystemDialogManager_registerSystemDialog_forUserNotification___block_invoke;
  block[3] = &unk_1E5ADA2C8;
  id v10 = v6;
  v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(serialQueue, block);
}

void __67__MSVSystemDialogManager_registerSystemDialog_forUserNotification___block_invoke(uint64_t a1)
{
}

- (void)dealloc
{
  CFRelease(self->_registeredSystemDialogs);
  v3.receiver = self;
  v3.super_class = (Class)MSVSystemDialogManager;
  [(MSVSystemDialogManager *)&v3 dealloc];
}

- (MSVSystemDialogManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSVSystemDialogManager;
  v2 = [(MSVSystemDialogManager *)&v7 init];
  if (v2)
  {
    v2->_registeredSystemDialogs = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    ClassName = object_getClassName(v2);
    dispatch_queue_t v4 = dispatch_queue_create(ClassName, 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager___once != -1) {
    dispatch_once(&sharedManager___once, &__block_literal_global_4091);
  }
  v2 = (void *)sharedManager___sharedManager;
  return v2;
}

uint64_t __39__MSVSystemDialogManager_sharedManager__block_invoke()
{
  sharedManager___sharedManager = objc_alloc_init(MSVSystemDialogManager);
  return MEMORY[0x1F41817F8]();
}

@end