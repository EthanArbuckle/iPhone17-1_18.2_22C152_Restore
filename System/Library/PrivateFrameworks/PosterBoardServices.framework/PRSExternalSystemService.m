@interface PRSExternalSystemService
- (id)service;
- (void)createLockScreenPhotosPosterWithImageAtURL:(id)a3 selectLockScreenPoster:(BOOL)a4 completion:(id)a5;
- (void)fetchEligibleConfigurationsWithCompletion:(id)a3;
- (void)updateHomeScreenImageForLockScreenPoster:(id)a3 withImageAtURL:(id)a4 selectLockPoster:(BOOL)a5 completion:(id)a6;
- (void)updateLockScreenPhotosPoster:(id)a3 withImageAtURL:(id)a4 selectLockScreenPoster:(BOOL)a5 completion:(id)a6;
- (void)updatePosterMatchingUUID:(id)a3 withConfiguration:(id)a4 completion:(id)a5;
@end

@implementation PRSExternalSystemService

- (id)service
{
  v2 = self;
  objc_sync_enter(v2);
  service = v2->_service;
  if (!service)
  {
    uint64_t v4 = objc_opt_new();
    v5 = v2->_service;
    v2->_service = (PRSService *)v4;

    service = v2->_service;
  }
  v6 = service;
  objc_sync_exit(v2);

  return v6;
}

- (void)fetchEligibleConfigurationsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = [(PRSExternalSystemService *)self service];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__PRSExternalSystemService_fetchEligibleConfigurationsWithCompletion___block_invoke;
    v9[3] = &unk_1E5D00AE0;
    id v10 = v5;
    id v7 = v5;
    [v6 fetchPosterConfigurations:v9];
  }
  else
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completionHandler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSExternalSystemService fetchEligibleConfigurationsWithCompletion:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __70__PRSExternalSystemService_fetchEligibleConfigurationsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v20 = a3;
  v21 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v10 = [v9 providerBundleIdentifier];
        if ([v10 isEqual:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"])
        {
          v11 = [v9 _path];
          v12 = [v11 contentsURL];

          uint64_t v28 = 0;
          v29 = &v28;
          uint64_t v30 = 0x2050000000;
          v13 = (void *)getPFPosterConfigurationClass_softClass;
          uint64_t v31 = getPFPosterConfigurationClass_softClass;
          if (!getPFPosterConfigurationClass_softClass)
          {
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __getPFPosterConfigurationClass_block_invoke;
            v27[3] = &unk_1E5D007B0;
            v27[4] = &v28;
            __getPFPosterConfigurationClass_block_invoke((uint64_t)v27);
            v13 = (void *)v29[3];
          }
          id v14 = v13;
          _Block_object_dispose(&v28, 8);
          id v22 = 0;
          v15 = [v14 loadFromURL:v12 error:&v22];
          id v16 = v22;
          v17 = v16;
          if (v15 && !v16 && ![v15 configurationType])
          {
            v18 = [v9 serverUUID];
            objc_msgSend(v21, "bs_safeAddObject:", v18);
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updatePosterMatchingUUID:(id)a3 withConfiguration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  NSClassFromString(&cfstr_Wfwallpapercon.isa);
  if (!v11)
  {
    id v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSExternalSystemService updatePosterMatchingUUID:withConfiguration:completion:]();
    }
LABEL_17:
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78E7AC0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:WFWallpaperConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSExternalSystemService updatePosterMatchingUUID:withConfiguration:completion:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78E7B24);
  }

  id v12 = v8;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v12)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSExternalSystemService updatePosterMatchingUUID:withConfiguration:completion:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78E7B88);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSExternalSystemService updatePosterMatchingUUID:withConfiguration:completion:]();
    }
    goto LABEL_17;
  }

  v13 = +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:v11];
  service = self->_service;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __82__PRSExternalSystemService_updatePosterMatchingUUID_withConfiguration_completion___block_invoke;
  v19[3] = &unk_1E5D015A8;
  id v20 = v10;
  id v15 = v10;
  [(PRSService *)service updatePosterConfigurationMatchingUUID:v12 updates:v13 completion:v19];
}

void __82__PRSExternalSystemService_updatePosterMatchingUUID_withConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  if (a4)
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "error", (void)v20);

          if (v17)
          {
            uint64_t v18 = *(void *)(a1 + 32);
            v19 = [v16 error];
            (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v19);

            goto LABEL_14;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v10();
LABEL_14:
}

- (void)createLockScreenPhotosPosterWithImageAtURL:(id)a3 selectLockScreenPoster:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PRSExternalSystemService.m", 85, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  if (([v9 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PRSExternalSystemService.m", 86, @"Invalid parameter not satisfying: %@", @"[imageURL checkResourceIsReachableAndReturnError:nil]" object file lineNumber description];
  }
  id v11 = [(PRSExternalSystemService *)self service];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke;
  v17[3] = &unk_1E5D01620;
  id v19 = v9;
  id v20 = v10;
  id v18 = v11;
  BOOL v21 = a4;
  id v12 = v9;
  id v13 = v11;
  id v14 = v10;
  [v13 createPosterConfigurationForProviderIdentifier:@"com.apple.PhotosUIPrivate.PhotosPosterProvider" posterDescriptorIdentifier:0 completion:v17];
}

void __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = +[PRSPosterUpdate posterUpdateLockScreenPosterWithImageAtURL:*(void *)(a1 + 40)];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke_2;
    v8[3] = &unk_1E5D015F8;
    id v9 = *(id *)(a1 + 32);
    id v10 = v5;
    id v11 = *(id *)(a1 + 48);
    char v12 = *(unsigned char *)(a1 + 56);
    [v6 updatePosterConfiguration:v10 update:v7 completion:v8];
  }
}

void __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [*(id *)(a1 + 40) serverUUID];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke_3;
    v17[3] = &unk_1E5D015D0;
    id v19 = *(id *)(a1 + 48);
    id v18 = v9;
    [v10 deletePosterConfigurationsMatchingUUID:v11 completion:v17];

    char v12 = v19;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 56))
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_6;
    }
    id v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke_4;
    v14[3] = &unk_1E5D015D0;
    id v16 = *(id *)(a1 + 48);
    id v15 = v7;
    [v13 updateToSelectedConfiguration:v15 completion:v14];

    char v12 = v16;
  }

LABEL_6:
}

uint64_t __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)updateLockScreenPhotosPoster:(id)a3 withImageAtURL:(id)a4 selectLockScreenPoster:(BOOL)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v13)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PRSExternalSystemService.m", 116, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PRSExternalSystemService.m", 117, @"Invalid parameter not satisfying: %@", @"poster" object file lineNumber description];

LABEL_3:
  if (([v12 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    BOOL v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PRSExternalSystemService.m", 118, @"Invalid parameter not satisfying: %@", @"[imageURL checkResourceIsReachableAndReturnError:nil]" object file lineNumber description];
  }
  id v14 = [(PRSExternalSystemService *)self service];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__PRSExternalSystemService_updateLockScreenPhotosPoster_withImageAtURL_selectLockScreenPoster_completion___block_invoke;
  v22[3] = &unk_1E5D01670;
  id v23 = v11;
  id v24 = v14;
  id v25 = v12;
  id v26 = v13;
  BOOL v27 = a5;
  id v15 = v12;
  id v16 = v14;
  id v17 = v11;
  id v18 = v13;
  [(PRSExternalSystemService *)self fetchEligibleConfigurationsWithCompletion:v22];
}

void __106__PRSExternalSystemService_updateLockScreenPhotosPoster_withImageAtURL_selectLockScreenPoster_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) serverUUID];
    char v7 = [v5 containsObject:v6];

    if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v8 = *(void **)(a1 + 40);
      id v10 = +[PRSPosterUpdate posterUpdateLockScreenPosterWithImageAtURL:*(void *)(a1 + 48)];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __106__PRSExternalSystemService_updateLockScreenPhotosPoster_withImageAtURL_selectLockScreenPoster_completion___block_invoke_2;
      v15[3] = &unk_1E5D01648;
      id v17 = *(id *)(a1 + 56);
      char v18 = *(unsigned char *)(a1 + 64);
      id v16 = *(id *)(a1 + 40);
      [v8 updatePosterConfiguration:v9 update:v10 completion:v15];
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 56);
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28588];
      v20[0] = @"Poster is not eligible";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      id v14 = [v12 errorWithDomain:@"com.apple.posterboardservices" code:0 userInfo:v13];
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v14);
    }
  }
}

void __106__PRSExternalSystemService_updateLockScreenPhotosPoster_withImageAtURL_selectLockScreenPoster_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (*(unsigned char *)(a1 + 48))
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __106__PRSExternalSystemService_updateLockScreenPhotosPoster_withImageAtURL_selectLockScreenPoster_completion___block_invoke_3;
      v12[3] = &unk_1E5D015D0;
      uint64_t v11 = *(void **)(a1 + 32);
      id v14 = *(id *)(a1 + 40);
      id v13 = v7;
      [v11 updateToSelectedConfiguration:v13 completion:v12];

      goto LABEL_6;
    }
    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v10();
LABEL_6:
}

uint64_t __106__PRSExternalSystemService_updateLockScreenPhotosPoster_withImageAtURL_selectLockScreenPoster_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)updateHomeScreenImageForLockScreenPoster:(id)a3 withImageAtURL:(id)a4 selectLockPoster:(BOOL)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v13)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    char v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PRSExternalSystemService.m", 150, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"PRSExternalSystemService.m", 151, @"Invalid parameter not satisfying: %@", @"poster" object file lineNumber description];

LABEL_3:
  if (([v12 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PRSExternalSystemService.m", 152, @"Invalid parameter not satisfying: %@", @"[imageURL checkResourceIsReachableAndReturnError:nil]" object file lineNumber description];
  }
  id v14 = [(PRSExternalSystemService *)self service];
  id v15 = +[PRSPosterUpdate posterUpdateHomeScreenPosterWithImageAtURL:v12];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __112__PRSExternalSystemService_updateHomeScreenImageForLockScreenPoster_withImageAtURL_selectLockPoster_completion___block_invoke;
  v21[3] = &unk_1E5D01648;
  BOOL v24 = a5;
  id v22 = v14;
  id v23 = v13;
  id v16 = v14;
  id v17 = v13;
  [v16 updatePosterConfiguration:v11 update:v15 completion:v21];
}

void __112__PRSExternalSystemService_updateHomeScreenImageForLockScreenPoster_withImageAtURL_selectLockPoster_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (*(unsigned char *)(a1 + 48))
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __112__PRSExternalSystemService_updateHomeScreenImageForLockScreenPoster_withImageAtURL_selectLockPoster_completion___block_invoke_2;
      v12[3] = &unk_1E5D015D0;
      id v11 = *(void **)(a1 + 32);
      id v14 = *(id *)(a1 + 40);
      id v13 = v7;
      [v11 updateToSelectedConfiguration:v13 completion:v12];

      goto LABEL_6;
    }
    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v10();
LABEL_6:
}

uint64_t __112__PRSExternalSystemService_updateHomeScreenImageForLockScreenPoster_withImageAtURL_selectLockPoster_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void).cxx_destruct
{
}

- (void)fetchEligibleConfigurationsWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatePosterMatchingUUID:withConfiguration:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatePosterMatchingUUID:withConfiguration:completion:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end