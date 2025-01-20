@interface TUMomentsController
+ (BOOL)isFaceTimePhotosEnabled;
+ (BOOL)isFaceTimePhotosEnabledByDefault;
+ (BOOL)isFaceTimePhotosRestricted;
+ (BOOL)isFaceTimePhotosXPCServiceEnabled;
+ (BOOL)isInternalInstall;
+ (id)faceTimePhotosEnabledDeterminer;
+ (id)sharedInstance;
+ (void)setFaceTimePhotosEnabled:(BOOL)a3;
+ (void)setFaceTimePhotosEnabledDeterminer:(id)a3;
- (NSHashTable)delegates;
- (NSMutableDictionary)capabilitiesByVideoStreamToken;
- (NSMutableDictionary)providerByVideoStreamToken;
- (OS_dispatch_queue)queue;
- (TUMomentsController)init;
- (TUMomentsController)initWithDataSource:(id)a3;
- (TUMomentsController)initWithDataSource:(id)a3 queue:(id)a4;
- (TUMomentsController)initWithQueue:(id)a3;
- (TUMomentsControllerDataSource)dataSource;
- (id)capabilitiesForProvider:(id)a3;
- (id)lockdownModeEnabled;
- (void)addDelegate:(id)a3;
- (void)dataSource:(id)a3 didFinishProcessingRawVideoMessage:(id)a4;
- (void)dataSource:(id)a3 didFinishRecordingMedia:(id)a4;
- (void)dataSource:(id)a3 didReceiveLocallyRequestedMomentDescriptor:(id)a4;
- (void)dataSource:(id)a3 didReceiveMediaRecordingError:(id)a4;
- (void)dataSource:(id)a3 didReceiveMessageRecordingError:(id)a4;
- (void)dataSource:(id)a3 didUpdateCapabilities:(id)a4 forVideoStreamToken:(int64_t)a5;
- (void)dataSource:(id)a3 requestSandboxExtensionForURL:(id)a4 reply:(id)a5;
- (void)dataSource:(id)a3 willCaptureRemoteRequestFromRequesterID:(id)a4;
- (void)dealloc;
- (void)discardVideoMessageWithUUID:(id)a3 completion:(id)a4;
- (void)endMediaRequestWithUUID:(id)a3 completion:(id)a4;
- (void)endRecordingMessageWithUUID:(id)a3 completion:(id)a4;
- (void)endRequestWithTransactionID:(id)a3 completion:(id)a4;
- (void)prewarmAudioClientWithCompletion:(id)a3;
- (void)prewarmMediaRequest:(id)a3 completion:(id)a4;
- (void)registerProvider:(id)a3 completion:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)resetVideoMessagingWithSessionUUID:(id)a3 completion:(id)a4;
- (void)saveVideoMessageWithUUID:(id)a3 completion:(id)a4;
- (void)sendVideoMessageWithRequest:(id)a3 completion:(id)a4;
- (void)serverDiedForDataSource:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setLockdownModeEnabled:(id)a3;
- (void)startMediaRequest:(id)a3 completion:(id)a4;
- (void)startRecordingMessageWithMediaType:(int)a3 completion:(id)a4;
- (void)startRequestWithMediaType:(int)a3 forProvider:(id)a4 requesteeID:(id)a5 completion:(id)a6;
- (void)unregisterProvider:(id)a3 completion:(id)a4;
@end

@implementation TUMomentsController

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_13);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

uint64_t __37__TUMomentsController_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(TUMomentsController);

  return MEMORY[0x1F41817F8]();
}

- (TUMomentsController)init
{
  v3 = objc_alloc_init(TUMomentsControllerXPCClient);
  v4 = [(TUMomentsController *)self initWithDataSource:v3];

  return v4;
}

- (TUMomentsController)initWithDataSource:(id)a3
{
  return [(TUMomentsController *)self initWithDataSource:a3 queue:MEMORY[0x1E4F14428]];
}

- (TUMomentsController)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(TUMomentsControllerXPCClient);
  v6 = [(TUMomentsController *)self initWithDataSource:v5 queue:v4];

  return v6;
}

- (TUMomentsController)initWithDataSource:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TUMomentsController;
  v9 = [(TUMomentsController *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_dataSource, a3);
    [(TUMomentsControllerDataSource *)v10->_dataSource setDelegate:v10];
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v10->_delegates;
    v10->_delegates = (NSHashTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    capabilitiesByVideoStreamToken = v10->_capabilitiesByVideoStreamToken;
    v10->_capabilitiesByVideoStreamToken = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    providerByVideoStreamToken = v10->_providerByVideoStreamToken;
    v10->_providerByVideoStreamToken = (NSMutableDictionary *)v15;

    id lockdownModeEnabled = v10->_lockdownModeEnabled;
    v10->_id lockdownModeEnabled = &__block_literal_global_16;
  }
  return v10;
}

uint64_t __48__TUMomentsController_initWithDataSource_queue___block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = TULockdownModeEnabled();
  v1 = TUDefaultLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = @"NO";
    if (v0) {
      v2 = @"YES";
    }
    int v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19C496000, v1, OS_LOG_TYPE_DEFAULT, "Determined lockdownModeEnabled: %@", (uint8_t *)&v4, 0xCu);
  }

  return v0;
}

- (void)dealloc
{
  [(TUMomentsControllerDataSource *)self->_dataSource invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUMomentsController;
  [(TUMomentsController *)&v3 dealloc];
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(TUMomentsController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__TUMomentsController_addDelegate___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __35__TUMomentsController_addDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegates];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(TUMomentsController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__TUMomentsController_removeDelegate___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__TUMomentsController_removeDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegates];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)prewarmAudioClientWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Prewarming audio client for video message", buf, 2u);
  }

  id v7 = [(TUMomentsController *)self dataSource];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(TUMomentsController *)self dataSource];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__TUMomentsController_prewarmAudioClientWithCompletion___block_invoke;
    v14[3] = &unk_1E58E6788;
    v10 = &v15;
    v14[4] = self;
    id v15 = v4;
    [v9 prewarmAudioClientWithCompletion:v14];

LABEL_7:
    goto LABEL_8;
  }
  if (v4)
  {
    uint64_t v11 = [(TUMomentsController *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__TUMomentsController_prewarmAudioClientWithCompletion___block_invoke_3;
    block[3] = &unk_1E58E67B0;
    v10 = &v13;
    id v13 = v4;
    dispatch_async(v11, block);

    goto LABEL_7;
  }
LABEL_8:
}

void __56__TUMomentsController_prewarmAudioClientWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) queue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__TUMomentsController_prewarmAudioClientWithCompletion___block_invoke_2;
    v5[3] = &unk_1E58E6760;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __56__TUMomentsController_prewarmAudioClientWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __56__TUMomentsController_prewarmAudioClientWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)startRecordingMessageWithMediaType:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v7);

  char v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v19 = v4;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Starting video message with mediaType: %d", buf, 8u);
  }

  v9 = [(TUMomentsController *)self dataSource];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(TUMomentsController *)self dataSource];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__TUMomentsController_startRecordingMessageWithMediaType_completion___block_invoke;
    v16[3] = &unk_1E58E6800;
    v12 = &v17;
    v16[4] = self;
    id v17 = v6;
    [v11 startRecordingMessageWithMediaType:v4 completion:v16];

LABEL_7:
    goto LABEL_8;
  }
  if (v6)
  {
    id v13 = [(TUMomentsController *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__TUMomentsController_startRecordingMessageWithMediaType_completion___block_invoke_3;
    block[3] = &unk_1E58E67B0;
    v12 = &v15;
    id v15 = v6;
    dispatch_async(v13, block);

    goto LABEL_7;
  }
LABEL_8:
}

void __69__TUMomentsController_startRecordingMessageWithMediaType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__TUMomentsController_startRecordingMessageWithMediaType_completion___block_invoke_2;
    block[3] = &unk_1E58E67D8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __69__TUMomentsController_startRecordingMessageWithMediaType_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __69__TUMomentsController_startRecordingMessageWithMediaType_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)endRecordingMessageWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Ending video message for UUID: %@", buf, 0xCu);
  }

  id v10 = [(TUMomentsController *)self dataSource];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(TUMomentsController *)self dataSource];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__TUMomentsController_endRecordingMessageWithUUID_completion___block_invoke;
    v17[3] = &unk_1E58E6788;
    id v13 = &v18;
    v17[4] = self;
    id v18 = v7;
    [v12 endRecordingMessageWithUUID:v6 completion:v17];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    v14 = [(TUMomentsController *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__TUMomentsController_endRecordingMessageWithUUID_completion___block_invoke_3;
    block[3] = &unk_1E58E67B0;
    id v13 = &v16;
    id v16 = v7;
    dispatch_async(v14, block);

    goto LABEL_7;
  }
LABEL_8:
}

void __62__TUMomentsController_endRecordingMessageWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = [*(id *)(a1 + 32) queue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__TUMomentsController_endRecordingMessageWithUUID_completion___block_invoke_2;
    v5[3] = &unk_1E58E6760;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __62__TUMomentsController_endRecordingMessageWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __62__TUMomentsController_endRecordingMessageWithUUID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)discardVideoMessageWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Discarding video message for UUID: %@", buf, 0xCu);
  }

  id v10 = [(TUMomentsController *)self dataSource];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(TUMomentsController *)self dataSource];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__TUMomentsController_discardVideoMessageWithUUID_completion___block_invoke;
    v17[3] = &unk_1E58E6788;
    id v13 = &v18;
    v17[4] = self;
    id v18 = v7;
    [v12 discardVideoMessageWithUUID:v6 completion:v17];

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    v14 = [(TUMomentsController *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__TUMomentsController_discardVideoMessageWithUUID_completion___block_invoke_3;
    block[3] = &unk_1E58E67B0;
    id v13 = &v16;
    id v16 = v7;
    dispatch_async(v14, block);

    goto LABEL_7;
  }
LABEL_8:
}

void __62__TUMomentsController_discardVideoMessageWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = [*(id *)(a1 + 32) queue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__TUMomentsController_discardVideoMessageWithUUID_completion___block_invoke_2;
    v5[3] = &unk_1E58E6760;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __62__TUMomentsController_discardVideoMessageWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __62__TUMomentsController_discardVideoMessageWithUUID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)sendVideoMessageWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Sending video message with request: %@", buf, 0xCu);
  }

  id v10 = [(TUMomentsController *)self dataSource];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__TUMomentsController_sendVideoMessageWithRequest_completion___block_invoke;
  v12[3] = &unk_1E58E6788;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 sendVideoMessageWithRequest:v6 completion:v12];
}

void __62__TUMomentsController_sendVideoMessageWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = [*(id *)(a1 + 32) queue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__TUMomentsController_sendVideoMessageWithRequest_completion___block_invoke_2;
    v5[3] = &unk_1E58E6760;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __62__TUMomentsController_sendVideoMessageWithRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)saveVideoMessageWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Saving video message with UUID: %@", buf, 0xCu);
  }

  id v10 = [(TUMomentsController *)self dataSource];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__TUMomentsController_saveVideoMessageWithUUID_completion___block_invoke;
  v12[3] = &unk_1E58E6788;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 saveVideoMessageWithUUID:v6 completion:v12];
}

void __59__TUMomentsController_saveVideoMessageWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = [*(id *)(a1 + 32) queue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__TUMomentsController_saveVideoMessageWithUUID_completion___block_invoke_2;
    v5[3] = &unk_1E58E6760;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __59__TUMomentsController_saveVideoMessageWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)resetVideoMessagingWithSessionUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Resetting video messaging", buf, 2u);
  }

  id v10 = [(TUMomentsController *)self dataSource];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__TUMomentsController_resetVideoMessagingWithSessionUUID_completion___block_invoke;
  v12[3] = &unk_1E58E6788;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v10 resetVideoMessagingWithSessionUUID:v7 completion:v12];
}

void __69__TUMomentsController_resetVideoMessagingWithSessionUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = [*(id *)(a1 + 32) queue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__TUMomentsController_resetVideoMessagingWithSessionUUID_completion___block_invoke_2;
    v5[3] = &unk_1E58E6760;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __69__TUMomentsController_resetVideoMessagingWithSessionUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)prewarmMediaRequest:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Prewarming media request %@", (uint8_t *)&v11, 0xCu);
  }

  id v10 = [(TUMomentsController *)self dataSource];
  [v10 prewarmMediaRequest:v6 completion:v7];
}

- (void)startMediaRequest:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Starting media request %@", (uint8_t *)&v11, 0xCu);
  }

  id v10 = [(TUMomentsController *)self dataSource];
  [v10 startMediaRequest:v6 completion:v7];
}

- (void)endMediaRequestWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Ending media request with UUID %@", (uint8_t *)&v11, 0xCu);
  }

  id v10 = [(TUMomentsController *)self dataSource];
  [v10 endMediaRequestWithUUID:v6 completion:v7];
}

- (void)startRequestWithMediaType:(int)a3 forProvider:(id)a4 requesteeID:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TUMomentsController.m", 240, @"Invalid parameter not satisfying: %@", @"provider != nil" object file lineNumber description];
  }
  v14 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v14);

  id v15 = TUDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v27 = v8;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2112;
    id v31 = v12;
    _os_log_impl(&dword_19C496000, v15, OS_LOG_TYPE_DEFAULT, "mediaType: %d, provider: %@ participant: %@", buf, 0x1Cu);
  }

  uint64_t v16 = [v11 remoteIDSDestinations];
  id v17 = v16;
  if (v12)
  {
    id v18 = [v16 objectForKeyedSubscript:v12];
  }
  else
  {
    int v19 = [v16 allValues];
    id v18 = [v19 firstObject];
  }
  id v20 = [(TUMomentsController *)self dataSource];
  uint64_t v21 = [v11 streamToken];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __84__TUMomentsController_startRequestWithMediaType_forProvider_requesteeID_completion___block_invoke;
  v24[3] = &unk_1E58E6828;
  v24[4] = self;
  id v25 = v13;
  id v22 = v13;
  [v20 startRequestWithMediaType:v8 forStreamToken:v21 requesteeID:v12 destinationID:v18 completion:v24];
}

void __84__TUMomentsController_startRequestWithMediaType_forProvider_requesteeID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__TUMomentsController_startRequestWithMediaType_forProvider_requesteeID_completion___block_invoke_2;
    block[3] = &unk_1E58E67D8;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __84__TUMomentsController_startRequestWithMediaType_forProvider_requesteeID_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)endRequestWithTransactionID:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TUMomentsController.m", 264, @"Invalid parameter not satisfying: %@", @"transactionID != nil" object file lineNumber description];
  }
  id v9 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "transactionID: %@", buf, 0xCu);
  }

  id v11 = [(TUMomentsController *)self dataSource];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__TUMomentsController_endRequestWithTransactionID_completion___block_invoke;
  v14[3] = &unk_1E58E6788;
  v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  [v11 endRequestWithTransactionID:v7 completion:v14];
}

void __62__TUMomentsController_endRequestWithTransactionID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = [*(id *)(a1 + 32) queue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__TUMomentsController_endRequestWithTransactionID_completion___block_invoke_2;
    v5[3] = &unk_1E58E6760;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __62__TUMomentsController_endRequestWithTransactionID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)registerProvider:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"TUMomentsController.m", 279, @"Invalid parameter not satisfying: %@", @"provider != nil" object file lineNumber description];
  }
  id v9 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "provider: %@", buf, 0xCu);
  }

  id v11 = [(TUMomentsController *)self dataSource];
  uint64_t v12 = [v7 streamToken];
  id v13 = [v7 requesterID];
  v14 = [v7 remoteIDSDestinations];
  uint64_t v15 = [v7 isRemoteMomentsAvailable];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__TUMomentsController_registerProvider_completion___block_invoke;
  v19[3] = &unk_1E58E6878;
  v19[4] = self;
  id v20 = v7;
  id v21 = v8;
  id v16 = v8;
  id v17 = v7;
  [v11 registerStreamToken:v12 requesterID:v13 remoteIDSDestinations:v14 remoteMomentsAvailable:v15 completion:v19];
}

void __51__TUMomentsController_registerProvider_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "registered, capabilities: %@, error: %@", buf, 0x16u);
  }

  id v8 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__TUMomentsController_registerProvider_completion___block_invoke_50;
  block[3] = &unk_1E58E6850;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v15 = v5;
  uint64_t v16 = v9;
  id v17 = v10;
  id v11 = *(id *)(a1 + 48);
  id v18 = v6;
  id v19 = v11;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v8, block);
}

uint64_t __51__TUMomentsController_registerProvider_completion___block_invoke_50(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) capabilitiesByVideoStreamToken];
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "streamToken"));
    [v3 setObject:v2 forKeyedSubscript:v4];

    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 40) providerByVideoStreamToken];
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "streamToken"));
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    uint64_t v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

- (void)unregisterProvider:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TUMomentsController.m", 301, @"Invalid parameter not satisfying: %@", @"provider != nil" object file lineNumber description];
  }
  uint64_t v9 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v7;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "provider: %@", buf, 0xCu);
  }

  id v11 = [(TUMomentsController *)self dataSource];
  uint64_t v12 = [v7 streamToken];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__TUMomentsController_unregisterProvider_completion___block_invoke;
  v16[3] = &unk_1E58E68C8;
  v16[4] = self;
  id v17 = v7;
  id v18 = v8;
  id v13 = v8;
  id v14 = v7;
  [v11 unregisterStreamToken:v12 completion:v16];
}

void __53__TUMomentsController_unregisterProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__TUMomentsController_unregisterProvider_completion___block_invoke_2;
  v8[3] = &unk_1E58E68A0;
  uint64_t v5 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v6 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, v8);
}

uint64_t __53__TUMomentsController_unregisterProvider_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) capabilitiesByVideoStreamToken];
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "streamToken"));
  [v2 setObject:0 forKeyedSubscript:v3];

  uint64_t v4 = [*(id *)(a1 + 32) providerByVideoStreamToken];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "streamToken"));
  [v4 setObject:0 forKeyedSubscript:v5];

  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (id)capabilitiesForProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUMomentsController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(TUMomentsController *)self capabilitiesByVideoStreamToken];
  id v7 = NSNumber;
  uint64_t v8 = [v4 streamToken];

  id v9 = [v7 numberWithInteger:v8];
  id v10 = [v6 objectForKeyedSubscript:v9];

  if (!v10)
  {
    if (([(id)objc_opt_class() isFaceTimePhotosRestricted] & 1) != 0
      || ([(TUMomentsController *)self lockdownModeEnabled],
          id v11 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
          char v12 = v11[2](),
          v11,
          (v12 & 1) != 0))
    {
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v13 = [(id)objc_opt_class() isFaceTimePhotosEnabled] ^ 1;
    }
    id v14 = [TUMomentsCapabilities alloc];
    id v15 = [MEMORY[0x1E4F1CAD0] set];
    id v10 = [(TUMomentsCapabilities *)v14 initWithAvailability:v13 supportedMediaTypes:v15];
  }

  return v10;
}

+ (BOOL)isFaceTimePhotosEnabledByDefault
{
  return MGGetBoolAnswer() ^ 1;
}

+ (id)faceTimePhotosEnabledDeterminer
{
  if (faceTimePhotosEnabledDeterminer_onceToken != -1) {
    dispatch_once(&faceTimePhotosEnabledDeterminer_onceToken, &__block_literal_global_59);
  }
  uint64_t v2 = _Block_copy((const void *)sharedFaceTimePhotosEnabledDeterminer);

  return v2;
}

void __54__TUMomentsController_faceTimePhotosEnabledDeterminer__block_invoke()
{
  if (!sharedFaceTimePhotosEnabledDeterminer)
  {
    sharedFaceTimePhotosEnabledDeterminer = (uint64_t)&__block_literal_global_61;
  }
}

uint64_t __54__TUMomentsController_faceTimePhotosEnabledDeterminer__block_invoke_2()
{
  if (+[TUMomentsController isFaceTimePhotosRestricted])
  {
    return 0;
  }
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1CB18], "tu_defaults");
  uint64_t v2 = [v1 BOOLForKey:@"FaceTimePhotosEnabled"];

  return v2;
}

+ (void)setFaceTimePhotosEnabledDeterminer:(id)a3
{
  sharedFaceTimePhotosEnabledDeterminer = (uint64_t)_Block_copy(a3);

  MEMORY[0x1F41817F8]();
}

+ (BOOL)isFaceTimePhotosEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__TUMomentsController_isFaceTimePhotosEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (isFaceTimePhotosEnabled_hasRegisteredDefaults != -1) {
    dispatch_once(&isFaceTimePhotosEnabled_hasRegisteredDefaults, block);
  }
  id v3 = [a1 faceTimePhotosEnabledDeterminer];
  char v4 = v3[2]();

  return v4;
}

void __46__TUMomentsController_isFaceTimePhotosEnabled__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "tu_defaults");
  uint64_t v5 = @"FaceTimePhotosEnabled";
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isFaceTimePhotosEnabledByDefault"));
  v6[0] = v3;
  char v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 registerDefaults:v4];
}

+ (BOOL)isInternalInstall
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__TUMomentsController_isInternalInstall__block_invoke;
  block[3] = &unk_1E58E5F90;
  void block[4] = &v5;
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __40__TUMomentsController_isInternalInstall__block_invoke(uint64_t a1)
{
  char v2 = [(id)CUTWeakLinkClass() sharedInstance];
  if (v2)
  {
    id v3 = v2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 isInternalInstall];
    char v2 = v3;
  }
}

+ (BOOL)isFaceTimePhotosXPCServiceEnabled
{
  char v2 = objc_alloc_init(TUFeatureFlags);
  BOOL v3 = [(TUFeatureFlags *)v2 livePhotoXPCServiceEnabled];
  if (v3)
  {
    char v4 = TUDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Determined that Live Photo moments XPC Service should be enabled", v6, 2u);
    }
  }
  return v3;
}

+ (void)setFaceTimePhotosEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "tu_defaults");
  [v4 setBool:v3 forKey:@"FaceTimePhotosEnabled"];

  objc_msgSend(MEMORY[0x1E4F1CB18], "tu_defaults");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 synchronize];
}

+ (BOOL)isFaceTimePhotosRestricted
{
  return 0;
}

- (void)dataSource:(id)a3 didUpdateCapabilities:(id)a4 forVideoStreamToken:(int64_t)a5
{
  id v7 = a4;
  char v8 = [(TUMomentsController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__TUMomentsController_dataSource_didUpdateCapabilities_forVideoStreamToken___block_invoke;
  block[3] = &unk_1E58E68F0;
  char v12 = self;
  int64_t v13 = a5;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

void __76__TUMomentsController_dataSource_didUpdateCapabilities_forVideoStreamToken___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = v3;
    __int16 v29 = 2048;
    uint64_t v30 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "capabilities: %@ token: %ld", buf, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) capabilitiesByVideoStreamToken];
  id v7 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v6 setObject:v5 forKeyedSubscript:v7];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [*(id *)(a1 + 40) delegates];
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          int64_t v13 = *(void **)(a1 + 40);
          uint64_t v21 = *(void *)(a1 + 32);
          id v14 = [v13 providerByVideoStreamToken];
          [NSNumber numberWithInteger:*(void *)(a1 + 48)];
          uint64_t v15 = v9;
          uint64_t v16 = v10;
          v18 = uint64_t v17 = a1;
          id v19 = [v14 objectForKeyedSubscript:v18];
          [v12 momentsController:v13 didUpdateCapabilities:v21 forProvider:v19];

          a1 = v17;
          uint64_t v10 = v16;
          uint64_t v9 = v15;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
}

- (void)dataSource:(id)a3 willCaptureRemoteRequestFromRequesterID:(id)a4
{
  id v5 = a4;
  id v6 = [(TUMomentsController *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__TUMomentsController_dataSource_willCaptureRemoteRequestFromRequesterID___block_invoke;
  v8[3] = &unk_1E58E5C08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __74__TUMomentsController_dataSource_willCaptureRemoteRequestFromRequesterID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 momentsController:*(void *)(a1 + 32) willCaptureRemoteRequestFromIdentifier:*(void *)(a1 + 40)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)dataSource:(id)a3 didReceiveLocallyRequestedMomentDescriptor:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(TUMomentsController *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__TUMomentsController_dataSource_didReceiveLocallyRequestedMomentDescriptor___block_invoke;
  v8[3] = &unk_1E58E5C08;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __77__TUMomentsController_dataSource_didReceiveLocallyRequestedMomentDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "momentDescriptor: %@", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "delegates", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 momentsController:*(void *)(a1 + 40) didReceiveLocallyRequestedMomentDescriptor:*(void *)(a1 + 32)];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)dataSource:(id)a3 requestSandboxExtensionForURL:(id)a4 reply:(id)a5
{
  id v14 = a4;
  uint64_t v8 = (void (**)(id, TUSandboxExtendedURL *, void))a5;
  id v9 = [a3 processName];
  int v10 = [v9 isEqualToString:@"com.apple.FTLivePhotoService"];

  if (v10)
  {
    long long v11 = [[TUSandboxExtendedURL alloc] initWithURL:v14];
    long long v12 = [NSString stringWithUTF8String:*MEMORY[0x1E4F14008]];
    [(TUSandboxExtendedURL *)v11 setSandboxExtensionClass:v12];

    long long v13 = [(TUMomentsController *)self dataSource];
    -[TUSandboxExtendedURL setPid:](v11, "setPid:", [v13 processIdentifier]);

    v8[2](v8, v11, 0);
  }
  else
  {
    v8[2](v8, 0, 0);
  }
}

- (void)serverDiedForDataSource:(id)a3
{
  uint64_t v4 = [(TUMomentsController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__TUMomentsController_serverDiedForDataSource___block_invoke;
  block[3] = &unk_1E58E5BE0;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __47__TUMomentsController_serverDiedForDataSource___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  char v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[TUMomentsController serverDiedForDataSource:]_block_invoke";
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "%s: ", buf, 0xCu);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) delegates];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v39;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v38 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 momentsControllerServerDied:*(void *)(a1 + 32)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v5);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = [*(id *)(a1 + 32) providerByVideoStreamToken];
  int v10 = [v9 allKeys];

  id obj = v10;
  uint64_t v28 = [v10 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v11;
        uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8 * v11);
        long long v13 = [*(id *)(a1 + 32) providerByVideoStreamToken];
        id v14 = [v13 objectForKeyedSubscript:v12];

        uint64_t v15 = [*(id *)(a1 + 32) providerByVideoStreamToken];
        [v15 setObject:0 forKeyedSubscript:v12];

        uint64_t v16 = [*(id *)(a1 + 32) capabilitiesByVideoStreamToken];
        [v16 setObject:0 forKeyedSubscript:v12];

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v17 = [*(id *)(a1 + 32) delegates];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v31;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v31 != v20) {
                objc_enumerationMutation(v17);
              }
              long long v22 = *(void **)(*((void *)&v30 + 1) + 8 * v21);
              if (objc_opt_respondsToSelector())
              {
                long long v23 = [TUMomentsCapabilities alloc];
                long long v24 = [MEMORY[0x1E4F1CAD0] set];
                long long v25 = [(TUMomentsCapabilities *)v23 initWithAvailability:0 supportedMediaTypes:v24];

                [v22 momentsController:*(void *)(a1 + 32) didUpdateCapabilities:v25 forProvider:v14];
              }
              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v42 count:16];
          }
          while (v19);
        }

        uint64_t v11 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v28);
  }
}

- (void)dataSource:(id)a3 didFinishProcessingRawVideoMessage:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(TUMomentsController *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__TUMomentsController_dataSource_didFinishProcessingRawVideoMessage___block_invoke;
  v8[3] = &unk_1E58E5C08;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __69__TUMomentsController_dataSource_didFinishProcessingRawVideoMessage___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v2 = objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 momentsController:*(void *)(a1 + 32) didFinishProcessingRawVideoMessage:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)dataSource:(id)a3 didFinishRecordingMedia:(id)a4
{
  id v5 = a4;
  uint64_t v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Finished recording media", buf, 2u);
  }

  id v7 = [(TUMomentsController *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__TUMomentsController_dataSource_didFinishRecordingMedia___block_invoke;
  v9[3] = &unk_1E58E5C08;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

void __58__TUMomentsController_dataSource_didFinishRecordingMedia___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v2 = objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 momentsController:*(void *)(a1 + 32) didFinishRecordingMedia:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)dataSource:(id)a3 didReceiveMessageRecordingError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(TUMomentsController *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__TUMomentsController_dataSource_didReceiveMessageRecordingError___block_invoke;
  v8[3] = &unk_1E58E5C08;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __66__TUMomentsController_dataSource_didReceiveMessageRecordingError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v2 = objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 momentsController:*(void *)(a1 + 32) didReceiveMessageRecordingError:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)dataSource:(id)a3 didReceiveMediaRecordingError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(TUMomentsController *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__TUMomentsController_dataSource_didReceiveMediaRecordingError___block_invoke;
  v8[3] = &unk_1E58E5C08;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __64__TUMomentsController_dataSource_didReceiveMediaRecordingError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v2 = objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 momentsController:*(void *)(a1 + 32) didReceiveMediaRecordingError:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUMomentsControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (NSMutableDictionary)capabilitiesByVideoStreamToken
{
  return self->_capabilitiesByVideoStreamToken;
}

- (NSMutableDictionary)providerByVideoStreamToken
{
  return self->_providerByVideoStreamToken;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (id)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (void)setLockdownModeEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lockdownModeEnabled, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_providerByVideoStreamToken, 0);
  objc_storeStrong((id *)&self->_capabilitiesByVideoStreamToken, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end