@interface SYShowBacklinkIndicatorCommandPhoneImpl
- (BOOL)isActive;
- (SYShowBacklinkIndicatorCommandPhoneImpl)initWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4;
- (void)runWithCompletion:(id)a3;
@end

@implementation SYShowBacklinkIndicatorCommandPhoneImpl

- (SYShowBacklinkIndicatorCommandPhoneImpl)initWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SYShowBacklinkIndicatorCommandPhoneImpl;
  v8 = [(SYShowBacklinkIndicatorCommandPhoneImpl *)&v12 init];
  if (v8)
  {
    uint64_t v9 = SYMakeUserActivity(@"com.apple.notes.activity.show-backlink", v6, v7);
    userActivity = v8->_userActivity;
    v8->_userActivity = (NSUserActivity *)v9;
  }
  return v8;
}

- (BOOL)isActive
{
  return 1;
}

- (void)runWithCompletion:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __61__SYShowBacklinkIndicatorCommandPhoneImpl_runWithCompletion___block_invoke;
  v35[3] = &unk_1E6464420;
  id v5 = v4;
  id v36 = v5;
  id v6 = (void (**)(void))MEMORY[0x1C8769940](v35);
  if (SYIsQuickNoteOnPhoneEnabled())
  {
    id v34 = 0;
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.BacklinkIndicator" allowPlaceholder:1 error:&v34];
    id v8 = v34;
    if (v8)
    {
      uint64_t v9 = os_log_create("com.apple.synapse", "");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        userActivity = self->_userActivity;
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = @"com.apple.BacklinkIndicator";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = userActivity;
        *(_WORD *)&buf[22] = 2112;
        v44 = v8;
        _os_log_error_impl(&dword_1C2C5F000, v9, OS_LOG_TYPE_ERROR, "Failed to find record for %@ to show backlink indicator for activity: %@, error: %@", buf, 0x20u);
      }

      v6[2](v6);
      goto LABEL_32;
    }
    if ([(NSUserActivity *)self->_userActivity _syIsShowBacklinkIndicatorUserActivity])
    {
LABEL_10:
      id v11 = objc_alloc_init(MEMORY[0x1E4F224A0]);
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x2020000000;
      objc_super v12 = (id *)getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_ptr;
      uint64_t v40 = getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_ptr;
      if (!getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_block_invoke;
        v44 = &unk_1E64635F8;
        v45 = &v37;
        __getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_block_invoke((uint64_t)buf);
        objc_super v12 = (id *)v38[3];
      }
      _Block_object_dispose(&v37, 8);
      if (!v12) {
        -[SYShowBacklinkIndicatorCommandPhoneImpl runWithCompletion:]();
      }
      id v41 = *v12;
      uint64_t v42 = MEMORY[0x1E4F1CC38];
      v13 = (void *)MEMORY[0x1E4F1C9E8];
      id v14 = v41;
      v15 = [v13 dictionaryWithObjects:&v42 forKeys:&v41 count:1];

      [v11 setFrontBoardOptions:v15];
      objc_initWeak((id *)buf, self);
      v16 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      v17 = self->_userActivity;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __61__SYShowBacklinkIndicatorCommandPhoneImpl_runWithCompletion___block_invoke_8;
      v30[3] = &unk_1E6464448;
      objc_copyWeak(&v32, (id *)buf);
      v31 = v6;
      [v16 openUserActivity:v17 usingApplicationRecord:v7 configuration:v11 completionHandler:v30];

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);

      goto LABEL_32;
    }
    v29 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:@"com.apple.BacklinkIndicator"];
    id v33 = 0;
    v18 = [MEMORY[0x1E4F963E8] handleForPredicate:v29 error:&v33];
    id v19 = v33;
    if (v19) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = v18 == 0;
    }
    int v21 = v20;
    int v28 = v21;
    if (!v20) {
      goto LABEL_25;
    }
    v22 = os_log_create("com.apple.synapse", "");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      [(SYShowBacklinkIndicatorCommandPhoneImpl *)@"com.apple.BacklinkIndicator" runWithCompletion:v22];
    }

    if (v18)
    {
LABEL_25:
      v23 = [v18 currentState];
      char v24 = [v23 isRunning];

      if (v24)
      {
        if (!v28)
        {

          goto LABEL_10;
        }
      }
      else
      {
        v25 = os_log_create("com.apple.synapse", "");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = self->_userActivity;
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v26;
          _os_log_impl(&dword_1C2C5F000, v25, OS_LOG_TYPE_INFO, "Backlink indicator isn't running. Skip request to hide the backlink indicator for activity: %@", buf, 0xCu);
        }
      }
    }
    v6[2](v6);

LABEL_32:
    goto LABEL_33;
  }
  v10 = os_log_create("com.apple.synapse", "");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2C5F000, v10, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", buf, 2u);
  }

  v6[2](v6);
LABEL_33:
}

uint64_t __61__SYShowBacklinkIndicatorCommandPhoneImpl_runWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __61__SYShowBacklinkIndicatorCommandPhoneImpl_runWithCompletion___block_invoke_8(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = os_log_create("com.apple.synapse", "");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __61__SYShowBacklinkIndicatorCommandPhoneImpl_runWithCompletion___block_invoke_8_cold_1((uint64_t)WeakRetained, (uint64_t)v5, v7);
      }
    }
    if (a2)
    {
      id v8 = os_log_create("com.apple.synapse", "");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = (void *)WeakRetained[1];
        v10 = [v9 userInfo];
        int v11 = 138412802;
        objc_super v12 = @"com.apple.BacklinkIndicator";
        __int16 v13 = 2112;
        id v14 = v9;
        __int16 v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_1C2C5F000, v8, OS_LOG_TYPE_INFO, "Successfully invoked %@ to show or hide backlink indicator for activity: %@, userInfo: %@", (uint8_t *)&v11, 0x20u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void).cxx_destruct
{
}

- (void)runWithCompletion:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getFBSOpenApplicationOptionKeyActivateSuspended(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYShowBacklinkIndicatorCommandPhoneImpl.m", 26, @"%s", dlerror());

  __break(1u);
}

- (void)runWithCompletion:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_ERROR, "Failed to create handle for process: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

void __61__SYShowBacklinkIndicatorCommandPhoneImpl_runWithCompletion___block_invoke_8_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 138412802;
  __int16 v5 = @"com.apple.BacklinkIndicator";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_ERROR, "Failed to invoke %@ to show backlink indicator for activity: %@, error: %@", (uint8_t *)&v4, 0x20u);
}

@end