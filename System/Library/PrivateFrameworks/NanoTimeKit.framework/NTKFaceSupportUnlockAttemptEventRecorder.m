@interface NTKFaceSupportUnlockAttemptEventRecorder
+ (id)eventRecorder;
+ (id)sharedRecorder;
- (NSMapTable)lookup;
- (OS_dispatch_queue)queue;
- (id)_init;
- (id)_validateIdentifier:(id)a3;
- (void)_queue_beginRecordingForIdentifier:(id)a3 method:(unint64_t)a4 completion:(id)a5;
- (void)_queue_endRecordingForIdentifier:(id)a3 status:(unint64_t)a4 errorCode:(int64_t)a5 completion:(id)a6;
- (void)beginRecordingForIdentifier:(id)a3 method:(unint64_t)a4 completion:(id)a5;
- (void)endRecordingForIdentifier:(id)a3 status:(unint64_t)a4 errorCode:(int64_t)a5 completion:(id)a6;
@end

@implementation NTKFaceSupportUnlockAttemptEventRecorder

+ (id)sharedRecorder
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NTKFaceSupportUnlockAttemptEventRecorder_sharedRecorder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRecorder_onceToken != -1) {
    dispatch_once(&sharedRecorder_onceToken, block);
  }
  v2 = (void *)sharedRecorder_recorder;
  return v2;
}

void __58__NTKFaceSupportUnlockAttemptEventRecorder_sharedRecorder__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) eventRecorder];
  v2 = (void *)sharedRecorder_recorder;
  sharedRecorder_recorder = v1;
}

- (void)beginRecordingForIdentifier:(id)a3 method:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v10 = (void *)[v8 copy];

    v11 = [(NTKFaceSupportUnlockAttemptEventRecorder *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __90__NTKFaceSupportUnlockAttemptEventRecorder_beginRecordingForIdentifier_method_completion___block_invoke;
    v12[3] = &unk_1E62C2240;
    v12[4] = self;
    id v8 = v10;
    id v13 = v8;
    unint64_t v15 = a4;
    id v14 = v9;
    dispatch_async(v11, v12);
  }
}

uint64_t __90__NTKFaceSupportUnlockAttemptEventRecorder_beginRecordingForIdentifier_method_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_beginRecordingForIdentifier:method:completion:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)endRecordingForIdentifier:(id)a3 status:(unint64_t)a4 errorCode:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v11)
  {
    v12 = (void *)[v10 copy];

    id v13 = [(NTKFaceSupportUnlockAttemptEventRecorder *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__NTKFaceSupportUnlockAttemptEventRecorder_endRecordingForIdentifier_status_errorCode_completion___block_invoke;
    block[3] = &unk_1E62C6688;
    block[4] = self;
    id v10 = v12;
    id v15 = v10;
    unint64_t v17 = a4;
    int64_t v18 = a5;
    id v16 = v11;
    dispatch_async(v13, block);
  }
}

uint64_t __98__NTKFaceSupportUnlockAttemptEventRecorder_endRecordingForIdentifier_status_errorCode_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_endRecordingForIdentifier:status:errorCode:completion:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 48));
}

+ (id)eventRecorder
{
  v2 = (void *)[objc_alloc((Class)a1) _init];
  return v2;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)NTKFaceSupportUnlockAttemptEventRecorder;
  v2 = [(NTKFaceSupportUnlockAttemptEventRecorder *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    lookup = v2->_lookup;
    v2->_lookup = (NSMapTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nanotimekit.facesupport.recorders.unlock", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)_queue_beginRecordingForIdentifier:(id)a3 method:(unint64_t)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v10 = [(NTKFaceSupportUnlockAttemptEventRecorder *)self queue];
  dispatch_assert_queue_V2(v10);
  id v11 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v8;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "Argon: Trying to unlock %@ via %lu…", (uint8_t *)&v17, 0x16u);
  }

  v12 = [(NTKFaceSupportUnlockAttemptEventRecorder *)self _validateIdentifier:v8];
  if (v12)
  {
    v9[2](v9, v12);
  }
  else
  {
    id v13 = [(NTKFaceSupportUnlockAttemptEventRecorder *)self lookup];
    id v14 = [v13 objectForKey:v8];
    if (v14)
    {
      id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportUnlockAttemptEventRecorderErrorDomain" code:300 userInfo:0];
      v9[2](v9, v15);
    }
    else
    {
      id v15 = [[NTKFaceSupportPartialUnlockAttemptEvent alloc] initWithIdentifier:v8 method:a4];
      if (v15)
      {
        [v13 setObject:v15 forKey:v8];
        v9[2](v9, 0);
      }
      else
      {
        id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportUnlockAttemptEventRecorderErrorDomain" code:400 userInfo:0];
        v9[2](v9, v16);
      }
    }
  }
}

- (void)_queue_endRecordingForIdentifier:(id)a3 status:(unint64_t)a4 errorCode:(int64_t)a5 completion:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (void (**)(id, void, void *))a6;
  v12 = [(NTKFaceSupportUnlockAttemptEventRecorder *)self queue];
  dispatch_assert_queue_V2(v12);
  id v13 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412802;
    id v21 = v10;
    __int16 v22 = 2048;
    unint64_t v23 = a4;
    __int16 v24 = 2048;
    int64_t v25 = a5;
    _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "Argon: Finalized unlock of %@. Result %lu… (%ld)", (uint8_t *)&v20, 0x20u);
  }

  id v14 = [(NTKFaceSupportUnlockAttemptEventRecorder *)self _validateIdentifier:v10];
  if (v14)
  {
    v11[2](v11, 0, v14);
  }
  else
  {
    id v15 = [(NTKFaceSupportUnlockAttemptEventRecorder *)self lookup];
    id v16 = [v15 objectForKey:v10];
    int v17 = v16;
    if (v16)
    {
      id v18 = [v16 unlockAttemptWithStatus:a4 errorCode:a5];
      if (v18)
      {
        [v15 removeObjectForKey:v10];
        ((void (**)(id, void *, void *))v11)[2](v11, v18, 0);
      }
      else
      {
        __int16 v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportUnlockAttemptEventRecorderErrorDomain" code:500 userInfo:0];
        v11[2](v11, 0, v19);
      }
    }
    else
    {
      id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportUnlockAttemptEventRecorderErrorDomain" code:200 userInfo:0];
      v11[2](v11, 0, v18);
    }
  }
}

- (id)_validateIdentifier:(id)a3
{
  if ([a3 length])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportUnlockAttemptEventRecorderErrorDomain" code:100 userInfo:0];
  }
  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMapTable)lookup
{
  return self->_lookup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end