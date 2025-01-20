@interface NTKFaceSupportNotificationActionEventRecorder
- (NSMapTable)lookup;
- (NSString)filePath;
- (NTKFaceSupportDateDatabase)database;
- (NTKFaceSupportNotificationActionEventRecorder)initWithFilePath:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_validateIdentifier:(id)a3;
- (void)_queue_beginPresentationForIdentifier:(id)a3 completion:(id)a4;
- (void)_queue_endPresentationForIdentifier:(id)a3 withAction:(int64_t)a4 completion:(id)a5;
- (void)beginPresentationForIdentifier:(id)a3 completion:(id)a4;
- (void)endPresentationForIdentifier:(id)a3 withAction:(int64_t)a4 completion:(id)a5;
@end

@implementation NTKFaceSupportNotificationActionEventRecorder

- (NTKFaceSupportNotificationActionEventRecorder)initWithFilePath:(id)a3
{
  id v4 = a3;
  v5 = [[NTKFaceSupportDateDatabase alloc] initWithFileAtPath:v4];

  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)NTKFaceSupportNotificationActionEventRecorder;
    v6 = [(NTKFaceSupportNotificationActionEventRecorder *)&v12 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_database, v5);
      dispatch_queue_t v8 = dispatch_queue_create("com.apple.nanotimekit.facesupport.recorders.action", 0);
      queue = v7->_queue;
      v7->_queue = (OS_dispatch_queue *)v8;
    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)filePath
{
  v2 = [(NTKFaceSupportNotificationActionEventRecorder *)self database];
  v3 = [v2 filePath];

  return (NSString *)v3;
}

- (void)beginPresentationForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    dispatch_queue_t v8 = (void *)[v6 copy];

    v9 = [(NTKFaceSupportNotificationActionEventRecorder *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__NTKFaceSupportNotificationActionEventRecorder_beginPresentationForIdentifier_completion___block_invoke;
    block[3] = &unk_1E62C0098;
    block[4] = self;
    id v6 = v8;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

uint64_t __91__NTKFaceSupportNotificationActionEventRecorder_beginPresentationForIdentifier_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_beginPresentationForIdentifier:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)endPresentationForIdentifier:(id)a3 withAction:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v10 = (void *)[v8 copy];

    id v11 = [(NTKFaceSupportNotificationActionEventRecorder *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __100__NTKFaceSupportNotificationActionEventRecorder_endPresentationForIdentifier_withAction_completion___block_invoke;
    v12[3] = &unk_1E62C2240;
    v12[4] = self;
    id v8 = v10;
    id v13 = v8;
    int64_t v15 = a4;
    id v14 = v9;
    dispatch_async(v11, v12);
  }
}

uint64_t __100__NTKFaceSupportNotificationActionEventRecorder_endPresentationForIdentifier_withAction_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_endPresentationForIdentifier:withAction:completion:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)_queue_beginPresentationForIdentifier:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [(NTKFaceSupportNotificationActionEventRecorder *)self queue];
  dispatch_assert_queue_V2(v7);
  id v8 = [(NTKFaceSupportNotificationActionEventRecorder *)self _validateIdentifier:v11];
  if (v8)
  {
    v6[2](v6, v8);
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    v10 = [(NTKFaceSupportNotificationActionEventRecorder *)self database];
    [v10 recordDate:v9 bundleIdentifier:v11 completion:v6];
  }
}

- (void)_queue_endPresentationForIdentifier:(id)a3 withAction:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  v10 = [(NTKFaceSupportNotificationActionEventRecorder *)self queue];
  dispatch_assert_queue_V2(v10);
  id v11 = [(NTKFaceSupportNotificationActionEventRecorder *)self _validateIdentifier:v8];
  if (v11)
  {
    v9[2](v9, 0, v11);
  }
  else
  {
    id v12 = [(NTKFaceSupportNotificationActionEventRecorder *)self database];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __107__NTKFaceSupportNotificationActionEventRecorder__queue_endPresentationForIdentifier_withAction_completion___block_invoke;
    v14[3] = &unk_1E62CA800;
    v17 = v9;
    int64_t v18 = a4;
    id v15 = v8;
    id v16 = v12;
    id v13 = v12;
    [v13 retreiveDateForBundleIdentifier:v15 completion:v14];
  }
}

void __107__NTKFaceSupportNotificationActionEventRecorder__queue_endPresentationForIdentifier_withAction_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceDate:v5];
    id v8 = [[NTKFaceSupportNotificationActionEvent alloc] initWithBundleIdentifier:*(void *)(a1 + 32) action:*(void *)(a1 + 56) delayFromPresentation:v7];
    if (v8)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v9 = *(void **)(a1 + 40);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __107__NTKFaceSupportNotificationActionEventRecorder__queue_endPresentationForIdentifier_withAction_completion___block_invoke_2;
      v12[3] = &unk_1E62CA7D8;
      id v14 = *(id *)(a1 + 48);
      id v13 = v8;
      [v9 deleteDateForBundleIdentifier:v10 completion:v12];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportNotificationActionEventRecorderErrorDomain" code:500 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

uint64_t __107__NTKFaceSupportNotificationActionEventRecorder__queue_endPresentationForIdentifier_withAction_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, a2);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
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
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportNotificationActionEventRecorderErrorDomain" code:100 userInfo:0];
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

- (NTKFaceSupportDateDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_lookup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end