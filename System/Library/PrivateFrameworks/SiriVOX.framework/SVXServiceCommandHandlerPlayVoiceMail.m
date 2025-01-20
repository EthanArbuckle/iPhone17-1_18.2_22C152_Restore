@interface SVXServiceCommandHandlerPlayVoiceMail
@end

@implementation SVXServiceCommandHandlerPlayVoiceMail

void __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) audioPlaybackDuration:v5];
    if (v6 >= 0.00100000005) {
      double v7 = v6;
    }
    else {
      double v7 = 0.00100000005;
    }
    v8 = *(void **)(*(void *)(a1 + 32) + 8);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke_2;
    v16[3] = &unk_264552BD0;
    id v17 = v5;
    id v9 = *(id *)(a1 + 40);
    double v23 = v7;
    uint64_t v10 = *(void *)(a1 + 32);
    id v18 = v9;
    uint64_t v19 = v10;
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 64);
    [v8 getCurrentSessionUsingBlock:v16];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 64);
    if (v11)
    {
      id v12 = [NSString alloc];
      v13 = [*(id *)(a1 + 40) aceId];
      v14 = (void *)[v12 initWithFormat:@"Failed to acquire audio for command %@.", v13];
      v15 = +[SVXServiceCommandResult resultFailureWithErrorCode:0 reason:v14];
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v15);
    }
  }
}

void __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F28420];
  id v4 = a2;
  id v5 = [v3 alloc];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke_3;
  v17[3] = &unk_264552B80;
  id v18 = *(id *)(a1 + 32);
  double v6 = (void *)[v5 initWithBuilder:v17];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke_4;
  v10[3] = &unk_264552BA8;
  id v7 = *(id *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = *(void **)(a1 + 56);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v9;
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 72);
  [v4 startAudioPlaybackRequest:v6 options:0 completion:v10];
}

void __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setItemData:v2];
  [v4 setNumberOfLoops:0];
  LODWORD(v3) = 1.0;
  [v4 setVolume:v3];
  [v4 setFadeInDuration:0.0];
  [v4 setFadeOutDuration:0.0];
}

void __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke_4(uint64_t a1, void *a2, double a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  double v6 = v5;
  if (a3 == 0.0 && v5 != 0)
  {
    id v9 = [NSString alloc];
    uint64_t v10 = [*(id *)(a1 + 32) aceId];
    id v11 = (void *)[v9 initWithFormat:@"Failed to playback audio for command %@.", v10];
    uint64_t v12 = +[SVXServiceCommandResult resultFailureWithErrorCode:0 reason:v11];

LABEL_8:
    goto LABEL_12;
  }
  if (a3 / *(double *)(a1 + 72) > 0.75)
  {
    uint64_t v12 = +[SVXServiceCommandResult resultSuccess];
    uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 40);
    uint64_t v10 = [*(id *)(a1 + 48) voiceMailId];
    [v8 markVoiceMailAsRead:v10 forRemoteDevice:*(void *)(a1 + 56)];
    goto LABEL_8;
  }
  id v13 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[_SVXServiceCommandHandlerPlayVoiceMail handleCommand:withContext:taskTracker:completion:]_block_invoke_4";
    _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_DEFAULT, "%s Voicemail did not play long enough to be marked as read", buf, 0xCu);
  }
  uint64_t v12 = 0;
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

@end