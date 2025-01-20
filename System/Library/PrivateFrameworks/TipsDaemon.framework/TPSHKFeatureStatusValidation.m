@interface TPSHKFeatureStatusValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSHKFeatureStatusValidation

- (void)validateWithCompletion:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, id))a3;
  v5 = [(TPSTargetingValidation *)self value];
  uint64_t v6 = [v5 TPSSafeIntegerForKey:@"featureIdentifier"];

  v7 = [(TPSTargetingValidation *)self value];
  uint64_t v8 = [v7 TPSSafeIntegerForKey:@"statusType"];

  v9 = +[TPSHealthKitDefines identifierForFeature:v6];
  v30 = +[TPSHealthKitDefines featureAvailabilityContextForStatusType:v8];
  if (v9 && v30)
  {
    v10 = +[TPSHealthKitDefines sharedHealthStore];
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2050000000;
    v11 = (void *)getHKFeatureStatusManagerClass_softClass;
    uint64_t v35 = getHKFeatureStatusManagerClass_softClass;
    if (!getHKFeatureStatusManagerClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getHKFeatureStatusManagerClass_block_invoke;
      *(void *)&long long v37 = &unk_1E6E6AE20;
      *((void *)&v37 + 1) = &v32;
      __getHKFeatureStatusManagerClass_block_invoke((uint64_t)buf);
      v11 = (void *)v33[3];
    }
    v12 = v11;
    _Block_object_dispose(&v32, 8);
    v13 = (void *)[[v12 alloc] initWithFeatureIdentifier:v9 healthStore:v10 countryCodeSource:1];
    id v31 = 0;
    v14 = [v13 featureStatusWithError:&v31];
    id v15 = v31;
    if (v14)
    {
      v16 = [v14 objectForKeyedSubscript:v30];
      int v17 = [v16 areAllRequirementsSatisfied];

      v18 = [(TPSTargetingValidation *)self value];
      int v19 = [v18 TPSSafeBoolForKey:@"value"];

      uint64_t v20 = v17 ^ v19 ^ 1u;
    }
    else
    {
      v21 = [MEMORY[0x1E4FAF480] targeting];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v28 = [(TPSTargetingValidation *)self name];
        v29 = [NSNumber numberWithInteger:v6];
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&long long v37 = v15;
        _os_log_error_impl(&dword_1E4492000, v21, OS_LOG_TYPE_ERROR, "%@ - unable to query feature status (%@). Error: %@", buf, 0x20u);
      }
      uint64_t v20 = 0;
    }
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E4FAF480], "targeting", v30);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v25 = [(TPSTargetingValidation *)self name];
      v26 = [NSNumber numberWithInteger:v6];
      v27 = [NSNumber numberWithInteger:v8];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&long long v37 = v27;
      _os_log_error_impl(&dword_1E4492000, v10, OS_LOG_TYPE_ERROR, "%@ - unrecognized feature (%@) or statusType (%@)", buf, 0x20u);
    }
    id v15 = 0;
    uint64_t v20 = 0;
  }

  v22 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = [(TPSTargetingValidation *)self name];
    v24 = [(TPSTargetingValidation *)self targetContext];
    *(_DWORD *)buf = 138413058;
    *(void *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v24;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v37) = v20;
    WORD2(v37) = 2112;
    *(void *)((char *)&v37 + 6) = v15;
    _os_log_debug_impl(&dword_1E4492000, v22, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d. Error: %@", buf, 0x26u);
  }
  v4[2](v4, v20, v15);
}

@end