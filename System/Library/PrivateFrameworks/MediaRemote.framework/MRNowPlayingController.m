@interface MRNowPlayingController
+ (id)localRouteController;
+ (id)proactiveEndpointController;
+ (id)userSelectedEndpointController;
+ (void)performRequest:(id)a3 withCompletion:(id)a4;
+ (void)sendCommand:(unsigned int)a3 toDestination:(id)a4 options:(id)a5 appOptions:(unsigned int)a6 withCompletion:(id)a7;
- (MRDestination)destination;
- (MRNowPlayingController)initWithConfiguration:(id)a3;
- (MRNowPlayingController)initWithDestination:(id)a3;
- (MRNowPlayingController)initWithUID:(id)a3;
- (MRNowPlayingControllerConfiguration)configuration;
- (MRNowPlayingControllerDelegate)delegate;
- (MRNowPlayingControllerImpl)impl;
- (MRNowPlayingPlayerResponse)response;
- (NSDate)allocationDate;
- (NSDate)beginDate;
- (NSDate)endDate;
- (NSDate)lastErrorDate;
- (NSDate)lastInitialLoadDate;
- (NSDate)lastInvalidationDate;
- (NSDate)lastUpdateDate;
- (NSError)lastError;
- (OS_dispatch_queue)workerQueue;
- (id)_createImplWithConfiguration:(id)a3;
- (id)_makeHelper;
- (id)debugDescription;
- (id)description;
- (id)playerPath;
- (void)_notifyDelegateOfError:(id)a3;
- (void)_notifyDelegateOfInvalidation;
- (void)_notifyDelegateOfNewResponse:(id)a3;
- (void)_notifyDelegateOfPlaybackQueueChange:(id)a3;
- (void)_notifyDelegateOfPlaybackStateChange:(unsigned int)a3;
- (void)_notifyDelegateOfPlayerPathChange:(id)a3;
- (void)_notifyDelegateOfSupportedCommandsChange:(id)a3;
- (void)_notifyDelegateOfUpdate;
- (void)_notifyDelegateOfUpdatedArtwork:(id)a3;
- (void)_notifyDelegateOfUpdatedClientProperties:(id)a3;
- (void)_notifyDelegateOfUpdatedContentItemsWithContentItems:(id)a3;
- (void)_notifyDelegateOfUpdatedDeviceLastPlayingDate:(id)a3;
- (void)_notifyDelegateOfUpdatedPlayerLastPlayingDate:(id)a3;
- (void)beginLoadingUpdates;
- (void)dealloc;
- (void)endLoadingUpdates;
- (void)performRequestWithCompletion:(id)a3;
- (void)sendCommand:(unsigned int)a3 options:(id)a4 appOptions:(unsigned int)a5 completion:(id)a6;
- (void)sendCommand:(unsigned int)a3 options:(id)a4 completion:(id)a5;
- (void)setAllocationDate:(id)a3;
- (void)setBeginDate:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setImpl:(id)a3;
- (void)setLastError:(id)a3;
- (void)setLastErrorDate:(id)a3;
- (void)setLastInitialLoadDate:(id)a3;
- (void)setLastInvalidationDate:(id)a3;
- (void)setLastUpdateDate:(id)a3;
- (void)setResponse:(id)a3;
- (void)setWorkerQueue:(id)a3;
@end

@implementation MRNowPlayingController

+ (id)localRouteController
{
  v2 = [MRNowPlayingController alloc];
  v3 = +[MRDestination localDestination];
  v4 = [(MRNowPlayingController *)v2 initWithDestination:v3];

  return v4;
}

+ (id)userSelectedEndpointController
{
  v2 = [[MRNowPlayingController alloc] initWithUID:@"userSelectedEndpoint"];

  return v2;
}

+ (id)proactiveEndpointController
{
  v2 = [[MRNowPlayingController alloc] initWithUID:@"proactiveEndpoint"];

  return v2;
}

- (MRNowPlayingController)initWithUID:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"proactiveEndpoint"])
  {
    v5 = +[MRDestination proactiveDestination];
  }
  else if ([v4 isEqualToString:@"userSelectedEndpoint"])
  {
    v5 = +[MRDestination userSelectedDestination];
  }
  else
  {
    v5 = [[MRDestination alloc] initWithOutputDeviceUID:v4];
  }
  v6 = v5;
  v7 = [(MRNowPlayingController *)self initWithDestination:v5];

  return v7;
}

- (MRNowPlayingController)initWithDestination:(id)a3
{
  id v4 = a3;
  v5 = [[MRNowPlayingControllerConfiguration alloc] initWithDestination:v4];

  [(MRNowPlayingControllerConfiguration *)v5 setRequestPlaybackQueue:1];
  [(MRNowPlayingControllerConfiguration *)v5 setRequestSupportedCommands:1];
  [(MRNowPlayingControllerConfiguration *)v5 setRequestPlaybackState:1];
  v6 = [(MRNowPlayingController *)self initWithConfiguration:v5];

  return v6;
}

- (MRNowPlayingController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRNowPlayingController;
  v6 = [(MRNowPlayingController *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
    allocationDate = v6->_allocationDate;
    v6->_allocationDate = (NSDate *)v7;

    objc_storeStrong((id *)&v6->_configuration, a3);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MediaRemote.MRNowPlayingController.workerQueue", v9);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v10;

    v12 = +[MRMediaRemoteServiceClient sharedServiceClient];
    [v12 addNowPlayingController:v6];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = self;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingController] <%@> Deallocating.", buf, 0xCu);
  }

  [(MRNowPlayingController *)self endLoadingUpdates];
  id v4 = +[MRMediaRemoteServiceClient sharedServiceClient];
  [v4 removeNowPlayingController:self];

  v5.receiver = self;
  v5.super_class = (Class)MRNowPlayingController;
  [(MRNowPlayingController *)&v5 dealloc];
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(MRNowPlayingController *)v2 configuration];
  v6 = [v3 stringWithFormat:@"<%@: %p> %@ %@", v4, v2, v5, v2->_impl];

  objc_sync_exit(v2);

  return v6;
}

- (id)debugDescription
{
  id v35 = [NSString alloc];
  uint64_t v33 = objc_opt_class();
  v38 = [(MRNowPlayingController *)self configuration];
  v32 = MRCreateIndentedDebugDescriptionFromObject(v38);
  v41 = [(MRNowPlayingController *)self allocationDate];
  v37 = [(MRNowPlayingController *)self allocationDate];
  [v37 timeIntervalSinceNow];
  double v4 = -v3;
  v30 = [(MRNowPlayingController *)self beginDate];
  v36 = [(MRNowPlayingController *)self beginDate];
  [v36 timeIntervalSinceNow];
  double v6 = -v5;
  v40 = [(MRNowPlayingController *)self endDate];
  v34 = [(MRNowPlayingController *)self endDate];
  [v34 timeIntervalSinceNow];
  double v8 = -v7;
  v39 = [(MRNowPlayingController *)self lastInitialLoadDate];
  v31 = [(MRNowPlayingController *)self lastInitialLoadDate];
  [v31 timeIntervalSinceNow];
  double v10 = -v9;
  v27 = [(MRNowPlayingController *)self lastUpdateDate];
  v29 = [(MRNowPlayingController *)self lastUpdateDate];
  [v29 timeIntervalSinceNow];
  double v12 = -v11;
  v26 = [(MRNowPlayingController *)self lastInvalidationDate];
  v28 = [(MRNowPlayingController *)self lastInvalidationDate];
  [v28 timeIntervalSinceNow];
  double v14 = -v13;
  v15 = [(MRNowPlayingController *)self lastErrorDate];
  v16 = [(MRNowPlayingController *)self lastErrorDate];
  [v16 timeIntervalSinceNow];
  double v18 = -v17;
  v19 = [(MRNowPlayingController *)self lastError];
  v20 = [(MRNowPlayingController *)self impl];
  v21 = MRCreateIndentedDebugDescriptionFromObject(v20);
  v22 = [(MRNowPlayingController *)self response];
  v23 = MRCreateIndentedDebugDescriptionFromObject(v22);
  v24 = objc_msgSend(v35, "initWithFormat:", @"<%@ %p {\n   configuration=      %@   allocationDate=     %@ (%lf seconds ago)\n   beginDate=          %@ (%lf seconds ago)\n   endDate=            %@ (%lf seconds ago)\n   intialLoadDate=     %@ (%lf seconds ago)\n   updateDate=         %@ (%lf seconds ago)\n   invalidationDate=   %@ (%lf seconds ago)\n   lastErrorDate=      %@ (%lf seconds ago)\n   lastError=          %@\n   impl=               %@\n   response=           %@\n}>\n", v33, self, v32, v41, *(void *)&v4, v30, *(void *)&v6, v40, *(void *)&v8, v39, *(void *)&v10, v27, *(void *)&v12, v26, *(void *)&v14, v15,
                  *(void *)&v18,
                  v19,
                  v21,
                  v23);

  return v24;
}

- (void)setDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (MRNowPlayingControllerImpl)impl
{
  v2 = self;
  objc_sync_enter(v2);
  impl = v2->_impl;
  if (!impl)
  {
    uint64_t v4 = [(MRNowPlayingController *)v2 _createImplWithConfiguration:v2->_configuration];
    double v5 = v2->_impl;
    v2->_impl = (MRNowPlayingControllerImpl *)v4;

    double v6 = [(MRNowPlayingController *)v2 _makeHelper];
    [(MRNowPlayingControllerImpl *)v2->_impl setHelper:v6];

    impl = v2->_impl;
  }
  double v7 = impl;
  objc_sync_exit(v2);

  return v7;
}

- (void)beginLoadingUpdates
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] now];
  beginDate = obj->_beginDate;
  obj->_beginDate = (NSDate *)v2;

  uint64_t v4 = [(MRNowPlayingController *)obj impl];
  [v4 beginLoadingUpdates];

  objc_sync_exit(obj);
}

- (void)endLoadingUpdates
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] now];
  endDate = obj->_endDate;
  obj->_endDate = (NSDate *)v2;

  [(MRNowPlayingControllerImpl *)obj->_impl setHelper:0];
  impl = obj->_impl;
  obj->_impl = 0;

  objc_sync_exit(obj);
}

- (void)performRequestWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = objc_opt_class();
  double v6 = [(MRNowPlayingController *)self configuration];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__MRNowPlayingController_performRequestWithCompletion___block_invoke;
  v8[3] = &unk_1E57D3E50;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 performRequest:v6 withCompletion:v8];
}

void __55__MRNowPlayingController_performRequestWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  id v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);
}

+ (void)performRequest:(id)a3 withCompletion:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"MRNowPlayingController.m", 448, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [MEMORY[0x1E4F29128] UUID];
  double v10 = [v9 UUIDString];

  double v11 = [MEMORY[0x1E4F1C9C8] now];
  double v12 = (void *)[v7 copy];
  [v12 setSingleShot:1];
  double v13 = (void *)[[NSString alloc] initWithFormat:@"performRequestWithCompletion<%@>", v10];
  [v12 setLabel:v13];

  double v14 = [[MRNowPlayingController alloc] initWithConfiguration:v12];
  v15 = objc_alloc_init(MRNowPlayingControllerHelper);
  v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"NowPlayingController<%p>.performRequestWithCompletion", v14);
  double v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v16, v10];
  double v18 = v17;
  if (v7) {
    [v17 appendFormat:@" for %@", v7];
  }
  v19 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v53 = v18;
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __56__MRNowPlayingController_performRequest_withCompletion___block_invoke;
  v44[3] = &unk_1E57D3318;
  v45 = v14;
  id v46 = v7;
  id v47 = v16;
  id v48 = v10;
  v50 = v15;
  id v51 = v8;
  id v49 = v11;
  v20 = v15;
  id v21 = v8;
  id v22 = v11;
  id v23 = v10;
  id v24 = v16;
  id v25 = v7;
  v26 = v14;
  v27 = (void *)MEMORY[0x1997190F0](v44);
  v28 = [MRBlockGuard alloc];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_268;
  v42[3] = &unk_1E57D0FE8;
  id v29 = v27;
  id v43 = v29;
  v30 = [(MRBlockGuard *)v28 initWithTimeout:v24 reason:v42 handler:30.0];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_2;
  v39[3] = &unk_1E57D89D8;
  v31 = v30;
  v40 = v31;
  id v32 = v29;
  id v41 = v32;
  [(MRNowPlayingControllerHelper *)v20 setDidLoadResponse:v39];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_3;
  v36[3] = &unk_1E57D1DA0;
  v37 = v31;
  id v38 = v32;
  id v33 = v32;
  v34 = v31;
  [(MRNowPlayingControllerHelper *)v20 setDidFailWithError:v36];
  [(MRNowPlayingController *)v26 setDelegate:v20];
  [(MRNowPlayingController *)v26 beginLoadingUpdates];
}

void __56__MRNowPlayingController_performRequest_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) endLoadingUpdates];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = _MRLogForCategory(0xAuLL);
  id v9 = v8;
  if (v5 && !v6)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        uint64_t v12 = *(void *)(a1 + 48);
        uint64_t v11 = *(void *)(a1 + 56);
        uint64_t v13 = *(void *)(a1 + 40);
        double v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 64)];
        int v35 = 138544386;
        uint64_t v36 = v12;
        __int16 v37 = 2114;
        uint64_t v38 = v11;
        __int16 v39 = 2112;
        id v40 = v5;
        __int16 v41 = 2114;
        uint64_t v42 = v13;
        __int16 v43 = 2048;
        uint64_t v44 = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        double v17 = v9;
        uint32_t v18 = 52;
LABEL_16:
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v35, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10) {
      goto LABEL_22;
    }
    uint64_t v29 = *(void *)(a1 + 48);
    uint64_t v30 = *(void *)(a1 + 56);
    double v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 64)];
    int v35 = 138544130;
    uint64_t v36 = v29;
    __int16 v37 = 2114;
    uint64_t v38 = v30;
    __int16 v39 = 2112;
    id v40 = v5;
    __int16 v41 = 2048;
    uint64_t v42 = v31;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    double v17 = v9;
    uint32_t v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    BOOL v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        uint64_t v21 = *(void *)(a1 + 48);
        uint64_t v20 = *(void *)(a1 + 56);
        uint64_t v22 = *(void *)(a1 + 40);
        double v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 64)];
        int v35 = 138544386;
        uint64_t v36 = v21;
        __int16 v37 = 2114;
        uint64_t v38 = v20;
        __int16 v39 = 2114;
        id v40 = v6;
        __int16 v41 = 2114;
        uint64_t v42 = v22;
        __int16 v43 = 2048;
        uint64_t v44 = v23;
        _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v35, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_cold_1(a1);
    }
    goto LABEL_22;
  }
  BOOL v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24) {
      goto LABEL_22;
    }
    uint64_t v32 = *(void *)(a1 + 48);
    uint64_t v33 = *(void *)(a1 + 56);
    double v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 64)];
    int v35 = 138543874;
    uint64_t v36 = v32;
    __int16 v37 = 2114;
    uint64_t v38 = v33;
    __int16 v39 = 2048;
    id v40 = v34;
    v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    double v17 = v9;
    uint32_t v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    uint64_t v26 = *(void *)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 56);
    v27 = *(void **)(a1 + 40);
    double v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 64)];
    int v35 = 138544130;
    uint64_t v36 = v26;
    __int16 v37 = 2114;
    uint64_t v38 = v25;
    __int16 v39 = 2114;
    id v40 = v27;
    __int16 v41 = 2048;
    uint64_t v42 = v28;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  [*(id *)(a1 + 72) setDidLoadResponse:0];
  [*(id *)(a1 + 72) setDidFailWithError:0];
}

uint64_t __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_268(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)sendCommand:(unsigned int)a3 toDestination:(id)a4 options:(id)a5 appOptions:(unsigned int)a6 withCompletion:(id)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a7;
  uint64_t v12 = [[MRNowPlayingControllerConfiguration alloc] initWithDestination:v9];
  [(MRNowPlayingControllerConfiguration *)v12 setSingleShot:1];
  uint64_t v44 = v12;
  uint64_t v13 = [[MRNowPlayingController alloc] initWithConfiguration:v12];
  double v14 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteOptionCommandID"];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    double v17 = [MEMORY[0x1E4F29128] UUID];
    id v16 = [v17 UUIDString];
  }
  uint32_t v18 = [MEMORY[0x1E4F1C9C8] now];
  BOOL v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"NowPlayingController<%p>.sendCommand", v13);
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v19, v16];
  uint64_t v21 = v20;
  if (v9) {
    [v20 appendFormat:@" for %@", v9];
  }
  uint64_t v22 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v64 = v21;
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  qos_class_t v23 = qos_class_self();
  BOOL v24 = dispatch_get_global_queue(v23, 0);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke;
  v56[3] = &unk_1E57D8A00;
  id v57 = v9;
  id v58 = v19;
  id v59 = v16;
  id v60 = v18;
  id v25 = v24;
  id v61 = v25;
  id v62 = v11;
  id v41 = v11;
  id v40 = v18;
  id v26 = v16;
  id v27 = v19;
  id v28 = v9;
  uint64_t v29 = (void *)MEMORY[0x1997190F0](v56);
  uint64_t v30 = [MRBlockGuard alloc];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_2;
  v54[3] = &unk_1E57D0FE8;
  id v31 = v29;
  id v55 = v31;
  uint64_t v32 = [(MRBlockGuard *)v30 initWithTimeout:v27 reason:v54 handler:45.0];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_3;
  v51[3] = &unk_1E57D5628;
  v52 = v32;
  id v53 = v31;
  id v33 = v31;
  v34 = v32;
  int v35 = (void *)MEMORY[0x1997190F0](v51);
  uint64_t v36 = [(MRNowPlayingController *)v13 impl];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_4;
  v45[3] = &unk_1E57D8A28;
  unsigned int v49 = a3;
  unsigned int v50 = a6;
  id v46 = v10;
  id v47 = v25;
  id v48 = v35;
  id v37 = v35;
  id v38 = v25;
  id v39 = v10;
  [v36 destinationWithCompletion:v45];
}

void __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v3 && !v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = _MRLogForCategory(0xAuLL);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 48);
        uint64_t v10 = *(void *)(a1 + 32);
        id v11 = [MEMORY[0x1E4F1C9C8] date];
        [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544386;
        uint64_t v40 = v9;
        __int16 v41 = 2114;
        uint64_t v42 = v8;
        __int16 v43 = 2112;
        id v44 = v3;
        __int16 v45 = 2114;
        uint64_t v46 = v10;
        __int16 v47 = 2048;
        uint64_t v48 = v12;
        uint64_t v13 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        double v14 = v6;
        uint32_t v15 = 52;
LABEL_16:
        _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v7) {
      goto LABEL_22;
    }
    uint64_t v30 = *(void *)(a1 + 40);
    uint64_t v31 = *(void *)(a1 + 48);
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544130;
    uint64_t v40 = v30;
    __int16 v41 = 2114;
    uint64_t v42 = v31;
    __int16 v43 = 2112;
    id v44 = v3;
    __int16 v45 = 2048;
    uint64_t v46 = v32;
    uint64_t v13 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    double v14 = v6;
    uint32_t v15 = 42;
    goto LABEL_16;
  }
  id v16 = [v3 error];

  uint64_t v17 = *(void *)(a1 + 32);
  uint32_t v18 = _MRLogForCategory(0xAuLL);
  id v6 = v18;
  if (v16)
  {
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
      {
        uint64_t v20 = *(void *)(a1 + 40);
        uint64_t v21 = *(void *)(a1 + 48);
        id v11 = [v3 error];
        uint64_t v22 = *(void *)(a1 + 32);
        qos_class_t v23 = [MEMORY[0x1E4F1C9C8] date];
        [v23 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544386;
        uint64_t v40 = v20;
        __int16 v41 = 2114;
        uint64_t v42 = v21;
        __int16 v43 = 2114;
        id v44 = v11;
        __int16 v45 = 2114;
        uint64_t v46 = v22;
        __int16 v47 = 2048;
        uint64_t v48 = v24;
        _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);

LABEL_17:
        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_cold_1(a1, v3);
    }
    goto LABEL_22;
  }
  BOOL v25 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (!v17)
  {
    if (!v25) {
      goto LABEL_22;
    }
    uint64_t v33 = *(void *)(a1 + 40);
    uint64_t v34 = *(void *)(a1 + 48);
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138543874;
    uint64_t v40 = v33;
    __int16 v41 = 2114;
    uint64_t v42 = v34;
    __int16 v43 = 2048;
    id v44 = v35;
    uint64_t v13 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    double v14 = v6;
    uint32_t v15 = 32;
    goto LABEL_16;
  }
  if (v25)
  {
    uint64_t v27 = *(void *)(a1 + 40);
    uint64_t v26 = *(void *)(a1 + 48);
    id v28 = *(void **)(a1 + 32);
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544130;
    uint64_t v40 = v27;
    __int16 v41 = 2114;
    uint64_t v42 = v26;
    __int16 v43 = 2114;
    id v44 = v28;
    __int16 v45 = 2048;
    uint64_t v46 = v29;
    uint64_t v13 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  id v37 = v3;
  id v38 = *(id *)(a1 + 72);
  id v36 = v3;
  msv_dispatch_async_on_queue();
}

uint64_t __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_274(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = [[MRCommandResult alloc] initWithWithSendError:5 description:@"Timedout waiting for command result"];
  (*(void (**)(uint64_t, MRCommandResult *))(v1 + 16))(v1, v2);
}

void __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v9 origin];

  if (v6)
  {
    MRMediaRemoteSendCommandToPlayerWithResult(*(unsigned int *)(a1 + 56), *(void **)(a1 + 32), v9, *(unsigned int *)(a1 + 60), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = [[MRCommandResult alloc] initWithError:v5];
    (*(void (**)(uint64_t, MRCommandResult *))(v7 + 16))(v7, v8);
  }
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 completion:(id)a5
{
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 appOptions:(unsigned int)a5 completion:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a6;
  uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"NowPlayingController<%p>.sendCommand", self);
  id v11 = [v8 objectForKeyedSubscript:@"kMRMediaRemoteOptionCommandID"];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    double v14 = [MEMORY[0x1E4F29128] UUID];
    id v13 = [v14 UUIDString];
  }
  uint32_t v15 = [MEMORY[0x1E4F1C9C8] now];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v10, v13];
  uint64_t v17 = [(MRNowPlayingController *)self configuration];
  uint32_t v18 = [v17 destination];

  if (v18)
  {
    BOOL v19 = [(MRNowPlayingController *)self configuration];
    uint64_t v20 = [v19 destination];
    [v16 appendFormat:@" for %@", v20];
  }
  __int16 v41 = v8;
  uint64_t v21 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v53 = v16;
    _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __68__MRNowPlayingController_sendCommand_options_appOptions_completion___block_invoke;
  v47[3] = &unk_1E57D54C8;
  v47[4] = self;
  id v22 = v10;
  id v48 = v22;
  id v23 = v13;
  id v49 = v23;
  id v24 = v15;
  id v50 = v24;
  id v25 = v9;
  id v51 = v25;
  uint64_t v26 = (void *)MEMORY[0x1997190F0](v47);
  uint64_t v27 = [MRBlockGuard alloc];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __68__MRNowPlayingController_sendCommand_options_appOptions_completion___block_invoke_282;
  v45[3] = &unk_1E57D0FE8;
  id v28 = v26;
  id v46 = v28;
  uint64_t v29 = [(MRBlockGuard *)v27 initWithTimeout:v22 reason:v45 handler:45.0];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __68__MRNowPlayingController_sendCommand_options_appOptions_completion___block_invoke_2;
  v42[3] = &unk_1E57D5628;
  uint64_t v30 = v29;
  __int16 v43 = v30;
  id v31 = v28;
  id v44 = v31;
  uint64_t v32 = (void *)MEMORY[0x1997190F0](v42);
  uint64_t v33 = [(MRNowPlayingController *)self playerPath];
  uint64_t v34 = [v33 origin];

  if (v34)
  {
    int v35 = [(MRNowPlayingController *)self workerQueue];
    id v36 = v41;
    MRMediaRemoteSendCommandToPlayerWithResult(a3, v41, v33, a5, v35, v32);
  }
  else
  {
    uint64_t v37 = objc_opt_class();
    int v35 = [(MRNowPlayingControllerConfiguration *)self->_configuration destination];
    id v38 = (void *)v37;
    id v36 = v41;
    [v38 sendCommand:a3 toDestination:v35 options:v41 appOptions:a5 withCompletion:v32];
  }
}

void __68__MRNowPlayingController_sendCommand_options_appOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v3 && !v4)
  {
    id v5 = [*(id *)(a1 + 32) configuration];
    id v6 = [v5 destination];

    uint64_t v7 = _MRLogForCategory(0xAuLL);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v8) {
        goto LABEL_23;
      }
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      id v11 = [*(id *)(a1 + 32) configuration];
      uint64_t v12 = [v11 destination];
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v41 = 138544386;
      uint64_t v42 = v10;
      __int16 v43 = 2114;
      uint64_t v44 = v9;
      __int16 v45 = 2112;
      id v46 = v3;
      __int16 v47 = 2114;
      id v48 = v12;
      __int16 v49 = 2048;
      uint64_t v50 = v14;
      uint32_t v15 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      id v16 = v7;
      uint32_t v17 = 52;
LABEL_13:
      _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v41, v17);
LABEL_14:

LABEL_22:
      goto LABEL_23;
    }
    if (!v8) {
      goto LABEL_23;
    }
    uint64_t v31 = *(void *)(a1 + 40);
    uint64_t v32 = *(void *)(a1 + 48);
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v41 = 138544130;
    uint64_t v42 = v31;
    __int16 v43 = 2114;
    uint64_t v44 = v32;
    __int16 v45 = 2112;
    id v46 = v3;
    __int16 v47 = 2048;
    id v48 = v33;
    uint64_t v34 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    int v35 = v7;
    uint32_t v36 = 42;
    goto LABEL_21;
  }
  uint32_t v18 = [v3 error];

  BOOL v19 = [*(id *)(a1 + 32) configuration];
  uint64_t v20 = [v19 destination];

  uint64_t v21 = _MRLogForCategory(0xAuLL);
  uint64_t v7 = v21;
  if (!v18)
  {
    BOOL v27 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (!v27) {
        goto LABEL_23;
      }
      uint64_t v29 = *(void *)(a1 + 40);
      uint64_t v28 = *(void *)(a1 + 48);
      id v11 = [*(id *)(a1 + 32) configuration];
      uint64_t v12 = [v11 destination];
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:*(void *)(a1 + 56)];
      int v41 = 138544130;
      uint64_t v42 = v29;
      __int16 v43 = 2114;
      uint64_t v44 = v28;
      __int16 v45 = 2114;
      id v46 = v12;
      __int16 v47 = 2048;
      id v48 = v30;
      uint32_t v15 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v16 = v7;
      uint32_t v17 = 42;
      goto LABEL_13;
    }
    if (!v27) {
      goto LABEL_23;
    }
    uint64_t v37 = *(void *)(a1 + 40);
    uint64_t v38 = *(void *)(a1 + 48);
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v41 = 138543874;
    uint64_t v42 = v37;
    __int16 v43 = 2114;
    uint64_t v44 = v38;
    __int16 v45 = 2048;
    id v46 = v39;
    uint64_t v34 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    int v35 = v7;
    uint32_t v36 = 32;
LABEL_21:
    _os_log_impl(&dword_194F3C000, v35, OS_LOG_TYPE_DEFAULT, v34, (uint8_t *)&v41, v36);
    goto LABEL_22;
  }
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
  if (v20)
  {
    if (!v22) {
      goto LABEL_23;
    }
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 48);
    id v11 = [v3 error];
    uint64_t v12 = [*(id *)(a1 + 32) configuration];
    id v13 = [v12 destination];
    id v25 = [MEMORY[0x1E4F1C9C8] date];
    [v25 timeIntervalSinceDate:*(void *)(a1 + 56)];
    int v41 = 138544386;
    uint64_t v42 = v23;
    __int16 v43 = 2114;
    uint64_t v44 = v24;
    __int16 v45 = 2114;
    id v46 = v11;
    __int16 v47 = 2114;
    id v48 = v13;
    __int16 v49 = 2048;
    uint64_t v50 = v26;
    _os_log_error_impl(&dword_194F3C000, v7, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v41, 0x34u);

    goto LABEL_14;
  }
  if (v22) {
    __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_cold_1(a1, v3);
  }
LABEL_23:

  uint64_t v40 = *(void *)(a1 + 64);
  if (v40) {
    (*(void (**)(uint64_t, id))(v40 + 16))(v40, v3);
  }
}

void __68__MRNowPlayingController_sendCommand_options_appOptions_completion___block_invoke_282(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = [[MRCommandResult alloc] initWithWithSendError:5 description:@"Timedout waiting for command result"];
  (*(void (**)(uint64_t, MRCommandResult *))(v1 + 16))(v1, v2);
}

void __68__MRNowPlayingController_sendCommand_options_appOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)playerPath
{
  uint64_t v2 = [(MRNowPlayingController *)self destination];
  id v3 = [v2 playerPath];

  return v3;
}

- (MRDestination)destination
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MRNowPlayingPlayerResponse *)v2->_response destination];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [(MRNowPlayingControllerConfiguration *)v2->_configuration destination];
  }
  id v5 = (void *)[v4 copy];
  if (!v3) {

  }
  objc_sync_exit(v2);

  return (MRDestination *)v5;
}

- (MRNowPlayingPlayerResponse)response
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(MRNowPlayingPlayerResponse *)v2->_response copy];
  objc_sync_exit(v2);

  return (MRNowPlayingPlayerResponse *)v3;
}

- (MRNowPlayingControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void)_notifyDelegateOfNewResponse:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = v6->_response;
  objc_storeStrong((id *)&v6->_response, a3);
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
  lastInitialLoadDate = v6->_lastInitialLoadDate;
  v6->_lastInitialLoadDate = (NSDate *)v8;

  objc_sync_exit(v6);
  if (![(MRNowPlayingControllerConfiguration *)v6->_configuration isSingleShot])
  {
    uint64_t v10 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(MRNowPlayingController *)v6 delegate];
      uint64_t v12 = [(MRNowPlayingController *)v6 configuration];
      id v13 = [v12 customDescriptionForResponse];
      uint64_t v14 = [(MRNowPlayingController *)v6 response];
      uint32_t v15 = ((void (**)(void, void *))v13)[2](v13, v14);
      *(_DWORD *)buf = 138412802;
      v56 = v6;
      __int16 v57 = 2112;
      id v58 = v11;
      __int16 v59 = 2112;
      id v60 = v15;
      _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingController] %@ NotifyLoadResponse %@ %@", buf, 0x20u);
    }
  }
  id v16 = [(MRNowPlayingController *)v6 delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    uint32_t v18 = [(MRNowPlayingController *)v6 delegate];
    BOOL v19 = [(MRNowPlayingController *)v6 response];
    [v18 controller:v6 didLoadResponse:v19];
  }
  if ([(MRNowPlayingControllerConfiguration *)v6->_configuration wantsChangeCallbacksDuringInitialLoad])
  {
    uint64_t v20 = [(MRNowPlayingPlayerResponse *)v7 playbackState];
    uint64_t v21 = [v5 playbackState];
    if (v20 != v21)
    {
      BOOL v22 = [(MRNowPlayingController *)v6 delegate];
      char v23 = objc_opt_respondsToSelector();

      if (v23)
      {
        uint64_t v24 = [(MRNowPlayingController *)v6 delegate];
        [v24 controller:v6 playbackStateDidChangeFrom:v20 to:v21];
      }
    }
    id v25 = [(MRNowPlayingPlayerResponse *)v7 playbackQueue];
    id v26 = [v5 playbackQueue];
    BOOL v27 = v25;
    if (v25 != v26)
    {
      char v28 = [v25 isEqual:v26];

      if (v28) {
        goto LABEL_16;
      }
      uint64_t v29 = [(MRNowPlayingController *)v6 delegate];
      char v30 = objc_opt_respondsToSelector();

      if ((v30 & 1) == 0) {
        goto LABEL_16;
      }
      BOOL v27 = [(MRNowPlayingController *)v6 delegate];
      [v27 controller:v6 playbackQueueDidChangeFrom:v25 to:v26];
    }

LABEL_16:
    [(MRNowPlayingPlayerResponse *)v7 playbackRate];
    float v32 = v31;
    [v5 playbackRate];
    float v34 = v33;
    if (vabds_f32(v33, v32) > 0.001)
    {
      int v35 = [(MRNowPlayingController *)v6 delegate];
      char v36 = objc_opt_respondsToSelector();

      if (v36)
      {
        uint64_t v37 = [(MRNowPlayingController *)v6 delegate];
        *(float *)&double v38 = v32;
        *(float *)&double v39 = v34;
        [v37 controller:v6 playbackRateDidChangeFrom:v38 to:v39];
      }
    }
    uint64_t v54 = [(MRNowPlayingPlayerResponse *)v7 supportedCommands];
    uint64_t v40 = [v5 supportedCommands];
    int v41 = [(MRNowPlayingController *)v6 delegate];
    char v42 = objc_opt_respondsToSelector();

    if (v42)
    {
      __int16 v43 = [(MRNowPlayingController *)v6 delegate];
      [v43 controller:v6 supportedCommandsDidChangeFrom:v54 to:v40];
    }
    uint64_t v44 = [(MRNowPlayingPlayerResponse *)v7 repeatMode];
    uint64_t v45 = [v5 repeatMode];
    if (v44 != v45)
    {
      id v46 = [(MRNowPlayingController *)v6 delegate];
      char v47 = objc_opt_respondsToSelector();

      if (v47)
      {
        id v48 = [(MRNowPlayingController *)v6 delegate];
        [v48 controller:v6 repeatModeDidChangeFrom:v44 to:v45];
      }
    }
    uint64_t v49 = [(MRNowPlayingPlayerResponse *)v7 shuffleMode];
    uint64_t v50 = [v5 shuffleMode];
    if (v49 != v50)
    {
      uint64_t v51 = [(MRNowPlayingController *)v6 delegate];
      char v52 = objc_opt_respondsToSelector();

      if (v52)
      {
        id v53 = [(MRNowPlayingController *)v6 delegate];
        [v53 controller:v6 shuffleModeDidChangeFrom:v49 to:v50];
      }
    }
    [(MRNowPlayingController *)v6 _notifyDelegateOfUpdate];
  }
}

- (void)_notifyDelegateOfPlaybackStateChange:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  obj = self;
  objc_sync_enter(obj);
  response = obj->_response;
  if (!response)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, obj, @"MRNowPlayingController.m", 659, @"Invalid parameter not satisfying: %@", @"_response" object file lineNumber description];

    response = obj->_response;
  }
  uint64_t v7 = [(MRNowPlayingPlayerResponse *)response playbackState];
  if (v7 == v3)
  {
    objc_sync_exit(obj);
  }
  else
  {
    [(MRNowPlayingPlayerResponse *)obj->_response setPlaybackState:v3];
    objc_sync_exit(obj);

    uint64_t v8 = [(MRNowPlayingController *)obj delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(MRNowPlayingController *)obj delegate];
      [v10 controller:obj playbackStateDidChangeFrom:v7 to:v3];
    }
    [(MRNowPlayingController *)obj _notifyDelegateOfUpdate];
  }
}

- (void)_notifyDelegateOfPlaybackQueueChange:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v6 = self;
  objc_sync_enter(v6);
  response = v6->_response;
  if (!response)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, v6, @"MRNowPlayingController.m", 686, @"Invalid parameter not satisfying: %@", @"_response" object file lineNumber description];

    response = v6->_response;
  }
  uint64_t v8 = [(MRNowPlayingPlayerResponse *)response playbackQueue];
  [(MRNowPlayingPlayerResponse *)v6->_response playbackRate];
  float v10 = v9;
  id v11 = v8;
  id v12 = v5;
  id v25 = v12;
  if (v11 == v12)
  {

    goto LABEL_12;
  }
  char v13 = [v11 isEqual:v12];

  if (v13)
  {
LABEL_12:
    objc_sync_exit(v6);

    goto LABEL_13;
  }
  [(MRNowPlayingPlayerResponse *)v6->_response setPlaybackQueue:v25];
  [(MRNowPlayingPlayerResponse *)v6->_response playbackRate];
  float v15 = v14;
  objc_sync_exit(v6);

  id v16 = [(MRNowPlayingController *)v6 delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    uint32_t v18 = [(MRNowPlayingController *)v6 delegate];
    [v18 controller:v6 playbackQueueDidChangeFrom:v11 to:v25];
  }
  if (vabds_f32(v15, v10) > 0.001)
  {
    BOOL v19 = [(MRNowPlayingController *)v6 delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      uint64_t v21 = [(MRNowPlayingController *)v6 delegate];
      *(float *)&double v22 = v10;
      *(float *)&double v23 = v15;
      [v21 controller:v6 playbackRateDidChangeFrom:v22 to:v23];
    }
  }
  [(MRNowPlayingController *)v6 _notifyDelegateOfUpdate];
LABEL_13:
}

- (void)_notifyDelegateOfUpdatedContentItemsWithContentItems:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v6 = self;
  objc_sync_enter(v6);
  response = v6->_response;
  if (!response)
  {
    float v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, v6, @"MRNowPlayingController.m", 718, @"Invalid parameter not satisfying: %@", @"_response" object file lineNumber description];

    response = v6->_response;
  }
  [(MRNowPlayingPlayerResponse *)response playbackRate];
  float v9 = v8;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v10);
        }
        float v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        float v15 = [(MRNowPlayingPlayerResponse *)v6->_response playbackQueue];
        id v16 = [v14 identifier];
        char v17 = [v15 contentItemForIdentifier:v16];

        if (v17) {
          [v17 mergeFrom:v14];
        }
        [(MRNowPlayingPlayerResponse *)v6->_response playbackRate];
        float v19 = v18;
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);
  }
  else
  {
    float v19 = 0.0;
  }

  objc_sync_exit(v6);
  if ([v10 count])
  {
    char v20 = [(MRNowPlayingController *)v6 delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      double v22 = [(MRNowPlayingController *)v6 delegate];
      [v22 controller:v6 contentItemsDidUpdateWithContentItemChanges:v10];
    }
    double v23 = [(MRNowPlayingController *)v6 delegate];
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      id v25 = objc_msgSend(v10, "mr_compactMap:", &__block_literal_global_306_0);
      id v26 = [(MRNowPlayingController *)v6 delegate];
      [v26 controller:v6 contentItemsDidUpdate:v25];
    }
    if (vabds_f32(v19, v9) > 0.001)
    {
      BOOL v27 = [(MRNowPlayingController *)v6 delegate];
      char v28 = objc_opt_respondsToSelector();

      if (v28)
      {
        uint64_t v29 = [(MRNowPlayingController *)v6 delegate];
        *(float *)&double v30 = v9;
        *(float *)&double v31 = v19;
        [v29 controller:v6 playbackRateDidChangeFrom:v30 to:v31];
      }
    }
    [(MRNowPlayingController *)v6 _notifyDelegateOfUpdate];
  }
}

uint64_t __79__MRNowPlayingController__notifyDelegateOfUpdatedContentItemsWithContentItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)_notifyDelegateOfUpdatedArtwork:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v6 = self;
  objc_sync_enter(v6);
  if (!v6->_response)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, v6, @"MRNowPlayingController.m", 754, @"Invalid parameter not satisfying: %@", @"_response" object file lineNumber description];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
        uint64_t v12 = [(MRNowPlayingPlayerResponse *)v6->_response playbackQueue];
        char v13 = [v11 identifier];
        float v14 = [v12 contentItemForIdentifier:v13];

        if (v14)
        {
          float v15 = [v14 artwork];
          id v16 = [v11 artwork];
          id v17 = v15;
          id v18 = v16;
          if (v17 == v18)
          {
          }
          else
          {
            float v19 = v18;
            char v20 = [v17 isEqual:v18];

            if (v20) {
              goto LABEL_14;
            }
            char v21 = [v11 artwork];
            [v14 setArtwork:v21];

            id v17 = [v11 identifier];
            [v26 addObject:v17];
          }
        }
LABEL_14:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);
  if ([v26 count])
  {
    double v22 = [(MRNowPlayingController *)v6 delegate];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      char v24 = [(MRNowPlayingController *)v6 delegate];
      [v24 controller:v6 didLoadArtworkForContentItems:v26];
    }
    [(MRNowPlayingController *)v6 _notifyDelegateOfUpdate];
  }
}

- (void)_notifyDelegateOfSupportedCommandsChange:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v6 = self;
  objc_sync_enter(v6);
  response = v6->_response;
  if (!response)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, v6, @"MRNowPlayingController.m", 788, @"Invalid parameter not satisfying: %@", @"_response" object file lineNumber description];

    response = v6->_response;
  }
  uint64_t v8 = [(MRNowPlayingPlayerResponse *)response supportedCommands];
  uint64_t v9 = [(MRNowPlayingPlayerResponse *)v6->_response shuffleMode];
  uint64_t v10 = [(MRNowPlayingPlayerResponse *)v6->_response repeatMode];
  id v11 = v8;
  id v12 = v5;
  id v26 = v12;
  if (v11 == v12)
  {

    goto LABEL_15;
  }
  char v13 = [v11 isEqual:v12];

  if (v13)
  {
LABEL_15:
    objc_sync_exit(v6);

    goto LABEL_16;
  }
  [(MRNowPlayingPlayerResponse *)v6->_response setSupportedCommands:v26];
  uint64_t v14 = [(MRNowPlayingPlayerResponse *)v6->_response shuffleMode];
  uint64_t v15 = [(MRNowPlayingPlayerResponse *)v6->_response repeatMode];
  objc_sync_exit(v6);

  id v16 = [(MRNowPlayingController *)v6 delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v18 = [(MRNowPlayingController *)v6 delegate];
    [v18 controller:v6 supportedCommandsDidChangeFrom:v11 to:v26];
  }
  if (v10 != v15)
  {
    float v19 = [(MRNowPlayingController *)v6 delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      char v21 = [(MRNowPlayingController *)v6 delegate];
      [v21 controller:v6 repeatModeDidChangeFrom:v10 to:v15];
    }
  }
  if (v9 != v14)
  {
    double v22 = [(MRNowPlayingController *)v6 delegate];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      char v24 = [(MRNowPlayingController *)v6 delegate];
      [v24 controller:v6 shuffleModeDidChangeFrom:v9 to:v14];
    }
  }
  [(MRNowPlayingController *)v6 _notifyDelegateOfUpdate];
LABEL_16:
}

- (void)_notifyDelegateOfUpdatedDeviceLastPlayingDate:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v4 = [(MRNowPlayingController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MRNowPlayingController *)self delegate];
    [v6 controller:self deviceLastPlayingDateDidChange:v7];
  }
  [(MRNowPlayingController *)self _notifyDelegateOfUpdate];
}

- (void)_notifyDelegateOfUpdatedPlayerLastPlayingDate:(id)a3
{
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  char v5 = self;
  objc_sync_enter(v5);
  response = v5->_response;
  if (!response)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, v5, @"MRNowPlayingController.m", 833, @"Invalid parameter not satisfying: %@", @"_response" object file lineNumber description];

    response = v5->_response;
  }
  id v7 = [(MRNowPlayingPlayerResponse *)response playerLastPlayingDate];
  uint64_t v8 = v7;
  if (!v5->_response) {
    goto LABEL_10;
  }
  id v9 = v7;
  id v10 = v17;
  id v11 = v10;
  if (v9 == v10)
  {

    goto LABEL_10;
  }
  char v12 = [v9 isEqual:v10];

  if (v12)
  {
LABEL_10:

    objc_sync_exit(v5);
    goto LABEL_11;
  }
  [(MRNowPlayingPlayerResponse *)v5->_response setPlayerLastPlayingDate:v11];

  objc_sync_exit(v5);
  char v13 = [(MRNowPlayingController *)v5 delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    uint64_t v15 = [(MRNowPlayingController *)v5 delegate];
    [v15 controller:v5 playerLastPlayingDateDidChange:v11];
  }
  [(MRNowPlayingController *)v5 _notifyDelegateOfUpdate];
LABEL_11:
}

- (void)_notifyDelegateOfUpdatedClientProperties:(id)a3
{
  id v16 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  char v5 = self;
  objc_sync_enter(v5);
  response = v5->_response;
  if (!response)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, v5, @"MRNowPlayingController.m", 857, @"Invalid parameter not satisfying: %@", @"_response" object file lineNumber description];

    response = v5->_response;
  }
  id v7 = [(MRNowPlayingPlayerResponse *)response clientProperties];
  uint64_t v8 = v7;
  if (v5->_response)
  {
    id v9 = [v7 data];
    id v10 = [v16 data];
    id v11 = v9;
    id v12 = v10;
    if (v11 == v12)
    {
    }
    else
    {
      char v13 = v12;
      char v14 = [v11 isEqual:v12];

      if ((v14 & 1) == 0) {
        [(MRNowPlayingPlayerResponse *)v5->_response setClientProperties:v16];
      }
    }
  }
  objc_sync_exit(v5);
}

- (void)_notifyDelegateOfPlayerPathChange:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  char v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MRNowPlayingPlayerResponse *)v5->_response playerPath];
  id v7 = v4;
  id v12 = v7;
  if (v6 == v7)
  {

    objc_sync_exit(v5);
    goto LABEL_6;
  }
  char v8 = [v6 isEqual:v7];

  objc_sync_exit(v5);
  if ((v8 & 1) == 0)
  {
    id v9 = [(MRNowPlayingController *)v5 delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(MRNowPlayingController *)v5 delegate];
      [(MRNowPlayingController *)v11 controller:v5 playerPathDidChange:v12];
      char v5 = v11;
LABEL_6:
    }
  }
}

- (void)_notifyDelegateOfUpdate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  lastUpdateDate = self->_lastUpdateDate;
  self->_lastUpdateDate = v3;

  if (![(MRNowPlayingControllerConfiguration *)self->_configuration isSingleShot])
  {
    char v5 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(MRNowPlayingController *)self delegate];
      id v7 = [(MRNowPlayingController *)self configuration];
      char v8 = [v7 customDescriptionForResponse];
      id v9 = [(MRNowPlayingController *)self response];
      char v10 = ((void (**)(void, void *))v8)[2](v8, v9);
      int v15 = 138412802;
      id v16 = self;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      char v20 = v10;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingController] %@ NotifyUpdate %@ %@", (uint8_t *)&v15, 0x20u);
    }
  }
  id v11 = [(MRNowPlayingController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    char v13 = [(MRNowPlayingController *)self delegate];
    char v14 = [(MRNowPlayingController *)self response];
    [v13 controller:self didUpdateResponse:v14];
  }
}

- (void)_notifyDelegateOfError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
  lastErrorDate = v6->_lastErrorDate;
  v6->_lastErrorDate = (NSDate *)v7;

  objc_storeStrong((id *)&v6->_lastError, a3);
  objc_sync_exit(v6);

  if (![(MRNowPlayingControllerConfiguration *)v6->_configuration isSingleShot])
  {
    id v9 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = [(MRNowPlayingController *)v6 delegate];
      int v14 = 138412802;
      int v15 = v6;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      __int16 v19 = v10;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingController] %@ NotifyError %@ %@", (uint8_t *)&v14, 0x20u);
    }
  }
  id v11 = [(MRNowPlayingController *)v6 delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    char v13 = [(MRNowPlayingController *)v6 delegate];
    [v13 controller:v6 didFailWithError:v5];
  }
}

- (void)_notifyDelegateOfInvalidation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
  lastInvalidationDate = v3->_lastInvalidationDate;
  v3->_lastInvalidationDate = (NSDate *)v4;

  response = v3->_response;
  v3->_response = 0;

  objc_sync_exit(v3);
  if (![(MRNowPlayingControllerConfiguration *)v3->_configuration isSingleShot])
  {
    uint64_t v7 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = [(MRNowPlayingController *)v3 delegate];
      int v12 = 138412546;
      char v13 = v3;
      __int16 v14 = 2112;
      int v15 = v8;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingController] %@ NotifyInvalidated %@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v9 = [(MRNowPlayingController *)v3 delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(MRNowPlayingController *)v3 delegate];
    [v11 controllerWillReloadForInvalidation:v3];
  }
}

- (id)_createImplWithConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MRUserSettings currentSettings];
  int v5 = [v4 nowPlayingControllerVersion];

  if ((v5 - 1) > 2) {
    id v6 = off_1E57CF968;
  }
  else {
    id v6 = off_1E57D8B58[v5 - 1];
  }
  uint64_t v7 = (void *)[objc_alloc(*v6) initWithConfiguration:v3];

  return v7;
}

- (id)_makeHelper
{
  id v3 = objc_alloc_init(MRNowPlayingControllerHelper);
  objc_initWeak(location, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __37__MRNowPlayingController__makeHelper__block_invoke;
  v25[3] = &unk_1E57D8A50;
  objc_copyWeak(&v26, location);
  [(MRNowPlayingControllerHelper *)v3 setDidLoadResponse:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __37__MRNowPlayingController__makeHelper__block_invoke_3;
  v23[3] = &unk_1E57D8A78;
  objc_copyWeak(&v24, location);
  [(MRNowPlayingControllerHelper *)v3 setPlaybackStateDidChange:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __37__MRNowPlayingController__makeHelper__block_invoke_5;
  v21[3] = &unk_1E57D8AA0;
  objc_copyWeak(&v22, location);
  [(MRNowPlayingControllerHelper *)v3 setPlaybackQueueDidChange:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __37__MRNowPlayingController__makeHelper__block_invoke_7;
  v19[3] = &unk_1E57D1860;
  objc_copyWeak(&v20, location);
  [(MRNowPlayingControllerHelper *)v3 setContentItemsDidUpdate:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __37__MRNowPlayingController__makeHelper__block_invoke_9;
  v17[3] = &unk_1E57D1860;
  objc_copyWeak(&v18, location);
  [(MRNowPlayingControllerHelper *)v3 setContentItemsDidLoadArtwork:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __37__MRNowPlayingController__makeHelper__block_invoke_11;
  v15[3] = &unk_1E57D1860;
  objc_copyWeak(&v16, location);
  [(MRNowPlayingControllerHelper *)v3 setSupportedCommandsDidChange:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37__MRNowPlayingController__makeHelper__block_invoke_13;
  v13[3] = &unk_1E57D8AC8;
  objc_copyWeak(&v14, location);
  [(MRNowPlayingControllerHelper *)v3 setPlayerLastPlayingDateDidChange:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__MRNowPlayingController__makeHelper__block_invoke_15;
  v11[3] = &unk_1E57D8AF0;
  objc_copyWeak(&v12, location);
  [(MRNowPlayingControllerHelper *)v3 setClientPropertiesDidChange:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__MRNowPlayingController__makeHelper__block_invoke_17;
  v9[3] = &unk_1E57D41C0;
  objc_copyWeak(&v10, location);
  [(MRNowPlayingControllerHelper *)v3 setPlayerPathDidChange:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_19;
  v7[3] = &unk_1E57D12D0;
  objc_copyWeak(&v8, location);
  [(MRNowPlayingControllerHelper *)v3 setDidInvalidate:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__MRNowPlayingController__makeHelper__block_invoke_21;
  v5[3] = &unk_1E57D8B18;
  objc_copyWeak(&v6, location);
  [(MRNowPlayingControllerHelper *)v3 setDidFailWithError:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(location);

  return v3;
}

void __37__MRNowPlayingController__makeHelper__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_2;
    v7[3] = &unk_1E57D0790;
    void v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfNewResponse:*(void *)(a1 + 40)];
}

void __37__MRNowPlayingController__makeHelper__block_invoke_3(uint64_t a1, int a2)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = WeakRetained[5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__MRNowPlayingController__makeHelper__block_invoke_4;
    v6[3] = &unk_1E57D4308;
    v6[4] = v4;
    int v7 = a2;
    dispatch_async(v5, v6);
  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfPlaybackStateChange:*(unsigned int *)(a1 + 40)];
}

void __37__MRNowPlayingController__makeHelper__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_6;
    v7[3] = &unk_1E57D0790;
    void v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfPlaybackQueueChange:*(void *)(a1 + 40)];
}

void __37__MRNowPlayingController__makeHelper__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_8;
    v7[3] = &unk_1E57D0790;
    void v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfUpdatedContentItemsWithContentItems:*(void *)(a1 + 40)];
}

void __37__MRNowPlayingController__makeHelper__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_10;
    v7[3] = &unk_1E57D0790;
    void v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfUpdatedArtwork:*(void *)(a1 + 40)];
}

void __37__MRNowPlayingController__makeHelper__block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_12;
    v7[3] = &unk_1E57D0790;
    void v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfSupportedCommandsChange:*(void *)(a1 + 40)];
}

void __37__MRNowPlayingController__makeHelper__block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_14;
    v7[3] = &unk_1E57D0790;
    void v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfUpdatedDeviceLastPlayingDate:*(void *)(a1 + 40)];
}

void __37__MRNowPlayingController__makeHelper__block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_16;
    v7[3] = &unk_1E57D0790;
    void v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfUpdatedClientProperties:*(void *)(a1 + 40)];
}

void __37__MRNowPlayingController__makeHelper__block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_18;
    v7[3] = &unk_1E57D0790;
    void v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfPlayerPathChange:*(void *)(a1 + 40)];
}

void __37__MRNowPlayingController__makeHelper__block_invoke_19(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[5];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__MRNowPlayingController__makeHelper__block_invoke_20;
    block[3] = &unk_1E57D0518;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_20(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfInvalidation];
}

void __37__MRNowPlayingController__makeHelper__block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_22;
    v7[3] = &unk_1E57D0790;
    void v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfError:*(void *)(a1 + 40)];
}

- (void)setResponse:(id)a3
{
}

- (MRNowPlayingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRNowPlayingControllerDelegate *)WeakRetained;
}

- (void)setConfiguration:(id)a3
{
}

- (void)setImpl:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
}

- (NSDate)allocationDate
{
  return self->_allocationDate;
}

- (void)setAllocationDate:(id)a3
{
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void)setBeginDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)lastInitialLoadDate
{
  return self->_lastInitialLoadDate;
}

- (void)setLastInitialLoadDate:(id)a3
{
}

- (NSDate)lastInvalidationDate
{
  return self->_lastInvalidationDate;
}

- (void)setLastInvalidationDate:(id)a3
{
}

- (NSDate)lastErrorDate
{
  return self->_lastErrorDate;
}

- (void)setLastErrorDate:(id)a3
{
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_lastErrorDate, 0);
  objc_storeStrong((id *)&self->_lastInvalidationDate, 0);
  objc_storeStrong((id *)&self->_lastInitialLoadDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_allocationDate, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_response, 0);
}

void __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 64)];
  OUTLINED_FUNCTION_1(&dword_194F3C000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, 2u);
}

void __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:*(void *)(a1 + 56)];
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v5, v6, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v7, v8, v9, v10, v11);
}

@end