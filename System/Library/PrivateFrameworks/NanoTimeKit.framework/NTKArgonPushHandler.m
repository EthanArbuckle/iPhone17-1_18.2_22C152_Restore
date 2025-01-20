@interface NTKArgonPushHandler
- (CKDatabase)database;
- (NTKArgonPushHandler)initWithCloudKitDatabase:(id)a3;
- (OS_dispatch_queue)callbackQueue;
- (void)handleNotificationUserInfo:(id)a3 completion:(id)a4;
- (void)registerToken:(id)a3 completion:(id)a4;
@end

@implementation NTKArgonPushHandler

- (NTKArgonPushHandler)initWithCloudKitDatabase:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKArgonPushHandler;
  v6 = [(NTKArgonPushHandler *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.nanotimekit.facesupport.push", v8);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void)registerToken:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = (void *)[a3 copy];
  if (v6)
  {
    v8 = [(NTKArgonPushHandler *)self callbackQueue];
    dispatch_queue_t v9 = [(NTKArgonPushHandler *)self database];
    if (v9)
    {
      if (v7)
      {
        id v10 = objc_alloc(MEMORY[0x1E4F1A2A0]);
        v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"token", v7];
        objc_super v12 = (void *)[v10 initWithRecordType:@"Tokens" predicate:v11];

        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __48__NTKArgonPushHandler_registerToken_completion___block_invoke_3;
        v13[3] = &unk_1E62C4AF8;
        v13[4] = self;
        id v16 = v6;
        id v14 = v7;
        id v15 = v9;
        [v15 performQuery:v12 inZoneWithID:0 completionHandler:v13];
      }
      else
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __48__NTKArgonPushHandler_registerToken_completion___block_invoke_2;
        v17[3] = &unk_1E62C0718;
        id v18 = v6;
        dispatch_async(v8, v17);
        objc_super v12 = v18;
      }
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__NTKArgonPushHandler_registerToken_completion___block_invoke;
      block[3] = &unk_1E62C0718;
      id v20 = v6;
      dispatch_async(v8, block);
      objc_super v12 = v20;
    }
  }
}

void __48__NTKArgonPushHandler_registerToken_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKArgonPushHandlerErrorDomain" code:300 userInfo:&unk_1F16E8908];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __48__NTKArgonPushHandler_registerToken_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKArgonPushHandlerErrorDomain" code:301 userInfo:&unk_1F16E8930];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __48__NTKArgonPushHandler_registerToken_completion___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [a1[4] callbackQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__NTKArgonPushHandler_registerToken_completion___block_invoke_4;
  v12[3] = &unk_1E62C4AD0;
  id v13 = v6;
  id v18 = a1[7];
  id v14 = v5;
  id v15 = a1[5];
  id v8 = a1[6];
  id v9 = a1[4];
  id v16 = v8;
  id v17 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __48__NTKArgonPushHandler_registerToken_completion___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
  }
  else
  {
    if (![*(id *)(a1 + 40) count])
    {
      v3 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"Tokens"];
      [v3 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"token"];
      [v3 setObject:@"TODO" forKeyedSubscript:@"build"];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __48__NTKArgonPushHandler_registerToken_completion___block_invoke_5;
      v6[3] = &unk_1E62C4AA8;
      v4 = *(void **)(a1 + 56);
      id v5 = *(void **)(a1 + 72);
      v6[4] = *(void *)(a1 + 64);
      id v7 = v5;
      [v4 saveRecord:v3 completionHandler:v6];

      return;
    }
    id v2 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
  }
  v2();
}

void __48__NTKArgonPushHandler_registerToken_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__NTKArgonPushHandler_registerToken_completion___block_invoke_6;
  v7[3] = &unk_1E62C2290;
  id v8 = v4;
  id v9 = *(id *)(a1 + 40);
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__NTKArgonPushHandler_registerToken_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleNotificationUserInfo:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[a3 copy];
  id v8 = [(NTKArgonPushHandler *)self callbackQueue];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__NTKArgonPushHandler_handleNotificationUserInfo_completion___block_invoke;
  aBlock[3] = &unk_1E62C0718;
  id v9 = v6;
  id v21 = v9;
  id v10 = _Block_copy(aBlock);
  id v11 = [v7 objectForKey:@"kd"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v12 = (void *)[v11 copy];

    id v13 = [v12 objectForKey:@"k"];
    id v14 = [v12 objectForKey:@"i"];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v15 = [[NTKArgonKeyDescriptor alloc] initWithKey:v13 fileName:v14];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__NTKArgonPushHandler_handleNotificationUserInfo_completion___block_invoke_2;
      block[3] = &unk_1E62C0AE8;
      id v18 = v15;
      id v19 = v9;
      id v16 = v15;
      dispatch_async(v8, block);
    }
    else
    {
      dispatch_async(v8, v10);
    }

    id v11 = v12;
  }
  else
  {
    dispatch_async(v8, v10);
  }
}

void __61__NTKArgonPushHandler_handleNotificationUserInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKArgonPushHandlerErrorDomain" code:302 userInfo:&unk_1F16E8958];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __61__NTKArgonPushHandler_handleNotificationUserInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (CKDatabase)database
{
  return self->_database;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end