@interface TUPrivacyManager
+ (TUPrivacyManager)sharedPrivacyManager;
- (BOOL)isIncomingCommunicationBlockedForBusinessID:(id)a3;
- (BOOL)isIncomingCommunicationBlockedForEmailAddress:(id)a3;
- (BOOL)isIncomingCommunicationBlockedForHandle:(id)a3;
- (BOOL)isIncomingCommunicationBlockedForPhoneNumber:(id)a3;
- (NSArray)privacyRules;
- (TUPrivacyManager)init;
- (void)_handleBlockListChanged:(id)a3;
- (void)addRule:(id)a3;
- (void)dealloc;
- (void)removeRule:(id)a3;
- (void)setBlockIncomingCommunication:(BOOL)a3 forBusinessID:(id)a4;
- (void)setBlockIncomingCommunication:(BOOL)a3 forEmailAddress:(id)a4;
- (void)setBlockIncomingCommunication:(BOOL)a3 forPhoneNumber:(id)a4;
@end

@implementation TUPrivacyManager

+ (TUPrivacyManager)sharedPrivacyManager
{
  if (sharedPrivacyManager_onceToken != -1) {
    dispatch_once(&sharedPrivacyManager_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)sharedPrivacyManager_privacyManager;

  return (TUPrivacyManager *)v2;
}

uint64_t __40__TUPrivacyManager_sharedPrivacyManager__block_invoke()
{
  sharedPrivacyManager_privacyManager = objc_alloc_init(TUPrivacyManager);

  return MEMORY[0x1F41817F8]();
}

- (TUPrivacyManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)TUPrivacyManager;
  v2 = [(TUPrivacyManager *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleBlockListChanged_ name:*MEMORY[0x1E4F59E40] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TUPrivacyManager;
  [(TUPrivacyManager *)&v4 dealloc];
}

- (void)_handleBlockListChanged:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__TUPrivacyManager__handleBlockListChanged___block_invoke;
  v3[3] = &unk_1E58E5BE0;
  v3[4] = self;
  TUGuaranteeExecutionOnMainThreadAsync(v3);
}

void __44__TUPrivacyManager__handleBlockListChanged___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"com.apple.TelephonyUtilities.TUPrivacyManager.RulesChanged" object:*(void *)(a1 + 32) userInfo:0];
}

- (void)setBlockIncomingCommunication:(BOOL)a3 forPhoneNumber:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [a4 phoneNumberRef];
  uint64_t v5 = CMFItemCreateWithPhoneNumber();
  if (v5)
  {
    v6 = (const void *)v5;
    v7 = TUDefaultLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v8)
      {
        int v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "CMFBlockListAddItemForAllServices(%@)", (uint8_t *)&v9, 0xCu);
      }

      CMFBlockListAddItemForAllServices();
    }
    else
    {
      if (v8)
      {
        int v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "CMFBlockListRemoveItemForAllServices(%@)", (uint8_t *)&v9, 0xCu);
      }

      CMFBlockListRemoveItemFromAllServices();
    }
    CFRelease(v6);
  }
}

- (void)setBlockIncomingCommunication:(BOOL)a3 forEmailAddress:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CMFItemCreateWithEmailAddress();
  if (v5)
  {
    v6 = (const void *)v5;
    v7 = TUDefaultLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v8)
      {
        int v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "CMFBlockListAddItemForAllServices(%@)", (uint8_t *)&v9, 0xCu);
      }

      CMFBlockListAddItemForAllServices();
    }
    else
    {
      if (v8)
      {
        int v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "CMFBlockListRemoveItemForAllServices(%@)", (uint8_t *)&v9, 0xCu);
      }

      CMFBlockListRemoveItemFromAllServices();
    }
    CFRelease(v6);
  }
}

- (void)setBlockIncomingCommunication:(BOOL)a3 forBusinessID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CMFItemCreateWithBusinessID();
  if (v5)
  {
    v6 = (const void *)v5;
    v7 = TUDefaultLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v8)
      {
        int v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "CMFBlockListAddItemForAllServices(%@)", (uint8_t *)&v9, 0xCu);
      }

      CMFBlockListAddItemForAllServices();
    }
    else
    {
      if (v8)
      {
        int v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "CMFBlockListRemoveItemForAllServices(%@)", (uint8_t *)&v9, 0xCu);
      }

      CMFBlockListRemoveItemFromAllServices();
    }
    CFRelease(v6);
  }
}

- (void)addRule:(id)a3
{
  id v6 = a3;
  int v4 = [v6 type];
  if (v4 == 2)
  {
    uint64_t v5 = [v6 businessID];
    [(TUPrivacyManager *)self setBlockIncomingCommunication:1 forBusinessID:v5];
  }
  else if (v4 == 1)
  {
    uint64_t v5 = [v6 email];
    [(TUPrivacyManager *)self setBlockIncomingCommunication:1 forEmailAddress:v5];
  }
  else
  {
    if (v4) {
      goto LABEL_8;
    }
    uint64_t v5 = [v6 phoneNumber];
    [(TUPrivacyManager *)self setBlockIncomingCommunication:1 forPhoneNumber:v5];
  }

LABEL_8:
}

- (void)removeRule:(id)a3
{
  id v6 = a3;
  int v4 = [v6 type];
  if (v4 == 2)
  {
    uint64_t v5 = [v6 businessID];
    [(TUPrivacyManager *)self setBlockIncomingCommunication:0 forBusinessID:v5];
  }
  else if (v4 == 1)
  {
    uint64_t v5 = [v6 email];
    [(TUPrivacyManager *)self setBlockIncomingCommunication:0 forEmailAddress:v5];
  }
  else
  {
    if (v4) {
      goto LABEL_8;
    }
    uint64_t v5 = [v6 phoneNumber];
    [(TUPrivacyManager *)self setBlockIncomingCommunication:0 forPhoneNumber:v5];
  }

LABEL_8:
}

- (BOOL)isIncomingCommunicationBlockedForPhoneNumber:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (v3 && ([v3 phoneNumberRef], (uint64_t v5 = CMFItemCreateWithPhoneNumber()) != 0))
  {
    id v6 = (const void *)v5;
    BOOL v7 = CMFBlockListIsItemBlocked() != 0;
    CFRelease(v6);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isIncomingCommunicationBlockedForEmailAddress:(id)a3
{
  id v3 = a3;
  if (v3 && (uint64_t v4 = CMFItemCreateWithEmailAddress()) != 0)
  {
    uint64_t v5 = (const void *)v4;
    BOOL v6 = CMFBlockListIsItemBlocked() != 0;
    CFRelease(v5);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isIncomingCommunicationBlockedForBusinessID:(id)a3
{
  id v3 = a3;
  if (v3 && (uint64_t v4 = CMFItemCreateWithBusinessID()) != 0)
  {
    uint64_t v5 = (const void *)v4;
    BOOL v6 = CMFBlockListIsItemBlocked() != 0;
    CFRelease(v5);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isIncomingCommunicationBlockedForHandle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3
    && ([v3 value],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 _stripFZIDPrefix],
        CMFItemFromString = (const void *)CreateCMFItemFromString(),
        v5,
        CMFItemFromString))
  {
    BOOL v7 = CMFBlockListIsItemBlocked() != 0;
    CFRelease(CMFItemFromString);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSArray)privacyRules
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__12;
  v13 = __Block_byref_object_dispose__12;
  id v14 = [MEMORY[0x1E4F1CA48] array];
  v8[7] = 0;
  CMFBlockListCopyItemsForAllServicesService();
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithArray:0];
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "CMFBlockListCopyItemsForAllServicesService = %@", buf, 0xCu);
  }

  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__TUPrivacyManager_privacyRules__block_invoke;
    v8[3] = &unk_1E58E7DA8;
    v8[4] = self;
    v8[5] = &v9;
    v8[6] = a2;
    [v4 enumerateObjectsUsingBlock:v8];
  }
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithArray:v10[5]];

  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

void __32__TUPrivacyManager_privacyRules__block_invoke(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int Type = CMFItemGetType();
  switch(Type)
  {
    case 2:
      CMFItemCopyBusinessID();
      id v7 = 0;
      BOOL v8 = v7;
      if (v7) {
        CFRelease(v7);
      }
      uint64_t v9 = TUDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v3;
        __int16 v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "CMFItemCopyBusinessID(%@) = %@", buf, 0x16u);
      }

      if (v8)
      {
        v10 = *(void **)(*(void *)(a1[5] + 8) + 40);
        uint64_t v11 = +[TUPrivacyRule ruleForBusinessID:v8];
LABEL_20:
        id v14 = (void *)v11;
        [v10 addObject:v11];
LABEL_26:

        goto LABEL_27;
      }
      v15 = [NSString stringWithFormat:@"CMFItemCopyBusinessID for item with type CMFItemTypeBusiness returned nothing!"];
      NSLog(&cfstr_TuassertionFai.isa, v15);

      if (_TUAssertShouldCrashApplication())
      {
        v16 = [MEMORY[0x1E4F28B00] currentHandler];
        id v14 = v16;
        uint64_t v17 = a1[6];
        uint64_t v18 = a1[4];
        v19 = @"CMFItemCopyBusinessID for item with type CMFItemTypeBusiness returned nothing!";
        uint64_t v20 = 228;
LABEL_25:
        [v16 handleFailureInMethod:v17 object:v18 file:@"TUPrivacyManager.m" lineNumber:v20 description:v19];
        goto LABEL_26;
      }
LABEL_27:

      break;
    case 1:
      CMFItemCopyEmailAddress();
      id v12 = 0;
      BOOL v8 = v12;
      if (v12) {
        CFRelease(v12);
      }
      v13 = TUDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v3;
        __int16 v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_19C496000, v13, OS_LOG_TYPE_DEFAULT, "CMFItemCopyEmailAddress(%@) = %@", buf, 0x16u);
      }

      if (v8)
      {
        v10 = *(void **)(*(void *)(a1[5] + 8) + 40);
        uint64_t v11 = +[TUPrivacyRule ruleForEmail:v8];
        goto LABEL_20;
      }
      v21 = [NSString stringWithFormat:@"CMFItemCopyEmailAddress for item with type CMFItemTypeEmail returned nothing!"];
      NSLog(&cfstr_TuassertionFai.isa, v21);

      if (_TUAssertShouldCrashApplication())
      {
        v16 = [MEMORY[0x1E4F28B00] currentHandler];
        id v14 = v16;
        uint64_t v17 = a1[6];
        uint64_t v18 = a1[4];
        v19 = @"CMFItemCopyEmailAddress for item with type CMFItemTypeEmail returned nothing!";
        uint64_t v20 = 214;
        goto LABEL_25;
      }
      goto LABEL_27;
    case 0:
      CMFItemCopyPhoneNumber();
      uint64_t v5 = TUDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v3;
        __int16 v25 = 2112;
        v26 = 0;
        _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "CMFItemCopyPhoneNumber(%@) = %@", buf, 0x16u);
      }

      BOOL v6 = [NSString stringWithFormat:@"CMFItemCopyPhoneNumber for item with type CMFItemTypePhone returned nothing!"];
      NSLog(&cfstr_TuassertionFai.isa, v6);

      if (_TUAssertShouldCrashApplication())
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a1[6] object:a1[4] file:@"TUPrivacyManager.m" lineNumber:198 description:@"CMFItemCopyPhoneNumber for item with type CMFItemTypePhone returned nothing!"];
      }
      break;
  }
}

@end