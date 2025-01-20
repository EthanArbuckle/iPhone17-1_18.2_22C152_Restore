@interface TIAssistantSettings
+ (void)connectForOperations:(id)a3 withErrorHandler:(id)a4;
+ (void)dismissDialog;
+ (void)dismissedDataSharingWithResponse:(int64_t)a3;
+ (void)launchDictationSettings;
+ (void)launchKeyboardSettings;
+ (void)launchPencilSettings;
+ (void)presentDialogForType:(int64_t)a3 withCompletionHandler:(id)a4;
+ (void)promptReminderDataSharingWithCompletionHandler:(id)a3;
+ (void)promptToEnableDataSharingWithCompletionHandler:(id)a3;
+ (void)promptToEnableDictationWithCompletionHandler:(id)a3;
+ (void)promptToRemindDataSharingWithCompletionHandler:(id)a3;
+ (void)setTestBlock:(id)a3;
@end

@implementation TIAssistantSettings

+ (void)launchPencilSettings
{
}

uint64_t __43__TIAssistantSettings_launchPencilSettings__block_invoke(uint64_t a1, void *a2)
{
  return [a2 launchPencilSettings];
}

+ (void)launchDictationSettings
{
}

uint64_t __46__TIAssistantSettings_launchDictationSettings__block_invoke(uint64_t a1, void *a2)
{
  return [a2 launchDictationSettings];
}

+ (void)launchKeyboardSettings
{
}

uint64_t __45__TIAssistantSettings_launchKeyboardSettings__block_invoke(uint64_t a1, void *a2)
{
  return [a2 launchKeyboardSettings];
}

+ (void)dismissDialog
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v3 = _assistantInternalQueue();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__TIAssistantSettings_dismissDialog__block_invoke;
  v4[3] = &unk_1E555A528;
  v4[4] = &v5;
  TIDispatchSync(v3, v4);

  if (*((unsigned char *)v6 + 24)) {
    [a1 connectForOperations:&__block_literal_global_22 withErrorHandler:0];
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __36__TIAssistantSettings_dismissDialog__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = _dialogWasRequested;
  return result;
}

void __36__TIAssistantSettings_dismissDialog__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__TIAssistantSettings_dismissDialog__block_invoke_3;
  v6[3] = &unk_1E5559010;
  id v7 = v4;
  id v5 = v4;
  [a2 dismissDialogWithCompletionHandler:v6];
}

uint64_t __36__TIAssistantSettings_dismissDialog__block_invoke_3(uint64_t a1)
{
  _dialogWasRequested = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)dismissedDataSharingWithResponse:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__TIAssistantSettings_dismissedDataSharingWithResponse___block_invoke;
  v3[3] = &__block_descriptor_40_e40_v24__0___TIAssistantSettings__8___v___16l;
  v3[4] = a3;
  [a1 connectForOperations:v3 withErrorHandler:0];
}

uint64_t __56__TIAssistantSettings_dismissedDataSharingWithResponse___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dismissedDataSharingWithResponse:*(void *)(a1 + 32)];
}

+ (void)promptToEnableDictationWithCompletionHandler:(id)a3
{
}

+ (void)promptReminderDataSharingWithCompletionHandler:(id)a3
{
}

+ (void)promptToRemindDataSharingWithCompletionHandler:(id)a3
{
}

+ (void)promptToEnableDataSharingWithCompletionHandler:(id)a3
{
}

+ (void)presentDialogForType:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__TIAssistantSettings_presentDialogForType_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E5558FE8;
  int64_t v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__TIAssistantSettings_presentDialogForType_withCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E5559010;
  id v9 = v11;
  id v7 = v11;
  [a1 connectForOperations:v10 withErrorHandler:v8];
}

void __66__TIAssistantSettings_presentDialogForType_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  _dialogWasRequested = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__TIAssistantSettings_presentDialogForType_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5558FC0;
  id v9 = v5;
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v7 = v5;
  [a2 presentDialogForType:v6 withCompletionHandler:v8];
}

uint64_t __66__TIAssistantSettings_presentDialogForType_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  _dialogWasRequested = 0;
  return result;
}

uint64_t __66__TIAssistantSettings_presentDialogForType_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  _dialogWasRequested = 0;
  return result;
}

+ (void)connectForOperations:(id)a3 withErrorHandler:(id)a4
{
  id v7 = (void (**)(id, void *, void *))a3;
  id v8 = a4;
  id v9 = _assistantInternalQueue();
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.TextInput.rdt" options:4096];
  id v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDC54B00];
  [v10 setRemoteObjectInterface:v11];

  [v10 _setQueue:v9];
  [v10 resume];
  if (_assistantTestBlock) {
    (*(void (**)(void))(_assistantTestBlock + 16))();
  }
  objc_initWeak(location, v10);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61__TIAssistantSettings_connectForOperations_withErrorHandler___block_invoke;
  v23[3] = &unk_1E555A450;
  objc_copyWeak(&v24, location);
  int64_t v12 = (void *)MEMORY[0x192F9B5E0](v23);
  v13 = v12;
  if (v8)
  {
    v14 = v20;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __61__TIAssistantSettings_connectForOperations_withErrorHandler___block_invoke_2;
    v20[3] = &unk_1E5558F98;
    id v4 = &v21;
    id v21 = v12;
    id v5 = &v22;
    id v22 = v8;
  }
  else
  {
    v14 = v12;
  }
  v15 = (void *)MEMORY[0x192F9B5E0](v14);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__TIAssistantSettings_connectForOperations_withErrorHandler___block_invoke_3;
  v18[3] = &unk_1E55599D8;
  v16 = v15;
  id v19 = v16;
  v17 = [v10 remoteObjectProxyWithErrorHandler:v18];
  if (v17) {
    v7[2](v7, v17, v13);
  }
  else {
    v16[2](v16);
  }

  if (v8)
  {
  }
  objc_destroyWeak(&v24);
  objc_destroyWeak(location);
}

void __61__TIAssistantSettings_connectForOperations_withErrorHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
  if (_assistantTestBlock) {
    (*(void (**)(void))(_assistantTestBlock + 16))();
  }
}

uint64_t __61__TIAssistantSettings_connectForOperations_withErrorHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __61__TIAssistantSettings_connectForOperations_withErrorHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_SSentAnAssista.isa, "+[TIAssistantSettings connectForOperations:withErrorHandler:]_block_invoke_3", a2);
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

+ (void)setTestBlock:(id)a3
{
  _assistantTestBlock = [a3 copy];

  MEMORY[0x1F41817F8]();
}

@end