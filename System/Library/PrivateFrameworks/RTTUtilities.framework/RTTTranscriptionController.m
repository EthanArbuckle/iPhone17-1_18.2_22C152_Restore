@interface RTTTranscriptionController
- (AXLTLiveTranscription)transcriber;
- (NSString)currentCallUUID;
- (NSString)currentTranscription;
- (RTTTranscriptionController)init;
- (RTTTranscriptionController)initWithDelegate:(id)a3;
- (RTTTranscriptionControllerDelegate)delegate;
- (void)setCurrentCallUUID:(id)a3;
- (void)setCurrentTranscription:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTranscriber:(id)a3;
- (void)startTranscribingForCallUUID:(id)a3;
- (void)stopTranscribingForCallUUID:(id)a3;
@end

@implementation RTTTranscriptionController

- (RTTTranscriptionController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(RTTTranscriptionController *)self init];
  v6 = v5;
  if (v5) {
    [(RTTTranscriptionController *)v5 setDelegate:v4];
  }

  return v6;
}

- (RTTTranscriptionController)init
{
  v7.receiver = self;
  v7.super_class = (Class)RTTTranscriptionController;
  v2 = [(RTTTranscriptionController *)&v7 init];
  if (v2)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2050000000;
    v3 = (void *)getAXLTLiveTranscriptionClass_softClass;
    uint64_t v12 = getAXLTLiveTranscriptionClass_softClass;
    if (!getAXLTLiveTranscriptionClass_softClass)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __getAXLTLiveTranscriptionClass_block_invoke;
      v8[3] = &unk_264540250;
      v8[4] = &v9;
      __getAXLTLiveTranscriptionClass_block_invoke((uint64_t)v8);
      v3 = (void *)v10[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v9, 8);
    v5 = objc_opt_new();
    [(RTTTranscriptionController *)v2 setTranscriber:v5];
  }
  return v2;
}

- (void)startTranscribingForCallUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[RTTSettings sharedInstance];
  if (([v5 rttLiveTranscriptionsFeatureFlagEnabled] & 1) == 0)
  {
LABEL_16:

    goto LABEL_17;
  }
  v6 = +[RTTSettings sharedInstance];
  int v7 = [v6 rttLiveTranscriptionsEnabled];

  if (!v7) {
    goto LABEL_17;
  }
  v8 = [(RTTTranscriptionController *)self currentCallUUID];
  int v9 = [v8 isEqualToString:v4];

  if (!v9)
  {
    uint64_t v11 = [(RTTTranscriptionController *)self currentCallUUID];

    if (v11)
    {
      uint64_t v12 = [(RTTTranscriptionController *)self currentCallUUID];
      [(RTTTranscriptionController *)self stopTranscribingForCallUUID:v12];
    }
    v13 = [(RTTTranscriptionController *)self transcriber];
    id v16 = 0;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __59__RTTTranscriptionController_startTranscribingForCallUUID___block_invoke;
    v17[3] = &unk_264540878;
    v17[4] = self;
    [v13 startTranscribing:1 targetPID:4294967294 callbackBlock:v17 error:&v16];
    id v5 = v16;

    v14 = AXLogRTT();
    v15 = v14;
    if (v5)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[RTTTranscriptionController startTranscribingForCallUUID:]((uint64_t)v5, v15);
      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v4;
        _os_log_impl(&dword_21FEA9000, v15, OS_LOG_TYPE_INFO, "Started transcription for callUUID %@", buf, 0xCu);
      }

      [(RTTTranscriptionController *)self setCurrentTranscription:0];
      [(RTTTranscriptionController *)self setCurrentCallUUID:v4];
    }
    goto LABEL_16;
  }
  v10 = AXLogRTT();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Already transcribing for callUUID %@", buf, 0xCu);
  }

LABEL_17:
}

void __59__RTTTranscriptionController_startTranscribingForCallUUID___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  v3 = [*(id *)(a1 + 32) currentCallUUID];

  id v4 = v14;
  if (v3)
  {
    id v5 = [v14 transcribedText];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      int v7 = NSString;
      v8 = ttyLocString(@"RTTTranscriptionPrefix");
      int v9 = [v14 transcribedText];
      v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);

      uint64_t v11 = [*(id *)(a1 + 32) currentTranscription];

      uint64_t v12 = [*(id *)(a1 + 32) delegate];
      v13 = [*(id *)(a1 + 32) currentCallUUID];
      if (v11) {
        [v12 transcriptionDidUpdate:v10 forCallUUID:v13];
      }
      else {
        [v12 transcriptionDidStart:v10 forCallUUID:v13];
      }

      [*(id *)(a1 + 32) setCurrentTranscription:v10];
    }
    else
    {
      [*(id *)(a1 + 32) setCurrentTranscription:0];
    }
    id v4 = v14;
  }
}

- (void)stopTranscribingForCallUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RTTTranscriptionController *)self currentCallUUID];
  char v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    int v7 = [(RTTTranscriptionController *)self transcriber];
    id v11 = 0;
    [v7 stopTranscribing:1 targetPID:4294967294 error:&v11];
    v8 = v11;

    int v9 = AXLogRTT();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RTTTranscriptionController stopTranscribingForCallUUID:]((uint64_t)v8, v10);
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Stopped transcription for callUUID %@", buf, 0xCu);
      }

      [(RTTTranscriptionController *)self setCurrentTranscription:0];
      [(RTTTranscriptionController *)self setCurrentCallUUID:0];
    }
  }
  else
  {
    v8 = AXLogRTT();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Already not transcribing for callUUID %@", buf, 0xCu);
    }
  }
}

- (AXLTLiveTranscription)transcriber
{
  return self->_transcriber;
}

- (void)setTranscriber:(id)a3
{
}

- (RTTTranscriptionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTTTranscriptionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)currentTranscription
{
  return self->_currentTranscription;
}

- (void)setCurrentTranscription:(id)a3
{
}

- (NSString)currentCallUUID
{
  return self->_currentCallUUID;
}

- (void)setCurrentCallUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCallUUID, 0);
  objc_storeStrong((id *)&self->_currentTranscription, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_transcriber, 0);
}

- (void)startTranscribingForCallUUID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FEA9000, a2, OS_LOG_TYPE_ERROR, "Failed to start transcribing: %@", (uint8_t *)&v2, 0xCu);
}

- (void)stopTranscribingForCallUUID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FEA9000, a2, OS_LOG_TYPE_ERROR, "Failed to stop transcribing: %@", (uint8_t *)&v2, 0xCu);
}

@end