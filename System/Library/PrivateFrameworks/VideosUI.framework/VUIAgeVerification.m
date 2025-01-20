@interface VUIAgeVerification
+ (id)sharedInstance;
- (BOOL)isAgeVerificationEnabled;
- (NSNumber)minMovieRatingRequiringAgeVerification;
- (NSNumber)minTvRatingRequiringAgeVerification;
- (id)notificationToken;
- (void)configureAgeVerification:(id)a3;
- (void)performAgeGateVerificationWithRatingValue:(id)a3 ratingDomain:(id)a4 completion:(id)a5;
- (void)setIsAgeVerificationEnabled:(BOOL)a3;
- (void)setMinMovieRatingRequiringAgeVerification:(id)a3;
- (void)setMinTvRatingRequiringAgeVerification:(id)a3;
- (void)setNotificationToken:(id)a3;
@end

@implementation VUIAgeVerification

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_53);
  }
  v2 = (void *)sharedInstance_sharedInstance_5;
  return v2;
}

void __36__VUIAgeVerification_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_5;
  sharedInstance_sharedInstance_5 = v0;
}

- (void)configureAgeVerification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 description];
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::setting preflightConfigDictionary %@", (uint8_t *)&v10, 0xCu);
  }
  v7 = objc_msgSend(v4, "vui_numberForKey:", @"isAgeVerificationEnabled");
  -[VUIAgeVerification setIsAgeVerificationEnabled:](self, "setIsAgeVerificationEnabled:", [v7 BOOLValue]);
  v8 = objc_msgSend(v4, "vui_numberForKey:", @"minTvRatingRequiringAgeVerification");
  if (v8) {
    [(VUIAgeVerification *)self setMinTvRatingRequiringAgeVerification:v8];
  }
  v9 = objc_msgSend(v4, "vui_numberForKey:", @"minMovieRatingRequiringAgeVerification");
  if (v9) {
    [(VUIAgeVerification *)self setMinMovieRatingRequiringAgeVerification:v9];
  }
}

- (void)performAgeGateVerificationWithRatingValue:(id)a3 ratingDomain:(id)a4 completion:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = COERCE_DOUBLE(a4);
  id v10 = a5;
  v11 = VUIDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v44 = v8;
    __int16 v45 = 2112;
    double v46 = v9;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::Checking content with rating:%@ for ratingDomain:%@", buf, 0x16u);
  }

  uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v13 = [(VUIAgeVerification *)self notificationToken];
  [v12 removeObserver:v13];

  LOBYTE(v13) = [*(id *)&v9 isEqualToString:*MEMORY[0x1E4FA9E58]];
  int v14 = [v8 intValue];
  if (v13) {
    [(VUIAgeVerification *)self minTvRatingRequiringAgeVerification];
  }
  else {
  v15 = [(VUIAgeVerification *)self minMovieRatingRequiringAgeVerification];
  }
  int v16 = [v15 intValue];

  if (v8 && v14 >= v16)
  {
    v17 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v18 = objc_msgSend(v17, "ams_activeiTunesAccount");

    v19 = objc_msgSend(v18, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x1E4F4D9C0]);
    [v19 doubleValue];
    double v21 = v20;

    v22 = [MEMORY[0x1E4F1C9C8] date];
    [v22 timeIntervalSince1970];
    v24 = v23;

    v25 = VUIDefaultLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v44 = v24;
      __int16 v45 = 2048;
      double v46 = v21 / 1000.0;
      _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::Content is restricted - checking if user needs age verification. Timestamp = %f , AMSAccountFlagAgeVerificationExpiration = %f", buf, 0x16u);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke;
    aBlock[3] = &unk_1E6DF4F40;
    id v42 = v10;
    v26 = _Block_copy(aBlock);
    v27 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
    id v28 = objc_alloc(MEMORY[0x1E4F4DF18]);
    v29 = +[VUIPreflightManager defaultPreflightManager];
    v30 = [v29 presentingController];
    v31 = (void *)[v28 initWithAccount:v18 bag:v27 options:MEMORY[0x1E4F1CC08] viewController:v30];

    v32 = [v31 isVerificationNeeded];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_4;
    v36[3] = &unk_1E6DF6CA0;
    v38 = self;
    id v39 = v26;
    id v37 = v31;
    v40 = v24;
    id v33 = v31;
    id v34 = v26;
    [v32 addFinishBlock:v36];
  }
  else
  {
    v35 = VUIDefaultLogObject();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v35, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::content not restricted", buf, 2u);
    }

    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke(uint64_t a1, char a2, int a3)
{
  if (a3)
  {
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_2;
    block[3] = &unk_1E6DF6338;
    v6 = &v13;
    id v13 = *(id *)(a1 + 32);
    char v14 = a2;
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v8 = __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_3;
    double v9 = &unk_1E6DF6338;
    v6 = &v10;
    id v10 = *(id *)(a1 + 32);
    char v11 = a2;
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v7[0], 3221225472)) {
      v8((uint64_t)v7);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v7);
    }
  }
}

uint64_t __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_4_cold_2((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    uint64_t v14 = [a2 requiredType];
    v15 = VUIDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = v14;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::AMSUIAgeVerificationTask isVerificationNeeded: resultType=%lu", buf, 0xCu);
    }

    if (v14)
    {
      if (v14 == 1)
      {
        id v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
        goto LABEL_6;
      }
      if ((v14 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        int v16 = [*(id *)(a1 + 32) performTask];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_15;
        v25[3] = &unk_1E6DF6C78;
        id v17 = *(id *)(a1 + 48);
        v25[4] = *(void *)(a1 + 40);
        id v26 = v17;
        uint64_t v27 = *(void *)(a1 + 56);
        uint64_t v28 = v14;
        [v16 addFinishBlock:v25];

        goto LABEL_7;
      }
      v18 = VUIDefaultLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_4_cold_1(v14, v18, v19, v20, v21, v22, v23, v24);
      }
    }
  }
  id v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_6:
  v13();
LABEL_7:
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_15(void *a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_15_cold_2((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }

LABEL_5:
    id v13 = *(void (**)(void))(a1[5] + 16);
LABEL_6:
    v13();
    goto LABEL_7;
  }
  uint64_t v14 = [a2 successType];
  v15 = VUIDefaultLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v32 = v14;
    _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::AMSUIAgeVerificationTask performTask: successType=%lu", buf, 0xCu);
  }

  if (!v14) {
    goto LABEL_5;
  }
  if ((v14 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    id v13 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_6;
  }
  int v16 = VUIDefaultLogObject();
  id v17 = v16;
  if (v14 != 2)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_15_cold_1((uint64_t)a1, v17, v24, v25, v26, v27, v28, v29);
    }

    goto LABEL_5;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::starting verification flow, adding observer for ACDAccountStoreDidChangeNotification", buf, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
  v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v19 = *MEMORY[0x1E4F178D8];
  uint64_t v20 = [MEMORY[0x1E4F28F08] mainQueue];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_17;
  v30[3] = &unk_1E6DF6C50;
  v30[5] = a1[6];
  v30[4] = a1[4];
  uint64_t v21 = [v18 addObserverForName:v19 object:0 queue:v20 usingBlock:v30];
  uint64_t v22 = a1[4];
  uint64_t v23 = *(void **)(v22 + 32);
  *(void *)(v22 + 32) = v21;

LABEL_7:
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_17(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  id v4 = objc_msgSend(v3, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x1E4F4D9C0]);
  [v4 doubleValue];
  double v6 = v5 / 1000.0;

  uint64_t v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    double v12 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::received ACDAccountStoreDidChangeNotification during age verification - rechecking AMSAccountFlagAgeVerificationExpiration=%f", (uint8_t *)&v11, 0xCu);
  }

  double v8 = *(double *)(a1 + 40);
  uint64_t v9 = VUIDefaultLogObject();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6 <= v8)
  {
    if (v10)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::user is still not age-verified", (uint8_t *)&v11, 2u);
    }
  }
  else
  {
    if (v10)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::user is now age-verified. Use will need to retry playback", (uint8_t *)&v11, 2u);
    }

    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:*(void *)(*(void *)(a1 + 32) + 32)];
  }
}

- (BOOL)isAgeVerificationEnabled
{
  return self->_isAgeVerificationEnabled;
}

- (void)setIsAgeVerificationEnabled:(BOOL)a3
{
  self->_isAgeVerificationEnabled = a3;
}

- (NSNumber)minTvRatingRequiringAgeVerification
{
  return self->_minTvRatingRequiringAgeVerification;
}

- (void)setMinTvRatingRequiringAgeVerification:(id)a3
{
}

- (NSNumber)minMovieRatingRequiringAgeVerification
{
  return self->_minMovieRatingRequiringAgeVerification;
}

- (void)setMinMovieRatingRequiringAgeVerification:(id)a3
{
}

- (id)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationToken, 0);
  objc_storeStrong((id *)&self->_minMovieRatingRequiringAgeVerification, 0);
  objc_storeStrong((id *)&self->_minTvRatingRequiringAgeVerification, 0);
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, a2, a3, "VUIAgeVerificationManager::Unknown resultType returned %lul", a5, a6, a7, a8, 0);
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_4_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, a2, a3, "VUIAgeVerificationManager::Error returned in AMSUIAgeVerificationTask isVerificationNeeded: %@", a5, a6, a7, a8, 2u);
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_15_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, a2, a3, "VUIAgeVerificationManager::Unknown successType returned %lul", a5, a6, a7, a8, 0);
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_15_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, a2, a3, "VUIAgeVerificationManager::AMSUIAgeVerificationTask performTask: error= %@", a5, a6, a7, a8, 2u);
}

@end