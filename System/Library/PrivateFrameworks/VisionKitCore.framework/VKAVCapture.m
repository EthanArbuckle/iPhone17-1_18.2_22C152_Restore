@interface VKAVCapture
+ (uint64_t)authorizationStatus;
- (BOOL)processHasPerfPowerServicesEntitlement;
- (VKAVCapture)init;
- (double)interestPoint;
- (double)maxZoomFactor;
- (double)minZoomFactor;
- (double)videoRotationAngle;
- (double)zoomFactor;
- (id)videoSettings;
- (uint64_t)connection;
- (uint64_t)delegate;
- (uint64_t)device;
- (uint64_t)hasTorch;
- (uint64_t)isRunning;
- (uint64_t)isTorchOn;
- (uint64_t)photoOutput;
- (uint64_t)preparationState;
- (uint64_t)session;
- (uint64_t)setDelegate:(uint64_t)result;
- (uint64_t)setPreparationState:(uint64_t)result;
- (uint64_t)setStartTime:(uint64_t)result;
- (uint64_t)startTime;
- (uint64_t)videoDataOutput;
- (void)_sessionRuntimeError:(id)a3;
- (void)dealloc;
- (void)prepareWithConfiguration:(void *)a3 completion:;
- (void)sendPowerLogs;
- (void)setConnection:(uint64_t)a1;
- (void)setInterestPoint:(double)a3;
- (void)setPhotoOutput:(uint64_t)a1;
- (void)setTorchOn:(uint64_t)a1;
- (void)setVideoDataOutput:(uint64_t)a1;
- (void)setVideoRotationAngle:(double)a3 completion:;
- (void)setZoomFactor:(double)a3;
- (void)startRunning;
- (void)stopRunning;
@end

@implementation VKAVCapture

+ (uint64_t)authorizationStatus
{
  self;
  v0 = (void *)MEMORY[0x1E4F16440];
  uint64_t v1 = *MEMORY[0x1E4F15C18];
  return [v0 authorizationStatusForMediaType:v1];
}

- (VKAVCapture)init
{
  v8.receiver = self;
  v8.super_class = (Class)VKAVCapture;
  v2 = [(VKAVCapture *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.visionkit.avcapturequeue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VKAVCapture;
  [(VKAVCapture *)&v4 dealloc];
}

- (void)prepareWithConfiguration:(void *)a3 completion:
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_17;
  }
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (a1[9]) {
    goto LABEL_17;
  }
  a1[9] = 1;
  self;
  uint64_t v7 = *MEMORY[0x1E4F15C18];
  uint64_t v8 = [MEMORY[0x1E4F16440] authorizationStatusForMediaType:*MEMORY[0x1E4F15C18]];
  if (!v8)
  {
    objc_initWeak(&location, a1);
    v10 = (void *)MEMORY[0x1E4F16440];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke;
    v27[3] = &unk_1E6BF0CF0;
    objc_copyWeak(&v28, &location);
    [v10 requestAccessForMediaType:v7 completionHandler:v27];
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
  if (v8 != 2)
  {
LABEL_10:
    if ([v5 cameraPreset])
    {
      if ([v5 cameraPreset] == 2)
      {
        uint64_t v11 = *MEMORY[0x1E4F157E8];
        v31[0] = *MEMORY[0x1E4F157F0];
        v31[1] = v11;
        v31[2] = *MEMORY[0x1E4F15830];
        [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
      }
      else
      {
        uint64_t v30 = *MEMORY[0x1E4F15830];
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      uint64_t v12 = };
    }
    else
    {
      uint64_t v13 = *MEMORY[0x1E4F157E8];
      v32[0] = *MEMORY[0x1E4F15818];
      v32[1] = v13;
      uint64_t v14 = *MEMORY[0x1E4F15830];
      v32[2] = *MEMORY[0x1E4F157F0];
      v32[3] = v14;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
    }
    v15 = (void *)v12;
    double v16 = _SizeFromVKResolutionPreset([v5 resolutionPreset]);
    v17 = (void *)a1[1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3;
    v20[3] = &unk_1E6BF3080;
    id v21 = v15;
    double v25 = v16;
    uint64_t v26 = v18;
    id v22 = v5;
    v23 = a1;
    id v24 = v6;
    id v19 = v15;
    vk_performBlockOnQueueWithStrongSelf(v17, a1, v20);

    goto LABEL_17;
  }
  v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[VKAVCapture prepareWithConfiguration:completion:]();
  }

  a1[9] = 2;
  if (v6) {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
LABEL_17:
}

- (uint64_t)preparationState
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (uint64_t)setPreparationState:(uint64_t)result
{
  if (result) {
    *(void *)(result + 72) = a2;
  }
  return result;
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_2;
  v4[3] = &unk_1E6BF0CC8;
  v4[4] = WeakRetained;
  char v5 = a2;
  vk_performBlockOnMainThread(v4);
}

uint64_t __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1 && *(void *)(v1 + 24))
  {
    v2 = *(void **)(result + 32);
    if (v2) {
      v2 = (void *)v2[3];
    }
    return [v2 avCapture:*(void *)(result + 32) cameraAccessGranted:*(unsigned __int8 *)(result + 40)];
  }
  return result;
}

- (uint64_t)delegate
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v54 = a2;
  v3 = *(void **)(a1 + 32);
  char v4 = [*(id *)(a1 + 40) preferBinning];
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  id v7 = v3;
  uint64_t v8 = *MEMORY[0x1E4F15C18];
  v9 = [MEMORY[0x1E4F16448] discoverySessionWithDeviceTypes:v7 mediaType:*MEMORY[0x1E4F15C18] position:1];
  v10 = [v9 devices];
  uint64_t v11 = [v10 firstObject];

  *(void *)&long long v73 = 0;
  *((void *)&v73 + 1) = &v73;
  uint64_t v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__11;
  v76 = __Block_byref_object_dispose__11;
  id v77 = 0;
  uint64_t v12 = [v11 formats];
  *(void *)&long long v66 = MEMORY[0x1E4F143A8];
  *((void *)&v66 + 1) = 3221225472;
  v67 = ___BestCaptureDeviceFromDesiredDeviceTypes_block_invoke;
  v68 = &unk_1E6BF3168;
  v69 = &v73;
  uint64_t v70 = v5;
  uint64_t v71 = v6;
  char v72 = v4;
  [v12 enumerateObjectsUsingBlock:&v66];

  if (!*(void *)(*((void *)&v73 + 1) + 40)) {
    +[VKAssert handleFailedAssertWithCondition:"((bestFormat) != nil)", "AVCaptureDevice *_BestCaptureDeviceFromDesiredDeviceTypes(NSArray<AVCaptureDeviceType> *__strong, CGSize, _Bool)", 0, 0, @"Expected non-nil value for '%s'", "bestFormat" functionName simulateCrash showAlert format];
  }
  *(void *)&long long v80 = 0;
  int v13 = [v11 lockForConfiguration:&v80];
  id v14 = (id)v80;
  if (v13)
  {
    [v11 setActiveFormat:*(void *)(*((void *)&v73 + 1) + 40)];
    [v11 unlockForConfiguration];
  }
  else
  {
    v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_8();
    }
  }
  _Block_object_dispose(&v73, 8);

  id v65 = 0;
  double v16 = [MEMORY[0x1E4F16450] deviceInputWithDevice:v11 error:&v65];
  id v55 = v65;
  if (v55)
  {
    v17 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_7();
    }
  }
  if (!v16) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((deviceInput) != nil)", "-[VKAVCapture prepareWithConfiguration:completion:]_block_invoke", 0, 0, @"Expected non-nil value for '%s'", "deviceInput");
  }
  char v18 = [*(id *)(a1 + 40) preferBinning];
  uint64_t v19 = *(void *)(a1 + 48);
  if (v19) {
    *(unsigned char *)(v19 + 16) = v18;
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F164C0]);
  if ([v20 isSceneStabilityMetadataSupported]) {
    [v20 setSceneStabilityMetadataEnabled:1];
  }
  uint64_t v83 = *MEMORY[0x1E4F24D70];
  v84[0] = &unk_1F357DBC0;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:&v83 count:1];
  [v20 setVideoSettings:v21];

  [v20 setAlwaysDiscardsLateVideoFrames:1];
  id v22 = objc_alloc_init(MEMORY[0x1E4F16498]);
  AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout();
  [v22 setSessionPreset:*MEMORY[0x1E4F159B8]];
  if (!v16 || ([v22 canAddInput:v16] & 1) == 0)
  {
    v23 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_1();
    }
    goto LABEL_29;
  }
  [v22 addInput:v16];
  if (!v20 || ([v22 canAddOutput:v20] & 1) == 0)
  {
    v23 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_2();
    }
LABEL_29:

    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_56;
    v63[3] = &unk_1E6BF0B10;
    id v64 = *(id *)(a1 + 56);
    vk_performBlockOnMainThread(v63);
    id v24 = v64;
    goto LABEL_30;
  }
  [v22 addOutput:v20];
  id v53 = objc_alloc_init(MEMORY[0x1E4F16478]);
  if (v53 && ([v22 canAddOutput:v53] & 1) != 0)
  {
    [v22 addOutput:v53];
  }
  else
  {
    double v25 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_2();
    }
  }
  uint64_t v26 = [v11 activeFormat];
  v27 = [v26 supportedMaxPhotoDimensions];
  id v28 = [v27 lastObject];
  uint64_t v29 = [v28 CMVideoDimensionsValue];

  [v53 setMaxPhotoDimensions:v29];
  v52 = [v20 connectionWithMediaType:v8];
  [v52 setPreferredVideoStabilizationMode:0];
  id v30 = v11;
  if ([v30 isVirtualDevice])
  {
    v31 = [v30 constituentDevices];
    if ((unint64_t)[v31 count] >= 2)
    {
      v32 = [v31 firstObject];
      v33 = [v32 deviceType];
      BOOL v34 = v33 == (void *)*MEMORY[0x1E4F15828];

      if (v34)
      {
        v35 = [v30 virtualDeviceSwitchOverVideoZoomFactors];
        uint64_t v36 = [v35 count];
        if (v36 != [v31 count] - 1) {
          +[VKAssert handleFailedAssertWithCondition:"switchOverZoomFactors.count == (constituentDevices.count - 1)" functionName:"void _SetInitialZoomFactorOnCaptureDevice(AVCaptureDevice *__strong)" simulateCrash:0 showAlert:0 format:@"Unexpected switch over zoom factors for the number of constituent devices in a virtual capture device."];
        }
        *(void *)&long long v66 = 0;
        int v37 = [v30 lockForConfiguration:&v66];
        id v38 = (id)v66;
        if (v37)
        {
          v39 = [v35 firstObject];
          [v39 doubleValue];
          objc_msgSend(v30, "setVideoZoomFactor:");

          [v30 unlockForConfiguration];
        }
        else
        {
          v40 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_5();
          }
        }
      }
    }
  }
  uint64_t v41 = [*(id *)(a1 + 40) frameRatePreset];
  id v42 = v30;
  v43 = [v42 activeFormat];
  long long v66 = 0uLL;
  v67 = 0;
  _MinFrameDurationFromVKFrameRatePreset(v41, v43, (uint64_t)&v66);
  long long v73 = 0uLL;
  uint64_t v74 = 0;
  _MaxFrameDurationFromVKFrameRatePreset(v41, v43, (uint64_t)&v73);
  id v82 = 0;
  int v44 = [v42 lockForConfiguration:&v82];
  id v45 = v82;
  if (v44)
  {
    long long v80 = v66;
    v81 = v67;
    [v42 setActiveVideoMinFrameDuration:&v80];
    long long v78 = v73;
    uint64_t v79 = v74;
    [v42 setActiveVideoMaxFrameDuration:&v78];
    [v42 unlockForConfiguration];
  }
  else
  {
    v46 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_4();
    }
  }
  id v47 = v42;
  *(void *)&long long v66 = 0;
  int v48 = [v47 lockForConfiguration:&v66];
  id v49 = (id)v66;
  if (v48)
  {
    if ([v47 automaticallyAdjustsFaceDrivenAutoFocusEnabled]) {
      [v47 setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled:0];
    }
    if ([v47 isFaceDrivenAutoFocusEnabled]) {
      [v47 setFaceDrivenAutoFocusEnabled:0];
    }
    if ([v47 automaticallyAdjustsFaceDrivenAutoExposureEnabled]) {
      [v47 setAutomaticallyAdjustsFaceDrivenAutoExposureEnabled:0];
    }
    if ([v47 isFaceDrivenAutoExposureEnabled]) {
      [v47 setFaceDrivenAutoExposureEnabled:0];
    }
    if ([v47 isFocusPointOfInterestSupported]) {
      objc_msgSend(v47, "setFocusPointOfInterest:", 0.5, 0.5);
    }
    if ([v47 isExposurePointOfInterestSupported]) {
      objc_msgSend(v47, "setExposurePointOfInterest:", 0.5, 0.5);
    }
    [v47 setExposureMode:2];
    [v47 setFocusMode:2];
    [v47 unlockForConfiguration];
  }
  else
  {
    v50 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_3();
    }
  }
  [v53 setMaxPhotoQualityPrioritization:1];
  [v53 setDepthDataDeliveryEnabled:0];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_2_57;
  v56[3] = &unk_1E6BF3058;
  id v57 = v22;
  id v58 = v52;
  id v59 = v47;
  id v60 = v53;
  id v61 = v20;
  id v62 = *(id *)(a1 + 56);
  id v24 = v53;
  id v51 = v52;
  vk_performBlockOnMainThreadWithStrongSelf(v54, v56);

LABEL_30:
}

uint64_t __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_2_57(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:v6 selector:sel__sessionRuntimeError_ name:*MEMORY[0x1E4F159C8] object:*(void *)(a1 + 32)];

  -[VKCRemoveBackgroundResult setInstanceMasks:]((uint64_t)v6, *(void **)(a1 + 32));
  -[VKAVCapture setConnection:]((uint64_t)v6, *(void **)(a1 + 40));
  -[VKCRemoveBackgroundResult setAnimatedStickerScore:]((uint64_t)v6, *(void **)(a1 + 48));
  -[VKAVCapture setPhotoOutput:]((uint64_t)v6, *(void **)(a1 + 56));
  -[VKAVCapture setVideoDataOutput:]((uint64_t)v6, *(void **)(a1 + 64));
  char v4 = v6;
  if (v6) {
    *((void *)v6 + 9) = 2;
  }
  uint64_t v5 = *(void *)(a1 + 72);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    char v4 = v6;
  }
}

- (void)setConnection:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setPhotoOutput:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setVideoDataOutput:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (id)videoSettings
{
  if (a1)
  {
    a1 = [a1[8] videoSettings];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)videoDataOutput
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (uint64_t)isRunning
{
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    v2 = *(void **)(v1 + 32);
    return [v2 isRunning];
  }
  return result;
}

- (uint64_t)session
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (void)startRunning
{
  if (a1)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    v2 = (void *)a1[1];
    vk_performBlockOnQueueWithStrongSelf(v2, a1, &__block_literal_global_26);
  }
}

void __27__VKAVCapture_startRunning__block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  v3 = [MEMORY[0x1E4F1C9C8] now];
  if (v2)
  {
    v2[10] = v3;

    char v4 = (void *)v2[4];
  }
  else
  {

    char v4 = 0;
  }
  id v5 = v4;
  [v5 startRunning];
}

- (uint64_t)setStartTime:(uint64_t)result
{
  if (result) {
    *(void *)(result + 80) = a2;
  }
  return result;
}

- (void)sendPowerLogs
{
  v14[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (processHasPerfPowerServicesEntitlement_onceToken != -1) {
      dispatch_once(&processHasPerfPowerServicesEntitlement_onceToken, &__block_literal_global_81);
    }
    if (processHasPerfPowerServicesEntitlement_sHasEntitlement)
    {
      if (sendPowerLogs_onceToken != -1) {
        dispatch_once(&sendPowerLogs_onceToken, &__block_literal_global_63);
      }
      v2 = NSNumber;
      id v3 = *(id *)(a1 + 48);
      char v4 = v3;
      if (v3) {
        [v3 activeVideoMinFrameDuration];
      }
      else {
        memset(&v12, 0, sizeof(v12));
      }
      id v5 = [v2 numberWithDouble:CMTimeGetSeconds(&v12)];

      id v6 = [MEMORY[0x1E4F1C9C8] now];
      v14[0] = v5;
      v13[0] = @"SessionMinFrameDuration";
      v13[1] = @"SessionStartTime";
      id v7 = NSNumber;
      [*(id *)(a1 + 80) timeIntervalSince1970];
      uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
      v14[1] = v8;
      v13[2] = @"SessionStopTime";
      v9 = NSNumber;
      [v6 timeIntervalSince1970];
      v10 = objc_msgSend(v9, "numberWithDouble:");
      v14[2] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

      PPSSendTelemetry();
    }
  }
}

- (BOOL)processHasPerfPowerServicesEntitlement
{
  if (result)
  {
    if (processHasPerfPowerServicesEntitlement_onceToken != -1) {
      dispatch_once(&processHasPerfPowerServicesEntitlement_onceToken, &__block_literal_global_81);
    }
    return processHasPerfPowerServicesEntitlement_sHasEntitlement != 0;
  }
  return result;
}

uint64_t __28__VKAVCapture_sendPowerLogs__block_invoke()
{
  uint64_t result = PPSCreateTelemetryIdentifier();
  sendPowerLogs_streamId = result;
  return result;
}

- (uint64_t)device
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

void __53__VKAVCapture_processHasPerfPowerServicesEntitlement__block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    uint64_t v1 = v0;
    *(void *)cf = 0;
    CFTypeRef v2 = SecTaskCopyValueForEntitlement(v0, @"com.apple.PerfPowerServices.data-donation", (CFErrorRef *)cf);
    if (v2)
    {
      id v3 = (void *)v2;
      CFTypeID v4 = CFGetTypeID(v2);
      if (v4 == CFBooleanGetTypeID()) {
        char v5 = [v3 BOOLValue];
      }
      else {
        char v5 = 0;
      }
      processHasPerfPowerServicesEntitlement_sHasEntitlement = v5;
      CFRelease(v3);
    }
    CFRelease(v1);
    if (*(void *)cf)
    {
      id v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __53__VKAVCapture_processHasPerfPowerServicesEntitlement__block_invoke_cold_1((uint64_t)cf, v6, v7, v8, v9, v10, v11, v12);
      }

      CFRelease(*(CFTypeRef *)cf);
    }
  }
  int v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = VKMUIStringForBool(processHasPerfPowerServicesEntitlement_sHasEntitlement);
    *(_DWORD *)cf = 138412290;
    *(void *)&cf[4] = v14;
    _os_log_impl(&dword_1DB266000, v13, OS_LOG_TYPE_DEFAULT, "Process has PerfPowerServicesEntitlement: %@", cf, 0xCu);
  }
}

- (void)stopRunning
{
  if (a1)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    CFTypeRef v2 = (void *)a1[1];
    vk_performBlockOnQueueWithStrongSelf(v2, a1, &__block_literal_global_87);
  }
}

void __26__VKAVCapture_stopRunning__block_invoke(uint64_t a1, void *a2)
{
  CFTypeRef v2 = a2;
  -[VKAVCapture sendPowerLogs]((uint64_t)v2);
  if (v2)
  {
    [v2[4] stopRunning];
    id v3 = v2[4];
  }
  else
  {
    [0 stopRunning];
    id v3 = 0;
  }
  id v4 = v3;
  [v4 stopRunning];
}

- (double)interestPoint
{
  if (!a1) {
    return 0.0;
  }
  id v1 = *(id *)(a1 + 48);
  if ([v1 isFocusPointOfInterestSupported])
  {
    [v1 focusPointOfInterest];
  }
  else
  {
    if (![v1 isExposurePointOfInterestSupported])
    {
      double v3 = *MEMORY[0x1E4F1DAD8];
      goto LABEL_8;
    }
    [v1 exposurePointOfInterest];
  }
  double v3 = v2;
LABEL_8:

  return v3;
}

- (void)setInterestPoint:(double)a3
{
  if (a1)
  {
    id v4 = (void *)a1[1];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __32__VKAVCapture_setInterestPoint___block_invoke;
    v5[3] = &unk_1E6BF30C8;
    v5[4] = a1;
    *(double *)&v5[5] = a2;
    *(double *)&v5[6] = a3;
    vk_performBlockOnQueueWithStrongSelf(v4, a1, v5);
  }
}

void __32__VKAVCapture_setInterestPoint___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  if (v2) {
    double v2 = (void *)v2[6];
  }
  double v3 = v2;
  id v11 = 0;
  int v4 = [v3 lockForConfiguration:&v11];
  id v5 = v11;
  if (v4)
  {
    if ([v3 isFocusPointOfInterestSupported])
    {
      objc_msgSend(v3, "setFocusPointOfInterest:", *(double *)(a1 + 40), *(double *)(a1 + 48));
      [v3 setFocusMode:2];
    }
    else
    {
      uint64_t v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB266000, v7, OS_LOG_TYPE_INFO, "focusPointOfInterestSupported not supported.", buf, 2u);
      }
    }
    if ([v3 isExposurePointOfInterestSupported])
    {
      objc_msgSend(v3, "setExposurePointOfInterest:", *(double *)(a1 + 40), *(double *)(a1 + 48));
      [v3 setExposureMode:2];
    }
    else
    {
      uint64_t v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1DB266000, v8, OS_LOG_TYPE_INFO, "exposurePointOfInterestSupported not supported.", v9, 2u);
      }
    }
    [v3 unlockForConfiguration];
  }
  else
  {
    id v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __32__VKAVCapture_setInterestPoint___block_invoke_cold_1();
    }
  }
}

- (uint64_t)hasTorch
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = *(id *)(a1 + 48);
    if ([v2 hasTorch]) {
      uint64_t v1 = [*(id *)(v1 + 48) isTorchAvailable];
    }
    else {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (uint64_t)isTorchOn
{
  if (result) {
    return [*(id *)(result + 48) isTorchActive];
  }
  return result;
}

- (void)setTorchOn:(uint64_t)a1
{
  if (a1)
  {
    char v2 = a2;
    if ([*(id *)(a1 + 48) isTorchActive] != a2)
    {
      int v4 = *(void **)(a1 + 8);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __26__VKAVCapture_setTorchOn___block_invoke;
      v5[3] = &unk_1E6BF30F0;
      v5[4] = a1;
      char v6 = v2;
      vk_performBlockOnQueueWithStrongSelf(v4, (void *)a1, v5);
    }
  }
}

void __26__VKAVCapture_setTorchOn___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  if (v2) {
    char v2 = (void *)v2[6];
  }
  double v3 = v2;
  id v7 = 0;
  int v4 = [v3 lockForConfiguration:&v7];
  id v5 = v7;
  if (v4)
  {
    [v3 setTorchMode:*(unsigned __int8 *)(a1 + 40)];
    [v3 unlockForConfiguration];
  }
  else
  {
    char v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __26__VKAVCapture_setTorchOn___block_invoke_cold_1();
    }
  }
}

- (double)videoRotationAngle
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 40) videoRotationAngle];
  return result;
}

- (uint64_t)connection
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (void)setVideoRotationAngle:(double)a3 completion:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = *(id *)(a1 + 40);
    id v7 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__VKAVCapture_setVideoRotationAngle_completion___block_invoke;
    block[3] = &unk_1E6BF3118;
    id v10 = v6;
    double v12 = a3;
    id v11 = v5;
    id v8 = v6;
    dispatch_async(v7, block);
  }
}

void __48__VKAVCapture_setVideoRotationAngle_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setVideoRotationAngle:*(double *)(a1 + 48)];
  char v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __48__VKAVCapture_setVideoRotationAngle_completion___block_invoke_2;
    v3[3] = &unk_1E6BF0B10;
    id v4 = v2;
    vk_performBlockOnMainThread(v3);
  }
}

uint64_t __48__VKAVCapture_setVideoRotationAngle_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)minZoomFactor
{
  uint64_t v12 = 0;
  int v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  if (self) {
    device = self->_device;
  }
  else {
    device = 0;
  }
  uint64_t v15 = 0;
  id v4 = device;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__VKAVCapture_minZoomFactor__block_invoke;
  v9[3] = &unk_1E6BF3140;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, v9);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __28__VKAVCapture_minZoomFactor__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) minAvailableVideoZoomFactor];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)maxZoomFactor
{
  uint64_t v12 = 0;
  int v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  if (self) {
    device = self->_device;
  }
  else {
    device = 0;
  }
  uint64_t v15 = 0;
  id v4 = device;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__VKAVCapture_maxZoomFactor__block_invoke;
  v9[3] = &unk_1E6BF3140;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, v9);
  double v7 = v13[3];
  if (!self->_preferBinning)
  {
    if (v7 > 5.0) {
      double v7 = 5.0;
    }
    void v13[3] = v7;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __28__VKAVCapture_maxZoomFactor__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) maxAvailableVideoZoomFactor];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)zoomFactor
{
  uint64_t v12 = 0;
  int v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  if (self) {
    device = self->_device;
  }
  else {
    device = 0;
  }
  uint64_t v15 = 0;
  id v4 = device;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __25__VKAVCapture_zoomFactor__block_invoke;
  v9[3] = &unk_1E6BF3140;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, v9);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __25__VKAVCapture_zoomFactor__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) videoZoomFactor];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setZoomFactor:(double)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(VKAVCapture *)self minZoomFactor];
  double v6 = v5;
  [(VKAVCapture *)self maxZoomFactor];
  double v8 = VKMClamp(a3, v6, v7);
  if (self) {
    device = self->_device;
  }
  else {
    device = 0;
  }
  id v10 = device;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __29__VKAVCapture_setZoomFactor___block_invoke;
  void v13[3] = &unk_1E6BF1BA0;
  uint64_t v14 = v10;
  double v15 = v8;
  uint64_t v12 = v10;
  dispatch_async(queue, v13);
}

void __29__VKAVCapture_setZoomFactor___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  id v6 = 0;
  int v3 = [v2 lockForConfiguration:&v6];
  id v4 = v6;
  if (v3)
  {
    [*(id *)(a1 + 32) setVideoZoomFactor:*(double *)(a1 + 40)];
    [*(id *)(a1 + 32) unlockForConfiguration];
  }
  else
  {
    double v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __29__VKAVCapture_setZoomFactor___block_invoke_cold_1();
    }
  }
}

- (void)_sessionRuntimeError:(id)a3
{
  int v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F15998]];

  double v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[VKAVCapture _sessionRuntimeError:]();
  }
}

- (uint64_t)setDelegate:(uint64_t)result
{
  if (result) {
    *(void *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)photoOutput
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)startTime
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoDataOutput, 0);
  objc_storeStrong((id *)&self->_photoOutput, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)prepareWithConfiguration:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Camera preparation failed. Camera access denied.", v2, v3, v4, v5, v6);
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Failure adding device input for camera capture session.", v2, v3, v4, v5, v6);
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Failure adding photo output for camera capture session", v2, v3, v4, v5, v6);
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB266000, v0, v1, "Error setting initial focus and exposure. %@", v2, v3, v4, v5, v6);
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB266000, v0, v1, "Error setting the frame rate for the device. %@", v2, v3, v4, v5, v6);
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB266000, v0, v1, "Error setting initial zoom factor. %@", v2, v3, v4, v5, v6);
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_7()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB266000, v0, v1, "Error retrieving AVCaptureDeviceInput. %@", v2, v3, v4, v5, v6);
}

void __51__VKAVCapture_prepareWithConfiguration_completion___block_invoke_3_cold_8()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB266000, v0, v1, "Error finding best capture device. %@", v2, v3, v4, v5, v6);
}

void __27__VKAVCapture_startRunning__block_invoke_cold_1(void *a1)
{
  id v1 = objc_begin_catch(a1);
  uint64_t v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    OUTLINED_FUNCTION_4(&dword_1DB266000, v3, v4, "caught exception trying to start the session: %@", v5, v6, v7, v8, 2u);
  }

  objc_end_catch();
}

void __53__VKAVCapture_processHasPerfPowerServicesEntitlement__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __26__VKAVCapture_stopRunning__block_invoke_cold_1(void *a1)
{
  id v1 = objc_begin_catch(a1);
  uint64_t v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    OUTLINED_FUNCTION_4(&dword_1DB266000, v3, v4, "caught exception trying to stop the session: %@", v5, v6, v7, v8, 2u);
  }

  objc_end_catch();
}

void __32__VKAVCapture_setInterestPoint___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB266000, v0, v1, "Error setting a point of interest. %@", v2, v3, v4, v5, v6);
}

void __26__VKAVCapture_setTorchOn___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB266000, v0, v1, "Error turning torch on. %@", v2, v3, v4, v5, v6);
}

void __29__VKAVCapture_setZoomFactor___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB266000, v0, v1, "Error adjusting zoom. %@", v2, v3, v4, v5, v6);
}

- (void)_sessionRuntimeError:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB266000, v0, v1, "Capture session runtime error %@", v2, v3, v4, v5, v6);
}

@end