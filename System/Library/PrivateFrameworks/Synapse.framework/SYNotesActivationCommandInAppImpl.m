@interface SYNotesActivationCommandInAppImpl
+ (id)fetchPresenterViewControllerInvocationBlock;
+ (void)_activateWithActivity:(id)a3 completion:(id)a4;
+ (void)_launchNotesWithUserActivity:(id)a3 completion:(id)a4;
+ (void)activateWithDomainIdentifier:(id)a3 noteIdentifier:(id)a4 completion:(id)a5;
+ (void)setFetchPresenterViewControllerInvocationBlock:(id)a3;
@end

@implementation SYNotesActivationCommandInAppImpl

+ (id)fetchPresenterViewControllerInvocationBlock
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1C8769940](__fetchPresenterViewControllerInvocationBlock);
  objc_sync_exit(v2);

  return v3;
}

+ (void)setFetchPresenterViewControllerInvocationBlock:(id)a3
{
  id v7 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  v6 = (void *)__fetchPresenterViewControllerInvocationBlock;
  __fetchPresenterViewControllerInvocationBlock = v5;

  objc_sync_exit(v4);
}

+ (void)activateWithDomainIdentifier:(id)a3 noteIdentifier:(id)a4 completion:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = 0;
  if (a3 && a4)
  {
    v16[0] = a3;
    v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = a4;
    id v12 = a3;
    v13 = [v10 arrayWithObjects:v16 count:1];
    id v15 = v11;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];

    v9 = SYMakeEditNoteUserActivity(v13, v14);
  }
  [a1 _activateWithActivity:v9 completion:v8];
}

+ (void)_activateWithActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  objc_sync_enter(v8);
  v9 = (void *)[(id)__fetchPresenterViewControllerInvocationBlock copy];
  v10 = (void *)__fetchPresenterViewControllerInvocationBlock;
  __fetchPresenterViewControllerInvocationBlock = 0;

  objc_sync_exit(v8);
  if (SYIsPhone() && (SYIsQuickNoteOnPhoneEnabled() & 1) != 0)
  {
    id v11 = [MEMORY[0x1E4F28B50] mainBundle];
    id v12 = [v11 bundleIdentifier];
    if ([v12 isEqual:@"com.apple.springboard"])
    {

LABEL_10:
      [v8 _launchNotesWithUserActivity:v6 completion:v7];
      goto LABEL_15;
    }
    id v15 = [MEMORY[0x1E4F28B50] mainBundle];
    v16 = [v15 bundleIdentifier];
    int v17 = [v16 isEqual:@"com.apple.BacklinkIndicator"];

    if (v17) {
      goto LABEL_10;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __70__SYNotesActivationCommandInAppImpl__activateWithActivity_completion___block_invoke;
    v19[3] = &unk_1E6464710;
    id v21 = v9;
    id v20 = v6;
    id v22 = v7;
    v18 = (void (**)(void))MEMORY[0x1C8769940](v19);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v18[2](v18);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v18);
    }
  }
  else
  {
    v13 = os_log_create("com.apple.synapse", "");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[SYNotesActivationCommandSynapseImpl _activateWithActivity:completion:](v13);
    }

    if (v7)
    {
      v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.synapse" code:-127 userInfo:0];
      (*((void (**)(id, void *))v7 + 2))(v7, v14);
    }
  }
LABEL_15:
}

void __70__SYNotesActivationCommandInAppImpl__activateWithActivity_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    v3 = (*(void (**)(void))(v2 + 16))();
  }
  else
  {
    v3 = 0;
  }
  id v4 = [*(id *)(a1 + 32) _createUserActivityDataWithSaving:0 options:MEMORY[0x1E4F1CC08] error:0];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2050000000;
  uint64_t v5 = (void *)getICSystemPaperSceneViewControllerClass_softClass;
  uint64_t v13 = getICSystemPaperSceneViewControllerClass_softClass;
  if (!getICSystemPaperSceneViewControllerClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getICSystemPaperSceneViewControllerClass_block_invoke;
    v9[3] = &unk_1E64635F8;
    v9[4] = &v10;
    __getICSystemPaperSceneViewControllerClass_block_invoke((uint64_t)v9);
    uint64_t v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SYNotesActivationCommandInAppImpl__activateWithActivity_completion___block_invoke_2;
  v7[3] = &unk_1E6464420;
  id v8 = *(id *)(a1 + 48);
  [v6 presentSystemPaperWithUserActivityData:v4 presenter:v3 completion:v7];
}

uint64_t __70__SYNotesActivationCommandInAppImpl__activateWithActivity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_launchNotesWithUserActivity:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__SYNotesActivationCommandInAppImpl__launchNotesWithUserActivity_completion___block_invoke;
  v20[3] = &unk_1E64641F8;
  id v7 = v5;
  id v21 = v7;
  id v8 = v6;
  id v22 = v8;
  v9 = (void (**)(void, void, void))MEMORY[0x1C8769940](v20);
  if (v7)
  {
    id v19 = 0;
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.mobilenotes" allowPlaceholder:1 error:&v19];
    id v11 = v19;
    if (v11)
    {
      uint64_t v12 = os_log_create("com.apple.synapse", "");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v11;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl(&dword_1C2C5F000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create System Notes application record with error: %@, to launch for activity: %@", buf, 0x16u);
      }
    }
    if (v10)
    {
      uint64_t v13 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __77__SYNotesActivationCommandInAppImpl__launchNotesWithUserActivity_completion___block_invoke_10;
      v17[3] = &unk_1E6463968;
      v18 = v9;
      [v13 openUserActivity:v7 usingApplicationRecord:v10 configuration:0 completionHandler:v17];
    }
    else if (v8)
    {
      ((void (**)(void, void, id))v9)[2](v9, 0, v11);
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__SYNotesActivationCommandInAppImpl__launchNotesWithUserActivity_completion___block_invoke_2;
    v15[3] = &unk_1E6463968;
    v16 = v9;
    [v14 openApplicationWithBundleIdentifier:@"com.apple.mobilenotes" usingConfiguration:0 completionHandler:v15];

    id v11 = v16;
  }
}

void __77__SYNotesActivationCommandInAppImpl__launchNotesWithUserActivity_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.synapse", "");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1C2C5F000, v6, OS_LOG_TYPE_DEFAULT, "Error received requesting System Notes presentation: %@, activity: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  id v8 = os_log_create("com.apple.synapse", "");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109120;
    LODWORD(v11) = a2;
    _os_log_impl(&dword_1C2C5F000, v8, OS_LOG_TYPE_DEFAULT, "System Notes presentation request succeeded: %d", (uint8_t *)&v10, 8u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
  }
}

uint64_t __77__SYNotesActivationCommandInAppImpl__launchNotesWithUserActivity_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__SYNotesActivationCommandInAppImpl__launchNotesWithUserActivity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end