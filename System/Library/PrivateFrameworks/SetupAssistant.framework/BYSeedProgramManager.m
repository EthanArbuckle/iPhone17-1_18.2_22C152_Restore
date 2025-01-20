@interface BYSeedProgramManager
- (NSDictionary)currentEnrollmentMetadata;
- (int64_t)currentSeedProgram;
- (void)currentSeedProgram;
- (void)enrollInSeedProgramNamed:(id)a3 withAssetAudience:(id)a4 programID:(id)a5 completion:(id)a6;
@end

@implementation BYSeedProgramManager

- (int64_t)currentSeedProgram
{
  if (objc_opt_class())
  {
    v2 = [MEMORY[0x1E4F9A5F0] sharedManager];
    v3 = [v2 enrolledBetaProgramForCurrentDevice];

    if (v3) {
      int64_t v4 = [v3 program];
    }
    else {
      int64_t v4 = 0;
    }
  }
  else
  {
    v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BYSeedProgramManager currentSeedProgram]();
    }

    return 0;
  }
  return v4;
}

- (NSDictionary)currentEnrollmentMetadata
{
  if (objc_opt_class())
  {
    v2 = [MEMORY[0x1E4F9A5F0] sharedManager];
    v3 = [v2 enrollmentMetadataForCurrentDevice];
  }
  else
  {
    int64_t v4 = _BYLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[BYSeedProgramManager currentSeedProgram]();
    }

    v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  return (NSDictionary *)v3;
}

- (void)enrollInSeedProgramNamed:(id)a3 withAssetAudience:(id)a4 programID:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (objc_opt_class())
  {
    v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    [v13 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F9A600]];
    [v13 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F9A5F8]];
    if (v11) {
      [v13 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F9A608]];
    }
    v14 = [MEMORY[0x1E4F9A5F0] sharedManager];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__BYSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_programID_completion___block_invoke;
    v16[3] = &unk_1E5D2BE90;
    id v17 = v12;
    [v14 enrollCurrentDeviceWithEnrollmentMetadata:v13 completion:v16];
  }
  else
  {
    v15 = _BYLoggingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[BYSeedProgramManager currentSeedProgram]();
    }

    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
}

void __88__BYSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_programID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v6 = 0;
      v7 = v4;
    }
    else if (v4)
    {
      v8 = NSString;
      v2 = [v4 domain];
      v7 = [v8 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v4, "code")];
      int v6 = 1;
    }
    else
    {
      int v6 = 0;
      v7 = 0;
    }
    *(_DWORD *)buf = 138543362;
    id v10 = v7;
    _os_log_error_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_ERROR, "Failed to enroll in seed program: %{public}@", buf, 0xCu);
    if (v6)
    {
    }
  }

  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v4 == 0);
}

- (void)currentSeedProgram
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A7DED000, v0, v1, "Seeding.framework not available!", v2, v3, v4, v5, v6);
}

@end