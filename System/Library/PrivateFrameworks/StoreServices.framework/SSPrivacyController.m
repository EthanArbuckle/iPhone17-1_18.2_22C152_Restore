@interface SSPrivacyController
+ (BOOL)shouldDisplayPrivacyLinkWithIdentifier:(id)a3;
+ (id)_appendPrivacyAcknowledgementToActiveAccount:(id)a3 withURL:(id)a4;
+ (id)_syncPrivacyAcknowledgementOnAccount:(id)a3 URL:(id)a4;
+ (id)_translateIdentifierToPrivacyAcknowledgement:(id)a3 withVersion:(unint64_t)a4;
+ (id)appStorePrivacyIdentifiers;
+ (id)storePrivacyIdentifiers;
+ (id)viewControllerForPrivacySplashWithIdentifier:(id)a3 URL:(id)a4;
+ (unint64_t)_currentPrivacyContentVersionForIdentifier:(id)a3;
+ (void)_appendPrivacyAcknowledgement:(id)a3 toAccount:(id)a4;
+ (void)_appendPrivacyAcknowledgementToLocalAccount:(id)a3;
+ (void)acknowledgePrivacyLinkWithIdentifier:(id)a3 URL:(id)a4;
+ (void)syncPrivacyAcknowledgementOnAccount:(id)a3 URL:(id)a4;
@end

@implementation SSPrivacyController

+ (void)acknowledgePrivacyLinkWithIdentifier:(id)a3 URL:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _currentPrivacyContentVersionForIdentifier:v6];
  if (!v8)
  {
    v9 = +[SSLogConfig sharedPrivacyConfig];
    if (!v9)
    {
      v9 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    v13 = [v9 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      *(_DWORD *)v23 = 138543618;
      *(void *)&v23[4] = objc_opt_class();
      *(_WORD *)&v23[12] = 2114;
      *(void *)&v23[14] = v6;
      id v14 = *(id *)&v23[4];
      LODWORD(v22) = 22;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15) {
        goto LABEL_14;
      }
      v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, v23, v22, *(_OWORD *)v23, *(void *)&v23[16], v24);
      free(v15);
      SSFileLog(v9, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_14;
  }
  v9 = [a1 _translateIdentifierToPrivacyAcknowledgement:v6 withVersion:v8];
  [a1 _appendPrivacyAcknowledgementToLocalAccount:v9];
  v10 = [a1 _appendPrivacyAcknowledgementToActiveAccount:v9 withURL:v7];
  [v10 addFinishBlock:&__block_literal_global_0];

LABEL_14:
}

uint64_t __64__SSPrivacyController_acknowledgePrivacyLinkWithIdentifier_URL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 code];
}

+ (BOOL)shouldDisplayPrivacyLinkWithIdentifier:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int ShouldDisableGDPR = SSDebugShouldDisableGDPR();
  uint64_t v6 = +[SSLogConfig sharedPrivacyConfig];
  id v7 = (void *)v6;
  if (!ShouldDisableGDPR)
  {
    if (!v6)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v19 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    uint64_t v21 = [v7 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      v20 &= 2u;
    }
    if (v20)
    {
      *(_DWORD *)v66 = 138543618;
      *(void *)&v66[4] = objc_opt_class();
      *(_WORD *)&v66[12] = 2114;
      *(void *)&v66[14] = v4;
      id v22 = *(id *)&v66[4];
      LODWORD(v65) = 22;
      v64 = v66;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23) {
        goto LABEL_24;
      }
      uint64_t v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, v66, v65, *(void *)v66, *(_OWORD *)&v66[8]);
      free(v23);
      SSFileLog(v7, @"%@", v24, v25, v26, v27, v28, v29, (uint64_t)v21);
    }

LABEL_24:
    v30 = +[SSAccountStore defaultStore];
    id v7 = [v30 activeAccount];

    if (!v7)
    {
      v31 = +[SSAccountStore defaultStore];
      v32 = [v31 localAccount];
      id v7 = [v32 resultWithError:0];
    }
    v33 = objc_msgSend(v7, "privacyAcknowledgement", v64);
    v34 = [v33 objectForKeyedSubscript:v4];
    if (v34)
    {
      unint64_t v35 = [a1 _currentPrivacyContentVersionForIdentifier:v4];
      v36 = +[SSLogConfig sharedPrivacyConfig];
      if (!v36)
      {
        v36 = +[SSLogConfig sharedConfig];
      }
      int v37 = [v36 shouldLog];
      if ([v36 shouldLogToDisk]) {
        int v38 = v37 | 2;
      }
      else {
        int v38 = v37;
      }
      v39 = [v36 OSLogObject];
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO)) {
        v38 &= 2u;
      }
      if (v38)
      {
        v40 = objc_opt_class();
        id v41 = v40;
        uint64_t v42 = [v34 unsignedIntegerValue];
        *(_DWORD *)v66 = 138544130;
        *(void *)&v66[4] = v40;
        *(_WORD *)&v66[12] = 2114;
        *(void *)&v66[14] = v4;
        *(_WORD *)&v66[22] = 2048;
        uint64_t v67 = v42;
        __int16 v68 = 2048;
        unint64_t v69 = v35;
        LODWORD(v65) = 42;
        v43 = (void *)_os_log_send_and_compose_impl();

        if (!v43)
        {
LABEL_38:

          LOBYTE(v12) = [v34 unsignedIntegerValue] < v35;
LABEL_51:

          goto LABEL_52;
        }
        v39 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, v66, v65);
        free(v43);
        SSFileLog(v36, @"%@", v44, v45, v46, v47, v48, v49, (uint64_t)v39);
      }

      goto LABEL_38;
    }
    v50 = +[SSLogConfig sharedPrivacyConfig];
    if (!v50)
    {
      v50 = +[SSLogConfig sharedConfig];
    }
    int v51 = [v50 shouldLog];
    if ([v50 shouldLogToDisk]) {
      int v52 = v51 | 2;
    }
    else {
      int v52 = v51;
    }
    v53 = [v50 OSLogObject];
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_INFO)) {
      v52 &= 2u;
    }
    if (v52)
    {
      v54 = objc_opt_class();
      *(_DWORD *)v66 = 138543618;
      *(void *)&v66[4] = v54;
      *(_WORD *)&v66[12] = 2114;
      *(void *)&v66[14] = v4;
      id v55 = v54;
      LODWORD(v65) = 22;
      v56 = (void *)_os_log_send_and_compose_impl();

      if (!v56)
      {
LABEL_50:

        LOBYTE(v12) = 1;
        goto LABEL_51;
      }
      v53 = objc_msgSend(NSString, "stringWithCString:encoding:", v56, 4, v66, v65);
      free(v56);
      SSFileLog(v50, @"%@", v57, v58, v59, v60, v61, v62, (uint64_t)v53);
    }

    goto LABEL_50;
  }
  if (!v6)
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
  v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_12;
  }
  *(_DWORD *)v66 = 138543362;
  *(void *)&v66[4] = objc_opt_class();
  id v11 = *(id *)&v66[4];
  LODWORD(v65) = 12;
  int v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, v66, v65, *(_OWORD *)v66);
    free(v12);
    SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v10);
LABEL_12:

    LOBYTE(v12) = 0;
  }
LABEL_52:

  return (char)v12;
}

+ (id)storePrivacyIdentifiers
{
  if (storePrivacyIdentifiers_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&storePrivacyIdentifiers_ss_once_token___COUNTER__, &__block_literal_global_33);
  }
  v2 = (void *)storePrivacyIdentifiers_ss_once_object___COUNTER__;
  return v2;
}

void __46__SSPrivacyController_storePrivacyIdentifiers__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = @"com.apple.onboarding.itunesstore";
  v4[1] = @"com.apple.onboarding.videos";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 initWithArray:v1];
  v3 = (void *)storePrivacyIdentifiers_ss_once_object___COUNTER__;
  storePrivacyIdentifiers_ss_once_object___COUNTER__ = v2;
}

+ (id)appStorePrivacyIdentifiers
{
  if (appStorePrivacyIdentifiers_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&appStorePrivacyIdentifiers_ss_once_token___COUNTER__, &__block_literal_global_37);
  }
  uint64_t v2 = (void *)appStorePrivacyIdentifiers_ss_once_object___COUNTER__;
  return v2;
}

void __49__SSPrivacyController_appStorePrivacyIdentifiers__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = @"com.apple.onboarding.appstore";
  v4[1] = @"com.apple.onboarding.applearcade";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 initWithArray:v1];
  v3 = (void *)appStorePrivacyIdentifiers_ss_once_object___COUNTER__;
  appStorePrivacyIdentifiers_ss_once_object___COUNTER__ = v2;
}

+ (void)syncPrivacyAcknowledgementOnAccount:(id)a3 URL:(id)a4
{
  id v4 = (id)[a1 _syncPrivacyAcknowledgementOnAccount:a3 URL:a4];
}

+ (id)viewControllerForPrivacySplashWithIdentifier:(id)a3 URL:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  id v7 = (void *)getAMSUIPrivacyViewControllerClass_softClass;
  uint64_t v35 = getAMSUIPrivacyViewControllerClass_softClass;
  if (!getAMSUIPrivacyViewControllerClass_softClass)
  {
    *(void *)&long long v36 = MEMORY[0x1E4F143A8];
    *((void *)&v36 + 1) = 3221225472;
    int v37 = __getAMSUIPrivacyViewControllerClass_block_invoke;
    int v38 = &unk_1E5BA7298;
    v39 = &v32;
    __getAMSUIPrivacyViewControllerClass_block_invoke((uint64_t)&v36);
    id v7 = (void *)v33[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v32, 8);
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __72__SSPrivacyController_viewControllerForPrivacySplashWithIdentifier_URL___block_invoke;
  uint64_t v29 = &unk_1E5BA7220;
  id v30 = v5;
  id v9 = v6;
  id v31 = v9;
  v10 = [v8 privacyControllerWithIdentifier:v5 acknowledgementHandler:&v26];
  if (!v10)
  {
    id v11 = +[SSLogConfig sharedPrivacyConfig];
    if (!v11)
    {
      id v11 = +[SSLogConfig sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    uint64_t v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      v13 &= 2u;
    }
    if (v13)
    {
      uint64_t v15 = objc_opt_class();
      LODWORD(v36) = 138543362;
      *(void *)((char *)&v36 + 4) = v15;
      id v16 = v15;
      LODWORD(v25) = 12;
      uint64_t v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v36, v25, v26, v27, v28, v29, v30);
      free(v17);
      SSFileLog(v11, @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v14);
    }

    goto LABEL_15;
  }
LABEL_16:

  return v10;
}

uint64_t __72__SSPrivacyController_viewControllerForPrivacySplashWithIdentifier_URL___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return +[SSPrivacyController acknowledgePrivacyLinkWithIdentifier:*(void *)(result + 32) URL:*(void *)(result + 40)];
  }
  return result;
}

+ (void)_appendPrivacyAcknowledgement:(id)a3 toAccount:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = [v6 alloc];
  uint64_t v9 = [v5 privacyAcknowledgement];
  v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = MEMORY[0x1E4F1CC08];
  }
  int v12 = (void *)[v8 initWithDictionary:v11];

  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __63__SSPrivacyController__appendPrivacyAcknowledgement_toAccount___block_invoke;
  v49[3] = &unk_1E5BA7248;
  id v13 = v12;
  id v50 = v13;
  [v7 enumerateKeysAndObjectsUsingBlock:v49];

  uint64_t v14 = [v5 privacyAcknowledgement];
  int v15 = [v14 isEqualToDictionary:v13];

  if (v15)
  {
    id v16 = +[SSLogConfig sharedPrivacyConfig];
    if (!v16)
    {
      id v16 = +[SSLogConfig sharedConfig];
    }
    int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    uint64_t v19 = [v16 OSLogObject];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      v18 &= 2u;
    }
    if (!v18) {
      goto LABEL_27;
    }
    uint64_t v20 = objc_opt_class();
    id v21 = v20;
    uint64_t v22 = [v5 hashedDescription];
    uint64_t v23 = [v5 privacyAcknowledgement];
    int v51 = 138544130;
    int v52 = v20;
    __int16 v53 = 2114;
    v54 = v22;
    __int16 v55 = 2114;
    id v56 = v23;
    __int16 v57 = 2114;
    id v58 = v13;
    LODWORD(v47) = 42;
    uint64_t v24 = (void *)_os_log_send_and_compose_impl();

    if (v24)
    {
      uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v51, v47);
      free(v24);
      SSFileLog(v16, @"%@", v25, v26, v27, v28, v29, v30, (uint64_t)v19);
LABEL_27:
    }
  }
  else
  {
    id v31 = (void *)[v13 copy];
    [v5 setPrivacyAcknowledgement:v31];

    uint64_t v32 = +[SSAccountStore defaultStore];
    id v48 = 0;
    char v33 = [v32 saveAccount:v5 verifyCredentials:0 error:&v48];
    id v16 = v48;

    if ((v33 & 1) == 0)
    {
      uint64_t v19 = +[SSLogConfig sharedPrivacyConfig];
      if (!v19)
      {
        uint64_t v19 = +[SSLogConfig sharedConfig];
      }
      int v34 = [v19 shouldLog];
      if ([v19 shouldLogToDisk]) {
        int v35 = v34 | 2;
      }
      else {
        int v35 = v34;
      }
      long long v36 = [v19 OSLogObject];
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        v35 &= 2u;
      }
      if (v35)
      {
        int v37 = objc_opt_class();
        id v38 = v37;
        v39 = [v5 hashedDescription];
        int v51 = 138543874;
        int v52 = v37;
        __int16 v53 = 2114;
        v54 = v39;
        __int16 v55 = 2114;
        id v56 = v16;
        LODWORD(v47) = 32;
        uint64_t v40 = (void *)_os_log_send_and_compose_impl();

        if (!v40) {
          goto LABEL_27;
        }
        long long v36 = objc_msgSend(NSString, "stringWithCString:encoding:", v40, 4, &v51, v47);
        free(v40);
        SSFileLog(v19, @"%@", v41, v42, v43, v44, v45, v46, (uint64_t)v36);
      }

      goto LABEL_27;
    }
  }
}

void __63__SSPrivacyController__appendPrivacyAcknowledgement_toAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
    }
  }
}

+ (id)_appendPrivacyAcknowledgementToActiveAccount:(id)a3 withURL:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SSAccountStore defaultStore];
  uint64_t v9 = [v8 activeAccount];

  uint64_t v10 = +[SSLogConfig sharedPrivacyConfig];
  uint64_t v11 = (void *)v10;
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = +[SSLogConfig sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    uint64_t v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      *(_DWORD *)id v38 = 138543874;
      *(void *)&v38[4] = objc_opt_class();
      *(_WORD *)&v38[12] = 2114;
      *(void *)&v38[14] = v9;
      *(_WORD *)&v38[22] = 2114;
      id v39 = v6;
      id v15 = *(id *)&v38[4];
      LODWORD(v37) = 32;
      id v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_13:

        [a1 _appendPrivacyAcknowledgement:v6 toAccount:v9];
        uint64_t v23 = [a1 _syncPrivacyAcknowledgementOnAccount:v9 URL:v7];
        goto LABEL_26;
      }
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, v38, v37, *(_OWORD *)v38, *(void *)&v38[16], v39);
      free(v16);
      SSFileLog(v11, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
    }

    goto LABEL_13;
  }
  if (!v10)
  {
    uint64_t v11 = +[SSLogConfig sharedConfig];
  }
  int v24 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v25 = v24 | 2;
  }
  else {
    int v25 = v24;
  }
  uint64_t v26 = [v11 OSLogObject];
  if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
    v25 &= 2u;
  }
  if (!v25) {
    goto LABEL_24;
  }
  *(_DWORD *)id v38 = 138543362;
  *(void *)&v38[4] = objc_opt_class();
  id v27 = *(id *)&v38[4];
  LODWORD(v37) = 12;
  uint64_t v28 = (void *)_os_log_send_and_compose_impl();

  if (v28)
  {
    uint64_t v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, v38, v37, *(void *)v38, *(void *)&v38[8]);
    free(v28);
    SSFileLog(v11, @"%@", v29, v30, v31, v32, v33, v34, (uint64_t)v26);
LABEL_24:
  }
  uint64_t v23 = objc_alloc_init(SSBinaryPromise);
  int v35 = SSError(@"SSErrorDomain", 106, @"Not Available", @"No account to acknowledge");
  [(SSBinaryPromise *)v23 finishWithError:v35];

LABEL_26:
  return v23;
}

+ (void)_appendPrivacyAcknowledgementToLocalAccount:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SSLogConfig sharedPrivacyConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_11;
  }
  *(_DWORD *)uint64_t v21 = 138543618;
  *(void *)&v21[4] = objc_opt_class();
  *(_WORD *)&v21[12] = 2114;
  *(void *)&v21[14] = v4;
  id v9 = *(id *)&v21[4];
  LODWORD(v20) = 22;
  uint64_t v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, v21, v20, *(_OWORD *)v21, *(void *)&v21[16], v22);
    free(v10);
    SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
LABEL_11:
  }
  uint64_t v17 = +[SSAccountStore defaultStore];
  uint64_t v18 = [v17 localAccount];
  uint64_t v19 = [v18 resultWithError:0];

  [a1 _appendPrivacyAcknowledgement:v4 toAccount:v19];
}

+ (unint64_t)_currentPrivacyContentVersionForIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v4 = (void *)getOBBundleClass_softClass;
  uint64_t v20 = getOBBundleClass_softClass;
  if (!getOBBundleClass_softClass)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __getOBBundleClass_block_invoke;
    uint64_t v15 = &unk_1E5BA7298;
    uint64_t v16 = &v17;
    __getOBBundleClass_block_invoke((uint64_t)&v12);
    id v4 = (void *)v18[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v17, 8);
  int v6 = [v5 bundleWithIdentifier:v3];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2050000000;
  int v7 = (void *)getOBPrivacyFlowClass_softClass;
  uint64_t v20 = getOBPrivacyFlowClass_softClass;
  if (!getOBPrivacyFlowClass_softClass)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __getOBPrivacyFlowClass_block_invoke;
    uint64_t v15 = &unk_1E5BA7298;
    uint64_t v16 = &v17;
    __getOBPrivacyFlowClass_block_invoke((uint64_t)&v12);
    int v7 = (void *)v18[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v17, 8);
  id v9 = [v8 flowWithBundle:v6];
  unint64_t v10 = [v9 contentVersion];

  return v10;
}

+ (id)_syncPrivacyAcknowledgementOnAccount:(id)a3 URL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(SSBinaryPromise);
  if ([v6 isLocalAccount])
  {
    id v9 = SSError(@"SSErrorDomain", 106, @"Not Available", @"Privacy acknowlegment not available for local accounts");
    [(SSBinaryPromise *)v8 finishWithError:v9];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = +[SSDevice currentDevice];
    uint64_t v12 = [v11 uniqueDeviceIdentifier];

    if (v12) {
      [v10 setObject:v12 forKeyedSubscript:@"guid"];
    }
    uint64_t v13 = [v6 privacyAcknowledgement];

    if (v13)
    {
      uint64_t v14 = [v6 privacyAcknowledgement];
      [v10 setObject:v14 forKeyedSubscript:@"privacyAcknowledgement"];
    }
    uint64_t v15 = objc_alloc_init(SSMutableURLRequestProperties);
    [(SSMutableURLRequestProperties *)v15 setCachePolicy:1];
    [(SSMutableURLRequestProperties *)v15 setHTTPMethod:@"POST"];
    [(SSMutableURLRequestProperties *)v15 setRequestParameters:v10];
    [(SSMutableURLRequestProperties *)v15 setURL:v7];
    [(SSMutableURLRequestProperties *)v15 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x2050000000;
    uint64_t v16 = (void *)getISStoreURLOperationClass_softClass;
    uint64_t v49 = getISStoreURLOperationClass_softClass;
    if (!getISStoreURLOperationClass_softClass)
    {
      uint64_t v41 = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      uint64_t v43 = __getISStoreURLOperationClass_block_invoke;
      uint64_t v44 = &unk_1E5BA7298;
      uint64_t v45 = &v46;
      __getISStoreURLOperationClass_block_invoke((uint64_t)&v41);
      uint64_t v16 = (void *)v47[3];
    }
    uint64_t v33 = (void *)v12;
    uint64_t v17 = v16;
    _Block_object_dispose(&v46, 8);
    id v18 = objc_alloc_init(v17);
    uint64_t v19 = [[SSAuthenticationContext alloc] initWithAccount:v6];
    [v18 setAuthenticationContext:v19];

    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x2050000000;
    uint64_t v20 = (void *)getISProtocolDataProviderClass_softClass;
    uint64_t v49 = getISProtocolDataProviderClass_softClass;
    if (!getISProtocolDataProviderClass_softClass)
    {
      uint64_t v41 = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      uint64_t v43 = __getISProtocolDataProviderClass_block_invoke;
      uint64_t v44 = &unk_1E5BA7298;
      uint64_t v45 = &v46;
      __getISProtocolDataProviderClass_block_invoke((uint64_t)&v41);
      uint64_t v20 = (void *)v47[3];
    }
    uint64_t v21 = v20;
    _Block_object_dispose(&v46, 8);
    id v22 = objc_alloc_init(v21);
    [v18 setDataProvider:v22];

    [v18 setRequestProperties:v15];
    objc_initWeak(&location, v18);
    objc_initWeak(&from, a1);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __64__SSPrivacyController__syncPrivacyAcknowledgementOnAccount_URL___block_invoke;
    v34[3] = &unk_1E5BA7270;
    objc_copyWeak(&v37, &from);
    objc_copyWeak(&v38, &location);
    uint64_t v23 = v8;
    int v35 = v23;
    id v36 = v6;
    [v18 setCompletionBlock:v34];
    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x2050000000;
    int v24 = (void *)getISOperationQueueClass_softClass;
    uint64_t v49 = getISOperationQueueClass_softClass;
    if (!getISOperationQueueClass_softClass)
    {
      uint64_t v41 = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      uint64_t v43 = __getISOperationQueueClass_block_invoke;
      uint64_t v44 = &unk_1E5BA7298;
      uint64_t v45 = &v46;
      __getISOperationQueueClass_block_invoke((uint64_t)&v41);
      int v24 = (void *)v47[3];
    }
    int v25 = v8;
    id v26 = v7;
    id v27 = v10;
    id v28 = v24;
    _Block_object_dispose(&v46, 8);
    uint64_t v29 = [v28 mainQueue];
    [v29 addOperation:v18];

    uint64_t v30 = v36;
    uint64_t v31 = v23;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    id v7 = v26;
    id v8 = v25;
  }

  return v8;
}

void __64__SSPrivacyController__syncPrivacyAcknowledgementOnAccount_URL___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = (id *)(a1 + 56);
  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  char v5 = [v4 success];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 56));
    id v7 = [v6 dataProvider];
    id v8 = [v7 output];

    uint64_t v9 = +[SSLogConfig sharedPrivacyConfig];
    id v10 = (void *)v9;
    if (v8)
    {
      if (!v9)
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
      uint64_t v13 = [v10 OSLogObject];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        v12 &= 2u;
      }
      if (v12)
      {
        *(_DWORD *)int v52 = 138543362;
        *(void *)&v52[4] = objc_opt_class();
        id v14 = *(id *)&v52[4];
        LODWORD(v51) = 12;
        id v50 = v52;
        uint64_t v15 = (void *)_os_log_send_and_compose_impl();

        if (!v15)
        {
LABEL_14:

          [WeakRetained _appendPrivacyAcknowledgement:v8 toAccount:*(void *)(a1 + 40)];
LABEL_39:
          objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess", v50);
          goto LABEL_40;
        }
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, v52, v51, *(_OWORD *)v52);
        free(v15);
        SSFileLog(v10, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v13);
      }

      goto LABEL_14;
    }
    if (!v9)
    {
      id v10 = +[SSLogConfig sharedConfig];
    }
    int v39 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v40 = v39 | 2;
    }
    else {
      int v40 = v39;
    }
    uint64_t v41 = [v10 OSLogObject];
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      v40 &= 2u;
    }
    if (v40)
    {
      *(_DWORD *)int v52 = 138543362;
      *(void *)&v52[4] = objc_opt_class();
      id v42 = *(id *)&v52[4];
      LODWORD(v51) = 12;
      id v50 = v52;
      uint64_t v43 = (void *)_os_log_send_and_compose_impl();

      if (!v43)
      {
LABEL_38:

        goto LABEL_39;
      }
      uint64_t v41 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, v52, v51, *(void *)v52, *(void *)&v52[8]);
      free(v43);
      SSFileLog(v10, @"%@", v44, v45, v46, v47, v48, v49, (uint64_t)v41);
    }

    goto LABEL_38;
  }
  id v22 = +[SSLogConfig sharedPrivacyConfig];
  if (!v22)
  {
    id v22 = +[SSLogConfig sharedConfig];
  }
  int v23 = [v22 shouldLog];
  if ([v22 shouldLogToDisk]) {
    int v24 = v23 | 2;
  }
  else {
    int v24 = v23;
  }
  int v25 = [v22 OSLogObject];
  if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    v24 &= 2u;
  }
  if (!v24) {
    goto LABEL_25;
  }
  id v26 = objc_opt_class();
  id v27 = v26;
  id v28 = objc_loadWeakRetained((id *)(a1 + 56));
  [v28 error];
  *(_DWORD *)int v52 = 138543618;
  *(void *)&v52[4] = v26;
  *(void *)&v52[14] = *(_WORD *)&v52[12] = 2114;
  LODWORD(v51) = 22;
  uint64_t v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    int v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, v52, v51);
    free(v29);
    SSFileLog(v22, @"%@", v30, v31, v32, v33, v34, v35, (uint64_t)v25);
LABEL_25:
  }
  id v36 = *(void **)(a1 + 32);
  id v8 = objc_loadWeakRetained(v3);
  id v37 = [v8 error];
  id v38 = SSErrorWithUnderlyingError((uint64_t)v37, @"SSErrorDomain", 100, @"Acknowlegment Failed", @"Failed to send acknowlegment");
  [v36 finishWithError:v38];

LABEL_40:
}

+ (id)_translateIdentifierToPrivacyAcknowledgement:(id)a3 withVersion:(unint64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (![v7 length])
  {
    int v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:a1 file:@"SSPrivacyController.m" lineNumber:298 description:@"identifier cannot be empty or nil."];
  }
  id v8 = [a1 storePrivacyIdentifiers];
  uint64_t v9 = [a1 appStorePrivacyIdentifiers];
  if ([v8 containsObject:v7])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (!v12) {
      goto LABEL_22;
    }
    uint64_t v13 = v12;
    id v26 = v9;
    id v27 = v8;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a4, v26, v27);
        [v10 setObject:v17 forKeyedSubscript:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v13);
LABEL_20:
    uint64_t v9 = v26;
    id v8 = v27;
    goto LABEL_22;
  }
  if ([v9 containsObject:v7])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v9;
    uint64_t v18 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (!v18) {
      goto LABEL_22;
    }
    uint64_t v19 = v18;
    id v26 = v9;
    id v27 = v8;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v11);
        }
        uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        int v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a4, v26, v27, (void)v28);
        [v10 setObject:v23 forKeyedSubscript:v22];
      }
      uint64_t v19 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v19);
    goto LABEL_20;
  }
  id v36 = v7;
  id v11 = [NSNumber numberWithUnsignedInteger:a4];
  id v37 = v11;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
LABEL_22:

  return v10;
}

@end