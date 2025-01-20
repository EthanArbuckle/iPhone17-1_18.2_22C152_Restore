@interface TUIDSLookupManager
+ (BOOL)isAnyDestinationAvailableInDestinations:(id)a3 usingCache:(id)a4;
+ (TUIDSLookupManager)sharedManager;
+ (unsigned)fzHandleIDStatusForDestination:(id)a3 usingCache:(id)a4;
- (BOOL)isAVLessSharePlayCapableForAnyDestinationInDestinations:(id)a3;
- (BOOL)isFaceTimeAudioAvailableForAnyDestinationInDestinations:(id)a3;
- (BOOL)isFaceTimeAudioAvailableForItem:(id)a3;
- (BOOL)isFaceTimeMultiwayAvailableForAnyDestinationInDestinations:(id)a3;
- (BOOL)isFaceTimeMultiwayAvailableForItem:(id)a3;
- (BOOL)isFaceTimeVideoAvailableForAnyDestinationInDestinations:(id)a3;
- (BOOL)isFaceTimeVideoAvailableForItem:(id)a3;
- (BOOL)isModernFaceTimeAvailableForDestination:(id)a3;
- (BOOL)isNameAndPhotoAvailableForDestination:(id)a3;
- (BOOL)isVideoMessagingAvailableForAnyDestinationInDestinations:(id)a3;
- (BOOL)isVideoMessagingAvailableForItem:(id)a3;
- (BOOL)isWebCapableFaceTimeAvailableForDestination:(id)a3;
- (BOOL)isiMessageAvailableForAnyDestinationInDestinations:(id)a3;
- (OS_dispatch_queue)queue;
- (TUIDSBatchIDQueryController)batchQuerySearchAudioController;
- (TUIDSBatchIDQueryController)batchQuerySearchMultiwayController;
- (TUIDSBatchIDQueryController)batchQuerySearchShareNameAndPhotoController;
- (TUIDSBatchIDQueryController)batchQuerySearchVideoController;
- (TUIDSBatchIDQueryController)batchQuerySearchVideoMessagingController;
- (TUIDSBatchIDQueryController)batchQuerySearchiMessageController;
- (TUIDSIDQueryController)queryController;
- (TUIDSLookupManager)init;
- (TUIDSLookupManager)initWithQueryController:(id)a3 batchQueryControllerCreationBlock:(id)a4;
- (TULocked)idsAVLessSharePlayCapableStatuses;
- (TULocked)idsFaceTimeAudioStatuses;
- (TULocked)idsFaceTimeMultiwayStatuses;
- (TULocked)idsFaceTimeVideoStatuses;
- (TULocked)idsModernStatuses;
- (TULocked)idsNameAndPhotoStatuses;
- (TULocked)idsVideoMessagingStatuses;
- (TULocked)idsWebCapableStatuses;
- (TULocked)idsiMessageStatuses;
- (id)batchQueryControllerCreationBlock;
- (id)preferredFromID;
- (unsigned)faceTimeAudioAvailabilityForDestination:(id)a3;
- (unsigned)faceTimeMultiwayAvailabilityForDestination:(id)a3;
- (unsigned)faceTimeVideoAvailabilityForDestination:(id)a3;
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
- (void)beginBatchQueryWithDestinations:(id)a3;
- (void)beginBatchQueryWithDestinations:(id)a3 includeMessages:(BOOL)a4;
- (void)beginBatchQueryWithDestinations:(id)a3 services:(unint64_t)a4;
- (void)beginCachedQueryWithDestinations:(id)a3;
- (void)beginCachedQueryWithDestinations:(id)a3 includeMessages:(BOOL)a4;
- (void)beginCachedQueryWithDestinations:(id)a3 onService:(id)a4;
- (void)beginCachedQueryWithDestinations:(id)a3 services:(unint64_t)a4;
- (void)beginQueryWithDestination:(id)a3 onService:(id)a4;
- (void)beginQueryWithDestinations:(id)a3;
- (void)beginQueryWithDestinations:(id)a3 includeMessages:(BOOL)a4;
- (void)beginQueryWithDestinations:(id)a3 services:(unint64_t)a4;
- (void)beginQueryWithRefreshForDestination:(id)a3 onService:(id)a4;
- (void)cancelQueries;
- (void)dealloc;
- (void)filteredDestinationForMultiway:(id)a3 completionBlock:(id)a4;
- (void)handleIDSQueryResultWithDestinationStatus:(id)a3 onService:(id)a4;
- (void)postStatusChangedNotification;
- (void)queryHasEndpointWithCapabilities:(id)a3 forMultiwayDestinations:(id)a4 completionBlock:(id)a5;
- (void)queryHasWebOnlyEndpointsForDestinations:(id)a3 completionBlock:(id)a4;
- (void)setBatchQueryControllerCreationBlock:(id)a3;
- (void)setBatchQuerySearchAudioController:(id)a3;
- (void)setBatchQuerySearchMultiwayController:(id)a3;
- (void)setBatchQuerySearchShareNameAndPhotoController:(id)a3;
- (void)setBatchQuerySearchVideoController:(id)a3;
- (void)setBatchQuerySearchVideoMessagingController:(id)a3;
- (void)setBatchQuerySearchiMessageController:(id)a3;
@end

@implementation TUIDSLookupManager

+ (TUIDSLookupManager)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__TUIDSLookupManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedManager;

  return (TUIDSLookupManager *)v2;
}

uint64_t __35__TUIDSLookupManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (TUIDSLookupManager)init
{
  if (TUSimulatedModeEnabled())
  {
    v3 = objc_alloc_init(TUSimulatedIDSIDQueryController);
    v4 = &__block_literal_global_34;
  }
  else
  {
    v3 = [MEMORY[0x1E4F6AB38] sharedInstance];
    v4 = &__block_literal_global_63_2;
  }
  v5 = [(TUIDSLookupManager *)self initWithQueryController:v3 batchQueryControllerCreationBlock:v4];

  return v5;
}

TUSimulatedIDSBatchIDQueryController *__26__TUIDSLookupManager_init__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  v9 = [[TUSimulatedIDSBatchIDQueryController alloc] initWithService:v8 delegate:v7 queue:v6];

  return v9;
}

id __26__TUIDSLookupManager_init__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (objc_class *)MEMORY[0x1E4F6AAD8];
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  v10 = (void *)[[v6 alloc] initWithService:v9 delegate:v8 queue:v7];

  return v10;
}

- (TUIDSLookupManager)initWithQueryController:(id)a3 batchQueryControllerCreationBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v53.receiver = self;
  v53.super_class = (Class)TUIDSLookupManager;
  id v9 = [(TUIDSLookupManager *)&v53 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.tuidslookupmanager", v11);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_queryController, a3);
    v14 = _Block_copy(v8);
    id batchQueryControllerCreationBlock = v9->_batchQueryControllerCreationBlock;
    v9->_id batchQueryControllerCreationBlock = v14;

    v16 = [TULocked alloc];
    v17 = [MEMORY[0x1E4F1C9E8] dictionary];
    uint64_t v18 = [(TULocked *)v16 initWithObject:v17];
    idsFaceTimeVideoStatuses = v9->_idsFaceTimeVideoStatuses;
    v9->_idsFaceTimeVideoStatuses = (TULocked *)v18;

    v20 = [TULocked alloc];
    v21 = [MEMORY[0x1E4F1C9E8] dictionary];
    uint64_t v22 = [(TULocked *)v20 initWithObject:v21];
    idsFaceTimeAudioStatuses = v9->_idsFaceTimeAudioStatuses;
    v9->_idsFaceTimeAudioStatuses = (TULocked *)v22;

    v24 = [TULocked alloc];
    v25 = [MEMORY[0x1E4F1C9E8] dictionary];
    uint64_t v26 = [(TULocked *)v24 initWithObject:v25];
    idsFaceTimeMultiwayStatuses = v9->_idsFaceTimeMultiwayStatuses;
    v9->_idsFaceTimeMultiwayStatuses = (TULocked *)v26;

    v28 = [TULocked alloc];
    v29 = [MEMORY[0x1E4F1C9E8] dictionary];
    uint64_t v30 = [(TULocked *)v28 initWithObject:v29];
    idsVideoMessagingStatuses = v9->_idsVideoMessagingStatuses;
    v9->_idsVideoMessagingStatuses = (TULocked *)v30;

    v32 = [TULocked alloc];
    v33 = [MEMORY[0x1E4F1C9E8] dictionary];
    uint64_t v34 = [(TULocked *)v32 initWithObject:v33];
    idsiMessageStatuses = v9->_idsiMessageStatuses;
    v9->_idsiMessageStatuses = (TULocked *)v34;

    v36 = [TULocked alloc];
    v37 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v38 = [(TULocked *)v36 initWithObject:v37];
    idsModernStatuses = v9->_idsModernStatuses;
    v9->_idsModernStatuses = (TULocked *)v38;

    v40 = [TULocked alloc];
    v41 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v42 = [(TULocked *)v40 initWithObject:v41];
    idsWebCapableStatuses = v9->_idsWebCapableStatuses;
    v9->_idsWebCapableStatuses = (TULocked *)v42;

    v44 = [TULocked alloc];
    v45 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v46 = [(TULocked *)v44 initWithObject:v45];
    idsAVLessSharePlayCapableStatuses = v9->_idsAVLessSharePlayCapableStatuses;
    v9->_idsAVLessSharePlayCapableStatuses = (TULocked *)v46;

    v48 = [TULocked alloc];
    v49 = [MEMORY[0x1E4F1C9E8] dictionary];
    uint64_t v50 = [(TULocked *)v48 initWithObject:v49];
    idsNameAndPhotoStatuses = v9->_idsNameAndPhotoStatuses;
    v9->_idsNameAndPhotoStatuses = (TULocked *)v50;
  }
  return v9;
}

- (void)dealloc
{
  [(TUIDSLookupManager *)self cancelQueries];
  v3.receiver = self;
  v3.super_class = (Class)TUIDSLookupManager;
  [(TUIDSLookupManager *)&v3 dealloc];
}

- (TUIDSBatchIDQueryController)batchQuerySearchVideoController
{
  objc_super v3 = [(TUIDSLookupManager *)self queue];
  dispatch_assert_queue_V2(v3);

  batchQuerySearchVideoController = self->_batchQuerySearchVideoController;
  if (!batchQuerySearchVideoController)
  {
    v5 = [(TUIDSLookupManager *)self batchQueryControllerCreationBlock];
    uint64_t v6 = *MEMORY[0x1E4F6AA50];
    id v7 = [(TUIDSLookupManager *)self queue];
    ((void (**)(void, uint64_t, TUIDSLookupManager *, void *))v5)[2](v5, v6, self, v7);
    id v8 = (TUIDSBatchIDQueryController *)objc_claimAutoreleasedReturnValue();
    id v9 = self->_batchQuerySearchVideoController;
    self->_batchQuerySearchVideoController = v8;

    batchQuerySearchVideoController = self->_batchQuerySearchVideoController;
  }

  return batchQuerySearchVideoController;
}

- (TUIDSBatchIDQueryController)batchQuerySearchAudioController
{
  objc_super v3 = [(TUIDSLookupManager *)self queue];
  dispatch_assert_queue_V2(v3);

  batchQuerySearchAudioController = self->_batchQuerySearchAudioController;
  if (!batchQuerySearchAudioController)
  {
    v5 = [(TUIDSLookupManager *)self batchQueryControllerCreationBlock];
    uint64_t v6 = *MEMORY[0x1E4F6AA48];
    id v7 = [(TUIDSLookupManager *)self queue];
    ((void (**)(void, uint64_t, TUIDSLookupManager *, void *))v5)[2](v5, v6, self, v7);
    id v8 = (TUIDSBatchIDQueryController *)objc_claimAutoreleasedReturnValue();
    id v9 = self->_batchQuerySearchAudioController;
    self->_batchQuerySearchAudioController = v8;

    batchQuerySearchAudioController = self->_batchQuerySearchAudioController;
  }

  return batchQuerySearchAudioController;
}

- (TUIDSBatchIDQueryController)batchQuerySearchMultiwayController
{
  objc_super v3 = [(TUIDSLookupManager *)self queue];
  dispatch_assert_queue_V2(v3);

  batchQuerySearchMultiwayController = self->_batchQuerySearchMultiwayController;
  if (!batchQuerySearchMultiwayController)
  {
    v5 = [(TUIDSLookupManager *)self batchQueryControllerCreationBlock];
    uint64_t v6 = *MEMORY[0x1E4F6AA58];
    id v7 = [(TUIDSLookupManager *)self queue];
    ((void (**)(void, uint64_t, TUIDSLookupManager *, void *))v5)[2](v5, v6, self, v7);
    id v8 = (TUIDSBatchIDQueryController *)objc_claimAutoreleasedReturnValue();
    id v9 = self->_batchQuerySearchMultiwayController;
    self->_batchQuerySearchMultiwayController = v8;

    batchQuerySearchMultiwayController = self->_batchQuerySearchMultiwayController;
  }

  return batchQuerySearchMultiwayController;
}

- (TUIDSBatchIDQueryController)batchQuerySearchVideoMessagingController
{
  objc_super v3 = [(TUIDSLookupManager *)self queue];
  dispatch_assert_queue_V2(v3);

  batchQuerySearchVideoMessagingController = self->_batchQuerySearchVideoMessagingController;
  if (!batchQuerySearchVideoMessagingController)
  {
    v5 = [(TUIDSLookupManager *)self batchQueryControllerCreationBlock];
    uint64_t v6 = [(TUIDSLookupManager *)self queue];
    ((void (**)(void, __CFString *, TUIDSLookupManager *, void *))v5)[2](v5, @"com.apple.private.alloy.facetime.messaging", self, v6);
    id v7 = (TUIDSBatchIDQueryController *)objc_claimAutoreleasedReturnValue();
    id v8 = self->_batchQuerySearchVideoMessagingController;
    self->_batchQuerySearchVideoMessagingController = v7;

    batchQuerySearchVideoMessagingController = self->_batchQuerySearchVideoMessagingController;
  }

  return batchQuerySearchVideoMessagingController;
}

- (TUIDSBatchIDQueryController)batchQuerySearchiMessageController
{
  objc_super v3 = [(TUIDSLookupManager *)self queue];
  dispatch_assert_queue_V2(v3);

  batchQuerySearchiMessageController = self->_batchQuerySearchiMessageController;
  if (!batchQuerySearchiMessageController)
  {
    v5 = [(TUIDSLookupManager *)self batchQueryControllerCreationBlock];
    uint64_t v6 = *MEMORY[0x1E4F6AA78];
    id v7 = [(TUIDSLookupManager *)self queue];
    ((void (**)(void, uint64_t, TUIDSLookupManager *, void *))v5)[2](v5, v6, self, v7);
    id v8 = (TUIDSBatchIDQueryController *)objc_claimAutoreleasedReturnValue();
    id v9 = self->_batchQuerySearchiMessageController;
    self->_batchQuerySearchiMessageController = v8;

    batchQuerySearchiMessageController = self->_batchQuerySearchiMessageController;
  }

  return batchQuerySearchiMessageController;
}

- (TUIDSBatchIDQueryController)batchQuerySearchShareNameAndPhotoController
{
  objc_super v3 = [(TUIDSLookupManager *)self queue];
  dispatch_assert_queue_V2(v3);

  batchQuerySearchShareNameAndPhotoController = self->_batchQuerySearchShareNameAndPhotoController;
  if (!batchQuerySearchShareNameAndPhotoController)
  {
    v5 = [(TUIDSLookupManager *)self batchQueryControllerCreationBlock];
    uint64_t v6 = [(TUIDSLookupManager *)self queue];
    ((void (**)(void, __CFString *, TUIDSLookupManager *, void *))v5)[2](v5, @"com.apple.private.alloy.nameandphoto", self, v6);
    id v7 = (TUIDSBatchIDQueryController *)objc_claimAutoreleasedReturnValue();
    id v8 = self->_batchQuerySearchShareNameAndPhotoController;
    self->_batchQuerySearchShareNameAndPhotoController = v7;

    batchQuerySearchShareNameAndPhotoController = self->_batchQuerySearchShareNameAndPhotoController;
  }

  return batchQuerySearchShareNameAndPhotoController;
}

- (BOOL)isFaceTimeVideoAvailableForItem:(id)a3
{
  v4 = [a3 idsCanonicalDestinations];
  LOBYTE(self) = [(TUIDSLookupManager *)self isFaceTimeVideoAvailableForAnyDestinationInDestinations:v4];

  return (char)self;
}

- (BOOL)isFaceTimeAudioAvailableForItem:(id)a3
{
  v4 = [a3 idsCanonicalDestinations];
  LOBYTE(self) = [(TUIDSLookupManager *)self isFaceTimeAudioAvailableForAnyDestinationInDestinations:v4];

  return (char)self;
}

- (BOOL)isFaceTimeMultiwayAvailableForItem:(id)a3
{
  v4 = [a3 idsCanonicalDestinations];
  LOBYTE(self) = [(TUIDSLookupManager *)self isFaceTimeMultiwayAvailableForAnyDestinationInDestinations:v4];

  return (char)self;
}

- (BOOL)isVideoMessagingAvailableForItem:(id)a3
{
  v4 = [a3 idsCanonicalDestinations];
  LOBYTE(self) = [(TUIDSLookupManager *)self isVideoMessagingAvailableForAnyDestinationInDestinations:v4];

  return (char)self;
}

- (BOOL)isFaceTimeVideoAvailableForAnyDestinationInDestinations:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(TUIDSLookupManager *)self idsFaceTimeVideoStatuses];
  LOBYTE(v5) = [v5 isAnyDestinationAvailableInDestinations:v4 usingCache:v6];

  return (char)v5;
}

- (BOOL)isFaceTimeAudioAvailableForAnyDestinationInDestinations:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(TUIDSLookupManager *)self idsFaceTimeAudioStatuses];
  LOBYTE(v5) = [v5 isAnyDestinationAvailableInDestinations:v4 usingCache:v6];

  return (char)v5;
}

- (BOOL)isFaceTimeMultiwayAvailableForAnyDestinationInDestinations:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(TUIDSLookupManager *)self idsFaceTimeMultiwayStatuses];
  LOBYTE(v5) = [v5 isAnyDestinationAvailableInDestinations:v4 usingCache:v6];

  return (char)v5;
}

- (BOOL)isVideoMessagingAvailableForAnyDestinationInDestinations:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(TUIDSLookupManager *)self idsVideoMessagingStatuses];
  LOBYTE(v5) = [v5 isAnyDestinationAvailableInDestinations:v4 usingCache:v6];

  return (char)v5;
}

- (BOOL)isiMessageAvailableForAnyDestinationInDestinations:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(TUIDSLookupManager *)self idsiMessageStatuses];
  LOBYTE(v5) = [v5 isAnyDestinationAvailableInDestinations:v4 usingCache:v6];

  return (char)v5;
}

- (BOOL)isAVLessSharePlayCapableForAnyDestinationInDestinations:(id)a3
{
  id v4 = a3;
  v5 = [(TUIDSLookupManager *)self idsAVLessSharePlayCapableStatuses];
  uint64_t v6 = [v5 object];
  char v7 = [v6 intersectsSet:v4];

  return v7;
}

- (unsigned)faceTimeAudioAvailabilityForDestination:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(TUIDSLookupManager *)self idsFaceTimeAudioStatuses];
  LODWORD(v5) = [v5 fzHandleIDStatusForDestination:v4 usingCache:v6];

  return v5;
}

- (unsigned)faceTimeVideoAvailabilityForDestination:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(TUIDSLookupManager *)self idsFaceTimeVideoStatuses];
  LODWORD(v5) = [v5 fzHandleIDStatusForDestination:v4 usingCache:v6];

  return v5;
}

- (unsigned)faceTimeMultiwayAvailabilityForDestination:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(TUIDSLookupManager *)self idsFaceTimeMultiwayStatuses];
  LODWORD(v5) = [v5 fzHandleIDStatusForDestination:v4 usingCache:v6];

  return v5;
}

- (BOOL)isModernFaceTimeAvailableForDestination:(id)a3
{
  id v4 = a3;
  v5 = [(TUIDSLookupManager *)self idsModernStatuses];
  uint64_t v6 = [v5 object];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (BOOL)isWebCapableFaceTimeAvailableForDestination:(id)a3
{
  id v4 = a3;
  v5 = [(TUIDSLookupManager *)self idsWebCapableStatuses];
  uint64_t v6 = [v5 object];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (BOOL)isNameAndPhotoAvailableForDestination:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(TUIDSLookupManager *)self idsNameAndPhotoStatuses];
  LOBYTE(v5) = [v5 isAnyDestinationAvailableInDestinations:v4 usingCache:v6];

  return (char)v5;
}

- (void)cancelQueries
{
  objc_super v3 = [(TUIDSLookupManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__TUIDSLookupManager_cancelQueries__block_invoke;
  block[3] = &unk_1E58E5BE0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __35__TUIDSLookupManager_cancelQueries__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) idsFaceTimeVideoStatuses];
  uint64_t v3 = MEMORY[0x1E4F1CC08];
  [v2 setObject:MEMORY[0x1E4F1CC08]];

  id v4 = [*(id *)(a1 + 32) idsFaceTimeAudioStatuses];
  [v4 setObject:v3];

  v5 = [*(id *)(a1 + 32) idsFaceTimeMultiwayStatuses];
  [v5 setObject:v3];

  uint64_t v6 = [*(id *)(a1 + 32) idsiMessageStatuses];
  [v6 setObject:v3];

  char v7 = [*(id *)(a1 + 32) idsModernStatuses];
  id v8 = [MEMORY[0x1E4F1CAD0] set];
  [v7 setObject:v8];

  id v9 = [*(id *)(a1 + 32) idsWebCapableStatuses];
  v10 = [MEMORY[0x1E4F1CAD0] set];
  [v9 setObject:v10];

  v11 = [*(id *)(a1 + 32) idsAVLessSharePlayCapableStatuses];
  dispatch_queue_t v12 = [MEMORY[0x1E4F1CAD0] set];
  [v11 setObject:v12];

  [*(id *)(*(void *)(a1 + 32) + 96) invalidate];
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 96);
  *(void *)(v13 + 96) = 0;

  [*(id *)(*(void *)(a1 + 32) + 104) invalidate];
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 104);
  *(void *)(v15 + 104) = 0;

  [*(id *)(*(void *)(a1 + 32) + 112) invalidate];
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(void **)(v17 + 112);
  *(void *)(v17 + 112) = 0;

  [*(id *)(*(void *)(a1 + 32) + 128) invalidate];
  uint64_t v19 = *(void *)(a1 + 32);
  v20 = *(void **)(v19 + 128);
  *(void *)(v19 + 128) = 0;

  [*(id *)(*(void *)(a1 + 32) + 136) invalidate];
  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v22 = *(void **)(v21 + 136);
  *(void *)(v21 + 136) = 0;
}

- (void)beginQueryWithDestinations:(id)a3
{
}

- (void)beginQueryWithDestinations:(id)a3 includeMessages:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 63;
  }
  else {
    uint64_t v4 = 47;
  }
  [(TUIDSLookupManager *)self beginQueryWithDestinations:a3 services:v4];
}

- (void)beginQueryWithDestinations:(id)a3 services:(unint64_t)a4
{
  id v6 = a3;
  char v7 = [(TUIDSLookupManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__TUIDSLookupManager_beginQueryWithDestinations_services___block_invoke;
  block[3] = &unk_1E58E68F0;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __58__TUIDSLookupManager_beginQueryWithDestinations_services___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 48);
  if (v2)
  {
    result = [*(id *)(result + 32) beginQueryWithDestination:*(void *)(result + 40) onService:*MEMORY[0x1E4F6AA48]];
    uint64_t v2 = *(void *)(v1 + 48);
    if ((v2 & 2) == 0)
    {
LABEL_3:
      if ((v2 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_3;
  }
  result = [*(id *)(v1 + 32) beginQueryWithDestination:*(void *)(v1 + 40) onService:*MEMORY[0x1E4F6AA50]];
  uint64_t v2 = *(void *)(v1 + 48);
  if ((v2 & 4) == 0)
  {
LABEL_4:
    if ((v2 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  result = [*(id *)(v1 + 32) beginQueryWithDestination:*(void *)(v1 + 40) onService:*MEMORY[0x1E4F6AA58]];
  uint64_t v2 = *(void *)(v1 + 48);
  if ((v2 & 8) == 0)
  {
LABEL_5:
    if ((v2 & 0x20) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    result = [*(id *)(v1 + 32) beginQueryWithDestination:*(void *)(v1 + 40) onService:@"com.apple.private.alloy.nameandphoto"];
    if ((*(void *)(v1 + 48) & 0x10) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_11:
  result = [*(id *)(v1 + 32) beginQueryWithDestination:*(void *)(v1 + 40) onService:@"com.apple.private.alloy.facetime.messaging"];
  uint64_t v2 = *(void *)(v1 + 48);
  if ((v2 & 0x20) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if ((v2 & 0x10) == 0) {
    return result;
  }
LABEL_13:
  uint64_t v3 = *(void **)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = *MEMORY[0x1E4F6AA78];

  return [v3 beginQueryWithDestination:v4 onService:v5];
}

- (id)preferredFromID
{
  uint64_t v2 = +[TUCallCapabilities outgoingRelayCallerID];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F6B5C8]) initWithUnprefixedURI:v2];

  return v3;
}

- (void)beginQueryWithDestination:(id)a3 onService:(id)a4
{
  id v6 = a4;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __58__TUIDSLookupManager_beginQueryWithDestination_onService___block_invoke;
  v20 = &unk_1E58E77B0;
  uint64_t v21 = self;
  id v7 = v6;
  id v22 = v7;
  id v8 = a3;
  id v9 = _Block_copy(&v17);
  id v10 = [(TUIDSLookupManager *)self preferredFromID];
  unint64_t v11 = [(TUIDSLookupManager *)self queryController];
  char v12 = objc_opt_respondsToSelector();

  uint64_t v13 = [(TUIDSLookupManager *)self queryController];
  v14 = [v8 allObjects];

  uint64_t v15 = *MEMORY[0x1E4F6AA60];
  v16 = [(TUIDSLookupManager *)self queue];
  if (v12) {
    [v13 requiredIDStatusForDestinations:v14 service:v7 preferredFromID:v10 listenerID:v15 queue:v16 completionBlock:v9];
  }
  else {
    [v13 refreshIDStatusForDestinations:v14 service:v7 preferredFromID:v10 listenerID:v15 queue:v16 completionBlock:v9];
  }
}

uint64_t __58__TUIDSLookupManager_beginQueryWithDestination_onService___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleIDSQueryResultWithDestinationStatus:a2 onService:*(void *)(a1 + 40)];
}

- (void)beginQueryWithRefreshForDestination:(id)a3 onService:(id)a4
{
  id v6 = a4;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __68__TUIDSLookupManager_beginQueryWithRefreshForDestination_onService___block_invoke;
  v20 = &unk_1E58E77B0;
  uint64_t v21 = self;
  id v22 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = _Block_copy(&v17);
  int v10 = objc_msgSend(v7, "isEqualToString:", @"com.apple.private.alloy.nameandphoto", v17, v18, v19, v20, v21);
  unint64_t v11 = (id *)TUBundleIdentifierNameAndPhotoUtilities;
  if (!v10) {
    unint64_t v11 = (id *)MEMORY[0x1E4F6AA60];
  }
  id v12 = *v11;
  uint64_t v13 = [(TUIDSLookupManager *)self queryController];
  v14 = [v8 allObjects];

  uint64_t v15 = [(TUIDSLookupManager *)self preferredFromID];
  v16 = [(TUIDSLookupManager *)self queue];
  [v13 refreshIDStatusForDestinations:v14 service:v7 preferredFromID:v15 listenerID:v12 queue:v16 completionBlock:v9];
}

uint64_t __68__TUIDSLookupManager_beginQueryWithRefreshForDestination_onService___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleIDSQueryResultWithDestinationStatus:a2 onService:*(void *)(a1 + 40)];
}

- (void)beginBatchQueryWithDestinations:(id)a3
{
}

- (void)beginBatchQueryWithDestinations:(id)a3 includeMessages:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 63;
  }
  else {
    uint64_t v4 = 47;
  }
  [(TUIDSLookupManager *)self beginBatchQueryWithDestinations:a3 services:v4];
}

- (void)beginBatchQueryWithDestinations:(id)a3 services:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(TUIDSLookupManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__TUIDSLookupManager_beginBatchQueryWithDestinations_services___block_invoke;
  block[3] = &unk_1E58E68F0;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __63__TUIDSLookupManager_beginBatchQueryWithDestinations_services___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    id v9 = [*(id *)(a1 + 32) batchQuerySearchAudioController];
    id v10 = [*(id *)(a1 + 40) allObjects];
    [v9 setDestinations:v10];

    uint64_t v2 = *(void *)(a1 + 48);
    if ((v2 & 2) == 0)
    {
LABEL_3:
      if ((v2 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_3;
  }
  unint64_t v11 = [*(id *)(a1 + 32) batchQuerySearchVideoController];
  id v12 = [*(id *)(a1 + 40) allObjects];
  [v11 setDestinations:v12];

  uint64_t v2 = *(void *)(a1 + 48);
  if ((v2 & 4) == 0)
  {
LABEL_4:
    if ((v2 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v13 = [*(id *)(a1 + 32) batchQuerySearchMultiwayController];
  v14 = [*(id *)(a1 + 40) allObjects];
  [v13 setDestinations:v14];

  uint64_t v2 = *(void *)(a1 + 48);
  if ((v2 & 8) == 0)
  {
LABEL_5:
    if ((v2 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v15 = [*(id *)(a1 + 32) batchQuerySearchVideoMessagingController];
  v16 = [*(id *)(a1 + 40) allObjects];
  [v15 setDestinations:v16];

  uint64_t v2 = *(void *)(a1 + 48);
  if ((v2 & 0x20) == 0)
  {
LABEL_6:
    if ((v2 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  uint64_t v17 = [*(id *)(a1 + 32) batchQuerySearchShareNameAndPhotoController];
  uint64_t v18 = [*(id *)(a1 + 40) allObjects];
  [v17 setDestinations:v18];

  if ((*(void *)(a1 + 48) & 0x10) != 0)
  {
LABEL_7:
    uint64_t v3 = [*(id *)(a1 + 32) batchQuerySearchiMessageController];
    uint64_t v4 = [*(id *)(a1 + 40) allObjects];
    [v3 setDestinations:v4];
  }
LABEL_8:
  id v19 = [*(id *)(a1 + 32) queryController];
  uint64_t v5 = [*(id *)(a1 + 40) allObjects];
  uint64_t v6 = *MEMORY[0x1E4F6AA60];
  id v7 = [*(id *)(a1 + 32) preferredFromID];
  id v8 = [*(id *)(a1 + 32) queue];
  [v19 currentIDStatusForDestinations:v5 service:v6 preferredFromID:v7 listenerID:@"com.apple.TelephonyUtilities" queue:v8 completionBlock:&__block_literal_global_84];
}

- (void)beginCachedQueryWithDestinations:(id)a3
{
}

- (void)beginCachedQueryWithDestinations:(id)a3 includeMessages:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 63;
  }
  else {
    uint64_t v4 = 47;
  }
  [(TUIDSLookupManager *)self beginCachedQueryWithDestinations:a3 services:v4];
}

- (void)beginCachedQueryWithDestinations:(id)a3 services:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(TUIDSLookupManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__TUIDSLookupManager_beginCachedQueryWithDestinations_services___block_invoke;
  block[3] = &unk_1E58E68F0;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __64__TUIDSLookupManager_beginCachedQueryWithDestinations_services___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 48);
  if (v2)
  {
    result = [*(id *)(result + 32) beginCachedQueryWithDestinations:*(void *)(result + 40) onService:*MEMORY[0x1E4F6AA48]];
    uint64_t v2 = *(void *)(v1 + 48);
    if ((v2 & 2) == 0)
    {
LABEL_3:
      if ((v2 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_3;
  }
  result = [*(id *)(v1 + 32) beginCachedQueryWithDestinations:*(void *)(v1 + 40) onService:*MEMORY[0x1E4F6AA50]];
  uint64_t v2 = *(void *)(v1 + 48);
  if ((v2 & 4) == 0)
  {
LABEL_4:
    if ((v2 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  result = [*(id *)(v1 + 32) beginCachedQueryWithDestinations:*(void *)(v1 + 40) onService:*MEMORY[0x1E4F6AA58]];
  uint64_t v2 = *(void *)(v1 + 48);
  if ((v2 & 8) == 0)
  {
LABEL_5:
    if ((v2 & 0x20) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    result = [*(id *)(v1 + 32) beginCachedQueryWithDestinations:*(void *)(v1 + 40) onService:@"com.apple.private.alloy.nameandphoto"];
    if ((*(void *)(v1 + 48) & 0x10) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_11:
  result = [*(id *)(v1 + 32) beginCachedQueryWithDestinations:*(void *)(v1 + 40) onService:@"com.apple.private.alloy.facetime.messaging"];
  uint64_t v2 = *(void *)(v1 + 48);
  if ((v2 & 0x20) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if ((v2 & 0x10) == 0) {
    return result;
  }
LABEL_13:
  uint64_t v3 = *(void **)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = *MEMORY[0x1E4F6AA78];

  return [v3 beginCachedQueryWithDestinations:v4 onService:v5];
}

- (void)beginCachedQueryWithDestinations:(id)a3 onService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUIDSLookupManager *)self queryController];
  id v9 = [v7 allObjects];

  id v10 = [(TUIDSLookupManager *)self preferredFromID];
  unint64_t v11 = [(TUIDSLookupManager *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__TUIDSLookupManager_beginCachedQueryWithDestinations_onService___block_invoke;
  v13[3] = &unk_1E58E77B0;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [v8 currentIDStatusForDestinations:v9 service:v12 preferredFromID:v10 listenerID:@"com.apple.TelephonyUtilities" queue:v11 completionBlock:v13];
}

void __65__TUIDSLookupManager_beginCachedQueryWithDestinations_onService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)[v3 mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v13);
        char v12 = [v11 isEqual:&unk_1EED24288];

        if ((v12 & 1) == 0) {
          [v4 removeObjectForKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) handleIDSQueryResultWithDestinationStatus:v4 onService:*(void *)(a1 + 40)];
}

+ (BOOL)isAnyDestinationAvailableInDestinations:(id)a3 usingCache:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a4 object];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        unint64_t v11 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        char v12 = v11;
        if (v11 && [v11 integerValue] == 1)
        {

          LOBYTE(v8) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v8;
}

+ (unsigned)fzHandleIDStatusForDestination:(id)a3 usingCache:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 object];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (v7) {
    unsigned int v8 = [v7 unsignedIntValue];
  }
  else {
    unsigned int v8 = 0;
  }

  return v8;
}

- (void)postStatusChangedNotification
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__TUIDSLookupManager_postStatusChangedNotification__block_invoke;
  block[3] = &unk_1E58E5BE0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__TUIDSLookupManager_postStatusChangedNotification__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"TUIDSLookupManagerStatusChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = TULoggableStringForObject((uint64_t)v8);
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 2112;
    long long v15 = v11;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Received query status response for service %@: %@", (uint8_t *)&v12, 0x16u);
  }
  [(TUIDSLookupManager *)self handleIDSQueryResultWithDestinationStatus:v8 onService:v9];
}

- (void)handleIDSQueryResultWithDestinationStatus:(id)a3 onService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:*MEMORY[0x1E4F6AA48]])
  {
    id v8 = [(TUIDSLookupManager *)self idsFaceTimeAudioStatuses];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke;
    v28[3] = &unk_1E58E77B0;
    id v29 = v6;
    uint64_t v30 = self;
    [v8 performWhileLocked:v28];

    [(TUIDSLookupManager *)self postStatusChangedNotification];
    id v9 = v29;
LABEL_13:

    goto LABEL_14;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F6AA50]])
  {
    uint64_t v10 = [(TUIDSLookupManager *)self idsFaceTimeVideoStatuses];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_2;
    v25[3] = &unk_1E58E77B0;
    id v26 = v6;
    v27 = self;
    [v10 performWhileLocked:v25];

    [(TUIDSLookupManager *)self postStatusChangedNotification];
    id v9 = v26;
    goto LABEL_13;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F6AA58]])
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_3;
    v23[3] = &unk_1E58E77B0;
    v23[4] = self;
    id v24 = v6;
    [(TUIDSLookupManager *)self filteredDestinationForMultiway:v24 completionBlock:v23];
    id v9 = v24;
    goto LABEL_13;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F6AA78]])
  {
    unint64_t v11 = [(TUIDSLookupManager *)self idsiMessageStatuses];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_87;
    v20[3] = &unk_1E58E77B0;
    id v21 = v6;
    id v22 = self;
    [v11 performWhileLocked:v20];

    [(TUIDSLookupManager *)self postStatusChangedNotification];
    id v9 = v21;
    goto LABEL_13;
  }
  if ([v7 isEqualToString:@"com.apple.private.alloy.facetime.messaging"])
  {
    int v12 = [(TUIDSLookupManager *)self idsVideoMessagingStatuses];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_88;
    v17[3] = &unk_1E58E77B0;
    id v18 = v6;
    uint64_t v19 = self;
    [v12 performWhileLocked:v17];

    [(TUIDSLookupManager *)self postStatusChangedNotification];
    id v9 = v18;
    goto LABEL_13;
  }
  if ([v7 isEqualToString:@"com.apple.private.alloy.nameandphoto"])
  {
    id v13 = [(TUIDSLookupManager *)self idsNameAndPhotoStatuses];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_89;
    v14[3] = &unk_1E58E77B0;
    id v15 = v6;
    uint64_t v16 = self;
    [v13 performWhileLocked:v14];

    id v9 = v15;
    goto LABEL_13;
  }
LABEL_14:
}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke(uint64_t a1, void *a2)
{
  id v5 = (id)[a2 mutableCopy];
  [v5 addEntriesFromDictionary:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) idsFaceTimeAudioStatuses];
  uint64_t v4 = (void *)[v5 copy];
  [v3 setObject:v4];
}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = (id)[a2 mutableCopy];
  [v5 addEntriesFromDictionary:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) idsFaceTimeVideoStatuses];
  uint64_t v4 = (void *)[v5 copy];
  [v3 setObject:v4];
}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) idsFaceTimeMultiwayStatuses];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  long long v17 = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_4;
  id v18 = &unk_1E58E77B0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v19 = v5;
  uint64_t v20 = v6;
  [v4 performWhileLocked:&v15];

  id v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = TULoggableStringForObject((uint64_t)v3);
    id v9 = objc_msgSend(*(id *)(a1 + 32), "idsModernStatuses", v15, v16, v17, v18);
    uint64_t v10 = TULoggableStringForObject((uint64_t)v9);
    unint64_t v11 = [*(id *)(a1 + 32) idsWebCapableStatuses];
    int v12 = TULoggableStringForObject((uint64_t)v11);
    id v13 = [*(id *)(a1 + 32) idsAVLessSharePlayCapableStatuses];
    __int16 v14 = TULoggableStringForObject((uint64_t)v13);
    *(_DWORD *)buf = 138413058;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Updated filtered destinations for Multiway service: %@ modern: %@ webCapable: %@ avLessSharePlayCapable: %@", buf, 0x2Au);
  }
  [*(id *)(a1 + 32) postStatusChangedNotification];
}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = (id)[a2 mutableCopy];
  [v5 addEntriesFromDictionary:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) idsFaceTimeMultiwayStatuses];
  uint64_t v4 = (void *)[v5 copy];
  [v3 setObject:v4];
}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_87(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a2 mutableCopy];
  [v3 addEntriesFromDictionary:*(void *)(a1 + 32)];
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = TULoggableStringForObject((uint64_t)v3);
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Updating destinations for iMessage service: %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 40) idsiMessageStatuses];
  id v7 = (void *)[v3 copy];
  [v6 setObject:v7];
}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a2 mutableCopy];
  [v3 addEntriesFromDictionary:*(void *)(a1 + 32)];
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = TULoggableStringForObject((uint64_t)v3);
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Updating destinations for video messaging service: %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 40) idsVideoMessagingStatuses];
  id v7 = (void *)[v3 copy];
  [v6 setObject:v7];
}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a2 mutableCopy];
  [v3 addEntriesFromDictionary:*(void *)(a1 + 32)];
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = TULoggableStringForObject((uint64_t)v3);
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Updating destinations for name and photo service: %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 40) idsNameAndPhotoStatuses];
  id v7 = (void *)[v3 copy];
  [v6 setObject:v7];

  [*(id *)(a1 + 40) postStatusChangedNotification];
}

- (void)filteredDestinationForMultiway:(id)a3 completionBlock:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  int v8 = (void *)[v6 mutableCopy];
  id v9 = [(id)CUTWeakLinkClass() sharedInstance];
  if ([v9 isGreenTea])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v10 = [v6 allKeys];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          [v8 setObject:&unk_1EED242A0 forKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * v14++)];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v12);
    }

    v7[2](v7, v8);
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke;
    v25[3] = &unk_1E58E77F8;
    id v16 = v15;
    id v26 = v16;
    [v6 enumerateKeysAndObjectsUsingBlock:v25];
    if ([v16 count])
    {
      long long v17 = [(TUIDSLookupManager *)self queryController];
      uint64_t v20 = *MEMORY[0x1E4F6AA58];
      id v18 = [(TUIDSLookupManager *)self preferredFromID];
      id v19 = dispatch_get_global_queue(33, 0);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_2;
      v21[3] = &unk_1E58E7870;
      id v22 = v8;
      __int16 v23 = self;
      id v24 = v7;
      [v17 currentRemoteDevicesForDestinations:v16 service:v20 preferredFromID:v18 listenerID:@"com.apple.TelephonyUtilities" queue:v19 completionBlock:v21];
    }
    else
    {
      v7[2](v7, v8);
    }
  }
}

void __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 intValue] == 1) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = a2;
  id v5 = [v3 set];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  id v7 = [MEMORY[0x1E4F1CA80] set];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_3;
  v33[3] = &unk_1E58E7820;
  id v34 = *(id *)(a1 + 32);
  id v8 = v6;
  id v35 = v8;
  id v9 = v5;
  id v36 = v9;
  id v10 = v7;
  id v37 = v10;
  [v4 enumerateKeysAndObjectsUsingBlock:v33];

  uint64_t v11 = [*(id *)(a1 + 40) idsWebCapableStatuses];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_105;
  v30[3] = &unk_1E58E7848;
  id v12 = v9;
  uint64_t v13 = *(void *)(a1 + 40);
  id v31 = v12;
  uint64_t v32 = v13;
  [v11 performWhileLocked:v30];

  uint64_t v14 = [*(id *)(a1 + 40) idsModernStatuses];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_2_107;
  v27[3] = &unk_1E58E7848;
  id v15 = v8;
  uint64_t v16 = *(void *)(a1 + 40);
  id v28 = v15;
  uint64_t v29 = v16;
  [v14 performWhileLocked:v27];

  long long v17 = [*(id *)(a1 + 40) idsAVLessSharePlayCapableStatuses];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_3_108;
  v24[3] = &unk_1E58E7848;
  id v18 = v10;
  uint64_t v19 = *(void *)(a1 + 40);
  id v25 = v18;
  uint64_t v26 = v19;
  [v17 performWhileLocked:v24];

  uint64_t v20 = TUDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = TULoggableStringForObject(*(void *)(a1 + 32));
    *(_DWORD *)buf = 138412290;
    v39 = v21;
    _os_log_impl(&dword_19C496000, v20, OS_LOG_TYPE_DEFAULT, "Updated filtered destinations for Multiway service: %@", buf, 0xCu);
  }
  (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), v22, v23);
}

void __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v25 = *(void *)v27;
    uint64_t v24 = *MEMORY[0x1E4F6B268];
    uint64_t v8 = *MEMORY[0x1E4F6B288];
    uint64_t v22 = *MEMORY[0x1E4F6B278];
    uint64_t v9 = *MEMORY[0x1E4F6B270];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v12 = [v11 capabilities];
        uint64_t v13 = [v12 valueForCapability:v24];

        if (v13) {
          uint64_t v14 = &unk_1EED242A0;
        }
        else {
          uint64_t v14 = &unk_1EED242B8;
        }
        [a1[4] setObject:v14 forKeyedSubscript:v5];
        id v15 = [v11 capabilities];
        uint64_t v16 = [v15 valueForCapability:v8];

        long long v17 = a1 + 5;
        if (v16
          || ([v11 capabilities],
              id v18 = objc_claimAutoreleasedReturnValue(),
              uint64_t v19 = [v18 valueForCapability:v22],
              v18,
              long long v17 = a1 + 6,
              v19))
        {
          [*v17 addObject:v5];
        }
        uint64_t v20 = [v11 capabilities];
        uint64_t v21 = [v20 valueForCapability:v9];

        if (v21) {
          [a1[7] addObject:v5];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }
}

void __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_105(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) unionSet:a2];
  id v4 = [*(id *)(a1 + 40) idsWebCapableStatuses];
  id v3 = (void *)[*(id *)(a1 + 32) copy];
  [v4 setObject:v3];
}

void __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_2_107(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) unionSet:a2];
  id v4 = [*(id *)(a1 + 40) idsModernStatuses];
  id v3 = (void *)[*(id *)(a1 + 32) copy];
  [v4 setObject:v3];
}

void __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_3_108(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) unionSet:a2];
  id v4 = [*(id *)(a1 + 40) idsAVLessSharePlayCapableStatuses];
  id v3 = (void *)[*(id *)(a1 + 32) copy];
  [v4 setObject:v3];
}

- (void)queryHasWebOnlyEndpointsForDestinations:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F6B4F8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F6B278]];
  uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F6B288]];
  id v12 = (id)[v9 initWithRequiredCapabilities:v10 requiredMissingCapabilities:v11];

  [(TUIDSLookupManager *)self queryHasEndpointWithCapabilities:v12 forMultiwayDestinations:v8 completionBlock:v7];
}

- (void)queryHasEndpointWithCapabilities:(id)a3 forMultiwayDestinations:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(TUIDSLookupManager *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__TUIDSLookupManager_queryHasEndpointWithCapabilities_forMultiwayDestinations_completionBlock___block_invoke;
  v15[3] = &unk_1E58E7670;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __95__TUIDSLookupManager_queryHasEndpointWithCapabilities_forMultiwayDestinations_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queryController];
  uint64_t v3 = *MEMORY[0x1E4F6AA58];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) preferredFromID];
  uint64_t v6 = dispatch_get_global_queue(33, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__TUIDSLookupManager_queryHasEndpointWithCapabilities_forMultiwayDestinations_completionBlock___block_invoke_2;
  v7[3] = &unk_1E58E78C0;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v2 currentRemoteDevicesForDestinations:v4 service:v3 preferredFromID:v5 listenerID:@"com.apple.TelephonyUtilities" queue:v6 completionBlock:v7];
}

void __95__TUIDSLookupManager_queryHasEndpointWithCapabilities_forMultiwayDestinations_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __95__TUIDSLookupManager_queryHasEndpointWithCapabilities_forMultiwayDestinations_completionBlock___block_invoke_3;
  v6[3] = &unk_1E58E7898;
  id v7 = *(id *)(a1 + 32);
  id v8 = &v9;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *((unsigned __int8 *)v10 + 24), v4, v5);

  _Block_object_dispose(&v9, 8);
}

void __95__TUIDSLookupManager_queryHasEndpointWithCapabilities_forMultiwayDestinations_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v24 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = a3;
  uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v7 = objc_msgSend(*(id *)(a1 + 32), "requiredCapabilities", v24);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v33;
          int v11 = 1;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v33 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * j);
              id v14 = [v6 capabilities];
              LODWORD(v13) = [v14 valueForCapability:v13] != 0;

              v11 &= v13;
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v41 count:16];
          }
          while (v9);

          if (!v11) {
            continue;
          }
        }
        else
        {
        }
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v15 = [*(id *)(a1 + 32) requiredMissingCapabilities];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v40 count:16];
        if (!v16)
        {

LABEL_26:
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          unsigned char *v24 = 1;
          continue;
        }
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v29;
        LOBYTE(v19) = 1;
        do
        {
          for (uint64_t k = 0; k != v17; ++k)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * k);
            uint64_t v22 = [v6 capabilities];
            uint64_t v23 = [v22 valueForCapability:v21];

            int v19 = (v23 == 0) & v19;
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v40 count:16];
        }
        while (v17);

        if (v19) {
          goto LABEL_26;
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v27);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUIDSIDQueryController)queryController
{
  return self->_queryController;
}

- (TULocked)idsFaceTimeVideoStatuses
{
  return self->_idsFaceTimeVideoStatuses;
}

- (TULocked)idsFaceTimeAudioStatuses
{
  return self->_idsFaceTimeAudioStatuses;
}

- (TULocked)idsFaceTimeMultiwayStatuses
{
  return self->_idsFaceTimeMultiwayStatuses;
}

- (TULocked)idsVideoMessagingStatuses
{
  return self->_idsVideoMessagingStatuses;
}

- (TULocked)idsiMessageStatuses
{
  return self->_idsiMessageStatuses;
}

- (TULocked)idsNameAndPhotoStatuses
{
  return self->_idsNameAndPhotoStatuses;
}

- (TULocked)idsModernStatuses
{
  return self->_idsModernStatuses;
}

- (TULocked)idsWebCapableStatuses
{
  return self->_idsWebCapableStatuses;
}

- (TULocked)idsAVLessSharePlayCapableStatuses
{
  return self->_idsAVLessSharePlayCapableStatuses;
}

- (void)setBatchQuerySearchVideoController:(id)a3
{
}

- (void)setBatchQuerySearchAudioController:(id)a3
{
}

- (void)setBatchQuerySearchMultiwayController:(id)a3
{
}

- (void)setBatchQuerySearchVideoMessagingController:(id)a3
{
}

- (void)setBatchQuerySearchiMessageController:(id)a3
{
}

- (void)setBatchQuerySearchShareNameAndPhotoController:(id)a3
{
}

- (id)batchQueryControllerCreationBlock
{
  return self->_batchQueryControllerCreationBlock;
}

- (void)setBatchQueryControllerCreationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_batchQueryControllerCreationBlock, 0);
  objc_storeStrong((id *)&self->_batchQuerySearchShareNameAndPhotoController, 0);
  objc_storeStrong((id *)&self->_batchQuerySearchiMessageController, 0);
  objc_storeStrong((id *)&self->_batchQuerySearchVideoMessagingController, 0);
  objc_storeStrong((id *)&self->_batchQuerySearchMultiwayController, 0);
  objc_storeStrong((id *)&self->_batchQuerySearchAudioController, 0);
  objc_storeStrong((id *)&self->_batchQuerySearchVideoController, 0);
  objc_storeStrong((id *)&self->_idsAVLessSharePlayCapableStatuses, 0);
  objc_storeStrong((id *)&self->_idsWebCapableStatuses, 0);
  objc_storeStrong((id *)&self->_idsModernStatuses, 0);
  objc_storeStrong((id *)&self->_idsNameAndPhotoStatuses, 0);
  objc_storeStrong((id *)&self->_idsiMessageStatuses, 0);
  objc_storeStrong((id *)&self->_idsVideoMessagingStatuses, 0);
  objc_storeStrong((id *)&self->_idsFaceTimeMultiwayStatuses, 0);
  objc_storeStrong((id *)&self->_idsFaceTimeAudioStatuses, 0);
  objc_storeStrong((id *)&self->_idsFaceTimeVideoStatuses, 0);
  objc_storeStrong((id *)&self->_queryController, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end