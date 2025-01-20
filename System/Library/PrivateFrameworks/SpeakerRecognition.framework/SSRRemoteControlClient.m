@interface SSRRemoteControlClient
- (BOOL)_isImplicitTrainingRequiredForVoiceProfileId:(id)a3 locale:(id)a4 error:(id *)a5;
- (BOOL)isConnected;
- (BOOL)waitingForConnection:(double)a3 error:(id *)a4;
- (SSRRemoteControlClient)initWithRemoteDeviceUUID:(id)a3;
- (void)_handleServerError:(id)a3;
- (void)_handleServerEvent:(id)a3;
- (void)addImplicitTrainingUtteranceToRemoteFilePath:(id)a3 forVoiceProfileId:(id)a4 withVoiceTriggerCtxt:(id)a5 locale:(id)a6 withOtherCtxt:(id)a7 completion:(id)a8;
- (void)dealloc;
- (void)didDeviceConnect:(id)a3;
- (void)didDeviceDisconnect:(id)a3;
@end

@implementation SSRRemoteControlClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceWaitingGroup, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)_isImplicitTrainingRequiredForVoiceProfileId:(id)a3 locale:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v10, "COMMAND", "queryImplicitTrainingRequired");
    xpc_dictionary_set_string(v10, "languageCode", (const char *)[v9 UTF8String]);
    if (v8) {
      xpc_dictionary_set_string(v10, "voiceProfileId", (const char *)[v8 UTF8String]);
    }
    if (self->_connection)
    {
      v11 = (void *)xpc_remote_connection_send_message_with_reply_sync();
      uint64_t v12 = MEMORY[0x21D4B2B70]();
      v13 = (os_log_t *)MEMORY[0x263F38100];
      if (v11 && xpc_dictionary_get_BOOL(v11, "replyResult"))
      {
        v14 = 0;
      }
      else
      {
        v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1004 userInfo:&unk_26CD45300];
        v17 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
        {
          int v25 = 136315138;
          v26 = "-[SSRRemoteControlClient _isImplicitTrainingRequiredForVoiceProfileId:locale:error:]";
          _os_log_error_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_ERROR, "%s Failed to fetch reply", (uint8_t *)&v25, 0xCu);
        }
      }
      if (v12 == MEMORY[0x263EF8708])
      {
        id v21 = objc_alloc(NSDictionary);
        v22 = objc_msgSend(v21, "_cs_initWithXPCObject:", v11);

        if (v22)
        {
          v16 = [v22 objectForKeyedSubscript:@"isImplicitTrainingRequiredReply"];

          if (v16)
          {
            v23 = [v22 objectForKeyedSubscript:@"isImplicitTrainingRequiredReply"];
            LOBYTE(v16) = [v23 BOOLValue];
          }
        }
        else
        {
          LOBYTE(v16) = 0;
        }

        if (!a5) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1005 userInfo:&unk_26CD45328];

        v19 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
        {
          int v25 = 136315138;
          v26 = "-[SSRRemoteControlClient _isImplicitTrainingRequiredForVoiceProfileId:locale:error:]";
          _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s Wrong reply type received", (uint8_t *)&v25, 0xCu);
        }
        LOBYTE(v16) = 0;
        v14 = (void *)v18;
        if (!a5) {
          goto LABEL_18;
        }
      }
      *a5 = v14;
LABEL_18:

LABEL_32:
      goto LABEL_33;
    }
    v20 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v25 = 136315138;
      v26 = "-[SSRRemoteControlClient _isImplicitTrainingRequiredForVoiceProfileId:locale:error:]";
      _os_log_error_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_ERROR, "%s attempt to send message while connection does not exsit", (uint8_t *)&v25, 0xCu);
      if (a5) {
        goto LABEL_21;
      }
    }
    else if (a5)
    {
LABEL_21:
      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1003 userInfo:&unk_26CD45350];
      LOBYTE(v16) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    LOBYTE(v16) = 0;
    goto LABEL_32;
  }
  v15 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    int v25 = 136315138;
    v26 = "-[SSRRemoteControlClient _isImplicitTrainingRequiredForVoiceProfileId:locale:error:]";
    _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, "%s Invalid locale", (uint8_t *)&v25, 0xCu);
    if (a5) {
      goto LABEL_10;
    }
LABEL_29:
    LOBYTE(v16) = 0;
    goto LABEL_33;
  }
  if (!a5) {
    goto LABEL_29;
  }
LABEL_10:
  [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD452D8];
  LOBYTE(v16) = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return (char)v16;
}

- (void)addImplicitTrainingUtteranceToRemoteFilePath:(id)a3 forVoiceProfileId:(id)a4 withVoiceTriggerCtxt:(id)a5 locale:(id)a6 withOtherCtxt:(id)a7 completion:(id)a8
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  uint64_t v18 = [v13 lastPathComponent];
  v19 = [@"VoiceTrigger/SAT_implicit/audio/" stringByAppendingPathComponent:v18];

  v20 = (os_log_t *)MEMORY[0x263F38100];
  id v21 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v37 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCtxt:l"
          "ocale:withOtherCtxt:completion:]";
    __int16 v38 = 2114;
    id v39 = v13;
    __int16 v40 = 2114;
    id v41 = v14;
    _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s %{public}@, voiceProfileId %{public}@", buf, 0x20u);
  }
  if (v13 && v19)
  {
    v22 = [MEMORY[0x263F08850] defaultManager];
    if ([v22 fileExistsAtPath:v13])
    {
      if (v16)
      {
        queue = self->_queue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __142__SSRRemoteControlClient_addImplicitTrainingUtteranceToRemoteFilePath_forVoiceProfileId_withVoiceTriggerCtxt_locale_withOtherCtxt_completion___block_invoke;
        block[3] = &unk_264429280;
        block[4] = self;
        id v30 = v14;
        id v31 = v16;
        id v35 = v17;
        id v32 = v15;
        id v33 = v19;
        id v34 = v13;
        dispatch_async(queue, block);

LABEL_17:
        goto LABEL_18;
      }
      uint64_t v27 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCt"
              "xt:locale:withOtherCtxt:completion:]";
        _os_log_error_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_ERROR, "%s Invalid locale", buf, 0xCu);
        if (!v17) {
          goto LABEL_17;
        }
      }
      else if (!v17)
      {
        goto LABEL_17;
      }
      int v25 = (void *)MEMORY[0x263F087E8];
      v26 = &unk_26CD45260;
    }
    else
    {
      v24 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCt"
              "xt:locale:withOtherCtxt:completion:]";
        __int16 v38 = 2114;
        id v39 = v13;
        _os_log_error_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_ERROR, "%s File does not exists : %{public}@", buf, 0x16u);
        if (!v17) {
          goto LABEL_17;
        }
      }
      else if (!v17)
      {
        goto LABEL_17;
      }
      int v25 = (void *)MEMORY[0x263F087E8];
      v26 = &unk_26CD45238;
    }
    v28 = [v25 errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:v26];
    (*((void (**)(id, void *))v17 + 2))(v17, v28);

    goto LABEL_17;
  }
  if (v17)
  {
    v22 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:113 userInfo:&unk_26CD45210];
    (*((void (**)(id, void *))v17 + 2))(v17, v22);
    goto LABEL_17;
  }
LABEL_18:
}

void __142__SSRRemoteControlClient_addImplicitTrainingUtteranceToRemoteFilePath_forVoiceProfileId_withVoiceTriggerCtxt_locale_withOtherCtxt_completion___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v29 = 0;
  int v5 = [v2 _isImplicitTrainingRequiredForVoiceProfileId:v3 locale:v4 error:&v29];
  id v6 = v29;
  v7 = (NSObject **)MEMORY[0x263F38100];
  id v8 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"is not";
    if (v5) {
      id v9 = @"is";
    }
    *(_DWORD *)buf = 136315394;
    id v31 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCtxt:l"
          "ocale:withOtherCtxt:completion:]_block_invoke";
    __int16 v32 = 2114;
    id v33 = v9;
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Implicit training %{public}@ required", buf, 0x16u);
  }
  if (v5)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v10, "COMMAND", "addImplicitTrainingUtterance");
    v11 = objc_msgSend(*(id *)(a1 + 56), "_cs_xpcObject");
    xpc_dictionary_set_value(v10, "voiceTriggerEventInfo", v11);

    xpc_dictionary_set_string(v10, "filePath", (const char *)[*(id *)(a1 + 64) UTF8String]);
    uint64_t v12 = *(void **)(a1 + 40);
    if (v12) {
      xpc_dictionary_set_string(v10, "voiceProfileId", (const char *)[v12 UTF8String]);
    }
    [*(id *)(a1 + 72) UTF8String];
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    int v25 = __142__SSRRemoteControlClient_addImplicitTrainingUtteranceToRemoteFilePath_forVoiceProfileId_withVoiceTriggerCtxt_locale_withOtherCtxt_completion___block_invoke_46;
    v26 = &unk_264429258;
    id v27 = *(id *)(a1 + 72);
    id v28 = *(id *)(a1 + 80);
    id v13 = (void *)xpc_file_transfer_create_with_path();
    if (v13)
    {
      xpc_dictionary_set_value(v10, "fileTx", v13);
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(NSObject **)(v14 + 8);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __142__SSRRemoteControlClient_addImplicitTrainingUtteranceToRemoteFilePath_forVoiceProfileId_withVoiceTriggerCtxt_locale_withOtherCtxt_completion___block_invoke_58;
      v20[3] = &unk_26442A188;
      v20[4] = v14;
      id v21 = v10;
      id v22 = *(id *)(a1 + 80);
      dispatch_async(v15, v20);
    }
    else
    {
      id v17 = *v7;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v31 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCt"
              "xt:locale:withOtherCtxt:completion:]_block_invoke";
        _os_log_error_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_ERROR, "%s Failed to create xpc file transfer", buf, 0xCu);
      }
      uint64_t v18 = *(void *)(a1 + 80);
      if (v18)
      {
        v19 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1006 userInfo:&unk_26CD45288];
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
      }
    }
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 80);
    if (v16) {
      (*(void (**)(uint64_t, id))(v16 + 16))(v16, v6);
    }
  }
}

void __142__SSRRemoteControlClient_addImplicitTrainingUtteranceToRemoteFilePath_forVoiceProfileId_withVoiceTriggerCtxt_locale_withOtherCtxt_completion___block_invoke_46(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F38100];
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCtxt"
            ":locale:withOtherCtxt:completion:]_block_invoke";
      __int16 v17 = 2114;
      uint64_t v18 = v12;
      __int16 v19 = 1026;
      int v20 = a2;
      _os_log_error_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_ERROR, "%s Transfer of file %{public}@ failed : %{public}d", buf, 0x1Cu);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      id v6 = (void *)MEMORY[0x263F087E8];
      v7 = objc_msgSend(NSNumber, "numberWithInt:", a2, @"reason");
      uint64_t v14 = v7;
      id v8 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v9 = [v6 errorWithDomain:@"com.apple.speakerrecognition" code:1006 userInfo:v8];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v9);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCtxt"
            ":locale:withOtherCtxt:completion:]_block_invoke";
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Transfer of file %{public}@ succeed", buf, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
    }
  }
}

void __142__SSRRemoteControlClient_addImplicitTrainingUtteranceToRemoteFilePath_forVoiceProfileId_withVoiceTriggerCtxt_locale_withOtherCtxt_completion___block_invoke_58(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    xpc_remote_connection_send_message();
  }
  else
  {
    v2 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCtxt:"
           "locale:withOtherCtxt:completion:]_block_invoke";
      _os_log_error_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_ERROR, "%s attempt to send message while connection does not exsit", (uint8_t *)&v5, 0xCu);
    }
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1003 userInfo:&unk_26CD452B0];
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
    }
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
      id v6 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        uint64_t v11 = "-[SSRRemoteControlClient _handleServerError:]";
        _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s connection disconnected", (uint8_t *)&v10, 0xCu);
      }
      if (self->_device) {
        remote_device_cancel();
      }
    }
    else
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x263EF86B0]);
      id v8 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315394;
        uint64_t v11 = "-[SSRRemoteControlClient _handleServerError:]";
        __int16 v12 = 2082;
        uint64_t v13 = string;
        _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s connection error: %{public}s", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (void)_handleServerEvent:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (MEMORY[0x21D4B2B70](v4) == MEMORY[0x263EF8720])
    {
      int v5 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315138;
        id v8 = "-[SSRRemoteControlClient _handleServerEvent:]";
        _os_log_error_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_ERROR, "%s remoteXPC connection get failed", (uint8_t *)&v7, 0xCu);
      }
      [(SSRRemoteControlClient *)self _handleServerError:v4];
    }
  }
  else
  {
    id v6 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[SSRRemoteControlClient _handleServerEvent:]";
      _os_log_error_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_ERROR, "%s cannot handle server event since event is nil", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)isConnected
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__SSRRemoteControlClient_isConnected__block_invoke;
  v5[3] = &unk_26442A648;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__SSRRemoteControlClient_isConnected__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 16)) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)waitingForConnection:(double)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(CSDispatchGroup *)self->_deviceWaitingGroup waitWithTimeout:dispatch_time(0, (uint64_t)(a3 * 1000000000.0))];
  if (!v7)
  {
    if ([(SSRRemoteControlClient *)self isConnected])
    {
      BOOL v10 = 1;
      return !v7 && v10;
    }
    uint64_t v11 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      id v15 = "-[SSRRemoteControlClient waitingForConnection:error:]";
      _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s Device is connected but RemoteXPC service is not connected", (uint8_t *)&v14, 0xCu);
      if (!a4) {
        goto LABEL_14;
      }
    }
    else if (!a4)
    {
      goto LABEL_14;
    }
    uint64_t v9 = 1003;
    goto LABEL_10;
  }
  uint64_t v8 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_FAULT))
  {
    int v14 = 136315394;
    id v15 = "-[SSRRemoteControlClient waitingForConnection:error:]";
    __int16 v16 = 2050;
    double v17 = a3;
    _os_log_fault_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_FAULT, "%s Device connection waiting %{public}.3f seconds timed out", (uint8_t *)&v14, 0x16u);
    if (a4) {
      goto LABEL_4;
    }
  }
  else if (a4)
  {
LABEL_4:
    uint64_t v9 = 1002;
LABEL_10:
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:v9 userInfo:0];
    BOOL v10 = 0;
    *a4 = v12;
    return !v7 && v10;
  }
LABEL_14:
  BOOL v10 = 0;
  return !v7 && v10;
}

- (void)didDeviceDisconnect:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[SSRRemoteControlClient didDeviceDisconnect:]";
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SSRRemoteControlClient_didDeviceDisconnect___block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__SSRRemoteControlClient_didDeviceDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (void)didDeviceConnect:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[SSRRemoteControlClient didDeviceConnect:]";
    _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__SSRRemoteControlClient_didDeviceConnect___block_invoke;
  v8[3] = &unk_26442A138;
  id v9 = v4;
  BOOL v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __43__SSRRemoteControlClient_didDeviceConnect___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unsigned int type = remote_device_get_type();
  if (type == 11)
  {
    char v3 = (void *)remote_device_copy_service();
    if (v3)
    {
      id v4 = (void *)xpc_remote_connection_create_with_remote_service();
      objc_initWeak((id *)location, *(id *)(a1 + 40));
      objc_copyWeak(&v8, (id *)location);
      xpc_remote_connection_set_event_handler();
      xpc_remote_connection_activate();
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), v4);
      [*(id *)(*(void *)(a1 + 40) + 24) leave];
      objc_destroyWeak(&v8);
      objc_destroyWeak((id *)location);
    }
    else
    {
      id v7 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315394;
        *(void *)&location[4] = "-[SSRRemoteControlClient didDeviceConnect:]_block_invoke";
        __int16 v10 = 2082;
        unint64_t v11 = (unint64_t)"com.apple.corespeech.xpc.remote.control";
        _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s Service: %{public}s not found", location, 0x16u);
      }
      [*(id *)(*(void *)(a1 + 40) + 24) leave];
    }
  }
  else
  {
    unsigned int v5 = type;
    uint64_t v6 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[SSRRemoteControlClient didDeviceConnect:]_block_invoke";
      __int16 v10 = 2048;
      unint64_t v11 = v5;
      _os_log_error_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_ERROR, "%s Connected to unexpected device type : %lu", location, 0x16u);
    }
  }
}

void __43__SSRRemoteControlClient_didDeviceConnect___block_invoke_9(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleServerEvent:v3];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[SSRRemoteControlClient dealloc]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc of SSRRemoteControlClient, it should close connection", buf, 0xCu);
  }
  if (self->_connection) {
    xpc_remote_connection_cancel();
  }
  if (self->_device) {
    remote_device_cancel();
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRRemoteControlClient;
  [(SSRRemoteControlClient *)&v4 dealloc];
}

- (SSRRemoteControlClient)initWithRemoteDeviceUUID:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F380D0] isDarwinOS])
  {
LABEL_10:
    id v15 = 0;
    goto LABEL_11;
  }
  if (!v4)
  {
    __int16 v16 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v23 = "-[SSRRemoteControlClient initWithRemoteDeviceUUID:]";
      _os_log_error_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_ERROR, "%s invalid remote deviceUUIDString", buf, 0xCu);
    }
    goto LABEL_10;
  }
  v21.receiver = self;
  v21.super_class = (Class)SSRRemoteControlClient;
  unsigned int v5 = [(SSRRemoteControlClient *)&v21 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("SSRRemoteControlClient", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    id v8 = (CSDispatchGroup *)objc_alloc_init(MEMORY[0x263F38030]);
    deviceWaitingGroup = v5->_deviceWaitingGroup;
    v5->_deviceWaitingGroup = v8;

    objc_initWeak(&location, v5);
    __int16 v10 = v5->_queue;
    v26[0] = 0;
    v26[1] = 0;
    unint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v4];
    [v11 getUUIDBytes:v26];
    uint64_t v12 = remote_device_copy_device_with_uuid();
    device = v5->_device;
    v5->_device = (OS_remote_device *)v12;

    [(CSDispatchGroup *)v5->_deviceWaitingGroup enter];
    v18[1] = (id)MEMORY[0x263EF8330];
    v18[2] = (id)3221225472;
    v18[3] = __51__SSRRemoteControlClient_initWithRemoteDeviceUUID___block_invoke;
    v18[4] = &unk_2644294B0;
    objc_copyWeak(&v19, &location);
    remote_device_set_connected_callback();
    objc_copyWeak(v18, &location);
    remote_device_set_disconnected_callback();
    int v14 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[SSRRemoteControlClient initWithRemoteDeviceUUID:]";
      __int16 v24 = 2114;
      id v25 = v4;
      _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Creating remoteControlClient for deviceUUID %{public}@", buf, 0x16u);
    }
    objc_destroyWeak(v18);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
  self = v5;
  id v15 = self;
LABEL_11:

  return v15;
}

void __51__SSRRemoteControlClient_initWithRemoteDeviceUUID___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didDeviceConnect:v3];
}

void __51__SSRRemoteControlClient_initWithRemoteDeviceUUID___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didDeviceDisconnect:v3];
}

@end