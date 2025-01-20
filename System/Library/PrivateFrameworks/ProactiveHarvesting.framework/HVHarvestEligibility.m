@interface HVHarvestEligibility
+ (BOOL)searchableItemIsEligibleForDeferredHarvesting:(id)a3;
+ (BOOL)searchableItemIsEligibleForDissectorPipeline:(id)a3 targetPluginsCustomAttributeName:(id)a4;
+ (BOOL)searchableItemIsEligibleForHarvesting:(id)a3 eligibleExceptForAge:(BOOL *)a4;
+ (BOOL)searchableItemIsEligibleForHarvestingWithGetterBlock:(id)a3 bundleIdentifier:(id)a4 eligibleExceptForAge:(BOOL *)a5;
+ (BOOL)searchableItemIsStoredEncryptedWithGetterBlock:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation HVHarvestEligibility

+ (BOOL)searchableItemIsEligibleForHarvestingWithGetterBlock:(id)a3 bundleIdentifier:(id)a4 eligibleExceptForAge:(BOOL *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (a5) {
    *a5 = 0;
  }
  if (([a1 searchableItemIsStoredEncryptedWithGetterBlock:v9 bundleIdentifier:v10] & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __115__HVHarvestEligibility_searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___pasOnceToken5 != -1) {
      dispatch_once(&searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___pasOnceToken5, block);
    }
    id v12 = (id)searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___pasExprOnceResult;
    if (v10 && [v10 length])
    {
      uint64_t v13 = [v12 objectForKeyedSubscript:v10];
      if (!v13)
      {
        v14 = [v12 objectForKeyedSubscript:@"_thirdpartyonly_"];
        v15 = ((void (**)(void, id, id))v14)[2](v14, v9, v10);

        v16 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v13 = [v12 objectForKeyedSubscript:@"_thirdpartyonly_"];
    }
    v16 = (void *)v13;
    v15 = (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v9, v10);
LABEL_13:

    if (v15)
    {
      if (!a5)
      {
LABEL_16:
        char v11 = [v15 isEligible];

        goto LABEL_17;
      }
    }
    else
    {
      v18 = [MEMORY[0x263F08690] currentHandler];
      [v18 handleFailureInMethod:a2 object:a1 file:@"HVHarvestEligibility.m" lineNumber:136 description:@"result unexpectedly nil"];

      if (!a5) {
        goto LABEL_16;
      }
    }
    *a5 = [v15 isEligibleExceptForAge];
    goto LABEL_16;
  }
  char v11 = 0;
LABEL_17:

  return v11;
}

+ (BOOL)searchableItemIsStoredEncryptedWithGetterBlock:(id)a3 bundleIdentifier:(id)a4
{
  return 0;
}

id __56__HVHarvestEligibility_mailAppItemEligibilityCheckBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = (*(void (**)(uint64_t))(a2 + 16))(a2);
  v4 = objc_opt_new();
  v5 = [v3 attributeSet];
  v6 = [v5 contentType];

  if (v6)
  {
    v7 = [MEMORY[0x263F1D920] typeWithIdentifier:v6];
    if (v7 && ([(id)*MEMORY[0x263F1DA90] conformsToType:v7] & 1) != 0)
    {
      v8 = [v3 attributeSet];
      id v9 = [v8 emailHeaders];

      id v10 = [v3 attributeSet];
      char v11 = [v10 mailboxIdentifiers];

      if (!+[HVSearchableItemHelper mailItemIsValid:emailHeaders:mailboxIdentifiers:](HVSearchableItemHelper, "mailItemIsValid:emailHeaders:mailboxIdentifiers:", v3, v9, v11)|| !+[HVSearchableItemHelper mailItemIsFromSupportedAccount:v3])
      {
        uint64_t v13 = hv_default_log_handle();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
LABEL_16:

          goto LABEL_17;
        }
        v14 = [v3 uniqueIdentifier];
        *(_DWORD *)buf = 138412290;
        v24 = v14;
        v15 = "HVHarvestEligibility: skipping invalid searchable item: %@";
LABEL_15:
        _os_log_impl(&dword_226C41000, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);

        goto LABEL_16;
      }
      if (!v9)
      {
        v22 = [MEMORY[0x263F08690] currentHandler];
        [v22 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"HVHarvestEligibility.m", 168, @"Invalid parameter not satisfying: %@", @"emailHeaders" object file lineNumber description];
      }
      BOOL v12 = +[HVContentAdmission suggestionsShouldShowPastEvents](HVContentAdmission, "suggestionsShouldShowPastEvents")|| +[HVSearchableItemHelper mailItemIsRecent:v3 emailHeaders:v9];
      if (+[HVSearchableItemHelper mailItemIsSPAM:emailHeaders:mailboxIdentifiers:](HVSearchableItemHelper, "mailItemIsSPAM:emailHeaders:mailboxIdentifiers:", v3, v9, v11)|| +[HVSearchableItemHelper mailItemIsInDrafts:mailboxIdentifiers:](HVSearchableItemHelper, "mailItemIsInDrafts:mailboxIdentifiers:", v3, v11)|| +[HVSearchableItemHelper mailItemIsInTrash:v3 mailboxIdentifiers:v11])
      {
        BOOL v17 = 1;
        if (v12)
        {
LABEL_26:
          if (!v17)
          {
            [v4 setIsEligible:1];
            goto LABEL_17;
          }
          uint64_t v13 = hv_default_log_handle();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          v14 = [v3 uniqueIdentifier];
          *(_DWORD *)buf = 138412290;
          v24 = v14;
          v15 = "HVHarvestEligibility: skipping ignorable searchable item: %@";
          goto LABEL_15;
        }
      }
      else
      {
        BOOL v17 = +[HVSearchableItemHelper mailItemIsTooBig:v3];
        if (v12) {
          goto LABEL_26;
        }
      }
      v18 = hv_default_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v3 uniqueIdentifier];
        *(_DWORD *)buf = 138412290;
        v24 = v19;
        _os_log_impl(&dword_226C41000, v18, OS_LOG_TYPE_DEFAULT, "HVHarvestEligibility: skipping ignorable searchable item: %@", buf, 0xCu);
      }
      if (!v17)
      {
        v20 = hv_default_log_handle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = [v3 uniqueIdentifier];
          *(_DWORD *)buf = 138412290;
          v24 = v21;
          _os_log_impl(&dword_226C41000, v20, OS_LOG_TYPE_DEFAULT, "HVHarvestEligibility: item is not recent but otherwise eligible: %@", buf, 0xCu);
        }
        [v4 setIsEligibleExceptForAge:1];
      }
      goto LABEL_17;
    }
  }
  else
  {
    v7 = 0;
  }
  id v9 = hv_default_log_handle();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    goto LABEL_18;
  }
  char v11 = [v3 uniqueIdentifier];
  *(_DWORD *)buf = 138412546;
  v24 = v11;
  __int16 v25 = 2112;
  v26 = v7;
  _os_log_impl(&dword_226C41000, v9, OS_LOG_TYPE_INFO, "HVHarvestEligibility: skipping mail app item %@ with non-email type %@", buf, 0x16u);
LABEL_17:

LABEL_18:

  return v4;
}

void __115__HVHarvestEligibility_searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___block_invoke()
{
  v7[8] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x22A6667F0]();
  v6[0] = @"com.apple.mobilemail";
  uint64_t v1 = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__HVHarvestEligibility_mailAppItemEligibilityCheckBlock__block_invoke;
  v5[3] = &__block_descriptor_48_e71___HVEligibilityCheckResult_24__0_____CSSearchableItem____8__NSString_16l;
  v5[4] = sel_mailAppItemEligibilityCheckBlock;
  v5[5] = v1;
  v2 = (void *)MEMORY[0x22A6669E0](v5);
  v7[0] = v2;
  v6[1] = @"com.apple.MobileSMS";
  self;
  v7[1] = &__block_literal_global_41;
  v6[2] = @"com.apple.news";
  self;
  v7[2] = &__block_literal_global_43;
  v6[3] = @"com.apple.mobilesafari";
  self;
  v7[3] = &__block_literal_global_43;
  v6[4] = @"com.apple.mobilenotes";
  self;
  v7[4] = &__block_literal_global_43;
  v6[5] = @"com.apple.reminders";
  self;
  v7[5] = &__block_literal_global_43;
  v6[6] = @"com.apple.usernotificationsd";
  self;
  v7[6] = &__block_literal_global_43;
  v6[7] = @"_thirdpartyonly_";
  self;
  v7[7] = &__block_literal_global_50;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:8];
  v4 = (void *)searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___pasExprOnceResult;
  searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___pasExprOnceResult = v3;
}

id __51__HVHarvestEligibility_thirdPartyOnlyEligibleBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = a2;
  id v5 = a3;
  if ([v5 hasPrefix:@"com.apple."])
  {
    v6 = hv_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_226C41000, v6, OS_LOG_TYPE_DEFAULT, "HVHarvestEligibility: items from unsupported first-party bundle %@ are not eligible", (uint8_t *)&v12, 0xCu);
    }

    v7 = objc_opt_new();
    [v7 setIsEligible:0];
    [v7 setIsEligibleExceptForAge:0];
  }
  else
  {
    v8 = v4[2](v4);
    id v9 = hv_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 uniqueIdentifier];
      int v12 = 138412546;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_226C41000, v9, OS_LOG_TYPE_DEFAULT, "HVHarvestEligibility: item %@ from bundle %@ is eligible", (uint8_t *)&v12, 0x16u);
    }
    v7 = objc_opt_new();
    [v7 setIsEligible:1];
    [v7 setIsEligibleExceptForAge:0];
  }

  return v7;
}

id __60__HVHarvestEligibility_supportedFirstPartyItemEligibleBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = a2;
  id v5 = a3;
  if (([v5 hasPrefix:@"com.apple."] & 1) == 0) {
    __assert_rtn("+[HVHarvestEligibility supportedFirstPartyItemEligibleBlock]_block_invoke", "HVHarvestEligibility.m", 226, "[bundleIdentifier hasPrefix:@\"com.apple.\"]");
  }
  v6 = v4[2](v4);
  v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 uniqueIdentifier];
    id v9 = [v6 bundleID];
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVHarvestEligibility: first-party item %@ from bundle %@ is eligible", (uint8_t *)&v12, 0x16u);
  }
  id v10 = objc_opt_new();
  [v10 setIsEligible:1];
  [v10 setIsEligibleExceptForAge:0];

  return v10;
}

id __60__HVHarvestEligibility_messagesAppItemEligibilityCheckBlock__block_invoke()
{
  v0 = objc_opt_new();
  uint64_t v1 = hv_default_log_handle();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_226C41000, v1, OS_LOG_TYPE_INFO, "HVHarvestEligibility: skipping Messages item from Spotlight since Messages donations use a custom donation SPI.", v3, 2u);
  }

  [v0 setIsEligible:0];
  [v0 setIsEligibleExceptForAge:0];

  return v0;
}

+ (BOOL)searchableItemIsEligibleForHarvesting:(id)a3 eligibleExceptForAge:(BOOL *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__HVHarvestEligibility_searchableItemIsEligibleForHarvesting_eligibleExceptForAge___block_invoke;
  v10[3] = &unk_2647D5AD0;
  id v11 = v6;
  id v7 = v6;
  v8 = [v7 bundleID];
  LOBYTE(a4) = [a1 searchableItemIsEligibleForHarvestingWithGetterBlock:v10 bundleIdentifier:v8 eligibleExceptForAge:a4];

  return (char)a4;
}

id __83__HVHarvestEligibility_searchableItemIsEligibleForHarvesting_eligibleExceptForAge___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (BOOL)searchableItemIsEligibleForDissectorPipeline:(id)a3 targetPluginsCustomAttributeName:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 bundleID];
  char v10 = [v9 isEqualToString:@"com.apple.mobilemail"];

  if ((v10 & 1) == 0)
  {
    int v12 = [v7 bundleID];
    int v13 = [v12 isEqualToString:@"com.apple.MobileSMS"];

    if (!v13)
    {
      BOOL v11 = 0;
      goto LABEL_12;
    }
    __int16 v14 = (void *)[objc_alloc(MEMORY[0x263F02A38]) initWithKeyName:v8];
    if (!v14)
    {
      v22 = [MEMORY[0x263F08690] currentHandler];
      [v22 handleFailureInMethod:a2, a1, @"HVHarvestEligibility.m", 67, @"initWithKeyName failed for expected valid key: %@", v8 object file lineNumber description];
    }
    id v15 = [v7 attributeSet];
    uint64_t v16 = [v15 valueForCustomKey:v14];

    if (![v16 count])
    {
      BOOL v17 = [v7 domainIdentifier];

      if (v17)
      {
        BOOL v11 = 1;
        goto LABEL_11;
      }
      v19 = hv_default_log_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v20 = [v7 bundleID];
        v21 = [v7 uniqueIdentifier];
        *(_DWORD *)buf = 138412546;
        v24 = v20;
        __int16 v25 = 2112;
        v26 = v21;
        _os_log_fault_impl(&dword_226C41000, v19, OS_LOG_TYPE_FAULT, "Got a Message with a nil domainIdentifier (bundleID=%@, uniqueIdentifier=%@)", buf, 0x16u);
      }
    }
    BOOL v11 = 0;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

+ (BOOL)searchableItemIsEligibleForDeferredHarvesting:(id)a3
{
  id v3 = a3;
  if (searchableItemIsEligibleForDeferredHarvesting__onceToken != -1) {
    dispatch_once(&searchableItemIsEligibleForDeferredHarvesting__onceToken, &__block_literal_global_1688);
  }
  v4 = [v3 bundleID];

  if (v4)
  {
    v4 = (void *)searchableItemIsEligibleForDeferredHarvesting__bundleIds;
    id v5 = [v3 bundleID];
    LOBYTE(v4) = [v4 containsObject:v5];
  }
  return (char)v4;
}

void __70__HVHarvestEligibility_searchableItemIsEligibleForDeferredHarvesting___block_invoke()
{
  v0 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"com.apple.news", @"com.apple.mobilesafari", @"com.apple.mobilenotes", @"com.apple.reminders", 0);
  v2 = (void *)searchableItemIsEligibleForDeferredHarvesting__bundleIds;
  searchableItemIsEligibleForDeferredHarvesting__bundleIds = v1;
}

@end