@interface SSFollowUpController
+ (id)sharedController;
- (FLFollowUpController)followUpController;
- (SSFollowUpController)init;
- (id)_createFollowUpItemForIdentifier:(id)a3 userInfo:(id)a4;
- (id)_createFollowUpItemForRenewCredentialsWithUserInfo:(id)a3;
- (id)_dismissFollowUpWithIdentifier:(id)a3;
- (id)_postFollowUpWithIdentifier:(id)a3 userInfo:(id)a4;
- (id)dismissFollowUpWithIdentifier:(id)a3;
- (id)dismissFollowUpWithIdentifier:(id)a3 account:(id)a4;
- (id)pendingFollowUpWithIdentifier:(id)a3;
- (id)postFollowUpWithIdentifier:(id)a3 account:(id)a4 userInfo:(id)a5;
- (id)postFollowUpWithIdentifier:(id)a3 userInfo:(id)a4;
- (void)setFollowUpController:(id)a3;
@end

@implementation SSFollowUpController

- (SSFollowUpController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SSFollowUpController;
  v2 = [(SSFollowUpController *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getFLFollowUpControllerClass_softClass;
    uint64_t v13 = getFLFollowUpControllerClass_softClass;
    if (!getFLFollowUpControllerClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getFLFollowUpControllerClass_block_invoke;
      v9[3] = &unk_1E5BA7298;
      v9[4] = &v10;
      __getFLFollowUpControllerClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = [[v4 alloc] initWithClientIdentifier:@"com.apple.StoreServices.followup"];
    followUpController = v2->_followUpController;
    v2->_followUpController = (FLFollowUpController *)v5;
  }
  return v2;
}

+ (id)sharedController
{
  if (sharedController_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedController_ss_once_token___COUNTER__, &__block_literal_global_18);
  }
  v2 = (void *)sharedController_ss_once_object___COUNTER__;
  return v2;
}

void __40__SSFollowUpController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(SSFollowUpController);
  v1 = (void *)sharedController_ss_once_object___COUNTER__;
  sharedController_ss_once_object___COUNTER__ = (uint64_t)v0;
}

- (id)dismissFollowUpWithIdentifier:(id)a3
{
  return [(SSFollowUpController *)self dismissFollowUpWithIdentifier:a3 account:0];
}

- (id)dismissFollowUpWithIdentifier:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SSFollowUpController.m", 88, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v9 = [(SSFollowUpController *)self pendingFollowUpWithIdentifier:v7];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__SSFollowUpController_dismissFollowUpWithIdentifier_account___block_invoke;
  v15[3] = &unk_1E5BABA90;
  objc_copyWeak(&v18, &location);
  id v10 = v8;
  id v16 = v10;
  id v17 = v7;
  v11 = [v9 thenWithBlock:v15];
  uint64_t v12 = +[SSBinaryPromise promiseWithPromise:v11];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

id __62__SSFollowUpController_dismissFollowUpWithIdentifier_account___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!*(void *)(a1 + 32)) {
    goto LABEL_4;
  }
  uint64_t v5 = [v3 userInfo];
  v6 = getAAFollowUpUserInfoAccountIdentifier();
  id v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = [*(id *)(a1 + 32) backingAccount];
  v9 = [v8 identifier];
  int v10 = [v7 isEqualToString:v9];

  if (v10)
  {

LABEL_4:
    uint64_t v5 = [WeakRetained _dismissFollowUpWithIdentifier:*(void *)(a1 + 40)];
    v11 = [v5 promiseAdapter];
    goto LABEL_17;
  }
  uint64_t v12 = +[SSLogConfig sharedFollowUpConfig];
  if (!v12)
  {
    uint64_t v12 = +[SSLogConfig sharedConfig];
  }
  int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  v15 = [v12 OSLogObject];
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    v14 &= 2u;
  }
  if (v14)
  {
    id v16 = objc_opt_class();
    v32 = v5;
    id v18 = *(void **)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    id v31 = v16;
    v19 = [v18 backingAccount];
    [v19 identifier];
    int v33 = 138544130;
    v34 = v16;
    __int16 v35 = 2114;
    uint64_t v36 = v17;
    uint64_t v5 = v32;
    __int16 v37 = 2114;
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v39 = 2114;
    v40 = v7;
    LODWORD(v30) = 42;
    v20 = (void *)_os_log_send_and_compose_impl();

    if (v20)
    {
      v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v33, v30);
      free(v20);
      SSFileLog(v12, @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v21);
    }
  }
  else
  {
  }
  v28 = SSError(@"SSErrorDomain", 100, 0, @"Refusing to dismiss a pending follow-up. The follow-up was not for the specified account.");
  v11 = +[SSPromise promiseWithError:v28];

LABEL_17:
  return v11;
}

- (id)pendingFollowUpWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SSFollowUpController.m", 125, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v6 = objc_alloc_init(SSPromise);
  id v7 = [(SSFollowUpController *)self followUpController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__SSFollowUpController_pendingFollowUpWithIdentifier___block_invoke;
  v12[3] = &unk_1E5BABAE0;
  id v8 = v6;
  int v13 = v8;
  id v14 = v5;
  [v7 pendingFollowUpItemsWithCompletion:v12];

  v9 = v8;
  return v9;
}

void __54__SSFollowUpController_pendingFollowUpWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "finishWithError:");
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__SSFollowUpController_pendingFollowUpWithIdentifier___block_invoke_2;
    v8[3] = &unk_1E5BABAB8;
    v8[4] = *(void *)(a1 + 40);
    v4 = objc_msgSend(a2, "_ss_firstObjectPassingTest:", v8);
    id v5 = *(void **)(a1 + 32);
    if (v4)
    {
      [v5 finishWithResult:v4];
    }
    else
    {
      id v7 = SSError(@"SSErrorDomain", 100, 0, @"Unable to find a pending follow-up.");
      [v5 finishWithError:v7];
    }
  }
}

uint64_t __54__SSFollowUpController_pendingFollowUpWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)postFollowUpWithIdentifier:(id)a3 account:(id)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v9)
  {
    if (v11)
    {
LABEL_3:
      id v13 = (id)[v12 mutableCopy];
      goto LABEL_6;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SSFollowUpController.m", 160, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
LABEL_6:
  v15 = v13;
  if (v10)
  {
    id v16 = [v10 backingAccount];
    uint64_t v17 = [v16 identifier];
    id v18 = getAAFollowUpUserInfoAccountIdentifier();
    [v15 setObject:v17 forKeyedSubscript:v18];

    v19 = [v10 altDSID];
    if ([v19 length])
    {
      v20 = getAAFollowUpUserInfoAltDSID();
      [v15 setObject:v19 forKeyedSubscript:v20];
    }
  }
  v21 = [(SSFollowUpController *)self _postFollowUpWithIdentifier:v9 userInfo:v15];

  return v21;
}

- (id)postFollowUpWithIdentifier:(id)a3 userInfo:(id)a4
{
  return [(SSFollowUpController *)self postFollowUpWithIdentifier:a3 account:0 userInfo:a4];
}

- (id)_createFollowUpItemForIdentifier:(id)a3 userInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SSFollowUpController.m", 195, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  if (![v7 isEqualToString:@"com.apple.SSFollowUpIdentifier.RenewCredentials"]
    || ([(SSFollowUpController *)self _createFollowUpItemForRenewCredentialsWithUserInfo:v8], (id v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v10 = +[SSLogConfig sharedFollowUpConfig];
    if (!v10)
    {
      id v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    id v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      *(_DWORD *)uint64_t v25 = 138543618;
      *(void *)&v25[4] = objc_opt_class();
      *(_WORD *)&v25[12] = 2114;
      *(void *)&v25[14] = v7;
      id v14 = *(id *)&v25[4];
      LODWORD(v24) = 22;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_16:

        id v9 = 0;
        goto LABEL_17;
      }
      id v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, v25, v24, *(_OWORD *)v25, *(void *)&v25[16], v26);
      free(v15);
      SSFileLog(v10, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_16;
  }
LABEL_17:

  return v9;
}

- (id)_createFollowUpItemForRenewCredentialsWithUserInfo:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = getAAFollowUpUserInfoAltDSID();
  id v5 = [v3 objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    id v7 = +[SSLogConfig sharedFollowUpConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      LODWORD(v53) = 138543362;
      *(void *)((char *)&v53 + 4) = objc_opt_class();
      id v11 = *(id *)((char *)&v53 + 4);
      LODWORD(v47) = 12;
      int v12 = (void *)_os_log_send_and_compose_impl();

      if (v12)
      {
        id v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v53, v47);
        free(v12);
        SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
      }
    }
    else
    {
    }
  }
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2050000000;
  uint64_t v20 = (void *)getFLFollowUpActionClass_softClass;
  uint64_t v51 = getFLFollowUpActionClass_softClass;
  if (!getFLFollowUpActionClass_softClass)
  {
    *(void *)&long long v53 = MEMORY[0x1E4F143A8];
    *((void *)&v53 + 1) = 3221225472;
    v54 = __getFLFollowUpActionClass_block_invoke;
    v55 = &unk_1E5BA7298;
    v56 = &v48;
    __getFLFollowUpActionClass_block_invoke((uint64_t)&v53);
    uint64_t v20 = (void *)v49[3];
  }
  uint64_t v21 = v20;
  _Block_object_dispose(&v48, 8);
  id v22 = objc_alloc_init(v21);
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v23 = (void *)getAAFollowUpActionPrimarySymbolLoc_ptr;
  uint64_t v51 = getAAFollowUpActionPrimarySymbolLoc_ptr;
  if (!getAAFollowUpActionPrimarySymbolLoc_ptr)
  {
    *(void *)&long long v53 = MEMORY[0x1E4F143A8];
    *((void *)&v53 + 1) = 3221225472;
    v54 = __getAAFollowUpActionPrimarySymbolLoc_block_invoke;
    v55 = &unk_1E5BA7298;
    v56 = &v48;
    uint64_t v24 = (void *)AppleAccountLibrary();
    uint64_t v25 = dlsym(v24, "AAFollowUpActionPrimary");
    *(void *)(v56[1] + 24) = v25;
    getAAFollowUpActionPrimarySymbolLoc_ptr = *(void *)(v56[1] + 24);
    uint64_t v23 = (void *)v49[3];
  }
  _Block_object_dispose(&v48, 8);
  if (!v23) {
    -[SSFollowUpController _createFollowUpItemForRenewCredentialsWithUserInfo:]();
  }
  [v22 setIdentifier:*v23];
  uint64_t v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v27 = [v26 localizedStringForKey:@"FOLLOWUP_RENEW_CREDENTIALS_PRIMARY" value:&stru_1EF96DA90 table:@"Localizable"];
  [v22 setLabel:v27];

  v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v29 = [v28 localizedStringForKey:@"FOLLOWUP_RENEW_CREDENTIALS_MESSAGE" value:&stru_1EF96DA90 table:@"Localizable"];

  if (+[SSDevice deviceIsInternalBuild])
  {
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    uint64_t v30 = (void *)getAAFollowUpUserInfoClientNameSymbolLoc_ptr;
    uint64_t v51 = getAAFollowUpUserInfoClientNameSymbolLoc_ptr;
    if (!getAAFollowUpUserInfoClientNameSymbolLoc_ptr)
    {
      *(void *)&long long v53 = MEMORY[0x1E4F143A8];
      *((void *)&v53 + 1) = 3221225472;
      v54 = __getAAFollowUpUserInfoClientNameSymbolLoc_block_invoke;
      v55 = &unk_1E5BA7298;
      v56 = &v48;
      id v31 = (void *)AppleAccountLibrary();
      v32 = dlsym(v31, "AAFollowUpUserInfoClientName");
      *(void *)(v56[1] + 24) = v32;
      getAAFollowUpUserInfoClientNameSymbolLoc_ptr = *(void *)(v56[1] + 24);
      uint64_t v30 = (void *)v49[3];
    }
    _Block_object_dispose(&v48, 8);
    if (!v30) {
      -[SSFollowUpController _createFollowUpItemForRenewCredentialsWithUserInfo:]();
    }
    int v33 = [v3 objectForKeyedSubscript:*v30];
    if ([v33 length])
    {
      v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      __int16 v35 = [v34 localizedStringForKey:@"FOLLOWUP_RENEW_CREDENTIALS_MESSAGE_BLAME" value:&stru_1EF96DA90 table:@"Localizable"];
      uint64_t v36 = objc_msgSend(v29, "stringByAppendingFormat:", v35, v33);

      v29 = (void *)v36;
    }
  }
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2050000000;
  __int16 v37 = (void *)getFLFollowUpItemClass_softClass;
  uint64_t v51 = getFLFollowUpItemClass_softClass;
  if (!getFLFollowUpItemClass_softClass)
  {
    *(void *)&long long v53 = MEMORY[0x1E4F143A8];
    *((void *)&v53 + 1) = 3221225472;
    v54 = __getFLFollowUpItemClass_block_invoke;
    v55 = &unk_1E5BA7298;
    v56 = &v48;
    __getFLFollowUpItemClass_block_invoke((uint64_t)&v53);
    __int16 v37 = (void *)v49[3];
  }
  id v38 = v37;
  _Block_object_dispose(&v48, 8);
  id v39 = objc_alloc_init(v38);
  id v52 = v22;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  [v39 setActions:v40];

  [v39 setDisplayStyle:0];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v41 = (void *)getFLGroupIdentifierAccountSymbolLoc_ptr;
  uint64_t v51 = getFLGroupIdentifierAccountSymbolLoc_ptr;
  if (!getFLGroupIdentifierAccountSymbolLoc_ptr)
  {
    *(void *)&long long v53 = MEMORY[0x1E4F143A8];
    *((void *)&v53 + 1) = 3221225472;
    v54 = __getFLGroupIdentifierAccountSymbolLoc_block_invoke;
    v55 = &unk_1E5BA7298;
    v56 = &v48;
    v42 = (void *)CoreFollowUpLibrary();
    v43 = dlsym(v42, "FLGroupIdentifierAccount");
    *(void *)(v56[1] + 24) = v43;
    getFLGroupIdentifierAccountSymbolLoc_ptr = *(void *)(v56[1] + 24);
    uint64_t v41 = (void *)v49[3];
  }
  _Block_object_dispose(&v48, 8);
  if (!v41) {
    -[SSFollowUpController _createFollowUpItemForRenewCredentialsWithUserInfo:]();
  }
  [v39 setGroupIdentifier:*v41];
  [v39 setInformativeText:v29];
  v44 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v45 = [v44 localizedStringForKey:@"FOLLOWUP_RENEW_CREDENTIALS_TITLE" value:&stru_1EF96DA90 table:@"Localizable"];
  [v39 setTitle:v45];

  [v39 setUniqueIdentifier:@"com.apple.SSFollowUpIdentifier.RenewCredentials"];
  [v39 setUserInfo:v3];

  return v39;
}

- (id)_dismissFollowUpWithIdentifier:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SSFollowUpController.m", 241, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  uint64_t v6 = objc_alloc_init(SSBinaryPromise);
  id v7 = [(SSFollowUpController *)self followUpController];
  v12[0] = v5;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  int v9 = [(SSBinaryPromise *)v6 completionHandlerAdapter];
  [v7 clearPendingFollowUpItemsWithUniqueIdentifiers:v8 completion:v9];

  return v6;
}

- (id)_postFollowUpWithIdentifier:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SSFollowUpController.m", 252, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  int v9 = [(SSFollowUpController *)self _createFollowUpItemForIdentifier:v7 userInfo:v8];
  if (v9)
  {
    id v10 = objc_alloc_init(SSBinaryPromise);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__SSFollowUpController__postFollowUpWithIdentifier_userInfo___block_invoke;
    v16[3] = &unk_1E5BA7040;
    v16[4] = v7;
    [(SSBinaryPromise *)v10 addSuccessBlock:v16];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__SSFollowUpController__postFollowUpWithIdentifier_userInfo___block_invoke_56;
    v15[3] = &unk_1E5BA8720;
    void v15[4] = v7;
    [(SSBinaryPromise *)v10 addErrorBlock:v15];
    id v11 = [(SSFollowUpController *)self followUpController];
    int v12 = [(SSBinaryPromise *)v10 completionHandlerAdapter];
    [v11 postFollowUpItem:v9 completion:v12];
  }
  else
  {
    id v11 = SSError(@"SSErrorDomain", 100, 0, @"Unable to create a FLFollowUpItem.");
    id v10 = +[SSBinaryPromise promiseWithError:v11];
  }

  return v10;
}

void __61__SSFollowUpController__postFollowUpWithIdentifier_userInfo___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = +[SSLogConfig sharedFollowUpConfig];
  if (!v2)
  {
    v2 = +[SSLogConfig sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  id v5 = [v2 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    int v6 = v4;
  }
  else {
    int v6 = v4 & 2;
  }
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  int v16 = 138543362;
  uint64_t v17 = v7;
  LODWORD(v15) = 12;
  id v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v16, v15);
    free(v8);
    SSFileLog(v2, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v5);
LABEL_12:
  }
}

void __61__SSFollowUpController__postFollowUpWithIdentifier_userInfo___block_invoke_56(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = +[SSLogConfig sharedFollowUpConfig];
  if (!v4)
  {
    int v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  int v18 = 138543618;
  uint64_t v19 = v9;
  __int16 v20 = 2114;
  id v21 = v3;
  LODWORD(v17) = 22;
  uint64_t v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v18, v17);
    free(v10);
    SSFileLog(v4, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v7);
LABEL_12:
  }
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_createFollowUpItemForRenewCredentialsWithUserInfo:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAAFollowUpActionPrimary(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SSFollowUpController.m", 34, @"%s", dlerror());

  __break(1u);
}

- (void)_createFollowUpItemForRenewCredentialsWithUserInfo:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAAFollowUpUserInfoClientName(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SSFollowUpController.m", 37, @"%s", dlerror());

  __break(1u);
}

- (void)_createFollowUpItemForRenewCredentialsWithUserInfo:.cold.3()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getFLGroupIdentifierAccount(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SSFollowUpController.m", 38, @"%s", dlerror());

  __break(1u);
}

@end