@interface IMAPAccount
+ (OS_os_log)log;
+ (id)accountTypeIdentifier;
+ (id)accountTypeString;
+ (id)csAccountTypeString;
+ (id)imapMailboxURLForAccountID:(id)a3 pathComponents:(id)a4;
+ (id)saslProfileName;
+ (unsigned)defaultPortNumber;
+ (unsigned)defaultSecurePortNumber;
+ (void)_deleteQueuedMailboxes:(id)a3;
+ (void)getAccountID:(id *)a3 pathComponents:(id *)a4 fromIMAPMailboxURL:(id)a5;
+ (void)legacyKeychainProtocol;
- (BOOL)_deleteMailbox:(id)a3 reflectToServer:(BOOL)a4;
- (BOOL)_hasCachedSeparatorChar;
- (BOOL)_readCustomInfoFromMailboxCache:(id)a3;
- (BOOL)_registerPushNotificationPrefix:(id)a3 forMailboxNames:(id)a4;
- (BOOL)_repairMailboxCache;
- (BOOL)_useNewIMAPStack;
- (BOOL)_writeCustomInfoToMailboxCache:(id)a3;
- (BOOL)allowsPartialDownloads;
- (BOOL)canAttemptPushRegistration;
- (BOOL)canFetch;
- (BOOL)canGoOffline;
- (BOOL)canMailboxBeDeleted:(id)a3;
- (BOOL)canReceiveNewMailNotifications;
- (BOOL)connectAndAuthenticate:(id)a3;
- (BOOL)connection:(id)a3 shouldHandleUntaggedResponse:(id)a4 forCommand:(id)a5;
- (BOOL)deleteInPlaceForAllMailboxes;
- (BOOL)getMailboxListWithConnection:(id)a3 statusDataItems:(id)a4 statusEntriesByMailbox:(id *)a5;
- (BOOL)isMailboxLocalForType:(int64_t)a3;
- (BOOL)isOffline;
- (BOOL)isSpecialMailbox:(id)a3;
- (BOOL)moveSupported;
- (BOOL)mustRegisterForPushOnNextConnection;
- (BOOL)newMailboxNameIsAcceptable:(id)a3 reasonForFailure:(id *)a4;
- (BOOL)renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5;
- (BOOL)requiresAuthentication;
- (BOOL)shouldRegisterForPush;
- (BOOL)shouldRestoreMessagesAfterFailedDelete;
- (BOOL)storeMailboxTypeOnServer:(int64_t)a3;
- (BOOL)supportsAppend;
- (BOOL)supportsAppleRemoteLinks;
- (BOOL)supportsMailboxEditing;
- (BOOL)supportsRemoteAppend;
- (BOOL)supportsUserPushedMailboxes;
- (BOOL)verifyESearchSupportWithBlock:(id)a3;
- (BOOL)xListSupportedOnConnection:(id)a3;
- (Class)connectionClass;
- (Class)storeClass;
- (IMAPAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4;
- (NSDate)credentialExpiryDate;
- (NSString)apsSenderArgument;
- (double)lastPushRegistration;
- (id)_URLScheme;
- (id)_copyMailboxListForNames:(id)a3;
- (id)_copyMailboxListPreferenceForKey:(id)a3;
- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 existingMailboxUid:(id)a6 dictionary:(id)a7;
- (id)_copyPushedMailboxesForPrefix:(id)a3;
- (id)_copyUserPushedMailboxes;
- (id)_externalMailboxUids;
- (id)_fetchAndSetSeparatorChar;
- (id)_fileSystemServerPathPrefix;
- (id)_infoForMatchingURL:(id)a3;
- (id)_listingForMailboxUid:(id)a3 listAllChildren:(BOOL)a4;
- (id)_listingForMailboxUid:(id)a3 listAllChildren:(BOOL)a4 onlySubscribed:(BOOL)a5;
- (id)_listingForMailboxUid:(id)a3 listAllChildren:(BOOL)a4 onlySubscribed:(BOOL)a5 statusDataItems:(id)a6 withConnection:(id)a7 statusEntriesByMailbox:(id *)a8;
- (id)_mailboxPathPrefix;
- (id)_nameForMailboxUid:(id)a3;
- (id)_newMailboxWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 dictionary:(id)a6 withCreationOption:(int64_t)a7;
- (id)_notesPrefix;
- (id)_notificationNameForMailbox:(id)a3 withPrefix:(id)a4;
- (id)_pathComponentForUidName:(id)a3;
- (id)_specialMailboxUidWithType:(int64_t)a3 create:(BOOL)a4;
- (id)_uidNameForPathComponent:(id)a3;
- (id)allMailMailboxUid;
- (id)apsTopic;
- (id)certUIService;
- (id)clientToken;
- (id)connectionForMailbox:(id)a3 delegate:(id)a4 options:(unint64_t)a5 failedToSelectMailbox:(BOOL *)a6;
- (id)copyDiagnosticInformation;
- (id)errorForResponse:(id)a3;
- (id)fetchLimits;
- (id)lastKnownCapabilities;
- (id)mailboxNamesForPushRegistration;
- (id)mailboxPathExtension;
- (id)mailboxUidForName:(id)a3;
- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4;
- (id)mailboxesRegisteredForPushByHash;
- (id)messageActionsAfterActionID:(int64_t)a3;
- (id)mf_lockOrdering;
- (id)nameForMailboxUid:(id)a3;
- (id)pushedMailboxUids;
- (id)replayAction:(id)a3;
- (id)secureServiceName;
- (id)separatorChar;
- (id)serverNamespace;
- (id)serverPathPrefix;
- (id)serverPathPrefixAccountValue;
- (id)serviceName;
- (id)specialUseAttributeForType:(int64_t)a3;
- (id)specialUseAttributesForMailbox:(id)a3;
- (id)stateCaptureTitle;
- (id)statisticsKind;
- (id)taskManager;
- (int64_t)apsVersion;
- (int64_t)supportedPushServiceLevel;
- (unint64_t)minID;
- (unsigned)readBufferSize;
- (void)_apsDeviceTokenChanged:(id)a3;
- (void)_invokeBlock:(id)a3;
- (void)_mailboxListingChanged;
- (void)_mailboxesWereRemovedFromTree:(id)a3 withFileSystemPaths:(id)a4;
- (void)_registerForDeviceTokenChanges;
- (void)_releaseAllConnectionsAndCallSuper:(BOOL)a3;
- (void)_releaseAllConnectionsAndCallSuper:(BOOL)a3 synchronously:(BOOL)a4 edgeForcedOnly:(BOOL)a5 saveOfflineCache:(BOOL)a6;
- (void)_renameLocalSpecialMailboxesToName:(id)a3;
- (void)_replayMailboxActionsWithConnection:(id)a3;
- (void)_schedulePushRegistrationConnection;
- (void)_setCapabilities:(id)a3;
- (void)_setSpecialMailbox:(id)a3 forType:(int64_t)a4;
- (void)_synchronouslyLoadListingForParent:(id)a3;
- (void)_unregisterForDeviceTokenChanges;
- (void)_updatePushedMailboxesAndNotify:(BOOL)a3;
- (void)_updateSeparatorAndNamespaceWithConnection:(id)a3;
- (void)_waitForMailboxListingLoadToComplete;
- (void)acquireNetworkAssertion;
- (void)changePushedMailboxUidsAdded:(id)a3 deleted:(id)a4;
- (void)checkInConnection:(id)a3;
- (void)checkInConnection:(id)a3 destroy:(BOOL)a4;
- (void)checkInConnectionsForStore:(id)a3;
- (void)connection:(id)a3 didReceiveResponse:(id)a4 forCommand:(id)a5;
- (void)dealloc;
- (void)deleteMessagesFromMailboxUid:(id)a3 olderThanNumberOfDays:(unsigned int)a4;
- (void)fetchMailboxListExplicit;
- (void)fetchMailboxListImplicit;
- (void)filterMailboxList:(id)a3 forMailbox:(id)a4 options:(int64_t)a5;
- (void)handleAlertResponse:(id)a3;
- (void)handlePushNotificationOnMailboxes:(id)a3 missedNotifications:(BOOL)a4;
- (void)releaseAllConnections;
- (void)releaseAllConnectionsSynchronously;
- (void)releaseAllForcedConnections;
- (void)releaseNetworkAssertion;
- (void)resetMailboxTimer;
- (void)serverRegisteredMailboxes:(id)a3 withTopic:(id)a4 version:(int64_t)a5;
- (void)setAPSTopic:(id)a3;
- (void)setAllowsPartialDownloads:(BOOL)a3;
- (void)setApsSenderArgument:(id)a3;
- (void)setApsVersion:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setIsOffline:(BOOL)a3;
- (void)setLastPushRegistration:(double)a3;
- (void)setMustRegisterForPushOnNextConnection:(BOOL)a3;
- (void)setReadBufferSize:(unsigned int)a3;
- (void)setSeparatorChar:(id)a3 serverNamespace:(id)a4;
- (void)setServerNamespace:(id)a3;
- (void)setServerPathPrefix:(id)a3;
- (void)setStoreMailboxType:(int64_t)a3 onServer:(BOOL)a4;
- (void)setSupportedPushServiceLevel:(int64_t)a3;
- (void)startListeningForNotifications;
- (void)stopListeningForNotifications;
- (void)systemWillSleep;
- (void)taskManager;
- (void)test_setTaskManager:(id)a3;
- (void)throttledGetMailboxListWithConnection:(id)a3;
- (void)transferNotificationSessionToAccount:(id)a3;
- (void)unselectMailbox:(id)a3;
- (void)updatePushRegisteredMailboxes:(id)a3;
@end

@implementation IMAPAccount

- (id)mf_lockOrdering
{
  return self->_lockOrderingArray;
}

- (id)_mailboxPathPrefix
{
  v2 = [(IMAPAccount *)self _fileSystemServerPathPrefix];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }
  else {
    v4 = &stru_1EFF11268;
  }

  return v4;
}

- (id)_fileSystemServerPathPrefix
{
  v3 = [(IMAPAccount *)self serverPathPrefix];
  uint64_t v4 = [(IMAPAccount *)self separatorChar];
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    uint64_t v8 = [v3 rangeOfString:v4 options:8];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v3 length] <= (unint64_t)(v8 + v7))
      {
        v6 = 0;
        goto LABEL_11;
      }
      uint64_t v9 = objc_msgSend(v3, "substringFromIndex:");

      v3 = (void *)v9;
    }
    v10 = [v3 componentsSeparatedByString:v5];
    v11 = (void *)[v10 mutableCopy];

    uint64_t v12 = [v11 count];
    if (v12)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        v14 = [v11 objectAtIndex:i];
        v15 = [(IMAPAccount *)self _pathComponentForUidName:v14];
        [v11 replaceObjectAtIndex:i withObject:v15];
      }
    }
    v6 = [v11 componentsJoinedByString:@"/"];
  }
LABEL_11:

  return v6;
}

- (id)serverPathPrefix
{
  v3 = [(IMAPAccount *)self serverPathPrefixAccountValue];
  if (!v3) {
    v3 = self->_serverNamespace;
  }
  return v3;
}

- (id)serverPathPrefixAccountValue
{
  v2 = [(MFAccount *)self _objectForAccountInfoKey:@"ServerPathPrefix"];
  if ([v2 length]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)separatorChar
{
  [(IMAPAccount *)self mf_lock];
  v3 = self->_separatorChar;
  [(IMAPAccount *)self mf_unlock];
  if (!v3)
  {
    [(MailAccount *)self rootMailbox];

    [(IMAPAccount *)self mf_lock];
    v3 = self->_separatorChar;
    [(IMAPAccount *)self mf_unlock];
    if (!v3)
    {
      v3 = [(IMAPAccount *)self _fetchAndSetSeparatorChar];
    }
  }
  return v3;
}

- (id)_pathComponentForUidName:(id)a3
{
  v3 = objc_msgSend(a3, "mf_decodedIMAPMailboxName");
  return v3;
}

- (id)_URLScheme
{
  return (id)*MEMORY[0x1E4F5FC38];
}

- (id)_specialMailboxUidWithType:(int64_t)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = -[IMAPAccount isMailboxLocalForType:](self, "isMailboxLocalForType:");
  uint64_t v8 = self;
  uint64_t v9 = v8;
  if (v7)
  {
    v10 = [(MailAccount *)v8 _localMailboxNameForType:a3 usingDisplayName:0];
    v11 = +[LocalAccount localAccount];
  }
  else
  {
    uint64_t v12 = [(IMAPAccount *)v8 specialUseAttributeForType:a3];
    if (v12)
    {
      v13 = [(MailAccount *)v9 rootMailbox];
      v14 = [v13 descendantWithExtraAttribute:v12];

      if (v14)
      {

        v10 = 0;
        goto LABEL_14;
      }
    }
    v15 = [(MailAccount *)v9 specialMailboxNameForType:a3];
    if ([v15 length])
    {
      v10 = v15;
    }
    else
    {
      uint64_t v16 = [(MailAccount *)v9 _defaultSpecialMailboxNameForType:a3];

      v10 = (void *)v16;
    }
    uint64_t v17 = [v10 length];

    if (!v17)
    {
      v14 = 0;
      goto LABEL_14;
    }
    v11 = v9;
  }
  v18 = [(IMAPAccount *)v11 mailboxUidForRelativePath:v10 create:v7 | v4];
  v14 = v18;
  if (v7) {
    [v18 setRepresentedAccount:v9];
  }
  uint64_t v9 = v11;
LABEL_14:

  return v14;
}

- (id)specialUseAttributeForType:(int64_t)a3
{
  if (specialUseAttributeForType__onceToken != -1) {
    dispatch_once(&specialUseAttributeForType__onceToken, &__block_literal_global_230);
  }
  CFDictionaryRef v4 = (const __CFDictionary *)specialUseAttributeForType__map;
  return (id)CFDictionaryGetValue(v4, (const void *)a3);
}

- (BOOL)isMailboxLocalForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3) {
    return 0;
  }
  else {
    return !-[IMAPAccount storeMailboxTypeOnServer:](self, "storeMailboxTypeOnServer:", v3, v4);
  }
}

- (BOOL)storeMailboxTypeOnServer:(int64_t)a3
{
  uint64_t v3 = 0;
  do
  {
    long long v6 = *(_OWORD *)&_storeOnServer[v3];
    uint64_t v7 = _storeOnServer[v3 + 2];
    if ((void)v6 == a3) {
      break;
    }
    BOOL v4 = v3 == 12;
    v3 += 3;
  }
  while (!v4);
  return _storeOnServerForTuple(self, (uint64_t)&v6);
}

- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(IMAPAccount *)self _fileSystemServerPathPrefix];
  if ([v7 length]
    && ([v6 isEqualToString:@"INBOX"] & 1) == 0
    && [v6 hasPrefix:v7])
  {
    uint64_t v8 = [v6 pathComponents];
    uint64_t v9 = [v7 pathComponents];
    unint64_t v10 = [v9 count];
    if (v10 >= [v8 count])
    {
      v16.receiver = self;
      v16.super_class = (Class)IMAPAccount;
      v13 = [(MailAccount *)&v16 mailboxUidForRelativePath:&stru_1EFF11268 create:v4];
      v11 = v8;
    }
    else
    {
      v11 = objc_msgSend(v8, "subarrayWithRange:", v10, objc_msgSend(v8, "count") - v10);

      uint64_t v12 = [v11 componentsJoinedByString:@"/"];
      v17.receiver = self;
      v17.super_class = (Class)IMAPAccount;
      v13 = [(MailAccount *)&v17 mailboxUidForRelativePath:v12 create:v4];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)IMAPAccount;
    v13 = [(MailAccount *)&v15 mailboxUidForRelativePath:v6 create:v4];
  }

  return v13;
}

- (id)mailboxPathExtension
{
  return @"imapmbox";
}

- (BOOL)canFetch
{
  v4.receiver = self;
  v4.super_class = (Class)IMAPAccount;
  return [(MailAccount *)&v4 canFetch] || [(MFAccount *)self isSyncingNotes];
}

- (id)_uidNameForPathComponent:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "mf_encodedIMAPMailboxName");
  return v3;
}

- (id)_infoForMatchingURL:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [v4 path];
  [v5 setObject:self forKey:@"Account"];
  if (v6)
  {
    uint64_t v7 = [(IMAPAccount *)self separatorChar];
    uint64_t v9 = [v6 rangeOfString:@"/" options:8];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = objc_msgSend(v6, "substringWithRange:", v9 + v8, objc_msgSend(v6, "length") - (v9 + v8));

      id v6 = (void *)v10;
    }
    if (v7)
    {
      uint64_t v12 = [v6 rangeOfString:v7 options:8];
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v13 = objc_msgSend(v6, "substringWithRange:", v12 + v11, objc_msgSend(v6, "length") - (v12 + v11));

        id v6 = (void *)v13;
      }
    }
    if (([v6 isEqualToString:&stru_1EFF11268] & 1) == 0) {
      [v5 setObject:v6 forKey:@"RelativePath"];
    }
  }
  return v5;
}

- (BOOL)_readCustomInfoFromMailboxCache:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"separator"];
  id v6 = [v4 objectForKey:@"namespace"];
  [(IMAPAccount *)self mf_lock];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 isEqualToString:&stru_1EFF11268] & 1) == 0)
    {
      uint64_t v9 = (NSString *)[v5 copy];
      separatorChar = self->_separatorChar;
      self->_separatorChar = v9;

      BOOL v8 = 1;
      if (!v6) {
        goto LABEL_11;
      }
      goto LABEL_7;
    }
  }
  uint64_t v7 = +[IMAPAccount log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[IMAPAccount _readCustomInfoFromMailboxCache:](v7);
  }

  BOOL v8 = 0;
  if (v6)
  {
LABEL_7:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v6 isEqualToString:&stru_1EFF11268] & 1) == 0) {
      objc_storeStrong((id *)&self->_serverNamespace, v6);
    }
  }
LABEL_11:
  if (!self->_lastKnownCapabilities)
  {
    uint64_t v11 = [v4 objectForKeyedSubscript:@"capabilities"];
    lastKnownCapabilities = self->_lastKnownCapabilities;
    self->_lastKnownCapabilities = v11;
  }
  if (self->_supportedPushServiceLevel == -2)
  {
    uint64_t v13 = [v4 objectForKeyedSubscript:@"push-service-level"];
    if (objc_opt_respondsToSelector())
    {
      int v14 = [v13 intValue];
      if (v14 >= -1 && [(IMAPAccount *)self apsVersion] >= v14) {
        self->_supportedPushServiceLevel = v14;
      }
    }
  }
  if (!self->_pushRegisteredMailboxes)
  {
    objc_super v15 = [v4 objectForKeyedSubscript:@"push-registered-mailboxes"];
    pushRegisteredMailboxes = self->_pushRegisteredMailboxes;
    self->_pushRegisteredMailboxes = v15;
  }
  if (!self->_apsTopic)
  {
    objc_super v17 = [v4 objectForKeyedSubscript:@"aps-topic"];
    apsTopic = self->_apsTopic;
    self->_apsTopic = v17;
  }
  [(IMAPAccount *)self mf_unlock];
  v20.receiver = self;
  v20.super_class = (Class)IMAPAccount;
  [(MailAccount *)&v20 _readCustomInfoFromMailboxCache:v4];

  return v8;
}

- (int64_t)apsVersion
{
  return self->_apsVersion;
}

- (void)resetMailboxTimer
{
}

- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 existingMailboxUid:(id)a6 dictionary:(id)a7
{
  uint64_t v12 = (MFMailboxUid *)a3;
  id v13 = a4;
  int v14 = (MFMailboxUid *)a6;
  id v15 = a7;
  if (v14)
  {
    if (!v13)
    {
      if (self->super._inboxMailboxUid == v14)
      {
        uint64_t v23 = [(MFMailboxUid *)v14 name];
        a5 = [(MFMailboxUid *)self->super._inboxMailboxUid attributes] & 0xFFFFFFFFFFFFFEFFLL;
        id v13 = (id)v23;
      }
      else
      {
        if (([(MFMailboxUid *)v14 attributes] & 0x100) != 0)
        {

          int v14 = 0;
        }
        id v13 = 0;
      }
    }
    a5 |= [(MFMailboxUid *)v14 attributes] & 0x80;
    goto LABEL_15;
  }
  if (self->super._rootMailboxUid != v12
    || (id v16 = v13, (v13 = v16) == 0)
    || (uint64_t v17 = [v16 caseInsensitiveCompare:@"INBOX"], v13, v17))
  {
    int v14 = 0;
LABEL_15:
    v25.receiver = self;
    v25.super_class = (Class)IMAPAccount;
    v22 = [(MailAccount *)&v25 _copyMailboxUidWithParent:v12 name:v13 attributes:a5 existingMailboxUid:v14 dictionary:v15];

    goto LABEL_16;
  }
  unint64_t v18 = a5 & 0xFFFFFFFFFFFFFEFFLL;
  inboxMailboxUid = self->super._inboxMailboxUid;
  if (inboxMailboxUid)
  {
    [(MFMailboxUid *)inboxMailboxUid setName:v13];
    [(MFMailboxUid *)self->super._inboxMailboxUid setAttributes:v18];
    objc_super v20 = self->super._inboxMailboxUid;
    v21 = [v15 objectForKey:@"MailboxExtraAttributes"];
    [(MFMailboxUid *)v20 setExtraAttributes:v21];

    v22 = self->super._inboxMailboxUid;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)IMAPAccount;
    v22 = [(MailAccount *)&v26 _copyMailboxUidWithParent:v12 name:v13 attributes:v18 existingMailboxUid:0 dictionary:v15];
    [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:v22 forType:7];
  }
LABEL_16:

  return v22;
}

+ (id)csAccountTypeString
{
  return (id)*MEMORY[0x1E4F22758];
}

- (id)stateCaptureTitle
{
  return @"mail-automation: IMAPAccount";
}

- (IMAPAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IMAPAccount;
  BOOL v8 = [(MailAccount *)&v18 initWithLibrary:v6 persistentAccount:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_supportedPushServiceLevel = -2;
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F73580]) initWithName:@"connectionLock" andDelegate:v8];
    connectionLock = v9->_connectionLock;
    v9->_connectionLock = (NSRecursiveLock *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v13 = objc_msgSend(v12, "initWithObjects:", v9->_connectionLock, *MEMORY[0x1E4F73470], 0);
    lockOrderingArray = v9->_lockOrderingArray;
    v9->_lockOrderingArray = (NSArray *)v13;

    id v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    eSearchSupportedLock = v9->_eSearchSupportedLock;
    v9->_eSearchSupportedLock = v15;

    *((unsigned char *)v9 + 388) &= ~0x10u;
    v9->_apsVersion = 2;
    atomic_store(0, (unsigned __int8 *)&v9->_fetchedMailboxList);
    atomic_store(1u, (unsigned __int8 *)&v9->_isOffline);
    v9->_taskManagerLock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)statisticsKind
{
  v2 = [(MailAccount *)self iconString];
  if (([@"163AccountIcon" isEqualToString:v2] & 1) != 0
    || ([@"126AccountIcon" isEqualToString:v2] & 1) != 0)
  {
    uint64_t v3 = (id *)MEMORY[0x1E4F73CF8];
  }
  else
  {
    int v4 = [@"qqAccountIcon" isEqualToString:v2];
    uint64_t v3 = (id *)MEMORY[0x1E4F73CF0];
    if (v4) {
      uint64_t v3 = (id *)MEMORY[0x1E4F73D00];
    }
  }
  id v5 = *v3;

  return v5;
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E4F177E8];
}

void __18__IMAPAccount_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;
}

void __26__IMAPAccount_taskManager__block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    MFPersistenceAdaptorPowerLogDidCreateInstance(0);
  }
}

- (id)taskManager
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(MFAccount *)self hostname];
  p_taskManagerLock = &self->_taskManagerLock;
  os_unfair_lock_lock(&self->_taskManagerLock);
  p_taskManager = &self->_taskManager;
  id v6 = self->_taskManager;
  if (!v6)
  {
    if ([(IMAPAccount *)self _useNewIMAPStack]
      && +[MFMailMessageLibrary canUsePersistence])
    {
      id v6 = [[MFSwiftIMAPTaskManager alloc] initWithAccount:self];
      if (!v6)
      {
        uint64_t v13 = +[IMAPAccount log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          int v14 = [(MFAccount *)self identifier];
          [(IMAPAccount *)v14 taskManager];
        }

        abort();
      }
      id v7 = +[IMAPAccount log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v8 = [(MFAccount *)self identifier];
        *(_DWORD *)buf = 138543618;
        objc_super v18 = v8;
        __int16 v19 = 2114;
        objc_super v20 = v3;
        _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Using MFSwiftIMAPTaskManager for account %{public}@ on %{public}@", buf, 0x16u);
      }
      objc_storeStrong((id *)p_taskManager, v6);
    }
    else
    {
      id v6 = 0;
    }
  }
  os_unfair_lock_unlock(p_taskManagerLock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__IMAPAccount_taskManager__block_invoke;
  block[3] = &unk_1E5D3B5C0;
  uint64_t v9 = v6;
  id v16 = v9;
  if (taskManager_onceToken != -1) {
    dispatch_once(&taskManager_onceToken, block);
  }
  uint64_t v10 = v16;
  uint64_t v11 = v9;

  return v11;
}

- (void)releaseAllConnections
{
  uint64_t v3 = [MEMORY[0x1E4F29060] isMainThread] ^ 1;
  [(IMAPAccount *)self _releaseAllConnectionsAndCallSuper:1 synchronously:v3 edgeForcedOnly:0 saveOfflineCache:1];
}

- (BOOL)_useNewIMAPStack
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v2 = [v3 BOOLForKey:@"MailIMAPNewStack"];

  return v2;
}

- (void)_releaseAllConnectionsAndCallSuper:(BOOL)a3 synchronously:(BOOL)a4 edgeForcedOnly:(BOOL)a5 saveOfflineCache:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = +[IMAPAccount log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [MEMORY[0x1E4F29060] isMainThread];
    uint64_t v13 = objc_opt_class();
    int v14 = @"BT";
    *(_DWORD *)buf = 138413570;
    if (v12) {
      int v14 = @"MT";
    }
    v54 = v14;
    __int16 v55 = 2112;
    v56 = v13;
    __int16 v57 = 1024;
    BOOL v58 = v9;
    __int16 v59 = 1024;
    BOOL v60 = v8;
    __int16 v61 = 1024;
    BOOL v62 = v7;
    __int16 v63 = 1024;
    BOOL v64 = v6;
    id v15 = v13;
    _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "#Network %@: -[%@ _releaseAllConnectionsAndCallSuper:%{BOOL}d synchronously:%{BOOL}d edgeForcedOnly:%{BOOL}d saveOfflineCache:%{BOOL}d]", buf, 0x2Eu);
  }
  v51[0] = @"method";
  v51[1] = @"edgeOnly";
  v52[0] = @"_releaseAllConnectionsAndCallSuper";
  id v16 = NSStringFromBOOL();
  v52[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  +[MFPowerController powerlog:@"IMAPAccount" eventData:v17];

  if (v8)
  {
    objc_super v18 = [(IMAPAccount *)self taskManager];

    if (v18)
    {
      __int16 v19 = [(IMAPAccount *)self taskManager];
      [v19 closeAllConnections];

      if (v9)
      {
        v46.receiver = self;
        v46.super_class = (Class)IMAPAccount;
        [(MailAccount *)&v46 releaseAllConnections];
      }
    }
    else
    {
      [(NSRecursiveLock *)self->_connectionLock lock];
      [(IMAPAccount *)self mf_lock];
      v24 = (void *)[(__CFArray *)self->_cachedConnections mutableCopy];
      if (self->_cachedConnections)
      {
        objc_super v25 = +[IMAPAccount log];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          cachedConnections = self->_cachedConnections;
          *(_DWORD *)buf = 138412290;
          v54 = cachedConnections;
          _os_log_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_DEFAULT, "#Network All connections: %@", buf, 0xCu);
        }
      }
      [(IMAPAccount *)self mf_unlock];
      if (v7)
      {
        v27 = +[IMAPAccount log];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7EFF000, v27, OS_LOG_TYPE_DEFAULT, "#Network EDGE ONLY", buf, 2u);
        }

        uint64_t v28 = [v24 count];
        int v29 = 0;
        if (v28)
        {
          uint64_t v30 = v28 - 1;
          do
          {
            v31 = [v24 objectAtIndex:v30];
            if ([v31 isCellularConnection])
            {
              if ([v31 isFetching]) {
                int v29 = 1;
              }
            }
            else
            {
              [v24 removeObjectAtIndex:v30];
            }

            --v30;
          }
          while (v30 != -1);
        }
        int v32 = v29;
      }
      else
      {
        int v32 = 0;
      }
      v33 = +[IMAPAccount log];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v24;
        _os_log_impl(&dword_1A7EFF000, v33, OS_LOG_TYPE_DEFAULT, "#Network Dropping connections: %@", buf, 0xCu);
      }
      v34 = 0;
      while (1)
      {

        [(IMAPAccount *)self mf_lock];
        if ([v24 count])
        {
          v35 = [v24 objectAtIndexedSubscript:0];
          uint64_t v36 = [v35 delegate];
          [v24 removeObjectAtIndex:0];
          v37 = self->_cachedConnections;
          if (v37)
          {
            v66.length = CFArrayGetCount(self->_cachedConnections);
            v66.location = 0;
            CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v37, v66, v35);
            if (FirstIndexOfValue != -1) {
              CFArrayRemoveValueAtIndex(self->_cachedConnections, FirstIndexOfValue);
            }
          }
          v33 = v35;
          v39 = (void *)v36;
        }
        else
        {
          v33 = 0;
          v39 = 0;
        }
        [(IMAPAccount *)self mf_unlock];
        if (!v33) {
          break;
        }
        if (v34) {
          int v40 = 0;
        }
        else {
          int v40 = v32;
        }
        if (v40 == 1)
        {
          if ([v33 isFetching]) {
            v34 = v33;
          }
          else {
            v34 = 0;
          }
        }
        [v33 logout];
        if (v39)
        {
          [(IMAPAccount *)self mf_lock];
          [v33 setDelegate:0];
          [(IMAPAccount *)self mf_unlock];
        }
      }
      if (v32)
      {
        v41 = [v34 selectedMailbox];
        v42 = [(IMAPAccount *)self mailboxUidForName:v41];
      }
      else
      {
        v42 = 0;
      }
      [(NSRecursiveLock *)self->_connectionLock unlock];
      if (v42) {
        int v43 = v32;
      }
      else {
        int v43 = 0;
      }
      if (v43 == 1)
      {
        v44 = MFUserAgent();
        [v44 autofetchAccount:self mailboxUid:v42];
      }
      if (v9)
      {
        v45.receiver = self;
        v45.super_class = (Class)IMAPAccount;
        [(MailAccount *)&v45 releaseAllConnections];
      }
    }
  }
  else
  {
    [(IMAPAccount *)self mf_lock];
    if (self->_cachedConnections)
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __96__IMAPAccount__releaseAllConnectionsAndCallSuper_synchronously_edgeForcedOnly_saveOfflineCache___block_invoke;
      v47[3] = &unk_1E5D3B7B0;
      v47[4] = self;
      BOOL v48 = v9;
      BOOL v49 = v7;
      BOOL v50 = v6;
      objc_super v20 = (void *)[v47 copy];
      uint64_t v21 = _Block_copy(v20);
      v22 = +[MFMonitoredInvocation invocationWithSelector:sel__invokeBlock_ target:self object:v21 taskName:0 priority:3 canBeCancelled:1];

      [v22 retainArguments];
      uint64_t v23 = +[MFInvocationQueue sharedInvocationQueue];
      [v23 addInvocation:v22];
    }
    [(IMAPAccount *)self mf_unlock];
  }
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__IMAPAccount_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  char v2 = (void *)log_log_0;
  return (OS_os_log *)v2;
}

- (void)fetchMailboxListImplicit
{
  if (+[MFMailMessageLibrary canUsePersistence])
  {
    uint64_t v3 = [(IMAPAccount *)self taskManager];

    if (!v3)
    {
      [(IMAPAccount *)self throttledGetMailboxListWithConnection:0];
    }
  }
}

- (void)transferNotificationSessionToAccount:(id)a3
{
  int v4 = (IMAPAccount *)a3;
  if (v4 != self)
  {
    [(IMAPAccount *)self stopListeningForNotifications];
    [(IMAPAccount *)v4 startListeningForNotifications];
  }
}

void __42__IMAPAccount_specialUseAttributeForType___block_invoke()
{
  Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)5, @"\\Drafts");
  CFDictionarySetValue(Mutable, (const void *)4, @"\\Sent");
  CFDictionarySetValue(Mutable, (const void *)3, @"\\Trash");
  CFDictionarySetValue(Mutable, (const void *)2, @"\\Archive");
  CFDictionarySetValue(Mutable, (const void *)1, @"\\Junk");
  specialUseAttributeForType__map = (uint64_t)Mutable;
}

- (id)certUIService
{
  return (id)*MEMORY[0x1E4F58118];
}

- (unint64_t)minID
{
  return 1;
}

- (BOOL)_writeCustomInfoToMailboxCache:(id)a3
{
  id v4 = a3;
  [(IMAPAccount *)self mf_lock];
  separatorChar = self->_separatorChar;
  if (separatorChar)
  {
    [v4 setObject:self->_separatorChar forKey:@"separator"];
  }
  else
  {
    BOOL v6 = +[IMAPAccount log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[IMAPAccount _writeCustomInfoToMailboxCache:](v6);
    }
  }
  serverNamespace = self->_serverNamespace;
  if (serverNamespace) {
    [v4 setObject:serverNamespace forKey:@"namespace"];
  }
  lastKnownCapabilities = self->_lastKnownCapabilities;
  if (lastKnownCapabilities) {
    [v4 setObject:lastKnownCapabilities forKey:@"capabilities"];
  }
  if (self->_supportedPushServiceLevel != -2)
  {
    BOOL v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v9 forKey:@"push-service-level"];
  }
  if ([(NSMutableDictionary *)self->_pushRegisteredMailboxes count]) {
    [v4 setObject:self->_pushRegisteredMailboxes forKey:@"push-registered-mailboxes"];
  }
  apsTopic = self->_apsTopic;
  if (apsTopic) {
    [v4 setObject:apsTopic forKey:@"aps-topic"];
  }
  [(IMAPAccount *)self mf_unlock];
  v12.receiver = self;
  v12.super_class = (Class)IMAPAccount;
  [(MailAccount *)&v12 _writeCustomInfoToMailboxCache:v4];

  return separatorChar != 0;
}

- (BOOL)_repairMailboxCache
{
  char v2 = [(IMAPAccount *)self _fetchAndSetSeparatorChar];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)dealloc
{
  cachedConnections = self->_cachedConnections;
  if (cachedConnections) {
    CFRelease(cachedConnections);
  }
  id v4 = +[MFAPSManager sharedManager];
  [v4 stopWatchingForTopic:self->_apsTopic];

  unlockedReleaseNetworkAssertion(self);
  v5.receiver = self;
  v5.super_class = (Class)IMAPAccount;
  [(MailAccount *)&v5 dealloc];
}

- (Class)storeClass
{
  return (Class)objc_opt_class();
}

- (void)test_setTaskManager:(id)a3
{
  id v5 = a3;
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"IMAPAccount.m", 322, @"%s can only be called from unit tests", "-[IMAPAccount test_setTaskManager:]");
  }
  v12.receiver = self;
  v12.super_class = (Class)IMAPAccount;
  [(MailAccount *)&v12 test_setTaskManager:v5];
  p_taskManagerLock = &self->_taskManagerLock;
  os_unfair_lock_lock(&self->_taskManagerLock);
  taskManager = self->_taskManager;
  BOOL v8 = (MFTaskManager *)v5;
  BOOL v9 = self->_taskManager;
  self->_taskManager = v8;
  uint64_t v10 = taskManager;

  os_unfair_lock_unlock(p_taskManagerLock);
  [(MFTaskManager *)v10 test_tearDown];
}

- (void)setDisplayName:(id)a3
{
  id v4 = a3;
  [(IMAPAccount *)self _renameLocalSpecialMailboxesToName:v4];
  v5.receiver = self;
  v5.super_class = (Class)IMAPAccount;
  [(MFAccount *)&v5 setDisplayName:v4];
}

+ (unsigned)defaultPortNumber
{
  return 143;
}

+ (unsigned)defaultSecurePortNumber
{
  return 993;
}

- (id)serviceName
{
  return @"imap";
}

- (id)secureServiceName
{
  return @"imaps";
}

+ (id)saslProfileName
{
  return @"imap";
}

- (BOOL)requiresAuthentication
{
  return 1;
}

- (Class)connectionClass
{
  return (Class)objc_opt_class();
}

- (void)setStoreMailboxType:(int64_t)a3 onServer:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = _storeOnServer[v6];
    uint64_t v8 = v6 * 8 + 24;
    if (v7 == a3) {
      break;
    }
    BOOL v9 = v6 == 12;
    v6 += 3;
  }
  while (!v9);
  uint64_t v10 = *(uint64_t *)((char *)&_storeOnServer[-2] + v8);
  v12[0] = v7;
  v12[1] = v10;
  v12[2] = 1;
  if (_storeOnServerForTuple(self, (uint64_t)v12) != a4)
  {
    [(IMAPAccount *)self mf_lock];
    uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
    [(MFAccount *)self setAccountProperty:v11 forKey:v10];

    [(IMAPAccount *)self mf_unlock];
    [(MailAccount *)self resetSpecialMailboxes];
    [(MFAccount *)self _queueAccountInfoDidChange];
  }
}

+ (id)accountTypeString
{
  return @"IMAP";
}

+ (void)legacyKeychainProtocol
{
  return (void *)*MEMORY[0x1E4F3B808];
}

- (id)clientToken
{
  return 0;
}

- (void)handleAlertResponse:(id)a3
{
  id v13 = a3;
  BOOL v4 = NSString;
  objc_super v5 = MFLookupLocalizedString(@"IMAP_SERVER_ALERT_FORMAT", @"The IMAP server for “%@” wishes to alert you to the following:\n\n%@", @"Delayed");
  uint64_t v6 = [(MailAccount *)self displayName];
  uint64_t v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6, v13);

  [(IMAPAccount *)self mf_lock];
  uint64_t v8 = (void *)handleAlertResponse___handledAlerts;
  if (!handleAlertResponse___handledAlerts)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v10 = (void *)handleAlertResponse___handledAlerts;
    handleAlertResponse___handledAlerts = (uint64_t)v9;

    uint64_t v8 = (void *)handleAlertResponse___handledAlerts;
  }
  if ([v8 containsObject:v7])
  {

    uint64_t v7 = 0;
  }
  else
  {
    [(id)handleAlertResponse___handledAlerts addObject:v7];
  }
  [(IMAPAccount *)self mf_unlock];
  if (v7)
  {
    uint64_t v11 = MFLookupLocalizedString(@"WARNING_TITLE", @"Warning", @"Delayed");
    objc_super v12 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:v7 title:v11 userInfo:0];
    [(MailAccount *)self setConnectionError:v12];
  }
}

- (id)errorForResponse:(id)a3
{
  id v3 = a3;
  if (([v3 isResponseWithCode:17] & 1) != 0 || objc_msgSend(v3, "isAlertResponse"))
  {
    BOOL v4 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1039 localizedDescription:0];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (unsigned)readBufferSize
{
  unsigned int readBufferSize = self->_readBufferSize;
  if (!readBufferSize)
  {
    unsigned int readBufferSize = 0x2000;
    self->_unsigned int readBufferSize = 0x2000;
  }
  return readBufferSize;
}

- (void)setReadBufferSize:(unsigned int)a3
{
  self->_unsigned int readBufferSize = a3;
}

- (BOOL)allowsPartialDownloads
{
  return ![(MFAccount *)self _BOOLForAccountInfoKey:@"PreventDismemberment" defaultValue:0];
}

- (void)setAllowsPartialDownloads:(BOOL)a3
{
  BOOL v3 = a3;
  [(IMAPAccount *)self mf_lock];
  objc_super v5 = [MEMORY[0x1E4F28ED0] numberWithBool:!v3];
  [(MFAccount *)self setAccountProperty:v5 forKey:@"PreventDismemberment"];

  [(IMAPAccount *)self mf_unlock];
}

- (BOOL)deleteInPlaceForAllMailboxes
{
  return [(MFAccount *)self _BOOLForAccountInfoKey:@"DeleteInPlace" defaultValue:0];
}

- (BOOL)connectAndAuthenticate:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(IMAPAccount *)self isOffline];
  uint64_t v6 = +[MFActivityMonitor currentMonitor];
  uint64_t v7 = [v4 connectionState];
  uint64_t v8 = +[IMAPAccount log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(v4, "ef_publicDescription");
    uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:v7];
    int v20 = 138543618;
    uint64_t v21 = v9;
    __int16 v22 = 2112;
    uint64_t v23 = v10;
    _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ state: %@", (uint8_t *)&v20, 0x16u);
  }
  uint64_t v11 = [v4 connectionState];
  if ((unint64_t)(v11 - 2) < 2) {
    goto LABEL_14;
  }
  BOOL v12 = 0;
  if (v11 == 1) {
    goto LABEL_11;
  }
  if (!v11)
  {
    if ([v6 shouldCancel])
    {
      id v13 = 0;
LABEL_25:
      LOBYTE(v12) = 0;
      goto LABEL_26;
    }
    if (([v4 connectUsingAccount:self] & 1) == 0)
    {
      __int16 v19 = [v6 error];
      id v15 = v19;
      if (!v19 || (objc_msgSend(v19, "mf_isUserCancelledError") & 1) != 0)
      {
        BOOL v5 = 0;
        id v13 = 0;
        goto LABEL_21;
      }
      id v13 = [v6 error];
LABEL_20:
      BOOL v5 = 1;
LABEL_21:

      if (v13)
      {
        id v16 = +[MFNetworkController sharedInstance];
        int v17 = [v16 isNetworkUp];

        if (v17)
        {
          if ((objc_msgSend(v13, "mf_isUserCancelledError") & 1) == 0) {
            [(MailAccount *)self setConnectionError:v13];
          }
        }
      }
      goto LABEL_25;
    }
    BOOL v12 = 1;
LABEL_11:
    if ([v4 authenticateUsingAccount:self])
    {
      [(MailAccount *)self setConnectionError:0];
      if (v12)
      {
        [(IMAPAccount *)self _updateSeparatorAndNamespaceWithConnection:v4];
        [(IMAPAccount *)self throttledGetMailboxListWithConnection:v4];
        int v14 = [(MailAccount *)self replayHandler];
        [v14 connectionEstablished];
      }
LABEL_14:
      id v13 = 0;
      BOOL v5 = 0;
      LOBYTE(v12) = 1;
      goto LABEL_26;
    }
    id v13 = [v6 error];
    if ([(MFAccount *)self shouldEnableAfterError:v13]) {
      [(MFAccount *)self enableAccount];
    }
    if (!v13)
    {
      id v13 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1033 localizedDescription:0];
      [v6 setError:v13];
    }
    id v15 = [(MFAccount *)self preferredAuthScheme];
    [(MFAccount *)self reportAuthenticationError:v13 authScheme:v15];
    goto LABEL_20;
  }
  id v13 = 0;
LABEL_26:
  if (v5 != [(IMAPAccount *)self isOffline])
  {
    [(IMAPAccount *)self setIsOffline:v5];
    if (!v5) {
      objc_msgSend(v4, "setReadBufferSize:", -[IMAPAccount readBufferSize](self, "readBufferSize"));
    }
  }

  return v12;
}

- (void)_replayMailboxActionsWithConnection:(id)a3
{
  id v14 = a3;
  id v4 = [(MFAccount *)self identifier];
  for (uint64_t i = 0; ; uint64_t i = v9)
  {
    uint64_t v6 = [(MailAccount *)self library];
    uint64_t v7 = [v6 persistence];
    uint64_t v8 = [v7 mailboxActionPersistence];
    id v9 = [v8 nextMailboxActionForAccountID:v4];

    if (!v9) {
      break;
    }
    if ([v9 actionType] == 1)
    {
      uint64_t v10 = [v9 mailboxName];
      [v14 createMailbox:v10];
    }
    else
    {
      uint64_t v10 = [v9 mailboxName];
      [v14 deleteMailbox:v10];
    }

    uint64_t v11 = [(MailAccount *)self library];
    BOOL v12 = [v11 persistence];
    id v13 = [v12 mailboxActionPersistence];
    objc_msgSend(v13, "deleteMailboxAction:", objc_msgSend(v9, "actionID"));
  }
}

- (id)connectionForMailbox:(id)a3 delegate:(id)a4 options:(unint64_t)a5 failedToSelectMailbox:(BOOL *)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v68 = self;
  id v69 = a4;
  v67 = v10;
  uint64_t v11 = [(IMAPAccount *)self taskManager];
  if (v11)
  {
    char v12 = EFIsRunningUnitTests();

    if ((v12 & 1) == 0)
    {
      BOOL v62 = [MEMORY[0x1E4F28B00] currentHandler];
      [v62 handleFailureInMethod:a2 object:v68 file:@"IMAPAccount.m" lineNumber:833 description:@"Trying to use old IMAP while new IMAP is enabled"];
    }
  }
  if (a6) {
    *a6 = 0;
  }
  if (v10)
  {
    uint64_t v13 = [(IMAPAccount *)v68 _nameForMailboxUid:v10];
    if (!v13)
    {
      id v14 = +[IMAPAccount log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.version) = 138412290;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v10;
        _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "*** Unable to determine name for %@", (uint8_t *)&buf, 0xCu);
      }
      id v71 = 0;
      goto LABEL_131;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  v70 = (void *)v13;
  BOOL v64 = *(void (__cdecl **)(CFAllocatorRef, const void *))(MEMORY[0x1E4F1D510] + 16);
  uint64_t v65 = *(const void *(__cdecl **)(CFAllocatorRef, const void *))(MEMORY[0x1E4F1D510] + 8);
  __int16 v63 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D510] + 24);
  while (2)
  {
    id v15 = v68;
    id v71 = v70;
    id v16 = v69;
    int v17 = +[MFActivityMonitor currentMonitor];
    [v17 setError:0];

    [(NSRecursiveLock *)v15->_connectionLock lock];
    [(IMAPAccount *)v15 mf_lock];
    CFArrayRef cachedConnections = v15->_cachedConnections;
    if (a5)
    {
      if (cachedConnections) {
        goto LABEL_17;
      }
      buf.version = 0;
      buf.retain = v65;
      buf.release = v64;
      buf.copyDescription = v63;
      buf.equal = 0;
      CFArrayRef cachedConnections = CFArrayCreateMutable(0, 0, &buf);
      v15->_CFArrayRef cachedConnections = cachedConnections;
    }
    if (cachedConnections)
    {
LABEL_17:
      unint64_t Count = CFArrayGetCount(cachedConnections);
      if (Count)
      {
        CFIndex v20 = 0;
        CFIndex v21 = 0xAAAAAAAAAAAAAAAALL;
        while (1)
        {
          __int16 v22 = CFArrayGetValueAtIndex(v15->_cachedConnections, v20);
          id v23 = [v22 delegate];
          if (v23 != v16) {
            break;
          }
          if ((a5 & 4) != 0)
          {
            char v24 = objc_msgSend(v22, "mf_tryLock");

            if ((v24 & 1) == 0) {
              goto LABEL_21;
            }
          }
          else
          {
          }
          id v14 = v22;
          CFIndex v21 = v20;
LABEL_27:

          if (++v20 >= Count || v14)
          {
            if (v14) {
              goto LABEL_30;
            }
            CFIndex v28 = 0;
            while (1)
            {
              int v29 = CFArrayGetValueAtIndex(v15->_cachedConnections, v28);
              uint64_t v30 = [v29 delegate];
              if (v30)
              {
              }
              else if ((a5 & 4) == 0 || objc_msgSend(v29, "mf_tryLock"))
              {
                if (v70)
                {
                  int v32 = [v29 selectedMailbox];
                  char v33 = [v32 isEqualToString:v71];

                  if (v33)
                  {
LABEL_53:
                    id v14 = v29;
                    if ((a5 & 4) == 0) {
                      goto LABEL_37;
                    }
                    goto LABEL_54;
                  }
                }
                else
                {
                  if ((a5 & 8) != 0) {
                    goto LABEL_53;
                  }
                  v34 = [v29 selectedMailbox];
                  BOOL v35 = v34 == 0;

                  if (v35) {
                    goto LABEL_53;
                  }
                }
                id v14 = 0;
                if ((a5 & 4) == 0) {
                  goto LABEL_37;
                }
LABEL_54:
                if (v14) {
                  goto LABEL_37;
                }
                objc_msgSend(v29, "mf_unlock");
              }
              id v14 = 0;
LABEL_37:
              BOOL v27 = v14 == 0;
              if (v14) {
                CFIndex v21 = v28;
              }

              if (++v28 >= Count || v14 != 0)
              {
                char v26 = 0;
                goto LABEL_56;
              }
            }
          }
        }

LABEL_21:
        id v14 = 0;
        goto LABEL_27;
      }
      goto LABEL_32;
    }
    unint64_t Count = 0;
LABEL_32:
    id v14 = 0;
    CFIndex v21 = 0xAAAAAAAAAAAAAAAALL;
    char v26 = 1;
    BOOL v27 = 1;
LABEL_56:
    if ((a5 & 1) == 0 || !v27)
    {
      char v25 = 0;
      goto LABEL_82;
    }
    if (!v70) {
      goto LABEL_77;
    }
    uint64_t v36 = +[IMAPAccount log];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      CFIndex v37 = (CFIndex)v15->_cachedConnections;
      LODWORD(buf.version) = 138543362;
      *(CFIndex *)((char *)&buf.version + 4) = v37;
      _os_log_impl(&dword_1A7EFF000, v36, OS_LOG_TYPE_INFO, "Attempting to find a cached connection. _cachedConnections:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }

    if (v26)
    {
LABEL_77:
      id v14 = [(MFAccount *)v15 _newConnection];
      v42 = +[IMAPAccount log];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        int v43 = [v14 ef_publicDescription];
        LODWORD(buf.version) = 138543362;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v43;
        _os_log_impl(&dword_1A7EFF000, v42, OS_LOG_TYPE_DEFAULT, "No cached connection found. Creating new connection: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      if ((a5 >> 2)) {
        [v14 mf_lock];
      }
      [v14 setTag:v15->_nextConnectionTag++];
      [v14 setMailboxListFilter:v15];
      CFArrayAppendValue(v15->_cachedConnections, v14);
      char v25 = 1;
      CFIndex v21 = Count;
      goto LABEL_82;
    }
    unint64_t v38 = 0;
    do
    {
      v39 = CFArrayGetValueAtIndex(v15->_cachedConnections, v38);
      int v40 = [v39 delegate];
      if (v40)
      {
        id v14 = 0;
      }
      else
      {
        if ((a5 & 4) != 0 && !objc_msgSend(v39, "mf_tryLock"))
        {
          id v14 = 0;
          goto LABEL_71;
        }
        id v14 = v39;
        int v40 = +[IMAPAccount log];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = [v14 ef_publicDescription];
          LODWORD(buf.version) = 138543362;
          *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v41;
          _os_log_impl(&dword_1A7EFF000, v40, OS_LOG_TYPE_DEFAULT, "Checking out cached connection: %{public}@", (uint8_t *)&buf, 0xCu);
        }
        CFIndex v21 = v38;
      }

LABEL_71:
      ++v38;
    }
    while (v38 < Count && !v14);
    if (!v14) {
      goto LABEL_77;
    }
LABEL_30:
    char v25 = 0;
LABEL_82:
    [(IMAPAccount *)v15 mf_unlock];
    if (!v14) {
      goto LABEL_104;
    }
    if ((a5 & 1) == 0)
    {
      if ((unint64_t)[v14 connectionState] >= 2) {
        goto LABEL_98;
      }
      goto LABEL_92;
    }
    v44 = MFUserAgent();
    int v45 = [v44 isMobileMail];

    if (!v45)
    {
      if ([(IMAPAccount *)v15 connectAndAuthenticate:v14]) {
        goto LABEL_98;
      }
LABEL_92:
      uint64_t v49 = 0;
      goto LABEL_95;
    }
    CFArrayRemoveValueAtIndex(v15->_cachedConnections, v21);
    [(NSRecursiveLock *)v15->_connectionLock unlock];
    BOOL v46 = [(IMAPAccount *)v15 connectAndAuthenticate:v14];
    [(NSRecursiveLock *)v15->_connectionLock lock];
    v47 = v15->_cachedConnections;
    if (!v47)
    {
      buf.version = 0;
      buf.retain = v65;
      buf.release = v64;
      buf.copyDescription = v63;
      buf.equal = 0;
      v47 = CFArrayCreateMutable(0, 0, &buf);
      v15->_CFArrayRef cachedConnections = v47;
    }
    CFArrayAppendValue(v47, v14);
    if ([v14 isCellularConnection])
    {
      BOOL v48 = +[MFNetworkController sharedInstance];
      uint64_t v49 = [v48 isFatPipe];
    }
    else
    {
      uint64_t v49 = 0;
    }
    if ((v49 | !v46) == 1)
    {
LABEL_95:
      if ((a5 & 4) != 0) {
        [v14 mf_unlock];
      }
      [(IMAPAccount *)v15 checkInConnection:v14 destroy:v49];
      goto LABEL_103;
    }
LABEL_98:
    [(IMAPAccount *)v15 _replayMailboxActionsWithConnection:v14];
    if ([v14 isValid])
    {
      [(IMAPAccount *)v15 releaseNetworkAssertion];
    }
    else
    {
      if ((a5 & 4) != 0) {
        [v14 mf_unlock];
      }
      [(IMAPAccount *)v15 checkInConnection:v14];
LABEL_103:

      id v14 = 0;
    }
LABEL_104:
    if (v70)
    {
      BOOL v50 = [v14 selectedMailbox];
      id v51 = [v14 delegate];
      int v52 = 1;
      if (v51 == v16 && v50) {
        int v52 = [v71 isEqualToString:v50] ^ 1;
      }
    }
    else
    {
      int v52 = 0;
    }
    [v14 setDelegate:v16];
    [(NSRecursiveLock *)v15->_connectionLock unlock];

    if (v14)
    {
      if ((a5 & 0x10) != 0) {
        char v53 = v25;
      }
      else {
        char v53 = 1;
      }
      if ((v53 & 1) == 0) {
        [v14 noop];
      }
      if (v52)
      {
        char v54 = (a5 & 2) != 0
            ? [v14 examineMailbox:v71]
            : [v14 selectMailbox:v71 withAccount:v15];
        if ((v54 & 1) == 0)
        {
          if ((a5 & 4) != 0) {
            [v14 mf_unlock];
          }
          if (![v14 isValid])
          {
            [(IMAPAccount *)v15 checkInConnection:v14];

            if (v25)
            {
LABEL_132:
              id v14 = 0;
              break;
            }
            continue;
          }
          __int16 v55 = +[MFActivityMonitor currentMonitor];
          v56 = [v55 error];

          if (v56)
          {
            __int16 v57 = NSString;
            BOOL v58 = MFLookupLocalizedString(@"IMAP_OPEN_FAILED_TITLE_FORMAT", @"Unable to open “%@”", @"Delayed");
            __int16 v59 = [v67 displayName];
            BOOL v60 = objc_msgSend(v57, "stringWithFormat:", v58, v59);
            [v56 setShortDescription:v60];
          }
          if (a6) {
            *a6 = 1;
          }

LABEL_131:
          goto LABEL_132;
        }
      }
    }
    break;
  }

  return v14;
}

- (void)checkInConnection:(id)a3
{
}

- (void)checkInConnection:(id)a3 destroy:(BOOL)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    [(NSRecursiveLock *)self->_connectionLock lock];
    if (!objc_msgSend(v6, "mf_tryLock"))
    {
LABEL_39:
      [(NSRecursiveLock *)self->_connectionLock unlock];
      goto LABEL_40;
    }
    uint64_t v7 = +[IMAPAccount log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CFArrayCallBacks buf = 138543362;
      id v22 = v6;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Checking in connection and clearing delegate: %{public}@", buf, 0xCu);
    }

    [v6 setDelegate:0];
    uint64_t v8 = [v6 connectionState];
    objc_msgSend(v6, "mf_unlock");
    [(IMAPAccount *)self mf_lock];
    if ([v6 gotBadResponse]) {
      [(IMAPAccount *)self _setCapabilities:0];
    }
    if (a4)
    {
      char v9 = 1;
      char v10 = 1;
LABEL_31:
      [(IMAPAccount *)self mf_unlock];
      if (v10)
      {
        [v6 logout];
        [v6 disconnectAndNotifyDelegate:0];
      }
      if (self->_cachedConnections && (v9 & 1) != 0)
      {
        [(IMAPAccount *)self mf_lock];
        for (CFIndex i = CFArrayGetCount(self->_cachedConnections); ; --i)
        {
          v26.location = 0;
          v26.length = i;
          CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(self->_cachedConnections, v26, v6);
          if (FirstIndexOfValue == -1) {
            break;
          }
          CFArrayRemoveValueAtIndex(self->_cachedConnections, FirstIndexOfValue);
        }
        [(IMAPAccount *)self mf_unlock];
      }
      goto LABEL_39;
    }
    if (!self->_cachedConnections)
    {
      char v9 = 0;
      char v10 = 0;
      goto LABEL_31;
    }
    if ((unint64_t)(v8 - 2) < 2)
    {
      CFIndex v20 = [v6 selectedMailbox];
      CFIndex Count = CFArrayGetCount(self->_cachedConnections);
      if (Count < 1)
      {
        char v9 = 0;
        char v10 = 0;
      }
      else
      {
        char v10 = 0;
        char v9 = 0;
        uint64_t v12 = 1;
        do
        {
          CFArrayGetValueAtIndex(self->_cachedConnections, v12 - 1);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          id v14 = v13;
          if (v13 != v6)
          {
            id v15 = [v13 delegate];
            BOOL v16 = v15 == 0;

            if (v16)
            {
              char v9 = 1;
              char v10 = 1;
            }
          }

          if (v12 >= Count) {
            break;
          }
          ++v12;
        }
        while ((v9 & 1) == 0);
      }
      if ([(MailAccount *)self _shouldLogDeleteActivity])
      {
        int v17 = +[IMAPAccount log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CFArrayCallBacks buf = 138412546;
          id v22 = v20;
          __int16 v23 = 2112;
          id v24 = v6;
          _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEFAULT, "#Warning Unselected connection checked back in, mailbox: %@, connection: %@", buf, 0x16u);
        }
      }
      goto LABEL_31;
    }
    if (v8)
    {
      char v9 = 0;
      char v10 = 0;
      if (v8 != 1) {
        goto LABEL_31;
      }
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
    }
    char v9 = 1;
    goto LABEL_31;
  }
LABEL_40:
}

- (void)checkInConnectionsForStore:(id)a3
{
  id v13 = a3;
  if (v13 && self->_cachedConnections)
  {
    [(NSRecursiveLock *)self->_connectionLock lock];
    [(IMAPAccount *)self mf_lock];
    CFArrayRef cachedConnections = self->_cachedConnections;
    if (cachedConnections && (CFIndex Count = CFArrayGetCount(cachedConnections), Count >= 1))
    {
      CFIndex v6 = 0;
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = CFArrayGetValueAtIndex(self->_cachedConnections, v6);
        id v9 = [v8 delegate];

        if (v9 == v13)
        {
          if (!v7)
          {
            uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
          }
          [v7 addObject:v8];
        }

        ++v6;
      }
      while (Count != v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
    [(IMAPAccount *)self mf_unlock];
    uint64_t v10 = [v7 count];
    if (v10 >= 1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        uint64_t v12 = [v7 objectAtIndex:i];
        [(IMAPAccount *)self checkInConnection:v12];
      }
    }
    [(NSRecursiveLock *)self->_connectionLock unlock];
  }
}

- (BOOL)verifyESearchSupportWithBlock:(id)a3
{
  id v4 = (uint64_t (**)(void))a3;
  [(NSLock *)self->_eSearchSupportedLock lock];
  eSearchSupported = self->_eSearchSupported;
  if (eSearchSupported
    || ([(MFAccount *)self accountPropertyForKey:@"VerifiedESEARCH"],
        CFIndex v6 = (NSNumber *)objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = self->_eSearchSupported,
        self->_eSearchSupported = v6,
        v7,
        (eSearchSupported = self->_eSearchSupported) != 0))
  {
    int v8 = 0;
    char v9 = [(NSNumber *)eSearchSupported BOOLValue];
  }
  else
  {
    uint64_t v11 = v4[2](v4);
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v11];
    id v13 = self->_eSearchSupported;
    self->_eSearchSupported = v12;

    if (v11)
    {
      int v8 = 1;
      [(MFAccount *)self setAccountProperty:self->_eSearchSupported forKey:@"VerifiedESEARCH"];
      char v9 = 1;
    }
    else
    {
      AnalyticsSendEventLazy();
      char v9 = 0;
      int v8 = 0;
    }
  }
  [(NSLock *)self->_eSearchSupportedLock unlock];
  if (v8) {
    [(MFAccount *)self savePersistentAccount];
  }

  return v9;
}

id __45__IMAPAccount_verifyESearchSupportWithBlock___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"hostname";
  os_log_t v1 = [*(id *)(a1 + 32) hostname];
  v5[0] = v1;
  char v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)unselectMailbox:(id)a3
{
  id v14 = a3;
  if (v14 && self->_cachedConnections)
  {
    [(NSRecursiveLock *)self->_connectionLock lock];
    [(IMAPAccount *)self mf_lock];
    CFArrayRef cachedConnections = self->_cachedConnections;
    if (cachedConnections && (CFIndex Count = CFArrayGetCount(cachedConnections), Count >= 1))
    {
      CFIndex v6 = 0;
      CFIndex v7 = 0;
      do
      {
        int v8 = CFArrayGetValueAtIndex(self->_cachedConnections, v7);
        char v9 = [v8 selectedMailbox];
        uint64_t v10 = v9;
        if (v9 && [v9 isEqualToString:v14])
        {
          if (!v6)
          {
            CFIndex v6 = [MEMORY[0x1E4F1CA48] array];
          }
          [v6 addObject:v8];
          CFArrayRemoveValueAtIndex(self->_cachedConnections, v7);
          --Count;
        }
        else
        {
          ++v7;
        }
      }
      while (v7 < Count);
    }
    else
    {
      CFIndex v6 = 0;
    }
    [(IMAPAccount *)self mf_unlock];
    uint64_t v11 = [v6 count];
    if (v11 >= 1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        id v13 = [v6 objectAtIndex:i];
        if ([v13 isValid]) {
          [v13 logout];
        }
        [v13 disconnectAndNotifyDelegate:1];
      }
    }
    [(NSRecursiveLock *)self->_connectionLock unlock];
  }
}

- (void)filterMailboxList:(id)a3 forMailbox:(id)a4 options:(int64_t)a5
{
  id v9 = a3;
  uint64_t v5 = [v9 count];
  if (v5)
  {
    uint64_t v6 = v5 - 1;
    do
    {
      CFIndex v7 = [v9 objectAtIndex:v6];
      int v8 = [v7 objectForKey:@"MailboxName"];
      if ([v8 isEqualToString:@"Apple Mail To Do"]) {
        [v9 removeObjectAtIndex:v6];
      }

      --v6;
    }
    while (v6 != -1);
  }
}

- (void)_invokeBlock:(id)a3
{
}

- (void)systemWillSleep
{
  BOOL v3 = [(IMAPAccount *)self taskManager];

  if (!v3)
  {
    [(IMAPAccount *)self releaseAllConnections];
  }
}

uint64_t __96__IMAPAccount__releaseAllConnectionsAndCallSuper_synchronously_edgeForcedOnly_saveOfflineCache___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAllConnectionsAndCallSuper:*(unsigned __int8 *)(a1 + 40) synchronously:1 edgeForcedOnly:*(unsigned __int8 *)(a1 + 41) saveOfflineCache:*(unsigned __int8 *)(a1 + 42)];
}

- (void)_releaseAllConnectionsAndCallSuper:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29060] isMainThread] ^ 1;
  [(IMAPAccount *)self _releaseAllConnectionsAndCallSuper:v3 synchronously:v5 edgeForcedOnly:0 saveOfflineCache:0];
}

- (void)releaseAllForcedConnections
{
  -[IMAPAccount _releaseAllConnectionsAndCallSuper:synchronously:edgeForcedOnly:saveOfflineCache:](self, "_releaseAllConnectionsAndCallSuper:synchronously:edgeForcedOnly:saveOfflineCache:", 0, [MEMORY[0x1E4F29060] isMainThread] ^ 1, 1, 1);
  v3.receiver = self;
  v3.super_class = (Class)IMAPAccount;
  [(MailAccount *)&v3 releaseAllForcedConnections];
}

- (void)releaseAllConnectionsSynchronously
{
}

- (void)acquireNetworkAssertion
{
  [(IMAPAccount *)self mf_lock];
  if (!self->_packetContextAssertion)
  {
    objc_super v3 = NSString;
    id v4 = [(MailAccount *)self displayName];
    uint64_t v5 = [(MFAccount *)self uniqueID];
    uint64_t v6 = [v3 stringWithFormat:@"IMAP account %@ (%@)", v4, v5];

    CFIndex v7 = +[MFNetworkController networkAssertionWithIdentifier:v6];
    id packetContextAssertion = self->_packetContextAssertion;
    self->_id packetContextAssertion = v7;

    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = +[MFNetworkController sharedInstance];
    [v9 addObserver:self selector:sel_networkChanged name:@"NetworkConfigurationDidChangeNotification" object:v10];
  }
  [(IMAPAccount *)self mf_unlock];
}

- (void)releaseNetworkAssertion
{
  [(IMAPAccount *)self mf_lock];
  unlockedReleaseNetworkAssertion(self);
  [(IMAPAccount *)self mf_unlock];
}

- (BOOL)connection:(id)a3 shouldHandleUntaggedResponse:(id)a4 forCommand:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  int v9 = [v7 isAlertResponse];
  if (v9)
  {
    uint64_t v10 = [v7 userString];
    [(IMAPAccount *)self handleAlertResponse:v10];
LABEL_3:

    goto LABEL_14;
  }
  if ([v8 command] == 8 && objc_msgSend(v7, "responseType") == 13)
  {
    uint64_t v11 = [v7 mailboxName];
    uint64_t v10 = [(IMAPAccount *)self mailboxUidForName:v11];

    uint64_t v12 = [v7 statusEntries];
    id v13 = [v10 URLString];

    if (v13)
    {
      id v14 = [v12 objectForKey:0x1EFF1ECE8];
      if (v14)
      {
        id v15 = [v10 userInfoObjectForKey:0x1EFF1ECE8];
        int v16 = [v15 intValue];

        if (v16 != [v14 unsignedIntValue])
        {
          int v17 = EFStringWithInt();
          [v10 setUserInfoObject:v17 forKey:0x1EFF1ECE8];
        }
      }
      objc_super v18 = [v12 objectForKeyedSubscript:0x1EFF1ED28];

      if (v18) {
        objc_msgSend(v10, "updateMostRecentStatusCount:", objc_msgSend(v18, "unsignedIntegerValue"));
      }
    }
    goto LABEL_3;
  }
LABEL_14:

  return v9 ^ 1;
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4 forCommand:(id)a5
{
  id v7 = a4;
  if ([v7 isAlertResponse])
  {
    uint64_t v6 = [v7 userString];
    [(IMAPAccount *)self handleAlertResponse:v6];
  }
}

- (BOOL)canGoOffline
{
  return 1;
}

- (BOOL)isOffline
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isOffline);
  return v2 & 1;
}

- (void)setIsOffline:(BOOL)a3
{
  BOOL v3 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (setIsOffline__sOnceToken != -1) {
      dispatch_once(&setIsOffline__sOnceToken, &__block_literal_global_7);
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __28__IMAPAccount_setIsOffline___block_invoke_2;
    v5[3] = &unk_1E5D3B5E8;
    v5[4] = self;
    BOOL v6 = v3;
    dispatch_async((dispatch_queue_t)setIsOffline__sOfflineStatusChangeQueue, v5);
  }
  else if ([(IMAPAccount *)self isOffline] != v3)
  {
    if (v3) {
      [(IMAPAccount *)self _releaseAllConnectionsAndCallSuper:0];
    }
    atomic_store(v3, (unsigned __int8 *)&self->_isOffline);
  }
}

void __28__IMAPAccount_setIsOffline___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mail.imap.offlinestatuschange", 0);
  os_log_t v1 = (void *)setIsOffline__sOfflineStatusChangeQueue;
  setIsOffline__sOfflineStatusChangeQueue = (uint64_t)v0;
}

uint64_t __28__IMAPAccount_setIsOffline___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsOffline:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setSeparatorChar:(id)a3 serverNamespace:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  [(IMAPAccount *)self mf_lock];
  if (!v15 || self->_separatorChar && (objc_msgSend(v15, "isEqualToString:") & 1) != 0)
  {
    int v7 = 0;
    if (!v6) {
      goto LABEL_12;
    }
  }
  else
  {
    id v8 = (NSString *)[v15 copy];
    separatorChar = self->_separatorChar;
    self->_separatorChar = v8;

    [(MailAccount *)self _incrementCacheDirtyCount];
    int v7 = 1;
    if (!v6) {
      goto LABEL_12;
    }
  }
  if (self->_separatorChar && objc_msgSend(v6, "hasSuffix:"))
  {
    uint64_t v10 = objc_msgSend(v6, "substringWithRange:", 0, objc_msgSend(v6, "length") - -[NSString length](self->_separatorChar, "length"));

    id v6 = (id)v10;
  }
  if (([v6 isEqualToString:self->_serverNamespace] & 1) == 0)
  {
    uint64_t v11 = (NSString *)[v6 copy];
    serverNamespace = self->_serverNamespace;
    self->_serverNamespace = v11;

    [(MailAccount *)self _incrementCacheDirtyCount];
    int v7 = 1;
  }
LABEL_12:
  [(IMAPAccount *)self mf_unlock];
  if (v7)
  {
    id v13 = [(MailAccount *)self allMailboxUids];
    [v13 makeObjectsPerformSelector:sel_flushCriteria];
  }
  id v14 = [(IMAPAccount *)self serverPathPrefixAccountValue];
  if (v14) {
    [(IMAPAccount *)self setServerPathPrefix:v14];
  }
}

- (void)_updateSeparatorAndNamespaceWithConnection:(id)a3
{
  id v6 = a3;
  [(NSRecursiveLock *)self->_connectionLock lock];
  if ((*((unsigned char *)self + 388) & 0x10) == 0)
  {
    id v4 = [v6 separatorChar];
    uint64_t v5 = [v6 serverPathPrefix];
    [(IMAPAccount *)self setSeparatorChar:v4 serverNamespace:v5];
    *((unsigned char *)self + 388) |= 0x10u;
  }
  [(NSRecursiveLock *)self->_connectionLock unlock];
}

- (id)_fetchAndSetSeparatorChar
{
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    goto LABEL_2;
  }
  id v4 = [(IMAPAccount *)self taskManager];

  if (v4)
  {
    uint64_t v5 = [(IMAPAccount *)self taskManager];
    BOOL v3 = [v5 fetchSeparatorChar];

    if (v3) {
      [(IMAPAccount *)self setSeparatorChar:v3 serverNamespace:0];
    }
  }
  else
  {
    if ([(IMAPAccount *)self isOffline])
    {
LABEL_2:
      BOOL v3 = 0;
      goto LABEL_13;
    }
    id v6 = [(IMAPAccount *)self connectionForMailbox:0 delegate:self options:1 failedToSelectMailbox:0];
    int v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 separatorChar];
      if (v8) {
        [(IMAPAccount *)self setSeparatorChar:v8 serverNamespace:0];
      }
      [(IMAPAccount *)self checkInConnection:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }

    BOOL v3 = (void *)v8;
  }
LABEL_13:
  return v3;
}

- (BOOL)_hasCachedSeparatorChar
{
  [(IMAPAccount *)self mf_lock];
  separatorChar = self->_separatorChar;
  if (separatorChar) {
    BOOL v4 = [(NSString *)separatorChar length] != 0;
  }
  else {
    BOOL v4 = 0;
  }
  [(IMAPAccount *)self mf_unlock];
  return v4;
}

- (id)lastKnownCapabilities
{
  [(MailAccount *)self rootMailbox];

  [(IMAPAccount *)self mf_lock];
  BOOL v3 = self->_lastKnownCapabilities;
  [(IMAPAccount *)self mf_unlock];
  return v3;
}

- (void)_setCapabilities:(id)a3
{
  unint64_t v8 = (unint64_t)a3;
  [(IMAPAccount *)self mf_lock];
  lastKnownCapabilities = self->_lastKnownCapabilities;
  if (v8 | (unint64_t)lastKnownCapabilities)
  {
    id v6 = lastKnownCapabilities;
    objc_storeStrong((id *)&self->_lastKnownCapabilities, a3);
    [(MailAccount *)self _incrementCacheDirtyCount];
  }
  else
  {
    id v6 = 0;
  }
  [(IMAPAccount *)self mf_unlock];
  if (v8 | (unint64_t)v6) {
    uint64_t v7 = [(id)v8 isEqualToArray:v6] ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }
  [(MailAccount *)self _writeMailboxCacheWithPrejudice:v7];
}

- (id)fetchLimits
{
  unsigned __int8 v2 = +[MFNetworkController sharedInstance];
  int v3 = [v2 isFatPipe];
  BOOL v4 = +[MFPowerController sharedInstance];
  int v5 = [v4 isPluggedIn];

  if (v3 & v5)
  {
    uint64_t v6 = 5242880;
    uint64_t v7 = 209715200;
    uint64_t v8 = 204472320;
  }
  else
  {
    int v9 = [v2 is3GConnection];
    int v10 = v3 | [v2 is4GConnection];
    uint64_t v11 = 0x4000;
    if (v9) {
      uint64_t v11 = 0x80000;
    }
    uint64_t v12 = 4096;
    if (v9) {
      uint64_t v12 = 0x10000;
    }
    if (v10) {
      uint64_t v8 = 0x200000;
    }
    else {
      uint64_t v8 = v11;
    }
    if (v10) {
      uint64_t v6 = 0x40000;
    }
    else {
      uint64_t v6 = v12;
    }
    uint64_t v7 = v8 | v6;
  }
  id v13 = objc_alloc_init(MFFetchLimits);
  [(MFFetchLimits *)v13 setFetchMinBytes:v8];
  [(MFFetchLimits *)v13 setMinBytesLeft:v6];
  [(MFFetchLimits *)v13 setFetchMaxBytes:v7];

  return v13;
}

- (BOOL)xListSupportedOnConnection:(id)a3
{
  return 0;
}

- (id)_listingForMailboxUid:(id)a3 listAllChildren:(BOOL)a4 onlySubscribed:(BOOL)a5 statusDataItems:(id)a6 withConnection:(id)a7 statusEntriesByMailbox:(id *)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v14 = (MFMailboxUid *)a3;
  id v44 = a6;
  id v15 = a7;
  if (v15
    || ([(IMAPAccount *)self connectionForMailbox:0 delegate:self options:9 failedToSelectMailbox:0], (id v15 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v43 = [(IMAPAccount *)self serverPathPrefixAccountValue];
    if ([v43 length]) {
      BOOL v16 = [(NSString *)self->_serverNamespace isEqualToString:v43];
    }
    else {
      BOOL v16 = 1;
    }
    if (self->super._rootMailboxUid == v14 && v16)
    {
      int v17 = &stru_1EFF11268;
    }
    else if (self->super._inboxMailboxUid == v14 {
           && ([(IMAPAccount *)self serverPathPrefix],
    }
               objc_super v18 = objc_claimAutoreleasedReturnValue(),
               int v19 = [v18 isEqualToString:@"INBOX"],
               v18,
               v19))
    {
      CFIndex v20 = NSString;
      CFIndex v21 = [(IMAPAccount *)self separatorChar];
      int v17 = [v20 stringWithFormat:@"INBOX%@INBOX", v21];
    }
    else
    {
      int v17 = [(IMAPAccount *)self _nameForMailboxUid:v14];
    }
    if (v12) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = 1;
    }
    if (!v11
      || ([v15 subscribedListingForMailbox:v17 options:v22],
          (__int16 v23 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if ([v15 supportsCapability:23]) {
        BOOL v24 = ([v15 supportsCapability:21] & 1) != 0
      }
           || [(IMAPAccount *)self xListSupportedOnConnection:v15];
      else {
        BOOL v24 = 0;
      }
      uint64_t v25 = [v15 listingForMailbox:v17 options:v22 getSpecialUse:v24 statusDataItems:v44 statusEntriesByMailbox:a8];
      CFRange v26 = v25;
      if (self->super._rootMailboxUid == v14 && (self->_serverNamespace ? (BOOL v27 = v16) : (BOOL v27 = 0), v27))
      {
        v42 = (void *)[v25 mutableCopy];
        CFIndex v28 = _mailboxDictionaryWithName(v26, self->_serverNamespace, 0);
        [v42 removeObject:v28];
        uint64_t v29 = [v28 objectForKeyedSubscript:@"MailboxChildren"];
        uint64_t v30 = (void *)v29;
        v31 = (void *)MEMORY[0x1E4F1CBF0];
        if (v29) {
          v31 = (void *)v29;
        }
        id v32 = v31;

        v41 = v32;
        __int16 v23 = [MEMORY[0x1E4F1CA48] arrayWithArray:v32];
        [v23 addObjectsFromArray:v42];
        BOOL v33 = [(NSString *)self->_serverNamespace isEqualToString:@"INBOX"];
        if (v28) {
          BOOL v34 = v33;
        }
        else {
          BOOL v34 = 0;
        }
        if (v34)
        {
          unint64_t v45 = 0xAAAAAAAAAAAAAAAALL;
          BOOL v35 = _mailboxDictionaryWithName(v23, self->_serverNamespace, &v45);
          v39 = v35;
          int v40 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v28];
          if (v35)
          {
            uint64_t v36 = [v35 objectForKey:@"MailboxChildren"];
            [v40 setObject:v36 forKey:@"MailboxChildren"];

            [v23 replaceObjectAtIndex:v45 withObject:v40];
          }
          else
          {
            unint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionary];
            [v40 setObject:v38 forKey:@"MailboxChildren"];

            objc_msgSend(v23, "ef_insertObject:usingSortFunction:context:allowDuplicates:", v40, _MFCompareMailboxDictionariesByName, 0, 1);
          }
        }
      }
      else
      {
        __int16 v23 = v25;
      }
    }
    [(IMAPAccount *)self checkInConnection:v15];
  }
  else
  {
    __int16 v23 = 0;
  }

  return v23;
}

- (id)_listingForMailboxUid:(id)a3 listAllChildren:(BOOL)a4 onlySubscribed:(BOOL)a5
{
  int v5 = [(IMAPAccount *)self _listingForMailboxUid:a3 listAllChildren:a4 onlySubscribed:a5 statusDataItems:0 withConnection:0 statusEntriesByMailbox:0];
  return v5;
}

- (id)_listingForMailboxUid:(id)a3 listAllChildren:(BOOL)a4
{
  BOOL v4 = [(IMAPAccount *)self _listingForMailboxUid:a3 listAllChildren:a4 onlySubscribed:0];
  return v4;
}

- (id)_newMailboxWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 dictionary:(id)a6 withCreationOption:(int64_t)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v48 = a6;
  if (a7) {
    __assert_rtn("-[IMAPAccount _newMailboxWithParent:name:attributes:dictionary:withCreationOption:]", "IMAPAccount.m", 1684, "creationOption == MailboxCreationOptionDefault");
  }
  id v14 = [(MailAccount *)self rootMailbox];
  if (![v12 isEqual:v14] || (id v15 = v13) == 0)
  {

LABEL_7:
    [(NSRecursiveLock *)self->_connectionLock lock];
    CFIndex v20 = [v12 accountRelativePath];
    int v19 = [v20 stringByAppendingPathComponent:v13];

    id v18 = [(IMAPAccount *)self mailboxUidForRelativePath:v19 create:0];
    if (v18)
    {
LABEL_31:
      [(NSRecursiveLock *)self->_connectionLock unlock];
      BOOL v16 = v13;
      goto LABEL_32;
    }
    v47 = v13;
    CFIndex v21 = [(IMAPAccount *)self _nameForMailboxUid:v12];
    uint64_t v22 = (void *)[v21 mutableCopy];

    __int16 v23 = [v13 pathComponents];
    unsigned int v43 = a5;
    BOOL v24 = [(IMAPAccount *)self separatorChar];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v25 = v23;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v53;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v53 != v27) {
            objc_enumerationMutation(v25);
          }
          uint64_t v29 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          if ([v22 length])
          {
            if (!v24)
            {

              int v38 = 0;
              goto LABEL_23;
            }
            [v22 appendString:v24];
          }
          [v22 appendString:v29];
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v56 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    uint64_t v30 = [(IMAPAccount *)self taskManager];
    BOOL v31 = v30 == 0;

    if (!v31)
    {
      id v32 = [(IMAPAccount *)self taskManager];
      char v33 = [v32 createMailbox:v22];

      v51.receiver = self;
      v51.super_class = (Class)IMAPAccount;
      id v18 = [(MailAccount *)&v51 _newMailboxWithParent:v12 name:v47 attributes:v43 dictionary:v48 withCreationOption:0];
      if (v33)
      {
LABEL_30:

        id v13 = v47;
        goto LABEL_31;
      }
LABEL_20:
      unint64_t v45 = objc_msgSend(MEMORY[0x1E4F60B00], "actionWithID:toCreateMailbox:mailboxName:", 0, objc_msgSend(v18, "databaseID"), v22);
      BOOL v34 = [(MailAccount *)self library];
      BOOL v35 = [v34 persistence];
      id v44 = [v35 mailboxActionPersistence];
      uint64_t v36 = [(MFAccount *)self identifier];
      [v44 saveMailboxActionForAccountID:v36 action:v45];

      CFIndex v37 = [(IMAPAccount *)self taskManager];
      [v37 localMailboxesDidChange];

      goto LABEL_30;
    }
    int v38 = 1;
LABEL_23:
    BOOL v46 = [(IMAPAccount *)self connectionForMailbox:0 delegate:self options:9 failedToSelectMailbox:0];
    id v18 = [(IMAPAccount *)self mailboxUidForRelativePath:v19 create:0];
    if (v18)
    {
      if (v46) {
        -[IMAPAccount checkInConnection:](self, "checkInConnection:");
      }
    }
    else
    {
      uint64_t v39 = objc_msgSend(v47, "mf_fileSystemString");

      v47 = (void *)v39;
      if (v38)
      {
        if (v46)
        {
          int v40 = [v46 createMailbox:v22];
          [(IMAPAccount *)self checkInConnection:v46];
        }
        else
        {
          int v40 = 1;
        }
        v50.receiver = self;
        v50.super_class = (Class)IMAPAccount;
        id v18 = [(MailAccount *)&v50 _newMailboxWithParent:v12 name:v39 attributes:v43 dictionary:v48 withCreationOption:0];
        if (v40)
        {
          v49.receiver = self;
          v49.super_class = (Class)IMAPAccount;
          id v42 = [(MailAccount *)&v49 _newMailboxWithParent:v12 name:v39 attributes:v43 dictionary:v48 withCreationOption:0];

          id v18 = v42;
          if (v46) {
            goto LABEL_30;
          }
        }
        else
        {

          if (v46) {
            goto LABEL_30;
          }
        }
        goto LABEL_20;
      }
    }

    goto LABEL_30;
  }
  BOOL v16 = v15;
  uint64_t v17 = [v15 caseInsensitiveCompare:@"INBOX"];

  if (v17) {
    goto LABEL_7;
  }
  id v18 = [(MailAccount *)self _copyMailboxWithParent:v12 name:v16 attributes:a5 dictionary:v48];
  int v19 = 0;
LABEL_32:

  return v18;
}

- (BOOL)_deleteMailbox:(id)a3 reflectToServer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IMAPAccount;
  BOOL v7 = [(MailAccount *)&v25 _deleteMailbox:v6 reflectToServer:v4];
  if (v7 && v4)
  {
    uint64_t v8 = [(IMAPAccount *)self _nameForMailboxUid:v6];
    [(IMAPAccount *)self unselectMailbox:v8];
    int v9 = [(IMAPAccount *)self taskManager];

    if (v9)
    {
      int v10 = [(IMAPAccount *)self taskManager];
      char v11 = [v10 deleteMailbox:v8];

      if (v11)
      {
        id v12 = 0;
LABEL_7:
        LOBYTE(v7) = 1;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      id v13 = [(IMAPAccount *)self connectionForMailbox:0 delegate:self options:1 failedToSelectMailbox:0];
      id v12 = v13;
      if (v13)
      {
        char v14 = [v13 deleteMailbox:v8];
        [(IMAPAccount *)self checkInConnection:v12];
        if (v14) {
          goto LABEL_7;
        }
        if ([v6 isStore])
        {
          LOBYTE(v7) = 0;
          goto LABEL_11;
        }
        uint64_t v17 = [v6 parent];
        if (!v17)
        {
          LOBYTE(v7) = 0;
          goto LABEL_10;
        }
        id v18 = +[MFActivityMonitor currentMonitor];
        CFIndex v20 = [v18 error];
        uint64_t v22 = [(IMAPAccount *)self _listingForMailboxUid:v17 listAllChildren:0];
        if ([v22 count]
          && ([v6 name],
              __int16 v23 = objc_claimAutoreleasedReturnValue(),
              uint64_t v24 = objc_msgSend(v22, "mf_indexOfMailboxDictionaryWithName:", v23),
              v23,
              v24 != 0x7FFFFFFFFFFFFFFFLL))
        {
          [v18 setError:v20];
          LOBYTE(v7) = 0;
        }
        else
        {
          [v18 setError:0];
          LOBYTE(v7) = 1;
        }

LABEL_9:
LABEL_10:

        goto LABEL_11;
      }
    }
    id v15 = [(MailAccount *)self library];
    BOOL v16 = [v15 persistence];
    uint64_t v17 = [v16 mailboxActionPersistence];

    id v18 = objc_msgSend(MEMORY[0x1E4F60B00], "actionWithID:toDeleteMailbox:mailboxName:", 0, objc_msgSend(v6, "databaseID"), v8);
    int v19 = [(MFAccount *)self identifier];
    [v17 saveMailboxActionForAccountID:v19 action:v18];

    CFIndex v20 = [(IMAPAccount *)self taskManager];
    [v20 localMailboxesDidChange];
    id v12 = 0;
    LOBYTE(v7) = 1;
    goto LABEL_9;
  }
LABEL_12:

  return v7;
}

- (void)_setSpecialMailbox:(id)a3 forType:(int64_t)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)IMAPAccount;
  [(MailAccount *)&v7 _setSpecialMailbox:v6 forType:a4];
  if (v6 && [v6 isValid]) {
    [(IMAPAccount *)self setStoreMailboxType:a4 onServer:1];
  }
}

- (void)_renameLocalSpecialMailboxesToName:(id)a3
{
  id v18 = a3;
  if ([(IMAPAccount *)self storeMailboxTypeOnServer:5])
  {
    BOOL v4 = 0;
    int v5 = 0;
  }
  else
  {
    id v6 = [(MailAccount *)self mailboxUidOfType:5 createIfNeeded:0];
    uint64_t v7 = [(MailAccount *)self _localMailboxNameForType:5 usingDisplayName:v18];
    uint64_t v8 = [v6 account];
    int v9 = [v6 parent];
    [v8 renameMailbox:v6 newName:v7 parent:v9];

    BOOL v4 = (void *)v7;
    int v5 = v6;
  }
  if (![(IMAPAccount *)self storeMailboxTypeOnServer:4])
  {
    int v10 = [(MailAccount *)self mailboxUidOfType:4 createIfNeeded:0];

    uint64_t v11 = [(MailAccount *)self _localMailboxNameForType:4 usingDisplayName:v18];

    id v12 = [v10 account];
    id v13 = [v10 parent];
    [v12 renameMailbox:v10 newName:v11 parent:v13];

    BOOL v4 = (void *)v11;
    int v5 = v10;
  }
  if ([(IMAPAccount *)self storeMailboxTypeOnServer:3])
  {
    char v14 = v4;
    id v15 = v5;
  }
  else
  {
    id v15 = [(MailAccount *)self mailboxUidOfType:3 createIfNeeded:0];

    char v14 = [(MailAccount *)self _localMailboxNameForType:3 usingDisplayName:v18];

    BOOL v16 = [v15 account];
    uint64_t v17 = [v15 parent];
    [v16 renameMailbox:v15 newName:v14 parent:v17];
  }
}

- (id)allMailMailboxUid
{
  unsigned __int8 v2 = [(MailAccount *)self rootMailbox];
  int v3 = [v2 descendantWithExtraAttribute:@"\\All"];

  return v3;
}

- (BOOL)isSpecialMailbox:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMAPAccount;
  if ([(MailAccount *)&v8 isSpecialMailbox:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(IMAPAccount *)self specialUseAttributesForMailbox:v4];
    BOOL v5 = [v6 count] != 0;
  }
  return v5;
}

- (id)specialUseAttributesForMailbox:(id)a3
{
  id v3 = a3;
  if (specialUseAttributesForMailbox__onceToken != -1) {
    dispatch_once(&specialUseAttributesForMailbox__onceToken, &__block_literal_global_235);
  }
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  BOOL v5 = [v3 extraAttributes];
  id v6 = [v4 setWithArray:v5];

  [v6 intersectSet:specialUseAttributesForMailbox__knownSpecialAttributes];
  return v6;
}

void __46__IMAPAccount_specialUseAttributesForMailbox___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"\\All", @"\\Junk", @"\\Sent", @"\\Trash", @"\\Drafts", @"\\Archive", @"\\Flagged", 0);
  os_log_t v1 = (void *)specialUseAttributesForMailbox__knownSpecialAttributes;
  specialUseAttributesForMailbox__knownSpecialAttributes = v0;
}

- (BOOL)getMailboxListWithConnection:(id)a3 statusDataItems:(id)a4 statusEntriesByMailbox:(id *)a5
{
  id v6 = [(IMAPAccount *)self _listingForMailboxUid:self->super._rootMailboxUid listAllChildren:1 onlySubscribed:0 statusDataItems:a4 withConnection:a3 statusEntriesByMailbox:a5];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"AccountMailboxListingWillFetch" object:self userInfo:0];

    [(IMAPAccount *)self mf_lock];
    LODWORD(v7) = [(MailAccount *)self _loadMailboxListingIntoCache:0 attributes:0 children:v6 parent:self->super._rootMailboxUid];
    [(IMAPAccount *)self mf_unlock];
    if (v7)
    {
      [(IMAPAccount *)self _mailboxListingChanged];
      [(MailAccount *)self _incrementCacheDirtyCount];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__IMAPAccount_getMailboxListWithConnection_statusDataItems_statusEntriesByMailbox___block_invoke;
    v9[3] = &unk_1E5D3B5C0;
    v9[4] = self;
    [(MailAccount *)self _writeMailboxCacheWithPrejudice:1 completionHandler:v9];
  }
  [(MailAccount *)self resetSpecialMailboxes];

  return v6 != 0;
}

void __83__IMAPAccount_getMailboxListWithConnection_statusDataItems_statusEntriesByMailbox___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"AccountMailboxListingDidFetch" object:*(void *)(a1 + 32) userInfo:0];
}

- (void)throttledGetMailboxListWithConnection:(id)a3
{
  id v4 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v6 = MFUserAgent();
  int v7 = [v6 isForeground];

  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_fetchedMailboxList);
  if ((v8 & 1) == 0 || v7 && Current - self->_timeLastFetchedMailboxList > 300.0)
  {
    self->_timeLastFetchedMailboxList = Current;
    atomic_store(1u, (unsigned __int8 *)&self->_fetchedMailboxList);
    int v9 = +[MFActivityMonitor currentMonitor];
    int v10 = [(MailAccount *)self rootMailbox];
    [v9 setMailbox:v10];

    uint64_t v11 = MFLookupLocalizedString(@"DISABLED_STATUS", @"Checking for Mail…", @"Delayed");
    [v9 setDisplayName:v11];

    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", 0x1EFF1ED28, 0);
    v28[0] = 0;
    BOOL v13 = [(IMAPAccount *)self getMailboxListWithConnection:v4 statusDataItems:v12 statusEntriesByMailbox:v28];
    id v14 = v28[0];
    id v15 = v14;
    if (v13)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke;
      v27[3] = &unk_1E5D3B7D8;
      v27[4] = self;
      [v14 enumerateKeysAndObjectsUsingBlock:v27];
      if (!v15)
      {
        id v16 = v4;
        id v17 = v16;
        if (!v16)
        {
          id v17 = [(IMAPAccount *)self connectionForMailbox:0 delegate:self options:9 failedToSelectMailbox:0];
        }
        id v18 = [(MailAccount *)self allMailboxUids];
        int v19 = objc_msgSend(v18, "ef_filter:", &__block_literal_global_247);

        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke_3;
        v26[3] = &unk_1E5D3B820;
        v26[4] = self;
        CFIndex v20 = objc_msgSend(v19, "ef_compactMap:", v26);
        [v17 fetchStatusForMailboxes:v20 args:v12];
        if (v17 != v16) {
          [(IMAPAccount *)self checkInConnection:v17];
        }
      }
    }
    else
    {
      atomic_store(0, (unsigned __int8 *)&self->_fetchedMailboxList);
    }
    CFIndex v21 = [MEMORY[0x1E4F60F28] globalAsyncScheduler];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke_4;
    v24[3] = &unk_1E5D3B5C0;
    id v22 = v9;
    id v25 = v22;
    id v23 = (id)[v21 afterDelay:v24 performBlock:1.0];
  }
}

void __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  BOOL v5 = [*(id *)(a1 + 32) mailboxUidForName:a2];
  id v6 = [v5 URLString];
  if (v6)
  {
    BOOL v7 = +[MFMailboxUid isDraftsMailboxType:](MFMailboxUid, "isDraftsMailboxType:", [v5 mailboxType]);

    if (!v7)
    {
      unsigned __int8 v8 = [v10 objectForKeyedSubscript:0x1EFF1ED28];
      int v9 = v8;
      if (v8) {
        objc_msgSend(v5, "updateMostRecentStatusCount:", objc_msgSend(v8, "unsignedIntegerValue"));
      }
    }
  }
}

uint64_t __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isStore]) {
    uint64_t v3 = +[MFMailboxUid isDraftsMailboxType:](MFMailboxUid, "isDraftsMailboxType:", [v2 mailboxType]) ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) nameForMailboxUid:a2];
  return v2;
}

uint64_t __53__IMAPAccount_throttledGetMailboxListWithConnection___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (void)fetchMailboxListExplicit
{
  if (+[MFMailMessageLibrary canUsePersistence])
  {
    uint64_t v3 = [(IMAPAccount *)self taskManager];

    if (v3)
    {
      id v4 = [(IMAPAccount *)self taskManager];
      [v4 fetchNow:*MEMORY[0x1E4F5FCE8]];
    }
    else
    {
      [(IMAPAccount *)self throttledGetMailboxListWithConnection:0];
    }
  }
}

- (void)_synchronouslyLoadListingForParent:(id)a3
{
  id v8 = a3;
  id v4 = [(IMAPAccount *)self taskManager];

  if (!v4)
  {
    BOOL v5 = [(IMAPAccount *)self _listingForMailboxUid:v8 listAllChildren:0];
    if (v5)
    {
      id v6 = [v8 name];
      BOOL v7 = [(MailAccount *)self _loadMailboxListingIntoCache:v6 attributes:0 children:v5 parent:v8];

      if (v7) {
        [(IMAPAccount *)self _mailboxListingChanged];
      }
    }
  }
}

- (void)_waitForMailboxListingLoadToComplete
{
  [(IMAPAccount *)self mf_lock];
  [(IMAPAccount *)self mf_unlock];
}

- (void)_mailboxesWereRemovedFromTree:(id)a3 withFileSystemPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(IMAPAccount *)self mf_lock];
  if (!sMailboxDeletionQueue)
  {
    id v8 = objc_alloc_init(MFInvocationQueue);
    int v9 = (void *)sMailboxDeletionQueue;
    sMailboxDeletionQueue = (uint64_t)v8;
  }
  [(IMAPAccount *)self mf_unlock];
  id v10 = objc_alloc_init(_MFIMAPMailboxDeletionQueueEntry);
  [(_MFIMAPMailboxDeletionQueueEntry *)v10 setUrls:v6];
  [(_MFIMAPMailboxDeletionQueueEntry *)v10 setPaths:v7];
  [(_MFIMAPMailboxDeletionQueueEntry *)v10 setAccount:self];
  uint64_t v11 = objc_opt_class();
  id v12 = MFLookupLocalizedString(@"IMAP_REMOVING_CACHE_FILES", @"Removing old cache files…", @"Message");
  BOOL v13 = +[MFMonitoredInvocation invocationWithSelector:sel__deleteQueuedMailboxes_ target:v11 object:v10 taskName:v12 priority:12 canBeCancelled:1];

  [(id)sMailboxDeletionQueue addInvocation:v13];
  v14.receiver = self;
  v14.super_class = (Class)IMAPAccount;
  [(MailAccount *)&v14 _mailboxesWereRemovedFromTree:v6 withFileSystemPaths:v7];
}

+ (void)_deleteQueuedMailboxes:(id)a3
{
  id v18 = a3;
  id v4 = [v18 account];
  [v4 _waitForMailboxListingLoadToComplete];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [v18 urls];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = 0;
    int v9 = (void *)*MEMORY[0x1E4F1D260];
    do
    {
      id v10 = [v18 urls];
      uint64_t v11 = [v10 objectAtIndex:v8];

      id v12 = [a1 mailboxUidFromActiveAccountsForURL:v11];
      BOOL v13 = v12;
      if (!v12 || ([v12 isValid] & 1) == 0)
      {
        objc_super v14 = [v18 paths];
        id v15 = [v14 objectAtIndex:v8];

        if (v15 != v9) {
          id v16 = (id)MFRemoveItemAtPath();
        }
        [v5 addObject:v11];
      }
      ++v8;
    }
    while (v7 != v8);
  }
  id v17 = [v4 library];
  [v17 deleteMailboxes:v5 account:v4];
}

- (BOOL)newMailboxNameIsAcceptable:(id)a3 reasonForFailure:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMAPAccount;
  if ([(MailAccount *)&v14 newMailboxNameIsAcceptable:v6 reasonForFailure:a4])
  {
    uint64_t v7 = [(IMAPAccount *)self separatorChar];
    if (v7)
    {
      uint64_t v8 = [v6 rangeOfString:v7];
      BOOL v9 = v8 == 0x7FFFFFFFFFFFFFFFLL;
      if (!a4)
      {
LABEL_10:

        goto LABEL_11;
      }
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v10 = NSString;
        uint64_t v11 = MFLookupLocalizedString(@"MAILBOX_NAME_INCLUDES_PATH_SEPARATOR", @"Mailbox names may not include “%@”.", @"Delayed");
        objc_msgSend(v10, "stringWithFormat:", v11, v7);
        id v12 = objc_claimAutoreleasedReturnValue();
        *a4 = v12;

        BOOL v9 = 0;
        goto LABEL_10;
      }
    }
    else if (!a4)
    {
LABEL_9:
      BOOL v9 = 1;
      goto LABEL_10;
    }
    *a4 = 0;
    goto LABEL_9;
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v40 = a5;
  id v10 = [(IMAPAccount *)self _nameForMailboxUid:v8];
  inboxMailboxUid = self->super._inboxMailboxUid;
  if (inboxMailboxUid && [(MFMailboxUid *)inboxMailboxUid isEqual:v8]) {
    id v12 = self->super._inboxMailboxUid;
  }
  else {
    id v12 = 0;
  }
  BOOL v13 = [(IMAPAccount *)self _nameForMailboxUid:v40];
  if (v9) {
    [(IMAPAccount *)self _uidNameForPathComponent:v9];
  }
  else {
  objc_super v14 = [v8 name];
  }
  if ([v13 length])
  {
    id v15 = (void *)[v13 mutableCopy];
    id v16 = [(IMAPAccount *)self separatorChar];
    [v15 appendString:v16];

    [v15 appendString:v14];
    objc_super v14 = v15;
  }
  if (!v14)
  {
    uint64_t v26 = 0;
    goto LABEL_22;
  }
  int v38 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v10];
  uint64_t v39 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v14];
  id v17 = [(IMAPAccount *)self taskManager];

  if (v17)
  {
    id v18 = +[IMAPAccount log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CFArrayCallBacks buf = 138543618;
      unsigned int v43 = v38;
      __int16 v44 = 2114;
      unint64_t v45 = v39;
      _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "Task manager mailbox %{public}@ to mailbox %{public}@", buf, 0x16u);
    }

    int v19 = [(IMAPAccount *)self taskManager];
    char v20 = [v19 renameMailbox:v10 toMailbox:v14];

    if ((v20 & 1) == 0)
    {
      CFIndex v21 = [(MailAccount *)self library];
      id v22 = [v21 persistence];
      id v23 = [v22 mailboxActionPersistence];

      uint64_t v24 = objc_msgSend(MEMORY[0x1E4F60B00], "actionWithID:toRenameMailbox:mailboxName:toName:", 0, objc_msgSend(v8, "databaseID"), v10, v14);
      id v25 = [(MFAccount *)self identifier];
      [v23 saveMailboxActionForAccountID:v25 action:v24];
    }
    uint64_t v26 = 0;
    goto LABEL_17;
  }
  if ([(IMAPAccount *)self isOffline])
  {
    uint64_t v30 = +[MFActivityMonitor currentMonitor];
    BOOL v31 = MFLookupLocalizedString(@"NO_OFFLINE_MAILBOX_RENAMING", @"You can’t rename mailboxes while an account is offline.", @"Delayed");
    id v32 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1034 localizedDescription:v31];
    [v30 setError:v32];

    char v33 = +[IMAPAccount log];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[IMAPAccount renameMailbox:newName:parent:]((uint64_t)v39, v33);
    }
LABEL_36:

    BOOL v29 = 0;
    uint64_t v26 = 0;
    goto LABEL_37;
  }
  uint64_t v26 = [(IMAPAccount *)self connectionForMailbox:0 delegate:self options:1 failedToSelectMailbox:0];
  if (!v26)
  {
    char v33 = +[IMAPAccount log];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[IMAPAccount renameMailbox:newName:parent:]((uint64_t)v39, v33);
    }
    goto LABEL_36;
  }
  BOOL v34 = +[IMAPAccount log];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CFArrayCallBacks buf = 138543618;
    unsigned int v43 = v38;
    __int16 v44 = 2114;
    unint64_t v45 = v39;
    _os_log_impl(&dword_1A7EFF000, v34, OS_LOG_TYPE_DEFAULT, "Renaming mailbox %{public}@ to mailbox %{public}@", buf, 0x16u);
  }

  int v37 = [v26 renameMailbox:v10 toMailbox:v14];
  BOOL v35 = +[IMAPAccount log];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CFArrayCallBacks buf = 67109120;
    LODWORD(v43) = v37;
    _os_log_impl(&dword_1A7EFF000, v35, OS_LOG_TYPE_DEFAULT, "renameMailbox returnValue:%{BOOL}d", buf, 8u);
  }

  [(IMAPAccount *)self checkInConnection:v26];
  if (!v37)
  {
LABEL_22:
    BOOL v29 = 0;
    if (!v12) {
      goto LABEL_37;
    }
LABEL_23:
    [(MailAccount *)self resetSpecialMailboxes];
    goto LABEL_37;
  }
LABEL_17:
  if (v12) {
    [(MailAccount *)self _assignSpecialMailboxToAppropriateIvar:0 forType:7];
  }
  v41.receiver = self;
  v41.super_class = (Class)IMAPAccount;
  [(MailAccount *)&v41 renameMailbox:v8 newName:v9 parent:v40];
  uint64_t v27 = [v8 store];
  [v27 reselectMailbox];

  CFIndex v28 = [(IMAPAccount *)self taskManager];
  [v28 localMailboxesDidChange];

  BOOL v29 = 1;
  if (v12) {
    goto LABEL_23;
  }
LABEL_37:

  return v29;
}

- (id)_nameForMailboxUid:(id)a3
{
  id v4 = (MFMailboxUid *)a3;
  if (self->super._inboxMailboxUid == v4)
  {
    id v6 = @"INBOX";
    goto LABEL_32;
  }
  id v5 = [(IMAPAccount *)self serverPathPrefix];
  if (!v5
    && ([(MFMailboxUid *)v4 parent],
        uint64_t v7 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue(),
        rootMailboxUid = self->super._rootMailboxUid,
        v7,
        v7 == rootMailboxUid))
  {
    id v12 = [(MFMailboxUid *)v4 name];
  }
  else
  {
    if (self->super._rootMailboxUid != v4)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([(__CFString *)v5 length])
      {
        int v10 = ![(MFMailboxUid *)v4 isShared];
        if (!v4) {
          goto LABEL_16;
        }
      }
      else
      {
        int v10 = 0;
        if (!v4)
        {
LABEL_16:
          if (v10) {
            id v15 = (void *)[(__CFString *)v5 mutableCopy];
          }
          else {
            id v15 = 0;
          }
          uint64_t v16 = [v9 count];
          id v17 = [(IMAPAccount *)self separatorChar];
          if (v16)
          {
            for (uint64_t i = v16 - 1; i != -1; --i)
            {
              int v19 = [v9 objectAtIndex:i];
              char v20 = v19;
              if (v15)
              {
                if (!v17)
                {

                  id v15 = 0;
                  break;
                }
                [v15 appendString:v17];
                [v15 appendString:v20];
              }
              else
              {
                id v15 = (void *)[v19 mutableCopy];
              }
            }
          }
          id v6 = v15;

          goto LABEL_31;
        }
      }
      do
      {
        if (v4 == self->super._rootMailboxUid) {
          break;
        }
        BOOL v13 = [(MFMailboxUid *)v4 name];
        [v9 addObject:v13];

        uint64_t v14 = [(MFMailboxUid *)v4 parent];

        id v4 = (MFMailboxUid *)v14;
      }
      while (v14);
      goto LABEL_16;
    }
    uint64_t v11 = &stru_1EFF11268;
    if (v5) {
      uint64_t v11 = v5;
    }
    id v12 = v11;
  }
  id v6 = v12;
LABEL_31:

LABEL_32:
  return v6;
}

- (id)nameForMailboxUid:(id)a3
{
  uint64_t v3 = [(IMAPAccount *)self _nameForMailboxUid:a3];
  return v3;
}

- (id)mailboxUidForName:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  id v5 = v4;
  if (!v4)
  {
    id v15 = 0;
    goto LABEL_26;
  }
  uint64_t v6 = [(__CFString *)v4 caseInsensitiveCompare:@"INBOX"];
  if (!v6)
  {

    id v5 = @"INBOX";
  }
  uint64_t v7 = [(IMAPAccount *)self serverPathPrefix];
  id v8 = [(IMAPAccount *)self separatorChar];
  if (!v7 || ![v7 length] || !v6) {
    goto LABEL_14;
  }
  uint64_t v9 = [(__CFString *)v5 rangeOfString:v7 options:8];
  if (v10)
  {
    uint64_t v11 = [(__CFString *)v5 substringFromIndex:v9 + v10];

    if (v8 && v11 && (uint64_t v12 = [(__CFString *)v11 rangeOfString:v8 options:8], v13))
    {
      uint64_t v14 = [(__CFString *)v11 substringFromIndex:v12 + v13];

      id v5 = (__CFString *)v14;
    }
    else
    {
      id v5 = v11;
    }
LABEL_14:
    id v15 = 0;
    if (v8 && v5)
    {
      uint64_t v16 = [(__CFString *)v5 componentsSeparatedByString:v8];
      id v15 = [(MailAccount *)self rootMailbox];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v24;
        do
        {
          uint64_t v20 = 0;
          CFIndex v21 = v15;
          do
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v17);
            }
            id v15 = objc_msgSend(v21, "childWithName:", *(void *)(*((void *)&v23 + 1) + 8 * v20), (void)v23);

            ++v20;
            CFIndex v21 = v15;
          }
          while (v18 != v20);
          uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v18);
      }
    }
    goto LABEL_25;
  }

  id v5 = 0;
  id v15 = 0;
LABEL_25:

LABEL_26:
  return v15;
}

- (BOOL)canMailboxBeDeleted:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->super._inboxMailboxUid])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)IMAPAccount;
    BOOL v5 = [(MailAccount *)&v7 canMailboxBeDeleted:v4];
  }

  return v5;
}

- (id)serverNamespace
{
  [(IMAPAccount *)self mf_lock];
  uint64_t v3 = self->_serverNamespace;
  [(IMAPAccount *)self mf_unlock];
  return v3;
}

- (void)setServerNamespace:(id)a3
{
  id v8 = a3;
  [(IMAPAccount *)self mf_lock];
  char v4 = [v8 isEqualToString:self->_serverNamespace];
  if ((v4 & 1) == 0)
  {
    BOOL v5 = (NSString *)[v8 copy];
    serverNamespace = self->_serverNamespace;
    self->_serverNamespace = v5;

    [(MailAccount *)self _incrementCacheDirtyCount];
  }
  [(IMAPAccount *)self mf_unlock];
  if ((v4 & 1) == 0)
  {
    objc_super v7 = [(MailAccount *)self allMailboxUids];
    [v7 makeObjectsPerformSelector:sel_flushCriteria];
  }
}

- (void)setServerPathPrefix:(id)a3
{
  uint64_t v12 = (__CFString *)a3;
  uint64_t v4 = [(IMAPAccount *)self serverPathPrefixAccountValue];
  BOOL v5 = v12;
  if (!v12) {
    BOOL v5 = &stru_1EFF11268;
  }
  id v13 = v5;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_1EFF11268;
  }
  id v8 = [(IMAPAccount *)self separatorChar];
  if (v8)
  {
    uint64_t v7 = [v13 rangeOfString:v8 options:12];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = [v13 substringToIndex:v7];

      id v13 = (id)v9;
    }
  }
  uint64_t v10 = objc_msgSend(v13, "length", v7);
  if (v10 != -[__CFString length](v6, "length") || ([v13 isEqual:v6] & 1) == 0)
  {
    uint64_t v11 = [(MailAccount *)self allMailboxUids];
    [v11 makeObjectsPerformSelector:sel_URLString];

    [(IMAPAccount *)self mf_lock];
    if (v13 && [v13 length]) {
      [(MFAccount *)self setAccountProperty:v13 forKey:@"ServerPathPrefix"];
    }
    else {
      [(MFAccount *)self removeAccountPropertyForKey:@"ServerPathPrefix"];
    }
    [(IMAPAccount *)self mf_unlock];
  }
}

- (void)deleteMessagesFromMailboxUid:(id)a3 olderThanNumberOfDays:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(MailAccount *)self _shouldLogDeleteActivity])
  {
    uint64_t v7 = +[IMAPAccount log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(MFAccount *)self ef_publicDescription];
      uint64_t v9 = objc_msgSend(v6, "ef_publicDescription");
      *(_DWORD *)CFArrayCallBacks buf = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      __int16 v15 = 1024;
      int v16 = v4;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ deleting messages from mailbox: %{public}@ older than %d days", buf, 0x1Cu);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)IMAPAccount;
  [(MailAccount *)&v10 deleteMessagesFromMailboxUid:v6 olderThanNumberOfDays:v4];
}

- (BOOL)supportsAppend
{
  return 1;
}

- (BOOL)supportsRemoteAppend
{
  return 1;
}

- (BOOL)supportsMailboxEditing
{
  return 1;
}

- (BOOL)shouldRestoreMessagesAfterFailedDelete
{
  return 1;
}

- (double)lastPushRegistration
{
  [(IMAPAccount *)self mf_lock];
  double lastPushRegistration = self->_lastPushRegistration;
  [(IMAPAccount *)self mf_unlock];
  return lastPushRegistration;
}

- (void)setLastPushRegistration:(double)a3
{
  [(IMAPAccount *)self mf_lock];
  self->_double lastPushRegistration = a3;
  [(IMAPAccount *)self mf_unlock];
}

- (BOOL)mustRegisterForPushOnNextConnection
{
  [(IMAPAccount *)self mf_lock];
  BOOL v3 = (*((unsigned __int8 *)self + 388) >> 1) & 1;
  [(IMAPAccount *)self mf_unlock];
  return v3;
}

- (void)setMustRegisterForPushOnNextConnection:(BOOL)a3
{
  BOOL v3 = a3;
  [(IMAPAccount *)self mf_lock];
  if (v3) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *((unsigned char *)self + 388) = *((unsigned char *)self + 388) & 0xFD | v5;
  [(IMAPAccount *)self mf_unlock];
}

- (int64_t)supportedPushServiceLevel
{
  [(MailAccount *)self rootMailbox];

  [(IMAPAccount *)self mf_lock];
  int64_t supportedPushServiceLevel = self->_supportedPushServiceLevel;
  [(IMAPAccount *)self mf_unlock];
  return supportedPushServiceLevel;
}

- (void)setSupportedPushServiceLevel:(int64_t)a3
{
  [(IMAPAccount *)self mf_lock];
  if (self->_supportedPushServiceLevel != a3)
  {
    self->_int64_t supportedPushServiceLevel = a3;
    [(MailAccount *)self _incrementCacheDirtyCount];
  }
  [(IMAPAccount *)self mf_unlock];
}

- (id)mailboxesRegisteredForPushByHash
{
  [(MailAccount *)self rootMailbox];

  [(IMAPAccount *)self mf_lock];
  BOOL v3 = (void *)[(NSMutableDictionary *)self->_pushRegisteredMailboxes copy];
  [(IMAPAccount *)self mf_unlock];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__IMAPAccount_mailboxesRegisteredForPushByHash__block_invoke;
  v9[3] = &unk_1E5D3B848;
  v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];
  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __47__IMAPAccount_mailboxesRegisteredForPushByHash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = objc_msgSend(v6, "mf_encodedIMAPMailboxName");
  uint64_t v9 = [v7 mailboxUidForName:v8];

  id v10 = [v9 redactedName:v6];
  if (v9)
  {
    [*(id *)(a1 + 40) setObject:v9 forKey:v5];
  }
  else
  {
    uint64_t v11 = +[IMAPAccount log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      __int16 v13 = v10;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "#aps-push warning, can't find mailbox with name '%{public}@' (%{public}@)", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)updatePushRegisteredMailboxes:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  long long v23 = self;
  [(IMAPAccount *)self mf_lock];
  pushRegisteredMailboxes = self->_pushRegisteredMailboxes;
  if (pushRegisteredMailboxes)
  {
    [(NSMutableDictionary *)pushRegisteredMailboxes removeAllObjects];
  }
  else
  {
    id v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v20, "count"));
    id v6 = self->_pushRegisteredMailboxes;
    self->_pushRegisteredMailboxes = v5;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v20;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v7)
  {
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(id *)(*((void *)&v24 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x1AD0E3E00]();
        uint64_t v11 = objc_msgSend(v9, "mf_decodedIMAPMailboxName");
        int v12 = (void *)[v11 copy];

        __int16 v13 = [v12 dataUsingEncoding:4 allowLossyConversion:0];
        __int16 v14 = objc_msgSend(v13, "ef_md5Digest");
        id v15 = objc_msgSend(v14, "ef_hexString");
        if (v15)
        {
          [(NSMutableDictionary *)v23->_pushRegisteredMailboxes setObject:v12 forKey:v15];
        }
        else
        {
          uint64_t v16 = objc_msgSend(v12, "mf_encodedIMAPMailboxName");
          uint64_t v17 = [(IMAPAccount *)v23 mailboxUidForName:v16];

          uint64_t v18 = [v17 redactedName:v12];
          uint64_t v19 = +[IMAPAccount log];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CFArrayCallBacks buf = 138543362;
            BOOL v29 = v18;
            _os_log_error_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_ERROR, "#aps-push failed to generate hash for mailbox named '%{public}@'", buf, 0xCu);
          }
        }

        ++v8;
      }
      while (v7 != v8);
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v7);
  }

  [(MailAccount *)v23 _incrementCacheDirtyCount];
  [(IMAPAccount *)v23 mf_unlock];
}

- (id)apsTopic
{
  [(MailAccount *)self rootMailbox];

  [(IMAPAccount *)self mf_lock];
  BOOL v3 = self->_apsTopic;
  [(IMAPAccount *)self mf_unlock];
  return v3;
}

- (void)setAPSTopic:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = (NSString *)a3;
  id v6 = +[IMAPAccount log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    __int16 v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = self;
    _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "#aps-push Setting aps-topic '%@' for account %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v7 = [(MailAccount *)self uniqueIdForPersistentConnection];
  int Style = PCSettingsGetStyle();
  [(IMAPAccount *)self mf_lock];
  apsTopic = self->_apsTopic;
  if (apsTopic != v5)
  {
    id v10 = apsTopic;
    objc_storeStrong((id *)&self->_apsTopic, a3);
    [(MailAccount *)self _incrementCacheDirtyCount];
    uint64_t v11 = +[MFAPSManager sharedManager];
    int v12 = v11;
    if (v5 || !v10)
    {
      if (!v5 || v10)
      {
        if (![(NSString *)v5 isEqualToString:v10]) {
          [v12 swapTopic:v10 forNewTopic:v5];
        }
      }
      else if ((*((unsigned char *)self + 388) & 4) != 0 && !Style)
      {
        [v11 startWatchingForTopic:v5];
      }
    }
    else
    {
      [v11 stopWatchingForTopic:v10];
    }
  }
  [(IMAPAccount *)self mf_unlock];
}

- (void)_schedulePushRegistrationConnection
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(IMAPAccount *)self mf_lock];
  if ((*((unsigned char *)self + 388) & 2) == 0)
  {
    BOOL v3 = +[IMAPAccount log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CFArrayCallBacks buf = 138412546;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2048;
      uint64_t v11 = self;
      id v4 = v9;
      _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "#aps-push account <%@:%p> scheduling push registration connection", buf, 0x16u);
    }
    *((unsigned char *)self + 388) |= 2u;
    dispatch_time_t v5 = dispatch_time(0, 2000000000);
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__IMAPAccount__schedulePushRegistrationConnection__block_invoke;
    block[3] = &unk_1E5D3B5C0;
    void block[4] = self;
    dispatch_after(v5, v6, block);
  }
  [(IMAPAccount *)self mf_unlock];
}

void __50__IMAPAccount__schedulePushRegistrationConnection__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = *(unsigned char **)(a1 + 32);
  char v3 = v2[388];
  int v4 = [v2 mustRegisterForPushOnNextConnection];
  int v5 = v4;
  if ((v3 & 4) != 0 && v4)
  {
    id v6 = [*(id *)(a1 + 32) taskManager];

    BOOL v7 = v6 == 0;
    uint64_t v8 = +[IMAPAccount log];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int v18 = 138412290;
        uint64_t v19 = v17;
        _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "#aps-push account %@ forcing push registration connection", (uint8_t *)&v18, 0xCu);
      }

      uint64_t v8 = [*(id *)(a1 + 32) authenticatedConnection];
      [v8 logout];
    }
    else if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v18 = 138412290;
      uint64_t v19 = v10;
      uint64_t v11 = "#aps-push account %@ IMAPv4 not forcing push registration connection";
      uint64_t v12 = v8;
      uint32_t v13 = 12;
LABEL_13:
      _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, v13);
    }
  }
  else
  {
    uint64_t v8 = +[IMAPAccount log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = "NO";
      uint64_t v15 = *(void *)(a1 + 32);
      if ((v3 & 4) != 0) {
        uint64_t v16 = "YES";
      }
      else {
        uint64_t v16 = "NO";
      }
      int v18 = 138412802;
      uint64_t v19 = v15;
      __int16 v20 = 2080;
      if (v5) {
        __int16 v14 = "YES";
      }
      CFIndex v21 = v16;
      __int16 v22 = 2080;
      long long v23 = v14;
      uint64_t v11 = "#aps-push account %@ will NOT force push registration connection, didRequestPushRegistration: %s, mustRegist"
            "erOnNextConnection: %s";
      uint64_t v12 = v8;
      uint32_t v13 = 32;
      goto LABEL_13;
    }
  }
}

- (BOOL)shouldRegisterForPush
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(IMAPAccount *)self _hasCachedSeparatorChar])
  {
    [(MailAccount *)self uniqueIdForPersistentConnection];
    int Style = PCSettingsGetStyle();
    if (Style)
    {
      int v4 = Style;
      int v5 = MFLogGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v19 = 67109378;
        *(_DWORD *)__int16 v20 = v4;
        *(_WORD *)&v20[4] = 2112;
        *(void *)&v20[6] = self;
        _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_INFO, "#aps-push MCC push settings are not set to push (%d != PCStylePush) for account %@", (uint8_t *)&v19, 0x12u);
      }
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1CA80]);
      uint64_t v8 = [(IMAPAccount *)self pushedMailboxUids];
      int v5 = [v7 initWithSet:v8];

      BOOL v9 = [(IMAPAccount *)self _externalMailboxUids];
      [v5 unionSet:v9];

      if (![v5 count])
      {
        uint64_t v16 = +[IMAPAccount log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412290;
          *(void *)__int16 v20 = self;
          _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "#aps-push account %@ has no pushed mailboxes, skipping", (uint8_t *)&v19, 0xCu);
        }

        BOOL v6 = 0;
        [(IMAPAccount *)self setMustRegisterForPushOnNextConnection:0];
        goto LABEL_19;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      [(IMAPAccount *)self lastPushRegistration];
      double v12 = v11;
      BOOL v13 = [(IMAPAccount *)self mustRegisterForPushOnNextConnection];
      double v14 = Current - v12;
      char v15 = v14 >= 82800.0 || v13;
      if (v15)
      {
        BOOL v6 = 1;
LABEL_19:

        return v6;
      }
      uint64_t v17 = +[IMAPAccount log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412546;
        *(void *)__int16 v20 = self;
        *(_WORD *)&v20[8] = 2048;
        *(double *)&v20[10] = v14;
        _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEFAULT, "#aps-push account %@ last registered for push %.3f seconds ago", (uint8_t *)&v19, 0x16u);
      }
    }
    BOOL v6 = 0;
    goto LABEL_19;
  }
  return 0;
}

- (BOOL)canAttemptPushRegistration
{
  return 1;
}

- (BOOL)canReceiveNewMailNotifications
{
  return [(IMAPAccount *)self supportedPushServiceLevel] >= 0;
}

- (void)serverRegisteredMailboxes:(id)a3 withTopic:(id)a4 version:(int64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[IMAPAccount log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 1024;
    int v18 = a5;
    _os_log_debug_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEBUG, "#aps-push {mailboxes=%@, topic=%@, version=%d}", (uint8_t *)&v13, 0x1Cu);
  }

  int64_t v11 = [(IMAPAccount *)self supportedPushServiceLevel];
  [(IMAPAccount *)self updatePushRegisteredMailboxes:v8];
  [(IMAPAccount *)self setSupportedPushServiceLevel:a5];
  [(IMAPAccount *)self setAPSTopic:v9];
  if (a5 >= 1) {
    [(IMAPAccount *)self setLastPushRegistration:CFAbsoluteTimeGetCurrent()];
  }
  if (v11 != a5 && (*((unsigned char *)self + 388) & 4) != 0)
  {
    if (a5 >= 1 && v11 < 0)
    {
      [(IMAPAccount *)self startListeningForNotifications];
    }
    else if (a5 <= 0)
    {
      double v12 = +[MFAPSManager sharedManager];
      [v12 stopWatchingForTopic:v9];
    }
  }
  [(MailAccount *)self _writeMailboxCacheWithPrejudice:1];
}

- (id)_notificationNameForMailbox:(id)a3 withPrefix:(id)a4
{
  id v6 = a4;
  id v7 = [(IMAPAccount *)self _nameForMailboxUid:a3];
  id v8 = [(MFAccount *)self uniqueID];
  id v9 = [v6 stringByAppendingFormat:@".%@.%@", v8, v7];

  return v9;
}

- (id)_notesPrefix
{
  return [(MFAccount *)self _objectForAccountInfoKey:@"NotesNotificationPrefix"];
}

- (BOOL)_registerPushNotificationPrefix:(id)a3 forMailboxNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(IMAPAccount *)self mf_lock];
  id v8 = [(MFAccount *)self accountPropertyForKey:@"NotesPushedMailboxes"];
  id v9 = [(MFAccount *)self accountPropertyForKey:@"NotesNotificationPrefix"];
  uint64_t v10 = v9;
  if (v6 && ([v9 isEqualToString:v6] & 1) == 0)
  {
    [(MFAccount *)self setAccountProperty:v6 forKey:@"NotesNotificationPrefix"];
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  double v12 = [(MFAccount *)self accountPropertyForKey:@"NotesPushedMailboxes"];
  uint64_t v13 = [v12 mutableCopy];

  uint64_t v14 = [v7 mutableCopy];
  [(id)v13 sortUsingSelector:sel_localizedCompare_];
  [(id)v14 sortUsingSelector:sel_localizedCompare_];
  if (!(v13 | v14) || v14 && ([(id)v13 isEqual:v14] & 1) == 0)
  {
    [(MFAccount *)self setAccountProperty:v7 forKey:@"NotesPushedMailboxes"];
    int v11 = 1;
  }
  [(IMAPAccount *)self mf_unlock];
  [(IMAPAccount *)self setIsOffline:0];
  [(IMAPAccount *)self startListeningForNotifications];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 isEqualToArray:v8]) {
      goto LABEL_14;
    }
  }
  id v21 = v6;
  __int16 v15 = v10;
  id v16 = [(IMAPAccount *)self _copyMailboxListForNames:v7];
  uint64_t v17 = [v16 count];
  uint64_t v18 = [v7 count];

  BOOL v19 = v17 == v18;
  uint64_t v10 = v15;
  id v6 = v21;
  if (v19)
  {
LABEL_14:
    [(IMAPAccount *)self _schedulePushRegistrationConnection];
  }
  else
  {
    [(IMAPAccount *)self resetMailboxTimer];
    [(IMAPAccount *)self fetchMailboxListImplicit];
  }
  if (v11) {
    [(MFAccount *)self savePersistentAccount];
  }

  return 1;
}

- (id)_copyMailboxListForNames:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
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
          uint64_t v10 = -[IMAPAccount mailboxUidForName:](self, "mailboxUidForName:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);
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
  }
  return v5;
}

- (id)_copyMailboxListPreferenceForKey:(id)a3
{
  id v4 = [(MFAccount *)self _objectForAccountInfoKey:a3];
  id v5 = [(IMAPAccount *)self _copyMailboxListForNames:v4];

  return v5;
}

- (id)_copyUserPushedMailboxes
{
  return [(IMAPAccount *)self _copyMailboxListPreferenceForKey:@"PushedMailboxes"];
}

- (id)_copyPushedMailboxesForPrefix:(id)a3
{
  return [(IMAPAccount *)self _copyMailboxListPreferenceForKey:@"NotesPushedMailboxes"];
}

- (void)_updatePushedMailboxesAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MFAccount *)self isEnabledForDataclass:*MEMORY[0x1E4F17AD8]])
  {
    if ([(IMAPAccount *)self supportsUserPushedMailboxes]) {
      id v5 = [(IMAPAccount *)self _copyUserPushedMailboxes];
    }
    else {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    id obj = v5;
    id v6 = [(MailAccount *)self primaryMailboxUid];
    [obj addObject:v6];

    uint64_t v7 = [(MailAccount *)self mailboxUidOfType:4 createIfNeeded:0];
    if (v7) {
      [obj addObject:v7];
    }
    uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v9 = [v8 BOOLForKey:@"RelatedMessagesShouldIncludeDrafts"];

    if (v9)
    {
      uint64_t v10 = [(MailAccount *)self mailboxUidOfType:5 createIfNeeded:0];
      if (v10) {
        [obj addObject:v10];
      }
    }
  }
  else
  {
    id obj = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  [(IMAPAccount *)self mf_lock];
  objc_storeStrong((id *)&self->_pushedMailboxUids, obj);
  [(IMAPAccount *)self mf_unlock];
  if (v3)
  {
    int v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"MFMailAccountPushedMailboxUidsDidChange" object:self userInfo:0];
  }
}

- (BOOL)supportsUserPushedMailboxes
{
  return [(IMAPAccount *)self supportedPushServiceLevel] > 1;
}

- (id)pushedMailboxUids
{
  if (!self->_pushedMailboxUids) {
    [(IMAPAccount *)self _updatePushedMailboxesAndNotify:0];
  }
  [(IMAPAccount *)self mf_lock];
  BOOL v3 = self->_pushedMailboxUids;
  [(IMAPAccount *)self mf_unlock];
  return v3;
}

- (void)changePushedMailboxUidsAdded:(id)a3 deleted:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v24 = (unint64_t)a3;
  id v23 = a4;
  if ([(IMAPAccount *)self supportsUserPushedMailboxes])
  {
    id v6 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v7 = [(IMAPAccount *)self pushedMailboxUids];
    uint64_t v8 = [v6 setWithSet:v7];

    if (v24)
    {
      int v9 = [(id)v24 allObjects];
      [v8 addObjectsFromArray:v9];
    }
    unint64_t v10 = (unint64_t)v23;
    if (v23)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v11 = v23;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v31;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(v11);
            }
            [v8 removeObject:*(void *)(*((void *)&v30 + 1) + 8 * v14++)];
          }
          while (v12 != v14);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v12);
      }

      unint64_t v10 = (unint64_t)v23;
    }
    if (v24 | v10)
    {
      long long v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v15 = v8;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v27;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v15);
            }
            BOOL v19 = [(IMAPAccount *)self _nameForMailboxUid:*(void *)(*((void *)&v26 + 1) + 8 * v18)];
            __int16 v20 = v19;
            if (v19)
            {
              id v21 = v19;
              BOOL v22 = [v21 caseInsensitiveCompare:@"INBOX"] == 0;

              if (!v22) {
                [v25 addObject:v21];
              }
            }

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v16);
      }

      [(IMAPAccount *)self mf_lock];
      [(MailAccount *)self setValueInAccountProperties:v25 forKey:@"PushedMailboxes"];
      [(IMAPAccount *)self mf_unlock];
      [(MFAccount *)self savePersistentAccount];
      [(IMAPAccount *)self _updatePushedMailboxesAndNotify:1];
      [(IMAPAccount *)self _schedulePushRegistrationConnection];
    }
  }
}

- (id)_externalMailboxUids
{
  if ([(MFAccount *)self isSyncingNotes])
  {
    BOOL v3 = [(IMAPAccount *)self _notesPrefix];
    id v4 = [(IMAPAccount *)self _copyPushedMailboxesForPrefix:v3];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
  }
  return v4;
}

- (id)mailboxNamesForPushRegistration
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(IMAPAccount *)self setMustRegisterForPushOnNextConnection:0];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v4 = [(IMAPAccount *)self pushedMailboxUids];
  id v5 = (void *)[v3 initWithSet:v4];

  id v6 = [(IMAPAccount *)self _externalMailboxUids];
  [v5 unionSet:v6];

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = -[IMAPAccount nameForMailboxUid:](self, "nameForMailboxUid:", v13, (void)v19);
        if (v14) {
          [v7 addObject:v14];
        }
        else {
          [v8 addObject:v13];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v10);
  }

  if ([v8 count])
  {
    id v15 = +[IMAPAccount log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = [(IMAPAccount *)self separatorChar];
      uint64_t v18 = [(IMAPAccount *)self serverPathPrefix];
      *(_DWORD *)CFArrayCallBacks buf = 138413058;
      unint64_t v24 = v8;
      __int16 v25 = 2114;
      id v26 = v9;
      __int16 v27 = 2114;
      long long v28 = v17;
      __int16 v29 = 2112;
      long long v30 = v18;
      _os_log_fault_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_FAULT, "#aps-push could not create mailbox names for: %@, pushed mailboxes: %{public}@ (sep: %{public}@ prefix: %@)", buf, 0x2Au);
    }
  }

  return v7;
}

- (void)_mailboxListingChanged
{
  [(IMAPAccount *)self _updatePushedMailboxesAndNotify:1];
  [(IMAPAccount *)self _schedulePushRegistrationConnection];
}

- (void)handlePushNotificationOnMailboxes:(id)a3 missedNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  if (obj)
  {
    id v6 = [(IMAPAccount *)self mailboxesRegisteredForPushByHash];
    uint64_t v7 = v6;
    if (v4)
    {
      uint64_t v8 = [v6 allKeys];
    }
    else
    {
      uint64_t v8 = obj;
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obja = v8;
    uint64_t v9 = [obja countByEnumeratingWithState:&v57 objects:v69 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v58;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v58 != v10) {
            objc_enumerationMutation(obja);
          }
          uint64_t v12 = [*(id *)(*((void *)&v57 + 1) + 8 * i) uppercaseString];
          uint64_t v13 = [v7 objectForKey:v12];

          if (v13)
          {
            LODWORD(v9) = 1;
            goto LABEL_16;
          }
        }
        uint64_t v9 = [obja countByEnumeratingWithState:&v57 objects:v69 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    id v48 = v7;
  }
  else
  {
    LODWORD(v9) = [(MFAccount *)self isEnabledForDataclass:*MEMORY[0x1E4F17AD8]];
    id v48 = 0;
    id obja = 0;
  }
  uint64_t v14 = +[IMAPAccount log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = @"not ";
    if (v9) {
      id v15 = &stru_1EFF11268;
    }
    *(_DWORD *)CFArrayCallBacks buf = 138412546;
    CFRange v66 = self;
    __int16 v67 = 2112;
    v68 = v15;
    _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "#aps-push Received notification for account '%@', will %@handle push", buf, 0x16u);
  }

  if (v9)
  {
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = v48;
    if (obja)
    {
      uint64_t v17 = [(IMAPAccount *)self pushedMailboxUids];
      uint64_t v18 = [(IMAPAccount *)self _externalMailboxUids];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v19 = obja;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v64 count:16];
      if (!v20) {
        goto LABEL_43;
      }
      uint64_t v22 = *(void *)v54;
      *(void *)&long long v21 = 138412546;
      long long v43 = v21;
      while (1)
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v54 != v22) {
            objc_enumerationMutation(v19);
          }
          unint64_t v24 = *(__CFString **)(*((void *)&v53 + 1) + 8 * v23);
          __int16 v25 = [(__CFString *)v24 uppercaseString];
          id v26 = [v16 objectForKey:v25];

          if (!v26)
          {
            __int16 v29 = +[IMAPAccount log];
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
LABEL_37:

              goto LABEL_38;
            }
            *(_DWORD *)CFArrayCallBacks buf = v43;
            CFRange v66 = self;
            __int16 v67 = 2112;
            v68 = v24;
            long long v30 = v29;
            long long v31 = "#aps-push warning, %@ got a notification for mailbox with hash '%@', but can't find that mailbox.";
LABEL_41:
            _os_log_error_impl(&dword_1A7EFF000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);
            goto LABEL_37;
          }
          int v27 = [v17 containsObject:v26];
          char v28 = v27;
          if (v27) {
            [v47 addObject:v26];
          }
          if ([v18 containsObject:v26])
          {
            [v46 addObject:v26];
            goto LABEL_38;
          }
          if ((v28 & 1) == 0)
          {
            __int16 v29 = +[IMAPAccount log];
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              goto LABEL_37;
            }
            *(_DWORD *)CFArrayCallBacks buf = v43;
            CFRange v66 = self;
            __int16 v67 = 2112;
            v68 = v26;
            long long v30 = v29;
            long long v31 = "#aps-push warning, %@ got a notification for mailbox %@, but we're not enabled for the appropriate dataclass";
            goto LABEL_41;
          }
LABEL_38:

          ++v23;
          uint64_t v16 = v48;
        }
        while (v20 != v23);
        uint64_t v32 = [v19 countByEnumeratingWithState:&v53 objects:v64 count:16];
        uint64_t v20 = v32;
        if (!v32)
        {
LABEL_43:

          goto LABEL_45;
        }
      }
    }
    uint64_t v17 = [(MailAccount *)self primaryMailboxUid];
    [v47 addObject:v17];
LABEL_45:

    if ([v47 count])
    {
      BOOL v62 = @"MailAccountContentsDidChangeUids";
      id v63 = v47;
      long long v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      BOOL v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v34 postNotificationName:@"MailAccountContentsDidChange" object:self userInfo:v33];
    }
    if ([v46 count])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v36 = v46;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v49 objects:v61 count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v50 != v38) {
              objc_enumerationMutation(v36);
            }
            uint64_t v40 = *(void *)(*((void *)&v49 + 1) + 8 * j);
            objc_super v41 = [(IMAPAccount *)self _notesPrefix];
            CFStringRef v42 = [(IMAPAccount *)self _notificationNameForMailbox:v40 withPrefix:v41];

            CFNotificationCenterPostNotification(DarwinNotifyCenter, v42, 0, 0, 1u);
          }
          uint64_t v37 = [v36 countByEnumeratingWithState:&v49 objects:v61 count:16];
        }
        while (v37);
      }
    }
  }
}

- (void)_apsDeviceTokenChanged:(id)a3
{
  if ([(IMAPAccount *)self canReceiveNewMailNotifications]) {
    [(IMAPAccount *)self releaseAllConnections];
  }
  if ([(MailAccount *)self isActive] && (*((unsigned char *)self + 388) & 4) != 0)
  {
    [(IMAPAccount *)self _schedulePushRegistrationConnection];
  }
}

- (void)_registerForDeviceTokenChanges
{
  if ((*((unsigned char *)self + 388) & 8) == 0)
  {
    *((unsigned char *)self + 388) |= 8u;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__apsDeviceTokenChanged_ name:@"MFAPSManagerDeviceTokenChangedNote" object:0];

    id v4 = +[MFAPSManager sharedManager];
    [v4 connect];
  }
}

- (void)_unregisterForDeviceTokenChanges
{
  if ((*((unsigned char *)self + 388) & 8) != 0)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:@"MFAPSManagerDeviceTokenChangedNote" object:0];

    *((unsigned char *)self + 388) &= ~8u;
  }
}

- (void)startListeningForNotifications
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = MFUserAgent();
  char v4 = [v3 canRegisterForAPSPush];

  if (v4)
  {
    id v5 = +[MFPowerController sharedInstance];
    int v6 = [v5 isBatterySaverModeEnabled];

    if (v6)
    {
      uint64_t v7 = +[IMAPAccount log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        uint64_t v22 = self;
        uint64_t v8 = "#aps-push account %@ will NOT start listening for notifications, battery-saver mode is ON";
LABEL_7:
        uint64_t v9 = v7;
        uint32_t v10 = 12;
LABEL_8:
        _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v21, v10);
      }
    }
    else
    {
      uint64_t v11 = +[MFPowerController sharedInstance];
      int v12 = [v11 gameModeEnabled];

      uint64_t v7 = +[IMAPAccount log];
      BOOL v13 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (!v13) {
          goto LABEL_9;
        }
        int v21 = 138412290;
        uint64_t v22 = self;
        uint64_t v8 = "#aps-push account %@ will NOT start listening for notifications, Game Mode is ON";
        goto LABEL_7;
      }
      if (v13)
      {
        int v21 = 138412290;
        uint64_t v22 = self;
        _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "#aps-push account %@ told to start listening for notifications", (uint8_t *)&v21, 0xCu);
      }

      *((unsigned char *)self + 388) |= 4u;
      [(MailAccount *)self uniqueIdForPersistentConnection];
      int Style = PCSettingsGetStyle();
      BOOL v15 = [(IMAPAccount *)self canAttemptPushRegistration];
      BOOL v16 = v15;
      if (Style) {
        BOOL v17 = 0;
      }
      else {
        BOOL v17 = v15;
      }
      if (!v17)
      {
        uint64_t v7 = +[IMAPAccount log];
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_9;
        }
        id v19 = "CANNOT";
        if (v16) {
          id v19 = "can";
        }
        int v21 = 138412802;
        uint64_t v22 = self;
        __int16 v23 = 2080;
        unint64_t v24 = v19;
        if (Style) {
          uint64_t v20 = "is NOT";
        }
        else {
          uint64_t v20 = "is";
        }
        __int16 v25 = 2080;
        id v26 = v20;
        uint64_t v8 = "#aps-push account %@ did NOT register for push, %s register for push and PCConnectionStyle %s push";
        uint64_t v9 = v7;
        uint32_t v10 = 32;
        goto LABEL_8;
      }
      [(IMAPAccount *)self _updatePushedMailboxesAndNotify:1];
      [(IMAPAccount *)self _registerForDeviceTokenChanges];
      uint64_t v7 = [(IMAPAccount *)self apsTopic];
      if (v7)
      {
        uint64_t v18 = +[MFAPSManager sharedManager];
        [v18 startWatchingForTopic:v7];
      }
      [(IMAPAccount *)self _schedulePushRegistrationConnection];
    }
  }
  else
  {
    uint64_t v7 = +[IMAPAccount log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      uint64_t v22 = self;
      uint64_t v8 = "#aps-push account %@ will NOT start listening for notifications, canRegisterForAPSPush returned NO";
      goto LABEL_7;
    }
  }
LABEL_9:
}

- (void)stopListeningForNotifications
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = +[IMAPAccount log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = self;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "#aps-push account %@ told to stop listening for notifications", (uint8_t *)&v6, 0xCu);
  }

  *((unsigned char *)self + 388) &= ~4u;
  char v4 = +[MFAPSManager sharedManager];
  id v5 = [(IMAPAccount *)self apsTopic];
  [v4 stopWatchingForTopic:v5];

  [(IMAPAccount *)self _unregisterForDeviceTokenChanges];
}

- (id)copyDiagnosticInformation
{
  v12.receiver = self;
  v12.super_class = (Class)IMAPAccount;
  id v3 = [(MFAccount *)&v12 copyDiagnosticInformation];
  char v4 = (void *)[v3 mutableCopy];

  id v5 = [(IMAPAccount *)self mailboxesRegisteredForPushByHash];
  int v6 = [v5 descriptionWithLocale:0 indent:1];

  [(IMAPAccount *)self mf_lock];
  [v4 appendFormat:@"    topic: %@\n", self->_apsTopic];
  uint64_t v7 = [(NSArray *)self->_lastKnownCapabilities componentsJoinedByString:@" "];
  [v4 appendFormat:@"    known capabilities: %@\n", v7];

  unint64_t v8 = self->_supportedPushServiceLevel + 2;
  if (v8 >= 6) {
    __assert_rtn("_pushServiceLevelName", "IMAPAccount.m", 3259, "0 && \"unknown push service level\"");
  }
  [v4 appendFormat:@"    negotiated push service level: %@\n", *(&off_1E5D3B8E0 + v8)];
  double lastPushRegistration = self->_lastPushRegistration;
  if (lastPushRegistration == 0.0)
  {
    uint32_t v10 = @"<never>";
  }
  else
  {
    uint32_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_lastPushRegistration];
  }
  [v4 appendFormat:@"    last push registration time: %@\n", v10];
  if (lastPushRegistration != 0.0) {

  }
  if (self->_supportedPushServiceLevel >= 2) {
    [v4 appendFormat:@"    mailboxes registered for push: %@\n", v6];
  }
  [(IMAPAccount *)self mf_unlock];

  return v4;
}

- (id)messageActionsAfterActionID:(int64_t)a3
{
  id v5 = [(MailAccount *)self library];
  int v6 = [v5 persistence];
  uint64_t v7 = [v6 localActionPersistence];
  unint64_t v8 = [(MailAccount *)self URLString];
  uint64_t v9 = [v7 messageActionsForAccountURL:v8 previousActionID:a3];

  return v9;
}

- (NSDate)credentialExpiryDate
{
  id v2 = [(MFAccount *)self baseAccount];
  id v3 = [v2 credential];
  char v4 = [v3 expiryDate];

  return (NSDate *)v4;
}

- (BOOL)moveSupported
{
  id v2 = [(IMAPAccount *)self lastKnownCapabilities];
  char v3 = [v2 containsObject:@"MOVE"];

  return v3;
}

- (id)replayAction:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [v5 mailboxURL];
  uint64_t v7 = [v6 absoluteString];
  unint64_t v8 = +[MailAccount mailboxUidFromActiveAccountsForURL:v7];

  uint64_t v9 = [(MailAccount *)self storeForMailboxUid:v8];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint32_t v10 = NSString;
      uint64_t v11 = (objc_class *)objc_opt_class();
      objc_super v12 = NSStringFromClass(v11);
      BOOL v13 = objc_msgSend(v8, "ef_publicDescription");
      uint64_t v14 = [v10 stringWithFormat:@"Got store of class %@ for mailbox %@", v12, v13];

      id v15 = v14;
      qword_1E974F2F0 = [v15 UTF8String];
      BOOL v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"IMAPAccount.m" lineNumber:3304 description:@"Got wrong type of store for mailboxURL"];
    }
    BOOL v17 = [v9 replayAction:v5];
  }
  else
  {
    if (v8)
    {
      uint64_t v18 = +[IMAPAccount log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = objc_msgSend(v8, "ef_publicDescription");
        *(_DWORD *)CFArrayCallBacks buf = 138412290;
        uint64_t v22 = v19;
        _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "Couldn't get store from mailbox %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v18 = +[IMAPAccount log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFArrayCallBacks buf = 0;
        _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "Couldn't get mailbox from URL", buf, 2u);
      }
    }

    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)supportsAppleRemoteLinks
{
  id v2 = [(IMAPAccount *)self lastKnownCapabilities];
  char v3 = [v2 containsObject:@"X-APPLE-REMOTE-LINKS"];

  return v3;
}

- (NSString)apsSenderArgument
{
  return self->_apsSenderArgument;
}

- (void)setApsSenderArgument:(id)a3
{
}

- (void)setApsVersion:(int64_t)a3
{
  self->_apsVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsSenderArgument, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_pushRegisteredMailboxes, 0);
  objc_storeStrong((id *)&self->_pushedMailboxUids, 0);
  objc_storeStrong((id *)&self->_apsTopic, 0);
  objc_storeStrong((id *)&self->_eSearchSupported, 0);
  objc_storeStrong((id *)&self->_eSearchSupportedLock, 0);
  objc_storeStrong((id *)&self->_lastKnownCapabilities, 0);
  objc_storeStrong((id *)&self->_lockOrderingArray, 0);
  objc_storeStrong(&self->_packetContextAssertion, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_serverNamespace, 0);
  objc_storeStrong((id *)&self->_separatorChar, 0);
}

+ (id)imapMailboxURLForAccountID:(id)a3 pathComponents:(id)a4
{
  id v28 = a1;
  id v32 = a3;
  id v31 = a4;
  swift_getObjCClassMetadata();
  unint64_t v29 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9748660) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v30 = (uint64_t)&v9 - v29;
  id v4 = (id)MEMORY[0x1F4188790](v32);
  id v5 = v31;
  if (v32)
  {
    id v27 = v32;
    id v22 = v32;
    uint64_t v23 = sub_1A8A76558();
    uint64_t v24 = v6;

    uint64_t v25 = v23;
    uint64_t v26 = v24;
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
  }
  uint64_t v20 = v26;
  uint64_t v21 = v25;
  if (v31)
  {
    id v19 = v31;
    id v16 = v31;
    uint64_t v17 = sub_1A8A76C68();

    uint64_t v18 = v17;
  }
  else
  {
    uint64_t v18 = 0;
  }
  uint64_t v12 = v18;
  swift_getObjCClassMetadata();
  sub_1A814F86C(v21, v20, v12, v30);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_1A8A74998();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = v13 - 8;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(v30, 1) == 1)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = sub_1A8A74898();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v30, v13);
    uint64_t v11 = (void *)v10;
  }
  uint64_t v7 = v11;
  return v7;
}

+ (void)getAccountID:(id *)a3 pathComponents:(id *)a4 fromIMAPMailboxURL:(id)a5
{
  id v10 = a1;
  uint64_t v11 = a3;
  uint64_t v12 = a4;
  id v20 = a5;
  swift_getObjCClassMetadata();
  uint64_t v13 = sub_1A8A74998();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = v13 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v7 - v16;
  unint64_t v18 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9748660) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v5 = (void *)MEMORY[0x1F4188790](v20);
  uint64_t v19 = (uint64_t)&v7 - v18;
  id v6 = v5;
  if (v20)
  {
    id v9 = v20;
    id v8 = v20;
    sub_1A8A74928();
    (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v19, v17, v13);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v19, 0, 1, v13);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v19, 1, 1, v13);
  }
  swift_getObjCClassMetadata();
  sub_1A81500F0(v11, v12, v19);
  sub_1A8121104(v19);
}

- (void)_readCustomInfoFromMailboxCache:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Separator char is missing. Not reading from mailbox cache.", v1, 2u);
}

- (void)_writeCustomInfoToMailboxCache:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_FAULT, "Writing to mailbox cache with nil separator char", v1, 2u);
}

- (void)taskManager
{
  *(_DWORD *)CFArrayCallBacks buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_FAULT, "Unable to use MFSwiftIMAPTaskManager for account %{public}@ on %{public}@", buf, 0x16u);
}

- (void)renameMailbox:(uint64_t)a1 newName:(NSObject *)a2 parent:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Offline renaming is not supported for mailbox %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)renameMailbox:(uint64_t)a1 newName:(NSObject *)a2 parent:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Failed to get connection for mailbox rename %{public}@", (uint8_t *)&v2, 0xCu);
}

@end