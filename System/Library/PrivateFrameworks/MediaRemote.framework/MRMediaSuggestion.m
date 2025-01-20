@interface MRMediaSuggestion
- (BOOL)isEqual:(id)a3;
- (MRArtwork)artwork;
- (MRMediaSuggestion)initWithIntent:(id)a3;
- (NSString)artist;
- (NSString)bundleID;
- (NSString)identifier;
- (NSString)title;
- (__CFString)_identifierForQueuePlayback;
- (dispatch_queue_t)_callbackQueue;
- (id)_intentForQueuePlayback;
- (id)_processedIntent;
- (id)_processedIntentWithRouteIdentifiers:(uint64_t)a1;
- (id)description;
- (uint64_t)_originatedFromSystemMediaApp;
- (unint64_t)hash;
- (void)_confirmIntent:(void *)a3 intentHandler:;
- (void)_handleIntentWithProxy:(void *)a3 completion:;
- (void)_playIntent:(void *)a3 completion:;
- (void)_playIntent:(void *)a3 onEndpoint:(void *)a4 queue:(void *)a5 completion:;
- (void)_playIntentRemotelyAsPlaybackQueue:(void *)a3 endpoint:(void *)a4 queue:(void *)a5 completion:;
- (void)_playIntentRemotelyWithAirPlay:(void *)a3 destinationDevices:(void *)a4 queue:(void *)a5 completion:;
- (void)playOnDeviceWithUID:(id)a3 completion:(id)a4;
- (void)playOnEndpoint:(id)a3 completion:(id)a4;
- (void)playWithAirPlayRouteIdentifiers:(id)a3 completion:(id)a4;
- (void)playWithCompletion:(id)a3;
- (void)setArtwork:(uint64_t)a1;
- (void)setBundleID:(uint64_t)a1;
@end

@implementation MRMediaSuggestion

- (MRMediaSuggestion)initWithIntent:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRMediaSuggestion;
  v6 = [(MRMediaSuggestion *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_intent, a3);
    uint64_t v8 = [(INPlayMediaIntent *)v7->_intent mediaContainer];
    container = v7->_container;
    v7->_container = (INMediaItem *)v8;
  }
  return v7;
}

- (NSString)identifier
{
  return [(INMediaItem *)self->_container identifier];
}

- (NSString)title
{
  return [(INMediaItem *)self->_container title];
}

- (NSString)artist
{
  return [(INMediaItem *)self->_container artist];
}

- (id)description
{
  id v17 = [NSString alloc];
  uint64_t v16 = objc_opt_class();
  v18 = [(MRMediaSuggestion *)self bundleID];
  v3 = [(MRMediaSuggestion *)self identifier];
  v4 = [(MRMediaSuggestion *)self title];
  id v5 = [(MRMediaSuggestion *)self artist];
  if (self) {
    intent = self->_intent;
  }
  else {
    intent = 0;
  }
  v7 = [(INPlayMediaIntent *)intent mediaContainer];
  uint64_t v8 = [v7 artwork];
  v9 = @"NO";
  if (v8) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  objc_super v11 = [(MRMediaSuggestion *)self artwork];
  if (v11) {
    v9 = @"YES";
  }
  v12 = [(MRMediaSuggestion *)self artwork];
  v13 = [v12 imageData];
  v14 = (void *)[v17 initWithFormat:@"<%@: source=%@, identifier=%@, title=%@, artist=%@, intentHasArt=%@, artLoaded=%@, artSize: %ld>", v16, v18, v3, v4, v5, v10, v9, objc_msgSend(v13, "length")];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MRMediaSuggestion *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(MRMediaSuggestion *)self identifier];
      v7 = [(MRMediaSuggestion *)v5 identifier];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        uint64_t v8 = [(MRMediaSuggestion *)self identifier];
        v9 = [(MRMediaSuggestion *)v5 identifier];
        char v10 = [v8 isEqualToString:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(MRMediaSuggestion *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (uint64_t)_originatedFromSystemMediaApp
{
  if (result)
  {
    v1 = [(id)result bundleID];

    if (MRMediaRemoteApplicationIsSystemMediaApplication((uint64_t)v1))
    {
      return 1;
    }
    else
    {
      return MRMediaRemoteApplicationIsSystemPodcastApplication((uint64_t)v1);
    }
  }
  return result;
}

- (__CFString)_identifierForQueuePlayback
{
  if (a1)
  {
    v2 = [(__CFString *)a1 bundleID];

    if (MRMediaRemoteApplicationIsSystemMediaApplication((uint64_t)v2))
    {
      unint64_t v3 = kMRMediaRemoteSystemMediaApplicationDisplayIdentifier;
    }
    else if (MRMediaRemoteApplicationIsSystemPodcastApplication((uint64_t)v2))
    {
      unint64_t v3 = kMRMediaRemoteSystemPodcastApplicationDisplayIdentifier;
    }
    else
    {
      if (!MRMediaRemoteApplicationIsSystemBooksApplication((uint64_t)v2))
      {
        a1 = 0;
        goto LABEL_9;
      }
      unint64_t v3 = kMRMediaRemoteSystemBooksApplicationDisplayIdentifier;
    }
    a1 = *v3;
LABEL_9:
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_processedIntent
{
  if (a1)
  {
    uint64_t v1 = (void *)[*(id *)(a1 + 32) copy];
    [v1 _setAirPlayRouteIds:0];
    [v1 setMediaItems:0];
    [v1 setPlayShuffled:0];
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

- (id)_processedIntentWithRouteIdentifiers:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = (void *)[v3 copy];
    [v5 _setAirPlayRouteIds:v4];

    [v5 setMediaItems:0];
    [v5 setPlayShuffled:0];
    if (-[MRMediaSuggestion _originatedFromSystemMediaApp](a1))
    {
      v6 = [v5 privatePlayMediaIntentData];
      id v20 = objc_alloc(getINPrivatePlayMediaIntentDataClass());
      v23 = [v6 appSelectionEnabled];
      v25 = [v6 appInferred];
      v24 = [v6 audioSearchResults];
      v19 = [v6 privateMediaIntentData];
      v18 = [v6 appSelectionSignalsEnabled];
      id v17 = [v6 appSelectionSignalsFrequencyDenominator];
      v22 = [v6 immediatelyStartPlayback];
      v21 = [v6 isAmbiguousPlay];
      uint64_t v16 = [v6 isPersonalizedRequest];
      v15 = [v6 internalSignals];
      v7 = [v6 entityConfidenceSignalsEnabled];
      v14 = [v6 entityConfidenceSignalsFrequencyDenominatorInternal];
      uint64_t v8 = [v6 entityConfidenceSignalsFrequencyDenominatorProd];
      v13 = [v6 entityConfidenceSignalsMaxItemsToDisambiguate];
      v9 = [v6 alternativeProviderBundleIdentifier];
      char v10 = [v6 ampPAFDataSetID];
      objc_super v11 = objc_msgSend(v20, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:", v23, v25, v24, v19, v18, v17, MEMORY[0x1E4F1CC38], v22, v21, v16, v15, v7, v14,
                      v8,
                      v13,
                      v9,
                      v10);
      [v5 setPrivatePlayMediaIntentData:v11];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_intentForQueuePlayback
{
  if (a1)
  {
    uint64_t v1 = -[MRMediaSuggestion _processedIntent](a1);
    id v16 = objc_alloc(getINMediaItemClass());
    v21 = [v1 mediaContainer];
    id v20 = [v21 identifier];
    v22 = [v20 stringByAppendingString:@"&includePlaybackQueue=true"];
    v19 = [v1 mediaContainer];
    v14 = [v19 title];
    v18 = [v1 mediaContainer];
    uint64_t v13 = [v18 type];
    id v17 = [v1 mediaContainer];
    v2 = [v17 artwork];
    v15 = [v1 mediaContainer];
    uint64_t v3 = [v15 artist];
    id v4 = [v1 mediaContainer];
    id v5 = [v4 topics];
    v6 = [v1 mediaContainer];
    v7 = [v6 namedEntities];
    uint64_t v8 = [v1 mediaContainer];
    v9 = [v8 privateMediaItemValueData];
    char v10 = (void *)v3;
    objc_super v11 = (void *)[v16 initWithIdentifier:v22 title:v14 type:v13 artwork:v2 artist:v3 topics:v5 namedEntities:v7 privateMediaItemValueData:v9];
    [v1 setMediaContainer:v11];
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

- (dispatch_queue_t)_callbackQueue
{
  if (a1)
  {
    uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.mediaremote.MRMediaSuggestion.callbackQueue", v1);
  }
  else
  {
    dispatch_queue_t v2 = 0;
  }

  return v2;
}

- (void)playWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = -[MRMediaSuggestion _processedIntent]((uint64_t)self);
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__MRMediaSuggestion_playWithCompletion___block_invoke;
  v9[3] = &unk_1E57D10A8;
  id v10 = v6;
  objc_super v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v6;
  -[MRMediaSuggestion _playIntent:completion:]((uint64_t)self, v5, v9);
}

void __40__MRMediaSuggestion_playWithCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:a1[4]];
  uint64_t v6 = v5;

  if (!v3)
  {
    id v7 = _MRLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[5];
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestion] %{public}@ began playback after %f seconds.", (uint8_t *)&v9, 0x16u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_playIntent:(void *)a3 completion:
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__MRMediaSuggestion__playIntent_completion___block_invoke;
    v7[3] = &unk_1E57D11E8;
    v7[4] = a1;
    id v8 = v5;
    -[MRMediaSuggestion _confirmIntent:intentHandler:](a1, a2, v7);
  }
}

- (void)playOnDeviceWithUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[MRMediaSuggestion _processedIntent]((uint64_t)self);
  int v9 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  uint64_t v10 = -[MRMediaSuggestion _callbackQueue]((uint64_t)self);
  __int16 v11 = [MEMORY[0x1E4F1C9C8] date];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__MRMediaSuggestion_playOnDeviceWithUID_completion___block_invoke;
  v27[3] = &unk_1E57D10A8;
  id v28 = v11;
  v29 = self;
  id v12 = v6;
  id v30 = v12;
  id v13 = v11;
  v14 = (void *)MEMORY[0x1997190F0](v27);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__MRMediaSuggestion_playOnDeviceWithUID_completion___block_invoke_17;
  v20[3] = &unk_1E57D10D0;
  v21 = v9;
  v22 = self;
  id v23 = v8;
  id v24 = v10;
  id v25 = v12;
  id v26 = v14;
  id v15 = v14;
  id v16 = v10;
  id v17 = v8;
  id v18 = v12;
  v19 = v9;
  [(MRAVLightweightReconnaissanceSession *)v19 searchForOutputDeviceUID:v7 timeout:@"Searching for output device to play MRMediaSuggestion." reason:v16 queue:v20 completion:5.0];
}

void __52__MRMediaSuggestion_playOnDeviceWithUID_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:a1[4]];
  uint64_t v6 = v5;

  if (!v3)
  {
    id v7 = _MRLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[5];
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestion] %{public}@ began playback after %f seconds.", (uint8_t *)&v9, 0x16u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __52__MRMediaSuggestion_playOnDeviceWithUID_completion___block_invoke_17(uint64_t a1, void *a2, uint64_t a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v7 = [v5 endpoint];
    if (v7
      && (uint64_t v8 = (void *)v7,
          int v9 = -[MRMediaSuggestion _originatedFromSystemMediaApp](*(void *)(a1 + 40)),
          v8,
          v9))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      __int16 v11 = *(void **)(a1 + 48);
      uint64_t v12 = [v5 endpoint];
      -[MRMediaSuggestion _playIntent:onEndpoint:queue:completion:](v10, v11, v12, *(void **)(a1 + 56), *(void **)(a1 + 72));
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 40);
      v14 = *(void **)(a1 + 48);
      v15[0] = v5;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      -[MRMediaSuggestion _playIntentRemotelyWithAirPlay:destinationDevices:queue:completion:](v13, v14, v12, *(void **)(a1 + 56), *(void **)(a1 + 72));
    }
  }
}

- (void)_playIntent:(void *)a3 onEndpoint:(void *)a4 queue:(void *)a5 completion:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    id v20 = @"MREndpointConnectionReasonUserInfoKey";
    v21[0] = @"MRMediaSuggestion";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__MRMediaSuggestion__playIntent_onEndpoint_queue_completion___block_invoke;
    v14[3] = &unk_1E57D1120;
    id v15 = v11;
    id v19 = v12;
    uint64_t v16 = a1;
    id v17 = v9;
    id v18 = v10;
    [v18 connectToExternalDeviceWithUserInfo:v13 completion:v14];
  }
}

- (void)_playIntentRemotelyWithAirPlay:(void *)a3 destinationDevices:(void *)a4 queue:(void *)a5 completion:
{
  id v9 = a2;
  id v10 = a5;
  if (a1)
  {
    id v11 = a4;
    id v12 = a3;
    uint64_t v13 = +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__MRMediaSuggestion__playIntentRemotelyWithAirPlay_destinationDevices_queue_completion___block_invoke;
    v14[3] = &unk_1E57D11C0;
    id v16 = v10;
    void v14[4] = a1;
    id v15 = v9;
    [v13 setOutputDevices:v12 initiator:@"MRMediaSuggestion setting output devices." withReplyQueue:v11 completion:v14];
  }
}

- (void)playWithAirPlayRouteIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = -[MRMediaSuggestion _processedIntentWithRouteIdentifiers:]((uint64_t)self, a3);
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__MRMediaSuggestion_playWithAirPlayRouteIdentifiers_completion___block_invoke;
  v11[3] = &unk_1E57D10A8;
  id v12 = v8;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v8;
  -[MRMediaSuggestion _playIntent:completion:]((uint64_t)self, v7, v11);
}

void __64__MRMediaSuggestion_playWithAirPlayRouteIdentifiers_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:a1[4]];
  uint64_t v6 = v5;

  if (!v3)
  {
    uint64_t v7 = _MRLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[5];
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestion] %{public}@ began playback after %f seconds.", (uint8_t *)&v9, 0x16u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)playOnEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isLocalEndpoint])
  {
    [(MRMediaSuggestion *)self playWithCompletion:v7];
  }
  else
  {
    uint64_t v8 = -[MRMediaSuggestion _processedIntent]((uint64_t)self);
    int v9 = [MEMORY[0x1E4F1C9C8] date];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __47__MRMediaSuggestion_playOnEndpoint_completion___block_invoke;
    v17[3] = &unk_1E57D10A8;
    id v10 = v9;
    id v18 = v10;
    id v19 = self;
    id v20 = v7;
    __int16 v11 = (void *)MEMORY[0x1997190F0](v17);
    if (-[MRMediaSuggestion _originatedFromSystemMediaApp]((uint64_t)self))
    {
      uint64_t v12 = -[MRMediaSuggestion _callbackQueue]((uint64_t)self);
      -[MRMediaSuggestion _playIntent:onEndpoint:queue:completion:]((uint64_t)self, v8, v6, v12, v11);
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F1CA48];
      id v14 = [v6 outputDevices];
      uint64_t v12 = [v13 arrayWithArray:v14];

      if ([v6 isProxyGroupPlayer])
      {
        id v15 = [v6 designatedGroupLeader];
        [v12 removeObject:v15];
      }
      id v16 = -[MRMediaSuggestion _callbackQueue]((uint64_t)self);
      -[MRMediaSuggestion _playIntentRemotelyWithAirPlay:destinationDevices:queue:completion:]((uint64_t)self, v8, v12, v16, v11);
    }
  }
}

void __47__MRMediaSuggestion_playOnEndpoint_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:a1[4]];
  uint64_t v6 = v5;

  if (!v3)
  {
    id v7 = _MRLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[5];
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestion] %{public}@ began playback after %f seconds.", (uint8_t *)&v9, 0x16u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __61__MRMediaSuggestion__playIntent_onEndpoint_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__MRMediaSuggestion__playIntent_onEndpoint_queue_completion___block_invoke_2;
  v9[3] = &unk_1E57D10F8;
  id v10 = v3;
  id v5 = *(id *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v15 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 32);
  id v8 = v3;
  dispatch_async(v4, v9);
}

void __61__MRMediaSuggestion__playIntent_onEndpoint_queue_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else {
    -[MRMediaSuggestion _playIntentRemotelyAsPlaybackQueue:endpoint:queue:completion:](*(void *)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 72));
  }
}

- (void)_playIntentRemotelyAsPlaybackQueue:(void *)a3 endpoint:(void *)a4 queue:(void *)a5 completion:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    id v13 = -[MRMediaSuggestion _intentForQueuePlayback](a1);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__MRMediaSuggestion__playIntentRemotelyAsPlaybackQueue_endpoint_queue_completion___block_invoke;
    v14[3] = &unk_1E57D1198;
    id v18 = v12;
    void v14[4] = a1;
    id v15 = v10;
    id v16 = v11;
    id v17 = v9;
    -[MRMediaSuggestion _confirmIntent:intentHandler:](a1, v13, v14);
  }
}

void __82__MRMediaSuggestion__playIntentRemotelyAsPlaybackQueue_endpoint_queue_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v6();
  }
  else
  {
    id v7 = [a4 objectForKeyedSubscript:@"kMRMediaRemoteOptionSystemAppPlaybackQueueData"];
    if (v7)
    {
      id v8 = [MRClient alloc];
      id v9 = -[MRMediaSuggestion _identifierForQueuePlayback](*(__CFString **)(a1 + 32));
      id v10 = [(MRClient *)v8 initWithBundleIdentifier:v9];

      id v11 = [MRPlayerPath alloc];
      id v12 = [*(id *)(a1 + 40) origin];
      id v13 = [(MRPlayerPath *)v11 initWithOrigin:v12 client:v10 player:0];

      id v28 = @"kMRMediaRemoteOptionSystemAppPlaybackQueueData";
      v29[0] = v7;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      id v15 = *(void **)(a1 + 48);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __82__MRMediaSuggestion__playIntentRemotelyAsPlaybackQueue_endpoint_queue_completion___block_invoke_2;
      v22[3] = &unk_1E57D1170;
      id v25 = *(id *)(a1 + 64);
      v22[4] = *(void *)(a1 + 32);
      id v23 = v13;
      id v24 = *(id *)(a1 + 56);
      id v16 = v13;
      MRMediaRemoteSendCommandToPlayer(122, v14, v16, 1, v15, v22);
    }
    else
    {
      id v17 = _MRLogForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v27 = v18;
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestion] %{public}@ did not receive queue data. Falling back to AirPlay path.", buf, 0xCu);
      }

      id v19 = (void *)MEMORY[0x1E4F1CA48];
      id v20 = [*(id *)(a1 + 40) outputDevices];
      id v10 = [v19 arrayWithArray:v20];

      if ([*(id *)(a1 + 40) isProxyGroupPlayer])
      {
        v21 = [*(id *)(a1 + 40) designatedGroupLeader];
        [(MRClient *)v10 removeObject:v21];
      }
      -[MRMediaSuggestion _playIntentRemotelyWithAirPlay:destinationDevices:queue:completion:](*(void *)(a1 + 32), *(void **)(a1 + 56), v10, *(void **)(a1 + 48), *(void **)(a1 + 64));
    }
  }
}

void __82__MRMediaSuggestion__playIntentRemotelyAsPlaybackQueue_endpoint_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v5 = _MRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestion] %{public}@ successfully sent as queue to %{public}@.", buf, 0x16u);
    }

    id v8 = (void *)[objc_alloc((Class)getINInteractionClass[0]()) initWithIntent:*(void *)(a1 + 48) response:0];
    id v9 = [*(id *)(a1 + 32) bundleID];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__MRMediaSuggestion__playIntentRemotelyAsPlaybackQueue_endpoint_queue_completion___block_invoke_28;
    v10[3] = &unk_1E57D1148;
    v10[4] = *(void *)(a1 + 32);
    [v8 _donateInteractionWithBundleId:v9 completion:v10];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __82__MRMediaSuggestion__playIntentRemotelyAsPlaybackQueue_endpoint_queue_completion___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _MRLogForCategory(0);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6) {
        uint64_t v7 = *(void *)(v6 + 32);
      }
      else {
        uint64_t v7 = 0;
      }
      int v13 = 138543874;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      id v18 = v3;
      id v8 = "[MRMediaSuggestion] %{public}@ failed to re-donate intent %{public}@ with error %{public}@";
      id v9 = v4;
      uint32_t v10 = 32;
LABEL_10:
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }
  else if (v5)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      uint64_t v12 = *(void *)(v11 + 32);
    }
    else {
      uint64_t v12 = 0;
    }
    int v13 = 138543618;
    uint64_t v14 = v11;
    __int16 v15 = 2114;
    uint64_t v16 = v12;
    id v8 = "[MRMediaSuggestion] %{public}@ re-donated intent %{public}@";
    id v9 = v4;
    uint32_t v10 = 22;
    goto LABEL_10;
  }
}

- (void)_confirmIntent:(void *)a3 intentHandler:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = (Class (__cdecl *)())getINCExtensionConnectionClass;
    id v7 = a2;
    id v8 = (void *)[objc_alloc(v6()) initWithIntent:v7];

    [v8 setRequiresTCC:0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__MRMediaSuggestion__confirmIntent_intentHandler___block_invoke;
    v14[3] = &unk_1E57D0FE8;
    id v9 = v5;
    id v15 = v9;
    [v8 setInterruptionHandler:v14];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__MRMediaSuggestion__confirmIntent_intentHandler___block_invoke_2;
    v11[3] = &unk_1E57D1260;
    id v12 = v8;
    id v13 = v9;
    id v10 = v8;
    [v10 resumeWithCompletionHandler:v11];
  }
}

void __88__MRMediaSuggestion__playIntentRemotelyWithAirPlay_destinationDevices_queue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    -[MRMediaSuggestion _playIntent:completion:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
}

void __44__MRMediaSuggestion__playIntent_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    -[MRMediaSuggestion _handleIntentWithProxy:completion:](*(void *)(a1 + 32), a3, *(void **)(a1 + 40));
  }
}

- (void)_handleIntentWithProxy:(void *)a3 completion:
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__MRMediaSuggestion__handleIntentWithProxy_completion___block_invoke;
    v7[3] = &unk_1E57D1210;
    id v8 = v5;
    [a2 handleIntentWithCompletionHandler:v7];
  }
}

void __55__MRMediaSuggestion__handleIntentWithProxy_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 underlyingError];
    if (v6)
    {
      uint64_t v10 = *MEMORY[0x1E4F28A50];
      id v7 = [v5 underlyingError];
      v11[0] = v7;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    }
    else
    {
      id v8 = 0;
    }

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:172 userInfo:v8];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __50__MRMediaSuggestion__confirmIntent_intentHandler___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v7 = *MEMORY[0x1E4F28A50];
    v8[0] = v3;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:173 userInfo:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__MRMediaSuggestion__confirmIntent_intentHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) reset];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__MRMediaSuggestion__confirmIntent_intentHandler___block_invoke_3;
    v7[3] = &unk_1E57D1238;
    id v8 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v9 = v5;
    [v9 confirmIntentWithCompletionHandler:v7];
  }
}

void __50__MRMediaSuggestion__confirmIntent_intentHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 underlyingError];
    if (v8)
    {
      uint64_t v22 = *MEMORY[0x1E4F28A50];
      id v9 = [v7 underlyingError];
      v23[0] = v9;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    }
    else
    {
      id v10 = 0;
    }

    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:171 userInfo:v10];
    [*(id *)(a1 + 32) reset];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_13:
    goto LABEL_14;
  }
  getINPlayMediaIntentResponseClass();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v5;
    if ([v10 code] == 1 || objc_msgSend(v10, "code") == 4)
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = [v10 nowPlayingInfo];
      (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void))(v11 + 16))(v11, v13, v12, v14, 0);
    }
    else
    {
      [*(id *)(a1 + 32) reset];
      uint64_t v21 = *(void *)(a1 + 48);
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:171, @"Intent cannot be handled by extension. Expected response code INPlayMediaIntentResponseCodeReady or INPlayMediaIntentResponseCodeSuccess, got %ld.", objc_msgSend(v10, "code") format];
      (*(void (**)(uint64_t, void, void, void, void *))(v21 + 16))(v21, 0, 0, 0, v14);
    }

    goto LABEL_13;
  }
  [*(id *)(a1 + 32) reset];
  uint64_t v16 = *(void *)(a1 + 48);
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = NSStringFromClass(v18);
  id v20 = (void *)[v17 initWithMRError:171, @"Expected response of type INPlayMediaIntentResponse. Got %@.", v19 format];
  (*(void (**)(uint64_t, void, void, void, void *))(v16 + 16))(v16, 0, 0, 0, v20);

LABEL_14:
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (MRArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end