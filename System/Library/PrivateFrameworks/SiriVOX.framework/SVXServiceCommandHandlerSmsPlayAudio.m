@interface SVXServiceCommandHandlerSmsPlayAudio
@end

@implementation SVXServiceCommandHandlerSmsPlayAudio

void __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(void **)(*(void *)(a1 + 32) + 8);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke_2;
    v13[3] = &unk_2645526F0;
    id v14 = v5;
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    [v7 getCurrentSessionUsingBlock:v13];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      id v9 = [NSString alloc];
      v10 = [*(id *)(a1 + 40) aceId];
      v11 = (void *)[v9 initWithFormat:@"Failed to acquire audio for command %@.", v10];
      v12 = +[SVXServiceCommandResult resultFailureWithErrorCode:0 reason:v11];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);
    }
  }
}

void __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke_2(id *a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F28420];
  id v4 = a2;
  id v5 = [v3 alloc];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke_3;
  v10[3] = &unk_264552B80;
  id v11 = a1[4];
  v6 = (void *)[v5 initWithBuilder:v10];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke_4;
  v7[3] = &unk_2645526C8;
  id v8 = a1[5];
  id v9 = a1[6];
  [v4 startAudioPlaybackRequest:v6 options:0 completion:v7];
}

void __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke_3(uint64_t a1, void *a2)
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

void __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v3 = [NSString alloc];
    id v4 = [*(id *)(a1 + 32) aceId];
    id v5 = (void *)[v3 initWithFormat:@"Failed to playback audio for command %@.", v4];
    v6 = +[SVXServiceCommandResult resultFailureWithErrorCode:0 reason:v5];
  }
  else
  {
    v6 = +[SVXServiceCommandResult resultSuccess];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

@end