@interface PKWalletVisibility
+ (BOOL)isWalletRestricted;
+ (BOOL)isWalletVisible;
+ (id)setOfActiveRestrictionUUIDs;
+ (void)updateWalletVisibility;
@end

@implementation PKWalletVisibility

+ (BOOL)isWalletVisible
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if (PKCurrentPassbookState() == 1)
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__PKWalletVisibility_isWalletVisible__block_invoke;
    v6[3] = &unk_1E56EF1A8;
    dispatch_semaphore_t v7 = v2;
    v8 = &v9;
    v3 = v2;
    _GetPrimaryAppleAccountAttributes(1, v6);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }
  char v4 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v4;
}

intptr_t __37__PKWalletVisibility_isWalletVisible__block_invoke(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 ^ 1 | a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isWalletRestricted
{
  dispatch_semaphore_t v2 = [MEMORY[0x1E4F74240] sharedManager];
  v3 = [v2 unionValuesForFeature:*MEMORY[0x1E4F73F70]];

  LOBYTE(v2) = [v3 containsObject:@"com.apple.Passbook"];
  return (char)v2;
}

+ (void)updateWalletVisibility
{
  if (PKPassbookIsSupported())
  {
    dispatch_semaphore_t v2 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Updating Wallet visibility restriction...", v3, 2u);
    }

    _GetPrimaryAppleAccountAttributes(0, &__block_literal_global_168);
  }
}

void __44__PKWalletVisibility_updateWalletVisibility__block_invoke(uint64_t a1, int a2, char a3)
{
  v3 = 0;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2 && (a3 & 1) == 0)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v4 = *MEMORY[0x1E4F73F70];
    *(void *)buf = @"com.apple.Passbook";
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    [v3 MCSetUnionRestriction:v4 values:v5];
  }
  v6 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_semaphore_t v7 = @"Restricted";
    if (!v3) {
      dispatch_semaphore_t v7 = @"Unrestricted";
    }
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v7;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Wallet visibility: %{public}@", buf, 0xCu);
  }

  if (qword_1EB403300 != -1) {
    dispatch_once(&qword_1EB403300, &__block_literal_global_38_0);
  }
  v8 = qword_1EB403308;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PKWalletVisibility_updateWalletVisibility__block_invoke_2;
  block[3] = &unk_1E56D8AE0;
  id v11 = v3;
  id v9 = v3;
  dispatch_async(v8, block);
}

void __44__PKWalletVisibility_updateWalletVisibility__block_invoke_35()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.passkitcore.wallet.visibility.restriction", 0);
  v1 = (void *)qword_1EB403308;
  qword_1EB403308 = (uint64_t)v0;
}

void __44__PKWalletVisibility_updateWalletVisibility__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = [MEMORY[0x1E4F74230] sharedConnection];
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = 0;
  [v2 applyRestrictionDictionary:v3 clientType:@"com.apple.Passbook" clientUUID:@"com.apple.Passbook" localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v6];
  id v4 = v6;

  if (v4)
  {
    v5 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Wallet visibility: failed to apply restrictions with error %@", buf, 0xCu);
    }
  }
}

+ (id)setOfActiveRestrictionUUIDs
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__58;
  v18 = __Block_byref_object_dispose__58;
  id v19 = [MEMORY[0x1E4F1CA80] set];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  if (PKPassbookIsSupported())
  {
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __49__PKWalletVisibility_setOfActiveRestrictionUUIDs__block_invoke;
    id v11 = &unk_1E56EF1A8;
    uint64_t v13 = &v14;
    uint64_t v3 = v2;
    char v12 = v3;
    _GetPrimaryAppleAccountAttributes(1, &v8);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }
  objc_msgSend((id)v15[5], "addObject:", @"com.apple.passbook.upgradedpasscoderestriction", v8, v9, v10, v11);
  [(id)v15[5] addObject:@"com.apple.passbook.allowwhenlocked"];
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v15[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Wallet visibility: returning active restrictions: %@", buf, 0xCu);
  }

  id v6 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v6;
}

intptr_t __49__PKWalletVisibility_setOfActiveRestrictionUUIDs__block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2 && (a3 & 1) == 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:@"com.apple.Passbook"];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:@"com.apple.Passbook"];
  }
  id v4 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v4);
}

@end