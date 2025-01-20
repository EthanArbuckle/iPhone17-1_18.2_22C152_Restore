@interface SLTranscriptController
- (BOOL)deviceIsiPad;
- (NSExtension)extension;
- (NSUUID)requestUUID;
- (_UIRemoteViewController)remoteViewController;
- (void)dealloc;
- (void)presentTranscriptForMessageGUID:(id)a3 attachmentGUID:(id)a4 presentingViewController:(id)a5;
- (void)setExtension:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setRequestUUID:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SLTranscriptController

- (void)dealloc
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "SLTranscriptController finished the extension request", v2, v3, v4, v5, v6);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SLTranscriptController;
  [(SLTranscriptController *)&v4 viewWillDisappear:a3];
  if ([(SLTranscriptController *)self isBeingDismissed]) {
    sIsPresenting = 0;
  }
}

- (BOOL)deviceIsiPad
{
  uint64_t v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (void)presentTranscriptForMessageGUID:(id)a3 attachmentGUID:(id)a4 presentingViewController:(id)a5
{
  v45[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (sIsPresenting == 1)
  {
    v11 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SLTranscriptController presentTranscriptForMessageGUID:attachmentGUID:presentingViewController:]();
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F29268] currentConnection];
    char HasPublicEntitlement = SLAppHasPublicEntitlement();

    sIsPresenting = 1;
    if (![(SLTranscriptController *)self deviceIsiPad] || (HasPublicEntitlement & 1) != 0)
    {
      id v40 = 0;
      v21 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:@"com.apple.MobileSMS.MessagesTranscriptExtension" error:&v40];
      v11 = v40;
      [(SLTranscriptController *)self setExtension:v21];
      if (v21)
      {
        objc_initWeak(&location, self);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_27;
        v36[3] = &unk_1E58A85B8;
        objc_copyWeak(&v38, &location);
        id v22 = v8;
        id v37 = v22;
        [v21 setRequestInterruptionBlock:v36];
        id v23 = objc_alloc_init(MEMORY[0x1E4F28C80]);
        if (v22)
        {
          id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v24 setObject:v22 forKey:@"messageGUID"];
          if (v9) {
            [v24 setObject:v9 forKey:@"attachmentGUID"];
          }
          [v23 setUserInfo:v24];
        }
        objc_initWeak(&from, v10);
        objc_initWeak(&v34, v21);
        v32[0] = 0;
        v32[1] = v32;
        v32[2] = 0x3032000000;
        v32[3] = __Block_byref_object_copy_;
        v32[4] = __Block_byref_object_dispose_;
        v33 = self;
        id v43 = v23;
        v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_33;
        v27[3] = &unk_1E58A8630;
        objc_copyWeak(&v30, &from);
        objc_copyWeak(&v31, &v34);
        v29 = v32;
        id v28 = v22;
        [v21 instantiateViewControllerWithInputItems:v25 connectionHandler:v27];

        objc_destroyWeak(&v31);
        objc_destroyWeak(&v30);
        _Block_object_dispose(v32, 8);

        objc_destroyWeak(&v34);
        objc_destroyWeak(&from);

        objc_destroyWeak(&v38);
        objc_destroyWeak(&location);
      }
      else
      {
        v26 = SLFrameworkLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[SLTranscriptController presentTranscriptForMessageGUID:attachmentGUID:presentingViewController:]((uint64_t)v11, v26);
        }

        sIsPresenting = 0;
      }
    }
    else
    {
      v11 = [NSString stringWithFormat:@"sms://open?message-guid=%@&overlay=1", v8];
      v14 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
      v15 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
      v16 = (void *)MEMORY[0x1E4F629C8];
      uint64_t v17 = *MEMORY[0x1E4F62678];
      v44[0] = *MEMORY[0x1E4FA7130];
      v44[1] = v17;
      v45[0] = *MEMORY[0x1E4FA70A0];
      v45[1] = v14;
      v44[2] = *MEMORY[0x1E4F626C0];
      v45[2] = MEMORY[0x1E4F1CC38];
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:3];
      v19 = [v16 optionsWithDictionary:v18];

      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke;
      v41[3] = &unk_1E58A8568;
      id v42 = v14;
      id v20 = v14;
      [v15 openApplication:@"com.apple.MobileSMS" withOptions:v19 completion:v41];
    }
  }
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_cold_1((uint64_t)v4, v5);
    }

    uint8_t v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v6 openURL:*(void *)(a1 + 32) options:MEMORY[0x1E4F1CC08] completionHandler:0];

    sIsPresenting = 0;
  }
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_27(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2;
  v2[3] = &unk_1E58A8590;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained dismissViewControllerAnimated:0 completion:0];

  id v3 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_cold_1();
  }

  id v4 = [NSString stringWithFormat:@"sms://open?message-guid=%@&overlay=1", *(void *)(a1 + 32)];
  uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  uint8_t v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v6 openURL:v5 options:MEMORY[0x1E4F1CC08] completionHandler:0];

  sIsPresenting = 0;
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_33(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_34;
  block[3] = &unk_1E58A8608;
  id v16 = v9;
  id v10 = v9;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  objc_copyWeak(&v21, (id *)(a1 + 56));
  id v17 = v7;
  id v18 = v8;
  long long v14 = *(_OWORD *)(a1 + 32);
  id v11 = (id)v14;
  long long v19 = v14;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_34(uint64_t a1)
{
  uint64_t v1 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = SLFrameworkLogHandle();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_34_cold_3(v1, WeakRetained);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (WeakRetained)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setRequestUUID:*(void *)(a1 + 40)];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setRemoteViewController:*(void *)(a1 + 48)];
      id v4 = [*(id *)(a1 + 48) view];
      [v4 setAutoresizingMask:18];

      uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) view];
      [v5 bounds];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      long long v14 = [*(id *)(a1 + 48) view];
      objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addChildViewController:*(void *)(a1 + 48)];
      v15 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) view];
      id v16 = [*(id *)(a1 + 48) view];
      [v15 addSubview:v16];

      [*(id *)(a1 + 48) didMoveToParentViewController:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      id v17 = objc_loadWeakRetained((id *)(a1 + 80));
      id v18 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) requestUUID];
      long long v19 = [v17 _extensionContextForUUID:v18];

      [v19 setMessageGUID:*(void *)(a1 + 56)];
      objc_initWeak(&location, *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_35;
      id v28 = &unk_1E58A85E0;
      objc_copyWeak(&v29, &location);
      [v19 setDismissalRequestHandler:&v25];
      id v20 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_34_cold_2();
      }

      id v21 = objc_loadWeakRetained(&location);
      -[NSObject presentViewController:animated:completion:](WeakRetained, "presentViewController:animated:completion:", v21, 1, 0, v25, v26, v27, v28);

      uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
      id v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = 0;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      id v24 = objc_loadWeakRetained((id *)(a1 + 80));
      [v24 cancelExtensionRequestWithIdentifier:*(void *)(a1 + 40)];

      sIsPresenting = 0;
      long long v19 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_34_cold_1();
      }
    }
  }
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_35(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_35_cold_1();
    }
  }
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (_UIRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

- (void)presentTranscriptForMessageGUID:attachmentGUID:presentingViewController:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "SLTranscriptController: not presenting because we're already presenting", v2, v3, v4, v5, v6);
}

- (void)presentTranscriptForMessageGUID:(uint64_t)a1 attachmentGUID:(NSObject *)a2 presentingViewController:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = @"com.apple.MobileSMS.MessagesTranscriptExtension";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "SLTranscriptController failed to find extension %@ error: %@", (uint8_t *)&v2, 0x16u);
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "SLTranscriptController failed to present on iPad, error: %@, falling back to openURL", (uint8_t *)&v2, 0xCu);
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLTranscriptController: detected an interruption, dismissing", v2, v3, v4, v5, v6);
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_34_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLTranscriptController: no presentingViewController, cancelling the extension request", v2, v3, v4, v5, v6);
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_34_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "SLTranscriptController presenting the transcript", v2, v3, v4, v5, v6);
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_34_cold_3(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "SLTranscriptController failed to load remote view controller: %@", (uint8_t *)&v3, 0xCu);
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLTranscriptController failed to dismiss because it's nil??", v2, v3, v4, v5, v6);
}

@end