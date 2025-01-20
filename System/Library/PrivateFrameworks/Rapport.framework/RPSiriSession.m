@interface RPSiriSession
- (BOOL)isDestinationPTTEligible;
- (BOOL)voiceControllerSetupAndReturnError:(id *)a3;
- (NSString)description;
- (NSString)destinationID;
- (NSString)sourceID;
- (RPMessageable)messenger;
- (RPSiriSession)init;
- (RPSiriSessionDelegate)delegate;
- (void)_activate2;
- (void)_activateCompletedWithError:(id)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidateWithCompletion:(id)a3;
- (void)_invalidated;
- (void)_recordingLimitTimerFired;
- (void)_recordingLimitTimerStart:(unsigned int)a3;
- (void)_sendSiriStop;
- (void)_startActivationWithDestinationID:(id)a3 messenger:(id)a4 completion:(id)a5;
- (void)_stopRecording;
- (void)_teardownVoiceController;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithCompletion:(id)a3;
- (void)prewarmWithCompletion:(id)a3;
- (void)receivedButtonUpWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationID:(id)a3;
- (void)setIsDestinationPTTEligible:(BOOL)a3;
- (void)setMessenger:(id)a3;
- (void)setSourceID:(id)a3;
- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5;
- (void)voiceControllerDidDetectEndpoint:(id)a3 ofType:(int)a4 atTime:(double)a5;
- (void)voiceControllerDidDetectStartpoint:(id)a3;
- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5;
- (void)voiceControllerEncoderErrorDidOccur:(id)a3 error:(id)a4;
- (void)voiceControllerMediaServicesWereReset:(id)a3;
- (void)voiceControllerTearDown;
@end

@implementation RPSiriSession

- (RPSiriSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPSiriSession;
  v2 = [(RPSiriSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_isSourcePTTEligible = _os_feature_enabled_impl();
    v4 = v3;
  }

  return v3;
}

- (void)setMessenger:(id)a3
{
  v5 = (RPMessageable *)a3;
  if (self->_messenger != v5)
  {
    objc_storeStrong((id *)&self->_messenger, a3);
    if (_os_feature_enabled_impl())
    {
      if ([(RPSiriSession *)self isDestinationPTTEligible])
      {
        messenger = self->_messenger;
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __30__RPSiriSession_setMessenger___block_invoke;
        v7[3] = &unk_1E605D5F0;
        v7[4] = self;
        [(RPMessageable *)messenger registerRequestID:@"_siriEndpoint" options:0 handler:v7];
      }
    }
  }
}

void __30__RPSiriSession_setMessenger___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  {
    id v9 = v10;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_stopRecording", v9);
  (*((void (**)(id, void, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CC08], 0, 0);
}

- (void)_stopRecording
{
  int startRecordingState = self->_startRecordingState;
  if (startRecordingState == 6 || startRecordingState == 1)
  {
    id v4 = [(RPSiriSession *)self delegate];
    [v4 rpSiriSessionDidReceiveStopRecording];
  }
}

- (NSString)description
{
  NSAppendPrintF();
  id v2 = 0;
  return (NSString *)v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5 = [(RPMessageable *)self->_messenger dispatchQueue];
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  id v7 = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__RPSiriSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_1E605B650;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

uint64_t __40__RPSiriSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)prewarmWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(RPMessageable *)self->_messenger dispatchQueue];
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  id v7 = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__RPSiriSession_prewarmWithCompletion___block_invoke;
  v9[3] = &unk_1E605B650;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __39__RPSiriSession_prewarmWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = 0;
  char v3 = [v2 voiceControllerSetupAndReturnError:&v6];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }
  if (v3)
  {
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
LABEL_9:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPSiriSession <= 90 {
         && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_9;
  }
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_destinationID;
  if (v5)
  {
    id v6 = self->_messenger;
    if (v6)
    {
      if (self->_activateState)
      {
        if (gLogCategory_RPSiriSession <= 40
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        uint64_t activateState = self->_activateState;
        id v8 = RPErrorF();
        if (_os_feature_enabled_impl()
          && [(RPSiriSession *)self isDestinationPTTEligible]
          && ((int startRecordingState = self->_startRecordingState, startRecordingState == 6) || startRecordingState == 1))
        {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v11 = [NSNumber numberWithBool:self->_isSourcePTTEligible];
          [v10 setObject:v11 forKeyedSubscript:@"_pttEligible"];

          if (gLogCategory_RPSiriSession <= 40
            && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __41__RPSiriSession__activateWithCompletion___block_invoke;
          v15[3] = &unk_1E605BF98;
          id v16 = v4;
          [(RPMessageable *)v6 sendRequestID:@"_siriStartWhileRecording" request:MEMORY[0x1E4F1CC08] destinationID:v5 options:v10 responseHandler:v15];
        }
        else if (v4)
        {
          (*((void (**)(id, void *))v4 + 2))(v4, v8);
        }
      }
      else if (self->_voiceController)
      {
        [(RPSiriSession *)self _startActivationWithDestinationID:v5 messenger:v6 completion:v4];
      }
      else
      {
        if (gLogCategory_RPSiriSession <= 40
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __41__RPSiriSession__activateWithCompletion___block_invoke_2;
        v13[3] = &unk_1E605D618;
        v13[4] = self;
        v13[5] = v5;
        v13[6] = v6;
        id v14 = v4;
        [(RPSiriSession *)self prewarmWithCompletion:v13];
      }
    }
    else
    {
      id v7 = RPErrorF();
      if (gLogCategory_RPSiriSession <= 90
        && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (v4) {
        (*((void (**)(id, void *))v4 + 2))(v4, v7);
      }
    }
  }
  else
  {
    RPErrorF();
    id v6 = (RPMessageable *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPSiriSession <= 90
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v4) {
      (*((void (**)(id, RPMessageable *))v4 + 2))(v4, v6);
    }
  }
}

void __41__RPSiriSession__activateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);
  }
}

void __41__RPSiriSession__activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (!v3)
  {
    [*(id *)(a1 + 32) _startActivationWithDestinationID:*(void *)(a1 + 40) messenger:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
LABEL_9:
    id v4 = v7;
    goto LABEL_10;
  }
  id v4 = v3;
  if (gLogCategory_RPSiriSession <= 90)
  {
    if (gLogCategory_RPSiriSession != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
    {
      LogPrintF();
      id v4 = v7;
    }
  }
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_startActivationWithDestinationID:(id)a3 messenger:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  self->_uint64_t activateState = 1;
  id v10 = (void *)MEMORY[0x1B3EBCC80](a5);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = v10;

  objc_storeStrong((id *)&self->_selfRef, self);
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  {
    id v15 = v8;
    LogPrintF();
  }
  [(RPSiriSession *)self _activate2];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v13 = [NSNumber numberWithBool:self->_isSourcePTTEligible];
  [v12 setObject:v13 forKeyedSubscript:@"_pttEligible"];

  if (_os_feature_enabled_impl())
  {
    if ([(RPSiriSession *)self isDestinationPTTEligible])
    {
      sourceID = self->_sourceID;
      if (sourceID) {
        [v12 setObject:sourceID forKeyedSubscript:@"senderIDS"];
      }
    }
  }
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__RPSiriSession__startActivationWithDestinationID_messenger_completion___block_invoke;
  v16[3] = &unk_1E605C360;
  v16[4] = self;
  [v9 sendRequestID:@"_siriStart" request:MEMORY[0x1E4F1CC08] destinationID:v8 options:v12 responseHandler:v16];
}

void __72__RPSiriSession__startActivationWithDestinationID_messenger_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v8)
  {
    id v9 = *(_DWORD **)(a1 + 32);
    if (v9[4] == 1) {
      [v9 _activateCompletedWithError:v8];
    }
  }
}

- (void)_activate2
{
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_int startRecordingState = 1;
  id v3 = (void *)[objc_alloc((Class)getAVVCStartRecordSettingsClass[0]()) initWithStreamID:self->_streamId atStartHostTime:0];
  voiceController = self->_voiceController;
  id v8 = 0;
  char v5 = [(AVVoiceController *)voiceController startRecordForStream:v3 error:&v8];
  id v6 = v8;
  [(RPSiriSession *)self _recordingLimitTimerStart:60];
  if ((v5 & 1) == 0)
  {
    self->_int startRecordingState = 3;
    id v7 = RPNestedErrorF();
    [(RPSiriSession *)self _activateCompletedWithError:v7];
  }
}

- (void)_activateCompletedWithError:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    if (gLogCategory_RPSiriSession <= 90
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v4 = 3;
  }
  else
  {
    int v4 = 4;
  }
  self->_uint64_t activateState = v4;
  char v5 = (void (**)(void, void))MEMORY[0x1B3EBCC80](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v5) {
    ((void (**)(void, id))v5)[2](v5, v7);
  }
  if (self->_invalidateCalled) {
    [(RPSiriSession *)self _invalidated];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__RPSiriSession_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__RPSiriSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithCompletion:0];
}

- (void)invalidateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__RPSiriSession_invalidateWithCompletion___block_invoke;
  v7[3] = &unk_1E605B650;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __42__RPSiriSession_invalidateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithCompletion:*(void *)(a1 + 40)];
}

- (void)receivedButtonUpWithCompletion:(id)a3
{
  if (_os_feature_enabled_impl()
    && [(RPSiriSession *)self isDestinationPTTEligible])
  {
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(RPSiriSession *)self _sendSiriStop];
  }
}

- (void)_sendSiriStop
{
  int activateState = self->_activateState;
  if (activateState == 4 || activateState == 1)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    char v5 = [NSNumber numberWithBool:self->_isSourcePTTEligible];
    [v6 setObject:v5 forKeyedSubscript:@"_pttEligible"];

    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(RPMessageable *)self->_messenger sendRequestID:@"_siriStop" request:MEMORY[0x1E4F1CC08] destinationID:self->_destinationID options:v6 responseHandler:&__block_literal_global_14];
  }
  else
  {
    if (gLogCategory_RPSiriSession <= 40
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(RPSiriSession *)self invalidateWithCompletion:0];
  }
}

void __30__RPSiriSession__sendSiriStop__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v6 = a3;
  id v7 = a4;
  if (v7
    && gLogCategory_RPSiriSession <= 90
    && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_invalidateWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int activateState = self->_activateState;
    self->_int activateState = 7;
    [(RPSiriSession *)self voiceControllerTearDown];
    if (!_os_feature_enabled_impl()
      || ![(RPSiriSession *)self isDestinationPTTEligible])
    {
      if (activateState == 4 || activateState == 1)
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v7 = [NSNumber numberWithBool:self->_isSourcePTTEligible];
        [v6 setObject:v7 forKeyedSubscript:@"_pttEligible"];

        if (gLogCategory_RPSiriSession <= 30
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        messenger = self->_messenger;
        destinationID = self->_destinationID;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __43__RPSiriSession__invalidateWithCompletion___block_invoke;
        v16[3] = &unk_1E605D4C0;
        v16[4] = self;
        id v17 = v4;
        [(RPMessageable *)messenger sendRequestID:@"_siriStop" request:MEMORY[0x1E4F1CC08] destinationID:destinationID options:v6 responseHandler:v16];
        v11 = self->_messenger;
        self->_messenger = 0;
      }
      else
      {
        id v8 = self->_messenger;
        self->_messenger = 0;

        [(RPSiriSession *)self _invalidated];
      }
    }
    id v12 = self->_messenger;
    self->_messenger = 0;

    [(RPSiriSession *)self _invalidated];
    if (_os_feature_enabled_impl()
      && [(RPSiriSession *)self isDestinationPTTEligible])
    {
      [(RPMessageable *)self->_messenger deregisterRequestID:@"_siriEndpoint"];
    }
    recordingLimitTimer = self->_recordingLimitTimer;
    if (recordingLimitTimer)
    {
      id v14 = recordingLimitTimer;
      dispatch_source_cancel(v14);
      id v15 = self->_recordingLimitTimer;
      self->_recordingLimitTimer = 0;
    }
  }
}

void __43__RPSiriSession__invalidateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (gLogCategory_RPSiriSession <= 90
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      id v10 = v8;
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPSiriSession <= 30 {
         && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "_invalidated", v10);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);
  }
}

- (void)_teardownVoiceController
{
  voiceController = self->_voiceController;
  if (voiceController)
  {
    id v8 = 0;
    [(AVVoiceController *)voiceController teardownWithError:&v8];
    id v4 = v8;
    char v5 = v4;
    if (v4)
    {
      if (gLogCategory_RPSiriSession <= 90)
      {
        if (gLogCategory_RPSiriSession != -1 || (id v4 = (id)_LogCategory_Initialize(), v4)) {
          id v4 = (id)LogPrintF();
        }
      }
    }
    id v6 = (void *)MEMORY[0x1B3EBCA50](v4);
    id v7 = self->_voiceController;
    self->_voiceController = 0;
  }
}

- (void)dealloc
{
  [(RPSiriSession *)self _teardownVoiceController];
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v3.receiver = self;
  v3.super_class = (Class)RPSiriSession;
  [(RPSiriSession *)&v3 dealloc];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_messenger)
  {
    int startRecordingState = self->_startRecordingState;
    if (startRecordingState != 1 && startRecordingState != 6 && self->_stopRecordingState != 1)
    {
      [(AVVoiceController *)self->_voiceController deactivateAudioSessionForStream:self->_streamId withOptions:1 error:0];
      if (self->_voiceController)
      {
        [(RPSiriSession *)self _teardownVoiceController];
        if (gLogCategory_RPSiriSession <= 30
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      voiceController = self->_voiceController;
      self->_voiceController = 0;

      delegate = self->_delegate;
      self->_delegate = 0;

      self->_streamId = 0;
      self->_invalidateDone = 1;
      if (gLogCategory_RPSiriSession <= 30
        && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      selfRef = self->_selfRef;
      self->_selfRef = 0;
    }
  }
}

- (BOOL)voiceControllerSetupAndReturnError:(id *)a3
{
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v29 = 0x40CF400000000000;
  LODWORD(v30) = 1869641075;
  HIDWORD(v30) = 320;
  DWORD1(v31) = 1;
  char v5 = (AVAudioFormat *)[objc_alloc((Class)getAVAudioFormatClass[0]()) initWithStreamDescription:&v29];
  audioFormat = self->_audioFormat;
  self->_audioFormat = v5;

  if (self->_audioFormat)
  {
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      v22 = &v29;
      LogPrintF();
    }
    voiceController = self->_voiceController;
    if (voiceController)
    {
      id v9 = 0;
    }
    else
    {
      id v28 = 0;
      id v10 = (AVVoiceController *)[objc_alloc((Class)getAVVoiceControllerClass[0]()) initVoiceControllerForClient:3 withError:&v28];
      id v9 = v28;
      id v11 = self->_voiceController;
      self->_voiceController = v10;

      voiceController = self->_voiceController;
      if (!voiceController)
      {
        if (a3)
        {
          RPNestedErrorF();
          char v7 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          char v7 = 0;
        }
LABEL_38:

        return v7;
      }
    }
    -[AVVoiceController setRecordDelegate:](voiceController, "setRecordDelegate:", self, v22);
    id v12 = (void *)[objc_alloc((Class)getAVVCContextSettingsClass[0]()) initWithMode:1969840752 deviceUID:0];
    id v26 = v9;
    uint64_t v27 = 0;
    unint64_t v13 = [(AVVoiceController *)self->_voiceController setContext:v12 streamType:&v27 error:&v26];
    id v14 = v26;

    if (v13)
    {
      self->_unint64_t streamId = v13;
      if (gLogCategory_RPSiriSession <= 30
        && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
      {
        unint64_t v23 = v13;
        LogPrintF();
      }
      id v15 = [(AVAudioFormat *)self->_audioFormat settings];
      if (v15)
      {
        id v16 = self->_voiceController;
        unint64_t streamId = self->_streamId;
        id v25 = v14;
        [(AVVoiceController *)v16 activateAudioSessionForStream:streamId isPrewarm:1 recordMode:1 error:&v25];
        id v18 = v25;

        if (gLogCategory_RPSiriSession <= 30
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v19 = (void *)[objc_alloc((Class)getAVVCPrepareRecordSettingsClass[0]()) initWithStreamID:self->_streamId settings:v15 bufferDuration:0.1];
        [v19 setMeteringEnabled:1];
        v20 = self->_voiceController;
        id v24 = v18;
        char v7 = [(AVVoiceController *)v20 prepareRecordForStream:v19 error:&v24];
        id v14 = v24;

        if (v14) {
          char v7 = 0;
        }
        if (a3 && (v7 & 1) == 0)
        {
          RPNestedErrorF();
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (a3)
      {
        RPErrorF();
        char v7 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v7 = 0;
      }
    }
    else if (a3)
    {
      RPNestedErrorF();
      char v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v7 = 0;
    }

    id v9 = v14;
    goto LABEL_38;
  }
  if (!a3) {
    return 0;
  }
  RPErrorF();
  char v7 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void)voiceControllerTearDown
{
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  *(void *)&self->_int startRecordingState = 0x100000007;
  voiceController = self->_voiceController;
  if (voiceController)
  {
    unint64_t streamId = self->_streamId;
    id v7 = 0;
    char v5 = [(AVVoiceController *)voiceController stopRecordForStream:streamId error:&v7];
    id v6 = v7;
    if ((v5 & 1) == 0
      && gLogCategory_RPSiriSession <= 90
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_RPSiriSession <= 40
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v6 = 0;
  }
}

- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  id v9 = a6;
  dispatchQueue = self->_dispatchQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__RPSiriSession_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke;
  v12[3] = &unk_1E605D640;
  BOOL v15 = a5;
  v12[4] = self;
  id v13 = v9;
  unint64_t v14 = a4;
  id v11 = v9;
  dispatch_async(dispatchQueue, v12);
}

void __79__RPSiriSession_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    if (*(void *)(a1 + 40)) {
      int v2 = 3;
    }
    else {
      int v2 = 6;
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = v2;
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v4 = *(unsigned char **)(a1 + 32);
    if (v4[40])
    {
      [v4 voiceControllerTearDown];
      id v4 = *(unsigned char **)(a1 + 32);
    }
    [v4 _activateCompletedWithError:0];
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 3;
    objc_super v3 = *(void **)(a1 + 32);
    RPNestedErrorF();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v3 _activateCompletedWithError:v5];
  }
}

- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__RPSiriSession_voiceControllerDidStopRecording_forStream_forReason___block_invoke;
  block[3] = &unk_1E605CD30;
  block[4] = self;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async(dispatchQueue, block);
}

unsigned char *__69__RPSiriSession_voiceControllerDidStopRecording_forStream_forReason___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 60) = 5;
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  result = *(unsigned char **)(a1 + 32);
  if (result[40])
  {
    return (unsigned char *)[result _invalidated];
  }
  return result;
}

- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5
{
  id v7 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RPSiriSession_voiceControllerAudioCallback_forStream_buffer___block_invoke;
  block[3] = &unk_1E605D668;
  id v11 = v7;
  unint64_t v12 = a4;
  block[4] = self;
  id v9 = v7;
  dispatch_async(dispatchQueue, block);
}

void __63__RPSiriSession_voiceControllerAudioCallback_forStream_buffer___block_invoke(uint64_t a1)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 56) == 6)
  {
    [*(id *)(v1 + 64) updateMeterForStream:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 64) getAveragePowerForStream:*(void *)(a1 + 48) forChannel:0];
    float v4 = __exp10f(v3 / 20.0);
    if (gLogCategory_RPSiriSession <= 10
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = [*(id *)(a1 + 40) timeStamp];
      uint64_t v6 = [*(id *)(a1 + 40) bytesDataSize];
      double v23 = v4;
      uint64_t v21 = [*(id *)(a1 + 40) packetDescriptionCount];
      uint64_t v22 = [*(id *)(a1 + 40) channels];
      uint64_t v19 = v5;
      uint64_t v20 = v6;
      LogPrintF();
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = [*(id *)(a1 + 40) packetDescriptions];
    int v9 = [*(id *)(a1 + 40) packetDescriptionCount];
    if (v9)
    {
      uint64_t v10 = 16 * v9;
      do
      {
        v26[0] = &unk_1F0C376D8;
        id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v8 + 12), v19, v20, v21, v22, *(void *)&v23);
        v26[1] = &unk_1F0C376F0;
        v27[0] = v11;
        uint64_t v12 = *(void *)v8;
        v8 += 16;
        id v13 = [NSNumber numberWithLongLong:v12];
        v27[1] = v13;
        unint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
        [v7 addObject:v14];

        v10 -= 16;
      }
      while (v10);
    }
    BOOL v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", objc_msgSend(*(id *)(a1 + 40), "data"), (int)objc_msgSend(*(id *)(a1 + 40), "bytesDataSize"));
    v25[0] = v15;
    v24[0] = &unk_1F0C37708;
    v24[1] = &unk_1F0C37720;
    *(float *)&double v16 = v4;
    id v17 = [NSNumber numberWithFloat:v16];
    v24[2] = &unk_1F0C37738;
    v25[1] = v17;
    v25[2] = v7;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

    [*(id *)(*(void *)(a1 + 32) + 112) sendEventID:@"_siA" event:v18 destinationID:*(void *)(*(void *)(a1 + 32) + 96) options:0 completion:0];
  }
}

- (void)voiceControllerDidDetectStartpoint:(id)a3
{
  id v3 = a3;
  float v4 = v3;
  if (gLogCategory_RPSiriSession <= 30)
  {
    id v6 = v3;
    if (gLogCategory_RPSiriSession != -1 || (v5 = _LogCategory_Initialize(), float v4 = v6, v5))
    {
      LogPrintF();
      float v4 = v6;
    }
  }
}

- (void)voiceControllerDidDetectEndpoint:(id)a3 ofType:(int)a4 atTime:(double)a5
{
  id v5 = a3;
  id v6 = v5;
  if (gLogCategory_RPSiriSession <= 30)
  {
    id v8 = v5;
    if (gLogCategory_RPSiriSession != -1 || (v7 = _LogCategory_Initialize(), id v6 = v8, v7))
    {
      LogPrintF();
      id v6 = v8;
    }
  }
}

- (void)voiceControllerEncoderErrorDidOccur:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (gLogCategory_RPSiriSession <= 90 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)voiceControllerMediaServicesWereReset:(id)a3
{
  id v3 = a3;
  float v4 = v3;
  if (gLogCategory_RPSiriSession <= 60)
  {
    id v6 = v3;
    if (gLogCategory_RPSiriSession != -1 || (v5 = _LogCategory_Initialize(), float v4 = v6, v5))
    {
      LogPrintF();
      float v4 = v6;
    }
  }
}

- (void)_recordingLimitTimerStart:(unsigned int)a3
{
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  recordingLimitTimer = self->_recordingLimitTimer;
  if (recordingLimitTimer)
  {
    int v5 = recordingLimitTimer;
    dispatch_source_cancel(v5);
    id v6 = self->_recordingLimitTimer;
    self->_recordingLimitTimer = 0;
  }
  int v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  id v8 = self->_recordingLimitTimer;
  self->_recordingLimitTimer = v7;
  int v9 = v7;

  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __43__RPSiriSession__recordingLimitTimerStart___block_invoke;
  handler[3] = &unk_1E605B5D8;
  handler[4] = v9;
  handler[5] = self;
  dispatch_source_set_event_handler(v9, handler);
  CUDispatchTimerSet();
  dispatch_activate(v9);
}

void *__43__RPSiriSession__recordingLimitTimerStart___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[10]) {
    return (void *)[result _recordingLimitTimerFired];
  }
  return result;
}

- (void)_recordingLimitTimerFired
{
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (_os_feature_enabled_impl()
    && [(RPSiriSession *)self isDestinationPTTEligible])
  {
    [(RPSiriSession *)self _stopRecording];
  }
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (void)setDestinationID:(id)a3
{
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(id)a3
{
}

- (BOOL)isDestinationPTTEligible
{
  return self->_isDestinationPTTEligible;
}

- (void)setIsDestinationPTTEligible:(BOOL)a3
{
  self->_isDestinationPTTEligible = a3;
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (RPSiriSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_recordingLimitTimer, 0);
  objc_storeStrong((id *)&self->_voiceController, 0);
  objc_storeStrong((id *)&self->_selfRef, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_audioFormat, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end