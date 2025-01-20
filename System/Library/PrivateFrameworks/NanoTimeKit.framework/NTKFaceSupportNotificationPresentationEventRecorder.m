@interface NTKFaceSupportNotificationPresentationEventRecorder
+ (id)eventRecorder;
+ (id)sharedRecorder;
- (NSMapTable)lookup;
- (OS_dispatch_queue)queue;
- (id)_init;
- (id)_validateIdentifier:(id)a3;
- (void)_queue_beginPresentationForIdentifier:(id)a3 pushDate:(id)a4 completion:(id)a5;
- (void)_queue_endPresentationForIdentifier:(id)a3 status:(int64_t)a4 artworkUsed:(int64_t)a5 errorCode:(int64_t)a6 optOutStatus:(int64_t)a7 completion:(id)a8;
- (void)beginPresentationForIdentifier:(id)a3 pushDate:(id)a4 completion:(id)a5;
- (void)endPresentationForIdentifier:(id)a3 status:(int64_t)a4 artworkUsed:(int64_t)a5 errorCode:(int64_t)a6 optOutStatus:(int64_t)a7 completion:(id)a8;
@end

@implementation NTKFaceSupportNotificationPresentationEventRecorder

+ (id)sharedRecorder
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__NTKFaceSupportNotificationPresentationEventRecorder_sharedRecorder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRecorder_onceToken_0 != -1) {
    dispatch_once(&sharedRecorder_onceToken_0, block);
  }
  v2 = (void *)sharedRecorder_recorder_0;
  return v2;
}

void __69__NTKFaceSupportNotificationPresentationEventRecorder_sharedRecorder__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) eventRecorder];
  v2 = (void *)sharedRecorder_recorder_0;
  sharedRecorder_recorder_0 = v1;
}

- (void)beginPresentationForIdentifier:(id)a3 pushDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = (void *)[v8 copy];

    v12 = [(NTKFaceSupportNotificationPresentationEventRecorder *)self queue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __106__NTKFaceSupportNotificationPresentationEventRecorder_beginPresentationForIdentifier_pushDate_completion___block_invoke;
    v13[3] = &unk_1E62C3348;
    v13[4] = self;
    id v8 = v11;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(v12, v13);
  }
}

uint64_t __106__NTKFaceSupportNotificationPresentationEventRecorder_beginPresentationForIdentifier_pushDate_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_beginPresentationForIdentifier:pushDate:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)endPresentationForIdentifier:(id)a3 status:(int64_t)a4 artworkUsed:(int64_t)a5 errorCode:(int64_t)a6 optOutStatus:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  if (v15)
  {
    id v16 = (void *)[v14 copy];

    v17 = [(NTKFaceSupportNotificationPresentationEventRecorder *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __137__NTKFaceSupportNotificationPresentationEventRecorder_endPresentationForIdentifier_status_artworkUsed_errorCode_optOutStatus_completion___block_invoke;
    block[3] = &unk_1E62C8C18;
    block[4] = self;
    id v14 = v16;
    id v19 = v14;
    int64_t v21 = a4;
    int64_t v22 = a5;
    int64_t v23 = a6;
    int64_t v24 = a7;
    id v20 = v15;
    dispatch_async(v17, block);
  }
}

uint64_t __137__NTKFaceSupportNotificationPresentationEventRecorder_endPresentationForIdentifier_status_artworkUsed_errorCode_optOutStatus_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_endPresentationForIdentifier:status:artworkUsed:errorCode:optOutStatus:completion:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 48));
}

+ (id)eventRecorder
{
  v2 = (void *)[objc_alloc((Class)a1) _init];
  return v2;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)NTKFaceSupportNotificationPresentationEventRecorder;
  v2 = [(NTKFaceSupportNotificationPresentationEventRecorder *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    lookup = v2->_lookup;
    v2->_lookup = (NSMapTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nanotimekit.facesupport.recorders.presentation", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)_queue_beginPresentationForIdentifier:(id)a3 pushDate:(id)a4 completion:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = [(NTKFaceSupportNotificationPresentationEventRecorder *)self queue];
  dispatch_assert_queue_V2(v10);
  v11 = [(NTKFaceSupportNotificationPresentationEventRecorder *)self _validateIdentifier:v17];
  if (v11)
  {
    v9[2](v9, v11);
  }
  else
  {
    [v8 timeIntervalSinceNow];
    if (v12 <= 0.0)
    {
      v13 = [(NTKFaceSupportNotificationPresentationEventRecorder *)self lookup];
      id v14 = [v13 objectForKey:v17];
      if (v14)
      {
        id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportNotificationPresentationEventRecorderErrorDomain" code:300 userInfo:0];
        v9[2](v9, v15);
      }
      else
      {
        id v15 = [[NTKFaceSupportPartialNotificationPresentationEvent alloc] initWithIdentifier:v17 pushDate:v8];
        if (v15)
        {
          [v13 setObject:v15 forKey:v17];
          v9[2](v9, 0);
        }
        else
        {
          id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportNotificationPresentationEventRecorderErrorDomain" code:400 userInfo:0];
          v9[2](v9, v16);
        }
      }
    }
    else
    {
      v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportNotificationPresentationEventRecorderErrorDomain" code:600 userInfo:0];
      v9[2](v9, v13);
    }
  }
}

- (void)_queue_endPresentationForIdentifier:(id)a3 status:(int64_t)a4 artworkUsed:(int64_t)a5 errorCode:(int64_t)a6 optOutStatus:(int64_t)a7 completion:(id)a8
{
  id v22 = a3;
  id v14 = (void (**)(id, void, void *))a8;
  id v15 = [(NTKFaceSupportNotificationPresentationEventRecorder *)self queue];
  dispatch_assert_queue_V2(v15);
  id v16 = [(NTKFaceSupportNotificationPresentationEventRecorder *)self _validateIdentifier:v22];
  if (v16)
  {
    v14[2](v14, 0, v16);
  }
  else
  {
    id v17 = [(NTKFaceSupportNotificationPresentationEventRecorder *)self lookup];
    v18 = [v17 objectForKey:v22];
    id v19 = v18;
    if (v18)
    {
      id v20 = [v18 presentationEventWithStatus:a4 artworkUsed:a5 errorCode:a6 optOutStatus:a7];
      if (v20)
      {
        [v17 removeObjectForKey:v22];
        ((void (**)(id, void *, void *))v14)[2](v14, v20, 0);
      }
      else
      {
        int64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportNotificationPresentationEventRecorderErrorDomain" code:500 userInfo:0];
        v14[2](v14, 0, v21);
      }
    }
    else
    {
      id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportNotificationPresentationEventRecorderErrorDomain" code:200 userInfo:0];
      v14[2](v14, 0, v20);
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
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportNotificationPresentationEventRecorderErrorDomain" code:100 userInfo:0];
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