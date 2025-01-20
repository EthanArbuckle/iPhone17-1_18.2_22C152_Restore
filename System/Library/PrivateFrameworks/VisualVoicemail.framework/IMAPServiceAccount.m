@interface IMAPServiceAccount
- (BOOL)allowsPartialDownloads;
- (BOOL)getMailboxListWithConnection:(id)a3;
- (BOOL)requiresDataForOfflineTransfersFromStore:(id)a3;
- (BOOL)shouldExpungeMessagesOnDelete;
- (Class)connectionClass;
- (Class)storeClass;
- (Class)storeClassForMailbox:(id)a3;
- (IMAPService)service;
- (IMAPServiceAccount)initWithProperties:(id)a3 mambaID:(const char *)a4 label:(id)a5 accountDir:(id)a6 phoneNumber:(id)a7 isoCountryCode:(id)a8 networkIdentifier:(id)a9;
- (IMAPServiceLibrary)library;
- (MFInvocationQueue)invocationQueue;
- (NSString)networkIdentifier;
- (NSString)serviceICC;
- (NSString)serviceMDN;
- (NSURL)accountDir;
- (NSUUID)serviceLabelID;
- (VMAccountStore)accountStore;
- (__CFString)connectionServiceType;
- (float)mailboxUsage;
- (id).cxx_construct;
- (id)connectionForStore:(id)a3 delegate:(id)a4 options:(unsigned int)a5;
- (id)description;
- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4;
- (id)mimeBodyForAccountRecord:(void *)a3;
- (id)networkAccountIdentifier;
- (id)offlineCacheDirectoryPath;
- (id)password;
- (id)path;
- (id)storeForMailboxUid:(id)a3;
- (unint64_t)credentialAccessibility;
- (unsigned)readBufferSize;
- (unsigned)uidValidityForMailbox:(id)a3;
- (void)_addMonitoredInvocationForIdleConnectionDisconnection;
- (void)_clearConnectionCheckOuts;
- (void)_performDisconnectIdleConnections;
- (void)_startIdleTimer;
- (void)changePIN:(id)a3;
- (void)checkInConnection:(id)a3;
- (void)checkInConnectionsForStore:(id)a3;
- (void)checkInConnectionsPolitelyForStore:(id)a3;
- (void)completeFlagChange;
- (void)dealloc;
- (void)flushIMAPServiceLibraryCache;
- (void)invalidateServiceAccount;
- (void)libraryIMAPStore:(id)a3 bodyDownloadBeganForUid:(unsigned int)a4 data:(id)a5 section:(id)a6;
- (void)libraryIMAPStore:(id)a3 bodyDownloadCompletedForUid:(unsigned int)a4 data:(id)a5 section:(id)a6;
- (void)libraryIMAPStore:(id)a3 bodyDownloadReceivedMoreDataForUid:(unsigned int)a4 data:(id)a5 section:(id)a6;
- (void)moveMessagesWithTokensToDeleted:(id)a3;
- (void)moveMessagesWithTokensToInbox:(id)a3;
- (void)moveMessagesWithTokensToRead:(id)a3;
- (void)moveMessagesWithTokensToTrash:(id)a3;
- (void)movePendingMessages:(id)a3 isGoingToTrash:(BOOL)a4;
- (void)movePendingMessagesToInbox:(id)a3;
- (void)movePendingMessagesToTrash:(id)a3;
- (void)prepareForFlagChange;
- (void)releaseAllConnections;
- (void)setAccountDir:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setConnectionIdleTimeout:(double)a3;
- (void)setInvocationQueue:(id)a3;
- (void)setLongLifeMessagesCache;
- (void)setNetworkIdentifier:(id)a3;
- (void)setPassword:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceICC:(id)a3;
- (void)setServiceLabelID:(id)a3;
- (void)setServiceMDN:(id)a3;
- (void)setUidValidity:(unsigned int)a3 forMailbox:(id)a4;
- (void)setupLibrary;
- (void)storeFlags:(unsigned int)a3 forRecord:(void *)a4;
- (void)storeFlags:(unsigned int)a3 forRecord:(void *)a4 usingMessage:(id)a5;
- (void)storeFlagsWithMask:(id)a3 forRecordsWithIdentifiers:(id)a4;
- (void)willSetFlags:(unsigned int)a3 state:(unsigned int)a4 forRecord:(void *)a5 needToBeStored:(BOOL)a6;
@end

@implementation IMAPServiceAccount

- (unint64_t)credentialAccessibility
{
  return 0;
}

- (IMAPServiceAccount)initWithProperties:(id)a3 mambaID:(const char *)a4 label:(id)a5 accountDir:(id)a6 phoneNumber:(id)a7 isoCountryCode:(id)a8 networkIdentifier:(id)a9
{
  a3;
  id v13 = a5;
  id v14 = a6;
  a7;
  a8;
  a9;
  operator new();
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  objc_storeWeak((id *)&self->_service, 0);
  [(NSTimer *)self->_idleTimer invalidate];
  [*(id *)&self->IMAP_Account_opaque[OBJC_IVAR___MailAccount__library] invalidateServiceLibrary];
  cachedStores = self->_cachedStores;
  if (cachedStores) {
    CFRelease(cachedStores);
  }
  v5.receiver = self;
  v5.super_class = (Class)IMAPServiceAccount;
  [(IMAPServiceAccount *)&v5 dealloc];
}

- (void)invalidateServiceAccount
{
  [(NSRecursiveLock *)self->_storeCacheLock lock];
  cachedStores = self->_cachedStores;
  if (cachedStores)
  {
    CFRelease(cachedStores);
    self->_cachedStores = 0;
  }
  *((unsigned char *)self + 352) |= 2u;
  [(NSRecursiveLock *)self->_storeCacheLock unlock];
  [(IMAPServiceAccount *)self invalidate];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(IMAPServiceAccount *)self serviceMDN];
  objc_super v5 = [(IMAPServiceAccount *)self hostname];
  v6 = [(IMAPServiceAccount *)self username];
  v7 = +[NSString stringWithFormat:@"<%@ %p servicePhoneNumber=%@ hostname=%@ username=%@>", v3, self, v4, v5, v6];

  return v7;
}

- (id)password
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  uint64_t v3 = [WeakRetained password];

  return v3;
}

- (void)setPassword:(id)a3
{
  p_service = &self->_service;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_service);
  [WeakRetained setPassword:v4];
}

- (Class)storeClass
{
  return (Class)objc_opt_class();
}

- (Class)storeClassForMailbox:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 name];
  unsigned int v6 = [v5 isEqualToString:@"Greetings"];

  if (v6) {
    v7 = (objc_class *)objc_opt_class();
  }
  else {
    v7 = [(IMAPServiceAccount *)self storeClass];
  }
  v8 = v7;

  return v8;
}

- (id)storeForMailboxUid:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_storeCacheLock lock];
  cachedStores = self->_cachedStores;
  if (!cachedStores
    || (CFDictionaryGetValue(cachedStores, v4), (unsigned int v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)IMAPServiceAccount;
    unsigned int v6 = [(IMAPServiceAccount *)&v9 storeForMailboxUid:v4];
    if (v6)
    {
      if ((*((unsigned char *)self + 352) & 2) == 0)
      {
        Mutable = self->_cachedStores;
        if (!Mutable)
        {
          Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          self->_cachedStores = Mutable;
        }
        CFDictionarySetValue(Mutable, v4, v6);
      }
    }
  }
  [(NSRecursiveLock *)self->_storeCacheLock unlock];

  return v6;
}

- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IMAPServiceAccount;
  -[IMAPServiceAccount mailboxUidForRelativePath:create:](&v13, "mailboxUidForRelativePath:create:", v6, [v6 isEqualToString:@"INBOX"]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    objc_super v9 = [v6 stringByDeletingLastPathComponent];
    v10 = [(IMAPServiceAccount *)self mailboxUidForRelativePath:v9 create:0];

    if (v10)
    {
      v11 = [v6 lastPathComponent];
      id v7 = [(IMAPServiceAccount *)self _newMailboxWithParent:v10 name:v11 attributes:0 dictionary:0 withCreationOption:0];
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

- (Class)connectionClass
{
  return (Class)objc_opt_class();
}

- (id)path
{
  return 0;
}

- (__CFString)connectionServiceType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  BOOL v4 = (__CFString *)[WeakRetained connectionServiceType];
  unsigned int v5 = [WeakRetained isWiFiNetworkAvailable];
  if (v4) {
    int v6 = v5;
  }
  else {
    int v6 = 1;
  }
  if (v6 == 1)
  {
    v12.receiver = self;
    v12.super_class = (Class)IMAPServiceAccount;
    BOOL v4 = [(IMAPServiceAccount *)&v12 connectionServiceType];
    id v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      *(_DWORD *)buf = 136315906;
      uint64_t v14 = v8;
      __int16 v15 = 2080;
      v16 = " ";
      __int16 v17 = 2112;
      v18 = v4;
      __int16 v19 = 2112;
      id v20 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%susing super connectionServiceType: %@, service %@", buf, 0x2Au);
    }
  }
  [WeakRetained setLastUsedConnectionType:v4];
  objc_super v9 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    *(_DWORD *)buf = 136315906;
    uint64_t v14 = v10;
    __int16 v15 = 2080;
    v16 = " ";
    __int16 v17 = 2112;
    v18 = v4;
    __int16 v19 = 2112;
    id v20 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%sconnectionServiceType: %@, service %@", buf, 0x2Au);
  }

  return v4;
}

- (id)offlineCacheDirectoryPath
{
  [(NSRecursiveLock *)self->_serviceAccountLock lock];
  if (!self->_offlineCachePath)
  {
    uint64_t v3 = [(IMAPServiceAccount *)self accountDir];
    BOOL v4 = [v3 URLByAppendingPathComponent:@"OfflineCache"];
    unsigned int v5 = [v4 path];
    offlineCachePath = self->_offlineCachePath;
    self->_offlineCachePath = v5;
  }
  [(NSRecursiveLock *)self->_serviceAccountLock unlock];
  id v7 = self->_offlineCachePath;
  return v7;
}

- (BOOL)requiresDataForOfflineTransfersFromStore:(id)a3
{
  return 0;
}

- (void)setupLibrary
{
  uint64_t v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    int v6 = 136315394;
    uint64_t v7 = v4;
    __int16 v8 = 2080;
    objc_super v9 = " ";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sIMAPServiceAccount::setupLibrary", (uint8_t *)&v6, 0x16u);
  }

  unsigned int v5 = [[IMAPServiceLibrary alloc] initWithServiceAccount:self];
  [(IMAPServiceAccount *)self setLibrary:v5];
}

- (IMAPServiceLibrary)library
{
  v4.receiver = self;
  v4.super_class = (Class)IMAPServiceAccount;
  v2 = [(IMAPServiceAccount *)&v4 library];
  return (IMAPServiceLibrary *)v2;
}

- (void)flushIMAPServiceLibraryCache
{
  id v2 = [(IMAPServiceAccount *)self library];
  [v2 flushMessageCache];
}

- (void)setLongLifeMessagesCache
{
  id v2 = [(IMAPServiceAccount *)self library];
  [v2 setLongLifeMessagesCache];
}

- (BOOL)allowsPartialDownloads
{
  return 0;
}

- (id)mimeBodyForAccountRecord:(void *)a3
{
  unsigned int v5 = [(IMAPServiceAccount *)self library];
  int v6 = [v5 messageWithAccountStoreRecord:a3];

  if (v6)
  {
    CFStringRef v7 = VMStoreRecordCopyDescription((uint64_t)a3);
    __int16 v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      int v12 = 136315906;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      __int16 v15 = " ";
      __int16 v16 = 2112;
      __int16 v17 = v6;
      __int16 v18 = 2112;
      CFStringRef v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sDownloading data for message %@ record %@", (uint8_t *)&v12, 0x2Au);
    }

    uint64_t v10 = [v6 messageBody];
    if (v7) {
      CFRelease(v7);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)prepareForFlagChange
{
}

- (void)completeFlagChange
{
}

- (void)willSetFlags:(unsigned int)a3 state:(unsigned int)a4 forRecord:(void *)a5 needToBeStored:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  int v12 = v11;
  if (a3)
  {
    if (a4) {
      CFStringRef v13 = @"YES";
    }
    else {
      CFStringRef v13 = @"NO";
    }
    [v11 setObject:v13 forKey:MessageIsRead];
  }
  if ((a3 & 4) != 0)
  {
    if ((a4 & 4) != 0) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    [v12 setObject:v14 forKey:MessageIsDeleted];
  }
  __int16 v15 = VMStoreRecordCopyFlagsDescription(a3);
  __int16 v16 = VMStoreRecordCopyFlagsDescription(a4);
  __int16 v17 = (__CFString *)VMStoreRecordCopyDescription((uint64_t)a5);
  __int16 v18 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    *(_DWORD *)buf = 136316418;
    uint64_t v27 = v19;
    __int16 v28 = 2080;
    v29 = " ";
    __int16 v30 = 2112;
    v31 = v15;
    __int16 v32 = 2112;
    v33 = v16;
    __int16 v34 = 2112;
    v35 = v12;
    __int16 v36 = 2112;
    v37 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%swillSetFlags: flagsMask=%@, flagState=%@, dict=%@ for record %@", buf, 0x3Eu);
  }

  id v20 = [(IMAPServiceAccount *)self library];
  v21 = [v20 messageWithAccountStoreRecord:a5];

  id v22 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v21, 0);
  v23 = [v21 messageStore];
  v24 = v23;
  if (v6) {
    id v25 = [v23 willSetFlagsFromDictionary:v12 forMessages:v22];
  }
  else {
    [v23 addFlagChanges:v12 forMessages:v22];
  }
}

- (void)storeFlags:(unsigned int)a3 forRecord:(void *)a4 usingMessage:(id)a5
{
  id v8 = a5;
  uint64_t v9 = VMStoreRecordCopyFlagsDescription(a3);
  CFStringRef v10 = VMStoreRecordCopyDescription((uint64_t)a4);
  id v11 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    CFStringRef v13 = [(IMAPServiceAccount *)self accountStore];
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = v12;
    __int16 v31 = 2080;
    __int16 v32 = " ";
    __int16 v33 = 2112;
    __int16 v34 = v9;
    __int16 v35 = 2112;
    CFStringRef v36 = v10;
    __int16 v37 = 2112;
    v38 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s%sStore flags with mask:%@ for record:%@ store %@ to the server", buf, 0x34u);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (a3)
  {
    if (v8
      || ([(IMAPServiceAccount *)self library],
          CFStringRef v14 = objc_claimAutoreleasedReturnValue(),
          [v14 messageWithAccountStoreRecord:a4],
          id v8 = (id)objc_claimAutoreleasedReturnValue(),
          v14,
          v8))
    {
      __int16 v15 = [v8 messageStore];
      __int16 v16 = (__CFString *)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v8, 0);
      char Flags = VMStoreRecordGetFlags((uint64_t)a4);
      __int16 v18 = (__CFString *)objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v19 = v18;
      if (a3)
      {
        if (Flags) {
          CFStringRef v20 = @"YES";
        }
        else {
          CFStringRef v20 = @"NO";
        }
        [(__CFString *)v18 setObject:v20 forKey:MessageIsRead];
      }
      if ((a3 & 4) != 0)
      {
        if ((Flags & 0x44) != 0) {
          CFStringRef v21 = @"YES";
        }
        else {
          CFStringRef v21 = @"NO";
        }
        [(__CFString *)v19 setObject:v21 forKey:MessageIsDeleted];
      }
      id v22 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
        *(_DWORD *)buf = 136315906;
        uint64_t v30 = v23;
        __int16 v31 = 2080;
        __int16 v32 = " ";
        __int16 v33 = 2112;
        __int16 v34 = v19;
        __int16 v35 = 2112;
        CFStringRef v36 = v16;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I %s%sSyncing flags %@ for messages %@ to the server", buf, 0x2Au);
      }

      id v24 = [v15 setFlagsFromDictionary:v19 forMessages:v16];
      if ((a3 & 4) != 0)
      {
        id v25 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
          int Identifier = VMStoreRecordGetIdentifier(a4);
          *(_DWORD *)buf = 136315650;
          uint64_t v30 = v26;
          __int16 v31 = 2080;
          __int16 v32 = " ";
          __int16 v33 = 1024;
          LODWORD(v34) = Identifier;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#I %s%sExpunging record with identifier %d", buf, 0x1Cu);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
        [WeakRetained _removePendingDeleteForRecord:a4];

        [v15 doCompact];
      }
    }
  }
}

- (void)storeFlagsWithMask:(id)a3 forRecordsWithIdentifiers:(id)a4
{
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = a4;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      CFStringRef v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v10), "integerValue", (void)v12);
        id v11 = (const void *)VMStoreCopyRecordWithIdentifier();
        if (v11)
        {
          -[IMAPServiceAccount storeFlags:forRecord:](self, "storeFlags:forRecord:", [v6 intValue], v11);
          CFRelease(v11);
        }
        CFStringRef v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)storeFlags:(unsigned int)a3 forRecord:(void *)a4
{
}

- (void)movePendingMessagesToTrash:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    int v7 = 136315394;
    uint64_t v8 = v6;
    __int16 v9 = 2080;
    CFStringRef v10 = " ";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] IMAPServiceAccount::movePendingMessagesToTrash", (uint8_t *)&v7, 0x16u);
  }

  [(IMAPServiceAccount *)self movePendingMessages:v4 isGoingToTrash:1];
}

- (void)movePendingMessagesToInbox:(id)a3
{
}

- (void)movePendingMessages:(id)a3 isGoingToTrash:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (__CFString *)a3;
  int v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    CFStringRef v9 = @"Primary";
    if (v4) {
      CFStringRef v9 = @"Trash";
    }
    int v23 = 136315906;
    uint64_t v24 = v8;
    __int16 v25 = 2080;
    uint64_t v26 = " ";
    __int16 v27 = 2112;
    CFStringRef v28 = v6;
    __int16 v29 = 2112;
    CFStringRef v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sMoving messages %@ to %@ mailbox", (uint8_t *)&v23, 0x2Au);
  }

  if (v4) {
    CFStringRef v10 = @"Trash";
  }
  else {
    CFStringRef v10 = @"INBOX";
  }
  id v11 = v10;
  long long v12 = [(IMAPServiceAccount *)self mailboxUidForRelativePath:v11 create:1];
  long long v13 = +[MFMailMessageStore copyMessages:v6 toMailbox:v12 markAsRead:1 deleteOriginals:1 isDeletion:v4];
  long long v14 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    __int16 v16 = [v13 debugDescription];
    int v23 = 136315650;
    uint64_t v24 = v15;
    __int16 v25 = 2080;
    uint64_t v26 = " ";
    __int16 v27 = 2112;
    CFStringRef v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sMessage Transfer result %@", (uint8_t *)&v23, 0x20u);
  }
  if ([v13 resultCode] == (id)1)
  {
    __int16 v17 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      CFStringRef v19 = @"Inbox";
      if (!v4) {
        CFStringRef v19 = @"Trash";
      }
      int v23 = 136315650;
      uint64_t v24 = v18;
      __int16 v25 = 2080;
      uint64_t v26 = " ";
      __int16 v27 = 2112;
      CFStringRef v28 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s%sExpunging messages from %@ mailbox", (uint8_t *)&v23, 0x20u);
    }

    if (v4) {
      CFStringRef v20 = @"INBOX";
    }
    else {
      CFStringRef v20 = @"Trash";
    }
    CFStringRef v21 = [(IMAPServiceAccount *)self mailboxUidForRelativePath:v20 create:0];
    id v22 = [(IMAPServiceAccount *)self storeForMailboxUid:v21];
    [v22 doCompact];
  }
}

- (void)moveMessagesWithTokensToTrash:(id)a3
{
  id v37 = a3;
  BOOL v4 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    *(_DWORD *)buf = 136315394;
    uint64_t v49 = v5;
    __int16 v50 = 2080;
    v51 = " ";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] IMAPServiceAccount::moveMessagesWithTokensToTrash", buf, 0x16u);
  }
  v43 = self;

  v40 = +[NSMutableArray array];
  v39 = +[NSMutableDictionary dictionary];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v37;
  id v6 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v45;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v9 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        CFStringRef v10 = [(IMAPServiceAccount *)v43 accountStore];
        CFArrayRef v11 = (const __CFArray *)sub_100079AB0(v10, (uint64_t)v9);

        if (v11)
        {
          if (CFArrayGetCount(v11))
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v11, 0);
            long long v13 = [(IMAPServiceAccount *)v43 accountStore];
            char v14 = sub_10007939C(v13, (uint64_t)ValueAtIndex);

            if ((v14 & 0xC) == 0)
            {
              CFArrayRef v15 = (const __CFArray *)VMStoreCopyRecordsWithTokenInMailbox(v9, 3uLL);
              CFArrayRef v16 = v15;
              if (v15)
              {
                if (CFArrayGetCount(v15))
                {
                  v41 = CFArrayGetValueAtIndex(v16, 0);
                  __int16 v17 = sub_100020EE0((id *)v43->logger.__ptr_.__value_);
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v38 = *(void *)&v43->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
                    id v18 = (id)sub_10006E7DC(v41);
                    CFStringRef v19 = (void *)sub_10006E7DC(ValueAtIndex);
                    *(_DWORD *)buf = 136315906;
                    uint64_t v49 = v38;
                    __int16 v50 = 2080;
                    v51 = " ";
                    __int16 v52 = 2112;
                    id v53 = v18;
                    __int16 v54 = 2112;
                    v55 = v19;
                    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s%smoving to Trash. Main has: %@, account has: %@", buf, 0x2Au);
                  }
                  uint64_t TrashedDate = VMStoreRecordGetTrashedDate((uint64_t)v41);
                  CFStringRef v21 = [(IMAPServiceAccount *)v43 accountStore];
                  sub_100079170(v21, (uint64_t)ValueAtIndex, TrashedDate);
                }
                CFRelease(v16);
              }
              id v22 = [(IMAPServiceAccount *)v43 library];
              int v23 = [v22 messageWithAccountStoreRecord:ValueAtIndex];

              if (v23)
              {
                [v40 addObject:v23];
                uint64_t v24 = [v23 messageIDHeader];
                [v39 setObject:v9 forKeyedSubscript:v24];
              }
            }
          }
          CFRelease(v11);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v6);
  }

  if ([v40 count])
  {
    __int16 v25 = sub_100020EE0((id *)v43->logger.__ptr_.__value_);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)&v43->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      id v27 = [v40 count];
      *(_DWORD *)buf = 136315650;
      uint64_t v49 = v26;
      __int16 v50 = 2080;
      v51 = " ";
      __int16 v52 = 2048;
      id v53 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#I %s%s========= Moving %lu messages to Trash", buf, 0x20u);
    }

    CFStringRef v28 = [(IMAPServiceAccount *)v43 mailboxUidForRelativePath:@"Trash" create:1];
    __int16 v29 = +[MFMailMessageStore copyMessages:v40 toMailbox:v28 markAsRead:0 deleteOriginals:1 isDeletion:1];
    CFStringRef v30 = sub_100020EE0((id *)v43->logger.__ptr_.__value_);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)&v43->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      __int16 v32 = [v29 debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v49 = v31;
      __int16 v50 = 2080;
      v51 = " ";
      __int16 v52 = 2112;
      id v53 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#I %s%s========= Message Transfer result %@", buf, 0x20u);
    }
    __int16 v33 = [(IMAPServiceAccount *)v43 mailboxUidForRelativePath:@"INBOX" create:0];
    __int16 v34 = [(IMAPServiceAccount *)v43 storeForMailboxUid:v33];
    [v34 doCompact];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v43->_service);
  [WeakRetained scheduleAutomatedTrashCompaction];
}

- (void)moveMessagesWithTokensToInbox:(id)a3
{
  id v34 = a3;
  uint64_t v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  context = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    *(_DWORD *)buf = 136315394;
    uint64_t v44 = v6;
    __int16 v45 = 2080;
    long long v46 = " ";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] IMAPServiceAccount::moveMessagesWithTokensToInbox", buf, 0x16u);
  }

  id v37 = +[NSMutableArray array];
  CFStringRef v36 = +[NSMutableDictionary dictionary];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = v34;
  id v8 = [v7 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v8)
  {
    uint64_t v38 = *(void *)v40;
    id v35 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v40 != v38) {
          objc_enumerationMutation(v7);
        }
        uint64_t v10 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        CFArrayRef v11 = [(IMAPServiceAccount *)self accountStore];
        CFArrayRef v12 = (const __CFArray *)sub_100079AB0(v11, v10);

        if (v12)
        {
          if (CFArrayGetCount(v12))
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v12, 0);
            char v14 = [(IMAPServiceAccount *)self accountStore];
            char v15 = sub_10007939C(v14, (uint64_t)ValueAtIndex);

            if ((v15 & 0xC) == 8)
            {
              CFArrayRef v16 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v17 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
                id v18 = (void *)sub_10006E7DC(ValueAtIndex);
                *(_DWORD *)buf = 136315650;
                uint64_t v44 = v17;
                __int16 v45 = 2080;
                long long v46 = " ";
                __int16 v47 = 2112;
                id v48 = v18;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I %s%smoving to Inbox. %@", buf, 0x20u);

                id v7 = v35;
              }

              CFStringRef v19 = [(IMAPServiceAccount *)self library];
              CFStringRef v20 = [v19 messageWithAccountStoreRecord:ValueAtIndex];

              if (v20)
              {
                [v37 addObject:v20];
                CFStringRef v21 = [v20 messageIDHeader];
                [v36 setObject:v10 forKeyedSubscript:v21];
              }
            }
          }
          CFRelease(v12);
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v8);
  }

  if ([v37 count])
  {
    id v22 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      id v24 = [v37 count];
      *(_DWORD *)buf = 136315650;
      uint64_t v44 = v23;
      __int16 v45 = 2080;
      long long v46 = " ";
      __int16 v47 = 2048;
      id v48 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I %s%s========= Moving %lu messages to Inbox", buf, 0x20u);
    }

    __int16 v25 = [(IMAPServiceAccount *)self primaryMailboxUid];
    uint64_t v26 = +[MFMailMessageStore copyMessages:v37 toMailbox:v25 markAsRead:0 deleteOriginals:1 isDeletion:0];
    id v27 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      __int16 v29 = [v26 debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v44 = v28;
      __int16 v45 = 2080;
      long long v46 = " ";
      __int16 v47 = 2112;
      id v48 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#I %s%s========= Message Transfer result %@", buf, 0x20u);
    }
    if ([v26 resultCode] == (id)1)
    {
      CFStringRef v30 = [(IMAPServiceAccount *)self mailboxUidForRelativePath:@"Trash" create:0];
      uint64_t v31 = [(IMAPServiceAccount *)self storeForMailboxUid:v30];
      [v31 doCompact];
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  [WeakRetained scheduleAutomatedTrashCompaction];
}

- (void)moveMessagesWithTokensToDeleted:(id)a3
{
  id v45 = a3;
  uint64_t v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  context = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    *(_DWORD *)buf = 136315394;
    uint64_t v60 = v6;
    __int16 v61 = 2080;
    v62 = " ";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] IMAPServiceAccount::moveMessagesWithTokensToDeleted", buf, 0x16u);
  }

  uint64_t v49 = +[NSMutableArray array];
  id v48 = +[NSMutableDictionary dictionary];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v7 = v45;
  id v8 = [v7 countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v55;
    id v47 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v55 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        CFArrayRef v12 = [(IMAPServiceAccount *)self accountStore];
        CFArrayRef v13 = (const __CFArray *)sub_100079AB0(v12, v11);

        if (v13)
        {
          if (CFArrayGetCount(v13))
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v13, 0);
            char v15 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v16 = v9;
              uint64_t v17 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
              id v18 = (void *)sub_10006E7DC(ValueAtIndex);
              *(_DWORD *)buf = 136315650;
              uint64_t v60 = v17;
              __int16 v61 = 2080;
              v62 = " ";
              __int16 v63 = 2112;
              id v64 = v18;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I %s%smoving to Deleted. %@", buf, 0x20u);

              id v7 = v47;
              uint64_t v9 = v16;
            }

            CFStringRef v19 = [(IMAPServiceAccount *)self library];
            CFStringRef v20 = [v19 messageWithAccountStoreRecord:ValueAtIndex];

            if (v20)
            {
              [v49 addObject:v20];
              CFStringRef v21 = [v20 messageIDHeader];
              [v48 setObject:v11 forKeyedSubscript:v21];
            }
          }
          CFRelease(v13);
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v54 objects:v65 count:16];
    }
    while (v8);
  }

  if ([v49 count])
  {
    id v22 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      id v24 = [v49 count];
      *(_DWORD *)buf = 136315650;
      uint64_t v60 = v23;
      __int16 v61 = 2080;
      v62 = " ";
      __int16 v63 = 2048;
      id v64 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I %s%s========= Deleting %lu messages", buf, 0x20u);
    }

    __int16 v25 = [v49 objectAtIndex:0];
    long long v46 = [v25 messageStore];

    [v46 deleteMessages:v49 moveToTrash:0];
    v43 = +[MFActivityMonitor currentTracebleMonitor];
    uint64_t v26 = [v43 error];
    id v27 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      *(_DWORD *)buf = 136315650;
      uint64_t v60 = v28;
      __int16 v61 = 2080;
      v62 = " ";
      __int16 v63 = 2112;
      id v64 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#I %s%s========= Deletion complete with %@", buf, 0x20u);
    }

    if (!v26)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v29 = v48;
      id v30 = [v29 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v51;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(void *)v51 != v31) {
              objc_enumerationMutation(v29);
            }
            uint64_t v33 = *(void *)(*((void *)&v50 + 1) + 8 * (void)j);
            id v34 = [(IMAPServiceAccount *)self accountStore];
            id v35 = [v29 objectForKeyedSubscript:v33];
            CFArrayRef v36 = (const __CFArray *)sub_100079AB0(v34, (uint64_t)v35);

            if (v36)
            {
              if (CFArrayGetCount(v36))
              {
                id v37 = CFArrayGetValueAtIndex(v36, 0);
                uint64_t v38 = [(IMAPServiceAccount *)self accountStore];
                sub_1000798C4(v38, (uint64_t)v37);
              }
              CFRelease(v36);
            }
          }
          id v30 = [v29 countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v30);
      }

      long long v39 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
        *(_DWORD *)buf = 136315394;
        uint64_t v60 = v40;
        __int16 v61 = 2080;
        v62 = " ";
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#I %s%sSaving updated records to store", buf, 0x16u);
      }

      long long v41 = [(IMAPServiceAccount *)self accountStore];
      [v41 save];
    }
    [v46 doCompact];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  [WeakRetained scheduleAutomatedTrashCompaction];
}

- (void)moveMessagesWithTokensToRead:(id)a3
{
  id v49 = a3;
  BOOL v4 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    *(_DWORD *)buf = 136315394;
    uint64_t v64 = v5;
    __int16 v65 = 2080;
    v66 = " ";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] IMAPServiceAccount::moveMessagesWithTokensToRead", buf, 0x16u);
  }

  long long v52 = +[NSMutableArray array];
  long long v51 = +[NSMutableDictionary dictionary];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v49;
  id v6 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v59;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v10 = [(IMAPServiceAccount *)self accountStore];
        CFArrayRef v11 = (const __CFArray *)sub_100079AB0(v10, v9);

        if (v11)
        {
          if (CFArrayGetCount(v11))
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v11, 0);
            CFArrayRef v13 = [(IMAPServiceAccount *)self accountStore];
            char v14 = sub_10007939C(v13, (uint64_t)ValueAtIndex);

            if ((v14 & 5) == 0)
            {
              char v15 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v16 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
                uint64_t v17 = (void *)sub_10006E7DC(ValueAtIndex);
                *(_DWORD *)buf = 136315650;
                uint64_t v64 = v16;
                __int16 v65 = 2080;
                v66 = " ";
                __int16 v67 = 2112;
                uint64_t v68 = (uint64_t)v17;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I %s%smoving to Read. %@", buf, 0x20u);
              }
              id v18 = [(IMAPServiceAccount *)self library];
              CFStringRef v19 = [v18 messageWithAccountStoreRecord:ValueAtIndex];

              if (v19)
              {
                [v52 addObject:v19];
                CFStringRef v20 = [v19 messageIDHeader];
                [v51 setObject:v9 forKeyedSubscript:v20];
              }
            }
          }
          CFRelease(v11);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
    }
    while (v6);
  }

  if ([v52 count])
  {
    CFStringRef v21 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      *(_DWORD *)buf = 136315650;
      uint64_t v64 = v22;
      __int16 v65 = 2080;
      v66 = " ";
      __int16 v67 = 2112;
      uint64_t v68 = (uint64_t)v52;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#I %s%s==== Syncing READ messages %@ to the server", buf, 0x20u);
    }

    id v47 = +[NSDictionary dictionaryWithObject:@"YES" forKey:MessageIsRead];
    uint64_t v23 = [v52 objectAtIndex:0];
    long long v50 = [v23 messageStore];

    id v24 = [v50 setFlagsFromDictionary:v47 forMessages:v52];
    __int16 v25 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      *(_DWORD *)buf = 136315394;
      uint64_t v64 = v26;
      __int16 v65 = 2080;
      v66 = " ";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#I %s%s==== Syncing READ SEMI done", buf, 0x16u);
    }

    id v45 = +[MFActivityMonitor currentTracebleMonitor];
    uint64_t v46 = [v45 error];
    id v27 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      *(_DWORD *)buf = 136315650;
      uint64_t v64 = v28;
      __int16 v65 = 2080;
      v66 = " ";
      __int16 v67 = 2112;
      uint64_t v68 = v46;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#I %s%s==== Syncing READ done with %@", buf, 0x20u);
    }

    id v29 = (void *)v46;
    if (!v46)
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v30 = v51;
      id v31 = [v30 countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v55;
        do
        {
          for (j = 0; j != v31; j = (char *)j + 1)
          {
            if (*(void *)v55 != v32) {
              objc_enumerationMutation(v30);
            }
            uint64_t v34 = *(void *)(*((void *)&v54 + 1) + 8 * (void)j);
            id v35 = [(IMAPServiceAccount *)self accountStore];
            CFArrayRef v36 = [v30 objectForKeyedSubscript:v34];
            CFArrayRef v37 = (const __CFArray *)sub_100079AB0(v35, (uint64_t)v36);

            if (v37)
            {
              if (CFArrayGetCount(v37))
              {
                uint64_t v38 = CFArrayGetValueAtIndex(v37, 0);
                long long v39 = [(IMAPServiceAccount *)self accountStore];
                uint64_t v40 = [(IMAPServiceAccount *)self accountStore];
                int v41 = sub_10007939C(v40, (uint64_t)v38);
                sub_1000793CC(v39, (uint64_t)v38, v41 | 1u);
              }
              CFRelease(v37);
            }
          }
          id v31 = [v30 countByEnumeratingWithState:&v54 objects:v62 count:16];
        }
        while (v31);
      }

      long long v42 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
        *(_DWORD *)buf = 136315394;
        uint64_t v64 = v43;
        __int16 v65 = 2080;
        v66 = " ";
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#I %s%sSaving updated records to store", buf, 0x16u);
      }

      uint64_t v44 = [(IMAPServiceAccount *)self accountStore];
      [v44 save];

      id v29 = 0;
    }
  }
}

- (void)changePIN:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMAPServiceAccount *)self connectionForStore:0 delegate:self options:9];
  id v6 = +[MFActivityMonitor currentTracebleMonitor];
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      uint64_t v10 = [(IMAPServiceAccount *)self serviceMDN];
      int v16 = 136315650;
      uint64_t v17 = v9;
      __int16 v18 = 2080;
      CFStringRef v19 = " ";
      __int16 v20 = 2112;
      CFStringRef v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] Attempting to set the password for IMAP service account with service phone number %@", (uint8_t *)&v16, 0x20u);
    }
    [v5 changePassword:v4];
    CFArrayRef v11 = [v7 error];
    BOOL v12 = v11 == 0;

    if (v12)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
      [WeakRetained setMailboxRequiresSetup:0];
    }
    char v14 = 0;
  }
  else
  {
    char v14 = [v6 error];
    if (!v14)
    {
      char v14 = +[NSError errorWithDomain:kVVErrorDomain code:1023 localizedDescription:@"Could not establish IMAP connection."];
    }
    char v15 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100080774((uint64_t)self, (uint64_t)v14, v15);
    }

    if (v14) {
      [v7 setError:v14];
    }
  }
}

- (float)mailboxUsage
{
  uint64_t v3 = [(IMAPServiceAccount *)self connectionForStore:0 delegate:self options:9];
  if (v3)
  {
    id v4 = [(IMAPServiceAccount *)self primaryMailboxUid];
    uint64_t v5 = [(IMAPServiceAccount *)self nameForMailboxUid:v4];

    id v6 = [v3 quotaPercentagesForMailbox:v5];
    uint64_t v7 = (char *)[v6 count];
    if (v7)
    {
      id v8 = 0;
      float v9 = 0.0;
      do
      {
        uint64_t v10 = [v6 objectAtIndex:v8];
        [v10 floatValue];
        float v12 = v11;

        if (v12 > v9) {
          float v9 = v12;
        }
        ++v8;
      }
      while (v7 != v8);
    }
    else
    {
      float v9 = 0.0;
    }
    if ((unint64_t)(uint64_t)(float)(v9 * 100.0) >= 0x50
      && [v3 selectMailbox:v5 withAccount:self])
    {
      CFArrayRef v13 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
        int v16 = 136315650;
        uint64_t v17 = v14;
        __int16 v18 = 2080;
        CFStringRef v19 = " ";
        __int16 v20 = 2048;
        uint64_t v21 = (uint64_t)(float)(v9 * 100.0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s%sMailbox usage is at %ld%%. Expunging messages from Inbox.", (uint8_t *)&v16, 0x20u);
      }

      [v3 expunge];
    }
    [(IMAPServiceAccount *)self checkInConnection:v3];
  }
  else
  {
    float v9 = 0.0;
  }

  return v9;
}

- (unsigned)uidValidityForMailbox:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 7)
  {
    uint64_t v5 = [(IMAPServiceAccount *)self accountStore];
    unsigned int v6 = sub_100079AB8(v5, 0);
  }
  else
  {
    uint64_t v5 = [(IMAPServiceAccount *)self accountStore];
    unsigned int v6 = sub_100079AB8(v5, (uint64_t)[v4 name]);
  }
  unsigned int v7 = v6;

  id v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    uint64_t v10 = [v4 name];
    int v12 = 136316162;
    uint64_t v13 = v9;
    __int16 v14 = 2080;
    char v15 = " ";
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 1024;
    unsigned int v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sgetUidValidity for mailbox %@ validity %u, service account %@", (uint8_t *)&v12, 0x30u);
  }
  return v7;
}

- (void)setUidValidity:(unsigned int)a3 forMailbox:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  unsigned int v7 = [(IMAPServiceAccount *)self uidValidityForMailbox:v6];
  id v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    uint64_t v10 = [v6 name];
    int v26 = 136316418;
    uint64_t v27 = v9;
    __int16 v28 = 2080;
    id v29 = " ";
    __int16 v30 = 2112;
    id v31 = v10;
    __int16 v32 = 1024;
    int v33 = v4;
    __int16 v34 = 1024;
    unsigned int v35 = v7;
    __int16 v36 = 2112;
    CFArrayRef v37 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%ssetUidValidity for mailbox %@ validity %u oldValidity %u, service account %@", (uint8_t *)&v26, 0x36u);
  }
  if ([v6 type] == 7)
  {
    if (!v7)
    {
      uint64_t v22 = [(IMAPServiceAccount *)self accountStore];
      sub_100079AC0(v22, 0, v4);

      uint64_t v23 = [(IMAPServiceAccount *)self accountStore];
      [v23 save];

      uint64_t v21 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
        __int16 v25 = [(IMAPServiceAccount *)self accountStore];
        int v26 = 136315906;
        uint64_t v27 = v24;
        __int16 v28 = 2080;
        id v29 = " ";
        __int16 v30 = 2112;
        id v31 = v25;
        __int16 v32 = 1024;
        int v33 = v4;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#I %s%sSave account store %@ for new UidValidity %u", (uint8_t *)&v26, 0x26u);
      }
      goto LABEL_13;
    }
    if (v7 != v4)
    {
      float v11 = [(IMAPServiceAccount *)self accountStore];
      [v11 removeAllRecords];

      int v12 = [(IMAPServiceAccount *)self accountStore];
      sub_100079AC0(v12, 0, v4);

      uint64_t v13 = [(IMAPServiceAccount *)self accountStore];
      [v13 save];

      __int16 v14 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
        __int16 v16 = [(IMAPServiceAccount *)self accountStore];
        int v26 = 136315650;
        uint64_t v27 = v15;
        __int16 v28 = 2080;
        id v29 = " ";
        __int16 v30 = 2112;
        id v31 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sSave account store %@", (uint8_t *)&v26, 0x20u);
      }
      p_service = &self->_service;
      id WeakRetained = objc_loadWeakRetained((id *)p_service);
      if (WeakRetained)
      {
        id v19 = objc_loadWeakRetained((id *)p_service);
        BOOL v20 = [v19 currentTaskType] == (id)1;

        if (!v20)
        {
          uint64_t v21 = objc_loadWeakRetained((id *)p_service);
          [v21 synchronize:1 reason:@"UidValidityChanged"];
LABEL_13:
        }
      }
    }
  }
}

- (BOOL)getMailboxListWithConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMAPServiceAccount *)self mailboxUidForRelativePath:@"INBOX" create:0];
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = [(IMAPServiceAccount *)self mailboxUidForRelativePath:@"Trash" create:0];
  if (!v6)
  {

    goto LABEL_6;
  }
  unsigned int v7 = [(IMAPServiceAccount *)self mailboxUidForRelativePath:@"Greetings" create:0];

  if (!v7)
  {
LABEL_6:
    v10.receiver = self;
    v10.super_class = (Class)IMAPServiceAccount;
    BOOL v8 = [(IMAPServiceAccount *)&v10 getMailboxListWithConnection:v4];
    goto LABEL_7;
  }
  BOOL v8 = 1;
LABEL_7:

  return v8;
}

- (unsigned)readBufferSize
{
  return 1024;
}

- (void)setConnectionIdleTimeout:(double)a3
{
  self->_idleTimeout = a3;
}

- (void)_addMonitoredInvocationForIdleConnectionDisconnection
{
  uint64_t v3 = [(IMAPServiceAccount *)self invocationQueue];
  uint64_t v4 = [(IMAPServiceAccount *)self service];
  uint64_t v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = +[MFMonitoredInvocation invocationWithSelector:"_performDisconnectIdleConnections" target:self taskName:&stru_1000C35D8 priority:3 canBeCancelled:0];
    [v6 retainArguments];
    unsigned int v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      uint64_t v9 = [v6 monitor];
      objc_super v10 = [v6 monitor];
      int v12 = 136316674;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      uint64_t v15 = " ";
      __int16 v16 = 2112;
      uint64_t v17 = v3;
      __int16 v18 = 2048;
      id v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = self;
      __int16 v24 = 2112;
      __int16 v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: _addMonitoredInvocationForIdleConnectionDisconnection, account %@ => %@", (uint8_t *)&v12, 0x48u);
    }
    float v11 = [v6 monitor];
    [v5 addScheduledActivity:v11];

    [v3 addInvocation:v6];
  }
}

- (id)networkAccountIdentifier
{
  return self->_networkIdentifier;
}

- (void)_performDisconnectIdleConnections
{
  uint64_t v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    double idleTimeout = self->_idleTimeout;
    *(_DWORD *)buf = 136315650;
    uint64_t v26 = v4;
    __int16 v27 = 2080;
    __int16 v28 = " ";
    __int16 v29 = 2048;
    double v30 = idleTimeout;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] Idle Timer: Releasing connections that have been idle for %g s", buf, 0x20u);
  }

  [(IMAPServiceAccount *)self releaseAllConnectionsIdleForTimeInterval:self->_idleTimeout];
  uint64_t v6 = OBJC_IVAR___IMAP_Account__connectionLock;
  [*(id *)&self->IMAP_Account_opaque[OBJC_IVAR___IMAP_Account__connectionLock] lock];
  [(IMAPServiceAccount *)self mf_lock];
  CFArrayRef v7 = *(const __CFArray **)&self->IMAP_Account_opaque[OBJC_IVAR___IMAP_Account__cachedConnections];
  if (v7) {
    CFArrayRef Copy = CFArrayCreateCopy(kCFAllocatorDefault, v7);
  }
  else {
    CFArrayRef Copy = 0;
  }
  [(IMAPServiceAccount *)self mf_unlock];
  [*(id *)&self->IMAP_Account_opaque[v6] unlock];
  if (Copy)
  {
    CFIndex Count = CFArrayGetCount(Copy);
    BOOL v10 = Count > 0;
    if (Count < 1)
    {
      BOOL v10 = 0;
      double v12 = 1.79769313e308;
    }
    else
    {
      CFIndex v11 = 0;
      double v12 = 1.79769313e308;
      do
      {
        uint64_t v13 = CFArrayGetValueAtIndex(Copy, v11);
        objc_msgSend(v13, "mf_lock");
        [v13 lastUsedTime];
        double v15 = v14;
        objc_msgSend(v13, "mf_unlock");
        if (v15 < v12) {
          double v12 = v15;
        }

        ++v11;
      }
      while (Count != v11);
    }
    CFRelease(Copy);
  }
  else
  {
    BOOL v10 = 0;
    double v12 = 1.79769313e308;
  }
  [(NSRecursiveLock *)self->_idleLock lock];
  idleTimer = self->_idleTimer;
  self->_idleTimer = 0;

  if (v10)
  {
    double v17 = v12 + self->_idleTimeout;
    self->_double nextIdleFire = v17;
    __int16 v18 = +[NSTimer timerWithTimeInterval:self target:"_addMonitoredInvocationForIdleConnectionDisconnection" selector:0 userInfo:0 repeats:fmax(v17 - CFAbsoluteTimeGetCurrent(), 0.0)];
    id v19 = self->_idleTimer;
    self->_idleTimer = v18;

    __int16 v20 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      double nextIdleFire = self->_nextIdleFire;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = v21;
      __int16 v27 = 2080;
      __int16 v28 = " ";
      __int16 v29 = 2048;
      double v30 = nextIdleFire - Current;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#I %s%sIdle Timer: More connections were still active after releasing the idled connections, so we'll reschedule the idle timer for %g s", buf, 0x20u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000258E4;
    block[3] = &unk_1000C1A98;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  [(NSRecursiveLock *)self->_idleLock unlock];
}

- (void)_startIdleTimer
{
  [(NSRecursiveLock *)self->_idleLock lock];
  if (self->_idleTimeout > 0.0)
  {
    idleTimer = self->_idleTimer;
    if (idleTimer)
    {
      if ([(NSTimer *)idleTimer isValid])
      {
        double nextIdleFire = self->_nextIdleFire;
        if (nextIdleFire < CFAbsoluteTimeGetCurrent())
        {
          [(NSTimer *)self->_idleTimer fire];
          goto LABEL_10;
        }
      }
      if (self->_idleTimer) {
        goto LABEL_10;
      }
    }
    uint64_t v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
      double idleTimeout = self->_idleTimeout;
      int v10 = 136315906;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      uint64_t v13 = " ";
      __int16 v14 = 2048;
      double v15 = idleTimeout;
      __int16 v16 = 2112;
      double v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sIdle Timer: Starting up idle timer for %g s, service account %@", (uint8_t *)&v10, 0x2Au);
    }

    self->_double nextIdleFire = CFAbsoluteTimeGetCurrent() + self->_idleTimeout;
    uint64_t v8 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_addMonitoredInvocationForIdleConnectionDisconnection" selector:0 userInfo:0 repeats:self->_idleTimeout];
    uint64_t v9 = self->_idleTimer;
    self->_idleTimer = v8;
  }
LABEL_10:
  [(NSRecursiveLock *)self->_idleLock unlock];
}

- (void)releaseAllConnections
{
  [(NSRecursiveLock *)self->_idleLock lock];
  uint64_t v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    *(_DWORD *)buf = 136315650;
    uint64_t v8 = v4;
    __int16 v9 = 2080;
    int v10 = " ";
    __int16 v11 = 2112;
    __int16 v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sReleasing connections, we will also stop waiting for idle connections for service account %@", buf, 0x20u);
  }

  [(NSTimer *)self->_idleTimer invalidate];
  idleTimer = self->_idleTimer;
  self->_idleTimer = 0;

  [(NSRecursiveLock *)self->_idleLock unlock];
  v6.receiver = self;
  v6.super_class = (Class)IMAPServiceAccount;
  [(IMAPServiceAccount *)&v6 releaseAllConnections];
}

- (id)connectionForStore:(id)a3 delegate:(id)a4 options:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  __int16 v11 = [WeakRetained password];
  id v12 = [v11 length];

  if (v12)
  {
    v20.receiver = self;
    v20.super_class = (Class)IMAPServiceAccount;
    uint64_t v13 = [(IMAPServiceAccount *)&v20 connectionForStore:v8 delegate:v9 options:v5];
    uint64_t v14 = [(IMAPServiceAccount *)self readBufferSize];
    [v13 setReadBufferSize:v14];
    [v13 setDesiredReadBufferLength:v14];
    if (v13)
    {
      double v15 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
        *(_DWORD *)buf = 136315650;
        uint64_t v22 = v16;
        __int16 v23 = 2080;
        __int16 v24 = " ";
        __int16 v25 = 2112;
        uint64_t v26 = self;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I %s%sIdle Timer: A connection was used, poking idle timer for service account %@", buf, 0x20u);
      }

      [(IMAPServiceAccount *)self performSelectorOnMainThread:"_startIdleTimer" withObject:0 waitUntilDone:0];
    }
  }
  else
  {
    double v17 = +[NSError errorWithDomain:kVVErrorDomain code:1003 localizedDescription:0];
    __int16 v18 = +[MFActivityMonitor currentTracebleMonitor];
    [v18 setError:v17];

    uint64_t v13 = 0;
  }

  return v13;
}

- (void)checkInConnectionsPolitelyForStore:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IMAPServiceAccount;
  [(IMAPServiceAccount *)&v3 checkInConnectionsForStore:a3];
}

- (void)checkInConnectionsForStore:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OBJC_IVAR___IMAP_Account__connectionLock;
  [*(id *)&self->IMAP_Account_opaque[OBJC_IVAR___IMAP_Account__connectionLock] lock];
  *((unsigned char *)self + 352) |= 1u;
  v6.receiver = self;
  v6.super_class = (Class)IMAPServiceAccount;
  [(IMAPServiceAccount *)&v6 checkInConnectionsForStore:v4];
  *((unsigned char *)self + 352) &= ~1u;
  [*(id *)&self->IMAP_Account_opaque[v5] unlock];
}

- (void)checkInConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OBJC_IVAR___IMAP_Account__connectionLock;
  [*(id *)&self->IMAP_Account_opaque[OBJC_IVAR___IMAP_Account__connectionLock] lock];
  if (*((unsigned char *)self + 352))
  {
    [v4 checkInForcefully];
  }
  else if (![v4 checkIn])
  {
    goto LABEL_6;
  }
  v6.receiver = self;
  v6.super_class = (Class)IMAPServiceAccount;
  [(IMAPServiceAccount *)&v6 checkInConnection:v4];
LABEL_6:
  [*(id *)&self->IMAP_Account_opaque[v5] unlock];
}

- (void)_clearConnectionCheckOuts
{
  id v3 = +[IMAPServiceConnection heldConnectionsForCheckingIn];
  [v3 makeObjectsPerformSelector:"checkInToAccount:" withObject:self];
}

- (void)libraryIMAPStore:(id)a3 bodyDownloadBeganForUid:(unsigned int)a4 data:(id)a5 section:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    int v17 = 136316162;
    uint64_t v18 = v14;
    __int16 v19 = 2080;
    objc_super v20 = " ";
    __int16 v21 = 1024;
    int v22 = v8;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2048;
    id v26 = [v11 length];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s%sVVLOAD START %u: %@ %lu\n", (uint8_t *)&v17, 0x30u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  uint64_t v16 = [WeakRetained _bodyLoadMonitor];
  [v16 bodyLoadStartedForRemoteUid:v8 inStore:v10 data:v11 section:v12];
}

- (void)libraryIMAPStore:(id)a3 bodyDownloadReceivedMoreDataForUid:(unsigned int)a4 data:(id)a5 section:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    int v17 = 136316162;
    uint64_t v18 = v14;
    __int16 v19 = 2080;
    objc_super v20 = " ";
    __int16 v21 = 1024;
    int v22 = v8;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2048;
    id v26 = [v11 length];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s%sVVLOAD MORE %u: %@ %lu\n", (uint8_t *)&v17, 0x30u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  uint64_t v16 = [WeakRetained _bodyLoadMonitor];
  [v16 bodyLoadContinuedForRemoteUid:v8 inStore:v10 data:v11 section:v12];
}

- (void)libraryIMAPStore:(id)a3 bodyDownloadCompletedForUid:(unsigned int)a4 data:(id)a5 section:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)&self->IMAP_Account_opaque[OBJC_IVAR___MFAccount_mambaID];
    int v17 = 136316162;
    uint64_t v18 = v14;
    __int16 v19 = 2080;
    objc_super v20 = " ";
    __int16 v21 = 1024;
    int v22 = v8;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2048;
    id v26 = [v11 length];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s%sVVLOAD END: %u: %@ %lu\n", (uint8_t *)&v17, 0x30u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  uint64_t v16 = [WeakRetained _bodyLoadMonitor];
  [v16 bodyLoadEndedForRemoteUid:v8 inStore:v10 data:v11 section:v12];
}

- (BOOL)shouldExpungeMessagesOnDelete
{
  return 0;
}

- (IMAPService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (IMAPService *)WeakRetained;
}

- (void)setService:(id)a3
{
}

- (MFInvocationQueue)invocationQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_invocationQueue);
  return (MFInvocationQueue *)WeakRetained;
}

- (void)setInvocationQueue:(id)a3
{
}

- (NSString)serviceICC
{
  return self->_serviceICC;
}

- (void)setServiceICC:(id)a3
{
}

- (NSString)serviceMDN
{
  return self->_serviceMDN;
}

- (void)setServiceMDN:(id)a3
{
}

- (NSUUID)serviceLabelID
{
  return self->_serviceLabelID;
}

- (void)setServiceLabelID:(id)a3
{
}

- (NSString)networkIdentifier
{
  return self->_networkIdentifier;
}

- (void)setNetworkIdentifier:(id)a3
{
}

- (VMAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (NSURL)accountDir
{
  return self->_accountDir;
}

- (void)setAccountDir:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDir, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_networkIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceLabelID, 0);
  objc_storeStrong((id *)&self->_serviceMDN, 0);
  objc_storeStrong((id *)&self->_serviceICC, 0);
  objc_destroyWeak((id *)&self->_invocationQueue);
  objc_destroyWeak((id *)&self->_service);
  sub_100026948((ctu::OsLogLogger **)&self->logger, 0);
  objc_storeStrong((id *)&self->_idleLock, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_serviceAccountLock, 0);
  objc_storeStrong((id *)&self->_offlineCachePath, 0);
  objc_storeStrong((id *)&self->_storeCacheLock, 0);
}

- (id).cxx_construct
{
  *((void *)self + 45) = 0;
  return self;
}

@end