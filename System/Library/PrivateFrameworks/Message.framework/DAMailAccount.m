@interface DAMailAccount
+ (Class)_accountConduitClass;
+ (id)_URLScheme;
+ (id)accountIDForDirectoryName:(id)a3 isAccountDirectory:(BOOL *)a4;
+ (id)accountTypeString;
+ (id)csAccountTypeString;
+ (id)displayedAccountTypeString;
+ (id)displayedShortAccountTypeString;
+ (id)legacyPathForAccountIdentifier:(id)a3 withHostname:(id)a4 username:(id)a5;
- (BOOL)_deleteMailbox:(id)a3 reflectToServer:(BOOL)a4;
- (BOOL)_isUnitTesting;
- (BOOL)addRequest:(id)a3 consumer:(id)a4 mailbox:(id)a5;
- (BOOL)addRequests:(id)a3 mailbox:(id)a4;
- (BOOL)addRequests:(id)a3 mailbox:(id)a4 combine:(BOOL)a5;
- (BOOL)canArchiveSentMessages;
- (BOOL)canGoOffline;
- (BOOL)canReceiveNewMailNotifications;
- (BOOL)derivesDeliveryAccountInfoFromMailAccount;
- (BOOL)finishedInitialMailboxListLoad;
- (BOOL)isActive;
- (BOOL)isEnabledForDataclass:(id)a3;
- (BOOL)isMailboxLocalForType:(int64_t)a3;
- (BOOL)isManaged;
- (BOOL)isRunningInDisallowedBundle;
- (BOOL)moveSupported;
- (BOOL)moveSupportedFromMailboxURL:(id)a3 toURL:(id)a4;
- (BOOL)mustArchiveSentMessages;
- (BOOL)newMailboxNameIsAcceptable:(id)a3 reasonForFailure:(id *)a4;
- (BOOL)perMessageEncryptionEnabledForAddress:(id)a3;
- (BOOL)performRequests:(id)a3 mailbox:(id)a4;
- (BOOL)reconstituteOrphanedMeetingInMessage:(id)a3;
- (BOOL)renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5;
- (BOOL)restrictedFromSendingExternally;
- (BOOL)restrictedFromSyncingRecents;
- (BOOL)restrictedFromTransferingMessagesToOtherAccounts;
- (BOOL)shouldArchiveByDefault;
- (BOOL)shouldDisplayHostnameInErrorMessages;
- (BOOL)shouldFetchAgainWithError:(id)a3 foregroundRequest:(BOOL)a4;
- (BOOL)shouldRestoreMessagesAfterFailedDelete;
- (BOOL)sourceIsManaged;
- (BOOL)supportsMailDrop;
- (BOOL)supportsMailboxEditing;
- (BOOL)supportsMessageFlagging;
- (BOOL)supportsRemoteAppend;
- (BOOL)supportsServerDrafts;
- (BOOL)supportsThreadOperations;
- (BOOL)supportsUniqueServerId;
- (BOOL)supportsUserPushedMailboxes;
- (Class)storeClass;
- (DAMailAccount)initWithDAAccount:(id)a3;
- (DAMailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4;
- (MFMailboxUid)virtualAllSearchMailbox;
- (id)URLStringFromLegacyURLString:(id)a3;
- (id)_URLScheme;
- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 existingMailboxUid:(id)a6 dictionary:(id)a7;
- (id)_copyMailboxWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 dictionary:(id)a6;
- (id)_folderIdsForMailboxUids:(id)a3;
- (id)_inboxFolderID;
- (id)_infoForMatchingURL:(id)a3;
- (id)_newMailboxWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 dictionary:(id)a6 withCreationOption:(int64_t)a7;
- (id)_relativePathForType:(int64_t)a3;
- (id)_relativePathSpecialMailboxUidWithType:(int64_t)a3 create:(BOOL)a4;
- (id)_remoteIDsForFlagChangeAction:(id)a3;
- (id)_specialMailboxUidWithType:(int64_t)a3 create:(BOOL)a4;
- (id)_updateWatchedFolderIdsAndNotify:(BOOL)a3;
- (id)_watchedFolderIds;
- (id)accountConduit;
- (id)accountForRenewingCredentials;
- (id)accountPropertyForKey:(id)a3;
- (id)allMailboxUids;
- (id)copyDataForRemoteEncryptionCertificatesForAddresses:(id)a3 errors:(id *)a4;
- (id)deliveryAccount;
- (id)displayName;
- (id)encryptionIdentityPersistentReferenceForAddress:(id)a3;
- (id)fetchLimits;
- (id)folderIDForMailbox:(id)a3;
- (id)hostname;
- (id)iconString;
- (id)mailboxForFolderID:(id)a3;
- (id)mailboxPathExtension;
- (id)mailboxUidForInfo:(id)a3;
- (id)meetingStorePersistentID;
- (id)messageDataForMessage:(id)a3;
- (id)primaryMailboxUid;
- (id)pushedMailboxUids;
- (id)replayAction:(id)a3;
- (id)signingIdentityPersistentReferenceForAddress:(id)a3;
- (id)statisticsKind;
- (id)syncAnchorForFolderID:(id)a3 mailbox:(id *)a4;
- (id)syncAnchorForMailbox:(id)a3;
- (id)unactionableInvitationICSRepresentationInMessage:(id)a3 summary:(id *)a4;
- (id)uniqueID;
- (id)uniqueIdForPersistentConnection;
- (id)uniqueServerIdForMessage:(id)a3;
- (id)unsupportedHandoffTypes;
- (id)username;
- (int)emptyFrequencyForMailboxType:(int64_t)a3;
- (int)supportsServerSearch;
- (int64_t)secureCompositionEncryptionPolicyForAddress:(id)a3;
- (int64_t)secureCompositionSigningPolicyForAddress:(id)a3;
- (unsigned)daysToSync;
- (void)_ensureWeHaveLoadedInitialMailboxList;
- (void)_loadChildrenForParent:(id)a3 fromMap:(id)a4 intoArray:(id)a5 replacingInbox:(id)a6 withID:(id)a7;
- (void)_performFolderChange:(id)a3 completion:(id)a4;
- (void)_reachabilityChanged:(id)a3;
- (void)_synchronouslyLoadListingForParent:(id)a3;
- (void)accountHierarchyChanged:(id)a3;
- (void)cancelSearchQuery:(id)a3;
- (void)changePushedMailboxUidsAdded:(id)a3 deleted:(id)a4;
- (void)dealloc;
- (void)fetchMailboxListExplicit;
- (void)foldersContentsChanged:(id)a3;
- (void)invalidate;
- (void)performSearchQuery:(id)a3;
- (void)pushedFoldersPrefsChanged:(id)a3;
- (void)resetSpecialMailboxes;
- (void)setDAAccount:(id)a3;
- (void)setEncryptionIdentityPersistentReference:(id)a3 forAddress:(id)a4;
- (void)setSigningIdentityPersistentReference:(id)a3 forAddress:(id)a4;
- (void)setSyncAnchor:(id)a3 forFolderID:(id)a4 mailbox:(id *)a5;
- (void)setVirtualAllSearchMailbox:(id)a3;
- (void)startListeningForNotifications;
- (void)stopListeningForNotifications;
@end

@implementation DAMailAccount

+ (Class)_accountConduitClass
{
  return (Class)objc_opt_class();
}

+ (id)accountTypeString
{
  return @"ExchangeActiveSync";
}

+ (id)legacyPathForAccountIdentifier:(id)a3 withHostname:(id)a4 username:(id)a5
{
  id v6 = a3;
  v7 = [a1 defaultAccountDirectory];
  v8 = NSString;
  v9 = [a1 accountTypeString];
  v10 = [v8 stringWithFormat:@"%@%@", v9, v6];

  v11 = [v7 stringByAppendingPathComponent:v10];
  v12 = objc_msgSend(v11, "mf_betterStringByResolvingSymlinksInPath");

  return v12;
}

- (id)URLStringFromLegacyURLString:(id)a3
{
  v4 = [MEMORY[0x1E4F29088] componentsWithString:a3];
  v5 = [(DAMailAccount *)self uniqueID];
  [v4 setHost:v5];

  [v4 setUser:0];
  [v4 setPort:0];
  id v6 = [v4 URL];
  v7 = [v6 absoluteString];

  return v7;
}

+ (id)csAccountTypeString
{
  return (id)*MEMORY[0x1E4F22750];
}

+ (id)displayedAccountTypeString
{
  return @"Exchange ActiveSync";
}

+ (id)displayedShortAccountTypeString
{
  return @"Exchange";
}

+ (id)_URLScheme
{
  return (id)*MEMORY[0x1E4F5FC28];
}

+ (id)accountIDForDirectoryName:(id)a3 isAccountDirectory:(BOOL *)a4
{
  id v6 = a3;
  v7 = [a1 accountTypeString];
  if ([v6 hasPrefix:v7])
  {
    unint64_t v8 = [v6 length];
    v9 = [a1 accountTypeString];
    unint64_t v10 = [v9 length];

    if (v8 > v10)
    {
      *a4 = 1;
      v11 = [a1 accountTypeString];
      v12 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v11, "length"));

      goto LABEL_6;
    }
  }
  else
  {
  }
  v12 = 0;
  *a4 = 0;
LABEL_6:

  return v12;
}

- (DAMailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DAMailAccount;
  unint64_t v8 = [(MailAccount *)&v17 initWithLibrary:v6 persistentAccount:v7];
  if (v8)
  {
    v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    watchedFolderIdsLock = v8->_watchedFolderIdsLock;
    v8->_watchedFolderIdsLock = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestQueuesByFolderID = v8->_requestQueuesByFolderID;
    v8->_requestQueuesByFolderID = v11;

    v8->_supportsUniqueServerIdLock._os_unfair_lock_opaque = 0;
    v13 = MFUserAgent();
    int v14 = [v13 isMobileMail];

    if (v14)
    {
      v15 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
      [v15 addNetworkReachableObserver:v8 selector:sel__reachabilityChanged_];
      v8->_isNetworkReachable = [v15 isNetworkReachable];
    }
  }

  return v8;
}

- (DAMailAccount)initWithDAAccount:(id)a3
{
  id v4 = a3;
  v5 = NSString;
  id v6 = [v4 accountID];
  id v7 = [v5 stringWithFormat:@"%@", v6];

  unint64_t v8 = MFMailDirectory();
  v9 = [v8 stringByAppendingPathComponent:v7];

  v13.receiver = self;
  v13.super_class = (Class)DAMailAccount;
  unint64_t v10 = [(MailAccount *)&v13 initWithPath:v9];
  v11 = v10;
  if (v10) {
    [(DAMailAccount *)v10 setDAAccount:v4];
  }

  return v11;
}

- (id)statisticsKind
{
  if (self->_cachedIsHotmailAccount) {
    v2 = (id *)MEMORY[0x1E4F73CE0];
  }
  else {
    v2 = (id *)MEMORY[0x1E4F73CD0];
  }
  id v3 = *v2;
  return v3;
}

- (void)foldersContentsChanged:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  if ([(DAMailAccount *)self isActive])
  {
    if (!v20
      || ([v20 object],
          id v4 = objc_claimAutoreleasedReturnValue(),
          int v5 = [v4 isEqualToString:self->_cachedAccountID],
          v4,
          v5))
    {
      id v6 = [v20 userInfo];
      id v7 = [v6 objectForKey:@"DAChangedFolders"];

      if (v7)
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"MailAccountContentsDidChangeUids", 0, 0);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v9 = [v20 userInfo];
        unint64_t v10 = [v9 objectForKey:@"DAChangedFolders"];

        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
              v15 = [(DAMailAccount *)self mailboxForFolderID:v14];
              if (v15)
              {
                [v8 addObject:v15];
              }
              else
              {
                v16 = MFLogGeneral();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v26 = self;
                  __int16 v27 = 2114;
                  uint64_t v28 = v14;
                  _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "#Warning warning, %@ got ping for folder ID %{public}@, but can't find mailboxUid with that ID.", buf, 0x16u);
                }
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v11);
        }

        objc_super v17 = (void *)v19;
      }
      else
      {
        objc_super v17 = 0;
      }
      v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v18 postNotificationName:@"MailAccountContentsDidChange" object:self userInfo:v17];
    }
  }
}

- (id)displayName
{
  if ([(NSString *)self->_cachedDisplayName length])
  {
    id v3 = self->_cachedDisplayName;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DAMailAccount;
    id v3 = [(MailAccount *)&v5 displayName];
  }
  return v3;
}

- (id)accountForRenewingCredentials
{
  [(DAMailAccount *)self mf_lock];
  id v3 = self->_daAccount;
  [(DAMailAccount *)self mf_unlock];
  id v4 = [(DAAccount *)v3 backingAccountInfo];

  return v4;
}

- (id)username
{
  [(DAMailAccount *)self mf_lock];
  id v3 = self->_cachedEmailAddress;
  [(DAMailAccount *)self mf_unlock];
  uint64_t v4 = [(NSString *)v3 rangeOfString:@"@"];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v5 = 0;
  }
  else
  {
    objc_super v5 = -[NSString substringWithRange:](v3, "substringWithRange:", 0, v4);
  }

  return v5;
}

- (id)hostname
{
  [(DAMailAccount *)self mf_lock];
  id v3 = self->_cachedEmailAddress;
  [(DAMailAccount *)self mf_unlock];
  uint64_t v5 = [(NSString *)v3 rangeOfString:@"@"];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = &stru_1EFF11268;
  }
  else
  {
    -[NSString substringWithRange:](v3, "substringWithRange:", v5 + v4, [(NSString *)v3 length] - (v5 + v4));
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)deliveryAccount
{
  v2 = [[DADeliveryAccount alloc] initWithDAMailAccount:self];
  return v2;
}

- (BOOL)mustArchiveSentMessages
{
  return 0;
}

- (BOOL)canArchiveSentMessages
{
  return 0;
}

- (id)uniqueID
{
  return self->_cachedAccountID;
}

- (id)uniqueIdForPersistentConnection
{
  return self->_cachedAccountPersistentUUID;
}

- (id)allMailboxUids
{
  if (self->_accountConduit)
  {
    v4.receiver = self;
    v4.super_class = (Class)DAMailAccount;
    v2 = [(MailAccount *)&v4 allMailboxUids];
  }
  else
  {
    v2 = [MEMORY[0x1E4F1C978] array];
  }
  return v2;
}

- (void)resetSpecialMailboxes
{
  if (self->_accountConduit)
  {
    v2.receiver = self;
    v2.super_class = (Class)DAMailAccount;
    [(MailAccount *)&v2 resetSpecialMailboxes];
  }
}

- (MFMailboxUid)virtualAllSearchMailbox
{
  virtualAllSearchMailbox = self->_virtualAllSearchMailbox;
  if (!virtualAllSearchMailbox)
  {
    objc_super v4 = MFLookupLocalizedString(@"SEARCH_ALL_MAILBOXES", @"Search", @"Delayed");
    uint64_t v5 = [[MFDAMailbox alloc] initWithName:v4 attributes:0 account:self folderID:@"kDAMailAccountAllMailboxesFolderID"];
    id v6 = self->_virtualAllSearchMailbox;
    self->_virtualAllSearchMailbox = &v5->super;

    id v7 = self->_virtualAllSearchMailbox;
    id v8 = [(MailAccount *)self rootMailbox];
    [(MFMailboxUid *)v7 setParent:v8];

    virtualAllSearchMailbox = self->_virtualAllSearchMailbox;
  }
  return virtualAllSearchMailbox;
}

- (int)emptyFrequencyForMailboxType:(int64_t)a3
{
  if (a3 == 3) {
    return -1;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)DAMailAccount;
  return -[MailAccount emptyFrequencyForMailboxType:](&v6, sel_emptyFrequencyForMailboxType_);
}

- (BOOL)isRunningInDisallowedBundle
{
  objc_super v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  char v4 = [&unk_1EFF4FFB0 containsObject:v3];

  return v4;
}

- (void)_loadChildrenForParent:(id)a3 fromMap:(id)a4 intoArray:(id)a5 replacingInbox:(id)a6 withID:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v27 = a5;
  id v13 = a6;
  v29 = v12;
  id v30 = a7;
  long long v23 = v11;
  uint64_t v28 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [v12 objectForKey:v11];
  uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v14)
  {
    uint64_t v25 = *(void *)v32;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v31 + 1) + 8 * v15);
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v18 = [v16 folderID];
        [(DAMailAccount *)self _loadChildrenForParent:v18 fromMap:v29 intoArray:v17 replacingInbox:v13 withID:v30];

        uint64_t v19 = [v16 folderName];
        if ([v13 isEqual:v16])
        {
          id v20 = v30;

          uint64_t v19 = v20;
        }
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v21 setValue:v19 forKey:@"MailboxName"];
        [v21 setValue:v17 forKey:@"MailboxChildren"];
        [v21 setValue:v28 forKey:@"MailboxAttributes"];
        long long v22 = [v16 folderID];
        [v21 setValue:v22 forKey:@"DAFolderID"];

        [v27 addObject:v21];
        ++v15;
      }
      while (v14 != v15);
      uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }
}

- (void)accountHierarchyChanged:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(DAMailAccount *)self isRunningInDisallowedBundle]) {
    goto LABEL_103;
  }
  if (![(DAMailAccount *)self isActive]) {
    goto LABEL_103;
  }
  if (v5)
  {
    objc_super v6 = [v5 object];
    char v7 = [v6 isEqualToString:self->_cachedAccountID];

    if ((v7 & 1) == 0) {
      goto LABEL_103;
    }
  }
  uint64_t v8 = [MEMORY[0x1E4F29060] currentThread];
  if ([v8 isMainThread])
  {
    BOOL v9 = [(DAMailAccount *)self _isUnitTesting];

    if (!v9)
    {
      unint64_t v10 = +[MFInvocationQueue sharedInvocationQueue];
      id v11 = +[NSInvocation mf_invocationWithSelector:a2 target:self object:v5];
      [v10 addInvocation:v11];

      goto LABEL_103;
    }
  }
  else
  {
  }
  id v47 = v5;
  id v12 = MFLogGeneral();
  v53 = self;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(MFAccount *)self ef_publicDescription];
    *(_DWORD *)buf = 138543362;
    v75 = v13;
    _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "mailbox listing has changed for account %{public}@", buf, 0xCu);
  }
  v48 = [(DAMailAccount *)self accountConduit];
  v49 = [v48 mailboxes];
  v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v49, "count"));
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v49;
  uint64_t v14 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v69 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        v18 = [v17 folderID];
        [v61 setObject:v17 forKey:v18];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
    }
    while (v14);
  }

  v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(obj, "count"));
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v57 = [v48 inboxFolder];
  v54 = [v48 sentItemsFolder];
  v55 = [v48 deletedItemsFolder];
  v56 = [v48 draftsFolder];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v19 = [v61 allValues];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v64 objects:v72 count:16];
  int v21 = 0;
  int v22 = 0;
  int v23 = 0;
  BOOL v24 = 0;
  if (!v20)
  {
    char v52 = 0;
    int v25 = 0;
    v51 = 0;
    goto LABEL_61;
  }
  char v52 = 0;
  LOBYTE(v25) = 0;
  v51 = 0;
  uint64_t v60 = *(void *)v65;
  id v58 = v19;
  do
  {
    uint64_t v62 = v20;
    for (uint64_t j = 0; j != v62; ++j)
    {
      if (*(void *)v65 != v60) {
        objc_enumerationMutation(v58);
      }
      id v27 = *(void **)(*((void *)&v64 + 1) + 8 * j);
      if (v21)
      {
        int v21 = 1;
        if (v22) {
          goto LABEL_25;
        }
      }
      else
      {
        int v21 = [v57 isEqual:*(void *)(*((void *)&v64 + 1) + 8 * j)];
        if (v22)
        {
LABEL_25:
          int v22 = 1;
          if (v23) {
            goto LABEL_26;
          }
          goto LABEL_30;
        }
      }
      int v22 = [v54 isEqual:v27];
      if (v23)
      {
LABEL_26:
        int v23 = 1;
        if (v25) {
          goto LABEL_33;
        }
        goto LABEL_31;
      }
LABEL_30:
      int v23 = [v55 isEqual:v27];
      if (v25) {
        goto LABEL_33;
      }
LABEL_31:
      if ([v56 isEqual:v27])
      {
        if (![(DAMailAccount *)v53 supportsServerDrafts])
        {
          int v25 = 0;
          continue;
        }
LABEL_33:
        int v25 = 1;
        goto LABEL_35;
      }
      int v25 = 0;
LABEL_35:
      uint64_t v28 = [v27 parentFolderID];
      if (v28)
      {
        v29 = [v27 parentFolderID];
      }
      else
      {
        v29 = @"0";
      }

      id v30 = [v63 objectForKey:v29];
      if (!v30)
      {
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [v63 setValue:v30 forKey:v29];
      }
      [v30 addObject:v27];
      if (!v24)
      {
        if (![@"0" isEqualToString:v29])
        {
          BOOL v24 = 0;
          goto LABEL_56;
        }
        long long v31 = [v27 folderName];
        long long v32 = v31;
        if (v31)
        {
          uint64_t v33 = [v31 caseInsensitiveCompare:@"junk"];
          BOOL v24 = v33 == 0;
          if (v33)
          {
            if (v52)
            {
              BOOL v24 = 0;
              char v52 = 1;
LABEL_55:

              goto LABEL_56;
            }
            if ([v32 caseInsensitiveCompare:@"junk e-mail"]
              && [v32 caseInsensitiveCompare:@"junk email"])
            {
              BOOL v24 = 0;
              char v52 = 0;
              goto LABEL_55;
            }
            char v52 = 1;
          }
          id v34 = v27;

          v51 = v34;
          goto LABEL_55;
        }
        BOOL v24 = 0;
        goto LABEL_55;
      }
      BOOL v24 = 1;
LABEL_56:
    }
    uint64_t v19 = v58;
    uint64_t v20 = [v58 countByEnumeratingWithState:&v64 objects:v72 count:16];
  }
  while (v20);
LABEL_61:

  [(DAMailAccount *)v53 _loadChildrenForParent:@"0" fromMap:v63 intoArray:v50 replacingInbox:v57 withID:@"70FB9178-576E-4CAA-A08E-F68D57BFD01E"];
  [(DAMailAccount *)v53 mf_lock];
  if (v21)
  {
    v35 = [v57 folderID];
  }
  else
  {
    v35 = 0;
  }
  objc_storeStrong((id *)&v53->_cachedInboxFolderID, v35);
  if (v21) {

  }
  if (v22)
  {
    uint64_t v36 = [v54 folderID];
  }
  else
  {
    uint64_t v36 = 0;
  }
  objc_storeStrong((id *)&v53->_cachedSentMessagesFolderID, v36);
  if (v22) {

  }
  if (v23)
  {
    v37 = [v55 folderID];
  }
  else
  {
    v37 = 0;
  }
  objc_storeStrong((id *)&v53->_cachedTrashFolderID, v37);
  if (v23) {

  }
  if ((v24 | v52))
  {
    v38 = [v51 folderID];
  }
  else
  {
    v38 = 0;
  }
  objc_storeStrong((id *)&v53->_cachedJunkFolderID, v38);
  if ((v24 | v52)) {

  }
  if (v25)
  {
    v39 = [v56 folderID];
  }
  else
  {
    v39 = 0;
  }
  objc_storeStrong((id *)&v53->_cachedDraftsFolderID, v39);
  if (v25) {

  }
  v40 = [(MailAccount *)v53 rootMailbox];
  BOOL v41 = [(MailAccount *)v53 _loadMailboxListingIntoCache:0 attributes:0 children:v50 parent:v40];

  int receivedInitialMailboxUpdate = v53->_receivedInitialMailboxUpdate;
  BOOL v43 = v47 == 0;
  if (v53->_receivedInitialMailboxUpdate) {
    BOOL v43 = 1;
  }
  if (!v43)
  {
    int receivedInitialMailboxUpdate = 1;
    v53->_int receivedInitialMailboxUpdate = 1;
  }
  if (v53->_doneInitialInboxCheck || receivedInitialMailboxUpdate == 0) {
    int v21 = 0;
  }
  if (v21 == 1) {
    v53->_doneInitialInboxCheck = 1;
  }
  [(DAMailAccount *)v53 mf_unlock];
  [(DAMailAccount *)v53 resetSpecialMailboxes];
  if (v41)
  {
    $A328ED5E44AECF0F4A7A4FD34A0E6BE2 flags = v53->super._flags;
    if ((*(_DWORD *)&flags & 0x20000) == 0)
    {
      v53->super._$A328ED5E44AECF0F4A7A4FD34A0E6BE2 flags = ($A328ED5E44AECF0F4A7A4FD34A0E6BE2)(*(_DWORD *)&flags & 0xFFFF0000 | (unsigned __int16)(*(_WORD *)&flags + 1));
      [(MailAccount *)v53 _writeMailboxCacheWithPrejudice:1];
    }
  }
  [(DAMailAccount *)v53 startListeningForNotifications];
  if (v21) {
    [(DAMailAccount *)v53 foldersContentsChanged:0];
  }
  id v46 = [(MailAccount *)v53 mailboxUidOfType:5 createIfNeeded:0];

  id v5 = v47;
LABEL_103:
}

- (id)accountConduit
{
  [(DAMailAccount *)self mf_lock];
  if (!self->_accountConduit)
  {
    if ([(DAMailAccount *)self isRunningInDisallowedBundle])
    {
      unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      id v11 = [MEMORY[0x1E4F28B50] mainBundle];
      id v12 = [v11 bundleIdentifier];
      [v10 handleFailureInMethod:a2, self, @"DAMailAccount.m", 599, @"should never make account conduits in %@.", v12 object file lineNumber description];
    }
    char v4 = (ASAccountActorMessages *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_accountConduitClass")), "initWithDAAccount:", self->_daAccount);
    accountConduit = self->_accountConduit;
    self->_accountConduit = v4;

    objc_super v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel_foldersContentsChanged_ name:*MEMORY[0x1E4F5E7C0] object:0];

    char v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:self selector:sel_accountHierarchyChanged_ name:*MEMORY[0x1E4F5E7C8] object:0];
  }
  [(DAMailAccount *)self mf_unlock];
  uint64_t v8 = self->_accountConduit;
  return v8;
}

- (void)pushedFoldersPrefsChanged:(id)a3
{
  id v9 = a3;
  id v5 = [MEMORY[0x1E4F29060] currentThread];
  int v6 = [v5 isMainThread];

  if (v6)
  {
    char v7 = +[MFInvocationQueue sharedInvocationQueue];
    uint64_t v8 = +[NSInvocation mf_invocationWithSelector:a2 target:self object:v9];
    [v7 addInvocation:v8];
  }
  else
  {
    [(DAMailAccount *)self stopListeningForNotifications];
    [(DAMailAccount *)self startListeningForNotifications];
  }
}

- (BOOL)finishedInitialMailboxListLoad
{
  return self->_receivedInitialMailboxUpdate;
}

- (void)fetchMailboxListExplicit
{
  if (+[MFMailMessageLibrary canUsePersistence])
  {
    if (!self->_loadedInitialMailboxList)
    {
      self->_loadedInitialMailboxList = 1;
      [(DAMailAccount *)self accountHierarchyChanged:0];
    }
    uint64_t v3 = [(DAMailAccount *)self uniqueID];
    if (v3)
    {
      id v5 = v3;
      char v4 = [MEMORY[0x1E4F5E950] sharedConnection];
      [v4 updateFolderListForAccountID:v5 andDataclasses:1];

      uint64_t v3 = v5;
    }
  }
}

- (BOOL)canReceiveNewMailNotifications
{
  return 1;
}

- (Class)storeClass
{
  return (Class)objc_opt_class();
}

- (id)_copyMailboxWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 dictionary:(id)a6
{
  id v9 = a4;
  unint64_t v10 = [a6 objectForKey:@"DAFolderID"];
  id v11 = (void *)[objc_allocWithZone((Class)MFDAMailbox) initWithName:v9 attributes:a5 account:self folderID:v10];

  return v11;
}

- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 existingMailboxUid:(id)a6 dictionary:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  [(DAMailAccount *)self _ensureWeHaveLoadedInitialMailboxList];
  v21.receiver = self;
  v21.super_class = (Class)DAMailAccount;
  id v16 = [(MailAccount *)&v21 _copyMailboxUidWithParent:v12 name:v13 attributes:a5 existingMailboxUid:v14 dictionary:v15];
  id v17 = [v15 objectForKey:@"DAFolderID"];
  v18 = [v16 folderID];
  uint64_t v19 = v18;
  if (v14 && v18)
  {
    if (([v18 isEqualToString:v17] & 1) == 0)
    {

      id v16 = 0;
    }
  }
  else if (!v18 && v17)
  {
    [v16 setFolderID:v17];
  }

  return v16;
}

- (id)folderIDForMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [(MailAccount *)self rootMailbox];

  if (v5 == v4)
  {
    int v6 = @"0";
  }
  else if (objc_opt_respondsToSelector())
  {
    int v6 = [v4 folderID];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)_synchronouslyLoadListingForParent:(id)a3
{
}

- (id)_newMailboxWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 dictionary:(id)a6 withCreationOption:(int64_t)a7
{
  uint64_t v9 = *(void *)&a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if (a7 == 1)
  {
    v33.receiver = self;
    v33.super_class = (Class)DAMailAccount;
    id v16 = [(MailAccount *)&v33 _newMailboxWithParent:v13 name:v14 attributes:v9 dictionary:v15 withCreationOption:1];
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    id v30 = __Block_byref_object_copy__1;
    long long v31 = __Block_byref_object_dispose__1;
    id v32 = 0;
    id v17 = [(DAMailAccount *)self folderIDForMailbox:v13];
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F5E978]) initFolderChangeWithChangeType:0 folderId:0 parentFolderId:v17 displayName:v14 dataclass:1 consumer:0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__DAMailAccount__newMailboxWithParent_name_attributes_dictionary_withCreationOption___block_invoke;
    v20[3] = &unk_1E5D3B4D8;
    SEL v24 = a2;
    v20[4] = self;
    id v21 = v15;
    int v23 = &v27;
    int v26 = v9;
    id v22 = v13;
    int64_t v25 = a7;
    [(DAMailAccount *)self _performFolderChange:v18 completion:v20];
    id v16 = (id)v28[5];

    _Block_object_dispose(&v27, 8);
  }

  return v16;
}

void __85__DAMailAccount__newMailboxWithParent_name_attributes_dictionary_withCreationOption___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 wasSuccessful])
  {
    id v4 = [v3 folderID];

    if (!v4)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"DAMailAccount.m" lineNumber:701 description:@"folderID must be non-nil"];
    }
    id v5 = *(void **)(a1 + 40);
    if (v5) {
      id v6 = (id)[v5 mutableCopy];
    }
    else {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    char v7 = v6;
    uint64_t v8 = [v3 folderID];
    [v7 setObject:v8 forKey:@"DAFolderID"];

    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = [v3 folderName];
    uint64_t v12 = *(unsigned int *)(a1 + 80);
    uint64_t v13 = *(void *)(a1 + 72);
    v18.receiver = v9;
    v18.super_class = (Class)DAMailAccount;
    id v14 = objc_msgSendSuper2(&v18, sel__newMailboxWithParent_name_attributes_dictionary_withCreationOption_, v10, v11, v12, v7, v13);
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v11 = [(DAMailAccount *)self folderIDForMailbox:v10];
  id v12 = v9;
  uint64_t v13 = v12;
  if (!v12)
  {
    uint64_t v13 = [v8 displayName];
  }
  id v14 = objc_alloc(MEMORY[0x1E4F5E978]);
  uint64_t v15 = [(DAMailAccount *)self folderIDForMailbox:v8];
  id v16 = (void *)[v14 initFolderChangeWithChangeType:1 folderId:v15 parentFolderId:v11 displayName:v13 dataclass:1 consumer:0];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __46__DAMailAccount_renameMailbox_newName_parent___block_invoke;
  v21[3] = &unk_1E5D3B500;
  int64_t v25 = &v26;
  id v17 = v8;
  id v22 = v17;
  id v18 = v10;
  id v23 = v18;
  SEL v24 = self;
  [(DAMailAccount *)self _performFolderChange:v16 completion:v21];
  char v19 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return v19;
}

void __46__DAMailAccount_renameMailbox_newName_parent___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 wasSuccessful])
  {
    id v4 = (void *)a1[6];
    uint64_t v5 = a1[4];
    id v6 = [v3 folderName];
    uint64_t v7 = a1[5];
    v8.receiver = v4;
    v8.super_class = (Class)DAMailAccount;
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = objc_msgSendSuper2(&v8, sel__renameMailbox_newName_parent_, v5, v6, v7);
  }
}

- (BOOL)_deleteMailbox:(id)a3 reflectToServer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    id v7 = objc_alloc(MEMORY[0x1E4F5E978]);
    objc_super v8 = [(DAMailAccount *)self folderIDForMailbox:v6];
    id v9 = (void *)[v7 initFolderChangeWithChangeType:2 folderId:v8 parentFolderId:0 displayName:0 dataclass:1 consumer:0];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__DAMailAccount__deleteMailbox_reflectToServer___block_invoke;
    v12[3] = &unk_1E5D3B528;
    v12[4] = &v13;
    [(DAMailAccount *)self _performFolderChange:v9 completion:v12];
    BOOL v10 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

void __48__DAMailAccount__deleteMailbox_reflectToServer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 wasSuccessful];
}

- (void)_performFolderChange:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = objc_alloc_init(MFDAFolderChangeConsumer);
  [v10 setConsumer:v7];
  objc_super v8 = [(DAMailAccount *)self accountConduit];
  [v8 performFolderChange:v10 isUserRequested:1];

  id v9 = [(MFDAFolderChangeConsumer *)v7 waitForResult];
  v6[2](v6, v9);
}

- (BOOL)newMailboxNameIsAcceptable:(id)a3 reasonForFailure:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DAMailAccount;
  if ([(MailAccount *)&v14 newMailboxNameIsAcceptable:v6 reasonForFailure:a4])
  {
    if (self->_cachedIsHotmailAccount)
    {
      id v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"&<>:;/()+'\"\\""];
      uint64_t v8 = [v6 rangeOfCharacterFromSet:v7];
      BOOL v9 = v8 == 0x7FFFFFFFFFFFFFFFLL;
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v10 = objc_msgSend(v6, "substringWithRange:", v8, 1);
        if (a4)
        {
          id v11 = NSString;
          id v12 = MFLookupLocalizedString(@"MAILBOX_NAME_INCLUDES_SPECIAL_CHARACTERS", @"This account does not allow mailbox names containing “%@”.", @"Delayed");
          objc_msgSend(v11, "stringWithFormat:", v12, v10);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_URLScheme
{
  objc_super v2 = objc_opt_class();
  return (id)[v2 _URLScheme];
}

- (id)mailboxPathExtension
{
  return @"mbox";
}

- (void)setDAAccount:(id)a3
{
  id v31 = a3;
  [(DAMailAccount *)self mf_lock];
  accountConduit = self->_accountConduit;
  if (accountConduit) {
    [(ASAccountActorMessages *)accountConduit setAccount:v31];
  }
  else {
    objc_storeStrong((id *)&self->_daAccount, a3);
  }
  id v6 = [v31 accountPropertyForKey:@"mcProfileUUID"];
  self->_cachedIsManaged = [v6 length] != 0;

  id v7 = [v31 backingAccountInfo];
  self->_cachedIsManaged = +[MFAccount accountIsManaged:v7];

  uint64_t v8 = [v31 backingAccountInfo];
  self->_cachedSourceIsManaged = +[MFAccount accountSourceIsManaged:v8];

  BOOL v9 = [v31 backingAccountInfo];
  self->_cachedRestrictSendingFromExternalProcesses = +[MFAccount accountIsPreventedFromSendingFromExternalProcesses:v9];

  id v10 = [v31 backingAccountInfo];
  self->_cachedRestrictMessageTransfersToOtherAccounts = +[MFAccount accountIsRestrictedFromTransfersToOtherAccounts:v10];

  id v11 = [v31 backingAccountInfo];
  self->_cachedRestrictSyncingRecents = +[MFAccount accountRestrictsRecentsSyncing:v11];

  id v12 = [v31 accountPropertyForKey:@"SMIMESigningEnabled"];
  self->_cachedSecureMIMEShouldSign = [v12 BOOLValue];

  uint64_t v13 = [v31 accountPropertyForKey:@"SMIMEEncryptionEnabled"];
  self->_cachedSecureMIMEShouldEncrypt = [v13 BOOLValue];

  objc_super v14 = [v31 encryptionIdentityPersistentReference];

  if (v14)
  {
    if (self->_cachedIsManaged) {
      char v15 = [v31 accountBoolPropertyForKey:@"PerMessageSMIMEEnabled"];
    }
    else {
      char v15 = 1;
    }
  }
  else
  {
    char v15 = 0;
  }
  self->_cachedPerMessageEncryptionEnabled = v15;
  char v16 = [v31 accountPropertyForKey:@"MFAccountSupportsMailDrop"];
  self->_cachedSupportsMailDrop = [v16 BOOLValue];

  id v17 = [v31 accountPropertyForKey:@"ArchiveMessages"];
  self->_cachedArchiveByDefault = [v17 BOOLValue];

  self->_cachedIsHotmailAccount = [v31 isHotmailAccount];
  self->_supportsServerDrafts = 0;
  id v18 = [v31 accountPropertyForKey:@"ASStoreDraftsOnServer"];
  char v19 = v18;
  if (v18) {
    char v20 = [v18 BOOLValue];
  }
  else {
    char v20 = 1;
  }
  self->_cachedStoreDraftsOnServer = v20;
  id v21 = [v31 accountID];
  cachedAccountID = self->_cachedAccountID;
  self->_cachedAccountID = v21;

  id v23 = [v31 persistentUUID];
  cachedAccountPersistentUUID = self->_cachedAccountPersistentUUID;
  self->_cachedAccountPersistentUUID = v23;

  self->_cachedIsActive = [v31 enabledForDADataclass:1];
  int64_t v25 = [v31 accountDescription];
  cachedDisplayName = self->_cachedDisplayName;
  self->_cachedDisplayName = v25;

  uint64_t v27 = [v31 emailAddress];
  cachedEmailAddress = self->_cachedEmailAddress;
  self->_cachedEmailAddress = v27;

  char v29 = [v31 emailAddresses];
  cachedEmailAddresses = self->_cachedEmailAddresses;
  self->_cachedEmailAddresses = v29;

  if (self->_cachedCalendarEnabled != [v31 enabledForDADataclass:4]) {
    self->_cachedCalendarEnabled = [v31 enabledForDADataclass:4];
  }
  self->_supportsServerSearch = [v31 supportsMailboxSearch];
  self->_supportsMessageFlagging = [v31 supportsEmailFlagging];
  self->_daysToSync = [v31 mailNumberOfPastDaysToSync];
  [(DAMailAccount *)self mf_unlock];
}

- (id)syncAnchorForMailbox:(id)a3
{
  return 0;
}

- (BOOL)supportsRemoteAppend
{
  return 1;
}

- (BOOL)supportsMailboxEditing
{
  return 1;
}

- (id)_infoForMatchingURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:self forKey:@"Account"];
  id v6 = [v4 pathComponents];
  unint64_t v7 = [v6 count];

  if (v7 >= 3)
  {
    uint64_t v8 = [v4 pathComponents];
    BOOL v9 = (void *)[v8 mutableCopy];

    objc_msgSend(v9, "removeObjectsInRange:", 0, 2);
    id v10 = [NSString pathWithComponents:v9];
    if ([v10 length]) {
      [v5 setObject:v10 forKey:@"FolderID"];
    }
  }
  return v5;
}

- (id)mailboxForFolderID:(id)a3
{
  id v4 = a3;
  [(DAMailAccount *)self mf_lock];
  uint64_t v5 = [(MailAccount *)self rootMailbox];
  [(DAMailAccount *)self mf_unlock];
  if (v5)
  {
    id v6 = _MFDescendantWithPredicate(v5, (uint64_t (*)(void *, uint64_t))mailboxHasFolderID, (uint64_t)v4);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)mailboxUidForInfo:(id)a3
{
  id v4 = [a3 objectForKey:@"FolderID"];
  uint64_t v5 = [(DAMailAccount *)self mailboxForFolderID:v4];

  return v5;
}

- (BOOL)addRequest:(id)a3 consumer:(id)a4 mailbox:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F60DF0] pairWithFirst:v8 second:v9];
  v14[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  LOBYTE(self) = [(DAMailAccount *)self addRequests:v12 mailbox:v10];

  return (char)self;
}

- (BOOL)addRequests:(id)a3 mailbox:(id)a4
{
  return [(DAMailAccount *)self addRequests:a3 mailbox:a4 combine:0];
}

- (BOOL)addRequests:(id)a3 mailbox:(id)a4 combine:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = DALoggingwithCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_INFO, "Enqueing request pairs %@ for mailbox %@", (uint8_t *)&v15, 0x16u);
  }

  id v11 = [v9 folderID];
  [(DAMailAccount *)self mf_lock];
  id v12 = [(NSMutableDictionary *)self->_requestQueuesByFolderID objectForKey:v11];
  if (!v12)
  {
    id v12 = [[MFDARequestQueue alloc] initWithAccount:self folderID:v11];
    -[NSMutableDictionary setObject:forKey:](self->_requestQueuesByFolderID, "setObject:forKey:");
  }
  [(DAMailAccount *)self mf_unlock];
  BOOL v13 = [(MFRequestQueue *)v12 addRequests:v8 combine:v5];

  return v13;
}

- (BOOL)performRequests:(id)a3 mailbox:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v6 = a4;
  id v56 = 0;
  BOOL v43 = [(DAMailAccount *)self syncAnchorForFolderID:v6 mailbox:&v56];
  id v7 = v56;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __41__DAMailAccount_performRequests_mailbox___block_invoke;
  v49[3] = &unk_1E5D3B550;
  id v44 = v8;
  id v50 = v44;
  v51 = &v52;
  [v42 enumerateObjectsUsingBlock:v49];
  id v9 = DALoggingwithCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v44 count];
    uint64_t v11 = [(MFAccount *)self ef_publicDescription];
    id v12 = (void *)v11;
    if (*((unsigned char *)v53 + 24)) {
      BOOL v13 = "YES";
    }
    else {
      BOOL v13 = "NO";
    }
    *(_DWORD *)buf = 134219010;
    uint64_t v58 = v10;
    __int16 v59 = 2114;
    uint64_t v60 = v11;
    __int16 v61 = 2114;
    id v62 = v6;
    __int16 v63 = 2112;
    long long v64 = v43;
    __int16 v65 = 2080;
    long long v66 = v13;
    _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_INFO, "Performing %lu mailbox requests with %{public}@, folder-id %{public}@, anchor %@, user requested %s", buf, 0x34u);
  }
  objc_super v14 = MFUserAgent();
  [v14 networkActivityStarted:self];

  if (!v43)
  {
    int v15 = DALoggingwithCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(MFAccount *)self ef_publicDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v58 = (uint64_t)v16;
      __int16 v59 = 2114;
      uint64_t v60 = (uint64_t)v6;
      _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "Mail db had no sync anchor for %{public}@, folderID %{public}@.  Will erase local messages, perform full sync.", buf, 0x16u);
    }
  }
  __int16 v17 = [MFDAMailAccountSyncConsumer alloc];
  id v18 = [(DAMailAccount *)self uniqueID];
  uint64_t v19 = [(MFDAMailAccountSyncConsumer *)v17 initWithCurrentTag:v43 accountID:v18 requests:v42];

  do
  {
    [(MFDAMailAccountSyncConsumer *)v19 tag];

    char v20 = (void *)MEMORY[0x1AD0E3E00]();
    id v21 = [(DAMailAccount *)self accountConduit];
    id v22 = [(MFDAMailAccountSyncConsumer *)v19 tag];
    int v23 = [v21 performMailboxRequests:v44 mailbox:v6 previousTag:v22 clientWinsOnSyncConflict:1 isUserRequested:*((unsigned __int8 *)v53 + 24) consumer:v19];

    SEL v24 = +[MFActivityMonitor currentMonitor];
    int64_t v25 = (void *)MEMORY[0x1E4F60D40];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __41__DAMailAccount_performRequests_mailbox___block_invoke_160;
    v46[3] = &unk_1E5D3B578;
    id v26 = v21;
    id v47 = v26;
    int v48 = v23;
    uint64_t v27 = [v25 tokenWithCancelationBlock:v46];
    [v24 addCancelable:v27];
    [(MFDAMailAccountConsumer *)v19 waitUntilDone];
    [v24 removeCancelable:v27];

    uint64_t v28 = [(MFDAMailAccountSyncConsumer *)v19 tag];
    LODWORD(v24) = v28 == 0;

    if (v24)
    {
      char v29 = DALoggingwithCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [(MFAccount *)self ef_publicDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v58 = (uint64_t)v30;
        __int16 v59 = 2114;
        uint64_t v60 = (uint64_t)v6;
        _os_log_impl(&dword_1A7EFF000, v29, OS_LOG_TYPE_DEFAULT, "server returned null sync key for sync of %{public}@, folderID %{public}@.  Will erase local messages, perform full sync.", buf, 0x16u);
      }
    }
    id v31 = DALoggingwithCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      id v32 = [(MFDAMailAccountSyncConsumer *)v19 tag];
      *(_DWORD *)buf = 138412546;
      uint64_t v58 = (uint64_t)v32;
      __int16 v59 = 2114;
      uint64_t v60 = (uint64_t)v6;
      _os_log_impl(&dword_1A7EFF000, v31, OS_LOG_TYPE_INFO, "setting sync key %@ for mailbox %{public}@", buf, 0x16u);
    }
    objc_super v33 = [(MFDAMailAccountSyncConsumer *)v19 tag];
    id v45 = v7;
    [(DAMailAccount *)self setSyncAnchor:v33 forFolderID:v6 mailbox:&v45];
    id v34 = v45;

    id v7 = v34;
    [(MFDAMailAccountSyncConsumer *)v19 tag];

    v35 = +[MFActivityMonitor currentMonitor];
    LODWORD(v34) = [v35 shouldCancel];

    if (v34)
    {
      uint64_t v36 = DALoggingwithCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = [(MFAccount *)self ef_publicDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v58 = (uint64_t)v37;
        __int16 v59 = 2114;
        uint64_t v60 = (uint64_t)v6;
        _os_log_impl(&dword_1A7EFF000, v36, OS_LOG_TYPE_INFO, "canceled mailbox request for %{public}@, folderID %{public}@", buf, 0x16u);
      }
      BOOL v38 = 0;
    }
    else
    {
      BOOL v38 = [(MFDAMailAccountSyncConsumer *)v19 moreAvailable];
    }
    [(MFDAMailAccountSyncConsumer *)v19 reset];
  }
  while (v38);
  BOOL v39 = [(MFDAMailAccountConsumer *)v19 shouldRetryRequest];
  v40 = MFUserAgent();
  [v40 networkActivityEnded:self];

  _Block_object_dispose(&v52, 8);
  return !v39;
}

void __41__DAMailAccount_performRequests_mailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 first];
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) && [v3 isUserRequested]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __41__DAMailAccount_performRequests_mailbox___block_invoke_160(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelTaskWithID:*(unsigned int *)(a1 + 40)];
}

- (id)_relativePathForType:(int64_t)a3
{
  if (a3 == 2) {
    return @"Archive";
  }
  if (a3 == 1) {
    return @"Junk";
  }
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"DAMailAccount.m", 1024, @"requested relative path for unsupported mailbox type %ld", a3);

  return 0;
}

- (id)_relativePathSpecialMailboxUidWithType:(int64_t)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(DAMailAccount *)self _relativePathForType:a3];
  id v7 = [(MailAccount *)self mailboxUidForRelativePath:v6 create:v4];

  return v7;
}

- (id)_specialMailboxUidWithType:(int64_t)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[DAMailAccount isMailboxLocalForType:](self, "isMailboxLocalForType:"))
  {
    id v7 = [(MailAccount *)self _localMailboxNameForType:a3 usingDisplayName:0];
    id v8 = +[LocalAccount localAccount];
    id v9 = [v8 mailboxUidForRelativePath:v7 create:v4];

    [(MFMailboxUid *)v9 setRepresentedAccount:self];
    goto LABEL_23;
  }
  if (a3 == 2)
  {
    id v9 = [(DAMailAccount *)self _relativePathSpecialMailboxUidWithType:2 create:v4];
    id v7 = 0;
    goto LABEL_23;
  }
  [(DAMailAccount *)self mf_lock];
  int64_t v10 = a3 - 1;
  if (unint64_t)(a3 - 1) < 7 && ((0x5Du >> v10))
  {
    id v11 = *(id *)((char *)&self->super.super.super.isa + *off_1E5D3B680[v10]);
    if (v11)
    {
      id v9 = [(DAMailAccount *)self mailboxForFolderID:v11];
      if (v9) {
        goto LABEL_22;
      }
    }
  }
  else
  {
    id v11 = 0;
  }
  if (![(DAMailAccount *)self isActive]) {
    goto LABEL_21;
  }
  if (a3 != 1)
  {
    if (a3 == 7)
    {
      p_temporaryInbox = &self->_temporaryInbox;
      temporaryInbox = self->_temporaryInbox;
      if (!temporaryInbox)
      {
        [(DAMailAccount *)self mf_unlock];
        objc_super v14 = [(MailAccount *)self mailboxUidForRelativePath:@"70FB9178-576E-4CAA-A08E-F68D57BFD01E" create:1 withOption:1];
        [(DAMailAccount *)self mf_lock];
        if (!*p_temporaryInbox) {
          objc_storeStrong((id *)&self->_temporaryInbox, v14);
        }

        temporaryInbox = *p_temporaryInbox;
      }
      id v9 = temporaryInbox;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (!v4)
  {
LABEL_21:
    id v9 = 0;
    goto LABEL_22;
  }
  int v15 = [(DAMailAccount *)self _relativePathSpecialMailboxUidWithType:1 create:1];
  id v16 = [(MFDAMailbox *)v15 folderID];
  cachedJunkFolderID = self->_cachedJunkFolderID;
  self->_cachedJunkFolderID = v16;

  id v9 = v15;
LABEL_22:
  [(DAMailAccount *)self mf_unlock];

  id v7 = 0;
LABEL_23:

  return v9;
}

- (BOOL)isMailboxLocalForType:(int64_t)a3
{
  if (a3 != 5) {
    return 0;
  }
  if ([(DAMailAccount *)self supportsServerDrafts]) {
    return !self->_cachedStoreDraftsOnServer;
  }
  return 1;
}

- (void)_ensureWeHaveLoadedInitialMailboxList
{
  if (!self->_loadedInitialMailboxList)
  {
    self->_loadedInitialMailboxList = 1;
    [(DAMailAccount *)self accountHierarchyChanged:0];
  }
}

- (id)primaryMailboxUid
{
  [(DAMailAccount *)self _ensureWeHaveLoadedInitialMailboxList];
  v5.receiver = self;
  v5.super_class = (Class)DAMailAccount;
  id v3 = [(MailAccount *)&v5 primaryMailboxUid];
  return v3;
}

- (BOOL)supportsMessageFlagging
{
  return self->_supportsMessageFlagging == 1;
}

- (BOOL)supportsThreadOperations
{
  return self->_supportsConversations == 1;
}

- (BOOL)supportsUniqueServerId
{
  p_supportsUniqueServerIdLock = &self->_supportsUniqueServerIdLock;
  os_unfair_lock_lock(&self->_supportsUniqueServerIdLock);
  int supportsUniqueServerId = self->_supportsUniqueServerId;
  if (!supportsUniqueServerId)
  {
    objc_super v5 = [(DAMailAccount *)self accountConduit];
    int supportsUniqueServerId = [v5 supportsUniqueServerId];

    if (supportsUniqueServerId) {
      self->_int supportsUniqueServerId = supportsUniqueServerId;
    }
  }
  os_unfair_lock_unlock(p_supportsUniqueServerIdLock);
  return supportsUniqueServerId != 2;
}

- (BOOL)supportsServerDrafts
{
  if (![(DAMailAccount *)self isRunningInDisallowedBundle]
    && !self->_supportsServerDrafts)
  {
    id v3 = [(DAMailAccount *)self accountConduit];
    self->_supportsServerDrafts = [v3 supportsDraftFolderSync];
  }
  return self->_supportsServerDrafts == 1;
}

- (BOOL)shouldArchiveByDefault
{
  return self->_cachedArchiveByDefault;
}

- (BOOL)sourceIsManaged
{
  return ([MEMORY[0x1E4F602E0] preferenceEnabled:6] & 1) != 0 || self->_cachedSourceIsManaged;
}

- (BOOL)_isUnitTesting
{
  return 0;
}

- (BOOL)shouldFetchAgainWithError:(id)a3 foregroundRequest:(BOOL)a4
{
  return 0;
}

- (id)uniqueServerIdForMessage:(id)a3
{
  id v4 = a3;
  if ([(DAMailAccount *)self supportsUniqueServerId])
  {
    objc_super v5 = [v4 remoteID];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (BOOL)isActive
{
  return self->_cachedIsActive;
}

- (id)accountPropertyForKey:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(DAMailAccount *)self mf_lock];
  objc_super v5 = self->_cachedEmailAddress;
  id v6 = self->_cachedEmailAddresses;
  id v7 = self->_cachedAccountID;
  [(DAMailAccount *)self mf_unlock];
  if ([v4 isEqual:@"EmailAddresses"])
  {
    if (v5)
    {
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:MEMORY[0x1E4F1CC38] forKey:v5];
LABEL_20:
      objc_super v14 = v8;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (![v4 isEqual:@"ReceiveEmailAliasAddresses"])
  {
    int v15 = [v4 isEqual:*MEMORY[0x1E4F17648]];
    if (v7) {
      int v16 = v15;
    }
    else {
      int v16 = 0;
    }
    if (v16 == 1)
    {
      id v8 = v7;
      goto LABEL_20;
    }
LABEL_19:
    v18.receiver = self;
    v18.super_class = (Class)DAMailAccount;
    id v8 = [(MFAccount *)&v18 accountPropertyForKey:v4];
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v14 = (void *)[(NSArray *)v6 mutableCopy];
    if (!v5) {
      goto LABEL_21;
    }
    goto LABEL_25;
  }
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int64_t v10 = v6;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    uint64_t v13 = MEMORY[0x1E4F1CC38];
    while (1)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v10);
      }
      [v9 addObject:v13];
      if (!--v11)
      {
        uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  objc_super v14 = [MEMORY[0x1E4F1CA60] dictionaryWithObjects:v9 forKeys:v10];

  if (v5) {
LABEL_25:
  }
    [v14 removeObjectForKey:v5];
LABEL_21:

  return v14;
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = DALoggingwithCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_INFO, "DAMAilAccount %p is invalidating", buf, 0xCu);
  }

  [(ASAccountActorMessages *)self->_accountConduit shutdown];
  v4.receiver = self;
  v4.super_class = (Class)DAMailAccount;
  [(MailAccount *)&v4 invalidate];
}

- (id)iconString
{
  cachedIconString = self->_cachedIconString;
  if (!cachedIconString)
  {
    if (self->_cachedIsHotmailAccount)
    {
      objc_super v4 = @"outlookAccountIcon";
    }
    else if ([MEMORY[0x1E4F5E940] isAppleInternalInstall])
    {
      objc_super v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      char v6 = [v5 BOOLForKey:@"HatesAppleDesign"];

      objc_super v4 = @"exchangeAccountIcon";
      if ((v6 & 1) == 0)
      {
        uint64_t v7 = [(MFAccount *)self baseAccount];
        int v8 = [v7 isAppleEmployeeAccount];

        if (v8) {
          objc_super v4 = @"appleAccountIcon";
        }
      }
    }
    else
    {
      objc_super v4 = @"exchangeAccountIcon";
    }
    id v9 = self->_cachedIconString;
    self->_cachedIconString = &v4->isa;

    cachedIconString = self->_cachedIconString;
  }
  return cachedIconString;
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 1;
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  id v4 = a3;
  if ([(id)*MEMORY[0x1E4F17AD8] isEqualToString:v4]) {
    BOOL v5 = [(DAMailAccount *)self isActive];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = DALoggingwithCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = self;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_INFO, "DAMailAccount %p is deallocating", buf, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  [v4 removeNetworkReachableObserver:self];

  BOOL v5 = +[MFInvocationQueue sharedInvocationQueue];
  char v6 = +[NSInvocation mf_invocationWithSelector:sel_invalidate target:self->_temporaryInbox];
  [v5 addInvocation:v6];

  [(ASAccountActorMessages *)self->_accountConduit shutdown];
  v7.receiver = self;
  v7.super_class = (Class)DAMailAccount;
  [(MailAccount *)&v7 dealloc];
}

- (BOOL)reconstituteOrphanedMeetingInMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 loadMeetingData];
  if (v5)
  {
    char v6 = [v4 messageStore];
    objc_super v7 = [v6 mailbox];

    int v8 = [(DAMailAccount *)self folderIDForMailbox:v7];
    if (v8)
    {
      id v9 = [(DAMailAccount *)self accountConduit];
      char v10 = [v9 reattemptInvitationLinkageForMetaData:v5 inFolderWithId:v8];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)unactionableInvitationICSRepresentationInMessage:(id)a3 summary:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [v6 loadMeetingData];
  if (v7)
  {
    int v8 = [v6 messageStore];
    id v9 = [v8 mailbox];

    char v10 = [(DAMailAccount *)self folderIDForMailbox:v9];
    if (v10)
    {
      uint64_t v11 = [(DAMailAccount *)self accountConduit];
      uint64_t v12 = [v11 unactionableICSRepresentationForMetaData:v7 inFolderWithId:v10 outSummary:a4];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)meetingStorePersistentID
{
  if (self->_cachedCalendarEnabled) {
    objc_super v2 = self->_cachedAccountPersistentUUID;
  }
  else {
    objc_super v2 = 0;
  }
  return v2;
}

- (id)_inboxFolderID
{
  id v3 = [(DAMailAccount *)self primaryMailboxUid];
  if (v3)
  {
    id v4 = [(DAMailAccount *)self folderIDForMailbox:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_updateWatchedFolderIdsAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(DAMailAccount *)self accountConduit];
  id v19 = 0;
  id v6 = [v5 folderIDsThatExternalClientsCareAboutForDataclasses:1 withTag:&v19];
  id v7 = v19;
  id v8 = (id)[v6 mutableCopy];

  if (v7)
  {
    id v9 = (NSString *)[v7 copy];
    folderTag = self->_folderTag;
    self->_folderTag = v9;
  }
  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  uint64_t v11 = [(DAMailAccount *)self _inboxFolderID];
  if (v11) {
    [v8 addObject:v11];
  }
  uint64_t v12 = [(MailAccount *)self mailboxUidOfType:4 createIfNeeded:0];
  uint64_t v13 = [(DAMailAccount *)self folderIDForMailbox:v12];

  if (v13) {
    [v8 addObject:v13];
  }
  [(NSLock *)self->_watchedFolderIdsLock lock];
  objc_super v14 = self->_watchedFolderIds;
  objc_storeStrong((id *)&self->_watchedFolderIds, v8);
  [(NSLock *)self->_watchedFolderIdsLock unlock];
  if (v3)
  {
    int v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 postNotificationName:@"MFMailAccountPushedMailboxUidsDidChange" object:self userInfo:0];
  }
  if (![(NSSet *)v14 isEqualToSet:v8])
  {
    int v16 = DALoggingwithCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v8;
      _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_INFO, "watched folder IDs changed: %@", buf, 0xCu);
    }
  }
  id v17 = v8;

  return v17;
}

- (void)startListeningForNotifications
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = MFUserAgent();
  char v4 = [v3 isMaild];

  if (v4)
  {
    BOOL v5 = +[MFPowerController sharedInstance];
    int v6 = [v5 isBatterySaverModeEnabled];

    if (v6)
    {
      id v7 = MFLogGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [(MFAccount *)self ef_publicDescription];
        int v17 = 138543362;
        objc_super v18 = v8;
        _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_INFO, "account %{public}@ will NOT start listening for notifications: battery-saver mode is ON", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      char v10 = +[MFPowerController sharedInstance];
      int v11 = [v10 gameModeEnabled];

      if (v11)
      {
        id v7 = MFLogGeneral();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = [(MFAccount *)self ef_publicDescription];
          int v17 = 138543362;
          objc_super v18 = v12;
          _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_INFO, "account %{public}@ will NOT start listening for notifications: Game Mode is ON", (uint8_t *)&v17, 0xCu);
        }
      }
      else
      {
        if (!self->_observingPushedFoldersPrefsChanged)
        {
          uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v13 addObserver:self selector:sel_pushedFoldersPrefsChanged_ name:*MEMORY[0x1E4F5E7D0] object:0];

          self->_observingPushedFoldersPrefsChanged = 1;
        }
        objc_super v14 = [(DAMailAccount *)self _updateWatchedFolderIdsAndNotify:1];
        id v7 = [v14 allObjects];

        int v15 = MFLogGeneral();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v17 = 138412290;
          objc_super v18 = v7;
          _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_INFO, "Requesting push for folders: %@", (uint8_t *)&v17, 0xCu);
        }

        if ([v7 count]
          && [(DAMailAccount *)self canReceiveNewMailNotifications])
        {
          int v16 = [(DAMailAccount *)self accountConduit];
          [v16 monitorFoldersForUpdates:v7 persistent:1];
        }
      }
    }
  }
  else
  {
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = [(MFAccount *)self ef_publicDescription];
      int v17 = 138543362;
      objc_super v18 = v9;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_INFO, "account %{public}@ will NOT start listening for notifications: Not in maild", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)stopListeningForNotifications
{
  id v2 = [(DAMailAccount *)self accountConduit];
  [v2 stopMonitoringAllFolders];
}

- (id)syncAnchorForFolderID:(id)a3 mailbox:(id *)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = *a4;
    if (v7) {
      goto LABEL_6;
    }
  }
  id v8 = [(DAMailAccount *)self mailboxForFolderID:v6];
  id v7 = v8;
  if (a4) {
    *a4 = v8;
  }
  if (v7)
  {
LABEL_6:
    id v9 = [(MailAccount *)self library];
    char v10 = [v7 URLString];
    int v11 = [v9 sequenceIdentifierForMailbox:v10];
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

- (void)setSyncAnchor:(id)a3 forFolderID:(id)a4 mailbox:(id *)a5
{
  id v16 = a3;
  id v8 = a4;
  if (a5)
  {
    id v9 = *a5;
    if (v9) {
      goto LABEL_6;
    }
  }
  char v10 = [(DAMailAccount *)self mailboxForFolderID:v8];
  id v9 = v10;
  if (a5) {
    *a5 = v10;
  }
  if (v9)
  {
LABEL_6:
    int v11 = [(MailAccount *)self library];
    uint64_t v12 = [v9 URLString];
    [v11 setSequenceIdentifier:v16 forMailbox:v12];
  }
  if (v16 && !self->_supportsServerSearch)
  {
    uint64_t v13 = [(DAMailAccount *)self accountConduit];
    self->_supportsServerSearch = [v13 supportsMailboxSearch];
  }
  if (v16 && !self->_supportsMessageFlagging)
  {
    objc_super v14 = [(DAMailAccount *)self accountConduit];
    self->_supportsMessageFlagging = [v14 supportsEmailFlagging];
  }
  if (v16 && !self->_supportsConversations)
  {
    int v15 = [(DAMailAccount *)self accountConduit];
    self->_supportsConversations = [v15 supportsConversations];
  }
  [(DAMailAccount *)self supportsUniqueServerId];
}

- (void)performSearchQuery:(id)a3
{
  id v5 = a3;
  char v4 = [(DAMailAccount *)self accountConduit];
  [v4 performSearchQuery:v5];
}

- (void)cancelSearchQuery:(id)a3
{
  id v5 = a3;
  char v4 = [(DAMailAccount *)self accountConduit];
  [v4 cancelSearchQuery:v5];
}

- (BOOL)shouldDisplayHostnameInErrorMessages
{
  return 0;
}

- (BOOL)shouldRestoreMessagesAfterFailedDelete
{
  return 1;
}

- (int)supportsServerSearch
{
  return self->_supportsServerSearch;
}

- (unsigned)daysToSync
{
  return self->_daysToSync;
}

- (BOOL)supportsUserPushedMailboxes
{
  return 1;
}

- (id)pushedMailboxUids
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [(DAMailAccount *)self _watchedFolderIds];
  if (!v12)
  {
    uint64_t v12 = [(DAMailAccount *)self _updateWatchedFolderIdsAndNotify:0];
  }
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v12;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [(DAMailAccount *)self mailboxForFolderID:v8];
        if (v9)
        {
          [v3 addObject:v9];
        }
        else
        {
          char v10 = MFLogGeneral();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v18 = v8;
            _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "#Warning mailboxForFolderID returned nil (folderId = %@)", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)_folderIdsForMailboxUids:(id)a3
{
  BOOL v3 = objc_msgSend(a3, "ef_compactMap:", &__block_literal_global_3);
  return v3;
}

id __42__DAMailAccount__folderIdsForMailboxUids___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [v2 folderID];
    if (v3) {
      goto LABEL_7;
    }
    id v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = objc_msgSend(v2, "ef_publicDescription");
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "#Warning Missing folder ID for mailbox: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  BOOL v3 = 0;
LABEL_7:

  return v3;
}

- (void)changePushedMailboxUidsAdded:(id)a3 deleted:(id)a4
{
  id v9 = a4;
  uint64_t v6 = [(DAMailAccount *)self _folderIdsForMailboxUids:a3];
  uint64_t v7 = [(DAMailAccount *)self _folderIdsForMailboxUids:v9];
  if (v6 | v7)
  {
    uint64_t v8 = [(DAMailAccount *)self accountConduit];
    [v8 setFolderIdsThatExternalClientsCareAboutAdded:v6 deleted:v7 foldersTag:self->_folderTag];
  }
}

- (id)_watchedFolderIds
{
  [(NSLock *)self->_watchedFolderIdsLock lock];
  BOOL v3 = self->_watchedFolderIds;
  [(NSLock *)self->_watchedFolderIdsLock unlock];
  return v3;
}

- (BOOL)canGoOffline
{
  return 1;
}

- (void)_reachabilityChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 name];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F4BDA0]];

  if (v6)
  {
    uint64_t v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F4BDA8]];
    char v9 = [v8 BOOLValue];

    char v10 = dispatch_get_global_queue(0, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__DAMailAccount__reachabilityChanged___block_invoke;
    v11[3] = &unk_1E5D3B5E8;
    v11[4] = self;
    char v12 = v9;
    dispatch_async(v10, v11);
  }
}

void __38__DAMailAccount__reachabilityChanged___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)(*(void *)(a1 + 32) + 256) != *(unsigned __int8 *)(a1 + 40))
  {
    id v2 = DALoggingwithCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = "reachable";
      if (!*(unsigned char *)(a1 + 40)) {
        id v4 = "unreachable";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      int v11 = v4;
      _os_log_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_INFO, "%@: Network became %s", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 256) = *(unsigned char *)(a1 + 40);
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v5 = [MEMORY[0x1E4F60F28] globalAsyncScheduler];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __38__DAMailAccount__reachabilityChanged___block_invoke_203;
      v7[3] = &unk_1E5D3B5C0;
      v7[4] = *(void *)(a1 + 32);
      id v6 = (id)[v5 afterDelay:v7 performBlock:1.0];
    }
  }
}

void __38__DAMailAccount__reachabilityChanged___block_invoke_203(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) replayHandler];
  [v1 connectionEstablished];
}

- (id)signingIdentityPersistentReferenceForAddress:(id)a3
{
  uint64_t v3 = [(DAMailAccount *)self accountConduit];
  id v4 = [v3 signingIdentityPersistentReference];

  return v4;
}

- (void)setSigningIdentityPersistentReference:(id)a3 forAddress:(id)a4
{
  id v6 = a3;
  uint64_t v5 = [(DAMailAccount *)self accountConduit];
  [v5 setSigningIdentityPersistentReference:v6];
}

- (id)encryptionIdentityPersistentReferenceForAddress:(id)a3
{
  uint64_t v3 = [(DAMailAccount *)self accountConduit];
  id v4 = [v3 encryptionIdentityPersistentReference];

  return v4;
}

- (void)setEncryptionIdentityPersistentReference:(id)a3 forAddress:(id)a4
{
  id v6 = a3;
  uint64_t v5 = [(DAMailAccount *)self accountConduit];
  [v5 setEncryptionIdentityPersistentReference:v6];
}

- (BOOL)perMessageEncryptionEnabledForAddress:(id)a3
{
  [(DAMailAccount *)self mf_lock];
  BOOL cachedPerMessageEncryptionEnabled = self->_cachedPerMessageEncryptionEnabled;
  [(DAMailAccount *)self mf_unlock];
  return cachedPerMessageEncryptionEnabled;
}

- (int64_t)secureCompositionSigningPolicyForAddress:(id)a3
{
  [(DAMailAccount *)self mf_lock];
  int64_t cachedSecureMIMEShouldSign = self->_cachedSecureMIMEShouldSign;
  [(DAMailAccount *)self mf_unlock];
  return cachedSecureMIMEShouldSign;
}

- (int64_t)secureCompositionEncryptionPolicyForAddress:(id)a3
{
  [(DAMailAccount *)self mf_lock];
  int64_t cachedSecureMIMEShouldEncrypt = self->_cachedSecureMIMEShouldEncrypt;
  [(DAMailAccount *)self mf_unlock];
  return cachedSecureMIMEShouldEncrypt;
}

- (id)copyDataForRemoteEncryptionCertificatesForAddresses:(id)a3 errors:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = MFUserAgent();
  [v7 networkActivityStarted:self];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__1;
  uint64_t v22 = __Block_byref_object_dispose__1;
  id v23 = (id)0xAAAAAAAAAAAAAAAALL;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__1;
  long long v16 = __Block_byref_object_dispose__1;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__DAMailAccount_copyDataForRemoteEncryptionCertificatesForAddresses_errors___block_invoke;
  v11[3] = &unk_1E5D3B610;
  v11[4] = self;
  void v11[5] = &v18;
  v11[6] = &v12;
  objc_msgSend(v6, "ef_enumerateObjectsInBatchesOfSize:block:", 80, v11);
  uint64_t v8 = MFUserAgent();
  [v8 networkActivityEnded:self];

  if (a4 && [(id)v13[5] count]) {
    *a4 = (id) v13[5];
  }
  id v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __76__DAMailAccount_copyDataForRemoteEncryptionCertificatesForAddresses_errors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v28 = a2;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v28;
  uint64_t v2 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v41 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        id v6 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v5];
        uint64_t v7 = [v6 simpleAddress];

        if (v7) {
          [v35 setObject:v7 forKeyedSubscript:v5];
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v2);
  }

  id v8 = objc_alloc(MEMORY[0x1E4F5E880]);
  id v9 = [v35 allValues];
  char v29 = (void *)[v8 initWithEmailAddresses:v9];

  id v30 = objc_alloc_init(_MFDAResolveRecipientsConsumer);
  __int16 v10 = [*(id *)(a1 + 32) accountConduit];
  [v10 performResolveRecipientsRequest:v29 consumer:v30];

  int v11 = [(_MFDAResolveRecipientsConsumer *)v30 waitForResolvedRecipients];
  if (v11)
  {
    id v34 = v11;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v31 = obj;
    uint64_t v12 = 0;
    uint64_t v13 = [v31 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (!v13) {
      goto LABEL_30;
    }
    uint64_t v14 = *(void *)v37;
    while (1)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v31);
        }
        uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * v15);
        id v17 = [v35 objectForKeyedSubscript:v16];
        uint64_t v18 = [v34 objectForKey:v17];
        uint64_t v19 = v18;
        if (!v18)
        {
          int64_t v25 = NSString;
          uint64_t v22 = MFLookupLocalizedString(@"SMIME_MISSING_REMOTE_ENCRYPTION_CERT_MESSAGE", @"An encryption certificate for “%@” could not be found on the server. Without a certificate, you can’t encrypt messages sent to this address.", @"Delayed");
          id v23 = objc_msgSend(v25, "stringWithFormat:", v22, v16);
          uint64_t v24 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:v23];
LABEL_22:
          id v26 = v12;
          uint64_t v12 = (void *)v24;
LABEL_23:

          goto LABEL_24;
        }
        uint64_t v20 = [v18 status];
        if (v20 == 2)
        {
          uint64_t v22 = [v19 resolvedEmailToX509Certs];
          id v23 = [v22 allValues];
          id v26 = objc_msgSend(v23, "ef_flatten");
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v26 forKeyedSubscript:v16];
          goto LABEL_23;
        }
        if (v20 == 12 || v20 == 66)
        {
          id v21 = NSString;
          uint64_t v22 = MFLookupLocalizedString(@"SMIME_MISSING_REMOTE_ENCRYPTION_CERT_MESSAGE", @"An encryption certificate for “%@” could not be found on the server. Without a certificate, you can’t encrypt messages sent to this address.", @"Delayed");
          id v23 = objc_msgSend(v21, "stringWithFormat:", v22, v16, v28);
          uint64_t v24 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:v23];
          goto LABEL_22;
        }
LABEL_24:
        if (v12) {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v12 forKeyedSubscript:v16];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v27 = [v31 countByEnumeratingWithState:&v36 objects:v44 count:16];
      uint64_t v13 = v27;
      if (!v27)
      {
LABEL_30:

        int v11 = v34;
        break;
      }
    }
  }
}

- (BOOL)restrictedFromTransferingMessagesToOtherAccounts
{
  return self->_cachedRestrictMessageTransfersToOtherAccounts;
}

- (BOOL)restrictedFromSendingExternally
{
  return self->_cachedRestrictSendingFromExternalProcesses;
}

- (BOOL)restrictedFromSyncingRecents
{
  return self->_cachedRestrictSyncingRecents;
}

- (BOOL)isManaged
{
  return self->_cachedIsManaged;
}

- (BOOL)supportsMailDrop
{
  return ![(DAMailAccount *)self isManaged] || self->_cachedSupportsMailDrop;
}

- (id)fetchLimits
{
  uint64_t v2 = +[MFNetworkController sharedInstance];
  int v3 = [v2 isFatPipe];
  id v4 = +[MFPowerController sharedInstance];
  int v5 = [v4 isPluggedIn];

  if (v3 & v5)
  {
    uint64_t v6 = 209715200;
  }
  else if ([v2 isFatPipe] & 1) != 0 || (objc_msgSend(v2, "is4GConnection"))
  {
    uint64_t v6 = 0x800000;
  }
  else if ([v2 is3GConnection])
  {
    uint64_t v6 = 0x80000;
  }
  else
  {
    uint64_t v6 = 0x20000;
  }
  uint64_t v7 = objc_alloc_init(MFFetchLimits);
  [(MFFetchLimits *)v7 setFetchMaxBytes:v6];

  return v7;
}

- (id)unsupportedHandoffTypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F73DA0];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (BOOL)moveSupported
{
  return 1;
}

- (id)replayAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v4 mailboxURL];
    uint64_t v6 = [v5 absoluteString];
    id v7 = [(MailAccount *)self mailboxUidForURL:v6];

    id v8 = [(MailAccount *)self storeForMailboxUid:v7];
    id v9 = [(ECLocalActionReplayer *)[MFDATransferActionReplayer alloc] initWithAction:v4];
    [(ECLocalActionReplayer *)v9 setDelegate:self];
    __int16 v10 = [(MFDATransferActionReplayer *)v9 replayActionUsingStore:v8];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v10 = 0;
      goto LABEL_13;
    }
    id v7 = v4;
    int v11 = [v7 mailboxURL];
    uint64_t v12 = [v11 absoluteString];
    id v8 = [(MailAccount *)self mailboxUidForURL:v12];

    id v9 = [(MailAccount *)self storeForMailboxUid:v8];
    uint64_t v13 = [(DAMailAccount *)self _remoteIDsForFlagChangeAction:v7];
    char v21 = -86;
    uint64_t v14 = [v7 flagChange];
    id v20 = 0;
    int v15 = [(MFDATransferActionReplayer *)v9 replayFlagChange:v14 forRemoteIDs:v13 error:&v20 completed:&v21];
    id v16 = v20;

    if (v21)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F60890]);
      if (v15) {
        id v18 = 0;
      }
      else {
        id v18 = v16;
      }
      __int16 v10 = (void *)[v17 initWithError:v18];
    }
    else
    {
      __int16 v10 = 0;
    }
  }
LABEL_13:

  return v10;
}

- (id)_remoteIDsForFlagChangeAction:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 remoteIDs];
  int v5 = (void *)[v4 mutableCopy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = objc_msgSend(v3, "messages", 0);
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
        __int16 v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v11 = [v10 remoteID];

        if (v11)
        {
          uint64_t v12 = [v10 remoteID];
          [v5 addObject:v12];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)messageDataForMessage:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"DAMailAccount.m", 1798, @"Invalid parameter not satisfying: %@", @"[message isKindOfClass:[MFMailMessage class]]" object file lineNumber description];
  }
  uint64_t v6 = [v5 messageDataIsComplete:0 downloadIfNecessary:0];

  return v6;
}

- (BOOL)moveSupportedFromMailboxURL:(id)a3 toURL:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[MailAccount accountWithURL:a3];
  uint64_t v7 = +[MailAccount accountWithURL:v5];
  BOOL v8 = v6 == v7;

  return v8;
}

- (void)setVirtualAllSearchMailbox:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualAllSearchMailbox, 0);
  objc_storeStrong((id *)&self->_folderTag, 0);
  objc_storeStrong((id *)&self->_watchedFolderIds, 0);
  objc_storeStrong((id *)&self->_watchedFolderIdsLock, 0);
  objc_storeStrong((id *)&self->_requestQueuesByFolderID, 0);
  objc_storeStrong((id *)&self->_temporaryInbox, 0);
  objc_storeStrong((id *)&self->_cachedDraftsFolderID, 0);
  objc_storeStrong((id *)&self->_cachedJunkFolderID, 0);
  objc_storeStrong((id *)&self->_cachedTrashFolderID, 0);
  objc_storeStrong((id *)&self->_cachedSentMessagesFolderID, 0);
  objc_storeStrong((id *)&self->_cachedInboxFolderID, 0);
  objc_storeStrong((id *)&self->_cachedIconString, 0);
  objc_storeStrong((id *)&self->_cachedEmailAddresses, 0);
  objc_storeStrong((id *)&self->_cachedEmailAddress, 0);
  objc_storeStrong((id *)&self->_cachedDisplayName, 0);
  objc_storeStrong((id *)&self->_cachedAccountPersistentUUID, 0);
  objc_storeStrong((id *)&self->_cachedAccountID, 0);
  objc_storeStrong((id *)&self->_daAccount, 0);
  objc_storeStrong((id *)&self->_accountConduit, 0);
}

@end