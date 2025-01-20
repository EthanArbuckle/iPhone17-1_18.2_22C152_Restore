@interface TUAudioSystemController
+ (BOOL)isPhoneCallAudioCategory:(id)a3;
+ (TUAudioSystemController)sharedAudioSystemController;
+ (id)filteredPickableRoutesFromPickableRoutes:(id)a3;
+ (id)sharedSystemController;
+ (id)sourceIdentifierForRouteID:(id)a3;
- (BOOL)isDownlinkMuted;
- (BOOL)isTTY;
- (BOOL)isUplinkMuted;
- (BOOL)otherSessionsRequestNoRingtoneInterruption;
- (BOOL)pickRoute:(id)a3 error:(id *)a4;
- (BOOL)shouldSuppressCallUsingRoute:(id)a3;
- (NSArray)bestGuessPickableRoutesForAnyCall;
- (NSArray)pickableRoutesForTTY;
- (NSDictionary)pickedRouteAttribute;
- (TUAudioSystemController)init;
- (TUAudioSystemControllerDelegate)delegate;
- (double)activeCategoryVolume;
- (float)activeCategoryVolume;
- (id)_pickableRoutesForPhoneCallWithForceNewRequest:(BOOL)a3;
- (id)_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:(BOOL)a3;
- (id)_pickableRoutesForPlayAndRecordVideoWithForceNewRequest:(BOOL)a3;
- (id)_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:(BOOL)a3;
- (id)_pickableRoutesForTTYWithForceNewRequest:(BOOL)a3;
- (id)_pickableRoutesForVoiceMailWithForceNewRequest:(BOOL)a3;
- (id)currentlyPickedRouteIdForCategory:(id)a3 andMode:(id)a4;
- (id)pickableRouteWithUniqueIdentifier:(id)a3;
- (id)pickableRoutesForActiveCall;
- (id)pickableRoutesForCategory:(id)a3 andMode:(id)a4;
- (void)_getPickableRoutesForCategory:(id)a3 mode:(id)a4 onlyKnownCombinations:(BOOL)a5 completion:(id)a6;
- (void)_handleDownlinkMuteDidChangeNotification:(id)a3;
- (void)_handlePickableRoutesDidChangeNotification:(id)a3;
- (void)_handleUplinkMuteDidChangeNotification:(id)a3;
- (void)_handleVolumeDidChangeNotification:(id)a3;
- (void)_loadCurrentPickableRoutesWithCompletion:(id)a3;
- (void)_mediaServicesWereReset:(id)a3;
- (void)_subscribeToNotificationAttributes;
- (void)_updateCachedState;
- (void)clearUplinkMutedCache;
- (void)dealloc;
- (void)getPickableRoutesForCategory:(id)a3 mode:(id)a4 completion:(id)a5;
- (void)isDownlinkMuted;
- (void)isTTY;
- (void)isUplinkMuted;
- (void)otherSessionsRequestNoRingtoneInterruption;
- (void)setActiveCategoryVolume:(float)a3;
- (void)setDelegate:(id)a3;
- (void)setDownlinkMuted:(BOOL)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)switchBluetoothAudioFormats;
- (void)triggerEndInterruptionForAudioSessionID:(id)a3;
@end

@implementation TUAudioSystemController

id __89__TUAudioSystemController__pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  int v3 = [v2 hasActiveAudioSession];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) pickableRoutesForActiveCall];
  }
  else
  {
    v5 = +[TUAudioSystemController sharedSystemController];
    v4 = [v5 pickableRoutesForCategory:_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth andMode:_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioMode_RemoteVoiceChat];
  }
  v6 = [(id)objc_opt_class() filteredPickableRoutesFromPickableRoutes:v4];

  return v6;
}

id __74__TUAudioSystemController__pickableRoutesForPhoneCallWithForceNewRequest___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  int v3 = [v2 hasActiveAudioSession];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) pickableRoutesForActiveCall];
  }
  else
  {
    v5 = +[TUAudioSystemController sharedSystemController];
    v4 = [v5 pickableRoutesForCategory:@"PhoneCall"];
  }
  v6 = [(id)objc_opt_class() filteredPickableRoutesFromPickableRoutes:v4];

  return v6;
}

+ (id)sharedSystemController
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getAVSystemControllerClass_softClass;
  uint64_t v11 = getAVSystemControllerClass_softClass;
  if (!getAVSystemControllerClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getAVSystemControllerClass_block_invoke;
    v7[3] = &unk_1E58E5F90;
    v7[4] = &v8;
    __getAVSystemControllerClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  v4 = [v3 sharedAVSystemController];
  if (!v4)
  {
    v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] +[AVSystemController sharedAVSystemController] returned nil value", (uint8_t *)v7, 2u);
    }
  }

  return v4;
}

- (id)_pickableRoutesForPhoneCallWithForceNewRequest:(BOOL)a3
{
  BOOL v3 = a3;
  v27[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = +[TUCallCapabilities supportsPrimaryCalling];
  v6 = TUDefaultLog();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[TUAudioSystemController _pickableRoutesForPhoneCallWithForceNewRequest:]();
    }

    [(TUAudioController *)self _acquireLock];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__TUAudioSystemController__pickableRoutesForPhoneCallWithForceNewRequest___block_invoke;
    aBlock[3] = &unk_1E58E6DD8;
    aBlock[4] = self;
    uint64_t v8 = _Block_copy(aBlock);
    v9 = [(TUAudioSystemController *)self delegate];
    int v10 = [v9 hasActiveAudioSession];

    if (v10)
    {
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2020000000;
      uint64_t v11 = (id *)getAVAudioSessionCategoryPhoneCallSymbolLoc_ptr;
      uint64_t v25 = getAVAudioSessionCategoryPhoneCallSymbolLoc_ptr;
      if (!getAVAudioSessionCategoryPhoneCallSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        v19 = __getAVAudioSessionCategoryPhoneCallSymbolLoc_block_invoke;
        v20 = &unk_1E58E5F90;
        v21 = &v22;
        __getAVAudioSessionCategoryPhoneCallSymbolLoc_block_invoke((uint64_t)buf);
        uint64_t v11 = (id *)v23[3];
      }
      _Block_object_dispose(&v22, 8);
      if (!v11) {
        -[TUAudioSystemController _pickableRoutesForPhoneCallWithForceNewRequest:]();
      }
      v12 = (__CFString *)*v11;
      if (!v12)
      {
        v13 = 0;
LABEL_15:
        [(TUAudioController *)self _requestUpdatedValueWithBlock:v8 object:&self->_pickableRoutesForPhoneCall isRequestingPointer:&self->_isRequestingPickableRoutesForPhoneCall forceNewRequest:v3 scheduleTimePointer:&self->_lastPhoneCallCategoryRoutesScheduleTime notificationString:@"TUAudioSystemAudioPickableRoutesChanged" notificationUserInfo:v13 queue:self->_pickableRoutesQueue];
        v14 = self->_pickableRoutesForPhoneCall;
        [(TUAudioController *)self _releaseLock];

        goto LABEL_16;
      }
    }
    else
    {
      v12 = @"PhoneCall";
    }
    v26 = @"TUAudioSystemCategoryKey";
    v27[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    goto LABEL_15;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "_pickableRoutesForPhoneCall is unsupported", buf, 2u);
  }

  v14 = (NSArray *)MEMORY[0x1E4F1CBF0];
LABEL_16:

  return v14;
}

- (TUAudioSystemControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUAudioSystemControllerDelegate *)WeakRetained;
}

- (void)_handlePickableRoutesDidChangeNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Pickable Routes Changed: %@", (uint8_t *)&v13, 0xCu);
  }

  if ([(TUAudioSystemController *)self isTTY])
  {
    id v6 = [(TUAudioSystemController *)self _pickableRoutesForTTYWithForceNewRequest:1];
  }
  else
  {
    id v7 = [(TUAudioSystemController *)self _pickableRoutesForPhoneCallWithForceNewRequest:1];
    id v8 = [(TUAudioSystemController *)self _pickableRoutesForPlayAndRecordVideoWithForceNewRequest:1];
    id v9 = [(TUAudioSystemController *)self _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:1];
    id v10 = [(TUAudioSystemController *)self _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:1];
    id v11 = [(TUAudioSystemController *)self _pickableRoutesForVoiceMailWithForceNewRequest:1];
  }
  [(TUAudioController *)self _acquireLock];
  currentPickableRoutes = self->_currentPickableRoutes;
  if (currentPickableRoutes)
  {
    self->_currentPickableRoutes = 0;

    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_52_0);
  }
  [(TUAudioController *)self _releaseLock];
}

- (id)_pickableRoutesForVoiceMailWithForceNewRequest:(BOOL)a3
{
  BOOL v3 = a3;
  v19[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = +[TUCallCapabilities supportsPrimaryCalling];
  id v6 = TUDefaultLog();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[TUAudioSystemController _pickableRoutesForVoiceMailWithForceNewRequest:]();
    }

    [(TUAudioController *)self _acquireLock];
    if (!_pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioCategory_Voicemail)
    {
      id v8 = (void **)CUTWeakLinkSymbol();
      if (v8) {
        id v9 = *v8;
      }
      else {
        id v9 = 0;
      }
      objc_storeStrong((id *)&_pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioCategory_Voicemail, v9);
    }
    if (!_pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioMode_VoiceChat)
    {
      id v11 = (void **)CUTWeakLinkSymbol();
      if (v11) {
        v12 = *v11;
      }
      else {
        v12 = 0;
      }
      objc_storeStrong((id *)&_pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioMode_VoiceChat, v12);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__TUAudioSystemController__pickableRoutesForVoiceMailWithForceNewRequest___block_invoke;
    aBlock[3] = &unk_1E58E6DD8;
    aBlock[4] = self;
    int v13 = _Block_copy(aBlock);
    id v14 = 0;
    if (_pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioCategory_Voicemail
      && _pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioMode_VoiceChat)
    {
      v18[0] = @"TUAudioSystemCategoryKey";
      v18[1] = @"TUAudioSystemModeKey";
      v19[0] = _pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioCategory_Voicemail;
      v19[1] = _pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioMode_VoiceChat;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    }
    [(TUAudioController *)self _requestUpdatedValueWithBlock:v13 object:&self->_pickableRoutesForVoicemail isRequestingPointer:&self->_isRequestingPickableRoutesForVoicemail forceNewRequest:v3 scheduleTimePointer:&self->_lastVoicemailRoutesScheduleTime notificationString:@"TUAudioSystemAudioPickableRoutesChanged" notificationUserInfo:v14 queue:self->_pickableRoutesQueue];
    id v10 = self->_pickableRoutesForVoicemail;
    [(TUAudioController *)self _releaseLock];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "_pickableRoutesForVoiceMailWithForceNewRequest is unsupported", buf, 2u);
    }

    id v10 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (id)_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:(BOOL)a3
{
  BOOL v3 = a3;
  v17[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TUAudioSystemController _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:]();
  }

  [(TUAudioController *)self _acquireLock];
  if (!_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth)
  {
    id v6 = (void **)CUTWeakLinkSymbol();
    if (v6) {
      id v7 = *v6;
    }
    else {
      id v7 = 0;
    }
    objc_storeStrong((id *)&_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth, v7);
  }
  if (!_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioMode_VoiceChat)
  {
    id v8 = (void **)CUTWeakLinkSymbol();
    if (v8) {
      id v9 = *v8;
    }
    else {
      id v9 = 0;
    }
    objc_storeStrong((id *)&_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioMode_VoiceChat, v9);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__TUAudioSystemController__pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___block_invoke;
  aBlock[3] = &unk_1E58E6DD8;
  aBlock[4] = self;
  id v10 = _Block_copy(aBlock);
  id v11 = 0;
  if (_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth
    && _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioMode_VoiceChat)
  {
    v16[0] = @"TUAudioSystemCategoryKey";
    v16[1] = @"TUAudioSystemModeKey";
    v17[0] = _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth;
    v17[1] = _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioMode_VoiceChat;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  [(TUAudioController *)self _requestUpdatedValueWithBlock:v10 object:&self->_pickableRoutesForPlayAndRecordVoice isRequestingPointer:&self->_isRequestingPickableRoutesForPlayAndRecordVoice forceNewRequest:v3 scheduleTimePointer:&self->_lastPlayAndRecordVoiceRoutesScheduleTime notificationString:@"TUAudioSystemAudioPickableRoutesChanged" notificationUserInfo:v11 queue:self->_pickableRoutesQueue];
  v12 = self->_pickableRoutesForPlayAndRecordVoice;
  [(TUAudioController *)self _releaseLock];
  int v13 = v12;

  return v13;
}

- (id)_pickableRoutesForPlayAndRecordVideoWithForceNewRequest:(BOOL)a3
{
  BOOL v3 = a3;
  v17[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TUAudioSystemController _pickableRoutesForPlayAndRecordVideoWithForceNewRequest:]();
  }

  [(TUAudioController *)self _acquireLock];
  if (!_pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth)
  {
    id v6 = (void **)CUTWeakLinkSymbol();
    if (v6) {
      id v7 = *v6;
    }
    else {
      id v7 = 0;
    }
    objc_storeStrong((id *)&_pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth, v7);
  }
  if (!_pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioMode_VideoChat)
  {
    id v8 = (void **)CUTWeakLinkSymbol();
    if (v8) {
      id v9 = *v8;
    }
    else {
      id v9 = 0;
    }
    objc_storeStrong((id *)&_pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioMode_VideoChat, v9);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__TUAudioSystemController__pickableRoutesForPlayAndRecordVideoWithForceNewRequest___block_invoke;
  aBlock[3] = &unk_1E58E6DD8;
  aBlock[4] = self;
  id v10 = _Block_copy(aBlock);
  id v11 = 0;
  if (_pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth
    && _pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioMode_VideoChat)
  {
    v16[0] = @"TUAudioSystemCategoryKey";
    v16[1] = @"TUAudioSystemModeKey";
    v17[0] = _pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth;
    v17[1] = _pickableRoutesForPlayAndRecordVideoWithForceNewRequest___kMXSessionAudioMode_VideoChat;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  [(TUAudioController *)self _requestUpdatedValueWithBlock:v10 object:&self->_pickableRoutesForPlayAndRecordVideo isRequestingPointer:&self->_isRequestingPickableRoutesForPlayAndRecordVideo forceNewRequest:v3 scheduleTimePointer:&self->_lastPlayAndRecordVideoRoutesScheduleTime notificationString:@"TUAudioSystemAudioPickableRoutesChanged" notificationUserInfo:v11 queue:self->_pickableRoutesQueue];
  v12 = self->_pickableRoutesForPlayAndRecordVideo;
  [(TUAudioController *)self _releaseLock];
  int v13 = v12;

  return v13;
}

- (id)_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:(BOOL)a3
{
  BOOL v3 = a3;
  v17[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TUAudioSystemController _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:]();
  }

  [(TUAudioController *)self _acquireLock];
  if (!_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth)
  {
    id v6 = (void **)CUTWeakLinkSymbol();
    if (v6) {
      id v7 = *v6;
    }
    else {
      id v7 = 0;
    }
    objc_storeStrong((id *)&_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth, v7);
  }
  if (!_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioMode_RemoteVoiceChat)
  {
    id v8 = (void **)CUTWeakLinkSymbol();
    if (v8) {
      id v9 = *v8;
    }
    else {
      id v9 = 0;
    }
    objc_storeStrong((id *)&_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioMode_RemoteVoiceChat, v9);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__TUAudioSystemController__pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___block_invoke;
  aBlock[3] = &unk_1E58E6DD8;
  aBlock[4] = self;
  id v10 = _Block_copy(aBlock);
  id v11 = 0;
  if (_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth
    && _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioMode_RemoteVoiceChat)
  {
    v16[0] = @"TUAudioSystemCategoryKey";
    v16[1] = @"TUAudioSystemModeKey";
    v17[0] = _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth;
    v17[1] = _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest___kMXSessionAudioMode_RemoteVoiceChat;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  [(TUAudioController *)self _requestUpdatedValueWithBlock:v10 object:&self->_pickableRoutesForPlayAndRecordRemoteVoice isRequestingPointer:&self->_isRequestingPickableRoutesForPlayAndRecordRemoteVoice forceNewRequest:v3 scheduleTimePointer:&self->_lastPlayAndRecordRemoteVoiceRoutesScheduleTime notificationString:@"TUAudioSystemAudioPickableRoutesChanged" notificationUserInfo:v11 queue:self->_pickableRoutesQueue];
  v12 = self->_pickableRoutesForPlayAndRecordRemoteVoice;
  [(TUAudioController *)self _releaseLock];
  int v13 = v12;

  return v13;
}

- (BOOL)isTTY
{
  [(TUAudioController *)self _acquireLock];
  [(TUAudioController *)self _requestUpdatedValueWithBlock:&__block_literal_global_65 object:&self->_isTTYCached isRequestingPointer:&self->_isRequestingTTY forceNewRequest:0 scheduleTimePointer:&self->_lastTTYRequestScheduleTime notificationString:@"TUAudioSystemTTYChangedNotification" queue:self->_ttyQueue];
  BOOL v3 = [(NSNumber *)self->_isTTYCached BOOLValue];
  [(TUAudioController *)self _releaseLock];
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[TUAudioSystemController isTTY]();
  }

  return v3;
}

id __32__TUAudioSystemController_isTTY__block_invoke()
{
  v0 = +[TUAudioSystemController sharedSystemController];
  id v6 = 0;
  [v0 getActiveCategoryVolume:0 andName:&v6];
  id v1 = v6;

  v2 = NSNumber;
  uint64_t v3 = [v1 isEqualToString:@"TTYCall"];

  id v4 = [v2 numberWithBool:v3];

  return v4;
}

id __74__TUAudioSystemController__pickableRoutesForVoiceMailWithForceNewRequest___block_invoke()
{
  v0 = objc_opt_class();
  id v1 = +[TUAudioSystemController sharedSystemController];
  v2 = [v1 pickableRoutesForCategory:_pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioCategory_Voicemail andMode:_pickableRoutesForVoiceMailWithForceNewRequest___kMXSessionAudioMode_VoiceChat];
  uint64_t v3 = [v0 filteredPickableRoutesFromPickableRoutes:v2];

  return v3;
}

+ (id)filteredPickableRoutesFromPickableRoutes:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v17 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v27 = 0;
        v28 = &v27;
        uint64_t v29 = 0x2020000000;
        id v9 = (id *)getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr;
        uint64_t v30 = getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr;
        if (!getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr)
        {
          uint64_t v22 = MEMORY[0x1E4F143A8];
          uint64_t v23 = 3221225472;
          uint64_t v24 = __getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_block_invoke;
          uint64_t v25 = &unk_1E58E5F90;
          v26 = &v27;
          id v10 = (void *)MediaExperienceLibrary();
          id v11 = dlsym(v10, "AVSystemController_RouteDescriptionKey_AVAudioRouteName");
          *(void *)(v26[1] + 24) = v11;
          getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr = *(void *)(v26[1] + 24);
          id v9 = (id *)v28[3];
        }
        _Block_object_dispose(&v27, 8);
        if (!v9) {
          +[TUAudioSystemController filteredPickableRoutesFromPickableRoutes:]();
        }
        id v12 = *v9;
        if (v12)
        {
          int v13 = [v8 objectForKeyedSubscript:v12];
          char v14 = [v13 isEqualToString:@"AirTunes"];

          if ((v14 & 1) == 0) {
            [v17 addObject:v8];
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v31 count:16];
    }
    while (v5);
  }

  uint64_t v15 = (void *)[v17 copy];

  return v15;
}

id __83__TUAudioSystemController__pickableRoutesForPlayAndRecordVideoWithForceNewRequest___block_invoke()
{
  if (!__sharedController_block_invoke__kMXSessionAudioCategory_PlayAndRecord_NoBluetooth)
  {
    v0 = (void **)CUTWeakLinkSymbol();
    if (v0) {
      id v1 = *v0;
    }
    else {
      id v1 = 0;
    }
    objc_storeStrong((id *)&__sharedController_block_invoke__kMXSessionAudioCategory_PlayAndRecord_NoBluetooth, v1);
  }
  if (!__sharedController_block_invoke__kMXSessionAudioMode_VideoChat)
  {
    v2 = (void **)CUTWeakLinkSymbol();
    if (v2) {
      id v3 = *v2;
    }
    else {
      id v3 = 0;
    }
    objc_storeStrong((id *)&__sharedController_block_invoke__kMXSessionAudioMode_VideoChat, v3);
  }
  id v4 = objc_opt_class();
  uint64_t v5 = +[TUAudioSystemController sharedSystemController];
  uint64_t v6 = [v5 pickableRoutesForCategory:__sharedController_block_invoke__kMXSessionAudioCategory_PlayAndRecord_NoBluetooth andMode:__sharedController_block_invoke__kMXSessionAudioMode_VideoChat];
  id v7 = [v4 filteredPickableRoutesFromPickableRoutes:v6];

  return v7;
}

id __83__TUAudioSystemController__pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  int v3 = [v2 hasActiveAudioSession];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) pickableRoutesForActiveCall];
  }
  else
  {
    uint64_t v5 = +[TUAudioSystemController sharedSystemController];
    id v4 = [v5 pickableRoutesForCategory:_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth andMode:_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest___kMXSessionAudioMode_VoiceChat];
  }
  uint64_t v6 = [(id)objc_opt_class() filteredPickableRoutesFromPickableRoutes:v4];

  return v6;
}

void __62__TUAudioSystemController__handleVolumeDidChangeNotification___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"TUAudioSystemActiveCategoryVolumeChangedNotification" object:0];
}

- (void)_handleVolumeDidChangeNotification:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Volume changed: %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_50_0);
}

+ (TUAudioSystemController)sharedAudioSystemController
{
  if (sharedAudioSystemController_onceToken != -1) {
    dispatch_once(&sharedAudioSystemController_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)__sharedController;

  return (TUAudioSystemController *)v2;
}

uint64_t __54__TUAudioSystemController_sharedAudioSystemController__block_invoke()
{
  __sharedController = objc_alloc_init(TUAudioSystemController);

  return MEMORY[0x1F41817F8]();
}

- (TUAudioSystemController)init
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)TUAudioSystemController;
  id v2 = [(TUAudioController *)&v36 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TelephonyUtilities.TUAudioSystemController.UplinkMutedQueue", 0);
    id v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.TelephonyUtilities.TUAudioSystemController.DownlinkMutedQueue", 0);
    id v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.TelephonyUtilities.TUAudioSystemController.TTYQueue", 0);
    id v8 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.TelephonyUtilities.TUAudioSystemController.PickableRoutesQueue", 0);
    id v10 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v9;

    id v11 = *((void *)v2 + 2);
    id v12 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v11, v12);

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 3), v12);
    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 4), v12);

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 5), v12);
    uint64_t v13 = [NSNumber numberWithBool:0];
    char v14 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v13;

    uint64_t v15 = [NSNumber numberWithBool:0];
    v16 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v15;

    uint64_t v17 = [NSNumber numberWithBool:0];
    long long v18 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v17;

    id v19 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    long long v20 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v19;

    id v21 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    uint64_t v22 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v21;

    id v23 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    uint64_t v24 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v23;

    id v25 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    v26 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v25;

    id v27 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    v28 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v27;

    id v29 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    uint64_t v30 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v29;

    *((unsigned char *)v2 + 128) = 0;
    *((unsigned char *)v2 + 129) = 0;
    *((unsigned char *)v2 + 130) = 0;
    *((unsigned char *)v2 + 131) = 0;
    *((unsigned char *)v2 + 132) = 0;
    *((unsigned char *)v2 + 133) = 0;
    *((unsigned char *)v2 + 134) = 0;
    *((unsigned char *)v2 + 135) = 0;
    *((unsigned char *)v2 + 136) = 0;
    *((void *)v2 + 18) = 0;
    *((void *)v2 + 19) = 0;
    *((void *)v2 + 20) = 0;
    *((void *)v2 + 21) = 0;
    *((void *)v2 + 22) = 0;
    *((void *)v2 + 23) = 0;
    *((void *)v2 + 24) = 0;
    *((void *)v2 + 25) = 0;
    *((void *)v2 + 26) = 0;
    [v2 _subscribeToNotificationAttributes];
    if (init__AVAudioSessionMediaServicesWereResetNotification
      || ((v31 = (void **)CUTWeakLinkSymbol()) == 0 ? (uint64_t v32 = 0) : (uint64_t v32 = *v31),
          objc_storeStrong((id *)&init__AVAudioSessionMediaServicesWereResetNotification, v32),
          init__AVAudioSessionMediaServicesWereResetNotification))
    {
      v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v33 addObserver:v2 selector:sel__mediaServicesWereReset_ name:init__AVAudioSessionMediaServicesWereResetNotification object:0];
    }
    else
    {
      v33 = TUDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = @"AVAudioSessionMediaServicesWereResetNotification";
        _os_log_impl(&dword_19C496000, v33, OS_LOG_TYPE_DEFAULT, "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.", buf, 0xCu);
      }
    }

    v34 = dispatch_get_global_queue(21, 0);
    dispatch_async(v34, &__block_literal_global_37_1);

    [v2 _updateCachedState];
  }
  return (TUAudioSystemController *)v2;
}

id __31__TUAudioSystemController_init__block_invoke()
{
  return (id)[(id)CUTWeakLinkClass() sharedInstance];
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TUAudioSystemController;
  [(TUAudioSystemController *)&v4 dealloc];
}

- (void)_subscribeToNotificationAttributes
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_SubscribeToNotificationsAttribute(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioSystemController.m", 43, @"%s", dlerror());

  __break(1u);
}

- (void)_updateCachedState
{
  dispatch_queue_t v3 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__TUAudioSystemController__updateCachedState__block_invoke;
  block[3] = &unk_1E58E5BE0;
  block[4] = self;
  dispatch_async(v3, block);
}

id __45__TUAudioSystemController__updateCachedState__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) isUplinkMuted];
  [*(id *)(a1 + 32) isDownlinkMuted];
  [*(id *)(a1 + 32) isTTY];
  id v2 = (id)[*(id *)(a1 + 32) pickableRoutesForTTY];
  id v3 = (id)[*(id *)(a1 + 32) _pickableRoutesForPhoneCallWithForceNewRequest:0];
  id v4 = (id)[*(id *)(a1 + 32) _pickableRoutesForPlayAndRecordVideoWithForceNewRequest:0];
  id v5 = (id)[*(id *)(a1 + 32) _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:0];
  id v6 = (id)[*(id *)(a1 + 32) _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:0];
  return (id)[*(id *)(a1 + 32) _pickableRoutesForVoiceMailWithForceNewRequest:0];
}

- (void)_handleUplinkMuteDidChangeNotification:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Mute status changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUAudioSystemController *)self isUplinkMuted];
}

- (void)_handleDownlinkMuteDidChangeNotification:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Downlink mute status changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUAudioSystemController *)self isDownlinkMuted];
}

void __70__TUAudioSystemController__handlePickableRoutesDidChangeNotification___block_invoke()
{
  id v0 = TUDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_19C496000, v0, OS_LOG_TYPE_DEFAULT, "Clearing cached current pickable routes and posting TUAudioSystemAudioPickableRoutesChanged", v2, 2u);
  }

  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"TUAudioSystemAudioPickableRoutesChanged" object:0];
}

- (void)_mediaServicesWereReset:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Media services were reset: %@", (uint8_t *)&v6, 0xCu);
  }

  [(TUAudioSystemController *)self _subscribeToNotificationAttributes];
  [(TUAudioSystemController *)self _updateCachedState];
}

- (float)activeCategoryVolume
{
  float v5 = 0.0;
  id v2 = +[TUAudioSystemController sharedSystemController];
  [v2 getActiveCategoryVolume:&v5 andName:0];

  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(TUAudioSystemController *)&v5 activeCategoryVolume];
  }

  return v5;
}

- (void)triggerEndInterruptionForAudioSessionID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_AudioSessionID)
  {
    id v4 = (void **)CUTWeakLinkSymbol();
    if (v4) {
      float v5 = *v4;
    }
    else {
      float v5 = 0;
    }
    objc_storeStrong((id *)&triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_AudioSessionID, v5);
  }
  uint64_t v6 = triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_IsResumable;
  if (!triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_IsResumable)
  {
    id v7 = (void **)CUTWeakLinkSymbol();
    if (v7) {
      uint64_t v8 = *v7;
    }
    else {
      uint64_t v8 = 0;
    }
    objc_storeStrong((id *)&triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_IsResumable, v8);
    uint64_t v6 = triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_IsResumable;
  }
  v20[1] = v6;
  v21[0] = v3;
  v20[0] = triggerEndInterruptionForAudioSessionID__kAVSystemController_PostInterruptionEndedNotificationKey_AudioSessionID;
  dispatch_queue_t v9 = [NSNumber numberWithBool:1];
  v21[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  id v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Triggering an end of interruption for audio session with ID %@", (uint8_t *)&buf, 0xCu);
  }

  id v12 = +[TUAudioSystemController sharedSystemController];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v13 = (void *)getAVSystemController_PostInterruptionEndedNotificationSymbolLoc_ptr;
  uint64_t v19 = getAVSystemController_PostInterruptionEndedNotificationSymbolLoc_ptr;
  if (!getAVSystemController_PostInterruptionEndedNotificationSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v23 = __getAVSystemController_PostInterruptionEndedNotificationSymbolLoc_block_invoke;
    uint64_t v24 = &unk_1E58E5F90;
    id v25 = &v16;
    char v14 = (void *)MediaExperienceLibrary();
    uint64_t v15 = dlsym(v14, "AVSystemController_PostInterruptionEndedNotification");
    *(void *)(v25[1] + 24) = v15;
    getAVSystemController_PostInterruptionEndedNotificationSymbolLoc_ptr = *(void *)(v25[1] + 24);
    uint64_t v13 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v13) {
    -[TUAudioSystemController triggerEndInterruptionForAudioSessionID:]();
  }
  objc_msgSend(v12, "setAttribute:forKey:error:", v10, *v13, 0, v16);
}

- (void)clearUplinkMutedCache
{
  id v2 = +[TUAudioSystemController sharedSystemController];
  char v3 = objc_opt_respondsToSelector();

  id v4 = TUDefaultLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Clearing uplink mute cache for AVSystemController", buf, 2u);
    }

    id v4 = +[TUAudioSystemController sharedSystemController];
    [v4 clearUplinkMutedCache];
  }
  else if (v5)
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Not clearing uplink mute cache for AVSystemController since it does not conform to clearUplinkMutedCache", v6, 2u);
  }
}

- (void)setActiveCategoryVolume:(float)a3
{
  id v4 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__TUAudioSystemController_setActiveCategoryVolume___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  float v6 = a3;
  dispatch_async(v4, block);
}

void __51__TUAudioSystemController_setActiveCategoryVolume___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = *(float *)(a1 + 32);
    int v16 = 134217984;
    double v17 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Setting active category volume to %f", (uint8_t *)&v16, 0xCu);
  }

  id v4 = +[TUAudioSystemController sharedSystemController];
  int v6 = *(_DWORD *)(a1 + 32);
  uint64_t v5 = a1 + 32;
  LODWORD(v7) = v6;
  char v8 = [v4 setActiveCategoryVolumeTo:v7];

  if ((v8 & 1) == 0)
  {
    dispatch_queue_t v9 = TUDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __51__TUAudioSystemController_setActiveCategoryVolume___block_invoke_cold_1(v5, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (BOOL)isUplinkMuted
{
  [(TUAudioController *)self _acquireLock];
  [(TUAudioController *)self _requestUpdatedValueWithBlock:&__block_literal_global_63_0 object:&self->_isUplinkMutedCached isRequestingPointer:&self->_isRequestingUplinkMuted forceNewRequest:0 scheduleTimePointer:&self->_lastUplinkMutedRequestScheduleTime notificationString:@"TUAudioSystemUplinkMuteStatusChangedNotification" queue:self->_uplinkMutedQueue];
  BOOL v3 = [(NSNumber *)self->_isUplinkMutedCached BOOLValue];
  [(TUAudioController *)self _releaseLock];
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[TUAudioSystemController isUplinkMuted]();
  }

  return v3;
}

id __40__TUAudioSystemController_isUplinkMuted__block_invoke()
{
  id v0 = +[TUAudioSystemController sharedSystemController];
  id v1 = getAVSystemController_UplinkMuteAttribute();
  id v2 = [v0 attributeForKey:v1];

  return v2;
}

- (void)setUplinkMuted:(BOOL)a3
{
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:");
  int v6 = v5;
  if (!self->_isUplinkMutedCached || (objc_msgSend(v5, "isEqualToNumber:") & 1) == 0)
  {
    uplinkMutedQueue = self->_uplinkMutedQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__TUAudioSystemController_setUplinkMuted___block_invoke;
    block[3] = &unk_1E58E6DB0;
    void block[4] = self;
    id v9 = v6;
    BOOL v10 = a3;
    dispatch_async(uplinkMutedQueue, block);
  }
}

void __42__TUAudioSystemController_setUplinkMuted___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _acquireLock];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v21 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "setting isUplinkMuted value = %@", buf, 0xCu);
  }

  id v4 = +[TUAudioSystemController sharedSystemController];
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = getAVSystemController_UplinkMuteAttribute();
  id v19 = 0;
  char v7 = [v4 setAttribute:v5 forKey:v6 error:&v19];
  id v8 = v19;

  if (v7)
  {
    uint64_t v9 = [objc_alloc(NSNumber) initWithBool:*(unsigned __int8 *)(a1 + 48)];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 48);
    *(void *)(v10 + 48) = v9;

    [*(id *)(a1 + 32) _releaseLock];
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_71_0);
  }
  else
  {
    uint64_t v12 = TUDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __42__TUAudioSystemController_setUplinkMuted___block_invoke_cold_1((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);
    }

    [*(id *)(a1 + 32) _releaseLock];
  }
}

void __42__TUAudioSystemController_setUplinkMuted___block_invoke_69()
{
  id v0 = TUDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __42__TUAudioSystemController_setUplinkMuted___block_invoke_69_cold_1();
  }

  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"TUAudioSystemUplinkMuteStatusChangedNotification" object:0];
}

- (BOOL)isDownlinkMuted
{
  [(TUAudioController *)self _acquireLock];
  [(TUAudioController *)self _requestUpdatedValueWithBlock:&__block_literal_global_73 object:&self->_isDownlinkMutedCached isRequestingPointer:&self->_isRequestingDownlinkMuted forceNewRequest:0 scheduleTimePointer:&self->_lastDownlinkMutedRequestScheduleTime notificationString:@"TUAudioSystemDownlinkMuteStatusChangedNotification" queue:self->_downlinkMutedQueue];
  BOOL v3 = [(NSNumber *)self->_isDownlinkMutedCached BOOLValue];
  [(TUAudioController *)self _releaseLock];
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[TUAudioSystemController isDownlinkMuted]();
  }

  return v3;
}

id __42__TUAudioSystemController_isDownlinkMuted__block_invoke()
{
  id v0 = +[TUAudioSystemController sharedSystemController];
  id v1 = getAVSystemController_DownlinkMuteAttribute();
  id v2 = [v0 attributeForKey:v1];

  return v2;
}

- (void)setDownlinkMuted:(BOOL)a3
{
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:");
  int v6 = v5;
  if (!self->_isDownlinkMutedCached || (objc_msgSend(v5, "isEqualToNumber:") & 1) == 0)
  {
    downlinkMutedQueue = self->_downlinkMutedQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__TUAudioSystemController_setDownlinkMuted___block_invoke;
    block[3] = &unk_1E58E6DB0;
    void block[4] = self;
    id v9 = v6;
    BOOL v10 = a3;
    dispatch_async(downlinkMutedQueue, block);
  }
}

void __44__TUAudioSystemController_setDownlinkMuted___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _acquireLock];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v21 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "setting isDownlinkMuted value = %@", buf, 0xCu);
  }

  id v4 = +[TUAudioSystemController sharedSystemController];
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = getAVSystemController_DownlinkMuteAttribute();
  id v19 = 0;
  char v7 = [v4 setAttribute:v5 forKey:v6 error:&v19];
  id v8 = v19;

  if (v7)
  {
    uint64_t v9 = [objc_alloc(NSNumber) initWithBool:*(unsigned __int8 *)(a1 + 48)];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 56);
    *(void *)(v10 + 56) = v9;

    [*(id *)(a1 + 32) _releaseLock];
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_76_1);
  }
  else
  {
    uint64_t v12 = TUDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __44__TUAudioSystemController_setDownlinkMuted___block_invoke_cold_1((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);
    }

    [*(id *)(a1 + 32) _releaseLock];
  }
}

void __44__TUAudioSystemController_setDownlinkMuted___block_invoke_74()
{
  id v0 = TUDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __44__TUAudioSystemController_setDownlinkMuted___block_invoke_74_cold_1();
  }

  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"TUAudioSystemDownlinkMuteStatusChangedNotification" object:0];
}

- (NSDictionary)pickedRouteAttribute
{
  id v2 = +[TUAudioSystemController sharedSystemController];
  uint64_t v3 = getAVSystemController_PickedRouteAttribute();
  id v4 = [v2 attributeForKey:v3];

  return (NSDictionary *)v4;
}

- (id)_pickableRoutesForTTYWithForceNewRequest:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TUAudioSystemController _pickableRoutesForTTYWithForceNewRequest:]();
  }

  [(TUAudioController *)self _acquireLock];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__TUAudioSystemController__pickableRoutesForTTYWithForceNewRequest___block_invoke;
  aBlock[3] = &unk_1E58E6DD8;
  aBlock[4] = self;
  int v6 = _Block_copy(aBlock);
  [(TUAudioController *)self _requestUpdatedValueWithBlock:v6 object:&self->_pickableRoutesForTTY isRequestingPointer:&self->_isRequestingPickableRoutesForTTY forceNewRequest:v3 scheduleTimePointer:&self->_lastTTYPickableRoutesScheduleTime notificationString:@"TUAudioSystemAudioPickableRoutesChanged" queue:self->_pickableRoutesQueue];
  char v7 = self->_pickableRoutesForTTY;
  [(TUAudioController *)self _releaseLock];
  id v8 = v7;

  return v8;
}

id __68__TUAudioSystemController__pickableRoutesForTTYWithForceNewRequest___block_invoke()
{
  id v0 = objc_opt_class();
  id v1 = +[TUAudioSystemController sharedSystemController];
  id v2 = getAVSystemController_PickableRoutesAttribute();
  BOOL v3 = [v1 attributeForKey:v2];
  id v4 = [v0 filteredPickableRoutesFromPickableRoutes:v3];

  return v4;
}

- (NSArray)pickableRoutesForTTY
{
  return (NSArray *)[(TUAudioSystemController *)self _pickableRoutesForTTYWithForceNewRequest:0];
}

- (id)pickableRoutesForActiveCall
{
  id v2 = +[TUAudioSystemController sharedSystemController];
  BOOL v3 = getAVSystemController_PickableRoutesAttribute();
  id v4 = [v2 attributeForKey:v3];

  return v4;
}

- (id)currentlyPickedRouteIdForCategory:(id)a3 andMode:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v22 = a4;
  -[TUAudioSystemController pickableRoutesForCategory:andMode:](self, "pickableRoutesForCategory:andMode:", v21);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v32 = 0;
        v33 = &v32;
        uint64_t v34 = 0x2020000000;
        uint64_t v11 = (void *)getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr;
        uint64_t v35 = getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr;
        if (!getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr)
        {
          uint64_t v27 = MEMORY[0x1E4F143A8];
          uint64_t v28 = 3221225472;
          id v29 = __getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_block_invoke;
          uint64_t v30 = &unk_1E58E5F90;
          v31 = &v32;
          uint64_t v12 = (void *)MediaExperienceLibrary();
          uint64_t v13 = dlsym(v12, "AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked");
          *(void *)(v31[1] + 24) = v13;
          getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr = *(void *)(v31[1] + 24);
          uint64_t v11 = (void *)v33[3];
        }
        _Block_object_dispose(&v32, 8);
        if (!v11) {
          -[TUAudioSystemController currentlyPickedRouteIdForCategory:andMode:]();
        }
        uint64_t v14 = [v10 objectForKeyedSubscript:*v11];
        int v15 = [v14 BOOLValue];

        if (v15)
        {
          uint64_t v32 = 0;
          v33 = &v32;
          uint64_t v34 = 0x2020000000;
          uint64_t v17 = (void *)getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr;
          uint64_t v35 = getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr;
          if (!getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr)
          {
            uint64_t v27 = MEMORY[0x1E4F143A8];
            uint64_t v28 = 3221225472;
            id v29 = __getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_block_invoke;
            uint64_t v30 = &unk_1E58E5F90;
            v31 = &v32;
            uint64_t v18 = (void *)MediaExperienceLibrary();
            id v19 = dlsym(v18, "AVSystemController_RouteDescriptionKey_RouteUID");
            *(void *)(v31[1] + 24) = v19;
            getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr = *(void *)(v31[1] + 24);
            uint64_t v17 = (void *)v33[3];
          }
          _Block_object_dispose(&v32, 8);
          if (!v17) {
            -[TUAudioSystemController currentlyPickedRouteIdForCategory:andMode:]();
          }
          uint64_t v16 = [v10 objectForKeyedSubscript:*v17];
          goto LABEL_17;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v36 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 0;
LABEL_17:

  return v16;
}

+ (id)sourceIdentifierForRouteID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Speaker"])
  {
    id v4 = (id *)&TUCallSourceIdentifierSpeakerRoute;
  }
  else
  {
    id v5 = v3;
    if (![v3 isEqualToString:@"CarAudioOutput"]) {
      goto LABEL_6;
    }
    id v4 = (id *)&TUCallSourceIdentifierCarPlay;
  }
  id v5 = *v4;

LABEL_6:

  return v5;
}

- (void)_loadCurrentPickableRoutesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    pickableRoutesQueue = self->_pickableRoutesQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__TUAudioSystemController__loadCurrentPickableRoutesWithCompletion___block_invoke;
    v7[3] = &unk_1E58E60D8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(pickableRoutesQueue, v7);
  }
}

void __68__TUAudioSystemController__loadCurrentPickableRoutesWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[TUAudioSystemController sharedSystemController];
  id v3 = getAVSystemController_PickableRoutesAttribute();
  id v4 = [v2 attributeForKey:v3];

  [*(id *)(a1 + 32) _acquireLock];
  uint64_t v5 = [(id)objc_opt_class() filteredPickableRoutesFromPickableRoutes:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v5;

  [*(id *)(a1 + 32) _releaseLock];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__TUAudioSystemController__loadCurrentPickableRoutesWithCompletion___block_invoke_2;
  block[3] = &unk_1E58E5BE0;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__TUAudioSystemController__loadCurrentPickableRoutesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Fetched current pickable routes %@ and posting TUAudioSystemAudioPickableRoutesChanged", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"TUAudioSystemAudioPickableRoutesChanged" object:0];
}

- (NSArray)bestGuessPickableRoutesForAnyCall
{
  if (+[TUCallCapabilities supportsPrimaryCalling]) {
    [(TUAudioSystemController *)self _pickableRoutesForPhoneCallWithForceNewRequest:0];
  }
  else {
  uint64_t v3 = [(TUAudioSystemController *)self _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:0];
  }

  return (NSArray *)v3;
}

- (id)pickableRoutesForCategory:(id)a3 andMode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__3;
  int v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__TUAudioSystemController_pickableRoutesForCategory_andMode___block_invoke;
  v10[3] = &unk_1E58E6E00;
  v10[4] = &v11;
  [(TUAudioSystemController *)self _getPickableRoutesForCategory:v6 mode:v7 onlyKnownCombinations:1 completion:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __61__TUAudioSystemController_pickableRoutesForCategory_andMode___block_invoke(uint64_t a1, void *a2)
{
}

- (void)getPickableRoutesForCategory:(id)a3 mode:(id)a4 completion:(id)a5
{
}

- (void)_getPickableRoutesForCategory:(id)a3 mode:(id)a4 onlyKnownCombinations:(BOOL)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, NSArray *))a6;
  if (!v12) {
    goto LABEL_47;
  }
  if (v10)
  {
    uint64_t v13 = _getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth;
    if (!_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth)
    {
      uint64_t v14 = (void **)CUTWeakLinkSymbol();
      if (v14) {
        int v15 = *v14;
      }
      else {
        int v15 = 0;
      }
      objc_storeStrong((id *)&_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth, v15);
      uint64_t v13 = _getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioCategory_PlayAndRecord_NoBluetooth;
    }
    int v16 = TUStringsAreEqualOrNil((unint64_t)v10, v13);
    if (v11 && v16)
    {
      if (!_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_VideoChat)
      {
        uint64_t v17 = (void **)CUTWeakLinkSymbol();
        if (v17) {
          uint64_t v18 = *v17;
        }
        else {
          uint64_t v18 = 0;
        }
        objc_storeStrong((id *)&_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_VideoChat, v18);
      }
      if (!_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_VoiceChat)
      {
        long long v20 = (void **)CUTWeakLinkSymbol();
        if (v20) {
          id v21 = *v20;
        }
        else {
          id v21 = 0;
        }
        objc_storeStrong((id *)&_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_VoiceChat, v21);
      }
      if (!_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_RemoteVoiceChat)
      {
        id v22 = (void **)CUTWeakLinkSymbol();
        if (v22) {
          long long v23 = *v22;
        }
        else {
          long long v23 = 0;
        }
        objc_storeStrong((id *)&_getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_RemoteVoiceChat, v23);
      }
      if (TUStringsAreEqualOrNil((unint64_t)v11, _getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_VideoChat))
      {
        uint64_t v19 = [(TUAudioSystemController *)self _pickableRoutesForPlayAndRecordVideoWithForceNewRequest:0];
        goto LABEL_35;
      }
      if (TUStringsAreEqualOrNil((unint64_t)v11, _getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_VoiceChat))
      {
        uint64_t v19 = [(TUAudioSystemController *)self _pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:0];
        goto LABEL_35;
      }
      if (TUStringsAreEqualOrNil((unint64_t)v11, _getPickableRoutesForCategory_mode_onlyKnownCombinations_completion___kMXSessionAudioMode_RemoteVoiceChat))
      {
        uint64_t v19 = [(TUAudioSystemController *)self _pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:0];
LABEL_35:
        long long v24 = (NSArray *)v19;
        if (a5) {
          goto LABEL_41;
        }
LABEL_38:
        if (!v24)
        {
          [(TUAudioController *)self _acquireLock];
          long long v25 = self->_currentPickableRoutes;
          [(TUAudioController *)self _releaseLock];
          if (v25)
          {
            v12[2](v12, v25);
          }
          else
          {
            [(TUAudioSystemController *)self _loadCurrentPickableRoutesWithCompletion:v12];
          }
          goto LABEL_47;
        }
        goto LABEL_41;
      }
    }
    else
    {
      if ([(id)objc_opt_class() isPhoneCallAudioCategory:v10])
      {
        uint64_t v19 = [(TUAudioSystemController *)self _pickableRoutesForPhoneCallWithForceNewRequest:0];
        goto LABEL_35;
      }
      if ([v10 isEqualToString:@"Voicemail"])
      {
        uint64_t v19 = [(TUAudioSystemController *)self _pickableRoutesForVoiceMailWithForceNewRequest:0];
        goto LABEL_35;
      }
    }
  }
  long long v24 = 0;
  if (!a5) {
    goto LABEL_38;
  }
LABEL_41:
  if (!v24)
  {
    long long v26 = TUDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412546;
      id v28 = v10;
      __int16 v29 = 2112;
      id v30 = v11;
      _os_log_impl(&dword_19C496000, v26, OS_LOG_TYPE_DEFAULT, "Unknown category (%@) and mode (%@) combination, using default pickable routes", (uint8_t *)&v27, 0x16u);
    }

    long long v24 = [(TUAudioSystemController *)self bestGuessPickableRoutesForAnyCall];
  }
  v12[2](v12, v24);

LABEL_47:
}

- (BOOL)pickRoute:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[TUAudioSystemController sharedSystemController];
  id v7 = [v5 route];

  id v8 = getAVSystemController_PickedRouteAttribute();
  LOBYTE(a4) = [v6 setAttribute:v7 forKey:v8 error:a4];

  return (char)a4;
}

- (void)switchBluetoothAudioFormats
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Notifying AVSystemController to override to partner route", v4, 2u);
  }

  uint64_t v3 = +[TUAudioSystemController sharedSystemController];
  [v3 overrideToPartnerRoute];
}

- (id)pickableRouteWithUniqueIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (TUAudioRoute *)a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v26 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "uniqueIdentifier: %@", buf, 0xCu);
  }

  id v6 = [(TUAudioSystemController *)self bestGuessPickableRoutesForAnyCall];
  id v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v26 = v6;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "using pickable routes %@", buf, 0xCu);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [(TUAudioRoute *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
LABEL_7:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
      uint64_t v14 = [TUAudioRoute alloc];
      int v15 = -[TUAudioRoute initWithDictionary:](v14, "initWithDictionary:", v13, (void)v20);
      int v16 = [(TURoute *)v15 uniqueIdentifier];
      char v17 = [v16 isEqualToString:v4];

      if (v17) {
        break;
      }

      if (v10 == ++v12)
      {
        uint64_t v10 = [(TUAudioRoute *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          goto LABEL_7;
        }
        int v15 = 0;
        break;
      }
    }
  }
  else
  {
    int v15 = 0;
  }

  uint64_t v18 = TUDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v26 = v15;
    _os_log_impl(&dword_19C496000, v18, OS_LOG_TYPE_DEFAULT, "returning route %@", buf, 0xCu);
  }

  return v15;
}

- (BOOL)shouldSuppressCallUsingRoute:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "route: %@", (uint8_t *)&v8, 0xCu);
  }

  id v5 = [v3 identifiersOfOtherConnectedDevices];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (BOOL)otherSessionsRequestNoRingtoneInterruption
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = +[TUAudioSystemController sharedSystemController];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  id v3 = (void *)getAVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttributeSymbolLoc_ptr;
  uint64_t v13 = getAVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttributeSymbolLoc_ptr;
  if (!getAVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttributeSymbolLoc_ptr)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    int v16 = __getAVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttributeSymbolLoc_block_invoke;
    char v17 = &unk_1E58E5F90;
    uint64_t v18 = &v10;
    id v4 = (void *)MediaExperienceLibrary();
    id v5 = dlsym(v4, "AVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttribute");
    *(void *)(v18[1] + 24) = v5;
    getAVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttributeSymbolLoc_ptr = *(void *)(v18[1] + 24);
    id v3 = (void *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v3) {
    -[TUAudioSystemController otherSessionsRequestNoRingtoneInterruption]();
  }
  BOOL v6 = objc_msgSend(v2, "attributeForKey:", *v3, v10);
  int v7 = [v6 BOOLValue];

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v7;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Other sessions request no ringtone interruption: %d", buf, 8u);
  }

  return v7;
}

+ (BOOL)isPhoneCallAudioCategory:(id)a3
{
  id v3 = a3;
  if (!isPhoneCallAudioCategory___AVAudioSessionCategoryPhoneCall)
  {
    id v4 = (void **)CUTWeakLinkSymbol();
    if (v4) {
      id v5 = *v4;
    }
    else {
      id v5 = 0;
    }
    objc_storeStrong((id *)&isPhoneCallAudioCategory___AVAudioSessionCategoryPhoneCall, v5);
  }
  if ([v3 isEqualToString:@"PhoneCall"])
  {
    char v6 = 1;
  }
  else if (isPhoneCallAudioCategory___AVAudioSessionCategoryPhoneCall)
  {
    char v6 = objc_msgSend(v3, "isEqualToString:");
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentPickableRoutes, 0);
  objc_storeStrong((id *)&self->_pickableRoutesForVoicemail, 0);
  objc_storeStrong((id *)&self->_pickableRoutesForPlayAndRecordRemoteVoice, 0);
  objc_storeStrong((id *)&self->_pickableRoutesForPlayAndRecordVoice, 0);
  objc_storeStrong((id *)&self->_pickableRoutesForPlayAndRecordVideo, 0);
  objc_storeStrong((id *)&self->_pickableRoutesForPhoneCall, 0);
  objc_storeStrong((id *)&self->_pickableRoutesForTTY, 0);
  objc_storeStrong((id *)&self->_isTTYCached, 0);
  objc_storeStrong((id *)&self->_isDownlinkMutedCached, 0);
  objc_storeStrong((id *)&self->_isUplinkMutedCached, 0);
  objc_storeStrong((id *)&self->_pickableRoutesQueue, 0);
  objc_storeStrong((id *)&self->_ttyQueue, 0);
  objc_storeStrong((id *)&self->_downlinkMutedQueue, 0);

  objc_storeStrong((id *)&self->_uplinkMutedQueue, 0);
}

- (double)activeCategoryVolume
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v2 = *a1;
  int v4 = 134217984;
  double v5 = v2;
  _os_log_debug_impl(&dword_19C496000, a2, OS_LOG_TYPE_DEBUG, "activeCategoryVolume = %f", (uint8_t *)&v4, 0xCu);
  return result;
}

- (void)triggerEndInterruptionForAudioSessionID:.cold.1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_PostInterruptionEndedNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioSystemController.m", 47, @"%s", dlerror());

  __break(1u);
}

double __51__TUAudioSystemController_setActiveCategoryVolume___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19C496000, a2, a3, "Failed to set active category volume to %f", a5, a6, a7, a8, 0);
  return result;
}

- (void)isUplinkMuted
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19C496000, v0, v1, "isUplinkMuted = %d", v2, v3, v4, v5, v6);
}

- (void)isTTY
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19C496000, v0, v1, "isTTY = %d", v2, v3, v4, v5, v6);
}

void __42__TUAudioSystemController_setUplinkMuted___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __42__TUAudioSystemController_setUplinkMuted___block_invoke_69_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "Dispatching changed notification in response to setUplinkMuted", v2, v3, v4, v5, v6);
}

- (void)isDownlinkMuted
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19C496000, v0, v1, "isDownlinkMuted = %d", v2, v3, v4, v5, v6);
}

void __44__TUAudioSystemController_setDownlinkMuted___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__TUAudioSystemController_setDownlinkMuted___block_invoke_74_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "Dispatching changed notification in response to setDownlinkMuted", v2, v3, v4, v5, v6);
}

- (void)_pickableRoutesForTTYWithForceNewRequest:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "pickableRoutesForTTY", v2, v3, v4, v5, v6);
}

- (void)_pickableRoutesForPhoneCallWithForceNewRequest:.cold.1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"AVAudioSessionCategory getAVAudioSessionCategoryPhoneCall(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioSystemController.m", 54, @"%s", dlerror());

  __break(1u);
}

- (void)_pickableRoutesForPhoneCallWithForceNewRequest:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "_pickableRoutesForPhoneCallWithForceNewRequest", v2, v3, v4, v5, v6);
}

- (void)currentlyPickedRouteIdForCategory:andMode:.cold.1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_RouteCurrentlyPicked(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioSystemController.m", 40, @"%s", dlerror());

  __break(1u);
}

- (void)currentlyPickedRouteIdForCategory:andMode:.cold.2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_RouteUID(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioSystemController.m", 41, @"%s", dlerror());

  __break(1u);
}

- (void)_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "_pickableRoutesForPlayAndRecordVoiceWithForceNewRequest", v2, v3, v4, v5, v6);
}

- (void)_pickableRoutesForPlayAndRecordVideoWithForceNewRequest:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "_pickableRoutesForPlayAndRecordVideoWithForceNewRequest", v2, v3, v4, v5, v6);
}

- (void)_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "_pickableRoutesForPlayAndRecordRemoteVoiceWithForceNewRequest", v2, v3, v4, v5, v6);
}

- (void)_pickableRoutesForVoiceMailWithForceNewRequest:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "_pickableRoutesForVoiceMailWithForceNewRequest", v2, v3, v4, v5, v6);
}

+ (void)filteredPickableRoutesFromPickableRoutes:.cold.1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_AVAudioRouteName(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioSystemController.m", 39, @"%s", dlerror());

  __break(1u);
}

- (void)otherSessionsRequestNoRingtoneInterruption
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_SomeSessionIsActiveThatPrefersNoInterruptionsByRingtonesAndAlertsAttribute(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioSystemController.m", 42, @"%s", dlerror());

  __break(1u);
}

@end