@interface SVXSayItChildTaskProvider
- (id)createWithCommand:(id)a3 taskTracker:(id)a4 listenAfterSpeakingDisabled:(BOOL)a5;
@end

@implementation SVXSayItChildTaskProvider

- (id)createWithCommand:(id)a3 taskTracker:(id)a4 listenAfterSpeakingDisabled:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = mach_absolute_time();
  v10 = [v8 context];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__SVXSayItChildTaskProvider_createWithCommand_taskTracker_listenAfterSpeakingDisabled___block_invoke;
  v15[3] = &unk_264552690;
  id v16 = v7;
  uint64_t v17 = v9;
  BOOL v18 = a5;
  id v11 = v7;
  v12 = [v10 mutatedCopyWithMutator:v15];

  v13 = [v8 beginChildWithContext:v12];

  return v13;
}

void __87__SVXSayItChildTaskProvider_createWithCommand_taskTracker_listenAfterSpeakingDisabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 setTimestamp:*(void *)(a1 + 40)];
  v4 = [*(id *)(a1 + 32) dialogIdentifier];
  [v3 setDialogIdentifier:v4];

  v5 = [*(id *)(a1 + 32) listenAfterSpeaking];
  int v6 = [v5 BOOLValue];

  if (!v6) {
    goto LABEL_5;
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v9 = 1;
    goto LABEL_7;
  }
  id v7 = *MEMORY[0x263F28348];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  uint64_t v9 = 0;
  if (v8)
  {
    int v11 = 136315138;
    v12 = "-[SVXSayItChildTaskProvider createWithCommand:taskTracker:listenAfterSpeakingDisabled:]_block_invoke";
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_DEFAULT, "%s Overriding listenAfterSpeaking due to defaults", (uint8_t *)&v11, 0xCu);
LABEL_5:
    uint64_t v9 = 0;
  }
LABEL_7:
  [v3 setListensAfterSpeaking:v9];
  v10 = [*(id *)(a1 + 32) listenAfterSpeakingBehavior];
  [v3 setListenAfterSpeakingBehavior:v10];
}

@end