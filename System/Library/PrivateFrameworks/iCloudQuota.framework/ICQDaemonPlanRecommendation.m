@interface ICQDaemonPlanRecommendation
+ (BOOL)isBackupEnabledForAccount:(id)a3;
+ (BOOL)isICPLEnabledForAccount:(id)a3;
+ (BOOL)isPhotosLibraryIncludedInBackupForAccount:(id)a3;
+ (id)accountForID:(id)a3;
+ (id)fullBackupSize;
+ (int64_t)calculateExtraQuotaNeededToSyncWithBackupSize:(int64_t)a3;
+ (void)calculateExtraQuotaNeededToSyncForAccountWithID:(id)a3 isAccountFull:(BOOL)a4 completion:(id)a5;
+ (void)getLocalPhotoLibrarySizeWithCompletion:(id)a3;
@end

@implementation ICQDaemonPlanRecommendation

+ (void)calculateExtraQuotaNeededToSyncForAccountWithID:(id)a3 isAccountFull:(BOOL)a4 completion:(id)a5
{
  id v7 = a5;
  v8 = [a1 accountForID:a3];
  v9 = [a1 fullBackupSize];
  uint64_t v10 = [v9 integerValue];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __104__ICQDaemonPlanRecommendation_calculateExtraQuotaNeededToSyncForAccountWithID_isAccountFull_completion___block_invoke;
  v12[3] = &unk_1E6A53250;
  uint64_t v14 = v10;
  id v15 = a1;
  id v13 = v7;
  id v11 = v7;
  +[_ICQHelperFunctions remoteBackupSizeForAccount:v8 timeoutInSeconds:v12 completion:2.0];
}

void __104__ICQDaemonPlanRecommendation_calculateExtraQuotaNeededToSyncForAccountWithID_isAccountFull_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = v4 - [v3 integerValue];
  v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [v3 integerValue];
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 134218496;
    uint64_t v13 = v10;
    __int16 v14 = 2048;
    uint64_t v15 = v11;
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    _os_log_debug_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEBUG, "Found remote backup size %ld, local storage size: %ld, difference: %ld", (uint8_t *)&v12, 0x20u);
  }

  uint64_t v7 = [*(id *)(a1 + 48) calculateExtraQuotaNeededToSyncWithBackupSize:v5];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = [NSNumber numberWithInteger:v7];
  (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
}

+ (int64_t)calculateExtraQuotaNeededToSyncWithBackupSize:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int64_t v3 = a3 & ~(a3 >> 63);
  uint64_t v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = v3;
    _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "Returning new total usage value: %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

+ (id)accountForID:(id)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4F179C8];
  id v4 = a3;
  uint64_t v5 = [v3 defaultStore];
  int v6 = objc_msgSend(v5, "aa_appleAccountWithAltDSID:", v4);

  return v6;
}

+ (BOOL)isICPLEnabledForAccount:(id)a3
{
  return +[_ICQHelperFunctions isICPLEnabledForAccount:a3];
}

+ (BOOL)isPhotosLibraryIncludedInBackupForAccount:(id)a3
{
  return +[_ICQHelperFunctions isPhotosLibraryIncludedInBackupForAccount:a3];
}

+ (BOOL)isBackupEnabledForAccount:(id)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4F179C8];
  id v4 = a3;
  uint64_t v5 = [v3 defaultStore];
  BOOL v6 = +[_ICQHelperFunctions isBackupEnabledForAccount:v4 accountStore:v5];

  return v6;
}

+ (void)getLocalPhotoLibrarySizeWithCompletion:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__ICQDaemonPlanRecommendation_getLocalPhotoLibrarySizeWithCompletion___block_invoke;
  v5[3] = &unk_1E6A53278;
  id v6 = v3;
  id v4 = v3;
  +[_ICQHelperFunctions getOriginalPhotosSizeWithCompletion:v5];
}

uint64_t __70__ICQDaemonPlanRecommendation_getLocalPhotoLibrarySizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)fullBackupSize
{
  return +[_ICQHelperFunctions usedCapacityForVolume:@"/private/var"];
}

@end