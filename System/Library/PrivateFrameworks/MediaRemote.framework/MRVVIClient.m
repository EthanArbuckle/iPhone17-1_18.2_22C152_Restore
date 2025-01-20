@interface MRVVIClient
+ (id)sharedClient;
- (MRVVIClient)init;
- (void)_recordingStateChangedNotification:(id)a3;
- (void)dealloc;
- (void)setRecordingStateCallback:(id)a3 forDeviceID:(unsigned int)a4;
@end

@implementation MRVVIClient

+ (id)sharedClient
{
  if (sharedClient___once != -1) {
    dispatch_once(&sharedClient___once, &__block_literal_global_95);
  }
  v2 = (void *)sharedClient___sharedClient;

  return v2;
}

uint64_t __27__MRVVIClient_sharedClient__block_invoke()
{
  v0 = objc_alloc_init(MRVVIClient);
  uint64_t v1 = sharedClient___sharedClient;
  sharedClient___sharedClient = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (MRVVIClient)init
{
  v10.receiver = self;
  v10.super_class = (Class)MRVVIClient;
  v2 = [(MRVVIClient *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceIDToCallbackMap = v2->_deviceIDToCallbackMap;
    v2->_deviceIDToCallbackMap = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MRVVIClient", v5);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel__recordingStateChangedNotification_ name:@"kMRVirtualVoiceInputRecordingStateDidChangeNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MRVVIClient;
  [(MRVVIClient *)&v4 dealloc];
}

- (void)setRecordingStateCallback:(id)a3 forDeviceID:(unsigned int)a4
{
  dispatch_queue_t v6 = (void *)[a3 copy];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MRVVIClient_setRecordingStateCallback_forDeviceID___block_invoke;
  block[3] = &unk_1E57D1DF0;
  block[4] = self;
  id v10 = v6;
  unsigned int v11 = a4;
  id v8 = v6;
  dispatch_sync(serialQueue, block);
}

void __53__MRVVIClient_setRecordingStateCallback_forDeviceID___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v5 = (id)MEMORY[0x1997190F0]();
    v2 = *(void **)(*(void *)(a1 + 32) + 8);
    v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
    [v2 setObject:v5 forKeyedSubscript:v3];
  }
  else
  {
    objc_super v4 = *(void **)(*(void *)(a1 + 32) + 8);
    id v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
    objc_msgSend(v4, "removeObjectForKey:");
  }
}

- (void)_recordingStateChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__41;
  v18 = __Block_byref_object_dispose__41;
  id v19 = 0;
  id v5 = [v4 userInfo];
  dispatch_queue_t v6 = [v5 objectForKey:@"kMRVirtualVoiceInputDeviceIDUserInfoKey"];

  if (v6)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__MRVVIClient__recordingStateChangedNotification___block_invoke;
    block[3] = &unk_1E57D1C88;
    v13 = &v14;
    block[4] = self;
    id v12 = v6;
    dispatch_sync(serialQueue, block);
  }
  if (v15[5])
  {
    id v8 = [v4 userInfo];
    v9 = [v8 objectForKey:@"kMRVirtualVoiceInputRecordingStateUserInfoKey"];
    uint64_t v10 = [v9 unsignedIntValue];

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15[5] + 16))(v15[5], [v6 unsignedIntValue], v10);
  }

  _Block_object_dispose(&v14, 8);
}

uint64_t __50__MRVVIClient__recordingStateChangedNotification___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_deviceIDToCallbackMap, 0);
}

@end