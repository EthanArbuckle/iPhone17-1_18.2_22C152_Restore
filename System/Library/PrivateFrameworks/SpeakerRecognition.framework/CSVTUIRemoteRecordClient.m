@interface CSVTUIRemoteRecordClient
- (BOOL)didPlayEndpointBeep;
- (BOOL)hasPendingTwoShotBeep;
- (BOOL)isConnected;
- (BOOL)isRecording;
- (BOOL)startRecordingWithOptions:(id)a3 error:(id *)a4;
- (BOOL)stopRecording:(id *)a3;
- (BOOL)waitingForConnection:(double)a3 error:(id *)a4;
- (CSVTUIRemoteRecordClient)init;
- (CSVTUIRemoteRecordClient)initWithDeviceId:(id)a3 audioStreamHandleId:(unint64_t)a4;
- (CSVTUIRemoteRecordClientDelegate)delegate;
- (NSString)deviceId;
- (OS_remote_device)device;
- (id)voiceTriggerEventInfo;
- (unint64_t)audioStreamHandleId;
- (void)_handleDidStartRecordingMessage:(id)a3;
- (void)_handleServerError:(id)a3;
- (void)_handleServerEvent:(id)a3;
- (void)_handleServerMessage:(id)a3;
- (void)_handleTwoShotDetectedMessage:(id)a3;
- (void)dealloc;
- (void)didDeviceConnect:(id)a3;
- (void)didDeviceDisconnect:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation CSVTUIRemoteRecordClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceWaitingGroup, 0);
  objc_storeStrong((id *)&self->_deviceBrowser, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDevice:(id)a3
{
}

- (OS_remote_device)device
{
  return self->_device;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (unint64_t)audioStreamHandleId
{
  return self->_audioStreamHandleId;
}

- (void)setDelegate:(id)a3
{
}

- (CSVTUIRemoteRecordClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSVTUIRemoteRecordClientDelegate *)WeakRetained;
}

- (BOOL)hasPendingTwoShotBeep
{
  v23[1] = *MEMORY[0x263EF8340];
  v22 = @"COMMAND";
  v23[0] = @"hasPendingTwoShotBeep";
  v3 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__CSVTUIRemoteRecordClient_hasPendingTwoShotBeep__block_invoke;
  v12[3] = &unk_264429500;
  v12[4] = self;
  id v6 = v3;
  id v13 = v6;
  v15 = &v16;
  v7 = v4;
  v14 = v7;
  dispatch_async(queue, v12);
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSVTUIRemoteRecordClient hasPendingTwoShotBeep]";
      _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, "%s Getting reply timed out!!", buf, 0xCu);
    }
  }
  char v10 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __49__CSVTUIRemoteRecordClient_hasPendingTwoShotBeep__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    long long v5 = *(_OWORD *)(a1 + 48);
    id v3 = (id)v5;
    xpc_remote_connection_send_message_with_reply();
  }
  else
  {
    dispatch_semaphore_t v4 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSVTUIRemoteRecordClient hasPendingTwoShotBeep]_block_invoke";
      _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s Cannot ask hasPendingTwoShotBeep while connection does not exist", buf, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void __49__CSVTUIRemoteRecordClient_hasPendingTwoShotBeep__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (MEMORY[0x21D4B2B70]() == MEMORY[0x263EF8708])
  {
    id v3 = objc_alloc(NSDictionary);
    dispatch_semaphore_t v4 = objc_msgSend(v3, "_cs_initWithXPCObject:", v7);

    if (v4)
    {
      long long v5 = [v4 objectForKeyedSubscript:@"replyHasPendingTwoShotBeep"];

      if (v5)
      {
        id v6 = [v4 objectForKeyedSubscript:@"replyHasPendingTwoShotBeep"];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 BOOLValue];
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (id)voiceTriggerEventInfo
{
  v30[1] = *MEMORY[0x263EF8340];
  v29 = @"COMMAND";
  v30[0] = @"voiceTriggerEventInfo";
  id v3 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4111;
  v23 = __Block_byref_object_dispose__4112;
  id v24 = 0;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__CSVTUIRemoteRecordClient_voiceTriggerEventInfo__block_invoke;
  v15[3] = &unk_264429500;
  v15[4] = self;
  id v6 = v3;
  id v16 = v6;
  uint64_t v18 = &v19;
  id v7 = v4;
  v17 = v7;
  dispatch_async(queue, v15);
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  intptr_t v9 = dispatch_semaphore_wait(v7, v8);
  char v10 = (NSObject **)MEMORY[0x263F37FA8];
  v11 = *MEMORY[0x263F37FA8];
  if (v9 && os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[CSVTUIRemoteRecordClient voiceTriggerEventInfo]";
    _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s Getting reply timed out!!", buf, 0xCu);
    v11 = *v10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v20[5];
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSVTUIRemoteRecordClient voiceTriggerEventInfo]";
    __int16 v27 = 2114;
    uint64_t v28 = v12;
    _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Raw VoiceTriggerEventInfo from remote = %{public}@", buf, 0x16u);
  }
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v13;
}

void __49__CSVTUIRemoteRecordClient_voiceTriggerEventInfo__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    long long v5 = *(_OWORD *)(a1 + 48);
    id v3 = (id)v5;
    xpc_remote_connection_send_message_with_reply();
  }
  else
  {
    dispatch_semaphore_t v4 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v7 = "-[CSVTUIRemoteRecordClient voiceTriggerEventInfo]_block_invoke";
      _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s Cannot ask VoiceTriggerEventInfo while connection does not exist", buf, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void __49__CSVTUIRemoteRecordClient_voiceTriggerEventInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (MEMORY[0x21D4B2B70]() == MEMORY[0x263EF8708])
  {
    id v3 = objc_alloc(NSDictionary);
    dispatch_semaphore_t v4 = objc_msgSend(v3, "_cs_initWithXPCObject:", v9);

    if (v4)
    {
      long long v5 = [v4 objectForKeyedSubscript:@"replyVoiceTriggerEventInfo"];

      if (v5)
      {
        uint64_t v6 = [v4 objectForKeyedSubscript:@"replyVoiceTriggerEventInfo"];
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (BOOL)isRecording
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__CSVTUIRemoteRecordClient_isRecording__block_invoke;
  v5[3] = &unk_26442A648;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__CSVTUIRemoteRecordClient_isRecording__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40);
  return result;
}

- (BOOL)didPlayEndpointBeep
{
  v24[1] = *MEMORY[0x263EF8340];
  char v3 = (os_log_t *)MEMORY[0x263F37FA8];
  dispatch_semaphore_t v4 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSVTUIRemoteRecordClient didPlayEndpointBeep]";
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  v23 = @"COMMAND";
  v24[0] = @"didPlayEndpointBeep";
  long long v5 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__CSVTUIRemoteRecordClient_didPlayEndpointBeep__block_invoke;
  v14[3] = &unk_264429500;
  v14[4] = self;
  id v8 = v5;
  id v15 = v8;
  p_long long buf = &buf;
  char v9 = v6;
  id v16 = v9;
  dispatch_async(queue, v14);
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    v11 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v18 = 136315138;
      uint64_t v19 = "-[CSVTUIRemoteRecordClient didPlayEndpointBeep]";
      _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s Getting reply timed out!!", v18, 0xCu);
    }
  }
  char v12 = *(unsigned char *)(*((void *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v12;
}

void __47__CSVTUIRemoteRecordClient_didPlayEndpointBeep__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    long long v5 = *(_OWORD *)(a1 + 48);
    id v3 = (id)v5;
    xpc_remote_connection_send_message_with_reply();
  }
  else
  {
    dispatch_semaphore_t v4 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v7 = "-[CSVTUIRemoteRecordClient didPlayEndpointBeep]_block_invoke";
      _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s Cannot ask didPlayEndpointBeep while connection does not exist", buf, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void __47__CSVTUIRemoteRecordClient_didPlayEndpointBeep__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (MEMORY[0x21D4B2B70]() == MEMORY[0x263EF8708])
  {
    id v3 = objc_alloc(NSDictionary);
    dispatch_semaphore_t v4 = objc_msgSend(v3, "_cs_initWithXPCObject:", v7);

    if (v4)
    {
      long long v5 = [v4 objectForKeyedSubscript:@"replyDidPlayEndpointBeep"];

      if (v5)
      {
        dispatch_semaphore_t v6 = [v4 objectForKeyedSubscript:@"replyDidPlayEndpointBeep"];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 BOOLValue];
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (BOOL)stopRecording:(id *)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  v17 = @"COMMAND";
  v18[0] = @"stopRecording";
  long long v5 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__CSVTUIRemoteRecordClient_stopRecording___block_invoke;
  block[3] = &unk_26442A1D8;
  block[4] = self;
  id v10 = v5;
  v11 = &v13;
  char v12 = a3;
  id v7 = v5;
  dispatch_sync(queue, block);
  LOBYTE(a3) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)a3;
}

void __42__CSVTUIRemoteRecordClient_stopRecording___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    xpc_remote_connection_send_message();

    LOBYTE(v3) = 1;
  }
  else
  {
    dispatch_semaphore_t v4 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[CSVTUIRemoteRecordClient stopRecording:]_block_invoke";
      _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s Cannot stop recording while connection does not exist", (uint8_t *)&v6, 0xCu);
    }
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3)
    {
      id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F37F98] code:302 userInfo:0];
      LOBYTE(v3) = 0;
      **(void **)(a1 + 56) = v5;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  }
}

- (BOOL)startRecordingWithOptions:(id)a3 error:(id *)a4
{
  v21[2] = *MEMORY[0x263EF8340];
  v20[0] = @"COMMAND";
  v20[1] = @"startRecordingOptions";
  v21[0] = @"startRecording";
  v21[1] = a3;
  int v6 = NSDictionary;
  id v7 = a3;
  uint64_t v8 = [v6 dictionaryWithObjects:v21 forKeys:v20 count:2];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CSVTUIRemoteRecordClient_startRecordingWithOptions_error___block_invoke;
  block[3] = &unk_26442A1D8;
  block[4] = self;
  id v13 = v8;
  v14 = &v16;
  uint64_t v15 = a4;
  id v10 = v8;
  dispatch_sync(queue, block);
  LOBYTE(a4) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)a4;
}

void __60__CSVTUIRemoteRecordClient_startRecordingWithOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_cs_xpcObject");
    xpc_remote_connection_send_message();

    LOBYTE(v3) = 1;
  }
  else
  {
    dispatch_semaphore_t v4 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[CSVTUIRemoteRecordClient startRecordingWithOptions:error:]_block_invoke";
      _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s Cannot start recording while connection does not exist", (uint8_t *)&v6, 0xCu);
    }
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3)
    {
      id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F37F98] code:302 userInfo:0];
      LOBYTE(v3) = 0;
      **(void **)(a1 + 56) = v5;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  }
}

- (void)_handleTwoShotDetectedMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v4 = (objc_class *)NSDictionary;
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = objc_msgSend(v6, "_cs_initWithXPCObject:", v5);

  if (!v7
    || ([v7 objectForKeyedSubscript:@"time"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    uint64_t v16 = *MEMORY[0x263F37FA8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v18 = 136315138;
    char v19 = "-[CSVTUIRemoteRecordClient _handleTwoShotDetectedMessage:]";
    v17 = "%s Cannot handle TwoShotDetected message since it failed to decode xpcObject to NSDictionary";
LABEL_9:
    _os_log_error_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v18, 0xCu);
    goto LABEL_10;
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0)
  {
    uint64_t v16 = *MEMORY[0x263F37FA8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v18 = 136315138;
    char v19 = "-[CSVTUIRemoteRecordClient _handleTwoShotDetectedMessage:]";
    v17 = "%s Cannot report two shot since delegate doesn't have protocol implemented";
    goto LABEL_9;
  }
  char v12 = [v7 objectForKeyedSubscript:@"time"];
  [v12 doubleValue];
  double v14 = v13;

  id v15 = objc_loadWeakRetained((id *)p_delegate);
  [v15 remoteRecordTwoShotDetectedAtTime:v14];

LABEL_10:
}

- (void)_handleDidStartRecordingMessage:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v4 = (objc_class *)NSDictionary;
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = objc_msgSend(v6, "_cs_initWithXPCObject:", v5);

  uint64_t v8 = (os_log_t *)MEMORY[0x263F37FA8];
  char v9 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315394;
    int v18 = "-[CSVTUIRemoteRecordClient _handleDidStartRecordingMessage:]";
    __int16 v19 = 2114;
    uint64_t v20 = v7;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v17, 0x16u);
  }
  id v10 = [v7 objectForKey:@"didStartRecordingError"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    if (v10)
    {
      double v13 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315394;
        int v18 = "-[CSVTUIRemoteRecordClient _handleDidStartRecordingMessage:]";
        __int16 v19 = 2114;
        uint64_t v20 = v10;
        _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s DidStartRecording error : %{public}@", (uint8_t *)&v17, 0x16u);
      }
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      unint64_t audioStreamHandleId = self->_audioStreamHandleId;
      uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F37F98] code:303 userInfo:0];
      [v14 remoteRecordDidStartRecordingWithStreamHandleId:audioStreamHandleId error:v16];
    }
    else
    {
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      [v14 remoteRecordDidStartRecordingWithStreamHandleId:self->_audioStreamHandleId error:0];
    }
  }
}

- (void)_handleServerMessage:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", xpc_dictionary_get_string(v4, "COMMAND"));
  id v6 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    int v18 = "-[CSVTUIRemoteRecordClient _handleServerMessage:]";
    __int16 v19 = 2114;
    uint64_t v20 = v5;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  if ([v5 isEqualToString:@"didStartRecording"])
  {
    [(CSVTUIRemoteRecordClient *)self _handleDidStartRecordingMessage:v4];
  }
  else if ([v5 isEqualToString:@"didStopRecording"])
  {
    self->_isRemoteRecording = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 remoteRecordDidStopRecordingWithWithStreamHandleId:self->_audioStreamHandleId error:0];
    }
  }
  else if ([v5 isEqualToString:@"LPCMBufferAvailable"])
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_alloc(NSDictionary);
      double v13 = objc_msgSend(v12, "_cs_initWithXPCObject:", v4);

      if (v13)
      {
        id v14 = [v13 objectForKeyedSubscript:@"buffer"];

        if (v14)
        {
          id v15 = [v13 objectForKeyedSubscript:@"buffer"];
          id v16 = objc_loadWeakRetained((id *)&self->_delegate);
          [v16 remoteRecordLPCMBufferAvailable:v15 streamHandleId:self->_audioStreamHandleId];
        }
      }
    }
  }
  else if ([v5 isEqualToString:@"twoShotDetected"])
  {
    [(CSVTUIRemoteRecordClient *)self _handleTwoShotDetectedMessage:v4];
  }
}

- (void)_handleServerError:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (v4 == (id)MEMORY[0x263EF86A8] || v4 == (id)MEMORY[0x263EF86A0])
    {
      id v6 = *MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        char v11 = "-[CSVTUIRemoteRecordClient _handleServerError:]";
        _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s connection disconnected", (uint8_t *)&v10, 0xCu);
      }
      if (self->_device) {
        remote_device_cancel();
      }
    }
    else
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x263EF86B0]);
      char v8 = *MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315394;
        char v11 = "-[CSVTUIRemoteRecordClient _handleServerError:]";
        __int16 v12 = 2082;
        double v13 = string;
        _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s connection error: %{public}s", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (void)_handleServerEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    uint64_t v5 = MEMORY[0x21D4B2B70](v4);
    if (MEMORY[0x21D4B2B70](v4) == MEMORY[0x263EF8720])
    {
      char v8 = *MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        int v10 = "-[CSVTUIRemoteRecordClient _handleServerEvent:]";
        _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s remoteXPC connection get failed", (uint8_t *)&v9, 0xCu);
      }
      [(CSVTUIRemoteRecordClient *)self _handleServerError:v4];
    }
    else
    {
      if (v5 == MEMORY[0x263EF8708])
      {
        [(CSVTUIRemoteRecordClient *)self _handleServerMessage:v4];
        goto LABEL_13;
      }
      id v6 = *MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        int v10 = "-[CSVTUIRemoteRecordClient _handleServerEvent:]";
        id v7 = "%s Ignore unknown type message";
LABEL_8:
        _os_log_error_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    id v6 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      int v10 = "-[CSVTUIRemoteRecordClient _handleServerEvent:]";
      id v7 = "%s cannot handle server event since event is nil";
      goto LABEL_8;
    }
  }
LABEL_13:
}

- (BOOL)isConnected
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__CSVTUIRemoteRecordClient_isConnected__block_invoke;
  v5[3] = &unk_26442A648;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__CSVTUIRemoteRecordClient_isConnected__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 16)) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)waitingForConnection:(double)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(CSDispatchGroup *)self->_deviceWaitingGroup waitWithTimeout:dispatch_time(0, (uint64_t)(a3 * 1000000000.0))];
  if (!v6)
  {
    if ([(CSVTUIRemoteRecordClient *)self isConnected])
    {
      BOOL v9 = 1;
      return !v6 && v9;
    }
    int v10 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[CSVTUIRemoteRecordClient waitingForConnection:error:]";
      _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s Device is connected but RemoteXPC service is not connected", (uint8_t *)&v13, 0xCu);
      if (!a4) {
        goto LABEL_14;
      }
    }
    else if (!a4)
    {
      goto LABEL_14;
    }
    uint64_t v8 = 302;
    goto LABEL_10;
  }
  id v7 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315138;
    uint64_t v14 = "-[CSVTUIRemoteRecordClient waitingForConnection:error:]";
    _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s Device connection waiting timed out", (uint8_t *)&v13, 0xCu);
    if (a4) {
      goto LABEL_4;
    }
  }
  else if (a4)
  {
LABEL_4:
    uint64_t v8 = 301;
LABEL_10:
    id v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F37F98] code:v8 userInfo:0];
    BOOL v9 = 0;
    *a4 = v11;
    return !v6 && v9;
  }
LABEL_14:
  BOOL v9 = 0;
  return !v6 && v9;
}

- (void)didDeviceDisconnect:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v8 = "-[CSVTUIRemoteRecordClient didDeviceDisconnect:]";
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CSVTUIRemoteRecordClient_didDeviceDisconnect___block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__CSVTUIRemoteRecordClient_didDeviceDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    [v6 remoteRecordConnectionDisconnected:*(void *)(a1 + 32)];
  }
}

- (void)didDeviceConnect:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v12 = "-[CSVTUIRemoteRecordClient didDeviceConnect:]";
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__CSVTUIRemoteRecordClient_didDeviceConnect___block_invoke;
  v8[3] = &unk_26442A138;
  id v9 = v4;
  int v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __45__CSVTUIRemoteRecordClient_didDeviceConnect___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  remote_device_get_type();
  uint64_t v2 = (void *)remote_device_copy_service();
  if (v2)
  {
    char v3 = (void *)xpc_remote_connection_create_with_remote_service();
    objc_initWeak((id *)location, *(id *)(a1 + 40));
    objc_copyWeak(&v5, (id *)location);
    xpc_remote_connection_set_event_handler();
    xpc_remote_connection_activate();
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), v3);
    [*(id *)(*(void *)(a1 + 40) + 32) leave];
    objc_destroyWeak(&v5);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v4 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[CSVTUIRemoteRecordClient didDeviceConnect:]_block_invoke";
      __int16 v7 = 2082;
      uint64_t v8 = "com.apple.corespeech.xpc.remote.record";
      _os_log_error_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_ERROR, "%s Service: %{public}s not found", location, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 40) + 32) leave];
  }
}

void __45__CSVTUIRemoteRecordClient_didDeviceConnect___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleServerEvent:v3];
}

- (void)dealloc
{
  if (self->_connection) {
    xpc_remote_connection_cancel();
  }
  if (self->_device) {
    remote_device_cancel();
  }
  v3.receiver = self;
  v3.super_class = (Class)CSVTUIRemoteRecordClient;
  [(CSVTUIRemoteRecordClient *)&v3 dealloc];
}

- (CSVTUIRemoteRecordClient)init
{
  objc_super v3 = [[CSVTUIRemoteRecordClient alloc] initWithDeviceId:0 audioStreamHandleId:1];

  return v3;
}

- (CSVTUIRemoteRecordClient)initWithDeviceId:(id)a3 audioStreamHandleId:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (([MEMORY[0x263F380D0] isDarwinOS] & 1) == 0)
  {
    v24.receiver = self;
    v24.super_class = (Class)CSVTUIRemoteRecordClient;
    self = [(CSVTUIRemoteRecordClient *)&v24 init];
    if (self)
    {
      uint64_t v9 = (OS_dispatch_queue *)dispatch_queue_create("CSRemoteRecordClient Queue", 0);
      queue = self->_queue;
      self->_queue = v9;

      id v11 = (CSDispatchGroup *)objc_alloc_init(MEMORY[0x263F38030]);
      deviceWaitingGroup = self->_deviceWaitingGroup;
      self->_deviceWaitingGroup = v11;

      objc_initWeak(&location, self);
      uint64_t v13 = self->_queue;
      if ([MEMORY[0x263F380D0] hasRemoteBuiltInMic]
        && (!v7 || [v7 isEqualToString:@"BuiltInMicrophoneDevice"]))
      {
        uint64_t v14 = (OS_remote_device *)remote_device_copy_unique_of_type();
        device = self->_device;
        self->_device = v14;
      }
      else
      {
        *(_OWORD *)long long buf = 0uLL;
        id v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];
        [v16 getUUIDBytes:buf];
        int v17 = (OS_remote_device *)remote_device_copy_device_with_uuid();
        int v18 = self->_device;
        self->_device = v17;
      }
      if (!self->_device)
      {
        uint64_t v20 = *MEMORY[0x263F37FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[CSVTUIRemoteRecordClient initWithDeviceId:audioStreamHandleId:]";
          _os_log_error_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_ERROR, "%s There is no remote device", buf, 0xCu);
        }

        objc_destroyWeak(&location);
        goto LABEL_2;
      }
      [(CSDispatchGroup *)self->_deviceWaitingGroup enter];
      v21[1] = (id)MEMORY[0x263EF8330];
      v21[2] = (id)3221225472;
      void v21[3] = __65__CSVTUIRemoteRecordClient_initWithDeviceId_audioStreamHandleId___block_invoke;
      v21[4] = &unk_2644294B0;
      objc_copyWeak(&v22, &location);
      remote_device_set_connected_callback();
      objc_copyWeak(v21, &location);
      remote_device_set_disconnected_callback();
      self->_unint64_t audioStreamHandleId = a4;
      objc_storeStrong((id *)&self->_deviceId, a3);
      objc_destroyWeak(v21);
      objc_destroyWeak(&v22);

      objc_destroyWeak(&location);
    }
    self = self;
    uint64_t v8 = self;
    goto LABEL_12;
  }
LABEL_2:
  uint64_t v8 = 0;
LABEL_12:

  return v8;
}

void __65__CSVTUIRemoteRecordClient_initWithDeviceId_audioStreamHandleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didDeviceConnect:v3];
}

void __65__CSVTUIRemoteRecordClient_initWithDeviceId_audioStreamHandleId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didDeviceDisconnect:v3];
}

@end