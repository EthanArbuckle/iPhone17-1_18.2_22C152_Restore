@interface WBSSavedAccountStore
+ (BOOL)getProtectionSpaceAndHighLevelDomainForUserTypedSite:(id)a3 protectionSpace:(id *)a4 highLevelDomain:(id *)a5;
+ (BOOL)shouldShowServiceNamesForPasswordAndPasskeyItems;
+ (BOOL)userTypedTitleShouldBeTreatedAsAWebsiteWhenAddingNewAccount:(id)a3;
+ (WBSSavedAccountStore)sharedStore;
+ (id)protectionSpaceForNewStandalonePassword;
+ (void)removeCredentialTypes:(int64_t)a3 forSavedAccount:(id)a4 forGroup:(id)a5;
+ (void)setShouldShowServiceNamesForPasswordAndPasskeyItems:(BOOL)a3;
- (BOOL)_applyServiceNamesToSavedAccounts:(id)a3;
- (BOOL)_canChangeSavedAccount:(id)a3 toUser:(id)a4 password:(id)a5 forGroupID:(id)a6;
- (BOOL)_canChangeSavedAccountInPersonalKeychain:(id)a3 toUser:(id)a4 password:(id)a5;
- (BOOL)_canMoveSavedAccount:(id)a3 toGroupWithID:(id)a4;
- (BOOL)_canMoveSavedAccountWithPasskey:(id)a3 toGroup:(id)a4;
- (BOOL)_canPerformMaintenanceTasks;
- (BOOL)_copySavedAccount:(id)a3 toGroup:(id)a4;
- (BOOL)_deleteSavedAccountsWithUnknownOriginalContributorParticipantIDsFromSavedAccounts:(id)a3 inGroup:(id)a4;
- (BOOL)_hasPersonWithParticipantID:(id)a3 contributedSavedAccountsToGroupWithID:(id)a4;
- (BOOL)_hasSavedAccountWithSameUserNameOfSavedAccount:(id)a3 forProtectionSpace:(id)a4;
- (BOOL)_isMigratingKeychainItemsWithInvalidAuthenticationTypes;
- (BOOL)_moveSavedAccount:(id)a3 toGroupWithID:(id)a4;
- (BOOL)_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:(id)a3 isForAlreadyExitedGroup:(BOOL)a4;
- (BOOL)_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue:(id)a3 isForAlreadyExitedGroup:(BOOL)a4;
- (BOOL)_moveSignInWithAppleSavedAccount:(id)a3 toGroupID:(id)a4;
- (BOOL)_reapplyServiceNamesFromProvider;
- (BOOL)_recoverRecentlyDeletedSavedAccount:(id)a3;
- (BOOL)_shareSignInWithAppleAccountWithContext:(id)a3 withGroupInfo:(id)a4 savedAccount:(id)a5;
- (BOOL)_shouldLoadCredentialRecordWithHostIntoAccountStore:(id)a3;
- (BOOL)_shouldUpdateLastUsedDateForSavedAccount:(id)a3 forProtectionSpace:(id)a4 inContext:(id)a5;
- (BOOL)_unshareSignInWithAppleAccountWithContext:(id)a3;
- (BOOL)canChangeSavedAccount:(id)a3 toUser:(id)a4 password:(id)a5;
- (BOOL)canChangeSavedAccountWithRequest:(id)a3;
- (BOOL)canSaveUser:(id)a3 password:(id)a4 forProtectionSpace:(id)a5 highLevelDomain:(id)a6 notes:(id)a7 customTitle:(id)a8 groupID:(id)a9 error:(id *)a10;
- (BOOL)canSaveUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 notes:(id)a6 customTitle:(id)a7 groupID:(id)a8 error:(id *)a9;
- (BOOL)hasPasskeysEligibleForAutoFill;
- (BOOL)hasPasswordsEligibleForAutoFill;
- (BOOL)isForTesting;
- (BOOL)shouldShowServiceNamesForPasswordAndPasskeyItems;
- (BOOL)shouldWarmDataStoreAfterReset;
- (BOOL)unshareSignInWithAppleSavedAccount:(id)a3;
- (NSArray)allRecentlyDeletedSavedAccounts;
- (NSArray)passkeysDataOnInternalQueue;
- (NSArray)recentlyDeletedPasskeysDataOnInternalQueue;
- (NSArray)recentlyDeletedSavedAccountsInPersonalKeychain;
- (NSArray)savedAccounts;
- (NSArray)savedAccountsExcludingNeverSaveMarkerPasswords;
- (NSArray)savedAccountsInPersonalKeychain;
- (NSArray)savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords;
- (NSArray)savedAccountsWithNeverSaveMarker;
- (NSArray)savedAccountsWithPasswords;
- (NSArray)savedAccountsWithPasswordsExcludingNeverSaveMarkerPasswords;
- (NSArray)savedAccountsWithTOTPGenerators;
- (NSArray)sharedSavedAccountsInRecentlyDeletedToNotifyUserAbout;
- (NSArray)sharingGroupsWithRecentlyDeletedSavedAccounts;
- (NSArray)sharingGroupsWithSavedAccounts;
- (NSSet)highLevelDomainsOfAllSavedAccountsExcludingNeverSaveMarkerPasswords;
- (NSSet)highLevelDomainsOfAllSavedAccountsWithPasswordsExcludingNeverSaveMarkerPasswords;
- (NSSet)highLevelDomainsOfRecentlyDeletedAccounts;
- (WBSAuthenticationServicesAgentProxy)authenticationServicesAgentProxy;
- (WBSSavedAccountStore)initWithAuthenticationServicesAgentProxy:(id)a3 shouldPrewarmSavedAccounts:(BOOL)a4 limitedToDomains:(id)a5 forTesting:(BOOL)a6;
- (WBSSavedAccountStoreWebsiteNameProvider)websiteNameProvider;
- (_TtC10SafariCore15WBSPasskeyStore)passkeyStore;
- (id)_allInternetPasswordEntriesFromGroupID:(id)a3;
- (id)_allInternetPasswordEntriesFromPersonalKeychain;
- (id)_allPersonalSidecarsForGroupID:(id)a3 fromRecentlyDeleted:(BOOL)a4;
- (id)_allPersonalSidecarsFromPersonalKeychainFromRecentlyDeleted:(BOOL)a3;
- (id)_allSharedSidecarsForGroupID:(id)a3 fromRecentlyDeleted:(BOOL)a4;
- (id)_allSidecarsFromPersonalKeychain;
- (id)_convertSignInWithAppleAccountsToSavedAccounts:(id)a3;
- (id)_diagnosticStateDictionary;
- (id)_fetchCurrentAutoFillPasskeysWithCriteria:(id)a3;
- (id)_getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue:(id)a3 withCriteria:(id)a4 mergingAutoFillPasskeys:(id)a5 nearbyDeviceOptions:(id)a6;
- (id)_getSavedAccountTreeMatchesWithCriteriaOnInternalQueue:(id)a3 relyingPartyURL:(id)a4;
- (id)_getSavedAccountsMatchingCriteriaOnInternalQueue:(id)a3;
- (id)_groupIDArrayForUserDefaultsKey:(id)a3;
- (id)_loadAndMergeSavedAccountsFromGroupID:(id)a3 intoAllSavedAccounts:(id)a4;
- (id)_loadAndMergeSavedAccountsFromPersonalKeychainIntoAllSavedAccounts:(id)a3;
- (id)_loadSavedAccounts;
- (id)_loadSavedAccountsWithPasskeysFromPasskeyData:(id)a3 forGroupID:(id)a4 fromRecentlyDeleted:(BOOL)a5 withDictionaryForSavedAccountsWithPasskeys:(id)a6;
- (id)_loadSavedAccountsWithPasswordsFromKeychainData:(id)a3 forGroupID:(id)a4 withDictionaryForSavedAccountsWithPasswords:(id)a5 fromRecentlyDeleted:(BOOL)a6;
- (id)_mergeLoadedSavedAccounts:(id)a3 intoAllSavedAccounts:(id)a4;
- (id)_mergeSavedAccountsWithPasskeys:(id)a3 andSavedAccountsWithPasswords:(id)a4 usingDictionaryForSavedAccountsWithPasswords:(id)a5 dictionaryForSavedAccountsWithPasskeys:(id)a6;
- (id)_moveCredentialTypesToRecentlyDeleted:(int64_t)a3 fromSavedAccount:(id)a4;
- (id)_moveCredentialTypesToRecentlyDeletedOnInternalQueue:(int64_t)a3 fromSavedAccount:(id)a4;
- (id)_persistentIdentifierForUser:(id)a3 host:(id)a4;
- (id)_relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue:(id)a3 credentialIdentifiersToAutoFillPasskeys:(id)a4;
- (id)_saveAccountOnInternalQueueWithUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 groupID:(id)a6;
- (id)_saveAccountOnInternalQueueWithUser:(id)a3 password:(id)a4 protectionSpace:(id)a5 highLevelDomain:(id)a6 groupID:(id)a7;
- (id)_saveUser:(id)a3 passkeyCredential:(id)a4 passkeyRelyingPartyID:(id)a5;
- (id)_savedAccountForProtectionSpace:(id)a3 user:(id)a4 password:(id)a5;
- (id)_savedAccounts;
- (id)_savedAccountsWithPasswords;
- (id)duplicateAccountsWithGroupID:(id)a3;
- (id)exportPasskeyCredentialWithID:(id)a3;
- (id)exportPasskeyCredentialWithIDOnInternalQueue:(id)a3;
- (id)getSavedAccountWithPasskeyCredentialForUserHandle:(id)a3 protectionSpace:(id)a4;
- (id)highLevelDomainsOfSavedAccountsExcludingNeverSaveMarkerPasswordsForGroupID:(id)a3;
- (id)importPasskeyCredentialOnInternalQueue:(id)a3;
- (id)initAndPrewarmSavedAccounts:(BOOL)a3 forTesting:(BOOL)a4;
- (id)initPartialStoreForDomains:(id)a3 forTesting:(BOOL)a4;
- (id)passkeyDataForPasskeyCredentialIDOnInternalQueue:(id)a3;
- (id)persistentIdentifierForCredential:(id)a3 protectionSpace:(id)a4;
- (id)persistentIdentifierForSavedAccount:(id)a3;
- (id)recentlyDeletedSavedAccountsForGroupWithID:(id)a3;
- (id)saveUser:(id)a3 password:(id)a4 forProtectionSpace:(id)a5 highLevelDomain:(id)a6 groupID:(id)a7;
- (id)saveUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 customTitle:(id)a6 notesEntry:(id)a7 groupID:(id)a8;
- (id)saveUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 groupID:(id)a6;
- (id)saveUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 notesEntry:(id)a6 groupID:(id)a7;
- (id)savedAccountForURL:(id)a3 user:(id)a4 password:(id)a5;
- (id)savedAccountForURLCredential:(id)a3 protectionSpace:(id)a4;
- (id)savedAccountForUserTypedSite:(id)a3 userName:(id)a4;
- (id)savedAccountWithAllMetadataForURLCredential:(id)a3 protectionSpace:(id)a4;
- (id)savedAccountsForGroupID:(id)a3;
- (id)savedAccountsForPersistentIdentifiers:(id)a3;
- (unint64_t)numberOfSavedAccountsInPersonalKeychainForHighLevelDomain:(id)a3;
- (void)_addGroupID:(id)a3 toArrayForUserDefaultsKey:(id)a4;
- (void)_addNewGroupToCachedSharingGroups:(id)a3;
- (void)_addSavedAccount:(id)a3 toCachedDictionaryForSavedAccountsWithPasskeysForGroupID:(id)a4;
- (void)_addSavedAccount:(id)a3 toCachedDictionaryForSavedAccountsWithPasswordsForGroupID:(id)a4;
- (void)_addSavedAccountToRecentlyDeletedCachedCollections:(id)a3;
- (void)_cleanUpRedundantCredentialsWithoutUsernames;
- (void)_cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted:(BOOL)a3;
- (void)_clearExpiredRecentlyDeletedNotificationDates;
- (void)_ensureDomainsToUsersExists;
- (void)_ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount:(id)a3;
- (void)_ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue;
- (void)_fetchAndFilterAllPasskeysData;
- (void)_fetchAndFilterPasskeysData;
- (void)_fetchAndFilterRecentlyDeletedPasskeysData;
- (void)_fetchSharedAccountsGroups;
- (void)_fetchSignInWithAppleAccounts;
- (void)_identifySharedSavedAccountsWithSameUsernameAndHighLevelDomainPairs;
- (void)_loadRecentlyDeletedSavedAccounts;
- (void)_loadRecentlyDeletedSavedAccountsFromSharedGroupIDs:(id)a3;
- (void)_loadRecentlyDeletedSavedAccountsInPersonalKeychain;
- (void)_matchSidecars:(id)a3 toSavedAccountsWithPasskeysInDictionary:(id)a4 unmatchedSidecars:(id)a5;
- (void)_matchSidecars:(id)a3 toSavedAccountsWithPasswordsInDictionary:(id)a4 unmatchedSidecars:(id)a5;
- (void)_mergeSavedAccountWithPasskey:(id)a3 toSavedAccountWithPassword:(id)a4;
- (void)_mergeSavedAccountWithPassword:(id)a3 toSavedAccountWithPasskey:(id)a4;
- (void)_migratePasswordsWithInvalidAuthenticationTypes;
- (void)_moveContributedSavedAccountsBackToPersonalKeychainIfNecessary;
- (void)_notifyClientsAboutWebsiteNamesChanges;
- (void)_performCleanupForExitedGroupsIfNecessary:(id)a3;
- (void)_performLegacySidecarModificationWithChangeRequest:(id)a3 toSavedAccount:(id)a4;
- (void)_performRecentlyDeletedMaintenanceIfNecessary;
- (void)_postSavedAccountStoreDidChangeNotification;
- (void)_prewarm;
- (void)_pruneSavedAccountTreeMatchesOnInternalQueue:(id)a3 basedOnUsernameAndPasswordCriteria:(id)a4 autoFillPasskeyIdentifiers:(id)a5 keepAllPasskeyMatches:(BOOL)a6;
- (void)_recordGroupIdentifierForExitCleanup:(id)a3 completionHandler:(id)a4;
- (void)_recordGroupIdentifierForMovingContributedCredentialsBackToPersonalKeychain:(id)a3;
- (void)_removeCredentialTypes:(int64_t)a3 forSavedAccount:(id)a4;
- (void)_removeGroupID:(id)a3 fromArrayForUserDefaultsKey:(id)a4;
- (void)_removeSavedAccount:(id)a3 fromCachedCollectionsForCredentialTypes:(int64_t)a4;
- (void)_removeSavedAccount:(id)a3 fromCachedDictionaryForSavedAccountsWithPasskeysForGroupID:(id)a4;
- (void)_removeSavedAccount:(id)a3 fromCachedDictionaryForSavedAccountsWithPasswordsForGroupID:(id)a4;
- (void)_removeSavedAccount:(id)a3 fromGroupID:(id)a4;
- (void)_removeSavedAccountFromRecentlyDeletedCachedCollections:(id)a3;
- (void)_reportAccountsWithUnknownContributorIDIfNeeded;
- (void)_reportKeychainItemsWithInvalidAuthenticationTypesIfNeeded;
- (void)_resetOnInternalQueue;
- (void)_saveSidecarObjectsOnInternalQueueForSavedAccount:(id)a3 withBlock:(id)a4;
- (void)_saveSidecarObjectsOnInternalQueueForSavedAccountWithPassword:(id)a3 withBlock:(id)a4;
- (void)_saveSidecarOnInternalQueueForSavedAccountWithPasskey:(id)a3 withBlock:(id)a4;
- (void)_signInWithApplePushNotificationReceived:(id)a3;
- (void)_updateCachedSharedAccountGroupsOnInternalQueue;
- (void)_updateCachedSignInWithAppleAccountsOnInternalQueueWithAccounts:(id)a3;
- (void)_updateLastOneTimeShareDateforSavedAccountIfNeeded:(id)a3;
- (void)_updateSavedAccountsAndSavedAccountsWithPasswordsDictionary:(id)a3 withChangeFromOldUser:(id)a4 oldPassword:(id)a5 forSavedAccountWithPassword:(id)a6;
- (void)_updateShowServiceNamesInPasswordsPreference;
- (void)_verifyGroupsInSync;
- (void)_warmDataStoreAfterResetTimerFired:(id)a3;
- (void)_writeSidecarDataForMergedSavedAccount:(id)a3;
- (void)addAdditionalSite:(id)a3 toSavedAccount:(id)a4;
- (void)changeSavedAccount:(id)a3 toUser:(id)a4 password:(id)a5;
- (void)changeSavedAccountWithRequest:(id)a3;
- (void)dealloc;
- (void)deletePasskeyWithIdentifier:(WBSPublicKeyCredentialIdentifier *)a3 completionHandler:(id)a4;
- (void)deletePasskeyWithIdentifierOnInternalQueue:(id)a3;
- (void)getSavedAccountsMatchingCriteria:(id)a3 withSynchronousCompletionHandler:(id)a4;
- (void)knownWebsiteNamesDidChange;
- (void)knownWebsiteNamesDidChangeOnDomains:(id)a3;
- (void)newPasskeysAvailableForApplicationIdentifier:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performTaskEnsuringAllAccountSourcesAreLoadedOnQueue:(id)a3 task:(id)a4;
- (void)removeCredentialTypes:(int64_t)a3 forSavedAccount:(id)a4;
- (void)removeDontSaveMarkerForProtectionSpace:(id)a3;
- (void)removeHideWarningMarkerForSavedAccount:(id)a3;
- (void)removeLegacyPlatformCredentialsForDomains:(id)a3;
- (void)removeSite:(id)a3 fromSavedAccountWithPassword:(id)a4 withCompletion:(id)a5;
- (void)removeTOTPGeneratorForSavedAccount:(id)a3;
- (void)reset;
- (void)resetHiddenSecurityRecommendationsWithCompletionHandler:(id)a3;
- (void)saveAdditionalSites:(id)a3 forSavedAccount:(id)a4;
- (void)saveCustomTitle:(id)a3 forSavedAccount:(id)a4;
- (void)saveHideMarker:(id)a3 forSavedAccount:(id)a4;
- (void)saveNotesEntry:(id)a3 forSavedAccount:(id)a4;
- (void)saveTOTPGenerator:(id)a3 forSavedAccount:(id)a4;
- (void)savedAccountWithAllMetadataForURLCredential:(id)a3 protectionSpace:(id)a4 completion:(id)a5;
- (void)savedAccountsMatchingCriteria:(id)a3 withCompletionHandler:(id)a4;
- (void)setDontSaveMarkerForSavedAccountsWithProtectionSpace:(id)a3;
- (void)setSavedAccountAsDefault:(id)a3 forProtectionSpace:(id)a4;
- (void)setSavedAccountAsDefault:(id)a3 forProtectionSpace:(id)a4 context:(id)a5;
- (void)setShouldShowServiceNamesForPasswordAndPasskeyItems:(BOOL)a3;
- (void)setShouldWarmDataStoreAfterReset:(BOOL)a3;
- (void)test_copyPasskeyWithCredentialID:(id)a3 toGroup:(id)a4 inRecentlyDeleted:(BOOL)a5 completionHandler:(id)a6;
- (void)test_createLegacyWebAuthnCredentialWithUserName:(id)a3 displayName:(id)a4 relyingPartyIdentifier:(id)a5 userHandle:(id)a6 completionHandler:(id)a7;
- (void)test_createPasskeyWithUserName:(id)a3 displayName:(id)a4 relyingPartyIdentifier:(id)a5 userHandle:(id)a6 groupID:(id)a7 inRecentlyDeleted:(BOOL)a8 completionHandler:(id)a9;
- (void)test_createPasskeyWithUserName:(id)a3 displayName:(id)a4 relyingPartyIdentifier:(id)a5 userHandle:(id)a6 groupID:(id)a7 inRecentlyDeleted:(BOOL)a8 unsafeAllowRealKeychainAccess:(BOOL)a9 completionHandler:(id)a10;
- (void)test_reloadAllSavedAccounts;
- (void)test_setSharedAccountsGroups:(id)a3;
- (void)updateAllSavedAccountsWithPasswordsWithUser:(id)a3 protectionSpace:(id)a4 withNewPassword:(id)a5;
- (void)updateUserVisibleName:(NSString *)a3 forPasskeyWithIdentifier:(WBSPublicKeyCredentialIdentifier *)a4 completionHandler:(id)a5;
- (void)updateUserVisibleNameOnInternalQueue:(id)a3 forPasskeyWithIdentifier:(id)a4;
@end

@implementation WBSSavedAccountStore

+ (void)setShouldShowServiceNamesForPasswordAndPasskeyItems:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CB18], "pm_defaults");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setBool:v3 forKey:@"ShowServiceNamesInPasswords"];
}

- (id)_groupIDArrayForUserDefaultsKey:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  v5 = objc_msgSend(v3, "safari_browserDefaults");
  v6 = [v5 valueForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

uint64_t __50__WBSSavedAccountStore__fetchSharedAccountsGroups__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCachedSharedAccountGroupsOnInternalQueue];
}

void __76__WBSSavedAccountStore_setShouldShowServiceNamesForPasswordAndPasskeyItems___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(WBSScopeExitHandler);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__WBSSavedAccountStore_setShouldShowServiceNamesForPasswordAndPasskeyItems___block_invoke_2;
  v9[3] = &unk_1E615A768;
  v9[4] = *(void *)(a1 + 32);
  [(WBSScopeExitHandler *)v2 setHandler:v9];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != *(unsigned __int8 *)(*(void *)(a1 + 32) + 256))
  {
    [(id)objc_opt_class() setShouldShowServiceNamesForPasswordAndPasskeyItems:v3 != 0];
    *(unsigned char *)(*(void *)(a1 + 32) + 256) = *(unsigned char *)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) websiteNameProvider];
    v5 = v4;
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v6 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v6 = 0;
    }
    [v4 setWebsiteNameConsumer:v6];

    id v7 = *(unsigned char **)(a1 + 32);
    if (v7[257])
    {
      [v7 _resetOnInternalQueue];
      id v8 = (id)[*(id *)(a1 + 32) _loadSavedAccounts];
      [*(id *)(a1 + 32) _loadRecentlyDeletedSavedAccounts];
      [*(id *)(a1 + 32) _notifyClientsAboutWebsiteNamesChanges];
    }
  }
}

uint64_t __76__WBSSavedAccountStore_setShouldShowServiceNamesForPasswordAndPasskeyItems___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 257) = 1;
  return result;
}

unsigned char *__50__WBSSavedAccountStore_knownWebsiteNamesDidChange__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[256])
  {
    result = (unsigned char *)[result _reapplyServiceNamesFromProvider];
    if (result)
    {
      int v3 = *(void **)(a1 + 32);
      return (unsigned char *)[v3 _notifyClientsAboutWebsiteNamesChanges];
    }
  }
  return result;
}

- (BOOL)_reapplyServiceNamesFromProvider
{
  BOOL v3 = [(WBSSavedAccountStore *)self _applyServiceNamesToSavedAccounts:self->_savedAccounts];
  return v3 | [(WBSSavedAccountStore *)self _applyServiceNamesToSavedAccounts:self->_allRecentlyDeletedSavedAccounts];
}

- (BOOL)_applyServiceNamesToSavedAccounts:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24 = self;
  v5 = [(WBSSavedAccountStore *)self websiteNameProvider];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v6)
  {
    char v8 = 0;
    goto LABEL_23;
  }
  uint64_t v7 = v6;
  char v8 = 0;
  uint64_t v9 = *(void *)v27;
  v10 = v24;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
      if ([v12 hasValidWebsite])
      {
        v13 = [v12 serviceName];
        if (v10->_shouldShowServiceNamesForPasswordAndPasskeyItems)
        {
          v14 = [v12 userVisibleDomain];
          v15 = [v5 knownWebsiteNameForDomain:v14];
          if ([v15 length])
          {
            if (![v12 shouldShowSpecificSubdomainForUserVisibleDomain]
              || objc_msgSend(v14, "safari_isCaseInsensitiveEqualToString:", v15))
            {
              v16 = v12;
              v17 = v15;
              goto LABEL_14;
            }
            [NSString stringWithFormat:@"%@ (%@)", v15, v14];
            v21 = v20 = v5;
            [v12 setServiceName:v21];

            v5 = v20;
            v10 = v24;
          }
          else
          {
            v16 = v12;
            v17 = 0;
LABEL_14:
            [v16 setServiceName:v17];
          }
        }
        else
        {
          [v12 setServiceName:0];
        }
        v18 = [v12 serviceName];
        char v19 = WBSIsEqual(v13, v18);

        v8 |= v19 ^ 1;
      }
      ++v11;
    }
    while (v7 != v11);
    uint64_t v22 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    uint64_t v7 = v22;
  }
  while (v22);
LABEL_23:

  return v8 & 1;
}

uint64_t __68__WBSSavedAccountStore__updateShowServiceNamesInPasswordsPreference__block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() shouldShowServiceNamesForPasswordAndPasskeyItems];
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setShouldShowServiceNamesForPasswordAndPasskeyItems:v2];
}

+ (BOOL)shouldShowServiceNamesForPasswordAndPasskeyItems
{
  BOOL v3 = [MEMORY[0x1E4F28F80] processInfo];
  id v4 = [v3 processName];
  char v5 = [v4 isEqualToString:@"AuthenticationServicesAgent"];

  if (v5) {
    return 0;
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v8 = [v7 objectForKey:@"ShowServiceNamesInPasswords"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(a1, "setShouldShowServiceNamesForPasswordAndPasskeyItems:", objc_msgSend(v8, "BOOLValue"));
    [v7 removeObjectForKey:@"ShowServiceNamesInPasswords"];
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "pm_defaults");
  char v10 = objc_msgSend(v9, "safari_BOOLForKey:defaultValue:", @"ShowServiceNamesInPasswords", 1);

  return v10;
}

uint64_t __32__WBSSavedAccountStore__prewarm__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _savedAccounts];
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 _loadRecentlyDeletedSavedAccounts];
}

- (id)_savedAccounts
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_savedAccountsWithPasswords) {
    id v3 = [(WBSSavedAccountStore *)self _loadSavedAccounts];
  }
  id v4 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    savedAccounts = self->_savedAccounts;
    uint64_t v6 = v4;
    int v9 = 136315394;
    char v10 = "-[WBSSavedAccountStore _savedAccounts]";
    __int16 v11 = 2048;
    uint64_t v12 = [(NSArray *)savedAccounts count];
    _os_log_impl(&dword_1B728F000, v6, OS_LOG_TYPE_DEFAULT, "%s: Returning %lu saved accounts", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = self->_savedAccounts;
  return v7;
}

- (id)_loadSavedAccounts
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_DEFAULT, "Beginning saved account store load", buf, 2u);
  }
  id v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B728F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AccountStoreLoad", "", buf, 2u);
  }
  char v5 = [MEMORY[0x1E4F1CA60] dictionary];
  allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts = self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts;
  self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts = v5;

  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  [(WBSSavedAccountStore *)self _fetchAndFilterAllPasskeysData];
  char v8 = [(WBSSavedAccountStore *)self _loadAndMergeSavedAccountsFromPersonalKeychainIntoAllSavedAccounts:v7];
  savedAccountsInPersonalKeychain = self->_savedAccountsInPersonalKeychain;
  self->_savedAccountsInPersonalKeychain = v8;

  char v10 = [MEMORY[0x1E4F1CA60] dictionary];
  groupIdentifiersToSavedAccounts = self->_groupIdentifiersToSavedAccounts;
  self->_groupIdentifiersToSavedAccounts = v10;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v12 = self->_sharedAccountsGroups;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v51 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v18 = [v17 groupID];
        char v19 = [(WBSSavedAccountStore *)self _loadAndMergeSavedAccountsFromGroupID:v18 intoAllSavedAccounts:v7];
        v20 = self->_groupIdentifiersToSavedAccounts;
        v21 = [v17 groupID];
        [(NSMutableDictionary *)v20 setObject:v19 forKeyedSubscript:v21];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v14);
  }

  if ([(NSArray *)self->_sharedAccountsGroups count]) {
    [(WBSSavedAccountStore *)self _identifySharedSavedAccountsWithSameUsernameAndHighLevelDomainPairs];
  }
  uint64_t v22 = [MEMORY[0x1E4F28F80] processInfo];
  char v23 = objc_msgSend(v22, "safari_isPasswordManagerTestMode");

  if ((v23 & 1) == 0) {
    [(WBSSavedAccountStore *)self _fetchSignInWithAppleAccounts];
  }
  v24 = [MEMORY[0x1E4F1CA48] array];
  v25 = [MEMORY[0x1E4F1CA48] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v26 = v7;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v47 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        if (objc_msgSend(v31, "userIsNeverSaveMarker", (void)v46)) {
          v32 = v25;
        }
        else {
          v32 = v24;
        }
        [v32 addObject:v31];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v28);
  }

  v33 = [v24 sortedArrayUsingSelector:sel_compare_];
  savedAccounts = self->_savedAccounts;
  self->_savedAccounts = v33;

  v35 = [v25 sortedArrayUsingSelector:sel_compare_];
  savedAccountsWithNeverSaveMarker = self->_savedAccountsWithNeverSaveMarker;
  self->_savedAccountsWithNeverSaveMarker = v35;

  v37 = [(NSArray *)self->_savedAccounts safari_filterObjectsUsingBlock:&__block_literal_global_205];
  savedAccountsWithPasswords = self->_savedAccountsWithPasswords;
  self->_savedAccountsWithPasswords = v37;

  if ([(NSArray *)self->_savedAccountsWithSignInWithAppleRecords count])
  {
    v39 = [(NSArray *)self->_savedAccounts arrayByAddingObjectsFromArray:self->_savedAccountsWithSignInWithAppleRecords];
    v40 = [v39 sortedArrayUsingSelector:sel_compare_];
    v41 = self->_savedAccounts;
    self->_savedAccounts = v40;
  }
  v42 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_signpost_enabled(v42))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B728F000, v42, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AccountStoreLoad", "", buf, 2u);
  }
  v43 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B728F000, v43, OS_LOG_TYPE_DEFAULT, "Completed saved account store load", buf, 2u);
  }
  [(WBSSavedAccountStore *)self _cleanUpRedundantCredentialsWithoutUsernames];
  [(WBSSavedAccountStore *)self _cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted:0];
  [(WBSSavedAccountStore *)self _performRecentlyDeletedMaintenanceIfNecessary];
  if (self->_shouldShowServiceNamesForPasswordAndPasskeyItems) {
    [(WBSSavedAccountStore *)self _applyServiceNamesToSavedAccounts:self->_savedAccounts];
  }
  v44 = self->_savedAccounts;

  return v44;
}

void __68__WBSSavedAccountStore__cleanUpRedundantCredentialsWithoutUsernames__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 64);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__WBSSavedAccountStore__cleanUpRedundantCredentialsWithoutUsernames__block_invoke_2;
  v13[3] = &unk_1E615D338;
  v13[4] = v2;
  id v4 = objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v13);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 32) _removeCredentialTypes:1 forSavedAccount:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_performRecentlyDeletedMaintenanceIfNecessary
{
  if ([(WBSSavedAccountStore *)self _canPerformMaintenanceTasks])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__WBSSavedAccountStore__performRecentlyDeletedMaintenanceIfNecessary__block_invoke;
    block[3] = &unk_1E615A768;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted:(BOOL)a3
{
  if ([(WBSSavedAccountStore *)self _canPerformMaintenanceTasks])
  {
    id v4 = (void *)[(NSArray *)self->_sharedAccountsGroups copy];
    objc_initWeak(&location, self);
    uint64_t v5 = +[WBSOngoingSharingGroupProvider sharedProvider];
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __126__WBSSavedAccountStore__cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted___block_invoke;
    v8[3] = &unk_1E615D748;
    objc_copyWeak(&v10, &location);
    id v7 = v4;
    id v9 = v7;
    [v5 performTaskOnQueueAfterFetchingGroups:queue task:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_canPerformMaintenanceTasks
{
  if (isProcessAllowedToPerformAccountStoreMaintenance_onceToken != -1) {
    dispatch_once(&isProcessAllowedToPerformAccountStoreMaintenance_onceToken, &__block_literal_global_846);
  }
  return isProcessAllowedToPerformAccountStoreMaintenance_isAllowedToPerformMaintenance;
}

void __126__WBSSavedAccountStore__cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      uint64_t v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __126__WBSSavedAccountStore__cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted___block_invoke_cold_1(v5);
      }
    }
    else
    {
      uint64_t v6 = +[WBSOngoingSharingGroupProvider sharedProvider];
      id v7 = [v6 cachedGroups];

      if ([v7 isEqual:*(void *)(a1 + 32)])
      {
        *((unsigned char *)WeakRetained + 224) = 1;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v8 = *((id *)WeakRetained + 18);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          char v19 = v7;
          LOBYTE(v11) = 0;
          uint64_t v12 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              uint64_t v15 = (void *)*((void *)WeakRetained + 17);
              v16 = objc_msgSend(v14, "groupID", v19);
              v17 = [v15 objectForKeyedSubscript:v16];

              if (v11) {
                int v11 = 1;
              }
              else {
                int v11 = [WeakRetained _deleteSavedAccountsWithUnknownOriginalContributorParticipantIDsFromSavedAccounts:v17 inGroup:v14];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
          }
          while (v10);

          *((unsigned char *)WeakRetained + 224) = 0;
          id v7 = v19;
          if (v11)
          {
            [WeakRetained _resetOnInternalQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __126__WBSSavedAccountStore__cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted___block_invoke_298;
            block[3] = &unk_1E615A768;
            block[4] = WeakRetained;
            dispatch_async(MEMORY[0x1E4F14428], block);
          }
        }
        else
        {

          *((unsigned char *)WeakRetained + 224) = 0;
        }
      }
      else
      {
        v18 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B728F000, v18, OS_LOG_TYPE_DEFAULT, "Aborting clean up for passwords with unmatchable contributor ID because groups have changed since the account store was loaded.", buf, 2u);
        }
        [WeakRetained _updateCachedSharedAccountGroupsOnInternalQueue];
      }
    }
  }
}

- (void)_updateCachedSharedAccountGroupsOnInternalQueue
{
  id v3 = +[WBSOngoingSharingGroupProvider sharedProvider];
  id v4 = [v3 cachedGroups];

  if ((WBSIsEqual(v4, self->_sharedAccountsGroups) & 1) == 0)
  {
    uint64_t v5 = (NSArray *)[v4 copy];
    sharedAccountsGroups = self->_sharedAccountsGroups;
    self->_sharedAccountsGroups = v5;

    [(WBSSavedAccountStore *)self _resetOnInternalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__WBSSavedAccountStore__updateCachedSharedAccountGroupsOnInternalQueue__block_invoke;
    block[3] = &unk_1E615A768;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_resetOnInternalQueue
{
  id v3 = +[WBSKeyBagLockStatusManager sharedManager];
  uint64_t v4 = [v3 keyBagLockStatus];

  if (v4)
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEFAULT, "Skipping account store reset because the key bag is locked", buf, 2u);
    }
  }
  else
  {
    savedAccounts = self->_savedAccounts;
    self->_savedAccounts = 0;

    savedAccountsWithPasswords = self->_savedAccountsWithPasswords;
    self->_savedAccountsWithPasswords = 0;

    id v8 = self->_savedAccountsWithPasswords;
    self->_savedAccountsWithPasswords = 0;

    savedAccountsWithNeverSaveMarker = self->_savedAccountsWithNeverSaveMarker;
    self->_savedAccountsWithNeverSaveMarker = 0;

    *(_WORD *)&self->_hasPasswordsEligibleForAutoFill = 0;
    personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = 0;

    groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
    self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = 0;

    savedAccountsInPersonalKeychain = self->_savedAccountsInPersonalKeychain;
    self->_savedAccountsInPersonalKeychain = 0;

    allRecentlyDeletedSavedAccounts = self->_allRecentlyDeletedSavedAccounts;
    self->_allRecentlyDeletedSavedAccounts = 0;

    recentlyDeletedSavedAccountsInPersonalKeychain = self->_recentlyDeletedSavedAccountsInPersonalKeychain;
    self->_recentlyDeletedSavedAccountsInPersonalKeychain = 0;

    recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = 0;

    recentlyDeletedPersonalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_recentlyDeletedPersonalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
    self->_recentlyDeletedPersonalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = 0;

    sharedGroupIdentifiersToRecentlyDeletedSavedAccounts = self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts;
    self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts = 0;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__WBSSavedAccountStore__resetOnInternalQueue__block_invoke;
    block[3] = &unk_1E615A768;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_loadRecentlyDeletedSavedAccounts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_savedAccountsWithPasswords) {
    id v3 = [(WBSSavedAccountStore *)self _loadSavedAccounts];
  }
  [(WBSSavedAccountStore *)self _loadRecentlyDeletedSavedAccountsInPersonalKeychain];
  uint64_t v4 = (void *)[(NSMutableArray *)self->_recentlyDeletedSavedAccountsInPersonalKeychain mutableCopy];
  uint64_t v5 = [(NSArray *)self->_sharedAccountsGroups safari_mapObjectsUsingBlock:&__block_literal_global_227_0];
  [(WBSSavedAccountStore *)self _loadRecentlyDeletedSavedAccountsFromSharedGroupIDs:v5];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 addObjectsFromArray:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [v4 sortUsingSelector:sel_compare_];
  objc_storeStrong((id *)&self->_allRecentlyDeletedSavedAccounts, v4);
  if (self->_shouldShowServiceNamesForPasswordAndPasskeyItems) {
    [(WBSSavedAccountStore *)self _applyServiceNamesToSavedAccounts:self->_allRecentlyDeletedSavedAccounts];
  }
  [(WBSSavedAccountStore *)self _cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted:1];
}

- (void)_loadRecentlyDeletedSavedAccountsInPersonalKeychain
{
  id v13 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = v3;
  uint64_t v5 = v3;

  uint64_t v6 = objc_msgSend(v13, "safari_allRecentlyDeletedPasswordCredentialItemsInPersonalKeychain");
  uint64_t v7 = [(WBSSavedAccountStore *)self _loadSavedAccountsWithPasswordsFromKeychainData:v6 forGroupID:&stru_1F105D3F0 withDictionaryForSavedAccountsWithPasswords:self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts fromRecentlyDeleted:1];

  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = [(WBSSavedAccountStore *)self _loadSavedAccountsWithPasskeysFromPasskeyData:self->_recentlyDeletedPasskeysDataInPersonalKeychain forGroupID:&stru_1F105D3F0 fromRecentlyDeleted:1 withDictionaryForSavedAccountsWithPasskeys:v8];
  uint64_t v10 = [(WBSSavedAccountStore *)self _mergeSavedAccountsWithPasskeys:v9 andSavedAccountsWithPasswords:v7 usingDictionaryForSavedAccountsWithPasswords:v5 dictionaryForSavedAccountsWithPasskeys:v8];
  long long v11 = (NSMutableArray *)[v10 mutableCopy];
  recentlyDeletedSavedAccountsInPersonalKeychain = self->_recentlyDeletedSavedAccountsInPersonalKeychain;
  self->_recentlyDeletedSavedAccountsInPersonalKeychain = v11;
}

- (void)_loadRecentlyDeletedSavedAccountsFromSharedGroupIDs:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  sharedGroupIdentifiersToRecentlyDeletedSavedAccounts = self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts;
  self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts = v5;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * v9);
        long long v11 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v12 = objc_msgSend(v21, "safari_allRecentlyDeletedPasswordCredentialItemsInGroupWithID:", v10);
        id v13 = [(WBSSavedAccountStore *)self _loadSavedAccountsWithPasswordsFromKeychainData:v12 forGroupID:v10 withDictionaryForSavedAccountsWithPasswords:v11 fromRecentlyDeleted:1];

        long long v14 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v15 = [(NSDictionary *)self->_groupIdentifiersToRecentlyDeletedPasskeysData objectForKeyedSubscript:v10];
        uint64_t v16 = [(WBSSavedAccountStore *)self _loadSavedAccountsWithPasskeysFromPasskeyData:v15 forGroupID:v10 fromRecentlyDeleted:1 withDictionaryForSavedAccountsWithPasskeys:v14];

        v17 = [(WBSSavedAccountStore *)self _mergeSavedAccountsWithPasskeys:v16 andSavedAccountsWithPasswords:v13 usingDictionaryForSavedAccountsWithPasswords:v11 dictionaryForSavedAccountsWithPasskeys:v14];
        v18 = (void *)[v17 mutableCopy];
        [(NSMutableDictionary *)self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts setObject:v18 forKeyedSubscript:v10];

        ++v9;
      }
      while (v8 != v9);
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
}

- (id)_loadAndMergeSavedAccountsFromPersonalKeychainIntoAllSavedAccounts:(id)a3
{
  return [(WBSSavedAccountStore *)self _loadAndMergeSavedAccountsFromGroupID:&stru_1F105D3F0 intoAllSavedAccounts:a3];
}

- (void)_fetchSignInWithAppleAccounts
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Unable to load Sign in with Apple accounts, SPI not available", v2, v3, v4, v5, v6);
}

- (void)_fetchAndFilterRecentlyDeletedPasskeysData
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WBSSavedAccountStore *)self recentlyDeletedPasskeysDataOnInternalQueue];
  long long v23 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = v3;
  uint64_t v24 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v24)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v4);
        }
        uint64_t v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "safari_numberForKey:", @"IsSynchronizable");
        int v9 = [v8 BOOLValue];
        uint64_t v10 = objc_msgSend(v7, "safari_stringForKey:", @"GroupID");
        long long v11 = v10;
        if (self->_isForTesting)
        {
          if ((v9 & 1) != 0 || ![v10 length])
          {
LABEL_14:
            [v23 addObject:v7];
            goto LABEL_15;
          }
        }
        else if (v9)
        {
          goto LABEL_14;
        }
        if ([v11 length])
        {
          long long v12 = [v22 objectForKeyedSubscript:v11];

          if (!v12)
          {
            id v13 = [MEMORY[0x1E4F1CA48] array];
            [v22 setObject:v13 forKeyedSubscript:v11];
          }
          long long v14 = [v22 objectForKeyedSubscript:v11];
          [v14 addObject:v7];
        }
LABEL_15:
      }
      uint64_t v24 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v24);
  }

  uint64_t v15 = (NSArray *)[v23 copy];
  recentlyDeletedPasskeysDataInPersonalKeychain = self->_recentlyDeletedPasskeysDataInPersonalKeychain;
  self->_recentlyDeletedPasskeysDataInPersonalKeychain = v15;

  v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    uint64_t v19 = [v23 count];
    *(_DWORD *)buf = 136315394;
    v30 = "-[WBSSavedAccountStore _fetchAndFilterRecentlyDeletedPasskeysData]";
    __int16 v31 = 2048;
    uint64_t v32 = v19;
    _os_log_impl(&dword_1B728F000, v18, OS_LOG_TYPE_DEFAULT, "%s: Loaded %zu recently deleted passkey keychain records from personal keychain", buf, 0x16u);
  }
  uint64_t v20 = (NSDictionary *)[v22 copy];
  groupIdentifiersToRecentlyDeletedPasskeysData = self->_groupIdentifiersToRecentlyDeletedPasskeysData;
  self->_groupIdentifiersToRecentlyDeletedPasskeysData = v20;

  [v22 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_231];
}

- (void)_fetchAndFilterAllPasskeysData
{
  [(WBSSavedAccountStore *)self _fetchAndFilterPasskeysData];
  [(WBSSavedAccountStore *)self _fetchAndFilterRecentlyDeletedPasskeysData];
}

- (void)_cleanUpRedundantCredentialsWithoutUsernames
{
  if ([(WBSSavedAccountStore *)self _canPerformMaintenanceTasks])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__WBSSavedAccountStore__cleanUpRedundantCredentialsWithoutUsernames__block_invoke;
    block[3] = &unk_1E615A768;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_fetchAndFilterPasskeysData
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WBSSavedAccountStore *)self passkeysDataOnInternalQueue];
  v37 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  highLevelDomainToLegacyPlatformAuthenticatorCredentials = self->_highLevelDomainToLegacyPlatformAuthenticatorCredentials;
  self->_highLevelDomainToLegacyPlatformAuthenticatorCredentials = v4;

  uint8_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        long long v12 = objc_msgSend(v11, "safari_numberForKey:", @"IsSynchronizable");
        id v13 = objc_msgSend(v11, "safari_numberForKey:", @"Test_isLegacyCredential");
        int v14 = [v13 BOOLValue];

        int v15 = [v12 BOOLValue];
        uint64_t v16 = objc_msgSend(v11, "safari_stringForKey:", @"GroupID");
        v17 = v16;
        BOOL isForTesting = self->_isForTesting;
        if (self->_isForTesting) {
          BOOL v19 = 1;
        }
        else {
          BOOL v19 = v15;
        }
        if (self->_isForTesting && (v15 & 1) == 0)
        {
          BOOL v19 = [v16 length] == 0;
          BOOL isForTesting = self->_isForTesting;
        }
        BOOL v21 = !isForTesting;
        int v20 = v14 ^ 1;
        if (v21) {
          int v20 = 1;
        }
        BOOL v21 = v20 != 1 || !v19;
        if (!v21)
        {
          [v37 addObject:v11];
LABEL_24:
          self->_hasPasskeysEligibleForAutoFill = 1;
          goto LABEL_25;
        }
        if ([v17 length])
        {
          long long v22 = [v6 objectForKeyedSubscript:v17];

          if (!v22)
          {
            long long v23 = [MEMORY[0x1E4F1CA48] array];
            [v6 setObject:v23 forKeyedSubscript:v17];
          }
          uint64_t v24 = [v6 objectForKeyedSubscript:v17];
          [v24 addObject:v11];

          goto LABEL_24;
        }
        long long v25 = objc_msgSend(v11, "safari_stringForKey:", @"CredentialRelyingPartyID");
        long long v26 = objc_msgSend(v25, "safari_highLevelDomainForPasswordManager");

        long long v27 = [(NSMutableDictionary *)self->_highLevelDomainToLegacyPlatformAuthenticatorCredentials safari_mutableArrayForKey:v26];
        if (v27)
        {
          long long v28 = v27;
          [v27 addObject:v11];
        }
        else
        {
          long long v28 = [MEMORY[0x1E4F1CA48] arrayWithObject:v11];
          [(NSMutableDictionary *)self->_highLevelDomainToLegacyPlatformAuthenticatorCredentials setObject:v28 forKeyedSubscript:v26];
        }

LABEL_25:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
      uint64_t v8 = v29;
    }
    while (v29);
  }

  v30 = (NSArray *)[v37 copy];
  passkeysDataInPersonalKeychain = self->_passkeysDataInPersonalKeychain;
  self->_passkeysDataInPersonalKeychain = v30;

  uint64_t v32 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = v32;
    uint64_t v34 = [v37 count];
    *(_DWORD *)buf = 136315394;
    v44 = "-[WBSSavedAccountStore _fetchAndFilterPasskeysData]";
    __int16 v45 = 2048;
    uint64_t v46 = v34;
    _os_log_impl(&dword_1B728F000, v33, OS_LOG_TYPE_DEFAULT, "%s: Loaded %zu passkey keychain records from personal keychain", buf, 0x16u);
  }
  v35 = (NSDictionary *)[v6 copy];
  groupIdentifiersToPasskeysData = self->_groupIdentifiersToPasskeysData;
  self->_groupIdentifiersToPasskeysData = v35;

  [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_229];
}

- (_TtC10SafariCore15WBSPasskeyStore)passkeyStore
{
  return self->_passkeyStore;
}

- (void)_postSavedAccountStoreDidChangeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"WBSSavedAccountStoreDidChangeNotification" object:self];
}

void __35__WBSSavedAccountStore_sharedStore__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v3 = objc_msgSend(v2, "safari_isPasswordManagerTestMode");

  if (v3) {
    objc_msgSend(MEMORY[0x1E4F18D90], "safari_test_setUseTestingAccessGroups:", 1);
  }
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) initAndPrewarmSavedAccounts:1 forTesting:v3];
  uint64_t v5 = (void *)sharedStore_store;
  sharedStore_store = v4;
}

- (id)initAndPrewarmSavedAccounts:(BOOL)a3 forTesting:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = objc_alloc_init(WBSAuthenticationServicesAgentProxy);
  [(WBSAuthenticationServicesAgentProxy *)v7 setDelegate:self];
  uint64_t v8 = [(WBSSavedAccountStore *)self initWithAuthenticationServicesAgentProxy:v7 shouldPrewarmSavedAccounts:v5 limitedToDomains:0 forTesting:v4];

  return v8;
}

- (WBSSavedAccountStore)initWithAuthenticationServicesAgentProxy:(id)a3 shouldPrewarmSavedAccounts:(BOOL)a4 limitedToDomains:(id)a5 forTesting:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  v42.receiver = self;
  v42.super_class = (Class)WBSSavedAccountStore;
  id v13 = [(WBSSavedAccountStore *)&v42 init];
  if (v13)
  {
    objc_initWeak(&location, v13);
    uint64_t v14 = [v12 copy];
    domainsStoreIsLimitedTo = v13->_domainsStoreIsLimitedTo;
    v13->_domainsStoreIsLimitedTo = (NSArray *)v14;

    id v16 = [NSString stringWithFormat:@"com.apple.SafariCore.WBSSavedAccountStore.%@.%p._queue", objc_opt_class(), v13];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue_serial *)v17;

    BOOL v19 = [[_TtC10SafariCore15WBSPasskeyStore alloc] initForTesting:v6 queue:v13->_queue];
    passkeyStore = v13->_passkeyStore;
    v13->_passkeyStore = v19;

    v13->_BOOL isForTesting = v6;
    BOOL v21 = [[WBSKeychainCredentialNotificationMonitor alloc] initWithCoalescingInterval:0.002];
    keychainMonitor = v13->_keychainMonitor;
    v13->_keychainMonitor = v21;

    long long v23 = v13->_keychainMonitor;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __120__WBSSavedAccountStore_initWithAuthenticationServicesAgentProxy_shouldPrewarmSavedAccounts_limitedToDomains_forTesting___block_invoke;
    v39[3] = &unk_1E615A5D8;
    objc_copyWeak(&v40, &location);
    uint64_t v24 = [(WBSKeychainCredentialNotificationMonitor *)v23 addObserverWithBlock:v39];
    id keychainNotificationRegistrationToken = v13->_keychainNotificationRegistrationToken;
    v13->_id keychainNotificationRegistrationToken = (id)v24;

    long long v26 = +[WBSOngoingSharingGroupProvider sharedProvider];
    [v26 addSubscriber:v13];

    [(WBSSavedAccountStore *)v13 _fetchSharedAccountsGroups];
    long long v27 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v27 addObserver:v13 selector:sel__signInWithApplePushNotificationReceived_ name:@"com.apple.authkit.siwa-consented-app-list-changed" object:0];

    objc_storeStrong((id *)&v13->_authenticationServicesAgentProxy, a3);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __120__WBSSavedAccountStore_initWithAuthenticationServicesAgentProxy_shouldPrewarmSavedAccounts_limitedToDomains_forTesting___block_invoke_3;
    v37[3] = &unk_1E615D2C0;
    objc_copyWeak(&v38, &location);
    uint64_t v28 = +[WBSDiagnosticStateCollector registeredStateCollectorWithLogLabel:@"Saved Account Store State" payloadProvider:v37];
    stateCollector = v13->_stateCollector;
    v13->_stateCollector = (WBSDiagnosticStateCollector *)v28;

    if (v8)
    {
      v30 = [(WBSSavedAccountStore *)v13 websiteNameProvider];
      [v30 prewarm];

      [(WBSSavedAccountStore *)v13 _prewarm];
    }
    [(WBSSavedAccountStore *)v13 _moveContributedSavedAccountsBackToPersonalKeychainIfNecessary];
    [(WBSSavedAccountStore *)v13 _performCleanupForExitedGroupsIfNecessary:&__block_literal_global_61];
    __int16 v31 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v32 = [v31 processName];
    int v33 = [v32 isEqualToString:@"AuthenticationServicesAgent"];

    if (v33)
    {
      v13->_shouldShowServiceNamesForPasswordAndPasskeyItems = 0;
    }
    else
    {
      uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CB18], "pm_defaults");
      [v34 addObserver:v13 forKeyPath:@"ShowServiceNamesInPasswords" options:0 context:showServiceNamesInPasswordsEnabledKVOContext];

      [(WBSSavedAccountStore *)v13 _updateShowServiceNamesInPasswordsPreference];
    }
    v35 = v13;
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)_fetchSharedAccountsGroups
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WBSSavedAccountStore__fetchSharedAccountsGroups__block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateShowServiceNamesInPasswordsPreference
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__WBSSavedAccountStore__updateShowServiceNamesInPasswordsPreference__block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_prewarm
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__WBSSavedAccountStore__prewarm__block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_performCleanupForExitedGroupsIfNecessary:(id)a3
{
  id v4 = a3;
  if ([(WBSSavedAccountStore *)self _canPerformMaintenanceTasks])
  {
    BOOL v5 = [(WBSSavedAccountStore *)self _groupIDArrayForUserDefaultsKey:@"groupIdentifiersToDeleteAllItemsFrom"];
    if ([v5 count])
    {
      BOOL v6 = +[WBSOngoingSharingGroupProvider sharedProvider];
      queue = self->_queue;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke;
      v8[3] = &unk_1E615D858;
      id v10 = v4;
      void v8[4] = self;
      id v9 = v5;
      [v6 performTaskOnQueueAfterFetchingGroups:queue task:v8];
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)_moveContributedSavedAccountsBackToPersonalKeychainIfNecessary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(WBSSavedAccountStore *)self _canPerformMaintenanceTasks])
  {
    uint64_t v3 = [(WBSSavedAccountStore *)self _groupIDArrayForUserDefaultsKey:@"groupIdentifiersToMoveContributedCredentialsBackToPersonalKeychainFrom"];
    if ([v3 count])
    {
      id v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_1B728F000, v4, OS_LOG_TYPE_DEFAULT, "Moving credentials back to personal keychain for group ID's recorded for cleanup: %@", buf, 0xCu);
      }
      queue = self->_queue;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __86__WBSSavedAccountStore__moveContributedSavedAccountsBackToPersonalKeychainIfNecessary__block_invoke;
      v6[3] = &unk_1E615A6C8;
      v6[4] = self;
      id v7 = v3;
      dispatch_async(queue, v6);
    }
  }
}

- (id)_loadAndMergeSavedAccountsFromGroupID:(id)a3 intoAllSavedAccounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v8)
  {
    if (!self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts)
    {
      id v9 = [MEMORY[0x1E4F1CA60] dictionary];
      groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
      self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = v9;
    }
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts setObject:v11 forKeyedSubscript:v6];

    id v12 = [(NSMutableDictionary *)self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts objectForKeyedSubscript:v6];
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1CA60] dictionary];
    personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = v13;

    id v12 = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  }
  int v15 = v12;
  id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v8)
  {
    dispatch_queue_t v17 = [(WBSSavedAccountStore *)self _allInternetPasswordEntriesFromGroupID:v6];
    v18 = [(WBSSavedAccountStore *)self _loadSavedAccountsWithPasswordsFromKeychainData:v17 forGroupID:v6 withDictionaryForSavedAccountsWithPasswords:v15 fromRecentlyDeleted:0];
    BOOL v19 = [(NSDictionary *)self->_groupIdentifiersToPasskeysData objectForKeyedSubscript:v6];
  }
  else
  {
    dispatch_queue_t v17 = [(WBSSavedAccountStore *)self _allInternetPasswordEntriesFromPersonalKeychain];
    v18 = [(WBSSavedAccountStore *)self _loadSavedAccountsWithPasswordsFromKeychainData:v17 forGroupID:v6 withDictionaryForSavedAccountsWithPasswords:v15 fromRecentlyDeleted:0];
    BOOL v19 = self->_passkeysDataInPersonalKeychain;
  }
  int v20 = v19;
  BOOL v21 = [(WBSSavedAccountStore *)self _loadSavedAccountsWithPasskeysFromPasskeyData:v19 forGroupID:v6 fromRecentlyDeleted:0 withDictionaryForSavedAccountsWithPasskeys:v16];
  long long v22 = [(WBSSavedAccountStore *)self _mergeSavedAccountsWithPasskeys:v21 andSavedAccountsWithPasswords:v18 usingDictionaryForSavedAccountsWithPasswords:v15 dictionaryForSavedAccountsWithPasskeys:v16];
  long long v23 = [(WBSSavedAccountStore *)self _mergeLoadedSavedAccounts:v22 intoAllSavedAccounts:v7];

  return v23;
}

- (id)_mergeSavedAccountsWithPasskeys:(id)a3 andSavedAccountsWithPasswords:(id)a4 usingDictionaryForSavedAccountsWithPasswords:(id)a5 dictionaryForSavedAccountsWithPasskeys:(id)a6
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v54 = a5;
  id v53 = a6;
  long long v51 = (void *)[a4 mutableCopy];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = v9;
  uint64_t v55 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (v55)
  {
    uint64_t v52 = *(void *)v75;
    unint64_t v10 = 0x1E4F1C000uLL;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v75 != v52) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        id v13 = [v12 user];
        uint64_t v14 = [v12 highLevelDomain];
        int v15 = [v54 objectForKeyedSubscript:v14];
        id v16 = [v15 objectForKeyedSubscript:v13];

        dispatch_queue_t v17 = [v16 allValues];
        v18 = [v53 objectForKeyedSubscript:v14];
        BOOL v19 = [v18 objectForKeyedSubscript:v13];

        v63 = v19;
        uint64_t v61 = [v19 count];
        if ([v17 count])
        {
          v58 = v14;
          v59 = v13;
          uint64_t v60 = i;
          v62 = [*(id *)(v10 + 2632) array];
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          v56 = v17;
          id v64 = v17;
          uint64_t v20 = [v64 countByEnumeratingWithState:&v70 objects:v79 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v71;
            while (2)
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v71 != v22) {
                  objc_enumerationMutation(v64);
                }
                uint64_t v24 = *(void **)(*((void *)&v70 + 1) + 8 * j);
                long long v25 = [v24 sites];
                long long v26 = [v12 passkeyRelyingPartyID];
                int v27 = [v25 containsObject:v26];

                if (v27)
                {
                  [v62 addObject:v24];
                  goto LABEL_17;
                }
              }
              uint64_t v21 = [v64 countByEnumeratingWithState:&v70 objects:v79 count:16];
              if (v21) {
                continue;
              }
              break;
            }
          }
LABEL_17:
          uint64_t v57 = v16;

          uint64_t v28 = [*(id *)(v10 + 2632) array];
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v29 = v63;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v66 objects:v78 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v67;
            do
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(void *)v67 != v32) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v34 = *(void **)(*((void *)&v66 + 1) + 8 * k);
                v35 = [v12 passkeyRelyingPartyID];
                v36 = [v34 passkeyRelyingPartyID];
                int v37 = [v35 isEqualToString:v36];

                if (v37) {
                  [v28 addObject:v34];
                }
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v66 objects:v78 count:16];
            }
            while (v31);
          }

          if ([v62 count] == 1 && (v38 = objc_msgSend(v28, "count"), long long v39 = v62, v38 == 1)
            || [v64 count] == 1 && (long long v39 = v64, v61 == 1))
          {
            id v40 = [v39 firstObject];
            char v65 = 0;
            id v16 = v57;
            uint64_t v14 = v58;
            if ([v40 _canMergeWithSavedAccount:v12 requiresDataCopying:&v65])
            {
              long long v41 = [v12 passkeyCredentialID];
              [v40 setPasskeyCredentialID:v41];

              objc_super v42 = [v12 passkeyUserHandle];
              [v40 setPasskeyUserHandle:v42];

              v43 = [v12 passkeyRelyingPartyID];
              [v40 setPasskeyRelyingPartyID:v43];

              v44 = [v12 creationDateForPasskey];
              [v40 setCreationDateForPasskey:v44];

              __int16 v45 = [v12 lastModifiedDate];
              [v40 setLastModifiedDateForPasskey:v45];

              uint64_t v46 = [v12 lastUsedDateForPasskey];
              [v40 setLastUsedDateForPasskey:v46];

              [v40 _mergePasskeySidecarsFromSavedAccount:v12];
              uint64_t i = v60;
              if (v65) {
                [(WBSSavedAccountStore *)self _writeSidecarDataForMergedSavedAccount:v40];
              }
            }
            else
            {
              [v51 addObject:v12];
              uint64_t i = v60;
            }

            unint64_t v10 = 0x1E4F1C000;
          }
          else
          {
            [v51 addObject:v12];
            unint64_t v10 = 0x1E4F1C000;
            uint64_t i = v60;
            id v16 = v57;
            uint64_t v14 = v58;
          }

          id v13 = v59;
          dispatch_queue_t v17 = v56;
        }
        else
        {
          [v51 addObject:v12];
        }
      }
      uint64_t v55 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
    }
    while (v55);
  }

  long long v47 = [v51 sortedArrayUsingSelector:sel_compare_];

  return v47;
}

- (id)_loadSavedAccountsWithPasskeysFromPasskeyData:(id)a3 forGroupID:(id)a4 fromRecentlyDeleted:(BOOL)a5 withDictionaryForSavedAccountsWithPasskeys:(id)a6
{
  BOOL v7 = a5;
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v79 = a6;
  v84 = v11;
  uint64_t v12 = [v11 length];
  uint64_t v13 = v12;
  BOOL v78 = v7;
  uint64_t v74 = v12;
  if (v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    v80 = v14;
    if (!v13) {
      objc_storeStrong((id *)&self->_recentlyDeletedPersonalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, v14);
    }
  }
  else
  {
    if (v12)
    {
      if (!self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys)
      {
        int v15 = [MEMORY[0x1E4F1CA60] dictionary];
        groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
        self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = v15;
      }
      dispatch_queue_t v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v74);
      [(NSMutableDictionary *)self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys setObject:v17 forKeyedSubscript:v11];

      v18 = [(NSMutableDictionary *)self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys objectForKeyedSubscript:v11];
    }
    else
    {
      BOOL v19 = [MEMORY[0x1E4F1CA60] dictionary];
      personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
      self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = v19;

      v18 = self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
    }
    v80 = v18;
  }
  long long v77 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v74);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v21 = v10;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v92 objects:v100 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v93;
    v87 = self;
    id v76 = v21;
    uint64_t v85 = *(void *)v93;
    do
    {
      uint64_t v25 = 0;
      uint64_t v81 = v23;
      do
      {
        if (*(void *)v93 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = *(void **)(*((void *)&v92 + 1) + 8 * v25);
        int v27 = [v26 objectForKeyedSubscript:@"CredentialRelyingPartyID"];
        if ([(WBSSavedAccountStore *)self _shouldLoadCredentialRecordWithHostIntoAccountStore:v27])
        {
          v88 = [v26 objectForKeyedSubscript:@"CredentialUserVisibleName"];
          uint64_t v28 = [v26 objectForKeyedSubscript:@"UserHandle"];
          id v29 = [v26 objectForKeyedSubscript:@"CredentialID"];
          uint64_t v30 = [v29 base64EncodedStringWithOptions:0];

          uint64_t v89 = [(__CFString *)v27 safari_highLevelDomainForPasswordManager];
          if (v89)
          {
            v86 = v30;
            if (v30)
            {
              uint64_t v31 = objc_msgSend(v26, "safari_stringForKey:", @"GroupID");
              uint64_t v32 = (void *)v31;
              int v33 = &stru_1F105D3F0;
              if (v31) {
                int v33 = (__CFString *)v31;
              }
              uint64_t v34 = v33;

              if ([(__CFString *)v34 isEqualToString:v84])
              {
                v83 = v34;
                v35 = [(NSMutableDictionary *)self->_highLevelDomainToLegacyPlatformAuthenticatorCredentials safari_mutableArrayForKey:v89];
                v36 = 0;
                if ([v35 count])
                {
                  unint64_t v37 = 0;
                  do
                  {
                    uint64_t v38 = [v35 objectAtIndexedSubscript:v37];
                    long long v39 = [v38 objectForKeyedSubscript:@"UserHandle"];
                    int v40 = [v39 isEqualToString:v28];

                    if (v40)
                    {
                      if (v36)
                      {
                        [v36 addIndex:v37];
                      }
                      else
                      {
                        v36 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v37];
                      }
                      long long v41 = [v38 objectForKeyedSubscript:@"CredentialID"];
                      objc_super v42 = [v41 base64EncodedStringWithOptions:0];

                      v43 = WBS_LOG_CHANNEL_PREFIXPasswords();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543618;
                        v97 = (__CFString *)v89;
                        __int16 v98 = 2114;
                        v99 = v42;
                        _os_log_impl(&dword_1B728F000, v43, OS_LOG_TYPE_DEFAULT, "Found passkey and legacy credential for %{public}@ with matching userHandle %{public}@. Removing legacy credential.", buf, 0x16u);
                      }
                      v44 = [[WBSPublicKeyCredentialIdentifier alloc] initWithCredentialID:v42 groupID:&stru_1F105D3F0];
                      [(WBSSavedAccountStore *)v87 deletePasskeyWithIdentifierOnInternalQueue:v44];
                    }
                    ++v37;
                  }
                  while (v37 < [v35 count]);
                  if (v36) {
                    [v35 removeObjectsAtIndexes:v36];
                  }
                  __int16 v45 = v79;
                  uint64_t v46 = v88;
                }
                else
                {
                  uint64_t v46 = v88;
                  __int16 v45 = v79;
                }
                id v51 = [[WBSSavedAccount alloc] _initWithPasskeyRelyingPartyID:v27 user:v46 passkeyUserHandle:v28 passkeyCredentialID:v86];
                uint64_t v52 = [v26 objectForKeyedSubscript:@"CreationDate"];
                [v51 setCreationDateForPasskey:v52];

                id v53 = [v45 objectForKeyedSubscript:v89];

                if (!v53)
                {
                  id v54 = [MEMORY[0x1E4F1CA60] dictionary];
                  [v45 setObject:v54 forKeyedSubscript:v89];
                }
                uint64_t v55 = [v45 objectForKeyedSubscript:v89];
                v56 = [v55 objectForKeyedSubscript:v46];

                if (!v56)
                {
                  uint64_t v57 = [MEMORY[0x1E4F1CA48] array];
                  v58 = [v45 objectForKeyedSubscript:v89];
                  [v58 setObject:v57 forKeyedSubscript:v88];
                }
                v59 = [v45 objectForKeyedSubscript:v89];
                uint64_t v60 = [v59 objectForKeyedSubscript:v88];
                [v60 addObject:v51];

                v82 = objc_msgSend(MEMORY[0x1E4F18D98], "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v27);
                uint64_t v61 = [[WBSPair alloc] initWithFirst:v28 second:v82];
                v62 = [(NSMutableDictionary *)v80 objectForKeyedSubscript:v61];
                if (!v62)
                {
                  v62 = [MEMORY[0x1E4F1CA48] array];
                  [(NSMutableDictionary *)v80 setObject:v62 forKeyedSubscript:v61];
                }
                [v62 addObject:v51];
                v63 = [v26 objectForKeyedSubscript:@"LastModifiedDate"];
                [v51 setLastModifiedDateForPasskey:v63];

                id v64 = [v51 lastModifiedDateForPasskey];
                [v51 setLastUsedDateForPasskey:v64];

                [v51 setSharedGroupID:v84];
                [v51 setIsRecentlyDeleted:v78];
                [v77 addObject:v51];

                self = v87;
                id v21 = v76;
                uint64_t v23 = v81;
                uint64_t v34 = v83;
              }
              else
              {
                long long v50 = WBS_LOG_CHANNEL_PREFIXPasswords();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v97 = v34;
                  __int16 v98 = 2114;
                  v99 = v84;
                  _os_log_fault_impl(&dword_1B728F000, v50, OS_LOG_TYPE_FAULT, "Given passkey with group %{public}@ does not match expected group %{public}@. Skipping.", buf, 0x16u);
                }
              }

              uint64_t v30 = v86;
              uint64_t v48 = (void *)v89;
            }
            else
            {
              long long v49 = WBS_LOG_CHANNEL_PREFIXPasswords();
              uint64_t v30 = 0;
              uint64_t v48 = (void *)v89;
              if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
                -[WBSSavedAccountStore _loadSavedAccountsWithPasskeysFromPasskeyData:forGroupID:fromRecentlyDeleted:withDictionaryForSavedAccountsWithPasskeys:](&v90, v91, v49);
              }
            }
          }
          else
          {
            long long v47 = WBS_LOG_CHANNEL_PREFIXPasswords();
            uint64_t v48 = 0;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138739971;
              v97 = v27;
              _os_log_error_impl(&dword_1B728F000, v47, OS_LOG_TYPE_ERROR, "Failed to create high level domain from passkey data relying party ID: %{sensitive}@", buf, 0xCu);
            }
          }

          uint64_t v24 = v85;
        }

        ++v25;
      }
      while (v25 != v23);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v92 objects:v100 count:16];
    }
    while (v23);
  }

  char v65 = [MEMORY[0x1E4F1CA48] array];
  if (v75)
  {
    long long v66 = [(WBSSavedAccountStore *)self _allSharedSidecarsForGroupID:v84 fromRecentlyDeleted:v78];
    [(WBSSavedAccountStore *)self _matchSidecars:v66 toSavedAccountsWithPasskeysInDictionary:v80 unmatchedSidecars:v65];
    long long v67 = [(WBSSavedAccountStore *)self _allPersonalSidecarsForGroupID:v84 fromRecentlyDeleted:v78];
    [(WBSSavedAccountStore *)self _matchSidecars:v67 toSavedAccountsWithPasskeysInDictionary:v80 unmatchedSidecars:v65];
  }
  else
  {
    long long v66 = [(WBSSavedAccountStore *)self _allPersonalSidecarsFromPersonalKeychainFromRecentlyDeleted:v78];
    [(WBSSavedAccountStore *)self _matchSidecars:v66 toSavedAccountsWithPasskeysInDictionary:v80 unmatchedSidecars:v65];
  }

  long long v68 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    long long v69 = v68;
    uint64_t v70 = [v65 count];
    *(_DWORD *)buf = 134217984;
    v97 = (__CFString *)v70;
    _os_log_impl(&dword_1B728F000, v69, OS_LOG_TYPE_INFO, "%ld unmatched sidecars.", buf, 0xCu);
  }
  long long v71 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
    -[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:]();
  }
  long long v72 = (void *)[v77 copy];

  return v72;
}

- (void)_matchSidecars:(id)a3 toSavedAccountsWithPasskeysInDictionary:(id)a4 unmatchedSidecars:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v24 = a5;
  id obj = v7;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v14 = [WBSPair alloc];
        int v15 = [v13 user];
        id v16 = [v13 protectionSpace];
        dispatch_queue_t v17 = [(WBSPair *)v14 initWithFirst:v15 second:v16];

        v18 = [v8 objectForKeyedSubscript:v17];
        BOOL v19 = v18;
        if (v18)
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v27 != v22) {
                  objc_enumerationMutation(v19);
                }
                [*(id *)(*((void *)&v26 + 1) + 8 * j) _addPasskeySidecar:v13];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v21);
          }
        }
        else
        {
          [v24 addObject:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }
}

- (id)_loadSavedAccountsWithPasswordsFromKeychainData:(id)a3 forGroupID:(id)a4 withDictionaryForSavedAccountsWithPasswords:(id)a5 fromRecentlyDeleted:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v82 = a5;
  uint64_t v101 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    uint64_t v14 = [v10 count];
    int v15 = @"NO";
    if (v6) {
      int v15 = @"YES";
    }
    id v16 = v15;
    *(_DWORD *)buf = 136315906;
    v125 = "-[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccou"
           "ntsWithPasswords:fromRecentlyDeleted:]";
    __int16 v126 = 2048;
    uint64_t v127 = v14;
    __int16 v128 = 2114;
    id v129 = v11;
    __int16 v130 = 2112;
    v131 = v16;
    _os_log_impl(&dword_1B728F000, v13, OS_LOG_TYPE_DEFAULT, "%s: Loaded %zu password keychain records from group: %{public}@ from Recently Deleted: %@", buf, 0x2Au);
  }
  uint64_t v81 = v11;
  BOOL v83 = v6;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v17 = v10;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v117 objects:v123 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v99 = 0;
    uint64_t v85 = 0;
    uint64_t v20 = *(void *)v118;
    uint64_t v21 = *MEMORY[0x1E4F3B7C8];
    uint64_t v110 = *MEMORY[0x1E4F3B5C0];
    uint64_t v109 = *MEMORY[0x1E4F3B848];
    uint64_t v94 = *MEMORY[0x1E4F3B5E8];
    uint64_t v93 = *MEMORY[0x1E4F3B5F8];
    uint64_t v84 = *MEMORY[0x1E4F3B550];
    uint64_t v92 = *MEMORY[0x1E4F3BD38];
    uint64_t v91 = *MEMORY[0x1E4F3B7C0];
    uint64_t v90 = *MEMORY[0x1E4F18C88];
    uint64_t v89 = *MEMORY[0x1E4F3B668];
    uint64_t v88 = *MEMORY[0x1E4F3B790];
    uint64_t v86 = *MEMORY[0x1E4F3B660];
    uint64_t v87 = *MEMORY[0x1E4F3BD40];
    id v97 = v17;
    __int16 v98 = self;
    uint64_t v95 = *MEMORY[0x1E4F3B7C8];
    uint64_t v96 = *(void *)v118;
    do
    {
      uint64_t v22 = 0;
      uint64_t v100 = v19;
      do
      {
        if (*(void *)v118 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void **)(*((void *)&v117 + 1) + 8 * v22);
        id v24 = [v23 objectForKeyedSubscript:v21];
        uint64_t v25 = WBSHTTPProtocolFromSecAttrProtocolValue(v24);

        if (v25)
        {
          uint64_t v26 = [v23 objectForKeyedSubscript:v110];
          long long v27 = (void *)v26;
          long long v28 = &stru_1F105D3F0;
          if (v26) {
            long long v28 = (__CFString *)v26;
          }
          long long v29 = v28;

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v30 = [v23 objectForKeyedSubscript:v109];
            if ([v30 length]
              && [(WBSSavedAccountStore *)self _shouldLoadCredentialRecordWithHostIntoAccountStore:v30])
            {
              objc_msgSend(v23, "safari_stringForKey:", v94);
              long long v31 = (char *)objc_claimAutoreleasedReturnValue();
              if (([v31 isEqualToString:v93] & 1) == 0)
              {
                long long v32 = objc_msgSend(v23, "safari_stringForKey:", v84);
                long long v33 = WBS_LOG_CHANNEL_PREFIXKeychain();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v125 = v31;
                  __int16 v126 = 2114;
                  uint64_t v127 = (uint64_t)v32;
                  _os_log_error_impl(&dword_1B728F000, v33, OS_LOG_TYPE_ERROR, "Invalid authentication type for keychain item; kSecAttrAuthenticationType: %{public}@, kSecAttrAcces"
                    "sGroup: %{public}@",
                    buf,
                    0x16u);
                }
                ++v99;
              }
              uint64_t v34 = objc_msgSend(v30, "safari_highLevelDomainForPasswordManager");
              v35 = (void *)v34;
              if (v34) {
                uint64_t v36 = (void *)v34;
              }
              else {
                uint64_t v36 = v30;
              }
              id v37 = v36;

              uint64_t v38 = [v101 objectForKeyedSubscript:v37];
              if (!v38)
              {
                uint64_t v38 = [MEMORY[0x1E4F1CA60] dictionary];
                [v101 setObject:v38 forKeyedSubscript:v37];
              }
              uint64_t v39 = [v23 objectForKeyedSubscript:v92];
              v105 = (void *)v39;
              if (v39)
              {
                uint64_t v40 = [[NSString alloc] initWithData:v39 encoding:4];
                long long v41 = (void *)v40;
                objc_super v42 = &stru_1F105D3F0;
                if (v40) {
                  objc_super v42 = (__CFString *)v40;
                }
                v43 = v42;
              }
              else
              {
                v43 = &stru_1F105D3F0;
              }
              __int16 v45 = [v38 objectForKeyedSubscript:v29];
              if (!v45)
              {
                __int16 v45 = [MEMORY[0x1E4F1CA60] dictionary];
                [v38 setObject:v45 forKeyedSubscript:v29];
              }
              uint64_t v46 = [v45 objectForKeyedSubscript:v43];
              v107 = v37;
              v108 = v31;
              v106 = v38;
              v104 = v43;
              v102 = v45;
              if (v46)
              {
                id v103 = (id)v46;
              }
              else
              {
                ++v85;
                id v103 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                objc_msgSend(v45, "setObject:forKeyedSubscript:");
              }
              id v47 = objc_alloc(MEMORY[0x1E4F18D98]);
              uint64_t v48 = [v23 objectForKeyedSubscript:v91];
              long long v49 = objc_msgSend(v47, "initWithHost:port:protocol:realm:authenticationMethod:", v30, objc_msgSend(v48, "integerValue"), v25, 0, v90);

              long long v50 = [v23 objectForKeyedSubscript:v89];
              uint64_t v51 = [v23 objectForKeyedSubscript:v88];
              uint64_t v52 = (void *)v51;
              if (v51) {
                id v53 = (void *)v51;
              }
              else {
                id v53 = v50;
              }
              id v54 = v53;

              uint64_t v55 = objc_msgSend(v23, "safari_dataForKey:", v87);
              v56 = [v23 objectForKeyedSubscript:v86];
              uint64_t v57 = [v56 isEqualToString:@"default"];

              v58 = [[_WBSSavedAccountPartialCredential alloc] initWithProtectionSpace:v49 modificationDate:v54 creationDate:v50 persistentIdentifier:v55 isDefaultCredentialForProtectionSpace:v57];
              [v103 addObject:v58];

              id v17 = v97;
              self = v98;
              uint64_t v21 = v95;
              uint64_t v20 = v96;
              uint64_t v19 = v100;
            }
          }
          else
          {
            v44 = WBS_LOG_CHANNEL_PREFIXKeychain();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
              -[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:](&v121, v44, (uint64_t)v29, &v122);
            }
          }
        }
        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v117 objects:v123 count:16];
    }
    while (v19);
  }
  else
  {
    uint64_t v99 = 0;
    uint64_t v85 = 0;
  }

  v59 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v85];
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke;
  v111[3] = &unk_1E615D418;
  id v60 = v81;
  id v112 = v60;
  BOOL v116 = v83;
  id v61 = v59;
  id v113 = v61;
  v114 = self;
  id v62 = v82;
  id v115 = v62;
  [v101 enumerateKeysAndObjectsUsingBlock:v111];
  v63 = [MEMORY[0x1E4F1CA48] array];
  if ([v60 length])
  {
    id v64 = [(WBSSavedAccountStore *)self _allSharedSidecarsForGroupID:v60 fromRecentlyDeleted:v83];
    [(WBSSavedAccountStore *)self _matchSidecars:v64 toSavedAccountsWithPasswordsInDictionary:v62 unmatchedSidecars:v63];
    char v65 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      long long v66 = v65;
      uint64_t v67 = [v64 count];
      *(_DWORD *)buf = 136315650;
      v125 = "-[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAcc"
             "ountsWithPasswords:fromRecentlyDeleted:]";
      __int16 v126 = 2048;
      uint64_t v127 = v67;
      __int16 v128 = 2114;
      id v129 = v60;
      _os_log_impl(&dword_1B728F000, v66, OS_LOG_TYPE_DEFAULT, "%s: loaded %lu shared sidecar items from group %{public}@", buf, 0x20u);
    }
    long long v68 = [(WBSSavedAccountStore *)self _allPersonalSidecarsForGroupID:v60 fromRecentlyDeleted:v83];
    [(WBSSavedAccountStore *)self _matchSidecars:v68 toSavedAccountsWithPasswordsInDictionary:v62 unmatchedSidecars:v63];
    long long v69 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v70 = v69;
      uint64_t v71 = [v68 count];
      *(_DWORD *)buf = 136315650;
      v125 = "-[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAcc"
             "ountsWithPasswords:fromRecentlyDeleted:]";
      __int16 v126 = 2048;
      uint64_t v127 = v71;
      __int16 v128 = 2114;
      id v129 = v60;
      _os_log_impl(&dword_1B728F000, v70, OS_LOG_TYPE_DEFAULT, "%s: loaded %lu personal sidecar items from group %{public}@", buf, 0x20u);
    }
  }
  else
  {
    id v64 = [(WBSSavedAccountStore *)self _allPersonalSidecarsFromPersonalKeychainFromRecentlyDeleted:v83];
    [(WBSSavedAccountStore *)self _matchSidecars:v64 toSavedAccountsWithPasswordsInDictionary:v62 unmatchedSidecars:v63];
    long long v72 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_55;
    }
    long long v68 = v72;
    uint64_t v73 = [v64 count];
    *(_DWORD *)buf = 136315394;
    v125 = "-[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccou"
           "ntsWithPasswords:fromRecentlyDeleted:]";
    __int16 v126 = 2048;
    uint64_t v127 = v73;
    _os_log_impl(&dword_1B728F000, v68, OS_LOG_TYPE_DEFAULT, "%s: loaded %lu sidecar items from personal keychain", buf, 0x16u);
  }

LABEL_55:
  uint64_t v74 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v75 = v74;
    uint64_t v76 = [v63 count];
    *(_DWORD *)buf = 134217984;
    v125 = (const char *)v76;
    _os_log_impl(&dword_1B728F000, v75, OS_LOG_TYPE_DEFAULT, "%ld unmatched sidecars", buf, 0xCu);
  }
  long long v77 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
  {
    -[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:]();
    if (!v99) {
      goto LABEL_62;
    }
  }
  else if (!v99)
  {
    goto LABEL_62;
  }
  BOOL v78 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
    -[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:]();
  }
  [(WBSSavedAccountStore *)self _reportKeychainItemsWithInvalidAuthenticationTypesIfNeeded];
LABEL_62:
  id v79 = (void *)[v61 copy];

  return v79;
}

- (id)_allPersonalSidecarsFromPersonalKeychainFromRecentlyDeleted:(BOOL)a3
{
  if (a3)
  {
    uint64_t v3 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    id v4 = objc_msgSend(v3, "safari_allRecentlyDeletedPersonalSidecarsInPersonalKeychain");
  }
  else
  {
    id v4 = [(WBSSavedAccountStore *)self _allSidecarsFromPersonalKeychain];
  }
  return v4;
}

- (void)_matchSidecars:(id)a3 toSavedAccountsWithPasswordsInDictionary:(id)a4 unmatchedSidecars:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v39 = a4;
  id v35 = a5;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v55;
    uint64_t v36 = *(void *)v55;
    id v37 = self;
    do
    {
      uint64_t v12 = 0;
      uint64_t v38 = v10;
      do
      {
        if (*(void *)v55 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v54 + 1) + 8 * v12);
        uint64_t v14 = [v13 protectionSpace];
        int v15 = [v14 host];
        if ([(WBSSavedAccountStore *)self _shouldLoadCredentialRecordWithHostIntoAccountStore:v15])
        {
          id v16 = objc_msgSend(v15, "safari_highLevelDomainForPasswordManager");
          id v17 = [v39 objectForKeyedSubscript:v16];
          v44 = v13;
          [v13 user];
          uint64_t v19 = v18 = v11;
          [v17 objectForKeyedSubscript:v19];
          uint64_t v20 = v10;
          uint64_t v22 = v21 = self;

          uint64_t v11 = v18;
          __int16 v45 = (void *)v22;
          uint64_t v23 = (void *)v22;
          self = v21;
          uint64_t v10 = v20;
          id v24 = [v23 allValues];
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v25 = v24;
          uint64_t v42 = [v25 countByEnumeratingWithState:&v50 objects:v59 count:16];
          if (v42)
          {
            uint64_t v26 = *(void *)v51;
            long long v41 = v16;
            v43 = v25;
            do
            {
              for (uint64_t i = 0; i != v42; ++i)
              {
                if (*(void *)v51 != v26) {
                  objc_enumerationMutation(v25);
                }
                long long v28 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                long long v46 = 0u;
                long long v47 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                long long v29 = [v28 protectionSpaces];
                uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v58 count:16];
                if (v30)
                {
                  uint64_t v31 = v30;
                  uint64_t v32 = *(void *)v47;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v31; ++j)
                    {
                      if (*(void *)v47 != v32) {
                        objc_enumerationMutation(v29);
                      }
                      if ([*(id *)(*((void *)&v46 + 1) + 8 * j) isEqualToProtectionSpaceForPasswordManager:v14])
                      {
                        uint64_t v34 = [v14 host];
                        [v28 _addSidecar:v44 forSite:v34];

                        id v25 = v43;
                        uint64_t v11 = v36;
                        self = v37;
                        uint64_t v10 = v38;
                        id v16 = v41;
                        goto LABEL_24;
                      }
                    }
                    uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v58 count:16];
                    if (v31) {
                      continue;
                    }
                    break;
                  }
                }

                id v25 = v43;
              }
              uint64_t v11 = v36;
              self = v37;
              uint64_t v10 = v38;
              id v16 = v41;
              uint64_t v42 = [v43 countByEnumeratingWithState:&v50 objects:v59 count:16];
            }
            while (v42);
          }

          [v35 addObject:v44];
LABEL_24:
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v10);
  }
}

- (id)_allSidecarsFromPersonalKeychain
{
  uint64_t v2 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  uint64_t v3 = objc_msgSend(v2, "safari_allPersonalSidecarsInPersonalKeychain");

  return v3;
}

- (id)_mergeLoadedSavedAccounts:(id)a3 intoAllSavedAccounts:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  id v35 = a4;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v44;
    *(void *)&long long v6 = 138740227;
    long long v33 = v6;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v44 != v36) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "highLevelDomain", v33);

        if (v9)
        {
          uint64_t v38 = i;
          uint64_t v10 = [v8 highLevelDomain];
          long long v48 = v10;
          uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];

          uint64_t v12 = [v8 additionalSites];
          uint64_t v13 = objc_msgSend(v12, "safari_mapObjectsUsingBlock:", &__block_literal_global_237);
          uint64_t v14 = [v11 arrayByAddingObjectsFromArray:v13];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v40 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * j);
                uint64_t v21 = [(NSMutableDictionary *)self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts objectForKeyedSubscript:v20];
                if (!v21)
                {
                  uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
                  [(NSMutableDictionary *)self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts setObject:v21 forKeyedSubscript:v20];
                }
                uint64_t v22 = [v8 user];
                uint64_t v23 = [v21 objectForKeyedSubscript:v22];

                if (!v23)
                {
                  uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
                  id v24 = [v8 user];
                  [v21 setObject:v23 forKeyedSubscript:v24];
                }
                id v25 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "credentialTypes"));
                uint64_t v26 = [v23 objectForKeyedSubscript:v25];
                if (!v26)
                {
                  uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
                  [v23 setObject:v26 forKeyedSubscript:v25];
                }
                [v26 addObject:v8];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v17);
          }

          [v35 addObject:v8];
          uint64_t i = v38;
        }
        else
        {
          long long v27 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            long long v28 = v27;
            long long v29 = [v8 user];
            uint64_t v30 = [v8 protectionSpaces];
            *(_DWORD *)buf = v33;
            long long v50 = v29;
            __int16 v51 = 2117;
            long long v52 = v30;
            _os_log_error_impl(&dword_1B728F000, v28, OS_LOG_TYPE_ERROR, "Encountered saved account without high level domain with user: %{sensitive}@ protectionSpaces: %{sensitive}@", buf, 0x16u);
          }
        }
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v37);
  }
  uint64_t v31 = [obj sortedArrayUsingSelector:sel_compare_];

  return v31;
}

- (id)_allInternetPasswordEntriesFromPersonalKeychain
{
  uint64_t v2 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  uint64_t v3 = objc_msgSend(v2, "safari_allPasswordCredentialItemsInPersonalKeychain");

  return v3;
}

uint64_t __71__WBSSavedAccountStore__updateCachedSharedAccountGroupsOnInternalQueue__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSavedAccountStoreDidChangeNotification];
}

- (void)setShouldWarmDataStoreAfterReset:(BOOL)a3
{
  self->_shouldWarmDataStoreAfterReset = a3;
}

uint64_t __45__WBSSavedAccountStore__resetOnInternalQueue__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 261))
  {
    uint64_t v2 = result;
    [*(id *)(v1 + 232) invalidate];
    uint64_t v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:*(void *)(v2 + 32) target:sel__warmDataStoreAfterResetTimerFired_ selector:0 userInfo:0 repeats:3.0];
    uint64_t v4 = *(void *)(v2 + 32);
    BOOL v5 = *(void **)(v4 + 232);
    *(void *)(v4 + 232) = v3;

    long long v6 = *(void **)(*(void *)(v2 + 32) + 232);
    return [v6 setTolerance:0.3];
  }
  return result;
}

- (void)knownWebsiteNamesDidChange
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WBSSavedAccountStore_knownWebsiteNamesDidChange__block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setShouldShowServiceNamesForPasswordAndPasskeyItems:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__WBSSavedAccountStore_setShouldShowServiceNamesForPasswordAndPasskeyItems___block_invoke;
  v4[3] = &unk_1E615CB20;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

+ (WBSSavedAccountStore)sharedStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__WBSSavedAccountStore_sharedStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStore_onceToken_0 != -1) {
    dispatch_once(&sharedStore_onceToken_0, block);
  }
  uint64_t v2 = (void *)sharedStore_store;
  return (WBSSavedAccountStore *)v2;
}

void __69__WBSSavedAccountStore__performRecentlyDeletedMaintenanceIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 168) count])
  {
    uint64_t v2 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v4 = [v3 dateByAddingUnit:16 value:-30 toDate:v2 options:0];

    BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    long long v6 = [v5 valueForKey:@"DebugPasswordManagerRecentlyDeletedRecoveryWindowInMinutes"];

    if (v6)
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      uint64_t v8 = [v7 integerForKey:@"DebugPasswordManagerRecentlyDeletedRecoveryWindowInMinutes"];

      uint64_t v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v10 = [v9 dateByAddingUnit:64 value:-v8 toDate:v2 options:0];

      uint64_t v11 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v36 = v8;
        _os_log_impl(&dword_1B728F000, v11, OS_LOG_TYPE_DEFAULT, "Using debug recently deleted limit of %ld minutes", buf, 0xCu);
      }
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      [v12 removeObjectForKey:@"DebugPasswordManagerRecentlyDeletedRecoveryWindowInMinutes"];

      uint64_t v4 = (void *)v10;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 224) = 1;
    uint64_t v13 = (void *)[*(id *)(*(void *)(a1 + 32) + 168) copy];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v28 = a1;
      uint64_t v26 = v2;
      char v27 = 0;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v20 = objc_msgSend(v19, "lastModifiedDate", v26);
          uint64_t v21 = [v20 earlierDate:v4];

          if (v21 != v4)
          {
            uint64_t v22 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
            uint64_t v23 = objc_msgSend(v22, "safari_mostRecentLastModifiedDateForCredentialsOnSavedAccount:", v19);

            if (v23)
            {
              id v24 = [v4 earlierDate:v23];

              if (v24 != v4)
              {
                id v25 = WBS_LOG_CHANNEL_PREFIXPasswords();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B728F000, v25, OS_LOG_TYPE_DEFAULT, "Permanently deleting a saved account from Recently Deleted because it is more than 30 days old.", buf, 2u);
                }
                objc_msgSend(*(id *)(v28 + 32), "_removeCredentialTypes:forSavedAccount:", objc_msgSend(v19, "credentialTypes"), v19);
                char v27 = 1;
              }
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v16);

      *(unsigned char *)(*(void *)(v28 + 32) + 224) = 0;
      uint64_t v2 = v26;
      if (v27)
      {
        [*(id *)(v28 + 32) _resetOnInternalQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __69__WBSSavedAccountStore__performRecentlyDeletedMaintenanceIfNecessary__block_invoke_306;
        block[3] = &unk_1E615A768;
        block[4] = *(void *)(v28 + 32);
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
    else
    {

      *(unsigned char *)(*(void *)(a1 + 32) + 224) = 0;
    }
  }
}

- (NSArray)recentlyDeletedPasskeysDataOnInternalQueue
{
  return (NSArray *)sub_1B729E5AC(self, (uint64_t)a2, (uint64_t)sub_1B72AE3C4, 22);
}

- (NSArray)passkeysDataOnInternalQueue
{
  return (NSArray *)sub_1B729E5AC(self, (uint64_t)a2, (uint64_t)sub_1B72AE428, 12);
}

- (id)initPartialStoreForDomains:(id)a3 forTesting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(WBSAuthenticationServicesAgentProxy);
  [(WBSAuthenticationServicesAgentProxy *)v7 setDelegate:self];
  uint64_t v8 = [(WBSSavedAccountStore *)self initWithAuthenticationServicesAgentProxy:v7 shouldPrewarmSavedAccounts:0 limitedToDomains:v6 forTesting:v4];

  return v8;
}

void __120__WBSSavedAccountStore_initWithAuthenticationServicesAgentProxy_shouldPrewarmSavedAccounts_limitedToDomains_forTesting___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__WBSSavedAccountStore_initWithAuthenticationServicesAgentProxy_shouldPrewarmSavedAccounts_limitedToDomains_forTesting___block_invoke_2;
  block[3] = &unk_1E615A5D8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __120__WBSSavedAccountStore_initWithAuthenticationServicesAgentProxy_shouldPrewarmSavedAccounts_limitedToDomains_forTesting___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[224])
    {
      BOOL v4 = WeakRetained;
      char v3 = [WeakRetained _isMigratingKeychainItemsWithInvalidAuthenticationTypes];
      id v2 = v4;
      if ((v3 & 1) == 0)
      {
        [v4 reset];
        [v4 _postSavedAccountStoreDidChangeNotification];
        id v2 = v4;
      }
    }
  }
}

id __120__WBSSavedAccountStore_initWithAuthenticationServicesAgentProxy_shouldPrewarmSavedAccounts_limitedToDomains_forTesting___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    char v3 = [WeakRetained _diagnosticStateDictionary];
  }
  else
  {
    char v3 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)showServiceNamesInPasswordsEnabledKVOContext == a6) {
    [(WBSSavedAccountStore *)self _updateShowServiceNamesInPasswordsPreference];
  }
}

- (id)_diagnosticStateDictionary
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"number of saved accounts";
  char v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_savedAccounts, "count"));
  v10[0] = v3;
  v9[1] = @"number of passkeys in personal keychain";
  BOOL v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_passkeysDataInPersonalKeychain, "count"));
  v10[1] = v4;
  v9[2] = @"number of saved accounts with passwords";
  BOOL v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_savedAccountsWithPasswords, "count"));
  v10[2] = v5;
  v9[3] = @"number of personal keychain high level domains";
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts, "count"));
  v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (void)dealloc
{
  [(WBSKeychainCredentialNotificationMonitor *)self->_keychainMonitor removeObserverForToken:self->_keychainNotificationRegistrationToken];
  [(NSTimer *)self->_warmDataStoreAfterResetTimer invalidate];
  char v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WBSSavedAccountStore;
  [(WBSSavedAccountStore *)&v4 dealloc];
}

- (id)savedAccountForURLCredential:(id)a3 protectionSpace:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 user];
  uint64_t v9 = [v7 password];

  uint64_t v10 = [(WBSSavedAccountStore *)self _savedAccountForProtectionSpace:v6 user:v8 password:v9];

  return v10;
}

- (NSArray)savedAccountsInPersonalKeychain
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__15;
  uint64_t v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__WBSSavedAccountStore_savedAccountsInPersonalKeychain__block_invoke;
  v5[3] = &unk_1E615AE78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __55__WBSSavedAccountStore_savedAccountsInPersonalKeychain__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[16];
  if (!v3)
  {
    id v4 = (id)[v2 _loadSavedAccounts];
    id v3 = *(void **)(*(void *)(a1 + 32) + 128);
  }
  uint64_t v5 = [v3 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (NSArray)savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords
{
  id v2 = [(WBSSavedAccountStore *)self savedAccountsInPersonalKeychain];
  id v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_155);

  return (NSArray *)v3;
}

uint64_t __88__WBSSavedAccountStore_savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords__block_invoke(uint64_t a1, void *a2)
{
  return [a2 userIsNeverSaveMarker] ^ 1;
}

- (id)savedAccountsForGroupID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__15;
    uint64_t v17 = __Block_byref_object_dispose__15;
    id v18 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__WBSSavedAccountStore_savedAccountsForGroupID___block_invoke;
    block[3] = &unk_1E615BBE0;
    void block[4] = self;
    uint64_t v12 = &v13;
    id v11 = v4;
    dispatch_sync(queue, block);
    uint64_t v6 = (void *)v14[5];
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[WBSSavedAccountStore savedAccountsForGroupID:]();
      }
      id v7 = (id)MEMORY[0x1E4F1CBF0];
    }

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v7 = [(WBSSavedAccountStore *)self savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords];
  }

  return v7;
}

void __48__WBSSavedAccountStore_savedAccountsForGroupID___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (!*(void *)(v2 + 64))
  {
    id v3 = (id)[(id)v2 _loadSavedAccounts];
    uint64_t v2 = a1[4];
  }
  uint64_t v4 = [*(id *)(v2 + 136) objectForKeyedSubscript:a1[5]];
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)removeLegacyPlatformCredentialsForDomains:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__WBSSavedAccountStore_removeLegacyPlatformCredentialsForDomains___block_invoke;
  v7[3] = &unk_1E615A6C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __66__WBSSavedAccountStore_removeLegacyPlatformCredentialsForDomains___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[11]) {
    id v3 = (id)[v2 _loadSavedAccounts];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v17 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v4), "safari_highLevelDomainFromHost");
        id v6 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:v5];
        if (![v6 count])
        {

          goto LABEL_20;
        }
        id v18 = v5;
        uint64_t v19 = v4;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "safari_dataForKey:", @"CredentialID");
              uint64_t v13 = [v12 base64EncodedStringWithOptions:0];

              id v14 = [[WBSPublicKeyCredentialIdentifier alloc] initWithCredentialID:v13 groupID:&stru_1F105D3F0];
              [*(id *)(a1 + 32) deletePasskeyWithIdentifierOnInternalQueue:v14];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v9);
        }

        [*(id *)(*(void *)(a1 + 32) + 88) removeObjectForKey:v18];
        uint64_t v4 = v19 + 1;
      }
      while (v19 + 1 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_20:
}

- (void)savedAccountWithAllMetadataForURLCredential:(id)a3 protectionSpace:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(17, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__WBSSavedAccountStore_savedAccountWithAllMetadataForURLCredential_protectionSpace_completion___block_invoke;
  v15[3] = &unk_1E615D2E8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __95__WBSSavedAccountStore_savedAccountWithAllMetadataForURLCredential_protectionSpace_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  id v2 = [*(id *)(a1 + 32) savedAccountWithAllMetadataForURLCredential:*(void *)(a1 + 40) protectionSpace:*(void *)(a1 + 48)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)savedAccountWithAllMetadataForURLCredential:(id)a3 protectionSpace:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = a4;
  id v7 = [v6 user];
  id v8 = [v6 password];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = [(WBSSavedAccountStore *)self savedAccountsWithPasswords];
  id v10 = (id)[v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v21 = v6;
    uint64_t v11 = *(void *)v25;
    while (1)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (([v13 userIsNeverSaveMarker] & 1) == 0)
        {
          id v14 = [v13 user];
          if (![v14 isEqualToString:v7]) {
            goto LABEL_12;
          }
          uint64_t v15 = [v13 password];
          if (([v15 isEqualToString:v8] & 1) == 0)
          {

LABEL_12:
            continue;
          }
          [v13 protectionSpaces];
          id v16 = v9;
          id v17 = v7;
          uint64_t v19 = v18 = v8;
          char v23 = [v19 containsObject:v22];

          id v8 = v18;
          id v7 = v17;
          id v9 = v16;

          if (v23)
          {
            id v10 = v13;
            goto LABEL_15;
          }
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v10)
      {
LABEL_15:
        id v6 = v21;
        break;
      }
    }
  }

  return v10;
}

- (id)savedAccountForURL:(id)a3 user:(id)a4 password:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F18D98];
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = objc_msgSend(v8, "safari_HTMLFormProtectionSpaceForURL:", a3);
  id v12 = [(WBSSavedAccountStore *)self _savedAccountForProtectionSpace:v11 user:v10 password:v9];

  return v12;
}

- (id)_savedAccountForProtectionSpace:(id)a3 user:(id)a4 password:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [a3 host];
  id v10 = objc_msgSend(v9, "safari_highLevelDomainForPasswordManager");

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v13 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  id v14 = objc_msgSend(v13, "safari_allSafariCredentials");
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __70__WBSSavedAccountStore__savedAccountForProtectionSpace_user_password___block_invoke;
  v38[3] = &unk_1E615D310;
  id v15 = v10;
  id v39 = v15;
  id v16 = v7;
  id v40 = v16;
  id v17 = v8;
  id v41 = v17;
  id v18 = v11;
  id v42 = v18;
  id v19 = v12;
  id v43 = v19;
  [v14 enumerateKeysAndObjectsUsingBlock:v38];

  long long v32 = v15;
  long long v33 = v16;
  long long v31 = v17;
  id v20 = [[WBSSavedAccount alloc] _initWithHighLevelDomain:v15 user:v16 password:v17];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v21 = v18;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v27 = [v26 host];
        if ([v19 containsObject:v27])
        {
          uint64_t v28 = objc_msgSend(v26, "safari_addressString");
          objc_msgSend(v28, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 0, 0);
          id v29 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v29 = v27;
        }
        objc_msgSend(v20, "_addProtectionSpace:forSite:isDefaultCredentialForSite:", v26, v29, objc_msgSend(v20, "isDefaultCredentialForFullyQualifiedHostname:", v27));
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v23);
  }

  return v20;
}

void __70__WBSSavedAccountStore__savedAccountForProtectionSpace_user_password___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id v6 = [v15 host];
  id v7 = objc_msgSend(v6, "safari_highLevelDomainForPasswordManager");
  int v8 = objc_msgSend(v7, "safari_isCaseInsensitiveEqualToString:", *(void *)(a1 + 32));

  if (v8)
  {
    id v9 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 password];
      int v12 = [v11 isEqualToString:*(void *)(a1 + 48)];

      if (v12)
      {
        [*(id *)(a1 + 56) addObject:v15];
      }
      else
      {
        id v13 = *(void **)(a1 + 64);
        id v14 = [v15 host];
        [v13 addObject:v14];
      }
    }
  }
}

- (id)savedAccountsForPersistentIdentifiers:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  id v5 = [(WBSSavedAccountStore *)self savedAccountsWithPasswords];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__WBSSavedAccountStore_savedAccountsForPersistentIdentifiers___block_invoke;
  v9[3] = &unk_1E615D338;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v9);

  return v7;
}

uint64_t __62__WBSSavedAccountStore_savedAccountsForPersistentIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(a2, "persistentIdentifiersForWarningManager", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(a1 + 32) containsObject:*(void *)(*((void *)&v10 + 1) + 8 * v7)])
        {
          uint64_t v8 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return v8;
}

+ (void)removeCredentialTypes:(int64_t)a3 forSavedAccount:(id)a4 forGroup:(id)a5
{
  char v6 = a3;
  id v11 = a4;
  id v7 = a5;
  uint64_t v8 = v7;
  if (v6)
  {
    id v9 = [v7 groupID];
    [v11 _deletePasswordCredentialsForGroupID:v9];
  }
  if ((v6 & 2) != 0)
  {
    long long v10 = [v8 groupID];
    [v11 _deletePasskeyCredentialForGroupID:v10];
  }
}

- (id)_allPersonalSidecarsForGroupID:(id)a3 fromRecentlyDeleted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (void *)MEMORY[0x1E4F18D90];
  id v6 = a3;
  id v7 = [v5 sharedCredentialStorage];
  uint64_t v8 = objc_msgSend(v7, "safari_allPersonalSidecarsForGroupID:fromRecentlyDeleted:", v6, v4);

  return v8;
}

- (id)_allSharedSidecarsForGroupID:(id)a3 fromRecentlyDeleted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (void *)MEMORY[0x1E4F18D90];
  id v6 = a3;
  id v7 = [v5 sharedCredentialStorage];
  uint64_t v8 = objc_msgSend(v7, "safari_allSharedSidecarsForGroupID:fromRecentlyDeleted:", v6, v4);

  return v8;
}

- (NSArray)savedAccountsWithTOTPGenerators
{
  id v2 = [(WBSSavedAccountStore *)self savedAccountsWithPasswords];
  id v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_167);

  return (NSArray *)v3;
}

BOOL __55__WBSSavedAccountStore_savedAccountsWithTOTPGenerators__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 totpGenerators];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)savedAccountsWithPasswordsExcludingNeverSaveMarkerPasswords
{
  id v2 = [(WBSSavedAccountStore *)self savedAccountsWithPasswords];
  BOOL v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_169);

  return (NSArray *)v3;
}

uint64_t __83__WBSSavedAccountStore_savedAccountsWithPasswordsExcludingNeverSaveMarkerPasswords__block_invoke(uint64_t a1, void *a2)
{
  return [a2 userIsNeverSaveMarker] ^ 1;
}

- (NSSet)highLevelDomainsOfAllSavedAccountsWithPasswordsExcludingNeverSaveMarkerPasswords
{
  id v2 = [(WBSSavedAccountStore *)self savedAccountsWithPasswordsExcludingNeverSaveMarkerPasswords];
  BOOL v3 = objc_msgSend(v2, "safari_setByApplyingBlock:", &__block_literal_global_172);

  return (NSSet *)v3;
}

uint64_t __104__WBSSavedAccountStore_highLevelDomainsOfAllSavedAccountsWithPasswordsExcludingNeverSaveMarkerPasswords__block_invoke(uint64_t a1, void *a2)
{
  return [a2 highLevelDomain];
}

- (WBSAuthenticationServicesAgentProxy)authenticationServicesAgentProxy
{
  return self->_authenticationServicesAgentProxy;
}

- (NSArray)savedAccountsExcludingNeverSaveMarkerPasswords
{
  id v2 = [(WBSSavedAccountStore *)self savedAccounts];
  BOOL v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_174);

  return (NSArray *)v3;
}

uint64_t __70__WBSSavedAccountStore_savedAccountsExcludingNeverSaveMarkerPasswords__block_invoke(uint64_t a1, void *a2)
{
  return [a2 userIsNeverSaveMarker] ^ 1;
}

- (NSSet)highLevelDomainsOfAllSavedAccountsExcludingNeverSaveMarkerPasswords
{
  id v2 = [(WBSSavedAccountStore *)self savedAccountsExcludingNeverSaveMarkerPasswords];
  BOOL v3 = objc_msgSend(v2, "safari_setByApplyingBlock:", &__block_literal_global_176);

  return (NSSet *)v3;
}

uint64_t __91__WBSSavedAccountStore_highLevelDomainsOfAllSavedAccountsExcludingNeverSaveMarkerPasswords__block_invoke(uint64_t a1, void *a2)
{
  return [a2 highLevelDomain];
}

- (NSSet)highLevelDomainsOfRecentlyDeletedAccounts
{
  id v2 = [(WBSSavedAccountStore *)self allRecentlyDeletedSavedAccounts];
  BOOL v3 = objc_msgSend(v2, "safari_setByApplyingBlock:", &__block_literal_global_178);

  return (NSSet *)v3;
}

uint64_t __65__WBSSavedAccountStore_highLevelDomainsOfRecentlyDeletedAccounts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 highLevelDomain];
}

- (id)highLevelDomainsOfSavedAccountsExcludingNeverSaveMarkerPasswordsForGroupID:(id)a3
{
  BOOL v3 = [(WBSSavedAccountStore *)self savedAccountsForGroupID:a3];
  BOOL v4 = objc_msgSend(v3, "safari_setByApplyingBlock:", &__block_literal_global_180);

  return v4;
}

id __99__WBSSavedAccountStore_highLevelDomainsOfSavedAccountsExcludingNeverSaveMarkerPasswordsForGroupID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 userIsNeverSaveMarker])
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [v2 highLevelDomain];
  }

  return v3;
}

- (void)_warmDataStoreAfterResetTimerFired:(id)a3
{
  [(WBSSavedAccountStore *)self _prewarm];
  [(NSTimer *)self->_warmDataStoreAfterResetTimer invalidate];
  warmDataStoreAfterResetTimer = self->_warmDataStoreAfterResetTimer;
  self->_warmDataStoreAfterResetTimer = 0;
}

- (NSArray)savedAccountsWithPasswords
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__15;
  long long v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__WBSSavedAccountStore_savedAccountsWithPasswords__block_invoke;
  v5[3] = &unk_1E615A970;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __50__WBSSavedAccountStore_savedAccountsWithPasswords__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _savedAccountsWithPasswords];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)savedAccounts
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__15;
  id v14 = __Block_byref_object_dispose__15;
  id v15 = 0;
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[WBSSavedAccountStore savedAccounts]";
    _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_DEFAULT, "%s: Loading saved accounts", buf, 0xCu);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__WBSSavedAccountStore_savedAccounts__block_invoke;
  v9[3] = &unk_1E615A970;
  void v9[4] = self;
  void v9[5] = &v10;
  dispatch_sync(queue, v9);
  uint64_t v5 = (id)WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(id)v11[5] count];
    *(_DWORD *)buf = 136315394;
    id v17 = "-[WBSSavedAccountStore savedAccounts]";
    __int16 v18 = 2048;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEFAULT, "%s: Loading completed with %lu saved accounts", buf, 0x16u);
  }

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSArray *)v7;
}

void __37__WBSSavedAccountStore_savedAccounts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _savedAccounts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)savedAccountsWithNeverSaveMarker
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__15;
  uint64_t v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__WBSSavedAccountStore_savedAccountsWithNeverSaveMarker__block_invoke;
  v5[3] = &unk_1E615AE78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __56__WBSSavedAccountStore_savedAccountsWithNeverSaveMarker__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[7])
  {
    id v3 = (void *)v2[7];
  }
  else
  {
    id v4 = (id)[v2 _loadSavedAccounts];
    id v3 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  uint64_t v5 = [v3 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_savedAccountsWithPasswords
{
  savedAccountsWithPasswords = self->_savedAccountsWithPasswords;
  if (!savedAccountsWithPasswords)
  {
    id v4 = [(WBSSavedAccountStore *)self _loadSavedAccounts];
    savedAccountsWithPasswords = self->_savedAccountsWithPasswords;
  }
  uint64_t v5 = savedAccountsWithPasswords;
  return v5;
}

- (void)_ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue
{
  if (!self->_allRecentlyDeletedSavedAccounts) {
    [(WBSSavedAccountStore *)self _loadRecentlyDeletedSavedAccounts];
  }
}

- (NSArray)allRecentlyDeletedSavedAccounts
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__15;
  uint64_t v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__WBSSavedAccountStore_allRecentlyDeletedSavedAccounts__block_invoke;
  v5[3] = &unk_1E615AE78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __55__WBSSavedAccountStore_allRecentlyDeletedSavedAccounts__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 168) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)recentlyDeletedSavedAccountsInPersonalKeychain
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__15;
  uint64_t v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__WBSSavedAccountStore_recentlyDeletedSavedAccountsInPersonalKeychain__block_invoke;
  v5[3] = &unk_1E615AE78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __70__WBSSavedAccountStore_recentlyDeletedSavedAccountsInPersonalKeychain__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 176) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)sharingGroupsWithSavedAccounts
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__15;
  uint64_t v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__WBSSavedAccountStore_sharingGroupsWithSavedAccounts__block_invoke;
  v5[3] = &unk_1E615AE78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __54__WBSSavedAccountStore_sharingGroupsWithSavedAccounts__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDomainsToUsersExists];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 144);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__WBSSavedAccountStore_sharingGroupsWithSavedAccounts__block_invoke_2;
  v7[3] = &unk_1E615BB40;
  v7[4] = v2;
  uint64_t v4 = objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

BOOL __54__WBSSavedAccountStore_sharingGroupsWithSavedAccounts__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 136);
  id v3 = [a2 groupID];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (NSArray)sharingGroupsWithRecentlyDeletedSavedAccounts
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__15;
  uint64_t v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__WBSSavedAccountStore_sharingGroupsWithRecentlyDeletedSavedAccounts__block_invoke;
  v5[3] = &unk_1E615AE78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __69__WBSSavedAccountStore_sharingGroupsWithRecentlyDeletedSavedAccounts__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 144);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__WBSSavedAccountStore_sharingGroupsWithRecentlyDeletedSavedAccounts__block_invoke_2;
  v7[3] = &unk_1E615BB40;
  v7[4] = v2;
  uint64_t v4 = objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

BOOL __69__WBSSavedAccountStore_sharingGroupsWithRecentlyDeletedSavedAccounts__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 192);
  id v3 = [a2 groupID];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (id)recentlyDeletedSavedAccountsForGroupWithID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__15;
  id v16 = __Block_byref_object_dispose__15;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WBSSavedAccountStore_recentlyDeletedSavedAccountsForGroupWithID___block_invoke;
  block[3] = &unk_1E615BBE0;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __67__WBSSavedAccountStore_recentlyDeletedSavedAccountsForGroupWithID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 192) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)_shouldLoadCredentialRecordWithHostIntoAccountStore:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_domainsStoreIsLimitedTo count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = self->_domainsStoreIsLimitedTo;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(v4, "safari_isHostOrSubdomainOfHost:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

void __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((unint64_t)[v6 count] < 2)
  {
    char v10 = 0;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_2;
    v62[3] = &unk_1E615CE50;
    id v9 = v8;
    id v63 = v9;
    [v6 enumerateKeysAndObjectsUsingBlock:v62];
    if ([v9 count] == 1)
    {
      char v10 = 0;
    }
    else
    {
      id v42 = v7;
      uint64_t v43 = a1;
      id v44 = v6;
      id v40 = v9;
      id v11 = v9;
      id v41 = v5;
      id v12 = v5;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v64 objects:v70 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        p_class_meths = &OBJC_PROTOCOL___WBSPasswordsNotificationManagerDelegate.class_meths;
        uint64_t v17 = *(void *)v65;
        while (2)
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v65 != v17) {
              objc_enumerationMutation(v13);
            }
            uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * v18), "substringToIndex:", objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * v18), "length") - objc_msgSend(v12, "length"));
            if ([v19 length])
            {
              id v20 = v19;
              if (p_class_meths[351] != (__objc2_meth_list *)-1) {
                dispatch_once(&setOfUninterestingSubdomains_onceToken, &__block_literal_global_763);
              }
              if ([(id)setOfUninterestingSubdomains_set containsObject:v20])
              {
              }
              else
              {
                if (numberedSubdomainRegexp_onceToken != -1) {
                  dispatch_once(&numberedSubdomainRegexp_onceToken, &__block_literal_global_840);
                }
                id v21 = (id)numberedSubdomainRegexp_regexp;
                uint64_t v22 = objc_msgSend(v21, "firstMatchInString:options:range:", v20, 0, 0, objc_msgSend(v20, "length"));

                p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___WBSPasswordsNotificationManagerDelegate + 32);
                if (!v22)
                {

                  char v10 = 1;
                  goto LABEL_22;
                }
              }
            }

            ++v18;
          }
          while (v15 != v18);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v64 objects:v70 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      char v10 = 0;
LABEL_22:
      a1 = v43;
      id v6 = v44;
      id v5 = v41;
      id v7 = v42;
      id v9 = v40;
    }
  }
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_5;
  v53[3] = &unk_1E615D3F0;
  char v60 = v10;
  id v23 = v5;
  id v54 = v23;
  id v55 = *(id *)(a1 + 32);
  char v61 = *(unsigned char *)(a1 + 64);
  id v56 = *(id *)(a1 + 40);
  id v24 = v7;
  uint64_t v25 = *(void *)(a1 + 48);
  long long v26 = *(void **)(a1 + 56);
  id v57 = v24;
  uint64_t v58 = v25;
  id v59 = v26;
  [v6 enumerateKeysAndObjectsUsingBlock:v53];
  if ((unint64_t)[v24 count] >= 2)
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v28 = v24;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v69 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v50;
LABEL_27:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v50 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = *(void **)(*((void *)&v49 + 1) + 8 * v32);
        if (![v33 shouldShowSpecificSubdomainForUserVisibleDomain]) {
          break;
        }
        long long v34 = [v33 userVisibleDomain];
        [v27 addObject:v34];

        if (v30 == ++v32)
        {
          uint64_t v30 = [v28 countByEnumeratingWithState:&v49 objects:v69 count:16];
          if (v30) {
            goto LABEL_27;
          }
          goto LABEL_33;
        }
      }
    }
    else
    {
LABEL_33:

      if ([v27 count] != 1)
      {
LABEL_42:

        goto LABEL_43;
      }
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v35 = v28;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v45 objects:v68 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v46 != v38) {
              objc_enumerationMutation(v35);
            }
            [*(id *)(*((void *)&v45 + 1) + 8 * i) setShouldShowSpecificSubdomainForUserVisibleDomain:0];
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v45 objects:v68 count:16];
        }
        while (v37);
      }
    }

    goto LABEL_42;
  }
LABEL_43:
}

void __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_3;
  v4[3] = &unk_1E615D380;
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_189);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObjectsFromArray:v4];
}

id __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 protectionSpace];
  uint64_t v3 = [v2 host];

  return v3;
}

void __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_6;
  v31[3] = &unk_1E615D380;
  id v8 = v7;
  id v32 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v31];
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)(a1 + 80)) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = (unint64_t)[v6 count] > 1;
  }
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_8;
  id v20 = &unk_1E615D3C8;
  id v21 = *(id *)(a1 + 32);
  id v11 = v5;
  id v22 = v11;
  id v12 = v8;
  id v23 = v12;
  id v13 = v9;
  id v24 = v13;
  id v25 = *(id *)(a1 + 40);
  char v29 = *(unsigned char *)(a1 + 81);
  id v26 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  BOOL v30 = v10;
  uint64_t v15 = *(void *)(a1 + 64);
  id v27 = v14;
  uint64_t v28 = v15;
  [v6 enumerateKeysAndObjectsUsingBlock:&v17];
  id v16 = objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", *(void *)(a1 + 32), v17, v18, v19, v20);
  if (!v16)
  {
    id v16 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(a1 + 72) setObject:v16 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  [v16 setObject:v13 forKeyedSubscript:v11];
}

void __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_194);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObjectsFromArray:v4];
}

id __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 protectionSpace];
  uint64_t v3 = [v2 host];

  return v3;
}

void __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v20 = v5;
  id v7 = [[WBSSavedAccount alloc] _initWithHighLevelDomain:*(void *)(a1 + 32) user:*(void *)(a1 + 40) password:v5];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [v12 protectionSpace];
        id v14 = [v13 host];
        if ([*(id *)(a1 + 48) countForObject:v14] == 1)
        {
          id v15 = v14;
        }
        else
        {
          id v16 = objc_msgSend(v13, "safari_addressString");
          objc_msgSend(v16, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 0, 0);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v7, "_addProtectionSpace:forSite:isDefaultCredentialForSite:", v13, v15, objc_msgSend(v12, "isDefaultCredentialForProtectionSpace"));
        uint64_t v17 = [v12 modificationDate];
        [v7 _addPasswordCredentialModificationDate:v17];

        uint64_t v18 = [v12 creationDate];
        [v7 _addPasswordCredentialCreationDate:v18];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  uint64_t v19 = objc_msgSend(obj, "safari_mapObjectsUsingBlock:", &__block_literal_global_197);
  [v7 setPersistentIdentifiersForWarningManager:v19];
  [*(id *)(a1 + 56) setObject:v7 forKeyedSubscript:v20];
  [v7 setSharedGroupID:*(void *)(a1 + 64)];
  [v7 setIsRecentlyDeleted:*(unsigned __int8 *)(a1 + 96)];
  [*(id *)(a1 + 72) addObject:v7];
  [*(id *)(a1 + 80) addObject:v7];
  if (*(unsigned char *)(a1 + 97)) {
    [v7 setShouldShowSpecificSubdomainForUserVisibleDomain:1];
  }
  if (([v7 userIsNeverSaveMarker] & 1) == 0) {
    *(unsigned char *)(*(void *)(a1 + 88) + 258) = 1;
  }
}

uint64_t __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 persistentIdentifier];
}

- (void)_reportKeychainItemsWithInvalidAuthenticationTypesIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v4 = objc_msgSend(v3, "safari_dateForKey:", @"LastInvalidAuthTypeMigrationDate");

  if (!v4) {
    goto LABEL_7;
  }
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  id v7 = [v5 dateByAddingUnit:16 value:-7 toDate:v6 options:0];

  if (!objc_msgSend(v7, "safari_isEarlierThanDate:", v4))
  {

LABEL_7:
    uint64_t v9 = dispatch_get_global_queue(17, 0);
    dispatch_async(v9, &__block_literal_global_201);

    [(WBSSavedAccountStore *)self _migratePasswordsWithInvalidAuthenticationTypes];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v11 = [MEMORY[0x1E4F1C9C8] now];
    objc_msgSend(v10, "safari_setDate:forKey:", v11, @"LastInvalidAuthTypeMigrationDate");

    goto LABEL_8;
  }
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    uint64_t v13 = 7;
    _os_log_impl(&dword_1B728F000, v8, OS_LOG_TYPE_DEFAULT, "Skipping invalid auth type migration because the migration has already run in the past %lu days.", (uint8_t *)&v12, 0xCu);
  }

LABEL_8:
}

void __82__WBSSavedAccountStore__reportKeychainItemsWithInvalidAuthenticationTypesIfNeeded__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __82__WBSSavedAccountStore__reportKeychainItemsWithInvalidAuthenticationTypesIfNeeded__block_invoke_cold_1();
  }
}

uint64_t __42__WBSSavedAccountStore__loadSavedAccounts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 credentialTypes] & 1;
}

void __53__WBSSavedAccountStore__fetchSignInWithAppleAccounts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__WBSSavedAccountStore__fetchSignInWithAppleAccounts__block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 120);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__WBSSavedAccountStore__fetchSignInWithAppleAccounts__block_invoke_213;
    v11[3] = &unk_1E615A6C8;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = v9;
    uint64_t v13 = v10;
    dispatch_async(v8, v11);
  }
}

uint64_t __53__WBSSavedAccountStore__fetchSignInWithAppleAccounts__block_invoke_213(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    int v6 = 134217984;
    uint64_t v7 = [v3 count];
    _os_log_impl(&dword_1B728F000, v4, OS_LOG_TYPE_DEFAULT, "Successfully fetched '%lu' Sign in with Apple accounts.", (uint8_t *)&v6, 0xCu);
  }
  return [*(id *)(a1 + 40) _updateCachedSignInWithAppleAccountsOnInternalQueueWithAccounts:*(void *)(a1 + 32)];
}

- (void)_updateCachedSignInWithAppleAccountsOnInternalQueueWithAccounts:(id)a3
{
  id v4 = [(WBSSavedAccountStore *)self _convertSignInWithAppleAccountsToSavedAccounts:a3];
  savedAccounts = self->_savedAccounts;
  if (!savedAccounts) {
    savedAccounts = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  int v6 = savedAccounts;
  uint64_t v7 = [(NSArray *)v6 safari_filterObjectsUsingBlock:&__block_literal_global_216];
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  char v10 = [v8 isEqualToSet:v9];

  if ((v10 & 1) == 0)
  {
    id v11 = (NSArray *)[v4 copy];
    savedAccountsWithSignInWithAppleRecords = self->_savedAccountsWithSignInWithAppleRecords;
    self->_savedAccountsWithSignInWithAppleRecords = v11;

    uint64_t v13 = [(NSArray *)v6 safari_filterObjectsUsingBlock:&__block_literal_global_218];
    if ([(NSArray *)self->_savedAccountsWithSignInWithAppleRecords count])
    {
      uint64_t v14 = [v13 arrayByAddingObjectsFromArray:self->_savedAccountsWithSignInWithAppleRecords];

      int v6 = (NSArray *)v14;
    }
    id v15 = [(NSArray *)v6 sortedArrayUsingSelector:sel_compare_];
    id v16 = self->_savedAccounts;
    self->_savedAccounts = v15;

    uint64_t v17 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B728F000, v17, OS_LOG_TYPE_DEFAULT, "Merging Sign in with Apple accounts into all saved accounts", buf, 2u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__WBSSavedAccountStore__updateCachedSignInWithAppleAccountsOnInternalQueueWithAccounts___block_invoke_219;
    block[3] = &unk_1E615A768;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

unint64_t __88__WBSSavedAccountStore__updateCachedSignInWithAppleAccountsOnInternalQueueWithAccounts___block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 credentialTypes] >> 2) & 1;
}

BOOL __88__WBSSavedAccountStore__updateCachedSignInWithAppleAccountsOnInternalQueueWithAccounts___block_invoke_2(uint64_t a1, void *a2)
{
  return ([a2 credentialTypes] & 3) != 0;
}

uint64_t __88__WBSSavedAccountStore__updateCachedSignInWithAppleAccountsOnInternalQueueWithAccounts___block_invoke_219(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSavedAccountStoreDidChangeNotification];
}

- (id)_convertSignInWithAppleAccountsToSavedAccounts:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "localizedAppName", (void)v17);
        uint64_t v12 = [v11 length];

        if (v12)
        {
          id v13 = [[WBSSavedAccount alloc] _initWithSignInWithAppleAccount:v10];
          [v4 addObject:v13];
        }
        else
        {
          uint64_t v14 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[WBSSavedAccountStore _convertSignInWithAppleAccountsToSavedAccounts:](&v21, v14, v10, &v22);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  id v15 = (void *)[v4 copy];
  return v15;
}

- (void)_signInWithApplePushNotificationReceived:(id)a3
{
  id v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B728F000, v4, OS_LOG_TYPE_DEFAULT, "Sign in with Apple accounts changed push notification received, reloading accounts", v5, 2u);
  }
  [(WBSSavedAccountStore *)self _fetchSignInWithAppleAccounts];
}

- (BOOL)_moveSignInWithAppleSavedAccount:(id)a3 toGroupID:(id)a4
{
  id v5 = a3;
  id v28 = a4;
  id v31 = v5;
  uint64_t v6 = [v5 signInWithAppleAccount];
  uint64_t v7 = [MEMORY[0x1E4F4EF40] sharedInstance];
  uint64_t v8 = [v7 primaryAuthKitAccount];

  id v9 = [MEMORY[0x1E4F4EF40] sharedInstance];
  char v10 = [v9 altDSIDForAccount:v8];

  id v11 = +[WBSOngoingSharingGroupProvider sharedProvider];
  uint64_t v12 = [v11 currentUserParticipantID];

  id v13 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  uint64_t v14 = [MEMORY[0x1E4F4EF40] sharedInstance];
  id v15 = [v14 familyNameForAccount:v8];
  [v13 setFamilyName:v15];

  id v16 = [MEMORY[0x1E4F4EF40] sharedInstance];
  char v29 = (void *)v8;
  long long v17 = [v16 givenNameForAccount:v8];
  [v13 setGivenName:v17];

  id v18 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  long long v19 = [v18 stringFromPersonNameComponents:v13];
  BOOL v30 = (void *)v12;
  long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F4F0B0]) initWithGroupID:v28 participantID:v12 participantName:v19];
  int v21 = (void *)[objc_alloc(MEMORY[0x1E4F4F0C0]) initWithAltDSID:v10];
  [v21 setSignInWithAppleAccount:v6];
  long long v33 = v6;
  uint64_t v22 = [v6 shareInfo];
  long long v23 = [v22 groupID];
  [v21 setCurrentGroupID:v23];

  uint64_t v24 = [v28 length];
  if (v24)
  {
    long long v25 = v31;
    BOOL v26 = [(WBSSavedAccountStore *)self _shareSignInWithAppleAccountWithContext:v21 withGroupInfo:v20 savedAccount:v31];
  }
  else
  {
    BOOL v26 = [(WBSSavedAccountStore *)self _unshareSignInWithAppleAccountWithContext:v21];
    long long v25 = v31;
  }

  return v26;
}

- (BOOL)_shareSignInWithAppleAccountWithContext:(id)a3 withGroupInfo:(id)a4 savedAccount:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F4F0B8]);
  id v11 = dispatch_group_create();
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  dispatch_group_enter(v11);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__WBSSavedAccountStore__shareSignInWithAppleAccountWithContext_withGroupInfo_savedAccount___block_invoke;
  v17[3] = &unk_1E615D468;
  long long v20 = &v21;
  id v12 = v9;
  id v18 = v12;
  id v13 = v11;
  long long v19 = v13;
  [v10 shareAccountWithContext:v7 withGroup:v8 completion:v17];
  dispatch_time_t v14 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v13, v14);
  char v15 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v15;
}

void __91__WBSSavedAccountStore__shareSignInWithAppleAccountWithContext_withGroupInfo_savedAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91__WBSSavedAccountStore__shareSignInWithAppleAccountWithContext_withGroupInfo_savedAccount___block_invoke_cold_1();
    }
    char v9 = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1B728F000, v8, OS_LOG_TYPE_DEFAULT, "Successfully shared Sign in with Apple Account.", v10, 2u);
    }
    [*(id *)(a1 + 32) setSignInWithAppleAccount:v5];
    char v9 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)unshareSignInWithAppleSavedAccount:(id)a3
{
  return [(WBSSavedAccountStore *)self _moveSignInWithAppleSavedAccount:a3 toGroupID:0];
}

- (BOOL)_unshareSignInWithAppleAccountWithContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F4F0B8]);
  id v5 = dispatch_group_create();
  uint64_t v13 = 0;
  dispatch_time_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  dispatch_group_enter(v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__WBSSavedAccountStore__unshareSignInWithAppleAccountWithContext___block_invoke;
  v10[3] = &unk_1E615D490;
  id v12 = &v13;
  id v6 = v5;
  id v11 = v6;
  [v4 unshareAccountWithContext:v3 completion:v10];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v6, v7);
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __66__WBSSavedAccountStore__unshareSignInWithAppleAccountWithContext___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = WBS_LOG_CHANNEL_PREFIXPasswords();
  dispatch_time_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __66__WBSSavedAccountStore__unshareSignInWithAppleAccountWithContext___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v8 = 0;
    _os_log_impl(&dword_1B728F000, v7, OS_LOG_TYPE_DEFAULT, "Successfully unshared Sign in with Apple Account.", v8, 2u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)exportPasskeyCredentialWithID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__15;
  char v16 = __Block_byref_object_dispose__15;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WBSSavedAccountStore_exportPasskeyCredentialWithID___block_invoke;
  block[3] = &unk_1E615A6F0;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__WBSSavedAccountStore_exportPasskeyCredentialWithID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) exportPasskeyCredentialWithIDOnInternalQueue:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __57__WBSSavedAccountStore__loadRecentlyDeletedSavedAccounts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 groupID];
}

void __51__WBSSavedAccountStore__fetchAndFilterPasskeysData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v8 = 136315650;
    char v9 = "-[WBSSavedAccountStore _fetchAndFilterPasskeysData]_block_invoke";
    __int16 v10 = 2048;
    uint64_t v11 = [v5 count];
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1B728F000, v7, OS_LOG_TYPE_DEFAULT, "%s: Loaded %zu passkey keychain records from group %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

void __66__WBSSavedAccountStore__fetchAndFilterRecentlyDeletedPasskeysData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v8 = 136315650;
    char v9 = "-[WBSSavedAccountStore _fetchAndFilterRecentlyDeletedPasskeysData]_block_invoke";
    __int16 v10 = 2048;
    uint64_t v11 = [v5 count];
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1B728F000, v7, OS_LOG_TYPE_DEFAULT, "%s: Loaded %zu recently deleted passkey keychain records from group %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __71__WBSSavedAccountStore__mergeLoadedSavedAccounts_intoAllSavedAccounts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_highLevelDomainForPasswordManager");
}

- (void)_removeSavedAccount:(id)a3 fromCachedCollectionsForCredentialTypes:(int64_t)a4
{
  id v23 = a3;
  BOOL v6 = -[NSArray containsObject:](self->_savedAccountsWithPasswords, "containsObject:");
  if ((a4 & 1) != 0 && v6)
  {
    personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    int v8 = [v23 highLevelDomain];
    char v9 = [(NSMutableDictionary *)personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts objectForKeyedSubscript:v8];

    __int16 v10 = [v23 user];
    uint64_t v11 = [v9 objectForKeyedSubscript:v10];

    __int16 v12 = [v23 password];
    [v11 removeObjectForKey:v12];

    id v13 = (void *)[(NSArray *)self->_savedAccountsWithPasswords mutableCopy];
    [v13 removeObject:v23];
    uint64_t v14 = (NSArray *)[v13 copy];
    savedAccountsWithPasswords = self->_savedAccountsWithPasswords;
    self->_savedAccountsWithPasswords = v14;
  }
  if ([(NSArray *)self->_savedAccounts containsObject:v23])
  {
    uint64_t v16 = [v23 credentialTypes];
    if (v16 == ([v23 credentialTypes] & a4))
    {
      if ([v23 credentialTypes] == 4)
      {
        id v17 = (void *)[(NSArray *)self->_savedAccountsWithSignInWithAppleRecords mutableCopy];
        [v17 removeObject:v23];
        id v18 = (NSArray *)[v17 copy];
        savedAccountsWithSignInWithAppleRecords = self->_savedAccountsWithSignInWithAppleRecords;
        self->_savedAccountsWithSignInWithAppleRecords = v18;
      }
      long long v20 = (void *)[(NSArray *)self->_savedAccounts mutableCopy];
      [v20 removeObject:v23];
      uint64_t v21 = (NSArray *)[v20 copy];
      savedAccounts = self->_savedAccounts;
      self->_savedAccounts = v21;
    }
  }
}

- (void)_addSavedAccountToRecentlyDeletedCachedCollections:(id)a3
{
  id v6 = a3;
  [(NSMutableArray *)self->_allRecentlyDeletedSavedAccounts addObject:v6];
  [(NSMutableArray *)self->_allRecentlyDeletedSavedAccounts sortUsingSelector:sel_compare_];
  id v4 = [v6 sharedGroupID];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts objectForKeyedSubscript:v4];
    [v5 addObject:v6];
    [v5 sortUsingSelector:sel_compare_];
  }
  else
  {
    [(NSMutableArray *)self->_recentlyDeletedSavedAccountsInPersonalKeychain addObject:v6];
    [(NSMutableArray *)self->_recentlyDeletedSavedAccountsInPersonalKeychain sortUsingSelector:sel_compare_];
  }
}

- (void)_removeSavedAccountFromRecentlyDeletedCachedCollections:(id)a3
{
  id v6 = a3;
  [(NSMutableArray *)self->_allRecentlyDeletedSavedAccounts removeObject:v6];
  id v4 = [v6 sharedGroupID];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts objectForKeyedSubscript:v4];
    [v5 removeObject:v6];
  }
  else
  {
    [(NSMutableArray *)self->_recentlyDeletedSavedAccountsInPersonalKeychain removeObject:v6];
  }
}

- (void)removeCredentialTypes:(int64_t)a3 forSavedAccount:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WBSSavedAccountStore_removeCredentialTypes_forSavedAccount___block_invoke;
  block[3] = &unk_1E615D4F8;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_sync(queue, block);
}

uint64_t __62__WBSSavedAccountStore_removeCredentialTypes_forSavedAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeCredentialTypes:*(void *)(a1 + 48) forSavedAccount:*(void *)(a1 + 40)];
}

- (void)_removeCredentialTypes:(int64_t)a3 forSavedAccount:(id)a4
{
  id v6 = a4;
  if ([v6 isRecentlyDeleted]) {
    [(WBSSavedAccountStore *)self _removeSavedAccountFromRecentlyDeletedCachedCollections:v6];
  }
  else {
    [(WBSSavedAccountStore *)self _removeSavedAccount:v6 fromCachedCollectionsForCredentialTypes:a3];
  }
  [v6 _deleteCredentialTypes:a3];
}

- (void)removeSite:(id)a3 fromSavedAccountWithPassword:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__WBSSavedAccountStore_removeSite_fromSavedAccountWithPassword_withCompletion___block_invoke;
  v15[3] = &unk_1E615D520;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

uint64_t __79__WBSSavedAccountStore_removeSite_fromSavedAccountWithPassword_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sites];
  if ([v2 count] == 1)
  {
    uint64_t v3 = [*(id *)(a1 + 32) sites];
    id v4 = [v3 firstObject];
    int v5 = [v4 isEqualToString:*(void *)(a1 + 40)];

    if (v5) {
      [*(id *)(a1 + 48) _removeSavedAccount:*(void *)(a1 + 32) fromCachedCollectionsForCredentialTypes:1];
    }
  }
  else
  {
  }
  [*(id *)(a1 + 32) _deletePasswordCredentialsForSite:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (BOOL)canChangeSavedAccount:(id)a3 toUser:(id)a4 password:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [v8 user];
  int v12 = [v9 isEqualToString:v11];

  id v13 = [v8 password];
  if (v12 && ([v10 isEqualToString:v13] & 1) != 0)
  {
    BOOL v14 = 1;
  }
  else
  {
    uint64_t v23 = 0;
    char v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 1;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__WBSSavedAccountStore_canChangeSavedAccount_toUser_password___block_invoke;
    block[3] = &unk_1E615D548;
    uint64_t v22 = &v23;
    id v18 = v8;
    id v19 = self;
    id v20 = v9;
    id v21 = v10;
    dispatch_sync(queue, block);
    BOOL v14 = *((unsigned char *)v24 + 24) != 0;

    _Block_object_dispose(&v23, 8);
  }

  return v14;
}

void __62__WBSSavedAccountStore_canChangeSavedAccount_toUser_password___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSavedInPersonalKeychain]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 40) _canChangeSavedAccountInPersonalKeychain:*(void *)(a1 + 32) toUser:*(void *)(a1 + 48) password:*(void *)(a1 + 56)];
  }
  if ([*(id *)(a1 + 32) isSavedInSharedGroup])
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(unsigned char *)(v2 + 24))
    {
      id v4 = *(void **)(a1 + 32);
      uint64_t v3 = *(void **)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 56);
      id v7 = [v4 sharedGroupID];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 _canChangeSavedAccount:v4 toUser:v5 password:v6 forGroupID:v7];
    }
    else
    {
      *(unsigned char *)(v2 + 24) = 0;
    }
  }
}

- (BOOL)_canChangeSavedAccountInPersonalKeychain:(id)a3 toUser:(id)a4 password:(id)a5
{
  return [(WBSSavedAccountStore *)self _canChangeSavedAccount:a3 toUser:a4 password:a5 forGroupID:0];
}

- (BOOL)_canChangeSavedAccount:(id)a3 toUser:(id)a4 password:(id)a5 forGroupID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    BOOL v14 = [(NSMutableDictionary *)self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts objectForKeyedSubscript:v13];
    uint64_t v15 = [v10 highLevelDomain];
    id v16 = [v14 objectForKeyedSubscript:v15];
  }
  else
  {
    personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    BOOL v14 = [v10 highLevelDomain];
    id v16 = [(NSMutableDictionary *)personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts objectForKeyedSubscript:v14];
  }

  id v18 = [v16 objectForKeyedSubscript:v11];
  id v19 = [v10 protectionSpaces];
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  id v20 = [v10 user];
  char v21 = [v11 isEqualToString:v20];

  uint64_t v22 = [v10 password];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __74__WBSSavedAccountStore__canChangeSavedAccount_toUser_password_forGroupID___block_invoke;
  v27[3] = &unk_1E615D570;
  char v32 = v21;
  id v23 = v22;
  id v28 = v23;
  id v24 = v12;
  id v29 = v24;
  id v25 = v19;
  id v30 = v25;
  id v31 = &v33;
  [v18 enumerateKeysAndObjectsUsingBlock:v27];
  LOBYTE(v20) = *((unsigned char *)v34 + 24);

  _Block_object_dispose(&v33, 8);
  return (char)v20;
}

void __74__WBSSavedAccountStore__canChangeSavedAccount_toUser_password_forGroupID___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if ((!*(unsigned char *)(a1 + 64) || ([v7 isEqualToString:*(void *)(a1 + 32)] & 1) == 0)
    && ([v7 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          if (objc_msgSend(v8, "_containsProtectionSpace:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
            *a4 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

- (void)changeSavedAccount:(id)a3 toUser:(id)a4 password:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 user];
  int v12 = [v9 isEqualToString:v11];
  id v13 = [v8 password];
  char v14 = [v10 isEqualToString:v13];
  char v15 = v14;
  if (!v12 || (v14 & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__WBSSavedAccountStore_changeSavedAccount_toUser_password___block_invoke;
    block[3] = &unk_1E615D598;
    char v24 = v12;
    id v18 = v8;
    uint64_t v19 = self;
    id v20 = v9;
    id v21 = v10;
    id v22 = v11;
    id v23 = v13;
    char v25 = v15;
    dispatch_sync(queue, block);
  }
}

void __59__WBSSavedAccountStore_changeSavedAccount_toUser_password___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) passkeyCredentialID];
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(a1 + 80);

    if (!v3)
    {
      id v4 = *(void **)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = [WBSPublicKeyCredentialIdentifier alloc];
      id v7 = [*(id *)(a1 + 32) passkeyCredentialID];
      id v8 = [*(id *)(a1 + 32) sharedGroupID];
      id v9 = [(WBSPublicKeyCredentialIdentifier *)v6 initWithCredentialID:v7 groupID:v8];
      [v4 updateUserVisibleNameOnInternalQueue:v5 forPasskeyWithIdentifier:v9];
    }
  }
  [*(id *)(a1 + 32) _setUser:*(void *)(a1 + 48) password:*(void *)(a1 + 56)];
  if ([*(id *)(a1 + 32) isSavedInPersonalKeychain]) {
    [*(id *)(a1 + 40) _updateSavedAccountsAndSavedAccountsWithPasswordsDictionary:*(void *)(*(void *)(a1 + 40) + 8) withChangeFromOldUser:*(void *)(a1 + 64) oldPassword:*(void *)(a1 + 72) forSavedAccountWithPassword:*(void *)(a1 + 32)];
  }
  if ([*(id *)(a1 + 32) isSavedInSharedGroup])
  {
    id v10 = *(void **)(*(void *)(a1 + 40) + 24);
    uint64_t v11 = [*(id *)(a1 + 32) sharedGroupID];
    int v12 = [v10 objectForKeyedSubscript:v11];

    [*(id *)(a1 + 40) _updateSavedAccountsAndSavedAccountsWithPasswordsDictionary:v12 withChangeFromOldUser:*(void *)(a1 + 64) oldPassword:*(void *)(a1 + 72) forSavedAccountWithPassword:*(void *)(a1 + 32)];
  }
  if (!*(unsigned char *)(a1 + 81)) {
    [*(id *)(a1 + 40) _saveSidecarObjectsOnInternalQueueForSavedAccountWithPassword:*(void *)(a1 + 32) withBlock:&__block_literal_global_241];
  }
  uint64_t v13 = [*(id *)(*(void *)(a1 + 40) + 72) sortedArrayUsingSelector:sel_compare_];
  uint64_t v14 = *(void *)(a1 + 40);
  char v15 = *(void **)(v14 + 72);
  *(void *)(v14 + 72) = v13;

  uint64_t v16 = [*(id *)(*(void *)(a1 + 40) + 64) sortedArrayUsingSelector:sel_compare_];
  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = *(void **)(v17 + 64);
  *(void *)(v17 + 64) = v16;
}

uint64_t __59__WBSSavedAccountStore_changeSavedAccount_toUser_password___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    return [a3 setHideWarningMarker:0];
  }
  return result;
}

- (BOOL)canChangeSavedAccountWithRequest:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 savedAccount];
  if (([v5 hasValidWebsite] & 1) == 0)
  {
    uint64_t v6 = [v4 customTitle];
    id v7 = objc_msgSend(v6, "safari_stringByTrimmingWhitespace");
    uint64_t v8 = [v7 length];

    if (!v8)
    {
      BOOL v26 = 0;
      goto LABEL_50;
    }
  }
  uint64_t v9 = [v5 credentialTypes];
  if (v9 != 3)
  {
    if (v9 == 2)
    {
      id v10 = [v4 password];
      uint64_t v17 = [v10 length];
      id v18 = [v4 user];
      uint64_t v19 = v18;
      if (v17)
      {
        uint64_t v48 = [v4 password];
        id v20 = [v5 passkeyRelyingPartyID];
        [v4 notesEntry];
        id v22 = v21 = v19;
        id v23 = [v4 customTitle];
        char v24 = [v5 sharedGroupID];
        BOOL v16 = [(WBSSavedAccountStore *)self canSaveUser:v21 password:v48 forUserTypedSite:v20 notes:v22 customTitle:v23 groupID:v24 error:0];

        uint64_t v19 = v21;
        char v25 = (void *)v48;
      }
      else
      {
        if ([v18 length])
        {
          BOOL v16 = 1;
          goto LABEL_24;
        }
        char v25 = [v5 user];
        BOOL v16 = [v25 length] == 0;
      }

LABEL_24:
      goto LABEL_25;
    }
    if (v9 != 1)
    {
      BOOL v16 = 0;
      goto LABEL_26;
    }
  }
  id v10 = [v4 user];
  uint64_t v11 = [v10 length];
  if (!v11)
  {
    uint64_t v19 = [v5 user];
    if (![v19 length])
    {
      long long v47 = v19;
      goto LABEL_7;
    }
    BOOL v16 = 0;
    goto LABEL_24;
  }
LABEL_7:
  int v12 = [v4 password];
  uint64_t v13 = [v12 length];
  if (v13
    || ([v5 user], long long v46 = objc_claimAutoreleasedReturnValue(), !objc_msgSend(v46, "length")))
  {
    uint64_t v14 = [v4 user];
    char v15 = [v4 password];
    BOOL v16 = [(WBSSavedAccountStore *)self canChangeSavedAccount:v5 toUser:v14 password:v15];

    if (v13) {
      goto LABEL_20;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

LABEL_20:
  uint64_t v19 = v47;
  if (!v11) {
    goto LABEL_24;
  }
LABEL_25:

LABEL_26:
  uint64_t v27 = [v4 notesEntry];
  unint64_t v28 = [v27 length];
  id v29 = [v5 notesEntry];
  unint64_t v30 = [v29 length];

  if (v30 <= 0x400) {
    unint64_t v31 = 1024;
  }
  else {
    unint64_t v31 = v30;
  }

  char v32 = [v4 customTitle];
  unint64_t v33 = [v32 length];
  long long v34 = [v5 customTitle];
  unint64_t v35 = [v34 length];

  if (v35 <= 0x80) {
    unint64_t v36 = 128;
  }
  else {
    unint64_t v36 = v35;
  }

  BOOL v26 = v33 <= v36 && v28 <= v31 && v16;
  if ([v4 hasAdditionalSitesChange])
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v38 = [v4 additionalSites];
    uint64_t v39 = [v38 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v52 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v43 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          id v44 = objc_opt_class();
          uint64_t v49 = 0;
          id v50 = 0;
          LODWORD(v43) = [v44 getProtectionSpaceAndHighLevelDomainForUserTypedSite:v43 protectionSpace:&v50 highLevelDomain:&v49];

          if (!v43)
          {
            BOOL v26 = 0;
            goto LABEL_49;
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v51 objects:v55 count:16];
        if (v40) {
          continue;
        }
        break;
      }
    }
LABEL_49:
  }
LABEL_50:

  return v26;
}

- (void)changeSavedAccountWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 savedAccount];
  if ([v4 hasChanges])
  {
    uint64_t v6 = [v4 user];
    id v7 = [v4 password];
    uint64_t v8 = [v5 user];
    uint64_t v9 = [v5 password];
    char v10 = [v5 credentialTypes] & 1;
    queue = self->_queue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke;
    v16[3] = &unk_1E615D5E8;
    id v17 = v4;
    id v18 = v5;
    uint64_t v19 = self;
    id v20 = v6;
    id v21 = v7;
    char v24 = v10;
    id v22 = v8;
    id v23 = v9;
    id v12 = v9;
    id v13 = v8;
    id v14 = v7;
    id v15 = v6;
    dispatch_sync(queue, v16);
  }
}

void __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) hasUserChange] & 1) != 0
    || [*(id *)(a1 + 32) hasPasswordChange])
  {
    uint64_t v2 = [*(id *)(a1 + 40) passkeyCredentialID];
    if (v2)
    {
      int v3 = (void *)v2;
      int v4 = [*(id *)(a1 + 32) hasUserChange];

      if (v4)
      {
        uint64_t v5 = *(void **)(a1 + 48);
        uint64_t v6 = *(void *)(a1 + 56);
        id v7 = [WBSPublicKeyCredentialIdentifier alloc];
        uint64_t v8 = [*(id *)(a1 + 40) passkeyCredentialID];
        uint64_t v9 = [*(id *)(a1 + 40) sharedGroupID];
        char v10 = [(WBSPublicKeyCredentialIdentifier *)v7 initWithCredentialID:v8 groupID:v9];
        [v5 updateUserVisibleNameOnInternalQueue:v6 forPasskeyWithIdentifier:v10];
      }
    }
    [*(id *)(a1 + 40) _setUser:*(void *)(a1 + 56) password:*(void *)(a1 + 64)];
  }
  uint64_t v11 = [*(id *)(a1 + 32) sites];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x1E4F1CA80];
    id v13 = [*(id *)(a1 + 40) sites];
    id v14 = [v12 setWithArray:v13];

    id v15 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v16 = [*(id *)(a1 + 32) sites];
    id v17 = [v15 setWithArray:v16];
    [v14 minusSet:v17];

    id v18 = [v14 allObjects];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v62 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(a1 + 40) _deletePasswordCredentialsForSite:*(void *)(*((void *)&v61 + 1) + 8 * i)];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v61 objects:v65 count:16];
      }
      while (v20);
    }
  }
  if (*(unsigned char *)(a1 + 88))
  {
    if ([*(id *)(a1 + 40) isSavedInPersonalKeychain]) {
      [*(id *)(a1 + 48) _updateSavedAccountsAndSavedAccountsWithPasswordsDictionary:*(void *)(*(void *)(a1 + 48) + 8) withChangeFromOldUser:*(void *)(a1 + 72) oldPassword:*(void *)(a1 + 80) forSavedAccountWithPassword:*(void *)(a1 + 40)];
    }
    if ([*(id *)(a1 + 40) isSavedInSharedGroup])
    {
      id v23 = *(void **)(*(void *)(a1 + 48) + 24);
      char v24 = [*(id *)(a1 + 40) sharedGroupID];
      char v25 = [v23 objectForKeyedSubscript:v24];

      [*(id *)(a1 + 48) _updateSavedAccountsAndSavedAccountsWithPasswordsDictionary:v25 withChangeFromOldUser:*(void *)(a1 + 72) oldPassword:*(void *)(a1 + 80) forSavedAccountWithPassword:*(void *)(a1 + 40)];
    }
  }
  char v26 = [*(id *)(a1 + 32) hasTOTPGeneratorChange];
  char v27 = [*(id *)(a1 + 32) hasNotesEntryChange];
  char v28 = [*(id *)(a1 + 32) hasPasswordChange];
  int v29 = [*(id *)(a1 + 32) hasCustomTitleChange];
  int v30 = [*(id *)(a1 + 32) hasAdditionalSitesChange];
  char v31 = v30;
  if ((v26 & 1) != 0 || (v27 & 1) != 0 || (v28 & 1) != 0 || (v29 & 1) != 0 || v30)
  {
    char v32 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    unint64_t v33 = [v32 valueForKey:@"safariUseLegacySidecarModificationPath"];

    long long v34 = *(void **)(a1 + 48);
    if (v33)
    {
      [*(id *)(a1 + 48) _performLegacySidecarModificationWithChangeRequest:*(void *)(a1 + 32) toSavedAccount:*(void *)(a1 + 40)];
      if (!v29) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_2;
    v54[3] = &unk_1E615D5C0;
    char v56 = v26;
    uint64_t v43 = *(void *)(a1 + 40);
    id v55 = *(id *)(a1 + 32);
    char v57 = v27;
    char v58 = v29;
    char v59 = v28;
    char v60 = v31;
    [v34 _saveSidecarObjectsOnInternalQueueForSavedAccount:v43 withBlock:v54];

    if (v29)
    {
LABEL_28:
      unint64_t v35 = *(void **)(a1 + 40);
      unint64_t v36 = [*(id *)(a1 + 32) customTitle];
      [v35 setCustomTitle:v36 performSidecarUpdate:0];
    }
  }
LABEL_29:
  if ([*(id *)(a1 + 32) isAddingPasswordToAccountWithPasskey])
  {
    uint64_t v37 = *(void *)(a1 + 56);
    uint64_t v38 = *(void *)(a1 + 64);
    uint64_t v39 = *(void **)(a1 + 48);
    uint64_t v40 = [*(id *)(a1 + 40) passkeyRelyingPartyID];
    uint64_t v41 = [*(id *)(a1 + 40) sharedGroupID];
    id v42 = [v39 _saveAccountOnInternalQueueWithUser:v37 password:v38 forUserTypedSite:v40 groupID:v41];

    if (v42)
    {
      [*(id *)(a1 + 48) _mergeSavedAccountWithPassword:v42 toSavedAccountWithPasskey:*(void *)(a1 + 40)];
    }
    else
    {
      id v44 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_cold_1();
      }
    }
  }
  uint64_t v45 = [*(id *)(*(void *)(a1 + 48) + 72) sortedArrayUsingSelector:sel_compare_];
  uint64_t v46 = *(void *)(a1 + 48);
  long long v47 = *(void **)(v46 + 72);
  *(void *)(v46 + 72) = v45;

  uint64_t v48 = [*(id *)(*(void *)(a1 + 48) + 64) sortedArrayUsingSelector:sel_compare_];
  uint64_t v49 = *(void *)(a1 + 48);
  id v50 = *(void **)(v49 + 64);
  *(void *)(v49 + 64) = v48;

  long long v51 = +[WBSKeychainSyncingMonitor sharedMonitor];
  uint64_t v52 = [v51 keychainSyncSettingValue];

  if (v52 == 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_248;
    block[3] = &unk_1E615A768;
    void block[4] = *(void *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v6 = [*(id *)(a1 + 32) totpGenerator];
    [v5 setTotpGenerator:v6];
  }
  if (*(unsigned char *)(a1 + 41))
  {
    id v7 = [*(id *)(a1 + 32) notesEntry];
    [v5 setNotesEntry:v7];
  }
  if (*(unsigned char *)(a1 + 42))
  {
    uint64_t v8 = [*(id *)(a1 + 32) customTitle];
    [v5 setCustomTitle:v8];
  }
  if (!a2 && *(unsigned char *)(a1 + 43)) {
    [v5 setHideWarningMarker:0];
  }
  if (*(unsigned char *)(a1 + 44))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    char v10 = [*(id *)(a1 + 32) additionalSites];
    uint64_t v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [*(id *)(a1 + 32) additionalSites];
    uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v17 = v5;
          id v18 = [v5 additionalSites];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_3;
          v22[3] = &unk_1E615CF80;
          v22[4] = v16;
          uint64_t v19 = objc_msgSend(v18, "safari_firstObjectPassingTest:", v22);

          if (v19)
          {
            [v11 addObject:v19];
          }
          else
          {
            uint64_t v20 = [[WBSSavedAccountAdditionalSite alloc] initWithSite:v16];
            [v11 addObject:v20];
          }
          id v5 = v17;
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    [v5 setAdditionalSites:v11];
  }
}

uint64_t __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_3(uint64_t a1, void *a2)
{
  int v3 = [a2 site];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_248(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSavedAccountStoreDidChangeNotification];
}

- (void)_performLegacySidecarModificationWithChangeRequest:(id)a3 toSavedAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasTOTPGeneratorChange])
  {
    uint64_t v8 = [v7 totpGenerators];
    id v9 = [v8 firstObject];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  if ([v6 hasNotesEntryChange])
  {
    uint64_t v11 = [v7 notesEntry];
    BOOL v12 = v11 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  if ([v6 hasCustomTitleChange])
  {
    uint64_t v13 = [v7 customTitle];
    BOOL v14 = v13 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __90__WBSSavedAccountStore__performLegacySidecarModificationWithChangeRequest_toSavedAccount___block_invoke;
  v33[3] = &unk_1E615D610;
  BOOL v36 = v10;
  BOOL v37 = v12;
  BOOL v38 = v14;
  id v15 = v7;
  id v34 = v15;
  id v16 = v6;
  id v35 = v16;
  [(WBSSavedAccountStore *)self _saveSidecarObjectsOnInternalQueueForSavedAccount:v15 withBlock:v33];
  if ([v16 hasTOTPGeneratorChange])
  {
    id v17 = [v16 totpGenerator];
    BOOL v18 = v17 != 0;
  }
  else
  {
    BOOL v18 = 0;
  }
  if ([v16 hasNotesEntryChange])
  {
    uint64_t v19 = [v16 notesEntry];
    BOOL v20 = [v19 length] != 0;
  }
  else
  {
    BOOL v20 = 0;
  }
  if ([v16 hasCustomTitleChange])
  {
    uint64_t v21 = [v16 customTitle];
    if ([v21 length])
    {
      id v22 = [v16 customTitle];
      long long v23 = [v15 userVisibleDomain];
      char v24 = WBSIsEqual(v22, v23) ^ 1;
    }
    else
    {
      char v24 = 0;
    }
  }
  else
  {
    char v24 = 0;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __90__WBSSavedAccountStore__performLegacySidecarModificationWithChangeRequest_toSavedAccount___block_invoke_2;
  v27[3] = &unk_1E615D610;
  BOOL v30 = v18;
  BOOL v31 = v20;
  char v32 = v24;
  id v28 = v16;
  id v29 = v15;
  id v25 = v15;
  id v26 = v16;
  [(WBSSavedAccountStore *)self _saveSidecarObjectsOnInternalQueueForSavedAccount:v25 withBlock:v27];
}

void __90__WBSSavedAccountStore__performLegacySidecarModificationWithChangeRequest_toSavedAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (*(unsigned char *)(a1 + 48)) {
    [v6 setTotpGenerator:0];
  }
  if (*(unsigned char *)(a1 + 49)) {
    [v6 setNotesEntry:0];
  }
  if (*(unsigned char *)(a1 + 50)) {
    [*(id *)(a1 + 32) setCustomTitle:0 performSidecarUpdate:0];
  }
  int v5 = [*(id *)(a1 + 40) hasPasswordChange];
  if (!a2 && v5) {
    [v6 setHideWarningMarker:0];
  }
}

void __90__WBSSavedAccountStore__performLegacySidecarModificationWithChangeRequest_toSavedAccount___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = [*(id *)(a1 + 32) totpGenerator];
    [v8 setTotpGenerator:v4];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    int v5 = [*(id *)(a1 + 32) notesEntry];
    [v8 setNotesEntry:v5];
  }
  if (*(unsigned char *)(a1 + 50))
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) customTitle];
    [v6 setCustomTitle:v7 performSidecarUpdate:0];
  }
}

- (void)_updateSavedAccountsAndSavedAccountsWithPasswordsDictionary:(id)a3 withChangeFromOldUser:(id)a4 oldPassword:(id)a5 forSavedAccountWithPassword:(id)a6
{
  id v25 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = [v11 highLevelDomain];
  BOOL v14 = [v12 objectForKeyedSubscript:v13];

  id v15 = [v14 objectForKeyedSubscript:v25];
  id v16 = [v11 user];
  id v17 = [v11 password];
  BOOL v18 = [v11 user];
  char v19 = [v25 isEqualToString:v18];

  if ((v19 & 1) == 0)
  {
    BOOL v20 = [v14 objectForKeyedSubscript:v25];

    [v20 removeObjectForKey:v10];
    if (![v20 count]) {
      [v14 removeObjectForKey:v25];
    }
    id v15 = [v14 objectForKeyedSubscript:v16];

    if (!v15)
    {
      id v15 = [MEMORY[0x1E4F1CA60] dictionary];
      [v14 setObject:v15 forKeyedSubscript:v16];
    }
  }
  uint64_t v21 = [v15 objectForKeyedSubscript:v17];
  if (v21)
  {
    [v11 _adoptSitesFromSavedAccount:v21];
    id v22 = (void *)[(NSArray *)self->_savedAccountsWithPasswords mutableCopy];
    [v22 removeObject:v21];
    [v22 addObject:v11];
    objc_storeStrong((id *)&self->_savedAccountsWithPasswords, v22);
    if ([(NSArray *)self->_savedAccounts containsObject:v21])
    {
      long long v23 = (NSArray *)[(NSArray *)self->_savedAccounts mutableCopy];
      [(NSArray *)v23 removeObject:v21];
      [(NSArray *)v23 addObject:v11];
      savedAccounts = self->_savedAccounts;
      self->_savedAccounts = v23;
    }
  }
  else
  {
    [v15 setObject:v11 forKeyedSubscript:v17];
  }
}

+ (id)protectionSpaceForNewStandalonePassword
{
  uint64_t v2 = [MEMORY[0x1E4F29128] UUID];
  id v3 = objc_alloc(MEMORY[0x1E4F18D98]);
  uint64_t v4 = [v2 UUIDString];
  int v5 = (void *)[v3 initWithHost:v4 port:0 protocol:@"https" realm:0 authenticationMethod:*MEMORY[0x1E4F18C88]];

  return v5;
}

+ (BOOL)getProtectionSpaceAndHighLevelDomainForUserTypedSite:(id)a3 protectionSpace:(id *)a4 highLevelDomain:(id *)a5
{
  id v7 = a3;
  id v8 = objc_msgSend(v7, "safari_bestURLForUserTypedString");
  if (!v8)
  {
    BOOL v20 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E4F18D98], "safari_HTMLFormProtectionSpaceForURL:", v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = v9;
  id v10 = [v9 protocol];
  if ([v10 isEqualToString:*MEMORY[0x1E4F18CD0]])
  {
    id v11 = objc_msgSend(v7, "safari_stringByTrimmingWhitespace");
    char v12 = objc_msgSend(v11, "safari_hasCaseInsensitivePrefix:", @"http:");

    if (v12) {
      goto LABEL_6;
    }
    id v13 = objc_alloc(MEMORY[0x1E4F18D98]);
    id v10 = [*a4 host];
    uint64_t v14 = [*a4 port];
    uint64_t v15 = *MEMORY[0x1E4F18CD8];
    id v16 = [*a4 realm];
    id v17 = [*a4 authenticationMethod];
    *a4 = (id)[v13 initWithHost:v10 port:v14 protocol:v15 realm:v16 authenticationMethod:v17];
  }
LABEL_6:
  BOOL v18 = [*a4 host];
  int v19 = objc_msgSend(v18, "safari_isCaseInsensitiveEqualToString:", @"localhost");

  if (v19)
  {
    *a5 = @"localhost";
    BOOL v20 = 1;
  }
  else
  {
    uint64_t v21 = [*a4 host];
    objc_msgSend(v21, "safari_highLevelDomainForUserTypedStringWhenAddingPasswordInPasswordManager");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    *a5 = v22;
    BOOL v20 = v22 != 0;
  }
LABEL_10:

  return v20;
}

- (BOOL)canSaveUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 notes:(id)a6 customTitle:(id)a7 groupID:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if ([v16 length])
  {
    if ([v17 length])
    {
      id v26 = v15;
      id v27 = 0;
      id v28 = 0;
      char v21 = [(id)objc_opt_class() getProtectionSpaceAndHighLevelDomainForUserTypedSite:v17 protectionSpace:&v28 highLevelDomain:&v27];
      id v22 = v28;
      id v23 = v27;
      if (v21)
      {
        [v19 length];
        id v15 = v26;
        BOOL v24 = [(WBSSavedAccountStore *)self canSaveUser:v26 password:v16 forProtectionSpace:v22 highLevelDomain:v23 notes:v18 customTitle:v19 groupID:v20 error:a9];
      }
      else
      {
        if (a9)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"com.apple.AuthenticationServices.SaveUserErrorDomain", 1, @"userTypedSite does not have a valid format.");
          BOOL v24 = 0;
          *a9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v24 = 0;
        }
        id v15 = v26;
      }
    }
    else if ([v19 length])
    {
      id v22 = 0;
      id v23 = 0;
      BOOL v24 = 1;
    }
    else if (a9)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"com.apple.AuthenticationServices.SaveUserErrorDomain", 5, @"Must provide either a website or a custom title");
      id v22 = 0;
      id v23 = 0;
      BOOL v24 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v22 = 0;
      id v23 = 0;
      BOOL v24 = 0;
    }
  }
  else if (a9)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"com.apple.AuthenticationServices.SaveUserErrorDomain", 5, @"Account details provided are incomplete.");
    BOOL v24 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (id)saveUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 groupID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  BOOL v30 = __Block_byref_object_copy__15;
  BOOL v31 = __Block_byref_object_dispose__15;
  id v32 = 0;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__WBSSavedAccountStore_saveUser_password_forUserTypedSite_groupID___block_invoke;
  v21[3] = &unk_1E615D638;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v26 = &v27;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_sync(queue, v21);
  id v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __67__WBSSavedAccountStore_saveUser_password_forUserTypedSite_groupID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _saveAccountOnInternalQueueWithUser:*(void *)(a1 + 40) password:*(void *)(a1 + 48) forUserTypedSite:*(void *)(a1 + 56) groupID:*(void *)(a1 + 64)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_saveAccountOnInternalQueueWithUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 groupID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v12 length];
  id v15 = objc_opt_class();
  if (!v14)
  {
    id v17 = [v15 protectionSpaceForNewStandalonePassword];
    id v18 = [v17 host];
    goto LABEL_6;
  }
  id v23 = 0;
  id v24 = 0;
  char v16 = [v15 getProtectionSpaceAndHighLevelDomainForUserTypedSite:v12 protectionSpace:&v24 highLevelDomain:&v23];
  id v17 = v24;
  id v18 = v23;
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];

  if (v19)
  {
    id v20 = v12;

    id v18 = v20;
LABEL_6:
    char v21 = [(WBSSavedAccountStore *)self _saveAccountOnInternalQueueWithUser:v10 password:v11 protectionSpace:v17 highLevelDomain:v18 groupID:v13];
    goto LABEL_7;
  }
  if (v16) {
    goto LABEL_6;
  }
  char v21 = 0;
LABEL_7:

  return v21;
}

- (id)saveUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 notesEntry:(id)a6 groupID:(id)a7
{
  id v12 = a6;
  id v13 = [(WBSSavedAccountStore *)self saveUser:a3 password:a4 forUserTypedSite:a5 groupID:a7];
  [(WBSSavedAccountStore *)self saveNotesEntry:v12 forSavedAccount:v13];

  return v13;
}

- (id)saveUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 customTitle:(id)a6 notesEntry:(id)a7 groupID:(id)a8
{
  id v14 = a7;
  id v15 = a6;
  char v16 = [(WBSSavedAccountStore *)self saveUser:a3 password:a4 forUserTypedSite:a5 groupID:a8];
  [(WBSSavedAccountStore *)self saveCustomTitle:v15 forSavedAccount:v16];

  [(WBSSavedAccountStore *)self saveNotesEntry:v14 forSavedAccount:v16];
  return v16;
}

- (BOOL)canSaveUser:(id)a3 password:(id)a4 forProtectionSpace:(id)a5 highLevelDomain:(id)a6 notes:(id)a7 customTitle:(id)a8 groupID:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (v16 && (uint64_t v23 = [v17 length], v18) && v23 && objc_msgSend(v19, "length"))
  {
    uint64_t v43 = 0;
    id v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    uint64_t v37 = 0;
    BOOL v38 = &v37;
    uint64_t v39 = 0x3032000000;
    uint64_t v40 = __Block_byref_object_copy__15;
    uint64_t v41 = __Block_byref_object_dispose__15;
    id v42 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__WBSSavedAccountStore_canSaveUser_password_forProtectionSpace_highLevelDomain_notes_customTitle_groupID_error___block_invoke;
    block[3] = &unk_1E615D688;
    void block[4] = self;
    id v29 = v22;
    id v35 = &v37;
    BOOL v36 = &v43;
    id v30 = v19;
    id v31 = v16;
    id v32 = v18;
    id v33 = v20;
    id v34 = v21;
    dispatch_sync(queue, block);
    if (a10)
    {
      id v24 = (void *)v38[5];
      if (v24) {
        *a10 = v24;
      }
    }
    BOOL v25 = *((unsigned char *)v44 + 24) != 0;

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v43, 8);
  }
  else if (a10)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"com.apple.AuthenticationServices.SaveUserErrorDomain", 5, @"Account details provided are incomplete.");
    BOOL v25 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

void __112__WBSSavedAccountStore_canSaveUser_password_forProtectionSpace_highLevelDomain_notes_customTitle_groupID_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDomainsToUsersExists];
  uint64_t v2 = [*(id *)(a1 + 40) length];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v2)
  {
    id v6 = [*(id *)(v3 + 8) objectForKeyedSubscript:*(void *)(a1 + 48)];
    if (v6) {
      goto LABEL_4;
    }
    goto LABEL_8;
  }
  uint64_t v4 = [*(id *)(v3 + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v4)
  {
    int v5 = v4;
    id v6 = [v4 objectForKeyedSubscript:*(void *)(a1 + 48)];

    if (v6)
    {
LABEL_4:
      id v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 56)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
      if (v7)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __112__WBSSavedAccountStore_canSaveUser_password_forProtectionSpace_highLevelDomain_notes_customTitle_groupID_error___block_invoke_272;
        v12[3] = &unk_1E615D660;
        id v13 = *(id *)(a1 + 64);
        long long v17 = *(_OWORD *)(a1 + 88);
        id v14 = *(id *)(a1 + 48);
        id v15 = *(id *)(a1 + 72);
        id v16 = *(id *)(a1 + 80);
        [v7 enumerateKeysAndObjectsUsingBlock:v12];
      }
      return;
    }
LABEL_8:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
    return;
  }
  id v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __112__WBSSavedAccountStore_canSaveUser_password_forProtectionSpace_highLevelDomain_notes_customTitle_groupID_error___block_invoke_cold_1();
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"com.apple.AuthenticationServices.SaveUserErrorDomain", 6, @"Adding password to unknown group.");
  uint64_t v10 = *(void *)(*(void *)(a1 + 88) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
}

void __112__WBSSavedAccountStore_canSaveUser_password_forProtectionSpace_highLevelDomain_notes_customTitle_groupID_error___block_invoke_272(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v24 = a3;
  if ([v24 _containsProtectionSpace:*(void *)(a1 + 32)])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"com.apple.AuthenticationServices.SaveUserErrorDomain", 2, @"Account details provided already exist.");
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    *a4 = 1;
  }
  uint64_t v9 = [v24 notesEntry];
  uint64_t v10 = [v24 highLevelDomain];
  if ([v10 isEqualToString:*(void *)(a1 + 40)]
    && [*(id *)(a1 + 48) length]
    && [v9 length])
  {
    char v11 = [v9 isEqualToString:*(void *)(a1 + 48)];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"com.apple.AuthenticationServices.SaveUserErrorDomain", 3, @"An account with the same username/password of this highLevelDomain exists, with different notes.");
      uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else
  {
  }
  uint64_t v15 = [v24 customTitle];
  id v16 = (void *)v15;
  long long v17 = &stru_1F105D3F0;
  if (v15) {
    long long v17 = (__CFString *)v15;
  }
  id v18 = v17;

  id v19 = [v24 highLevelDomain];
  if ([v19 isEqualToString:*(void *)(a1 + 40)])
  {
    char v20 = WBSIsEqual(*(void **)(a1 + 56), v18);

    if ((v20 & 1) == 0)
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"com.apple.AuthenticationServices.SaveUserErrorDomain", 4, @"An account with the same username/password of this highLevelDomain exists, with different titles.");
      uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else
  {
  }
}

- (id)saveUser:(id)a3 password:(id)a4 forProtectionSpace:(id)a5 highLevelDomain:(id)a6 groupID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__15;
  BOOL v36 = __Block_byref_object_dispose__15;
  id v37 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__WBSSavedAccountStore_saveUser_password_forProtectionSpace_highLevelDomain_groupID___block_invoke;
  block[3] = &unk_1E615D6B0;
  id v30 = v16;
  id v31 = &v32;
  void block[4] = self;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  id v29 = v15;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_sync(queue, block);
  id v23 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v23;
}

void __85__WBSSavedAccountStore_saveUser_password_forProtectionSpace_highLevelDomain_groupID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _saveAccountOnInternalQueueWithUser:*(void *)(a1 + 40) password:*(void *)(a1 + 48) protectionSpace:*(void *)(a1 + 56) highLevelDomain:*(void *)(a1 + 64) groupID:*(void *)(a1 + 72)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)_canMoveSavedAccountWithPasskey:(id)a3 toGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__WBSSavedAccountStore__canMoveSavedAccountWithPasskey_toGroup___block_invoke;
  v12[3] = &unk_1E615D6D8;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v12);
  LOBYTE(queue) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)queue;
}

void __64__WBSSavedAccountStore__canMoveSavedAccountWithPasskey_toGroup___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDomainsToUsersExists];
  uint64_t v2 = (void *)MEMORY[0x1E4F18D98];
  uint64_t v3 = [*(id *)(a1 + 40) passkeyRelyingPartyID];
  uint64_t v4 = objc_msgSend(v2, "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v3);

  int v5 = [WBSPair alloc];
  id v6 = [*(id *)(a1 + 40) passkeyUserHandle];
  id v7 = [(WBSPair *)v5 initWithFirst:v6 second:v4];

  id v8 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  if (!v8)
  {
    id v12 = [*(id *)(v9 + 16) objectForKeyedSubscript:v7];
    id v14 = [v12 firstObject];
    goto LABEL_5;
  }
  id v10 = *(void **)(v9 + 32);
  char v11 = [v8 groupID];
  id v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    id v13 = [v12 objectForKeyedSubscript:v7];
    id v14 = [v13 firstObject];

LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v14 == 0;

    goto LABEL_9;
  }
  id v15 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    __64__WBSSavedAccountStore__canMoveSavedAccountWithPasskey_toGroup___block_invoke_cold_1();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_9:
}

- (id)_saveAccountOnInternalQueueWithUser:(id)a3 password:(id)a4 protectionSpace:(id)a5 highLevelDomain:(id)a6 groupID:(id)a7
{
  id v12 = a3;
  id v13 = (__CFString *)a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = 0;
  if (!v12 || !v14) {
    goto LABEL_35;
  }
  if (![v15 length])
  {
LABEL_34:
    id v17 = 0;
    goto LABEL_35;
  }
  if (!v13) {
    id v13 = &stru_1F105D3F0;
  }
  if (![v16 length])
  {
    id v26 = [(NSMutableDictionary *)self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts objectForKeyedSubscript:v15];
    if (!v26)
    {
      id v26 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts setObject:v26 forKeyedSubscript:v15];
    }
    goto LABEL_16;
  }
  uint64_t v18 = +[WBSOngoingSharingGroupProvider sharedProvider];
  char v19 = [v18 currentUserParticipantID];

  if (!v19)
  {
    uint64_t v41 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[WBSSavedAccountStore _saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:]();
    }
    goto LABEL_34;
  }
  groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
  if (!groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts)
  {
    id v21 = [MEMORY[0x1E4F1CA60] dictionary];
    id v22 = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
    self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = v21;

    groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
  }
  id v23 = [(NSMutableDictionary *)groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts objectForKeyedSubscript:v16];

  if (!v23)
  {
    id v24 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts setObject:v24 forKeyedSubscript:v16];
  }
  BOOL v25 = [(NSMutableDictionary *)self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts objectForKeyedSubscript:v16];
  id v26 = [v25 objectForKeyedSubscript:v15];

  if (!v26)
  {
    id v26 = [MEMORY[0x1E4F1CA60] dictionary];
    id v27 = [(NSMutableDictionary *)self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts objectForKeyedSubscript:v16];
    [v27 setObject:v26 forKeyedSubscript:v15];
  }
LABEL_16:
  id v28 = [v26 objectForKeyedSubscript:v12];
  if (!v28)
  {
    id v28 = [MEMORY[0x1E4F1CA60] dictionary];
    [v26 setObject:v28 forKeyedSubscript:v12];
  }
  uint64_t v43 = v26;
  id v44 = v28;
  uint64_t v29 = [v28 objectForKeyedSubscript:v13];
  id v30 = (id)v29;
  if (!v29)
  {
    id v30 = [[WBSSavedAccount alloc] _initWithHighLevelDomain:v15 user:v12 password:v13];
    [v28 setObject:v30 forKeyedSubscript:v13];
    id v31 = (NSArray *)[(NSArray *)self->_savedAccountsWithPasswords mutableCopy];
    [(NSArray *)v31 safari_insertObject:v30 inSortedOrderUsingComparator:&__block_literal_global_284];
    savedAccountsWithPasswords = self->_savedAccountsWithPasswords;
    self->_savedAccountsWithPasswords = v31;
  }
  id v33 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  uint64_t v34 = objc_msgSend(MEMORY[0x1E4F18D88], "safari_credentialWithUser:password:persistence:", v12, v13, 3);
  objc_msgSend(v33, "safari_setCredential:forHTMLFormProtectionSpace:forGroupID:", v34, v14, v16);

  if ([v16 length])
  {
    sharedAccountsGroups = self->_sharedAccountsGroups;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __109__WBSSavedAccountStore__saveAccountOnInternalQueueWithUser_password_protectionSpace_highLevelDomain_groupID___block_invoke_2;
    v45[3] = &unk_1E615BB40;
    id v46 = v16;
    BOOL v36 = [(NSArray *)sharedAccountsGroups safari_firstObjectPassingTest:v45];
    if (!v36)
    {
      id v37 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[WBSSavedAccountStore _saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:]();
      }
    }
    BOOL v38 = [v36 groupID];
    [v30 setSharedGroupID:v38];
  }
  else
  {
    [v30 setSharedGroupID:&stru_1F105D3F0];
  }
  [v30 _createSidecarsForProtectionSpaceIfNecessary:v14];
  uint64_t v39 = [v14 host];
  [v30 _addProtectionSpace:v14 forSite:v39 isDefaultCredentialForSite:v29 == 0];

  if (!v29)
  {
    if ([v16 length])
    {
      if (([v30 markOriginalContributorParticipantID] & 1) == 0)
      {
        uint64_t v40 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[WBSSavedAccountStore _saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:]();
        }
      }
    }
  }
  id v17 = v30;

LABEL_35:
  return v17;
}

uint64_t __109__WBSSavedAccountStore__saveAccountOnInternalQueueWithUser_password_protectionSpace_highLevelDomain_groupID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __109__WBSSavedAccountStore__saveAccountOnInternalQueueWithUser_password_protectionSpace_highLevelDomain_groupID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 groupID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_saveSidecarObjectsOnInternalQueueForSavedAccount:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(WBSSavedAccountStore *)self _saveSidecarObjectsOnInternalQueueForSavedAccountWithPassword:v7 withBlock:v6];
  [(WBSSavedAccountStore *)self _saveSidecarOnInternalQueueForSavedAccountWithPasskey:v7 withBlock:v6];
}

- (void)_saveSidecarObjectsOnInternalQueueForSavedAccountWithPassword:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  id v6 = [v7 password];

  if (v6) {
    [v7 _updatePasswordSidecarsIfNecessaryWithBlock:v5];
  }
}

- (void)_saveSidecarOnInternalQueueForSavedAccountWithPasskey:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  id v6 = [v7 passkeyCredentialID];

  if (v6) {
    [v7 _updatePasskeySidecarsIfNecessaryWithBlock:v5];
  }
}

- (void)_writeSidecarDataForMergedSavedAccount:(id)a3
{
  id v5 = a3;
  uint64_t v3 = [v5 notesEntry];
  if ([v3 length]) {
    [v5 setNotesEntry:v3];
  }
  uint64_t v4 = [v5 customTitle];
  if ([v4 length]) {
    [v5 setCustomTitle:v4 performSidecarUpdate:1];
  }
}

- (void)saveAdditionalSites:(id)a3 forSavedAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__WBSSavedAccountStore_saveAdditionalSites_forSavedAccount___block_invoke;
  v11[3] = &unk_1E615A6C8;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, v11);
}

uint64_t __60__WBSSavedAccountStore_saveAdditionalSites_forSavedAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAdditionalSites:*(void *)(a1 + 40)];
}

- (void)addAdditionalSite:(id)a3 toSavedAccount:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v6 additionalSites];
  char v8 = [v7 containsObject:v11];

  if ((v8 & 1) == 0)
  {
    id v9 = [v6 additionalSites];
    id v10 = [v9 arrayByAddingObject:v11];
    [(WBSSavedAccountStore *)self saveAdditionalSites:v10 forSavedAccount:v6];
  }
}

- (void)saveTOTPGenerator:(id)a3 forSavedAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__WBSSavedAccountStore_saveTOTPGenerator_forSavedAccount___block_invoke;
  v11[3] = &unk_1E615A6C8;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, v11);
}

uint64_t __58__WBSSavedAccountStore_saveTOTPGenerator_forSavedAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTOTPGenerator:*(void *)(a1 + 40)];
}

- (void)removeTOTPGeneratorForSavedAccount:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WBSSavedAccountStore_removeTOTPGeneratorForSavedAccount___block_invoke;
  block[3] = &unk_1E615A768;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

uint64_t __59__WBSSavedAccountStore_removeTOTPGeneratorForSavedAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTOTPGenerator:0];
}

- (void)saveNotesEntry:(id)a3 forSavedAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__WBSSavedAccountStore_saveNotesEntry_forSavedAccount___block_invoke;
    v9[3] = &unk_1E615A6C8;
    id v10 = v7;
    id v11 = v6;
    dispatch_sync(queue, v9);
  }
}

uint64_t __55__WBSSavedAccountStore_saveNotesEntry_forSavedAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNotesEntry:*(void *)(a1 + 40)];
}

- (void)saveCustomTitle:(id)a3 forSavedAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WBSSavedAccountStore_saveCustomTitle_forSavedAccount___block_invoke;
  block[3] = &unk_1E615B188;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __56__WBSSavedAccountStore_saveCustomTitle_forSavedAccount___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) userVisibleDomain];
  LOBYTE(v2) = WBSIsEqual(v2, v3);

  if ((v2 & 1) == 0)
  {
    [*(id *)(a1 + 40) setCustomTitle:*(void *)(a1 + 32) performSidecarUpdate:0];
    uint64_t v5 = *(void *)(a1 + 40);
    id v4 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__WBSSavedAccountStore_saveCustomTitle_forSavedAccount___block_invoke_2;
    v6[3] = &unk_1E615CD68;
    id v7 = *(id *)(a1 + 32);
    [v4 _saveSidecarObjectsOnInternalQueueForSavedAccount:v5 withBlock:v6];
  }
}

uint64_t __56__WBSSavedAccountStore_saveCustomTitle_forSavedAccount___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setCustomTitle:*(void *)(a1 + 32)];
}

- (void)saveHideMarker:(id)a3 forSavedAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__WBSSavedAccountStore_saveHideMarker_forSavedAccount___block_invoke;
  block[3] = &unk_1E615B188;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __55__WBSSavedAccountStore_saveHideMarker_forSavedAccount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__WBSSavedAccountStore_saveHideMarker_forSavedAccount___block_invoke_2;
  v3[3] = &unk_1E615CD68;
  id v4 = *(id *)(a1 + 48);
  [v1 _saveSidecarObjectsOnInternalQueueForSavedAccount:v2 withBlock:v3];
}

void __55__WBSSavedAccountStore_saveHideMarker_forSavedAccount___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    id v6 = v5;
    [v5 setHideWarningMarker:*(void *)(a1 + 32)];
    id v5 = v6;
  }
}

- (void)removeHideWarningMarkerForSavedAccount:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__WBSSavedAccountStore_removeHideWarningMarkerForSavedAccount___block_invoke;
  v7[3] = &unk_1E615A6C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __63__WBSSavedAccountStore_removeHideWarningMarkerForSavedAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveSidecarObjectsOnInternalQueueForSavedAccount:*(void *)(a1 + 40) withBlock:&__block_literal_global_287];
}

void __63__WBSSavedAccountStore_removeHideWarningMarkerForSavedAccount___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!a2)
  {
    id v5 = v4;
    [v4 setHideWarningMarker:0];
    id v4 = v5;
  }
}

- (void)resetHiddenSecurityRecommendationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__WBSSavedAccountStore_resetHiddenSecurityRecommendationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615A6A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __80__WBSSavedAccountStore_resetHiddenSecurityRecommendationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "hideWarningMarker", (void)v10);

        if (v8) {
          [*(id *)(a1 + 32) _saveSidecarObjectsOnInternalQueueForSavedAccount:v7 withBlock:&__block_literal_global_289];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __80__WBSSavedAccountStore_resetHiddenSecurityRecommendationsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!a2)
  {
    id v5 = v4;
    [v4 setHideWarningMarker:0];
    id v4 = v5;
  }
}

- (unint64_t)numberOfSavedAccountsInPersonalKeychainForHighLevelDomain:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__WBSSavedAccountStore_numberOfSavedAccountsInPersonalKeychainForHighLevelDomain___block_invoke;
  block[3] = &unk_1E615A6F0;
  id v10 = v4;
  long long v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __82__WBSSavedAccountStore_numberOfSavedAccountsInPersonalKeychainForHighLevelDomain___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v2 count];
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__WBSSavedAccountStore_reset__block_invoke;
  block[3] = &unk_1E615A768;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __29__WBSSavedAccountStore_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetOnInternalQueue];
}

uint64_t __68__WBSSavedAccountStore__cleanUpRedundantCredentialsWithoutUsernames__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 user];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = *(id *)(*(void *)(a1 + 32) + 64);
    uint64_t v6 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(v3, "isDuplicateWithoutUserNameOfSavedAccount:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
          {
            uint64_t v6 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v6;
}

- (BOOL)_deleteSavedAccountsWithUnknownOriginalContributorParticipantIDsFromSavedAccounts:(id)a3 inGroup:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count]
    && ([v6 participants],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8))
  {
    id v9 = +[WBSOngoingSharingGroupProvider sharedProvider];
    id v10 = [v9 currentUserParticipantID];

    if (v10)
    {
      long long v11 = (void *)MEMORY[0x1E4F1CAD0];
      long long v12 = [v6 participants];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __114__WBSSavedAccountStore__deleteSavedAccountsWithUnknownOriginalContributorParticipantIDsFromSavedAccounts_inGroup___block_invoke;
      v36[3] = &unk_1E615D720;
      uint64_t v29 = v10;
      id v37 = v10;
      long long v13 = objc_msgSend(v12, "safari_mapObjectsUsingBlock:", v36);
      long long v14 = [v11 setWithArray:v13];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v30 = v5;
      uint64_t v15 = (void *)[v5 copy];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        char v18 = 0;
        uint64_t v19 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v15);
            }
            id v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            id v22 = objc_msgSend(v6, "groupID", v29);
            id v23 = [v21 originalContributorParticipantID];
            if (v23)
            {
              if (([v14 containsObject:v23] & 1) == 0)
              {
                id v24 = WBS_LOG_CHANNEL_PREFIXPasswords();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138478339;
                  uint64_t v39 = v22;
                  __int16 v40 = 2113;
                  uint64_t v41 = v23;
                  __int16 v42 = 2113;
                  uint64_t v43 = v14;
                  _os_log_impl(&dword_1B728F000, v24, OS_LOG_TYPE_DEFAULT, "Deleting a shared saved account with a contributor ID that does not map to a participant in group ID: %{private}@, saved account original contributor ID: %{private}@, group participant IDs: %{private}@", buf, 0x20u);
                }
                BOOL v25 = [v6 groupID];
                [(WBSSavedAccountStore *)self _removeSavedAccount:v21 fromGroupID:v25];

                char v18 = 1;
              }
            }
            else
            {
              id v26 = WBS_LOG_CHANNEL_PREFIXPasswords();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138477827;
                uint64_t v39 = v22;
                _os_log_error_impl(&dword_1B728F000, v26, OS_LOG_TYPE_ERROR, "Found a shared saved account without an original contributor participant ID in group ID: %{private}@", buf, 0xCu);
              }
              [(WBSSavedAccountStore *)self _reportAccountsWithUnknownContributorIDIfNeeded];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v44 count:16];
        }
        while (v17);
      }
      else
      {
        char v18 = 0;
      }

      id v10 = v29;
      id v5 = v30;
    }
    else
    {
      id v27 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[WBSSavedAccountStore _deleteSavedAccountsWithUnknownOriginalContributorParticipantIDsFromSavedAccounts:inGroup:]();
      }
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18 & 1;
}

id __114__WBSSavedAccountStore__deleteSavedAccountsWithUnknownOriginalContributorParticipantIDsFromSavedAccounts_inGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isCurrentUser])
  {
    id v4 = *(id *)(a1 + 32);
  }
  else
  {
    id v4 = [v3 participantID];
  }
  id v5 = v4;

  return v5;
}

- (void)_reportAccountsWithUnknownContributorIDIfNeeded
{
  if ((atomic_exchange(&self->_didReportAccountsWithUnknownContributorID._Value, 1u) & 1) == 0)
  {
    id v2 = dispatch_get_global_queue(17, 0);
    dispatch_async(v2, &__block_literal_global_297);
  }
}

void __71__WBSSavedAccountStore__reportAccountsWithUnknownContributorIDIfNeeded__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __71__WBSSavedAccountStore__reportAccountsWithUnknownContributorIDIfNeeded__block_invoke_cold_1();
  }
}

uint64_t __126__WBSSavedAccountStore__cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted___block_invoke_298(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSavedAccountStoreDidChangeNotification];
}

- (void)_identifySharedSavedAccountsWithSameUsernameAndHighLevelDomainPairs
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(NSMutableDictionary *)self->_groupIdentifiersToSavedAccounts allValues];
  id v5 = objc_msgSend(v4, "safari_flattenedArray");

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        long long v12 = [WBSPair alloc];
        long long v13 = [v11 highLevelDomain];
        long long v14 = [v11 user];
        uint64_t v15 = [(WBSPair *)v12 initWithFirst:v13 second:v14];

        uint64_t v16 = [v3 objectForKeyedSubscript:v15];

        if (!v16)
        {
          uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
          [v3 setObject:v17 forKeyedSubscript:v15];
        }
        char v18 = [v3 objectForKeyedSubscript:v15];
        uint64_t v19 = [v11 sharedGroupID];
        [v18 addObject:v19];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v8);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = v6;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        BOOL v25 = *(void **)(*((void *)&v32 + 1) + 8 * v24);
        id v26 = [WBSPair alloc];
        id v27 = objc_msgSend(v25, "highLevelDomain", (void)v32);
        id v28 = [v25 user];
        uint64_t v29 = [(WBSPair *)v26 initWithFirst:v27 second:v28];

        id v30 = [v3 objectForKeyedSubscript:v29];
        unint64_t v31 = [v30 count];

        if (v31 >= 2) {
          [v25 setHasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts:1];
        }

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v22);
  }
}

- (void)_ensureDomainsToUsersExists
{
  id v2 = [(WBSSavedAccountStore *)self _savedAccounts];
}

- (void)_mergeSavedAccountWithPassword:(id)a3 toSavedAccountWithPasskey:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 password];
  [v6 setPassword:v7];

  uint64_t v8 = [v5 protectionSpaces];
  uint64_t v9 = [v8 firstObject];

  uint64_t v10 = [v9 host];
  id v30 = v5;
  objc_msgSend(v6, "_addProtectionSpace:forSite:isDefaultCredentialForSite:", v9, v10, objc_msgSend(v5, "isDefaultCredentialForFullyQualifiedHostname:", v10));
  if ([v6 hasPasskeySidecars])
  {
    id v28 = v10;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v11 = [v6 passkeyCredentialSidecarsDictionary];
    long long v12 = [v11 allValues];

    id obj = v12;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (!v13) {
      goto LABEL_18;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    uint64_t v16 = off_1E6159000;
    while (1)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(obj);
        }
        char v18 = *(void **)(*((void *)&v33 + 1) + 8 * v17);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = (objc_class *)WBSSavedAccountSidecar;
LABEL_11:
          id v20 = [v19 alloc];
          uint64_t v21 = [v30 user];
          uint64_t v22 = [v18 dictionaryRepresentation];
          uint64_t v23 = (void *)[v20 initWithUser:v21 protectionSpace:v9 dictionaryRepresentation:v22];

          id v24 = v18;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v24 setLastOneTimeShareDateForPasskey:0];
          }
          BOOL v25 = [v23 protectionSpace];
          id v26 = [v25 host];
          [v6 _addSidecar:v23 forSite:v26];

          uint64_t v16 = off_1E6159000;
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = (objc_class *)v16[69];
          goto LABEL_11;
        }
        id v27 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[WBSSavedAccountStore _mergeSavedAccountWithPassword:toSavedAccountWithPasskey:](&buf, v32, v27);
        }
LABEL_16:
        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (!v14)
      {
LABEL_18:

        [v6 _updatePasswordSidecarsIfNecessaryWithBlock:0];
        uint64_t v10 = v28;
        break;
      }
    }
  }
}

- (void)_mergeSavedAccountWithPasskey:(id)a3 toSavedAccountWithPassword:(id)a4
{
  id v25 = a3;
  id v5 = a4;
  id v6 = [v25 passkeyUserHandle];
  [v5 setPasskeyUserHandle:v6];

  uint64_t v7 = [v25 passkeyCredentialID];
  [v5 setPasskeyCredentialID:v7];

  uint64_t v8 = [v25 passkeyRelyingPartyID];
  [v5 setPasskeyRelyingPartyID:v8];

  uint64_t v9 = [v25 creationDateForPasskey];
  [v5 setCreationDateForPasskey:v9];

  uint64_t v10 = [v25 lastModifiedDateForPasskey];
  [v5 setLastModifiedDateForPasskey:v10];

  long long v11 = [v25 lastUsedDateForPasskey];
  [v5 setLastUsedDateForPasskey:v11];

  if ([v5 hasPasswordSidecars])
  {
    long long v12 = [v5 allPasswordSidecars];
    uint64_t v13 = [v12 firstObject];

    uint64_t v14 = (void *)[v13 copy];
    uint64_t v15 = [v25 passkeyUserHandle];
    [v14 setUser:v15];

    [v5 _addPasskeySidecar:v14];
    uint64_t v16 = (void *)MEMORY[0x1E4F18D98];
    uint64_t v17 = [v25 passkeyRelyingPartyID];
    char v18 = objc_msgSend(v16, "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v17);

    uint64_t v19 = (void *)MEMORY[0x1E4F18D88];
    id v20 = [v25 passkeyUserHandle];
    uint64_t v21 = objc_msgSend(v19, "safari_credentialWithUser:password:persistence:", v20, &stru_1F105D3F0, 3);

    if ([v5 isSavedInPersonalKeychain])
    {
      uint64_t v22 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
      objc_msgSend(v22, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v13, v21, v18, &stru_1F105D3F0, objc_msgSend(v5, "isRecentlyDeleted"));
    }
    if ([v5 isSavedInSharedGroup])
    {
      uint64_t v23 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
      id v24 = [v5 sharedGroupID];
      objc_msgSend(v23, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v13, v21, v18, v24, objc_msgSend(v5, "isRecentlyDeleted"));
    }
  }
}

- (id)_saveUser:(id)a3 passkeyCredential:(id)a4 passkeyRelyingPartyID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    goto LABEL_9;
  }
  long long v11 = [v9 first];
  if (![v11 length]) {
    goto LABEL_8;
  }
  long long v12 = [v9 second];
  if (![v12 length])
  {

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v13 = [v10 length];

  if (v13)
  {
    uint64_t v33 = 0;
    long long v34 = &v33;
    uint64_t v35 = 0x3032000000;
    long long v36 = __Block_byref_object_copy__15;
    long long v37 = __Block_byref_object_dispose__15;
    id v38 = 0;
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x3032000000;
    id v30 = __Block_byref_object_copy__15;
    unint64_t v31 = __Block_byref_object_dispose__15;
    id v32 = 0;
    queue = self->_queue;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __74__WBSSavedAccountStore__saveUser_passkeyCredential_passkeyRelyingPartyID___block_invoke;
    uint64_t v22 = &unk_1E615D770;
    id v25 = &v33;
    uint64_t v23 = self;
    id v24 = v9;
    id v26 = &v27;
    dispatch_sync(queue, &v19);
    if (objc_msgSend((id)v28[5], "length", v19, v20, v21, v22, v23))
    {
      uint64_t v15 = [WBSSavedAccount alloc];
      id v16 = [(WBSSavedAccount *)v15 _initWithPasskeyRelyingPartyID:v10 user:v8 passkeyUserHandle:v28[5] passkeyCredentialID:v34[5]];
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      [v16 setCreationDateForPasskey:v17];
      [v16 setLastModifiedDateForPasskey:v17];
    }
    else
    {
      id v16 = 0;
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

    goto LABEL_10;
  }
LABEL_9:
  id v16 = 0;
LABEL_10:

  return v16;
}

void __74__WBSSavedAccountStore__saveUser_passkeyCredential_passkeyRelyingPartyID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) importPasskeyCredentialOnInternalQueue:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) first];
    uint64_t v7 = [v5 passkeyDataForPasskeyCredentialIDOnInternalQueue:v6];
    id v11 = [v7 firstObject];

    uint64_t v8 = [v11 objectForKeyedSubscript:@"UserHandle"];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void)setSavedAccountAsDefault:(id)a3 forProtectionSpace:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[WBSSavedAccountContext defaultContext];
  [(WBSSavedAccountStore *)self setSavedAccountAsDefault:v7 forProtectionSpace:v6 context:v8];
}

- (void)setSavedAccountAsDefault:(id)a3 forProtectionSpace:(id)a4 context:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(WBSSavedAccountStore *)self _hasSavedAccountWithSameUserNameOfSavedAccount:v8 forProtectionSpace:v9])
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WBSSavedAccountStore setSavedAccountAsDefault:forProtectionSpace:context:]();
    }
    if ([(WBSSavedAccountStore *)self _shouldUpdateLastUsedDateForSavedAccount:v8 forProtectionSpace:v9 inContext:v10])
    {
      long long v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = v12;
        uint64_t v14 = [v8 user];
        uint64_t v15 = [v9 host];
        int v49 = 138740227;
        id v50 = v14;
        __int16 v51 = 2117;
        uint64_t v52 = v15;
        _os_log_impl(&dword_1B728F000, v13, OS_LOG_TYPE_DEFAULT, "Setting last used date on account for user '%{sensitive}@' and host '%{sensitive}@'", (uint8_t *)&v49, 0x16u);
      }
      id v16 = [MEMORY[0x1E4F1C9C8] now];
      [v8 setLastUsedDate:v16 forContext:v10];
LABEL_27:
    }
  }
  else
  {
    uint64_t v17 = [v8 protectionSpaces];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      char v19 = [v8 hasProtectionSpace:v9];
      int v20 = [v8 hasProtectionSpaceWithHighLevelDomainMatchingProtectionSpace:v9];
      if ((v19 & 1) != 0 || !v20)
      {
        if ((v19 & 1) == 0)
        {
          uint64_t v48 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            -[WBSSavedAccountStore setSavedAccountAsDefault:forProtectionSpace:context:]();
          }
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v21 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = v21;
          uint64_t v23 = [v8 user];
          id v24 = [v9 host];
          int v49 = 138740227;
          id v50 = v23;
          __int16 v51 = 2117;
          uint64_t v52 = v24;
          _os_log_impl(&dword_1B728F000, v22, OS_LOG_TYPE_INFO, "While setting the account for '%{sensitive}@' as default for host '%{sensitive}@', adding high-level domain to the account's sites list", (uint8_t *)&v49, 0x16u);
        }
        id v25 = [v8 user];
        id v26 = [v8 password];
        uint64_t v27 = [v9 host];
        id v28 = objc_msgSend(v27, "safari_highLevelDomainFromHost");
        uint64_t v29 = [v8 sharedGroupID];
        uint64_t v30 = [(WBSSavedAccountStore *)self saveUser:v25 password:v26 forProtectionSpace:v9 highLevelDomain:v28 groupID:v29];

        if ((id)v30 != v8)
        {
          unint64_t v31 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[WBSSavedAccountStore setSavedAccountAsDefault:forProtectionSpace:context:].cold.4();
          }
        }

        id v8 = (id)v30;
      }
    }
    id v32 = [v9 authenticationMethod];
    char v33 = [v32 isEqualToString:*MEMORY[0x1E4F18C88]];

    if (v33)
    {
      if ([(WBSSavedAccountStore *)self _shouldUpdateLastUsedDateForSavedAccount:v8 forProtectionSpace:v9 inContext:v10])
      {
        long long v34 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v35 = v34;
          long long v36 = [v8 user];
          long long v37 = [v9 host];
          int v49 = 138740227;
          id v50 = v36;
          __int16 v51 = 2117;
          uint64_t v52 = v37;
          _os_log_impl(&dword_1B728F000, v35, OS_LOG_TYPE_DEFAULT, "Setting last used date on account for user '%{sensitive}@' and host '%{sensitive}@'", (uint8_t *)&v49, 0x16u);
        }
        id v38 = [MEMORY[0x1E4F1C9C8] now];
        [v8 setLastUsedDate:v38 forContext:v10];
      }
      if ([v8 isSavedInPersonalKeychain])
      {
        long long v39 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v40 = v39;
          uint64_t v41 = [v8 user];
          uint64_t v42 = [v9 host];
          int v49 = 138740227;
          id v50 = v41;
          __int16 v51 = 2117;
          uint64_t v52 = v42;
          _os_log_impl(&dword_1B728F000, v40, OS_LOG_TYPE_DEFAULT, "Setting account for user '%{sensitive}@' as default for host '%{sensitive}@'", (uint8_t *)&v49, 0x16u);
        }
        id v43 = objc_alloc(MEMORY[0x1E4F18D88]);
        id v44 = [v8 user];
        uint64_t v45 = [v8 password];
        id v16 = (void *)[v43 initWithUser:v44 password:v45 persistence:3];

        id v46 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
        objc_msgSend(v46, "safari_setDefaultCredential:forHTMLFormProtectionSpace:", v16, v9);

        goto LABEL_27;
      }
    }
    else
    {
      long long v47 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[WBSSavedAccountStore setSavedAccountAsDefault:forProtectionSpace:context:]();
      }
    }
  }
LABEL_32:
}

- (BOOL)_hasSavedAccountWithSameUserNameOfSavedAccount:(id)a3 forProtectionSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [WBSStringQuery alloc];
  id v9 = [v6 user];
  id v10 = [(WBSStringQuery *)v8 initWithString:v9 matchingType:1];

  id v11 = [WBSSavedAccountMatchCriteria alloc];
  long long v12 = objc_msgSend(v7, "safari_URL");
  uint64_t v13 = [(WBSSavedAccountMatchCriteria *)v11 initWithURL:v12 options:16 userNameQuery:v10 associatedDomainsManager:0 webFrameIdentifier:0];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__WBSSavedAccountStore__hasSavedAccountWithSameUserNameOfSavedAccount_forProtectionSpace___block_invoke;
  v15[3] = &unk_1E615BA68;
  void v15[4] = &v16;
  [(WBSSavedAccountStore *)self getSavedAccountsMatchingCriteria:v13 withSynchronousCompletionHandler:v15];
  LOBYTE(self) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)self;
}

void __90__WBSSavedAccountStore__hasSavedAccountWithSameUserNameOfSavedAccount_forProtectionSpace___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 matchesForPasswordAutoFill];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 count] != 0;
}

- (void)updateAllSavedAccountsWithPasswordsWithUser:(id)a3 protectionSpace:(id)a4 withNewPassword:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [[WBSStringQuery alloc] initWithString:v7 matchingType:1];
  id v11 = [WBSSavedAccountMatchCriteria alloc];
  long long v12 = objc_msgSend(v8, "safari_URL");
  uint64_t v13 = [(WBSSavedAccountMatchCriteria *)v11 initWithURL:v12 options:16 userNameQuery:v10 associatedDomainsManager:0 webFrameIdentifier:0];

  uint64_t v14 = +[WBSSavedAccountStore sharedStore];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __100__WBSSavedAccountStore_updateAllSavedAccountsWithPasswordsWithUser_protectionSpace_withNewPassword___block_invoke;
  v18[3] = &unk_1E615D798;
  id v19 = v7;
  id v20 = v9;
  id v21 = v8;
  id v15 = v8;
  id v16 = v9;
  id v17 = v7;
  [v14 getSavedAccountsMatchingCriteria:v13 withSynchronousCompletionHandler:v18];
}

void __100__WBSSavedAccountStore_updateAllSavedAccountsWithPasswordsWithUser_protectionSpace_withNewPassword___block_invoke(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [a2 exactMatches];
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v16 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v16) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v7 = +[WBSSavedAccountStore sharedStore];
        uint64_t v8 = a1[4];
        uint64_t v9 = a1[5];
        id v10 = (void *)a1[6];
        id v11 = [v10 host];
        long long v12 = [v6 savedAccount];
        uint64_t v13 = [v12 sharedGroupID];
        id v14 = (id)[v7 saveUser:v8 password:v9 forProtectionSpace:v10 highLevelDomain:v11 groupID:v13];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
}

- (BOOL)_shouldUpdateLastUsedDateForSavedAccount:(id)a3 forProtectionSpace:(id)a4 inContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(v9, "safari_URL");
  long long v12 = +[WBSSavedAccountMatchCriteria criteriaForExactFQDNPasswordMatchesOfURL:v11];

  objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 0x20);
  [v12 setContext:v10];
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__WBSSavedAccountStore__shouldUpdateLastUsedDateForSavedAccount_forProtectionSpace_inContext___block_invoke;
  v15[3] = &unk_1E615D7C0;
  long long v17 = &v18;
  id v13 = v8;
  id v16 = v13;
  [(WBSSavedAccountStore *)self getSavedAccountsMatchingCriteria:v12 withSynchronousCompletionHandler:v15];
  LOBYTE(self) = *((unsigned char *)v19 + 24) == 0;

  _Block_object_dispose(&v18, 8);
  return (char)self;
}

void __94__WBSSavedAccountStore__shouldUpdateLastUsedDateForSavedAccount_forProtectionSpace_inContext___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 matchesForPasswordAutoFill];
  uint64_t v3 = [v5 firstObject];
  uint64_t v4 = [v3 savedAccount];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 isEqual:*(void *)(a1 + 32)];
}

- (id)savedAccountForUserTypedSite:(id)a3 userName:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v24 = a4;
  id v8 = [(WBSSavedAccountStore *)self savedAccounts];
  id v29 = 0;
  id v30 = 0;
  uint64_t v23 = v7;
  LODWORD(self) = [(id)objc_opt_class() getProtectionSpaceAndHighLevelDomainForUserTypedSite:v7 protectionSpace:&v30 highLevelDomain:&v29];
  id v9 = v30;
  id v10 = v29;
  id v11 = 0;
  if (self)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v8;
    id v11 = (id)[obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v11)
    {
      id v20 = v10;
      char v21 = v8;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v15 = [v14 protectionSpaces];
          char v16 = [v15 containsObject:v9];
          if ((v16 & 1) != 0
            || ([v14 passkeyRelyingPartyID],
                uint64_t v4 = objc_claimAutoreleasedReturnValue(),
                ([v23 isEqualToString:v4] & 1) != 0))
          {
            long long v17 = [v14 user];
            char v18 = [v17 isEqualToString:v24];

            if ((v16 & 1) == 0) {
            if (v18)
            }
            {
              id v11 = v14;
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
        id v11 = (id)[obj countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v11);
LABEL_16:
      id v10 = v20;
      id v8 = v21;
    }
  }
  return v11;
}

uint64_t __69__WBSSavedAccountStore__performRecentlyDeletedMaintenanceIfNecessary__block_invoke_306(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSavedAccountStoreDidChangeNotification];
}

- (void)_migratePasswordsWithInvalidAuthenticationTypes
{
  int v2 = 0;
  atomic_compare_exchange_strong(&self->_isMigratingKeychainItemsWithInvalidAuthenticationTypes, (unsigned int *)&v2, 1u);
  if (!v2)
  {
    uint64_t v4 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__WBSSavedAccountStore__migratePasswordsWithInvalidAuthenticationTypes__block_invoke;
    v5[3] = &unk_1E615A768;
    v5[4] = self;
    objc_msgSend(v4, "safari_migrateKeychainItemsWithInvalidAuthenticationTypesWithCompletionHandler:", v5);
  }
}

void __71__WBSSavedAccountStore__migratePasswordsWithInvalidAuthenticationTypes__block_invoke(uint64_t a1)
{
  int v2 = 1;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1 + 32) + 240), (unsigned int *)&v2, 0);
  [*(id *)(a1 + 32) reset];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__WBSSavedAccountStore__migratePasswordsWithInvalidAuthenticationTypes__block_invoke_2;
  block[3] = &unk_1E615A768;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __71__WBSSavedAccountStore__migratePasswordsWithInvalidAuthenticationTypes__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSavedAccountStoreDidChangeNotification];
}

- (BOOL)_isMigratingKeychainItemsWithInvalidAuthenticationTypes
{
  unsigned int v2 = 1;
  atomic_compare_exchange_strong(&self->_isMigratingKeychainItemsWithInvalidAuthenticationTypes, &v2, v2);
  return v2 == 1;
}

- (BOOL)_moveSavedAccount:(id)a3 toGroupWithID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke;
  v12[3] = &unk_1E615D7E8;
  id v13 = v7;
  id v14 = self;
  id v15 = v6;
  char v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, v12);
  LOBYTE(v6) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v6;
}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke(uint64_t a1)
{
  unsigned int v2 = (id *)(a1 + 32);
  if (![*(id *)(a1 + 32) length])
  {
    id v5 = 0;
LABEL_5:
    id v6 = [*(id *)(a1 + 48) sharedGroupID];
    int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

    if (v7)
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_1();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
    else
    {
      if ([*v2 length])
      {
        id v9 = +[WBSOngoingSharingGroupProvider sharedProvider];
        id v10 = [v9 currentUserParticipantID];

        if (!v10)
        {
          id v11 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_4((uint64_t)v2, v11, v12, v13, v14, v15, v16, v17);
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        }
      }
      char v18 = [*(id *)(a1 + 48) sharedGroupID];
      uint64_t v19 = [*(id *)(a1 + 48) credentialTypes];
      char v20 = *(void **)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 48);
      if (v19 == 4)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v20 _moveSignInWithAppleSavedAccount:v21 toGroupID:*(void *)(a1 + 32)];
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
          && [*(id *)(a1 + 40) _copySavedAccount:*(void *)(a1 + 48) toGroup:v5])
        {
          [*(id *)(a1 + 40) _removeSavedAccount:*(void *)(a1 + 48) fromGroupID:v18];
        }
        else
        {
          id v30 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_2((uint64_t)v18, v30, v5);
          }
        }
      }
      else if ([v20 _copySavedAccount:v21 toGroup:v5])
      {
        if (![v18 length])
        {
          uint64_t v23 = [v5 groupID];
          uint64_t v24 = [v23 length];

          if (v24)
          {
            [*(id *)(a1 + 48) _removeSharableDataFromPersonalPasswordSidecars];
            [*(id *)(a1 + 48) _removeSharableDataFromPersonalPasskeySidecars];
            [*(id *)(a1 + 48) _updatePasswordSidecarsIfNecessaryWithBlock:0];
            [*(id *)(a1 + 48) _updatePasskeySidecarsIfNecessaryWithBlock:0];
          }
        }
        [*(id *)(a1 + 40) _removeSavedAccount:*(void *)(a1 + 48) fromGroupID:v18];
        if ([*(id *)(a1 + 32) length])
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_307;
          aBlock[3] = &unk_1E615A6C8;
          id v35 = *(id *)(a1 + 48);
          id v36 = *(id *)(a1 + 32);
          long long v25 = (void (**)(void))_Block_copy(aBlock);
          long long v26 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
          int v27 = [v26 BOOLForKey:@"useOriginalContributorWorkaround"];

          if (v27)
          {
            dispatch_time_t v28 = dispatch_time(0, 1000000000);
            id v29 = *(NSObject **)(*(void *)(a1 + 40) + 120);
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_311;
            v32[3] = &unk_1E615A620;
            char v33 = v25;
            dispatch_after(v28, v29, v32);
          }
          else
          {
            v25[2](v25);
          }
        }
      }
      else
      {
        unint64_t v31 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_2((uint64_t)v18, v31, v5);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
    }
    goto LABEL_36;
  }
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 144);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_2;
  v37[3] = &unk_1E615BB40;
  id v38 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "safari_firstObjectPassingTest:", v37);
  if (v4)
  {
    id v5 = (id)v4;

    goto LABEL_5;
  }
  uint64_t v22 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_5();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  id v5 = v38;
LABEL_36:
}

uint64_t __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 groupID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_307(uint64_t a1)
{
  if (([*(id *)(a1 + 32) markOriginalContributorParticipantID] & 1) == 0)
  {
    unsigned int v2 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_307_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

uint64_t __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_311(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_copySavedAccount:(id)a3 toGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 credentialTypes];
  id v9 = [v7 groupID];
  if (v8)
  {
    id v10 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    id v11 = v10;
    if (v7) {
      char v12 = objc_msgSend(v10, "safari_copySavedAccountWithPassword:toGroupWithID:", v6, v9);
    }
    else {
      char v12 = objc_msgSend(v10, "safari_copySavedAccountWithPasswordToPersonalKeychain:", v6);
    }
    char v13 = v12;

    if ((v13 & 1) == 0)
    {
      uint64_t v17 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[WBSSavedAccountStore _copySavedAccount:toGroup:]();
      }
      goto LABEL_21;
    }
    [(WBSSavedAccountStore *)self _addSavedAccount:v6 toCachedDictionaryForSavedAccountsWithPasswordsForGroupID:v9];
  }
  if ((v8 & 2) != 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    uint64_t v15 = v14;
    if (v7) {
      char v16 = objc_msgSend(v14, "safari_copySavedAccountWithPasskey:toGroupWithID:", v6, v9);
    }
    else {
      char v16 = objc_msgSend(v14, "safari_copySavedAccountWithPasskeyToPersonalKeychain:", v6);
    }
    char v18 = v16;

    if (v18)
    {
      [(WBSSavedAccountStore *)self _addSavedAccount:v6 toCachedDictionaryForSavedAccountsWithPasskeysForGroupID:v9];
      goto LABEL_15;
    }
    dispatch_time_t v28 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[WBSSavedAccountStore _copySavedAccount:toGroup:]();
    }
LABEL_21:
    BOOL v29 = 0;
    goto LABEL_25;
  }
LABEL_15:
  uint64_t v19 = [v7 groupID];
  [v6 setSharedGroupID:v19];

  if (v7)
  {
    groupIdentifiersToSavedAccounts = self->_groupIdentifiersToSavedAccounts;
    uint64_t v21 = [v7 groupID];
    uint64_t v22 = [(NSMutableDictionary *)groupIdentifiersToSavedAccounts objectForKeyedSubscript:v21];
    uint64_t v23 = (void *)[v22 mutableCopy];
    uint64_t v24 = v23;
    if (v23)
    {
      id v25 = v23;
    }
    else
    {
      id v25 = [MEMORY[0x1E4F1CA48] array];
    }
    id v30 = v25;

    [v30 addObject:v6];
    [v30 sortUsingSelector:sel_compare_];
    unint64_t v31 = self->_groupIdentifiersToSavedAccounts;
    uint64_t v32 = [v7 groupID];
    [(NSMutableDictionary *)v31 setObject:v30 forKeyedSubscript:v32];
  }
  else
  {
    long long v26 = (NSArray *)[(NSArray *)self->_savedAccountsInPersonalKeychain mutableCopy];
    [(NSArray *)v26 addObject:v6];
    [(NSArray *)v26 sortUsingSelector:sel_compare_];
    savedAccountsInPersonalKeychain = self->_savedAccountsInPersonalKeychain;
    self->_savedAccountsInPersonalKeychain = v26;
  }
  BOOL v29 = 1;
LABEL_25:

  return v29;
}

- (void)_removeSavedAccount:(id)a3 fromGroupID:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ([v14 credentialTypes])
  {
    [v14 _deletePasswordCredentialsForGroupID:v6];
    [(WBSSavedAccountStore *)self _removeSavedAccount:v14 fromCachedDictionaryForSavedAccountsWithPasswordsForGroupID:v6];
  }
  if (([v14 credentialTypes] & 2) != 0)
  {
    [v14 _deletePasskeyCredentialForGroupID:v6];
    [(WBSSavedAccountStore *)self _removeSavedAccount:v14 fromCachedDictionaryForSavedAccountsWithPasskeysForGroupID:v6];
  }
  if ([v6 length])
  {
    id v7 = [(NSMutableDictionary *)self->_groupIdentifiersToSavedAccounts objectForKeyedSubscript:v6];
    char v8 = (void *)[v7 mutableCopy];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [MEMORY[0x1E4F1CA48] array];
    }
    id v11 = v10;

    [v11 removeObject:v14];
    savedAccountsInPersonalKeychain = (NSArray *)[v11 copy];
    [(NSMutableDictionary *)self->_groupIdentifiersToSavedAccounts setObject:savedAccountsInPersonalKeychain forKeyedSubscript:v6];
  }
  else
  {
    id v11 = (void *)[(NSArray *)self->_savedAccountsInPersonalKeychain mutableCopy];
    [v11 removeObject:v14];
    char v12 = (NSArray *)[v11 copy];
    savedAccountsInPersonalKeychain = self->_savedAccountsInPersonalKeychain;
    self->_savedAccountsInPersonalKeychain = v12;
  }
}

- (BOOL)_canMoveSavedAccount:(id)a3 toGroupWithID:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isCurrentUserOriginalContributor]
    && [v6 canUserEditSavedAccount])
  {
    if ([v7 length])
    {
      sharedAccountsGroups = self->_sharedAccountsGroups;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __59__WBSSavedAccountStore__canMoveSavedAccount_toGroupWithID___block_invoke;
      v34[3] = &unk_1E615BB40;
      id v35 = v7;
      id v9 = [(NSArray *)sharedAccountsGroups safari_firstObjectPassingTest:v34];
      id v10 = v9;
      if (v9)
      {
        id v11 = [v9 participants];
        char v12 = objc_msgSend(v11, "safari_firstObjectPassingTest:", &__block_literal_global_314);

        if (!v12 || [v12 permissionLevel])
        {

LABEL_10:
          id v14 = [v6 sharedGroupID];
          char v15 = WBSIsEqual(v14, v7);

          if ((v15 & 1) == 0)
          {
            if ([v6 credentialTypes])
            {
              BOOL v29 = [v6 user];
              dispatch_time_t v28 = [v6 password];
              int v27 = [v6 highLevelDomain];
              long long v26 = [v6 notesEntry];
              char v16 = [v6 customTitle];
              long long v30 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              long long v33 = 0u;
              id obj = [v6 protectionSpaces];
              uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v31;
                while (2)
                {
                  for (uint64_t i = 0; i != v18; ++i)
                  {
                    if (*(void *)v31 != v19) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
                    uint64_t v22 = v10;
                    uint64_t v23 = [v10 groupID];
                    LODWORD(v21) = [(WBSSavedAccountStore *)self canSaveUser:v29 password:v28 forProtectionSpace:v21 highLevelDomain:v27 notes:v26 customTitle:v16 groupID:v23 error:0];

                    if (!v21)
                    {

                      BOOL v13 = 0;
                      id v10 = v22;
                      goto LABEL_28;
                    }
                    id v10 = v22;
                  }
                  uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }
            }
            if (([v6 credentialTypes] & 2) == 0
              || [(WBSSavedAccountStore *)self _canMoveSavedAccountWithPasskey:v6 toGroup:v10])
            {
              BOOL v13 = 1;
LABEL_28:

              goto LABEL_29;
            }
          }
LABEL_27:
          BOOL v13 = 0;
          goto LABEL_28;
        }
      }
      goto LABEL_27;
    }
    id v10 = 0;
    goto LABEL_10;
  }
  BOOL v13 = 0;
LABEL_29:

  return v13;
}

uint64_t __59__WBSSavedAccountStore__canMoveSavedAccount_toGroupWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 groupID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __59__WBSSavedAccountStore__canMoveSavedAccount_toGroupWithID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isCurrentUser];
}

- (BOOL)_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:(id)a3 isForAlreadyExitedGroup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    [(WBSSavedAccountStore *)self _recordGroupIdentifierForMovingContributedCredentialsBackToPersonalKeychain:v6];
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __130__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID_isForAlreadyExitedGroup___block_invoke;
  v13[3] = &unk_1E615D810;
  char v16 = &v18;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  BOOL v17 = v4;
  id v10 = v7;
  char v15 = v10;
  [(WBSSavedAccountStore *)self performTaskEnsuringAllAccountSourcesAreLoadedOnQueue:queue task:v13];
  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  char v11 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __130__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID_isForAlreadyExitedGroup___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue:*(void *)(a1 + 40) isForAlreadyExitedGroup:*(unsigned __int8 *)(a1 + 64)];
  unsigned int v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

- (BOOL)_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue:(id)a3 isForAlreadyExitedGroup:(BOOL)a4
{
  BOOL v75 = a4;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 138477827;
    id v95 = v74;
    _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEFAULT, "Beginning sweep to move contributed credentials back to personal keychain from groupID: %{private}@", buf, 0xCu);
  }
  self->_shouldIgnoreKeychainUpdates = 1;
  if (v75)
  {
    id v6 = [(WBSSavedAccountStore *)self _loadAndMergeSavedAccountsFromGroupID:v74 intoAllSavedAccounts:0];
    id v7 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_316);
    id v93 = v74;
    char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
    [(WBSSavedAccountStore *)self _loadRecentlyDeletedSavedAccountsFromSharedGroupIDs:v8];

    id v9 = [(NSMutableDictionary *)self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts objectForKeyedSubscript:v74];
    id v10 = objc_msgSend(v9, "safari_filterObjectsUsingBlock:", &__block_literal_global_316);
    char v11 = v7;
    char v12 = v10;
  }
  else
  {
    id v6 = [(NSMutableDictionary *)self->_groupIdentifiersToSavedAccounts objectForKeyedSubscript:v74];
    id v9 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_316);
    id v10 = [(NSMutableDictionary *)self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts objectForKeyedSubscript:v74];
    id v7 = objc_msgSend(v10, "safari_filterObjectsUsingBlock:", &__block_literal_global_316);
    char v11 = v9;
    char v12 = v7;
  }
  BOOL v13 = [v11 arrayByAddingObjectsFromArray:v12];

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
  if (!v14)
  {
    LOBYTE(v81) = 1;
    goto LABEL_93;
  }
  uint64_t v15 = v14;
  int v81 = 1;
  uint64_t v80 = *(void *)v87;
  BOOL v83 = self;
  do
  {
    uint64_t v16 = 0;
    uint64_t v76 = v15;
    do
    {
      if (*(void *)v87 != v80) {
        objc_enumerationMutation(obj);
      }
      BOOL v17 = *(void **)(*((void *)&v86 + 1) + 8 * v16);
      char v18 = [v17 credentialTypes];
      if ((v18 & 1) == 0)
      {
        id v82 = 0;
        if ((v18 & 2) != 0) {
          goto LABEL_51;
        }
LABEL_75:
        if (!v75) {
          [(WBSSavedAccountStore *)self _removeSavedAccount:v17 fromGroupID:v74];
        }
        goto LABEL_86;
      }
      char v78 = v18;
      uint64_t v19 = [v17 user];
      id v82 = 0;
      char v20 = 0;
      for (uint64_t i = 0; i != 10; ++i)
      {
        if (i)
        {
          id v22 = [NSString stringWithFormat:@"%@ (%ld)", v19, i];
        }
        else
        {
          id v22 = v19;
        }
        uint64_t v23 = v22;
        if ([v17 isRecentlyDeleted]) {
          recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
        }
        else {
          recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
        }
        id v25 = [v17 highLevelDomain];
        long long v26 = [(NSMutableDictionary *)recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts objectForKeyedSubscript:v25];
        int v27 = [v26 objectForKeyedSubscript:v23];
        dispatch_time_t v28 = [v27 allValues];

        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = __145__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue_isForAlreadyExitedGroup___block_invoke_2;
        v85[3] = &unk_1E615D338;
        v85[4] = v17;
        BOOL v29 = objc_msgSend(v28, "safari_firstObjectPassingTest:", v85);
        if (v29)
        {
          long long v30 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint8_t buf = 0;
            _os_log_impl(&dword_1B728F000, v30, OS_LOG_TYPE_DEFAULT, "Skipping moving saved account from group to personal keychain because there is already an identical copy in personal keychain.", buf, 2u);
          }
          char v31 = 1;
          [v29 _writeFormerlySharedSavedAccountMarkerForCredentialTypes:1];
          char v20 = 1;
        }
        else if ([v28 count])
        {
          char v31 = 0;
        }
        else
        {
          if (i)
          {
            id v32 = v23;
          }
          else
          {
            id v32 = v82;
          }
          long long v33 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
          int v34 = objc_msgSend(v33, "safari_copySavedAccountWithPasswordToPersonalKeychain:withNewUsername:", v17, v32);

          id v82 = v32;
          if (v34)
          {
            self = v83;
            [(WBSSavedAccountStore *)v83 _addSavedAccount:v17 toCachedDictionaryForSavedAccountsWithPasswordsForGroupID:&stru_1F105D3F0];
            char v31 = 1;
            char v20 = 1;
            goto LABEL_36;
          }
          id v35 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint8_t buf = 138477827;
            id v95 = v74;
            _os_log_error_impl(&dword_1B728F000, v35, OS_LOG_TYPE_ERROR, "Failed to copy saved account with password back to personal keychain on exit from group %{private}@.", buf, 0xCu);
          }
          char v31 = 0;
          char v20 = 0;
          int v81 = 0;
        }
        self = v83;
LABEL_36:

        if (v31)
        {
          if (v20) {
            goto LABEL_42;
          }
LABEL_48:

          int v81 = 0;
          uint64_t v15 = v76;
          goto LABEL_86;
        }
      }
      if ((v20 & 1) == 0)
      {
        __int16 v40 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[WBSSavedAccountStore _moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue:isForAlreadyExitedGroup:](v90, &v91, v40);
        }
        goto LABEL_48;
      }
LABEL_42:

      if ((v78 & 2) == 0)
      {
        uint64_t v15 = v76;
        goto LABEL_75;
      }
      if (v82)
      {
        id v36 = [WBSPublicKeyCredentialIdentifier alloc];
        uint64_t v37 = [v17 passkeyCredentialID];
        id v38 = [v17 sharedGroupID];
        long long v39 = [(WBSPublicKeyCredentialIdentifier *)v36 initWithCredentialID:v37 groupID:v38];
        [(WBSSavedAccountStore *)self updateUserVisibleNameOnInternalQueue:v82 forPasskeyWithIdentifier:v39];
      }
      else
      {
        id v82 = 0;
      }
      uint64_t v15 = v76;
LABEL_51:
      uint64_t v41 = (void *)MEMORY[0x1E4F18D98];
      uint64_t v42 = [v17 passkeyRelyingPartyID];
      id v43 = objc_msgSend(v41, "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v42);

      id v44 = [WBSPair alloc];
      uint64_t v45 = [v17 passkeyUserHandle];
      id v46 = [(WBSPair *)v44 initWithFirst:v45 second:v43];

      int v47 = [v17 isRecentlyDeleted];
      uint64_t v48 = 16;
      if (v47) {
        uint64_t v48 = 48;
      }
      int v49 = [*(id *)((char *)&self->super.isa + v48) objectForKeyedSubscript:v46];
      id v50 = [v49 firstObject];

      if (v50)
      {
        if ([v50 isEqualForMovingSharedSavedAccountsBackToPersonalKeychainOnGroupExit:v17])
        {
          __int16 v51 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint8_t buf = 0;
            _os_log_impl(&dword_1B728F000, v51, OS_LOG_TYPE_DEFAULT, "Skipping moving saved account from group to personal keychain because there is already an identical copy in personal keychain.", buf, 2u);
          }
          [v50 _writeFormerlySharedSavedAccountMarkerForCredentialTypes:2];
          [(WBSSavedAccountStore *)self _removeSavedAccount:v17 fromGroupID:v74];
          int v52 = v81;
          goto LABEL_85;
        }
        if ([v17 isRecentlyDeleted])
        {
          [(WBSSavedAccountStore *)self _removeSavedAccount:v50 fromGroupID:&stru_1F105D3F0];
          uint64_t v53 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
          int v54 = objc_msgSend(v53, "safari_copySavedAccountWithPasskeyToPersonalKeychain:", v17);

          int v52 = v54 & v81;
          if (v54 && !v75)
          {
            int v52 = v81;
            [(WBSSavedAccountStore *)self _removeSavedAccount:v17 fromGroupID:v74];
          }
          goto LABEL_85;
        }
        id v55 = [v17 lastModifiedDate];
        char v56 = [v50 lastModifiedDate];
        char v57 = [v55 earlierDate:v56];
        id v79 = v55;
        LODWORD(v55) = [v57 isEqual:v55];

        char v58 = WBS_LOG_CHANNEL_PREFIXPasswords();
        BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
        if (v55)
        {
          if (v59)
          {
            *(_WORD *)uint8_t buf = 0;
            _os_log_impl(&dword_1B728F000, v58, OS_LOG_TYPE_DEFAULT, "Moving shared passkey into Recently Deleted for personal keychain because there is already a more recently modified conflicting passkey in personal keychain.", buf, 2u);
          }
          char v60 = [(WBSSavedAccountStore *)self _moveCredentialTypesToRecentlyDeletedOnInternalQueue:2 fromSavedAccount:v17];
          if (v60)
          {
            long long v61 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
            char v62 = objc_msgSend(v61, "safari_copySavedAccountWithPasskeyToPersonalKeychain:", v60);

            if (v62)
            {
              if (!v75) {
                [(WBSSavedAccountStore *)self _removeSavedAccount:v60 fromGroupID:v74];
              }
              int v52 = v81;
              goto LABEL_84;
            }
            uint64_t v70 = WBS_LOG_CHANNEL_PREFIXPasswords();
            if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
LABEL_83:
              int v52 = 0;
LABEL_84:

              goto LABEL_85;
            }
            *(_DWORD *)uint8_t buf = 138477827;
            id v95 = v74;
            long long v68 = v70;
            long long v69 = "Failed to copy saved account with passkey back to personal keychain on exit from group %{private}@.";
          }
          else
          {
            long long v67 = WBS_LOG_CHANNEL_PREFIXPasswords();
            if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
              goto LABEL_83;
            }
            *(_DWORD *)uint8_t buf = 138477827;
            id v95 = v74;
            long long v68 = v67;
            long long v69 = "Failed to move saved account with passkey back to personal keychain on exit from group %{private}@.";
          }
          _os_log_error_impl(&dword_1B728F000, v68, OS_LOG_TYPE_ERROR, v69, buf, 0xCu);
          goto LABEL_83;
        }
        if (v59)
        {
          *(_WORD *)uint8_t buf = 0;
          _os_log_impl(&dword_1B728F000, v58, OS_LOG_TYPE_DEFAULT, "Moving passkey already in personal keychain into Recently Deleted because there is a more recently modified conflicting passkey being moved to the personal keychain from a group.", buf, 2u);
        }
        id v63 = [(WBSSavedAccountStore *)self _moveCredentialTypesToRecentlyDeletedOnInternalQueue:2 fromSavedAccount:v50];
      }
      long long v64 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
      char v65 = objc_msgSend(v64, "safari_copySavedAccountWithPasskeyToPersonalKeychain:", v17);

      if (v65)
      {
        [(WBSSavedAccountStore *)self _addSavedAccount:v17 toCachedDictionaryForSavedAccountsWithPasskeysForGroupID:&stru_1F105D3F0];

        goto LABEL_75;
      }
      uint64_t v66 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint8_t buf = 138477827;
        id v95 = v74;
        _os_log_error_impl(&dword_1B728F000, v66, OS_LOG_TYPE_ERROR, "Failed to copy saved account with passkey back to personal keychain on exit from group %{private}@.", buf, 0xCu);
      }
      int v52 = 0;
LABEL_85:

      int v81 = v52;
LABEL_86:

      ++v16;
    }
    while (v16 != v15);
    uint64_t v71 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
    uint64_t v15 = v71;
  }
  while (v71);
LABEL_93:

  self->_shouldIgnoreKeychainUpdates = 0;
  if ([obj count])
  {
    [(WBSSavedAccountStore *)self reset];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __145__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue_isForAlreadyExitedGroup___block_invoke_320;
    block[3] = &unk_1E615A768;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if (v75)
  {
    [(WBSSavedAccountStore *)self _recordGroupIdentifierForExitCleanup:v74 completionHandler:&__block_literal_global_323];
    [(WBSSavedAccountStore *)self _removeGroupID:v74 fromArrayForUserDefaultsKey:@"groupIdentifiersToMoveContributedCredentialsBackToPersonalKeychainFrom"];
  }
  long long v72 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 138477827;
    id v95 = v74;
    _os_log_impl(&dword_1B728F000, v72, OS_LOG_TYPE_DEFAULT, "Ended sweep to move contributed credentials back to personal keychain from groupID: %{private}@", buf, 0xCu);
  }

  return v81 & 1;
}

uint64_t __145__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue_isForAlreadyExitedGroup___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentUserOriginalContributor];
}

uint64_t __145__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue_isForAlreadyExitedGroup___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualForMovingSharedSavedAccountsBackToPersonalKeychainOnGroupExit:*(void *)(a1 + 32)];
}

uint64_t __145__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue_isForAlreadyExitedGroup___block_invoke_320(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSavedAccountStoreDidChangeNotification];
}

- (void)_addGroupID:(id)a3 toArrayForUserDefaultsKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138478083;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1B728F000, v7, OS_LOG_TYPE_DEFAULT, "Logging groupID %{private}@ in user defaults list %@", (uint8_t *)&v12, 0x16u);
  }
  char v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v9 = [v8 valueForKey:v6];
  id v10 = (void *)[v9 mutableCopy];

  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F1CA48] array];
  }
  [v10 addObject:v5];
  char v11 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v11 setValue:v10 forKey:v6];
}

- (void)_removeGroupID:(id)a3 fromArrayForUserDefaultsKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1B728F000, v7, OS_LOG_TYPE_DEFAULT, "Removing groupID %@ from user defaults list %@", (uint8_t *)&v12, 0x16u);
  }
  char v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v9 = [v8 valueForKey:v6];
  id v10 = (void *)[v9 mutableCopy];

  if (v10)
  {
    [v10 removeObject:v5];
    char v11 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v11 setValue:v10 forKey:v6];
  }
}

- (void)_addSavedAccount:(id)a3 toCachedDictionaryForSavedAccountsWithPasswordsForGroupID:(id)a4
{
  id v34 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
    if (!groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts)
    {
      char v8 = [MEMORY[0x1E4F1CA60] dictionary];
      id v9 = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
      self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = v8;

      groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
    }
    id v10 = [(NSMutableDictionary *)groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts objectForKeyedSubscript:v6];

    if (!v10)
    {
      char v11 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts setObject:v11 forKeyedSubscript:v6];
    }
    int v12 = [(NSMutableDictionary *)self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts objectForKeyedSubscript:v6];
  }
  else
  {
    personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    if (!personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts)
    {
      __int16 v14 = [MEMORY[0x1E4F1CA60] dictionary];
      id v15 = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
      self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = v14;

      personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    }
    int v12 = personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  }
  uint64_t v16 = v12;
  BOOL v17 = [v34 highLevelDomain];
  char v18 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:v17];

  if (!v18)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    char v20 = [v34 highLevelDomain];
    [(NSMutableDictionary *)v16 setObject:v19 forKeyedSubscript:v20];
  }
  char v21 = [v34 highLevelDomain];
  id v22 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:v21];
  uint64_t v23 = [v34 user];
  uint64_t v24 = [v22 objectForKeyedSubscript:v23];

  if (!v24)
  {
    id v25 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v26 = [v34 highLevelDomain];
    int v27 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:v26];
    dispatch_time_t v28 = [v34 user];
    [v27 setObject:v25 forKeyedSubscript:v28];
  }
  BOOL v29 = [v34 highLevelDomain];
  long long v30 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:v29];
  char v31 = [v34 user];
  id v32 = [v30 objectForKeyedSubscript:v31];
  long long v33 = [v34 password];
  [v32 setObject:v34 forKeyedSubscript:v33];
}

- (void)_removeSavedAccount:(id)a3 fromCachedDictionaryForSavedAccountsWithPasswordsForGroupID:(id)a4
{
  id v14 = a4;
  id v6 = a3;
  if ([v14 length])
  {
    id v7 = [(NSMutableDictionary *)self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts objectForKeyedSubscript:v14];
    char v8 = [v6 highLevelDomain];
    id v9 = [v7 objectForKeyedSubscript:v8];
    id v10 = [v6 user];
    char v11 = [v9 objectForKeyedSubscript:v10];
  }
  else
  {
    personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    id v7 = [v6 highLevelDomain];
    char v8 = [(NSMutableDictionary *)personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts objectForKeyedSubscript:v7];
    id v9 = [v6 user];
    char v11 = [v8 objectForKeyedSubscript:v9];
  }

  id v13 = [v6 password];

  [v11 removeObjectForKey:v13];
}

- (void)_addSavedAccount:(id)a3 toCachedDictionaryForSavedAccountsWithPasskeysForGroupID:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
    if (!groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys)
    {
      char v8 = [MEMORY[0x1E4F1CA60] dictionary];
      id v9 = self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
      self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = v8;

      groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
    }
    id v10 = [(NSMutableDictionary *)groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys objectForKeyedSubscript:v6];

    if (!v10)
    {
      char v11 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys setObject:v11 forKeyedSubscript:v6];
    }
    int v12 = [(NSMutableDictionary *)self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys objectForKeyedSubscript:v6];
  }
  else
  {
    personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
    if (!personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys)
    {
      id v14 = [MEMORY[0x1E4F1CA60] dictionary];
      id v15 = self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
      self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = v14;

      personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
    }
    int v12 = personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
  }
  uint64_t v16 = v12;
  BOOL v17 = (void *)MEMORY[0x1E4F18D98];
  char v18 = [v24 passkeyRelyingPartyID];
  uint64_t v19 = objc_msgSend(v17, "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v18);

  char v20 = [WBSPair alloc];
  char v21 = [v24 passkeyUserHandle];
  id v22 = [(WBSPair *)v20 initWithFirst:v21 second:v19];

  uint64_t v23 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:v22];
  if (!v23)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    [(NSMutableDictionary *)v16 setObject:v23 forKeyedSubscript:v22];
  }
  [v23 addObject:v24];
}

- (void)_removeSavedAccount:(id)a3 fromCachedDictionaryForSavedAccountsWithPasskeysForGroupID:(id)a4
{
  id v15 = a4;
  id v6 = (void *)MEMORY[0x1E4F18D98];
  id v7 = a3;
  char v8 = [v7 passkeyRelyingPartyID];
  id v9 = objc_msgSend(v6, "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v8);

  id v10 = [WBSPair alloc];
  char v11 = [v7 passkeyUserHandle];

  int v12 = [(WBSPair *)v10 initWithFirst:v11 second:v9];
  if ([v15 length])
  {
    id v13 = [(NSMutableDictionary *)self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys objectForKeyedSubscript:v15];
  }
  else
  {
    id v13 = self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
  }
  id v14 = v13;
  [(NSMutableDictionary *)v13 removeObjectForKey:v12];
}

- (id)_allInternetPasswordEntriesFromGroupID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F18D90];
  id v4 = a3;
  id v5 = [v3 sharedCredentialStorage];
  id v6 = objc_msgSend(v5, "safari_allPasswordCredentialItemsFromGroupID:", v4);

  return v6;
}

- (void)_addNewGroupToCachedSharingGroups:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__WBSSavedAccountStore__addNewGroupToCachedSharingGroups___block_invoke;
  v7[3] = &unk_1E615A6C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __58__WBSSavedAccountStore__addNewGroupToCachedSharingGroups___block_invoke(uint64_t a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 144);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 144);
    *(void *)(v4 + 144) = v3;

    unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 144);
  }
  uint64_t v6 = [v2 arrayByAddingObject:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 144);
  *(void *)(v7 + 144) = v6;

  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(void *)(v9 + 24))
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v10;

    uint64_t v9 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v9 + 32))
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 32);
    *(void *)(v14 + 32) = v13;
  }
  id v19 = [*(id *)(a1 + 40) groupID];
  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  [*(id *)(*(void *)(a1 + 32) + 136) setObject:v16 forKeyedSubscript:v19];

  BOOL v17 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v17 forKeyedSubscript:v19];

  char v18 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:v18 forKeyedSubscript:v19];
}

- (void)_clearExpiredRecentlyDeletedNotificationDates
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v3 = [v2 dictionaryForKey:@"lastRecentlyDeletedNotificationDateDictionary"];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v7 = [v5 dateByAddingUnit:16 value:-30 toDate:v6 options:0];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = objc_msgSend(v4, "allKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v14 = [v4 objectForKeyedSubscript:v13];
          id v15 = [v14 earlierDate:v7];
          int v16 = [v15 isEqual:v14];

          if (v16) {
            [v4 removeObjectForKey:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (NSArray)sharedSavedAccountsInRecentlyDeletedToNotifyUserAbout
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  int v4 = [v3 BOOLForKey:@"DebugIgnoreLastNotificationDateAndFiveDayGracePeriodForRecentlyDeletedNotifications"];

  if (v4)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v5 removeObjectForKey:@"DebugIgnoreLastNotificationDateAndFiveDayGracePeriodForRecentlyDeletedNotifications"];
  }
  id v36 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  char v31 = self;
  uint64_t v6 = [(WBSSavedAccountStore *)self allRecentlyDeletedSavedAccounts];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    int v35 = v4;
    id v34 = v6;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (([v11 isSavedInPersonalKeychain] & 1) == 0)
        {
          if ([v11 isCurrentUserOriginalContributor])
          {
            int v12 = [v11 participantIDThatMovedSavedAccountToRecentlyDeleted];
            uint64_t v13 = [v11 originalContributorParticipantID];
            char v14 = [v12 isEqual:v13];

            if ((v14 & 1) == 0)
            {
              id v15 = [MEMORY[0x1E4F1C9C8] now];
              int v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
              long long v17 = [v11 lastModifiedDate];
              long long v18 = [v16 dateByAddingUnit:16 value:30 toDate:v17 options:0];

              if ((objc_msgSend(v15, "safari_numberOfDaysUntilDate:", v18) & 0x8000000000000000) == 0)
              {
                if (v4)
                {
                  [v36 addObject:v11];
                }
                else
                {
                  long long v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
                  long long v20 = [v19 dateByAddingUnit:16 value:-5 toDate:v15 options:0];

                  char v21 = [v11 lastModifiedDate];
                  uint64_t v22 = [v21 earlierDate:v20];
                  char v23 = [v22 isEqual:v20];

                  if ((v23 & 1) == 0)
                  {
                    id v24 = [MEMORY[0x1E4F1C9A8] currentCalendar];
                    id v25 = [v24 dateByAddingUnit:16 value:-7 toDate:v15 options:0];

                    uint64_t v26 = [v11 lastRecentlyDeletedNotificationDate];
                    if (!v26) {
                      goto LABEL_17;
                    }
                    int v27 = (void *)v26;
                    long long v33 = [v11 lastRecentlyDeletedNotificationDate];
                    dispatch_time_t v28 = [v33 earlierDate:v25];
                    char v32 = [v28 isEqual:v25];

                    if ((v32 & 1) == 0)
                    {
LABEL_17:
                      [v36 addObject:v11];
                      [v11 setLastRecentlyDeletedNotificationDate:v15];
                    }
                  }
                  int v4 = v35;
                  uint64_t v6 = v34;
                }
              }
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v8);
  }

  [(WBSSavedAccountStore *)v31 _clearExpiredRecentlyDeletedNotificationDates];
  BOOL v29 = (void *)[v36 copy];

  return (NSArray *)v29;
}

- (void)_recordGroupIdentifierForMovingContributedCredentialsBackToPersonalKeychain:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(WBSSavedAccountStore *)self _addGroupID:v4 toArrayForUserDefaultsKey:@"groupIdentifiersToMoveContributedCredentialsBackToPersonalKeychainFrom"];
  }
  else
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WBSSavedAccountStore _recordGroupIdentifierForMovingContributedCredentialsBackToPersonalKeychain:]();
    }
  }
}

- (void)_recordGroupIdentifierForExitCleanup:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  if (![v6 length])
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSavedAccountStore _recordGroupIdentifierForMovingContributedCredentialsBackToPersonalKeychain:]();
      if (!v7) {
        goto LABEL_6;
      }
    }
    else if (!v7)
    {
      goto LABEL_6;
    }
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"com.apple.AuthenticationServices.CredentialSharingGroupsErrorDomain", 1, @"Failed find group with given group ID.");
    v7[2](v7, v9);

    goto LABEL_6;
  }
  [(WBSSavedAccountStore *)self _addGroupID:v6 toArrayForUserDefaultsKey:@"groupIdentifiersToDeleteAllItemsFrom"];
  [(WBSSavedAccountStore *)self _performCleanupForExitedGroupsIfNecessary:v7];
LABEL_6:
}

- (BOOL)_hasPersonWithParticipantID:(id)a3 contributedSavedAccountsToGroupWithID:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(WBSSavedAccountStore *)self savedAccountsForGroupID:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__WBSSavedAccountStore__hasPersonWithParticipantID_contributedSavedAccountsToGroupWithID___block_invoke;
  v10[3] = &unk_1E615D338;
  id v11 = v6;
  id v8 = v6;
  LOBYTE(v6) = objc_msgSend(v7, "safari_containsObjectPassingTest:", v10);

  return (char)v6;
}

uint64_t __90__WBSSavedAccountStore__hasPersonWithParticipantID_contributedSavedAccountsToGroupWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 originalContributorParticipantID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __86__WBSSavedAccountStore__moveContributedSavedAccountsBackToPersonalKeychainIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 224) = 1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v13;
    *(void *)&long long v4 = 138412290;
    long long v10 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue:isForAlreadyExitedGroup:", v8, 1, v10) & 1) == 0)
        {
          uint64_t v9 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint8_t buf = v10;
            uint64_t v17 = v8;
            _os_log_error_impl(&dword_1B728F000, v9, OS_LOG_TYPE_ERROR, "Failed to move contributed credentials back to personal keychain from group ID: %@", buf, 0xCu);
          }
        }
        [*(id *)(a1 + 32) _removeGroupID:v8 fromArrayForUserDefaultsKey:@"groupIdentifiersToMoveContributedCredentialsBackToPersonalKeychainFrom"];
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 224) = 0;
  [*(id *)(a1 + 32) reset];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__WBSSavedAccountStore__moveContributedSavedAccountsBackToPersonalKeychainIfNecessary__block_invoke_327;
  block[3] = &unk_1E615A768;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __86__WBSSavedAccountStore__moveContributedSavedAccountsBackToPersonalKeychainIfNecessary__block_invoke_327(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSavedAccountStoreDidChangeNotification];
}

void __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = +[WBSOngoingSharingGroupProvider sharedProvider];
    uint64_t v7 = [v6 cachedGroups];
    uint64_t v8 = objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_331);
    uint64_t v9 = [v5 setWithArray:v8];

    *(unsigned char *)(*(void *)(a1 + 32) + 224) = 1;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v26 = a1;
      char v25 = 0;
      char v13 = 0;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v17 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint8_t buf = 138477827;
            uint64_t v33 = v16;
            _os_log_impl(&dword_1B728F000, v17, OS_LOG_TYPE_DEFAULT, "Deleting all items for exited groupID: %{private}@", buf, 0xCu);
          }
          if ([v9 containsObject:v16])
          {
            long long v18 = WBS_LOG_CHANNEL_PREFIXPasswords();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint8_t buf = 138543362;
              uint64_t v33 = v16;
              _os_log_error_impl(&dword_1B728F000, v18, OS_LOG_TYPE_ERROR, "Skipping clean up for group that user still has access to: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v19 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
            int v20 = objc_msgSend(v19, "safari_deleteAllItemsForGroupID:", v16);

            if (v20)
            {
              [*(id *)(v26 + 32) _removeGroupID:v16 fromArrayForUserDefaultsKey:@"groupIdentifiersToDeleteAllItemsFrom"];
              char v21 = WBS_LOG_CHANNEL_PREFIXPasswords();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint8_t buf = 138477827;
                uint64_t v33 = v16;
                _os_log_impl(&dword_1B728F000, v21, OS_LOG_TYPE_DEFAULT, "Successfully deleted all items for exited groupID: %{private}@", buf, 0xCu);
              }
              char v13 = 1;
            }
            else
            {
              uint64_t v22 = WBS_LOG_CHANNEL_PREFIXPasswords();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)uint8_t buf = 138543362;
                uint64_t v33 = v16;
                _os_log_error_impl(&dword_1B728F000, v22, OS_LOG_TYPE_ERROR, "Failed to delete all items from group with identifier: %{public}@", buf, 0xCu);
              }
              char v25 = 1;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v12);

      a1 = v26;
      *(unsigned char *)(*(void *)(v26 + 32) + 224) = 0;
      if (v13)
      {
        [*(id *)(v26 + 32) reset];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke_332;
        block[3] = &unk_1E615A768;
        void block[4] = *(void *)(v26 + 32);
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      id v3 = 0;
      if (v25)
      {
        uint64_t v23 = *(void *)(v26 + 48);
        id v24 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", @"com.apple.AuthenticationServices.CredentialSharingGroupsErrorDomain", 3, 0);
        (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

LABEL_30:
        goto LABEL_31;
      }
    }
    else
    {

      *(unsigned char *)(*(void *)(a1 + 32) + 224) = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_30;
  }
  long long v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_31:
}

uint64_t __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke_328(uint64_t a1, void *a2)
{
  return [a2 groupID];
}

uint64_t __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke_332(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSavedAccountStoreDidChangeNotification];
}

- (void)performTaskEnsuringAllAccountSourcesAreLoadedOnQueue:(id)a3 task:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__WBSSavedAccountStore_performTaskEnsuringAllAccountSourcesAreLoadedOnQueue_task___block_invoke;
  block[3] = &unk_1E615A8F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __82__WBSSavedAccountStore_performTaskEnsuringAllAccountSourcesAreLoadedOnQueue_task___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 144) && *(void *)(v2 + 72))
  {
    id v3 = *(NSObject **)(a1 + 40);
    long long v4 = *(void **)(a1 + 48);
    dispatch_async(v3, v4);
  }
  else
  {
    uint64_t v5 = +[WBSOngoingSharingGroupProvider sharedProvider];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 120);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__WBSSavedAccountStore_performTaskEnsuringAllAccountSourcesAreLoadedOnQueue_task___block_invoke_2;
    v8[3] = &unk_1E615D880;
    void v8[4] = v6;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    [v5 performTaskEnsuringGroupsAreLoadedOnQueue:v7 task:v8];
  }
}

void __82__WBSSavedAccountStore_performTaskEnsuringAllAccountSourcesAreLoadedOnQueue_task___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCachedSharedAccountGroupsOnInternalQueue];
  id v2 = (id)[*(id *)(a1 + 32) _savedAccounts];
  id v3 = *(NSObject **)(a1 + 40);
  long long v4 = *(void **)(a1 + 48);
  dispatch_async(v3, v4);
}

- (void)setDontSaveMarkerForSavedAccountsWithProtectionSpace:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WBSSavedAccountStore_setDontSaveMarkerForSavedAccountsWithProtectionSpace___block_invoke;
  block[3] = &unk_1E615A768;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

void __77__WBSSavedAccountStore_setDontSaveMarkerForSavedAccountsWithProtectionSpace___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F18D88]);
  id v3 = +[WBSDontSaveMarker dontSaveMarker];
  id v5 = (id)[v2 initWithUser:v3 password:@" " persistence:3];

  id v4 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  objc_msgSend(v4, "safari_setDefaultCredential:forHTMLFormProtectionSpace:", v5, *(void *)(a1 + 32));
}

- (void)removeDontSaveMarkerForProtectionSpace:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__WBSSavedAccountStore_removeDontSaveMarkerForProtectionSpace___block_invoke;
  block[3] = &unk_1E615A768;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

void __63__WBSSavedAccountStore_removeDontSaveMarkerForProtectionSpace___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  id v3 = [v2 credentialsForProtectionSpace:*(void *)(a1 + 32)];
  id v4 = (void *)[v3 copy];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__WBSSavedAccountStore_removeDontSaveMarkerForProtectionSpace___block_invoke_2;
  v6[3] = &unk_1E615D8A8;
  id v7 = v2;
  id v8 = *(id *)(a1 + 32);
  id v5 = v2;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __63__WBSSavedAccountStore_removeDontSaveMarkerForProtectionSpace___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 user];
  id v6 = +[WBSDontSaveMarker dontSaveMarker];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v11 = *MEMORY[0x1E4F18CC0];
    v12[0] = MEMORY[0x1E4F1CC38];
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v9 removeCredential:v4 forProtectionSpace:v8 options:v10];
  }
}

- (void)_updateLastOneTimeShareDateforSavedAccountIfNeeded:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__WBSSavedAccountStore__updateLastOneTimeShareDateforSavedAccountIfNeeded___block_invoke;
  v7[3] = &unk_1E615A6C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __75__WBSSavedAccountStore__updateLastOneTimeShareDateforSavedAccountIfNeeded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveSidecarOnInternalQueueForSavedAccountWithPasskey:*(void *)(a1 + 40) withBlock:&__block_literal_global_339];
}

void __75__WBSSavedAccountStore__updateLastOneTimeShareDateforSavedAccountIfNeeded___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    id v5 = a3;
    id v6 = [v4 date];
    [v5 setLastOneTimeShareDateForPasskey:v6];
  }
}

- (id)_moveCredentialTypesToRecentlyDeleted:(int64_t)a3 fromSavedAccount:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__15;
  uint64_t v19 = __Block_byref_object_dispose__15;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__WBSSavedAccountStore__moveCredentialTypesToRecentlyDeleted_fromSavedAccount___block_invoke;
  v11[3] = &unk_1E615D8D0;
  id v13 = &v15;
  int64_t v14 = a3;
  void v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __79__WBSSavedAccountStore__moveCredentialTypesToRecentlyDeleted_fromSavedAccount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _moveCredentialTypesToRecentlyDeletedOnInternalQueue:*(void *)(a1 + 56) fromSavedAccount:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_moveCredentialTypesToRecentlyDeletedOnInternalQueue:(int64_t)a3 fromSavedAccount:(id)a4
{
  id v6 = a4;
  [(WBSSavedAccountStore *)self _ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount:v6];
  int v7 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  char v8 = objc_msgSend(v7, "safari_moveCredentialTypesToRecentlyDeleted:onSavedAccount:", a3, v6);

  if (v8)
  {
    if ([v6 credentialTypes] == a3) {
      a3 = 3;
    }
    [v6 setLastRecentlyDeletedNotificationDate:0];
    id v9 = v6;
    id v10 = v9;
    int64_t v11 = a3 - 1;
    id v12 = 0;
    switch(v11)
    {
      case 0:
        id v13 = [v9 _movePasswordCredentialToNewSavedAccount];
        [v13 setIsRecentlyDeleted:1];
        int64_t v14 = [v13 totpGenerators];
        uint64_t v15 = [v14 count];

        if (v15) {
          [v10 setTOTPGenerator:0];
        }
        goto LABEL_11;
      case 1:
        id v13 = [v9 _movePasskeyCredentialToNewSavedAccount];
        [v13 setIsRecentlyDeleted:1];
LABEL_11:
        [(WBSSavedAccountStore *)self _addSavedAccountToRecentlyDeletedCachedCollections:v13];

        goto LABEL_14;
      case 2:
        [v9 setIsRecentlyDeleted:1];
        [(WBSSavedAccountStore *)self _removeSavedAccount:v10 fromCachedCollectionsForCredentialTypes:3];
        [(WBSSavedAccountStore *)self _addSavedAccountToRecentlyDeletedCachedCollections:v10];
        goto LABEL_13;
      case 3:
        goto LABEL_19;
      default:
LABEL_13:
        id v13 = v10;
LABEL_14:
        if ([v13 isSavedInSharedGroup])
        {
          uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
          int v18 = [v17 BOOLForKey:@"useOriginalContributorWorkaround"];

          if (v18)
          {
            dispatch_time_t v19 = dispatch_time(0, 1000000000);
            queue = self->_queue;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __94__WBSSavedAccountStore__moveCredentialTypesToRecentlyDeletedOnInternalQueue_fromSavedAccount___block_invoke;
            block[3] = &unk_1E615A768;
            id v23 = v13;
            dispatch_after(v19, queue, block);
          }
          else
          {
            [v13 markParticipantIDThatMovedSavedAccountToRecentlyDeleted];
          }
        }
        id v10 = v13;
        id v12 = v10;
LABEL_19:

        break;
    }
  }
  else
  {
    uint64_t v16 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[WBSSavedAccountStore _moveCredentialTypesToRecentlyDeletedOnInternalQueue:fromSavedAccount:]();
    }
    id v12 = 0;
  }

  return v12;
}

uint64_t __94__WBSSavedAccountStore__moveCredentialTypesToRecentlyDeletedOnInternalQueue_fromSavedAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) markParticipantIDThatMovedSavedAccountToRecentlyDeleted];
}

- (void)_ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount:(id)a3
{
  id v4 = a3;
  [(WBSSavedAccountStore *)self _ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__WBSSavedAccountStore__ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount___block_invoke;
  aBlock[3] = &unk_1E615D8F8;
  id v5 = v4;
  id v19 = v5;
  id v20 = self;
  id v6 = _Block_copy(aBlock);
  if ([v5 isSavedInSharedGroup])
  {
    sharedGroupIdentifiersToRecentlyDeletedSavedAccounts = self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts;
    char v8 = [v5 sharedGroupID];
    id v9 = [(NSMutableDictionary *)sharedGroupIdentifiersToRecentlyDeletedSavedAccounts objectForKeyedSubscript:v8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__WBSSavedAccountStore__ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount___block_invoke_341;
    v16[3] = &unk_1E615D920;
    id v10 = &v17;
    uint64_t v17 = v6;
    id v11 = v6;
    [v9 enumerateObjectsUsingBlock:v16];
  }
  else
  {
    recentlyDeletedSavedAccountsInPersonalKeychain = self->_recentlyDeletedSavedAccountsInPersonalKeychain;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86__WBSSavedAccountStore__ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount___block_invoke_2;
    v14[3] = &unk_1E615D920;
    id v10 = &v15;
    uint64_t v15 = v6;
    id v13 = v6;
    [(NSMutableArray *)recentlyDeletedSavedAccountsInPersonalKeychain enumerateObjectsUsingBlock:v14];
  }
}

void __86__WBSSavedAccountStore__ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldOverrideRecentlyDeletedSavedAccountWhenDeleted:v3])
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = [v3 user];
      int v7 = [v3 highLevelDomain];
      int v8 = 141558787;
      uint64_t v9 = 1752392040;
      __int16 v10 = 2117;
      id v11 = v6;
      __int16 v12 = 2160;
      uint64_t v13 = 1752392040;
      __int16 v14 = 2117;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEFAULT, "Deleting account for %{sensitive, mask.hash}@ on %{sensitive, mask.hash}@ from recently deleted to make room for another account", (uint8_t *)&v8, 0x2Au);
    }
    [*(id *)(a1 + 40) _removeCredentialTypes:3 forSavedAccount:v3];
  }
}

uint64_t __86__WBSSavedAccountStore__ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount___block_invoke_341(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __86__WBSSavedAccountStore__ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_recoverRecentlyDeletedSavedAccount:(id)a3
{
  id v4 = a3;
  if (([v4 isRecentlyDeleted] & 1) == 0)
  {
    __int16 v10 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSSavedAccountStore _recoverRecentlyDeletedSavedAccount:]();
    }
    goto LABEL_10;
  }
  id v5 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  char v6 = objc_msgSend(v5, "safari_recoverSavedAccountFromRecentlyDeleted:", v4);

  if ((v6 & 1) == 0)
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WBSSavedAccountStore _recoverRecentlyDeletedSavedAccount:]();
    }
LABEL_10:
    BOOL v9 = 0;
    goto LABEL_11;
  }
  queue = self->_queue;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __60__WBSSavedAccountStore__recoverRecentlyDeletedSavedAccount___block_invoke;
  uint64_t v16 = &unk_1E615A6C8;
  id v8 = v4;
  id v17 = v8;
  int v18 = self;
  dispatch_sync(queue, &v13);
  if (objc_msgSend(v8, "isSavedInSharedGroup", v13, v14, v15, v16)) {
    [v8 clearParticipantIDThatMovedSavedAccountToRecentlyDeleted];
  }

  BOOL v9 = 1;
LABEL_11:

  return v9;
}

uint64_t __60__WBSSavedAccountStore__recoverRecentlyDeletedSavedAccount___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsRecentlyDeleted:0];
  [*(id *)(a1 + 40) _removeSavedAccountFromRecentlyDeletedCachedCollections:*(void *)(a1 + 32)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setLastRecentlyDeletedNotificationDate:0];
}

- (void)savedAccountsMatchingCriteria:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 138739971;
    id v16 = v6;
    _os_log_impl(&dword_1B728F000, v8, OS_LOG_TYPE_DEFAULT, "Enqueueing asynchronous query for saved accounts matching criteria %{sensitive}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__WBSSavedAccountStore_savedAccountsMatchingCriteria_withCompletionHandler___block_invoke;
  block[3] = &unk_1E615B8D8;
  id v13 = v6;
  id v14 = v7;
  void block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __76__WBSSavedAccountStore_savedAccountsMatchingCriteria_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) _getSavedAccountsMatchingCriteriaOnInternalQueue:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_getSavedAccountsMatchingCriteriaOnInternalQueue:(id)a3
{
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEFAULT, "Beginning query for saved accounts matching criteria", buf, 2u);
  }
  id v6 = [v4 context];

  if (!v6)
  {
    id v7 = +[WBSSavedAccountContext defaultContext];
    [v4 setContext:v7];
  }
  if (!self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts) {
    id v8 = [(WBSSavedAccountStore *)self _loadSavedAccounts];
  }
  BOOL v9 = [(WBSSavedAccountStore *)self _fetchCurrentAutoFillPasskeysWithCriteria:v4];
  id v10 = [v9 first];
  id v11 = [v9 second];
  __int16 v12 = [v4 passkeyCredentialIdentifier];
  id v13 = [(WBSSavedAccountStore *)self _relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue:v12 credentialIdentifiersToAutoFillPasskeys:v10];

  id v14 = [(WBSSavedAccountStore *)self _getSavedAccountTreeMatchesWithCriteriaOnInternalQueue:v4 relyingPartyURL:v13];
  uint64_t v15 = [v10 allValues];
  id v16 = [v15 firstObject];
  uint64_t v17 = [v16 requestUsedNonEmptyAllowList];

  int v18 = [v10 allKeys];
  [(WBSSavedAccountStore *)self _pruneSavedAccountTreeMatchesOnInternalQueue:v14 basedOnUsernameAndPasswordCriteria:v4 autoFillPasskeyIdentifiers:v18 keepAllPasskeyMatches:v17];

  id v19 = [(WBSSavedAccountStore *)self _getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue:v14 withCriteria:v4 mergingAutoFillPasskeys:v10 nearbyDeviceOptions:v11];
  id v20 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_1B728F000, v20, OS_LOG_TYPE_DEFAULT, "Finished query for saved accounts matching criteria", v22, 2u);
  }

  return v19;
}

- (void)getSavedAccountsMatchingCriteria:(id)a3 withSynchronousCompletionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138739971;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1B728F000, v8, OS_LOG_TYPE_DEFAULT, "Enqueueing synchronous query for saved accounts matching criteria %{sensitive}@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__15;
  uint64_t v17 = __Block_byref_object_dispose__15;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__WBSSavedAccountStore_getSavedAccountsMatchingCriteria_withSynchronousCompletionHandler___block_invoke;
  block[3] = &unk_1E615A6F0;
  p_long long buf = &buf;
  void block[4] = self;
  id v10 = v6;
  id v12 = v10;
  dispatch_sync(queue, block);
  v7[2](v7, *(void *)(*((void *)&buf + 1) + 40));

  _Block_object_dispose(&buf, 8);
}

void __90__WBSSavedAccountStore_getSavedAccountsMatchingCriteria_withSynchronousCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _getSavedAccountsMatchingCriteriaOnInternalQueue:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)getSavedAccountWithPasskeyCredentialForUserHandle:(id)a3 protectionSpace:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[WBSPair alloc] initWithFirst:v7 second:v6];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__15;
  id v20 = __Block_byref_object_dispose__15;
  id v21 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__WBSSavedAccountStore_getSavedAccountWithPasskeyCredentialForUserHandle_protectionSpace___block_invoke;
  block[3] = &unk_1E615BBE0;
  id v14 = v8;
  uint64_t v15 = &v16;
  void block[4] = self;
  id v10 = v8;
  dispatch_sync(queue, block);
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __90__WBSSavedAccountStore_getSavedAccountWithPasskeyCredentialForUserHandle_protectionSpace___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureDomainsToUsersExists];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue:(id)a3 credentialIdentifiersToAutoFillPasskeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    uint64_t v29 = 0;
    long long v30 = &v29;
    uint64_t v31 = 0x3032000000;
    char v32 = __Block_byref_object_copy__15;
    uint64_t v33 = __Block_byref_object_dispose__15;
    id v34 = 0;
    passkeysDataInPersonalKeychain = self->_passkeysDataInPersonalKeychain;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __126__WBSSavedAccountStore__relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue_credentialIdentifiersToAutoFillPasskeys___block_invoke;
    v27[3] = &unk_1E615D948;
    id v10 = v6;
    id v28 = v10;
    uint64_t v11 = [(NSArray *)passkeysDataInPersonalKeychain safari_firstObjectPassingTest:v27];
    id v12 = (void *)v30[5];
    v30[5] = v11;

    id v13 = (void *)v30[5];
    if (v13) {
      goto LABEL_4;
    }
    id v14 = [(NSDictionary *)self->_groupIdentifiersToPasskeysData allValues];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __126__WBSSavedAccountStore__relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue_credentialIdentifiersToAutoFillPasskeys___block_invoke_2;
    v24[3] = &unk_1E615D970;
    uint64_t v26 = &v29;
    id v25 = v10;
    [v14 enumerateObjectsUsingBlock:v24];

    id v13 = (void *)v30[5];
    if (v13)
    {
LABEL_4:
      uint64_t v15 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v16 = [v13 objectForKeyedSubscript:@"CredentialRelyingPartyID"];
      uint64_t v17 = [@"https://" stringByAppendingString:v16];
      uint64_t v18 = [v15 URLWithString:v17];
    }
    else
    {
      uint64_t v18 = 0;
    }

    _Block_object_dispose(&v29, 8);
  }
  else if ([v7 count])
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v19 setScheme:@"https"];
    id v20 = [v8 allValues];
    id v21 = [v20 firstObject];
    uint64_t v22 = [v21 relyingPartyIdentifier];
    [v19 setHost:v22];

    uint64_t v18 = [v19 URL];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

uint64_t __126__WBSSavedAccountStore__relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue_credentialIdentifiersToAutoFillPasskeys___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"CredentialID"];
  uint64_t v4 = [v3 isEqualToData:*(void *)(a1 + 32)];

  return v4;
}

void __126__WBSSavedAccountStore__relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue_credentialIdentifiersToAutoFillPasskeys___block_invoke_2(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __126__WBSSavedAccountStore__relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue_credentialIdentifiersToAutoFillPasskeys___block_invoke_3;
  v7[3] = &unk_1E615D948;
  id v8 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(a2, "safari_firstObjectPassingTest:", v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __126__WBSSavedAccountStore__relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue_credentialIdentifiersToAutoFillPasskeys___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"CredentialID"];
  uint64_t v4 = [v3 isEqualToData:*(void *)(a1 + 32)];

  return v4;
}

- (id)_getSavedAccountTreeMatchesWithCriteriaOnInternalQueue:(id)a3 relyingPartyURL:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B728F000, v7, OS_LOG_TYPE_INFO, "Getting credential matches by looking through account store by high level domain.", buf, 2u);
  }
  if ([v5 queryShouldOnlyIncludePasswordsWithoutWebsites])
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = self->_savedAccountsWithPasswords;
    uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v80 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v52 = v6;
      id v54 = v5;
      uint64_t v11 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v65 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if (([v13 hasValidWebsite] & 1) == 0)
          {
            id v14 = [v13 user];
            char v78 = v14;
            BOOL v75 = v13;
            uint64_t v76 = &unk_1F1086500;
            uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
            long long v77 = v15;
            uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
            id v79 = v16;
            uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];

            uint64_t v18 = [WBSSavedAccountTreeMatch alloc];
            id v19 = [v13 highLevelDomain];
            id v20 = [(WBSSavedAccountTreeMatch *)v18 initWithDomain:v19 savedAccountTree:v17 matchLevel:2];
            id v21 = [v13 highLevelDomain];
            [v8 setObject:v20 forKeyedSubscript:v21];
          }
        }
        uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v80 count:16];
      }
      while (v10);
      id v6 = v52;
      id v5 = v54;
    }
  }
  else
  {
    id obj = [v5 URL];
    uint64_t v22 = [(NSArray *)obj host];
    id v23 = objc_msgSend(v22, "safari_highLevelDomainForPasswordManager");
    __int16 v51 = [v6 host];
    id v24 = objc_msgSend(v51, "safari_highLevelDomainForPasswordManager");
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    id v25 = [(NSMutableDictionary *)self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts objectForKeyedSubscript:v23];
    if (v25)
    {
      uint64_t v26 = [[WBSSavedAccountTreeMatch alloc] initWithDomain:v22 savedAccountTree:v25 matchLevel:4];
      [v8 setObject:v26 forKeyedSubscript:v23];
    }
    uint64_t v27 = [(NSMutableDictionary *)self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts objectForKeyedSubscript:v24];
    int v49 = (void *)v27;
    if (v27)
    {
      id v28 = [[WBSSavedAccountTreeMatch alloc] initWithDomain:v22 savedAccountTree:v27 matchLevel:4];
      [v8 setObject:v28 forKeyedSubscript:v24];
    }
    char v56 = [v5 associatedDomainsForURL];
    id v50 = v25;
    if ([v5 queryShouldReturnSavedAccountsMatchingAssociatedDomains])
    {
      int v47 = v24;
      uint64_t v48 = v22;
      char v57 = v23;
      id v53 = v6;
      id v55 = v5;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v29 = v56;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v60 objects:v74 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v61;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v61 != v32) {
              objc_enumerationMutation(v29);
            }
            id v34 = *(void **)(*((void *)&v60 + 1) + 8 * j);
            uint64_t v35 = objc_msgSend(v34, "safari_highLevelDomainForPasswordManager", v47, v48, v49);
            id v36 = [(NSMutableDictionary *)self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts objectForKeyedSubscript:v35];
            if (v36)
            {
              long long v37 = [v8 objectForKeyedSubscript:v35];

              if (v37)
              {
                long long v38 = WBS_LOG_CHANNEL_PREFIXAutoFill();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 138739971;
                  uint64_t v69 = (uint64_t)v57;
                  _os_log_debug_impl(&dword_1B728F000, v38, OS_LOG_TYPE_DEBUG, "Associated domain with same high level domain as query URL: %{sensitive}@", buf, 0xCu);
                }
              }
              else
              {
                long long v39 = [[WBSSavedAccountTreeMatch alloc] initWithDomain:v34 savedAccountTree:v36 matchLevel:3];
                [v8 setObject:v39 forKeyedSubscript:v35];
              }
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v60 objects:v74 count:16];
        }
        while (v31);
      }

      id v6 = v53;
      id v5 = v55;
      id v24 = v47;
      uint64_t v22 = v48;
      id v23 = v57;
      id v25 = v50;
    }
    long long v40 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = v40;
      uint64_t v42 = v24;
      uint64_t v43 = [v8 count];
      id v44 = [v56 allObjects];
      uint64_t v45 = [v44 componentsJoinedByString:@", "];
      *(_DWORD *)long long buf = 134218499;
      uint64_t v69 = v43;
      id v24 = v42;
      __int16 v70 = 2117;
      uint64_t v71 = v23;
      __int16 v72 = 2117;
      uint64_t v73 = v45;
      _os_log_impl(&dword_1B728F000, v41, OS_LOG_TYPE_DEFAULT, "Found %lu tree matches for %{sensitive}@ and associated domains: %{sensitive}@", buf, 0x20u);

      id v25 = v50;
    }
  }
  return v8;
}

- (id)_fetchCurrentAutoFillPasskeysWithCriteria:(id)a3
{
  id v4 = a3;
  if ([v4 queryShouldOmitAutoFillPasskeyMatches])
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEFAULT, "Omitting AutoFill passkey matches as requested by match criteria.", buf, 2u);
    }
    id v6 = [WBSPair alloc];
    id v7 = [(WBSPair *)v6 initWithFirst:MEMORY[0x1E4F1CC08] second:0];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    *(void *)long long buf = 0;
    uint64_t v22 = buf;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__15;
    id v25 = __Block_byref_object_dispose__15;
    id v26 = 0;
    uint64_t v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariApplicationPlatformBundleIdentifier");
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__WBSSavedAccountStore__fetchCurrentAutoFillPasskeysWithCriteria___block_invoke;
    v17[3] = &unk_1E615D998;
    id v12 = v8;
    id v18 = v12;
    id v20 = buf;
    id v13 = v9;
    id v19 = v13;
    [(WBSAuthenticationServicesAgentProxy *)authenticationServicesAgentProxy getPasskeysForRunningAssertionWithApplicationIdentifier:v11 withCompletionHandler:v17];

    dispatch_time_t v14 = dispatch_time(0, 3000000000);
    dispatch_group_wait(v13, v14);
    uint64_t v15 = [WBSPair alloc];
    id v7 = [(WBSPair *)v15 initWithFirst:v12 second:*((void *)v22 + 5)];

    _Block_object_dispose(buf, 8);
  }

  return v7;
}

void __66__WBSSavedAccountStore__fetchCurrentAutoFillPasskeysWithCriteria___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = *(void **)(a1 + 32);
        id v13 = [v11 identifier];
        [v12 setObject:v11 forKeyedSubscript:v13];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v6;
  id v16 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_pruneSavedAccountTreeMatchesOnInternalQueue:(id)a3 basedOnUsernameAndPasswordCriteria:(id)a4 autoFillPasskeyIdentifiers:(id)a5 keepAllPasskeyMatches:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v23 = a5;
  int v11 = [v10 queryShouldReturnSavedAccountsWithEmptyUsernames];
  char v12 = [v10 queryShouldIncludePasskeyMatchesForNonAutoFillContext];
  char v13 = [v10 queryShouldIncludeSavedAccountsWithDoNotSaveMarkers];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v22 = v9;
  id obj = [v9 allValues];
  uint64_t v14 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    if (v6) {
      id v17 = v23;
    }
    else {
      id v17 = (id)MEMORY[0x1E4F1CBF0];
    }
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(obj);
        }
        long long v19 = *(void **)(*((void *)&v25 + 1) + 8 * v18);
        if ((v13 & 1) == 0) {
          [*(id *)(*((void *)&v25 + 1) + 8 * v18) pruneDontSaveTrees];
        }
        if (v11) {
          [v19 pruneEmptyUsernameTrees];
        }
        long long v20 = [v10 userNameQuery];
        [v19 pruneUsernameTreesNotMatchingUserNameQuery:v20 orPasskeyIdentifiers:v17];

        id v21 = [v10 titleQuery];
        if (v21) {
          [v19 pruneUsernameTreesNotMatchingTitleQuery:v21];
        }
        if ((v12 & 1) == 0) {
          [v19 pruneTreesWithoutPasswordOrMatchingPasskeyIdentifiers:v23];
        }

        ++v18;
      }
      while (v15 != v18);
      uint64_t v15 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }
}

- (id)_getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue:(id)a3 withCriteria:(id)a4 mergingAutoFillPasskeys:(id)a5 nearbyDeviceOptions:(id)a6
{
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v127 = a6;
  int v138 = [v10 queryShouldReturnSavedAccountsMatchingHighLevelAndSimplifiedDomains];
  char v12 = [v10 URL];
  char v13 = [v12 host];
  v152 = objc_msgSend(v13, "safari_highLevelDomainForPasswordManager");
  v161 = v13;
  uint64_t v14 = [NSString stringWithFormat:@"https://%@", v13];
  v151 = objc_msgSend(v14, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 330, 0, 0);

  uint64_t v15 = [v12 port];
  uint64_t v16 = [v15 integerValue];

  v135 = v12;
  v162 = [v12 scheme];
  __int16 v126 = [v10 passkeyCredentialIdentifier];
  id v17 = [v126 base64EncodedStringWithOptions:0];
  uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  v136 = [MEMORY[0x1E4F1CA48] array];
  v137 = [MEMORY[0x1E4F1CA48] array];
  v141 = [MEMORY[0x1E4F1CA48] array];
  v145 = [MEMORY[0x1E4F1CA48] array];
  __int16 v128 = v11;
  v140 = objc_msgSend(v11, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_361);
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  id v129 = v9;
  id obj = [v9 allValues];
  v139 = v17;
  uint64_t v132 = [obj countByEnumeratingWithState:&v188 objects:v207 count:16];
  if (v132)
  {
    uint64_t v131 = *(void *)v189;
    v143 = v18;
    v144 = v10;
    do
    {
      for (uint64_t i = 0; i != v132; ++i)
      {
        if (*(void *)v189 != v131) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v188 + 1) + 8 * i);
        id v21 = [v20 flattenedSavedAccountsFromTree];
        if ([v10 queryShouldOnlyIncludePasswordsWithoutWebsites])
        {
          v133 = v21;
          uint64_t v134 = i;
          long long v186 = 0u;
          long long v187 = 0u;
          long long v184 = 0u;
          long long v185 = 0u;
          id v22 = v21;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v184 objects:v206 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v185;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v185 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void *)(*((void *)&v184 + 1) + 8 * j);
                long long v28 = [WBSSavedAccountMatch alloc];
                id v29 = [v10 context];
                uint64_t v30 = [(WBSSavedAccountMatch *)v28 initWithSavedAccount:v27 protectionSpace:0 context:v29 matchLevel:1 autoFillPasskey:0];

                [v18 addObject:v30];
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v184 objects:v206 count:16];
            }
            while (v24);
          }
LABEL_94:
          id v21 = v133;

          id v17 = v139;
          uint64_t i = v134;
        }
        else
        {
          if ([v20 matchLevel] == 4)
          {
            v133 = v21;
            uint64_t v134 = i;
            long long v182 = 0u;
            long long v183 = 0u;
            long long v180 = 0u;
            long long v181 = 0u;
            id v142 = v21;
            id v147 = (id)[v142 countByEnumeratingWithState:&v180 objects:v205 count:16];
            if (!v147) {
              goto LABEL_94;
            }
            uint64_t v146 = *(void *)v181;
            while (1)
            {
              uint64_t v31 = 0;
              uint64_t v32 = v139;
              uint64_t v33 = v145;
              do
              {
                if (*(void *)v181 != v146) {
                  objc_enumerationMutation(v142);
                }
                id v34 = *(void **)(*((void *)&v180 + 1) + 8 * (void)v31);
                int v149 = [v34 isDefaultCredentialForFullyQualifiedHostname:v161];
                uint64_t v35 = [v34 passkeyCredentialID];
                int v36 = [v35 isEqualToString:v32];

                if (v36)
                {
                  long long v37 = [WBSSavedAccountMatch alloc];
                  uint64_t v38 = [v10 context];
                  long long v39 = v34;
                  long long v40 = (void *)v38;
                  uint64_t v41 = [(WBSSavedAccountMatch *)v37 initWithSavedAccount:v39 protectionSpace:0 context:v38 matchLevel:1 autoFillPasskey:0];
                  [v33 addObject:v41];
                  goto LABEL_65;
                }
                uint64_t v42 = [v34 passkeyCredentialID];
                uint64_t v41 = [v140 objectForKeyedSubscript:v42];

                if (v41)
                {
                  uint64_t v43 = [WBSSavedAccountMatch alloc];
                  v159 = [v10 context];
                  id v44 = -[WBSSavedAccountMatch initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:](v43, "initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:", v34, 0);
                  [v33 addObject:v44];
                  long long v40 = 0;
                  goto LABEL_63;
                }
                if ([v10 queryShouldIncludePasskeyMatchesForNonAutoFillContext])
                {
                  if ([v34 credentialTypes] == 2)
                  {
                    uint64_t v45 = [v34 passkeyRelyingPartyID];
                    int v46 = [v45 isEqualToString:v161];

                    if (v46)
                    {
                      uint64_t v47 = objc_msgSend(MEMORY[0x1E4F18D98], "safari_HTMLFormProtectionSpaceForURL:", v135);
                      uint64_t v48 = [WBSSavedAccountMatch alloc];
                      int v49 = [v10 context];
                      v159 = (WBSSavedAccountMatch *)v47;
                      id v44 = [(WBSSavedAccountMatch *)v48 initWithSavedAccount:v34 protectionSpace:v47 context:v49 matchLevel:1];

                      [v143 addObject:v44];
                      long long v40 = 0;
                      goto LABEL_55;
                    }
                  }
                }
                id v50 = [v34 protectionSpaces];
                __int16 v51 = [v34 protectionSpacesForAdditionalSites];
                id v52 = [v50 arrayByAddingObjectsFromArray:v51];

                long long v178 = 0u;
                long long v179 = 0u;
                long long v176 = 0u;
                long long v177 = 0u;
                v159 = v52;
                uint64_t v155 = [(WBSSavedAccountMatch *)v159 countByEnumeratingWithState:&v176 objects:v204 count:16];
                if (!v155)
                {
                  v157 = 0;
                  goto LABEL_53;
                }
                v157 = 0;
                uint64_t v153 = *(void *)v177;
                while (2)
                {
                  for (uint64_t k = 0; k != v155; ++k)
                  {
                    if (*(void *)v177 != v153) {
                      objc_enumerationMutation(v159);
                    }
                    id v54 = *(void **)(*((void *)&v176 + 1) + 8 * k);
                    id v55 = [v54 host];
                    if ([v54 port] == v16
                      || !v16 && (objc_msgSend(v54, "safari_hasDefaultPortForProtocol") & 1) != 0)
                    {
                      BOOL v56 = 1;
                    }
                    else
                    {
                      BOOL v56 = v16 == objc_msgSend(v54, "safari_defaultPortForProtocol") && objc_msgSend(v54, "port") == 0;
                    }
                    char v57 = [v54 protocol];
                    int v58 = [v57 isEqualToString:v162];

                    BOOL v59 = objc_msgSend(v55, "safari_highLevelDomainForPasswordManager");
                    int v60 = [v59 isEqualToString:v152];

                    if (v60)
                    {
                      id v61 = v54;

                      v157 = v61;
                    }
                    int v62 = [v55 isEqualToString:v161];
                    if ((v58 & v56) == 1 && v62 != 0)
                    {
                      uint64_t v69 = v143;
                      if (v149) {
                        uint64_t v69 = v145;
                      }
                      __int16 v70 = v69;
                      uint64_t v71 = [WBSSavedAccountMatch alloc];
                      __int16 v72 = [v144 context];
                      long long v65 = [(WBSSavedAccountMatch *)v71 initWithSavedAccount:v34 protectionSpace:v54 context:v72 matchLevel:1 autoFillPasskey:0];

                      [(WBSSavedAccountMatch *)v70 addObject:v65];
LABEL_62:

                      long long v40 = v157;
                      id v44 = v159;
                      id v10 = v144;
                      uint64_t v33 = v145;
                      uint64_t v32 = v139;
                      uint64_t v41 = 0;
                      goto LABEL_63;
                    }
                    long long v64 = [NSString stringWithFormat:@"https://%@", v55];
                    objc_msgSend(v64, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 330, 0, 0);
                    long long v65 = (WBSSavedAccountMatch *)objc_claimAutoreleasedReturnValue();

                    if ([(WBSSavedAccountMatch *)v65 isEqualToString:v151])
                    {
                      uint64_t v73 = v137;
                      if (v149) {
                        uint64_t v73 = v145;
                      }
                      id v74 = v73;
                      BOOL v75 = [WBSSavedAccountMatch alloc];
                      uint64_t v76 = [v144 context];
                      __int16 v70 = [(WBSSavedAccountMatch *)v75 initWithSavedAccount:v34 protectionSpace:v54 context:v76 matchLevel:2 autoFillPasskey:0];

                      [v74 addObject:v70];
                      goto LABEL_62;
                    }
                  }
                  id v10 = v144;
                  uint64_t v155 = [(WBSSavedAccountMatch *)v159 countByEnumeratingWithState:&v176 objects:v204 count:16];
                  if (v155) {
                    continue;
                  }
                  break;
                }
LABEL_53:

                if (v138)
                {
                  long long v66 = [WBSSavedAccountMatch alloc];
                  long long v67 = [v10 context];
                  long long v68 = v34;
                  long long v40 = v157;
                  id v44 = [(WBSSavedAccountMatch *)v66 initWithSavedAccount:v68 protectionSpace:v157 context:v67 matchLevel:4 autoFillPasskey:0];

                  [v136 addObject:v44];
                  uint64_t v32 = v139;
LABEL_55:
                  uint64_t v33 = v145;
                  uint64_t v41 = 0;
LABEL_63:
                }
                else
                {
                  uint64_t v32 = v139;
                  uint64_t v41 = 0;
                  uint64_t v33 = v145;
                  long long v40 = v157;
                }

LABEL_65:
                uint64_t v31 = (char *)v31 + 1;
              }
              while (v31 != v147);
              uint64_t v77 = [v142 countByEnumeratingWithState:&v180 objects:v205 count:16];
              uint64_t v18 = v143;
              id v147 = (id)v77;
              if (!v77) {
                goto LABEL_94;
              }
            }
          }
          if ([v20 matchLevel] == 3)
          {
            v133 = v21;
            uint64_t v134 = i;
            long long v174 = 0u;
            long long v175 = 0u;
            long long v172 = 0u;
            long long v173 = 0u;
            id v148 = v21;
            uint64_t v156 = [v148 countByEnumeratingWithState:&v172 objects:v203 count:16];
            if (!v156) {
              goto LABEL_94;
            }
            uint64_t v150 = *(void *)v173;
            v154 = v20;
            while (1)
            {
              char v78 = 0;
              do
              {
                if (*(void *)v173 != v150) {
                  objc_enumerationMutation(v148);
                }
                v160 = v78;
                id v79 = *(void **)(*((void *)&v172 + 1) + 8 * (void)v78);
                uint64_t v80 = [v20 domain];
                uint64_t v81 = [v79 protectionSpaces];
                v158 = v79;
                id v82 = [v79 protectionSpacesForAdditionalSites];
                BOOL v83 = [v81 arrayByAddingObjectsFromArray:v82];

                long long v170 = 0u;
                long long v171 = 0u;
                long long v168 = 0u;
                long long v169 = 0u;
                id v84 = v83;
                uint64_t v85 = [v84 countByEnumeratingWithState:&v168 objects:v202 count:16];
                if (!v85)
                {
LABEL_86:

                  goto LABEL_88;
                }
                uint64_t v86 = v85;
                uint64_t v87 = *(void *)v169;
LABEL_78:
                uint64_t v88 = 0;
                while (1)
                {
                  if (*(void *)v169 != v87) {
                    objc_enumerationMutation(v84);
                  }
                  long long v89 = *(void **)(*((void *)&v168 + 1) + 8 * v88);
                  uint64_t v90 = [v89 host];
                  if ([v89 port] == v16)
                  {
                    uint64_t v91 = [v89 protocol];
                    int v92 = [v91 isEqualToString:v162];

                    char v93 = [v90 isEqualToString:v80];
                    if (v92)
                    {
                      if (v93) {
                        break;
                      }
                    }
                  }

                  if (v86 == ++v88)
                  {
                    uint64_t v86 = [v84 countByEnumeratingWithState:&v168 objects:v202 count:16];
                    if (!v86) {
                      goto LABEL_86;
                    }
                    goto LABEL_78;
                  }
                }
                id v94 = v89;

                if (!v94)
                {
LABEL_88:
                  id v94 = [v84 firstObject];
                }
                id v95 = [WBSSavedAccountMatch alloc];
                id v10 = v144;
                uint64_t v96 = [v144 context];
                id v97 = [(WBSSavedAccountMatch *)v95 initWithSavedAccount:v158 protectionSpace:v94 context:v96 matchLevel:3];

                if ([v158 isDefaultCredentialForFullyQualifiedHostname:v161]) {
                  __int16 v98 = v145;
                }
                else {
                  __int16 v98 = v141;
                }
                [v98 addObject:v97];

                char v78 = v160 + 1;
                long long v20 = v154;
                uint64_t v18 = v143;
              }
              while (v160 + 1 != (char *)v156);
              uint64_t v156 = [v148 countByEnumeratingWithState:&v172 objects:v203 count:16];
              if (!v156) {
                goto LABEL_94;
              }
            }
          }
        }
      }
      uint64_t v132 = [obj countByEnumeratingWithState:&v188 objects:v207 count:16];
    }
    while (v132);
  }

  uint64_t v99 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v100 = v99;
    uint64_t v101 = [v135 host];
    v102 = [v10 userNameQuery];
    id v103 = [v102 string];
    v104 = [v10 userNameQuery];
    v105 = [v104 matchingTypeDescriptionString];
    *(_DWORD *)long long buf = 141559043;
    uint64_t v193 = 1752392040;
    __int16 v194 = 2117;
    v195 = v101;
    __int16 v196 = 2160;
    uint64_t v197 = 1752392040;
    __int16 v198 = 2117;
    v199 = v103;
    __int16 v200 = 2112;
    v201 = v105;
    _os_log_impl(&dword_1B728F000, v100, OS_LOG_TYPE_DEFAULT, "Executed query for host '%{sensitive, mask.hash}@' with partial username '%{sensitive, mask.hash}@', %@", buf, 0x34u);

    id v17 = v139;
  }
  v106 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    v107 = v106;
    int v108 = [v18 count];
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v193) = v108;
    _os_log_impl(&dword_1B728F000, v107, OS_LOG_TYPE_DEFAULT, "%d exact domain matches", buf, 8u);
  }
  uint64_t v109 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v110 = v109;
    int v111 = [v136 count];
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v193) = v111;
    _os_log_impl(&dword_1B728F000, v110, OS_LOG_TYPE_DEFAULT, "%d high-level domain matches", buf, 8u);
  }
  id v112 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
  {
    id v113 = v112;
    int v114 = [v137 count];
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v193) = v114;
    _os_log_impl(&dword_1B728F000, v113, OS_LOG_TYPE_DEFAULT, "%d simplified domain matches", buf, 8u);
  }
  id v115 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v116 = v115;
    int v117 = [v141 count];
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v193) = v117;
    _os_log_impl(&dword_1B728F000, v116, OS_LOG_TYPE_DEFAULT, "%d associated domain matches", buf, 8u);
  }
  long long v118 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
  {
    long long v119 = v118;
    int v120 = [v145 count];
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v193) = v120;
    _os_log_impl(&dword_1B728F000, v119, OS_LOG_TYPE_DEFAULT, "%d default matches", buf, 8u);
  }
  if ([v152 isEqualToString:@"apple.com"])
  {
    v163[0] = MEMORY[0x1E4F143A8];
    v163[1] = 3221225472;
    v163[2] = __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke_366;
    v163[3] = &unk_1E615DA30;
    id v164 = v18;
    id v165 = v145;
    id v166 = v136;
    id v167 = v10;
    [v140 enumerateKeysAndObjectsUsingBlock:v163];
  }
  if ([v137 count])
  {
    if ([v18 count])
    {
      if (!v138) {
        goto LABEL_117;
      }
      int v121 = v136;
      [v137 addObjectsFromArray:v136];
      v136 = v137;
    }
    else
    {
      int v121 = v18;
      uint64_t v18 = v137;
    }
    id v122 = v137;
  }
LABEL_117:
  if ([v145 count])
  {
    [v145 addObjectsFromArray:v18];
    id v123 = v145;

    uint64_t v18 = v123;
  }
  [v18 sortUsingSelector:sel_compare_];
  [v136 sortUsingSelector:sel_compare_];
  [v141 sortUsingSelector:sel_compare_];
  v124 = [[WBSSavedAccountMatchResult alloc] initWithExactMatches:v18 potentialMatches:v136 associatedDomainMatches:v141 nearbyDeviceOptions:v127];

  return v124;
}

uint64_t __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 credentialID];
}

void __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke_366(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__15;
  uint64_t v27 = __Block_byref_object_dispose__15;
  id v28 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  long long v19 = __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke_2;
  long long v20 = &unk_1E615DA08;
  id v7 = v6;
  id v21 = v7;
  id v22 = &v23;
  uint64_t v8 = (void (**)(void *, void))_Block_copy(&v17);
  v8[2](v8, *(void *)(a1 + 32));
  v8[2](v8, *(void *)(a1 + 40));
  if (v24[5]) {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v17, v18, v19, v20);
  }
  id v9 = [WBSSavedAccount alloc];
  id v10 = [v7 relyingPartyIdentifier];
  id v11 = [v7 username];
  id v12 = [(WBSSavedAccount *)v9 _initWithPasskeyRelyingPartyID:v10 user:v11 passkeyUserHandle:&stru_1F105D3F0 passkeyCredentialID:v5];

  char v13 = *(void **)(a1 + 40);
  uint64_t v14 = [WBSSavedAccountMatch alloc];
  uint64_t v15 = [*(id *)(a1 + 56) context];
  uint64_t v16 = [(WBSSavedAccountMatch *)v14 initWithSavedAccount:v12 protectionSpace:0 context:v15 matchLevel:1 autoFillPasskey:v7];
  [v13 addObject:v16];

  _Block_object_dispose(&v23, 8);
}

void __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke_3;
  v7[3] = &unk_1E615D9E0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v8 = v4;
  id v6 = v3;
  [v6 enumerateObjectsUsingBlock:v7];
}

void __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 savedAccount];
  id v6 = [v5 user];
  id v7 = [*(id *)(a1 + 32) username];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    id v12 = *(void **)(a1 + 40);
    [v12 removeObjectAtIndex:a3];
  }
}

- (void)_verifyGroupsInSync
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Not running group sync verification because it is not available.", v2, v3, v4, v5, v6);
}

void __43__WBSSavedAccountStore__verifyGroupsInSync__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXMissingPasswordGroups();
  uint8_t v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_1B728F000, v6, OS_LOG_TYPE_DEFAULT, "Received reply from group sync verification. Groups were in sync.", v8, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      __43__WBSSavedAccountStore__verifyGroupsInSync__block_invoke_cold_2();
      if (!v4) {
        goto LABEL_8;
      }
    }
    else if (!v4)
    {
      goto LABEL_8;
    }
    id v7 = WBS_LOG_CHANNEL_PREFIXMissingPasswordGroups();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __43__WBSSavedAccountStore__verifyGroupsInSync__block_invoke_cold_1(v7);
    }
  }
LABEL_8:
}

- (id)duplicateAccountsWithGroupID:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(WBSSavedAccountStore *)self savedAccountsInPersonalKeychain];
  long long v19 = v4;
  uint8_t v6 = [(WBSSavedAccountStore *)self savedAccountsForGroupID:v4];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v13 = v6;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v13);
              }
              if ([v12 isEqualForSuggestingDuplicatesCleanup:*(void *)(*((void *)&v21 + 1) + 8 * j)])objc_msgSend(v7, "addObject:", v12); {
            }
              }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v15);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  return v7;
}

- (void)newPasskeysAvailableForApplicationIdentifier:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E4F28B50], "safari_isSafariFamilyBundleIdentifier:", a3))
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_INFO, "Notifying that new passkeys are available.", v5, 2u);
    }
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"WBSSavedAccountStoreNewAutoFillablePasskeysAvailableNotification" object:0];
  }
}

- (id)persistentIdentifierForCredential:(id)a3 protectionSpace:(id)a4
{
  id v6 = a3;
  id v7 = [a4 host];
  uint64_t v8 = [v6 user];

  uint64_t v9 = [(WBSSavedAccountStore *)self _persistentIdentifierForUser:v8 host:v7];

  return v9;
}

- (id)persistentIdentifierForSavedAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 protectionSpaces];
  id v6 = [v5 firstObject];
  id v7 = [v6 host];

  uint64_t v8 = [v4 user];

  uint64_t v9 = [(WBSSavedAccountStore *)self _persistentIdentifierForUser:v8 host:v7];

  return v9;
}

- (id)_persistentIdentifierForUser:(id)a3 host:(id)a4
{
  v25[8] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    long long v23 = 0;
    uint64_t v8 = *MEMORY[0x1E4F3B998];
    uint64_t v9 = *MEMORY[0x1E4F3B550];
    v24[0] = *MEMORY[0x1E4F3B978];
    v24[1] = v9;
    v25[0] = v8;
    v25[1] = @"com.apple.cfnetwork";
    uint64_t v10 = *MEMORY[0x1E4F3B880];
    uint64_t v11 = *MEMORY[0x1E4F3B5E8];
    v24[2] = *MEMORY[0x1E4F3B878];
    v24[3] = v11;
    uint64_t v12 = *MEMORY[0x1E4F3B5F8];
    v25[2] = v10;
    v25[3] = v12;
    uint64_t v13 = *MEMORY[0x1E4F3BB88];
    uint64_t v14 = *MEMORY[0x1E4F3BC78];
    void v24[4] = *MEMORY[0x1E4F3BB80];
    v24[5] = v14;
    v25[4] = v13;
    v25[5] = MEMORY[0x1E4F1CC38];
    uint64_t v15 = *MEMORY[0x1E4F3B5C0];
    v24[6] = *MEMORY[0x1E4F3B848];
    v24[7] = v15;
    v25[6] = v6;
    v25[7] = v5;
    OSStatus v16 = SecItemCopyMatching((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:8], (CFTypeRef *)&v23);
    if (v16 != -25300)
    {
      int v17 = v16;
      if (!v16)
      {
        uint64_t v18 = v23;
        long long v19 = [v23 firstObject];

        goto LABEL_11;
      }
      long long v21 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[WBSSavedAccountStore _persistentIdentifierForUser:host:](v17, v21);
      }
    }
  }
  else
  {
    long long v20 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[WBSSavedAccountStore _persistentIdentifierForUser:host:]();
    }
  }
  long long v19 = 0;
LABEL_11:

  return v19;
}

- (void)test_createPasskeyWithUserName:(id)a3 displayName:(id)a4 relyingPartyIdentifier:(id)a5 userHandle:(id)a6 groupID:(id)a7 inRecentlyDeleted:(BOOL)a8 completionHandler:(id)a9
{
  LOBYTE(v9) = 0;
  [(WBSSavedAccountStore *)self test_createPasskeyWithUserName:a3 displayName:a4 relyingPartyIdentifier:a5 userHandle:a6 groupID:a7 inRecentlyDeleted:a8 unsafeAllowRealKeychainAccess:v9 completionHandler:a9];
}

- (void)test_createPasskeyWithUserName:(id)a3 displayName:(id)a4 relyingPartyIdentifier:(id)a5 userHandle:(id)a6 groupID:(id)a7 inRecentlyDeleted:(BOOL)a8 unsafeAllowRealKeychainAccess:(BOOL)a9 completionHandler:(id)a10
{
  BOOL v10 = a8;
  id v24 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a10;
  if (!v18)
  {
    long long v21 = [MEMORY[0x1E4F29128] UUID];
    long long v22 = [v21 UUIDString];
    id v18 = [v22 dataUsingEncoding:4];
  }
  LOBYTE(v23) = a9;
  [(WBSPasskeyStore *)self->_passkeyStore test_createPasskeyWithName:v24 displayName:v16 relyingParty:v17 userHandle:v18 groupID:v19 inRecentlyDeleted:v10 unsafeAllowRealKeychainAccess:v23 completionHandler:v20];
}

- (void)test_createLegacyWebAuthnCredentialWithUserName:(id)a3 displayName:(id)a4 relyingPartyIdentifier:(id)a5 userHandle:(id)a6 completionHandler:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v14)
  {
    id v16 = [MEMORY[0x1E4F29128] UUID];
    id v17 = [v16 UUIDString];
    id v14 = [v17 dataUsingEncoding:4];
  }
  [(WBSPasskeyStore *)self->_passkeyStore test_createLegacyCredentialWithName:v18 displayName:v12 relyingParty:v13 userHandle:v14 completionHandler:v15];
}

- (void)test_copyPasskeyWithCredentialID:(id)a3 toGroup:(id)a4 inRecentlyDeleted:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v15 = (__CFString *)a4;
  BOOL v10 = (void (**)(id, void))a6;
  uint64_t v11 = v15;
  if (!v15) {
    uint64_t v11 = &stru_1F105D3F0;
  }
  id v16 = v11;
  id v12 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v13 = a3;
  id v14 = (void *)[[v12 alloc] initWithBase64EncodedString:v13 options:0];

  if (v14) {
    [(WBSPasskeyStore *)self->_passkeyStore test_copyPasskeyWithCredentialID:v14 toGroup:v16 inRecentlyDeleted:v7 completionHandler:v10];
  }
  else {
    v10[2](v10, 0);
  }
}

- (void)test_setSharedAccountsGroups:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__WBSSavedAccountStore_test_setSharedAccountsGroups___block_invoke;
  v7[3] = &unk_1E615A6C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __53__WBSSavedAccountStore_test_setSharedAccountsGroups___block_invoke(uint64_t a1)
{
}

- (void)test_reloadAllSavedAccounts
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__WBSSavedAccountStore_test_reloadAllSavedAccounts__block_invoke;
  block[3] = &unk_1E615A768;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __51__WBSSavedAccountStore_test_reloadAllSavedAccounts__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetOnInternalQueue];
  id v2 = (id)[*(id *)(a1 + 32) _savedAccounts];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _loadRecentlyDeletedSavedAccounts];
}

- (WBSSavedAccountStoreWebsiteNameProvider)websiteNameProvider
{
  return 0;
}

- (BOOL)shouldShowServiceNamesForPasswordAndPasskeyItems
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__WBSSavedAccountStore_shouldShowServiceNamesForPasswordAndPasskeyItems__block_invoke;
  v5[3] = &unk_1E615A970;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __72__WBSSavedAccountStore_shouldShowServiceNamesForPasswordAndPasskeyItems__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 256);
  return result;
}

- (void)knownWebsiteNamesDidChangeOnDomains:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__WBSSavedAccountStore_knownWebsiteNamesDidChangeOnDomains___block_invoke;
  block[3] = &unk_1E615A768;
  void block[4] = self;
  dispatch_async(queue, block);
}

unsigned char *__60__WBSSavedAccountStore_knownWebsiteNamesDidChangeOnDomains___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[256])
  {
    uint64_t result = (unsigned char *)[result _reapplyServiceNamesFromProvider];
    if (result)
    {
      char v3 = *(void **)(a1 + 32);
      return (unsigned char *)[v3 _notifyClientsAboutWebsiteNamesChanges];
    }
  }
  return result;
}

- (void)_notifyClientsAboutWebsiteNamesChanges
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WBSSavedAccountStore__notifyClientsAboutWebsiteNamesChanges__block_invoke;
  block[3] = &unk_1E615A768;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __62__WBSSavedAccountStore__notifyClientsAboutWebsiteNamesChanges__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postSavedAccountStoreDidChangeNotification];
}

+ (BOOL)userTypedTitleShouldBeTreatedAsAWebsiteWhenAddingNewAccount:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  [v3 rangeOfCharacterFromSet:v4];
  uint64_t v6 = v5;

  if (v6)
  {
    char v7 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = 0;
    char v7 = [(id)objc_opt_class() getProtectionSpaceAndHighLevelDomainForUserTypedSite:v3 protectionSpace:&v10 highLevelDomain:&v9];
  }
  return v7;
}

- (BOOL)hasPasswordsEligibleForAutoFill
{
  return self->_hasPasswordsEligibleForAutoFill;
}

- (BOOL)hasPasskeysEligibleForAutoFill
{
  return self->_hasPasskeysEligibleForAutoFill;
}

- (BOOL)isForTesting
{
  return self->_isForTesting;
}

- (BOOL)shouldWarmDataStoreAfterReset
{
  return self->_shouldWarmDataStoreAfterReset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passkeyStore, 0);
  objc_storeStrong((id *)&self->_domainsStoreIsLimitedTo, 0);
  objc_storeStrong((id *)&self->_warmDataStoreAfterResetTimer, 0);
  objc_storeStrong((id *)&self->_stateCollector, 0);
  objc_storeStrong((id *)&self->_authenticationServicesAgentProxy, 0);
  objc_storeStrong((id *)&self->_groupIdentifiersToRecentlyDeletedPasskeysData, 0);
  objc_storeStrong((id *)&self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedPasskeysDataInPersonalKeychain, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedSavedAccountsInPersonalKeychain, 0);
  objc_storeStrong((id *)&self->_allRecentlyDeletedSavedAccounts, 0);
  objc_storeStrong((id *)&self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts, 0);
  objc_storeStrong((id *)&self->_savedAccountsWithSignInWithAppleRecords, 0);
  objc_storeStrong((id *)&self->_sharedAccountsGroups, 0);
  objc_storeStrong((id *)&self->_groupIdentifiersToSavedAccounts, 0);
  objc_storeStrong((id *)&self->_savedAccountsInPersonalKeychain, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_keychainNotificationRegistrationToken, 0);
  objc_storeStrong((id *)&self->_keychainMonitor, 0);
  objc_storeStrong((id *)&self->_groupIdentifiersToPasskeysData, 0);
  objc_storeStrong((id *)&self->_highLevelDomainToLegacyPlatformAuthenticatorCredentials, 0);
  objc_storeStrong((id *)&self->_passkeysDataInPersonalKeychain, 0);
  objc_storeStrong((id *)&self->_savedAccounts, 0);
  objc_storeStrong((id *)&self->_savedAccountsWithPasswords, 0);
  objc_storeStrong((id *)&self->_savedAccountsWithNeverSaveMarker, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedPersonalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts, 0);
  objc_storeStrong((id *)&self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, 0);
  objc_storeStrong((id *)&self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts, 0);
  objc_storeStrong((id *)&self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, 0);
  objc_storeStrong((id *)&self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts, 0);
}

- (id)passkeyDataForPasskeyCredentialIDOnInternalQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_1B7383D00();
  unint64_t v8 = v7;

  uint64_t v9 = [(WBSSavedAccountStore *)v5 passkeyStore];
  uint64_t v13 = v6;
  unint64_t v14 = v8;
  id v15 = v5;
  sub_1B729E6AC((uint64_t)sub_1B735FEF4, (uint64_t)v12, (uint64_t)"SafariCore/WBSSavedAccountStore.swift", 37, 2, 32, (uint64_t)&unk_1F105AEA0, (uint64_t)sub_1B729E938, sub_1B729E854);
  swift_release();
  sub_1B735B0E8(v6, v8);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E592D0);
  id v10 = (void *)sub_1B7384130();
  swift_bridgeObjectRelease();
  return v10;
}

- (void)updateUserVisibleName:(NSString *)a3 forPasskeyWithIdentifier:(WBSPublicKeyCredentialIdentifier *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59058);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  void v13[5] = self;
  uint64_t v14 = sub_1B7384180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  id v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  void v15[4] = &unk_1E9E592B8;
  void v15[5] = v13;
  id v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  void v16[4] = &unk_1E9E592C0;
  v16[5] = v15;
  id v17 = a3;
  id v18 = a4;
  id v19 = self;
  sub_1B73671C4((uint64_t)v11, (uint64_t)&unk_1E9E592C8, (uint64_t)v16);
  swift_release();
}

- (void)updateUserVisibleNameOnInternalQueue:(id)a3 forPasskeyWithIdentifier:(id)a4
{
  uint64_t v6 = sub_1B7383FC0();
  uint64_t v8 = v7;
  id v9 = a4;
  uint64_t v10 = self;
  uint64_t v11 = [(WBSSavedAccountStore *)v10 passkeyStore];
  void v12[2] = v6;
  v12[3] = v8;
  void v12[4] = v9;
  sub_1B735BF60((uint64_t)sub_1B735FEDC, (uint64_t)v12);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)deletePasskeyWithIdentifier:(WBSPublicKeyCredentialIdentifier *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59058);
  MEMORY[0x1F4188790](v7 - 8);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  void v11[4] = self;
  uint64_t v12 = sub_1B7384180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E9E592A8;
  void v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  void v14[4] = &unk_1E9E59070;
  v14[5] = v13;
  id v15 = a3;
  id v16 = self;
  sub_1B73671C4((uint64_t)v9, (uint64_t)&unk_1E9E59078, (uint64_t)v14);
  swift_release();
}

- (void)deletePasskeyWithIdentifierOnInternalQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = [(WBSSavedAccountStore *)v5 passkeyStore];
  v7[2] = v4;
  sub_1B735BF60((uint64_t)sub_1B735FF24, (uint64_t)v7);

  swift_release();
}

- (id)exportPasskeyCredentialWithIDOnInternalQueue:(id)a3
{
  uint64_t v4 = sub_1B7383FC0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = [(WBSSavedAccountStore *)v7 passkeyStore];
  uint64_t v12 = v4;
  uint64_t v13 = v6;
  id v9 = (void *)sub_1B729E6AC((uint64_t)sub_1B735FEC4, (uint64_t)v11, (uint64_t)"SafariCore/WBSSavedAccountStore.swift", 37, 2, 98, (uint64_t)&unk_1F105AE00, (uint64_t)sub_1B729E938, sub_1B735F834);

  swift_bridgeObjectRelease();
  swift_release();
  return v9;
}

- (id)importPasskeyCredentialOnInternalQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = [(WBSSavedAccountStore *)v5 passkeyStore];
  v11[2] = v4;
  sub_1B735C140((uint64_t)sub_1B735FF0C, (uint64_t)v11);
  uint64_t v8 = v7;

  swift_release();
  if (v8)
  {
    id v9 = (void *)sub_1B7383FA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (void)savedAccountsForGroupID:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Queried account store for saved accounts from group but no dictionary exists for groupID: %@", v2, v3, v4, v5, v6);
}

- (void)_loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Found %lu keychain items with invalid authentication types", v2, v3, v4, v5, v6);
}

- (void)_loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1B728F000, v0, OS_LOG_TYPE_DEBUG, "Unmatched sidecars: %{private}@", v1, 0xCu);
}

- (void)_loadSavedAccountsWithPasswordsFromKeychainData:(_DWORD *)a1 forGroupID:(void *)a2 withDictionaryForSavedAccountsWithPasswords:(uint64_t)a3 fromRecentlyDeleted:(void *)a4 .cold.3(_DWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  uint64_t v7 = objc_opt_class();
  *a1 = 138412290;
  *a4 = v7;
  id v8 = v7;
  OUTLINED_FUNCTION_12_0(&dword_1B728F000, v9, v10, "kSecAttrAccount value for keychain item was not of type string, got type: %@");
}

void __82__WBSSavedAccountStore__reportKeychainItemsWithInvalidAuthenticationTypesIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_1B728F000, v0, v1, "Found keychain items with invalid authentication types. See rdar://104050278 for more information.", v2, v3, v4, v5, v6);
}

void __53__WBSSavedAccountStore__fetchSignInWithAppleAccounts__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Fetching Sign in with Apple accounts failed with error: '%{private}@'", v2, v3, v4, v5, v6);
}

- (void)_convertSignInWithAppleAccountsToSavedAccounts:(void *)a3 .cold.1(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = [a3 clientID];
  *a1 = 138412290;
  *a4 = v8;
  OUTLINED_FUNCTION_12_0(&dword_1B728F000, v9, v10, "Error, Sign in with Apple account missing app name for clientID: %@, unable to convert to savedAccount");
}

void __91__WBSSavedAccountStore__shareSignInWithAppleAccountWithContext_withGroupInfo_savedAccount___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Failed to share Sign in with Apple Account with error %@.", v2, v3, v4, v5, v6);
}

void __66__WBSSavedAccountStore__unshareSignInWithAppleAccountWithContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Failed to unshare Sign in with Apple Account with error %@.", v2, v3, v4, v5, v6);
}

- (void)_loadSavedAccountsWithPasskeysFromPasskeyData:(os_log_t)log forGroupID:fromRecentlyDeleted:withDictionaryForSavedAccountsWithPasskeys:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1B728F000, log, OS_LOG_TYPE_FAULT, "Found passkey with nil credentialID. Skipping.", buf, 2u);
}

void __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Failed to create password to add to account with passkey", v2, v3, v4, v5, v6);
}

void __112__WBSSavedAccountStore_canSaveUser_password_forProtectionSpace_highLevelDomain_notes_customTitle_groupID_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Checked if able to save a password to an unknown group.", v2, v3, v4, v5, v6);
}

void __64__WBSSavedAccountStore__canMoveSavedAccountWithPasskey_toGroup___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Checked if able to move a passkey to an unknown group.", v2, v3, v4, v5, v6);
}

- (void)_saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Failed to set original contributor participant ID on new saved account in groupID: '%{private}@'.", v2, v3, v4, v5, v6);
}

- (void)_saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Could not find a cached group for a newly saved account on groupID: '%{private}@'.", v2, v3, v4, v5, v6);
}

- (void)_saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Failed to save account in groupID because current user participant ID is nil: '%{private}@'.", v2, v3, v4, v5, v6);
}

- (void)_deleteSavedAccountsWithUnknownOriginalContributorParticipantIDsFromSavedAccounts:inGroup:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Couldn't get current user participant ID, so skipping clean up for saved accounts with unknown contributor ID's.", v2, v3, v4, v5, v6);
}

void __71__WBSSavedAccountStore__reportAccountsWithUnknownContributorIDIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_1B728F000, v0, v1, "Found shared saved accounts without original contributor participant ID", v2, v3, v4, v5, v6);
}

void __126__WBSSavedAccountStore__cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted___block_invoke_cold_1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingError");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v1, v4, "Aborting clean up for passwords with unmatchable contributor ID because of error fetching groups: %{private}@.", v5);
}

- (void)_mergeSavedAccountWithPassword:(os_log_t)log toSavedAccountWithPasskey:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Received unexpected sidecar type when merging password to passkey", buf, 2u);
}

- (void)setSavedAccountAsDefault:forProtectionSpace:context:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  id v3 = v2;
  [(id)OUTLINED_FUNCTION_3() user];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)OUTLINED_FUNCTION_2() host];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1(&dword_1B728F000, v5, v6, "Refusing to set account for '%{sensitive}@' as default for host '%{sensitive}@' because the host already has saved account with same username.", v7, v8, v9, v10, v11);
}

- (void)setSavedAccountAsDefault:forProtectionSpace:context:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  id v3 = v2;
  [(id)OUTLINED_FUNCTION_3() user];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)OUTLINED_FUNCTION_2() host];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1(&dword_1B728F000, v5, v6, "Refusing to set account for '%{sensitive}@' as default for host '%{sensitive}@' because the host has an invalid authentication method", v7, v8, v9, v10, v11);
}

- (void)setSavedAccountAsDefault:forProtectionSpace:context:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  id v3 = v2;
  [(id)OUTLINED_FUNCTION_3() user];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)OUTLINED_FUNCTION_2() host];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1(&dword_1B728F000, v5, v6, "Refusing to set account for '%{sensitive}@' as default for host '%{sensitive}@' because the host is not already registered for this account", v7, v8, v9, v10, v11);
}

- (void)setSavedAccountAsDefault:forProtectionSpace:context:.cold.4()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = v3;
  [(id)OUTLINED_FUNCTION_3() host];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)OUTLINED_FUNCTION_2() user];
  uint64_t v6 = [v0 highLevelDomain];
  int v7 = 138740483;
  uint64_t v8 = v1;
  __int16 v9 = 2117;
  uint64_t v10 = v5;
  __int16 v11 = 2117;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_1B728F000, v2, OS_LOG_TYPE_ERROR, "Adding '%{sensitive}@' to account for '%{sensitive}@' on '%{sensitive}@' resulted in a new saved account", (uint8_t *)&v7, 0x20u);
}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Tried to move an account to a group it's already in.", v2, v3, v4, v5, v6);
}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 groupID];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_1B728F000, v6, v7, "Failed to copy saved account from group %{private}@ to group %{private}@", v8, v9, v10, v11, v12);
}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Tried to move an account to a group that doesn't exist.", v2, v3, v4, v5, v6);
}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_307_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_copySavedAccount:toGroup:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Failed to copy saved account with passkey to group %{private}@", v2, v3, v4, v5, v6);
}

- (void)_copySavedAccount:toGroup:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_4(&dword_1B728F000, v0, v1, "Failed to copy saved account with password to group %{private}@", v2, v3, v4, v5, v6);
}

- (void)_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue:(NSObject *)a3 isForAlreadyExitedGroup:.cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *a2 = 10;
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, a3, (uint64_t)a3, "Failed to copy password back to personal keychain because there were %zu other passwords with the same username", a1);
}

- (void)_recordGroupIdentifierForMovingContributedCredentialsBackToPersonalKeychain:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Invalid group ID passed into method to mark groups for clean up on exit", v2, v3, v4, v5, v6);
}

void __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke_cold_1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v1, v4, "Error fetching groups, skipping clean up for now: %{public}@", v5);
}

- (void)_moveCredentialTypesToRecentlyDeletedOnInternalQueue:fromSavedAccount:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Failed to move saved account to recently deleted.", v2, v3, v4, v5, v6);
}

- (void)_recoverRecentlyDeletedSavedAccount:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Failed to recover saved account from recently deleted.", v2, v3, v4, v5, v6);
}

- (void)_recoverRecentlyDeletedSavedAccount:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Tried to recover an account that isn't recently deleted", v2, v3, v4, v5, v6);
}

void __43__WBSSavedAccountStore__verifyGroupsInSync__block_invoke_cold_1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingError");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v1, v4, "Received error from group sync verification: %{private}@", v5);
}

void __43__WBSSavedAccountStore__verifyGroupsInSync__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_1B728F000, v0, v1, "Received reply from group sync verification. Groups were NOT in sync.", v2, v3, v4, v5, v6);
}

- (void)_persistentIdentifierForUser:(int)a1 host:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Failed to find persistent identifier. SecItemCopyMatching failed with error code %d.", (uint8_t *)v2, 8u);
}

- (void)_persistentIdentifierForUser:host:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Refusing to look up persistent identifier for credential with no username or host.", v2, v3, v4, v5, v6);
}

@end