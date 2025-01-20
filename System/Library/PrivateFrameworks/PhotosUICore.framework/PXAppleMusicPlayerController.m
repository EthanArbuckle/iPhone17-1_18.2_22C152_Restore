@interface PXAppleMusicPlayerController
@end

@implementation PXAppleMusicPlayerController

uint64_t __58___PXAppleMusicPlayerController__handleItemPlaybackDidEnd__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAtEnd:1];
}

void __62___PXAppleMusicPlayerController__handlePlaybackStateDidChange__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 128) playbackState] == 1) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62___PXAppleMusicPlayerController__handlePlaybackStateDidChange__block_invoke_2;
  v3[3] = &unk_1E5DD0260;
  objc_copyWeak(v4, (id *)(a1 + 40));
  v4[1] = (id)v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __62___PXAppleMusicPlayerController__handlePlaybackStateDidChange__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPlaybackState:v1];
}

uint64_t __44___PXAppleMusicPlayerController_setIsAtEnd___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 185) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) signalChange:2];
}

uint64_t __50___PXAppleMusicPlayerController_setPlaybackState___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 192) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) signalChange:1];
}

void __78___PXAppleMusicPlayerController__handleDidPrepareToPlayWithExpectation_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) fulfill];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_queue_handleDidPrepareToPlayWithError:", *(void *)(a1 + 40));
}

void __43___PXAppleMusicPlayerController_setVolume___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 128);
    v5 = NSStringFromSelector(sel_setRelativeVolume_);
    int v6 = 138543874;
    v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "%{public}@ will have no effect because %@ does not respond to %@", (uint8_t *)&v6, 0x20u);
  }
}

void __37___PXAppleMusicPlayerController_play__block_invoke(uint64_t a1)
{
  id v2 = +[PXApplicationState sharedState];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 visibilityState] == 1;
}

void __68___PXAppleMusicPlayerController_prepareToPlayWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = (id *)(a1 + 32);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_handlePreparationExpectationFulfilled:success:error:", v7, a2, v6);
}

void __68___PXAppleMusicPlayerController_prepareToPlayWithCompletionHandler___block_invoke_40(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleDidPrepareToPlayWithExpectation:v5 error:v4];
}

double __39___PXAppleMusicPlayerController_volume__block_invoke(uint64_t a1)
{
  double result = *(float *)(*(void *)(a1 + 32) + 136);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

double __49___PXAppleMusicPlayerController_fetchCurrentTime__block_invoke(uint64_t a1)
{
  if (+[_PXAppleMusicPlayerController canApplyWorkaroundFor80278485])
  {
    id v2 = +[PXAudioSettings sharedInstance];
    int v3 = [v2 workaround80278485];

    if (v3) {
      [*(id *)(*(void *)(a1 + 32) + 128) setServerTimeSnapshot:0];
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 128) currentPlaybackTime];
  CMTimeMakeWithSeconds(&v6, v4, PXAudioDefaultCMTimeScale);
  double result = *(double *)&v6.value;
  *(CMTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v6;
  return result;
}

void __108___PXAppleMusicPlayerController_clientIdentifier_becomeCurrentClientIfNeeded_performAsyncPlayerTransaction___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56)) {
    goto LABEL_2;
  }
  id v3 = *(id *)(*(void *)(a1 + 32) + 112);
  id v4 = *(id *)(a1 + 40);
  if (v3 == v4)
  {

    goto LABEL_2;
  }
  id v5 = v4;
  id v6 = v3;
  int v7 = [v6 isEqualToString:v5];

  if (v7)
  {
LABEL_2:
    objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentClientIdentifier:", *(void *)(a1 + 40));
    id v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
    return;
  }
  __int16 v8 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXAppleMusicPlayerControllerErrorDomain", 1, @"Transaction client identifier is %@, but the current client identifier is %@", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 112));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v9 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(v10 + 112);
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    uint64_t v18 = v12;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring player transaction from non-current client with identifier %{public}@. Current client: %{public}@", buf, 0x20u);
  }
}

void __46___PXAppleMusicPlayerController_windowSceneID__block_invoke(uint64_t a1)
{
}

uint64_t __50___PXAppleMusicPlayerController_setWindowSceneID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setWindowSceneID:", *(void *)(a1 + 40));
}

void __56___PXAppleMusicPlayerController_currentClientIdentifier__block_invoke(uint64_t a1)
{
}

uint64_t __60___PXAppleMusicPlayerController_setCurrentClientIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentClientIdentifier:", *(void *)(a1 + 40));
}

void __38___PXAppleMusicPlayerController__init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePlaybackStateDidChange];
}

void __38___PXAppleMusicPlayerController__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleItemPlaybackDidEnd];
}

uint64_t __62___PXAppleMusicPlayerController_canApplyWorkaroundFor80278485__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F319C0] instancesRespondToSelector:sel_setServerTimeSnapshot_];
  canApplyWorkaroundFor80278485_canApply = result;
  return result;
}

@end