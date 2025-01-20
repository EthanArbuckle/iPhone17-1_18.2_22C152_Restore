@interface MailAccount
+ (BOOL)canMoveMessagesFromAccount:(id)a3 toAccount:(id)a4;
+ (BOOL)getConfigurationFromServerForEmail:(id)a3;
+ (BOOL)isPredefinedAccountType;
+ (BOOL)mailboxListingNotificationAreEnabled;
+ (BOOL)primaryDeliveryAccountIsDynamic;
+ (BOOL)usernameIsEmailAddress;
+ (MailAccount)accountWithPath:(id)a3;
+ (MailAccount)accountWithURL:(id)a3;
+ (MailAccount)accountWithURLString:(id)a3;
+ (MailAccount)accountWithUniqueId:(id)a3;
+ (id)URLForInfo:(id)a3;
+ (id)_accountContainingEmailAddress:(id)a3 matchingAddress:(id *)a4 fullUserName:(id *)a5 includingInactive:(BOOL)a6;
+ (id)_accountWithPath:(id)a3;
+ (id)_defaultMailAccountForDeliveryIncludingRestricted:(BOOL)a3;
+ (id)_loadAllAccountsWithOptions:(unint64_t)a3 error:(id *)a4;
+ (id)accountContainingEmailAddress:(id)a3;
+ (id)accountContainingEmailAddress:(id)a3 includingInactive:(BOOL)a4;
+ (id)accountForHeaders:(id)a3 message:(id)a4 includingInactive:(BOOL)a5;
+ (id)accountThatMessageIsFrom:(id)a3;
+ (id)accountThatMessageIsFrom:(id)a3 includingInactive:(BOOL)a4;
+ (id)accountUsingHeadersFromMessage:(id)a3;
+ (id)activeAccounts;
+ (id)activeAccountsWithError:(id *)a3;
+ (id)addressesThatReceivedMessage:(id)a3;
+ (id)allActivePrimaryMailboxUids;
+ (id)allEmailAddressesIncludingFullUserName:(BOOL)a3 includeReceiveAliases:(BOOL)a4;
+ (id)allMailboxUids;
+ (id)csAccountTypeString;
+ (id)defaultAccountDirectory;
+ (id)defaultDeliveryAccount;
+ (id)defaultMailAccountForDelivery;
+ (id)defaultMailAccountForDeliveryExcludingRestricted;
+ (id)defaultPathForAccountWithHostname:(id)a3 username:(id)a4;
+ (id)defaultPathNameForAccountWithHostname:(id)a3 username:(id)a4;
+ (id)existingAccountForUniqueID:(id)a3;
+ (id)existingAccountWithType:(id)a3 hostname:(id)a4 username:(id)a5;
+ (id)infoForURL:(id)a3;
+ (id)lastMailAccountsReloadDate;
+ (id)lastMailAccountsReloadError;
+ (id)mailAccounts;
+ (id)mailAccountsWithError:(id *)a3;
+ (id)mailboxUidForFileSystemPath:(id)a3 create:(BOOL)a4;
+ (id)mailboxUidFromActiveAccountsForURL:(id)a3;
+ (id)newAccountWithDictionary:(id)a3;
+ (id)newAccountWithPath:(id)a3;
+ (id)outboxMailboxUid;
+ (id)outboxMessageStore:(BOOL)a3;
+ (id)predefinedValueForKey:(id)a3;
+ (id)purgableAccounts;
+ (id)purgableAccountsWithError:(id *)a3;
+ (id)standardAccountClass:(Class)a3 valueForKey:(id)a4;
+ (void)_addAccountToSortedPaths:(id)a3;
+ (void)_removeAccountFromSortedPaths:(id)a3;
+ (void)_setMailAccounts:(id)a3 saveIfChanged:(BOOL)a4 alreadyLocked:(BOOL)a5;
+ (void)_setOutboxMailboxUid:(id)a3;
+ (void)_setupSortedPathsForAccounts:(id)a3;
+ (void)disableMailboxListingNotifications;
+ (void)enableMailboxListingNotifications:(BOOL)a3;
+ (void)initialize;
+ (void)reloadAccounts;
+ (void)resetMailboxTimers;
+ (void)saveStateForAllAccounts;
+ (void)setDataclassesConsideredActive:(id)a3;
+ (void)setGlobalPathForAccounts:(id)a3;
+ (void)setMailAccountLoadOptions:(unint64_t)a3;
+ (void)setMailAccounts:(id)a3;
+ (void)setMailAccounts:(id)a3 saveIfChanged:(BOOL)a4;
+ (void)synchronouslyEmptyMailboxUidType:(int)a3 inAccounts:(id)a4;
+ (void)updateAutoFetchSettings;
+ (void)updateEmailAliasesForActiveAccounts;
- (BOOL)_assignSpecialMailboxToAppropriateIvar:(id)a3 forType:(int)a4;
- (BOOL)_canEmptyMessagesFromMailboxUid:(id)a3;
- (BOOL)_cleanInboxDuplication:(id)a3;
- (BOOL)_deleteMailbox:(id)a3;
- (BOOL)_loadMailboxListingIntoCache:(id)a3 attributes:(unsigned int)a4 children:(id)a5 parent:(id)a6;
- (BOOL)_registerPushNotificationPrefix:(id)a3 forMailboxNames:(id)a4;
- (BOOL)_renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5;
- (BOOL)_resetSpecialMailboxes;
- (BOOL)_setChildren:(id)a3 forMailboxUid:(id)a4;
- (BOOL)_setPath:(id)a3;
- (BOOL)_shouldLogDeleteActivity;
- (BOOL)archiveSentMessages;
- (BOOL)canAppendMessages;
- (BOOL)canArchiveForMailbox:(id)a3;
- (BOOL)canCreateNewMailboxes;
- (BOOL)canFetch;
- (BOOL)canForwardWithoutDownload;
- (BOOL)canMailboxBeDeleted:(id)a3;
- (BOOL)canMailboxBeRenamed:(id)a3;
- (BOOL)canReceiveNewMailNotifications;
- (BOOL)canUseCarrierDeliveryFallback;
- (BOOL)canUseDeliveryAccount:(id)a3;
- (BOOL)deleteInPlaceForAllMailboxes;
- (BOOL)deleteInPlaceForMailbox:(id)a3;
- (BOOL)deleteMailbox:(id)a3;
- (BOOL)deliveryAccountInUseByOtherAccounts:(id)a3;
- (BOOL)derivesDeliveryAccountInfoFromMailAccount;
- (BOOL)hasEnoughInformationForEasySetup;
- (BOOL)isAccountClassEquivalentTo:(id)a3;
- (BOOL)isActive;
- (BOOL)isActiveWithPersistentAccount:(id)a3;
- (BOOL)isEquivalentTo:(id)a3 hostname:(id)a4 username:(id)a5;
- (BOOL)isHostnameEquivalentTo:(id)a3;
- (BOOL)isMailboxLocalForType:(int)a3;
- (BOOL)isPrimaryDeliveryAccountDisabled;
- (BOOL)isSpecialMailbox:(id)a3;
- (BOOL)isUsernameEquivalentTo:(id)a3;
- (BOOL)moveMailbox:(id)a3 intoParent:(id)a4;
- (BOOL)needsRemoteSearchResultsVerification;
- (BOOL)newMailboxNameIsAcceptable:(id)a3 reasonForFailure:(id *)a4;
- (BOOL)ownsMailboxUidWithURL:(id)a3;
- (BOOL)perMessageEncryptionEnabled;
- (BOOL)preventArchiveForMailbox:(id)a3;
- (BOOL)reconstituteOrphanedMeetingInMessage:(id)a3;
- (BOOL)renameMailbox:(id)a3 newName:(id)a4;
- (BOOL)restrictedFromSendingExternally;
- (BOOL)restrictedFromSyncingRecents;
- (BOOL)restrictedFromTransferingMessagesToOtherAccounts;
- (BOOL)secureMIMEEnabled;
- (BOOL)shouldAppearInMailSettings;
- (BOOL)shouldArchiveByDefault;
- (BOOL)shouldExpungeMessagesOnDelete;
- (BOOL)shouldFetchAgainWithError:(id)a3 foregroundRequest:(BOOL)a4;
- (BOOL)shouldFetchBodiesWhenMovingToTrash;
- (BOOL)shouldRestoreMessagesAfterFailedDelete;
- (BOOL)sourceIsManaged;
- (BOOL)supportsAppend;
- (BOOL)supportsArchiving;
- (BOOL)supportsContinuationType:(id)a3;
- (BOOL)supportsFastRemoteBodySearch;
- (BOOL)supportsMailDrop;
- (BOOL)supportsMailboxEditing;
- (BOOL)supportsMessageFlagging;
- (BOOL)supportsPurge;
- (BOOL)supportsRemoteAppend;
- (BOOL)supportsSyncingReadState;
- (BOOL)supportsThreadOperations;
- (BOOL)supportsUserPushedMailboxes;
- (BOOL)updateEmailAliases;
- (BOOL)willPerformActionForChokePoint:(id)a3 coalescePoint:(id)a4 result:(id *)a5;
- (Class)storeClass;
- (MailAccount)initWithLibrary:(id)a3 path:(id)a4;
- (MailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4;
- (MailAccount)initWithPath:(id)a3;
- (MailAccount)initWithPersistentAccount:(id)a3;
- (NSString)mailboxPathExtension;
- (id)URLForMessage:(id)a3;
- (id)URLString;
- (id)_URLForInfo:(id)a3;
- (id)_URLScheme;
- (id)_cachedSpecialMailboxOfType:(int)a3;
- (id)_childOfMailbox:(id)a3 withComponentName:(id)a4;
- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 existingMailboxUid:(id)a6 dictionary:(id)a7;
- (id)_copyMailboxWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 dictionary:(id)a6;
- (id)_defaultSpecialMailboxNameForType:(int)a3;
- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3;
- (id)_infoForMatchingURL:(id)a3;
- (id)_localMailboxNameForType:(int)a3 usingDisplayName:(id)a4;
- (id)_mailboxPathPrefix;
- (id)_pathComponentForUidName:(id)a3;
- (id)_specialMailboxIvarOfType:(int)a3;
- (id)_specialMailboxUidWithType:(int)a3 create:(BOOL)a4;
- (id)_uidNameForPathComponent:(id)a3;
- (id)allLocalMailboxUids;
- (id)allMailMailboxUid;
- (id)allMailboxUids;
- (id)connectionError;
- (id)copyDataForRemoteEncryptionCertificatesForAddress:(id)a3 error:(id *)a4;
- (id)customSignature;
- (id)defaultEmailAddress;
- (id)deliveryAccount;
- (id)deliveryAccountAlternates;
- (id)description;
- (id)displayName;
- (id)displayNameForMailboxUid:(id)a3;
- (id)displayNameUsingSpecialNamesForMailboxUid:(id)a3;
- (id)emailAddresses;
- (id)emailAddressesAndAliases;
- (id)emailAddressesDictionary;
- (id)encryptionIdentityPersistentReferenceForAddress:(id)a3;
- (id)fetchLimits;
- (id)firstEmailAddress;
- (id)fullUserName;
- (id)iconString;
- (id)lastEmailAliasesSyncDate;
- (id)library;
- (id)loggingIdentifier;
- (id)mailboxCachePath;
- (id)mailboxUidForInfo:(id)a3;
- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4;
- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4 withOption:(int)a5;
- (id)mailboxUidForURL:(id)a3;
- (id)mailboxUidOfType:(int)a3 createIfNeeded:(BOOL)a4;
- (id)mailboxesForSuggestionsLostMessageSearchPriorToTime:(double)a3;
- (id)meetingStorePersistentID;
- (id)moveMessages:(id)a3 fromMailbox:(id)a4 toMailbox:(id)a5 markAsRead:(BOOL)a6;
- (id)newMailboxWithParent:(id)a3 name:(id)a4;
- (id)path;
- (id)persistentNameForMailbox:(id)a3;
- (id)powerAssertionIdentifierWithPrefix:(id)a3;
- (id)primaryMailboxUid;
- (id)pushedMailboxUids;
- (id)receiveEmailAliasAddresses;
- (id)receiveEmailAliasAddressesList;
- (id)rootMailboxUid;
- (id)saveSentFolder;
- (id)signingIdentityPersistentReferenceForAddress:(id)a3;
- (id)specialMailboxNameForType:(int)a3;
- (id)statisticsKind;
- (id)storeForMailboxUid:(id)a3;
- (id)tildeAbbreviatedPath;
- (id)transferDisabledMailboxUids;
- (id)unactionableInvitationICSRepresentationInMessage:(id)a3 summary:(id *)a4;
- (id)uniqueServerIdForMessage:(id)a3;
- (id)unsupportedContinuationTypes;
- (id)valueInAccountLookAsidePropertiesForKey:(id)a3;
- (int)_emptyFrequencyForKey:(id)a3 defaultValue:(id)a4;
- (int)archiveDestinationForMailbox:(id)a3;
- (int)cachePolicy;
- (int)emptyFrequencyForMailboxType:(int)a3;
- (int)secureCompositionEncryptionPolicyForAddress:(id)a3;
- (int)secureCompositionSigningPolicyForAddress:(id)a3;
- (int64_t)libraryID;
- (void)_asynchronouslyInvalidateAndDeleteAccountData:(BOOL)a3;
- (void)_didBecomeActive:(BOOL)a3;
- (void)_invalidateAndDeleteAccountData:(BOOL)a3;
- (void)_invalidateCachedMailboxen;
- (void)_loadEntriesFromFileSystemPath:(id)a3 parent:(id)a4;
- (void)_resetAllMailboxURLs:(BOOL)a3;
- (void)_setAccountProperties:(id)a3;
- (void)_setEmptyFrequency:(int)a3 forKey:(id)a4;
- (void)_setSpecialMailbox:(id)a3 forType:(int)a4;
- (void)_setSpecialMailboxName:(id)a3 forType:(int)a4;
- (void)_synchronizeMailboxListWithFileSystem;
- (void)_writeMailboxCacheWithPrejudice:(BOOL)a3;
- (void)dealloc;
- (void)deleteDeliveryAccountIfNeeded;
- (void)deleteMessagesFromMailboxUid:(id)a3 olderThanNumberOfDays:(unsigned int)a4;
- (void)deliveryAccountWillBeRemoved:(id)a3;
- (void)didFinishActionForChokePoint:(id)a3 coalescePoint:(id)a4 withResult:(id)a5;
- (void)emptyTrash;
- (void)forceFetchMailboxList;
- (void)invalidate;
- (void)invalidateAndDelete;
- (void)libraryID;
- (void)nowWouldBeAGoodTimeToStartBackgroundSynchronization;
- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4;
- (void)releaseAllConnections;
- (void)releaseAllForcedConnections;
- (void)resetMailboxURLs;
- (void)saveState;
- (void)setActive:(BOOL)a3;
- (void)setCachePolicy:(int)a3;
- (void)setCanUseCarrierDeliveryFallback:(BOOL)a3;
- (void)setConnectionError:(id)a3;
- (void)setCustomSignature:(id)a3;
- (void)setDefaultEmailAddress:(id)a3;
- (void)setDeliveryAccount:(id)a3;
- (void)setDeliveryAccountAlternates:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setEmptyFrequency:(int)a3 forMailboxType:(int)a4;
- (void)setEncryptionIdentityPersistentReference:(id)a3 forAddress:(id)a4;
- (void)setFullUserName:(id)a3;
- (void)setHostname:(id)a3;
- (void)setLastEmailAliasesSyncDate:(id)a3;
- (void)setLastKnownHostname:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setMailboxCachePath:(id)a3;
- (void)setPath:(id)a3;
- (void)setPortNumber:(unsigned int)a3;
- (void)setPrimaryDeliveryAccountDisabled:(BOOL)a3;
- (void)setReceiveEmailAliasAddresses:(id)a3;
- (void)setSigningIdentityPersistentReference:(id)a3 forAddress:(id)a4;
- (void)setUsername:(id)a3;
- (void)setValueInAccountProperties:(id)a3 forKey:(id)a4;
@end

@implementation MailAccount

+ (id)accountContainingEmailAddress:(id)a3
{
  return (id)[a1 _accountContainingEmailAddress:a3 matchingAddress:0 fullUserName:0 includingInactive:0];
}

+ (void)reloadAccounts
{
  [a1 disableMailboxListingNotifications];
  +[MailAccount mf_lock];

  _lastAccountsReloadDate = (uint64_t)(id)[MEMORY[0x1E4F1C9C8] date];
  id v4 = 0;
  v3 = objc_msgSend((id)objc_msgSend(a1, "_loadAllAccountsWithOptions:error:", __mailAccountLoadOptions, &v4), "mutableCopy");
  if (v4 != (id)_lastAccountsReloadError)
  {

    _lastAccountsReloadError = (uint64_t)v4;
  }
  if (v3)
  {
    [a1 _setMailAccounts:v3 saveIfChanged:0 alreadyLocked:1];
  }
  +[MailAccount mf_unlock];
  [a1 enableMailboxListingNotifications:0];
}

+ (id)URLForInfo:(id)a3
{
  id result = (id)[a3 objectForKey:@"Account"];
  if (result)
  {
    return (id)[result _URLForInfo:a3];
  }
  return result;
}

- (void)releaseAllConnections
{
  id v2 = [(MailAccount *)self _deliveryAccountCreateIfNeeded:0];
  [v2 releaseAllConnections];
}

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id result = [(MFAccount *)self _objectForAccountInfoKey:@"SMTPIdentifier"];
  if (result)
  {
    if (v3)
    {
      return +[DeliveryAccount accountWithIdentifier:result];
    }
    else
    {
      return +[DeliveryAccount existingAccountWithIdentifier:result];
    }
  }
  return result;
}

uint64_t __39__MailAccount_activeAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isActive];
}

- (BOOL)_resetSpecialMailboxes
{
  [(MailAccount *)self mf_lock];
  int v3 = (self->_inboxMailboxUid != 0) | (2 * (self->_draftsMailboxUid != 0)) | (4
                                                                                 * (self->_sentMessagesMailboxUid != 0)) | (8 * (self->_trashMailboxUid != 0)) | (16 * (self->_archiveMailboxUid != 0));
  BOOL v4 = self->_junkMailboxUid != 0;
  [(MailAccount *)self mf_unlock];
  int v5 = [(id)objc_opt_class() mailboxListingNotificationAreEnabled];
  if (v5) {
    [(id)objc_opt_class() disableMailboxListingNotifications];
  }
  uint64_t v6 = 0;
  int v7 = 0;
  int v11 = v3 | (32 * v4);
  do
  {
    v7 |= [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:[(MailAccount *)self _specialMailboxUidWithType:dword_1CFD6F6C0[v6] create:0] forType:dword_1CFD6F6C0[v6]];
    ++v6;
  }
  while (v6 != 6);
  if (v7)
  {
    BOOL v8 = 1;
    if (!v5) {
      return v8;
    }
    goto LABEL_9;
  }
  [(MailAccount *)self mf_lock];
  int v9 = (self->_inboxMailboxUid != 0) | (2 * (self->_draftsMailboxUid != 0)) | (4
                                                                                 * (self->_sentMessagesMailboxUid != 0)) | (8 * (self->_trashMailboxUid != 0)) | (16 * (self->_archiveMailboxUid != 0)) | (32 * (self->_junkMailboxUid != 0));
  [(MailAccount *)self mf_unlock];
  BOOL v8 = v11 != v9;
  if (v5) {
LABEL_9:
  }
    [(id)objc_opt_class() enableMailboxListingNotifications:v8];
  return v8;
}

- (BOOL)_assignSpecialMailboxToAppropriateIvar:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v7 = [(MailAccount *)self _specialMailboxIvarOfType:*(void *)&a4];
  [(MFLock *)self->_cachedMailboxenLock lock];
  if (v7)
  {
    id v8 = *v7;
    if (*v7 == a3)
    {
      [(MFLock *)self->_cachedMailboxenLock unlock];
      return 0;
    }
    [*v7 setType:0];
    [v8 setRepresentedAccount:0];
    [a3 setType:v4];
    int v9 = (void *)[v8 parent];
    v10 = (void *)[a3 parent];
    *int v7 = a3;
  }
  else
  {
    id v8 = 0;
    int v9 = 0;
    v10 = 0;
  }
  BOOL v11 = v8 == a3;
  BOOL v12 = v8 != a3;
  if (!v11) {

  }
  [(MFLock *)self->_cachedMailboxenLock unlock];
  if (v10) {
    objc_msgSend((id)objc_msgSend(v10, "account"), "_setChildren:forMailboxUid:", 0, v10);
  }
  if (v9 && v10 != v9) {
    objc_msgSend((id)objc_msgSend(v9, "account"), "_setChildren:forMailboxUid:", 0, v9);
  }
  return v12;
}

- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4
{
  return [(MailAccount *)self mailboxUidForRelativePath:a3 create:a4 withOption:0];
}

- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4 withOption:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = (void *)[a3 pathComponents];
  unint64_t v9 = [v8 count];
  id v10 = [(MailAccount *)self rootMailboxUid];
  [(MailAccount *)self mf_lock];
  id v11 = 0;
  if (!v10 || !v9) {
    goto LABEL_29;
  }
  id v22 = 0;
  id v11 = 0;
  unint64_t v12 = 1;
  do
  {
    v13 = (void *)[v8 objectAtIndex:v12 - 1];
    if (v9 == v12
      && objc_msgSend(v13, "hasSuffix:", -[MailAccount mailboxPathExtension](self, "mailboxPathExtension")))
    {
      v13 = (void *)[v13 stringByDeletingPathExtension];
    }
    id v14 = [(MailAccount *)self _uidNameForPathComponent:v13];
    id v15 = [(MailAccount *)self _childOfMailbox:v10 withComponentName:v14];
    if (v15 || !v6)
    {
      id v10 = v15;
      if (!v15) {
        break;
      }
      continue;
    }
    [(MailAccount *)self mf_unlock];
    if (v9 == v12) {
      uint64_t v16 = 257;
    }
    else {
      uint64_t v16 = 258;
    }
    id v17 = [(MailAccount *)self _newMailboxWithParent:v10 name:v14 attributes:v16 dictionary:0 withCreationOption:v5];
    [(MailAccount *)self mf_lock];
    id v18 = [(MailAccount *)self _childOfMailbox:v10 withComponentName:v14];
    id v19 = v18;
    if (v17)
    {
      if (!v18)
      {
        if (v22)
        {
          v23[0] = v17;
          objc_msgSend(v10, "setChildren:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 1));
        }
        else
        {
          id v11 = (id)[v10 mutableCopyOfChildren];
          if (!v11) {
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v11 addObject:v17];
          id v22 = v10;
        }
        id v19 = v17;
        ++*(_WORD *)&self->_flags;
      }
    }
    id v10 = v19;
    if (!v19) {
      break;
    }
  }
  while (v12++ < v9);
  if (v10 && v22)
  {
    [(MailAccount *)self mf_unlock];
    [(MailAccount *)self _setChildren:v11 forMailboxUid:v22];
    [(MailAccount *)self mf_lock];
  }
LABEL_29:
  [(MailAccount *)self mf_unlock];

  return v10;
}

- (id)_childOfMailbox:(id)a3 withComponentName:(id)a4
{
  id result = (id)[a3 childWithName:a4];
  if (!result)
  {
    return (id)[a3 childWithExtraAttribute:a4];
  }
  return result;
}

- (id)_specialMailboxUidWithType:(int)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = -[MailAccount specialMailboxNameForType:](self, "specialMailboxNameForType:");
  if (!v7)
  {
    id v7 = [(MailAccount *)self _defaultSpecialMailboxNameForType:v5];
    [(MailAccount *)self _setSpecialMailboxName:v7 forType:v5];
  }
  return [(MailAccount *)self mailboxUidForRelativePath:v7 create:v4];
}

- (id)specialMailboxNameForType:(int)a3
{
  if ((a3 - 1) > 4) {
    return 0;
  }
  else {
    return [(MFAccount *)self _objectForAccountInfoKey:off_1E6866928[a3 - 1]];
  }
}

- (id)_uidNameForPathComponent:(id)a3
{
  return a3;
}

+ (void)enableMailboxListingNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  _MFLockGlobalLock();
  _disableMailboxListingNotifications = 0;
  _MFUnlockGlobalLock();
  if (v3)
  {
    BOOL v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"AccountMailboxListingDidChange" object:0 userInfo:0];
  }
}

+ (id)addressesThatReceivedMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)[a3 headersIfAvailable];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v7 = (void *)[v4 copyAddressListForTo];
  [v5 addObjectsFromArray:v7];

  id v8 = (void *)[v4 copyAddressListForCc];
  [v5 addObjectsFromArray:v8];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "mf_uncommentedAddress");
        if ([a1 _accountContainingEmailAddress:v13 matchingAddress:0 fullUserName:0 includingInactive:0])
        {
          [v6 addObject:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v6;
}

+ (id)_accountContainingEmailAddress:(id)a3 matchingAddress:(id *)a4 fullUserName:(id *)a5 includingInactive:(BOOL)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend(a3, "mf_uncommentedAddress");
  uint64_t v9 = objc_msgSend(a3, "mf_addressComment");
  if (([v9 isEqualToString:&stru_1F265CF90] & 1) != 0
    || [v9 isEqualToString:a3])
  {
    uint64_t v9 = 0;
  }
  +[MailAccount mf_lock];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)_accounts;
  uint64_t v10 = [(id)_accounts countByEnumeratingWithState:&v35 objects:v40 count:16];
  uint64_t v11 = 0;
  if (v10)
  {
    v28 = 0;
    v29 = a4;
    uint64_t v25 = *(void *)v36;
LABEL_6:
    uint64_t v12 = 0;
    uint64_t v24 = v10;
    while (1)
    {
      if (*(void *)v36 != v25) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v35 + 1) + 8 * v12);
      uint64_t v27 = v12;
      if (a6 || [v13 isActive])
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v14 = objc_msgSend((id)objc_msgSend(v13, "emailAddressesAndAliasesList"), "mf_uncommentedAddressList");
        uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v32;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v14);
              }
              long long v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              if (![v18 caseInsensitiveCompare:v8])
              {
                uint64_t v19 = [v13 fullUserName];
                uint64_t v20 = (void *)v19;
                if (v9 && (!v19 || [v9 caseInsensitiveCompare:v19]))
                {
                  v28 = v13;
                }
                else
                {
                  if (v29) {
                    id *v29 = v18;
                  }
                  if (a5 && v20 && ([v20 isEqualToString:&stru_1F265CF90] & 1) == 0) {
                    *a5 = v20;
                  }
                  uint64_t v11 = v13;
                  if ([v13 isActive])
                  {
                    uint64_t v11 = v13;
                    goto LABEL_32;
                  }
                }
              }
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
      }
LABEL_32:
      if ([v11 isActive]) {
        break;
      }
      uint64_t v12 = v27 + 1;
      if (v27 + 1 == v24)
      {
        uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v10) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
  else
  {
    v28 = 0;
  }
  +[MailAccount mf_unlock];
  if (v28) {
    BOOL v21 = v11 == 0;
  }
  else {
    BOOL v21 = 0;
  }
  if (v21) {
    return v28;
  }
  else {
    return v11;
  }
}

- (id)emailAddressesDictionary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [(MFAccount *)self _objectForAccountInfoKey:@"EmailAddresses"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = (id)[v2 componentsSeparatedByString:@", "];
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_4:
    if (v2)
    {
      BOOL v3 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v11;
        uint64_t v7 = MEMORY[0x1E4F1CC38];
        while (1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v2);
          }
          [v3 addObject:v7];
          if (!--v5)
          {
            uint64_t v5 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
            if (!v5) {
              break;
            }
          }
        }
      }
      return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2];
    }
    return v2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v2)
  {
    uint64_t v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v2;
      _os_log_impl(&dword_1CFCFE000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Returned unhandled email addresses %@", buf, 0xCu);
    }
    return 0;
  }
  return v2;
}

- (BOOL)isActive
{
  BOOL v3 = [(MFAccount *)self persistentAccount];
  return [(MailAccount *)self isActiveWithPersistentAccount:v3];
}

- (BOOL)isActiveWithPersistentAccount:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v4 = [a3 isEnabledForDataclass:*MEMORY[0x1E4F17AD8]];
  if ((v4 & 1) == 0 && __dataclassesConsideredActive)
  {
    [(id)__dataclassesConsideredActiveLock lock];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = (void *)__dataclassesConsideredActive;
    uint64_t v6 = [(id)__dataclassesConsideredActive countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          if ([a3 isEnabledForDataclass:*(void *)(*((void *)&v11 + 1) + 8 * i)])
          {
            char v4 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    char v4 = 0;
LABEL_13:
    [(id)__dataclassesConsideredActiveLock unlock];
  }
  return v4;
}

+ (void)disableMailboxListingNotifications
{
  _MFLockGlobalLock();
  _disableMailboxListingNotifications = 1;
  _MFUnlockGlobalLock();
}

- (id)fullUserName
{
  return [(MFAccount *)self _objectForAccountInfoKey:@"FullUserName"];
}

- (void)_setSpecialMailboxName:(id)a3 forType:(int)a4
{
  _MFLockGlobalLock();
  int v7 = a4 - 1;
  if ((a4 - 1) <= 4)
  {
    if (a3) {
      [(MFAccount *)self setAccountProperty:a3 forKey:off_1E6866928[v7]];
    }
    else {
      [(MFAccount *)self removeAccountPropertyForKey:off_1E6866928[v7]];
    }
  }
  _MFUnlockGlobalLock();
}

- (void)saveState
{
  if (self->_flags) {
    [(MailAccount *)self _writeMailboxCacheWithPrejudice:1];
  }
}

- (id)_defaultSpecialMailboxNameForType:(int)a3
{
  if ((a3 - 1) > 6) {
    return 0;
  }
  else {
    return off_1E68668B8[a3 - 1];
  }
}

- (id)displayNameUsingSpecialNamesForMailboxUid:(id)a3
{
  return 0;
}

- (id)displayName
{
  id v3 = [(MFAccount *)self _objectForAccountInfoKey:@"DisplayName"];
  if (![v3 length])
  {
    id v4 = [(MailAccount *)self firstEmailAddress];
    if (v4)
    {
      id v3 = v4;
      _MFLockGlobalLock();
      [(MFAccount *)self setAccountProperty:v3 forKey:@"DisplayName"];
      _MFUnlockGlobalLock();
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)MailAccount;
      return [(MFAccount *)&v6 displayName];
    }
  }
  return v3;
}

- (id)_pathComponentForUidName:(id)a3
{
  return a3;
}

+ (void)_addAccountToSortedPaths:(id)a3
{
  id v4 = (void *)[a3 path];
  if ([v4 hasPrefix:@"~"])
  {
    uint64_t v5 = objc_msgSend(v4, "mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath");
  }
  else
  {
    uint64_t v5 = v4;
    id v4 = (void *)[a3 tildeAbbreviatedPath];
  }
  objc_super v6 = (const void *)objc_msgSend(v5, "mf_betterStringByResolvingSymlinksInPath");
  CFArrayRef v7 = (const __CFArray *)_sortedAccountPaths;
  v15.length = CFArrayGetCount((CFArrayRef)_sortedAccountPaths);
  v15.location = 0;
  CFIndex v8 = CFArrayBSearchValues(v7, v15, v5, MEMORY[0x1E4F1C2A8], 0);
  CFArrayInsertValueAtIndex((CFMutableArrayRef)_sortedAccountPaths, v8, v5);
  CFArrayInsertValueAtIndex((CFMutableArrayRef)_accountsSortedByPath, v8, a3);
  if (([v5 isEqualToString:v4] & 1) == 0)
  {
    CFArrayRef v9 = (const __CFArray *)_sortedAccountPaths;
    v16.length = CFArrayGetCount((CFArrayRef)_sortedAccountPaths);
    v16.location = 0;
    CFIndex v10 = CFArrayBSearchValues(v9, v16, v4, MEMORY[0x1E4F1C2A8], 0);
    CFArrayInsertValueAtIndex((CFMutableArrayRef)_sortedAccountPaths, v10, v4);
    CFArrayInsertValueAtIndex((CFMutableArrayRef)_accountsSortedByPath, v10, a3);
  }
  if (([v5 isEqualToString:v6] & 1) == 0)
  {
    CFArrayRef v11 = (const __CFArray *)_sortedAccountPaths;
    v17.length = CFArrayGetCount((CFArrayRef)_sortedAccountPaths);
    v17.location = 0;
    CFIndex v12 = CFArrayBSearchValues(v11, v17, v6, MEMORY[0x1E4F1C2A8], 0);
    CFArrayInsertValueAtIndex((CFMutableArrayRef)_sortedAccountPaths, v12, v6);
    long long v13 = (__CFArray *)_accountsSortedByPath;
    CFArrayInsertValueAtIndex(v13, v12, a3);
  }
}

- (id)path
{
  if (!self->_path) {
    -[MailAccount setPath:](self, "setPath:", objc_msgSend((id)objc_opt_class(), "defaultPathForAccountWithHostname:username:", -[MFAccount hostname](self, "hostname"), -[MFAccount username](self, "username")));
  }
  if (!__globalPathSwitch) {
    return self->_path;
  }
  id result = self->_nonPersistentPath;
  if (!result)
  {
    id v4 = (NSString *)objc_msgSend((id)__globalPathSwitch, "stringByAppendingPathComponent:", objc_msgSend((id)objc_opt_class(), "defaultPathNameForAccountWithHostname:username:", -[MFAccount hostname](self, "hostname"), -[MFAccount username](self, "username")));
    self->_nonPersistentPath = v4;
    id result = [(NSString *)v4 mf_betterStringByResolvingSymlinksInPath];
    self->_nonPersistentPath = (NSString *)result;
  }
  return result;
}

- (BOOL)_setChildren:(id)a3 forMailboxUid:(id)a4
{
  CFArrayRef v7 = (void *)[a4 mutableCopyOfChildren];
  CFIndex v8 = v7;
  if (a3)
  {
    id v9 = a3;
    if (![a4 setChildren:a3])
    {
      BOOL v10 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    a3 = v7;
    if (a3) {
      [a4 setChildren:a3];
    }
  }
  if ((*((unsigned char *)&self->_flags + 2) & 2) != 0
    && [(id)objc_opt_class() mailboxListingNotificationAreEnabled])
  {
    CFArrayRef v11 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    objc_msgSend(v11, "postNotification:", objc_msgSend(MEMORY[0x1E4F28EA0], "notificationWithName:object:userInfo:", @"AccountMailboxListingDidChange", a4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v8, @"OldChildren", a3, @"NewChildren", 0)));
  }
  BOOL v10 = 1;
LABEL_10:

  return v10;
}

- (id)mailboxUidForURL:(id)a3
{
  if (!-[MailAccount ownsMailboxUidWithURL:](self, "ownsMailboxUidWithURL:")) {
    return 0;
  }
  id v5 = -[MailAccount _infoForMatchingURL:](self, "_infoForMatchingURL:", [MEMORY[0x1E4F1CB10] URLWithString:a3]);
  return [(MailAccount *)self mailboxUidForInfo:v5];
}

- (BOOL)ownsMailboxUidWithURL:(id)a3
{
  id v4 = [(MailAccount *)self URLString];
  return [a3 hasPrefix:v4];
}

- (id)URLString
{
  id v2 = -[MailAccount _URLForInfo:](self, "_URLForInfo:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", self, @"Account", &stru_1F265CF90, @"RelativePath", 0));
  return (id)[v2 absoluteString];
}

- (id)persistentNameForMailbox:(id)a3
{
  return 0;
}

- (id)mailboxUidForInfo:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"RelativePath"];
  return [(MailAccount *)self mailboxUidForRelativePath:v4 create:0];
}

- (id)_URLForInfo:(id)a3
{
  id result = [(MailAccount *)self _URLScheme];
  if (result)
  {
    id v6 = result;
    CFArrayRef v7 = [(MFAccount *)self hostname];
    CFIndex v8 = v7;
    if (v7) {
      CFArrayRef v7 = -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](v7, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E4F1CB10], "ef_defaultAllowedCharacterSet"));
    }
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = v8;
    }
    BOOL v10 = [(MFAccount *)self username];
    CFArrayRef v11 = v10;
    if (v10) {
      BOOL v10 = -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](v10, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E4F1CB10], "ef_defaultAllowedCharacterSet"));
    }
    if (v10) {
      CFIndex v12 = v10;
    }
    else {
      CFIndex v12 = v11;
    }
    uint64_t v13 = [(MFAccount *)self portNumber];
    long long v14 = (void *)[a3 objectForKey:@"RelativePath"];
    CFRange v15 = (void *)[v6 mutableCopy];
    [v15 appendString:@"://"];
    if (v12 && ![(NSString *)v12 isEqualToString:&stru_1F265CF90])
    {
      [v15 appendString:v12];
      [v15 appendString:@"@"];
    }
    if (v9) {
      [v15 appendString:v9];
    }
    if (v13
      && (v13 != [(MFAccount *)self defaultPortNumber]
       && v13 != [(MFAccount *)self defaultSecurePortNumber]
       || v13 == [(MFAccount *)self defaultSecurePortNumber]
       && objc_msgSend(a3, "mf_BOOLForKey:", @"IncludeDefaultSecurePortNumber")))
    {
      objc_msgSend(v15, "appendFormat:", @":%u", v13);
    }
    [v15 appendString:@"/"];
    if (v14) {
      objc_msgSend(v15, "appendString:", objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E4F28B88], "URLPathAllowedCharacterSet")));
    }
    CFRange v16 = (void *)[MEMORY[0x1E4F1CB10] URLWithString:v15];

    return v16;
  }
  return result;
}

+ (BOOL)mailboxListingNotificationAreEnabled
{
  _MFLockGlobalLock();
  char v2 = _disableMailboxListingNotifications;
  _MFUnlockGlobalLock();
  return (v2 & 1) == 0;
}

- (id)_mailboxPathPrefix
{
  return &stru_1F265CF90;
}

+ (id)activeAccountsWithError:(id *)a3
{
  id v3 = (void *)[a1 mailAccountsWithError:a3];
  return (id)objc_msgSend(v3, "ef_filter:", &__block_literal_global_6);
}

+ (MailAccount)accountWithUniqueId:(id)a3
{
  uint64_t v4 = (void *)[a1 mailAccounts];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__MailAccount_accountWithUniqueId___block_invoke;
  v6[3] = &unk_1E6866818;
  v6[4] = a3;
  return (MailAccount *)(id)objc_msgSend(v4, "ef_firstObjectPassingTest:", v6);
}

+ (id)mailAccountsWithError:(id *)a3
{
  +[MailAccount mf_lock];
  id v5 = (void *)_accounts;
  if (!_accounts)
  {
    [a1 reloadAccounts];
    id v5 = (void *)_accounts;
  }
  id v6 = v5;
  if (a3) {
    *a3 = (id)_lastAccountsReloadError;
  }
  +[MailAccount mf_unlock];
  return v6;
}

+ (id)mailAccounts
{
  return (id)[a1 mailAccountsWithError:0];
}

- (id)mailboxUidOfType:(int)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = -[MailAccount _cachedSpecialMailboxOfType:](self, "_cachedSpecialMailboxOfType:");
  if (!v7)
  {
    id v9 = [(MailAccount *)self _specialMailboxUidWithType:v5 create:v4];
    id v7 = v9;
    if (v9)
    {
      if ([v9 type] != v5) {
        [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:v7 forType:v5];
      }
    }
  }
  return v7;
}

- (id)_cachedSpecialMailboxOfType:(int)a3
{
  id result = [(MailAccount *)self _specialMailboxIvarOfType:*(void *)&a3];
  if (result)
  {
    uint64_t v5 = (id *)result;
    [(MFLock *)self->_cachedMailboxenLock lock];
    id v6 = *v5;
    [(MFLock *)self->_cachedMailboxenLock unlock];
    return v6;
  }
  return result;
}

- (id)mailboxCachePath
{
  mailboxCachePath = self->_mailboxCachePath;
  if (mailboxCachePath)
  {
    id v3 = mailboxCachePath;
    return v3;
  }
  else
  {
    id v5 = [(MailAccount *)self path];
    return (id)[v5 stringByAppendingPathComponent:@".mboxCache.plist"];
  }
}

- (id)encryptionIdentityPersistentReferenceForAddress:(id)a3
{
  id v4 = [(MailAccount *)self valueInAccountLookAsidePropertiesForKey:@"EncryptionIdentities"];
  return (id)[v4 objectForKey:a3];
}

- (id)valueInAccountLookAsidePropertiesForKey:(id)a3
{
  return 0;
}

- (MailAccount)initWithLibrary:(id)a3 path:(id)a4
{
  id v5 = [(MailAccount *)self initWithLibrary:a3 persistentAccount:0];
  id v6 = v5;
  if (v5) {
    [(MailAccount *)v5 _setPath:a4];
  }
  return v6;
}

- (BOOL)_setPath:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath"), "stringByStandardizingPath");
  if (!a3) {
    return 0;
  }
  id v6 = (void *)v5;
  if ([(NSString *)self->_path isEqualToString:v5]) {
    return 0;
  }
  CFIndex v8 = self->_path;
  self->_path = (NSString *)[v6 copy];
  +[MailAccount mf_lock];
  CFArrayRef v9 = (const __CFArray *)_accountsSortedByPath;
  if (!_accountsSortedByPath
    || (v11.length = CFArrayGetCount((CFArrayRef)_accountsSortedByPath),
        v11.location = 0,
        CFArrayGetFirstIndexOfValue(v9, v11, self) != -1))
  {
    [(id)objc_opt_class() _removeAccountFromSortedPaths:self];
    [(id)objc_opt_class() _addAccountToSortedPaths:self];
  }
  +[MailAccount mf_unlock];
  id v10 = [(MailAccount *)self tildeAbbreviatedPath];
  _MFLockGlobalLock();
  [(MFAccount *)self setAccountProperty:v10 forKey:@"AccountPath"];
  _MFUnlockGlobalLock();
  return 1;
}

- (MailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MailAccount;
  uint64_t v5 = [(MFAccount *)&v7 initWithPersistentAccount:a4];
  if (v5)
  {
    v5->_cachedMailboxenLock = (MFLock *)[objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"CachedMailboxenLock" andDelegate:v5];
    v5->_deletionLock = (MFLock *)[objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"MailAccountDeletionLock" andDelegate:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v5, sel_deliveryAccountWillBeRemoved_, @"DeliveryAccountWillBeRemoved", 0);
    if (a3) {
      [(MailAccount *)v5 setLibrary:a3];
    }
    else {
      [(MailAccount *)v5 setupLibrary];
    }
    v5->_cachedLibraryID = -1;
    v5->_cachedLibraryIDLock = (MFLock *)[objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"MailAccount LibraryID Lock" andDelegate:0];
    v5->_messageStoresCache = [[MFWeakObjectCache alloc] initWithBlock:&__block_literal_global_140];
  }
  return v5;
}

- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MailAccount;
  -[MFAccount persistentAccountDidChange:previousAccount:](&v9, sel_persistentAccountDidChange_previousAccount_);
  if (a4)
  {
    BOOL v7 = [(MailAccount *)self isActiveWithPersistentAccount:a4];
    BOOL v8 = [(MailAccount *)self isActiveWithPersistentAccount:a3];
    if (v7 != v8) {
      [(MailAccount *)self _didBecomeActive:v8];
    }
    [(MailAccount *)self _invalidateCachedMailboxen];
  }
}

- (id)library
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!self->_library)
  {
    id v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = self;
      _os_log_impl(&dword_1CFCFE000, v3, OS_LOG_TYPE_DEFAULT, "#Warning %@: no library!", (uint8_t *)&v5, 0xCu);
    }
  }
  return self->_library;
}

- (MailAccount)initWithPersistentAccount:(id)a3
{
  return [(MailAccount *)self initWithLibrary:0 persistentAccount:a3];
}

- (void)_invalidateCachedMailboxen
{
  self->_draftsMailboxUid = 0;
  self->_sentMessagesMailboxUid = 0;

  self->_trashMailboxUid = 0;
  self->_archiveMailboxUid = 0;

  self->_junkMailboxUid = 0;
  [(MFLock *)self->_cachedMailboxenLock unlock];
  *(_DWORD *)&self->_flags &= ~0x20000u;
}

+ (id)existingAccountForUniqueID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  +[MailAccount mf_lock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (void *)_accounts;
  uint64_t v5 = [(id)_accounts countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      objc_super v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if (objc_msgSend((id)objc_msgSend(v9, "uniqueId"), "isEqualToString:", a3)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    objc_super v9 = 0;
  }
  +[MailAccount mf_unlock];
  return v9;
}

- (BOOL)_loadMailboxListingIntoCache:(id)a3 attributes:(unsigned int)a4 children:(id)a5 parent:(id)a6
{
  id v48 = a5;
  CFArrayRef v6 = 0;
  Mutable = 0;
  CFArrayRef v8 = 0;
  int v9 = 0;
  do
  {
    ValueAtIndex = v48;
    if (v8) {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v8, 0);
    }
    long long v11 = a6;
    if (v6) {
      long long v11 = (void *)CFArrayGetValueAtIndex(v6, 0);
    }
    long long v12 = objc_msgSend(v11, "mutableCopyOfChildren", a3, *(void *)&a4, v48);
    CFIndex v13 = [ValueAtIndex count];
    id v14 = ValueAtIndex;
    if (v8) {
      CFArrayRemoveValueAtIndex(v8, 0);
    }
    int v52 = v9;
    v54 = v11;
    id v15 = v11;
    if (v6) {
      CFArrayRemoveValueAtIndex(v6, 0);
    }
    v51 = v6;
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v13)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        long long v18 = (void *)[ValueAtIndex objectAtIndex:i];
        objc_msgSend(v16, "setObject:forKey:", v18, objc_msgSend(v18, "objectForKey:", @"MailboxName"));
      }
    }
    CFArrayRef v50 = v8;
    uint64_t v19 = [v12 count];
    v55 = ValueAtIndex;
    if (v19)
    {
      uint64_t v20 = v19 - 1;
      do
      {
        BOOL v21 = (void *)[v12 objectAtIndex:v20];
        id v22 = (const void *)[v21 name];
        v23 = (void *)[v16 objectForKey:v22];
        uint64_t v24 = v23;
        if (v23)
        {
          uint64_t v25 = objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"MailboxAttributes"), "unsignedIntValue");
          v26 = self;
          uint64_t v27 = v54;
          v28 = v22;
          v29 = v21;
          v30 = v24;
        }
        else
        {
          v26 = self;
          uint64_t v27 = v54;
          v28 = 0;
          uint64_t v25 = 0;
          v29 = v21;
          v30 = 0;
        }
        id v31 = [(MailAccount *)v26 _copyMailboxUidWithParent:v27 name:v28 attributes:v25 existingMailboxUid:v29 dictionary:v30];
        long long v32 = v31;
        if (v31)
        {
          long long v33 = (void *)[v31 name];
          if (([v32 isEqual:v21] & 1) == 0)
          {
            [v12 replaceObjectAtIndex:v20 withObject:v32];
            int v52 = 1;
          }
          if (!Mutable) {
            Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], 0);
          }
          CFDictionarySetValue(Mutable, v33, v32);
          if (([v33 isEqualToString:v22] & 1) == 0) {
            CFDictionarySetValue(Mutable, v22, v32);
          }
          uint64_t v34 = v24 == 0;
        }
        else
        {
          [v12 removeObjectAtIndex:v20];
          if (v24) {
            uint64_t v34 = -1;
          }
          else {
            uint64_t v34 = 0;
          }
          int v52 = 1;
        }
        v13 += v34;

        --v20;
        ValueAtIndex = v55;
      }
      while (v20 != -1);
    }

    uint64_t v35 = [ValueAtIndex count];
    CFMutableArrayRef v36 = CFArrayCreateMutable(0, v13, MEMORY[0x1E4F1D510]);
    CFMutableArrayRef v37 = v36;
    CFArrayRef v8 = v50;
    if (v12)
    {
      [(__CFArray *)v36 addObjectsFromArray:v12];
    }
    if (v35)
    {
      for (uint64_t j = 0; v35 != j; ++j)
      {
        v39 = (void *)[ValueAtIndex objectAtIndex:j];
        v40 = (const void *)[v39 objectForKey:@"MailboxName"];
        uint64_t v41 = objc_msgSend((id)objc_msgSend(v39, "objectForKey:", @"MailboxAttributes"), "unsignedIntValue");
        v42 = (const void *)[v39 objectForKey:@"MailboxChildren"];
        if (Mutable && (Value = (void *)CFDictionaryGetValue(Mutable, v40)) != 0)
        {
          id v44 = Value;
          id v45 = Value;
        }
        else
        {
          id v44 = [(MailAccount *)self _copyMailboxUidWithParent:v54 name:v40 attributes:v41 existingMailboxUid:0 dictionary:v39];
          if (!v44) {
            goto LABEL_48;
          }
        }
        if ([(__CFArray *)v37 indexOfObjectIdenticalTo:v44] == 0x7FFFFFFFFFFFFFFFLL)
        {
          int v52 = 1;
          [(__CFArray *)v37 ef_insertObject:v44 usingSortFunction:_MFCompareMailboxUids context:0 allowDuplicates:1];
        }
        if (v42 && (v41 & 1) == 0)
        {
          if (!v8) {
            CFArrayRef v8 = CFArrayCreateMutable(0, 0, 0);
          }
          v46 = v51;
          ValueAtIndex = v55;
          if (!v51) {
            v46 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
          }
          CFArrayAppendValue(v8, v42);
          v51 = v46;
          CFArrayAppendValue(v46, v44);
          goto LABEL_49;
        }
LABEL_48:
        ValueAtIndex = v55;
LABEL_49:
      }
    }
    if (Mutable) {
      CFDictionaryRemoveAllValues(Mutable);
    }
    int v9 = v52 | [(MailAccount *)self _cleanInboxDuplication:v37];
    CFArrayRef v6 = v51;
    if (v9) {
      [(MailAccount *)self _setChildren:v37 forMailboxUid:v54];
    }
  }
  while (v8 && CFArrayGetCount(v8) > 0);
  if (Mutable) {

  }
  if (v51) {
  if (v8)
  }

  return v9 & 1;
}

- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 existingMailboxUid:(id)a6 dictionary:(id)a7
{
  if (!a4)
  {
    id v8 = a6;
    if ((objc_msgSend(a6, "attributes", a3, 0, *(void *)&a5) & 0x100) == 0) {
      return 0;
    }
    goto LABEL_6;
  }
  if (a6)
  {
    id v8 = a6;
    objc_msgSend(a6, "setAttributes:", objc_msgSend(a6, "attributes", a3) & 0xFFFFFE00 | a5 & 0x1FF);
LABEL_6:
    return v8;
  }
  return -[MailAccount _copyMailboxWithParent:name:attributes:dictionary:](self, "_copyMailboxWithParent:name:attributes:dictionary:", a3);
}

- (id)_copyMailboxWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 dictionary:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = [MFMailboxUid alloc];
  uint64_t v11 = [a6 objectForKeyedSubscript:@"MailboxExtraAttributes"];
  return [(MFMailboxUid *)v10 initWithName:a4 attributes:v7 forAccount:self extraAttributes:v11];
}

- (BOOL)_cleanInboxDuplication:(id)a3
{
  return 0;
}

+ (void)resetMailboxTimers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v2 = (void *)[a1 activeAccounts];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) resetMailboxTimer];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (int)secureCompositionSigningPolicyForAddress:(id)a3
{
  int result = objc_msgSend((id)objc_msgSend(a3, "mf_uncommentedAddress"), "isEqualToString:", objc_msgSend(-[MailAccount firstEmailAddress](self, "firstEmailAddress"), "mf_uncommentedAddress"));
  if (result) {
    return objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", @"SMIMESigningEnabled"), "BOOLValue");
  }
  return result;
}

+ (void)_setMailAccounts:(id)a3 saveIfChanged:(BOOL)a4 alreadyLocked:(BOOL)a5
{
  BOOL v5 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a5)
  {
    [a1 disableMailboxListingNotifications];
    +[MailAccount mf_lock];
  }
  id v8 = (id)objc_opt_new();
  [v8 setMaxConcurrentOperationCount:1];
  long long v9 = (void *)[a3 mutableCopy];
  id v10 = +[LocalAccount localAccount];
  if ([v9 indexOfObjectIdenticalTo:v10] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [(id)_accounts indexOfObjectIdenticalTo:v10];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = v11;
    }
    [v9 insertObject:v10 atIndex:v12];
  }
  CFIndex v13 = (void *)_accounts;
  _accounts = (uint64_t)v9;
  id v29 = a1;
  [a1 _setupSortedPathsForAccounts:v9];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if (([v9 containsObject:v18] & 1) == 0) {
          [v18 invalidate];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v15);
  }
  if (v5)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v19 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v13);
          }
          uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * j);
          if (([v9 containsObject:v23] & 1) == 0)
          {
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke;
            v36[3] = &unk_1E68661B8;
            v36[4] = v23;
            [v8 addOperationWithBlock:v36];
          }
        }
        uint64_t v20 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v20);
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v24 = [v9 countByEnumeratingWithState:&v32 objects:v45 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v9);
          }
          uint64_t v28 = *(void *)(*((void *)&v32 + 1) + 8 * k);
          if (([v13 containsObject:v28] & 1) == 0)
          {
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __60__MailAccount__setMailAccounts_saveIfChanged_alreadyLocked___block_invoke_2;
            v31[3] = &unk_1E68661B8;
            v31[4] = v28;
            [v8 addOperationWithBlock:v31];
          }
        }
        uint64_t v25 = [v9 countByEnumeratingWithState:&v32 objects:v45 count:16];
      }
      while (v25);
    }
  }

  if (!a5)
  {
    +[MailAccount mf_unlock];
    [v29 enableMailboxListingNotifications:0];
  }
  [v8 waitUntilAllOperationsAreFinished];
}

+ (void)_setupSortedPathsForAccounts:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFArrayRemoveAllValues((CFMutableArrayRef)_sortedAccountPaths);
  CFArrayRemoveAllValues((CFMutableArrayRef)_accountsSortedByPath);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(a3);
        }
        [a1 _addAccountToSortedPaths:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)iconString
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MFAccount *)self accountPropertyForKey:@"AccountIcon"];
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = @"otherAccountIcon";
  }
  id v5 = [(MailAccount *)self emailAddresses];
  if (v5)
  {
    uint64_t v6 = v5;
    if ([v5 count])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v6);
            }
            long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            if (([v11 hasSuffix:@"@apple.com"] & 1) != 0
              || ([v11 hasSuffix:@".apple.com"] & 1) != 0)
            {
              return @"appleAccountIcon";
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
    }
  }
  return v4;
}

+ (void)initialize
{
  if (!_accountsSortedByPath)
  {
    _accountsSortedByPath = (uint64_t)CFArrayCreateMutable(0, 0, 0);
    _sortedAccountPaths = (uint64_t)CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  }
}

+ (void)setMailAccountLoadOptions:(unint64_t)a3
{
  +[MailAccount mf_lock];
  __mailAccountLoadOptions = a3;
  +[MailAccount mf_unlock];
}

+ (id)_loadAllAccountsWithOptions:(unint64_t)a3 error:(id *)a4
{
  char v5 = a3;
  v24[5] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = v8;
  if (v5) {
    [v8 addObject:*MEMORY[0x1E4F17830]];
  }
  if ((v5 & 2) != 0)
  {
    uint64_t v10 = *MEMORY[0x1E4F17878];
    v24[0] = *MEMORY[0x1E4F17740];
    v24[1] = v10;
    uint64_t v11 = *MEMORY[0x1E4F177E8];
    v24[2] = *MEMORY[0x1E4F177C0];
    v24[3] = v11;
    v24[4] = *MEMORY[0x1E4F177F0];
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v24, 5));
  }
  if (![v9 count]) {
    goto LABEL_11;
  }
  id v22 = 0;
  uint64_t v12 = objc_msgSend(+[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore"), "accountsWithTypeIdentifiers:error:", v9, &v22);
  if (v12) {
    [v7 addObjectsFromArray:v12];
  }
  if (v22)
  {
    if (a4) {
      *a4 = v22;
    }
  }
  else
  {
LABEL_11:
    [a1 _removeLookAsideValuesNotInAccountList:v7];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v13 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v16++) accountDidLoad];
      }
      while (v14 != v16);
      uint64_t v14 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v14);
  }
  return v7;
}

+ (id)lastMailAccountsReloadDate
{
  +[MailAccount mf_lock];
  id v2 = (id)_lastAccountsReloadDate;
  +[MailAccount mf_unlock];
  return v2;
}

+ (id)lastMailAccountsReloadError
{
  +[MailAccount mf_lock];
  id v2 = (id)_lastAccountsReloadError;
  +[MailAccount mf_unlock];
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

+ (void)_removeAccountFromSortedPaths:(id)a3
{
  if (_accountsSortedByPath)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)_accountsSortedByPath);
    if (Count)
    {
      CFIndex v5 = Count - 1;
      do
      {
        if (CFArrayGetValueAtIndex((CFArrayRef)_accountsSortedByPath, v5) == a3)
        {
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)_accountsSortedByPath, v5);
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)_sortedAccountPaths, v5);
        }
        --v5;
      }
      while (v5 != -1);
    }
  }
}

+ (id)activeAccounts
{
  return (id)[a1 activeAccountsWithError:0];
}

+ (id)purgableAccounts
{
  return (id)[a1 purgableAccountsWithError:0];
}

+ (id)purgableAccountsWithError:(id *)a3
{
  uint64_t v3 = (void *)[a1 mailAccountsWithError:a3];
  return (id)objc_msgSend(v3, "ef_filter:", &__block_literal_global_107);
}

uint64_t __41__MailAccount_purgableAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsPurge];
}

uint64_t __35__MailAccount_accountWithUniqueId___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 uniqueId];
  return [v2 isEqualToString:v3];
}

+ (id)existingAccountWithType:(id)a3 hostname:(id)a4 username:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = objc_msgSend(a1, "mailAccounts", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
      if ([v13 isEquivalentTo:a3 hostname:a4 username:a5]) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v13 = 0;
  }
  return v13;
}

- (BOOL)isEquivalentTo:(id)a3 hostname:(id)a4 username:(id)a5
{
  if (![(MailAccount *)self isAccountClassEquivalentTo:a3]
    || ![(MailAccount *)self isHostnameEquivalentTo:a4])
  {
    return 0;
  }
  return [(MailAccount *)self isUsernameEquivalentTo:a5];
}

- (BOOL)isUsernameEquivalentTo:(id)a3
{
  return [(MFAccount *)self username] == a3
      || objc_msgSend(a3, "compare:options:", -[MFAccount username](self, "username"), 1) == 0;
}

+ (void)updateAutoFetchSettings
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 138543362;
    uint64_t v4 = [MEMORY[0x1E4F29060] callStackSymbols];
    _os_log_impl(&dword_1CFCFE000, v2, OS_LOG_TYPE_INFO, "updateAutoFetchSettings was called. Backtrace:\n%{public}@", (uint8_t *)&v3, 0xCu);
  }
}

+ (id)allEmailAddressesIncludingFullUserName:(BOOL)a3 includeReceiveAliases:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id result = _allEmailAddressesIncludingFullName(a3, a4);
  if (v5 && !result)
  {
    return _allEmailAddressesIncludingFullName(0, v4);
  }
  return result;
}

+ (id)accountContainingEmailAddress:(id)a3 includingInactive:(BOOL)a4
{
  return (id)[a1 _accountContainingEmailAddress:a3 matchingAddress:0 fullUserName:0 includingInactive:a4];
}

+ (id)accountForHeaders:(id)a3 message:(id)a4 includingInactive:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[a3 copyAddressListForResentFrom];
  uint64_t v8 = (void *)[v7 firstObject];
  if (v8 && (uint64_t v9 = v8, ![v8 isEqualToString:&stru_1F265CF90]))
  {
    id v16 = +[MailAccount accountContainingEmailAddress:v9 includingInactive:v5];

    if (v16) {
      return v16;
    }
  }
  else
  {
  }
  uint64_t v10 = (void *)[a4 senders];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v11) {
    return 0;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v19;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = +[MailAccount accountContainingEmailAddress:*(void *)(*((void *)&v18 + 1) + 8 * i) includingInactive:v5];
      if (v15) {
        return v15;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    id v16 = 0;
    if (v12) {
      continue;
    }
    break;
  }
  return v16;
}

+ (id)accountUsingHeadersFromMessage:(id)a3
{
  uint64_t v5 = [a3 headers];
  if (!v5) {
    uint64_t v5 = [a3 headersIfAvailable];
  }
  return (id)[a1 accountForHeaders:v5 message:a3 includingInactive:0];
}

+ (id)accountThatMessageIsFrom:(id)a3 includingInactive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [a3 headersIfAvailable];
  return (id)[a1 accountForHeaders:v7 message:a3 includingInactive:v4];
}

+ (id)accountThatMessageIsFrom:(id)a3
{
  uint64_t v5 = [a3 headersIfAvailable];
  return (id)[a1 accountForHeaders:v5 message:a3 includingInactive:0];
}

+ (id)outboxMailboxUid
{
  +[MailAccount mf_lock];
  id v3 = +[LocalAccount localAccount];
  BOOL v4 = (void *)_outboxUid;
  char v5 = [(id)_outboxUid isValid];
  if (!v4 || (v5 & 1) == 0)
  {
    BOOL v4 = (void *)[v3 mailboxUidForRelativePath:@"Outbox" create:1];
    if (v4)
    {
      [a1 _setOutboxMailboxUid:v4];
      [v3 resetSpecialMailboxes];
    }
  }
  +[MailAccount mf_unlock];
  return v4;
}

+ (id)outboxMessageStore:(BOOL)a3
{
  id v4 = +[LocalAccount localAccount];
  char v5 = (void *)[a1 outboxMailboxUid];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  if (![v5 isValid]) {
    return 0;
  }
  return (id)[v4 storeForMailboxUid:v6];
}

+ (id)allMailboxUids
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v4 = +[MailAccount mailAccounts];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) rootMailboxUid];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  while ([v3 count])
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(v3, "lastObject"), "mutableCopyOfChildren");
    [v2 addObjectsFromArray:v10];
    [v3 removeLastObject];
    [v3 addObjectsFromArray:v10];
  }
  return v2;
}

+ (id)allActivePrimaryMailboxUids
{
  id v2 = objc_msgSend((id)objc_msgSend(a1, "activeAccounts"), "ef_map:", &__block_literal_global_117);
  uint64_t v3 = *MEMORY[0x1E4F60CE8];
  return (id)objc_msgSend(v2, "ef_filter:", v3);
}

uint64_t __42__MailAccount_allActivePrimaryMailboxUids__block_invoke(uint64_t a1, void *a2)
{
  return [a2 primaryMailboxUid];
}

+ (MailAccount)accountWithPath:(id)a3
{
  id result = (MailAccount *)[a3 length];
  if (result)
  {
    id result = +[MailAccount _accountWithPath:a3];
    if (!result)
    {
      uint64_t v5 = objc_msgSend(a3, "mf_betterStringByResolvingSymlinksInPath");
      return (MailAccount *)+[MailAccount _accountWithPath:v5];
    }
  }
  return result;
}

+ (id)newAccountWithPath:(id)a3
{
  id result = (id)[a3 length];
  if (result)
  {
    if ([a3 length]
      && (id v5 = +[MailAccount _accountWithPath:a3]) != 0
      || (uint64_t v6 = objc_msgSend(a3, "mf_betterStringByResolvingSymlinksInPath"), objc_msgSend(v6, "length"))
      && (id v5 = +[MailAccount _accountWithPath:v6]) != 0)
    {
      return v5;
    }
    else
    {
      id v7 = objc_alloc((Class)objc_opt_class());
      return (id)[v7 initWithPath:v6];
    }
  }
  return result;
}

- (void)_setAccountProperties:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MailAccount;
  -[MFAccount _setAccountProperties:](&v5, sel__setAccountProperties_);
  if (![a3 objectForKey:@"SMTPAlternateIdentifiers"]) {
    [(MFAccount *)self removeAccountPropertyForKey:@"SMTPAlternateIdentifiers"];
  }
}

+ (id)newAccountWithDictionary:(id)a3
{
  id v3 = a3;
  objc_super v5 = (void *)[a3 objectForKey:@"AccountPath"];
  uint64_t v6 = objc_msgSend(v5, "mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath");
  id v7 = (id)[a1 newAccountWithPath:v6];
  if (v7 || (id v7 = objc_alloc_init((Class)a1)) != 0)
  {
    if (v6 && ([v5 isEqualToString:v6] & 1) == 0)
    {
      id v3 = (id)[v3 mutableCopy];
      [v3 setObject:v6 forKey:@"AccountPath"];
    }
    [v7 _setAccountProperties:v3];
  }
  return v7;
}

id __49__MailAccount_initWithLibrary_persistentAccount___block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend(a2, "account"), "storeClassForMailbox:", a2)), "initWithMailboxUid:readOnly:", a2, 0);
  return v2;
}

- (MailAccount)initWithPath:(id)a3
{
  return [(MailAccount *)self initWithLibrary:0 path:a3];
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)MailAccount;
  [(MFAccount *)&v3 dealloc];
}

+ (id)defaultPathForAccountWithHostname:(id)a3 username:(id)a4
{
  id v4 = objc_msgSend((id)objc_msgSend(a1, "defaultAccountDirectory"), "stringByAppendingPathComponent:", objc_msgSend(a1, "defaultPathNameForAccountWithHostname:username:", a3, a4));
  return (id)objc_msgSend(v4, "mf_betterStringByResolvingSymlinksInPath");
}

+ (id)defaultAccountDirectory
{
  if (defaultAccountDirectory_sOnceToken != -1) {
    dispatch_once(&defaultAccountDirectory_sOnceToken, &__block_literal_global_144);
  }
  return (id)defaultAccountDirectory_sMailAccountDirectory;
}

id __38__MailAccount_defaultAccountDirectory__block_invoke()
{
  id result = (id)[(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Mail"];
  defaultAccountDirectory_sMailAccountDirectory = (uint64_t)result;
  return result;
}

+ (id)defaultPathNameForAccountWithHostname:(id)a3 username:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@-%@@%@", objc_msgSend(a1, "accountTypeString"), a4, a3];
}

+ (void)setGlobalPathForAccounts:(id)a3
{
  if ((id)__globalPathSwitch != a3)
  {

    __globalPathSwitch = [a3 copy];
  }
}

- (void)setPath:(id)a3
{
  if ([(MailAccount *)self _setPath:a3])
  {
    [(MFAccount *)self _queueAccountInfoDidChange];
  }
}

- (void)setLastKnownHostname:(id)a3
{
  [(MailAccount *)self mf_lock];
  if (self->_lastKnownHostname == a3 || (objc_msgSend(a3, "isEqualToString:") & 1) != 0)
  {
    [(MailAccount *)self mf_unlock];
  }
  else
  {

    self->_lastKnownHostname = (NSString *)[a3 copy];
    [(MailAccount *)self mf_unlock];
    objc_super v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"MailAccountCurrentURLDidChange" object:self];
  }
}

- (id)tildeAbbreviatedPath
{
  +[MailAccount mf_lock];
  for (CFIndex i = CFArrayGetCount((CFArrayRef)_accountsSortedByPath) - 1; i != -1; --i)
  {
    if (CFArrayGetValueAtIndex((CFArrayRef)_accountsSortedByPath, i) == self
      && (ValueAtIndex = (void *)CFArrayGetValueAtIndex((CFArrayRef)_sortedAccountPaths, i),
          [ValueAtIndex hasPrefix:@"~"]))
    {
      id v5 = ValueAtIndex;
    }
    else
    {
      id v5 = 0;
    }
    if (v5)
    {
      +[MailAccount mf_unlock];
      return v5;
    }
  }
  +[MailAccount mf_unlock];
  _MFLockGlobalLock();
  id v6 = [(MFAccount *)self accountPropertyForKey:@"AccountPath"];
  _MFUnlockGlobalLock();
  id v5 = (id)objc_msgSend(v6, "mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath");
  char v7 = [v5 hasPrefix:@"~"];
  if (v5 && (v7 & 1) != 0) {
    return v5;
  }
  path = self->_path;
  return [(NSString *)path mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath];
}

- (void)setFullUserName:(id)a3
{
  id v5 = [(MailAccount *)self fullUserName];
  if ([a3 length]) {
    a3 = (id)objc_msgSend(a3, "mf_stringWithNoExtraSpaces");
  }
  if (a3 != v5)
  {
    id v6 = v5 ? v5 : &stru_1F265CF90;
    if (([a3 isEqualToString:v6] & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3) {
        [(MFAccount *)self setAccountProperty:a3 forKey:@"FullUserName"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"FullUserName"];
      }
      _MFUnlockGlobalLock();
      _resetAllEmailAddresses();
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[MEMORY[0x1E4F28B50] mainBundle];
  char v6 = objc_msgSend((id)*MEMORY[0x1E4F77E48], "isEqualToString:", objc_msgSend(v5, "bundleIdentifier"));
  CFStringRef v7 = (const __CFString *)MFMobileMailPreferenceDomain();
  if (v6)
  {
    uint64_t v8 = (void *)CFPreferencesCopyAppValue(@"DefaultSendingAccount", v7);
  }
  else
  {
    MFMobileMailContainerPath();
    uint64_t v8 = (void *)_CFPreferencesCopyValueWithContainer();
  }
  uint64_t v9 = v8;
  if ([v8 length]
    && (uint64_t v10 = (void *)[a1 accountWithUniqueId:v9], objc_msgSend(v10, "isActive"))
    && (a3 || ![v10 restrictedFromSendingExternally]))
  {

    if (v10) {
      return v10;
    }
  }
  else
  {
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = objc_msgSend(a1, "mailAccounts", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v12) {
    return 0;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v18;
LABEL_11:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v18 != v14) {
      objc_enumerationMutation(v11);
    }
    uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      && [v10 isActive]
      && (a3 || ![v10 restrictedFromSendingExternally]))
    {
      return v10;
    }
    if (v13 == ++v15)
    {
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13) {
        goto LABEL_11;
      }
      return 0;
    }
  }
}

+ (id)defaultDeliveryAccount
{
  id v2 = (void *)[a1 defaultMailAccountForDelivery];
  return (id)[v2 deliveryAccount];
}

+ (BOOL)primaryDeliveryAccountIsDynamic
{
  return 0;
}

- (id)deliveryAccount
{
  return [(MailAccount *)self _deliveryAccountCreateIfNeeded:1];
}

- (BOOL)isPrimaryDeliveryAccountDisabled
{
  return [(MFAccount *)self _BOOLForAccountInfoKey:@"SMTPDisabled" defaultValue:0];
}

- (void)setPrimaryDeliveryAccountDisabled:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  _MFLockGlobalLock();
  [(MFAccount *)self setAccountProperty:v4 forKey:@"SMTPDisabled"];
  _MFUnlockGlobalLock();
}

- (id)deliveryAccountAlternates
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [(MFAccount *)self _objectForAccountInfoKey:@"SMTPAlternateIdentifiers"];
  if (!v2) {
    return 0;
  }
  objc_super v3 = v2;
  id v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = +[DeliveryAccount accountWithIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v4;
}

- (void)setDeliveryAccount:(id)a3
{
  if (([(id)objc_opt_class() primaryDeliveryAccountIsDynamic] & 1) == 0)
  {
    id v5 = [(MFAccount *)self _objectForAccountInfoKey:@"SMTPIdentifier"];
    uint64_t v6 = (void *)[a3 identifier];
    uint64_t v7 = v6;
    if (!v5 || ([v6 isEqualToString:v5] & 1) == 0)
    {
      _MFLockGlobalLock();
      if (v7) {
        [(MFAccount *)self setAccountProperty:v7 forKey:@"SMTPIdentifier"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"SMTPIdentifier"];
      }
      _MFUnlockGlobalLock();
    }
  }
}

- (void)setDeliveryAccountAlternates:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) identifier];
        if (v10) {
          [v5 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  if ((objc_msgSend(-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", @"SMTPAlternateIdentifiers"), "isEqual:", v5) & 1) == 0)
  {
    _MFLockGlobalLock();
    if ([v5 count]) {
      [(MFAccount *)self setAccountProperty:v5 forKey:@"SMTPAlternateIdentifiers"];
    }
    else {
      [(MFAccount *)self removeAccountPropertyForKey:@"SMTPAlternateIdentifiers"];
    }
    _MFUnlockGlobalLock();
  }
}

- (BOOL)canUseDeliveryAccount:(id)a3
{
  if (objc_msgSend(a3, "isEqual:", -[MailAccount deliveryAccount](self, "deliveryAccount"))) {
    return 1;
  }
  uint64_t v6 = [a3 identifier];
  id v7 = [(MFAccount *)self _objectForAccountInfoKey:@"SMTPAlternateIdentifiers"];
  return [v7 containsObject:v6];
}

- (void)setCanUseCarrierDeliveryFallback:(BOOL)a3
{
  BOOL v3 = a3;
  _MFLockGlobalLock();
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", [NSNumber numberWithBool:v3], @"SMTPCarrierFallbackAllowed");
  _MFUnlockGlobalLock();
}

- (BOOL)canUseCarrierDeliveryFallback
{
  id v2 = [(MFAccount *)self _objectForAccountInfoKey:@"SMTPCarrierFallbackAllowed"];
  return [v2 BOOLValue];
}

+ (BOOL)isPredefinedAccountType
{
  return 0;
}

- (id)firstEmailAddress
{
  id v2 = [(MailAccount *)self emailAddresses];
  id result = (id)[v2 count];
  if (result)
  {
    return (id)[v2 objectAtIndex:0];
  }
  return result;
}

- (id)defaultEmailAddress
{
  return [(MFAccount *)self _objectForAccountInfoKey:@"defaultAddress"];
}

- (void)setDefaultEmailAddress:(id)a3
{
  id v5 = [(MailAccount *)self defaultEmailAddress];
  if (v5 != a3)
  {
    uint64_t v6 = (uint64_t)v5;
    if (!v5) {
      uint64_t v6 = [NSString string];
    }
    if (([a3 isEqualToString:v6] & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3) {
        [(MFAccount *)self setAccountProperty:a3 forKey:@"defaultAddress"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"defaultAddress"];
      }
      _MFUnlockGlobalLock();
    }
  }
}

- (id)emailAddresses
{
  id v2 = objc_msgSend(-[MailAccount emailAddressesDictionary](self, "emailAddressesDictionary"), "allKeys");
  return (id)objc_msgSend(v2, "mf_uncommentedAddressList");
}

- (void)setEmailAddresses:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [(MailAccount *)self emailAddressesDictionary];
  objc_opt_class();
  id v6 = a3;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    id v6 = (id)[a3 componentsSeparatedByString:@", "];
  }
  if (v6)
  {
    id v7 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      uint64_t v11 = MEMORY[0x1E4F1CC38];
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v6);
        }
        [v7 addObject:v11];
        if (!--v9)
        {
          uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (!v9) {
            break;
          }
        }
      }
    }
    a3 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6];
  }
LABEL_12:
  if (v5 != a3)
  {
    if (!v5) {
      id v5 = (id)[MEMORY[0x1E4F1C9E8] dictionary];
    }
    if (([a3 isEqual:v5] & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3) {
        [(MFAccount *)self setAccountProperty:a3 forKey:@"EmailAddresses"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"EmailAddresses"];
      }
      _MFUnlockGlobalLock();
      _resetAllEmailAddresses();
    }
  }
}

- (id)receiveEmailAliasAddresses
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(MFAccount *)self _objectForAccountInfoKey:@"ReceiveEmailAliasAddresses"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      uint64_t v7 = MEMORY[0x1E4F1CC38];
      while (1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        [v3 addObject:v7];
        if (!--v5)
        {
          uint64_t v5 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
          if (!v5) {
            break;
          }
        }
      }
    }
    return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2];
  }
  return v2;
}

- (id)receiveEmailAliasAddressesList
{
  id v2 = [(MailAccount *)self receiveEmailAliasAddresses];
  return (id)[v2 allKeys];
}

- (void)setReceiveEmailAliasAddresses:(id)a3
{
  id v5 = [(MailAccount *)self receiveEmailAliasAddresses];
  if (v5 != a3)
  {
    uint64_t v6 = (uint64_t)v5;
    if (!v5) {
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
    if (([a3 isEqual:v6] & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3) {
        [(MFAccount *)self setAccountProperty:a3 forKey:@"ReceiveEmailAliasAddresses"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"ReceiveEmailAliasAddresses"];
      }
      _MFUnlockGlobalLock();
      _resetAllEmailAddresses();
    }
  }
}

- (id)lastEmailAliasesSyncDate
{
  id result = [(MFAccount *)self _objectForAccountInfoKey:@"LastEmailAliasesSyncDate"];
  if (result)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1C9C8];
    [result doubleValue];
    return (id)objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
  }
  return result;
}

- (void)setLastEmailAliasesSyncDate:(id)a3
{
  id v5 = objc_alloc(NSNumber);
  [a3 timeIntervalSince1970];
  id v6 = (id)objc_msgSend(v5, "initWithDouble:");
  _MFLockGlobalLock();
  [(MFAccount *)self setAccountProperty:v6 forKey:@"LastEmailAliasesSyncDate"];
  _MFUnlockGlobalLock();
}

- (id)emailAddressesAndAliases
{
  id v3 = [(MailAccount *)self emailAddressesDictionary];
  id v4 = [(MailAccount *)self receiveEmailAliasAddresses];
  if (!v4)
  {
    id v6 = [(MailAccount *)self lastEmailAliasesSyncDate];
    if (v6 && ([v6 timeIntervalSinceNow], v7 >= -600.0)
      || ![(MailAccount *)self updateEmailAliases])
    {
      id v4 = 0;
      BOOL v5 = v3 != 0;
      goto LABEL_10;
    }
    id v4 = [(MailAccount *)self receiveEmailAliasAddresses];
    [(MFAccount *)self savePersistentAccount];
  }
  BOOL v5 = v3 != 0;
  if (v3 && v4)
  {
    id v3 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
    [v3 addEntriesFromDictionary:v4];
    return v3;
  }
LABEL_10:
  if (!v5) {
    return v4;
  }
  return v3;
}

- (void)_invalidateAndDeleteAccountData:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() disableMailboxListingNotifications];
  [(MailAccount *)self releaseAllConnections];
  [(MFLock *)self->_deletionLock lock];
  _invalidateMailboxCache((uint64_t)self);
  [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:0 forType:7];
  [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:0 forType:4];
  [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:0 forType:3];
  [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:0 forType:5];
  [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:0 forType:2];
  [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:0 forType:1];
  objc_msgSend(-[MailAccount library](self, "library"), "invalidateAccount:", self);
  if (v3)
  {
    uint64_t v5 = objc_msgSend(-[MailAccount allMailboxUids](self, "allMailboxUids"), "arrayByApplyingSelector:", sel_URLString);
    id v6 = [(MailAccount *)self allLocalMailboxUids];
    [(MailAccount *)self path];
    MFRemoveItemAtPath();
    objc_msgSend(-[MailAccount library](self, "library"), "deleteMailboxes:account:", v5, self);
    if ([v6 count])
    {
      uint64_t v22 = self;
      id v7 = +[LocalAccount localAccount];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v28 != v10) {
              objc_enumerationMutation(v6);
            }
            uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            [v7 deleteMailbox:v12];
            long long v13 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
            objc_msgSend(v13, "postNotification:", objc_msgSend(MEMORY[0x1E4F28EA0], "notificationWithName:object:userInfo:", @"MailboxUserInfoDidChange", v12, 0));
          }
          uint64_t v9 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v9);
      }
      _invalidateMailboxCache((uint64_t)v7);
      self = v22;
    }
    id v14 = +[MailAccount outboxMessageStore:1];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = (void *)[v14 copyOfAllMessagesWithOptions:128];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * j);
          if (!+[MailAccount accountThatMessageIsFrom:v21]) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v18);
    }
    if ([v15 count])
    {
      [v14 deleteMessages:v15 moveToTrash:0];
      [v14 doCompact];
    }

    objc_msgSend(-[MailAccount library](self, "library"), "deleteAccount:", self);
    [(MailAccount *)self _deleteHook];
    [(MFAccount *)self setPassword:0];
    [(MailAccount *)self deleteDeliveryAccountIfNeeded];
  }
  [(MFLock *)self->_deletionLock unlock];
  [(id)objc_opt_class() enableMailboxListingNotifications:1];
}

- (void)_asynchronouslyInvalidateAndDeleteAccountData:(BOOL)a3
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__MailAccount__asynchronouslyInvalidateAndDeleteAccountData___block_invoke;
  v6[3] = &unk_1E6866638;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(global_queue, v6);
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
  +[MailAccount mf_lock];
  id v2 = (id)[(id)_accounts copy];
  +[MailAccount mf_unlock];
  [v2 makeObjectsPerformSelector:sel_saveState withObject:0];
}

- (void)releaseAllForcedConnections
{
  id v2 = [(MailAccount *)self deliveryAccount];
  [v2 releaseAllForcedConnections];
}

- (BOOL)canFetch
{
  return [(MFAccount *)self isEnabledForDataclass:*MEMORY[0x1E4F17AD8]];
}

- (void)_synchronizeMailboxListWithFileSystem
{
  id v3 = [(MailAccount *)self _mailboxPathPrefix];
  id v4 = objc_msgSend(-[MailAccount path](self, "path"), "mutableCopyWithZone:", 0);
  if (v3 && [v3 length])
  {
    [v4 appendString:@"/"];
    objc_msgSend(v4, "appendString:", -[MailAccount _mailboxPathPrefix](self, "_mailboxPathPrefix"));
  }
  [(MailAccount *)self mf_lock];
  [(MailAccount *)self _loadEntriesFromFileSystemPath:v4 parent:[(MailAccount *)self rootMailboxUid]];
  [(MailAccount *)self mf_unlock];

  *(_DWORD *)&self->_flags &= ~0x40000u;
  [(MailAccount *)self _writeMailboxCacheWithPrejudice:1];
  [(MailAccount *)self resetSpecialMailboxes];
  [(MailAccount *)self emptyTrash];
}

- (void)nowWouldBeAGoodTimeToStartBackgroundSynchronization
{
  id v3 = +[MFInvocationQueue sharedInvocationQueue];
  id v4 = +[MFMonitoredInvocation invocationWithSelector:target:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:taskName:priority:canBeCancelled:", sel__synchronizeMailboxListWithFileSystem, self, [NSString stringWithFormat:MFLookupLocalizedString(@"SYNCHRONIZING_WITH_FILE_SYSTEM_FORMAT", @"Synchronizing with file system", 0), -[MailAccount displayName](self, "displayName")], 0, 0);
  [v3 addInvocation:v4];
}

- (void)forceFetchMailboxList
{
  objc_msgSend(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"), "addInvocation:", +[NSInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", sel_resetMailboxTimer, self));
  id v3 = +[MFInvocationQueue sharedInvocationQueue];
  id v4 = +[NSInvocation mf_invocationWithSelector:sel_fetchMailboxList target:self];
  [v3 addInvocation:v4];
}

- (BOOL)canAppendMessages
{
  return 1;
}

- (id)primaryMailboxUid
{
  return [(MailAccount *)self mailboxUidOfType:7 createIfNeeded:1];
}

- (id)allMailMailboxUid
{
  return 0;
}

- (id)rootMailboxUid
{
  _configureMailboxCache((uint64_t)self);
  [(MailAccount *)self mf_lock];
  id v3 = self->_rootMailboxUid;
  [(MailAccount *)self mf_unlock];
  return v3;
}

- (BOOL)shouldExpungeMessagesOnDelete
{
  return 0;
}

- (void)deleteDeliveryAccountIfNeeded
{
  id v3 = [(MailAccount *)self _deliveryAccountCreateIfNeeded:0];
  if (v3)
  {
    id v4 = v3;
    if (![(MailAccount *)self deliveryAccountInUseByOtherAccounts:v3])
    {
      +[DeliveryAccount removeDeliveryAccount:v4];
    }
  }
}

- (BOOL)deliveryAccountInUseByOtherAccounts:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 uniqueId];
  +[MailAccount mf_lock];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)_accounts;
  uint64_t v5 = [(id)_accounts countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v11 = (NSString *)[v10 uniqueId];
        if (v11 != [(MFAccount *)self uniqueId])
        {
          uint64_t v12 = (void *)[v10 _deliveryAccountCreateIfNeeded:0];
          if (v12 && (objc_msgSend((id)objc_msgSend(v12, "uniqueId"), "isEqualToString:", v4) & 1) != 0)
          {
            char v7 = 1;
            goto LABEL_24;
          }
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v13 = (void *)[v10 deliveryAccountAlternates];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v21;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v21 != v16) {
                  objc_enumerationMutation(v13);
                }
                if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "uniqueId"), "isEqualToString:", v4))
                {
                  char v7 = 1;
                  goto LABEL_19;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
        }
LABEL_19:
        ;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v7 = 0;
  }
LABEL_24:
  +[MailAccount mf_unlock];
  return v7 & 1;
}

- (BOOL)isSpecialMailbox:(id)a3
{
  if ([a3 isStandardizedMailboxUid]) {
    return 1;
  }
  else {
    return [a3 isStore] ^ 1;
  }
}

- (id)allMailboxUids
{
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v5 = [(MailAccount *)self rootMailboxUid];
  if (v5) {
    [v4 addObject:v5];
  }
  while ([v4 count])
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(v4, "lastObject"), "mutableCopyOfChildren");
    [v3 addObjectsFromArray:v6];
    [v4 removeLastObject];
    [v4 addObjectsFromArray:v6];
  }
  uint64_t v7 = objc_msgSend(v3, "indexOfObject:", -[MailAccount primaryMailboxUid](self, "primaryMailboxUid"));
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [v3 exchangeObjectAtIndex:0 withObjectAtIndex:v7];
  }
  return v3;
}

- (id)mailboxesForSuggestionsLostMessageSearchPriorToTime:(double)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(MailAccount *)self allMailMailboxUid];
  if (v5)
  {
    v11[0] = v5;
    return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    id v7 = [(MailAccount *)self allMailboxUids];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke;
    v10[3] = &__block_descriptor_40_e22_B16__0__MFMailboxUid_8l;
    *(double *)&v10[4] = a3;
    uint64_t v8 = objc_msgSend(v7, "ef_filter:", v10);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke_2;
    v9[3] = &__block_descriptor_40_e39_q24__0__MFMailboxUid_8__MFMailboxUid_16l;
    *(double *)&v9[4] = a3;
    return (id)[v8 sortedArrayUsingComparator:v9];
  }
}

uint64_t __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 type] == 3 || objc_msgSend(a2, "type") == 1) {
    return 0;
  }
  uint64_t result = [a2 isStore];
  if (result)
  {
    double v5 = *(double *)(a1 + 32);
    if (v5 == 0.0) {
      return 1;
    }
    [a2 suggestionsLostMessageSearchTimestamp];
    return v5 >= v6;
  }
  return result;
}

uint64_t __67__MailAccount_mailboxesForSuggestionsLostMessageSearchPriorToTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (*(double *)(a1 + 32) != 0.0)
  {
    [a2 suggestionsLostMessageSearchTimestamp];
    double v6 = v5;
    [a3 suggestionsLostMessageSearchTimestamp];
    if (v6 < v7) {
      return -1;
    }
    [a2 suggestionsLostMessageSearchTimestamp];
    double v10 = v9;
    [a3 suggestionsLostMessageSearchTimestamp];
    if (v10 > v11) {
      return 1;
    }
  }
  unint64_t v12 = [a2 suggestionsLostMessageSearchResultCount];
  if (v12 > [a3 suggestionsLostMessageSearchResultCount]) {
    return 1;
  }
  unint64_t v13 = [a2 suggestionsLostMessageSearchResultCount];
  if (v13 >= [a3 suggestionsLostMessageSearchResultCount]) {
    return 0;
  }
  else {
    return -1;
  }
}

- (id)transferDisabledMailboxUids
{
  return 0;
}

- (void)deleteMessagesFromMailboxUid:(id)a3 olderThanNumberOfDays:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([a3 URLString]
    && [(MailAccount *)self isActive]
    && [(MailAccount *)self _canEmptyMessagesFromMailboxUid:a3])
  {
    id v7 = [(MailAccount *)self storeForMailboxUid:a3];
    [v7 deleteMessagesOlderThanNumberOfDays:v4 compact:1];
  }
}

- (void)_setEmptyFrequency:(int)a3 forKey:(id)a4
{
  uint64_t v6 = EFStringWithInt();
  _MFLockGlobalLock();
  [(MFAccount *)self setAccountProperty:v6 forKey:a4];
  _MFUnlockGlobalLock();
}

- (int)emptyFrequencyForMailboxType:(int)a3
{
  return [(MailAccount *)self _emptyFrequencyForKey:@"NumberOfDaysToKeepTrash" defaultValue:@"7"];
}

- (void)setEmptyFrequency:(int)a3 forMailboxType:(int)a4
{
}

+ (id)csAccountTypeString
{
  return (id)getCSAccountTypeUnknown();
}

+ (void)synchronouslyEmptyMailboxUidType:(int)a3 inAccounts:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(a4);
      }
      double v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      if (objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "shouldCancel"))break; {
      uint64_t v11 = [v10 mailboxUidOfType:v5 createIfNeeded:0];
      }
      if (v11) {
        [v10 deleteMessagesFromMailboxUid:v11 olderThanNumberOfDays:0];
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (id)displayNameForMailboxUid:(id)a3
{
  if (self->_rootMailboxUid == a3)
  {
    return [(MailAccount *)self displayName];
  }
  else
  {
    uint64_t v4 = [a3 name];
    return [(MailAccount *)self _pathComponentForUidName:v4];
  }
}

+ (id)mailboxUidForFileSystemPath:(id)a3 create:(BOOL)a4
{
  id result = 0;
  if (!a3 || !_sortedAccountPaths) {
    return result;
  }
  BOOL v5 = a4;
  +[MailAccount mf_lock];
  CFIndex Count = CFArrayGetCount((CFArrayRef)_sortedAccountPaths);
  if (Count < 1) {
    goto LABEL_19;
  }
  CFIndex v8 = 0;
  while (1)
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex((CFArrayRef)_sortedAccountPaths, v8);
    if ((objc_msgSend(a3, "mf_isSubdirectoryOfPath:", ValueAtIndex) & 1) != 0
      || ([a3 isEqualToString:ValueAtIndex] & 1) != 0)
    {
      break;
    }
    if (Count == ++v8) {
      goto LABEL_19;
    }
  }
  if (!ValueAtIndex) {
    goto LABEL_19;
  }
  uint64_t v10 = [a3 rangeOfString:ValueAtIndex options:8];
  uint64_t v12 = v11;
  uint64_t v13 = [a3 length];
  uint64_t v14 = v10 + v12;
  if (v14 != [ValueAtIndex length]) {
    goto LABEL_19;
  }
  if (v14 == v13)
  {
    uint64_t v15 = 0;
  }
  else
  {
    if ([a3 characterAtIndex:v14] != 47)
    {
LABEL_19:
      +[MailAccount mf_unlock];
      goto LABEL_20;
    }
    uint64_t v13 = v14 + 1;
    uint64_t v15 = [a3 length] - (v14 + 1);
  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_19;
  }
  uint64_t v16 = (void *)CFArrayGetValueAtIndex((CFArrayRef)_accountsSortedByPath, v8);
  id v17 = v16;
  if (!v16) {
    goto LABEL_19;
  }
  uint64_t v18 = objc_msgSend(a3, "substringWithRange:", v13, v15);
  +[MailAccount mf_unlock];
  if (v18)
  {
    id result = (id)[v16 mailboxUidForRelativePath:v18 create:v5];
    goto LABEL_21;
  }
LABEL_20:
  id result = 0;
LABEL_21:
  if (Count >= 1 && result == 0)
  {
    id v20 = +[LocalAccount localAccount];
    return (id)[v20 mailboxUidForFileSystemPath:a3];
  }
  return result;
}

- (NSString)mailboxPathExtension
{
  return (NSString *)&stru_1F265CF90;
}

- (BOOL)canCreateNewMailboxes
{
  return 1;
}

- (BOOL)newMailboxNameIsAcceptable:(id)a3 reasonForFailure:(id *)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "pathComponents"), "count");
  uint64_t v6 = v5;
  if (a4)
  {
    if (v5 == 1) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = (void *)[NSString stringWithFormat:MFLookupLocalizedString(@"MAILBOX_NAME_INCLUDES_PATH_SEPARATOR", @"Mailbox names may not include “%@”.", @"Delayed", @"/"];
    }
    *a4 = v7;
  }
  return v6 == 1;
}

- (BOOL)canMailboxBeRenamed:(id)a3
{
  if ([a3 isEqual:self->_rootMailboxUid]) {
    return 0;
  }
  int v5 = [a3 type];
  return v5 == -100 || v5 == 0;
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
  uint64_t v7 = [a3 parent];
  return [(MailAccount *)self renameMailbox:a3 newName:a4 parent:v7];
}

- (BOOL)_renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void *)[a3 fullPath];
  char v37 = [a3 attributes];
  id v10 = (id)[a3 parent];
  [(MailAccount *)self mf_lock];
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "depthFirstEnumerator"), "allObjects");
  uint64_t v12 = [v11 arrayByApplyingSelector:sel_URLString];
  if (a4) {
    objc_msgSend(a3, "setName:", -[MailAccount _uidNameForPathComponent:](self, "_uidNameForPathComponent:", a4));
  }
  if (a5) {
    [a3 setParent:a5];
  }
  [v11 makeObjectsPerformSelector:sel_flushCriteria];
  uint64_t v13 = [v11 arrayByApplyingSelector:sel_URLString];
  uint64_t v14 = (void *)[a3 fullPath];
  uint64_t v15 = [v14 stringByDeletingLastPathComponent];
  uint64_t v16 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  if (([v16 fileExistsAtPath:v15] & 1) == 0
    && !objc_msgSend(v16, "mf_makeCompletePath:mode:", v15, 448)
    || [v16 fileExistsAtPath:v9]
    && (id v17 = (const std::__fs::filesystem::path *)[v9 fileSystemRepresentation],
        uint64_t v18 = (const std::__fs::filesystem::path *)[v14 fileSystemRepresentation],
        rename(v17, v18, v19),
        v20))
  {
    [(MailAccount *)self mf_unlock];
LABEL_16:
    long long v27 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", 1033, [NSString stringWithFormat:MFLookupLocalizedString(@"RENAME_FAILED", @"Mail was unable to rename “%@”.", @"Delayed", objc_msgSend(v9, "mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath")]);
    int v28 = 0;
    goto LABEL_19;
  }
  int v21 = objc_msgSend(-[MailAccount library](self, "library"), "renameMailboxes:to:", v12, v13);
  char v22 = v21;
  if (!v21 || (v37 & 3) != 0)
  {
    [(MailAccount *)self mf_unlock];
    if ((v22 & 1) == 0) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v9 = (void *)[v9 stringByDeletingPathExtension];
    if ([v16 fileExistsAtPath:v9])
    {
      long long v23 = (const std::__fs::filesystem::path *)[v9 fileSystemRepresentation];
      long long v24 = (const std::__fs::filesystem::path *)objc_msgSend((id)objc_msgSend(v14, "stringByDeletingPathExtension"), "fileSystemRepresentation");
      rename(v23, v24, v25);
      LODWORD(v23) = v26;
      [(MailAccount *)self mf_unlock];
      if (v23) {
        goto LABEL_16;
      }
    }
    else
    {
      [(MailAccount *)self mf_unlock];
    }
  }
  long long v27 = 0;
  int v28 = 1;
LABEL_19:
  if ([(MFError *)v27 localizedDescription]) {
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", v27);
  }
  if (([a5 isEqual:v10] & 1) == 0
    && ((v28 ^ 1) & 1) == 0
    && [(id)objc_opt_class() mailboxListingNotificationAreEnabled])
  {
    long long v29 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    objc_msgSend(v29, "postNotification:", objc_msgSend(MEMORY[0x1E4F28EA0], "notificationWithName:object:userInfo:", @"AccountMailboxListingDidChange", v10, 0));
  }
  BOOL v38 = v28;
  uint64_t v30 = v10;
  if (a5
    && (*((unsigned char *)&self->_flags + 2) & 2) != 0
    && [(id)objc_opt_class() mailboxListingNotificationAreEnabled])
  {
    id v31 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    objc_msgSend(v31, "postNotification:", objc_msgSend(MEMORY[0x1E4F28EA0], "notificationWithName:object:userInfo:", @"AccountMailboxListingDidChange", a5, 0));
  }
  if (!v27)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v32 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v40 != v34) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"MFMailboxUidWasRenamedNotification", *(void *)(*((void *)&v39 + 1) + 8 * i), 0);
        }
        uint64_t v33 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v33);
    }
  }
  [(MailAccount *)self _synchronouslyLoadListingForParent:a5];
  if (([a5 isEqual:v30] & 1) == 0) {
    [(MailAccount *)self _synchronouslyLoadListingForParent:v30];
  }

  [(MailAccount *)self _writeMailboxCacheWithPrejudice:1];
  return v38;
}

- (BOOL)deleteMailbox:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = 0x1E6865000uLL;
  id v6 = +[MFActivityMonitor currentMonitor];
  int v7 = [a3 type];
  uint64_t v8 = [a3 fullPath];
  uint64_t v9 = (void *)[a3 depthFirstEnumerator];
  id v10 = (void *)[v9 nextObject];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = 0;
  if (([v6 shouldCancel] & 1) == 0 && v10)
  {
    uint64_t v23 = v8;
    int v24 = v7;
    do
    {
      uint64_t v12 = [v10 parent];
      BOOL v13 = [(MailAccount *)self _deleteMailbox:v10];
      if (v13)
      {
        objc_msgSend(v11, "addObject:", objc_msgSend(v10, "URLString"));
        if (v9) {
          uint64_t v14 = [v9 nextObject];
        }
        else {
          uint64_t v14 = 0;
        }
        $79341312EFB130D828C53DE6771A49BA flags = self->_flags;
        if ((*(_DWORD *)&flags & 0x40000) == 0) {
          self->_$79341312EFB130D828C53DE6771A49BA flags = ($79341312EFB130D828C53DE6771A49BA)(*(_DWORD *)&flags & 0xFFFF0000 | (unsigned __int16)(*(_WORD *)&flags + 1));
        }
        [v10 setParent:0];
      }
      else
      {
        uint64_t v14 = (uint64_t)v10;
      }
      if ((v13 & ([v6 shouldCancel] ^ 1)) != 1) {
        break;
      }
      id v10 = (void *)v14;
    }
    while (v14);
    if (!v13)
    {
      BOOL v18 = 0;
      unint64_t v5 = 0x1E6865000uLL;
      int v7 = v24;
      goto LABEL_22;
    }
    unint64_t v5 = 0x1E6865000;
    int v7 = v24;
    uint64_t v8 = v23;
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v8)
    && MFRemoveItemAtPath())
  {
    uint64_t v16 = v8;
    id v17 = MFLogGeneral();
    BOOL v18 = 1;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v16;
      _os_log_impl(&dword_1CFCFE000, v17, OS_LOG_TYPE_INFO, "failed to remove path %@", buf, 0xCu);
    }
  }
  else
  {
    BOOL v18 = 1;
  }
LABEL_22:
  if ([v11 count]) {
    objc_msgSend(-[MailAccount library](self, "library"), "deleteMailboxes:account:", v11, self);
  }

  if (v18)
  {
    uint64_t v19 = 0;
    int v20 = &OBJC_IVAR___MailAccount__inboxMailboxUid;
    switch(v7)
    {
      case 0:
        goto LABEL_37;
      case 1:
        int v20 = &OBJC_IVAR___MailAccount__junkMailboxUid;
        goto LABEL_33;
      case 2:
        int v20 = &OBJC_IVAR___MailAccount__archiveMailboxUid;
        goto LABEL_33;
      case 3:
        int v20 = &OBJC_IVAR___MailAccount__trashMailboxUid;
        goto LABEL_33;
      case 4:
        int v20 = &OBJC_IVAR___MailAccount__sentMessagesMailboxUid;
        goto LABEL_33;
      case 5:
        int v20 = &OBJC_IVAR___MailAccount__draftsMailboxUid;
        goto LABEL_33;
      case 7:
LABEL_33:
        uint64_t v19 = (id *)((char *)&self->super.super.isa + *v20);
        break;
      default:
        break;
    }
    [(MFLock *)self->_cachedMailboxenLock lock];
    if (v19)
    {

      *uint64_t v19 = 0;
    }
    [(MFLock *)self->_cachedMailboxenLock unlock];
  }
  else if (!objc_msgSend((id)objc_msgSend(*(id *)(v5 + 2120), "currentMonitor"), "error"))
  {
    objc_msgSend((id)objc_msgSend(*(id *)(v5 + 2120), "currentMonitor"), "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", 1030, objc_msgSend(NSString, "stringWithFormat:", MFLookupLocalizedString(@"DELETE_FAILED_FORMAT", @"Unable to delete “%@”.", @"Delayed"), objc_msgSend(a3, "accountRelativePath"))));
  }
LABEL_37:
  if (v12)
  {
    id v21 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v5 + 2120), "currentMonitor"), "error");
    [(MailAccount *)self _synchronouslyLoadListingForParent:v12];
    [(MailAccount *)self mf_lock];
    [(MailAccount *)self _setChildren:0 forMailboxUid:v12];
    [(MailAccount *)self mf_unlock];
    if (v21)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v5 + 2120), "currentMonitor"), "setError:", v21);
    }
  }
  [(MailAccount *)self _writeMailboxCacheWithPrejudice:1];
  return v18;
}

- (void)_resetAllMailboxURLs:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(MailAccount *)self isActive])
  {
    id v5 = +[MailAccount mailAccounts];
    if (v5)
    {
      if ([v5 containsObject:self])
      {
        id v6 = [(MailAccount *)self allMailboxUids];
        uint64_t v7 = [v6 count];
        uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
        uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v10 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v6);
              }
              uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
              uint64_t v15 = [v14 URLString];
              if (v15)
              {
                uint64_t v16 = (void *)v15;
                [v14 flushCriteria];
                uint64_t v17 = [v14 URLString];
                if (v17)
                {
                  uint64_t v18 = v17;
                  if (([v16 isEqualToString:v17] & 1) == 0)
                  {
                    [v8 addObject:v16];
                    [v9 addObject:v18];
                  }
                }
              }
            }
            uint64_t v11 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v11);
        }
        if ([v9 count])
        {
          if (v3) {
            objc_msgSend(-[MailAccount library](self, "library"), "renameMailboxes:to:", v8, v9);
          }
        }
      }
    }
  }
}

- (void)resetMailboxURLs
{
}

- (void)setUsername:(id)a3
{
  id v5 = [(MFAccount *)self username];
  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = &stru_1F265CF90;
  }
  v8.receiver = self;
  v8.super_class = (Class)MailAccount;
  [(MFAccount *)&v8 setUsername:a3];
  uint64_t v7 = [(MFAccount *)self username];
  if (!v7) {
    uint64_t v7 = &stru_1F265CF90;
  }
  if (([(__CFString *)v7 isEqualToString:v6] & 1) == 0) {
    [(MailAccount *)self _resetAllMailboxURLs:0];
  }
}

- (void)setHostname:(id)a3
{
  id v5 = [(MFAccount *)self hostname];
  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = &stru_1F265CF90;
  }
  v8.receiver = self;
  v8.super_class = (Class)MailAccount;
  [(MFAccount *)&v8 setHostname:a3];
  uint64_t v7 = [(MFAccount *)self hostname];
  if (!v7) {
    uint64_t v7 = &stru_1F265CF90;
  }
  if (([(__CFString *)v7 isEqualToString:v6] & 1) == 0) {
    [(MailAccount *)self _resetAllMailboxURLs:0];
  }
}

- (BOOL)isHostnameEquivalentTo:(id)a3
{
  if ([(MFAccount *)self hostname] == a3) {
    return 1;
  }
  id v5 = [(MFAccount *)self hostname];
  return [(NSString *)v5 isEqualToString:a3];
}

- (BOOL)isAccountClassEquivalentTo:(id)a3
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  if (NSStringFromClass(v4) == a3) {
    return 1;
  }
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  return [(NSString *)v6 isEqualToString:a3];
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
  if (([a4 isEqual:@"Hostname"] & 1) != 0
    || ([a4 isEqual:@"Username"] & 1) != 0
    || [a4 isEqual:@"PortNumber"])
  {
    objc_msgSend(-[MailAccount allMailboxUids](self, "allMailboxUids"), "makeObjectsPerformSelector:", sel_URLString);
    v7.receiver = self;
    v7.super_class = (Class)MailAccount;
    [(MFAccount *)&v7 setValueInAccountProperties:a3 forKey:a4];
    [(MailAccount *)self _resetAllMailboxURLs:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MailAccount;
    [(MFAccount *)&v7 setValueInAccountProperties:a3 forKey:a4];
  }
}

- (void)setConnectionError:(id)a3
{
  id v5 = a3;
  _MFLockGlobalLock();
  lastConnectionError = self->_lastConnectionError;
  self->_lastConnectionError = (MFError *)a3;
  _MFUnlockGlobalLock();

  if ((a3 != 0) == (lastConnectionError == 0))
  {
    objc_super v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"AccountOfflineStatusDidChange" object:self userInfo:0];
  }
}

- (id)connectionError
{
  _MFLockGlobalLock();
  uint64_t v3 = self->_lastConnectionError;
  _MFUnlockGlobalLock();
  return v3;
}

- (id)storeForMailboxUid:(id)a3
{
  if (!a3 || self->_rootMailboxUid == a3) {
    return 0;
  }
  id v4 = -[MFWeakObjectCache objectForKey:](self->_messageStoresCache, "objectForKey:");
  objc_msgSend(v4, "setLibrary:", -[MailAccount library](self, "library"));
  return v4;
}

- (Class)storeClass
{
}

+ (MailAccount)accountWithURL:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 scheme];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [a3 user];
  int v8 = objc_msgSend(a3, "ef_hostNilForEmpty");
  objc_super v9 = (void *)[a3 port];
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v11 = (void *)[a1 mailAccounts];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([v16 isActive]) {
          [v10 insertObject:v16 atIndex:0];
        }
        else {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v13);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v17 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (!v17) {
    return 0;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v30;
  do
  {
    uint64_t v20 = 0;
    do
    {
      if (*(void *)v30 != v19) {
        objc_enumerationMutation(v10);
      }
      long long v21 = *(MailAccount **)(*((void *)&v29 + 1) + 8 * v20);
      id v22 = [(MailAccount *)v21 _URLScheme];
      if (!v22 || [v22 caseInsensitiveCompare:v6]) {
        goto LABEL_19;
      }
      uint64_t v23 = [(MFAccount *)v21 hostname];
      if (v8 == (void *)v23)
      {
        BOOL v24 = 1;
      }
      else
      {
        if (!v8) {
          goto LABEL_19;
        }
        BOOL v24 = [v8 caseInsensitiveCompare:v23] == 0;
        if (!v24) {
          goto LABEL_32;
        }
      }
      if (v9)
      {
        unsigned int v25 = [(MFAccount *)v21 portNumber];
        if (!v25
          && (![(MFAccount *)v21 usesSSL]
           || (unsigned int v25 = [(MFAccount *)v21 defaultSecurePortNumber]) == 0))
        {
          unsigned int v25 = [(MFAccount *)v21 defaultPortNumber];
        }
        BOOL v24 = [v9 unsignedIntValue] == v25;
      }
LABEL_32:
      if (v24 && v7)
      {
        uint64_t v26 = [(MFAccount *)v21 username];
        if (v26 && [(NSString *)v26 caseInsensitiveCompare:v7] == NSOrderedSame) {
          return v21;
        }
      }
      else if (v24)
      {
        return v21;
      }
LABEL_19:
      ++v20;
    }
    while (v18 != v20);
    uint64_t v27 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
    uint64_t v18 = v27;
  }
  while (v27);
  return 0;
}

+ (id)infoForURL:(id)a3
{
  id v4 = objc_msgSend(a1, "accountWithURL:");
  return (id)[v4 _infoForMatchingURL:a3];
}

+ (MailAccount)accountWithURLString:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:a3];
  uint64_t v5 = (MailAccount *)[a1 accountWithURL:v4];

  return v5;
}

+ (id)mailboxUidFromActiveAccountsForURL:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = +[MailAccount infoForURL:](MailAccount, "infoForURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:"));
  id v4 = (void *)[v3 objectForKey:@"Account"];
  return (id)[v4 mailboxUidForInfo:v3];
}

- (void)emptyTrash
{
  uint64_t v3 = [(MailAccount *)self emptyFrequencyForMailboxType:3];
  if ((v3 & 0x80000000) == 0)
  {
    uint64_t v4 = v3;
    id v5 = [(MailAccount *)self mailboxUidOfType:3 createIfNeeded:0];
    if (v5)
    {
      [(MailAccount *)self deleteMessagesFromMailboxUid:v5 olderThanNumberOfDays:v4];
    }
  }
}

- (BOOL)updateEmailAliases
{
  return 0;
}

+ (void)updateEmailAliasesForActiveAccounts
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = +[MailAccount activeAccounts];
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
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        int v8 = (void *)[v7 lastEmailAliasesSyncDate];
        if (v8)
        {
          [v8 timeIntervalSinceNow];
          if (v9 >= -600.0) {
            continue;
          }
        }
        if ([v7 updateEmailAliases]) {
          [v7 savePersistentAccount];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

+ (id)standardAccountClass:(Class)a3 valueForKey:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  _MFLockGlobalLock();
  if (!standardAccountClass_valueForKey__standardAccountValues) {
    standardAccountClass_valueForKey__standardAccountValues = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  if (!standardAccountClass_valueForKey__loadedBundles) {
    standardAccountClass_valueForKey__loadedBundles = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  uint64_t v7 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:a1];
  uint64_t v8 = [v7 bundleIdentifier];
  if (([(id)standardAccountClass_valueForKey__loadedBundles containsObject:v8] & 1) == 0)
  {
    [(id)standardAccountClass_valueForKey__loadedBundles addObject:v8];
    uint64_t v9 = [v7 pathForResource:@"ISP" ofType:@"plist"];
    uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v9];
    if (v10)
    {
      long long v11 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:v10 options:0 format:0 error:0];
      if (v11)
      {
        long long v12 = v11;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v13 = objc_msgSend(v11, "allKeys", 0);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v23 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              uint64_t v19 = [v12 objectForKey:v18];
              [(id)standardAccountClass_valueForKey__standardAccountValues setObject:v19 forKey:v18];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v15);
        }
      }
    }
  }
  if (standardAccountClass_valueForKey__standardAccountValues) {
    uint64_t v20 = objc_msgSend((id)objc_msgSend((id)standardAccountClass_valueForKey__standardAccountValues, "objectForKey:", NSStringFromClass(a3)), "objectForKey:", a4);
  }
  else {
    uint64_t v20 = 0;
  }
  _MFUnlockGlobalLock();
  return v20;
}

+ (id)predefinedValueForKey:(id)a3
{
  return (id)[a1 standardAccountClass:a1 valueForKey:a3];
}

- (int64_t)libraryID
{
  id v3 = [(MailAccount *)self library];
  [(MFLock *)self->_cachedLibraryIDLock lock];
  if (self->_cachedLibraryID < 0)
  {
    int64_t v4 = [v3 libraryIDForAccount:self];
    self->_cachedLibraryID = v4;
    if (v4 < 0)
    {
      int64_t v5 = [v3 createLibraryIDForAccount:self];
      self->_cachedLibraryID = v5;
      if (v5 < 0) {
        -[MailAccount libraryID]();
      }
    }
  }
  [(MFLock *)self->_cachedLibraryIDLock unlock];
  return self->_cachedLibraryID;
}

- (BOOL)canForwardWithoutDownload
{
  return 0;
}

- (void)setLibrary:(id)a3
{
  library = self->_library;
  if (library != a3)
  {

    self->_library = (MFMessageLibrary *)a3;
  }
}

+ (BOOL)usernameIsEmailAddress
{
  return 0;
}

- (BOOL)shouldAppearInMailSettings
{
  return 1;
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

- (BOOL)supportsPurge
{
  return 1;
}

- (void)setCachePolicy:(int)a3
{
  unsigned int v3 = a3;
  if ([(MailAccount *)self cachePolicy] != a3)
  {
    if (v3 > 3) {
      unsigned int v3 = 0;
    }
    _MFLockGlobalLock();
    [(MFAccount *)self setAccountProperty:_cachePolicyNames[v3] forKey:@"CachePolicy"];
    _MFUnlockGlobalLock();
  }
}

- (int)cachePolicy
{
  id v2 = [(MFAccount *)self _objectForAccountInfoKey:@"CachePolicy"];
  uint64_t v3 = 0;
  while (([v2 isEqualToString:_cachePolicyNames[v3]] & 1) == 0)
  {
    if (++v3 == 4)
    {
      LODWORD(v3) = 0;
      return v3;
    }
  }
  return v3;
}

- (BOOL)archiveSentMessages
{
  return [(MFAccount *)self _BOOLForAccountInfoKey:@"SaveSentMessages" defaultValue:1];
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

- (id)statisticsKind
{
  return 0;
}

- (BOOL)needsRemoteSearchResultsVerification
{
  return 0;
}

- (id)loggingIdentifier
{
  id v3 = [(MailAccount *)self statisticsKind];
  int64_t v4 = [(NSString *)[(MFAccount *)self uniqueId] substringToIndex:8];
  return (id)[NSString stringWithFormat:@"%@/%@", v3, v4];
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
  NSUInteger v3 = [(NSString *)[(MFAccount *)self hostname] length];
  if (v3)
  {
    NSUInteger v3 = [(NSString *)[(MFAccount *)self username] length];
    if (v3) {
      LOBYTE(v3) = objc_msgSend(-[MFAccount password](self, "password"), "length") != 0;
    }
  }
  return v3;
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
  [(MailAccount *)self mf_lock];
  currentChokedActions = self->_currentChokedActions;
  if (!currentChokedActions)
  {
    currentChokedActions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_currentChokedActions = currentChokedActions;
  }
  id v10 = [(NSMutableDictionary *)currentChokedActions mf_objectForKey:a3 ofClass:objc_opt_class()];
  id v11 = v10;
  long long v12 = (void *)[v10 objectForKey:@"MFMailboxDictClientCount"];
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "intValue") + 1), @"MFMailboxDictClientCount");
  long long v13 = (void *)[v10 objectForKey:@"MFMailboxDictLock"];
  if (v13)
  {
    [(MailAccount *)self mf_unlock];
    [v13 lockWhenCondition:2];
    *a5 = (id)[v10 objectForKey:a4];
    [(MailAccount *)self mf_lock];
    int v14 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", @"MFMailboxDictClientCount"), "intValue");
    if (v14 < 2) {
      [(NSMutableDictionary *)self->_currentChokedActions removeObjectForKey:a3];
    }
    else {
      objc_msgSend(v10, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", (v14 - 1)), @"MFMailboxDictClientCount");
    }
    [(MailAccount *)self mf_unlock];
    [v13 unlockWithCondition:2];
  }
  else
  {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F734B0]) initWithName:@"ChokeLock" condition:1 andDelegate:0];
    [v10 setObject:v15 forKey:@"MFMailboxDictLock"];

    [(MailAccount *)self mf_unlock];
    [v15 lock];
  }

  return v13 != 0;
}

- (void)didFinishActionForChokePoint:(id)a3 coalescePoint:(id)a4 withResult:(id)a5
{
  [(MailAccount *)self mf_lock];
  uint64_t v9 = (void *)[(NSMutableDictionary *)self->_currentChokedActions objectForKey:a3];
  id v10 = (void *)[v9 objectForKey:@"MFMailboxDictLock"];
  int v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"MFMailboxDictClientCount"), "intValue");
  if (v11 < 2)
  {
    [v10 unlock];
    [(NSMutableDictionary *)self->_currentChokedActions removeObjectForKey:a3];
  }
  else
  {
    if (!a5) {
      -[MailAccount didFinishActionForChokePoint:coalescePoint:withResult:]((uint64_t *)&self->_currentChokedActions, (uint64_t)v9);
    }
    objc_msgSend(v9, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", (v11 - 1)), @"MFMailboxDictClientCount");
    [v9 setObject:a5 forKey:a4];
    [v10 unlockWithCondition:2];
  }
  [(MailAccount *)self mf_unlock];
}

- (void)deliveryAccountWillBeRemoved:(id)a3
{
  id v5 = [(MailAccount *)self _deliveryAccountCreateIfNeeded:0];
  if (v5 == (id)[a3 object])
  {
    [(MailAccount *)self setDeliveryAccount:0];
  }
}

- (id)pushedMailboxUids
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(MailAccount *)self primaryMailboxUid];
  return (id)[v2 setWithObject:v3];
}

- (BOOL)supportsUserPushedMailboxes
{
  return 0;
}

+ (id)_accountWithPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v4 = (void *)[a1 mailboxUidForFileSystemPath:a3 create:0];
  if (v4)
  {
    return (id)[v4 account];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = (void *)_accountsSortedByPath;
    uint64_t v7 = [(id)_accountsSortedByPath countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v7) {
      return 0;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
LABEL_7:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v6);
      }
      int v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
      if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v11, "path"))) {
        return v11;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          goto LABEL_7;
        }
        return 0;
      }
    }
  }
}

+ (void)setDataclassesConsideredActive:(id)a3
{
  if (setDataclassesConsideredActive__pred != -1) {
    dispatch_once(&setDataclassesConsideredActive__pred, &__block_literal_global_264);
  }
  [(id)__dataclassesConsideredActiveLock lock];
  if ((id)__dataclassesConsideredActive != a3)
  {

    __dataclassesConsideredActive = [a3 copy];
  }
  int64_t v4 = (void *)__dataclassesConsideredActiveLock;
  [v4 unlock];
}

uint64_t __46__MailAccount_setDataclassesConsideredActive___block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"Active Dataclasses Lock" andDelegate:0];
  __dataclassesConsideredActiveLocuint64_t k = result;
  return result;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MFAccount *)self persistentAccount];
  BOOL v6 = [(MailAccount *)self isActiveWithPersistentAccount:v5];
  if (v5) {
    [(ACAccount *)v5 setEnabled:v3 forDataclass:*MEMORY[0x1E4F17AD8]];
  }
  if ([(MailAccount *)self isActiveWithPersistentAccount:v5] == v3 && v6 != v3)
  {
    [(MailAccount *)self _didBecomeActive:v3];
  }
}

- (void)_didBecomeActive:(BOOL)a3
{
  if (a3)
  {
    _configureMailboxCache((uint64_t)self);
    [(MailAccount *)self resetSpecialMailboxes];
  }
  else
  {
    -[MailAccount _asynchronouslyInvalidateAndDeleteAccountData:](self, "_asynchronouslyInvalidateAndDeleteAccountData:");
  }
  _resetAllEmailAddresses();
}

- (int)_emptyFrequencyForKey:(id)a3 defaultValue:(id)a4
{
  id v5 = [(MFAccount *)self _objectForAccountInfoKey:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v5 isEqualToString:&stru_1F265CF90]) {
      id v5 = a4;
    }
  }
  return [v5 intValue];
}

- (BOOL)shouldFetchAgainWithError:(id)a3 foregroundRequest:(BOOL)a4
{
  BOOL v6 = (void *)[a3 domain];
  if (!a3) {
    return 1;
  }
  uint64_t v7 = v6;
  if ([v6 isEqualToString:*MEMORY[0x1E4F288C8]]) {
    return 0;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F28798]]) {
    return [a3 code] != 60 || a4;
  }
  if (![v7 isEqualToString:@"MFMessageErrorDomain"]) {
    return 1;
  }
  uint64_t v9 = [a3 code];
  if ((unint64_t)(v9 - 1032) <= 0x1B) {
    return (0x77FFF7Eu >> (v9 - 8)) & 1;
  }
  else {
    return 1;
  }
}

- (void)setMailboxCachePath:(id)a3
{
  mailboxCachePath = self->_mailboxCachePath;
  if (mailboxCachePath != a3)
  {

    self->_mailboxCachePath = (NSString *)a3;
  }
}

- (void)_loadEntriesFromFileSystemPath:(id)a3 parent:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v19 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v7 = [a3 length];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, 0);
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  context[0] = self;
  context[1] = a3;
  id v18 = a4;
  context[2] = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (([v13 hasPrefix:@"."] & 1) == 0)
        {
          char v22 = 0;
          [a3 appendString:@"/"];
          [a3 appendString:v13];
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", a3, &v22))BOOL v14 = v22 == 0; {
          else
          }
            BOOL v14 = 1;
          if (!v14)
          {
            if (-[NSString isEqualToString:](-[MailAccount mailboxPathExtension](self, "mailboxPathExtension"), "isEqualToString:", [v13 pathExtension]))
            {
              long long v13 = (void *)[v13 stringByDeletingPathExtension];
            }
            id v15 = [(MailAccount *)self _uidNameForPathComponent:v13];
            uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v15, @"MailboxName", &unk_1F26754A8, @"MailboxAttributes", 0);
            [v21 addObject:v16];

            uint64_t v11 = v20;
          }
          objc_msgSend(a3, "deleteCharactersInRange:", v7, objc_msgSend(a3, "length") - v7);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }
  if (-[MailAccount _loadMailboxListingIntoCache:attributes:children:parent:](self, "_loadMailboxListingIntoCache:attributes:children:parent:", [v18 name], 2, v21, v18))
  {
    $79341312EFB130D828C53DE6771A49BA flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x40000) == 0) {
      self->_$79341312EFB130D828C53DE6771A49BA flags = ($79341312EFB130D828C53DE6771A49BA)(*(_DWORD *)&flags & 0xFFFF0000 | (unsigned __int16)(*(_WORD *)&flags + 1));
    }
  }
  v30.length = [v21 count];
  v30.location = 0;
  CFArrayApplyFunction((CFArrayRef)v21, v30, (CFArrayApplierFunction)_recurseIntoFileSystem, context);

  [v19 drain];
}

- (void)_writeMailboxCacheWithPrejudice:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3
    || ((*(_DWORD *)&self->_flags & 0xFFFEu) >= 0xA ? (BOOL v4 = (*(_DWORD *)&self->_flags & 0x40000) == 0) : (BOOL v4 = 1), !v4))
  {
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", -[MailAccount path](self, "path")) & 1) == 0)objc_msgSend(-[MailAccount path](self, "path"), "mf_makeDirectoryWithMode:", 448); {
    id v5 = [(MailAccount *)self mailboxCachePath];
    }
    [(MailAccount *)self mf_lock];
    id v6 = [(MFMailboxUid *)self->_rootMailboxUid children];
    uint64_t v7 = [v6 count];
    if (v7)
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v6);
            }
            objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
          }
          uint64_t v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
      long long v12 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      CFDictionarySetValue(v12, @"mboxes", v8);

      [(MailAccount *)self _writeCustomInfoToMailboxCache:v12];
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F98], "dataWithPropertyList:format:options:error:", v12, 200, 0, 0), "writeToFile:options:error:", v5, 1073741825, 0);
    }
    [(MailAccount *)self mf_unlock];
    self->_$79341312EFB130D828C53DE6771A49BA flags = ($79341312EFB130D828C53DE6771A49BA)(*((unsigned __int16 *)&self->_flags + 1) << 16);
  }
}

- (BOOL)_deleteMailbox:(id)a3
{
  return 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MailAccount;
  return [(NSString *)[(MFAccount *)&v3 description] stringByAppendingFormat:@" path=%@", self->_path];
}

- (id)powerAssertionIdentifierWithPrefix:(id)a3
{
  if (objc_msgSend(-[MailAccount displayName](self, "displayName"), "length")) {
    id v5 = [(MailAccount *)self displayName];
  }
  else {
    id v5 = &stru_1F265CF90;
  }
  return (id)[a3 stringByAppendingFormat:@"-%@-(%@)", -[MFAccount uniqueId](self, "uniqueId"), v5];
}

+ (void)_setOutboxMailboxUid:(id)a3
{
  objc_msgSend(a1, "mf_lock");
  if ((id)_outboxUid != a3)
  {

    _outboxUid = (uint64_t)a3;
    [(id)_outboxUid setType:6];
  }
  if ([a3 isValid]) {
    objc_msgSend((id)objc_msgSend(a3, "account"), "_setChildren:forMailboxUid:", 0, objc_msgSend(a3, "parent"));
  }
  objc_msgSend(a1, "mf_unlock");
}

- (id)_specialMailboxIvarOfType:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) <= 6 && ((0x5Fu >> v3)) {
    return (id *)((char *)&self->super.super.isa + *off_1E68668F0[v3]);
  }
  else {
    return 0;
  }
}

- (void)_setSpecialMailbox:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = (__CFString *)[a3 accountRelativePath];
  uint64_t v8 = [(MailAccount *)self specialMailboxNameForType:v4];
  if (v7 != v8)
  {
    uint64_t v9 = v8 ? v8 : &stru_1F265CF90;
    if (([(__CFString *)v7 isEqualToString:v9] & 1) == 0)
    {
      [(MailAccount *)self _setSpecialMailboxName:v7 forType:v4];
      [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:a3 forType:v4];
    }
  }
}

- (BOOL)_canEmptyMessagesFromMailboxUid:(id)a3
{
  return 1;
}

- (BOOL)_shouldLogDeleteActivity
{
  int v2 = _logDeleteActivity;
  if (_logDeleteActivity == -1)
  {
    int v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"LogDeleteActivity");
    _logDeleteActivity = v2;
  }
  return v2 == 1;
}

- (id)_infoForMatchingURL:(id)a3
{
  id v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  id v6 = (void *)[a3 relativePath];
  [v5 setObject:self forKey:@"Account"];
  uint64_t v7 = [v6 rangeOfString:@"/" options:8];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    id v6 = objc_msgSend(v6, "substringWithRange:", v7 + v8, objc_msgSend(v6, "length") - (v7 + v8));
  }
  if (v6 && ([v6 isEqualToString:&stru_1F265CF90] & 1) == 0) {
    [v5 setObject:v6 forKey:@"RelativePath"];
  }
  return v5;
}

- (id)_URLScheme
{
  return 0;
}

- (id)URLForMessage:(id)a3
{
  return 0;
}

- (id)uniqueServerIdForMessage:(id)a3
{
  int v3 = (void *)[a3 globalMessageURL];
  return (id)[v3 absoluteString];
}

- (id)newMailboxWithParent:(id)a3 name:(id)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "pathRelativeToMailbox:", objc_msgSend((id)objc_msgSend(a3, "account"), "rootMailboxUid")), "stringByAppendingPathComponent:", a4);
  return [(MailAccount *)self mailboxUidForRelativePath:v5 create:1];
}

+ (BOOL)canMoveMessagesFromAccount:(id)a3 toAccount:(id)a4
{
  if (a3 == a4) {
    return 1;
  }
  if ([a3 restrictedFromTransferingMessagesToOtherAccounts]) {
    return 0;
  }
  return [a4 supportsAppend];
}

- (id)moveMessages:(id)a3 fromMailbox:(id)a4 toMailbox:(id)a5 markAsRead:(BOOL)a6
{
  id v6 = [MFMessageTransferResult alloc];
  uint64_t v7 = [(MFMessageTransferResult *)v6 initWithResultCode:0 failedMessages:MEMORY[0x1E4F1CBF0] transferedMessage:MEMORY[0x1E4F1CBF0]];
  return v7;
}

- (id)_localMailboxNameForType:(int)a3 usingDisplayName:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = +[LocalAccount localAccount];
  uint64_t v8 = (void *)[v7 specialMailboxNameForType:v5];
  if (v8)
  {
    if (a4) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v8 = (void *)[v7 _defaultSpecialMailboxNameForType:v5];
    if (a4) {
      goto LABEL_8;
    }
  }
  id v9 = [(MailAccount *)self displayName];
  if (!v9 || (a4 = v9, [v9 isEqualToString:&stru_1F265CF90]))
  {
    a4 = [(MailAccount *)self firstEmailAddress];
    if (!a4) {
      return v8;
    }
  }
LABEL_8:
  if ([a4 isEqualToString:&stru_1F265CF90]) {
    return v8;
  }
  return (id)[v8 stringByAppendingFormat:@" (%@)", a4];
}

- (BOOL)isMailboxLocalForType:(int)a3
{
  return 0;
}

- (id)allLocalMailboxUids
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  do
  {
    uint64_t v5 = dword_1CFD6F6E0[v3];
    if ([(MailAccount *)self isMailboxLocalForType:v5])
    {
      id v6 = [(MailAccount *)self mailboxUidOfType:v5 createIfNeeded:0];
      if (v6)
      {
        id v7 = v6;
        if (!v4) {
          uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
        }
        [v4 addObject:v7];
      }
    }
    ++v3;
  }
  while (v3 != 4);
  return v4;
}

- (BOOL)shouldRestoreMessagesAfterFailedDelete
{
  return 0;
}

- (BOOL)shouldFetchBodiesWhenMovingToTrash
{
  return 1;
}

- (id)saveSentFolder
{
  return 0;
}

- (id)signingIdentityPersistentReferenceForAddress:(id)a3
{
  id v4 = [(MailAccount *)self valueInAccountLookAsidePropertiesForKey:@"SendingIdentities"];
  return (id)[v4 objectForKey:a3];
}

- (void)setSigningIdentityPersistentReference:(id)a3 forAddress:(id)a4
{
}

- (void)setEncryptionIdentityPersistentReference:(id)a3 forAddress:(id)a4
{
}

- (BOOL)secureMIMEEnabled
{
  id v2 = [(MFAccount *)self accountPropertyForKey:@"SMIMEEnabled"];
  return [v2 BOOLValue];
}

- (BOOL)perMessageEncryptionEnabled
{
  if (![(MFAccount *)self isManaged]) {
    return 1;
  }
  id v3 = [(MFAccount *)self accountPropertyForKey:@"PerMessageSMIMEEnabled"];
  return [v3 BOOLValue];
}

- (int)secureCompositionEncryptionPolicyForAddress:(id)a3
{
  int result = objc_msgSend((id)objc_msgSend(a3, "mf_uncommentedAddress"), "isEqualToString:", objc_msgSend(-[MailAccount firstEmailAddress](self, "firstEmailAddress"), "mf_uncommentedAddress"));
  if (result) {
    return objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", @"SMIMEEncryptionEnabled"), "BOOLValue");
  }
  return result;
}

- (id)copyDataForRemoteEncryptionCertificatesForAddress:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)restrictedFromTransferingMessagesToOtherAccounts
{
  id v2 = [(MFAccount *)self accountPropertyForKey:@"MFRestrictMessageTransfersToOtherAccounts"];
  return [v2 BOOLValue];
}

- (BOOL)restrictedFromSendingExternally
{
  id v2 = [(MFAccount *)self accountPropertyForKey:@"MFRestrictSendingFromExternalProcesses"];
  return [v2 BOOLValue];
}

- (BOOL)restrictedFromSyncingRecents
{
  id v2 = [(MFAccount *)self accountPropertyForKey:@"Prevent Recents Syncing"];
  return [v2 BOOLValue];
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

- (BOOL)supportsArchiving
{
  return 1;
}

- (BOOL)supportsThreadOperations
{
  return 1;
}

- (BOOL)preventArchiveForMailbox:(id)a3
{
  BOOL v4 = [(MailAccount *)self supportsArchiving];
  BOOL result = 0;
  if (a3)
  {
    if (v4) {
      return [a3 type] - 1 < 5;
    }
  }
  return result;
}

- (BOOL)canArchiveForMailbox:(id)a3
{
  BOOL v5 = [(MailAccount *)self supportsArchiving];
  if (v5) {
    LOBYTE(v5) = ![(MailAccount *)self preventArchiveForMailbox:a3];
  }
  return v5;
}

- (int)archiveDestinationForMailbox:(id)a3
{
  if (![(MailAccount *)self supportsArchiving]) {
    -[MailAccount archiveDestinationForMailbox:]();
  }
  if ([(MailAccount *)self canArchiveForMailbox:a3]) {
    return 2;
  }
  else {
    return 3;
  }
}

- (BOOL)shouldArchiveByDefault
{
  BOOL v3 = [(MailAccount *)self supportsArchiving];
  if (v3)
  {
    LOBYTE(v3) = [(MFAccount *)self _BOOLForAccountInfoKey:@"ArchiveMessages" defaultValue:0];
  }
  return v3;
}

- (BOOL)sourceIsManaged
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"ForceSourceIsManaged"))return 1; {
  BOOL v4 = [(MFAccount *)self persistentAccount];
  }
  return [(ACAccount *)v4 MCIsManaged];
}

- (id)unsupportedContinuationTypes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)supportsContinuationType:(id)a3
{
  return objc_msgSend(-[MailAccount unsupportedContinuationTypes](self, "unsupportedContinuationTypes"), "containsObject:", a3) ^ 1;
}

- (BOOL)supportsMailDrop
{
  v3.receiver = self;
  v3.super_class = (Class)MailAccount;
  return [(MFAccount *)&v3 supportsMailDrop];
}

- (BOOL)supportsFastRemoteBodySearch
{
  return self->_supportsFastRemoteBodySearch;
}

- (void)libraryID
{
}

- (void)didFinishActionForChokePoint:(uint64_t *)a1 coalescePoint:(uint64_t)a2 withResult:.cold.1(uint64_t *a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *a1;
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_impl(&dword_1CFCFE000, v4, OS_LOG_TYPE_DEFAULT, "#Warning <rdar://problem/17733540> _currentChokedActions: %@\nmailboxDict: %@", (uint8_t *)&v6, 0x16u);
  }
  __assert_rtn("-[MailAccount didFinishActionForChokePoint:coalescePoint:withResult:]", "MailAccount.m", 3011, "0");
}

- (void)archiveDestinationForMailbox:.cold.1()
{
}

@end