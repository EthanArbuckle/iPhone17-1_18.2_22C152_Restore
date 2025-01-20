@interface MailAccount
+ (BOOL)canMoveMessagesFromAccount:(id)a3 toAccount:(id)a4;
+ (BOOL)canMoveMessagesFromAccount:(id)a3 toAccount:(id)a4 profileConnection:(id)a5;
+ (BOOL)getConfigurationFromServerForEmail:(id)a3;
+ (BOOL)isPredefinedAccountType;
+ (BOOL)mailboxListingNotificationsAreEnabled;
+ (BOOL)primaryDeliveryAccountIsDynamic;
+ (BOOL)usernameIsEmailAddress;
+ (MailAccount)accountWithPath:(id)a3;
+ (MailAccount)accountWithURL:(id)a3;
+ (MailAccount)accountWithURLString:(id)a3;
+ (MailAccount)accountWithUniqueId:(id)a3;
+ (NSString)csAccountTypeString;
+ (OS_os_log)log;
+ (id)URLForInfo:(id)a3;
+ (id)_accountContainingEmailAddress:(id)a3 matchingAddress:(id *)a4 fullUserName:(id *)a5 includingInactive:(BOOL)a6;
+ (id)_accountWithPath:(id)a3;
+ (id)_defaultMailAccountForDeliveryIncludingRestricted:(BOOL)a3;
+ (id)_loadAllAccountsWithError:(id *)a3;
+ (id)_loadDataAccessAccountsWithError:(id *)a3;
+ (id)accountContainingEmailAddress:(id)a3;
+ (id)accountContainingEmailAddress:(id)a3 includingInactive:(BOOL)a4;
+ (id)accountForHeaders:(id)a3 message:(id)a4 includingInactive:(BOOL)a5;
+ (id)accountIDFromMailboxURLString:(id)a3 urlScheme:(id)a4;
+ (id)accountThatMessageIsFrom:(id)a3;
+ (id)accountThatMessageIsFrom:(id)a3 includingInactive:(BOOL)a4;
+ (id)activeAccountEmailAddresses;
+ (id)activeAccounts;
+ (id)activeAccountsWithError:(id *)a3;
+ (id)activeNonLocalAccounts;
+ (id)addressesThatReceivedMessage:(id)a3;
+ (id)allActivePrimaryMailboxUids;
+ (id)allMailboxUids;
+ (id)allMailboxUidsForAccounts:(id)a3;
+ (id)allPurgeableMailboxUids;
+ (id)defaultAccountDirectory;
+ (id)defaultDeliveryAccount;
+ (id)defaultMailAccountForDelivery;
+ (id)defaultMailAccountForDeliveryExcludingRestricted;
+ (id)existingAccountForUniqueID:(id)a3;
+ (id)existingAccountWithType:(id)a3 hostname:(id)a4 username:(id)a5;
+ (id)existingDAMailAccountForDAAccount:(id)a3;
+ (id)infoForURL:(id)a3;
+ (id)lastMailAccountsReloadDate;
+ (id)legacyPathForAccountIdentifier:(id)a3 withHostname:(id)a4 username:(id)a5;
+ (id)legacyPathNameForAccountWithHostname:(id)a3 username:(id)a4;
+ (id)mailAccounts;
+ (id)mailAccountsWithError:(id *)a3;
+ (id)mailboxUidForFileSystemPath:(id)a3 create:(BOOL)a4;
+ (id)mailboxUidFromActiveAccountsForURL:(id)a3;
+ (id)newAccountWithDictionary:(id)a3;
+ (id)newAccountWithPath:(id)a3;
+ (id)outboxMailboxUid;
+ (id)outboxMessageStore:(BOOL)a3;
+ (id)predefinedValueForKey:(id)a3;
+ (id)purgeableAccounts;
+ (id)standardAccountClass:(Class)a3 valueForKey:(id)a4;
+ (void)_addAccountToSortedPaths:(id)a3;
+ (void)_postMailboxListNotificationAfterBlock:(id)a3;
+ (void)_removeAccountFromSortedPaths:(id)a3;
+ (void)_removeLookAsideValuesNotInAccountList:(id)a3;
+ (void)_setMailAccounts:(id)a3 saveIfChanged:(BOOL)a4 alreadyLocked:(BOOL)a5;
+ (void)_setOutboxMailboxUid:(id)a3;
+ (void)_setupSortedPathsForAccounts:(id)a3;
+ (void)disableMailboxListingNotifications;
+ (void)enableMailboxListingNotifications:(BOOL)a3;
+ (void)initialize;
+ (void)lockMailAccount;
+ (void)notifyOfAccountsAdded:(id)a3 accountsRemoved:(id)a4 changedAccounts:(id)a5;
+ (void)performOnAccounts:(id)a3 accountBlock:(id)a4;
+ (void)reloadAccounts;
+ (void)resetMailboxTimers;
+ (void)saveStateForAllAccounts;
+ (void)setMailAccounts:(id)a3;
+ (void)setMailAccounts:(id)a3 saveIfChanged:(BOOL)a4;
+ (void)test_tearDown;
+ (void)unlockMailAccount;
+ (void)updateEmailAliasesForActiveAccounts;
+ (void)updatePersonalStatusForAccounts:(id)a3 forceUpdate:(BOOL)a4;
- (BOOL)_assignSpecialMailboxToAppropriateIvar:(id)a3 forType:(int64_t)a4;
- (BOOL)_canEmptyMessagesFromMailboxUid:(id)a3;
- (BOOL)_cleanInboxDuplication:(id)a3;
- (BOOL)_deleteMailbox:(id)a3 reflectToServer:(BOOL)a4;
- (BOOL)_loadMailboxListingIntoCache:(id)a3 attributes:(unsigned int)a4 children:(id)a5 parent:(id)a6;
- (BOOL)_readCustomInfoFromMailboxCache:(id)a3;
- (BOOL)_registerPushNotificationPrefix:(id)a3 forMailboxNames:(id)a4;
- (BOOL)_renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5;
- (BOOL)_repairMailboxCache;
- (BOOL)_resetSpecialMailboxesCanPost:(BOOL)a3;
- (BOOL)_setChildren:(id)a3 forMailboxUid:(id)a4;
- (BOOL)_setPath:(id)a3;
- (BOOL)_shouldLogDeleteActivity;
- (BOOL)_writeCustomInfoToMailboxCache:(id)a3;
- (BOOL)cacheHasBeenRead;
- (BOOL)canArchiveForMailbox:(id)a3;
- (BOOL)canArchiveSentMessages;
- (BOOL)canAuthenticateWithCurrentCredentials;
- (BOOL)canCreateNewMailboxes;
- (BOOL)canFetch;
- (BOOL)canMailboxBeDeleted:(id)a3;
- (BOOL)canMailboxBeRenamed:(id)a3;
- (BOOL)canReceiveNewMailNotifications;
- (BOOL)canUseCarrierDeliveryFallback;
- (BOOL)canUseDeliveryAccount:(id)a3;
- (BOOL)checkAndSetDefaultEmailAddress:(id)a3;
- (BOOL)checkAndSetEmailAddresses:(id)a3;
- (BOOL)checkAndSetReceiveEmailAliasAddresses:(id)a3;
- (BOOL)containsMailboxWithURL:(id)a3;
- (BOOL)deleteInPlaceForAllMailboxes;
- (BOOL)deleteInPlaceForMailbox:(id)a3;
- (BOOL)deleteMailbox:(id)a3;
- (BOOL)deleteMailbox:(id)a3 reflectToServer:(BOOL)a4;
- (BOOL)deliveryAccountInUseByOtherAccounts:(id)a3;
- (BOOL)derivesDeliveryAccountInfoFromMailAccount;
- (BOOL)hasEnoughInformationForEasySetup;
- (BOOL)isAccountClassEquivalentTo:(id)a3;
- (BOOL)isActive;
- (BOOL)isActiveWithPersistentAccount:(id)a3;
- (BOOL)isEquivalentTo:(id)a3 hostname:(id)a4 username:(id)a5;
- (BOOL)isHostnameEquivalentTo:(id)a3;
- (BOOL)isLocalAccount;
- (BOOL)isMailboxLocalForType:(int64_t)a3;
- (BOOL)isPrimaryDeliveryAccountDisabled;
- (BOOL)isSpecialMailbox:(id)a3;
- (BOOL)isUsernameEquivalentTo:(id)a3;
- (BOOL)moveMailbox:(id)a3 intoParent:(id)a4;
- (BOOL)moveSupported;
- (BOOL)mustArchiveSentMessages;
- (BOOL)newMailboxNameIsAcceptable:(id)a3 reasonForFailure:(id *)a4;
- (BOOL)ownsMailboxUidWithURL:(id)a3;
- (BOOL)perMessageEncryptionEnabledForAddress:(id)a3;
- (BOOL)preventArchiveForMailbox:(id)a3;
- (BOOL)reconstituteOrphanedMeetingInMessage:(id)a3;
- (BOOL)renameMailbox:(id)a3 newName:(id)a4;
- (BOOL)restrictedFromSendingExternally;
- (BOOL)restrictedFromSyncingRecents;
- (BOOL)restrictedFromTransferingMessagesToOtherAccounts;
- (BOOL)shouldArchiveByDefault;
- (BOOL)shouldFetchAgainWithError:(id)a3 foregroundRequest:(BOOL)a4;
- (BOOL)shouldFetchRemoteLinksWithDateReceived:(id)a3;
- (BOOL)shouldRestoreMessagesAfterFailedDelete;
- (BOOL)sourceIsManaged;
- (BOOL)supportsAppend;
- (BOOL)supportsArchiving;
- (BOOL)supportsFastRemoteBodySearch;
- (BOOL)supportsHandoffType:(id)a3;
- (BOOL)supportsMailDrop;
- (BOOL)supportsMailboxEditing;
- (BOOL)supportsMessageFlagging;
- (BOOL)supportsPurge;
- (BOOL)supportsRemoteAppend;
- (BOOL)supportsSyncingReadState;
- (BOOL)supportsThreadOperations;
- (BOOL)supportsUserPushedMailboxes;
- (BOOL)willPerformActionForChokePoint:(id)a3 coalescePoint:(id)a4 result:(id *)a5;
- (Class)storeClass;
- (Class)storeClassForMailbox:(id)a3;
- (MFLocalActionReplayHandler)replayHandler;
- (MFMailboxUid)rootMailbox;
- (MFTaskManager)taskManager;
- (MailAccount)initWithLibrary:(id)a3 path:(id)a4;
- (MailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4;
- (MailAccount)initWithPath:(id)a3;
- (MailAccount)initWithPersistentAccount:(id)a3;
- (NSArray)emailAddressStrings;
- (NSArray)emailAddresses;
- (NSDate)lastEmailAliasesSyncDate;
- (NSString)defaultPath;
- (NSString)description;
- (NSString)displayName;
- (NSString)lastEmailAliasesSyncEntityTag;
- (NSString)mailboxPathExtension;
- (NSString)smtpIdentifier;
- (NSString)statisticsKind;
- (id)URL;
- (id)URLForMessage:(id)a3;
- (id)URLString;
- (id)URLStringFromLegacyURLString:(id)a3;
- (id)_URLForInfo:(id)a3;
- (id)_URLScheme;
- (id)_cachedSpecialMailboxOfType:(int64_t)a3;
- (id)_childOfMailbox:(id)a3 withComponentName:(id)a4;
- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 existingMailboxUid:(id)a6 dictionary:(id)a7;
- (id)_copyMailboxWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 dictionary:(id)a6;
- (id)_defaultSpecialMailboxNameForType:(int64_t)a3;
- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3;
- (id)_infoForMatchingURL:(id)a3;
- (id)_localMailboxNameForType:(int64_t)a3 usingDisplayName:(id)a4;
- (id)_mailboxPathPrefix;
- (id)_newMailboxWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 dictionary:(id)a6 withCreationOption:(int64_t)a7;
- (id)_pathComponentForUidName:(id)a3;
- (id)_specialMailboxUidWithType:(int64_t)a3 create:(BOOL)a4;
- (id)_uidNameForPathComponent:(id)a3;
- (id)allLocalMailboxUids;
- (id)allMailMailboxUid;
- (id)allMailboxUids;
- (id)allMailboxesFilteringNotes:(BOOL)a3;
- (id)connectionError;
- (id)copyDataForRemoteEncryptionCertificatesForAddresses:(id)a3 errors:(id *)a4;
- (id)copyReceivingEmailAddresses;
- (id)customSignature;
- (id)debugAccountState;
- (id)defaultEmailAddress;
- (id)deliveryAccount;
- (id)deliveryAccountAlternates;
- (id)displayNameUsingSpecialNamesForMailboxUid:(id)a3;
- (id)emailAddressesAndAliases;
- (id)emailAddressesDictionary;
- (id)encryptionIdentityPersistentReferenceForAddress:(id)a3;
- (id)fetchLimits;
- (id)firstEmailAddress;
- (id)fullUserName;
- (id)iconString;
- (id)lastKnownCapabilities;
- (id)legacySQLExpressionToMatchAllMailboxes;
- (id)library;
- (id)loggingIdentifier;
- (id)mailboxCachePath;
- (id)mailboxForType:(int64_t)a3;
- (id)mailboxUidForInfo:(id)a3;
- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4;
- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4 withOption:(int64_t)a5;
- (id)mailboxUidForURL:(id)a3;
- (id)mailboxUidOfType:(int64_t)a3 createIfNeeded:(BOOL)a4;
- (id)mailboxesForSuggestionsLostMessageSearchPriorToTime:(double)a3;
- (id)meetingStorePersistentID;
- (id)newMailboxWithParent:(id)a3 name:(id)a4;
- (id)path;
- (id)persistentNameForMailbox:(id)a3;
- (id)powerAssertionIdentifierWithPrefix:(id)a3;
- (id)primaryMailboxUid;
- (id)pushedMailboxUids;
- (id)receiveEmailAliasAddresses;
- (id)replayAction:(id)a3;
- (id)saveSentFolder;
- (id)signingIdentityPersistentReferenceForAddress:(id)a3;
- (id)specialMailboxNameForType:(int64_t)a3;
- (id)stateCaptureTitle;
- (id)storeForMailboxUid:(id)a3;
- (id)transferDisabledMailboxUids;
- (id)unactionableInvitationICSRepresentationInMessage:(id)a3 summary:(id *)a4;
- (id)uniqueServerIdForMessage:(id)a3;
- (id)unsupportedHandoffTypes;
- (id)valueInAccountLookAsidePropertiesForKey:(id)a3;
- (int)_emptyFrequencyForKey:(id)a3 defaultValue:(id)a4;
- (int)emptyFrequencyForMailboxType:(int64_t)a3;
- (int64_t)archiveDestinationForMailbox:(id)a3;
- (int64_t)secureCompositionEncryptionPolicyForAddress:(id)a3;
- (int64_t)secureCompositionSigningPolicyForAddress:(id)a3;
- (void)_asynchronouslyInvalidateAndDeleteAccountData:(BOOL)a3;
- (void)_didBecomeActive:(BOOL)a3;
- (void)_incrementCacheDirtyCount;
- (void)_invalidateAndDeleteAccountData:(BOOL)a3;
- (void)_invalidateCachedMailboxen;
- (void)_loadEntriesFromFileSystemPath:(id)a3 parent:(id)a4;
- (void)_registerStateCaptureHandler;
- (void)_resetAllMailboxURLs:(BOOL)a3;
- (void)_setAccountProperties:(id)a3;
- (void)_setEmptyFrequency:(int)a3 forKey:(id)a4;
- (void)_setSpecialMailbox:(id)a3 forType:(int64_t)a4;
- (void)_setSpecialMailboxName:(id)a3 forType:(int64_t)a4;
- (void)_setValueInAccountLookAsideProperties:(id)a3 forKey:(id)a4 subKey:(id)a5;
- (void)_synchronizeMailboxListWithFileSystem;
- (void)_writeMailboxCacheWithPrejudice:(BOOL)a3;
- (void)_writeMailboxCacheWithPrejudice:(BOOL)a3 completionHandler:(id)a4;
- (void)addNewAction:(id)a3;
- (void)dealloc;
- (void)deleteDeliveryAccountIfNeeded;
- (void)deleteMessagesFromMailboxUid:(id)a3 olderThanNumberOfDays:(unsigned int)a4;
- (void)deliveryAccountWillBeRemoved:(id)a3;
- (void)didFinishActionForChokePoint:(id)a3 coalescePoint:(id)a4 withResult:(id)a5;
- (void)emptyTrash;
- (void)forceFetchMailboxListWithKind:(int64_t)a3;
- (void)invalidate;
- (void)invalidateAndDelete;
- (void)invalidateEmailAliases;
- (void)newActionsAdded;
- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4;
- (void)releaseAllConnections;
- (void)releaseAllForcedConnections;
- (void)resetMailboxURLs;
- (void)resetSpecialMailboxes;
- (void)saveState;
- (void)setActive:(BOOL)a3;
- (void)setCacheHasBeenRead:(BOOL)a3;
- (void)setCanUseCarrierDeliveryFallback:(BOOL)a3;
- (void)setConnectionError:(id)a3;
- (void)setCustomSignature:(id)a3;
- (void)setDeliveryAccount:(id)a3;
- (void)setDeliveryAccountAlternates:(id)a3;
- (void)setEmptyFrequency:(int)a3 forMailboxType:(int64_t)a4;
- (void)setEncryptionIdentityPersistentReference:(id)a3 forAddress:(id)a4;
- (void)setFullUserName:(id)a3;
- (void)setHostname:(id)a3;
- (void)setLastEmailAliasesSyncDate:(id)a3;
- (void)setLastEmailAliasesSyncEntityTag:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setMailboxCachePath:(id)a3;
- (void)setPath:(id)a3;
- (void)setPortNumber:(unsigned int)a3;
- (void)setPrimaryDeliveryAccountDisabled:(BOOL)a3;
- (void)setReplayHandler:(id)a3;
- (void)setSigningIdentityPersistentReference:(id)a3 forAddress:(id)a4;
- (void)setUsername:(id)a3;
- (void)setValueInAccountLookAsideProperties:(id)a3 forKey:(id)a4;
- (void)setValueInAccountProperties:(id)a3 forKey:(id)a4;
- (void)setupLibrary;
- (void)shouldArchiveByDefault;
- (void)test_setTaskManager:(id)a3;
- (void)test_tearDown;
- (void)updateEmailAliasesIfNeeded;
@end

@implementation MailAccount

uint64_t __35__MailAccount_accountWithUniqueId___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 uniqueID];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

+ (id)URLForInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:@"Account"];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 _URLForInfo:v3];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_URLForInfo:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
  v6 = [(MFAccount *)self uniqueID];
  [v5 setHost:v6];

  v7 = [(MailAccount *)self _URLScheme];
  [v5 setScheme:v7];

  v8 = [v4 objectForKey:@"RelativePath"];
  if (v8)
  {
    v9 = [@"/" stringByAppendingPathComponent:v8];
    [v5 setPath:v9];
  }
  v10 = [v5 URL];

  return v10;
}

- (id)persistentNameForMailbox:(id)a3
{
  return 0;
}

- (id)_mailboxPathPrefix
{
  return &stru_1EFF11268;
}

- (id)_pathComponentForUidName:(id)a3
{
  id v3 = a3;
  return v3;
}

- (NSString)displayName
{
  id v3 = [(MFAccount *)self _objectForAccountInfoKey:@"DisplayName"];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [(MailAccount *)self firstEmailAddress];

    if (v4)
    {
      [(MailAccount *)self mf_lock];
      [(MFAccount *)self setAccountProperty:v4 forKey:@"DisplayName"];
      [(MailAccount *)self mf_unlock];
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)MailAccount;
      id v4 = [(MFAccount *)&v6 displayName];
    }
  }
  return (NSString *)v4;
}

- (id)displayNameUsingSpecialNamesForMailboxUid:(id)a3
{
  id v3 = a3;
  if ([v3 isSendLaterMailbox])
  {
    id v4 = _EFLocalizedString();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)saveState
{
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  $A328ED5E44AECF0F4A7A4FD34A0E6BE2 flags = self->_flags;
  os_unfair_lock_unlock(p_flagsLock);
  if (flags)
  {
    [(MailAccount *)self _writeMailboxCacheWithPrejudice:1];
  }
}

- (void)_writeMailboxCacheWithPrejudice:(BOOL)a3
{
}

id __42__MailAccount_activeAccountEmailAddresses__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copyReceivingEmailAddresses];
  id v3 = [v2 allObjects];

  return v3;
}

- (id)copyReceivingEmailAddresses
{
  id v3 = [(MFAccount *)self uniqueID];
  if (receivingEmailAddressesCache_onceToken != -1) {
    dispatch_once(&receivingEmailAddressesCache_onceToken, &__block_literal_global_942);
  }
  id v4 = (id)receivingEmailAddressesCache__receivingEmailAddressesCache;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__MailAccount_copyReceivingEmailAddresses__block_invoke;
  v7[3] = &unk_1E5D3C1B0;
  v7[4] = self;
  id v5 = [v4 objectForKey:v3 generator:v7];

  return v5;
}

uint64_t __39__MailAccount_activeAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isActive];
}

- (id)primaryMailboxUid
{
  return [(MailAccount *)self mailboxUidOfType:7 createIfNeeded:1];
}

BOOL __45__MailAccount__resetSpecialMailboxesCanPost___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "mf_lock");
  v2 = *(void **)(a1 + 32);
  int v10 = (v2[15] != 0) | (2 * (v2[16] != 0)) | (4 * (v2[17] != 0)) | (8 * (v2[18] != 0)) | (16 * (v2[19] != 0)) | (32 * (v2[20] != 0));
  objc_msgSend(v2, "mf_unlock");
  uint64_t v3 = 0;
  v11[0] = xmmword_1A8AC6380;
  v11[1] = xmmword_1A8AC6390;
  v11[2] = xmmword_1A8AC63A0;
  do
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)((char *)v11 + v3);
    objc_super v6 = [v4 _specialMailboxUidWithType:v5 create:0];
    LODWORD(v5) = [v4 _assignSpecialMailboxToAppropriateIvar:v6 forType:v5];

    if (v5) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    v3 += 8;
  }
  while (v3 != 48);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "mf_lock");
    v7 = *(void **)(a1 + 32);
    int v8 = (v7[15] != 0) | (2 * (v7[16] != 0)) | (4 * (v7[17] != 0)) | (8 * (v7[18] != 0)) | (16 * (v7[19] != 0)) | (32 * (v7[20] != 0));
    objc_msgSend(v7, "mf_unlock");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10 != v8;
  }
  return *(unsigned char *)(a1 + 48) && *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
}

- (BOOL)_assignSpecialMailboxToAppropriateIvar:(id)a3 forType:(int64_t)a4
{
  id v7 = a3;
  [(MFLock *)self->_cachedMailboxenLock lock];
  unint64_t v8 = a4 - 1;
  if (unint64_t)(a4 - 1) < 7 && ((0x5Fu >> v8))
  {
    id v15 = *(id *)((char *)&self->super.super.isa + *off_1E5D3C310[v8]);
    if (v15 == v7)
    {
      int v10 = 0;
      v11 = 0;
      id v9 = v7;
    }
    else
    {
      id v9 = v15;
      [v15 setMailboxType:0];
      [v9 setRepresentedAccount:0];
      [v7 setMailboxType:a4];
      uint64_t v16 = [v9 parent];
      uint64_t v17 = [v7 parent];
      if (v8 < 7 && ((0x5Fu >> v8) & 1) != 0) {
        objc_storeStrong((id *)((char *)&self->super.super.isa + *off_1E5D3C310[v8]), a3);
      }
      int v10 = (void *)v16;
      v11 = (void *)v17;
    }
  }
  else
  {
    id v9 = 0;
    int v10 = 0;
    v11 = 0;
  }
  [(MFLock *)self->_cachedMailboxenLock unlock];
  if (v11)
  {
    uint64_t v12 = [v11 account];
    [v12 _setChildren:0 forMailboxUid:v11];
  }
  if (v10 && v11 != v10)
  {
    v13 = [v10 account];
    [v13 _setChildren:0 forMailboxUid:v10];
  }
  return v9 != v7;
}

- (id)mailboxUidOfType:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[MailAccount _cachedSpecialMailboxOfType:](self, "_cachedSpecialMailboxOfType:");
  if (!v7)
  {
    id v9 = [(MailAccount *)self _specialMailboxUidWithType:a3 create:v4];
    id v7 = v9;
    if (v9)
    {
      if ([v9 type] != a3) {
        [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:v7 forType:a3];
      }
    }
  }
  return v7;
}

- (id)_cachedSpecialMailboxOfType:(int64_t)a3
{
  [(MFLock *)self->_cachedMailboxenLock lock];
  int64_t v5 = a3 - 1;
  if (unint64_t)(a3 - 1) <= 6 && ((0x5Fu >> v5)) {
    id v6 = *(id *)((char *)&self->super.super.isa + *off_1E5D3C310[v5]);
  }
  else {
    id v6 = 0;
  }
  [(MFLock *)self->_cachedMailboxenLock unlock];
  return v6;
}

- (id)_defaultSpecialMailboxNameForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 0;
  }
  else {
    return off_1E5D3C2D8[a3 - 1];
  }
}

- (id)_specialMailboxUidWithType:(int64_t)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[MailAccount specialMailboxNameForType:](self, "specialMailboxNameForType:");
  if (!v7)
  {
    id v7 = [(MailAccount *)self _defaultSpecialMailboxNameForType:a3];
    [(MailAccount *)self _setSpecialMailboxName:v7 forType:a3];
  }
  unint64_t v8 = [(MailAccount *)self mailboxUidForRelativePath:v7 create:v4];

  return v8;
}

- (id)specialMailboxNameForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
  {
    int64_t v5 = 0;
  }
  else
  {
    int64_t v5 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", off_1E5D3C348[a3 - 1], v3);
  }
  return v5;
}

- (id)mailboxUidForURL:(id)a3
{
  id v4 = a3;
  if ([(MailAccount *)self ownsMailboxUidWithURL:v4])
  {
    int64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    id v6 = [(MailAccount *)self _infoForMatchingURL:v5];
    id v7 = [(MailAccount *)self mailboxUidForInfo:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)ownsMailboxUidWithURL:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MailAccount *)self URLString];
  char v6 = [v4 hasPrefix:v5];

  return v6;
}

- (id)mailboxUidForInfo:(id)a3
{
  id v4 = [a3 objectForKey:@"RelativePath"];
  int64_t v5 = [(MailAccount *)self mailboxUidForRelativePath:v4 create:0];

  return v5;
}

- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4
{
  id v4 = [(MailAccount *)self mailboxUidForRelativePath:a3 create:a4 withOption:0];
  return v4;
}

- (id)URLString
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"Account";
  v7[1] = @"RelativePath";
  v8[0] = self;
  v8[1] = &stru_1EFF11268;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  id v4 = [(MailAccount *)self _URLForInfo:v3];
  int64_t v5 = [v4 absoluteString];

  return v5;
}

- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4 withOption:(int64_t)a5
{
  BOOL v5 = a4;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  v32 = [v28 pathComponents];
  unint64_t v7 = [v32 count];
  unint64_t v8 = [(MailAccount *)self rootMailbox];
  [(MailAccount *)self mf_lock];
  id v31 = 0;
  if (v8 && v7)
  {
    id v31 = 0;
    id v9 = 0;
    v29 = 0;
    unint64_t v10 = 1;
    do
    {
      v11 = [v32 objectAtIndex:v10 - 1];
      if (v7 == v10)
      {
        uint64_t v12 = [(MailAccount *)self mailboxPathExtension];
        int v13 = [v11 hasSuffix:v12];

        if (v13)
        {
          uint64_t v14 = [v11 stringByDeletingPathExtension];

          v11 = (void *)v14;
        }
      }
      id v15 = [(MailAccount *)self _uidNameForPathComponent:v11];
      uint64_t v16 = [(MailAccount *)self _childOfMailbox:v8 withComponentName:v15];

      if (!v16 && v5)
      {
        [(MailAccount *)self mf_unlock];
        if (v7 == v10) {
          uint64_t v17 = 257;
        }
        else {
          uint64_t v17 = 258;
        }
        id v18 = [(MailAccount *)self _newMailboxWithParent:v8 name:v15 attributes:v17 dictionary:0 withCreationOption:a5];
        [(MailAccount *)self mf_lock];
        uint64_t v19 = [(MailAccount *)self _childOfMailbox:v8 withComponentName:v15];
        uint64_t v16 = (void *)v19;
        if (v18 && !v19)
        {
          if (v31)
          {
            v33[0] = v18;
            v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
            [v8 setChildren:v20];
          }
          else
          {
            id v31 = v8;
            uint64_t v21 = [v31 mutableCopyOfChildren];

            id v22 = (id)v21;
            if (!v21) {
              id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            v29 = v22;
            [v22 addObject:v18];
          }
          id v23 = v18;
          [(MailAccount *)self _incrementCacheDirtyCount];
          uint64_t v16 = v23;
        }
      }
      id v9 = v16;

      if (!v9) {
        break;
      }
      unint64_t v8 = v9;
    }
    while (v10++ < v7);
    if (v9 && v31)
    {
      [(MailAccount *)self mf_unlock];
      [(MailAccount *)self _setChildren:v29 forMailboxUid:v31];
      v25 = v9;
      [(MailAccount *)self mf_lock];
    }
    else
    {
      v25 = v9;
    }
  }
  else
  {
    v25 = 0;
    id v9 = v8;
    v29 = 0;
  }
  [(MailAccount *)self mf_unlock];
  id v26 = v9;

  return v26;
}

- (MFMailboxUid)rootMailbox
{
  _configureMailboxCache(self);
  [(MailAccount *)self mf_lock];
  uint64_t v3 = self->_rootMailboxUid;
  [(MailAccount *)self mf_unlock];
  return v3;
}

- (BOOL)cacheHasBeenRead
{
  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = HIWORD(*(_DWORD *)&v2->_flags) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (BOOL)canFetch
{
  return [(MFAccount *)self isEnabledForDataclass:*MEMORY[0x1E4F17AD8]];
}

- (id)_childOfMailbox:(id)a3 withComponentName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 childWithName:v6];
  if (!v7)
  {
    unint64_t v7 = [v5 childWithExtraAttribute:v6];
  }

  return v7;
}

- (id)path
{
  path = self->_path;
  if (!path)
  {
    id v4 = [(MailAccount *)self defaultPath];
    [(MailAccount *)self setPath:v4];

    path = self->_path;
  }
  id v5 = path;
  return v5;
}

- (id)_uidNameForPathComponent:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)_setSpecialMailboxName:(id)a3 forType:(int64_t)a4
{
  id v7 = a3;
  [(MailAccount *)self mf_lock];
  if ((unint64_t)(a4 - 1) < 5)
  {
    id v6 = off_1E5D3C348[a4 - 1];
    if (v7) {
      [(MFAccount *)self setAccountProperty:v7 forKey:v6];
    }
    else {
      [(MFAccount *)self removeAccountPropertyForKey:v6];
    }
  }
  [(MailAccount *)self mf_unlock];
}

+ (void)_postMailboxListNotificationAfterBlock:(id)a3
{
  id v5 = (uint64_t (**)(void))a3;
  int v3 = [(id)objc_opt_class() mailboxListingNotificationsAreEnabled];
  if (v3) {
    [(id)objc_opt_class() disableMailboxListingNotifications];
  }
  uint64_t v4 = v5[2]();
  if (v3) {
    [(id)objc_opt_class() enableMailboxListingNotifications:v4];
  }
}

- (BOOL)_setChildren:(id)a3 forMailboxUid:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  id v8 = a4;
  id v9 = (void *)[v8 mutableCopyOfChildren];
  unint64_t v10 = v9;
  if (!v6)
  {
    id v7 = v9;
    if (!v7) {
      goto LABEL_14;
    }
  }
  int v11 = [v8 setChildren:v7] ^ 1;
  if (!v6) {
    LOBYTE(v11) = 0;
  }
  if (v11)
  {
    BOOL v16 = 0;
  }
  else
  {
LABEL_14:
    if ([(MailAccount *)self cacheHasBeenRead]
      && [(id)objc_opt_class() mailboxListingNotificationsAreEnabled])
    {
      uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      int v13 = (void *)MEMORY[0x1E4F28EA0];
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v10, @"OldChildren", v7, @"NewChildren", 0);
      id v15 = [v13 notificationWithName:@"AccountMailboxListingDidChange" object:v8 userInfo:v14];
      [v12 postNotification:v15];
    }
    BOOL v16 = 1;
  }

  return v16;
}

+ (BOOL)mailboxListingNotificationsAreEnabled
{
  unsigned __int8 v2 = atomic_load(sDisableMailboxListingNotifications);
  return (v2 & 1) == 0;
}

- (void)setCacheHasBeenRead:(BOOL)a3
{
  BOOL v3 = a3;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  if (v3) {
    int v6 = 0x10000;
  }
  else {
    int v6 = 0;
  }
  self->_$A328ED5E44AECF0F4A7A4FD34A0E6BE2 flags = ($A328ED5E44AECF0F4A7A4FD34A0E6BE2)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v6);
  os_unfair_lock_unlock(p_flagsLock);
}

- (id)mailboxCachePath
{
  mailboxCachePath = self->_mailboxCachePath;
  if (mailboxCachePath)
  {
    BOOL v3 = mailboxCachePath;
  }
  else
  {
    uint64_t v4 = [(MailAccount *)self path];
    BOOL v3 = [v4 stringByAppendingPathComponent:@".mboxCache.plist"];
  }
  return v3;
}

uint64_t __46__MailAccount_performOnAccounts_accountBlock___block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MailAccount_performOnAccounts_accountBlock___block_invoke_2;
  v4[3] = &unk_1E5D3C240;
  int v6 = &v7;
  v1 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v4];
  uint64_t v2 = *((unsigned __int8 *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v2;
}

- (BOOL)_readCustomInfoFromMailboxCache:(id)a3
{
  return 1;
}

- (void)setPath:(id)a3
{
  id v4 = a3;
  if (-[MailAccount _setPath:](self, "_setPath:")) {
    [(MFAccount *)self _queueAccountInfoDidChange];
  }
}

- (id)_newMailboxWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 dictionary:(id)a6 withCreationOption:(int64_t)a7
{
  return -[MailAccount _copyMailboxWithParent:name:attributes:dictionary:](self, "_copyMailboxWithParent:name:attributes:dictionary:", a3, a4, a5, a6, a7);
}

- (void)_incrementCacheDirtyCount
{
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  $A328ED5E44AECF0F4A7A4FD34A0E6BE2 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0) {
    self->_$A328ED5E44AECF0F4A7A4FD34A0E6BE2 flags = ($A328ED5E44AECF0F4A7A4FD34A0E6BE2)(*(_DWORD *)&flags & 0xFFFF0000 | (unsigned __int16)(*(_WORD *)&flags + 1));
  }
  os_unfair_lock_unlock(p_flagsLock);
}

uint64_t __37__MailAccount_activeNonLocalAccounts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLocalAccount] ^ 1;
}

- (BOOL)isLocalAccount
{
  return 0;
}

- (MFTaskManager)taskManager
{
  return 0;
}

- (NSString)statisticsKind
{
  return 0;
}

- (id)deliveryAccount
{
  return [(MailAccount *)self _deliveryAccountCreateIfNeeded:1];
}

id __39__MailAccount_emailAddressesDictionary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "ef_stringByTrimmingWhitespaceAndNewlineCharacters");
  return v2;
}

- (NSArray)emailAddresses
{
  uint64_t v2 = (void *)MEMORY[0x1E4F607F8];
  BOOL v3 = [(MailAccount *)self emailAddressStrings];
  id v4 = [v2 emailAddressesFromStrings:v3 invalidAddresses:0];

  return (NSArray *)v4;
}

+ (void)resetMailboxTimers
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [a1 activeAccounts];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "resetMailboxTimer", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

+ (id)activeAccountEmailAddresses
{
  id v2 = +[MailAccount activeAccounts];
  uint64_t v3 = (void *)[v2 copy];

  uint64_t v4 = objc_msgSend(v3, "ef_map:", &__block_literal_global_128);
  uint64_t v5 = objc_msgSend(v4, "ef_flatten");
  long long v6 = objc_msgSend(v5, "ef_filter:", *MEMORY[0x1E4F60CE8]);

  id v7 = objc_alloc_init(MEMORY[0x1E4F605B8]);
  [v7 addObjectsFromArray:v6];

  return v7;
}

+ (id)activeAccounts
{
  return (id)[a1 activeAccountsWithError:0];
}

+ (id)activeAccountsWithError:(id *)a3
{
  uint64_t v3 = [a1 mailAccountsWithError:a3];
  uint64_t v4 = objc_msgSend(v3, "ef_filter:", &__block_literal_global_134);

  return v4;
}

id __42__MailAccount_copyReceivingEmailAddresses__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) emailAddressesAndAliasesList];
  id v2 = objc_msgSend(v1, "ef_map:", &__block_literal_global_217);

  uint64_t v3 = objc_msgSend(v2, "ef_flatMap:", &__block_literal_global_220);
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

  return v4;
}

- (NSArray)emailAddressStrings
{
  id v2 = [(MailAccount *)self emailAddressesDictionary];
  uint64_t v3 = [v2 allKeys];
  uint64_t v4 = objc_msgSend(v3, "ef_map:", &__block_literal_global_204);

  return (NSArray *)v4;
}

- (id)emailAddressesDictionary
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [(MFAccount *)self _objectForAccountInfoKey:@"EmailAddresses"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 componentsSeparatedByString:@","];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v2;
        uint64_t v4 = 0;
        goto LABEL_21;
      }
      if (v2)
      {
        uint64_t v12 = MFLogGeneral();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v2;
          _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "#Warning Returned unhandled email addresses %@", buf, 0xCu);
        }
      }
      uint64_t v4 = 0;
LABEL_20:
      id v11 = 0;
      goto LABEL_21;
    }
    id v3 = v2;
  }
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_20;
  }
  uint64_t v5 = objc_msgSend(v3, "ef_map:", &__block_literal_global_214);
  long long v6 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    uint64_t v10 = MEMORY[0x1E4F1CC38];
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v7);
      }
      objc_msgSend(v6, "addObject:", v10, v15);
      if (!--v8)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v7];

LABEL_21:
  id v13 = v11;

  return v13;
}

+ (id)activeNonLocalAccounts
{
  id v2 = +[MailAccount activeAccounts];
  id v3 = objc_msgSend(v2, "ef_filter:", &__block_literal_global_132);

  return v3;
}

+ (void)reloadAccounts
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_FAULT, "Ignoring accounts without paths: %{public}@", buf, 0xCu);
}

+ (MailAccount)accountWithURL:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v26 = v4;
  uint64_t v5 = [v4 scheme];
  if (v5)
  {
    long long v6 = objc_msgSend(v4, "ef_hostNilForEmpty");
    id v7 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v8 = [a1 mailAccounts];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([v12 isActive]) {
            [v7 insertObject:v12 atIndex:0];
          }
          else {
            [v7 addObject:v12];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v9);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v28;
      while (2)
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v13);
          }
          long long v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          long long v18 = [v17 _URLScheme];
          uint64_t v19 = v18;
          if (v18)
          {
            BOOL v20 = [v18 caseInsensitiveCompare:v5] == 0;

            if (v20)
            {
              uint64_t v21 = [v17 uniqueID];
              uint64_t v22 = v21;
              if (v6 == v21)
              {

LABEL_29:
                id v24 = v17;
                goto LABEL_30;
              }
              if (v6)
              {
                BOOL v23 = [v6 caseInsensitiveCompare:v21] == 0;

                if (v23) {
                  goto LABEL_29;
                }
              }
              else
              {
              }
            }
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    id v24 = 0;
LABEL_30:
  }
  else
  {
    id v24 = 0;
  }

  return (MailAccount *)v24;
}

- (BOOL)isActive
{
  id v2 = self;
  id v3 = [(MFAccount *)self persistentAccount];
  LOBYTE(v2) = [(MailAccount *)v2 isActiveWithPersistentAccount:v3];

  return (char)v2;
}

- (BOOL)isActiveWithPersistentAccount:(id)a3
{
  return [a3 isEnabledForDataclass:*MEMORY[0x1E4F17AD8]];
}

+ (MailAccount)accountWithUniqueId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 mailAccounts];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__MailAccount_accountWithUniqueId___block_invoke;
  v9[3] = &unk_1E5D3C0B8;
  id v6 = v4;
  id v10 = v6;
  id v7 = objc_msgSend(v5, "ef_firstObjectPassingTest:", v9);

  return (MailAccount *)v7;
}

+ (id)mailAccounts
{
  return (id)[a1 mailAccountsWithError:0];
}

+ (id)mailAccountsWithError:(id *)a3
{
  +[MailAccount lockMailAccount];
  uint64_t v5 = (void *)_accounts;
  if (!_accounts)
  {
    [a1 reloadAccounts];
    uint64_t v5 = (void *)_accounts;
  }
  id v6 = (void *)[v5 copy];
  if (a3) {
    *a3 = (id) _lastAccountsReloadError;
  }
  +[MailAccount unlockMailAccount];
  return v6;
}

+ (void)unlockMailAccount
{
}

+ (void)lockMailAccount
{
}

+ (void)enableMailboxListingNotifications:(BOOL)a3
{
  atomic_store(0, sDisableMailboxListingNotifications);
  if (a3)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"AccountMailboxListingDidChange" object:0 userInfo:0];
  }
}

+ (void)disableMailboxListingNotifications
{
}

+ (void)updatePersonalStatusForAccounts:(id)a3 forceUpdate:(BOOL)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  uint64_t v5 = MFUserAgent();
  int v6 = [v5 isMaild];

  if (v6)
  {
    id v20 = objc_alloc_init(getMCCSecretAgentControllerClass());
    if (objc_opt_respondsToSelector())
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      obuint64_t j = v19;
      uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v7)
      {
        uint64_t v24 = *(void *)v36;
        uint64_t v23 = *MEMORY[0x1E4F60CB8];
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v36 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            uint64_t v29 = 0;
            long long v30 = &v29;
            uint64_t v31 = 0x3032000000;
            long long v32 = __Block_byref_object_copy__4;
            long long v33 = __Block_byref_object_dispose__4;
            id v34 = (id)0xAAAAAAAAAAAAAAAALL;
            id v34 = [v9 systemAccount];
            id v10 = [v9 firstEmailAddress];
            if (v10)
            {
              uint64_t v11 = [(id)v30[5] accountPropertyForKey:v23];
              uint64_t v12 = (void *)v11;
              if (a4 || !v11)
              {
                id v13 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v10];
                uint64_t v14 = v13;
                if (v13)
                {
                  uint64_t v15 = [v13 domain];
                  v25[0] = MEMORY[0x1E4F143A8];
                  v25[1] = 3221225472;
                  v25[2] = __59__MailAccount_updatePersonalStatusForAccounts_forceUpdate___block_invoke;
                  v25[3] = &unk_1E5D3C148;
                  long long v27 = &v29;
                  id v28 = a1;
                  id v26 = v10;
                  [v20 isPersonalDomain:v15 completion:v25];

                  long long v16 = v26;
                }
                else
                {
                  long long v16 = MFLogGeneral();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v40 = v10;
                    _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "#Warning Failed to parse email address %{public}@", buf, 0xCu);
                  }
                }
              }
            }
            objc_msgSend(a1, "mf_lock");
            long long v17 = MFLogGeneral();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              long long v18 = [(id)v30[5] accountPropertyForKey:v23];
              *(_DWORD *)buf = 138412546;
              v40 = v9;
              __int16 v41 = 2112;
              v42 = v18;
              _os_log_debug_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEBUG, "Account %@ isNotPersonal flag is %@", buf, 0x16u);
            }
            objc_msgSend(a1, "mf_unlock");

            _Block_object_dispose(&v29, 8);
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v7);
      }
    }
  }
}

+ (void)_setMailAccounts:(id)a3 saveIfChanged:(BOOL)a4 alreadyLocked:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v47 = v8;
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v48 = a5;
  if (!a5)
  {
    [a1 disableMailboxListingNotifications];
    objc_msgSend(a1, "mf_lock");
  }
  id v10 = objc_opt_new();
  [v10 setMaxConcurrentOperationCount:1];
  obuint64_t j = (id)[v8 mutableCopy];
  uint64_t v11 = +[LocalAccount localAccount];
  BOOL v50 = v6;
  v49 = (void *)v11;
  if ([obj indexOfObjectIdenticalTo:v11] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = [(id)_accounts indexOfObjectIdenticalTo:v11];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v12;
    }
    [obj insertObject:v11 atIndex:v13];
  }
  id v52 = (id)_accounts;
  objc_storeStrong((id *)&_accounts, obj);
  [a1 _setupSortedPathsForAccounts:_accounts];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v14 = v52;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v79 objects:v88 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v80 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        if ([obj containsObject:v18])
        {
          [v9 addObject:v18];
        }
        else
        {
          [v53 addObject:v18];
          [v18 invalidate];
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v79 objects:v88 count:16];
    }
    while (v15);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v19 = obj;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v75 objects:v87 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v76 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void *)(*((void *)&v75 + 1) + 8 * j);
        char v24 = [v14 containsObject:v23];
        v25 = v54;
        if (v24)
        {
          char v26 = [v9 containsObject:v23];
          v25 = v9;
          if (v26) {
            continue;
          }
        }
        [v25 addObject:v23];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v75 objects:v87 count:16];
    }
    while (v20);
  }

  if (v50)
  {
    id v46 = v19;
    id v51 = a1;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v27 = v53;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v71 objects:v86 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v72;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v72 != v29) {
            objc_enumerationMutation(v27);
          }
          uint64_t v31 = *(void *)(*((void *)&v71 + 1) + 8 * k);
          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke;
          v70[3] = &unk_1E5D3B5C0;
          v70[4] = v31;
          [v10 addOperationWithBlock:v70];
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v71 objects:v86 count:16];
      }
      while (v28);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v32 = v54;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v66 objects:v85 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v67;
      do
      {
        for (uint64_t m = 0; m != v33; ++m)
        {
          if (*(void *)v67 != v34) {
            objc_enumerationMutation(v32);
          }
          uint64_t v36 = *(void *)(*((void *)&v66 + 1) + 8 * m);
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke_2;
          v65[3] = &unk_1E5D3B5C0;
          v65[4] = v36;
          [v10 addOperationWithBlock:v65];
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v66 objects:v85 count:16];
      }
      while (v33);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v37 = v9;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v61 objects:v84 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v62;
      do
      {
        for (uint64_t n = 0; n != v38; ++n)
        {
          if (*(void *)v62 != v39) {
            objc_enumerationMutation(v37);
          }
          uint64_t v41 = *(void *)(*((void *)&v61 + 1) + 8 * n);
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke_3;
          v60[3] = &unk_1E5D3B5C0;
          v60[4] = v41;
          [v10 addOperationWithBlock:v60];
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v61 objects:v84 count:16];
      }
      while (v38);
    }

    a1 = v51;
    id v19 = v46;
  }
  if (!v48)
  {
    objc_msgSend(a1, "mf_unlock");
    [a1 enableMailboxListingNotifications:0];
  }
  [v10 waitUntilAllOperationsAreFinished];
  clearMailboxUIDCache();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v42 = v9;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v56 objects:v83 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v57;
    do
    {
      for (iuint64_t i = 0; ii != v43; ++ii)
      {
        if (*(void *)v57 != v44) {
          objc_enumerationMutation(v42);
        }
        [*(id *)(*((void *)&v56 + 1) + 8 * ii) invalidateEmailAliases];
      }
      uint64_t v43 = [v42 countByEnumeratingWithState:&v56 objects:v83 count:16];
    }
    while (v43);
  }

  [a1 notifyOfAccountsAdded:v54 accountsRemoved:v53 changedAccounts:v42];
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__MailAccount_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1) {
    dispatch_once(&log_onceToken_4, block);
  }
  id v2 = (void *)log_log_4;
  return (OS_os_log *)v2;
}

- (void)invalidateEmailAliases
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A7EFF000, v0, v1, "invalidateEmailAliases: no-op", v2, v3, v4, v5, v6);
}

+ (void)notifyOfAccountsAdded:(id)a3 accountsRemoved:(id)a4 changedAccounts:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  if (+[MFMailMessageLibrary canUsePersistence])
  {
    id v9 = +[MFMailMessageLibrary defaultInstance];
    id v10 = [v9 persistence];
    uint64_t v11 = [v10 hookRegistry];

    if ([v12 count]) {
      [v11 accountsAdded:v12];
    }
    if ([v7 count]) {
      [v11 accountsRemoved:v7];
    }
    if ([v8 count]) {
      [v11 accountsChanged:v8];
    }
  }
}

+ (void)_setupSortedPathsForAccounts:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFArrayRemoveAllValues((CFMutableArrayRef)_sortedAccountPaths);
  CFArrayRemoveAllValues((CFMutableArrayRef)_accountsSortedByPath);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(a1, "_addAccountToSortedPaths:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (void)_addAccountToSortedPaths:(id)a3
{
  id value = a3;
  uint64_t v3 = [value path];
  CFArrayRef v4 = (const __CFArray *)_sortedAccountPaths;
  v8.length = CFArrayGetCount((CFArrayRef)_sortedAccountPaths);
  v8.locatiouint64_t n = 0;
  CFIndex v5 = CFArrayBSearchValues(v4, v8, v3, MEMORY[0x1E4F1C2A8], 0);
  CFArrayInsertValueAtIndex((CFMutableArrayRef)_sortedAccountPaths, v5, v3);
  CFArrayInsertValueAtIndex((CFMutableArrayRef)_accountsSortedByPath, v5, value);
}

- (BOOL)_loadMailboxListingIntoCache:(id)a3 attributes:(unsigned int)a4 children:(id)a5 parent:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v46 = a5;
  id v47 = a6;
  CFRange v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"AccountMailboxListingWillLoad" object:0 userInfo:0];

  CFArrayRef v9 = 0;
  CFArrayRef v48 = 0;
  Mutable = 0;
  int v49 = 0;
  do
  {
    ValueAtIndex = v46;
    theArray = v9;
    if (v9) {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v9, 0);
    }
    id v56 = ValueAtIndex;
    long long v12 = v47;
    if (v48) {
      long long v12 = (void *)CFArrayGetValueAtIndex(v48, 0);
    }
    id v52 = v12;
    id v53 = (void *)[v52 mutableCopyOfChildren];
    uint64_t v13 = [v56 count];
    if (theArray) {
      CFArrayRemoveValueAtIndex(theArray, 0);
    }
    if (v48) {
      CFArrayRemoveValueAtIndex(v48, 0);
    }
    id v54 = objc_opt_new();
    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v13)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        uint64_t v15 = [v56 objectAtIndex:i];
        uint64_t v16 = [v15 objectForKey:@"MailboxName"];
        [v55 setObject:v15 forKey:v16];
      }
    }
    uint64_t v17 = [v53 count];
    if (v17)
    {
      uint64_t v18 = v17 - 1;
      do
      {
        id v19 = [v53 objectAtIndex:v18];
        uint64_t v20 = [v19 name];
        uint64_t v21 = [v55 objectForKey:v20];
        if ([v54 containsObject:v20])
        {
          uint64_t v22 = +[MailAccount log];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v20];
            *(_DWORD *)buf = 138543362;
            long long v58 = v23;
            _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "Removing duplicate mailbox %{public}@", buf, 0xCu);
          }
          char v24 = 0;
        }
        else
        {
          if (v21)
          {
            v25 = [v21 objectForKey:@"MailboxAttributes"];
            unsigned int v26 = [v25 unsignedIntValue];

            id v27 = [(MailAccount *)self _copyMailboxUidWithParent:v52 name:v20 attributes:v26 existingMailboxUid:v19 dictionary:v21];
          }
          else
          {
            id v27 = [(MailAccount *)self _copyMailboxUidWithParent:v52 name:0 attributes:0 existingMailboxUid:v19 dictionary:0];
          }
          char v24 = v27;
        }
        [v54 addObject:v20];
        if (v24)
        {
          uint64_t v28 = [v24 name];
          if (([v24 isEqual:v19] & 1) == 0)
          {
            [v53 replaceObjectAtIndex:v18 withObject:v24];
            int v49 = 1;
          }
          if (!Mutable) {
            Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], 0);
          }
          CFDictionarySetValue(Mutable, v28, v24);
          if (([v28 isEqualToString:v20] & 1) == 0) {
            CFDictionarySetValue(Mutable, v20, v24);
          }
          uint64_t v29 = v21 == 0;
        }
        else
        {
          [v53 removeObjectAtIndex:v18];
          if (v21) {
            uint64_t v29 = -1;
          }
          else {
            uint64_t v29 = 0;
          }
          int v49 = 1;
        }

        v13 += v29;
        --v18;
      }
      while (v18 != -1);
    }
    uint64_t v30 = [v56 count];
    uint64_t v31 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v13];
    id v32 = v31;
    if (v53) {
      [v31 addObjectsFromArray:v53];
    }
    if (v30)
    {
      for (uint64_t j = 0; v30 != j; ++j)
      {
        uint64_t v34 = [v56 objectAtIndex:j];
        long long v35 = [v34 objectForKey:@"MailboxName"];
        uint64_t v36 = [v34 objectForKey:@"MailboxAttributes"];
        unsigned int v37 = [v36 unsignedIntValue];

        uint64_t v38 = [v34 objectForKey:@"MailboxChildren"];
        if (Mutable && (id v39 = (id)CFDictionaryGetValue(Mutable, v35)) != 0
          || (id v39 = [(MailAccount *)self _copyMailboxUidWithParent:v52 name:v35 attributes:v37 existingMailboxUid:0 dictionary:v34]) != 0)
        {
          if ([v32 indexOfObjectIdenticalTo:v39] == 0x7FFFFFFFFFFFFFFFLL)
          {
            int v49 = 1;
            objc_msgSend(v32, "ef_insertObject:usingSortFunction:context:allowDuplicates:", v39, _MFCompareMailboxUids, 0, 1);
          }
          if (v38)
          {
            if ((v37 & 1) == 0) {
              goto LABEL_52;
            }
          }
          else
          {
            char v40 = [v39 hasChildren];
            if (v37) {
              char v41 = 0;
            }
            else {
              char v41 = v40;
            }
            if (v41)
            {
LABEL_52:
              if (!theArray) {
                theArray = CFArrayCreateMutable(0, 0, 0);
              }
              if (!v48) {
                CFArrayRef v48 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
              }
              CFArrayAppendValue(theArray, v38);
              CFArrayAppendValue(v48, v39);
            }
          }
        }
      }
    }
    if (Mutable) {
      CFDictionaryRemoveAllValues(Mutable);
    }
    v49 |= [(MailAccount *)self _cleanInboxDuplication:v32];
    if (v49) {
      [(MailAccount *)self _setChildren:v32 forMailboxUid:v52];
    }

    if (!theArray) {
      break;
    }
    CFIndex Count = CFArrayGetCount(theArray);
    CFArrayRef v9 = theArray;
  }
  while (Count > 0);
  uint64_t v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v43 postNotificationName:@"AccountMailboxListingDidLoad" object:0 userInfo:0];

  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v48) {
    CFRelease(v48);
  }
  if (theArray) {
    CFRelease(theArray);
  }

  return v49 & 1;
}

- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 existingMailboxUid:(id)a6 dictionary:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v13)
  {
    if (!v14)
    {
      id v17 = [(MailAccount *)self _copyMailboxWithParent:v12 name:v13 attributes:a5 dictionary:v15];
      goto LABEL_8;
    }
    objc_msgSend(v14, "setAttributes:", objc_msgSend(v14, "attributes") & 0xFFFFFE00 | a5 & 0x1FF);
LABEL_6:
    id v17 = v14;
LABEL_8:
    uint64_t v16 = v17;
    goto LABEL_9;
  }
  if (([v14 attributes] & 0x100) != 0) {
    goto LABEL_6;
  }
  uint64_t v16 = 0;
LABEL_9:

  return v16;
}

- (id)_copyMailboxWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 dictionary:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  long long v11 = [MFMailboxUid alloc];
  id v12 = [v10 objectForKeyedSubscript:@"MailboxExtraAttributes"];
  id v13 = [(MFMailboxUid *)v11 initWithName:v9 attributes:a5 forAccount:self extraAttributes:v12];

  return v13;
}

- (BOOL)_cleanInboxDuplication:(id)a3
{
  return 0;
}

- (MailAccount)initWithPath:(id)a3
{
  return [(MailAccount *)self initWithLibrary:0 path:a3];
}

- (MailAccount)initWithLibrary:(id)a3 path:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFRange v8 = [(MailAccount *)self initWithLibrary:v6 persistentAccount:0];
  id v9 = v8;
  if (v8) {
    [(MailAccount *)v8 _setPath:v7];
  }

  return v9;
}

- (BOOL)_setPath:(id)a3
{
  id v4 = a3;
  if (v4 && ![(NSString *)self->_path isEqualToString:v4])
  {
    id v6 = (NSString *)[v4 copy];
    path = self->_path;
    self->_path = v6;

    +[MailAccount lockMailAccount];
    CFArrayRef v8 = (const __CFArray *)_accountsSortedByPath;
    if (!_accountsSortedByPath
      || (v10.length = CFArrayGetCount((CFArrayRef)_accountsSortedByPath),
          v10.locatiouint64_t n = 0,
          CFArrayGetFirstIndexOfValue(v8, v10, self) != -1))
    {
      [(id)objc_opt_class() _removeAccountFromSortedPaths:self];
      [(id)objc_opt_class() _addAccountToSortedPaths:self];
    }
    +[MailAccount unlockMailAccount];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)defaultPath
{
  uint64_t v3 = [(MFAccount *)self personaIdentifier];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F60BA0];
    BOOL v5 = [(MFAccount *)self personaIdentifier];
    uint64_t v6 = [v4 baseAccountDirectoryPathForPersonaIdentifier:v5];

    id v7 = (void *)v6;
  }
  else
  {
    id v7 = [(id)objc_opt_class() defaultAccountDirectory];
  }
  CFArrayRef v8 = [(MFAccount *)self uniqueID];
  id v9 = [v7 stringByAppendingPathComponent:v8];

  CFRange v10 = objc_msgSend(v9, "mf_betterStringByResolvingSymlinksInPath");

  return (NSString *)v10;
}

+ (id)defaultAccountDirectory
{
  if (defaultAccountDirectory_sOnceToken != -1) {
    dispatch_once(&defaultAccountDirectory_sOnceToken, &__block_literal_global_193);
  }
  uint64_t v2 = (void *)defaultAccountDirectory_sMailAccountDirectory;
  return v2;
}

id __42__MailAccount_copyReceivingEmailAddresses__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 emailAddressValue];
  id v4 = [v3 simpleAddress];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 stringValue];
  }
  id v7 = v6;

  return v7;
}

id __34__MailAccount_emailAddressStrings__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 emailAddressValue];
  id v4 = [v3 simpleAddress];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 stringValue];
  }
  id v7 = v6;

  return v7;
}

+ (id)mailboxUidFromActiveAccountsForURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = cachedMailboxUIDs();
    BOOL v5 = [v4 objectForKey:v3];

    if (v5)
    {
      id v6 = v5;
    }
    else
    {
      CFRange v10 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
      long long v11 = +[MailAccount infoForURL:v10];

      id v12 = [v11 objectForKeyedSubscript:@"Account"];
      id v13 = [v12 mailboxUidForInfo:v11];
      if (v13)
      {
        id v14 = +[MailAccount log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          +[MailAccount mailboxUidFromActiveAccountsForURL:]((uint64_t)v3, v14);
        }

        id v15 = cachedMailboxUIDs();
        uint64_t v16 = (void *)[v3 copy];
        [v15 setObject:v13 forKey:v16];
      }
      id v6 = v13;
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F60D20] sharedReporter];
    CFArrayRef v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 reportIssueType:v9 description:@"Account URL is nil"];

    id v6 = 0;
  }

  return v6;
}

+ (MailAccount)accountWithURLString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v4];
    id v6 = [a1 accountWithURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (MailAccount *)v6;
}

id __49__MailAccount_initWithLibrary_persistentAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = [v3 account];
  id v6 = objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "storeClassForMailbox:", v3)), "initWithMailbox:readOnly:", v3, 0);
  id v7 = [WeakRetained library];
  [v6 setLibrary:v7];

  return v6;
}

- (Class)storeClassForMailbox:(id)a3
{
  id v3 = [(MailAccount *)self storeClass];
  return (Class)v3;
}

- (MailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MailAccount;
  CFArrayRef v8 = [(MFAccount *)&v28 initWithPersistentAccount:v7];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"CachedMailboxenLock" andDelegate:v8];
    cachedMailboxenLocuint64_t k = v8->_cachedMailboxenLock;
    v8->_cachedMailboxenLocuint64_t k = (MFLock *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"MailAccountDeletionLock" andDelegate:0];
    deletionLocuint64_t k = v8->_deletionLock;
    v8->_deletionLocuint64_t k = (MFLock *)v11;

    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v8 selector:sel_deliveryAccountWillBeRemoved_ name:@"DeliveryAccountWillBeRemoved" object:0];

    if (v6) {
      [(MailAccount *)v8 setLibrary:v6];
    }
    else {
      [(MailAccount *)v8 setupLibrary];
    }
    locatiouint64_t n = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    id v14 = [MFWeakObjectCache alloc];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    char v24 = __49__MailAccount_initWithLibrary_persistentAccount___block_invoke;
    v25 = &unk_1E5D3C120;
    objc_copyWeak(&v26, &location);
    uint64_t v15 = [(MFWeakObjectCache *)v14 initWithBlock:&v22];
    messageStoresCache = v8->_messageStoresCache;
    v8->_messageStoresCache = (MFWeakObjectCache *)v15;

    id v17 = [MFLocalActionReplayHandler alloc];
    uint64_t v18 = [(MailAccount *)v8 library];
    uint64_t v19 = [(MFLocalActionReplayHandler *)v17 initWithLibrary:v18 account:v8];
    replayHandler = v8->_replayHandler;
    v8->_replayHandler = (MFLocalActionReplayHandler *)v19;

    v8->_flagsLock._os_unfair_lock_opaque = 0;
    [(MailAccount *)v8 _registerStateCaptureHandler];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (id)library
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  library = self->_library;
  if (!library)
  {
    id v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      uint64_t v7 = objc_opt_class();
      __int16 v8 = 2048;
      uint64_t v9 = self;
      _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "#Warning <%@ %p>: no library!", (uint8_t *)&v6, 0x16u);
    }

    library = self->_library;
  }
  return library;
}

- (void)setupLibrary
{
  if (+[MFMailMessageLibrary canUsePersistence])
  {
    id v3 = +[MFMailMessageLibrary defaultInstance];
    -[MailAccount setLibrary:](self, "setLibrary:");
  }
}

- (void)_registerStateCaptureHandler
{
  locatiouint64_t n = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = [(MailAccount *)self stateCaptureTitle];
  id v4 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v7, &location);
  uint64_t v5 = EFLogRegisterStateCaptureBlock();
  int v6 = (void *)_stateCancelable;
  _stateCancelable = v5;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

+ (id)_loadAllAccountsWithError:(id *)a3
{
  v31[6] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = *MEMORY[0x1E4F17740];
  v31[0] = *MEMORY[0x1E4F17830];
  v31[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F177C0];
  v31[2] = *MEMORY[0x1E4F17878];
  v31[3] = v6;
  uint64_t v7 = *MEMORY[0x1E4F177F0];
  v31[4] = *MEMORY[0x1E4F177E8];
  v31[5] = v7;
  __int16 v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:6];
  [v23 addObjectsFromArray:v8];

  if ([v23 count])
  {
    uint64_t v9 = +[MFAccountStore sharedAccountStore];
    id v29 = 0;
    uint64_t v10 = [v9 accountsWithTypeIdentifiers:v23 error:&v29];
    id v11 = v29;

    if (v10) {
      [v4 addObjectsFromArray:v10];
    }
    if (v11) {
      id v12 = v11;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v28 = 0;
  id v13 = [a1 _loadDataAccessAccountsWithError:&v28];
  id v22 = v28;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v19 = [a1 existingDAMailAccountForDAAccount:v18];
        if (v19
          || (uint64_t v19 = [[DAMailAccount alloc] initWithDAAccount:v18]) != 0)
        {
          [v4 addObject:v19];
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v15);
  }

  if (!v22 || v11)
  {
    if (!v11)
    {
      [a1 _removeLookAsideValuesNotInAccountList:v4];
      id v11 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    id v11 = v22;
  }
  if (a3)
  {
    id v11 = v11;
    *a3 = v11;
  }
LABEL_25:

  return v4;
}

- (void)forceFetchMailboxListWithKind:(int64_t)a3
{
  if (+[MFMailMessageLibrary canUsePersistence])
  {
    id v7 = +[MFInvocationQueue sharedInvocationQueue];
    uint64_t v5 = +[NSInvocation mf_invocationWithSelector:sel_resetMailboxTimer target:self];
    [v7 addInvocation:v5];

    if (a3)
    {
      if (a3 != 1) {
        return;
      }
      id v8 = +[MFInvocationQueue sharedInvocationQueue];
      uint64_t v6 = +[NSInvocation mf_invocationWithSelector:sel_fetchMailboxListExplicit target:self];
      [v8 addInvocation:v6];
    }
    else
    {
      id v8 = +[MFInvocationQueue sharedInvocationQueue];
      uint64_t v6 = +[NSInvocation mf_invocationWithSelector:sel_fetchMailboxListImplicit target:self];
      [v8 addInvocation:v6];
    }
  }
}

- (void)_writeMailboxCacheWithPrejudice:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(void))a4;
  os_unfair_lock_lock(&self->_flagsLock);
  $A328ED5E44AECF0F4A7A4FD34A0E6BE2 flags = self->_flags;
  os_unfair_lock_unlock(&self->_flagsLock);
  BOOL v8 = +[MFMailMessageLibrary canUsePersistence];
  int v9 = (*(unsigned int *)&flags >> 17) & 1;
  if ((*(_WORD *)&flags & 0xFFFEu) <= 9) {
    int v9 = 0;
  }
  if (v8 & (v4 | v9))
  {
    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v11 = [(MailAccount *)self path];
    char v12 = [v10 fileExistsAtPath:v11];

    if ((v12 & 1) == 0)
    {
      id v13 = [(MailAccount *)self path];
      objc_msgSend(v13, "mf_makeDirectoryWithMode:", 448);
    }
    uint64_t v14 = [(MailAccount *)self mailboxCachePath];
    [(MailAccount *)self mf_lock];
    id v28 = (void *)v14;
    id v29 = [(MFMailboxUid *)self->_rootMailboxUid children];
    uint64_t v15 = [v29 count];
    if (v15)
    {
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v17 = v29;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v37 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
            [v16 addObject:v21];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v18);
      }

      id v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      CFDictionarySetValue(v22, @"mboxes", v16);
      if ([(MailAccount *)self _writeCustomInfoToMailboxCache:v22])
      {
        uint64_t v23 = +[MFMailboxPersistence_iOS mailboxCacheQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __65__MailAccount__writeMailboxCacheWithPrejudice_completionHandler___block_invoke;
        block[3] = &unk_1E5D3C290;
        uint64_t v31 = v22;
        uint64_t v35 = v15;
        id v32 = v28;
        uint64_t v33 = self;
        uint64_t v34 = v6;
        dispatch_async(v23, block);

        int v24 = 1;
      }
      else
      {
        long long v26 = MFLogGeneral();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[MailAccount _writeMailboxCacheWithPrejudice:completionHandler:]();
        }

        if (v6) {
          v6[2](v6);
        }
        int v24 = 0;
      }
    }
    else
    {
      if (v6) {
        v6[2](v6);
      }
      int v24 = 1;
    }

    BOOL v27 = v24 != 0;
    long long v25 = v28;
    [(MailAccount *)self mf_unlock];
    if (v27)
    {
      os_unfair_lock_lock(&self->_flagsLock);
      self->_$A328ED5E44AECF0F4A7A4FD34A0E6BE2 flags = ($A328ED5E44AECF0F4A7A4FD34A0E6BE2)(*((unsigned __int16 *)&self->_flags + 1) << 16);
      os_unfair_lock_unlock(&self->_flagsLock);
    }
    else
    {
      [(MailAccount *)self _repairMailboxCache];
    }
  }
  else
  {
    if (v6) {
      v6[2](v6);
    }
    long long v25 = 0;
  }
}

- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MailAccount;
  [(MFAccount *)&v10 persistentAccountDidChange:v6 previousAccount:v7];
  if (v7)
  {
    BOOL v8 = [(MailAccount *)self isActiveWithPersistentAccount:v7];
    BOOL v9 = [(MailAccount *)self isActiveWithPersistentAccount:v6];
    if (v8 != v9) {
      [(MailAccount *)self _didBecomeActive:v9];
    }
    [(MailAccount *)self _invalidateCachedMailboxen];
  }
}

+ (id)existingAccountForUniqueID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  +[MailAccount lockMailAccount];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)_accounts;
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        BOOL v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        BOOL v9 = objc_msgSend(v8, "uniqueID", (void)v12);
        int v10 = [v9 isEqualToString:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  +[MailAccount unlockMailAccount];
  return v5;
}

+ (void)_removeLookAsideValuesNotInAccountList:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = MFUserAgent();
  char v5 = [v4 isMaild];

  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    id v7 = [v6 dictionaryForKey:@"com.apple.MailAccount-ExtProperties"];
    BOOL v8 = (void *)[v7 mutableCopy];

    BOOL v9 = [v8 allKeys];
    if ([v9 count])
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v11 = v3;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v19;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v11);
            }
            long long v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14), "identifier", (void)v18);
            [v10 addObject:v15];

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
        }
        while (v12);
      }

      uint64_t v16 = (void *)[v9 mutableCopy];
      [v16 removeObjectsInArray:v10];
      [v8 removeObjectsForKeys:v16];
      uint64_t v17 = MFLogGeneral();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v16;
        _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_INFO, "Removing lookaside properties for accounts with identifiers: %@", buf, 0xCu);
      }

      [v6 setObject:v8 forKey:@"com.apple.MailAccount-ExtProperties"];
      [v6 synchronize];
    }
  }
}

+ (id)_loadDataAccessAccountsWithError:(id *)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = sharedDAAccountStore();
  uint64_t v5 = *MEMORY[0x1E4F177D0];
  v19[0] = *MEMORY[0x1E4F17798];
  v19[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v7 = objc_msgSend(v4, "da_accountsWithAccountTypeIdentifiers:outError:", v6, a3);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    uint64_t v11 = *MEMORY[0x1E4F77E48];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "setSourceApplicationBundleIdentifier:", v11, (void)v14);
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v8;
}

- (id)stateCaptureTitle
{
  return @"mail-automation: MailAccount";
}

- (MailAccount)initWithPersistentAccount:(id)a3
{
  return [(MailAccount *)self initWithLibrary:0 persistentAccount:a3];
}

- (void)_invalidateCachedMailboxen
{
  [(MFLock *)self->_cachedMailboxenLock lock];
  draftsMailboxUid = self->_draftsMailboxUid;
  self->_draftsMailboxUid = 0;

  sentMessagesMailboxUid = self->_sentMessagesMailboxUid;
  self->_sentMessagesMailboxUid = 0;

  trashMailboxUid = self->_trashMailboxUid;
  self->_trashMailboxUid = 0;

  archiveMailboxUid = self->_archiveMailboxUid;
  self->_archiveMailboxUid = 0;

  junkMailboxUid = self->_junkMailboxUid;
  self->_junkMailboxUid = 0;

  [(MFLock *)self->_cachedMailboxenLock unlock];
  [(MailAccount *)self setCacheHasBeenRead:0];
}

+ (void)initialize
{
  if (!_accountsSortedByPath)
  {
    _accountsSortedByPath = (uint64_t)CFArrayCreateMutable(0, 0, 0);
    _sortedAccountPaths = (uint64_t)CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  }
}

void __46__MailAccount_performOnAccounts_accountBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)performOnAccounts:(id)a3 accountBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__MailAccount_performOnAccounts_accountBlock___block_invoke;
  v10[3] = &unk_1E5D3C268;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [a1 _postMailboxListNotificationAfterBlock:v10];
}

- (BOOL)_resetSpecialMailboxesCanPost:(BOOL)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v5 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__MailAccount__resetSpecialMailboxesCanPost___block_invoke;
  void v8[3] = &unk_1E5D3C218;
  v8[4] = self;
  v8[5] = &v10;
  BOOL v9 = a3;
  [v5 _postMailboxListNotificationAfterBlock:v8];
  char v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (id)iconString
{
  uint64_t v3 = [(MFAccount *)self accountPropertyForKey:@"AccountIcon"];
  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = @"otherAccountIcon";
  }
  uint64_t v5 = [(MFAccount *)self baseAccount];
  int v6 = [v5 isAppleEmployeeAccount];

  if (v6)
  {

    id v4 = @"appleAccountIcon";
  }
  return v4;
}

- (id)defaultEmailAddress
{
  return [(MFAccount *)self _objectForAccountInfoKey:@"defaultAddress"];
}

- (BOOL)supportsPurge
{
  return 1;
}

void __18__MailAccount_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;
}

- (BOOL)shouldArchiveByDefault
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(MailAccount *)self supportsArchiving])
  {
    BOOL v3 = [(MFAccount *)self _BOOLForAccountInfoKey:@"ArchiveMessages" defaultValue:0];
    id v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [(MFAccount *)self ef_publicDescription];
      [(MailAccount *)v5 shouldArchiveByDefault];
    }
  }
  else
  {
    id v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(MFAccount *)self ef_publicDescription];
      int v8 = 138543362;
      BOOL v9 = v6;
      _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: shouldArchiveByDefault: Account does not support archiving", (uint8_t *)&v8, 0xCu);
    }
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)supportsArchiving
{
  return 1;
}

BOOL __29__MailAccount_reloadAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [v2 path];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)releaseAllConnections
{
  id v2 = [(MailAccount *)self _deliveryAccountCreateIfNeeded:0];
  [v2 releaseAllConnections];
}

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(MFAccount *)self _objectForAccountInfoKey:@"SMTPIdentifier"];
  if (v4)
  {
    if (v3) {
      +[DeliveryAccount accountWithIdentifier:v4];
    }
    else {
    uint64_t v5 = +[DeliveryAccount existingAccountWithIdentifier:v4];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id __42__MailAccount_copyReceivingEmailAddresses__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "mf_emailAddressesWithEquivalentDomains");
  return v2;
}

- (BOOL)sourceIsManaged
{
  if ([MEMORY[0x1E4F602E0] preferenceEnabled:6]) {
    return 1;
  }
  BOOL v4 = [(MFAccount *)self persistentAccount];
  BOOL v3 = +[MFAccount accountSourceIsManaged:v4];

  return v3;
}

void __38__MailAccount_defaultAccountDirectory__block_invoke()
{
  id v2 = [MEMORY[0x1E4F60410] mailAccountDirectory];
  uint64_t v0 = [v2 path];
  os_log_t v1 = (void *)defaultAccountDirectory_sMailAccountDirectory;
  defaultAccountDirectory_sMailAccountDirectory = v0;
}

- (id)storeForMailboxUid:(id)a3
{
  BOOL v4 = (MFMailboxUid *)a3;
  uint64_t v5 = v4;
  if (!v4 || self->_rootMailboxUid == v4)
  {
    int v6 = 0;
  }
  else
  {
    int v6 = [(MFWeakObjectCache *)self->_messageStoresCache objectForKey:v4];
  }

  return v6;
}

- (id)URLForMessage:(id)a3
{
  return 0;
}

+ (id)existingDAMailAccountForDAAccount:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  +[MailAccount lockMailAccount];
  BOOL v4 = [v3 accountID];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)_accounts;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(id *)(*((void *)&v13 + 1) + 8 * v8);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = objc_msgSend(v9, "uniqueID", (void)v13);
        char v11 = [v10 isEqual:v4];

        if (v11) {
          break;
        }
      }

      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v9 = 0;
  }

  +[MailAccount unlockMailAccount];
  [v9 setDAAccount:v3];

  return v9;
}

+ (id)lastMailAccountsReloadDate
{
  +[MailAccount lockMailAccount];
  id v2 = (id)_lastAccountsReloadDate;
  +[MailAccount unlockMailAccount];
  return v2;
}

+ (void)setMailAccounts:(id)a3
{
}

+ (void)setMailAccounts:(id)a3 saveIfChanged:(BOOL)a4
{
}

uint64_t __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removePersistentAccount];
}

uint64_t __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) savePersistentAccount];
}

uint64_t __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) savePersistentAccount];
}

+ (void)_removeAccountFromSortedPaths:(id)a3
{
  id v5 = a3;
  if (_accountsSortedByPath)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)_accountsSortedByPath);
    if (Count)
    {
      CFIndex v4 = Count - 1;
      do
      {
        if (CFArrayGetValueAtIndex((CFArrayRef)_accountsSortedByPath, v4) == v5)
        {
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)_accountsSortedByPath, v4);
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)_sortedAccountPaths, v4);
        }
        --v4;
      }
      while (v4 != -1);
    }
  }
}

+ (id)purgeableAccounts
{
  id v2 = +[MailAccount mailAccounts];
  id v3 = objc_msgSend(v2, "ef_filter:", &__block_literal_global_136);

  return v3;
}

uint64_t __32__MailAccount_purgeableAccounts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsPurge];
}

+ (id)existingAccountWithType:(id)a3 hostname:(id)a4 username:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v11 = objc_msgSend(a1, "mailAccounts", 0);
  id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v15 isEquivalentTo:v8 hostname:v9 username:v10])
        {
          id v12 = v15;
          goto LABEL_11;
        }
      }
      id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v12;
}

- (BOOL)isEquivalentTo:(id)a3 hostname:(id)a4 username:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(MailAccount *)self isAccountClassEquivalentTo:v8]
     && [(MailAccount *)self isHostnameEquivalentTo:v9]
     && [(MailAccount *)self isUsernameEquivalentTo:v10];

  return v11;
}

- (BOOL)isUsernameEquivalentTo:(id)a3
{
  id v4 = a3;
  id v5 = [(MFAccount *)self username];
  if (v5 == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v6 = [(MFAccount *)self username];
    BOOL v7 = [v4 compare:v6 options:1] == 0;
  }
  return v7;
}

+ (id)_accountContainingEmailAddress:(id)a3 matchingAddress:(id *)a4 fullUserName:(id *)a5 includingInactive:(BOOL)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = objc_msgSend(v6, "emailAddressValue", v6);
  id v8 = [v7 simpleAddress];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v6 stringValue];
  }
  BOOL v11 = v10;

  id v33 = v6;
  id v12 = [v33 emailAddressValue];
  uint64_t v13 = [v12 displayName];
  long long v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [v33 stringValue];
  }
  long long v16 = v15;

  if (([v16 isEqualToString:&stru_1EFF11268] & 1) != 0
    || [v16 isEqualToString:v33])
  {

    long long v16 = 0;
  }
  +[MailAccount lockMailAccount];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = (id)_accounts;
  uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  id v18 = 0;
  if (v17)
  {
    uint64_t v41 = 0;
    uint64_t v36 = *(void *)v47;
LABEL_12:
    uint64_t v38 = 0;
    uint64_t v35 = v17;
    while (1)
    {
      if (*(void *)v47 != v36) {
        objc_enumerationMutation(obj);
      }
      long long v19 = *(void **)(*((void *)&v46 + 1) + 8 * v38);
      if (a6 || [*(id *)(*((void *)&v46 + 1) + 8 * v38) isActive])
      {
        long long v20 = [v19 emailAddressesAndAliasesList];
        long long v21 = objc_msgSend(v20, "ef_map:", &__block_literal_global_143);

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v43;
          while (2)
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v43 != v24) {
                objc_enumerationMutation(v22);
              }
              long long v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              if (![v26 caseInsensitiveCompare:v11])
              {
                uint64_t v27 = [v19 fullUserName];
                id v28 = (void *)v27;
                if (v16 && (!v27 || [v16 caseInsensitiveCompare:v27]))
                {
                  id v29 = v19;

                  uint64_t v41 = v29;
                }
                else
                {
                  if (a4) {
                    *a4 = v26;
                  }
                  if (a5 && v28 && ([v28 isEqualToString:&stru_1EFF11268] & 1) == 0) {
                    *a5 = v28;
                  }
                  id v30 = v19;

                  if ([v30 isActive])
                  {

                    id v18 = v30;
                    goto LABEL_40;
                  }
                  id v18 = v30;
                }
              }
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v50 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }
LABEL_40:
      }
      if ([v18 isActive]) {
        break;
      }
      if (++v38 == v35)
      {
        uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v17) {
          goto LABEL_12;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v41 = 0;
  }

  +[MailAccount unlockMailAccount];
  if (!v18 && v41) {
    id v18 = v41;
  }
  id v31 = v18;

  return v31;
}

id __93__MailAccount__accountContainingEmailAddress_matchingAddress_fullUserName_includingInactive___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 emailAddressValue];
  id v4 = [v3 simpleAddress];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 stringValue];
  }
  BOOL v7 = v6;

  return v7;
}

+ (id)accountContainingEmailAddress:(id)a3 includingInactive:(BOOL)a4
{
  id v4 = [a1 _accountContainingEmailAddress:a3 matchingAddress:0 fullUserName:0 includingInactive:a4];
  return v4;
}

+ (id)accountContainingEmailAddress:(id)a3
{
  id v3 = [a1 _accountContainingEmailAddress:a3 matchingAddress:0 fullUserName:0 includingInactive:0];
  return v3;
}

+ (id)accountForHeaders:(id)a3 message:(id)a4 includingInactive:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void *)[a3 copyAddressListForResentFrom];
  id v9 = [v8 firstObject];
  id v10 = v9;
  if (!v9
    || ([v9 isEqualToString:&stru_1EFF11268] & 1) != 0
    || (+[MailAccount accountContainingEmailAddress:v10 includingInactive:v5], (BOOL v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    [v7 senders];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
LABEL_6:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        BOOL v11 = +[MailAccount accountContainingEmailAddress:includingInactive:](MailAccount, "accountContainingEmailAddress:includingInactive:", *(void *)(*((void *)&v17 + 1) + 8 * v15), v5, (void)v17);
        if (v11) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v13) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      BOOL v11 = 0;
    }
  }
  return v11;
}

+ (id)accountThatMessageIsFrom:(id)a3 includingInactive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 headersIfAvailable];
  id v8 = [a1 accountForHeaders:v7 message:v6 includingInactive:v4];

  return v8;
}

+ (id)accountThatMessageIsFrom:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 headersIfAvailable];
  id v6 = [a1 accountForHeaders:v5 message:v4 includingInactive:0];

  return v6;
}

+ (id)addressesThatReceivedMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v21 = [a3 headersIfAvailable];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [MEMORY[0x1E4F1CA48] array];
  BOOL v5 = (void *)[v21 copyAddressListForTo];
  [v22 addObjectsFromArray:v5];
  uint64_t v6 = [v21 copyAddressListForCc];

  [v22 addObjectsFromArray:v6];
  long long v20 = (void *)v6;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v22;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v23 + 1) + 8 * i);
        id v12 = [v11 emailAddressValue];
        uint64_t v13 = [v12 simpleAddress];
        uint64_t v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [v11 stringValue];
        }
        long long v16 = v15;

        long long v17 = [a1 _accountContainingEmailAddress:v16 matchingAddress:0 fullUserName:0 includingInactive:0];
        BOOL v18 = v17 == 0;

        if (!v18) {
          [v4 addObject:v16];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (id)outboxMailboxUid
{
  +[MailAccount lockMailAccount];
  id v3 = +[LocalAccount localAccount];
  id v4 = (id)_outboxUid;
  if ([v4 isValid])
  {
    if (v4) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v5 = [v3 mailboxUidForRelativePath:@"Outbox" create:1];
  if (v5)
  {
    [a1 _setOutboxMailboxUid:v5];
    id v4 = (id)v5;
    [v3 resetSpecialMailboxes];
  }
  else
  {
    id v4 = 0;
  }
LABEL_8:
  +[MailAccount unlockMailAccount];

  return v4;
}

+ (id)outboxMessageStore:(BOOL)a3
{
  id v4 = +[LocalAccount localAccount];
  uint64_t v5 = [a1 outboxMailboxUid];
  uint64_t v6 = v5;
  if (v5 && [v5 isValid])
  {
    id v7 = [v4 storeForMailboxUid:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)allMailboxUids
{
  id v2 = +[MailAccount mailAccounts];
  id v3 = +[MailAccount allMailboxUidsForAccounts:v2];

  return v3;
}

+ (id)allPurgeableMailboxUids
{
  id v2 = +[MailAccount purgeableAccounts];
  id v3 = +[MailAccount allMailboxUidsForAccounts:v2];

  return v3;
}

+ (id)allMailboxUidsForAccounts:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "rootMailbox", (void)v14);
        if (v10) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  id v11 = v6;
  while (1)
  {

    if (![v5 count]) {
      break;
    }
    id v11 = [v5 lastObject];
    id v12 = (void *)[v11 mutableCopyOfChildren];
    [v4 addObjectsFromArray:v12];
    [v5 removeLastObject];
    [v5 addObjectsFromArray:v12];
  }
  return v4;
}

+ (id)allActivePrimaryMailboxUids
{
  id v2 = [a1 activeAccounts];
  id v3 = objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_149);

  return v3;
}

id __42__MailAccount_allActivePrimaryMailboxUids__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 primaryMailboxUid];
  return v2;
}

+ (MailAccount)accountWithPath:(id)a3
{
  id v3 = accountWithPathTryResolvingSymlinks(a3, 1);
  return (MailAccount *)v3;
}

+ (id)newAccountWithPath:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = accountWithPathTryResolvingSymlinks(v3, 0);
    if (!v4)
    {
      uint64_t v5 = objc_msgSend(v3, "mf_betterStringByResolvingSymlinksInPath");

      id v4 = accountWithPathTryResolvingSymlinks(v5, 0);
      if (!v4) {
        id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPath:v5];
      }
      id v3 = v5;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  [(id)_stateCancelable cancel];
  v3.receiver = self;
  v3.super_class = (Class)MailAccount;
  [(MailAccount *)&v3 dealloc];
}

- (void)test_setTaskManager:(id)a3
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MailAccount.m", 873, @"%s can only be called from unit tests", "-[MailAccount test_setTaskManager:]");
  }
  messageStoresCache = self->_messageStoresCache;
  [(MFWeakObjectCache *)messageStoresCache removeAllObjects];
}

+ (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"MailAccount.m", 879, @"%s can only be called from unit tests", "+[MailAccount test_tearDown]");
  }
  uint64_t v5 = mailAccountQueue();
  dispatch_sync(v5, &__block_literal_global_158);
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MailAccount.m", 886, @"%s can only be called from unit tests", "-[MailAccount test_tearDown]");
  }
  [(MailAccount *)self test_setTaskManager:0];
}

- (void)_setAccountProperties:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MailAccount;
  [(MFAccount *)&v6 _setAccountProperties:v4];
  uint64_t v5 = [v4 objectForKey:@"SMTPAlternateIdentifiers"];

  if (!v5) {
    [(MFAccount *)self removeAccountPropertyForKey:@"SMTPAlternateIdentifiers"];
  }
}

+ (id)newAccountWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"AccountPath"];
  objc_super v6 = objc_msgSend(v5, "mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath");
  id v7 = (id)[a1 newAccountWithPath:v6];
  if (v7 || (id v7 = objc_alloc_init((Class)a1)) != 0)
  {
    if (v6 && ([v5 isEqualToString:v6] & 1) == 0)
    {
      uint64_t v8 = (void *)[v4 mutableCopy];
      [v8 setObject:v6 forKey:@"AccountPath"];
    }
    else
    {
      uint64_t v8 = v4;
    }
    id v4 = v8;
    [v7 _setAccountProperties:v8];
  }

  return v7;
}

+ (id)legacyPathForAccountIdentifier:(id)a3 withHostname:(id)a4 username:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [a1 defaultAccountDirectory];
  id v10 = [a1 legacyPathNameForAccountWithHostname:v7 username:v8];
  id v11 = [v9 stringByAppendingPathComponent:v10];
  id v12 = objc_msgSend(v11, "mf_betterStringByResolvingSymlinksInPath");

  return v12;
}

+ (id)legacyPathNameForAccountWithHostname:(id)a3 username:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSString;
  uint64_t v9 = [a1 accountTypeString];
  id v10 = [v8 stringWithFormat:@"%@-%@@%@", v9, v7, v6];

  return v10;
}

- (id)legacySQLExpressionToMatchAllMailboxes
{
  objc_super v3 = NSString;
  id v4 = [(MFAccount *)self username];
  uint64_t v5 = encodedURLComponent(v4);
  id v6 = [(MFAccount *)self hostname];
  id v7 = encodedURLComponent(v6);
  id v8 = [v3 stringWithFormat:@"%@@%@", v5, v7];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"url"];
  id v10 = [v9 contains:v8 caseSensitive:0];

  return v10;
}

- (id)URLStringFromLegacyURLString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [MEMORY[0x1E4F29088] componentsWithString:v4];
    [v5 setUser:0];
    [v5 setPort:0];
    id v6 = [(MFAccount *)self uniqueID];
    [v5 setHost:v6];

    id v7 = [v5 URL];
    id v8 = [v7 absoluteString];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)fullUserName
{
  return [(MFAccount *)self _objectForAccountInfoKey:@"FullUserName"];
}

- (void)setFullUserName:(id)a3
{
  id v4 = (__CFString *)a3;
  uint64_t v5 = [(MailAccount *)self fullUserName];
  if ([(__CFString *)v4 length])
  {
    id v7 = [(__CFString *)v4 mf_stringWithNoExtraSpaces];
  }
  else
  {
    id v7 = v4;
  }
  if (v7 != v5)
  {
    id v6 = v5 ? v5 : &stru_1EFF11268;
    if (([(__CFString *)v7 isEqualToString:v6] & 1) == 0)
    {
      [(MailAccount *)self mf_lock];
      if (v7) {
        -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:");
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"FullUserName"];
      }
      [(MailAccount *)self mf_unlock];
    }
  }
}

+ (id)defaultMailAccountForDelivery
{
  return (id)[a1 _defaultMailAccountForDeliveryIncludingRestricted:1];
}

+ (id)defaultMailAccountForDeliveryExcludingRestricted
{
  return (id)[a1 _defaultMailAccountForDeliveryIncludingRestricted:0];
}

+ (id)_defaultMailAccountForDeliveryIncludingRestricted:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v6 = [v5 objectForKey:@"DefaultSendingAccount"];

  if ([v6 length])
  {
    id v7 = [a1 accountWithUniqueId:v6];
    if ([v7 isActive]
      && (a3 || ([v7 restrictedFromSendingExternally] & 1) == 0))
    {
      if (v7) {
        goto LABEL_20;
      }
    }
    else
    {
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = objc_msgSend(a1, "mailAccounts", 0);
  id v7 = (id)[v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v8);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          && [v11 isActive]
          && (a3 || ([v11 restrictedFromSendingExternally] & 1) == 0))
        {
          id v7 = v11;
          goto LABEL_19;
        }
      }
      id v7 = (id)[v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_19:

LABEL_20:
  return v7;
}

+ (id)defaultDeliveryAccount
{
  id v2 = [a1 defaultMailAccountForDelivery];
  objc_super v3 = [v2 deliveryAccount];

  return v3;
}

+ (BOOL)primaryDeliveryAccountIsDynamic
{
  return 0;
}

- (BOOL)isPrimaryDeliveryAccountDisabled
{
  return [(MFAccount *)self _BOOLForAccountInfoKey:@"SMTPDisabled" defaultValue:0];
}

- (void)setPrimaryDeliveryAccountDisabled:(BOOL)a3
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithBool:a3];
  [(MailAccount *)self mf_lock];
  [(MFAccount *)self setAccountProperty:v4 forKey:@"SMTPDisabled"];
  [(MailAccount *)self mf_unlock];
}

- (id)deliveryAccountAlternates
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [(MFAccount *)self _objectForAccountInfoKey:@"SMTPAlternateIdentifiers"];
  if (v2)
  {
    objc_super v3 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = +[DeliveryAccount accountWithIdentifier:](DeliveryAccount, "accountWithIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
          if (v8) {
            [v3 addObject:v8];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (void)setDeliveryAccount:(id)a3
{
  id v7 = a3;
  if (([(id)objc_opt_class() primaryDeliveryAccountIsDynamic] & 1) == 0)
  {
    id v4 = [(MFAccount *)self _objectForAccountInfoKey:@"SMTPIdentifier"];
    uint64_t v5 = [v7 identifier];
    uint64_t v6 = v5;
    if (!v4 || ([v5 isEqualToString:v4] & 1) == 0)
    {
      [(MailAccount *)self mf_lock];
      if (v6) {
        [(MFAccount *)self setAccountProperty:v6 forKey:@"SMTPIdentifier"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"SMTPIdentifier"];
      }
      [(MailAccount *)self mf_unlock];
    }
  }
}

- (void)setDeliveryAccountAlternates:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "identifier", (void)v12);
        if (v10) {
          [v5 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  long long v11 = [(MFAccount *)self _objectForAccountInfoKey:@"SMTPAlternateIdentifiers"];
  if (([v11 isEqual:v5] & 1) == 0)
  {
    [(MailAccount *)self mf_lock];
    if ([v5 count]) {
      [(MFAccount *)self setAccountProperty:v5 forKey:@"SMTPAlternateIdentifiers"];
    }
    else {
      [(MFAccount *)self removeAccountPropertyForKey:@"SMTPAlternateIdentifiers"];
    }
    [(MailAccount *)self mf_unlock];
  }
}

- (BOOL)canUseDeliveryAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MailAccount *)self deliveryAccount];
  char v6 = [v4 isEqual:v5];

  if (v6)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = [v4 identifier];
    uint64_t v9 = [(MFAccount *)self _objectForAccountInfoKey:@"SMTPAlternateIdentifiers"];
    char v7 = [v9 containsObject:v8];
  }
  return v7;
}

- (void)setCanUseCarrierDeliveryFallback:(BOOL)a3
{
  BOOL v3 = a3;
  [(MailAccount *)self mf_lock];
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [(MFAccount *)self setAccountProperty:v5 forKey:@"SMTPCarrierFallbackAllowed"];

  [(MailAccount *)self mf_unlock];
}

- (BOOL)canUseCarrierDeliveryFallback
{
  id v2 = [(MFAccount *)self _objectForAccountInfoKey:@"SMTPCarrierFallbackAllowed"];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (BOOL)isPredefinedAccountType
{
  return 0;
}

- (id)firstEmailAddress
{
  id v2 = [(MailAccount *)self emailAddressStrings];
  if ([v2 count])
  {
    char v3 = [v2 objectAtIndex:0];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)checkAndSetDefaultEmailAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MailAccount *)self defaultEmailAddress];
  char v6 = (void *)v5;
  if ((id)v5 == v4
    || (v5 ? (char v7 = (__CFString *)v5) : (char v7 = &stru_1EFF11268), ([v4 isEqualToString:v7] & 1) != 0))
  {
    BOOL v8 = 0;
  }
  else
  {
    [(MailAccount *)self mf_lock];
    if (v4) {
      [(MFAccount *)self setAccountProperty:v4 forKey:@"defaultAddress"];
    }
    else {
      [(MFAccount *)self removeAccountPropertyForKey:@"defaultAddress"];
    }
    [(MailAccount *)self mf_unlock];
    BOOL v8 = 1;
  }

  return v8;
}

void __59__MailAccount_updatePersonalStatusForAccounts_forceUpdate___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "#Warning Failed to get isPersonal status for %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "mf_lock");
    char v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    BOOL v8 = [MEMORY[0x1E4F28ED0] numberWithInt:a2 ^ 1u];
    [v7 setAccountProperty:v8 forKey:*MEMORY[0x1E4F60CB8]];

    uint64_t v9 = *(void **)(a1 + 48);
    objc_msgSend(v9, "mf_unlock");
  }
}

- (BOOL)checkAndSetEmailAddresses:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MailAccount *)self emailAddressesDictionary];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_13:
      id v13 = v4;
      id v9 = 0;
      goto LABEL_14;
    }
    id v6 = [v4 componentsSeparatedByString:@", "];
  }
  char v7 = v6;
  if (!v6) {
    goto LABEL_13;
  }
  BOOL v8 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    uint64_t v12 = MEMORY[0x1E4F1CC38];
    while (1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v9);
      }
      objc_msgSend(v8, "addObject:", v12, v18);
      if (!--v10)
      {
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v9];

LABEL_14:
  if (v5 == v13) {
    goto LABEL_20;
  }
  long long v14 = v5;
  if (!v5)
  {
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  char v15 = objc_msgSend(v13, "isEqual:", v14, v18);
  if (!v5) {

  }
  if (v15)
  {
LABEL_20:
    BOOL v16 = 0;
  }
  else
  {
    [(MailAccount *)self mf_lock];
    if (v13) {
      [(MFAccount *)self setAccountProperty:v13 forKey:@"EmailAddresses"];
    }
    else {
      [(MFAccount *)self removeAccountPropertyForKey:@"EmailAddresses"];
    }
    [(MailAccount *)self mf_unlock];
    BOOL v16 = 1;
  }

  return v16;
}

- (id)receiveEmailAliasAddresses
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [(MFAccount *)self _objectForAccountInfoKey:@"ReceiveEmailAliasAddresses"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      uint64_t v7 = MEMORY[0x1E4F1CC38];
      while (1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", v7, v10);
        if (!--v5)
        {
          uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (!v5) {
            break;
          }
        }
      }
    }

    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v4];

    id v2 = (void *)v8;
  }
  return v2;
}

- (BOOL)checkAndSetReceiveEmailAliasAddresses:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MailAccount *)self receiveEmailAliasAddresses];
  uint64_t v6 = (void *)v5;
  if (id)v5 == v4 || v5 && ([v4 isEqual:v5])
  {
    BOOL v7 = 0;
  }
  else
  {
    [(MailAccount *)self mf_lock];
    if (v4) {
      [(MFAccount *)self setAccountProperty:v4 forKey:@"ReceiveEmailAliasAddresses"];
    }
    else {
      [(MFAccount *)self removeAccountPropertyForKey:@"ReceiveEmailAliasAddresses"];
    }
    [(MailAccount *)self mf_unlock];
    BOOL v7 = 1;
  }

  return v7;
}

- (NSDate)lastEmailAliasesSyncDate
{
  id v2 = [(MFAccount *)self _objectForAccountInfoKey:@"LastEmailAliasesSyncDate"];
  char v3 = v2;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    [v2 doubleValue];
    uint64_t v5 = objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setLastEmailAliasesSyncDate:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
    [v4 timeIntervalSince1970];
    uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(MailAccount *)self mf_lock];
  [(MFAccount *)self setAccountProperty:v6 forKey:@"LastEmailAliasesSyncDate"];
  [(MailAccount *)self mf_unlock];
}

- (NSString)lastEmailAliasesSyncEntityTag
{
  id v2 = [(MFAccount *)self _objectForAccountInfoKey:@"LastEmailAliasesSyncEntityTag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setLastEmailAliasesSyncEntityTag:(id)a3
{
  id v4 = a3;
  [(MailAccount *)self mf_lock];
  [(MFAccount *)self setAccountProperty:v4 forKey:@"LastEmailAliasesSyncEntityTag"];
  [(MailAccount *)self mf_unlock];
}

- (id)emailAddressesAndAliases
{
  char v3 = [(MailAccount *)self emailAddressesDictionary];
  uint64_t v4 = [(MailAccount *)self receiveEmailAliasAddresses];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = (void *)v4;
    if (v3)
    {
      id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
      [v7 addEntriesFromDictionary:v5];
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  [(MailAccount *)self updateEmailAliasesIfNeeded];
  uint64_t v6 = v3;
  if (v3)
  {
LABEL_5:
    id v7 = v6;
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (NSString)smtpIdentifier
{
  id v2 = [(MailAccount *)self _deliveryAccountCreateIfNeeded:0];
  char v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 identifier];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)canAuthenticateWithCurrentCredentials
{
  return 0;
}

- (void)_invalidateAndDeleteAccountData:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() disableMailboxListingNotifications];
  [(MailAccount *)self releaseAllConnections];
  [(MFLock *)self->_deletionLock lock];
  _invalidateMailboxCache(self);
  [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:0 forType:7];
  [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:0 forType:4];
  [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:0 forType:3];
  [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:0 forType:5];
  [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:0 forType:2];
  [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:0 forType:1];
  uint64_t v5 = [(MailAccount *)self library];
  [v5 invalidateAccount:self];

  if (v3)
  {
    uint64_t v6 = [(MailAccount *)self allMailboxUids];
    uint64_t v7 = [v6 arrayByApplyingSelector:sel_URLString];

    uint64_t v27 = (void *)v7;
    uint64_t v8 = [(MailAccount *)self allLocalMailboxUids];
    uint64_t v28 = v8;
    id v9 = [(MailAccount *)self path];
    id v10 = (id)MFRemoveItemAtPath();

    long long v11 = [(MailAccount *)self library];
    [v11 deleteMailboxes:v7 account:self];

    if ([v8 count])
    {
      long long v12 = +[LocalAccount localAccount];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v13 = v8;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v34 != v15) {
              objc_enumerationMutation(v13);
            }
            [v12 deleteMailbox:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v14);
      }

      _invalidateMailboxCache(v12);
    }
    uint64_t v17 = +[MailAccount outboxMessageStore:1];
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v19 = (id)[v17 copyOfAllMessagesWithOptions:2048];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          long long v24 = +[MailAccount accountThatMessageIsFrom:v23];
          BOOL v25 = v24 == 0;

          if (v25) {
            [v18 addObject:v23];
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v20);
    }

    if ([v18 count])
    {
      [v17 deleteMessages:v18 moveToTrash:0];
      [v17 doCompact];
    }
    long long v26 = [(MailAccount *)self library];
    [v26 deleteAccount:self];

    [(MailAccount *)self _deleteHook];
    [(MFAccount *)self setPassword:0];
    [(MailAccount *)self deleteDeliveryAccountIfNeeded];
  }
  [(MFLock *)self->_deletionLock unlock];
  [(id)objc_opt_class() enableMailboxListingNotifications:1];
}

- (void)_asynchronouslyInvalidateAndDeleteAccountData:(BOOL)a3
{
  uint64_t v5 = mailAccountQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__MailAccount__asynchronouslyInvalidateAndDeleteAccountData___block_invoke;
  v6[3] = &unk_1E5D3B5E8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __61__MailAccount__asynchronouslyInvalidateAndDeleteAccountData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAndDeleteAccountData:*(unsigned __int8 *)(a1 + 40)];
}

- (void)invalidate
{
}

- (void)invalidateAndDelete
{
}

+ (void)saveStateForAllAccounts
{
  +[MailAccount lockMailAccount];
  id v2 = (id)[(id)_accounts copy];
  +[MailAccount unlockMailAccount];
  [v2 makeObjectsPerformSelector:sel_saveState withObject:0];
}

- (void)releaseAllForcedConnections
{
  id v2 = [(MailAccount *)self deliveryAccount];
  [v2 releaseAllForcedConnections];
}

- (void)_synchronizeMailboxListWithFileSystem
{
  BOOL v3 = [(MailAccount *)self _mailboxPathPrefix];
  uint64_t v4 = [(MailAccount *)self path];
  id v7 = (id)[v4 mutableCopyWithZone:0];

  if (v3 && [v3 length])
  {
    [v7 appendString:@"/"];
    uint64_t v5 = [(MailAccount *)self _mailboxPathPrefix];
    [v7 appendString:v5];
  }
  [(MailAccount *)self mf_lock];
  uint64_t v6 = [(MailAccount *)self rootMailbox];
  [(MailAccount *)self _loadEntriesFromFileSystemPath:v7 parent:v6];

  [(MailAccount *)self mf_unlock];
  os_unfair_lock_lock(&self->_flagsLock);
  *(_DWORD *)&self->_flags &= ~0x20000u;
  os_unfair_lock_unlock(&self->_flagsLock);
  [(MailAccount *)self _writeMailboxCacheWithPrejudice:1];
  [(MailAccount *)self resetSpecialMailboxes];
  [(MailAccount *)self emptyTrash];
}

- (id)allMailMailboxUid
{
  return 0;
}

- (void)deleteDeliveryAccountIfNeeded
{
  id v3 = [(MailAccount *)self _deliveryAccountCreateIfNeeded:0];
  if (v3 && ![(MailAccount *)self deliveryAccountInUseByOtherAccounts:v3]) {
    +[DeliveryAccount removeDeliveryAccount:v3];
  }
}

- (BOOL)deliveryAccountInUseByOtherAccounts:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 uniqueID];
  +[MailAccount lockMailAccount];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = (id)_accounts;
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v4)
  {
    char v21 = 0;
    uint64_t v23 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v7 = [v6 uniqueID];
        uint64_t v8 = [(MFAccount *)self uniqueID];
        BOOL v9 = v7 == v8;

        if (!v9)
        {
          id v10 = [v6 _deliveryAccountCreateIfNeeded:0];
          long long v11 = v10;
          if (v10)
          {
            long long v12 = [v10 uniqueID];
            int v13 = [v12 isEqualToString:v3];

            if (v13)
            {

              char v21 = 1;
              goto LABEL_25;
            }
          }
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v14 = [v6 deliveryAccountAlternates];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v26;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v26 != v16) {
                  objc_enumerationMutation(v14);
                }
                id v18 = [*(id *)(*((void *)&v25 + 1) + 8 * j) uniqueID];
                char v19 = [v18 isEqualToString:v3];

                if (v19)
                {
                  char v21 = 1;
                  goto LABEL_19;
                }
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
LABEL_19:
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v21 = 0;
  }
LABEL_25:

  +[MailAccount unlockMailAccount];
  return v21 & 1;
}

- (BOOL)isSpecialMailbox:(id)a3
{
  id v3 = a3;
  if ([v3 isStandardizedMailboxUid]) {
    LOBYTE(v4) = 1;
  }
  else {
    int v4 = [v3 isStore] ^ 1;
  }

  return v4;
}

- (id)mailboxForType:(int64_t)a3
{
  uint64_t v4 = mailboxUIDTypeFromECMailboxType(a3);
  return [(MailAccount *)self mailboxUidOfType:v4 createIfNeeded:1];
}

- (BOOL)containsMailboxWithURL:(id)a3
{
  uint64_t v4 = [a3 absoluteString];
  LOBYTE(self) = [(MailAccount *)self ownsMailboxUidWithURL:v4];

  return (char)self;
}

- (id)allMailboxUids
{
  return [(MailAccount *)self allMailboxesFilteringNotes:0];
}

- (id)allMailboxesFilteringNotes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [(MailAccount *)self rootMailbox];
  if (v7) {
    [v6 addObject:v7];
  }
  while ([v6 count])
  {
    uint64_t v8 = [v6 lastObject];
    BOOL v9 = v8;
    if (v3 && [v8 isNotesMailboxUid])
    {
      [v5 removeObject:v9];
      [v6 removeLastObject];
    }
    else
    {
      id v10 = (void *)[v9 mutableCopyOfChildren];
      [v5 addObjectsFromArray:v10];
      [v6 removeLastObject];
      [v6 addObjectsFromArray:v10];
    }
  }
  long long v11 = [(MailAccount *)self primaryMailboxUid];
  uint64_t v12 = [v5 indexOfObject:v11];

  if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 exchangeObjectAtIndex:0 withObjectAtIndex:v12];
  }

  return v5;
}

- (id)mailboxesForSuggestionsLostMessageSearchPriorToTime:(double)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MailAccount *)self allMailMailboxUid];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    v13[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    uint64_t v8 = [(MailAccount *)self allMailboxUids];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke;
    v12[3] = &__block_descriptor_40_e22_B16__0__MFMailboxUid_8l;
    *(double *)&v12[4] = a3;
    BOOL v9 = objc_msgSend(v8, "ef_filter:", v12);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke_2;
    _OWORD v11[3] = &__block_descriptor_40_e39_q24__0__MFMailboxUid_8__MFMailboxUid_16l;
    *(double *)&v11[4] = a3;
    id v7 = [v9 sortedArrayUsingComparator:v11];
  }
  return v7;
}

BOOL __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v6 = 0;
  if ([v3 mailboxType] != 3 && objc_msgSend(v3, "mailboxType") != 1)
  {
    if ([v3 isStore])
    {
      double v4 = *(double *)(a1 + 32);
      if (v4 == 0.0 || ([v3 suggestionsLostMessageSearchTimestamp], v4 >= v5)) {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

uint64_t __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(double *)(a1 + 32) != 0.0)
  {
    [v5 suggestionsLostMessageSearchTimestamp];
    double v8 = v7;
    [v6 suggestionsLostMessageSearchTimestamp];
    if (v8 < v9)
    {
      uint64_t v10 = -1;
      goto LABEL_10;
    }
    [v5 suggestionsLostMessageSearchTimestamp];
    double v12 = v11;
    [v6 suggestionsLostMessageSearchTimestamp];
    if (v12 > v13) {
      goto LABEL_6;
    }
  }
  unint64_t v14 = [v5 suggestionsLostMessageSearchResultCount];
  if (v14 > [v6 suggestionsLostMessageSearchResultCount])
  {
LABEL_6:
    uint64_t v10 = 1;
    goto LABEL_10;
  }
  unint64_t v15 = [v5 suggestionsLostMessageSearchResultCount];
  if (v15 >= [v6 suggestionsLostMessageSearchResultCount]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = -1;
  }
LABEL_10:

  return v10;
}

- (id)transferDisabledMailboxUids
{
  return 0;
}

- (void)deleteMessagesFromMailboxUid:(id)a3 olderThanNumberOfDays:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  id v6 = [v8 URLString];
  if (v6
    && [(MailAccount *)self isActive]
    && [(MailAccount *)self _canEmptyMessagesFromMailboxUid:v8])
  {
    double v7 = [(MailAccount *)self storeForMailboxUid:v8];
    [v7 deleteMessagesOlderThanNumberOfDays:v4 compact:1];
  }
}

- (void)_setEmptyFrequency:(int)a3 forKey:(id)a4
{
  id v6 = a4;
  id v5 = EFStringWithInt();
  [(MailAccount *)self mf_lock];
  [(MFAccount *)self setAccountProperty:v5 forKey:v6];
  [(MailAccount *)self mf_unlock];
}

- (int)emptyFrequencyForMailboxType:(int64_t)a3
{
  return [(MailAccount *)self _emptyFrequencyForKey:@"NumberOfDaysToKeepTrash" defaultValue:@"-1"];
}

- (void)setEmptyFrequency:(int)a3 forMailboxType:(int64_t)a4
{
}

+ (NSString)csAccountTypeString
{
  return (NSString *)(id)*MEMORY[0x1E4F22768];
}

- (void)resetSpecialMailboxes
{
}

+ (id)mailboxUidForFileSystemPath:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = 0;
  if (v5 && _sortedAccountPaths)
  {
    +[MailAccount lockMailAccount];
    CFIndex Count = CFArrayGetCount((CFArrayRef)_sortedAccountPaths);
    if (Count < 1)
    {
LABEL_8:
      uint64_t v10 = 0;
      double v9 = 0;
    }
    else
    {
      CFIndex v8 = 0;
      while (1)
      {
        double v9 = CFArrayGetValueAtIndex((CFArrayRef)_sortedAccountPaths, v8);
        if ((objc_msgSend(v5, "mf_isSubdirectoryOfPath:", v9) & 1) != 0
          || ([v5 isEqualToString:v9] & 1) != 0)
        {
          break;
        }

        if (Count == ++v8) {
          goto LABEL_8;
        }
      }
      if (!v9) {
        goto LABEL_16;
      }
      uint64_t v11 = [v5 rangeOfString:v9 options:8];
      uint64_t v13 = v12;
      uint64_t v14 = [v5 length];
      uint64_t v15 = v11 + v13;
      if (v15 != [v9 length]) {
        goto LABEL_16;
      }
      if (v15 == v14)
      {
        uint64_t v16 = 0;
      }
      else
      {
        if ([v5 characterAtIndex:v15] != 47)
        {
LABEL_16:
          uint64_t v10 = 0;
          goto LABEL_17;
        }
        uint64_t v14 = v15 + 1;
        uint64_t v16 = [v5 length] - (v15 + 1);
      }
      if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_16;
      }
      uint64_t v10 = CFArrayGetValueAtIndex((CFArrayRef)_accountsSortedByPath, v8);
      if (v10)
      {
        uint64_t v17 = objc_msgSend(v5, "substringWithRange:", v14, v16);
LABEL_18:
        +[MailAccount unlockMailAccount];
        if (v17)
        {
          id v6 = [v10 mailboxUidForRelativePath:v17 create:v4];
          if (v6)
          {
LABEL_24:

            goto LABEL_25;
          }
        }
        else
        {
          id v6 = 0;
        }
        if (Count >= 1)
        {
          id v18 = +[LocalAccount localAccount];
          id v6 = [v18 mailboxUidForFileSystemPath:v5];
        }
        goto LABEL_24;
      }
    }
LABEL_17:
    uint64_t v17 = 0;
    goto LABEL_18;
  }
LABEL_25:

  return v6;
}

- (NSString)mailboxPathExtension
{
  return (NSString *)&stru_1EFF11268;
}

- (BOOL)canCreateNewMailboxes
{
  return 1;
}

- (BOOL)newMailboxNameIsAcceptable:(id)a3 reasonForFailure:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 pathComponents];
  uint64_t v7 = [v6 count];

  if (a4)
  {
    if (v7 == 1)
    {
      *a4 = 0;
    }
    else
    {
      CFIndex v8 = NSString;
      double v9 = MFLookupLocalizedString(@"MAILBOX_NAME_INCLUDES_PATH_SEPARATOR", @"Mailbox names may not include “%@”.", @"Delayed");
      objc_msgSend(v8, "stringWithFormat:", v9, @"/");
      id v10 = objc_claimAutoreleasedReturnValue();
      *a4 = v10;
    }
  }

  return v7 == 1;
}

- (BOOL)canMailboxBeRenamed:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_rootMailboxUid])
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v6 = [v4 mailboxType];
    BOOL v5 = v6 == -100 || v6 == 0;
  }

  return v5;
}

- (BOOL)canMailboxBeDeleted:(id)a3
{
  return [a3 isEqual:self->_rootMailboxUid] ^ 1;
}

- (BOOL)moveMailbox:(id)a3 intoParent:(id)a4
{
  return [(MailAccount *)self renameMailbox:a3 newName:0 parent:a4];
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFIndex v8 = [v6 parent];
  LOBYTE(self) = [(MailAccount *)self renameMailbox:v6 newName:v7 parent:v8];

  return (char)self;
}

- (BOOL)_renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v57 = a4;
  id v64 = a5;
  long long v62 = v7;
  CFIndex v8 = [v7 fullPath];
  char v9 = [v7 attributes];
  long long v58 = [v7 parent];
  id v10 = +[MailAccount log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_msgSend(v62, "ef_publicDescription");
    uint64_t v12 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v57];
    *(_DWORD *)buf = 138543618;
    long long v73 = v11;
    __int16 v74 = 2114;
    long long v75 = v12;
    _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "Renaming mailbox %{public}@ newName: %{public}@", buf, 0x16u);
  }
  [(MailAccount *)self mf_lock];
  uint64_t v13 = [v62 depthFirstEnumerator];
  long long v61 = [v13 allObjects];

  id v55 = [v61 arrayByApplyingSelector:sel_URLString];
  if (v57)
  {
    uint64_t v14 = [(MailAccount *)self _uidNameForPathComponent:v57];
    [v62 setName:v14];
  }
  if (v64) {
    [v62 setParent:v64];
  }
  [v61 makeObjectsPerformSelector:sel_flushCriteria];
  id v56 = [v61 arrayByApplyingSelector:sel_URLString];
  uint64_t v15 = [v62 fullPath];
  uint64_t v16 = [v15 stringByDeletingLastPathComponent];
  v60 = objc_msgSend(v16, "ef_pathByReplacingRelativePathWithFolderName:", @"mbox");

  long long v63 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v63 fileExistsAtPath:v60] & 1) == 0
    && !objc_msgSend(v63, "mf_makeCompletePath:mode:", v60, 448))
  {
    goto LABEL_20;
  }
  if ([v63 fileExistsAtPath:v8])
  {
    uint64_t v17 = (const std::__fs::filesystem::path *)[v8 fileSystemRepresentation];
    id v18 = (const std::__fs::filesystem::path *)[v15 fileSystemRepresentation];
    rename(v17, v18, v19);
    BOOL v21 = v20 == 0;
  }
  else
  {
    BOOL v21 = 1;
  }
  id v22 = +[MailAccount log];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = objc_msgSend(v62, "ef_publicDescription");
    *(_DWORD *)buf = 138543618;
    long long v73 = v23;
    __int16 v74 = 1024;
    LODWORD(v75) = v21;
    _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "Renaming file at new path for mailbox %{public}@ result %d", buf, 0x12u);
  }
  if (!v21)
  {
LABEL_20:
    int v59 = 0;
LABEL_21:
    long long v66 = v8;
    goto LABEL_22;
  }
  long long v24 = [(MailAccount *)self library];
  int v59 = [v24 renameMailboxes:v55 to:v56];

  long long v25 = +[MailAccount log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    long long v26 = objc_msgSend(v61, "ef_mapSelector:", sel_ef_publicDescription);
    *(_DWORD *)buf = 138543618;
    long long v73 = v26;
    __int16 v74 = 1024;
    LODWORD(v75) = v59;
    _os_log_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_DEFAULT, "Renaming mailboxes in the database %{public}@ result %d", buf, 0x12u);
  }
  if ((v59 & ((v9 & 3) == 0)) != 1) {
    goto LABEL_21;
  }
  long long v27 = [v8 stringByDeletingPathExtension];

  if ([v63 fileExistsAtPath:v27])
  {
    long long v28 = (const std::__fs::filesystem::path *)[v27 fileSystemRepresentation];
    id v29 = [v15 stringByDeletingPathExtension];
    long long v30 = (const std::__fs::filesystem::path *)[v29 fileSystemRepresentation];
    rename(v28, v30, v31);
    int v59 = v32 == 0;
  }
  else
  {
    int v59 = 1;
  }
  id v53 = +[MailAccount log];
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    id v54 = objc_msgSend(v62, "ef_publicDescription");
    *(_DWORD *)buf = 138543618;
    long long v73 = v54;
    __int16 v74 = 1024;
    LODWORD(v75) = v59;
    _os_log_impl(&dword_1A7EFF000, v53, OS_LOG_TYPE_DEFAULT, "Renaming file that requires two renames at new path for mailbox %{public}@ result %d", buf, 0x12u);
  }
  long long v66 = v27;
LABEL_22:
  [(MailAccount *)self mf_unlock];
  if (v59)
  {
    long long v33 = 0;
  }
  else
  {
    long long v34 = NSString;
    uint64_t v35 = MFLookupLocalizedString(@"RENAME_FAILED", @"Mail was unable to rename “%@”.", @"Delayed");
    long long v36 = objc_msgSend(v66, "mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath");
    long long v37 = objc_msgSend(v34, "stringWithFormat:", v35, v36);
    long long v33 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1033 localizedDescription:v37];
  }
  uint64_t v38 = [v33 localizedDescription];

  if (v38)
  {
    uint64_t v39 = +[MFActivityMonitor currentMonitor];
    [v39 setError:v33];
  }
  if ((([v64 isEqual:v58] | v59 ^ 1) & 1) == 0
    && [(id)objc_opt_class() mailboxListingNotificationsAreEnabled])
  {
    char v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v41 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AccountMailboxListingDidChange" object:v58 userInfo:0];
    [v40 postNotification:v41];

    long long v42 = +[MailAccount log];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      long long v43 = objc_msgSend(v62, "ef_publicDescription");
      *(_DWORD *)buf = 138543362;
      long long v73 = v43;
      _os_log_impl(&dword_1A7EFF000, v42, OS_LOG_TYPE_DEFAULT, "Successfully renamed mailbox %{public}@", buf, 0xCu);
    }
  }
  if (v64
    && [(MailAccount *)self cacheHasBeenRead]
    && [(id)objc_opt_class() mailboxListingNotificationsAreEnabled])
  {
    long long v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v45 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AccountMailboxListingDidChange" object:v64 userInfo:0];
    [v44 postNotification:v45];
  }
  if (!v33)
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v46 = v61;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v67 objects:v71 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v68 != v48) {
            objc_enumerationMutation(v46);
          }
          uint64_t v50 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          id v51 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v51 postNotificationName:@"MFMailboxUidWasRenamedNotification" object:v50 userInfo:0];
        }
        uint64_t v47 = [v46 countByEnumeratingWithState:&v67 objects:v71 count:16];
      }
      while (v47);
    }
  }
  [(MailAccount *)self _synchronouslyLoadListingForParent:v64];
  if (([v64 isEqual:v58] & 1) == 0) {
    [(MailAccount *)self _synchronouslyLoadListingForParent:v58];
  }
  [(MailAccount *)self _writeMailboxCacheWithPrejudice:1];
  clearMailboxUIDCache();

  return v59;
}

- (BOOL)deleteMailbox:(id)a3
{
  return [(MailAccount *)self deleteMailbox:a3 reflectToServer:1];
}

- (BOOL)deleteMailbox:(id)a3 reflectToServer:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v6 = +[MailAccount log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_msgSend(v46, "ef_publicDescription");
    *(_DWORD *)buf = 67109378;
    BOOL v52 = v4;
    __int16 v53 = 2114;
    id v54 = v7;
    _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "Deleting mailbox (reflect to server = %d): %{public}@", buf, 0x12u);
  }
  CFIndex v8 = +[MFActivityMonitor currentMonitor];
  uint64_t v9 = [v46 mailboxType];
  long long v45 = [v46 fullPath];
  id v10 = [v46 depthFirstEnumerator];
  uint64_t v11 = [v10 nextObject];
  unint64_t v44 = v9;
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = 0;
  BOOL v13 = 1;
LABEL_4:
  uint64_t v14 = (void *)v12;
  while ((([v8 shouldCancel] ^ 1) & v13) == 1 && v11 != 0)
  {
    uint64_t v12 = [v11 parent];

    BOOL v13 = [(MailAccount *)self _deleteMailbox:v11 reflectToServer:v4];
    uint64_t v14 = (void *)v12;
    if (v13)
    {
      id v16 = v11;
      uint64_t v17 = [v16 URLString];
      BOOL v18 = v17 == 0;

      if (v18)
      {
        char v19 = +[MailAccount log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v20 = objc_msgSend(v16, "ef_publicDescription");
          [(MailAccount *)v20 deleteMailbox:&v52 reflectToServer:v19];
        }
      }
      BOOL v21 = [v16 URLString];
      objc_msgSend(v47, "ef_addOptionalObject:", v21);

      if (v10)
      {
        uint64_t v11 = [v10 nextObject];
      }
      else
      {
        uint64_t v11 = 0;
      }

      [(MailAccount *)self _incrementCacheDirtyCount];
      [v16 setParent:0];

      goto LABEL_4;
    }
  }
  if (v13)
  {
    id v22 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v22 fileExistsAtPath:v45])
    {
      uint64_t v23 = MFRemoveItemAtPath();
      BOOL v24 = v23 == 0;

      if (v24) {
        goto LABEL_24;
      }
      id v22 = MFLogGeneral();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long v49 = 138412290;
        uint64_t v50 = v45;
        _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_INFO, "failed to remove path %@", v49, 0xCu);
      }
    }
  }
LABEL_24:
  if ([v47 count])
  {
    long long v25 = [(MailAccount *)self library];
    [v25 deleteMailboxes:v47 account:self];
  }
  if (v13)
  {
    if (v44)
    {
      [(MFLock *)self->_cachedMailboxenLock lock];
      if (v44 <= 7 && ((0x5Fu >> (v44 - 1)) & 1) != 0)
      {
        uint64_t v26 = *off_1E5D3C310[v44 - 1];
        long long v27 = *(Class *)((char *)&self->super.super.isa + v26);
        *(Class *)((char *)&self->super.super.isa + v26) = 0;
      }
      [(MFLock *)self->_cachedMailboxenLock unlock];
    }
  }
  else
  {
    long long v28 = +[MFActivityMonitor currentMonitor];
    id v29 = [v28 error];
    BOOL v30 = v29 == 0;

    if (v30)
    {
      long long v31 = NSString;
      int v32 = MFLookupLocalizedString(@"DELETE_FAILED_FORMAT", @"Unable to delete “%@”.", @"Delayed");
      long long v33 = [v46 accountRelativePath];
      long long v34 = objc_msgSend(v31, "stringWithFormat:", v32, v33);

      uint64_t v35 = +[MFActivityMonitor currentMonitor];
      long long v36 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:v34];
      [v35 setError:v36];
    }
  }
  if (v14)
  {
    long long v37 = [(MailAccount *)self taskManager];

    if (v37)
    {
      [(MailAccount *)self mf_lock];
      uint64_t v38 = [v14 children];
      id v48 = v46;
      uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
      char v40 = [v38 arrayByExcludingObjectsInArray:v39];

      [v14 setChildren:v40];
      [(MailAccount *)self mf_unlock];
    }
    else
    {
      uint64_t v41 = +[MFActivityMonitor currentMonitor];
      char v40 = [v41 error];

      [(MailAccount *)self _synchronouslyLoadListingForParent:v14];
      [(MailAccount *)self mf_lock];
      [(MailAccount *)self _setChildren:0 forMailboxUid:v14];
      [(MailAccount *)self mf_unlock];
      if (v40)
      {
        long long v42 = +[MFActivityMonitor currentMonitor];
        [v42 setError:v40];
      }
    }
  }
  [(MailAccount *)self _writeMailboxCacheWithPrejudice:1];
  clearMailboxUIDCache();

  return v13;
}

- (void)_resetAllMailboxURLs:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(MailAccount *)self isActive])
  {
    BOOL v5 = +[MailAccount mailAccounts];
    int v20 = v5;
    id v6 = v5;
    if (v5)
    {
      char v7 = [v5 containsObject:self];
      id v6 = v20;
      if (v7)
      {
        CFIndex v8 = [(MailAccount *)self allMailboxUids];
        uint64_t v9 = objc_msgSend(v8, "count", v8);
        id v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
        uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v12 = v8;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v12);
              }
              id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              uint64_t v17 = [v16 URLString];
              if (v17)
              {
                [v16 flushCriteria];
                BOOL v18 = [v16 URLString];
                if (v18 && ([v17 isEqualToString:v18] & 1) == 0)
                {
                  [v10 addObject:v17];
                  [v11 addObject:v18];
                }
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v13);
        }

        if ([v11 count])
        {
          if (v3)
          {
            char v19 = [(MailAccount *)self library];
            [v19 renameMailboxes:v10 to:v11];
          }
        }
        clearMailboxUIDCache();

        id v6 = v20;
      }
    }
  }
}

- (void)resetMailboxURLs
{
}

- (void)setUsername:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFAccount *)self username];
  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = &stru_1EFF11268;
  }
  v9.receiver = self;
  v9.super_class = (Class)MailAccount;
  [(MFAccount *)&v9 setUsername:v4];
  uint64_t v7 = [(MFAccount *)self username];

  if (v7) {
    CFIndex v8 = (__CFString *)v7;
  }
  else {
    CFIndex v8 = &stru_1EFF11268;
  }
  if (([(__CFString *)v8 isEqualToString:v6] & 1) == 0) {
    [(MailAccount *)self _resetAllMailboxURLs:0];
  }
}

- (void)setHostname:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFAccount *)self hostname];
  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = &stru_1EFF11268;
  }
  v9.receiver = self;
  v9.super_class = (Class)MailAccount;
  [(MFAccount *)&v9 setHostname:v4];
  uint64_t v7 = [(MFAccount *)self hostname];

  if (v7) {
    CFIndex v8 = (__CFString *)v7;
  }
  else {
    CFIndex v8 = &stru_1EFF11268;
  }
  if (([(__CFString *)v8 isEqualToString:v6] & 1) == 0) {
    [(MailAccount *)self _resetAllMailboxURLs:0];
  }
}

- (BOOL)isHostnameEquivalentTo:(id)a3
{
  id v4 = a3;
  id v5 = [(MFAccount *)self hostname];
  if (v5 == v4)
  {
    char v7 = 1;
  }
  else
  {
    id v6 = [(MFAccount *)self hostname];
    char v7 = [v6 isEqualToString:v4];
  }
  return v7;
}

- (BOOL)isAccountClassEquivalentTo:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v3)
  {
    char v8 = 1;
  }
  else
  {
    id v6 = (objc_class *)objc_opt_class();
    char v7 = NSStringFromClass(v6);
    char v8 = [v7 isEqualToString:v3];
  }
  return v8;
}

- (void)setPortNumber:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = [(MFAccount *)self portNumber];
  int v6 = v5 == [(MFAccount *)self defaultPortNumber]
    || v5 == [(MFAccount *)self defaultSecurePortNumber];
  v9.receiver = self;
  v9.super_class = (Class)MailAccount;
  [(MFAccount *)&v9 setPortNumber:v3];
  unsigned int v7 = [(MFAccount *)self portNumber];
  int v8 = v7 == [(MFAccount *)self defaultPortNumber]
    || v7 == [(MFAccount *)self defaultSecurePortNumber];
  if (v7 != v5)
  {
    if (v6 != v8) {
      LOBYTE(v8) = 0;
    }
    if ((v8 & 1) == 0) {
      [(MailAccount *)self _resetAllMailboxURLs:0];
    }
  }
}

- (void)setValueInAccountProperties:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqual:@"Hostname"] & 1) != 0
    || ([v7 isEqual:@"Username"] & 1) != 0
    || [v7 isEqual:@"PortNumber"])
  {
    int v8 = [(MailAccount *)self allMailboxUids];
    [v8 makeObjectsPerformSelector:sel_URLString];

    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)MailAccount;
  [(MFAccount *)&v10 setValueInAccountProperties:v6 forKey:v7];
  if (v9) {
    [(MailAccount *)self _resetAllMailboxURLs:1];
  }
}

- (void)setConnectionError:(id)a3
{
  id v5 = a3;
  [(MailAccount *)self mf_lock];
  objc_storeStrong((id *)&self->_lastConnectionError, a3);
  [(MailAccount *)self mf_unlock];
}

- (id)connectionError
{
  [(MailAccount *)self mf_lock];
  uint64_t v3 = self->_lastConnectionError;
  [(MailAccount *)self mf_unlock];
  return v3;
}

- (Class)storeClass
{
}

+ (id)infoForURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 accountWithURL:v4];
  id v6 = [v5 _infoForMatchingURL:v4];

  return v6;
}

+ (id)accountIDFromMailboxURLString:(id)a3 urlScheme:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [MEMORY[0x1E4F29088] componentsWithString:v5];
    int v8 = v7;
    if (v7
      && (!v6
       || ([v7 scheme],
           int v9 = objc_claimAutoreleasedReturnValue(),
           char v10 = [v9 isEqualToString:v6],
           v9,
           (v10 & 1) != 0)))
    {
      uint64_t v11 = [v8 host];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)URL
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Account";
  v6[1] = @"RelativePath";
  v7[0] = self;
  v7[1] = &stru_1EFF11268;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  id v4 = [(MailAccount *)self _URLForInfo:v3];

  return v4;
}

- (void)emptyTrash
{
  uint64_t v3 = [(MailAccount *)self emptyFrequencyForMailboxType:3];
  if ((v3 & 0x80000000) == 0)
  {
    uint64_t v4 = v3;
    id v5 = [(MailAccount *)self mailboxUidOfType:3 createIfNeeded:0];
    if (v5) {
      [(MailAccount *)self deleteMessagesFromMailboxUid:v5 olderThanNumberOfDays:v4];
    }
  }
}

- (void)updateEmailAliasesIfNeeded
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A7EFF000, v0, v1, "updateEmailAliasesIfNeeded: no-op", v2, v3, v4, v5, v6);
}

+ (void)updateEmailAliasesForActiveAccounts
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = +[MailAccount activeAccounts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) updateEmailAliasesIfNeeded];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

+ (id)standardAccountClass:(Class)a3 valueForKey:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MailAccount_standardAccountClass_valueForKey___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (standardAccountClass_valueForKey__onceToken != -1) {
    dispatch_once(&standardAccountClass_valueForKey__onceToken, block);
  }
  long long v7 = (void *)standardAccountClass_valueForKey__sStandardAccountValues;
  long long v8 = NSStringFromClass(a3);
  long long v9 = [v7 objectForKey:v8];

  char v10 = [v9 objectForKey:v6];

  return v10;
}

void __48__MailAccount_standardAccountClass_valueForKey___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  uint64_t v1 = [v5 pathForResource:@"ISP" ofType:@"plist"];
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v1];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F98] propertyListWithData:v2 options:0 format:0 error:0];
    uint64_t v4 = (void *)standardAccountClass_valueForKey__sStandardAccountValues;
    standardAccountClass_valueForKey__sStandardAccountValues = v3;
  }
}

+ (id)predefinedValueForKey:(id)a3
{
  uint64_t v3 = [a1 standardAccountClass:a1 valueForKey:a3];
  return v3;
}

- (void)setLibrary:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (MFMailMessageLibrary *)a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = MFLogGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412546;
        long long v8 = self;
        __int16 v9 = 2112;
        char v10 = v4;
        _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "#Warning %@: Cannot set library to %@. See rdar://problem/42167098.", (uint8_t *)&v7, 0x16u);
      }

      uint64_t v4 = 0;
    }
  }
  library = self->_library;
  self->_library = v4;
}

+ (BOOL)usernameIsEmailAddress
{
  return 0;
}

- (BOOL)supportsAppend
{
  return 0;
}

- (BOOL)supportsRemoteAppend
{
  return 0;
}

- (BOOL)supportsSyncingReadState
{
  return 1;
}

- (BOOL)supportsMailboxEditing
{
  return 0;
}

- (BOOL)mustArchiveSentMessages
{
  return [(MFAccount *)self _BOOLForAccountInfoKey:@"SaveSentMessages" defaultValue:1];
}

- (BOOL)canArchiveSentMessages
{
  return 1;
}

- (BOOL)supportsMessageFlagging
{
  return 1;
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 0;
}

- (BOOL)deleteInPlaceForAllMailboxes
{
  return 0;
}

- (BOOL)deleteInPlaceForMailbox:(id)a3
{
  return 0;
}

- (BOOL)shouldFetchRemoteLinksWithDateReceived:(id)a3
{
  return 0;
}

- (id)loggingIdentifier
{
  uint64_t v3 = [(MailAccount *)self statisticsKind];
  uint64_t v4 = [(MFAccount *)self uniqueID];
  id v5 = [v4 substringToIndex:8];

  id v6 = [NSString stringWithFormat:@"%@/%@", v3, v5];

  return v6;
}

- (BOOL)moveSupported
{
  return 0;
}

- (void)newActionsAdded
{
  uint64_t v3 = [(MailAccount *)self taskManager];
  id v5 = v3;
  if (v3)
  {
    [v3 checkForNewLocalActions];
  }
  else
  {
    uint64_t v4 = [(MailAccount *)self replayHandler];
    [v4 newActionsAdded];
  }
}

- (void)addNewAction:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(MailAccount *)self replayHandler];
  [v4 addNewAction:v5];
}

- (id)replayAction:(id)a3
{
  return 0;
}

- (id)meetingStorePersistentID
{
  return 0;
}

- (BOOL)reconstituteOrphanedMeetingInMessage:(id)a3
{
  return 0;
}

- (id)unactionableInvitationICSRepresentationInMessage:(id)a3 summary:(id *)a4
{
  return 0;
}

- (BOOL)hasEnoughInformationForEasySetup
{
  uint64_t v3 = [(MFAccount *)self hostname];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  id v5 = [(MFAccount *)self username];
  uint64_t v6 = [v5 length];

  if (!v6) {
    return 0;
  }
  int v7 = [(MFAccount *)self password];
  BOOL v8 = [v7 length] != 0;

  return v8;
}

+ (BOOL)getConfigurationFromServerForEmail:(id)a3
{
  return 0;
}

- (BOOL)canReceiveNewMailNotifications
{
  return 0;
}

- (BOOL)_registerPushNotificationPrefix:(id)a3 forMailboxNames:(id)a4
{
  return 0;
}

- (BOOL)willPerformActionForChokePoint:(id)a3 coalescePoint:(id)a4 result:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v29 = a4;
  BOOL v30 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v8];
  long long v28 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v29];
  __int16 v9 = MFAutoFetchLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    char v10 = [(MFAccount *)self ef_publicDescription];
    *(_DWORD *)buf = 138412802;
    id v32 = v10;
    __int16 v33 = 2112;
    long long v34 = v30;
    __int16 v35 = 2112;
    long long v36 = v28;
    _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, "Account: %@ willPerformActionForChokePoint: %@ - coalescePoint: %@", buf, 0x20u);
  }
  [(MailAccount *)self mf_lock];
  currentChokedActions = self->_currentChokedActions;
  if (!currentChokedActions)
  {
    id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v13 = self->_currentChokedActions;
    self->_currentChokedActions = v12;

    currentChokedActions = self->_currentChokedActions;
  }
  uint64_t v14 = [(NSMutableDictionary *)currentChokedActions mf_objectForKey:v8 ofClass:objc_opt_class()];
  uint64_t v15 = [v14 objectForKey:@"MFMailboxDictClientCount"];
  id v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v15, "intValue") + 1);
  [v14 setObject:v16 forKey:@"MFMailboxDictClientCount"];
  uint64_t v17 = MFAutoFetchLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v16;
    _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEFAULT, "Clients for choke point - %@", buf, 0xCu);
  }

  uint64_t v18 = [v14 objectForKey:@"MFMailboxDictLock"];
  char v19 = (void *)v18;
  if (!v18)
  {
    char v19 = (void *)[objc_alloc(MEMORY[0x1E4F734B0]) initWithName:@"ChokeLock" condition:1 andDelegate:0];
    [v14 setObject:v19 forKey:@"MFMailboxDictLock"];
  }
  [(MailAccount *)self mf_unlock];
  if (v18)
  {
    int v20 = MFAutoFetchLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v30;
      _os_log_impl(&dword_1A7EFF000, v20, OS_LOG_TYPE_DEFAULT, "Waiting for existing fetch to finish for choke point: %@", buf, 0xCu);
    }

    [v19 lockWhenCondition:2];
    *a5 = [v14 objectForKeyedSubscript:v29];
    long long v21 = MFAutoFetchLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = *a5;
      *(_DWORD *)buf = 138412546;
      id v32 = v22;
      __int16 v33 = 2112;
      long long v34 = v30;
      _os_log_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_DEFAULT, "Result: %@ returned for chokepoint: %@", buf, 0x16u);
    }

    [(MailAccount *)self mf_lock];
    long long v23 = [v14 objectForKey:@"MFMailboxDictClientCount"];

    uint64_t v15 = v23;
    int v24 = [v23 intValue];
    if (v24 < 2)
    {
      uint64_t v26 = MFAutoFetchLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v30;
        _os_log_impl(&dword_1A7EFF000, v26, OS_LOG_TYPE_DEFAULT, "Removing choke point from current actions: %@", buf, 0xCu);
      }

      [(NSMutableDictionary *)self->_currentChokedActions removeObjectForKey:v8];
    }
    else
    {
      long long v25 = [MEMORY[0x1E4F28ED0] numberWithInt:(v24 - 1)];
      [v14 setObject:v25 forKey:@"MFMailboxDictClientCount"];
    }
    [(MailAccount *)self mf_unlock];
    [v19 unlockWithCondition:2];
  }
  else
  {
    [v19 lock];
  }

  return v18 != 0;
}

- (void)didFinishActionForChokePoint:(id)a3 coalescePoint:(id)a4 withResult:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v8];
  id v22 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v9];
  id v12 = MFAutoFetchLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [(MFAccount *)self ef_publicDescription];
    *(_DWORD *)buf = 138413058;
    int v24 = v13;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2112;
    long long v28 = v22;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "Account: %@ didFinishActionForChokePoint: %@ - coalescePoint: %@ - result: %@", buf, 0x2Au);
  }
  [(MailAccount *)self mf_lock];
  uint64_t v14 = [(NSMutableDictionary *)self->_currentChokedActions objectForKey:v8];
  uint64_t v15 = [v14 objectForKey:@"MFMailboxDictLock"];
  id v16 = [v14 objectForKey:@"MFMailboxDictClientCount"];
  int v17 = [v16 intValue];
  if (v17 < 2)
  {
    [v15 unlock];
    int v20 = MFAutoFetchLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v24 = v11;
      _os_log_impl(&dword_1A7EFF000, v20, OS_LOG_TYPE_DEFAULT, "Removing choke point from current actions: %@", buf, 0xCu);
    }

    [(NSMutableDictionary *)self->_currentChokedActions removeObjectForKey:v8];
  }
  else
  {
    if (!v10)
    {
      long long v21 = MFLogGeneral();
      -[MailAccount didFinishActionForChokePoint:coalescePoint:withResult:](v21, (uint64_t *)&self->_currentChokedActions, (uint64_t)v14);

      __assert_rtn("-[MailAccount didFinishActionForChokePoint:coalescePoint:withResult:]", "MailAccount.m", 2995, "0");
    }
    uint64_t v18 = MFAutoFetchLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int v24 = v11;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "Updating result for for choke point: %@ - result: %@", buf, 0x16u);
    }

    char v19 = [MEMORY[0x1E4F28ED0] numberWithInt:(v17 - 1)];
    [v14 setObject:v19 forKey:@"MFMailboxDictClientCount"];

    [v14 setObject:v10 forKey:v9];
    [v15 unlockWithCondition:2];
  }
  [(MailAccount *)self mf_unlock];
}

- (void)deliveryAccountWillBeRemoved:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(MailAccount *)self _deliveryAccountCreateIfNeeded:0];
  id v5 = [v6 object];

  if (v4 == v5) {
    [(MailAccount *)self setDeliveryAccount:0];
  }
}

- (id)pushedMailboxUids
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(MailAccount *)self primaryMailboxUid];
  uint64_t v4 = [v2 setWithObject:v3];

  return v4;
}

- (BOOL)supportsUserPushedMailboxes
{
  return 0;
}

+ (id)_accountWithPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 mailboxUidForFileSystemPath:v4 create:0];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 account];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = (id)_accountsSortedByPath;
    id v7 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v8);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "path", (void)v15);
          int v13 = [v4 isEqualToString:v12];

          if (v13)
          {
            id v7 = v11;
            goto LABEL_13;
          }
        }
        id v7 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v7;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(MFAccount *)self persistentAccount];
  BOOL v5 = -[MailAccount isActiveWithPersistentAccount:](self, "isActiveWithPersistentAccount:");
  if (v6) {
    [v6 setEnabled:v3 forDataclass:*MEMORY[0x1E4F17AD8]];
  }
  if ([(MailAccount *)self isActiveWithPersistentAccount:v6] == v3 && v5 != v3) {
    [(MailAccount *)self _didBecomeActive:v3];
  }
}

- (void)_didBecomeActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[MFMailMessageLibrary canUsePersistence])
  {
    id v7 = 0;
    if (!v3) {
      goto LABEL_3;
    }
LABEL_5:
    _configureMailboxCache(self);
    [(MailAccount *)self resetSpecialMailboxes];
    [v7 accountBecameActive:self];
    goto LABEL_6;
  }
  BOOL v5 = +[MFMailMessageLibrary defaultInstance];
  id v6 = [v5 persistence];
  id v7 = [v6 hookRegistry];

  if (v3) {
    goto LABEL_5;
  }
LABEL_3:
  id v8 = mailAccountQueue();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__MailAccount__didBecomeActive___block_invoke;
  v9[3] = &unk_1E5D3B6E0;
  void v9[4] = self;
  id v10 = v7;
  dispatch_async(v8, v9);

LABEL_6:
}

uint64_t __32__MailAccount__didBecomeActive___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateAndDeleteAccountData:0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 accountBecameInactive:v3];
}

- (int)_emptyFrequencyForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  id v7 = [(MFAccount *)self _objectForAccountInfoKey:a3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v9 = v7;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (int v10 = [v7 isEqualToString:&stru_1EFF11268], v9 = v7, v10))
    {
      uint64_t v9 = v6;
    }
  }
  int v11 = [v9 intValue];

  return v11;
}

- (BOOL)shouldFetchAgainWithError:(id)a3 foregroundRequest:(BOOL)a4
{
  LOBYTE(v4) = a4;
  id v5 = a3;
  id v6 = [v5 domain];
  id v7 = v6;
  if (!v5) {
    goto LABEL_11;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F288C8]])
  {
    LOBYTE(v4) = 0;
    goto LABEL_12;
  }
  if (![v7 isEqualToString:*MEMORY[0x1E4F28798]])
  {
    if ([v7 isEqualToString:@"MFMessageErrorDomain"])
    {
      uint64_t v8 = [v5 code];
      if ((unint64_t)(v8 - 1032) <= 0x1C) {
        unsigned int v4 = (0xE7FFF7Eu >> (v8 - 8)) & 1;
      }
      else {
        LOBYTE(v4) = 1;
      }
      goto LABEL_12;
    }
LABEL_11:
    LOBYTE(v4) = 1;
    goto LABEL_12;
  }
  if ([v5 code] != 60) {
    LOBYTE(v4) = 1;
  }
LABEL_12:

  return v4;
}

- (void)setMailboxCachePath:(id)a3
{
  id v6 = a3;
  unsigned int v4 = (NSString *)[v6 copy];
  mailboxCachePath = self->_mailboxCachePath;
  self->_mailboxCachePath = v4;
}

- (void)_loadEntriesFromFileSystemPath:(id)a3 parent:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v26 = a4;
  int v24 = (void *)MEMORY[0x1AD0E3E00]();
  uint64_t v6 = [v5 length];
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  __int16 v25 = [v7 contentsOfDirectoryAtPath:v5 error:0];

  CFArrayRef theArray = (CFArrayRef)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  context[0] = self;
  context[1] = v5;
  context[2] = v26;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v25;
  uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (([v11 hasPrefix:@"."] & 1) == 0)
        {
          char v30 = -86;
          [v5 appendString:@"/"];
          [v5 appendString:v11];
          id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
          int v13 = [v12 fileExistsAtPath:v5 isDirectory:&v30];
          if (v30) {
            int v14 = v13;
          }
          else {
            int v14 = 0;
          }

          if (v14)
          {
            long long v15 = [(MailAccount *)self mailboxPathExtension];
            long long v16 = [v11 pathExtension];
            int v17 = [v15 isEqualToString:v16];

            if (v17)
            {
              id v18 = [v11 stringByDeletingPathExtension];
            }
            else
            {
              id v18 = v11;
            }
            char v19 = v18;
            uint64_t v20 = [(MailAccount *)self _uidNameForPathComponent:v18];

            long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v20, @"MailboxName", &unk_1EFF50C10, @"MailboxAttributes", 0);
            [(__CFArray *)theArray addObject:v21];
          }
          objc_msgSend(v5, "deleteCharactersInRange:", v6, objc_msgSend(v5, "length") - v6);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }

  id v22 = [v26 name];
  BOOL v23 = [(MailAccount *)self _loadMailboxListingIntoCache:v22 attributes:2 children:theArray parent:v26];

  if (v23) {
    [(MailAccount *)self _incrementCacheDirtyCount];
  }
  v38.length = [(__CFArray *)theArray count];
  v38.locatiouint64_t n = 0;
  CFArrayApplyFunction(theArray, v38, (CFArrayApplierFunction)_recurseIntoFileSystem, context);
}

void __65__MailAccount__writeMailboxCacheWithPrejudice_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28F98] dataWithPropertyList:*(void *)(a1 + 32) format:200 options:0 error:0];
  [v2 writeToFile:*(void *)(a1 + 40) options:1073741825 error:0];
  uint64_t v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 64);
    id v5 = objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
    int v7 = 134218242;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    int v10 = v5;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "Finished writing to disk mailbox cache mailboxes.count:%lu self:%{public}@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (BOOL)_deleteMailbox:(id)a3 reflectToServer:(BOOL)a4
{
  return 1;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)MailAccount;
  uint64_t v3 = [(MFAccount *)&v6 description];
  uint64_t v4 = [v3 stringByAppendingFormat:@" path=%@", self->_path];

  return (NSString *)v4;
}

- (id)powerAssertionIdentifierWithPrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(MailAccount *)self displayName];
  if ([v5 length])
  {
    objc_super v6 = [(MailAccount *)self displayName];
  }
  else
  {
    objc_super v6 = &stru_1EFF11268;
  }

  int v7 = [(MFAccount *)self uniqueID];
  uint64_t v8 = [v4 stringByAppendingFormat:@"-%@-(%@)", v7, v6];

  return v8;
}

+ (void)_setOutboxMailboxUid:(id)a3
{
  id v8 = a3;
  objc_msgSend(a1, "mf_lock");
  id v5 = v8;
  if ((id)_outboxUid != v8)
  {
    objc_storeStrong((id *)&_outboxUid, a3);
    [(id)_outboxUid setMailboxType:6];
    id v5 = v8;
  }
  if ([v5 isValid])
  {
    objc_super v6 = [v8 account];
    int v7 = [v8 parent];
    [v6 _setChildren:0 forMailboxUid:v7];
  }
  objc_msgSend(a1, "mf_unlock");
}

- (void)_setSpecialMailbox:(id)a3 forType:(int64_t)a4
{
  id v10 = a3;
  objc_super v6 = [v10 accountRelativePath];
  int v7 = [(MailAccount *)self specialMailboxNameForType:a4];
  id v8 = v7;
  if (v6 != v7)
  {
    __int16 v9 = v7 ? v7 : &stru_1EFF11268;
    if (([(__CFString *)v6 isEqualToString:v9] & 1) == 0)
    {
      [(MailAccount *)self _setSpecialMailboxName:v6 forType:a4];
      [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:v10 forType:a4];
    }
  }
}

- (BOOL)_canEmptyMessagesFromMailboxUid:(id)a3
{
  return 1;
}

- (BOOL)_shouldLogDeleteActivity
{
  int v2 = sLogDeleteActivity;
  if (sLogDeleteActivity == -1)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v2 = [v3 BOOLForKey:@"LogDeleteActivity"];

    sLogDeleteActivity = v2;
  }
  return v2 == 1;
}

- (id)_infoForMatchingURL:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v6 = [v4 relativePath];
  [v5 setObject:self forKey:@"Account"];
  uint64_t v8 = [v6 rangeOfString:@"/" options:8];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = objc_msgSend(v6, "substringWithRange:", v8 + v7, objc_msgSend(v6, "length") - (v8 + v7));

    objc_super v6 = (void *)v9;
  }
  if (v6 && ([v6 isEqualToString:&stru_1EFF11268] & 1) == 0) {
    [v5 setObject:v6 forKey:@"RelativePath"];
  }

  return v5;
}

- (id)_URLScheme
{
  return 0;
}

- (BOOL)_writeCustomInfoToMailboxCache:(id)a3
{
  return 1;
}

- (BOOL)_repairMailboxCache
{
  return 1;
}

- (id)uniqueServerIdForMessage:(id)a3
{
  uint64_t v3 = [a3 globalMessageURL];
  id v4 = [v3 absoluteString];

  return v4;
}

- (id)newMailboxWithParent:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 account];
  uint64_t v9 = [v8 rootMailbox];
  id v10 = [v6 pathRelativeToMailbox:v9];

  uint64_t v11 = [v10 stringByAppendingPathComponent:v7];
  id v12 = [(MailAccount *)self mailboxUidForRelativePath:v11 create:1];

  return v12;
}

+ (BOOL)canMoveMessagesFromAccount:(id)a3 toAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F74230] sharedConnection];
  LOBYTE(a1) = [a1 canMoveMessagesFromAccount:v6 toAccount:v7 profileConnection:v8];

  return (char)a1;
}

+ (BOOL)canMoveMessagesFromAccount:(id)a3 toAccount:(id)a4 profileConnection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 == v8) {
    goto LABEL_8;
  }
  if (([v7 restrictedFromTransferingMessagesToOtherAccounts] & 1) != 0
    || ![v8 supportsAppend])
  {
    BOOL v12 = 0;
    goto LABEL_9;
  }
  int v10 = [v7 sourceIsManaged];
  if (v10 == [v8 sourceIsManaged])
  {
LABEL_8:
    BOOL v12 = 1;
    goto LABEL_9;
  }
  if ([v7 sourceIsManaged]) {
    char v11 = [v9 mayOpenFromManagedToUnmanaged];
  }
  else {
    char v11 = [v9 mayOpenFromUnmanagedToManaged];
  }
  BOOL v12 = v11;
LABEL_9:

  return v12;
}

- (id)_localMailboxNameForType:(int64_t)a3 usingDisplayName:(id)a4
{
  id v6 = a4;
  id v7 = +[LocalAccount localAccount];
  id v8 = [v7 specialMailboxNameForType:a3];
  if (v8)
  {
    if (!v6)
    {
LABEL_5:
      id v9 = [(MailAccount *)self displayName];
      id v6 = v9;
      if (!v9 || [v9 isEqualToString:&stru_1EFF11268])
      {
        uint64_t v10 = [(MailAccount *)self firstEmailAddress];

        id v6 = (id)v10;
        if (!v10) {
          goto LABEL_10;
        }
      }
    }
  }
  else
  {
    id v8 = [v7 _defaultSpecialMailboxNameForType:a3];
    if (!v6) {
      goto LABEL_5;
    }
  }
  if (([v6 isEqualToString:&stru_1EFF11268] & 1) == 0)
  {
    uint64_t v11 = [v8 stringByAppendingFormat:@" (%@)", v6];

    id v8 = (void *)v11;
  }
LABEL_10:

  return v8;
}

- (BOOL)isMailboxLocalForType:(int64_t)a3
{
  return 0;
}

- (id)allLocalMailboxUids
{
  uint64_t v3 = 0;
  id v4 = 0;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v8 = xmmword_1A8AC63B0;
  long long v9 = xmmword_1A8AC63C0;
  uint64_t v10 = 1;
  do
  {
    uint64_t v5 = *(void *)((char *)&v8 + v3);
    if (-[MailAccount isMailboxLocalForType:](self, "isMailboxLocalForType:", v5, v8, v9, v10, v11))
    {
      id v6 = [(MailAccount *)self mailboxUidOfType:v5 createIfNeeded:0];
      if (v6)
      {
        if (!v4)
        {
          id v4 = [MEMORY[0x1E4F1CA48] array];
        }
        [v4 addObject:v6];
      }
    }
    v3 += 8;
  }
  while (v3 != 40);
  return v4;
}

- (BOOL)shouldRestoreMessagesAfterFailedDelete
{
  return 0;
}

- (id)saveSentFolder
{
  return 0;
}

- (id)valueInAccountLookAsidePropertiesForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v6 = [v5 dictionaryForKey:@"com.apple.MailAccount-ExtProperties"];

  id v7 = [(MFAccount *)self identifier];
  long long v8 = [v6 objectForKeyedSubscript:v7];

  long long v9 = [v8 objectForKeyedSubscript:v4];

  return v9;
}

- (void)setValueInAccountLookAsideProperties:(id)a3 forKey:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  long long v8 = [v7 dictionaryForKey:@"com.apple.MailAccount-ExtProperties"];
  id v9 = (id)[v8 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v10 = [(MFAccount *)self identifier];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];
  if (v11)
  {
    BOOL v12 = [v9 objectForKeyedSubscript:v10];
    id v13 = (id)[v12 mutableCopy];
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  if (v14) {
    [v13 setObject:v14 forKey:v6];
  }
  else {
    [v13 removeObjectForKey:v6];
  }
  [v9 setObject:v13 forKeyedSubscript:v10];
  [v7 setObject:v9 forKey:@"com.apple.MailAccount-ExtProperties"];
  [v7 synchronize];
}

- (void)_setValueInAccountLookAsideProperties:(id)a3 forKey:(id)a4 subKey:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MailAccount *)self valueInAccountLookAsidePropertiesForKey:v9];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __assert_rtn("-[MailAccount _setValueInAccountLookAsideProperties:forKey:subKey:]", "MailAccount.m", 4121, "[dictionary isKindOfClass:[NSDictionary class]]");
    }
    BOOL v12 = (void *)[v11 mutableCopy];
    id v13 = v12;
    if (v8) {
      [v12 setObject:v8 forKey:v10];
    }
    else {
      [v12 removeObjectForKey:v10];
    }
    [(MailAccount *)self setValueInAccountLookAsideProperties:v13 forKey:v9];
  }
  else if (v8)
  {
    id v15 = v10;
    v16[0] = v8;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    [(MailAccount *)self setValueInAccountLookAsideProperties:v14 forKey:v9];
  }
}

- (id)signingIdentityPersistentReferenceForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MailAccount *)self valueInAccountLookAsidePropertiesForKey:@"SendingIdentities"];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setSigningIdentityPersistentReference:(id)a3 forAddress:(id)a4
{
}

- (id)encryptionIdentityPersistentReferenceForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MailAccount *)self valueInAccountLookAsidePropertiesForKey:@"EncryptionIdentities"];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setEncryptionIdentityPersistentReference:(id)a3 forAddress:(id)a4
{
}

- (BOOL)perMessageEncryptionEnabledForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MailAccount *)self encryptionIdentityPersistentReferenceForAddress:v4];

  if (v5)
  {
    if ([(MFAccount *)self isManaged])
    {
      id v6 = [(MFAccount *)self accountPropertyForKey:@"PerMessageSMIMEEnabled"];
      LOBYTE(v5) = [v6 BOOLValue];
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }

  return (char)v5;
}

- (int64_t)secureCompositionSigningPolicyForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 emailAddressValue];
  id v6 = [v5 simpleAddress];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v4 stringValue];
  }
  id v9 = v8;

  id v10 = [(MailAccount *)self firstEmailAddress];
  uint64_t v11 = [v10 emailAddressValue];
  BOOL v12 = [v11 simpleAddress];
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v10 stringValue];
  }
  id v15 = v14;

  int v16 = [v9 isEqualToString:v15];
  if (v16)
  {
    int v17 = [(MFAccount *)self accountPropertyForKey:@"SMIMESigningEnabled"];
    int64_t v18 = [v17 BOOLValue];
  }
  else
  {
    int64_t v18 = 0;
  }

  return v18;
}

- (int64_t)secureCompositionEncryptionPolicyForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 emailAddressValue];
  id v6 = [v5 simpleAddress];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v4 stringValue];
  }
  id v9 = v8;

  id v10 = [(MailAccount *)self firstEmailAddress];
  uint64_t v11 = [v10 emailAddressValue];
  BOOL v12 = [v11 simpleAddress];
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v10 stringValue];
  }
  id v15 = v14;

  int v16 = [v9 isEqualToString:v15];
  if (v16)
  {
    int v17 = [(MFAccount *)self accountPropertyForKey:@"SMIMEEncryptionEnabled"];
    int64_t v18 = [v17 BOOLValue];
  }
  else
  {
    int64_t v18 = 0;
  }

  return v18;
}

- (id)copyDataForRemoteEncryptionCertificatesForAddresses:(id)a3 errors:(id *)a4
{
  return 0;
}

- (BOOL)restrictedFromTransferingMessagesToOtherAccounts
{
  return +[MFAccount accountIsRestrictedFromTransfersToOtherAccounts:self];
}

- (BOOL)restrictedFromSendingExternally
{
  return +[MFAccount accountIsPreventedFromSendingFromExternalProcesses:self];
}

- (BOOL)restrictedFromSyncingRecents
{
  return +[MFAccount accountRestrictsRecentsSyncing:self];
}

- (id)fetchLimits
{
  return 0;
}

- (id)customSignature
{
  return [(MailAccount *)self valueInAccountLookAsidePropertiesForKey:@"CustomSignature"];
}

- (void)setCustomSignature:(id)a3
{
}

- (BOOL)supportsThreadOperations
{
  return 1;
}

- (BOOL)preventArchiveForMailbox:(id)a3
{
  id v4 = a3;
  int v5 = ![(MailAccount *)self supportsArchiving];
  if (!v4) {
    LOBYTE(v5) = 1;
  }
  BOOL v6 = (v5 & 1) == 0 && (unint64_t)([v4 mailboxType] - 1) < 5;

  return v6;
}

- (BOOL)canArchiveForMailbox:(id)a3
{
  id v4 = a3;
  if ([(MailAccount *)self supportsArchiving]) {
    BOOL v5 = ![(MailAccount *)self preventArchiveForMailbox:v4];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (int64_t)archiveDestinationForMailbox:(id)a3
{
  id v4 = a3;
  if (![(MailAccount *)self supportsArchiving]) {
    __assert_rtn("-[MailAccount archiveDestinationForMailbox:]", "MailAccount.m", 4271, "[self supportsArchiving] && \"only accounts that support archiving should call into this\"");
  }
  if ([(MailAccount *)self canArchiveForMailbox:v4]) {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = 3;
  }

  return v5;
}

- (id)unsupportedHandoffTypes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)supportsHandoffType:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MailAccount *)self unsupportedHandoffTypes];
  char v6 = [v5 containsObject:v4] ^ 1;

  return v6;
}

- (BOOL)supportsMailDrop
{
  v3.receiver = self;
  v3.super_class = (Class)MailAccount;
  return [(MFAccount *)&v3 supportsMailDrop];
}

id __43__MailAccount__registerStateCaptureHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained debugAccountState];

  return v2;
}

- (id)lastKnownCapabilities
{
  return 0;
}

- (id)debugAccountState
{
  v11[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MFDebugAccountState alloc];
  id v4 = [(MFAccount *)self identifier];
  int64_t v5 = [(MailAccount *)self lastKnownCapabilities];
  char v6 = [(MFDebugAccountState *)v3 initWithStateEventDictionary:self identifier:v4 lastKnownCapabilities:v5];

  id v10 = @"Account Info";
  id v7 = [(MFDebugAccountState *)v6 dictionaryRepresentation];
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v8;
}

- (BOOL)supportsFastRemoteBodySearch
{
  return self->_supportsFastRemoteBodySearch;
}

- (MFLocalActionReplayHandler)replayHandler
{
  return self->_replayHandler;
}

- (void)setReplayHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayHandler, 0);
  objc_storeStrong((id *)&self->_messageStoresCache, 0);
  objc_storeStrong((id *)&self->_mailboxCachePath, 0);
  objc_storeStrong((id *)&self->_currentChokedActions, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_lastConnectionError, 0);
  objc_storeStrong((id *)&self->_deletionLock, 0);
  objc_storeStrong((id *)&self->_cachedMailboxenLock, 0);
  objc_storeStrong((id *)&self->_junkMailboxUid, 0);
  objc_storeStrong((id *)&self->_archiveMailboxUid, 0);
  objc_storeStrong((id *)&self->_trashMailboxUid, 0);
  objc_storeStrong((id *)&self->_sentMessagesMailboxUid, 0);
  objc_storeStrong((id *)&self->_draftsMailboxUid, 0);
  objc_storeStrong((id *)&self->_inboxMailboxUid, 0);
  objc_storeStrong((id *)&self->_rootMailboxUid, 0);
  objc_storeStrong((id *)&self->_nonPersistentPath, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)deleteMailbox:(void *)a3 reflectToServer:(os_log_t)log .cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "No URL for mailbox %{public}@", buf, 0xCu);
}

+ (void)mailboxUidFromActiveAccountsForURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_DEBUG, "Mailbox UID from account: cache miss. ('%@')", (uint8_t *)&v2, 0xCu);
}

- (void)didFinishActionForChokePoint:(NSObject *)a1 coalescePoint:(uint64_t *)a2 withResult:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *a2;
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = a3;
    _os_log_impl(&dword_1A7EFF000, a1, OS_LOG_TYPE_DEFAULT, "#Warning <rdar://problem/17733540> _currentChokedActions: %@\nmailboxDict: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_writeMailboxCacheWithPrejudice:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_ERROR, "Error writing custom info to mailbox cache. Not saving the mailbox cache to file.", v1, 2u);
}

- (void)shouldArchiveByDefault
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2 & 1;
  _os_log_debug_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_DEBUG, "%{public}@: shouldArchiveByDefault: Get BOOL for account info key: %{BOOL}d", buf, 0x12u);
}

@end