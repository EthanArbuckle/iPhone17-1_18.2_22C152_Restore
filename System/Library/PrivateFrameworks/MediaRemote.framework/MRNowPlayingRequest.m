@interface MRNowPlayingRequest
+ (BOOL)isMostRecentMediaPlaybackRelevantWithinInterval:(double)a3;
+ (BOOL)localIsPlaying;
+ (MRContentItem)localNowPlayingItem;
+ (MRPlaybackQueue)localPlaybackQueue;
+ (MRPlayerPath)localNowPlayingPlayerPath;
+ (MSVPair)isMostRecentMediaPlaybackRelevantReason;
+ (NSArray)localSupportedCommands;
+ (NSDate)localLastPlayingDate;
+ (id)isMostRecentMediaPlaybackRelevantReasonWithinInternal:(double)a3;
+ (unsigned)localPlaybackState;
+ (void)homePlatterPreferredRouteIdentifier:(id)a3;
+ (void)shouldUseQuickControlsToDisplayPlatterForRouteIdentifier:(id)a3 completion:(id)a4;
- (MRDestination)destination;
- (MRNowPlayingRequest)init;
- (MRNowPlayingRequest)initWithDestination:(id)a3;
- (MRNowPlayingRequest)initWithOrigin:(id)a3;
- (MRNowPlayingRequest)initWithPlayerPath:(id)a3;
- (void)nowPlayingPlayerPathOnQueue:(id)a3 completion:(id)a4;
- (void)requestClientPropertiesOnQueue:(id)a3 completion:(id)a4;
- (void)requestDeviceLastPlayingDateOnQueue:(id)a3 completion:(id)a4;
- (void)requestIsPlayingOnQueue:(id)a3 completion:(id)a4;
- (void)requestLastPlayingDateOnQueue:(id)a3 completion:(id)a4;
- (void)requestNowPlayingInfoOnQueue:(id)a3 completion:(id)a4;
- (void)requestNowPlayingItemArtworkOnQueue:(id)a3 completion:(id)a4;
- (void)requestNowPlayingItemLanguageOptionsOnQueue:(id)a3 completion:(id)a4;
- (void)requestNowPlayingItemMetadataOnQueue:(id)a3 completion:(id)a4;
- (void)requestPlaybackRateOnQueue:(id)a3 completion:(id)a4;
- (void)requestPlaybackStateOnQueue:(id)a3 completion:(id)a4;
- (void)requestProxiableSupportedCommandsOnQueue:(id)a3 completion:(id)a4;
- (void)requestShuffleAndRepeatModeOnQueue:(id)a3 completion:(id)a4;
- (void)requestSupportedCommandsOnQueue:(id)a3 completion:(id)a4;
- (void)sendCommand:(unsigned int)a3 options:(id)a4 appOptions:(unsigned int)a5 queue:(id)a6 completion:(id)a7;
- (void)sendCommand:(unsigned int)a3 options:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)suspendDisconnectionPauseForConfiguration:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)triggerAudioFadeInWithReplyQueue:(id)a3 completion:(id)a4;
- (void)triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue:(id)a3 completion:(id)a4;
@end

@implementation MRNowPlayingRequest

- (void)triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [v8 UUIDString];

  v10 = [MEMORY[0x1E4F1C9C8] date];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"[MRNowPlaying triggerAudioFadeOut]", v9];
  v12 = [(MRNowPlayingRequest *)self destination];

  if (v12)
  {
    v13 = [(MRNowPlayingRequest *)self destination];
    [v11 appendFormat:@" for %@", v13];
  }
  v14 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v11;
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v15 = [(MRNowPlayingRequest *)self destination];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke;
  v20[3] = &unk_1E57D20E8;
  id v24 = v10;
  id v25 = v7;
  v21 = @"[MRNowPlaying triggerAudioFadeOut]";
  id v22 = v9;
  id v23 = v6;
  id v16 = v10;
  id v17 = v6;
  id v18 = v9;
  id v19 = v7;
  +[MRDestinationResolver resolveDestination:v15 level:2 timeout:v20 completion:5.0];
}

void __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 playerPath];
  if (v6)
  {
    id v7 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v8;
      __int16 v22 = 2114;
      uint64_t v23 = v9;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    v10 = [[MRAudioFadeMessage alloc] initWithPlayerPath:v6 fadeType:0];
    v11 = (void *)MRGetSharedService();
    v12 = *(void **)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_14;
    v14[3] = &unk_1E57D20C0;
    id v19 = *(id *)(a1 + 64);
    id v15 = v6;
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 56);
    MRMediaRemoteServiceTriggerAudioFade(v11, v10, v12, v14);
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 64);
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v5);
    }
  }
}

void __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_14(void *a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1[8])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 fadeDuration];
    }
    (*(void (**)(void))(a1[8] + 16))();
    uint64_t v7 = a1[4];
    uint64_t v8 = _MRLogForCategory(0xAuLL);
    uint64_t v9 = v8;
    if (v6)
    {
      BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (!v7)
      {
        if (v10) {
          __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_14_cold_1((uint64_t)a1);
        }
        goto LABEL_17;
      }
      if (v10)
      {
        uint64_t v12 = a1[5];
        uint64_t v11 = a1[6];
        uint64_t v13 = a1[4];
        v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:a1[7]];
        int v27 = 138544386;
        uint64_t v28 = v12;
        __int16 v29 = 2114;
        uint64_t v30 = v11;
        __int16 v31 = 2114;
        id v32 = v6;
        __int16 v33 = 2114;
        uint64_t v34 = v13;
        __int16 v35 = 2048;
        uint64_t v36 = v15;
        _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v27, 0x34u);
LABEL_16:
      }
LABEL_17:

      goto LABEL_18;
    }
    BOOL v16 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v18 = a1[5];
      uint64_t v17 = a1[6];
      id v19 = (void *)a1[4];
      v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:a1[7]];
      int v27 = 138544130;
      uint64_t v28 = v18;
      __int16 v29 = 2114;
      uint64_t v30 = v17;
      __int16 v31 = 2114;
      id v32 = v19;
      __int16 v33 = 2048;
      uint64_t v34 = v20;
      uint64_t v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      __int16 v22 = v9;
      uint32_t v23 = 42;
    }
    else
    {
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v24 = a1[5];
      uint64_t v25 = a1[6];
      v14 = [MEMORY[0x1E4F1C9C8] date];
      [v14 timeIntervalSinceDate:a1[7]];
      int v27 = 138543874;
      uint64_t v28 = v24;
      __int16 v29 = 2114;
      uint64_t v30 = v25;
      __int16 v31 = 2048;
      id v32 = v26;
      uint64_t v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      __int16 v22 = v9;
      uint32_t v23 = 32;
    }
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v27, v23);
    goto LABEL_16;
  }
LABEL_18:
}

- (void)triggerAudioFadeInWithReplyQueue:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = [v8 UUIDString];

  BOOL v10 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"[MRNowPlaying triggerAudioFadeIn]", v9];
  uint64_t v12 = [(MRNowPlayingRequest *)self destination];

  if (v12)
  {
    uint64_t v13 = [(MRNowPlayingRequest *)self destination];
    [v11 appendFormat:@" for %@", v13];
  }
  v14 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v27 = v11;
    _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v15 = [(MRNowPlayingRequest *)self destination];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __78__MRNowPlayingRequest_AudioFade__triggerAudioFadeInWithReplyQueue_completion___block_invoke;
  v20[3] = &unk_1E57D20E8;
  id v24 = v10;
  id v25 = v7;
  uint64_t v21 = @"[MRNowPlaying triggerAudioFadeIn]";
  id v22 = v9;
  id v23 = v6;
  id v16 = v10;
  id v17 = v6;
  id v18 = v9;
  id v19 = v7;
  +[MRDestinationResolver resolveDestination:v15 level:2 timeout:v20 completion:5.0];
}

void __78__MRNowPlayingRequest_AudioFade__triggerAudioFadeInWithReplyQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 playerPath];
  if (v6)
  {
    id v7 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v8;
      __int16 v22 = 2114;
      uint64_t v23 = v9;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    BOOL v10 = [[MRAudioFadeMessage alloc] initWithPlayerPath:v6 fadeType:1];
    uint64_t v11 = (void *)MRGetSharedService();
    uint64_t v12 = *(void **)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__MRNowPlayingRequest_AudioFade__triggerAudioFadeInWithReplyQueue_completion___block_invoke_21;
    v14[3] = &unk_1E57D20C0;
    id v19 = *(id *)(a1 + 64);
    id v15 = v6;
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 56);
    MRMediaRemoteServiceTriggerAudioFade(v11, v10, v12, v14);
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 64);
    if (v13) {
      (*(void (**)(uint64_t, id))(v13 + 16))(v13, v5);
    }
  }
}

void __78__MRNowPlayingRequest_AudioFade__triggerAudioFadeInWithReplyQueue_completion___block_invoke_21(void *a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[8];
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
    uint64_t v8 = a1[4];
    uint64_t v9 = _MRLogForCategory(0xAuLL);
    BOOL v10 = v9;
    if (v6)
    {
      BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if (!v8)
      {
        if (v11) {
          __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_14_cold_1((uint64_t)a1);
        }
        goto LABEL_15;
      }
      if (v11)
      {
        uint64_t v13 = a1[5];
        uint64_t v12 = a1[6];
        uint64_t v14 = a1[4];
        id v15 = [MEMORY[0x1E4F1C9C8] date];
        [v15 timeIntervalSinceDate:a1[7]];
        int v28 = 138544386;
        uint64_t v29 = v13;
        __int16 v30 = 2114;
        uint64_t v31 = v12;
        __int16 v32 = 2114;
        id v33 = v6;
        __int16 v34 = 2114;
        uint64_t v35 = v14;
        __int16 v36 = 2048;
        uint64_t v37 = v16;
        _os_log_error_impl(&dword_194F3C000, v10, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v28, 0x34u);
LABEL_14:
      }
LABEL_15:

      goto LABEL_16;
    }
    BOOL v17 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (!v17) {
        goto LABEL_15;
      }
      uint64_t v19 = a1[5];
      uint64_t v18 = a1[6];
      uint64_t v20 = (void *)a1[4];
      id v15 = [MEMORY[0x1E4F1C9C8] date];
      [v15 timeIntervalSinceDate:a1[7]];
      int v28 = 138544130;
      uint64_t v29 = v19;
      __int16 v30 = 2114;
      uint64_t v31 = v18;
      __int16 v32 = 2114;
      id v33 = v20;
      __int16 v34 = 2048;
      uint64_t v35 = v21;
      __int16 v22 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      uint64_t v23 = v10;
      uint32_t v24 = 42;
    }
    else
    {
      if (!v17) {
        goto LABEL_15;
      }
      uint64_t v25 = a1[5];
      uint64_t v26 = a1[6];
      id v15 = [MEMORY[0x1E4F1C9C8] date];
      [v15 timeIntervalSinceDate:a1[7]];
      int v28 = 138543874;
      uint64_t v29 = v25;
      __int16 v30 = 2114;
      uint64_t v31 = v26;
      __int16 v32 = 2048;
      id v33 = v27;
      __int16 v22 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v23 = v10;
      uint32_t v24 = 32;
    }
    _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v28, v24);
    goto LABEL_14;
  }
LABEL_16:
}

- (MRNowPlayingRequest)init
{
  v3 = +[MRDestination localDestination];
  v4 = [(MRNowPlayingRequest *)self initWithDestination:v3];

  return v4;
}

- (MRNowPlayingRequest)initWithDestination:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRNowPlayingRequest;
  id v5 = [(MRNowPlayingRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    destination = v5->_destination;
    v5->_destination = (MRDestination *)v6;
  }
  return v5;
}

- (MRNowPlayingRequest)initWithPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = [[MRDestination alloc] initWithPlayerPath:v4];

  uint64_t v6 = [(MRNowPlayingRequest *)self initWithDestination:v5];
  return v6;
}

- (MRNowPlayingRequest)initWithOrigin:(id)a3
{
  id v4 = a3;
  id v5 = [[MRPlayerPath alloc] initWithOrigin:v4 client:0 player:0];

  uint64_t v6 = [(MRNowPlayingRequest *)self initWithPlayerPath:v5];
  return v6;
}

- (void)requestIsPlayingOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__MRNowPlayingRequest_requestIsPlayingOnQueue_completion___block_invoke;
  v8[3] = &unk_1E57D3E28;
  id v9 = v6;
  id v7 = v6;
  [(MRNowPlayingRequest *)self requestPlaybackStateOnQueue:a3 completion:v8];
}

void __58__MRNowPlayingRequest_requestIsPlayingOnQueue_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = a3;
  BOOL IsAdvancing = MRMediaRemotePlaybackStateIsAdvancing(a2);
  (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, IsAdvancing, v6);
}

- (void)requestPlaybackStateOnQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MRNowPlayingRequestResponse.m", 53, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [MRNowPlayingControllerConfiguration alloc];
  BOOL v10 = [(MRNowPlayingRequest *)self destination];
  BOOL v11 = [(MRNowPlayingControllerConfiguration *)v9 initWithDestination:v10];

  [(MRNowPlayingControllerConfiguration *)v11 setRequestPlaybackState:1];
  [(MRNowPlayingControllerConfiguration *)v11 setLabel:@"requestPlaybackState"];
  uint64_t v12 = [[MRNowPlayingController alloc] initWithConfiguration:v11];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__MRNowPlayingRequest_requestPlaybackStateOnQueue_completion___block_invoke;
  v16[3] = &unk_1E57D3E50;
  id v17 = v7;
  id v18 = v8;
  id v13 = v8;
  id v14 = v7;
  [(MRNowPlayingController *)v12 performRequestWithCompletion:v16];
}

void __62__MRNowPlayingRequest_requestPlaybackStateOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MRNowPlayingRequest_requestPlaybackStateOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __62__MRNowPlayingRequest_requestPlaybackStateOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) playbackState];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);

  return v5(v2, v3, v4);
}

- (void)requestPlaybackRateOnQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MRNowPlayingRequestResponse.m", 68, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [MRNowPlayingControllerConfiguration alloc];
  id v10 = [(MRNowPlayingRequest *)self destination];
  BOOL v11 = [(MRNowPlayingControllerConfiguration *)v9 initWithDestination:v10];

  [(MRNowPlayingControllerConfiguration *)v11 setRequestPlaybackQueue:1];
  [(MRNowPlayingControllerConfiguration *)v11 setLabel:@"requestPlaybackRate"];
  id v12 = [[MRNowPlayingController alloc] initWithConfiguration:v11];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__MRNowPlayingRequest_requestPlaybackRateOnQueue_completion___block_invoke;
  v16[3] = &unk_1E57D3E50;
  id v17 = v7;
  id v18 = v8;
  id v13 = v8;
  id v14 = v7;
  [(MRNowPlayingController *)v12 performRequestWithCompletion:v16];
}

void __61__MRNowPlayingRequest_requestPlaybackRateOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MRNowPlayingRequest_requestPlaybackRateOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __61__MRNowPlayingRequest_requestPlaybackRateOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  [*(id *)(a1 + 32) playbackRate];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (void)requestNowPlayingItemMetadataOnQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MRNowPlayingRequestResponse.m", 83, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [MRNowPlayingControllerConfiguration alloc];
  id v10 = [(MRNowPlayingRequest *)self destination];
  BOOL v11 = [(MRNowPlayingControllerConfiguration *)v9 initWithDestination:v10];

  id v12 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequest];
  [(MRNowPlayingControllerConfiguration *)v11 setPlaybackQueueRequest:v12];

  [(MRNowPlayingControllerConfiguration *)v11 setLabel:@"requestNowPlayingItemMetadata"];
  id v13 = [[MRNowPlayingController alloc] initWithConfiguration:v11];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__MRNowPlayingRequest_requestNowPlayingItemMetadataOnQueue_completion___block_invoke;
  v17[3] = &unk_1E57D3E50;
  id v18 = v7;
  id v19 = v8;
  id v14 = v8;
  id v15 = v7;
  [(MRNowPlayingController *)v13 performRequestWithCompletion:v17];
}

void __71__MRNowPlayingRequest_requestNowPlayingItemMetadataOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MRNowPlayingRequest_requestNowPlayingItemMetadataOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __71__MRNowPlayingRequest_requestNowPlayingItemMetadataOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) playbackQueue];
  uint64_t v3 = [v5 contentItemWithOffset:0];
  uint64_t v4 = [v3 metadata];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v4, *(void *)(a1 + 40));
}

- (void)requestNowPlayingItemLanguageOptionsOnQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MRNowPlayingRequestResponse.m", 98, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [MRNowPlayingControllerConfiguration alloc];
  id v10 = [(MRNowPlayingRequest *)self destination];
  BOOL v11 = [(MRNowPlayingControllerConfiguration *)v9 initWithDestination:v10];

  id v12 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequest];
  [(MRNowPlayingControllerConfiguration *)v11 setPlaybackQueueRequest:v12];

  id v13 = [(MRNowPlayingControllerConfiguration *)v11 playbackQueueRequest];
  [v13 setIncludeLanguageOptions:1];

  [(MRNowPlayingControllerConfiguration *)v11 setLabel:@"requestNowPlayingItemLanguageOptions"];
  id v14 = [[MRNowPlayingController alloc] initWithConfiguration:v11];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__MRNowPlayingRequest_requestNowPlayingItemLanguageOptionsOnQueue_completion___block_invoke;
  v18[3] = &unk_1E57D3E50;
  id v19 = v7;
  id v20 = v8;
  id v15 = v8;
  id v16 = v7;
  [(MRNowPlayingController *)v14 performRequestWithCompletion:v18];
}

void __78__MRNowPlayingRequest_requestNowPlayingItemLanguageOptionsOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__MRNowPlayingRequest_requestNowPlayingItemLanguageOptionsOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E57D13A8;
  id v12 = v5;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __78__MRNowPlayingRequest_requestNowPlayingItemLanguageOptionsOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) playbackQueue];
  id v6 = [v2 contentItemWithOffset:0];

  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = [v6 availableLanguageOptions];
  id v5 = [v6 currentLanguageOptions];
  (*(void (**)(uint64_t, void *, void *, void))(v3 + 16))(v3, v4, v5, *(void *)(a1 + 40));
}

- (void)requestNowPlayingItemArtworkOnQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MRNowPlayingRequestResponse.m", 115, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [MRNowPlayingControllerConfiguration alloc];
  id v10 = [(MRNowPlayingRequest *)self destination];
  BOOL v11 = [(MRNowPlayingControllerConfiguration *)v9 initWithDestination:v10];

  id v12 = -[MRPlaybackQueueRequest initWithRange:]([MRPlaybackQueueRequest alloc], "initWithRange:", 0, 1);
  [(MRPlaybackQueueRequest *)v12 setArtworkHeight:600.0];
  [(MRPlaybackQueueRequest *)v12 setArtworkWidth:600.0];
  [(MRNowPlayingControllerConfiguration *)v11 setPlaybackQueueRequest:v12];
  [(MRNowPlayingControllerConfiguration *)v11 setLabel:@"requestNowPlayingItemArtwork"];
  id v13 = [[MRNowPlayingController alloc] initWithConfiguration:v11];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__MRNowPlayingRequest_requestNowPlayingItemArtworkOnQueue_completion___block_invoke;
  v17[3] = &unk_1E57D3E50;
  id v18 = v7;
  id v19 = v8;
  id v14 = v8;
  id v15 = v7;
  [(MRNowPlayingController *)v13 performRequestWithCompletion:v17];
}

void __70__MRNowPlayingRequest_requestNowPlayingItemArtworkOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MRNowPlayingRequest_requestNowPlayingItemArtworkOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __70__MRNowPlayingRequest_requestNowPlayingItemArtworkOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) playbackQueue];
  uint64_t v3 = [v5 contentItemWithOffset:0];
  uint64_t v4 = [v3 artwork];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v4, *(void *)(a1 + 40));
}

- (void)requestNowPlayingInfoOnQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MRNowPlayingRequestResponse.m", 133, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [MRNowPlayingControllerConfiguration alloc];
  id v10 = [(MRNowPlayingRequest *)self destination];
  BOOL v11 = [(MRNowPlayingControllerConfiguration *)v9 initWithDestination:v10];

  id v12 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequest];
  [(MRNowPlayingControllerConfiguration *)v11 setPlaybackQueueRequest:v12];

  [(MRNowPlayingControllerConfiguration *)v11 setLabel:@"requestNowPlayingInfo"];
  id v13 = [[MRNowPlayingController alloc] initWithConfiguration:v11];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__MRNowPlayingRequest_requestNowPlayingInfoOnQueue_completion___block_invoke;
  v17[3] = &unk_1E57D3E50;
  id v18 = v7;
  id v19 = v8;
  id v14 = v8;
  id v15 = v7;
  [(MRNowPlayingController *)v13 performRequestWithCompletion:v17];
}

void __63__MRNowPlayingRequest_requestNowPlayingInfoOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MRNowPlayingRequest_requestNowPlayingInfoOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __63__MRNowPlayingRequest_requestNowPlayingInfoOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) playbackQueue];
  uint64_t v3 = [v4 nowPlayingInfo];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (void)requestSupportedCommandsOnQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MRNowPlayingRequestResponse.m", 148, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [MRNowPlayingControllerConfiguration alloc];
  id v10 = [(MRNowPlayingRequest *)self destination];
  BOOL v11 = [(MRNowPlayingControllerConfiguration *)v9 initWithDestination:v10];

  [(MRNowPlayingControllerConfiguration *)v11 setRequestSupportedCommands:1];
  [(MRNowPlayingControllerConfiguration *)v11 setLabel:@"requestSupportedCommands"];
  id v12 = [[MRNowPlayingController alloc] initWithConfiguration:v11];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__MRNowPlayingRequest_requestSupportedCommandsOnQueue_completion___block_invoke;
  v16[3] = &unk_1E57D3E50;
  id v17 = v7;
  id v18 = v8;
  id v13 = v8;
  id v14 = v7;
  [(MRNowPlayingController *)v12 performRequestWithCompletion:v16];
}

void __66__MRNowPlayingRequest_requestSupportedCommandsOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MRNowPlayingRequest_requestSupportedCommandsOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __66__MRNowPlayingRequest_requestSupportedCommandsOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) supportedCommands];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (void)requestShuffleAndRepeatModeOnQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MRNowPlayingRequestResponse.m", 163, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [MRNowPlayingControllerConfiguration alloc];
  id v10 = [(MRNowPlayingRequest *)self destination];
  BOOL v11 = [(MRNowPlayingControllerConfiguration *)v9 initWithDestination:v10];

  [(MRNowPlayingControllerConfiguration *)v11 setRequestSupportedCommands:1];
  [(MRNowPlayingControllerConfiguration *)v11 setLabel:@"requestShuffleAndRepeatModeOnQueue"];
  id v12 = [[MRNowPlayingController alloc] initWithConfiguration:v11];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__MRNowPlayingRequest_requestShuffleAndRepeatModeOnQueue_completion___block_invoke;
  v16[3] = &unk_1E57D3E50;
  id v17 = v7;
  id v18 = v8;
  id v13 = v8;
  id v14 = v7;
  [(MRNowPlayingController *)v12 performRequestWithCompletion:v16];
}

void __69__MRNowPlayingRequest_requestShuffleAndRepeatModeOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MRNowPlayingRequest_requestShuffleAndRepeatModeOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __69__MRNowPlayingRequest_requestShuffleAndRepeatModeOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) shuffleMode];
  uint64_t v4 = [*(id *)(a1 + 32) repeatMode];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16);

  return v6(v2, v3, v4, v5);
}

- (void)requestProxiableSupportedCommandsOnQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MRNowPlayingRequestResponse.m", 178, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [MRNowPlayingControllerConfiguration alloc];
  id v10 = [(MRNowPlayingRequest *)self destination];
  BOOL v11 = [(MRNowPlayingControllerConfiguration *)v9 initWithDestination:v10];

  [(MRNowPlayingControllerConfiguration *)v11 setRequestSupportedCommands:1];
  [(MRNowPlayingControllerConfiguration *)v11 setLabel:@"requestProxiableSupportedCommands"];
  id v12 = [[MRNowPlayingController alloc] initWithConfiguration:v11];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__MRNowPlayingRequest_requestProxiableSupportedCommandsOnQueue_completion___block_invoke;
  v16[3] = &unk_1E57D3E50;
  id v17 = v7;
  id v18 = v8;
  id v13 = v8;
  id v14 = v7;
  [(MRNowPlayingController *)v12 performRequestWithCompletion:v16];
}

void __75__MRNowPlayingRequest_requestProxiableSupportedCommandsOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__MRNowPlayingRequest_requestProxiableSupportedCommandsOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __75__MRNowPlayingRequest_requestProxiableSupportedCommandsOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) proxiableSupportedCommands];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (void)requestLastPlayingDateOnQueue:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"MRNowPlayingRequestResponse.m", 193, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [MEMORY[0x1E4F29128] UUID];
  id v10 = [v9 UUIDString];

  BOOL v11 = [MEMORY[0x1E4F1C9C8] date];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"[MRNowPlaying requestLastPlayingDate]", v10];
  id v13 = [(MRNowPlayingRequest *)self destination];

  if (v13)
  {
    id v14 = [(MRNowPlayingRequest *)self destination];
    [v12 appendFormat:@" for %@", v14];
  }
  id v15 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v12;
    _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v16 = [(MRNowPlayingRequest *)self destination];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke;
  v22[3] = &unk_1E57D3EA0;
  uint64_t v23 = @"[MRNowPlaying requestLastPlayingDate]";
  id v24 = v10;
  id v25 = v11;
  id v26 = v7;
  id v27 = v8;
  id v17 = v8;
  id v18 = v7;
  id v19 = v11;
  id v20 = v10;
  +[MRDestinationResolver resolveDestination:v16 level:2 timeout:v22 completion:5.0];
}

void __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 playerPath];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke_2;
  id v19 = &unk_1E57D3E78;
  id v7 = v6;
  id v20 = v7;
  id v21 = a1[4];
  id v22 = a1[5];
  id v23 = a1[6];
  id v24 = a1[7];
  id v25 = a1[8];
  uint64_t v8 = MEMORY[0x1997190F0](&v16);
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    id v10 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = a1[4];
      id v12 = a1[5];
      *(_DWORD *)buf = 138543874;
      id v27 = v11;
      __int16 v28 = 2114;
      id v29 = v12;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    id v13 = (void *)MRGetSharedService();
    MRMediaRemoteServiceGetLastPlayingDateForPlayer(v13, v7, a1[7], v9);
  }
  else if (v5)
  {
    (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v5);
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v15 = objc_msgSend(v14, "initWithMRError:", 27, v16, v17, v18, v19, v20, v21, v22, v23, v24);
    ((void (**)(void, void, void *))v9)[2](v9, 0, v15);
  }
}

void __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = NSString;
  uint64_t v8 = NSNumber;
  [v5 timeIntervalSinceNow];
  id v10 = [v8 numberWithDouble:-v9];
  id v11 = [v7 stringWithFormat:@"lastPlayingDate = %@. Time since playing = %@ seconds.", v5, v10];

  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = _MRLogForCategory(0xAuLL);
  id v14 = v13;
  if (!v6 && v11)
  {
    BOOL v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v16 = *(void *)(a1 + 48);
        uint64_t v18 = *(void *)(a1 + 32);
        id v19 = [MEMORY[0x1E4F1C9C8] date];
        [v19 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544386;
        uint64_t v49 = v17;
        __int16 v50 = 2114;
        uint64_t v51 = v16;
        __int16 v52 = 2112;
        id v53 = v11;
        __int16 v54 = 2114;
        uint64_t v55 = v18;
        __int16 v56 = 2048;
        uint64_t v57 = v20;
        id v21 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v22 = v14;
        uint32_t v23 = 52;
LABEL_16:
        _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v15) {
      goto LABEL_22;
    }
    uint64_t v34 = *(void *)(a1 + 40);
    uint64_t v35 = *(void *)(a1 + 48);
    id v19 = [MEMORY[0x1E4F1C9C8] date];
    [v19 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544130;
    uint64_t v49 = v34;
    __int16 v50 = 2114;
    uint64_t v51 = v35;
    __int16 v52 = 2112;
    id v53 = v11;
    __int16 v54 = 2048;
    uint64_t v55 = v36;
    id v21 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    id v22 = v14;
    uint32_t v23 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    BOOL v24 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v24)
      {
        uint64_t v26 = *(void *)(a1 + 40);
        uint64_t v25 = *(void *)(a1 + 48);
        uint64_t v27 = *(void *)(a1 + 32);
        id v19 = [MEMORY[0x1E4F1C9C8] date];
        [v19 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544386;
        uint64_t v49 = v26;
        __int16 v50 = 2114;
        uint64_t v51 = v25;
        __int16 v52 = 2114;
        id v53 = v6;
        __int16 v54 = 2114;
        uint64_t v55 = v27;
        __int16 v56 = 2048;
        uint64_t v57 = v28;
        _os_log_error_impl(&dword_194F3C000, v14, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v24)
    {
      __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_14_cold_1(a1);
    }
    goto LABEL_22;
  }
  BOOL v29 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (!v29) {
      goto LABEL_22;
    }
    uint64_t v37 = *(void *)(a1 + 40);
    uint64_t v38 = *(void *)(a1 + 48);
    id v19 = [MEMORY[0x1E4F1C9C8] date];
    [v19 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138543874;
    uint64_t v49 = v37;
    __int16 v50 = 2114;
    uint64_t v51 = v38;
    __int16 v52 = 2048;
    id v53 = v39;
    id v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v22 = v14;
    uint32_t v23 = 32;
    goto LABEL_16;
  }
  if (v29)
  {
    uint64_t v31 = *(void *)(a1 + 40);
    uint64_t v30 = *(void *)(a1 + 48);
    uint64_t v32 = *(void **)(a1 + 32);
    id v19 = [MEMORY[0x1E4F1C9C8] date];
    [v19 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)buf = 138544130;
    uint64_t v49 = v31;
    __int16 v50 = 2114;
    uint64_t v51 = v30;
    __int16 v52 = 2114;
    id v53 = v32;
    __int16 v54 = 2048;
    uint64_t v55 = v33;
    id v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke_69;
  block[3] = &unk_1E57D0EA8;
  v40 = *(NSObject **)(a1 + 64);
  id v41 = *(id *)(a1 + 72);
  id v46 = v6;
  id v47 = v41;
  id v45 = v5;
  id v42 = v6;
  id v43 = v5;
  dispatch_async(v40, block);
}

uint64_t __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke_69(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)requestDeviceLastPlayingDateOnQueue:(id)a3 completion:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"MRNowPlayingRequestResponse.m", 225, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  double v9 = [MEMORY[0x1E4F29128] UUID];
  id v10 = [v9 UUIDString];

  id v11 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"[MRNowPlaying requestDeviceLastPlayingDate]", v10];
  id v13 = [(MRNowPlayingRequest *)self destination];

  if (v13)
  {
    id v14 = [(MRNowPlayingRequest *)self destination];
    [v12 appendFormat:@" for %@", v14];
  }
  BOOL v15 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = __Block_byref_object_copy__14;
  __int16 v50 = __Block_byref_object_dispose__14;
  id v51 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke;
  v40[3] = &unk_1E57D3EC8;
  p_long long buf = &buf;
  id v41 = @"[MRNowPlaying requestDeviceLastPlayingDate]";
  id v16 = v10;
  id v42 = v16;
  id v17 = v11;
  id v43 = v17;
  id v18 = v7;
  id v44 = v18;
  id v19 = v8;
  id v45 = v19;
  uint64_t v20 = (void *)MEMORY[0x1997190F0](v40);
  id v21 = [(MRNowPlayingRequest *)self destination];
  char v22 = [v21 isLocal];

  if (v22)
  {
    uint32_t v23 = [MRPlayerPath alloc];
    BOOL v24 = +[MROrigin localOrigin];
    uint64_t v25 = [(MRPlayerPath *)v23 initWithOrigin:v24 client:0 player:0];
    uint64_t v26 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v25;

    uint64_t v27 = *(void **)(*((void *)&buf + 1) + 40);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_2;
    v34[3] = &unk_1E57D3F18;
    v39 = &buf;
    id v35 = v18;
    id v38 = v20;
    uint64_t v36 = @"[MRNowPlaying requestDeviceLastPlayingDate]";
    id v37 = v16;
    MRMediaRemoteNowPlayingResolvePlayerPath(v27, v35, v34);

    uint64_t v28 = &v35;
  }
  else
  {
    BOOL v29 = [(MRNowPlayingRequest *)self destination];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_83;
    v31[3] = &unk_1E57D3F40;
    v33[0] = v20;
    v33[1] = &buf;
    v31[4] = self;
    id v32 = v18;
    +[MRDestinationResolver resolveDestination:v29 level:0 timeout:v31 completion:5.0];

    uint64_t v28 = (id *)v33;
  }

  _Block_object_dispose(&buf, 8);
}

void __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = NSString;
  id v8 = NSNumber;
  [v5 timeIntervalSinceNow];
  id v10 = [v8 numberWithDouble:-v9];
  id v11 = [v7 stringWithFormat:@"lastPlayingDate = %@. Time since playing = %@ seconds.", v5, v10];

  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v13 = _MRLogForCategory(0xAuLL);
  id v14 = v13;
  if (!v6 && v11)
  {
    BOOL v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        id v19 = [MEMORY[0x1E4F1C9C8] date];
        [v19 timeIntervalSinceDate:*(void *)(a1 + 48)];
        *(_DWORD *)long long buf = 138544386;
        uint64_t v49 = v16;
        __int16 v50 = 2114;
        uint64_t v51 = v17;
        __int16 v52 = 2112;
        id v53 = v11;
        __int16 v54 = 2114;
        uint64_t v55 = v18;
        __int16 v56 = 2048;
        uint64_t v57 = v20;
        id v21 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        char v22 = v14;
        uint32_t v23 = 52;
LABEL_16:
        _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v15) {
      goto LABEL_22;
    }
    uint64_t v34 = *(void *)(a1 + 32);
    uint64_t v35 = *(void *)(a1 + 40);
    id v19 = [MEMORY[0x1E4F1C9C8] date];
    [v19 timeIntervalSinceDate:*(void *)(a1 + 48)];
    *(_DWORD *)long long buf = 138544130;
    uint64_t v49 = v34;
    __int16 v50 = 2114;
    uint64_t v51 = v35;
    __int16 v52 = 2112;
    id v53 = v11;
    __int16 v54 = 2048;
    uint64_t v55 = v36;
    id v21 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    char v22 = v14;
    uint32_t v23 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    BOOL v24 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v24)
      {
        uint64_t v25 = *(void *)(a1 + 32);
        uint64_t v26 = *(void *)(a1 + 40);
        uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        id v19 = [MEMORY[0x1E4F1C9C8] date];
        [v19 timeIntervalSinceDate:*(void *)(a1 + 48)];
        *(_DWORD *)long long buf = 138544386;
        uint64_t v49 = v25;
        __int16 v50 = 2114;
        uint64_t v51 = v26;
        __int16 v52 = 2114;
        id v53 = v6;
        __int16 v54 = 2114;
        uint64_t v55 = v27;
        __int16 v56 = 2048;
        uint64_t v57 = v28;
        _os_log_error_impl(&dword_194F3C000, v14, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v24)
    {
      __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_cold_1(a1);
    }
    goto LABEL_22;
  }
  BOOL v29 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (!v29) {
      goto LABEL_22;
    }
    uint64_t v37 = *(void *)(a1 + 32);
    uint64_t v38 = *(void *)(a1 + 40);
    id v19 = [MEMORY[0x1E4F1C9C8] date];
    [v19 timeIntervalSinceDate:*(void *)(a1 + 48)];
    *(_DWORD *)long long buf = 138543874;
    uint64_t v49 = v37;
    __int16 v50 = 2114;
    uint64_t v51 = v38;
    __int16 v52 = 2048;
    id v53 = v39;
    id v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    char v22 = v14;
    uint32_t v23 = 32;
    goto LABEL_16;
  }
  if (v29)
  {
    uint64_t v30 = *(void *)(a1 + 32);
    uint64_t v31 = *(void *)(a1 + 40);
    id v32 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    id v19 = [MEMORY[0x1E4F1C9C8] date];
    [v19 timeIntervalSinceDate:*(void *)(a1 + 48)];
    *(_DWORD *)long long buf = 138544130;
    uint64_t v49 = v30;
    __int16 v50 = 2114;
    uint64_t v51 = v31;
    __int16 v52 = 2114;
    id v53 = v32;
    __int16 v54 = 2048;
    uint64_t v55 = v33;
    id v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_76;
  block[3] = &unk_1E57D0EA8;
  v40 = *(NSObject **)(a1 + 56);
  id v41 = *(id *)(a1 + 64);
  id v46 = v6;
  id v47 = v41;
  id v45 = v5;
  id v42 = v6;
  id v43 = v5;
  dispatch_async(v40, block);
}

uint64_t __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_76(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[MRNowPlayingOriginClientManager sharedManager];
  id v5 = [v4 originClientRequestsForPlayerPath:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  if ([a2 isResolved])
  {
    id v6 = (void *)MRGetSharedService();
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v8 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_3;
    v14[3] = &unk_1E57D3EF0;
    id v15 = v5;
    id v16 = *(id *)(a1 + 56);
    MRMediaRemoteServiceGetLastPlayingDateForPlayer(v6, v7, v8, v14);

    double v9 = v15;
  }
  else
  {
    id v10 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      char v22 = @"Using cache.";
      _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    id v13 = +[MRNowPlayingOriginClientManager sharedManager];
    double v9 = [v13 originClientRequestsForPlayerPath:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

    [v9 handleLastPlayingDateRequestWithCompletion:*(void *)(a1 + 56)];
  }
}

void __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 setLastPlayingDate:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_83(uint64_t a1, void *a2, void *a3)
{
  id v15 = a3;
  id v5 = [a2 origin];

  if (v5)
  {
    id v6 = [MRPlayerPath alloc];
    id v7 = [*(id *)(a1 + 32) destination];
    id v8 = [v7 origin];
    uint64_t v9 = [(MRPlayerPath *)v6 initWithOrigin:v8 client:0 player:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = (void *)MRGetSharedService();
    MRMediaRemoteServiceGetLastPlayingDateForPlayer(v12, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 48);
    if (v15)
    {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }
    else
    {
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:5];
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
    }
  }
}

- (void)requestClientPropertiesOnQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MRNowPlayingRequestResponse.m", 279, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  uint64_t v9 = [MRNowPlayingControllerConfiguration alloc];
  uint64_t v10 = [(MRNowPlayingRequest *)self destination];
  uint64_t v11 = [(MRNowPlayingControllerConfiguration *)v9 initWithDestination:v10];

  [(MRNowPlayingControllerConfiguration *)v11 setRequestClientProperties:1];
  [(MRNowPlayingControllerConfiguration *)v11 setLabel:@"requestClientProperties"];
  uint64_t v12 = [[MRNowPlayingController alloc] initWithConfiguration:v11];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__MRNowPlayingRequest_requestClientPropertiesOnQueue_completion___block_invoke;
  v16[3] = &unk_1E57D3E50;
  id v17 = v7;
  id v18 = v8;
  id v13 = v8;
  id v14 = v7;
  [(MRNowPlayingController *)v12 performRequestWithCompletion:v16];
}

void __65__MRNowPlayingRequest_requestClientPropertiesOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MRNowPlayingRequest_requestClientPropertiesOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __65__MRNowPlayingRequest_requestClientPropertiesOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) clientProperties];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (void)nowPlayingPlayerPathOnQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MRNowPlayingRequestResponse.m", 294, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = [MRNowPlayingControllerConfiguration alloc];
  id v10 = [(MRNowPlayingRequest *)self destination];
  uint64_t v11 = [(MRNowPlayingControllerConfiguration *)v9 initWithDestination:v10];

  [(MRNowPlayingControllerConfiguration *)v11 setLabel:@"requestNowPlayingClient"];
  id v12 = [[MRNowPlayingController alloc] initWithConfiguration:v11];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__MRNowPlayingRequest_nowPlayingPlayerPathOnQueue_completion___block_invoke;
  v16[3] = &unk_1E57D3E50;
  id v17 = v7;
  id v18 = v8;
  id v13 = v8;
  id v14 = v7;
  [(MRNowPlayingController *)v12 performRequestWithCompletion:v16];
}

void __62__MRNowPlayingRequest_nowPlayingPlayerPathOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MRNowPlayingRequest_nowPlayingPlayerPathOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __62__MRNowPlayingRequest_nowPlayingPlayerPathOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) playerPath];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 queue:(id)a5 completion:(id)a6
{
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 appOptions:(unsigned int)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v10 = *(void *)&a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = a4;
  id v15 = [MRNowPlayingControllerConfiguration alloc];
  id v16 = [(MRNowPlayingRequest *)self destination];
  id v17 = [(MRNowPlayingControllerConfiguration *)v15 initWithDestination:v16];

  [(MRNowPlayingControllerConfiguration *)v17 setLabel:@"sendCommand"];
  id v18 = [[MRNowPlayingController alloc] initWithConfiguration:v17];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__MRNowPlayingRequest_sendCommand_options_appOptions_queue_completion___block_invoke;
  v21[3] = &unk_1E57D3F68;
  id v22 = v12;
  id v23 = v13;
  id v19 = v12;
  id v20 = v13;
  [(MRNowPlayingController *)v18 sendCommand:v10 options:v14 appOptions:v8 completion:v21];
}

void __71__MRNowPlayingRequest_sendCommand_options_appOptions_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__MRNowPlayingRequest_sendCommand_options_appOptions_queue_completion___block_invoke_2;
    v6[3] = &unk_1E57D0DB8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __71__MRNowPlayingRequest_sendCommand_options_appOptions_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (BOOL)localIsPlaying
{
  int v2 = [a1 localPlaybackState];

  return MRMediaRemotePlaybackStateIsAdvancing(v2);
}

+ (unsigned)localPlaybackState
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F1C000uLL;
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v5 UUIDString];

  id v7 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"NowPlayingRequest.localPlaybackState", v6];
  id v8 = +[MROrigin localOrigin];

  if (v8)
  {
    id v9 = +[MROrigin localOrigin];
    [(__CFString *)v7 appendFormat:@" for %@", v9];
  }
  uint64_t v10 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v48 = v7;
    _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v11 = [a1 localNowPlayingPlayerPath];
  if (![v11 isResolved])
  {
    LODWORD(uint64) = 0;
    goto LABEL_9;
  }
  id v12 = +[MRNowPlayingOriginClientManager sharedManager];
  id v13 = [v12 playerClientRequestsForPlayerPath:v11];

  int v14 = [v13 playbackState];
  if (v14)
  {
    LODWORD(uint64) = v14;

    goto LABEL_9;
  }
  uint64_t v30 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138544130;
    uint64_t v48 = @"NowPlayingRequest.localPlaybackState";
    __int16 v49 = 2114;
    __int16 v50 = v6;
    __int16 v51 = 2112;
    id v52 = 0;
    __int16 v53 = 2112;
    __int16 v54 = v4;
    _os_log_impl(&dword_194F3C000, v30, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
  }

  uint64_t v31 = MRCreateXPCMessage(0x200000000000012uLL);
  MRAddPlayerPathToXPCMessage(v31, v11);
  id v32 = +[MRMediaRemoteServiceClient sharedServiceClient];
  uint64_t v33 = [v32 service];
  uint64_t v34 = [v33 mrXPCConnection];
  id v46 = 0;
  uint64_t v35 = [v34 sendSyncMessage:v31 error:&v46];
  id v36 = v46;

  uint64_t uint64 = xpc_dictionary_get_uint64(v35, "MRXPC_PLAYBACK_STATE_KEY");
  [v13 updatePlaybackStateIfUninitialized:uint64];

  if (!v36)
  {
    unint64_t v3 = 0x1E4F1C000;
LABEL_9:
    id v16 = MRMediaRemoteCopyPlaybackStateDescription(uint64);

    id v17 = _MRLogForCategory(0xAuLL);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v11)
      {
        if (v18)
        {
          id v19 = MRMediaRemoteCopyPlaybackStateDescription(uint64);
          id v20 = [*(id *)(v3 + 2504) date];
          [v20 timeIntervalSinceDate:v4];
          *(_DWORD *)long long buf = 138544386;
          uint64_t v48 = @"NowPlayingRequest.localPlaybackState";
          __int16 v49 = 2114;
          __int16 v50 = v6;
          __int16 v51 = 2112;
          id v52 = v19;
          __int16 v53 = 2114;
          __int16 v54 = v11;
          __int16 v55 = 2048;
          uint64_t v56 = v21;
          id v22 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
          id v23 = v17;
          uint32_t v24 = 52;
LABEL_18:
          _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);

LABEL_28:
        }
      }
      else if (v18)
      {
        id v19 = MRMediaRemoteCopyPlaybackStateDescription(uint64);
        id v20 = [*(id *)(v3 + 2504) date];
        [v20 timeIntervalSinceDate:v4];
        *(_DWORD *)long long buf = 138544130;
        uint64_t v48 = @"NowPlayingRequest.localPlaybackState";
        __int16 v49 = 2114;
        __int16 v50 = v6;
        __int16 v51 = 2112;
        id v52 = v19;
        __int16 v53 = 2048;
        __int16 v54 = v29;
        id v22 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        id v23 = v17;
        uint32_t v24 = 42;
        goto LABEL_18;
      }
LABEL_29:
      id v36 = 0;
      goto LABEL_30;
    }
    if (v11)
    {
      if (!v18) {
        goto LABEL_29;
      }
      id v19 = [*(id *)(v3 + 2504) date];
      [v19 timeIntervalSinceDate:v4];
      *(_DWORD *)long long buf = 138544130;
      uint64_t v48 = @"NowPlayingRequest.localPlaybackState";
      __int16 v49 = 2114;
      __int16 v50 = v6;
      __int16 v51 = 2114;
      id v52 = v11;
      __int16 v53 = 2048;
      __int16 v54 = v25;
      uint64_t v26 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      uint64_t v27 = v17;
      uint32_t v28 = 42;
    }
    else
    {
      if (!v18) {
        goto LABEL_29;
      }
      id v19 = [*(id *)(v3 + 2504) date];
      [v19 timeIntervalSinceDate:v4];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v48 = @"NowPlayingRequest.localPlaybackState";
      __int16 v49 = 2114;
      __int16 v50 = v6;
      __int16 v51 = 2048;
      id v52 = v43;
      uint64_t v26 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v27 = v17;
      uint32_t v28 = 32;
    }
    _os_log_impl(&dword_194F3C000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    goto LABEL_28;
  }
  id v17 = _MRLogForCategory(0xAuLL);
  BOOL v37 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
  if (!v11)
  {
    if (!v37) {
      goto LABEL_30;
    }
    uint64_t v38 = [MEMORY[0x1E4F1C9C8] date];
    [v38 timeIntervalSinceDate:v4];
    *(_DWORD *)long long buf = 138544130;
    uint64_t v48 = @"NowPlayingRequest.localPlaybackState";
    __int16 v49 = 2114;
    __int16 v50 = v6;
    __int16 v51 = 2114;
    id v52 = v36;
    __int16 v53 = 2048;
    __int16 v54 = v45;
    v40 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
    id v41 = v17;
    uint32_t v42 = 42;
LABEL_34:
    _os_log_error_impl(&dword_194F3C000, v41, OS_LOG_TYPE_ERROR, v40, buf, v42);

    goto LABEL_30;
  }
  if (v37)
  {
    uint64_t v38 = [MEMORY[0x1E4F1C9C8] date];
    [v38 timeIntervalSinceDate:v4];
    *(_DWORD *)long long buf = 138544386;
    uint64_t v48 = @"NowPlayingRequest.localPlaybackState";
    __int16 v49 = 2114;
    __int16 v50 = v6;
    __int16 v51 = 2114;
    id v52 = v36;
    __int16 v53 = 2114;
    __int16 v54 = v11;
    __int16 v55 = 2048;
    uint64_t v56 = v39;
    v40 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
    id v41 = v17;
    uint32_t v42 = 52;
    goto LABEL_34;
  }
LABEL_30:

  return uint64;
}

+ (NSArray)localSupportedCommands
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F1C000uLL;
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v5 UUIDString];

  id v7 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"NowPlayingRequest.localSupportedCommands", v6];
  id v8 = +[MROrigin localOrigin];

  if (v8)
  {
    id v9 = +[MROrigin localOrigin];
    [(__CFString *)v7 appendFormat:@" for %@", v9];
  }
  uint64_t v10 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v48 = v7;
    _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v11 = [a1 localNowPlayingPlayerPath];
  if (![v11 isResolved])
  {
    id v15 = 0;
    goto LABEL_9;
  }
  id v12 = +[MRNowPlayingOriginClientManager sharedManager];
  id v13 = [v12 playerClientRequestsForPlayerPath:v11];

  uint64_t v14 = [v13 supportedCommands];
  if (v14)
  {
    id v15 = (void *)v14;

    goto LABEL_9;
  }
  uint64_t v30 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138544130;
    uint64_t v48 = @"NowPlayingRequest.localSupportedCommands";
    __int16 v49 = 2114;
    __int16 v50 = v6;
    __int16 v51 = 2112;
    id v52 = 0;
    __int16 v53 = 2112;
    __int16 v54 = v4;
    _os_log_impl(&dword_194F3C000, v30, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
  }

  uint64_t v31 = MRCreateXPCMessage(0x200000000000030uLL);
  MRAddPlayerPathToXPCMessage(v31, v11);
  id v32 = +[MRMediaRemoteServiceClient sharedServiceClient];
  uint64_t v33 = [v32 service];
  uint64_t v34 = [v33 mrXPCConnection];
  id v46 = 0;
  uint64_t v35 = [v34 sendSyncMessage:v31 error:&v46];
  id v36 = v46;

  id v15 = (void *)MRCreateSupportedCommandsFromXPCMessage(v35);
  [v13 updateSupportedCommandsIfUninitialized:v15];

  if (!v36)
  {
    unint64_t v3 = 0x1E4F1C000;
LABEL_9:
    id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));

    id v17 = _MRLogForCategory(0xAuLL);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v11)
      {
        if (v18)
        {
          id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
          id v20 = [*(id *)(v3 + 2504) date];
          [v20 timeIntervalSinceDate:v4];
          *(_DWORD *)long long buf = 138544386;
          uint64_t v48 = @"NowPlayingRequest.localSupportedCommands";
          __int16 v49 = 2114;
          __int16 v50 = v6;
          __int16 v51 = 2112;
          id v52 = v19;
          __int16 v53 = 2114;
          __int16 v54 = v11;
          __int16 v55 = 2048;
          uint64_t v56 = v21;
          id v22 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
          id v23 = v17;
          uint32_t v24 = 52;
LABEL_18:
          _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);

LABEL_28:
        }
      }
      else if (v18)
      {
        id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        id v20 = [*(id *)(v3 + 2504) date];
        [v20 timeIntervalSinceDate:v4];
        *(_DWORD *)long long buf = 138544130;
        uint64_t v48 = @"NowPlayingRequest.localSupportedCommands";
        __int16 v49 = 2114;
        __int16 v50 = v6;
        __int16 v51 = 2112;
        id v52 = v19;
        __int16 v53 = 2048;
        __int16 v54 = v29;
        id v22 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        id v23 = v17;
        uint32_t v24 = 42;
        goto LABEL_18;
      }
LABEL_29:
      id v36 = 0;
      goto LABEL_30;
    }
    if (v11)
    {
      if (!v18) {
        goto LABEL_29;
      }
      id v19 = [*(id *)(v3 + 2504) date];
      [v19 timeIntervalSinceDate:v4];
      *(_DWORD *)long long buf = 138544130;
      uint64_t v48 = @"NowPlayingRequest.localSupportedCommands";
      __int16 v49 = 2114;
      __int16 v50 = v6;
      __int16 v51 = 2114;
      id v52 = v11;
      __int16 v53 = 2048;
      __int16 v54 = v25;
      uint64_t v26 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      uint64_t v27 = v17;
      uint32_t v28 = 42;
    }
    else
    {
      if (!v18) {
        goto LABEL_29;
      }
      id v19 = [*(id *)(v3 + 2504) date];
      [v19 timeIntervalSinceDate:v4];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v48 = @"NowPlayingRequest.localSupportedCommands";
      __int16 v49 = 2114;
      __int16 v50 = v6;
      __int16 v51 = 2048;
      id v52 = v43;
      uint64_t v26 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v27 = v17;
      uint32_t v28 = 32;
    }
    _os_log_impl(&dword_194F3C000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    goto LABEL_28;
  }
  id v17 = _MRLogForCategory(0xAuLL);
  BOOL v37 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    if (!v37) {
      goto LABEL_30;
    }
    uint64_t v38 = [MEMORY[0x1E4F1C9C8] date];
    [v38 timeIntervalSinceDate:v4];
    *(_DWORD *)long long buf = 138544386;
    uint64_t v48 = @"NowPlayingRequest.localSupportedCommands";
    __int16 v49 = 2114;
    __int16 v50 = v6;
    __int16 v51 = 2114;
    id v52 = v36;
    __int16 v53 = 2114;
    __int16 v54 = v11;
    __int16 v55 = 2048;
    uint64_t v56 = v39;
    v40 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
    id v41 = v17;
    uint32_t v42 = 52;
  }
  else
  {
    if (!v37) {
      goto LABEL_30;
    }
    uint64_t v38 = [MEMORY[0x1E4F1C9C8] date];
    [v38 timeIntervalSinceDate:v4];
    *(_DWORD *)long long buf = 138544130;
    uint64_t v48 = @"NowPlayingRequest.localSupportedCommands";
    __int16 v49 = 2114;
    __int16 v50 = v6;
    __int16 v51 = 2114;
    id v52 = v36;
    __int16 v53 = 2048;
    __int16 v54 = v45;
    v40 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
    id v41 = v17;
    uint32_t v42 = 42;
  }
  _os_log_error_impl(&dword_194F3C000, v41, OS_LOG_TYPE_ERROR, v40, buf, v42);

LABEL_30:

  return (NSArray *)v15;
}

+ (MRContentItem)localNowPlayingItem
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [v4 UUIDString];

  id v6 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"NowPlayingRequest.localNowPlayingItem", v5];
  id v7 = +[MROrigin localOrigin];

  if (v7)
  {
    id v8 = +[MROrigin localOrigin];
    [(__CFString *)v6 appendFormat:@" for %@", v8];
  }
  id v9 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    v60 = v6;
    _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v10 = [a1 localNowPlayingPlayerPath];
  if (![v10 isResolved])
  {
    id v24 = 0;
    goto LABEL_17;
  }
  uint64_t v57 = v5;
  uint64_t v11 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequest];
  id v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v12 UUIDString];
  [v11 setRequestIdentifier:v13];

  id v14 = [NSString alloc];
  id v15 = [MEMORY[0x1E4F28F80] processInfo];
  id v16 = [v15 processName];
  id v17 = (void *)[v14 initWithFormat:@"sync-%@-%d", v16, getpid()];
  [v11 setLabel:v17];

  BOOL v18 = +[MRNowPlayingOriginClientManager sharedManager];
  id v19 = [v18 playerClientRequestsForPlayerPath:v10];

  id v20 = [v19 playbackQueue];
  uint64_t v21 = MRPlaybackQueueCreateFromCache(v20, v11, 3, v10);

  id v22 = [v21 contentItemWithOffset:0];
  id v23 = v22;
  if (v22)
  {
    id v24 = v22;
    id v25 = 0;
  }
  else
  {
    uint64_t v26 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138544130;
      v60 = @"NowPlayingRequest.localNowPlayingItem";
      __int16 v61 = 2114;
      v62 = v57;
      __int16 v63 = 2112;
      id v64 = 0;
      __int16 v65 = 2112;
      v66 = v3;
      _os_log_impl(&dword_194F3C000, v26, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
    }

    MRCreateXPCMessage(0x200000000000007uLL);
    uint64_t v27 = v56 = v3;
    MRAddPlayerPathToXPCMessage(v27, v10);
    MRAddPlaybackQueueRequestToXPCMessage(v27, v11);
    __int16 v55 = +[MRMediaRemoteServiceClient sharedServiceClient];
    uint32_t v28 = [v55 service];
    BOOL v29 = [v28 mrXPCConnection];
    id v58 = 0;
    uint64_t v30 = [v29 sendSyncMessage:v27 error:&v58];
    id v25 = v58;

    uint64_t v31 = MRCreatePlaybackQueueFromXPCMessage(v30);
    id v24 = [(MRPlaybackQueue *)v31 contentItemWithOffset:0];
    [v19 updatePlaybackQueueIfUninitialized:v31];

    unint64_t v3 = v56;
  }

  if (!v25)
  {
    id v5 = v57;
LABEL_17:
    uint64_t v39 = MRContentItemCopyMinimalReadableDescription(v24);

    id v32 = _MRLogForCategory(0xAuLL);
    BOOL v40 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    if (v39)
    {
      if (v10)
      {
        if (v40)
        {
          id v41 = MRContentItemCopyMinimalReadableDescription(v24);
          uint32_t v42 = [MEMORY[0x1E4F1C9C8] date];
          [v42 timeIntervalSinceDate:v3];
          *(_DWORD *)long long buf = 138544386;
          v60 = @"NowPlayingRequest.localNowPlayingItem";
          __int16 v61 = 2114;
          v62 = v5;
          __int16 v63 = 2112;
          id v64 = v41;
          __int16 v65 = 2114;
          v66 = v10;
          __int16 v67 = 2048;
          uint64_t v68 = v43;
          id v44 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
          id v45 = v32;
          uint32_t v46 = 52;
LABEL_26:
          _os_log_impl(&dword_194F3C000, v45, OS_LOG_TYPE_DEFAULT, v44, buf, v46);

LABEL_33:
        }
      }
      else if (v40)
      {
        id v41 = MRContentItemCopyMinimalReadableDescription(v24);
        uint32_t v42 = [MEMORY[0x1E4F1C9C8] date];
        [v42 timeIntervalSinceDate:v3];
        *(_DWORD *)long long buf = 138544130;
        v60 = @"NowPlayingRequest.localNowPlayingItem";
        __int16 v61 = 2114;
        v62 = v5;
        __int16 v63 = 2112;
        id v64 = v41;
        __int16 v65 = 2048;
        v66 = v51;
        id v44 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        id v45 = v32;
        uint32_t v46 = 42;
        goto LABEL_26;
      }
LABEL_34:
      id v25 = 0;
      goto LABEL_35;
    }
    if (v10)
    {
      if (!v40) {
        goto LABEL_34;
      }
      id v41 = [MEMORY[0x1E4F1C9C8] date];
      [v41 timeIntervalSinceDate:v3];
      *(_DWORD *)long long buf = 138544130;
      v60 = @"NowPlayingRequest.localNowPlayingItem";
      __int16 v61 = 2114;
      v62 = v5;
      __int16 v63 = 2114;
      id v64 = v10;
      __int16 v65 = 2048;
      v66 = v47;
      uint64_t v48 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      __int16 v49 = v32;
      uint32_t v50 = 42;
    }
    else
    {
      if (!v40) {
        goto LABEL_34;
      }
      id v41 = [MEMORY[0x1E4F1C9C8] date];
      [v41 timeIntervalSinceDate:v3];
      *(_DWORD *)long long buf = 138543874;
      v60 = @"NowPlayingRequest.localNowPlayingItem";
      __int16 v61 = 2114;
      v62 = v5;
      __int16 v63 = 2048;
      id v64 = v53;
      uint64_t v48 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      __int16 v49 = v32;
      uint32_t v50 = 32;
    }
    _os_log_impl(&dword_194F3C000, v49, OS_LOG_TYPE_DEFAULT, v48, buf, v50);
    goto LABEL_33;
  }
  id v32 = _MRLogForCategory(0xAuLL);
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
  id v5 = v57;
  if (v10)
  {
    if (!v33) {
      goto LABEL_35;
    }
    uint64_t v34 = [MEMORY[0x1E4F1C9C8] date];
    [v34 timeIntervalSinceDate:v3];
    *(_DWORD *)long long buf = 138544386;
    v60 = @"NowPlayingRequest.localNowPlayingItem";
    __int16 v61 = 2114;
    v62 = v57;
    __int16 v63 = 2114;
    id v64 = v25;
    __int16 v65 = 2114;
    v66 = v10;
    __int16 v67 = 2048;
    uint64_t v68 = v35;
    id v36 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
    BOOL v37 = v32;
    uint32_t v38 = 52;
  }
  else
  {
    if (!v33) {
      goto LABEL_35;
    }
    uint64_t v34 = [MEMORY[0x1E4F1C9C8] date];
    [v34 timeIntervalSinceDate:v3];
    *(_DWORD *)long long buf = 138544130;
    v60 = @"NowPlayingRequest.localNowPlayingItem";
    __int16 v61 = 2114;
    v62 = v57;
    __int16 v63 = 2114;
    id v64 = v25;
    __int16 v65 = 2048;
    v66 = v52;
    id v36 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
    BOOL v37 = v32;
    uint32_t v38 = 42;
  }
  _os_log_error_impl(&dword_194F3C000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);

LABEL_35:

  return (MRContentItem *)v24;
}

+ (MRPlaybackQueue)localPlaybackQueue
{
  v7[1] = *MEMORY[0x1E4F143B8];
  int v2 = [a1 localNowPlayingItem];
  if (v2)
  {
    unint64_t v3 = [MRPlaybackQueue alloc];
    v7[0] = v2;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    id v5 = [(MRPlaybackQueue *)v3 initWithContentItems:v4 location:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (NSDate)localLastPlayingDate
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v4 = [v3 UUIDString];

  id v5 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"NowPlayingRequest.localLastPlayingDate", v4];
  id v6 = +[MROrigin localOrigin];

  if (v6)
  {
    id v7 = +[MROrigin localOrigin];
    [(__CFString *)v5 appendFormat:@" for %@", v7];
  }
  id v8 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v44 = v5;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v9 = [MRPlayerPath alloc];
  uint64_t v10 = +[MROrigin localOrigin];
  uint64_t v11 = [(MRPlayerPath *)v9 initWithOrigin:v10 client:0 player:0];

  id v12 = (void *)MRGetSharedService();
  id v42 = 0;
  id v13 = MRMediaRemoteServiceGetLastPlayingDateForPlayerSync(v12, v11, &v42);
  id v14 = (MRPlayerPath *)v42;
  id v15 = NSString;
  id v16 = NSNumber;
  [v13 timeIntervalSinceNow];
  BOOL v18 = [v16 numberWithDouble:-v17];
  [v15 stringWithFormat:@"deviceLastPlayingDate = %@. Time since playing = %@ seconds.", v13, v18];
  id v19 = (MRPlayerPath *)objc_claimAutoreleasedReturnValue();

  id v20 = _MRLogForCategory(0xAuLL);
  uint64_t v21 = v20;
  if (!v14 && v19)
  {
    BOOL v22 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v22)
      {
        id v23 = [MEMORY[0x1E4F1C9C8] date];
        [v23 timeIntervalSinceDate:v2];
        *(_DWORD *)long long buf = 138544386;
        id v44 = @"NowPlayingRequest.localLastPlayingDate";
        __int16 v45 = 2114;
        uint32_t v46 = v4;
        __int16 v47 = 2112;
        uint64_t v48 = v19;
        __int16 v49 = 2114;
        uint32_t v50 = v11;
        __int16 v51 = 2048;
        uint64_t v52 = v24;
        id v25 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        uint64_t v26 = v21;
        uint32_t v27 = 52;
LABEL_20:
        _os_log_impl(&dword_194F3C000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
LABEL_21:

      id v37 = v13;
      goto LABEL_24;
    }
    if (!v22) {
      goto LABEL_21;
    }
    id v23 = [MEMORY[0x1E4F1C9C8] date];
    [v23 timeIntervalSinceDate:v2];
    *(_DWORD *)long long buf = 138544130;
    id v44 = @"NowPlayingRequest.localLastPlayingDate";
    __int16 v45 = 2114;
    uint32_t v46 = v4;
    __int16 v47 = 2112;
    uint64_t v48 = v19;
    __int16 v49 = 2048;
    uint32_t v50 = v36;
    id v25 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_19:
    uint64_t v26 = v21;
    uint32_t v27 = 42;
    goto LABEL_20;
  }
  if (!v14)
  {
    BOOL v34 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (!v11)
    {
      if (!v34) {
        goto LABEL_21;
      }
      id v23 = [MEMORY[0x1E4F1C9C8] date];
      [v23 timeIntervalSinceDate:v2];
      *(_DWORD *)long long buf = 138543874;
      id v44 = @"NowPlayingRequest.localLastPlayingDate";
      __int16 v45 = 2114;
      uint32_t v46 = v4;
      __int16 v47 = 2048;
      uint64_t v48 = v40;
      id v25 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      uint64_t v26 = v21;
      uint32_t v27 = 32;
      goto LABEL_20;
    }
    if (!v34) {
      goto LABEL_21;
    }
    id v23 = [MEMORY[0x1E4F1C9C8] date];
    [v23 timeIntervalSinceDate:v2];
    *(_DWORD *)long long buf = 138544130;
    id v44 = @"NowPlayingRequest.localLastPlayingDate";
    __int16 v45 = 2114;
    uint32_t v46 = v4;
    __int16 v47 = 2114;
    uint64_t v48 = v11;
    __int16 v49 = 2048;
    uint32_t v50 = v35;
    id v25 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_19;
  }
  BOOL v28 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    if (v28)
    {
      BOOL v29 = [MEMORY[0x1E4F1C9C8] date];
      [v29 timeIntervalSinceDate:v2];
      *(_DWORD *)long long buf = 138544386;
      id v44 = @"NowPlayingRequest.localLastPlayingDate";
      __int16 v45 = 2114;
      uint32_t v46 = v4;
      __int16 v47 = 2114;
      uint64_t v48 = v14;
      __int16 v49 = 2114;
      uint32_t v50 = v11;
      __int16 v51 = 2048;
      uint64_t v52 = v30;
      uint64_t v31 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      id v32 = v21;
      uint32_t v33 = 52;
LABEL_30:
      _os_log_error_impl(&dword_194F3C000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
    }
  }
  else if (v28)
  {
    BOOL v29 = [MEMORY[0x1E4F1C9C8] date];
    [v29 timeIntervalSinceDate:v2];
    *(_DWORD *)long long buf = 138544130;
    id v44 = @"NowPlayingRequest.localLastPlayingDate";
    __int16 v45 = 2114;
    uint32_t v46 = v4;
    __int16 v47 = 2114;
    uint64_t v48 = v14;
    __int16 v49 = 2048;
    uint32_t v50 = v41;
    uint64_t v31 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
    id v32 = v21;
    uint32_t v33 = 42;
    goto LABEL_30;
  }

  id v37 = [MEMORY[0x1E4F1C9C8] distantPast];
LABEL_24:
  uint32_t v38 = v37;

  return (NSDate *)v38;
}

+ (MRPlayerPath)localNowPlayingPlayerPath
{
  int v2 = +[MRMediaRemoteServiceClient sharedServiceClient];
  unint64_t v3 = [MRPlayerPath alloc];
  uint64_t v4 = +[MROrigin localOrigin];
  id v5 = [(MRPlayerPath *)v3 initWithOrigin:v4 client:0 player:0];

  id v6 = [v2 activePlayerPath];
  if (v6
    && ([(MRPlayerPath *)v5 origin],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v6 origin],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 isEqual:v8],
        v8,
        v7,
        v9))
  {
    id v10 = v6;
  }
  else
  {
    uint64_t v11 = MRCreateXPCMessage(0x200000000000018uLL);
    MRAddPlayerPathToXPCMessage(v11, v5);
    id v12 = [v2 service];
    id v13 = [v12 mrXPCConnection];
    id v17 = 0;
    id v14 = [v13 sendSyncMessage:v11 error:&v17];
    id v15 = v17;

    MRCreatePlayerPathFromXPCMessage(v14);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (MRPlayerPath *)v10;
}

+ (MSVPair)isMostRecentMediaPlaybackRelevantReason
{
  unint64_t v3 = +[MRUserSettings currentSettings];
  [v3 mediaRecentlyPlayedInterval];
  uint64_t v4 = objc_msgSend(a1, "isMostRecentMediaPlaybackRelevantReasonWithinInternal:");

  return (MSVPair *)v4;
}

+ (BOOL)isMostRecentMediaPlaybackRelevantWithinInterval:(double)a3
{
  unint64_t v3 = [a1 isMostRecentMediaPlaybackRelevantReasonWithinInternal:a3];
  uint64_t v4 = [v3 first];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (id)isMostRecentMediaPlaybackRelevantReasonWithinInternal:(double)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  char v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = [v6 UUIDString];

  id v8 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"NowPlayingRequest.isMostRecentMediaPlaybackRelevant", v7];
  int v9 = +[MROrigin localOrigin];

  if (v9)
  {
    id v10 = +[MROrigin localOrigin];
    [(__CFString *)v8 appendFormat:@" for %@", v10];
  }
  uint64_t v11 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    __int16 v49 = v8;
    _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v12 = [a1 localNowPlayingPlayerPath];
  id v13 = [(__CFString *)v12 client];

  if (v13)
  {
    id v14 = [(__CFString *)v12 client];
    if ([v14 isAirPlay])
    {
    }
    else
    {
      uint64_t v15 = [a1 localNowPlayingItem];

      if (!v15)
      {
        id v16 = @"no now playing item";
        goto LABEL_19;
      }
    }
    id v17 = [a1 localLastPlayingDate];
    [v17 timeIntervalSinceNow];
    double v19 = v18;

    if (a3 <= 0.0 || (double v20 = -v19, v20 <= a3))
    {
      if ([a1 localIsPlaying]) {
        id v16 = @"local is playing";
      }
      else {
        id v16 = @"local was playing recently";
      }
      uint64_t v15 = 1;
      goto LABEL_19;
    }
    uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"no recent playback for %lf seconds", *(void *)&v20);
    if (v21)
    {
      id v16 = (__CFString *)v21;
      uint64_t v15 = 0;
      goto LABEL_19;
    }
    uint64_t v30 = [NSNumber numberWithBool:0];

    BOOL v22 = _MRLogForCategory(0xAuLL);
    BOOL v31 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v30)
    {
      if (v12)
      {
        if (v31)
        {
          id v32 = [NSNumber numberWithBool:0];
          uint32_t v33 = [MEMORY[0x1E4F1C9C8] date];
          [v33 timeIntervalSinceDate:v5];
          *(_DWORD *)long long buf = 138544386;
          __int16 v49 = @"NowPlayingRequest.isMostRecentMediaPlaybackRelevant";
          __int16 v50 = 2114;
          __int16 v51 = v7;
          __int16 v52 = 2112;
          uint64_t v53 = v32;
          __int16 v54 = 2114;
          __int16 v55 = v12;
          __int16 v56 = 2048;
          uint64_t v57 = v34;
          uint64_t v35 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
          id v36 = v22;
          uint32_t v37 = 52;
LABEL_34:
          _os_log_impl(&dword_194F3C000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);

LABEL_38:
        }
      }
      else if (v31)
      {
        id v32 = [NSNumber numberWithBool:0];
        uint32_t v33 = [MEMORY[0x1E4F1C9C8] date];
        [v33 timeIntervalSinceDate:v5];
        *(_DWORD *)long long buf = 138544130;
        __int16 v49 = @"NowPlayingRequest.isMostRecentMediaPlaybackRelevant";
        __int16 v50 = 2114;
        __int16 v51 = v7;
        __int16 v52 = 2112;
        uint64_t v53 = v32;
        __int16 v54 = 2048;
        __int16 v55 = v42;
        uint64_t v35 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        id v36 = v22;
        uint32_t v37 = 42;
        goto LABEL_34;
      }
LABEL_39:
      id v16 = 0;
      uint64_t v15 = 0;
      goto LABEL_40;
    }
    if (v12)
    {
      if (!v31) {
        goto LABEL_39;
      }
      id v32 = [MEMORY[0x1E4F1C9C8] date];
      [(__CFString *)v32 timeIntervalSinceDate:v5];
      *(_DWORD *)long long buf = 138544130;
      __int16 v49 = @"NowPlayingRequest.isMostRecentMediaPlaybackRelevant";
      __int16 v50 = 2114;
      __int16 v51 = v7;
      __int16 v52 = 2114;
      uint64_t v53 = v12;
      __int16 v54 = 2048;
      __int16 v55 = v38;
      uint64_t v39 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      BOOL v40 = v22;
      uint32_t v41 = 42;
    }
    else
    {
      if (!v31) {
        goto LABEL_39;
      }
      id v32 = [MEMORY[0x1E4F1C9C8] date];
      [(__CFString *)v32 timeIntervalSinceDate:v5];
      *(_DWORD *)long long buf = 138543874;
      __int16 v49 = @"NowPlayingRequest.isMostRecentMediaPlaybackRelevant";
      __int16 v50 = 2114;
      __int16 v51 = v7;
      __int16 v52 = 2048;
      uint64_t v53 = v43;
      uint64_t v39 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      BOOL v40 = v22;
      uint32_t v41 = 32;
    }
    _os_log_impl(&dword_194F3C000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
    goto LABEL_38;
  }
  uint64_t v15 = 0;
  id v16 = @"no now playing app";
LABEL_19:
  BOOL v22 = _MRLogForCategory(0xAuLL);
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
  if (v12)
  {
    if (!v23) {
      goto LABEL_40;
    }
    uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
    [v24 timeIntervalSinceDate:v5];
    *(_DWORD *)long long buf = 138544386;
    __int16 v49 = @"NowPlayingRequest.isMostRecentMediaPlaybackRelevant";
    __int16 v50 = 2114;
    __int16 v51 = v7;
    __int16 v52 = 2114;
    uint64_t v53 = v16;
    __int16 v54 = 2114;
    __int16 v55 = v12;
    __int16 v56 = 2048;
    uint64_t v57 = v25;
    uint64_t v26 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
    uint32_t v27 = v22;
    uint32_t v28 = 52;
  }
  else
  {
    if (!v23) {
      goto LABEL_40;
    }
    uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
    [v24 timeIntervalSinceDate:v5];
    *(_DWORD *)long long buf = 138544130;
    __int16 v49 = @"NowPlayingRequest.isMostRecentMediaPlaybackRelevant";
    __int16 v50 = 2114;
    __int16 v51 = v7;
    __int16 v52 = 2114;
    uint64_t v53 = v16;
    __int16 v54 = 2048;
    __int16 v55 = v29;
    uint64_t v26 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
    uint32_t v27 = v22;
    uint32_t v28 = 42;
  }
  _os_log_error_impl(&dword_194F3C000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);

LABEL_40:
  id v44 = objc_alloc(MEMORY[0x1E4F779D8]);
  __int16 v45 = [NSNumber numberWithBool:v15];
  uint32_t v46 = (void *)[v44 initWithFirst:v45 second:v16];

  return v46;
}

- (MRDestination)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
}

+ (void)shouldUseQuickControlsToDisplayPlatterForRouteIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __97__MRNowPlayingRequest_Siri__shouldUseQuickControlsToDisplayPlatterForRouteIdentifier_completion___block_invoke;
  v18[3] = &unk_1E57D64A0;
  id v8 = v5;
  id v19 = v8;
  id v20 = v7;
  id v21 = v6;
  id v9 = v6;
  id v10 = v7;
  uint64_t v11 = (void *)MEMORY[0x1997190F0](v18);
  id v12 = +[MRNowPlayingOriginClientManager sharedManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__MRNowPlayingRequest_Siri__shouldUseQuickControlsToDisplayPlatterForRouteIdentifier_completion___block_invoke_9;
  v15[3] = &unk_1E57D64C8;
  id v16 = v8;
  id v17 = v11;
  id v13 = v11;
  id v14 = v8;
  [v12 resolveActiveSystemEndpointWithType:1 timeout:MEMORY[0x1E4F14428] queue:v15 completion:2.0];
}

uint64_t __97__MRNowPlayingRequest_Siri__shouldUseQuickControlsToDisplayPlatterForRouteIdentifier_completion___block_invoke(void *a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _MRLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceDate:a1[5]];
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingRequest] shouldUseQuickControlsToDisplayPlatterForRouteIdentifier: %{public}@ returned %{BOOL}u in %lf seconds.", (uint8_t *)&v9, 0x1Cu);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __97__MRNowPlayingRequest_Siri__shouldUseQuickControlsToDisplayPlatterForRouteIdentifier_completion___block_invoke_9(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 isEqualToString:@"MRNowPlayingRequestLocalRouteIdentifier"];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v5) {
    uint64_t v7 = [v4 isLocalEndpoint];
  }
  else {
    uint64_t v7 = [v4 containsOutputDeviceWithUID:*(void *)(a1 + 32)];
  }
  uint64_t v8 = v7;

  int v9 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 16);

  return v9(v6, v8);
}

+ (void)homePlatterPreferredRouteIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = (void (**)(id, void *))a3;
  int v5 = [v3 date];
  uint64_t v6 = +[MRNowPlayingOriginClientManager sharedManager];
  uint64_t v7 = [v6 activeSystemEndpointOutputDeviceUIDForType:0];

  uint64_t v8 = +[MRAVOutputDevice localDeviceUID];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {

    uint64_t v7 = 0;
  }
  uint64_t v10 = _MRLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:v5];
    int v13 = 138543618;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v12;
    _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingRequest] homePlatterPreferredRouteIdentifier returned %{public}@ in %lf seconds.", (uint8_t *)&v13, 0x16u);
  }
  v4[2](v4, v7);
}

- (void)suspendDisconnectionPauseForConfiguration:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[MRMediaRemoteServiceClient sharedServiceClient];
  id v11 = [v10 service];

  [v11 suspendDisconnectionPauseForConfiguration:v9 queue:v8 completion:v7];
}

void __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_14_cold_1(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 56)];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, v9);
}

void __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_cold_1(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 48)];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, v9);
}

@end