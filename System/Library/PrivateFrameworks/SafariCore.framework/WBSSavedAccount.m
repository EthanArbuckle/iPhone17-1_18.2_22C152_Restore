@interface WBSSavedAccount
+ (BOOL)stringMatchesPatternWithTokenizer:(__CFStringTokenizer *)a3 string:(id)a4 pattern:(id)a5 matchingType:(int64_t)a6;
+ (id)searchPatternForWebsiteComparisonFromSearchPattern:(id)a3;
+ (void)enumerateRangesMatchingPatternWithTokenizer:(__CFStringTokenizer *)a3 string:(id)a4 pattern:(id)a5 matchingType:(int64_t)a6 withBlock:(id)a7;
- (AKSignInWithAppleAccount)signInWithAppleAccount;
- (BOOL)_allSitesHaveSameNonDefaultPort:(int64_t *)a3;
- (BOOL)_canMergeWithSavedAccount:(id)a3 requiresDataCopying:(BOOL *)a4;
- (BOOL)_computeHasValidWebsite;
- (BOOL)_containsProtectionSpace:(id)a3;
- (BOOL)_isSidecarDataForCredentialMergingCompatible:(id)a3;
- (BOOL)_isSidecarDataForCredentialMergingEqual:(id)a3;
- (BOOL)_matchesSearchPattern:(id)a3 matchAgainstUser:(BOOL)a4 associatedDomains:(id)a5;
- (BOOL)canBeExportedToPasswordsCSVFile;
- (BOOL)canUserEditSavedAccount;
- (BOOL)hasPasskeySidecars;
- (BOOL)hasPasswordSidecars;
- (BOOL)hasProtectionSpace:(id)a3;
- (BOOL)hasProtectionSpaceWithHighLevelDomainMatchingProtectionSpace:(id)a3;
- (BOOL)hasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts;
- (BOOL)hasSidecarData;
- (BOOL)hasSidecarDataToConsiderForCredentialMerging;
- (BOOL)hasValidWebsite;
- (BOOL)isAppleIDPasskey;
- (BOOL)isCurrentUserOriginalContributor;
- (BOOL)isDefaultCredentialForFullyQualifiedHostname:(id)a3;
- (BOOL)isDuplicateWithoutUserNameOfSavedAccount:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualForMovingSharedSavedAccountsBackToPersonalKeychainOnGroupExit:(id)a3;
- (BOOL)isEqualForSuggestingDuplicatesCleanup:(id)a3;
- (BOOL)isOneTimeSharable;
- (BOOL)isRecentlyDeleted;
- (BOOL)isSavedInPersonalKeychain;
- (BOOL)isSavedInSharedGroup;
- (BOOL)markOriginalContributorParticipantID;
- (BOOL)markParticipantIDThatMovedSavedAccountToRecentlyDeleted;
- (BOOL)matchesDomain:(id)a3 associatedDomains:(id)a4;
- (BOOL)matchesServiceNameHintString:(id)a3;
- (BOOL)matchesUserTypedSearchPattern:(id)a3;
- (BOOL)matchesUserTypedSearchPattern:(id)a3 associatedDomains:(id)a4;
- (BOOL)shouldOverrideRecentlyDeletedSavedAccountWhenDeleted:(id)a3;
- (BOOL)shouldShowSpecificSubdomainForUserVisibleDomain;
- (BOOL)userIsNeverSaveMarker;
- (NSArray)additionalSites;
- (NSArray)allPasswordSidecars;
- (NSArray)allSidecars;
- (NSArray)persistentIdentifiersForWarningManager;
- (NSArray)protectionSpaces;
- (NSArray)protectionSpacesForAdditionalSites;
- (NSArray)sites;
- (NSArray)totpGenerators;
- (NSArray)userVisibleSites;
- (NSData)stableID;
- (NSDate)creationDate;
- (NSDate)creationDateForPasskey;
- (NSDate)lastModifiedDate;
- (NSDate)lastModifiedDateForPasskey;
- (NSDate)lastOneTimeShareDateForPasskey;
- (NSDate)lastRecentlyDeletedNotificationDate;
- (NSDate)lastUsedDateForPasskey;
- (NSDictionary)passkeyCredentialSidecarsDictionary;
- (NSMutableArray)_allPasswordSidecarsAsMutableArray;
- (NSString)currentOneTimeCode;
- (NSString)customTitle;
- (NSString)effectiveTitle;
- (NSString)effectiveTitleForSorting;
- (NSString)highLevelDomain;
- (NSString)monogramCharacter;
- (NSString)notesEntry;
- (NSString)originalContributorParticipantID;
- (NSString)participantIDThatMovedSavedAccountToRecentlyDeleted;
- (NSString)passkeyCredentialID;
- (NSString)passkeyRelyingPartyID;
- (NSString)passkeyUserHandle;
- (NSString)password;
- (NSString)serviceName;
- (NSString)sharedGroupID;
- (NSString)sharedGroupName;
- (NSString)uniqueIdentifierForPasswordManagerLegacy;
- (NSString)user;
- (NSString)userVisibleDomain;
- (NSURL)wellKnownChangePasswordURL;
- (WBSFormerlySharedSavedAccountMarker)formerlySharedPasskeyMarker;
- (WBSFormerlySharedSavedAccountMarker)formerlySharedPasswordMarker;
- (WBSPasswordWarningHideMarker)hideWarningMarker;
- (id)_allSidecarsForSite:(id)a3;
- (id)_copyPasskeyCredentialToNewSavedAccount;
- (id)_copyPasswordCredentialToNewSavedAccount;
- (id)_exportPasskeyCredential;
- (id)_firstSidecarForAnySiteOfType:(int64_t)a3;
- (id)_firstSidecarForAnySiteOfType:(int64_t)a3 inSitesToSidecars:(id)a4 passkeySidecars:(id)a5;
- (id)_formerlySharedMarkerForCredentialType:(int64_t)a3;
- (id)_highLevelDomainWithPortIncluded;
- (id)_initWithHighLevelDomain:(id)a3 passkeyRelyingPartyID:(id)a4 user:(id)a5 password:(id)a6 passkeyUserHandle:(id)a7 passkeyCredentialID:(id)a8 siteToProtectionSpaces:(id)a9 sitesToSidecars:(id)a10 serviceName:(id)a11;
- (id)_initWithHighLevelDomain:(id)a3 user:(id)a4 password:(id)a5;
- (id)_initWithPasskeyRelyingPartyID:(id)a3 user:(id)a4 passkeyUserHandle:(id)a5 passkeyCredentialID:(id)a6;
- (id)_initWithSignInWithAppleAccount:(id)a3;
- (id)_movePasskeyCredentialToNewSavedAccount;
- (id)_movePasswordCredentialToNewSavedAccount;
- (id)_passkeySidecarOfType:(int64_t)a3;
- (id)_quirksForServiceName:(id)a3;
- (id)_sidecarForSite:(id)a3 ofType:(int64_t)a4;
- (id)description;
- (id)lastUsedDateForContext:(id)a3;
- (id)totpGeneratorForSite:(id)a3;
- (int64_t)compare:(id)a3;
- (int64_t)compare:(id)a3 byType:(int64_t)a4;
- (int64_t)credentialTypes;
- (unint64_t)hash;
- (void)_addPasskeySidecar:(id)a3;
- (void)_addPasswordCredentialCreationDate:(id)a3;
- (void)_addPasswordCredentialModificationDate:(id)a3;
- (void)_addProtectionSpace:(id)a3 forSite:(id)a4 isDefaultCredentialForSite:(BOOL)a5;
- (void)_addSidecar:(id)a3 forSite:(id)a4;
- (void)_adoptSitesFromSavedAccount:(id)a3;
- (void)_clearFormerlySharedSavedAccountMarkerForCredentialTypes:(int64_t)a3;
- (void)_clearFormerlySharedSavedAccountMarkerForCredentialTypesIfNecessary:(int64_t)a3;
- (void)_copySharableDataFromPersonalSidecarToSharedSidecarInDictionary:(id)a3;
- (void)_copySharableDataFromSharedSidecarIntoPersonalSidecarInDictionary:(id)a3;
- (void)_copySharablePasskeySidecarDataFromPersonalSidecarsToSharedSidecars;
- (void)_copySharablePasskeySidecarDataFromSharedSidecarsToPersonalSidecars;
- (void)_copySharablePasswordSidecarDataFromPersonalSidecarsToSharedSidecars;
- (void)_copySharablePasswordSidecarDataFromSharedSidecarsToPersonalSidecars;
- (void)_createSidecarsForProtectionSpaceIfNecessary:(id)a3;
- (void)_deleteCredentialForProtectionSpace:(id)a3 fromStorage:(id)a4 forGroupID:(id)a5;
- (void)_deleteCredentialTypes:(int64_t)a3;
- (void)_deletePasskeyCredentialForGroupID:(id)a3;
- (void)_deletePasskeyCredentialRemovingCachedCredentialData:(BOOL)a3;
- (void)_deletePasswordCredentialsForGroupID:(id)a3;
- (void)_deletePasswordCredentialsForSite:(id)a3;
- (void)_deletePasswordCredentialsForSite:(id)a3 forGroupID:(id)a4;
- (void)_deletePasswordCredentialsInPersonalKeychain;
- (void)_deletePasswordCredentialsRemovingCachedCredentialData:(BOOL)a3;
- (void)_deleteSidecarForPasskeyCredentialForGroupID:(id)a3;
- (void)_deleteSidecarForProtectionSpace:(id)a3 fromStorage:(id)a4 forGroupID:(id)a5;
- (void)_deleteTOTPGeneratorIfNecessary;
- (void)_mergePasskeySidecarsFromSavedAccount:(id)a3;
- (void)_removePasskeyCredentialAndSidecars;
- (void)_removePasswordCredentialAndSidecars;
- (void)_removeSharableDataFromPersonalPasskeySidecars;
- (void)_removeSharableDataFromPersonalPasswordSidecars;
- (void)_setUser:(id)a3 password:(id)a4;
- (void)_updatePasskeySidecarsIfNecessaryWithBlock:(id)a3;
- (void)_updatePasswordSidecarsIfNecessaryWithBlock:(id)a3;
- (void)_writeFormerlySharedSavedAccountMarkerForCredentialTypes:(int64_t)a3;
- (void)clearParticipantIDThatMovedSavedAccountToRecentlyDeleted;
- (void)enumeratePasskeySidecarsWithBlock:(id)a3;
- (void)enumeratePasswordSidecarsWithBlock:(id)a3;
- (void)isCurrentUserOriginalContributor;
- (void)markOriginalContributorParticipantID;
- (void)setAdditionalSites:(id)a3;
- (void)setCreationDateForPasskey:(id)a3;
- (void)setCustomTitle:(id)a3;
- (void)setCustomTitle:(id)a3 performSidecarUpdate:(BOOL)a4;
- (void)setHasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts:(BOOL)a3;
- (void)setIsRecentlyDeleted:(BOOL)a3;
- (void)setLastModifiedDateForPasskey:(id)a3;
- (void)setLastRecentlyDeletedNotificationDate:(id)a3;
- (void)setLastUsedDate:(id)a3 forContext:(id)a4;
- (void)setLastUsedDateForPasskey:(id)a3;
- (void)setNotesEntry:(id)a3;
- (void)setPasskeyCredentialID:(id)a3;
- (void)setPasskeyCredentialSidecarsDictionary:(id)a3;
- (void)setPasskeyRelyingPartyID:(id)a3;
- (void)setPasskeyUserHandle:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPersistentIdentifiersForWarningManager:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSharedGroupID:(id)a3;
- (void)setSharedGroupName:(id)a3;
- (void)setShouldShowSpecificSubdomainForUserVisibleDomain:(BOOL)a3;
- (void)setSignInWithAppleAccount:(id)a3;
- (void)setTOTPGenerator:(id)a3;
@end

@implementation WBSSavedAccount

- (id)_initWithHighLevelDomain:(id)a3 passkeyRelyingPartyID:(id)a4 user:(id)a5 password:(id)a6 passkeyUserHandle:(id)a7 passkeyCredentialID:(id)a8 siteToProtectionSpaces:(id)a9 sitesToSidecars:(id)a10 serviceName:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v55 = a9;
  id v54 = a10;
  v23 = v17;
  id v24 = a11;
  v56.receiver = self;
  v56.super_class = (Class)WBSSavedAccount;
  v25 = [(WBSSavedAccount *)&v56 init];
  v26 = v25;
  if (v25)
  {
    v25->_lock._os_unfair_lock_opaque = 0;
    v53 = v23;
    uint64_t v27 = [v23 copy];
    highLevelDomain = v26->_highLevelDomain;
    v26->_highLevelDomain = (NSString *)v27;

    id v52 = v18;
    uint64_t v29 = [v18 copy];
    passkeyRelyingPartyID = v26->_passkeyRelyingPartyID;
    v26->_passkeyRelyingPartyID = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    user = v26->_user;
    v26->_user = (NSString *)v31;

    v33 = v26->_user;
    v34 = +[WBSDontSaveMarker dontSaveMarker];
    v26->_userIsNeverSaveMarker = [(NSString *)v33 isEqualToString:v34];

    uint64_t v35 = [v20 copy];
    password = v26->_password;
    v26->_password = (NSString *)v35;

    uint64_t v37 = [v21 copy];
    passkeyUserHandle = v26->_passkeyUserHandle;
    v26->_passkeyUserHandle = (NSString *)v37;

    uint64_t v39 = [v22 copy];
    passkeyCredentialID = v26->_passkeyCredentialID;
    v26->_passkeyCredentialID = (NSString *)v39;

    uint64_t v41 = [MEMORY[0x1E4F1CA60] dictionary];
    passkeyCredentialSidecarsDictionary = v26->_passkeyCredentialSidecarsDictionary;
    v26->_passkeyCredentialSidecarsDictionary = (NSMutableDictionary *)v41;

    objc_storeStrong((id *)&v26->_siteToProtectionSpaces, a9);
    objc_storeStrong((id *)&v26->_sitesToSidecars, a10);
    uint64_t v43 = [MEMORY[0x1E4F1CA80] set];
    sitesForWhichSelfIsDefault = v26->_sitesForWhichSelfIsDefault;
    v26->_sitesForWhichSelfIsDefault = (NSMutableSet *)v43;

    uint64_t v45 = [v24 copy];
    serviceName = v26->_serviceName;
    v26->_serviceName = (NSString *)v45;

    v47 = [(WBSSavedAccount *)v26 _firstSidecarForAnySiteOfType:0 inSitesToSidecars:v26->_sitesToSidecars passkeySidecars:v26->_passkeyCredentialSidecarsDictionary];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v48 = [v47 customTitle];
      customTitle = v26->_customTitle;
      v26->_customTitle = (NSString *)v48;
    }
    else
    {
      customTitle = v26->_customTitle;
      v26->_customTitle = 0;
    }

    v50 = v26;
    id v18 = v52;
    v23 = v53;
  }

  return v26;
}

- (id)_initWithHighLevelDomain:(id)a3 user:(id)a4 password:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v8);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = [(WBSSavedAccount *)self _initWithHighLevelDomain:v11 passkeyRelyingPartyID:0 user:v10 password:v9 passkeyUserHandle:0 passkeyCredentialID:0 siteToProtectionSpaces:v12 sitesToSidecars:v13 serviceName:0];

  if (v14) {
    id v15 = v14;
  }

  return v14;
}

- (id)_initWithPasskeyRelyingPartyID:(id)a3 user:(id)a4 passkeyUserHandle:(id)a5 passkeyCredentialID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_msgSend(v13, "safari_highLevelDomainForPasswordManager");
  id v15 = [(WBSSavedAccount *)self _initWithHighLevelDomain:v14 passkeyRelyingPartyID:v13 user:v12 password:0 passkeyUserHandle:v11 passkeyCredentialID:v10 siteToProtectionSpaces:0 sitesToSidecars:0 serviceName:0];

  if (v15) {
    id v16 = v15;
  }

  return v15;
}

- (id)_initWithSignInWithAppleAccount:(id)a3
{
  id v5 = a3;
  v6 = [v5 localizedAppName];
  v7 = [(WBSSavedAccount *)self _initWithHighLevelDomain:0 passkeyRelyingPartyID:0 user:0 password:0 passkeyUserHandle:0 passkeyCredentialID:0 siteToProtectionSpaces:0 sitesToSidecars:0 serviceName:v6];

  if (v7)
  {
    objc_storeStrong(v7 + 10, a3);
    v8 = [v5 shareInfo];
    id v9 = [v8 groupID];

    if ([v9 length]) {
      objc_storeStrong(v7 + 21, v9);
    }
    id v10 = v7;
  }
  return v7;
}

- (void)setPassword:(id)a3
{
  v4 = (NSString *)[a3 copy];
  password = self->_password;
  self->_password = v4;

  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  siteToProtectionSpaces = self->_siteToProtectionSpaces;
  self->_siteToProtectionSpaces = v6;

  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  sitesToSidecars = self->_sitesToSidecars;
  self->_sitesToSidecars = v8;
}

- (id)description
{
  v3 = [(WBSSavedAccount *)self customTitle];

  v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  v6 = v5;
  if (v3)
  {
    v7 = [(WBSSavedAccount *)self customTitle];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; title = %@; highLevelDomain = %@; user = %@>",
      v6,
      self,
      v7,
      self->_highLevelDomain,
      self->_user);
  }
  else
  {
    v7 = NSStringFromClass(v5);
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; highLevelDomain = %@; user = %@>",
      v7,
      self,
      self->_highLevelDomain,
      self->_user,
      v10);
  v8 = };

  return v8;
}

- (void)_addProtectionSpace:(id)a3 forSite:(id)a4 isDefaultCredentialForSite:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(NSMutableDictionary *)self->_siteToProtectionSpaces objectForKey:v9];
  id v11 = v10;
  if (v10)
  {
    if (([v10 containsObject:v8] & 1) == 0)
    {
      [v11 addObject:v8];
      if (!v5) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    id v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = v12;
      id v14 = [v8 host];
      user = self->_user;
      int v19 = 138412546;
      id v20 = v14;
      __int16 v21 = 2112;
      id v22 = user;
      _os_log_impl(&dword_1B728F000, v13, OS_LOG_TYPE_INFO, "Attempted to add a duplicate protection space for %@ to saved account for %@", (uint8_t *)&v19, 0x16u);

      if (!v5) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else
  {
    siteToProtectionSpaces = self->_siteToProtectionSpaces;
    id v17 = [MEMORY[0x1E4F1CA48] arrayWithObject:v8];
    [(NSMutableDictionary *)siteToProtectionSpaces setObject:v17 forKey:v9];

    sites = self->_sites;
    self->_sites = 0;
  }
  if (v5) {
LABEL_8:
  }
    [(NSMutableSet *)self->_sitesForWhichSelfIsDefault addObject:v9];
LABEL_9:
}

- (NSDate)lastModifiedDate
{
  if ([(WBSSavedAccount *)self credentialTypes] == 4)
  {
    v3 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount creationDate];
  }
  else
  {
    earliestPasswordCredentialModificationDate = self->_earliestPasswordCredentialModificationDate;
    p_earliestPasswordCredentialModificationDate = &self->_earliestPasswordCredentialModificationDate;
    v4 = earliestPasswordCredentialModificationDate;
    v7 = p_earliestPasswordCredentialModificationDate[20];
    if (earliestPasswordCredentialModificationDate)
    {
      if (v7)
      {
        if (-[NSDate compare:](v7, "compare:") == NSOrderedDescending) {
          id v8 = (id *)(p_earliestPasswordCredentialModificationDate + 20);
        }
        else {
          id v8 = (id *)p_earliestPasswordCredentialModificationDate;
        }
        v3 = (NSDate *)*v8;
        goto LABEL_11;
      }
      v7 = v4;
    }
    v3 = v7;
  }
LABEL_11:
  return v3;
}

- (void)_addPasswordCredentialModificationDate:(id)a3
{
  id v5 = a3;
  earliestPasswordCredentialModificationDate = self->_earliestPasswordCredentialModificationDate;
  p_earliestPasswordCredentialModificationDate = &self->_earliestPasswordCredentialModificationDate;
  id v10 = v5;
  if (!earliestPasswordCredentialModificationDate || (v8 = objc_msgSend(v5, "compare:") == -1, id v9 = v10, v8))
  {
    objc_storeStrong((id *)p_earliestPasswordCredentialModificationDate, a3);
    id v9 = v10;
  }
}

- (void)_addPasswordCredentialCreationDate:(id)a3
{
  id v5 = a3;
  earliestPasswordCredentialCreationDate = self->_earliestPasswordCredentialCreationDate;
  p_earliestPasswordCredentialCreationDate = &self->_earliestPasswordCredentialCreationDate;
  id v10 = v5;
  if (!earliestPasswordCredentialCreationDate || (v8 = objc_msgSend(v5, "compare:") == -1, id v9 = v10, v8))
  {
    objc_storeStrong((id *)p_earliestPasswordCredentialCreationDate, a3);
    id v9 = v10;
  }
}

- (NSDate)creationDate
{
  if ([(WBSSavedAccount *)self credentialTypes] == 4)
  {
    v3 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount creationDate];
LABEL_5:
    v4 = v3;
    goto LABEL_12;
  }
  if (([(WBSSavedAccount *)self credentialTypes] & 2) == 0)
  {
    v3 = self->_earliestPasswordCredentialCreationDate;
    goto LABEL_5;
  }
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  v6 = (void *)v5;
  earliestPasswordCredentialCreationDate = self->_earliestPasswordCredentialCreationDate;
  if (!earliestPasswordCredentialCreationDate) {
    earliestPasswordCredentialCreationDate = (NSDate *)v5;
  }
  if (self->_creationDateForPasskey) {
    creationDateForPasskey = self->_creationDateForPasskey;
  }
  else {
    creationDateForPasskey = (NSDate *)v5;
  }
  id v9 = earliestPasswordCredentialCreationDate;
  v4 = [(NSDate *)v9 earlierDate:creationDateForPasskey];

LABEL_12:
  return (NSDate *)v4;
}

- (NSArray)totpGenerators
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  sitesToSidecars = self->_sitesToSidecars;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__WBSSavedAccount_totpGenerators__block_invoke;
  v9[3] = &unk_1E615CCC8;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(NSMutableDictionary *)sitesToSidecars enumerateKeysAndObjectsUsingBlock:v9];
  v6 = v10;
  v7 = (NSArray *)v5;

  return v7;
}

void __33__WBSSavedAccount_totpGenerators__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  if ([v4 isSavedInSharedGroup]) {
    v6 = &unk_1F10864A0;
  }
  else {
    v6 = &unk_1F10864B8;
  }
  v7 = [v5 objectForKeyedSubscript:v6];

  id v9 = [v7 totpGenerator];

  BOOL v8 = v9;
  if (v9)
  {
    [*(id *)(a1 + 40) addObject:v9];
    BOOL v8 = v9;
  }
}

- (id)totpGeneratorForSite:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSSavedAccount *)self _sidecarForSite:v4 ofType:[(WBSSavedAccount *)self isSavedInSharedGroup]];

  v6 = [v5 totpGenerator];

  return v6;
}

- (void)setTOTPGenerator:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __36__WBSSavedAccount_setTOTPGenerator___block_invoke;
  id v10 = &unk_1E615CCF0;
  id v11 = self;
  id v12 = v4;
  id v5 = v4;
  v6 = _Block_copy(&v7);
  -[WBSSavedAccount _updatePasswordSidecarsIfNecessaryWithBlock:](self, "_updatePasswordSidecarsIfNecessaryWithBlock:", v6, v7, v8, v9, v10, v11);
  [(WBSSavedAccount *)self _updatePasskeySidecarsIfNecessaryWithBlock:v6];
}

void __36__WBSSavedAccount_setTOTPGenerator___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (a2 == 1)
  {
    int v8 = [*(id *)(a1 + 32) isSavedInSharedGroup];
    v6 = v9;
    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v6 = v5;
  if (!a2)
  {
    char v7 = [*(id *)(a1 + 32) isSavedInSharedGroup];
    v6 = v9;
    if ((v7 & 1) == 0)
    {
LABEL_6:
      [v6 setTotpGenerator:*(void *)(a1 + 40)];
      v6 = v9;
    }
  }
LABEL_7:
}

- (NSDate)lastRecentlyDeletedNotificationDate
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v4 = [v3 dictionaryForKey:@"lastRecentlyDeletedNotificationDateDictionary"];

  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WBSSavedAccount hash](self, "hash"));
  v6 = [v5 stringValue];
  char v7 = [v4 objectForKey:v6];

  return (NSDate *)v7;
}

- (void)setLastRecentlyDeletedNotificationDate:(id)a3
{
  id v10 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v5 = [v4 dictionaryForKey:@"lastRecentlyDeletedNotificationDateDictionary"];
  v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  char v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WBSSavedAccount hash](self, "hash"));
  int v8 = [v7 stringValue];

  if (v10) {
    [v6 setObject:v10 forKeyedSubscript:v8];
  }
  else {
    [v6 removeObjectForKey:v8];
  }
  id v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v9 setValue:v6 forKey:@"lastRecentlyDeletedNotificationDateDictionary"];
}

- (NSString)currentOneTimeCode
{
  v2 = [(WBSSavedAccount *)self totpGenerators];
  v3 = [v2 firstObject];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v3 codeForDate:v4];

  return (NSString *)v5;
}

- (int64_t)credentialTypes
{
  int64_t v2 = self->_password != 0;
  if (self->_passkeyCredentialID) {
    v2 |= 2uLL;
  }
  if (self->_signInWithAppleAccount) {
    return v2 | 4;
  }
  else {
    return v2;
  }
}

- (NSString)notesEntry
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__14;
  id v15 = __Block_byref_object_dispose__14;
  id v16 = 0;
  sitesToSidecars = self->_sitesToSidecars;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__WBSSavedAccount_notesEntry__block_invoke;
  v10[3] = &unk_1E615CD18;
  v10[4] = self;
  v10[5] = &v11;
  [(NSMutableDictionary *)sitesToSidecars enumerateKeysAndObjectsUsingBlock:v10];
  BOOL v4 = [(WBSSavedAccount *)self isSavedInSharedGroup];
  id v5 = (void *)v12[5];
  if (!v4)
  {
    if (!v5)
    {
      v6 = [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary objectForKeyedSubscript:&unk_1F10864B8];
      uint64_t v7 = [v6 notesEntry];
      goto LABEL_7;
    }
LABEL_5:
    id v8 = v5;
    goto LABEL_8;
  }
  if (v5) {
    goto LABEL_5;
  }
  v6 = [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary objectForKeyedSubscript:&unk_1F10864A0];
  uint64_t v7 = [v6 notesEntry];
LABEL_7:
  id v8 = (id)v7;

LABEL_8:
  _Block_object_dispose(&v11, 8);

  return (NSString *)v8;
}

void __29__WBSSavedAccount_notesEntry__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a3;
  if ([v6 isSavedInSharedGroup]) {
    id v8 = &unk_1F10864A0;
  }
  else {
    id v8 = &unk_1F10864B8;
  }
  id v9 = [v7 objectForKeyedSubscript:v8];

  id v14 = [v9 notesEntry];

  id v10 = v14;
  if (v14)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = v14;
    uint64_t v13 = *(void **)(v11 + 40);
    id v15 = v12;
    *(void *)(v11 + 40) = v12;

    *a4 = 1;
    id v10 = v15;
  }
}

- (void)setNotesEntry:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __33__WBSSavedAccount_setNotesEntry___block_invoke;
  id v10 = &unk_1E615CCF0;
  uint64_t v11 = self;
  id v12 = v4;
  id v5 = v4;
  v6 = _Block_copy(&v7);
  -[WBSSavedAccount _updatePasswordSidecarsIfNecessaryWithBlock:](self, "_updatePasswordSidecarsIfNecessaryWithBlock:", v6, v7, v8, v9, v10, v11);
  [(WBSSavedAccount *)self _updatePasskeySidecarsIfNecessaryWithBlock:v6];
}

void __33__WBSSavedAccount_setNotesEntry___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (a2 == 1)
  {
    int v8 = [*(id *)(a1 + 32) isSavedInSharedGroup];
    v6 = v9;
    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v6 = v5;
  if (!a2)
  {
    char v7 = [*(id *)(a1 + 32) isSavedInSharedGroup];
    v6 = v9;
    if ((v7 & 1) == 0)
    {
LABEL_6:
      [v6 setNotesEntry:*(void *)(a1 + 40)];
      v6 = v9;
    }
  }
LABEL_7:
}

- (NSString)effectiveTitle
{
  v3 = [(WBSSavedAccount *)self customTitle];
  if ([v3 length])
  {
    id v4 = [(WBSSavedAccount *)self customTitle];
  }
  else
  {
    id v4 = self->_serviceName;
  }
  id v5 = v4;

  if ([(NSString *)v5 length])
  {
    v6 = v5;
  }
  else
  {
    v6 = [(WBSSavedAccount *)self userVisibleDomain];
  }
  char v7 = v6;

  return v7;
}

- (NSString)effectiveTitleForSorting
{
  v3 = [(WBSSavedAccount *)self customTitle];
  if ([v3 length])
  {
    id v4 = [(WBSSavedAccount *)self customTitle];
  }
  else
  {
    id v4 = self->_serviceName;
  }
  id v5 = v4;

  if ([(NSString *)v5 length])
  {
    v6 = v5;
  }
  else
  {
    char v7 = [(WBSSavedAccount *)self highLevelDomain];
    objc_msgSend(v7, "_lp_userVisibleHost");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSString)customTitle
{
  BOOL v3 = [(WBSSavedAccount *)self isSavedInSharedGroup];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__14;
  id v17 = __Block_byref_object_dispose__14;
  id v18 = 0;
  sitesToSidecars = self->_sitesToSidecars;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__WBSSavedAccount_customTitle__block_invoke;
  v11[3] = &unk_1E615CD40;
  BOOL v12 = v3;
  v11[4] = &v13;
  [(NSMutableDictionary *)sitesToSidecars enumerateKeysAndObjectsUsingBlock:v11];
  BOOL v5 = [(WBSSavedAccount *)self isSavedInSharedGroup];
  v6 = (void *)v14[5];
  if (!v5)
  {
    if (!v6)
    {
      char v7 = [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary objectForKeyedSubscript:&unk_1F10864B8];
      uint64_t v8 = [v7 customTitle];
      goto LABEL_7;
    }
LABEL_5:
    id v9 = v6;
    goto LABEL_8;
  }
  if (v6) {
    goto LABEL_5;
  }
  char v7 = [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary objectForKeyedSubscript:&unk_1F10864A0];
  uint64_t v8 = [v7 customTitle];
LABEL_7:
  id v9 = (id)v8;

LABEL_8:
  _Block_object_dispose(&v13, 8);

  return (NSString *)v9;
}

void __30__WBSSavedAccount_customTitle__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  if (*(unsigned char *)(a1 + 40)) {
    char v7 = &unk_1F10864A0;
  }
  else {
    char v7 = &unk_1F10864B8;
  }
  uint64_t v8 = [a3 objectForKeyedSubscript:v7];
  id v13 = [v8 customTitle];

  id v9 = v13;
  if (v13)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    id v11 = v13;
    BOOL v12 = *(void **)(v10 + 40);
    id v14 = v11;
    *(void *)(v10 + 40) = v11;

    *a4 = 1;
    id v9 = v14;
  }
}

- (void)setCustomTitle:(id)a3 performSidecarUpdate:(BOOL)a4
{
  id v6 = a3;
  if (WBSIsEqual(v6, self->_customTitle))
  {
    if (a4)
    {
      char v7 = (NSString *)[v6 copy];
      customTitle = self->_customTitle;
      self->_customTitle = v7;

LABEL_7:
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __55__WBSSavedAccount_setCustomTitle_performSidecarUpdate___block_invoke;
      aBlock[3] = &unk_1E615CD68;
      aBlock[4] = self;
      id v11 = _Block_copy(aBlock);
      [(WBSSavedAccount *)self _updatePasswordSidecarsIfNecessaryWithBlock:v11];
      [(WBSSavedAccount *)self _updatePasskeySidecarsIfNecessaryWithBlock:v11];
    }
  }
  else if (![(NSString *)self->_customTitle isEqualToString:v6] || a4)
  {
    id v9 = (NSString *)[v6 copy];
    uint64_t v10 = self->_customTitle;
    self->_customTitle = v9;

    if (a4) {
      goto LABEL_7;
    }
  }
}

void __55__WBSSavedAccount_setCustomTitle_performSidecarUpdate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v12 = v5;
  if (a2 == 1)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v7 = a1 + 32;
    int v11 = [v10 isSavedInSharedGroup];
    id v6 = v12;
    if (v11)
    {
LABEL_4:
      [v6 setCustomTitle:*(void *)(*(void *)v7 + 72)];
      id v6 = v12;
    }
  }
  else
  {
    id v6 = v5;
    if (!a2)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v7 = a1 + 32;
      char v9 = [v8 isSavedInSharedGroup];
      id v6 = v12;
      if ((v9 & 1) == 0) {
        goto LABEL_4;
      }
    }
  }
}

- (id)lastUsedDateForContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(WBSSavedAccount *)self credentialTypes];
  if (v5 == 3)
  {
    uint64_t v7 = [(WBSSavedAccount *)self _firstSidecarForAnySiteOfType:0];
    uint64_t v8 = [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary objectForKeyedSubscript:&unk_1F10864B8];
    char v9 = [v7 lastUsedDateForContext:v4];
    uint64_t v10 = [v8 lastUsedDateForContext:v4];
    int v11 = (void *)v10;
    if (v9 && v10)
    {
      id v12 = [v9 laterDate:v10];
    }
    else
    {
      if (v10) {
        id v14 = (void *)v10;
      }
      else {
        id v14 = v9;
      }
      id v12 = v14;
    }
    id v13 = v12;
  }
  else
  {
    if (v5 == 2)
    {
      id v6 = [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary objectForKeyedSubscript:&unk_1F10864B8];
    }
    else
    {
      if (v5 != 1)
      {
        id v13 = 0;
        goto LABEL_17;
      }
      id v6 = [(WBSSavedAccount *)self _firstSidecarForAnySiteOfType:0];
    }
    uint64_t v7 = v6;
    id v13 = [v6 lastUsedDateForContext:v4];
  }

LABEL_17:
  return v13;
}

- (void)setLastUsedDate:(id)a3 forContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __46__WBSSavedAccount_setLastUsedDate_forContext___block_invoke;
  id v14 = &unk_1E615CCF0;
  id v15 = v6;
  id v16 = v7;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = _Block_copy(&v11);
  -[WBSSavedAccount _updatePasswordSidecarsIfNecessaryWithBlock:](self, "_updatePasswordSidecarsIfNecessaryWithBlock:", v10, v11, v12, v13, v14);
  [(WBSSavedAccount *)self _updatePasskeySidecarsIfNecessaryWithBlock:v10];
}

void __46__WBSSavedAccount_setLastUsedDate_forContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    id v6 = v5;
    [v5 setLastUsedDate:*(void *)(a1 + 32) forContext:*(void *)(a1 + 40)];
    id v5 = v6;
  }
}

- (BOOL)isDefaultCredentialForFullyQualifiedHostname:(id)a3
{
  return [(NSMutableSet *)self->_sitesForWhichSelfIsDefault containsObject:a3];
}

- (BOOL)canUserEditSavedAccount
{
  BOOL v3 = [(WBSSavedAccount *)self passkeyRelyingPartyID];
  char v4 = [v3 isEqualToString:@"apple.com"];

  if (v4) {
    return 0;
  }
  if ([(WBSSavedAccount *)self isSavedInPersonalKeychain]) {
    return 1;
  }
  id v6 = +[WBSOngoingSharingGroupProvider sharedProvider];
  id v7 = [(WBSSavedAccount *)self sharedGroupID];
  char v8 = [v6 canCurrentUserEditSavedAccountsInGroupWithID:v7];

  return v8;
}

- (BOOL)isCurrentUserOriginalContributor
{
  if ([(WBSSavedAccount *)self isSavedInPersonalKeychain]) {
    return 1;
  }
  BOOL v3 = [(WBSSavedAccount *)self originalContributorParticipantID];

  if (!v3)
  {
    char v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSSavedAccount isCurrentUserOriginalContributor]();
    }
    return 1;
  }
  char v4 = +[WBSOngoingSharingGroupProvider sharedProvider];
  id v5 = [v4 currentUserParticipantID];

  if (v5)
  {
    id v6 = [(WBSSavedAccount *)self originalContributorParticipantID];
    char v7 = [v6 isEqual:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)participantIDThatMovedSavedAccountToRecentlyDeleted
{
  int64_t v2 = [(WBSSavedAccount *)self _firstSidecarForAnySiteOfType:1];
  BOOL v3 = [v2 participantIDForUserThatMovedSavedAccountToRecentlyDeleted];

  return (NSString *)v3;
}

- (BOOL)markOriginalContributorParticipantID
{
  BOOL v3 = +[WBSOngoingSharingGroupProvider sharedProvider];
  char v4 = [v3 currentUserParticipantID];

  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__WBSSavedAccount_markOriginalContributorParticipantID__block_invoke;
    aBlock[3] = &unk_1E615CD68;
    id v9 = v4;
    id v5 = _Block_copy(aBlock);
    [(WBSSavedAccount *)self _updatePasswordSidecarsIfNecessaryWithBlock:v5];
    [(WBSSavedAccount *)self _updatePasskeySidecarsIfNecessaryWithBlock:v5];
  }
  else
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WBSSavedAccount markOriginalContributorParticipantID]();
    }
  }

  return v4 != 0;
}

void __55__WBSSavedAccount_markOriginalContributorParticipantID__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1)
  {
    id v6 = v5;
    [v5 setOriginalContributorParticipantID:*(void *)(a1 + 32)];
    id v5 = v6;
  }
}

- (BOOL)markParticipantIDThatMovedSavedAccountToRecentlyDeleted
{
  BOOL v3 = +[WBSOngoingSharingGroupProvider sharedProvider];
  char v4 = [v3 currentUserParticipantID];

  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__WBSSavedAccount_markParticipantIDThatMovedSavedAccountToRecentlyDeleted__block_invoke;
    aBlock[3] = &unk_1E615CD68;
    id v9 = v4;
    id v5 = _Block_copy(aBlock);
    [(WBSSavedAccount *)self _updatePasswordSidecarsIfNecessaryWithBlock:v5];
    [(WBSSavedAccount *)self _updatePasskeySidecarsIfNecessaryWithBlock:v5];
  }
  else
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WBSSavedAccount markOriginalContributorParticipantID]();
    }
  }

  return v4 != 0;
}

void __74__WBSSavedAccount_markParticipantIDThatMovedSavedAccountToRecentlyDeleted__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1)
  {
    id v6 = v5;
    [v5 setParticipantIDForUserThatMovedSavedAccountToRecentlyDeleted:*(void *)(a1 + 32)];
    id v5 = v6;
  }
}

- (void)clearParticipantIDThatMovedSavedAccountToRecentlyDeleted
{
  [(WBSSavedAccount *)self _updatePasswordSidecarsIfNecessaryWithBlock:&__block_literal_global_55];
  [(WBSSavedAccount *)self _updatePasskeySidecarsIfNecessaryWithBlock:&__block_literal_global_55];
}

void __75__WBSSavedAccount_clearParticipantIDThatMovedSavedAccountToRecentlyDeleted__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (a2 == 1)
  {
    id v5 = v4;
    [v4 setParticipantIDForUserThatMovedSavedAccountToRecentlyDeleted:0];
    id v4 = v5;
  }
}

- (NSString)originalContributorParticipantID
{
  if ([(WBSSavedAccount *)self credentialTypes] == 4)
  {
    BOOL v3 = [(WBSSavedAccount *)self signInWithAppleAccount];
    id v4 = [v3 shareInfo];
    id v5 = [v4 participantID];
  }
  else
  {
    BOOL v3 = [(WBSSavedAccount *)self _firstSidecarForAnySiteOfType:1];
    id v5 = [v3 originalContributorParticipantID];
  }

  return (NSString *)v5;
}

- (BOOL)hasSidecarDataToConsiderForCredentialMerging
{
  BOOL v3 = [(WBSSavedAccount *)self totpGenerators];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(WBSSavedAccount *)self notesEntry];
    if ([v5 length])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(WBSSavedAccount *)self customTitle];
      if ([v6 length])
      {
        BOOL v4 = 1;
      }
      else
      {
        char v7 = [(WBSSavedAccount *)self originalContributorParticipantID];
        BOOL v4 = [v7 length] != 0;
      }
    }
  }
  return v4;
}

- (BOOL)_canMergeWithSavedAccount:(id)a3 requiresDataCopying:(BOOL *)a4
{
  id v6 = a3;
  int64_t v7 = [(WBSSavedAccount *)self credentialTypes];
  uint64_t v8 = [v6 credentialTypes];
  if (v7 == 1 && v8 == 2 || v7 == 2 && v8 == 1)
  {
    if ([(WBSSavedAccount *)self _isSidecarDataForCredentialMergingEqual:v6])
    {
      *a4 = 0;
      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = [(WBSSavedAccount *)self _isSidecarDataForCredentialMergingCompatible:v6];
      *a4 = v9;
    }
  }
  else
  {
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSSavedAccount _canMergeWithSavedAccount:requiresDataCopying:]();
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_isSidecarDataForCredentialMergingEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSSavedAccount *)self notesEntry];
  id v6 = [v4 notesEntry];
  if (WBSIsEqual(v5, v6))
  {
    int64_t v7 = [(WBSSavedAccount *)self customTitle];
    uint64_t v8 = [v4 customTitle];
    if (WBSIsEqual(v7, v8))
    {
      BOOL v9 = [(WBSSavedAccount *)self originalContributorParticipantID];
      uint64_t v10 = [v4 originalContributorParticipantID];
      char v11 = WBSIsEqual(v9, v10);
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)_isSidecarDataForCredentialMergingCompatible:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSSavedAccount *)self notesEntry];
  id v6 = [v4 notesEntry];
  if ([v5 length] && objc_msgSend(v6, "length")) {
    int v7 = [v5 isEqual:v6];
  }
  else {
    int v7 = 1;
  }
  uint64_t v8 = [(WBSSavedAccount *)self customTitle];
  BOOL v9 = [v4 customTitle];
  if (![v8 length])
  {
    int v11 = v7;
    goto LABEL_14;
  }
  uint64_t v10 = [v9 length];
  if (v10) {
    int v11 = 0;
  }
  else {
    int v11 = v7;
  }
  if (!v10 || ((v7 ^ 1) & 1) != 0)
  {
LABEL_14:
    if (!v11) {
      goto LABEL_12;
    }
LABEL_15:
    id v13 = [(WBSSavedAccount *)self originalContributorParticipantID];
    id v14 = [v4 originalContributorParticipantID];
    char v12 = WBSIsEqual(v13, v14);

    goto LABEL_16;
  }
  if ([v8 isEqual:v9]) {
    goto LABEL_15;
  }
LABEL_12:
  char v12 = 0;
LABEL_16:

  return v12;
}

- (NSString)uniqueIdentifierForPasswordManagerLegacy
{
  if ([(NSString *)self->_sharedGroupID length]) {
    sharedGroupID = (__CFString *)self->_sharedGroupID;
  }
  else {
    sharedGroupID = &stru_1F105D3F0;
  }
  id v4 = sharedGroupID;
  int64_t v5 = [(WBSSavedAccount *)self credentialTypes];
  id v6 = NSString;
  if (v5 == 4)
  {
    uint64_t v7 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount userID];
    uint64_t v8 = (void *)v7;
    if (v7) {
      BOOL v9 = (__CFString *)v7;
    }
    else {
      BOOL v9 = &stru_1F105D3F0;
    }
    if (self->_serviceName) {
      serviceName = (__CFString *)self->_serviceName;
    }
    else {
      serviceName = &stru_1F105D3F0;
    }
    uint64_t v11 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount clientID];
    char v12 = (void *)v11;
    if (v11) {
      id v13 = (__CFString *)v11;
    }
    else {
      id v13 = &stru_1F105D3F0;
    }
    uint64_t v14 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount privateEmail];
    id v15 = (void *)v14;
    if (v14) {
      id v16 = (__CFString *)v14;
    }
    else {
      id v16 = &stru_1F105D3F0;
    }
    objc_msgSend(v6, "stringWithFormat:", @"user = %@; serviceName = %@; clientID = %@; privateEmail = %@; groupID = %@;",
      v9,
      serviceName,
      v13,
      v16,
      v4,
      v27);
  }
  else
  {
    if (self->_user) {
      user = (__CFString *)self->_user;
    }
    else {
      user = &stru_1F105D3F0;
    }
    uint64_t v8 = [(WBSSavedAccount *)self protectionSpaces];
    id v18 = objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_501);
    char v12 = [v18 componentsJoinedByString:@", "];

    uint64_t v19 = [v6 stringWithFormat:@"[ %@ ]", v12];
    id v15 = (void *)v19;
    if (v19) {
      id v20 = (__CFString *)v19;
    }
    else {
      id v20 = &stru_1F105D3F0;
    }
    passkeyRelyingPartyID = (__CFString *)self->_passkeyRelyingPartyID;
    if (!passkeyRelyingPartyID) {
      passkeyRelyingPartyID = &stru_1F105D3F0;
    }
    passkeyCredentialID = (__CFString *)self->_passkeyCredentialID;
    if (!passkeyCredentialID) {
      passkeyCredentialID = &stru_1F105D3F0;
    }
    if (v4) {
      uint64_t v23 = v4;
    }
    else {
      uint64_t v23 = &stru_1F105D3F0;
    }
    customTitle = (__CFString *)self->_customTitle;
    if (!customTitle) {
      customTitle = &stru_1F105D3F0;
    }
    objc_msgSend(v6, "stringWithFormat:", @"user = %@; password_protectionSpaces = %@; passkey_rpid = %@; passkey_credentialID = %@; groupID = %@; customTitle = %@;",
      user,
      v20,
      passkeyRelyingPartyID,
      passkeyCredentialID,
      v23,
      customTitle);
  v25 = };

  return (NSString *)v25;
}

- (NSData)stableID
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NSString *)self->_user length]) {
    [v3 setObject:self->_user forKeyedSubscript:@"userName"];
  }
  id v4 = [(WBSSavedAccount *)self sites];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(WBSSavedAccount *)self sites];
    [v3 setObject:v6 forKeyedSubscript:@"sites"];
  }
  if ([(NSString *)self->_passkeyCredentialID length]) {
    [v3 setObject:self->_passkeyCredentialID forKeyedSubscript:@"passkeyCredentialID"];
  }
  if ([(NSString *)self->_passkeyRelyingPartyID length]) {
    [v3 setObject:self->_passkeyRelyingPartyID forKeyedSubscript:@"passkeyRelyingPartyID"];
  }
  if ([(NSString *)self->_sharedGroupID length]) {
    [v3 setObject:self->_sharedGroupID forKeyedSubscript:@"groupID"];
  }
  uint64_t v7 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount clientID];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    BOOL v9 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount clientID];
    [v3 setObject:v9 forKeyedSubscript:@"clientID"];
  }
  uint64_t v10 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount userID];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    char v12 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount userID];
    [v3 setObject:v12 forKeyedSubscript:@"userID"];
  }
  id v13 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:3 error:0];

  return (NSData *)v13;
}

- (BOOL)isAppleIDPasskey
{
  return self->_passkeyCredentialID
      && [(NSString *)self->_passkeyRelyingPartyID isEqualToString:@"apple.com"];
}

- (BOOL)canBeExportedToPasswordsCSVFile
{
  if (([(WBSSavedAccount *)self credentialTypes] & 1) == 0
    || [(WBSSavedAccount *)self userIsNeverSaveMarker])
  {
    return 0;
  }
  return [(WBSSavedAccount *)self isCurrentUserOriginalContributor];
}

- (id)_firstSidecarForAnySiteOfType:(int64_t)a3
{
  return [(WBSSavedAccount *)self _firstSidecarForAnySiteOfType:a3 inSitesToSidecars:self->_sitesToSidecars passkeySidecars:self->_passkeyCredentialSidecarsDictionary];
}

- (id)_firstSidecarForAnySiteOfType:(int64_t)a3 inSitesToSidecars:(id)a4 passkeySidecars:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [NSNumber numberWithInteger:a3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = objc_msgSend(v7, "allValues", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) objectForKeyedSubscript:v9];
        if (v15)
        {
          id v16 = v15;

          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v16 = [v8 objectForKeyedSubscript:v9];
LABEL_11:

  return v16;
}

- (id)_sidecarForSite:(id)a3 ofType:(int64_t)a4
{
  uint64_t v5 = [(NSMutableDictionary *)self->_sitesToSidecars objectForKeyedSubscript:a3];
  id v6 = [NSNumber numberWithInteger:a4];
  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (BOOL)hasPasskeySidecars
{
  return [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary count] != 0;
}

- (id)_passkeySidecarOfType:(int64_t)a3
{
  passkeyCredentialSidecarsDictionary = self->_passkeyCredentialSidecarsDictionary;
  id v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)passkeyCredentialSidecarsDictionary objectForKeyedSubscript:v4];

  return v5;
}

- (void)_addPasskeySidecar:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 customTitle];
    id v6 = v5;
    if (v5)
    {
      id v7 = (NSString *)[v5 copy];
      customTitle = self->_customTitle;
      self->_customTitle = v7;
    }
    uint64_t v9 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = 1;
LABEL_7:
    passkeyCredentialSidecarsDictionary = self->_passkeyCredentialSidecarsDictionary;
    uint64_t v11 = [NSNumber numberWithInteger:v9];
    [(NSMutableDictionary *)passkeyCredentialSidecarsDictionary setObject:v4 forKeyedSubscript:v11];

    goto LABEL_10;
  }
  uint64_t v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[WBSSavedAccount _addPasskeySidecar:](v12);
  }
LABEL_10:
}

- (void)_mergePasskeySidecarsFromSavedAccount:(id)a3
{
}

- (BOOL)hasPasswordSidecars
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  sitesToSidecars = self->_sitesToSidecars;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__WBSSavedAccount_hasPasswordSidecars__block_invoke;
  v5[3] = &unk_1E615CDB0;
  v5[4] = &v6;
  [(NSMutableDictionary *)sitesToSidecars enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__WBSSavedAccount_hasPasswordSidecars__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 count];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)enumeratePasswordSidecarsWithBlock:(id)a3
{
  id v4 = a3;
  sitesToSidecars = self->_sitesToSidecars;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__WBSSavedAccount_enumeratePasswordSidecarsWithBlock___block_invoke;
  v7[3] = &unk_1E615CE00;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)sitesToSidecars enumerateKeysAndObjectsUsingBlock:v7];
}

void __54__WBSSavedAccount_enumeratePasswordSidecarsWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__WBSSavedAccount_enumeratePasswordSidecarsWithBlock___block_invoke_2;
  v4[3] = &unk_1E615CDD8;
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __54__WBSSavedAccount_enumeratePasswordSidecarsWithBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v6 + 16))(v6, [a2 unsignedIntegerValue], v7, a4);
}

- (void)enumeratePasskeySidecarsWithBlock:(id)a3
{
  id v4 = a3;
  passkeyCredentialSidecarsDictionary = self->_passkeyCredentialSidecarsDictionary;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__WBSSavedAccount_enumeratePasskeySidecarsWithBlock___block_invoke;
  v7[3] = &unk_1E615CDD8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)passkeyCredentialSidecarsDictionary enumerateKeysAndObjectsUsingBlock:v7];
}

void __53__WBSSavedAccount_enumeratePasskeySidecarsWithBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v6 + 16))(v6, [a2 unsignedIntegerValue], v7, a4);
}

- (NSArray)allPasswordSidecars
{
  int64_t v2 = [(WBSSavedAccount *)self _allPasswordSidecarsAsMutableArray];
  char v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSMutableArray)_allPasswordSidecarsAsMutableArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_sitesToSidecars allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) allValues];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSMutableArray *)v3;
}

- (void)_addSidecar:(id)a3 forSite:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_sitesToSidecars objectForKeyedSubscript:v7];
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_sitesToSidecars setObject:v8 forKeyedSubscript:v7];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setObject:v6 forKeyedSubscript:&unk_1F10864B8];
    char v9 = [v6 customTitle];
    uint64_t v10 = v9;
    if (v9)
    {
      long long v11 = (NSString *)[v9 copy];
      customTitle = self->_customTitle;
      self->_customTitle = v11;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 setObject:v6 forKeyedSubscript:&unk_1F10864A0];
    }
    else
    {
      long long v13 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[WBSSavedAccount _addSidecar:forSite:]((uint64_t)v7, v13);
      }
    }
  }
}

- (id)_allSidecarsForSite:(id)a3
{
  char v3 = [(NSMutableDictionary *)self->_sitesToSidecars objectForKeyedSubscript:a3];
  id v4 = v3;
  if (!v3) {
    char v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v5 = v3;

  return v5;
}

- (NSArray)allSidecars
{
  char v3 = [(WBSSavedAccount *)self _allPasswordSidecarsAsMutableArray];
  passkeyCredentialSidecarsDictionary = self->_passkeyCredentialSidecarsDictionary;
  if (passkeyCredentialSidecarsDictionary)
  {
    id v5 = [(NSMutableDictionary *)passkeyCredentialSidecarsDictionary allValues];
    [v3 addObjectsFromArray:v5];
  }
  return (NSArray *)v3;
}

- (void)_updatePasswordSidecarsIfNecessaryWithBlock:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(WBSSavedAccount *)self credentialTypes])
  {
    id v5 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    id v6 = objc_msgSend(MEMORY[0x1E4F18D88], "safari_credentialWithUser:password:persistence:", self->_user, self->_password, 3);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = [(WBSSavedAccount *)self protectionSpaces];
    uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v24)
    {
      uint64_t v7 = *(void *)v31;
      id v22 = self;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v31 != v7) {
            objc_enumerationMutation(obj);
          }
          char v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "host", v22);
          long long v11 = [(NSMutableDictionary *)self->_sitesToSidecars objectForKeyedSubscript:v10];
          long long v12 = [v11 objectForKeyedSubscript:&unk_1F10864B8];

          if (!v12)
          {
            long long v13 = [[WBSSavedAccountSidecar alloc] initWithUser:self->_user protectionSpace:v9];
            [(WBSSavedAccount *)self _addSidecar:v13 forSite:v10];
            [(NSMutableDictionary *)self->_sitesToSidecars objectForKeyedSubscript:v10];
            uint64_t v14 = v7;
            id v15 = v6;
            uint64_t v16 = v5;
            v18 = id v17 = v4;

            long long v11 = (void *)v18;
            id v4 = v17;
            id v5 = v16;
            id v6 = v15;
            uint64_t v7 = v14;
            self = v22;
          }
          if ([(WBSSavedAccount *)self isSavedInSharedGroup])
          {
            long long v19 = [v11 objectForKeyedSubscript:&unk_1F10864A0];

            if (!v19)
            {
              long long v20 = [WBSSavedAccountSharedSidecar alloc];
              long long v21 = [(WBSSavedAccountSharedSidecar *)v20 initWithUser:self->_user protectionSpace:v9 dictionaryRepresentation:MEMORY[0x1E4F1CC08]];
              [(WBSSavedAccount *)self _addSidecar:v21 forSite:v10];
            }
          }
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __63__WBSSavedAccount__updatePasswordSidecarsIfNecessaryWithBlock___block_invoke;
          v25[3] = &unk_1E615CE28;
          id v29 = v4;
          id v26 = v5;
          id v27 = v6;
          v28 = self;
          [v11 enumerateKeysAndObjectsUsingBlock:v25];
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v24);
    }
  }
}

void __63__WBSSavedAccount__updatePasswordSidecarsIfNecessaryWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  uint64_t v5 = [a2 unsignedIntegerValue];
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v5, v11);
  }
  if (v5 == 1)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v7 = v11;
  }
  else
  {
    uint64_t v7 = v11;
    if (v5) {
      goto LABEL_8;
    }
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
  }
  uint64_t v10 = [v7 protectionSpace];
  objc_msgSend(v8, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v11, v9, v10, *(void *)(*(void *)(a1 + 48) + 168), objc_msgSend(*(id *)(a1 + 48), "isRecentlyDeleted"));

  uint64_t v7 = v11;
LABEL_8:
}

- (void)_updatePasskeySidecarsIfNecessaryWithBlock:(id)a3
{
  id v4 = a3;
  if (([(WBSSavedAccount *)self credentialTypes] & 2) != 0)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F18D88], "safari_credentialWithUser:password:persistence:", self->_passkeyUserHandle, &stru_1F105D3F0, 3);
    uint64_t v6 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F18D98], "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", self->_passkeyRelyingPartyID);
    id v8 = [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary objectForKeyedSubscript:&unk_1F10864B8];

    if (!v8)
    {
      uint64_t v9 = [[WBSSavedAccountSidecar alloc] initWithUser:self->_passkeyUserHandle protectionSpace:v7];
      [(WBSSavedAccount *)self _addPasskeySidecar:v9];
    }
    if ([(WBSSavedAccount *)self isSavedInSharedGroup])
    {
      uint64_t v10 = [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary objectForKeyedSubscript:&unk_1F10864A0];

      if (!v10)
      {
        id v11 = [WBSSavedAccountSharedSidecar alloc];
        long long v12 = [(WBSSavedAccountSharedSidecar *)v11 initWithUser:self->_passkeyUserHandle protectionSpace:v7 dictionaryRepresentation:MEMORY[0x1E4F1CC08]];
        [(WBSSavedAccount *)self _addPasskeySidecar:v12];
      }
    }
    passkeyCredentialSidecarsDictionary = self->_passkeyCredentialSidecarsDictionary;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__WBSSavedAccount__updatePasskeySidecarsIfNecessaryWithBlock___block_invoke;
    v16[3] = &unk_1E615CE28;
    id v17 = v6;
    id v18 = v5;
    long long v19 = self;
    id v20 = v4;
    id v14 = v5;
    id v15 = v6;
    [(NSMutableDictionary *)passkeyCredentialSidecarsDictionary enumerateKeysAndObjectsUsingBlock:v16];
  }
}

void __62__WBSSavedAccount__updatePasskeySidecarsIfNecessaryWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  uint64_t v5 = [a2 unsignedIntegerValue];
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v5, v11);
  }
  if (v5 == 1)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v7 = v11;
  }
  else
  {
    uint64_t v7 = v11;
    if (v5) {
      goto LABEL_8;
    }
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
  }
  uint64_t v10 = [v7 protectionSpace];
  objc_msgSend(v8, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v11, v9, v10, *(void *)(*(void *)(a1 + 48) + 168), objc_msgSend(*(id *)(a1 + 48), "isRecentlyDeleted"));

  uint64_t v7 = v11;
LABEL_8:
}

- (BOOL)hasSidecarData
{
  char v3 = [(WBSSavedAccount *)self totpGenerators];
  if ([v3 count]) {
    goto LABEL_6;
  }
  id v4 = [(WBSSavedAccount *)self hideWarningMarker];
  if (v4)
  {

LABEL_6:
    BOOL v6 = 1;
    goto LABEL_7;
  }
  uint64_t v5 = [(WBSSavedAccount *)self notesEntry];
  if ([v5 length])
  {

    goto LABEL_6;
  }
  id v8 = [(WBSSavedAccount *)self customTitle];
  uint64_t v9 = [v8 length];

  if (v9) {
    return 1;
  }
  char v3 = [(WBSSavedAccount *)self lastOneTimeShareDateForPasskey];
  BOOL v6 = v3 != 0;
LABEL_7:

  return v6;
}

- (void)_copySharablePasswordSidecarDataFromPersonalSidecarsToSharedSidecars
{
  sitesToSidecars = self->_sitesToSidecars;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__WBSSavedAccount__copySharablePasswordSidecarDataFromPersonalSidecarsToSharedSidecars__block_invoke;
  v3[3] = &unk_1E615CE50;
  v3[4] = self;
  [(NSMutableDictionary *)sitesToSidecars enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __87__WBSSavedAccount__copySharablePasswordSidecarDataFromPersonalSidecarsToSharedSidecars__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_copySharableDataFromPersonalSidecarToSharedSidecarInDictionary:");
}

- (void)_copySharablePasskeySidecarDataFromPersonalSidecarsToSharedSidecars
{
}

- (void)_copySharableDataFromPersonalSidecarToSharedSidecarInDictionary:(id)a3
{
  id v7 = a3;
  char v3 = [v7 objectForKeyedSubscript:&unk_1F10864B8];
  uint64_t v4 = [v7 objectForKeyedSubscript:&unk_1F10864A0];
  uint64_t v5 = (void *)v4;
  if (v3 && !v4)
  {
    BOOL v6 = [[WBSSavedAccountSharedSidecar alloc] initWithPersonalSidecar:v3];
    [v7 setObject:v6 forKeyedSubscript:&unk_1F10864A0];
  }
}

- (void)_copySharablePasswordSidecarDataFromSharedSidecarsToPersonalSidecars
{
  sitesToSidecars = self->_sitesToSidecars;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__WBSSavedAccount__copySharablePasswordSidecarDataFromSharedSidecarsToPersonalSidecars__block_invoke;
  v3[3] = &unk_1E615CE50;
  v3[4] = self;
  [(NSMutableDictionary *)sitesToSidecars enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __87__WBSSavedAccount__copySharablePasswordSidecarDataFromSharedSidecarsToPersonalSidecars__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_copySharableDataFromSharedSidecarIntoPersonalSidecarInDictionary:");
}

- (void)_copySharablePasskeySidecarDataFromSharedSidecarsToPersonalSidecars
{
}

- (void)_copySharableDataFromSharedSidecarIntoPersonalSidecarInDictionary:(id)a3
{
  id v5 = a3;
  char v3 = [v5 objectForKeyedSubscript:&unk_1F10864B8];
  uint64_t v4 = [v5 objectForKeyedSubscript:&unk_1F10864A0];
  if (v4)
  {
    if (v3)
    {
      [(WBSSavedAccountSidecar *)v3 adoptSharableDataFromSharedSidecar:v4];
    }
    else
    {
      char v3 = [[WBSSavedAccountSidecar alloc] initWithSharedSidecar:v4];
      [v5 setObject:v3 forKeyedSubscript:&unk_1F10864B8];
    }
  }
}

- (void)_removeSharableDataFromPersonalPasswordSidecars
{
}

void __66__WBSSavedAccount__removeSharableDataFromPersonalPasswordSidecars__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 objectForKeyedSubscript:&unk_1F10864B8];
  [v3 removeSharableData];
}

- (void)_removeSharableDataFromPersonalPasskeySidecars
{
  id v2 = [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary objectForKeyedSubscript:&unk_1F10864B8];
  [v2 removeSharableData];
}

- (void)_createSidecarsForProtectionSpaceIfNecessary:(id)a3
{
  id v19 = a3;
  uint64_t v4 = [v19 host];
  id v5 = [(NSMutableDictionary *)self->_sitesToSidecars objectForKeyedSubscript:v4];

  if (!v5)
  {
    BOOL v6 = objc_msgSend(MEMORY[0x1E4F18D88], "safari_credentialWithUser:password:persistence:", self->_user, self->_password, 3);
    id v7 = [(WBSSavedAccount *)self _firstSidecarForAnySiteOfType:0];
    if (v7)
    {
      id v8 = [WBSSavedAccountSidecar alloc];
      uint64_t v9 = [v7 user];
      uint64_t v10 = [v7 dictionaryRepresentation];
      id v11 = [(WBSSavedAccountSidecar *)v8 initWithUser:v9 protectionSpace:v19 dictionaryRepresentation:v10];

      long long v12 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
      objc_msgSend(v12, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v11, v6, v19, self->_sharedGroupID, self->_isRecentlyDeleted);

      [(WBSSavedAccount *)self _addSidecar:v11 forSite:v4];
    }
    long long v13 = [(WBSSavedAccount *)self _firstSidecarForAnySiteOfType:1];
    if (v13)
    {
      id v14 = [WBSSavedAccountSharedSidecar alloc];
      id v15 = [v13 user];
      uint64_t v16 = [v13 dictionaryRepresentation];
      id v17 = [(WBSSavedAccountSharedSidecar *)v14 initWithUser:v15 protectionSpace:v19 dictionaryRepresentation:v16];

      id v18 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
      objc_msgSend(v18, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v17, v6, v19, self->_sharedGroupID, self->_isRecentlyDeleted);

      [(WBSSavedAccount *)self _addSidecar:v17 forSite:v4];
    }
  }
}

- (void)_writeFormerlySharedSavedAccountMarkerForCredentialTypes:(int64_t)a3
{
  int v3 = a3;
  int v5 = [(WBSSavedAccount *)self credentialTypes];
  char v6 = v5 & v3;
  if (v5 & v3)
  {
    id v7 = [WBSFormerlySharedSavedAccountMarker alloc];
    id v8 = [(WBSSavedAccount *)self password];
    uint64_t v9 = [(WBSSavedAccount *)self sharedGroupName];
    uint64_t v10 = [(WBSFormerlySharedSavedAccountMarker *)v7 initWithPasswordManagerCredentialIdentifier:v8 nameOfGroupCredentialWasLastSharedIn:v9];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__WBSSavedAccount__writeFormerlySharedSavedAccountMarkerForCredentialTypes___block_invoke;
    v19[3] = &unk_1E615CD68;
    id v20 = v10;
    id v11 = v10;
    [(WBSSavedAccount *)self _updatePasswordSidecarsIfNecessaryWithBlock:v19];
  }
  if ((v6 & 2) != 0)
  {
    long long v12 = [WBSFormerlySharedSavedAccountMarker alloc];
    long long v13 = [(WBSSavedAccount *)self passkeyCredentialID];
    id v14 = [(WBSSavedAccount *)self sharedGroupName];
    id v15 = [(WBSFormerlySharedSavedAccountMarker *)v12 initWithPasswordManagerCredentialIdentifier:v13 nameOfGroupCredentialWasLastSharedIn:v14];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__WBSSavedAccount__writeFormerlySharedSavedAccountMarkerForCredentialTypes___block_invoke_2;
    v17[3] = &unk_1E615CD68;
    id v18 = v15;
    uint64_t v16 = v15;
    [(WBSSavedAccount *)self _updatePasskeySidecarsIfNecessaryWithBlock:v17];
  }
}

void __76__WBSSavedAccount__writeFormerlySharedSavedAccountMarkerForCredentialTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    id v6 = v5;
    [v5 setFormerlySharedSavedAccountMarker:*(void *)(a1 + 32)];
    id v5 = v6;
  }
}

void __76__WBSSavedAccount__writeFormerlySharedSavedAccountMarkerForCredentialTypes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    id v6 = v5;
    [v5 setFormerlySharedSavedAccountMarker:*(void *)(a1 + 32)];
    id v5 = v6;
  }
}

- (void)_clearFormerlySharedSavedAccountMarkerForCredentialTypesIfNecessary:(int64_t)a3
{
  char v3 = a3;
  if (a3)
  {
    id v6 = [(WBSSavedAccount *)self formerlySharedPasswordMarker];
    BOOL v5 = v6 != 0;

    if ((v3 & 2) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v5 = 0;
    if ((a3 & 2) == 0) {
      goto LABEL_7;
    }
  }
  id v7 = [(WBSSavedAccount *)self formerlySharedPasskeyMarker];

  if (v7)
  {
    uint64_t v8 = v5 | 2;
    goto LABEL_9;
  }
LABEL_7:
  if (!v5) {
    return;
  }
  uint64_t v8 = 1;
LABEL_9:
  [(WBSSavedAccount *)self _clearFormerlySharedSavedAccountMarkerForCredentialTypes:v8];
}

- (void)_clearFormerlySharedSavedAccountMarkerForCredentialTypes:(int64_t)a3
{
  char v3 = a3;
  if (a3) {
    [(WBSSavedAccount *)self _updatePasswordSidecarsIfNecessaryWithBlock:&__block_literal_global_82_0];
  }
  if ((v3 & 2) != 0)
  {
    [(WBSSavedAccount *)self _updatePasskeySidecarsIfNecessaryWithBlock:&__block_literal_global_82_0];
  }
}

void __76__WBSSavedAccount__clearFormerlySharedSavedAccountMarkerForCredentialTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!a2)
  {
    id v5 = v4;
    [v4 setFormerlySharedSavedAccountMarker:0];
    id v4 = v5;
  }
}

- (BOOL)_containsProtectionSpace:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  siteToProtectionSpaces = self->_siteToProtectionSpaces;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__WBSSavedAccount__containsProtectionSpace___block_invoke;
  v8[3] = &unk_1E615CE98;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [(NSMutableDictionary *)siteToProtectionSpaces enumerateKeysAndObjectsUsingBlock:v8];
  LOBYTE(siteToProtectionSpaces) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)siteToProtectionSpaces;
}

uint64_t __44__WBSSavedAccount__containsProtectionSpace___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 containsObject:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_deleteCredentialForProtectionSpace:(id)a3 fromStorage:(id)a4 forGroupID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v14 = a3;
  uint64_t v10 = [v14 host];
  uint64_t v11 = [v10 length];

  user = self->_user;
  BOOL v13 = [(WBSSavedAccount *)self isRecentlyDeleted];
  if (v11) {
    objc_msgSend(v9, "safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:", user, v14, v8, v13);
  }
  else {
    objc_msgSend(v9, "safari_deleteCredentialWithEmptyServerHostForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:", user, v14, v8, v13);
  }
}

- (id)_movePasswordCredentialToNewSavedAccount
{
  id v3 = [(WBSSavedAccount *)self _copyPasswordCredentialToNewSavedAccount];
  [(WBSSavedAccount *)self _removePasswordCredentialAndSidecars];
  return v3;
}

- (id)_copyPasswordCredentialToNewSavedAccount
{
  id v3 = [[WBSSavedAccount alloc] _initWithHighLevelDomain:self->_highLevelDomain user:self->_user password:self->_password];
  uint64_t v4 = [(NSMutableArray *)self->_sites mutableCopy];
  id v5 = (void *)*((void *)v3 + 2);
  *((void *)v3 + 2) = v4;

  uint64_t v6 = [(NSMutableDictionary *)self->_siteToProtectionSpaces mutableCopy];
  id v7 = (void *)*((void *)v3 + 3);
  *((void *)v3 + 3) = v6;

  uint64_t v8 = [(NSMutableSet *)self->_sitesForWhichSelfIsDefault mutableCopy];
  id v9 = (void *)*((void *)v3 + 4);
  *((void *)v3 + 4) = v8;

  objc_storeStrong((id *)v3 + 5, self->_earliestPasswordCredentialModificationDate);
  objc_storeStrong((id *)v3 + 6, self->_earliestPasswordCredentialCreationDate);
  uint64_t v10 = [(NSMutableDictionary *)self->_sitesToSidecars mutableCopy];
  uint64_t v11 = (void *)*((void *)v3 + 7);
  *((void *)v3 + 7) = v10;

  long long v12 = [(WBSSavedAccount *)self sharedGroupID];
  [v3 setSharedGroupID:v12];

  BOOL v13 = [(WBSSavedAccount *)self sharedGroupName];
  [v3 setSharedGroupName:v13];

  return v3;
}

- (id)_movePasskeyCredentialToNewSavedAccount
{
  id v3 = [(WBSSavedAccount *)self _copyPasskeyCredentialToNewSavedAccount];
  [(WBSSavedAccount *)self _removePasskeyCredentialAndSidecars];
  return v3;
}

- (id)_copyPasskeyCredentialToNewSavedAccount
{
  id v3 = [WBSSavedAccount alloc];
  highLevelDomain = self->_highLevelDomain;
  user = self->_user;
  passkeyRelyingPartyID = self->_passkeyRelyingPartyID;
  passkeyUserHandle = self->_passkeyUserHandle;
  passkeyCredentialID = self->_passkeyCredentialID;
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = [(WBSSavedAccount *)v3 _initWithHighLevelDomain:highLevelDomain passkeyRelyingPartyID:passkeyRelyingPartyID user:user password:0 passkeyUserHandle:passkeyUserHandle passkeyCredentialID:passkeyCredentialID siteToProtectionSpaces:v9 sitesToSidecars:v10 serviceName:0];

  long long v12 = [(WBSSavedAccount *)self sharedGroupID];
  [v11 setSharedGroupID:v12];

  BOOL v13 = [(WBSSavedAccount *)self sharedGroupName];
  [v11 setSharedGroupName:v13];

  uint64_t v14 = [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary mutableCopy];
  id v15 = (void *)v11[8];
  v11[8] = v14;

  return v11;
}

- (void)_deleteCredentialTypes:(int64_t)a3
{
  char v3 = a3;
  int64_t v5 = [(WBSSavedAccount *)self credentialTypes];
  int64_t v6 = v5;
  if (v3) {
    [(WBSSavedAccount *)self _deletePasswordCredentialsRemovingCachedCredentialData:v5 == 3];
  }
  if ((v3 & 2) != 0)
  {
    [(WBSSavedAccount *)self _deletePasskeyCredentialRemovingCachedCredentialData:v6 == 3];
  }
}

- (void)_deletePasswordCredentialsRemovingCachedCredentialData:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(WBSSavedAccount *)self credentialTypes];
  if (v5 != 4)
  {
    if (v5 == 3) {
      [(WBSSavedAccount *)self _deleteTOTPGeneratorIfNecessary];
    }
    if ([(WBSSavedAccount *)self isSavedInPersonalKeychain]) {
      [(WBSSavedAccount *)self _deletePasswordCredentialsInPersonalKeychain];
    }
    if ([(WBSSavedAccount *)self isSavedInSharedGroup]) {
      [(WBSSavedAccount *)self _deletePasswordCredentialsForGroupID:self->_sharedGroupID];
    }
    if (v3)
    {
      [(WBSSavedAccount *)self _removePasswordCredentialAndSidecars];
    }
  }
}

- (void)_removePasswordCredentialAndSidecars
{
  [(NSMutableDictionary *)self->_sitesToSidecars removeAllObjects];
  BOOL v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  siteToProtectionSpaces = self->_siteToProtectionSpaces;
  self->_siteToProtectionSpaces = v3;

  int64_t v5 = [MEMORY[0x1E4F1CA80] set];
  sitesForWhichSelfIsDefault = self->_sitesForWhichSelfIsDefault;
  self->_sitesForWhichSelfIsDefault = v5;

  sites = self->_sites;
  self->_sites = 0;

  earliestPasswordCredentialModificationDate = self->_earliestPasswordCredentialModificationDate;
  self->_earliestPasswordCredentialModificationDate = 0;

  earliestPasswordCredentialCreationDate = self->_earliestPasswordCredentialCreationDate;
  self->_earliestPasswordCredentialCreationDate = 0;

  password = self->_password;
  self->_password = 0;
}

- (void)_deletePasswordCredentialsForSite:(id)a3
{
  id v6 = a3;
  if ([(WBSSavedAccount *)self isSavedInPersonalKeychain]) {
    [(WBSSavedAccount *)self _deletePasswordCredentialsForSite:v6 forGroupID:0];
  }
  if ([(WBSSavedAccount *)self isSavedInSharedGroup]) {
    [(WBSSavedAccount *)self _deletePasswordCredentialsForSite:v6 forGroupID:self->_sharedGroupID];
  }
  [(NSMutableDictionary *)self->_siteToProtectionSpaces removeObjectForKey:v6];
  [(NSMutableDictionary *)self->_sitesToSidecars removeObjectForKey:v6];
  [(NSMutableArray *)self->_sites removeObject:v6];
  int64_t v4 = [(WBSSavedAccount *)self credentialTypes];
  if (![(NSMutableArray *)self->_sites count] && v4 == 3)
  {
    password = self->_password;
    self->_password = 0;
  }
}

- (void)_deletePasswordCredentialsForSite:(id)a3 forGroupID:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = -[NSMutableDictionary objectForKey:](self->_siteToProtectionSpaces, "objectForKey:", v6, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        [(WBSSavedAccount *)self _deleteCredentialForProtectionSpace:v14 fromStorage:v8 forGroupID:v7];
        [(WBSSavedAccount *)self _deleteSidecarForProtectionSpace:v14 fromStorage:v8 forGroupID:v7];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)_deletePasswordCredentialsInPersonalKeychain
{
}

- (void)_deletePasswordCredentialsForGroupID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(WBSSavedAccount *)self protectionSpaces];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        [(WBSSavedAccount *)self _deleteCredentialForProtectionSpace:*(void *)(*((void *)&v18 + 1) + 8 * v10++) fromStorage:v5 forGroupID:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__WBSSavedAccount__deletePasswordCredentialsForGroupID___block_invoke;
  v14[3] = &unk_1E615B978;
  id v15 = v11;
  id v16 = v4;
  long long v17 = self;
  id v12 = v4;
  id v13 = v11;
  [(WBSSavedAccount *)self enumeratePasswordSidecarsWithBlock:v14];
}

void __56__WBSSavedAccount__deletePasswordCredentialsForGroupID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = [v6 user];
  uint64_t v7 = [v6 protectionSpace];

  objc_msgSend(v5, "safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", a2, v8, v7, *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "isRecentlyDeleted"));
}

- (void)_deletePasskeyCredentialRemovingCachedCredentialData:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WBSSavedAccount *)self isSavedInPersonalKeychain]) {
    [(WBSSavedAccount *)self _deletePasskeyCredentialForGroupID:&stru_1F105D3F0];
  }
  if ([(WBSSavedAccount *)self isSavedInSharedGroup]) {
    [(WBSSavedAccount *)self _deletePasskeyCredentialForGroupID:self->_sharedGroupID];
  }
  if (v3)
  {
    [(WBSSavedAccount *)self _removePasskeyCredentialAndSidecars];
  }
}

- (void)_removePasskeyCredentialAndSidecars
{
  passkeyCredentialID = self->_passkeyCredentialID;
  self->_passkeyCredentialID = 0;

  [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary removeAllObjects];
  passkeyUserHandle = self->_passkeyUserHandle;
  self->_passkeyUserHandle = 0;

  passkeyRelyingPartyID = self->_passkeyRelyingPartyID;
  self->_passkeyRelyingPartyID = 0;

  creationDateForPasskey = self->_creationDateForPasskey;
  self->_creationDateForPasskey = 0;

  lastModifiedDateForPasskey = self->_lastModifiedDateForPasskey;
  self->_lastModifiedDateForPasskey = 0;

  lastUsedDateForPasskey = self->_lastUsedDateForPasskey;
  self->_lastUsedDateForPasskey = 0;
}

- (void)_deleteSidecarForPasskeyCredentialForGroupID:(id)a3
{
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary count])
  {
    int64_t v5 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__WBSSavedAccount__deleteSidecarForPasskeyCredentialForGroupID___block_invoke;
    v7[3] = &unk_1E615B978;
    id v8 = v5;
    id v9 = v4;
    uint64_t v10 = self;
    id v6 = v5;
    [(WBSSavedAccount *)self enumeratePasskeySidecarsWithBlock:v7];
  }
}

void __64__WBSSavedAccount__deleteSidecarForPasskeyCredentialForGroupID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = [v6 user];
  uint64_t v7 = [v6 protectionSpace];

  objc_msgSend(v5, "safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", a2, v8, v7, *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "isRecentlyDeleted"));
}

- (void)_deletePasskeyCredentialForGroupID:(id)a3
{
  if (self->_passkeyCredentialID)
  {
    id v4 = (void *)MEMORY[0x1E4F18D90];
    id v6 = a3;
    int64_t v5 = [v4 sharedCredentialStorage];
    objc_msgSend(v5, "safari_deletePasskeyFromSavedAccount:groupID:", self, v6);

    [(WBSSavedAccount *)self _deleteSidecarForPasskeyCredentialForGroupID:v6];
  }
}

- (void)_deleteSidecarForProtectionSpace:(id)a3 fromStorage:(id)a4 forGroupID:(id)a5
{
  user = self->_user;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  objc_msgSend(v10, "safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", 0, user, v11, v9, -[WBSSavedAccount isRecentlyDeleted](self, "isRecentlyDeleted"));
}

- (void)_deleteTOTPGeneratorIfNecessary
{
  BOOL v3 = [(WBSSavedAccount *)self totpGenerators];
  id v4 = [v3 firstObject];

  if (v4) {
    [(WBSSavedAccount *)self setTOTPGenerator:0];
  }
}

- (NSArray)sites
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sites = self->_sites;
  if (!sites)
  {
    int64_t v5 = [(NSMutableDictionary *)self->_siteToProtectionSpaces allKeys];
    id v6 = (NSMutableArray *)[v5 mutableCopy];
    uint64_t v7 = self->_sites;
    self->_sites = v6;

    [(NSMutableArray *)self->_sites sortUsingSelector:sel_localizedCompare_];
    sites = self->_sites;
  }
  id v8 = (void *)[(NSMutableArray *)sites copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v8;
}

- (NSArray)protectionSpaces
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  siteToProtectionSpaces = self->_siteToProtectionSpaces;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__WBSSavedAccount_protectionSpaces__block_invoke;
  v7[3] = &unk_1E615CEC0;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)siteToProtectionSpaces enumerateKeysAndObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

uint64_t __35__WBSSavedAccount_protectionSpaces__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (int64_t)compare:(id)a3
{
  return [(WBSSavedAccount *)self compare:a3 byType:0];
}

- (int64_t)compare:(id)a3 byType:(int64_t)a4
{
  id v6 = (id *)a3;
  if (a4 == 1)
  {
    if ([(WBSSavedAccount *)self hasValidWebsite]) {
      [(WBSSavedAccount *)self userVisibleDomain];
    }
    else {
    uint64_t v7 = [(WBSSavedAccount *)self effectiveTitleForSorting];
    }
    if ([v6 hasValidWebsite])
    {
      uint64_t v8 = [v6 userVisibleDomain];
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v8 = [v6 effectiveTitleForSorting];
LABEL_10:
    id v9 = (void *)v8;
    NSComparisonResult v10 = objc_msgSend(v7, "safari_localizedCompareSortingEmptyStringAndNumericPrefixToEnd:", v8);

    if (v10) {
      goto LABEL_23;
    }
    goto LABEL_11;
  }
  if (!a4)
  {
    uint64_t v7 = [(WBSSavedAccount *)self effectiveTitleForSorting];
    goto LABEL_9;
  }
LABEL_11:
  if (self->_userIsNeverSaveMarker)
  {
    if (!*((unsigned char *)v6 + 104))
    {
LABEL_22:
      NSComparisonResult v10 = NSOrderedAscending;
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v6 + 104))
  {
LABEL_20:
    NSComparisonResult v10 = NSOrderedDescending;
    goto LABEL_23;
  }
  if (!-[NSString length](self->_user, "length") && [v6[15] length]) {
    goto LABEL_20;
  }
  if (![v6[15] length] && -[NSString length](self->_user, "length")) {
    goto LABEL_22;
  }
  NSComparisonResult v10 = [(NSString *)self->_user localizedStandardCompare:v6[15]];
  if (v10 == NSOrderedSame)
  {
    id v11 = [(WBSSavedAccount *)self sites];
    id v12 = [v11 firstObject];
    id v13 = [v6 sites];
    uint64_t v14 = [v13 firstObject];
    NSComparisonResult v10 = [v12 localizedStandardCompare:v14];
  }
LABEL_23:

  return v10;
}

- (BOOL)isDuplicateWithoutUserNameOfSavedAccount:(id)a3
{
  id v4 = a3;
  if ([(WBSSavedAccount *)self isEqual:v4] || [(NSString *)self->_user length])
  {
    BOOL v5 = 0;
  }
  else
  {
    password = self->_password;
    uint64_t v8 = [v4 password];
    if ([(NSString *)password isEqualToString:v8])
    {
      highLevelDomain = self->_highLevelDomain;
      NSComparisonResult v10 = [v4 highLevelDomain];
      BOOL v5 = [(NSString *)highLevelDomain isEqualToString:v10];
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (BOOL)isEqualForSuggestingDuplicatesCleanup:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WBSSavedAccount *)self highLevelDomain];
  id v6 = [v4 highLevelDomain];
  int v7 = WBSIsEqual(v5, v6);

  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v8 = [(WBSSavedAccount *)self user];
  id v9 = [v4 user];
  int v10 = WBSIsEqual(v8, v9);

  if (!v10) {
    goto LABEL_10;
  }
  int64_t v11 = [(WBSSavedAccount *)self credentialTypes];
  if (v11 != [v4 credentialTypes]) {
    goto LABEL_10;
  }
  id v12 = [(WBSSavedAccount *)self password];
  id v13 = [v4 password];
  int v14 = WBSIsEqual(v12, v13);

  if (!v14) {
    goto LABEL_10;
  }
  id v15 = [(WBSSavedAccount *)self passkeyRelyingPartyID];
  id v16 = [v4 passkeyRelyingPartyID];
  int v17 = WBSIsEqual(v15, v16);

  if (!v17) {
    goto LABEL_10;
  }
  long long v18 = [(WBSSavedAccount *)self passkeyCredentialID];
  long long v19 = [v4 passkeyCredentialID];
  int v20 = WBSIsEqual(v18, v19);

  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id v22 = [(WBSSavedAccount *)self totpGenerators];
    uint64_t v23 = (void *)[v21 initWithArray:v22];

    id v24 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v25 = [v4 totpGenerators];
    id v26 = (void *)[v24 initWithArray:v25];

    if (WBSIsEqual(v23, v26)
      && ([(WBSSavedAccount *)self notesEntry],
          id v27 = objc_claimAutoreleasedReturnValue(),
          [v4 notesEntry],
          v28 = objc_claimAutoreleasedReturnValue(),
          int v29 = WBSIsEqual(v27, v28),
          v28,
          v27,
          v29))
    {
      long long v30 = [(WBSSavedAccount *)self customTitle];
      long long v31 = [v4 customTitle];
      char v32 = WBSIsEqual(v30, v31);
    }
    else
    {
      char v32 = 0;
    }
  }
  else
  {
LABEL_10:
    char v32 = 0;
  }

  return v32;
}

- (void)_setUser:(id)a3 password:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (NSString *)a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[WBSSavedAccount _setUser:password:]();
      }
      uint64_t v8 = self->_password;
    }
    uint64_t v10 = [v6 isEqualToString:self->_user];
    if (v10)
    {
      if ([(NSString *)v8 isEqualToString:self->_password]) {
        goto LABEL_40;
      }
    }
    else if (self->_passkeyCredentialID && [(WBSSavedAccount *)self credentialTypes] == 2)
    {
      id v12 = (NSString *)[v6 copy];
      user = self->_user;
      self->_user = v12;

      goto LABEL_40;
    }
    int v14 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    v44 = v8;
    uint64_t v45 = v6;
    id v15 = objc_msgSend(MEMORY[0x1E4F18D88], "safari_credentialWithUser:password:persistence:", v6, v8, 3);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = self->_siteToProtectionSpaces;
    uint64_t v48 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v62;
      id v16 = &stru_1F105D3F0;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v62 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v49 = v17;
          uint64_t v18 = *(void *)(*((void *)&v61 + 1) + 8 * v17);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v19 = [(NSMutableDictionary *)self->_siteToProtectionSpaces objectForKeyedSubscript:v18];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v65 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v58;
            uint64_t v50 = *(void *)v58;
            do
            {
              uint64_t v23 = 0;
              uint64_t v51 = v21;
              do
              {
                if (*(void *)v58 != v22) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v24 = *(void *)(*((void *)&v57 + 1) + 8 * v23);
                if ((v10 & 1) == 0)
                {
                  if ([(WBSSavedAccount *)self isSavedInPersonalKeychain])
                  {
                    v25 = self->_user;
                    BOOL v26 = [(WBSSavedAccount *)self isRecentlyDeleted];
                    id v27 = v25;
                    uint64_t v21 = v51;
                    objc_msgSend(v14, "safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v27, v24, v16, v26);
                  }
                  if ([(WBSSavedAccount *)self isSavedInSharedGroup])
                  {
                    v28 = self->_user;
                    int v29 = v19;
                    uint64_t v30 = v10;
                    long long v31 = v16;
                    char v32 = v15;
                    sharedGroupID = self->_sharedGroupID;
                    BOOL v34 = [(WBSSavedAccount *)self isRecentlyDeleted];
                    uint64_t v35 = v28;
                    v36 = sharedGroupID;
                    id v15 = v32;
                    id v16 = v31;
                    uint64_t v10 = v30;
                    long long v19 = v29;
                    uint64_t v22 = v50;
                    uint64_t v21 = v51;
                    objc_msgSend(v14, "safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v35, v24, v36, v34);
                  }
                }
                if ([(WBSSavedAccount *)self isSavedInPersonalKeychain]) {
                  objc_msgSend(v14, "safari_setCredential:forHTMLFormProtectionSpace:forGroupID:", v15, v24, v16);
                }
                if ([(WBSSavedAccount *)self isSavedInSharedGroup]) {
                  objc_msgSend(v14, "safari_setCredential:forHTMLFormProtectionSpace:forGroupID:", v15, v24, self->_sharedGroupID);
                }
                ++v23;
              }
              while (v21 != v23);
              uint64_t v21 = [v19 countByEnumeratingWithState:&v57 objects:v65 count:16];
            }
            while (v21);
          }

          uint64_t v17 = v49 + 1;
        }
        while (v49 + 1 != v48);
        uint64_t v48 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v48);
    }

    id v6 = v45;
    if ((v10 & 1) == 0)
    {
      sitesToSidecars = self->_sitesToSidecars;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __37__WBSSavedAccount__setUser_password___block_invoke;
      v52[3] = &unk_1E615CF10;
      id v53 = v14;
      id v54 = self;
      id v55 = v45;
      id v56 = v15;
      [(NSMutableDictionary *)sitesToSidecars enumerateKeysAndObjectsUsingBlock:v52];
    }
    uint64_t v8 = v44;
    v38 = (NSString *)[(NSString *)v44 copy];
    password = self->_password;
    self->_password = v38;

    v40 = (NSString *)[v45 copy];
    uint64_t v41 = self->_user;
    self->_user = v40;

    v42 = self->_user;
    uint64_t v43 = +[WBSDontSaveMarker dontSaveMarker];
    self->_userIsNeverSaveMarker = [(NSString *)v42 isEqualToString:v43];
  }
  else
  {
    int64_t v11 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WBSSavedAccount _setUser:password:]();
    }
  }
LABEL_40:
}

void __37__WBSSavedAccount__setUser_password___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__WBSSavedAccount__setUser_password___block_invoke_2;
  v8[3] = &unk_1E615CEE8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  id v12 = *(id *)(a1 + 56);
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void __37__WBSSavedAccount__setUser_password___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v25 = a3;
  uint64_t v5 = [a2 unsignedIntegerValue];
  uint64_t v6 = [v25 protectionSpace];
  int v7 = [*(id *)(a1 + 32) credentialsForProtectionSpace:v6];
  uint64_t v8 = [v7 objectForKeyedSubscript:*(void *)(*(void *)(a1 + 40) + 120)];

  if (v5 == 1)
  {
    long long v19 = *(void **)(a1 + 32);
    uint64_t v20 = [v8 user];
    objc_msgSend(v19, "safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", 1, v20, v6, *(void *)(*(void *)(a1 + 40) + 168), objc_msgSend(*(id *)(a1 + 40), "isRecentlyDeleted"));

    [v25 setUser:*(void *)(a1 + 48)];
    uint64_t v21 = *(void *)(a1 + 56);
    uint64_t v23 = *(void **)(a1 + 32);
    uint64_t v22 = *(void **)(a1 + 40);
    uint64_t v24 = v22[21];
    uint64_t v13 = [v22 isRecentlyDeleted];
    int v14 = v23;
    id v15 = v25;
    uint64_t v16 = v21;
    uint64_t v17 = v6;
    uint64_t v18 = v24;
    goto LABEL_5;
  }
  if (!v5)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v8 user];
    objc_msgSend(v9, "safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", 0, v10, v6, 0, objc_msgSend(*(id *)(a1 + 40), "isRecentlyDeleted"));

    [v25 setUser:*(void *)(a1 + 48)];
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = [*(id *)(a1 + 40) isRecentlyDeleted];
    int v14 = v12;
    id v15 = v25;
    uint64_t v16 = v11;
    uint64_t v17 = v6;
    uint64_t v18 = 0;
LABEL_5:
    objc_msgSend(v14, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v15, v16, v17, v18, v13);
    goto LABEL_7;
  }
  [v25 setUser:*(void *)(a1 + 48)];
LABEL_7:
}

- (void)_adoptSitesFromSavedAccount:(id)a3
{
  if (self != a3)
  {
    v12[9] = v3;
    v12[10] = v4;
    int v7 = (void *)*((void *)a3 + 3);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__WBSSavedAccount__adoptSitesFromSavedAccount___block_invoke;
    v12[3] = &unk_1E615CEC0;
    v12[4] = self;
    uint64_t v8 = a3;
    [v7 enumerateKeysAndObjectsUsingBlock:v12];
    id v9 = (void *)*((void *)a3 + 3);
    *((void *)a3 + 3) = 0;

    uint64_t v10 = (void *)v8[2];
    v8[2] = 0;

    sites = self->_sites;
    self->_sites = 0;
  }
}

void __47__WBSSavedAccount__adoptSitesFromSavedAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v5];
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v7 forKeyedSubscript:v5];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v7, "containsObject:", v13, (void)v14) & 1) == 0) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (NSString)userVisibleDomain
{
  if ([(WBSSavedAccount *)self hasValidWebsite])
  {
    if (self->_shouldShowSpecificSubdomainForUserVisibleDomain) {
      goto LABEL_6;
    }
    if (setOfHighLevelDomainsWhereFullDomainIsPreferableToHighLevelDomainForDisplayToUser_onceToken != -1) {
      dispatch_once(&setOfHighLevelDomainsWhereFullDomainIsPreferableToHighLevelDomainForDisplayToUser_onceToken, &__block_literal_global_512);
    }
    if ([(id)setOfHighLevelDomainsWhereFullDomainIsPreferableToHighLevelDomainForDisplayToUser_set containsObject:self->_highLevelDomain])
    {
LABEL_6:
      uint64_t v3 = [(WBSSavedAccount *)self userVisibleSites];
      if ([v3 count])
      {
        uint64_t v4 = [v3 objectAtIndexedSubscript:0];

        goto LABEL_15;
      }
    }
    if (([(WBSSavedAccount *)self credentialTypes] & 1) != 0
      && [(WBSSavedAccount *)self _allSitesHaveSameNonDefaultPort:0])
    {
      uint64_t v5 = [(WBSSavedAccount *)self _highLevelDomainWithPortIncluded];
    }
    else
    {
      uint64_t v5 = [(NSString *)self->_highLevelDomain _lp_userVisibleHost];
    }
    uint64_t v4 = (__CFString *)v5;
  }
  else
  {
    uint64_t v4 = &stru_1F105D3F0;
  }
LABEL_15:
  return (NSString *)v4;
}

- (NSArray)userVisibleSites
{
  uint64_t v3 = [(WBSSavedAccount *)self sites];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__WBSSavedAccount_userVisibleSites__block_invoke;
  v7[3] = &unk_1E615CF38;
  void v7[4] = self;
  uint64_t v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", v7);
  uint64_t v5 = [v4 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  return (NSArray *)v5;
}

id __35__WBSSavedAccount_userVisibleSites__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:a2];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = objc_msgSend(v3, "safari_userVisibleSiteForProtectionSpace");

  return v4;
}

- (NSString)monogramCharacter
{
  uint64_t v3 = [(WBSSavedAccount *)self customTitle];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(v3, "safari_monogramString");
  }
  else
  {
    id v6 = [(NSString *)self->_highLevelDomain _lp_userVisibleHost];
    uint64_t v5 = objc_msgSend(v6, "safari_monogramString");
  }
  return (NSString *)v5;
}

- (NSArray)additionalSites
{
  id v2 = [(WBSSavedAccount *)self _firstSidecarForAnySiteOfType:[(WBSSavedAccount *)self isSavedInSharedGroup]];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 additionalSites];
    uint64_t v5 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_94_0);
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

uint64_t __34__WBSSavedAccount_additionalSites__block_invoke(uint64_t a1, void *a2)
{
  return [a2 site];
}

- (void)setAdditionalSites:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(WBSSavedAccount *)self _firstSidecarForAnySiteOfType:[(WBSSavedAccount *)self isSavedInSharedGroup]];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v12 = [v5 additionalSites];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __38__WBSSavedAccount_setAdditionalSites___block_invoke;
        v20[3] = &unk_1E615CF80;
        v20[4] = v11;
        uint64_t v13 = objc_msgSend(v12, "safari_firstObjectPassingTest:", v20);

        if (v13)
        {
          [v6 addObject:v13];
        }
        else
        {
          long long v14 = [[WBSSavedAccountAdditionalSite alloc] initWithSite:v11];
          [v6 addObject:v14];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__WBSSavedAccount_setAdditionalSites___block_invoke_2;
  aBlock[3] = &unk_1E615CCF0;
  void aBlock[4] = self;
  id v19 = v6;
  id v15 = v6;
  long long v16 = _Block_copy(aBlock);
  [(WBSSavedAccount *)self _updatePasswordSidecarsIfNecessaryWithBlock:v16];
  [(WBSSavedAccount *)self _updatePasskeySidecarsIfNecessaryWithBlock:v16];
}

uint64_t __38__WBSSavedAccount_setAdditionalSites___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 site];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __38__WBSSavedAccount_setAdditionalSites___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (a2 == 1)
  {
    int v8 = [*(id *)(a1 + 32) isSavedInSharedGroup];
    id v6 = v9;
    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v6 = v5;
  if (!a2)
  {
    char v7 = [*(id *)(a1 + 32) isSavedInSharedGroup];
    id v6 = v9;
    if ((v7 & 1) == 0)
    {
LABEL_6:
      [v6 setAdditionalSites:*(void *)(a1 + 40)];
      id v6 = v9;
    }
  }
LABEL_7:
}

- (NSArray)protectionSpacesForAdditionalSites
{
  id v2 = [(WBSSavedAccount *)self additionalSites];
  uint64_t v3 = objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &__block_literal_global_99);

  return (NSArray *)v3;
}

id __53__WBSSavedAccount_protectionSpacesForAdditionalSites__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = 0;
  id v5 = 0;
  +[WBSSavedAccountStore getProtectionSpaceAndHighLevelDomainForUserTypedSite:a2 protectionSpace:&v5 highLevelDomain:&v4];
  id v2 = v5;

  return v2;
}

- (WBSPasswordWarningHideMarker)hideWarningMarker
{
  id v2 = [(WBSSavedAccount *)self _firstSidecarForAnySiteOfType:0];
  objc_opt_class();
  uint64_t v3 = 0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 hideWarningMarker];
  }

  return (WBSPasswordWarningHideMarker *)v3;
}

- (BOOL)isOneTimeSharable
{
  if ([(WBSSavedAccount *)self userIsNeverSaveMarker]) {
    return 0;
  }
  char v3 = [(WBSSavedAccount *)self credentialTypes];
  id v4 = +[WBSPrimaryAppleAccountObserver sharedObserver];
  int v5 = [v4 isCurrentAppleIDManaged];

  if (v5 && (v3 & 2) != 0) {
    return 0;
  }
  BOOL v7 = [(WBSSavedAccount *)self isCurrentUserOriginalContributor];
  BOOL v8 = v3 & 1;
  if ((v3 & 2) != 0) {
    BOOL v8 = v7;
  }
  return v7 && v8;
}

- (id)_exportPasskeyCredential
{
  if ([(NSString *)self->_passkeyCredentialID length])
  {
    char v3 = +[WBSSavedAccountStore sharedStore];
    id v4 = [v3 exportPasskeyCredentialWithID:self->_passkeyCredentialID];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (NSDate)lastOneTimeShareDateForPasskey
{
  id v2 = [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary objectForKeyedSubscript:&unk_1F10864B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [v2 lastOneTimeShareDateForPasskey];
  }
  else
  {
    char v3 = 0;
  }

  return (NSDate *)v3;
}

- (BOOL)isSavedInPersonalKeychain
{
  return [(NSString *)self->_sharedGroupID length] == 0;
}

- (BOOL)isSavedInSharedGroup
{
  return ![(WBSSavedAccount *)self isSavedInPersonalKeychain];
}

- (BOOL)_allSitesHaveSameNonDefaultPort:(int64_t *)a3
{
  id v4 = [(WBSSavedAccount *)self protectionSpaces];
  if ([v4 count])
  {
    int v5 = [v4 firstObject];
    int64_t v6 = [v5 port];
    char v7 = 0;
    if (v6 && v6 != 80 && v6 != 443)
    {
      if (a3) {
        *a3 = v6;
      }
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __51__WBSSavedAccount__allSitesHaveSameNonDefaultPort___block_invoke;
      v9[3] = &__block_descriptor_40_e30_B16__0__NSURLProtectionSpace_8l;
      v9[4] = v6;
      char v7 = objc_msgSend(v4, "safari_allObjectsPassTest:", v9);
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

BOOL __51__WBSSavedAccount__allSitesHaveSameNonDefaultPort___block_invoke(uint64_t a1, void *a2)
{
  return [a2 port] == *(void *)(a1 + 32);
}

- (id)_highLevelDomainWithPortIncluded
{
  siteToProtectionSpaces = self->_siteToProtectionSpaces;
  id v4 = [(NSMutableArray *)self->_sites firstObject];
  int v5 = [(NSMutableDictionary *)siteToProtectionSpaces objectForKeyedSubscript:v4];
  int64_t v6 = [v5 firstObject];

  id v7 = objc_alloc(MEMORY[0x1E4F18D98]);
  highLevelDomain = self->_highLevelDomain;
  uint64_t v9 = [v6 port];
  uint64_t v10 = [v6 protocol];
  uint64_t v11 = [v6 realm];
  id v12 = [v6 authenticationMethod];
  uint64_t v13 = (void *)[v7 initWithHost:highLevelDomain port:v9 protocol:v10 realm:v11 authenticationMethod:v12];

  long long v14 = objc_msgSend(v13, "safari_userVisibleSiteForProtectionSpace");

  return v14;
}

- (WBSFormerlySharedSavedAccountMarker)formerlySharedPasswordMarker
{
  return (WBSFormerlySharedSavedAccountMarker *)[(WBSSavedAccount *)self _formerlySharedMarkerForCredentialType:1];
}

- (WBSFormerlySharedSavedAccountMarker)formerlySharedPasskeyMarker
{
  return (WBSFormerlySharedSavedAccountMarker *)[(WBSSavedAccount *)self _formerlySharedMarkerForCredentialType:2];
}

- (id)_formerlySharedMarkerForCredentialType:(int64_t)a3
{
  if ([(WBSSavedAccount *)self isSavedInSharedGroup])
  {
LABEL_2:
    int v5 = 0;
  }
  else
  {
    int v5 = 0;
    switch(a3)
    {
      case 1:
        uint64_t v6 = [(WBSSavedAccount *)self _firstSidecarForAnySiteOfType:0];
        goto LABEL_6;
      case 2:
        uint64_t v6 = [(WBSSavedAccount *)self _passkeySidecarOfType:0];
LABEL_6:
        int v5 = (void *)v6;
        if (!v6) {
          goto LABEL_8;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_8;
        }
        id v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[WBSSavedAccount _formerlySharedMarkerForCredentialType:](v12);
        }

        goto LABEL_2;
      case 3:
        uint64_t v11 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[WBSSavedAccount _formerlySharedMarkerForCredentialType:]();
        }
        goto LABEL_2;
      case 4:
        break;
      default:
LABEL_8:
        id v7 = [v5 formerlySharedSavedAccountMarker];
        BOOL v8 = v7;
        if (!v7 || a3 == 4) {
          goto LABEL_22;
        }
        if (a3 == 2)
        {
          uint64_t v9 = [v7 passwordManagerCredentialIdentifier];
          uint64_t v10 = [(WBSSavedAccount *)self passkeyCredentialID];
        }
        else
        {
          if (a3 != 1) {
            goto LABEL_21;
          }
          uint64_t v9 = [v7 passwordManagerCredentialIdentifier];
          uint64_t v10 = [(WBSSavedAccount *)self password];
        }
        uint64_t v13 = (void *)v10;
        int v14 = [v9 isEqual:v10];

        if (v14)
        {
          id v15 = v8;
          goto LABEL_23;
        }
LABEL_21:
        [(WBSSavedAccount *)self _clearFormerlySharedSavedAccountMarkerForCredentialTypes:a3];
LABEL_22:
        id v15 = 0;
LABEL_23:

        int v5 = v15;
        break;
    }
  }
  return v5;
}

+ (void)enumerateRangesMatchingPatternWithTokenizer:(__CFStringTokenizer *)a3 string:(id)a4 pattern:(id)a5 matchingType:(int64_t)a6 withBlock:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (__CFString *)a4;
  id v11 = a5;
  id v12 = (void (**)(id, CFIndex, uint64_t, unsigned char *))a7;
  uint64_t v13 = objc_msgSend(v11, "safari_stringByTrimmingWhitespace");
  if ([v13 length])
  {
    int v14 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
    int v15 = objc_msgSend(v14, "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", 0));

    CFIndex v16 = [(__CFString *)v10 length];
    uint64_t v17 = [v13 length];
    v30.CFIndex location = 0;
    v30.length = v16;
    CFStringTokenizerSetString(a3, v10, v30);
    uint64_t v18 = [(__CFString *)v10 rangeOfString:v13 options:1];
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      CFIndex v19 = v18;
      if ((unint64_t)(a6 - 4) >= 0xFFFFFFFFFFFFFFFDLL) {
        int v15 = 0;
      }
      do
      {
        if (v15
          && (char v20 = CFStringTokenizerGoToTokenAtIndex(a3, v19), CFStringTokenizerGetCurrentTokenRange(a3).location != v19))
        {
          if ((v20 & 2) != 0)
          {
            CFIndex CurrentSubTokens = CFStringTokenizerGetCurrentSubTokens(a3, ranges, 32, 0);
            if (CurrentSubTokens >= 1)
            {
              CFIndex v22 = CurrentSubTokens;
              for (CFIndex i = 0; i < v22; ++i)
              {
                while (1)
                {
                  CFIndex location = ranges[i].location;
                  if (location == v19) {
                    break;
                  }
                  ++i;
                  if (location > v19 || i >= v22) {
                    goto LABEL_9;
                  }
                }
                char v27 = 0;
                v12[2](v12, v19, v17, &v27);
                if (v27) {
                  goto LABEL_3;
                }
              }
            }
          }
        }
        else
        {
          LOBYTE(ranges[0].location) = 0;
          ((void (**)(id, CFIndex, uint64_t, CFRange *))v12)[2](v12, v19, v17, ranges);
          if (LOBYTE(ranges[0].location)) {
            break;
          }
        }
LABEL_9:
        CFIndex v19 = -[__CFString rangeOfString:options:range:](v10, "rangeOfString:options:range:", v13, 1, v19 + v17, v16 - (v19 + v17));
      }
      while (v19 != 0x7FFFFFFFFFFFFFFFLL);
    }
  }
LABEL_3:
}

+ (BOOL)stringMatchesPatternWithTokenizer:(__CFStringTokenizer *)a3 string:(id)a4 pattern:(id)a5 matchingType:(int64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__WBSSavedAccount_stringMatchesPatternWithTokenizer_string_pattern_matchingType___block_invoke;
  v13[3] = &unk_1E615CFE8;
  v13[4] = &v14;
  [a1 enumerateRangesMatchingPatternWithTokenizer:a3 string:v10 pattern:v11 matchingType:a6 withBlock:v13];
  LOBYTE(a6) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return a6;
}

uint64_t __81__WBSSavedAccount_stringMatchesPatternWithTokenizer_string_pattern_matchingType___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)matchesUserTypedSearchPattern:(id)a3 associatedDomains:(id)a4
{
  return [(WBSSavedAccount *)self _matchesSearchPattern:a3 matchAgainstUser:1 associatedDomains:a4];
}

- (BOOL)matchesUserTypedSearchPattern:(id)a3
{
  return [(WBSSavedAccount *)self _matchesSearchPattern:a3 matchAgainstUser:0 associatedDomains:0];
}

- (BOOL)matchesServiceNameHintString:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFLocaleRef v6 = (const __CFLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
  v38.CFIndex location = 0;
  v38.length = 0;
  CFStringTokenizerRef v7 = CFStringTokenizerCreate(v5, 0, v38, 0, v6);
  BOOL v8 = [(WBSSavedAccount *)self highLevelDomain];
  uint64_t v26 = v4;
  [(WBSSavedAccount *)self _quirksForServiceName:v4];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        if ([v8 length])
        {
          int v15 = objc_opt_class();
          uint64_t v16 = [(WBSSavedAccount *)self highLevelDomain];
          int v17 = [v15 stringMatchesPatternWithTokenizer:v7 string:v16 pattern:v14 matchingType:1];

          if (v17)
          {
            CFRelease(v7);
            BOOL v24 = 1;
            uint64_t v18 = v9;
            goto LABEL_23;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v18 = [(WBSSavedAccount *)self customTitle];
  if ([v18 length])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = v9;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      while (2)
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          if ([(id)objc_opt_class() stringMatchesPatternWithTokenizer:v7 string:v18 pattern:*(void *)(*((void *)&v27 + 1) + 8 * j) matchingType:3])
          {
            CFRelease(v7);

            BOOL v24 = 1;
            goto LABEL_23;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
  }
  CFRelease(v7);
  BOOL v24 = 0;
LABEL_23:

  return v24;
}

- (BOOL)matchesDomain:(id)a3 associatedDomains:(id)a4
{
  return [(WBSSavedAccount *)self _matchesSearchPattern:a3 matchAgainstUser:0 associatedDomains:a4];
}

- (BOOL)_matchesSearchPattern:(id)a3 matchAgainstUser:(BOOL)a4 associatedDomains:(id)a5
{
  BOOL v6 = a4;
  v84[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFLocaleRef v11 = (const __CFLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
  v85.CFIndex location = 0;
  v85.length = 0;
  CFStringTokenizerRef v12 = CFStringTokenizerCreate(v10, 0, v85, 0, v11);
  switch([(WBSSavedAccount *)self credentialTypes])
  {
    case 1:
      BOOL v67 = v6;
      uint64_t v13 = [(WBSSavedAccount *)self sites];
      goto LABEL_5;
    case 2:
      BOOL v67 = v6;
      v84[0] = self->_passkeyRelyingPartyID;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:1];
LABEL_5:
      id v14 = (id)v13;
      goto LABEL_7;
    case 3:
      BOOL v67 = v6;
      int v15 = [(WBSSavedAccount *)self sites];
      id v14 = [v15 arrayByAddingObject:self->_passkeyRelyingPartyID];

      goto LABEL_7;
    case 4:
      if ([(id)objc_opt_class() stringMatchesPatternWithTokenizer:v12 string:self->_serviceName pattern:v8 matchingType:4])
      {
        CFRelease(v12);
        BOOL v50 = 1;
        goto LABEL_53;
      }
      id v14 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount privateEmail];
      if (v14
        && [(id)objc_opt_class() stringMatchesPatternWithTokenizer:v12 string:v14 pattern:v8 matchingType:0])
      {
        CFRelease(v12);
        BOOL v50 = 1;
        goto LABEL_52;
      }
      long long v58 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount shareInfo];
      uint64_t v16 = [v58 participantName];

      BOOL v50 = v16
         && ([(id)objc_opt_class() stringMatchesPatternWithTokenizer:v12 string:v16 pattern:v8 matchingType:0] & 1) != 0;
      CFRelease(v12);
      goto LABEL_51;
    default:
      BOOL v67 = v6;
      id v14 = 0;
LABEL_7:
      uint64_t v16 = objc_msgSend(v8, "safari_stringByTrimmingWhitespace");
      int v17 = [(WBSSavedAccount *)self customTitle];

      id v68 = v8;
      if (!v17) {
        goto LABEL_18;
      }
      id v18 = v9;
      id v19 = [(WBSSavedAccount *)self customTitle];
      uint64_t v20 = [(WBSSavedAccount *)self _quirksForServiceName:v19];

      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v77 objects:v83 count:16];
      if (!v22) {
        goto LABEL_17;
      }
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v78;
      break;
  }
  while (2)
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v78 != v24) {
        objc_enumerationMutation(v21);
      }
      uint64_t v26 = *(void *)(*((void *)&v77 + 1) + 8 * i);
      if (v26
        && [(id)objc_opt_class() stringMatchesPatternWithTokenizer:v12 string:v26 pattern:v16 matchingType:3])
      {
        goto LABEL_45;
      }
    }
    uint64_t v23 = [v21 countByEnumeratingWithState:&v77 objects:v83 count:16];
    if (v23) {
      continue;
    }
    break;
  }
LABEL_17:

  id v9 = v18;
  id v8 = v68;
LABEL_18:
  long long v27 = [(WBSSavedAccount *)self serviceName];

  if (v27)
  {
    id v18 = v9;
    long long v28 = [(WBSSavedAccount *)self serviceName];
    long long v29 = [(WBSSavedAccount *)self _quirksForServiceName:v28];

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v21 = v29;
    uint64_t v30 = [v21 countByEnumeratingWithState:&v73 objects:v82 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v74;
LABEL_21:
      uint64_t v33 = 0;
      while (1)
      {
        if (*(void *)v74 != v32) {
          objc_enumerationMutation(v21);
        }
        uint64_t v34 = *(void *)(*((void *)&v73 + 1) + 8 * v33);
        if (v34)
        {
          if ([(id)objc_opt_class() stringMatchesPatternWithTokenizer:v12 string:v34 pattern:v16 matchingType:4])break; {
        }
          }
        if (v31 == ++v33)
        {
          uint64_t v31 = [v21 countByEnumeratingWithState:&v73 objects:v82 count:16];
          if (v31) {
            goto LABEL_21;
          }
          goto LABEL_28;
        }
      }
LABEL_45:
      CFRelease(v12);

      BOOL v50 = 1;
      id v9 = v18;
      goto LABEL_46;
    }
LABEL_28:

    id v9 = v18;
    id v8 = v68;
  }
  if ([v9 count])
  {
    uint64_t v35 = [v9 allObjects];
    uint64_t v36 = [v14 arrayByAddingObjectsFromArray:v35];

    id v14 = (id)v36;
  }
  uint64_t v37 = [(WBSSavedAccount *)self additionalSites];
  uint64_t v38 = [v37 count];

  if (v38)
  {
    uint64_t v39 = [(WBSSavedAccount *)self additionalSites];
    uint64_t v40 = [v14 arrayByAddingObjectsFromArray:v39];

    id v14 = (id)v40;
  }
  id v21 = [(id)objc_opt_class() searchPatternForWebsiteComparisonFromSearchPattern:v8];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v14 = v14;
  uint64_t v41 = [v14 countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v70;
    id v66 = v9;
    while (2)
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v70 != v43) {
          objc_enumerationMutation(v14);
        }
        uint64_t v45 = *(void **)(*((void *)&v69 + 1) + 8 * j);
        if (([(id)objc_opt_class() stringMatchesPatternWithTokenizer:v12 string:v45 pattern:v21 matchingType:1] & 1) == 0)
        {
          uint64_t v46 = objc_opt_class();
          uint64_t v47 = objc_msgSend(v45, "_lp_userVisibleHost");
          LOBYTE(v46) = [(id)v46 stringMatchesPatternWithTokenizer:v12 string:v47 pattern:v21 matchingType:1];

          if ((v46 & 1) == 0) {
            continue;
          }
        }
        CFRelease(v12);

        BOOL v50 = 1;
        id v8 = v68;
        id v9 = v66;
        goto LABEL_50;
      }
      uint64_t v42 = [v14 countByEnumeratingWithState:&v69 objects:v81 count:16];
      id v9 = v66;
      if (v42) {
        continue;
      }
      break;
    }
  }

  if (!v67
    || (uint64_t v48 = objc_opt_class(),
        [(WBSSavedAccount *)self user],
        uint64_t v49 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v48) = [v48 stringMatchesPatternWithTokenizer:v12 string:v49 pattern:v68 matchingType:0], v49, !v48))
  {
    uint64_t v52 = [(WBSSavedAccount *)self originalContributorParticipantID];
    if (v52)
    {
      id v53 = (void *)v52;
      BOOL v54 = [(WBSSavedAccount *)self isCurrentUserOriginalContributor];

      if (!v54)
      {
        id v55 = [(WBSSavedAccount *)self originalContributorParticipantID];
        id v56 = [(WBSSavedAccount *)self sharedGroupID];
        long long v57 = +[WBSSavedAccountStore _displayNameForOriginalContributorParticipantID:v55 inGroupID:v56];

        if ([(id)objc_opt_class() stringMatchesPatternWithTokenizer:v12 string:v57 pattern:v68 matchingType:0])
        {
          CFRelease(v12);

          goto LABEL_70;
        }
      }
    }
    long long v59 = [(WBSSavedAccount *)self notesEntry];
    uint64_t v60 = [v59 length];

    if (v60)
    {
      long long v61 = [(WBSSavedAccount *)self notesEntry];
      long long v62 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      long long v63 = [v61 componentsSeparatedByCharactersInSet:v62];
      long long v64 = (void *)[v63 mutableCopy];

      [v64 removeObject:&stru_1F105D3F0];
      v65 = [v64 componentsJoinedByString:@" "];
      if ([(id)objc_opt_class() stringMatchesPatternWithTokenizer:v12 string:v65 pattern:v16 matchingType:2])
      {
        CFRelease(v12);

        goto LABEL_70;
      }
    }
    CFRelease(v12);
    BOOL v50 = 0;
    goto LABEL_46;
  }
  CFRelease(v12);
LABEL_70:
  BOOL v50 = 1;
LABEL_46:
  id v8 = v68;
LABEL_50:

LABEL_51:
LABEL_52:

LABEL_53:
  return v50;
}

+ (id)searchPatternForWebsiteComparisonFromSearchPattern:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  CFAllocatorRef v5 = [v3 whitespaceCharacterSet];
  BOOL v6 = objc_msgSend(v4, "safari_stringByRemovingCharactersInSet:", v5);

  CFStringTokenizerRef v7 = [v6 stringByReplacingOccurrencesOfString:@"+" withString:@"plus"];

  return v7;
}

- (id)_quirksForServiceName:(id)a3
{
  id v3 = a3;
  if (_quirksForServiceName__onceToken != -1) {
    dispatch_once(&_quirksForServiceName__onceToken, &__block_literal_global_118);
  }
  id v4 = (void *)_quirksForServiceName__quirksMap;
  CFAllocatorRef v5 = [v3 lowercaseString];
  BOOL v6 = [v4 objectForKeyedSubscript:v5];

  CFStringTokenizerRef v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = v7;
  if (v6) {
    [v7 addObjectsFromArray:v6];
  }
  else {
    [v7 addObject:v3];
  }

  return v8;
}

void __41__WBSSavedAccount__quirksForServiceName___block_invoke()
{
  v0 = (void *)_quirksForServiceName__quirksMap;
  _quirksForServiceName__quirksMap = (uint64_t)&unk_1F1086680;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSSavedAccount *)a3;
  if (self == v4)
  {
    char v23 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFAllocatorRef v5 = v4;
      user = self->_user;
      CFStringTokenizerRef v7 = [v5 user];
      if (WBSIsEqual(user, v7))
      {
        password = self->_password;
        id v9 = [v5 password];
        if (WBSIsEqual(password, v9))
        {
          passkeyCredentialID = self->_passkeyCredentialID;
          CFLocaleRef v11 = [v5 passkeyCredentialID];
          if (WBSIsEqual(passkeyCredentialID, v11)
            && WBSIsEqual(self->_passkeyCredentialSidecarsDictionary, v5[8]))
          {
            passkeyRelyingPartyID = self->_passkeyRelyingPartyID;
            uint64_t v13 = [v5 passkeyRelyingPartyID];
            if (WBSIsEqual(passkeyRelyingPartyID, v13))
            {
              sharedGroupID = self->_sharedGroupID;
              int v15 = [v5 sharedGroupID];
              if (WBSIsEqual(sharedGroupID, v15))
              {
                serviceName = self->_serviceName;
                int v17 = [v5 serviceName];
                if (WBSIsEqual(serviceName, v17))
                {
                  id v18 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount clientID];
                  uint64_t v41 = [v5 signInWithAppleAccount];
                  uint64_t v42 = [v41 clientID];
                  uint64_t v43 = v18;
                  if (WBSIsEqual(v18, v42))
                  {
                    id v19 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount userID];
                    uint64_t v39 = [v5 signInWithAppleAccount];
                    uint64_t v38 = [v39 userID];
                    uint64_t v40 = v19;
                    if (WBSIsEqual(v19, v38))
                    {
                      uint64_t v37 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount shareInfo];
                      uint64_t v20 = [v37 groupID];
                      uint64_t v35 = [v5 signInWithAppleAccount];
                      uint64_t v34 = [v35 shareInfo];
                      [v34 groupID];
                      uint64_t v33 = v36 = v20;
                      if (WBSIsEqual(v20, v33))
                      {
                        highLevelDomain = self->_highLevelDomain;
                        uint64_t v32 = [v5 highLevelDomain];
                        if (WBSIsEqual(highLevelDomain, v32))
                        {
                          id v21 = [(WBSSavedAccount *)self protectionSpaces];
                          long long v29 = [v5 protectionSpaces];
                          uint64_t v31 = v21;
                          if (WBSIsEqual(v21, v29)
                            && WBSIsEqual(self->_sitesToSidecars, v5[7]))
                          {
                            uint64_t v22 = [(WBSSavedAccount *)self sites];
                            long long v28 = [v5 sites];
                            if (WBSIsEqual(v22, v28))
                            {
                              long long v27 = [(WBSSavedAccount *)self lastModifiedDate];
                              uint64_t v26 = [v5 lastModifiedDate];
                              char v23 = WBSIsEqual(v27, v26);
                            }
                            else
                            {
                              char v23 = 0;
                            }
                          }
                          else
                          {
                            char v23 = 0;
                          }
                          uint64_t v24 = v41;
                        }
                        else
                        {
                          char v23 = 0;
                          uint64_t v24 = v41;
                        }
                      }
                      else
                      {
                        char v23 = 0;
                        uint64_t v24 = v41;
                      }
                    }
                    else
                    {
                      char v23 = 0;
                      uint64_t v24 = v41;
                    }
                  }
                  else
                  {
                    char v23 = 0;
                    uint64_t v24 = v41;
                  }
                }
                else
                {
                  char v23 = 0;
                }
              }
              else
              {
                char v23 = 0;
              }
            }
            else
            {
              char v23 = 0;
            }
          }
          else
          {
            char v23 = 0;
          }
        }
        else
        {
          char v23 = 0;
        }
      }
      else
      {
        char v23 = 0;
      }
    }
    else
    {
      char v23 = 0;
    }
  }

  return v23;
}

- (BOOL)isEqualForMovingSharedSavedAccountsBackToPersonalKeychainOnGroupExit:(id)a3
{
  id v4 = (void **)a3;
  user = self->_user;
  BOOL v6 = [v4 user];
  if ([(NSString *)user isEqualToString:v6])
  {
    password = self->_password;
    id v8 = [v4 password];
    if (WBSIsEqual(password, v8))
    {
      passkeyCredentialID = self->_passkeyCredentialID;
      CFAllocatorRef v10 = [v4 passkeyCredentialID];
      if (WBSIsEqual(passkeyCredentialID, v10)
        && WBSIsEqual(self->_passkeyCredentialSidecarsDictionary, v4[8]))
      {
        passkeyRelyingPartyID = self->_passkeyRelyingPartyID;
        CFStringTokenizerRef v12 = [v4 passkeyRelyingPartyID];
        if (WBSIsEqual(passkeyRelyingPartyID, v12))
        {
          highLevelDomain = self->_highLevelDomain;
          id v14 = [v4 highLevelDomain];
          if ([(NSString *)highLevelDomain isEqualToString:v14])
          {
            int v15 = [(WBSSavedAccount *)self protectionSpaces];
            uint64_t v16 = [v4 protectionSpaces];
            if (WBSIsEqual(v15, v16))
            {
              int v17 = [(WBSSavedAccount *)self notesEntry];
              uint64_t v30 = [v4 notesEntry];
              uint64_t v31 = v17;
              if (WBSIsEqual(v17, v30))
              {
                id v18 = [(WBSSavedAccount *)self customTitle];
                long long v28 = [v4 customTitle];
                long long v29 = v18;
                if (WBSIsEqual(v18, v28))
                {
                  uint64_t v19 = [(WBSSavedAccount *)self totpGenerators];
                  uint64_t v20 = [v4 totpGenerators];
                  long long v27 = (void *)v19;
                  id v21 = (void *)v19;
                  uint64_t v22 = v20;
                  if (WBSIsEqual(v21, v20))
                  {
                    uint64_t v26 = [(WBSSavedAccount *)self sites];
                    id v25 = [v4 sites];
                    char v23 = WBSIsEqual(v26, v25);
                  }
                  else
                  {
                    char v23 = 0;
                  }
                }
                else
                {
                  char v23 = 0;
                }
              }
              else
              {
                char v23 = 0;
              }
            }
            else
            {
              char v23 = 0;
            }
          }
          else
          {
            char v23 = 0;
          }
        }
        else
        {
          char v23 = 0;
        }
      }
      else
      {
        char v23 = 0;
      }
    }
    else
    {
      char v23 = 0;
    }
  }
  else
  {
    char v23 = 0;
  }

  return v23;
}

- (BOOL)shouldOverrideRecentlyDeletedSavedAccountWhenDeleted:(id)a3
{
  id v4 = (WBSSavedAccount *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_5;
    }
    CFAllocatorRef v5 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v6 = [(NSMutableDictionary *)self->_siteToProtectionSpaces allValues];
    CFStringTokenizerRef v7 = [v5 setWithArray:v6];
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    id v9 = [(NSMutableDictionary *)v4->_siteToProtectionSpaces allValues];
    CFAllocatorRef v10 = [v8 setWithArray:v9];
    int v11 = [v7 intersectsSet:v10];

    if (![(NSString *)self->_user isEqualToString:v4->_user]) {
      goto LABEL_5;
    }
    if (self->_isRecentlyDeleted != v4->_isRecentlyDeleted) {
      int v12 = WBSIsEqual(self->_sharedGroupID, v4->_sharedGroupID) & v11;
    }
    else {
LABEL_5:
    }
      LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_user hash];
  NSUInteger v4 = [(NSString *)self->_password hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_passkeyCredentialID hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableDictionary *)self->_passkeyCredentialSidecarsDictionary hash];
  NSUInteger v7 = [(NSString *)self->_passkeyRelyingPartyID hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_highLevelDomain hash];
  id v9 = [(WBSSavedAccount *)self protectionSpaces];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  int v11 = [(WBSSavedAccount *)self sites];
  uint64_t v12 = [v11 hash];
  uint64_t v13 = v12 ^ [(NSMutableDictionary *)self->_sitesToSidecars hash];
  id v14 = [(WBSSavedAccount *)self lastModifiedDate];
  uint64_t v15 = v13 ^ [v14 hash];

  return v10 ^ v15 ^ [(NSString *)self->_sharedGroupID hash];
}

- (BOOL)hasProtectionSpace:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(WBSSavedAccount *)self protectionSpaces];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__WBSSavedAccount_hasProtectionSpace___block_invoke;
  v9[3] = &unk_1E615D010;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "safari_containsObjectPassingTest:", v9);

  return v7;
}

uint64_t __38__WBSSavedAccount_hasProtectionSpace___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToProtectionSpaceForPasswordManager:*(void *)(a1 + 32)];
}

- (BOOL)hasProtectionSpaceWithHighLevelDomainMatchingProtectionSpace:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = objc_msgSend(v4, "safari_protectionSpaceByReplacingHostWithHighlevelDomain");
  id v6 = [(WBSSavedAccount *)self protectionSpaces];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__WBSSavedAccount_hasProtectionSpaceWithHighLevelDomainMatchingProtectionSpace___block_invoke;
  v11[3] = &unk_1E615D038;
  id v12 = v4;
  id v13 = v5;
  id v7 = v5;
  id v8 = v4;
  char v9 = objc_msgSend(v6, "safari_containsObjectPassingTest:", v11);

  return v9;
}

uint64_t __80__WBSSavedAccount_hasProtectionSpaceWithHighLevelDomainMatchingProtectionSpace___block_invoke(uint64_t a1, void *a2)
{
  NSUInteger v3 = objc_msgSend(a2, "safari_protectionSpaceByReplacingHostWithHighlevelDomain");
  if ([v3 isEqualToProtectionSpaceForPasswordManager:*(void *)(a1 + 32)]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v3 isEqualToProtectionSpaceForPasswordManager:*(void *)(a1 + 40)];
  }

  return v4;
}

- (NSURL)wellKnownChangePasswordURL
{
  uint64_t v7 = 0;
  if ([(WBSSavedAccount *)self _allSitesHaveSameNonDefaultPort:&v7])
  {
    NSUInteger v3 = [NSString stringWithFormat:@"%@:%ld", self->_highLevelDomain, v7];
    uint64_t v4 = objc_msgSend(v3, "safari_bestURLForUserTypedString");
    NSUInteger v5 = objc_msgSend(v4, "safari_wellKnownChangePasswordURL");
  }
  else
  {
    NSUInteger v3 = [(NSString *)self->_highLevelDomain safari_bestURLForUserTypedString];
    NSUInteger v5 = objc_msgSend(v3, "safari_wellKnownChangePasswordURL");
  }

  return (NSURL *)v5;
}

- (NSString)sharedGroupName
{
  NSUInteger v3 = +[WBSOngoingSharingGroupProvider sharedProvider];
  uint64_t v4 = [v3 cachedGroupWithID:self->_sharedGroupID];
  NSUInteger v5 = [v4 displayName];

  return (NSString *)v5;
}

- (AKSignInWithAppleAccount)signInWithAppleAccount
{
  return self->_signInWithAppleAccount;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (BOOL)_computeHasValidWebsite
{
  BOOL result = [(WBSSavedAccount *)self credentialTypes] != 4
        && (NSUInteger v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:self->_highLevelDomain],
            v3,
            !v3)
        && [(NSString *)self->_highLevelDomain length] != 0;
  return result;
}

- (BOOL)hasValidWebsite
{
  int64_t hasValidWebsite = self->_hasValidWebsite;
  if (!hasValidWebsite)
  {
    BOOL v4 = [(WBSSavedAccount *)self _computeHasValidWebsite];
    int64_t hasValidWebsite = 1;
    if (v4) {
      int64_t hasValidWebsite = 2;
    }
    self->_int64_t hasValidWebsite = hasValidWebsite;
  }
  return hasValidWebsite == 2;
}

- (NSString)highLevelDomain
{
  return self->_highLevelDomain;
}

- (NSString)user
{
  return self->_user;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)passkeyRelyingPartyID
{
  return self->_passkeyRelyingPartyID;
}

- (void)setPasskeyRelyingPartyID:(id)a3
{
}

- (NSString)passkeyUserHandle
{
  return self->_passkeyUserHandle;
}

- (void)setPasskeyUserHandle:(id)a3
{
}

- (NSString)passkeyCredentialID
{
  return self->_passkeyCredentialID;
}

- (void)setPasskeyCredentialID:(id)a3
{
}

- (void)setCustomTitle:(id)a3
{
}

- (BOOL)userIsNeverSaveMarker
{
  return self->_userIsNeverSaveMarker;
}

- (NSDate)lastUsedDateForPasskey
{
  return self->_lastUsedDateForPasskey;
}

- (void)setLastUsedDateForPasskey:(id)a3
{
}

- (NSString)sharedGroupID
{
  return self->_sharedGroupID;
}

- (void)setSharedGroupID:(id)a3
{
}

- (void)setSharedGroupName:(id)a3
{
}

- (BOOL)hasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts
{
  return self->_hasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts;
}

- (void)setHasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts:(BOOL)a3
{
  self->_hasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts = a3;
}

- (BOOL)isRecentlyDeleted
{
  return self->_isRecentlyDeleted;
}

- (void)setIsRecentlyDeleted:(BOOL)a3
{
  self->_isRecentlyDeleted = a3;
}

- (void)setSignInWithAppleAccount:(id)a3
{
}

- (void)setServiceName:(id)a3
{
}

- (NSArray)persistentIdentifiersForWarningManager
{
  return self->_persistentIdentifiersForWarningManager;
}

- (void)setPersistentIdentifiersForWarningManager:(id)a3
{
}

- (NSDate)creationDateForPasskey
{
  return self->_creationDateForPasskey;
}

- (void)setCreationDateForPasskey:(id)a3
{
}

- (NSDate)lastModifiedDateForPasskey
{
  return self->_lastModifiedDateForPasskey;
}

- (void)setLastModifiedDateForPasskey:(id)a3
{
}

- (NSDictionary)passkeyCredentialSidecarsDictionary
{
  return &self->_passkeyCredentialSidecarsDictionary->super;
}

- (void)setPasskeyCredentialSidecarsDictionary:(id)a3
{
}

- (BOOL)shouldShowSpecificSubdomainForUserVisibleDomain
{
  return self->_shouldShowSpecificSubdomainForUserVisibleDomain;
}

- (void)setShouldShowSpecificSubdomainForUserVisibleDomain:(BOOL)a3
{
  self->_shouldShowSpecificSubdomainForUserVisibleDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDateForPasskey, 0);
  objc_storeStrong((id *)&self->_creationDateForPasskey, 0);
  objc_storeStrong((id *)&self->_persistentIdentifiersForWarningManager, 0);
  objc_storeStrong((id *)&self->_sharedGroupName, 0);
  objc_storeStrong((id *)&self->_sharedGroupID, 0);
  objc_storeStrong((id *)&self->_lastUsedDateForPasskey, 0);
  objc_storeStrong((id *)&self->_passkeyCredentialID, 0);
  objc_storeStrong((id *)&self->_passkeyUserHandle, 0);
  objc_storeStrong((id *)&self->_passkeyRelyingPartyID, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_highLevelDomain, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_signInWithAppleAccount, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_passkeyCredentialSidecarsDictionary, 0);
  objc_storeStrong((id *)&self->_sitesToSidecars, 0);
  objc_storeStrong((id *)&self->_earliestPasswordCredentialCreationDate, 0);
  objc_storeStrong((id *)&self->_earliestPasswordCredentialModificationDate, 0);
  objc_storeStrong((id *)&self->_sitesForWhichSelfIsDefault, 0);
  objc_storeStrong((id *)&self->_siteToProtectionSpaces, 0);
  objc_storeStrong((id *)&self->_sites, 0);
}

- (void)isCurrentUserOriginalContributor
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Saved account does not have an original contributor ID, considering the original contributor as unknown.", v2, v3, v4, v5, v6);
}

- (void)markOriginalContributorParticipantID
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Could not set original contributor participant ID for saved account because current user participant ID is nil.", v2, v3, v4, v5, v6);
}

- (void)_canMergeWithSavedAccount:requiresDataCopying:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Tried to merge invalid credential types.", v2, v3, v4, v5, v6);
}

- (void)_addPasskeySidecar:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v4, v5, "Attempted to add a non-Sidecar object to the passkey Sidecar map. type:%{public}@", v6, v7, v8, v9, 2u);
}

- (void)_addSidecar:(uint64_t)a1 forSite:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1B728F000, v3, OS_LOG_TYPE_ERROR, "Attempted to add a non-Sidecar object to the Sidecar map for site %@ type:%{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_setUser:password:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "User not found", v2, v3, v4, v5, v6);
}

- (void)_setUser:password:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Refusing to set saved account password to nil; using current password instead",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_formerlySharedMarkerForCredentialType:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v2, v3, "Expected personal sidecar to check formerly shared marker but received sidecar of type %@", v4, v5, v6, v7, 2u);
}

- (void)_formerlySharedMarkerForCredentialType:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Incorrectly passed WBSSavedAccountCredentialTypePasswordAndPasskey into method to retrieve formerly shared marker for a single credential type.", v2, v3, v4, v5, v6);
}

@end