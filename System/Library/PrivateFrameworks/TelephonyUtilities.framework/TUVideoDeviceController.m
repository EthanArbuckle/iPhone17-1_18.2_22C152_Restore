@interface TUVideoDeviceController
+ (int)_tuOrientationForVideoOrientation:(int)a3;
+ (int)_videoOrientationForTUOrientation:(int)a3;
+ (void)prewarm;
- (AVCaptureDevice)currentInputDevice;
- (BOOL)cameraBlurEnabled;
- (BOOL)currentInputIsExternal;
- (BOOL)currentInputSupportsCinematicFraming;
- (BOOL)currentInputSupportsReactionEffects;
- (BOOL)currentInputSupportsStudioLight;
- (BOOL)hasAvailableDeskViewCameras;
- (BOOL)hasBeganRetryingAfterUninitializedClientError;
- (BOOL)hasRefreshedPreviewAfterError;
- (BOOL)isCinematicFramingEnabled;
- (BOOL)isFollowSystemCameraEnabled;
- (BOOL)isPreviewRunning;
- (BOOL)isReactionEffectGestureEnabled;
- (BOOL)isStudioLightEnabled;
- (BOOL)retryAfterLocalCameraUIDChange;
- (BOOL)shouldIgnoreStartPreview;
- (BOOL)supportsCameraBlur;
- (BOOL)wantsPreview;
- (CALayer)localBackLayer;
- (CALayer)localBackLayerHost;
- (CALayer)localFrontLayer;
- (CALayer)localFrontLayerHost;
- (CGRect)localScreenContentsRect;
- (CGSize)localScreenLandscapeAspectRatio;
- (CGSize)localScreenPortraitAspectRatio;
- (CGSize)localVideoLandscapeAspectRatio;
- (CGSize)localVideoPortraitAspectRatio;
- (NSArray)availableVideoEffects;
- (NSArray)inputDevices;
- (OS_dispatch_queue)serialQueue;
- (TUFeatureFlags)featureFlags;
- (TUVideoDeviceController)init;
- (TUVideoDeviceController)initWithProvider:(id)a3 serialQueue:(id)a4 featureFlags:(id)a5;
- (TUVideoDeviceController)initWithSerialQueue:(id)a3;
- (TUVideoDeviceControllerProvider)provider;
- (TUVideoEffect)currentVideoEffect;
- (id)debugDescription;
- (id)landscapeScreenAttributes;
- (id)portraitScreenAttributes;
- (id)previewStartBlock;
- (id)reapplyCameraZoom;
- (int)currentBackgroundBlurControlMode;
- (int)currentVideoOrientation;
- (int64_t)uninitializedClientRetrySeconds;
- (void)_postIsCinematicFramingAvailable:(BOOL)a3;
- (void)captureDevicesChangedForProvider:(id)a3;
- (void)didPausePreviewForProvider:(id)a3;
- (void)didStartPreviewForProvider:(id)a3;
- (void)didStopPreviewForProvider:(id)a3;
- (void)flipCamera;
- (void)getSnapshot;
- (void)noteBeginAnimationToPIP;
- (void)noteBeginAnimationToPreview;
- (void)noteEndAnimationToPIP;
- (void)noteEndAnimationToPreview;
- (void)pausePreview;
- (void)provider:(id)a3 cameraBlurEnabledDidChange:(BOOL)a4;
- (void)provider:(id)a3 cameraCinematicFramingAvailabilityDidChange:(BOOL)a4;
- (void)provider:(id)a3 cameraCinematicFramingEnabledDidChange:(BOOL)a4;
- (void)provider:(id)a3 cameraDidBecomeAvailableForUniqueID:(id)a4;
- (void)provider:(id)a3 cameraZoomAvailabilityDidChange:(BOOL)a4;
- (void)provider:(id)a3 didChangeLocalCameraUID:(id)a4;
- (void)provider:(id)a3 didChangeLocalVideoAttributes:(id)a4;
- (void)provider:(id)a3 didGetSnapshot:(id)a4;
- (void)provider:(id)a3 didReceiveErrorFromCameraUniqueID:(id)a4 error:(id)a5;
- (void)provider:(id)a3 didReceiveFirstPreviewFrameFromCameraUniqueID:(id)a4;
- (void)provider:(id)a3 reactionEffectsEnabledDidChange:(BOOL)a4;
- (void)provider:(id)a3 studioLightEnabledDidChange:(BOOL)a4;
- (void)provider:(id)a3 systemPreferredCameraUIDDidChange:(id)a4;
- (void)provider:(id)a3 userPreferredCameraUIDDidChange:(id)a4;
- (void)rampCameraZoomFactor:(double)a3 withRate:(double)a4;
- (void)retryPreviewAfterError;
- (void)setCameraBlurEnabled:(BOOL)a3;
- (void)setCameraZoomFactor:(double)a3;
- (void)setCinematicFramingEnabled:(BOOL)a3;
- (void)setCurrentBackgroundBlurControlMode:(int)a3;
- (void)setCurrentInputDevice:(id)a3;
- (void)setCurrentInputDevice:(id)a3 isUserPreferred:(BOOL)a4;
- (void)setCurrentVideoEffect:(id)a3;
- (void)setCurrentVideoOrientation:(int)a3;
- (void)setFollowSystemCameraEnabled:(BOOL)a3;
- (void)setHasBeganRetryingAfterUninitializedClientError:(BOOL)a3;
- (void)setHasRefreshedPreviewAfterError:(BOOL)a3;
- (void)setIgnoreStartPreview:(BOOL)a3;
- (void)setLocalBackLayer:(id)a3;
- (void)setLocalBackLayerHost:(id)a3;
- (void)setLocalFrontLayer:(id)a3;
- (void)setLocalFrontLayerHost:(id)a3;
- (void)setLocalPortraitAspectRatio:(CGSize)a3 localLandscapeAspectRatio:(CGSize)a4;
- (void)setPreviewStartBlock:(id)a3;
- (void)setReactionEffectGestureEnabled:(BOOL)a3;
- (void)setReapplyCameraZoom:(id)a3;
- (void)setRetryAfterLocalCameraUIDChange:(BOOL)a3;
- (void)setStudioLightEnabled:(BOOL)a3;
- (void)setUninitializedClientRetrySeconds:(int64_t)a3;
- (void)setWantsPreview:(BOOL)a3;
- (void)startPreview;
- (void)stopPreview;
@end

@implementation TUVideoDeviceController

void __68__TUVideoDeviceController_provider_cameraZoomAvailabilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "isZoomAvailable: %d", (uint8_t *)v7, 8u);
  }

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v5 = v4;
  if (*(unsigned char *)(a1 + 40)) {
    v6 = @"TUVideoDeviceControllerZoomAvailable";
  }
  else {
    v6 = @"TUVideoDeviceControllerZoomUnavailable";
  }
  [v4 postNotificationName:v6 object:*(void *)(a1 + 32)];
}

void __54__TUVideoDeviceController_didStartPreviewForProvider___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "didStartPreviewForProvider: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) setHasBeganRetryingAfterUninitializedClientError:0];
  [*(id *)(a1 + 40) setHasRefreshedPreviewAfterError:0];
  [*(id *)(a1 + 40) setRetryAfterLocalCameraUIDChange:0];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"TUVideoDeviceControllerDidStartPreview" object:*(void *)(a1 + 40)];
}

- (void)setRetryAfterLocalCameraUIDChange:(BOOL)a3
{
  self->_retryAfterLocalCameraUIDChange = a3;
}

- (void)setHasRefreshedPreviewAfterError:(BOOL)a3
{
  self->_hasRefreshedPreviewAfterError = a3;
}

- (void)setHasBeganRetryingAfterUninitializedClientError:(BOOL)a3
{
  self->_hasBeganRetryingAfterUninitializedClientError = a3;
}

void __82__TUVideoDeviceController_provider_didReceiveFirstPreviewFrameFromCameraUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "cameraUID: %@", buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v7 = @"TUVideoDeviceControllerDidStartPreviewDeviceUniqueID";
    uint64_t v8 = v4;
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  }
  else
  {
    int v5 = 0;
  }
  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"TUVideoDeviceControllerReceivedFirstPreviewFrame" object:*(void *)(a1 + 40) userInfo:v5];
}

- (TUVideoDeviceController)initWithSerialQueue:(id)a3
{
  id v4 = a3;
  int v5 = objc_alloc_init(TUVideoDeviceControllerProvider);
  uint64_t v6 = objc_alloc_init(TUFeatureFlags);
  uint64_t v7 = [(TUVideoDeviceController *)self initWithProvider:v5 serialQueue:v4 featureFlags:v6];

  return v7;
}

- (TUVideoDeviceController)initWithProvider:(id)a3 serialQueue:(id)a4 featureFlags:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUVideoDeviceController;
  v12 = [(TUVideoDeviceController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serialQueue, a4);
    objc_storeStrong((id *)&v13->_provider, a3);
    [(TUVideoDeviceControllerProvider *)v13->_provider setDelegate:v13];
    objc_storeStrong((id *)&v13->_featureFlags, a5);
    v13->_uninitializedClientRetrySeconds = 1;
  }

  return v13;
}

void __66__TUVideoDeviceController_provider_didChangeLocalVideoAttributes___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "videoAttributes: %@", buf, 0xCu);
  }

  id v4 = (void *)MEMORY[0x1E4F29238];
  objc_msgSend(*(id *)(a1 + 32), "ratio", @"TUVideoDeviceControllerLocalAttributesChangedAspectRatio");
  int v5 = objc_msgSend(v4, "valueWithSize:");
  id v9 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"TUVideoDeviceControllerLocalAttributesChanged" object:*(void *)(a1 + 40) userInfo:v6];
}

- (void)didStartPreviewForProvider:(id)a3
{
  id v4 = a3;
  int v5 = [(TUVideoDeviceController *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __54__TUVideoDeviceController_didStartPreviewForProvider___block_invoke;
  v7[3] = &unk_1E58E5C08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)provider:(id)a3 systemPreferredCameraUIDDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(TUVideoDeviceController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__TUVideoDeviceController_provider_systemPreferredCameraUIDDidChange___block_invoke;
  block[3] = &unk_1E58E5BE0;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)provider:(id)a3 didReceiveFirstPreviewFrameFromCameraUniqueID:(id)a4
{
  id v5 = a4;
  id v6 = [(TUVideoDeviceController *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__TUVideoDeviceController_provider_didReceiveFirstPreviewFrameFromCameraUniqueID___block_invoke;
  v8[3] = &unk_1E58E5C08;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)setLocalFrontLayer:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "localFrontLayer: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUVideoDeviceController *)self provider];
  [v7 setLocalVideoLayer:v4 front:1];
}

- (void)provider:(id)a3 didChangeLocalVideoAttributes:(id)a4
{
  id v5 = a4;
  id v6 = [(TUVideoDeviceController *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__TUVideoDeviceController_provider_didChangeLocalVideoAttributes___block_invoke;
  v8[3] = &unk_1E58E5C08;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)startPreview
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  if (![(TUVideoDeviceController *)self shouldIgnoreStartPreview])
  {
    id v4 = [(TUVideoDeviceController *)self currentInputDevice];
    id v6 = TUDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = v4;
      _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Starting preview with self.currentInputDevice: %@", (uint8_t *)&v9, 0xCu);
    }

    [(TUVideoDeviceController *)self setWantsPreview:1];
    id v7 = [(TUVideoDeviceController *)self reapplyCameraZoom];

    if (v7)
    {
      int v8 = [(TUVideoDeviceController *)self reapplyCameraZoom];
      ((void (**)(void, NSObject *))v8)[2](v8, v4);
    }
    id v5 = [(TUVideoDeviceController *)self provider];
    [v5 startPreview];
    goto LABEL_9;
  }
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(TUVideoDeviceController *)self currentInputDevice];
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring start preview with self.currentInputDevice: %@", (uint8_t *)&v9, 0xCu);
LABEL_9:
  }
}

- (void)setCurrentVideoOrientation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Setting video orientation: %d", (uint8_t *)v10, 8u);
  }

  id v7 = [(TUVideoDeviceController *)self provider];
  int v8 = [v7 localVideoAttributes];

  objc_msgSend(v8, "setOrientation:", objc_msgSend((id)objc_opt_class(), "_videoOrientationForTUOrientation:", v3));
  int v9 = [(TUVideoDeviceController *)self provider];
  [v9 setLocalVideoAttributes:v8];
}

- (AVCaptureDevice)currentInputDevice
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TUVideoDeviceController *)self provider];
  id v5 = [v4 localCameraUID];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(TUVideoDeviceController *)self inputDevices];
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 uniqueID];
        int v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (AVCaptureDevice *)v7;
}

- (NSArray)inputDevices
{
  uint64_t v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TUVideoDeviceController *)self provider];
  id v5 = [v4 inputDevices];

  return (NSArray *)v5;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (TUVideoDeviceControllerProvider)provider
{
  return self->_provider;
}

+ (int)_videoOrientationForTUOrientation:(int)a3
{
  if ((a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (BOOL)currentInputIsExternal
{
  if (!currentInputIsExternal__AVCaptureDeviceTypeExternal)
  {
    uint64_t v3 = (void **)CUTWeakLinkSymbol();
    if (v3) {
      id v4 = *v3;
    }
    else {
      id v4 = 0;
    }
    objc_storeStrong((id *)&currentInputIsExternal__AVCaptureDeviceTypeExternal, v4);
  }
  id v5 = [(TUVideoDeviceController *)self currentInputDevice];
  if (v5)
  {
    id v6 = [(TUVideoDeviceController *)self currentInputDevice];
    id v7 = [v6 deviceType];
    BOOL v8 = v7 == (void *)currentInputIsExternal__AVCaptureDeviceTypeExternal;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)shouldIgnoreStartPreview
{
  return self->_ignoreStartPreview;
}

- (void)setWantsPreview:(BOOL)a3
{
  self->_wantsPreview = a3;
}

- (id)reapplyCameraZoom
{
  return self->_reapplyCameraZoom;
}

- (void)provider:(id)a3 cameraZoomAvailabilityDidChange:(BOOL)a4
{
  id v6 = [(TUVideoDeviceController *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __68__TUVideoDeviceController_provider_cameraZoomAvailabilityDidChange___block_invoke;
  v7[3] = &unk_1E58E6280;
  BOOL v8 = a4;
  void v7[4] = self;
  dispatch_async(v6, v7);
}

+ (void)prewarm
{
}

void __70__TUVideoDeviceController_provider_systemPreferredCameraUIDDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "systemPreferredCameraUIDDidChange: %@", buf, 0xCu);
  }

  id v4 = (void *)MEMORY[0x1E4F28EA0];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    int v9 = @"TUVideoDeviceControllerSystemPreferredCameraUIDKey";
    uint64_t v10 = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    id v7 = [v4 notificationWithName:@"TUVideoDeviceControllerSystemPreferredCameraChangedNotification" object:0 userInfo:v6];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28EA0] notificationWithName:@"TUVideoDeviceControllerSystemPreferredCameraChangedNotification" object:0 userInfo:0];
  }
  BOOL v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotification:v7];
}

- (TUVideoDeviceController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUVideoDeviceController.m", 126, @"%s is not available. Use a designated initializer instead.", "-[TUVideoDeviceController init]");

  return 0;
}

- (id)debugDescription
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(TUVideoDeviceController *)self inputDevices];
  [v3 appendFormat:@" devices=%@", v4];

  if ([(TUVideoDeviceController *)self isFollowSystemCameraEnabled]) {
    objc_msgSend(v3, "appendFormat:", @" followSystemCameraEnabled=%d", -[TUVideoDeviceController isFollowSystemCameraEnabled](self, "isFollowSystemCameraEnabled"));
  }
  [v3 appendString:@">"];
  uint64_t v5 = (void *)[v3 copy];

  return v5;
}

+ (int)_tuOrientationForVideoOrientation:(int)a3
{
  if ((a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (BOOL)currentInputSupportsCinematicFraming
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(TUVideoDeviceController *)self currentInputDevice];
  uint64_t v3 = [v2 formats];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isCenterStageSupported])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)currentInputSupportsReactionEffects
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(TUVideoDeviceController *)self currentInputDevice];
  uint64_t v3 = [v2 formats];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) reactionEffectsSupported])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)setCurrentInputDevice:(id)a3
{
}

- (void)setCurrentInputDevice:(id)a3 isUserPreferred:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  long long v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Asked to set current input device to %@", buf, 0xCu);
  }

  if (v6)
  {
    long long v9 = [v6 uniqueID];
    if ([v9 isEqualToString:@"com.apple.avfoundation.avcapturedevice.built-in_video:1"])
    {
      long long v10 = (void *)CUTWeakLinkClass();
      if (!setCurrentInputDevice_isUserPreferred___AVCaptureDeviceTypeBuiltInTrueDepthCamera)
      {
        long long v11 = (void **)CUTWeakLinkSymbol();
        if (v11) {
          uint64_t v12 = *v11;
        }
        else {
          uint64_t v12 = 0;
        }
        objc_storeStrong((id *)&setCurrentInputDevice_isUserPreferred___AVCaptureDeviceTypeBuiltInTrueDepthCamera, v12);
      }
      if (!setCurrentInputDevice_isUserPreferred___AVMediaTypeVideo)
      {
        uint64_t v13 = (void **)CUTWeakLinkSymbol();
        if (v13) {
          long long v14 = *v13;
        }
        else {
          long long v14 = 0;
        }
        objc_storeStrong((id *)&setCurrentInputDevice_isUserPreferred___AVMediaTypeVideo, v14);
      }
      if (v10)
      {
        uint64_t v23 = setCurrentInputDevice_isUserPreferred___AVCaptureDeviceTypeBuiltInTrueDepthCamera;
        long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
        long long v16 = [v10 discoverySessionWithDeviceTypes:v15 mediaType:setCurrentInputDevice_isUserPreferred___AVMediaTypeVideo position:2];

        long long v17 = [v16 devices];
        if ([v17 count])
        {
          v18 = [v17 firstObject];
          uint64_t v19 = TUDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v18;
            _os_log_impl(&dword_19C496000, v19, OS_LOG_TYPE_DEFAULT, "Upgrading input device to depth camera device %@", buf, 0xCu);
          }

          uint64_t v20 = [v18 uniqueID];

          long long v9 = (void *)v20;
          id v6 = v18;
        }
      }
    }
    v21 = [(TUVideoDeviceController *)self provider];
    [v21 setLocalCameraWithUID:v9];

    if (v4)
    {
      v22 = TUDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v6;
        _os_log_impl(&dword_19C496000, v22, OS_LOG_TYPE_DEFAULT, "Setting userPreferred camera to %@", buf, 0xCu);
      }

      [(id)CUTWeakLinkClass() setUserPreferredCamera:v6 forClientPreferenceDomain:@"com.apple.facetime"];
    }
  }
}

- (int)currentVideoOrientation
{
  v2 = self;
  uint64_t v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(TUVideoDeviceController *)v2 provider];
  uint64_t v5 = [v4 localVideoAttributes];

  LODWORD(v2) = objc_msgSend((id)objc_opt_class(), "_tuOrientationForVideoOrientation:", objc_msgSend(v5, "orientation"));
  return (int)v2;
}

- (BOOL)isFollowSystemCameraEnabled
{
  uint64_t v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(TUVideoDeviceController *)self featureFlags];
  [v4 continuityCaptureEnabled];

  return 0;
}

- (void)setFollowSystemCameraEnabled:(BOOL)a3
{
  BOOL v4 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(TUVideoDeviceController *)self featureFlags];
  [v5 continuityCaptureEnabled];
}

- (BOOL)hasAvailableDeskViewCameras
{
  uint64_t v3 = [(TUVideoDeviceController *)self featureFlags];
  int v4 = [v3 screenSharingDeskViewEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = [(TUVideoDeviceController *)self provider];
  char v6 = [v5 hasAvailableDeskViewCameras];

  return v6;
}

- (BOOL)isPreviewRunning
{
  uint64_t v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(TUVideoDeviceController *)self provider];
  LOBYTE(v3) = [v4 isPreviewRunning];

  return (char)v3;
}

- (CALayer)localFrontLayer
{
  uint64_t v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(TUVideoDeviceController *)self provider];
  id v5 = [v4 localVideoLayer:1];

  return (CALayer *)v5;
}

- (void)setLocalFrontLayerHost:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "localFrontLayerHost: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUVideoDeviceController *)self provider];
  [v7 setLocalVideoLayerHost:v4 front:1];
}

- (CALayer)localBackLayer
{
  uint64_t v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TUVideoDeviceController *)self provider];
  id v5 = [v4 localVideoLayer:0];

  return (CALayer *)v5;
}

- (void)setLocalBackLayer:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "localBackLayer: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUVideoDeviceController *)self provider];
  [v7 setLocalVideoLayer:v4 front:0];
}

- (void)setLocalBackLayerHost:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "localBackLayerHost: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUVideoDeviceController *)self provider];
  [v7 setLocalVideoLayerHost:v4 front:0];
}

- (void)setCurrentVideoEffect:(id)a3
{
  id v4 = a3;
  id v5 = [(TUVideoDeviceController *)self provider];
  [v5 setCurrentVideoEffect:v4];
}

- (TUVideoEffect)currentVideoEffect
{
  v2 = [(TUVideoDeviceController *)self provider];
  uint64_t v3 = [v2 currentVideoEffect];

  return (TUVideoEffect *)v3;
}

- (NSArray)availableVideoEffects
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(TUVideoDeviceController *)self provider];
  id v5 = [v4 availableVideoEffects];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&long long v7 = 138412290;
    long long v17 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [(TUVideoDeviceController *)self provider];
        uint64_t v13 = [v12 thumbnailImageForVideoEffectName:v11];

        if (v13)
        {
          long long v14 = [[TUVideoEffect alloc] initWithName:v11 thumbnailImage:v13];
          [v3 addObject:v14];
        }
        else
        {
          TUDefaultLog();
          long long v14 = (TUVideoEffect *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            uint64_t v23 = v11;
            _os_log_impl(&dword_19C496000, &v14->super, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot create TUVideoEffect named %@ with nil thumbnailImage", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  long long v15 = (void *)[v3 copy];

  return (NSArray *)v15;
}

- (void)stopPreview
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(TUVideoDeviceController *)self currentInputDevice];
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Stopping preview with self.currentInputDevice: %@", (uint8_t *)&v7, 0xCu);
  }
  [(TUVideoDeviceController *)self setWantsPreview:0];
  uint64_t v6 = [(TUVideoDeviceController *)self provider];
  [v6 stopPreview];
}

- (void)pausePreview
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(TUVideoDeviceController *)self currentInputDevice];
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Pausing preview with self.currentInputDevice: %@", (uint8_t *)&v7, 0xCu);
  }
  [(TUVideoDeviceController *)self setWantsPreview:0];
  uint64_t v6 = [(TUVideoDeviceController *)self provider];
  [v6 pausePreview];
}

- (void)getSnapshot
{
  uint64_t v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TUVideoDeviceController *)self provider];
  [v4 getSnapshot];
}

- (BOOL)isCinematicFramingEnabled
{
  uint64_t v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TUVideoDeviceController *)self provider];
  LOBYTE(v3) = [v4 isCinematicFramingEnabled];

  return (char)v3;
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(TUVideoDeviceController *)self provider];
  [v6 setCinematicFramingEnabled:v3];
}

- (BOOL)isReactionEffectGestureEnabled
{
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TUVideoDeviceController *)self provider];
  LOBYTE(v3) = [v4 isReactionEffectGestureEnabled];

  return (char)v3;
}

- (void)setReactionEffectGestureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(TUVideoDeviceController *)self provider];
  [v6 setReactionEffectGestureEnabled:v3];
}

- (BOOL)isStudioLightEnabled
{
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TUVideoDeviceController *)self provider];
  LOBYTE(v3) = [v4 isStudioLightEnabled];

  return (char)v3;
}

- (void)setStudioLightEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(TUVideoDeviceController *)self provider];
  [v6 setStudioLightEnabled:v3];
}

- (BOOL)currentInputSupportsStudioLight
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(TUVideoDeviceController *)self currentInputDevice];
  BOOL v3 = [v2 formats];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isStudioLightSupported])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)supportsCameraBlur
{
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(TUVideoDeviceController *)self provider];
  uint64_t v5 = [(TUVideoDeviceController *)self currentInputDevice];
  char v6 = [v4 supportsCameraBlurForDevice:v5];

  return v6;
}

- (int)currentBackgroundBlurControlMode
{
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(TUVideoDeviceController *)self provider];
  LODWORD(v3) = [v4 currentBackgroundBlurControlMode];

  return (int)v3;
}

- (void)setCurrentBackgroundBlurControlMode:(int)a3
{
  uint64_t v5 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(TUVideoDeviceController *)self provider];
  [v6 setCurrentBackgroundBlurControlMode:a3];
}

- (BOOL)cameraBlurEnabled
{
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(TUVideoDeviceController *)self provider];
  LOBYTE(v3) = [v4 isCameraBlurEnabled];

  return (char)v3;
}

- (void)setCameraBlurEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(TUVideoDeviceController *)self provider];
  [v6 setCameraBlurEnabled:v3];
}

- (void)setCameraZoomFactor:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = a3;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Setting back camera zoom factor: %f", (uint8_t *)&v8, 0xCu);
  }

  int v7 = [(TUVideoDeviceController *)self provider];
  [v7 setCameraZoomFactor:a3];
}

- (void)rampCameraZoomFactor:(double)a3 withRate:(double)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v7 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218240;
    double v11 = a3;
    __int16 v12 = 2048;
    double v13 = a4;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Setting ramp camera zoom factor: %f with rate: %f", (uint8_t *)&v10, 0x16u);
  }

  double v9 = [(TUVideoDeviceController *)self provider];
  [v9 rampCameraZoomFactor:a3 withRate:a4];
}

- (void)noteBeginAnimationToPreview
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(TUVideoDeviceController *)self currentInputDevice];
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Beginning animation to preview with self.currentInputDevice: %@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(TUVideoDeviceController *)self provider];
  [v6 beginPIPToPreviewAnimation];
}

- (void)flipCamera
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [(TUVideoDeviceController *)self inputDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (!v5)
  {
    int v7 = 0;
    int v8 = 0;
    goto LABEL_16;
  }
  uint64_t v6 = v5;
  int v7 = 0;
  int v8 = 0;
  uint64_t v9 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v4);
      }
      double v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      if ([v11 position] == 2)
      {
        __int16 v12 = v8;
        double v13 = v7;
        int v8 = v11;
LABEL_9:
        id v14 = v11;

        int v7 = v13;
        goto LABEL_10;
      }
      __int16 v12 = v7;
      double v13 = v11;
      if ([v11 position] == 1) {
        goto LABEL_9;
      }
LABEL_10:
      if (v8 && v7) {
        goto LABEL_16;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  }
  while (v6);
LABEL_16:

  long long v15 = [(TUVideoDeviceController *)self currentInputDevice];
  uint64_t v16 = [v15 position];

  long long v17 = TUDefaultLog();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16 == 1)
  {
    long long v19 = v7;
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v7;
      _os_log_impl(&dword_19C496000, v17, OS_LOG_TYPE_DEFAULT, "Setting local camera to back facing device %@", buf, 0xCu);
      long long v19 = v7;
    }
  }
  else
  {
    long long v19 = v8;
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v8;
      _os_log_impl(&dword_19C496000, v17, OS_LOG_TYPE_DEFAULT, "Setting local camera to front facing device %@", buf, 0xCu);
      long long v19 = v8;
    }
  }

  [(TUVideoDeviceController *)self setCurrentInputDevice:v19];
}

- (void)retryPreviewAfterError
{
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Retrying preview after error", v4, 2u);
  }

  [(TUVideoDeviceController *)self setHasRefreshedPreviewAfterError:1];
  [(TUVideoDeviceController *)self startPreview];
}

- (void)noteEndAnimationToPreview
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(TUVideoDeviceController *)self currentInputDevice];
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Ending animation to preview with self.currentInputDevice: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [(TUVideoDeviceController *)self provider];
  [v6 endPIPToPreviewAnimation];
}

- (void)noteBeginAnimationToPIP
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(TUVideoDeviceController *)self currentInputDevice];
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Beginning animation to PIP with self.currentInputDevice: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [(TUVideoDeviceController *)self provider];
  [v6 beginPreviewToPIPAnimation];
}

- (void)noteEndAnimationToPIP
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(TUVideoDeviceController *)self currentInputDevice];
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Ending animation to PIP with self.currentInputDevice: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [(TUVideoDeviceController *)self provider];
  [v6 endPreviewToPIPAnimation];
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3 localLandscapeAspectRatio:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v9);

  int v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v22.double width = v7;
    v22.double height = v6;
    double v11 = NSStringFromSize(v22);
    v23.double width = width;
    v23.double height = height;
    __int16 v12 = NSStringFromSize(v23);
    int v17 = 138412546;
    BOOL v18 = v11;
    __int16 v19 = 2112;
    long long v20 = v12;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Setting localPortraitAspectRatio: %@ localLandscapeAspectRatio: %@", (uint8_t *)&v17, 0x16u);
  }
  double v13 = [(TUVideoDeviceController *)self portraitScreenAttributes];
  objc_msgSend(v13, "setRatio:", v7, v6);
  id v14 = [(TUVideoDeviceController *)self provider];
  [v14 setLocalScreenAttributes:v13];

  long long v15 = [(TUVideoDeviceController *)self landscapeScreenAttributes];
  objc_msgSend(v15, "setRatio:", width, height);
  uint64_t v16 = [(TUVideoDeviceController *)self provider];
  [v16 setLocalScreenAttributes:v15];
}

- (CGRect)localScreenContentsRect
{
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = objc_msgSend((id)objc_opt_class(), "_videoOrientationForTUOrientation:", -[TUVideoDeviceController currentVideoOrientation](self, "currentVideoOrientation"));
  id v5 = objc_alloc_init((Class)CUTWeakLinkClass());
  [v5 setOrientation:v4];
  double v6 = [(TUVideoDeviceController *)self provider];
  double v7 = [v6 localScreenAttributesForVideoAttributes:v5];
  [v7 contentsRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGSize)localVideoPortraitAspectRatio
{
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(TUVideoDeviceController *)self provider];
  id v5 = [v4 localVideoAttributes];
  [v5 ratio];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)localScreenPortraitAspectRatio
{
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(TUVideoDeviceController *)self portraitScreenAttributes];
  [v4 ratio];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)localVideoLandscapeAspectRatio
{
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(TUVideoDeviceController *)self provider];
  double v5 = [v4 localVideoAttributes];
  [v5 ratio];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)localScreenLandscapeAspectRatio
{
  BOOL v3 = [(TUVideoDeviceController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(TUVideoDeviceController *)self landscapeScreenAttributes];
  [v4 ratio];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (id)portraitScreenAttributes
{
  id v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  [v3 setOrientation:0];
  uint64_t v4 = [(TUVideoDeviceController *)self provider];
  double v5 = [v4 localScreenAttributesForVideoAttributes:v3];

  return v5;
}

- (id)landscapeScreenAttributes
{
  id v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  [v3 setOrientation:3];
  uint64_t v4 = [(TUVideoDeviceController *)self provider];
  double v5 = [v4 localScreenAttributesForVideoAttributes:v3];

  return v5;
}

- (void)provider:(id)a3 didReceiveErrorFromCameraUniqueID:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = [(TUVideoDeviceController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__TUVideoDeviceController_provider_didReceiveErrorFromCameraUniqueID_error___block_invoke;
  block[3] = &unk_1E58E6258;
  id v13 = v7;
  id v14 = v8;
  double v15 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __76__TUVideoDeviceController_provider_didReceiveErrorFromCameraUniqueID_error___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __76__TUVideoDeviceController_provider_didReceiveErrorFromCameraUniqueID_error___block_invoke_cold_1(a1, v2);
  }

  id v3 = [*(id *)(a1 + 48) previewStartBlock];
  BOOL v4 = v3 == 0;

  if (!v4)
  {
    double v5 = [*(id *)(a1 + 48) previewStartBlock];
    dispatch_block_cancel(v5);

    [*(id *)(a1 + 48) setPreviewStartBlock:0];
  }
  if ([*(id *)(a1 + 40) code] == 32006)
  {
    if ([*(id *)(a1 + 48) wantsPreview])
    {
      objc_initWeak(&location, *(id *)(a1 + 48));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__TUVideoDeviceController_provider_didReceiveErrorFromCameraUniqueID_error___block_invoke_142;
      block[3] = &unk_1E58E5C50;
      objc_copyWeak(&v24, &location);
      dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0, block);
      [*(id *)(a1 + 48) setPreviewStartBlock:v6];

      int v7 = [*(id *)(a1 + 48) hasBeganRetryingAfterUninitializedClientError];
      id v8 = *(void **)(a1 + 48);
      if (v7) {
        uint64_t v9 = 2 * [v8 uninitializedClientRetrySeconds];
      }
      else {
        uint64_t v9 = [v8 uninitializedClientRetrySeconds];
      }
      dispatch_time_t v15 = dispatch_time(0, 1000000000 * v9);
      double v16 = [*(id *)(a1 + 48) serialQueue];
      double v17 = [*(id *)(a1 + 48) previewStartBlock];
      dispatch_after(v15, v16, v17);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    [v10 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"TUVideoDeviceControllerDeviceDidReceiveErrorCameraID"];
    [v10 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"TUVideoDeviceControllerDeviceDidReceiveErrorError"];
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = (void *)[v10 copy];
    [v11 postNotificationName:@"TUVideoDeviceControllerDeviceDidReceiveError" object:v12 userInfo:v13];

    if ([*(id *)(a1 + 48) hasRefreshedPreviewAfterError]
      && [*(id *)(a1 + 40) code] != 32032)
    {
      unsigned int v14 = 0;
    }
    else
    {
      unsigned int v14 = [*(id *)(a1 + 48) wantsPreview];
    }
    double v18 = TUDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [*(id *)(a1 + 48) hasRefreshedPreviewAfterError];
      uint64_t v20 = [*(id *)(a1 + 40) code];
      int v21 = [*(id *)(a1 + 48) wantsPreview];
      id location = (id)__PAIR64__(v14, 67109888);
      __int16 v26 = 1024;
      int v27 = v19;
      __int16 v28 = 2048;
      uint64_t v29 = v20;
      __int16 v30 = 1024;
      int v31 = v21;
      _os_log_impl(&dword_19C496000, v18, OS_LOG_TYPE_DEFAULT, "Stopping preview due to error. shouldRetryPreview=%d because hasRefreshedPreviewAfterError=%d, error.code=%ld wantsPreview=%d", (uint8_t *)&location, 0x1Eu);
    }

    int v22 = [*(id *)(a1 + 48) wantsPreview];
    [*(id *)(a1 + 48) stopPreview];
    if (v14)
    {
      if (v22 && [*(id *)(a1 + 40) code] == 32023) {
        [*(id *)(a1 + 48) setRetryAfterLocalCameraUIDChange:1];
      }
      else {
        [*(id *)(a1 + 48) retryPreviewAfterError];
      }
    }
  }
}

void __76__TUVideoDeviceController_provider_didReceiveErrorFromCameraUniqueID_error___block_invoke_142(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained previewStartBlock];
    intptr_t v4 = dispatch_block_testcancel(v3);

    if (!v4)
    {
      double v5 = TUDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 67109120;
        v6[1] = [v2 wantsPreview];
        _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "AVConferenceServiceUninitializedClientError retry preview delay fired, wantsPreview: %d", (uint8_t *)v6, 8u);
      }

      if ([v2 wantsPreview])
      {
        [v2 setHasBeganRetryingAfterUninitializedClientError:1];
        [v2 setPreviewStartBlock:0];
        [v2 retryPreviewAfterError];
        [v2 setHasRefreshedPreviewAfterError:0];
      }
    }
  }
}

- (void)provider:(id)a3 cameraDidBecomeAvailableForUniqueID:(id)a4
{
  id v5 = a4;
  dispatch_block_t v6 = [(TUVideoDeviceController *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__TUVideoDeviceController_provider_cameraDidBecomeAvailableForUniqueID___block_invoke;
  v8[3] = &unk_1E58E5C08;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __72__TUVideoDeviceController_provider_cameraDidBecomeAvailableForUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(a1 + 40) wantsPreview];
    id v5 = @"NO";
    if (v4) {
      id v5 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    dispatch_time_t v15 = v5;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "cameraUID: %@, wantsPreview: %@", buf, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id v10 = @"TUVideoDeviceControllerDeviceBecameAvailableDeviceUniqueID";
    uint64_t v11 = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"TUVideoDeviceControllerDeviceBecameAvailable" object:*(void *)(a1 + 40) userInfo:v7];

  if ([*(id *)(a1 + 40) wantsPreview])
  {
    id v9 = TUDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Starting preview because client wants preview and camera did become available", buf, 2u);
    }

    [*(id *)(a1 + 40) startPreview];
  }
}

- (void)provider:(id)a3 didChangeLocalCameraUID:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(TUVideoDeviceController *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__TUVideoDeviceController_provider_didChangeLocalCameraUID___block_invoke;
  v8[3] = &unk_1E58E5C08;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __60__TUVideoDeviceController_provider_didChangeLocalCameraUID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Provider received notice that local camera UID changed to %@", buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v8 = @"TUVideoDeviceControllerDidChangeLocalCameraUIDDeviceUniqueIDKey";
    uint64_t v9 = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"TUVideoDeviceControllerDidChangeLocalCameraUIDNotification" object:*(void *)(a1 + 40) userInfo:v5];

  if ([*(id *)(a1 + 40) retryAfterLocalCameraUIDChange])
  {
    [*(id *)(a1 + 40) setRetryAfterLocalCameraUIDChange:0];
    id v7 = TUDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Starting preview after local camera UID change", buf, 2u);
    }

    [*(id *)(a1 + 40) startPreview];
  }
}

- (void)didStopPreviewForProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(TUVideoDeviceController *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __53__TUVideoDeviceController_didStopPreviewForProvider___block_invoke;
  v7[3] = &unk_1E58E5C08;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__TUVideoDeviceController_didStopPreviewForProvider___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "didStopPreviewForProvider %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"TUVideoDeviceControllerDidStopPreview" object:*(void *)(a1 + 40)];
}

- (void)didPausePreviewForProvider:(id)a3
{
  id v4 = a3;
  int v5 = [(TUVideoDeviceController *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __54__TUVideoDeviceController_didPausePreviewForProvider___block_invoke;
  v7[3] = &unk_1E58E5C08;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__TUVideoDeviceController_didPausePreviewForProvider___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "didPausePreviewForProvider %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"TUVideoDeviceControllerDidPausePreview" object:*(void *)(a1 + 40)];
}

- (void)captureDevicesChangedForProvider:(id)a3
{
  id v4 = a3;
  int v5 = [(TUVideoDeviceController *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __60__TUVideoDeviceController_captureDevicesChangedForProvider___block_invoke;
  v7[3] = &unk_1E58E5C08;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__TUVideoDeviceController_captureDevicesChangedForProvider___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "captureDevicesChangedForProvider %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"TUVideoDeviceControllerInputDevicesChanged" object:*(void *)(a1 + 40)];
}

- (void)provider:(id)a3 cameraCinematicFramingAvailabilityDidChange:(BOOL)a4
{
  uint64_t v6 = [(TUVideoDeviceController *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __80__TUVideoDeviceController_provider_cameraCinematicFramingAvailabilityDidChange___block_invoke;
  v7[3] = &unk_1E58E6280;
  void v7[4] = self;
  BOOL v8 = a4;
  dispatch_async(v6, v7);
}

uint64_t __80__TUVideoDeviceController_provider_cameraCinematicFramingAvailabilityDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postIsCinematicFramingAvailable:*(unsigned __int8 *)(a1 + 40)];
}

- (void)provider:(id)a3 cameraCinematicFramingEnabledDidChange:(BOOL)a4
{
  int v5 = [(TUVideoDeviceController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__TUVideoDeviceController_provider_cameraCinematicFramingEnabledDidChange___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v7 = a4;
  dispatch_async(v5, block);
}

void __75__TUVideoDeviceController_provider_cameraCinematicFramingEnabledDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 32);
    *(_DWORD *)buf = 67109120;
    int v12 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "isCinematicFramingEnabled: %d", buf, 8u);
  }

  id v4 = (void *)MEMORY[0x1E4F28EA0];
  int v5 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 32), @"TUVideoDeviceControllerIsCinematicFramingEnabled");
  id v10 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  BOOL v7 = [v4 notificationWithName:@"TUVideoDeviceControllerCinematicFramingEnabledChanged" object:0 userInfo:v6];

  BOOL v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotification:v7];
}

- (void)_postIsCinematicFramingAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v13 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "isCinematicFramingAvailable: %d", buf, 8u);
  }

  int v5 = (void *)MEMORY[0x1E4F28EA0];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", v3, @"TUVideoDeviceControllerIsCinematicFramingAvailable");
  uint64_t v11 = v6;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  BOOL v8 = [v5 notificationWithName:@"TUVideoDeviceControllerCinematicFramingAvailable" object:0 userInfo:v7];

  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotification:v8];
}

- (void)provider:(id)a3 reactionEffectsEnabledDidChange:(BOOL)a4
{
  int v5 = [(TUVideoDeviceController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__TUVideoDeviceController_provider_reactionEffectsEnabledDidChange___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v7 = a4;
  dispatch_async(v5, block);
}

void __68__TUVideoDeviceController_provider_reactionEffectsEnabledDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 32);
    *(_DWORD *)buf = 67109120;
    int v12 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "isReactionEffectGestureEnabled: %d", buf, 8u);
  }

  id v4 = (void *)MEMORY[0x1E4F28EA0];
  int v5 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 32), @"TUVideoDeviceControllerAreReactionEffectsEnabled");
  uint64_t v10 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  BOOL v7 = [v4 notificationWithName:@"TUVideoDeviceControllerReactionEffectsEnabledChanged" object:0 userInfo:v6];

  BOOL v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotification:v7];
}

- (void)provider:(id)a3 studioLightEnabledDidChange:(BOOL)a4
{
  int v5 = [(TUVideoDeviceController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__TUVideoDeviceController_provider_studioLightEnabledDidChange___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v7 = a4;
  dispatch_async(v5, block);
}

void __64__TUVideoDeviceController_provider_studioLightEnabledDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 32);
    *(_DWORD *)buf = 67109120;
    int v12 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "isStudioLightEnabled: %d", buf, 8u);
  }

  id v4 = (void *)MEMORY[0x1E4F28EA0];
  int v5 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 32), @"TUVideoDeviceControllerIsStudioLightEnabled");
  uint64_t v10 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  BOOL v7 = [v4 notificationWithName:@"TUVideoDeviceControllerStudioLightEnabledChanged" object:0 userInfo:v6];

  BOOL v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotification:v7];
}

- (void)provider:(id)a3 cameraBlurEnabledDidChange:(BOOL)a4
{
  int v5 = [(TUVideoDeviceController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__TUVideoDeviceController_provider_cameraBlurEnabledDidChange___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v7 = a4;
  dispatch_async(v5, block);
}

void __63__TUVideoDeviceController_provider_cameraBlurEnabledDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 32);
    *(_DWORD *)buf = 67109120;
    int v12 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "cameraBlurEnabledDidChange: %d", buf, 8u);
  }

  id v4 = (void *)MEMORY[0x1E4F28EA0];
  int v5 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 32), @"TUVideoDeviceControllerIsCameraBlurEnabledKey");
  uint64_t v10 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  BOOL v7 = [v4 notificationWithName:@"TUVideoDeviceControllerCameraBlurEnabledChangedNotification" object:0 userInfo:v6];

  BOOL v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotification:v7];
}

- (void)provider:(id)a3 userPreferredCameraUIDDidChange:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(TUVideoDeviceController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__TUVideoDeviceController_provider_userPreferredCameraUIDDidChange___block_invoke;
  block[3] = &unk_1E58E5BE0;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __68__TUVideoDeviceController_provider_userPreferredCameraUIDDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "userPreferredCameraUIDDidChange: %@", buf, 0xCu);
  }

  id v4 = (void *)MEMORY[0x1E4F28EA0];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v9 = @"TUVideoDeviceControllerUserPreferredCameraUIDKey";
    uint64_t v10 = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    id v7 = [v4 notificationWithName:@"TUVideoDeviceControllerUserPreferredCameraChangedNotification" object:0 userInfo:v6];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28EA0] notificationWithName:@"TUVideoDeviceControllerUserPreferredCameraChangedNotification" object:0 userInfo:0];
  }
  BOOL v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotification:v7];
}

- (void)provider:(id)a3 didGetSnapshot:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(TUVideoDeviceController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__TUVideoDeviceController_provider_didGetSnapshot___block_invoke;
  block[3] = &unk_1E58E5BE0;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __51__TUVideoDeviceController_provider_didGetSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "didGetSnapshot: %p", buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    BOOL v8 = @"TUVideoDeviceControllerSnapshotDataKey";
    uint64_t v9 = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [MEMORY[0x1E4F28EA0] notificationWithName:@"TUVideoDeviceControllerDidGetSnapshotNotification" object:0 userInfo:v5];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotification:v6];
}

- (CALayer)localFrontLayerHost
{
  return self->_localFrontLayerHost;
}

- (CALayer)localBackLayerHost
{
  return self->_localBackLayerHost;
}

- (void)setReapplyCameraZoom:(id)a3
{
}

- (void)setIgnoreStartPreview:(BOOL)a3
{
  self->_ignoreStartPreview = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)wantsPreview
{
  return self->_wantsPreview;
}

- (BOOL)hasRefreshedPreviewAfterError
{
  return self->_hasRefreshedPreviewAfterError;
}

- (id)previewStartBlock
{
  return self->_previewStartBlock;
}

- (void)setPreviewStartBlock:(id)a3
{
}

- (BOOL)hasBeganRetryingAfterUninitializedClientError
{
  return self->_hasBeganRetryingAfterUninitializedClientError;
}

- (int64_t)uninitializedClientRetrySeconds
{
  return self->_uninitializedClientRetrySeconds;
}

- (void)setUninitializedClientRetrySeconds:(int64_t)a3
{
  self->_uninitializedClientRetrySeconds = a3;
}

- (BOOL)retryAfterLocalCameraUIDChange
{
  return self->_retryAfterLocalCameraUIDChange;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previewStartBlock, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_reapplyCameraZoom, 0);
  objc_storeStrong((id *)&self->_localBackLayerHost, 0);

  objc_storeStrong((id *)&self->_localFrontLayerHost, 0);
}

void __76__TUVideoDeviceController_provider_didReceiveErrorFromCameraUniqueID_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "cameraUID: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

@end