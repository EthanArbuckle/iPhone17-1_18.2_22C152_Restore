@interface TUVideoDeviceControllerProvider
+ (void)prewarm;
- (AVConferencePreview)preview;
- (BOOL)hasAvailableDeskViewCameras;
- (BOOL)isCameraBlurEnabled;
- (BOOL)isCinematicFramingEnabled;
- (BOOL)isPreviewRunning;
- (BOOL)isReactionEffectGestureEnabled;
- (BOOL)isStudioLightEnabled;
- (BOOL)supportsCameraBlurForDevice:(id)a3;
- (NSArray)availableVideoEffects;
- (NSArray)inputDevices;
- (NSString)localCameraUID;
- (TUVideoDeviceControllerProvider)init;
- (TUVideoDeviceControllerProviderDelegate)delegate;
- (TUVideoEffect)currentVideoEffect;
- (VideoAttributes)localVideoAttributes;
- (id)localScreenAttributesForVideoAttributes:(id)a3;
- (id)localVideoLayer:(BOOL)a3;
- (id)thumbnailImageForVideoEffectName:(id)a3;
- (int64_t)currentBackgroundBlurControlMode;
- (void)beginPIPToPreviewAnimation;
- (void)beginPreviewToPIPAnimation;
- (void)cameraCinematicFramingAvailabilityDidChange:(BOOL)a3;
- (void)cameraDidBecomeAvailableForUniqueID:(id)a3;
- (void)cameraZoomAvailabilityDidChange:(BOOL)a3;
- (void)captureDevicesChanged:(id)a3;
- (void)centerStageAvailableChangedNotification:(id)a3;
- (void)dealloc;
- (void)didChangeLocalCameraUID:(id)a3;
- (void)didChangeLocalVideoAttributes:(id)a3;
- (void)didGetSnapshot:(id)a3;
- (void)didPausePreview;
- (void)didReceiveErrorFromCameraUniqueID:(id)a3 error:(id)a4;
- (void)didReceiveFirstPreviewFrameFromCameraUniqueID:(id)a3;
- (void)didStartPreview;
- (void)didStopPreview;
- (void)endPIPToPreviewAnimation;
- (void)endPreviewToPIPAnimation;
- (void)getSnapshot;
- (void)inputDevices;
- (void)notifyCenterStageEnabled:(BOOL)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pausePreview;
- (void)queryAVCaptureDeviceIfNeeded;
- (void)rampCameraZoomFactor:(double)a3 withRate:(double)a4;
- (void)setCameraBlurEnabled:(BOOL)a3;
- (void)setCameraZoomFactor:(double)a3;
- (void)setCinematicFramingEnabled:(BOOL)a3;
- (void)setCurrentBackgroundBlurControlMode:(int64_t)a3;
- (void)setCurrentVideoEffect:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalCameraWithUID:(id)a3;
- (void)setLocalScreenAttributes:(id)a3;
- (void)setLocalVideoAttributes:(id)a3;
- (void)setLocalVideoLayer:(id)a3 front:(BOOL)a4;
- (void)setLocalVideoLayerHost:(id)a3 front:(BOOL)a4;
- (void)setReactionEffectGestureEnabled:(BOOL)a3;
- (void)setStudioLightEnabled:(BOOL)a3;
- (void)startPreview;
- (void)stopPreview;
@end

@implementation TUVideoDeviceControllerProvider

- (NSArray)inputDevices
{
  v89[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  if (!inputDevices__AVMediaTypeVideo)
  {
    v3 = (void **)CUTWeakLinkSymbol();
    if (v3) {
      v4 = *v3;
    }
    else {
      v4 = 0;
    }
    objc_storeStrong((id *)&inputDevices__AVMediaTypeVideo, v4);
  }
  v74 = (void *)v2;
  v5 = (void *)CUTWeakLinkClass();
  v6 = (void *)CUTWeakLinkClass();
  if (!inputDevices__AVCaptureDeviceTypeBuiltInTrueDepthCamera)
  {
    v7 = (void **)CUTWeakLinkSymbol();
    if (v7) {
      v8 = *v7;
    }
    else {
      v8 = 0;
    }
    objc_storeStrong((id *)&inputDevices__AVCaptureDeviceTypeBuiltInTrueDepthCamera, v8);
  }
  if (!inputDevices__AVCaptureDeviceTypeBuiltInWideAngleCamera)
  {
    v9 = (void **)CUTWeakLinkSymbol();
    if (v9) {
      v10 = *v9;
    }
    else {
      v10 = 0;
    }
    objc_storeStrong((id *)&inputDevices__AVCaptureDeviceTypeBuiltInWideAngleCamera, v10);
  }
  if (!inputDevices__AVCaptureDeviceTypeBuiltInTripleCamera)
  {
    v11 = (void **)CUTWeakLinkSymbol();
    if (v11) {
      v12 = *v11;
    }
    else {
      v12 = 0;
    }
    objc_storeStrong((id *)&inputDevices__AVCaptureDeviceTypeBuiltInTripleCamera, v12);
  }
  if (!inputDevices__AVCaptureDeviceTypeBuiltInDualWideCamera)
  {
    v13 = (void **)CUTWeakLinkSymbol();
    if (v13) {
      v14 = *v13;
    }
    else {
      v14 = 0;
    }
    objc_storeStrong((id *)&inputDevices__AVCaptureDeviceTypeBuiltInDualWideCamera, v14);
  }
  if (!inputDevices__AVCaptureDeviceTypeBuiltInDualCamera)
  {
    v15 = (void **)CUTWeakLinkSymbol();
    if (v15) {
      v16 = *v15;
    }
    else {
      v16 = 0;
    }
    objc_storeStrong((id *)&inputDevices__AVCaptureDeviceTypeBuiltInDualCamera, v16);
  }
  if (!inputDevices_AVCaptureDeviceTypeBuiltInUltraWideCamera)
  {
    v17 = (void **)CUTWeakLinkSymbol();
    if (v17) {
      v18 = *v17;
    }
    else {
      v18 = 0;
    }
    objc_storeStrong((id *)&inputDevices_AVCaptureDeviceTypeBuiltInUltraWideCamera, v18);
  }
  if (!inputDevices__AVCaptureDeviceTypeExternal)
  {
    v19 = (void **)CUTWeakLinkSymbol();
    if (v19) {
      v20 = *v19;
    }
    else {
      v20 = 0;
    }
    objc_storeStrong((id *)&inputDevices__AVCaptureDeviceTypeExternal, v20);
  }
  v89[0] = inputDevices__AVCaptureDeviceTypeBuiltInTrueDepthCamera;
  int v21 = 1;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:1];
  v23 = [v5 discoverySessionWithDeviceTypes:v22 mediaType:inputDevices__AVMediaTypeVideo position:2];

  uint64_t v88 = inputDevices__AVCaptureDeviceTypeBuiltInWideAngleCamera;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
  v25 = [v5 discoverySessionWithDeviceTypes:v24 mediaType:inputDevices__AVMediaTypeVideo position:2];

  v72 = v23;
  v26 = [v23 devices];
  v71 = v25;
  v27 = [v25 devices];
  v69 = objc_alloc_init(TUFeatureFlags);
  v70 = v27;
  if ([(TUFeatureFlags *)v69 wombatWisdomEnabled])
  {
    v28 = [v6 systemPreferredCamera];
    id v29 = v28;
    if (v28)
    {
      if ([v28 position] == 2
        || ([v29 deviceType],
            v30 = objc_claimAutoreleasedReturnValue(),
            id v31 = v29,
            uint64_t v32 = inputDevices__AVCaptureDeviceTypeExternal,
            v30,
            BOOL v33 = v30 == (void *)v32,
            id v29 = v31,
            v33))
      {
        v34 = TUDefaultLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          [v29 uniqueID];
          v36 = id v35 = v29;
          *(_DWORD *)buf = 138412290;
          uint64_t v77 = (uint64_t)v36;
          _os_log_impl(&dword_19C496000, v34, OS_LOG_TYPE_DEFAULT, "Found a system-preferred camera, using it as the front capture device: %@", buf, 0xCu);

          id v29 = v35;
        }

        id v29 = v29;
        v68 = v29;
        goto LABEL_58;
      }
      int v21 = 0;
    }
    else
    {
      int v21 = 1;
    }
  }
  else
  {
    id v29 = 0;
  }
  if ([v26 count])
  {
    v68 = [v26 firstObject];
    if ((v21 & 1) == 0) {
      goto LABEL_58;
    }
  }
  else
  {
    v68 = [v27 firstObject];
    if (!v21) {
      goto LABEL_58;
    }
  }
  v37 = TUDefaultLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v37, OS_LOG_TYPE_DEFAULT, "Didn't find a system-preferred camera", buf, 2u);
  }

LABEL_58:
  uint64_t v87 = inputDevices__AVCaptureDeviceTypeBuiltInTripleCamera;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
  v39 = [v5 discoverySessionWithDeviceTypes:v38 mediaType:inputDevices__AVMediaTypeVideo position:1];

  uint64_t v86 = inputDevices__AVCaptureDeviceTypeBuiltInDualCamera;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
  v41 = [v5 discoverySessionWithDeviceTypes:v40 mediaType:inputDevices__AVMediaTypeVideo position:1];

  uint64_t v85 = inputDevices__AVCaptureDeviceTypeBuiltInDualWideCamera;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
  v43 = [v5 discoverySessionWithDeviceTypes:v42 mediaType:inputDevices__AVMediaTypeVideo position:1];

  uint64_t v84 = inputDevices__AVCaptureDeviceTypeBuiltInWideAngleCamera;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
  v45 = [v5 discoverySessionWithDeviceTypes:v44 mediaType:inputDevices__AVMediaTypeVideo position:1];

  v67 = v39;
  v46 = [v39 devices];
  v66 = v41;
  v47 = [v41 devices];
  v65 = v43;
  v48 = [v43 devices];
  v75 = [v45 devices];
  uint64_t v49 = [v46 count];
  v50 = v46;
  if (!v49)
  {
    uint64_t v51 = [v47 count];
    v50 = v47;
    if (!v51)
    {
      if ([v48 count]) {
        v50 = v48;
      }
      else {
        v50 = v75;
      }
    }
  }
  v52 = [v50 firstObject];
  v53 = TUDefaultLog();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v64 = v45;
    id v54 = v29;
    uint64_t v55 = [v46 count];
    v56 = v26;
    uint64_t v57 = [v47 count];
    uint64_t v58 = [v48 count];
    uint64_t v59 = [v75 count];
    *(_DWORD *)buf = 134218752;
    uint64_t v77 = v55;
    id v29 = v54;
    v45 = v64;
    __int16 v78 = 2048;
    uint64_t v79 = v57;
    v26 = v56;
    __int16 v80 = 2048;
    uint64_t v81 = v58;
    __int16 v82 = 2048;
    uint64_t v83 = v59;
    _os_log_impl(&dword_19C496000, v53, OS_LOG_TYPE_DEFAULT, "backTripleCameraDevices.count=%lu, backDualCameraDevices.count=%lu,  backDualWideCameraDevices.count =%lu, backWideCameraDevices.count=%lu", buf, 0x2Au);
  }

  if (v68)
  {
    [v74 addObject:v68];
    if (v52)
    {
LABEL_67:
      [v74 addObject:v52];
      goto LABEL_74;
    }
  }
  else
  {
    v60 = TUDefaultLog();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      -[TUVideoDeviceControllerProvider inputDevices](v60);
    }

    if (v52) {
      goto LABEL_67;
    }
  }
  v61 = TUDefaultLog();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
    -[TUVideoDeviceControllerProvider inputDevices](v61);
  }

LABEL_74:
  self->_isAVCaptureDeviceReady = 1;
  v62 = TUDefaultLog();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v77 = (uint64_t)v74;
    _os_log_impl(&dword_19C496000, v62, OS_LOG_TYPE_DEFAULT, "inputDevices = %@", buf, 0xCu);
  }

  return (NSArray *)v74;
}

- (TUVideoDeviceControllerProvider)init
{
  v18.receiver = self;
  v18.super_class = (Class)TUVideoDeviceControllerProvider;
  uint64_t v2 = [(TUVideoDeviceControllerProvider *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [(id)CUTWeakLinkClass() AVConferencePreviewSingleton];
    preview = v2->_preview;
    v2->_preview = (AVConferencePreview *)v3;

    [(AVConferencePreview *)v2->_preview setDelegate:v2];
    if (!init__AVCaptureDeviceWasConnectedNotification)
    {
      v5 = (void **)CUTWeakLinkSymbol();
      if (v5) {
        v6 = *v5;
      }
      else {
        v6 = 0;
      }
      objc_storeStrong((id *)&init__AVCaptureDeviceWasConnectedNotification, v6);
    }
    if (!init__AVCaptureDeviceWasDisconnectedNotification)
    {
      v7 = (void **)CUTWeakLinkSymbol();
      if (v7) {
        v8 = *v7;
      }
      else {
        v8 = 0;
      }
      objc_storeStrong((id *)&init__AVCaptureDeviceWasDisconnectedNotification, v8);
    }
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel_captureDevicesChanged_ name:init__AVCaptureDeviceWasConnectedNotification object:0];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v2 selector:sel_captureDevicesChanged_ name:init__AVCaptureDeviceWasDisconnectedNotification object:0];

    if (!init__AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification)
    {
      v11 = (void **)CUTWeakLinkSymbol();
      if (v11) {
        v12 = *v11;
      }
      else {
        v12 = 0;
      }
      objc_storeStrong((id *)&init__AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification, v12);
    }
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v2 selector:sel_centerStageAvailableChangedNotification_ name:init__AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification object:0];

    v14 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__TUVideoDeviceControllerProvider_init__block_invoke;
    block[3] = &unk_1E58E5BE0;
    v17 = v2;
    dispatch_async(v14, block);
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
}

- (void)didReceiveFirstPreviewFrameFromCameraUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUVideoDeviceControllerProvider *)self delegate];
  [v5 provider:self didReceiveFirstPreviewFrameFromCameraUniqueID:v4];
}

- (void)didStartPreview
{
  id v3 = [(TUVideoDeviceControllerProvider *)self delegate];
  [v3 didStartPreviewForProvider:self];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  v13 = TUDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = 138412546;
    v40 = v10;
    __int16 v41 = 2112;
    id v42 = v11;
    _os_log_impl(&dword_19C496000, v13, OS_LOG_TYPE_DEFAULT, "Received a key-value observing notification for key path (%@) object (%@).", (uint8_t *)&v39, 0x16u);
  }

  if (a6 == &TUVideoDeviceControllerProviderKeyValueObserverContext)
  {
    v14 = [(TUVideoDeviceControllerProvider *)self delegate];
    int v15 = [(__CFString *)v10 isEqualToString:@"backgroundBlurEnabled"];
    v16 = (void *)MEMORY[0x1E4F284C8];
    if (v15)
    {
      v17 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
      uint64_t v18 = [v17 BOOLValue];

      v19 = TUDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = @"disabled";
        if (v18) {
          v20 = @"enabled";
        }
        int v39 = 138412290;
        v40 = v20;
        _os_log_impl(&dword_19C496000, v19, OS_LOG_TYPE_DEFAULT, "Camera blur changed to %@", (uint8_t *)&v39, 0xCu);
      }

      [v14 provider:self cameraBlurEnabledDidChange:v18];
    }
    if ([(__CFString *)v10 isEqualToString:@"userPreferredCamera"])
    {
      int v21 = [v12 objectForKeyedSubscript:*v16];
      CUTWeakLinkClass();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [(__CFString *)v21 uniqueID];
      }
      else
      {
        v22 = 0;
      }
      v23 = TUDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138412290;
        v40 = v21;
        _os_log_impl(&dword_19C496000, v23, OS_LOG_TYPE_DEFAULT, "userPreferredCamera changed to %@", (uint8_t *)&v39, 0xCu);
      }

      [v14 provider:self userPreferredCameraUIDDidChange:v22];
    }
    if ([(__CFString *)v10 isEqualToString:@"systemPreferredCamera"])
    {
      v24 = [v12 objectForKeyedSubscript:*v16];
      CUTWeakLinkClass();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [(__CFString *)v24 uniqueID];
      }
      else
      {
        v25 = 0;
      }
      v26 = TUDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138412290;
        v40 = v24;
        _os_log_impl(&dword_19C496000, v26, OS_LOG_TYPE_DEFAULT, "systemPreferredCamera changed to %@", (uint8_t *)&v39, 0xCu);
      }

      [v14 provider:self systemPreferredCameraUIDDidChange:v25];
    }
    if ([(__CFString *)v10 isEqualToString:@"cinematicFramingEnabled"])
    {
      v27 = [v12 objectForKeyedSubscript:*v16];
      uint64_t v28 = [v27 BOOLValue];

      id v29 = TUDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = @"disabled";
        if (v28) {
          v30 = @"enabled";
        }
        int v39 = 138412290;
        v40 = v30;
        _os_log_impl(&dword_19C496000, v29, OS_LOG_TYPE_DEFAULT, "Center Stage changed to %@", (uint8_t *)&v39, 0xCu);
      }

      [(TUVideoDeviceControllerProvider *)self notifyCenterStageEnabled:v28];
      [v14 provider:self cameraCinematicFramingEnabledDidChange:v28];
    }
    if ([(__CFString *)v10 isEqualToString:@"reactionEffectGesturesEnabled"])
    {
      id v31 = [v12 objectForKeyedSubscript:*v16];
      uint64_t v32 = [v31 BOOLValue];

      BOOL v33 = TUDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = @"disabled";
        if (v32) {
          v34 = @"enabled";
        }
        int v39 = 138412290;
        v40 = v34;
        _os_log_impl(&dword_19C496000, v33, OS_LOG_TYPE_DEFAULT, "Reaction Effects changed to %@", (uint8_t *)&v39, 0xCu);
      }

      [v14 provider:self reactionEffectsEnabledDidChange:v32];
    }
    if ([(__CFString *)v10 isEqualToString:@"studioLightingEnabled"])
    {
      id v35 = [v12 objectForKeyedSubscript:*v16];
      uint64_t v36 = [v35 BOOLValue];

      v37 = TUDefaultLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = @"disabled";
        if (v36) {
          v38 = @"enabled";
        }
        int v39 = 138412290;
        v40 = v38;
        _os_log_impl(&dword_19C496000, v37, OS_LOG_TYPE_DEFAULT, "Studio Light changed to %@", (uint8_t *)&v39, 0xCu);
      }

      [v14 provider:self studioLightEnabledDidChange:v36];
    }
  }
}

- (void)setLocalVideoLayer:(id)a3 front:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(TUVideoDeviceControllerProvider *)self preview];
  [v7 setLocalVideoLayer:v6 front:v4];
}

- (void)cameraZoomAvailabilityDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TUVideoDeviceControllerProvider *)self delegate];
  [v5 provider:self cameraZoomAvailabilityDidChange:v3];
}

- (void)didChangeLocalVideoAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(TUVideoDeviceControllerProvider *)self delegate];
  [v5 provider:self didChangeLocalVideoAttributes:v4];
}

- (TUVideoDeviceControllerProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUVideoDeviceControllerProviderDelegate *)WeakRetained;
}

- (NSString)localCameraUID
{
  uint64_t v2 = [(TUVideoDeviceControllerProvider *)self preview];
  BOOL v3 = [v2 localCameraUID];

  return (NSString *)v3;
}

- (AVConferencePreview)preview
{
  return self->_preview;
}

- (void)setLocalVideoAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(TUVideoDeviceControllerProvider *)self preview];
  [v5 setLocalVideoAttributes:v4];
}

- (VideoAttributes)localVideoAttributes
{
  uint64_t v2 = [(TUVideoDeviceControllerProvider *)self preview];
  BOOL v3 = [v2 localVideoAttributes];

  return (VideoAttributes *)v3;
}

- (void)startPreview
{
  [(TUVideoDeviceControllerProvider *)self setCinematicFramingEnabled:[(TUVideoDeviceControllerProvider *)self isCinematicFramingEnabled]];
  id v3 = [(TUVideoDeviceControllerProvider *)self preview];
  [v3 startPreview];
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Setting center stage to: %d", (uint8_t *)v7, 8u);
  }

  id v6 = [(TUVideoDeviceControllerProvider *)self preview];
  if (objc_opt_respondsToSelector()) {
    [v6 setCinematicFramingEnabled:v3];
  }
}

- (BOOL)isCinematicFramingEnabled
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)CUTWeakLinkClass();
  if (objc_opt_respondsToSelector())
  {
    [(TUVideoDeviceControllerProvider *)self queryAVCaptureDeviceIfNeeded];
    int v4 = [v3 isCinematicFramingEnabled];
  }
  else
  {
    int v4 = 0;
  }
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Center Stage is enabled: %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (void)queryAVCaptureDeviceIfNeeded
{
  if (!self->_isAVCaptureDeviceReady)
  {
    BOOL v3 = (void *)CUTWeakLinkClass();
    uint64_t v4 = queryAVCaptureDeviceIfNeeded__AVMediaTypeVideo;
    if (!queryAVCaptureDeviceIfNeeded__AVMediaTypeVideo)
    {
      id v5 = (void **)CUTWeakLinkSymbol();
      if (v5) {
        id v6 = *v5;
      }
      else {
        id v6 = 0;
      }
      objc_storeStrong((id *)&queryAVCaptureDeviceIfNeeded__AVMediaTypeVideo, v6);
      uint64_t v4 = queryAVCaptureDeviceIfNeeded__AVMediaTypeVideo;
    }
    if (v3)
    {
      if (v4)
      {
        id v7 = (id)objc_msgSend(v3, "devicesWithMediaType:");
        self->_isAVCaptureDeviceReady = 1;
      }
    }
  }
}

uint64_t __39__TUVideoDeviceControllerProvider_init__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)CUTWeakLinkClass();
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = v2;
    __int16 v10 = 2112;
    id v11 = @"backgroundBlurEnabled";
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Adding observer to %@ for key path %@", (uint8_t *)&v8, 0x16u);
  }

  [v2 addObserver:*(void *)(a1 + 32) forKeyPath:@"backgroundBlurEnabled" options:1 context:&TUVideoDeviceControllerProviderKeyValueObserverContext];
  [v2 addObserver:*(void *)(a1 + 32) forKeyPath:@"systemPreferredCamera" options:1 context:&TUVideoDeviceControllerProviderKeyValueObserverContext];
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = v2;
    __int16 v10 = 2112;
    id v11 = @"cinematicFramingEnabled";
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Adding observer to %@ for key path %@", (uint8_t *)&v8, 0x16u);
  }

  [v2 addObserver:*(void *)(a1 + 32) forKeyPath:@"cinematicFramingEnabled" options:1 context:&TUVideoDeviceControllerProviderKeyValueObserverContext];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = v2;
    __int16 v10 = 2112;
    id v11 = @"reactionEffectGesturesEnabled";
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Adding observer to %@ for key path %@", (uint8_t *)&v8, 0x16u);
  }

  [v2 addObserver:*(void *)(a1 + 32) forKeyPath:@"reactionEffectGesturesEnabled" options:1 context:&TUVideoDeviceControllerProviderKeyValueObserverContext];
  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = v2;
    __int16 v10 = 2112;
    id v11 = @"studioLightingEnabled";
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Adding observer to %@ for key path %@", (uint8_t *)&v8, 0x16u);
  }

  return [v2 addObserver:*(void *)(a1 + 32) forKeyPath:@"studioLightingEnabled" options:1 context:&TUVideoDeviceControllerProviderKeyValueObserverContext];
}

+ (void)prewarm
{
  uint64_t v2 = dispatch_get_global_queue(21, 0);
  dispatch_async(v2, &__block_literal_global_47);
}

void __42__TUVideoDeviceControllerProvider_prewarm__block_invoke()
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (!TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVMediaTypeVideo)
  {
    v0 = (void **)CUTWeakLinkSymbol();
    if (v0) {
      v1 = *v0;
    }
    else {
      v1 = 0;
    }
    objc_storeStrong((id *)&TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVMediaTypeVideo, v1);
  }
  uint64_t v2 = (void *)CUTWeakLinkClass();
  if (!TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInTrueDepthCamera)
  {
    BOOL v3 = (void **)CUTWeakLinkSymbol();
    if (v3) {
      uint64_t v4 = *v3;
    }
    else {
      uint64_t v4 = 0;
    }
    objc_storeStrong((id *)&TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInTrueDepthCamera, v4);
  }
  if (!TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInWideAngleCamera)
  {
    id v5 = (void **)CUTWeakLinkSymbol();
    if (v5) {
      id v6 = *v5;
    }
    else {
      id v6 = 0;
    }
    objc_storeStrong((id *)&TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInWideAngleCamera, v6);
  }
  if (!TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInDualCamera)
  {
    id v7 = (void **)CUTWeakLinkSymbol();
    if (v7) {
      int v8 = *v7;
    }
    else {
      int v8 = 0;
    }
    objc_storeStrong((id *)&TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInDualCamera, v8);
  }
  v14[0] = TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInTrueDepthCamera;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v10 = (id)[v2 discoverySessionWithDeviceTypes:v9 mediaType:TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVMediaTypeVideo position:2];

  uint64_t v13 = TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVCaptureDeviceTypeBuiltInWideAngleCamera;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  id v12 = (id)[v2 discoverySessionWithDeviceTypes:v11 mediaType:TUVideoDeviceControllerObserverKeyPathStudioLightEnabled_block_invoke__AVMediaTypeVideo position:2];
}

- (void)dealloc
{
  BOOL v3 = (void *)CUTWeakLinkClass();
  [v3 removeObserver:self forKeyPath:@"backgroundBlurEnabled"];
  [v3 removeObserver:self forKeyPath:@"systemPreferredCamera"];
  [v3 removeObserver:self forKeyPath:@"cinematicFramingEnabled"];
  [v3 removeObserver:self forKeyPath:@"reactionEffectGesturesEnabled"];
  [v3 removeObserver:self forKeyPath:@"studioLightingEnabled"];
  v4.receiver = self;
  v4.super_class = (Class)TUVideoDeviceControllerProvider;
  [(TUVideoDeviceControllerProvider *)&v4 dealloc];
}

- (BOOL)isPreviewRunning
{
  uint64_t v2 = [(TUVideoDeviceControllerProvider *)self preview];
  char v3 = [v2 isPreviewRunning];

  return v3;
}

- (void)setLocalCameraWithUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUVideoDeviceControllerProvider *)self preview];
  [v5 setLocalCameraWithUID:v4];
}

- (id)localVideoLayer:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TUVideoDeviceControllerProvider *)self preview];
  id v5 = [v4 localVideoLayer:v3];

  return v5;
}

- (void)setLocalVideoLayerHost:(id)a3 front:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v14 = v6;
  BOOL v13 = v4;
  id v7 = [(TUVideoDeviceControllerProvider *)self preview];
  SEL v8 = NSSelectorFromString(&cfstr_Setlocalvideol.isa);
  if (objc_opt_respondsToSelector())
  {
    v9 = (void *)MEMORY[0x1E4F1CA18];
    id v10 = [v7 methodSignatureForSelector:v8];
    id v11 = [v9 invocationWithMethodSignature:v10];

    [v11 setSelector:v8];
    [v11 setTarget:v7];
    [v11 setArgument:&v14 atIndex:2];
    [v11 setArgument:&v13 atIndex:3];
    [v11 invoke];
  }
  else
  {
    id v12 = [(TUVideoDeviceControllerProvider *)self preview];
    [v12 setLocalVideoLayer:v6 front:v4];
  }
}

- (void)pausePreview
{
  id v2 = [(TUVideoDeviceControllerProvider *)self preview];
  [v2 pausePreview];
}

- (void)stopPreview
{
  id v2 = [(TUVideoDeviceControllerProvider *)self preview];
  [v2 stopPreview];
}

- (void)getSnapshot
{
  if ([(TUVideoDeviceControllerProvider *)self isPreviewRunning])
  {
    id v3 = [(TUVideoDeviceControllerProvider *)self preview];
    [v3 getSnapshot];
  }
  else
  {
    id v3 = [(TUVideoDeviceControllerProvider *)self delegate];
    [v3 provider:self didGetSnapshot:0];
  }
}

- (void)notifyCenterStageEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Notifying center stage enabled to: %d", (uint8_t *)v7, 8u);
  }

  id v6 = [(TUVideoDeviceControllerProvider *)self preview];
  if (objc_opt_respondsToSelector()) {
    [v6 notifyCenterStageEnabled:v3];
  }
}

- (BOOL)isReactionEffectGestureEnabled
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)CUTWeakLinkClass();
  [(TUVideoDeviceControllerProvider *)self queryAVCaptureDeviceIfNeeded];
  int v4 = [v3 reactionEffectGesturesEnabled];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Reaction Effect Gestures are enabled: %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (void)setReactionEffectGestureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Setting Reaction Effect Gestures to: %d", (uint8_t *)v5, 8u);
  }

  [(id)CUTWeakLinkClass() setReactionEffectGesturesEnabled:v3];
}

- (BOOL)isStudioLightEnabled
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)CUTWeakLinkClass();
  [(TUVideoDeviceControllerProvider *)self queryAVCaptureDeviceIfNeeded];
  int v4 = [v3 isStudioLightingEnabled];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Studio Lighting is enabled: %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (void)setStudioLightEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Setting Studio Lighting to: %d", (uint8_t *)v6, 8u);
  }

  id v5 = (void *)CUTWeakLinkClass();
  [v5 setStudioLightingControlMode:2];
  [v5 setStudioLightingEnabled:v3];
}

- (BOOL)supportsCameraBlurForDevice:(id)a3
{
  BOOL v3 = [a3 activeFormat];
  char v4 = [v3 isBackgroundBlurSupported];

  return v4;
}

- (int64_t)currentBackgroundBlurControlMode
{
  id v2 = (void *)CUTWeakLinkClass();

  return [v2 backgroundBlurControlMode];
}

- (void)setCurrentBackgroundBlurControlMode:(int64_t)a3
{
  char v4 = (void *)CUTWeakLinkClass();

  [v4 setBackgroundBlurControlMode:a3];
}

- (BOOL)isCameraBlurEnabled
{
  id v2 = (void *)CUTWeakLinkClass();

  return [v2 isBackgroundBlurEnabled];
}

- (void)setCameraBlurEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v4 = (void *)CUTWeakLinkClass();
  if ([v4 backgroundBlurControlMode] == 2)
  {
    [v4 setBackgroundBlurEnabled:v3];
  }
  else
  {
    id v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "AVCaptureDevice backgroundBlurControlMode is not in supported state. Ignoring to set %d", (uint8_t *)v6, 8u);
    }
  }
}

- (id)localScreenAttributesForVideoAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(TUVideoDeviceControllerProvider *)self preview];
  uint64_t v6 = [v5 localScreenAttributesForVideoAttributes:v4];

  return v6;
}

- (void)setLocalScreenAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(TUVideoDeviceControllerProvider *)self preview];
  [v5 setLocalScreenAttributes:v4];
}

- (void)beginPreviewToPIPAnimation
{
  id v2 = [(TUVideoDeviceControllerProvider *)self preview];
  [v2 beginPreviewToPIPAnimation];
}

- (void)endPreviewToPIPAnimation
{
  id v2 = [(TUVideoDeviceControllerProvider *)self preview];
  [v2 endPreviewToPIPAnimation];
}

- (void)beginPIPToPreviewAnimation
{
  id v2 = [(TUVideoDeviceControllerProvider *)self preview];
  [v2 beginPIPToPreviewAnimation];
}

- (void)endPIPToPreviewAnimation
{
  id v2 = [(TUVideoDeviceControllerProvider *)self preview];
  [v2 endPIPToPreviewAnimation];
}

- (void)rampCameraZoomFactor:(double)a3 withRate:(double)a4
{
  id v6 = [(TUVideoDeviceControllerProvider *)self preview];
  [v6 setCameraZoomFactor:a3 withRate:a4];
}

- (void)setCameraZoomFactor:(double)a3
{
  id v4 = [(TUVideoDeviceControllerProvider *)self preview];
  [v4 setCameraZoomFactor:a3];
}

- (BOOL)hasAvailableDeskViewCameras
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)CUTWeakLinkClass();
  if (!hasAvailableDeskViewCameras__AVCaptureDeviceTypeDeskViewCamera)
  {
    BOOL v3 = (void **)CUTWeakLinkSymbol();
    if (v3) {
      id v4 = *v3;
    }
    else {
      id v4 = 0;
    }
    objc_storeStrong((id *)&hasAvailableDeskViewCameras__AVCaptureDeviceTypeDeskViewCamera, v4);
  }
  if (!hasAvailableDeskViewCameras__AVMediaTypeVideo)
  {
    id v5 = (void **)CUTWeakLinkSymbol();
    if (v5) {
      id v6 = *v5;
    }
    else {
      id v6 = 0;
    }
    objc_storeStrong((id *)&hasAvailableDeskViewCameras__AVMediaTypeVideo, v6);
  }
  v12[0] = hasAvailableDeskViewCameras__AVCaptureDeviceTypeDeskViewCamera;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v8 = [v2 discoverySessionWithDeviceTypes:v7 mediaType:hasAvailableDeskViewCameras__AVMediaTypeVideo position:0];

  v9 = [v8 devices];
  BOOL v10 = [v9 count] != 0;

  return v10;
}

- (void)didReceiveErrorFromCameraUniqueID:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUVideoDeviceControllerProvider *)self delegate];
  [v8 provider:self didReceiveErrorFromCameraUniqueID:v7 error:v6];
}

- (void)cameraDidBecomeAvailableForUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUVideoDeviceControllerProvider *)self delegate];
  [v5 provider:self cameraDidBecomeAvailableForUniqueID:v4];
}

- (void)didChangeLocalCameraUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUVideoDeviceControllerProvider *)self delegate];
  [v5 provider:self didChangeLocalCameraUID:v4];
}

- (void)didStopPreview
{
  id v3 = [(TUVideoDeviceControllerProvider *)self delegate];
  [v3 didStopPreviewForProvider:self];
}

- (void)didPausePreview
{
  id v3 = [(TUVideoDeviceControllerProvider *)self delegate];
  [v3 didPausePreviewForProvider:self];
}

- (void)didGetSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [(TUVideoDeviceControllerProvider *)self delegate];
  [v5 provider:self didGetSnapshot:v4];
}

- (void)cameraCinematicFramingAvailabilityDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TUVideoDeviceControllerProvider *)self delegate];
  [v5 provider:self cameraCinematicFramingAvailabilityDidChange:v3];
}

- (void)setCurrentVideoEffect:(id)a3
{
  p_currentVideoEffect = &self->_currentVideoEffect;
  id v8 = (TUVideoEffect *)a3;
  if (*p_currentVideoEffect != v8)
  {
    id v6 = [(TUVideoDeviceControllerProvider *)self preview];
    id v7 = [(TUVideoEffect *)v8 name];
    [v6 setAnimoji:v7];

    objc_storeStrong((id *)p_currentVideoEffect, a3);
  }
}

- (NSArray)availableVideoEffects
{
  id v2 = (void *)CUTWeakLinkClass();

  return (NSArray *)[v2 animojiNames];
}

- (id)thumbnailImageForVideoEffectName:(id)a3
{
  id v3 = a3;
  id v4 = [(id)CUTWeakLinkClass() thumbnailForAnimojiNamed:v3 options:0];

  return v4;
}

- (void)captureDevicesChanged:(id)a3
{
  id v4 = [(TUVideoDeviceControllerProvider *)self delegate];
  [v4 captureDevicesChangedForProvider:self];
}

- (void)centerStageAvailableChangedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F15A08]];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    uint64_t v10 = [v9 unsignedIntegerValue];
    id v11 = TUDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109120;
      v13[1] = v10 == 128;
      _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "DockKit tracking changed to %d", (uint8_t *)v13, 8u);
    }

    id v12 = [(TUVideoDeviceControllerProvider *)self delegate];
    [v12 provider:self dockKitTrackingDidChange:v10 == 128];
  }
}

- (TUVideoEffect)currentVideoEffect
{
  return self->_currentVideoEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_currentVideoEffect, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)inputDevices
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19C496000, log, OS_LOG_TYPE_ERROR, "Could not find any front capture devices", v1, 2u);
}

@end