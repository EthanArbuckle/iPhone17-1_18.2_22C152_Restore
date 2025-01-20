@interface IMAPServiceLibrary
- (BOOL)isMessageContentsLocallyAvailable:(id)a3;
- (BOOL)verifyCachedMessage:(id)a3 hasToken:(id)a4 flags:(unsigned int)a5 remoteIDStr:(id)a6;
- (IMAPServiceAccount)account;
- (IMAPServiceLibrary)initWithServiceAccount:(id)a3;
- (MFLibraryStore)sharedGenericStore;
- (NSMapTable)knownMessages;
- (id)_getDetailsForMailbox:(id)a3 useRemoteIDRange:(_NSRange *)a4;
- (id)_mailboxUidForStoreRecord:(void *)a3;
- (id)_messageWithAccountStoreRecord:(id)a3 record:(void *)a4 localStore:(BOOL)a5;
- (id)addMessages:(id)a3 withMailbox:(id)a4 fetchBodies:(BOOL)a5 newMessagesByOldMessage:(id)a6 remoteIDs:(id)a7 setFlags:(unint64_t)a8 clearFlags:(unint64_t)a9 messageFlagsForMessages:(id)a10 copyFiles:(BOOL)a11 addPOPUIDs:(BOOL)a12 dataSectionsByMessage:(id)a13;
- (id)getDetailsForAllMessagesFromMailbox:(id)a3;
- (id)getDetailsForMessages:(unint64_t)a3 absoluteBottom:(unint64_t)a4 topOfDesiredRange:(unint64_t)a5 range:(_NSRange *)a6 fromMailbox:(id)a7;
- (id)getDetailsForMessagesWithRemoteIDInRange:(_NSRange)a3 fromMailbox:(id)a4;
- (id)mailboxUidForMessage:(id)a3;
- (id)messageWithAccountStoreRecord:(void *)a3;
- (id)messageWithLibraryID:(unsigned int)a3 options:(unsigned int)a4 inMailbox:(id)a5;
- (id)messageWithRemoteID:(id)a3 inRemoteMailbox:(id)a4;
- (id)messagesForMailbox:(id)a3 olderThanNumberOfDays:(int)a4;
- (id)messagesWithMessageIDHeader:(id)a3;
- (id)messagesWithSummariesForMailbox:(id)a3 range:(_NSRange)a4;
- (id)oldestMessageInMailbox:(id)a3;
- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4;
- (unsigned)deletedCountForMailbox:(id)a3;
- (unsigned)maximumRemoteIDForMailbox:(id)a3;
- (unsigned)minimumRemoteIDForMailbox:(id)a3;
- (unsigned)nonDeletedCountForMailbox:(id)a3;
- (unsigned)totalCountForMailbox:(id)a3;
- (unsigned)unreadCountForMailbox:(id)a3;
- (void)_postMessagesAdded:(id)a3;
- (void)_resetCountsForCompaction;
- (void)_setFlags:(unint64_t)a3 forMessage:(id)a4 postAndCommit:(BOOL)a5;
- (void)compactMailbox:(id)a3;
- (void)compactMessages:(id)a3 permanently:(BOOL)a4;
- (void)copyAudioDataToMainStore:(void *)a3 dstRecord:(void *)a4;
- (void)copyStoreRecordForMessage:(id)a3;
- (void)createMainStoreRecord:(void *)a3;
- (void)dealloc;
- (void)flushMessageCache;
- (void)invalidateServiceLibrary;
- (void)mergeRecord:(void *)a3;
- (void)removeAllMessagesFromMailbox:(id)a3 andNotify:(BOOL)a4;
- (void)setFlags:(unint64_t)a3 forMessage:(id)a4;
- (void)setFlagsForMessages:(id)a3 mask:(unint64_t)a4;
- (void)setKnownMessages:(id)a3;
- (void)setLongLifeMessagesCache;
- (void)updateMainStoreRecord:(void *)a3 dstRecord:(void *)a4 token:(__CFString *)a5;
@end

@implementation IMAPServiceLibrary

- (IMAPServiceLibrary)initWithServiceAccount:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IMAPServiceLibrary;
  v5 = [(IMAPServiceLibrary *)&v15 initWithPath:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_account, v4);
    uint64_t v7 = +[NSMapTable strongToWeakObjectsMapTable];
    knownMessages = v6->_knownMessages;
    v6->_knownMessages = (NSMapTable *)v7;

    v6->isLongLifeMessagesCache = 0;
    v9 = (MFLibraryStore *)objc_alloc_init((Class)MFLibraryStore);
    sharedGenericStore = v6->_sharedGenericStore;
    v6->_sharedGenericStore = v9;

    [(MFLibraryStore *)v6->_sharedGenericStore setLibrary:v6];
    v11 = sub_100019A40();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(IMAPServiceLibrary *)v6 account];
      uint64_t v13 = *(void *)&v12[OBJC_IVAR___MFAccount_mambaID];
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      v19 = " ";
      __int16 v20 = 2112;
      v21 = v6;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s%sCreated %@ for service account %@", buf, 0x2Au);
    }
  }

  return v6;
}

- (void)invalidateServiceLibrary
{
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_account, 0);
  v3.receiver = self;
  v3.super_class = (Class)IMAPServiceLibrary;
  [(IMAPServiceLibrary *)&v3 dealloc];
}

- (id)_mailboxUidForStoreRecord:(void *)a3
{
  char Flags = VMStoreRecordGetFlags((uint64_t)a3);
  v5 = [(IMAPServiceLibrary *)self account];
  v6 = v5;
  uint64_t v7 = &off_1000C1A88;
  if ((Flags & 8) != 0) {
    uint64_t v7 = off_1000C1A80;
  }
  v8 = [v5 mailboxUidForRelativePath:*v7 create:1];

  return v8;
}

- (void)setLongLifeMessagesCache
{
  self->isLongLifeMessagesCache = 1;
}

- (void)flushMessageCache
{
  objc_super v3 = sub_100019A40();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IMAPServiceLibrary *)self account];
    uint64_t v5 = *(void *)&v4[OBJC_IVAR___MFAccount_mambaID];
    v6 = [(IMAPServiceLibrary *)self knownMessages];
    int v8 = 136315650;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    v11 = " ";
    __int16 v12 = 1024;
    unsigned int v13 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sFlushed knownMessages cache. It had %d elements.", (uint8_t *)&v8, 0x1Cu);
  }
  uint64_t v7 = +[NSMapTable strongToWeakObjectsMapTable];
  [(IMAPServiceLibrary *)self setKnownMessages:v7];
}

- (BOOL)verifyCachedMessage:(id)a3 hasToken:(id)a4 flags:(unsigned int)a5 remoteIDStr:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!self->isLongLifeMessagesCache) {
    goto LABEL_6;
  }
  unint64_t v13 = (unint64_t)[v10 messageFlags];
  if ((v13 & 1 | (4 * ((v13 >> 1) & 1)) | (v13 >> 27) & 0x20) != a5)
  {
    v19 = sub_100019A40();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = [(IMAPServiceLibrary *)self account];
      uint64_t v21 = *(void *)&v20[OBJC_IVAR___MFAccount_mambaID];
      int v29 = 136315906;
      uint64_t v30 = v21;
      __int16 v31 = 2080;
      v32 = " ";
      __int16 v33 = 1024;
      unsigned int v34 = [v10 messageFlags];
      __int16 v35 = 1024;
      unsigned int v36 = a5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%sverifyCachedMessage failed, flags %u vs %u", (uint8_t *)&v29, 0x22u);
    }
    goto LABEL_15;
  }
  v14 = [v10 remoteID];
  unsigned __int8 v15 = [v14 isEqualToString:v12];

  if ((v15 & 1) == 0)
  {
    v19 = sub_100019A40();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = [(IMAPServiceLibrary *)self account];
      uint64_t v23 = *(void *)&v22[OBJC_IVAR___MFAccount_mambaID];
      int v29 = 136315394;
      uint64_t v30 = v23;
      __int16 v31 = 2080;
      v32 = " ";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%sverifyCachedMessage failed, different remoteID", (uint8_t *)&v29, 0x16u);
    }
    goto LABEL_15;
  }
  if (((((a5 & 0x20) == 0) ^ [v10 hasTemporaryUid]) & 1) == 0)
  {
    v19 = sub_100019A40();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [(IMAPServiceLibrary *)self account];
      uint64_t v25 = *(void *)&v24[OBJC_IVAR___MFAccount_mambaID];
      int v29 = 136315394;
      uint64_t v30 = v25;
      __int16 v31 = 2080;
      v32 = " ";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%sverifyCachedMessage failed, different temporaryID", (uint8_t *)&v29, 0x16u);
    }
    goto LABEL_15;
  }
  v16 = [v10 messageIDHeader];
  unsigned __int8 v17 = [v16 isEqualToString:v11];

  if ((v17 & 1) == 0)
  {
    v19 = sub_100019A40();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [(IMAPServiceLibrary *)self account];
      uint64_t v27 = *(void *)&v26[OBJC_IVAR___MFAccount_mambaID];
      int v29 = 136315394;
      uint64_t v30 = v27;
      __int16 v31 = 2080;
      v32 = " ";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%sverifyCachedMessage failed, different token", (uint8_t *)&v29, 0x16u);
    }
LABEL_15:

    BOOL v18 = 0;
    goto LABEL_16;
  }
LABEL_6:
  BOOL v18 = 1;
LABEL_16:

  return v18;
}

- (id)_messageWithAccountStoreRecord:(id)a3 record:(void *)a4 localStore:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = v8;
  if (a4)
  {
    id v10 = sub_100079014(v8, (const char *)a4);
    uint64_t v11 = sub_10007939C(v9, (uint64_t)a4);
    uint64_t v12 = sub_10007901C(v9, (uint64_t)a4);
    id v13 = objc_alloc((Class)NSString);
    if ((v11 & 0x20) != 0) {
      CFStringRef v14 = @"temp-%u";
    }
    else {
      CFStringRef v14 = @"%u";
    }
    id v35 = objc_msgSend(v13, "initWithFormat:", v14, v12);
    unsigned int v34 = (void *)sub_10007931C(v9, (uint64_t)a4);
    unsigned __int8 v15 = [(IMAPServiceLibrary *)self knownMessages];
    v16 = +[NSNumber numberWithUnsignedInt:v10];
    unsigned __int8 v17 = [v15 objectForKey:v16];

    if (v17
      && [(IMAPServiceLibrary *)self verifyCachedMessage:v17 hasToken:v34 flags:v11 remoteIDStr:v35])
    {
      BOOL v18 = sub_100019A40();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [(IMAPServiceLibrary *)self account];
        uint64_t v20 = *(void *)&v19[OBJC_IVAR___MFAccount_mambaID];
        uint64_t v21 = [(IMAPServiceLibrary *)self account];
        __int16 v22 = [v21 serviceLabelID];
        *(_DWORD *)buf = 136315906;
        uint64_t v37 = v20;
        __int16 v38 = 2080;
        v39 = " ";
        __int16 v40 = 2112;
        v41 = v22;
        __int16 v42 = 1024;
        int v43 = (int)v10;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%s%@, message %u taken from Known", buf, 0x26u);
      }
      uint64_t v23 = v17;
    }
    else
    {
      uint64_t v23 = [[IMAPServiceLibraryMessage alloc] initWithLibraryID:v10];

      [(IMAPServiceLibraryMessage *)v23 setRemoteID:v35];
      [(IMAPServiceLibraryMessage *)v23 setMessageFlagsWithoutCommitting:v11 & 1 | (2 * ((v11 >> 2) & 1))];
      [(IMAPServiceLibraryMessage *)v23 setHasTemporaryUid:(v11 >> 5) & 1];
      if (v5)
      {
        v24 = [(IMAPServiceLibrary *)self sharedGenericStore];
        uint64_t v25 = v24;
      }
      else
      {
        uint64_t v25 = [(IMAPServiceLibrary *)self account];
        a4 = [(IMAPServiceLibrary *)self _mailboxUidForStoreRecord:a4];
        v24 = [v25 storeForMailboxUid:a4];
      }
      [(IMAPServiceLibraryMessage *)v23 setMessageStore:v24];
      if (!v5)
      {
      }
      [(IMAPServiceLibraryMessage *)v23 setMessageIDHeader:v34];
      v26 = [(IMAPServiceLibrary *)self knownMessages];
      uint64_t v27 = +[NSNumber numberWithUnsignedInt:v10];
      [v26 setObject:v23 forKey:v27];

      BOOL v18 = sub_100019A40();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [(IMAPServiceLibrary *)self account];
        uint64_t v29 = *(void *)&v28[OBJC_IVAR___MFAccount_mambaID];
        uint64_t v30 = [(IMAPServiceLibrary *)self account];
        __int16 v31 = [v30 serviceLabelID];
        v32 = [(IMAPServiceLibrary *)self knownMessages];
        *(_DWORD *)buf = 136316162;
        uint64_t v37 = v29;
        __int16 v38 = 2080;
        v39 = " ";
        __int16 v40 = 2112;
        v41 = v31;
        __int16 v42 = 1024;
        int v43 = (int)v10;
        __int16 v44 = 1024;
        unsigned int v45 = [v32 count];
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%s%@, message %u added to Known. Known map size: %d", buf, 0x2Cu);
      }
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (id)messageWithAccountStoreRecord:(void *)a3
{
  BOOL v5 = [(IMAPServiceLibrary *)self account];
  v6 = [v5 accountStore];
  uint64_t v7 = [(IMAPServiceLibrary *)self _messageWithAccountStoreRecord:v6 record:a3 localStore:0];

  return v7;
}

- (void)copyStoreRecordForMessage:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    [v3 libraryID];
    BOOL v5 = (void *)VMStoreCopyRecordWithIdentifier();
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)messageWithLibraryID:(unsigned int)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = [(IMAPServiceLibrary *)self account];
  id v8 = [v7 accountStore];
  id v9 = sub_100079A6C(v8, v5);

  if (v9)
  {
    id v10 = [(IMAPServiceLibrary *)self account];
    uint64_t v11 = [v10 accountStore];
    uint64_t v12 = [(IMAPServiceLibrary *)self _messageWithAccountStoreRecord:v11 record:v9 localStore:1];

    CFRelease(v9);
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (id)messagesWithMessageIDHeader:(id)a3
{
  return 0;
}

- (id)messagesForMailbox:(id)a3 olderThanNumberOfDays:(int)a4
{
  return 0;
}

- (id)messagesWithSummariesForMailbox:(id)a3 range:(_NSRange)a4
{
  return 0;
}

- (unsigned)unreadCountForMailbox:(id)a3
{
  if (sub_10001AB70(a3) != 1) {
    return 0;
  }
  id v4 = [(IMAPServiceLibrary *)self account];
  uint64_t v5 = [v4 serviceLabelID];
  unsigned int v6 = VMStoreCountOfRecordsWithFlags(0, 13, v5);

  return v6;
}

- (unsigned)deletedCountForMailbox:(id)a3
{
  int v4 = sub_10001AB70(a3);
  if (v4 == 2)
  {
    uint64_t v5 = [(IMAPServiceLibrary *)self account];
    unsigned int v6 = [v5 serviceLabelID];
    unsigned int v7 = VMStoreCountOfRecordsWithFlags(12, 16, v6);
  }
  else
  {
    if (v4 != 1) {
      return 0;
    }
    uint64_t v5 = [(IMAPServiceLibrary *)self account];
    unsigned int v6 = [v5 serviceLabelID];
    unsigned int v7 = VMStoreCountOfRecordsWithFlags(4, 24, v6);
  }
  unsigned int v8 = v7;

  return v8;
}

- (unsigned)nonDeletedCountForMailbox:(id)a3
{
  int v4 = sub_10001AB70(a3);
  if (v4 == 2)
  {
    uint64_t v5 = [(IMAPServiceLibrary *)self account];
    unsigned int v6 = [v5 serviceLabelID];
    unsigned int v7 = VMStoreCountOfRecordsWithFlags(8, 4, v6);
  }
  else
  {
    if (v4 != 1) {
      return 0;
    }
    uint64_t v5 = [(IMAPServiceLibrary *)self account];
    unsigned int v6 = [v5 serviceLabelID];
    unsigned int v7 = VMStoreCountOfRecordsWithFlags(0, 12, v6);
  }
  unsigned int v8 = v7;

  return v8;
}

- (unsigned)totalCountForMailbox:(id)a3
{
  int v4 = sub_10001AB70(a3);
  if (v4 == 2)
  {
    uint64_t v5 = [(IMAPServiceLibrary *)self account];
    unsigned int v6 = [v5 serviceLabelID];
    unsigned int v7 = VMStoreCountOfRecordsWithFlags(8, 16, v6);
  }
  else
  {
    if (v4 != 1) {
      return 0;
    }
    uint64_t v5 = [(IMAPServiceLibrary *)self account];
    unsigned int v6 = [v5 serviceLabelID];
    unsigned int v7 = VMStoreCountOfRecordsWithFlags(0, 24, v6);
  }
  unsigned int v8 = v7;

  return v8;
}

- (id)oldestMessageInMailbox:(id)a3
{
  return 0;
}

- (id)messageWithRemoteID:(id)a3 inRemoteMailbox:(id)a4
{
  id v6 = a4;
  unsigned __int8 v18 = 0;
  id v7 = sub_10001B024(a3, (char *)&v18);
  int v8 = sub_10001AB70(v6);
  id v9 = [(IMAPServiceLibrary *)self account];
  id v10 = [v9 accountStore];
  uint64_t v11 = v10;
  if (v8 == 1) {
    int v12 = 24;
  }
  else {
    int v12 = 16;
  }
  id v13 = sub_100079A74(v10, (uint64_t)v7, (8 * (v8 != 1)) | (32 * v18), v12 | (32 * (v18 == 0)));

  if (v13)
  {
    CFStringRef v14 = [(IMAPServiceLibrary *)self account];
    unsigned __int8 v15 = [v14 accountStore];
    v16 = [(IMAPServiceLibrary *)self _messageWithAccountStoreRecord:v15 record:v13 localStore:1];

    CFRelease(v13);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unsigned)maximumRemoteIDForMailbox:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMAPServiceLibrary *)self account];
  id v6 = [v5 accountStore];
  BOOL v7 = sub_10001AB70(v4) == 2;
  CFArrayRef v8 = (const __CFArray *)sub_100079A84(v6, v7, 0);

  if (v8)
  {
    CFIndex Count = CFArrayGetCount(v8);
    if (Count < 1) {
      unsigned int v10 = 0;
    }
    else {
      unsigned int v10 = objc_msgSend((id)CFArrayGetValueAtIndex(v8, Count - 1), "unsignedIntValue");
    }
    CFRelease(v8);
  }
  else
  {
    unsigned int v10 = 0;
  }

  return v10;
}

- (unsigned)minimumRemoteIDForMailbox:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMAPServiceLibrary *)self account];
  id v6 = [v5 accountStore];
  BOOL v7 = sub_10001AB70(v4) == 2;
  CFArrayRef v8 = (const __CFArray *)sub_100079A84(v6, v7, 0);

  if (v8)
  {
    if (CFArrayGetCount(v8) < 1) {
      unsigned int v9 = 0;
    }
    else {
      unsigned int v9 = objc_msgSend((id)CFArrayGetValueAtIndex(v8, 0), "unsignedIntValue");
    }
    CFRelease(v8);
  }
  else
  {
    unsigned int v9 = 0;
  }

  return v9;
}

- (id)_getDetailsForMailbox:(id)a3 useRemoteIDRange:(_NSRange *)a4
{
  id v49 = a3;
  int v52 = sub_10001AB70(v49);
  v50 = self;
  id v6 = [(IMAPServiceLibrary *)self account];
  v54 = [v6 accountStore];

  BOOL v7 = sub_100019A40();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFArrayRef v8 = [(IMAPServiceLibrary *)v50 account];
    uint64_t v9 = *(void *)&v8[OBJC_IVAR___MFAccount_mambaID];
    unsigned int v10 = [(IMAPServiceLibrary *)v50 account];
    uint64_t v11 = [v10 serviceLabelID];
    *(_DWORD *)buf = 136315650;
    uint64_t v56 = v9;
    __int16 v57 = 2080;
    v58 = " ";
    __int16 v59 = 2112;
    v60 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s==> label=%@", buf, 0x20u);
  }
  if (v52 == 1)
  {
    if (!a4 || (NSUInteger location = a4->location, a4->location == 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v13 = 0;
      uint64_t v14 = 40;
LABEL_11:
      CFArrayRef theArray = (const __CFArray *)sub_100079A60(v54, v13, v14);
      goto LABEL_12;
    }
    int64_t v27 = a4->length + location;
    if (v27 >= (uint64_t)&_mh_execute_header)
    {
      v28 = sub_100019A40();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [(IMAPServiceLibrary *)v50 account];
        uint64_t v30 = *(void *)&v29[OBJC_IVAR___MFAccount_mambaID];
        NSStringFromRange(*a4);
        __int16 v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        uint64_t v56 = v30;
        __int16 v57 = 2080;
        v58 = " ";
        __int16 v59 = 2112;
        v60 = v31;
        __int16 v61 = 2048;
        unint64_t v62 = v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#I %s%sReceived range %@ with maximum range %ld greater than would not fit in 32-bit container.  Truncating to UINT32_MAX.", buf, 0x2Au);
      }
      NSUInteger location = a4->location;
      int64_t v27 = 0xFFFFFFFFLL;
    }
    unint64_t v32 = sub_100019990(location);
    unint64_t v33 = sub_100019990(v27);
    CFArrayRef theArray = (const __CFArray *)sub_100079A4C(v54, 0, 40, v32, v33);
    unint64_t v34 = sub_100019990(a4->location);
    unint64_t v35 = sub_100019990(v27);
    CFArrayRef v36 = (const __CFArray *)sub_100079A4C(v54, 0, 40, v34, v35);
    uint64_t v37 = sub_100019A40();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v38 = [(IMAPServiceLibrary *)v50 account];
      uint64_t v39 = *(void *)&v38[OBJC_IVAR___MFAccount_mambaID];
      int Count = CFArrayGetCount(v36);
      *(_DWORD *)buf = 136315650;
      uint64_t v56 = v39;
      __int16 v57 = 2080;
      v58 = " ";
      __int16 v59 = 1024;
      LODWORD(v60) = Count;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#I %s%s==> count=%d", buf, 0x1Cu);
    }
    if (v36) {
      CFRelease(v36);
    }
  }
  else
  {
    if (v52 != 2) {
      goto LABEL_14;
    }
    if (!a4 || (NSUInteger v15 = a4->location, a4->location == 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v14 = 32;
      uint64_t v13 = 8;
      goto LABEL_11;
    }
    unint64_t v41 = a4->length + v15;
    if (HIDWORD(v41))
    {
      __int16 v42 = sub_100019A40();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        int v43 = [(IMAPServiceLibrary *)v50 account];
        uint64_t v44 = *(void *)&v43[OBJC_IVAR___MFAccount_mambaID];
        NSStringFromRange(*a4);
        unsigned int v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        uint64_t v56 = v44;
        __int16 v57 = 2080;
        v58 = " ";
        __int16 v59 = 2112;
        v60 = v45;
        __int16 v61 = 2048;
        unint64_t v62 = v41;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#I %s%sReceived range %@ with maximum range %ld greater than would not fit in 32-bit container.  Truncating to UINT32_MAX.", buf, 0x2Au);
      }
      NSUInteger v15 = a4->location;
      unint64_t v41 = 0xFFFFFFFFLL;
    }
    unint64_t v46 = sub_100019990(v15);
    unint64_t v47 = sub_100019990(v41);
    CFArrayRef theArray = (const __CFArray *)sub_100079A4C(v54, 8, 32, v46, v47);
  }
LABEL_12:
  if (theArray)
  {
    CFIndex v16 = CFArrayGetCount(theArray);
    char v48 = 0;
    goto LABEL_15;
  }
LABEL_14:
  CFArrayRef theArray = 0;
  CFIndex v16 = 0;
  char v48 = 1;
LABEL_15:
  id v51 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v16];
  if (v16 >= 1)
  {
    for (CFIndex i = 0; i != v16; ++i)
    {
      ValueAtIndex = (const char *)CFArrayGetValueAtIndex(theArray, i);
      v19 = (char *)objc_alloc_init((Class)MFMessageDetails);
      *(void *)&v19[OBJC_IVAR___MFMessageDetails_library] = v50;
      unsigned int v20 = sub_10007939C(v54, (uint64_t)ValueAtIndex);
      *(void *)&v19[OBJC_IVAR___MFMessageDetails_messageFlags] = v20 & 1 | (2 * ((v20 >> 2) & 1));
      *(_DWORD *)&v19[OBJC_IVAR___MFMessageDetails_uid] = sub_10007901C(v54, (uint64_t)ValueAtIndex);
      *(_DWORD *)&v19[OBJC_IVAR___MFMessageDetails_libraryID] = sub_100079014(v54, ValueAtIndex);
      *(_DWORD *)&v19[OBJC_IVAR___MFMessageDetails_mailboxID] = v52;
      *(_DWORD *)&v19[OBJC_IVAR___MFMessageDetails_dateReceived] = sub_1000790B0(v54, (uint64_t)ValueAtIndex);
      [v51 addObject:v19];
    }
  }
  uint64_t v21 = sub_100019A40();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = [(IMAPServiceLibrary *)v50 account];
    uint64_t v23 = *(void *)&v22[OBJC_IVAR___MFAccount_mambaID];
    if (a4)
    {
      NSStringFromRange(*a4);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = @"nil";
    }
    CFStringRef v25 = @"Trash";
    *(_DWORD *)buf = 136316418;
    uint64_t v56 = v23;
    __int16 v57 = 2080;
    v58 = " ";
    if (v52 == 1) {
      CFStringRef v25 = @"Inbox";
    }
    __int16 v59 = 2112;
    v60 = v24;
    __int16 v61 = 2112;
    unint64_t v62 = (unint64_t)v25;
    __int16 v63 = 2112;
    v64 = v54;
    __int16 v65 = 2112;
    id v66 = v51;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#I %s%sGet details <range=%@ mailbox=%@ store=%@> for messages %@", buf, 0x3Eu);
    if (a4) {
  }
    }
  if ((v48 & 1) == 0) {
    CFRelease(theArray);
  }

  return v51;
}

- (id)getDetailsForAllMessagesFromMailbox:(id)a3
{
  id v3 = [(IMAPServiceLibrary *)self _getDetailsForMailbox:a3 useRemoteIDRange:0];
  return v3;
}

- (id)getDetailsForMessagesWithRemoteIDInRange:(_NSRange)a3 fromMailbox:(id)a4
{
  _NSRange v6 = a3;
  id v4 = [(IMAPServiceLibrary *)self _getDetailsForMailbox:a4 useRemoteIDRange:&v6];
  return v4;
}

- (void)_resetCountsForCompaction
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001BBC8;
  v2[3] = &unk_1000C19D8;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)compactMailbox:(id)a3
{
  int v4 = sub_10001AB70(a3);
  if (v4 == 2)
  {
    uint64_t v5 = [(IMAPServiceLibrary *)self account];
    _NSRange v6 = [v5 serviceLabelID];
    uint64_t v7 = VMStoreCopyOfAllRecordsWithFlags(12, 16, v6);
  }
  else
  {
    if (v4 != 1) {
      return;
    }
    uint64_t v5 = [(IMAPServiceLibrary *)self account];
    _NSRange v6 = [v5 serviceLabelID];
    uint64_t v7 = VMStoreCopyOfAllRecordsWithFlags(4, 24, v6);
  }
  CFArrayRef v8 = (const void *)v7;

  if (v8)
  {
    uint64_t v9 = [(IMAPServiceLibrary *)self account];
    unsigned int v10 = [v9 service];
    [v10 _removeRecordsNotPendingDelete:v8];

    VMStoreSave();
    [(IMAPServiceLibrary *)self _resetCountsForCompaction];
    CFRelease(v8);
  }
}

- (void)compactMessages:(id)a3 permanently:(BOOL)a4
{
  id v29 = a3;
  uint64_t v5 = [(IMAPServiceLibrary *)self account];
  _NSRange v6 = [v5 accountStore];

  id v28 = [v29 count];
  uint64_t v7 = sub_100019A40();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFArrayRef v8 = [(IMAPServiceLibrary *)self account];
    uint64_t v9 = *(void *)&v8[OBJC_IVAR___MFAccount_mambaID];
    unsigned int v10 = [(IMAPServiceLibrary *)self account];
    *(_DWORD *)buf = 136315906;
    uint64_t v31 = v9;
    __int16 v32 = 2080;
    unint64_t v33 = " ";
    __int16 v34 = 2112;
    *(void *)unint64_t v35 = v29;
    *(_WORD *)&v35[8] = 2112;
    *(void *)&v35[10] = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sCompact messages %@ for account %@", buf, 0x2Au);
  }
  if (v28)
  {
    uint64_t v12 = 0;
    char v13 = 0;
    *(void *)&long long v11 = 136315906;
    long long v27 = v11;
    while (1)
    {
      uint64_t v14 = objc_msgSend(v29, "objectAtIndex:", v12, v27);
      id v15 = [v14 libraryID];
      int v16 = (int)v15;
      id v17 = sub_100079A6C(v6, (uint64_t)v15);
      if (v17) {
        break;
      }
LABEL_13:

      if (v28 == (id)++v12)
      {
        if (v13)
        {
          [v6 save];
          [(IMAPServiceLibrary *)self _resetCountsForCompaction];
        }
        goto LABEL_16;
      }
    }
    unsigned __int8 v18 = [(IMAPServiceLibrary *)self account];
    v19 = [v18 service];
    [v19 _removePendingDeleteForRecord:v17];

    int v20 = sub_10007939C(v6, (uint64_t)v17);
    int v21 = v20;
    if ((v20 & 6) == 2)
    {
      __int16 v22 = [(IMAPServiceLibrary *)self account];
      uint64_t v23 = [v22 serviceLabelID];
      VMStoreRecordSetFlagsFromServer(v23, v17, v21 | 0x40u, 1);
    }
    else
    {
      if ((~v20 & 0x42) == 0)
      {
LABEL_12:
        CFRelease(v17);
        goto LABEL_13;
      }
      __int16 v22 = sub_100019A40();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [(IMAPServiceLibrary *)self account];
        uint64_t v25 = *(void *)&v24[OBJC_IVAR___MFAccount_mambaID];
        v26 = [(IMAPServiceLibrary *)self account];
        *(_DWORD *)buf = v27;
        uint64_t v31 = v25;
        __int16 v32 = 2080;
        unint64_t v33 = " ";
        __int16 v34 = 1024;
        *(_DWORD *)unint64_t v35 = v16;
        *(_WORD *)&v35[4] = 2112;
        *(void *)&v35[6] = v26;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I %s%sRemoveRecord has been Disabled for the record with identifier %u, account %@", buf, 0x26u);
      }
    }

    char v13 = 1;
    goto LABEL_12;
  }
LABEL_16:
}

- (void)removeAllMessagesFromMailbox:(id)a3 andNotify:(BOOL)a4
{
  int v5 = sub_10001AB70(a3);
  _NSRange v6 = [(IMAPServiceLibrary *)self account];
  id v12 = [v6 accountStore];

  if (v5 == 2)
  {
    uint64_t v8 = 0;
    uint64_t v7 = 8;
  }
  else
  {
    if (v5 != 1) {
      goto LABEL_7;
    }
    uint64_t v7 = 0;
    uint64_t v8 = 8;
  }
  id v9 = sub_100079A60(v12, v7, v8);
  if (v9)
  {
    unsigned int v10 = [(IMAPServiceLibrary *)self account];
    long long v11 = [v10 service];
    [v11 _removeRecordsNotPendingDelete:v9];

    [v12 save];
    [(IMAPServiceLibrary *)self _resetCountsForCompaction];
    CFRelease(v9);
  }
LABEL_7:
}

- (void)copyAudioDataToMainStore:(void *)a3 dstRecord:(void *)a4
{
  uint64_t v7 = [(IMAPServiceLibrary *)self account];
  uint64_t v8 = [v7 accountStore];

  __int16 v32 = v8;
  CFTypeRef v9 = sub_10007966C(v8, (uint64_t)a3);
  unsigned int v10 = (const void *)VMStoreRecordCopyDataPath();
  CFStringRef v11 = VMStoreRecordCopyDescription((uint64_t)a4);
  id v12 = +[NSFileManager defaultManager];
  unsigned int v13 = [v12 fileExistsAtPath:v9];

  uint64_t v14 = sub_100019A40();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      int v16 = [(IMAPServiceLibrary *)self account];
      uint64_t v17 = *(void *)&v16[OBJC_IVAR___MFAccount_mambaID];
      *(_DWORD *)buf = 136315650;
      uint64_t v35 = v17;
      __int16 v36 = 2080;
      uint64_t v37 = " ";
      __int16 v38 = 2112;
      CFStringRef v39 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sCopying audio data from account store to record %@", buf, 0x20u);
    }
    unsigned __int8 v18 = +[NSFileManager defaultManager];
    id v33 = 0;
    unsigned int v19 = [v18 copyItemAtPath:v9 toPath:v10 error:&v33];
    id v20 = v33;

    if (v19)
    {
      sub_1000790E0(v32, (uint64_t)a3);
      VMStoreRecordSetDuration((uint64_t)a4);
      int v21 = [(IMAPServiceLibrary *)self account];
      __int16 v22 = [v21 serviceLabelID];
      VMStoreRecordSetFlags(v22, a4, 2);
    }
    else
    {
      int v21 = sub_100019A40();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = [(IMAPServiceLibrary *)self account];
        uint64_t v31 = *(void *)&v30[OBJC_IVAR___MFAccount_mambaID];
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = v31;
        __int16 v36 = 2080;
        uint64_t v37 = " ";
        __int16 v38 = 2112;
        CFStringRef v39 = v11;
        __int16 v40 = 2112;
        id v41 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#I %s%sUnable to copy audio data from account store to record %@ with error %@", buf, 0x2Au);
      }
    }
  }
  else
  {
    if (v15)
    {
      uint64_t v23 = [(IMAPServiceLibrary *)self account];
      uint64_t v24 = *(void *)&v23[OBJC_IVAR___MFAccount_mambaID];
      *(_DWORD *)buf = 136315650;
      uint64_t v35 = v24;
      __int16 v36 = 2080;
      uint64_t v37 = " ";
      __int16 v38 = 2112;
      CFStringRef v39 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sAudio file does not exist in the account store, record %@", buf, 0x20u);
    }
    int Flags = VMStoreRecordGetFlags((uint64_t)a4);
    if ((Flags & 2) == 0)
    {
      id v20 = 0;
      goto LABEL_16;
    }
    v26 = sub_100019A40();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      long long v27 = [(IMAPServiceLibrary *)self account];
      uint64_t v28 = *(void *)&v27[OBJC_IVAR___MFAccount_mambaID];
      *(_DWORD *)buf = 136315650;
      uint64_t v35 = v28;
      __int16 v36 = 2080;
      uint64_t v37 = " ";
      __int16 v38 = 2112;
      CFStringRef v39 = v11;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#I %s%sData available flag is set, but audio file does not exist, record %@", buf, 0x20u);
    }
    int v21 = [(IMAPServiceLibrary *)self account];
    id v29 = [v21 serviceLabelID];
    VMStoreRecordSetFlags(v29, a4, Flags & 0xFFFFFFFD);

    id v20 = 0;
  }

LABEL_16:
  if (v11) {
    CFRelease(v11);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v9) {
    CFRelease(v9);
  }
}

- (void)updateMainStoreRecord:(void *)a3 dstRecord:(void *)a4 token:(__CFString *)a5
{
  CFTypeRef v9 = [(IMAPServiceLibrary *)self account];
  unsigned int v10 = [v9 accountStore];

  CFStringRef v11 = VMStoreRecordCopyDescription((uint64_t)a4);
  id v12 = sub_100019A40();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [(IMAPServiceLibrary *)self account];
    uint64_t v14 = *(void *)&v13[OBJC_IVAR___MFAccount_mambaID];
    int v31 = 136315906;
    uint64_t v32 = v14;
    __int16 v33 = 2080;
    __int16 v34 = " ";
    __int16 v35 = 2112;
    CFStringRef v36 = v11;
    __int16 v37 = 2112;
    __int16 v38 = a5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I %s%sRecord %@ with the same token '%@' found in the main database", (uint8_t *)&v31, 0x2Au);
  }
  CFTypeRef v15 = sub_10007966C(v10, (uint64_t)a3);
  int v16 = (const void *)VMStoreRecordCopyDataPath();
  uint64_t v17 = +[NSFileManager defaultManager];
  unsigned __int8 v18 = [v17 fileExistsAtPath:v16];

  unsigned int v19 = sub_100019A40();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      int v21 = [(IMAPServiceLibrary *)self account];
      uint64_t v22 = *(void *)&v21[OBJC_IVAR___MFAccount_mambaID];
      int v31 = 136315650;
      uint64_t v32 = v22;
      __int16 v33 = 2080;
      __int16 v34 = " ";
      __int16 v35 = 2112;
      CFStringRef v36 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%sAudio file exists in the main store, record %@", (uint8_t *)&v31, 0x20u);
    }
    int Flags = VMStoreRecordGetFlags((uint64_t)a4);
    if ((Flags & 2) == 0)
    {
      uint64_t v24 = sub_100019A40();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = [(IMAPServiceLibrary *)self account];
        uint64_t v26 = *(void *)&v25[OBJC_IVAR___MFAccount_mambaID];
        int v31 = 136315650;
        uint64_t v32 = v26;
        __int16 v33 = 2080;
        __int16 v34 = " ";
        __int16 v35 = 2112;
        CFStringRef v36 = v11;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#I %s%sData available flag is not set, but audio file exists, record %@", (uint8_t *)&v31, 0x20u);
      }
      long long v27 = [(IMAPServiceLibrary *)self account];
      uint64_t v28 = [v27 serviceLabelID];
      VMStoreRecordSetFlags(v28, a4, Flags | 2u);
    }
  }
  else
  {
    if (v20)
    {
      id v29 = [(IMAPServiceLibrary *)self account];
      uint64_t v30 = *(void *)&v29[OBJC_IVAR___MFAccount_mambaID];
      int v31 = 136315650;
      uint64_t v32 = v30;
      __int16 v33 = 2080;
      __int16 v34 = " ";
      __int16 v35 = 2112;
      CFStringRef v36 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%sAudio file does not exist in the main store, record %@", (uint8_t *)&v31, 0x20u);
    }
    [(IMAPServiceLibrary *)self copyAudioDataToMainStore:a3 dstRecord:a4];
  }
  VMStoreSave();
  if (v11) {
    CFRelease(v11);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v15) {
    CFRelease(v15);
  }
}

- (void)createMainStoreRecord:(void *)a3
{
  int v5 = [(IMAPServiceLibrary *)self account];
  _NSRange v6 = [v5 accountStore];

  uint64_t v7 = [(IMAPServiceLibrary *)self account];
  uint64_t v8 = [v7 serviceLabelID];
  CFTypeRef v9 = (const void *)sub_1000798D0(v6, (uint64_t)a3, v8);

  VMStoreSave();
  CFStringRef v10 = VMStoreRecordCopyDescription((uint64_t)v9);
  CFStringRef v11 = sub_100019A40();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(IMAPServiceLibrary *)self account];
    uint64_t v13 = *(void *)&v12[OBJC_IVAR___MFAccount_mambaID];
    int v18 = 136315650;
    uint64_t v19 = v13;
    __int16 v20 = 2080;
    int v21 = " ";
    __int16 v22 = 2112;
    CFStringRef v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s%sCreating new global record %@", (uint8_t *)&v18, 0x20u);
  }
  [(IMAPServiceLibrary *)self copyAudioDataToMainStore:a3 dstRecord:v9];
  CFStringRef v14 = VMStoreRecordCopyDescription((uint64_t)v9);
  CFTypeRef v15 = sub_100019A40();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = [(IMAPServiceLibrary *)self account];
    uint64_t v17 = *(void *)&v16[OBJC_IVAR___MFAccount_mambaID];
    int v18 = 136315650;
    uint64_t v19 = v17;
    __int16 v20 = 2080;
    int v21 = " ";
    __int16 v22 = 2112;
    CFStringRef v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I %s%s===> Created new global record %@", (uint8_t *)&v18, 0x20u);
  }
  VMStoreSave();
  if (v9) {
    CFRelease(v9);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v14) {
    CFRelease(v14);
  }
}

- (void)mergeRecord:(void *)a3
{
  int v5 = [(IMAPServiceLibrary *)self account];
  _NSRange v6 = [v5 accountStore];

  uint64_t v7 = (__CFString *)sub_10007931C(v6, (uint64_t)a3);
  CFTypeRef DeletedRecordWithToken = VMStoreCopyFirstDeletedRecordWithToken(v7, 0);
  CFStringRef v9 = VMStoreRecordCopyDescription((uint64_t)a3);
  CFStringRef v10 = sub_100019A40();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = [(IMAPServiceLibrary *)self account];
    uint64_t v12 = *(void *)&v11[OBJC_IVAR___MFAccount_mambaID];
    int v17 = 136315906;
    uint64_t v18 = v12;
    __int16 v19 = 2080;
    __int16 v20 = " ";
    __int16 v21 = 2112;
    CFStringRef v22 = v9;
    __int16 v23 = 2112;
    uint64_t v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%sMerge record %@ with token %@ to the main store", (uint8_t *)&v17, 0x2Au);
  }
  if (DeletedRecordWithToken)
  {
    uint64_t v13 = sub_100019A40();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v14 = [(IMAPServiceLibrary *)self account];
      uint64_t v15 = *(void *)&v14[OBJC_IVAR___MFAccount_mambaID];
      int v17 = 136315650;
      uint64_t v18 = v15;
      __int16 v19 = 2080;
      __int16 v20 = " ";
      __int16 v21 = 2112;
      CFStringRef v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s%sRecord with the same token '%@' is found in the deleted table, skipping merge", (uint8_t *)&v17, 0x20u);
    }
    CFRelease(DeletedRecordWithToken);
  }
  else
  {
    CFTypeRef RecordWithToken = VMStoreCopyFirstRecordWithToken(v7, 0);
    if (RecordWithToken)
    {
      [(IMAPServiceLibrary *)self updateMainStoreRecord:a3 dstRecord:RecordWithToken token:v7];
      CFRelease(RecordWithToken);
    }
    else
    {
      [(IMAPServiceLibrary *)self createMainStoreRecord:a3];
    }
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v7) {
    CFRelease(v7);
  }
}

- (id)mailboxUidForMessage:(id)a3
{
  id v4 = a3;
  [v4 libraryID];
  int v5 = (const void *)VMStoreCopyRecordWithIdentifier();
  if (v5)
  {
    _NSRange v6 = [(IMAPServiceLibrary *)self _mailboxUidForStoreRecord:v5];
    CFRelease(v5);
  }
  else
  {
    _NSRange v6 = 0;
  }

  return v6;
}

- (id)getDetailsForMessages:(unint64_t)a3 absoluteBottom:(unint64_t)a4 topOfDesiredRange:(unint64_t)a5 range:(_NSRange *)a6 fromMailbox:(id)a7
{
  id v39 = a7;
  int v40 = sub_10001AB70(v39);
  uint64_t v12 = [(IMAPServiceLibrary *)self account];
  uint64_t v13 = [v12 accountStore];

  if (v40 == 1) {
    uint64_t v14 = 104;
  }
  else {
    uint64_t v14 = 96;
  }
  unint64_t v37 = a4;
  unint64_t v15 = sub_100019990(a4);
  unint64_t v38 = a5;
  unint64_t v16 = sub_100019990(a5);
  id v17 = sub_100079A4C(v13, 8 * (v40 == 2), v14, v15, v16);
  uint64_t v18 = (char *)[v17 count];
  if ((unint64_t)v18 > a3)
  {
    __int16 v19 = objc_msgSend(v17, "subarrayWithRange:", (char *)objc_msgSend(v17, "count") - a3, a3);
    id v20 = [v19 copy];

    uint64_t v18 = (char *)[v20 count];
    id v17 = v20;
  }
  if (!a6)
  {
LABEL_10:
    if (v18) {
      goto LABEL_11;
    }
LABEL_21:
    id v24 = 0;
    goto LABEL_22;
  }
  if (v17 && [v17 count])
  {
    int v21 = sub_10007901C(v13, (uint64_t)[v17 objectAtIndex:0]);
    int v22 = sub_10007901C(v13, (uint64_t)[v17 lastObject]);
    a6->id location = v21;
    a6->length = v22 - v21;
    goto LABEL_10;
  }
  a6->id location = 0;
  a6->length = 0;
  if (!v18) {
    goto LABEL_21;
  }
LABEL_11:
  __int16 v23 = 0;
  id v24 = 0;
  do
  {
    uint64_t v25 = (const char *)[v17 objectAtIndex:v23];
    CFStringRef v26 = VMStoreRecordCopyDescription((uint64_t)v25);
    long long v27 = sub_100019A40();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = [(IMAPServiceLibrary *)self account];
      uint64_t v29 = *(void *)&v28[OBJC_IVAR___MFAccount_mambaID];
      *(_DWORD *)buf = 136315650;
      uint64_t v42 = v29;
      __int16 v43 = 2080;
      uint64_t v44 = " ";
      __int16 v45 = 2112;
      unint64_t v46 = (unint64_t)v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#I %s%sAdd message details for record %@", buf, 0x20u);
    }
    if (v26) {
      CFRelease(v26);
    }
    uint64_t v30 = (char *)objc_alloc_init((Class)MFMessageDetails);
    *(void *)&v30[OBJC_IVAR___MFMessageDetails_library] = self;
    unsigned int v31 = sub_10007939C(v13, (uint64_t)v25);
    *(void *)&v30[OBJC_IVAR___MFMessageDetails_messageFlags] = v31 & 1 | (2 * ((v31 >> 2) & 1));
    *(_DWORD *)&v30[OBJC_IVAR___MFMessageDetails_uid] = sub_10007901C(v13, (uint64_t)v25);
    *(_DWORD *)&v30[OBJC_IVAR___MFMessageDetails_libraryID] = sub_100079014(v13, v25);
    *(_DWORD *)&v30[OBJC_IVAR___MFMessageDetails_mailboxID] = v40;
    *(_DWORD *)&v30[OBJC_IVAR___MFMessageDetails_dateReceived] = sub_1000790B0(v13, (uint64_t)v25);
    if (!v24) {
      id v24 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v18];
    }
    [v24 addObject:v30];

    ++v23;
  }
  while (v18 != v23);
LABEL_22:
  uint64_t v32 = sub_100019A40();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v33 = [(IMAPServiceLibrary *)self account];
    uint64_t v34 = *(void *)&v33[OBJC_IVAR___MFAccount_mambaID];
    CFStringRef v35 = @"Trash";
    *(_DWORD *)buf = 136316674;
    if (v40 == 1) {
      CFStringRef v35 = @"Inbox";
    }
    uint64_t v42 = v34;
    __int16 v43 = 2080;
    uint64_t v44 = " ";
    __int16 v45 = 2048;
    unint64_t v46 = v37;
    __int16 v47 = 2048;
    unint64_t v48 = v38;
    __int16 v49 = 2112;
    CFStringRef v50 = v35;
    __int16 v51 = 2112;
    int v52 = v13;
    __int16 v53 = 2112;
    id v54 = v24;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#I %s%sGet details <lowUID=%lu, highUID=%lu, mailbox=%@, store=%@> for messages %@", buf, 0x48u);
  }
  return v24;
}

- (id)addMessages:(id)a3 withMailbox:(id)a4 fetchBodies:(BOOL)a5 newMessagesByOldMessage:(id)a6 remoteIDs:(id)a7 setFlags:(unint64_t)a8 clearFlags:(unint64_t)a9 messageFlagsForMessages:(id)a10 copyFiles:(BOOL)a11 addPOPUIDs:(BOOL)a12 dataSectionsByMessage:(id)a13
{
  id v125 = a3;
  id v109 = a4;
  id v120 = a6;
  id v123 = a7;
  id v113 = a10;
  id v108 = a13;
  id v17 = [(IMAPServiceLibrary *)self account];
  v129 = [v17 accountStore];

  uint64_t v18 = [v109 name];
  id v114 = [v18 caseInsensitiveCompare:@"INBOX"];
  v130 = self;

  __int16 v19 = sub_100019A40();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [(IMAPServiceLibrary *)self account];
    uint64_t v21 = *(void *)&v20[OBJC_IVAR___MFAccount_mambaID];
    uint64_t v22 = [v109 name];
    __int16 v23 = (void *)v22;
    *(_DWORD *)buf = 136316162;
    if (v114) {
      int v24 = 3;
    }
    else {
      int v24 = 1;
    }
    uint64_t v132 = v21;
    __int16 v133 = 2080;
    v134 = " ";
    __int16 v135 = 2112;
    *(void *)v136 = v125;
    *(_WORD *)&v136[8] = 2112;
    *(void *)&v136[10] = v22;
    *(_WORD *)&v136[18] = 1024;
    *(_DWORD *)&v136[20] = v24;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%sAdd messages %@ to %@ mailbox, destination type is %d", buf, 0x30u);
  }
  uint64_t v25 = sub_100019A40();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v26 = [(IMAPServiceLibrary *)self account];
    uint64_t v27 = *(void *)&v26[OBJC_IVAR___MFAccount_mambaID];
    id v28 = [v109 account];
    id v29 = [v109 store];
    uint64_t v30 = [(IMAPServiceLibrary *)self account];
    unsigned int v31 = [v30 accountStore];
    *(_DWORD *)buf = 136316162;
    uint64_t v132 = v27;
    __int16 v133 = 2080;
    v134 = " ";
    __int16 v135 = 2112;
    *(void *)v136 = v28;
    *(_WORD *)&v136[8] = 2112;
    *(void *)&v136[10] = v29;
    *(_WORD *)&v136[18] = 2112;
    *(void *)&v136[20] = v31;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#I %s%sAdd messages to account %@ store %@, account store %@", buf, 0x34u);
  }
  unint64_t v32 = 0;
  id v126 = 0;
  v116 = 0;
  if (v114) {
    int v33 = 8;
  }
  else {
    int v33 = 0;
  }
  int v111 = v33;
  unint64_t v110 = ~a9;
  while (v32 < (unint64_t)[v125 count])
  {
    v127 = [v125 objectAtIndexedSubscript:v32];
    v128 = [v127 messageIDHeader];
    if (v32 >= (unint64_t)[v123 count]) {
      [v127 remoteID];
    }
    else {
    uint64_t v34 = [v123 objectAtIndexedSubscript:v32];
    }
    CFStringRef v35 = v34;
    if (v34) {
      id v36 = sub_10001B024(v34, 0);
    }
    else {
      id v36 = 0;
    }
    id v37 = sub_100079AA8(v129, (uint64_t)v128);
    id v38 = v37;
    if (v37)
    {
      CFStringRef v39 = VMStoreRecordCopyDescription((uint64_t)v37);
      int v40 = sub_100019A40();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        id v41 = [(IMAPServiceLibrary *)v130 account];
        uint64_t v42 = *(void *)&v41[OBJC_IVAR___MFAccount_mambaID];
        __int16 v43 = [(IMAPServiceLibrary *)v130 account];
        uint64_t v44 = [v43 serviceLabelID];
        *(_DWORD *)buf = 136316418;
        uint64_t v132 = v42;
        __int16 v133 = 2080;
        v134 = " ";
        __int16 v135 = 2112;
        *(void *)v136 = v39;
        *(_WORD *)&v136[8] = 2112;
        *(void *)&v136[10] = v128;
        *(_WORD *)&v136[18] = 1024;
        *(_DWORD *)&v136[20] = v36;
        *(_WORD *)&v136[24] = 2112;
        *(void *)&v136[26] = v44;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#I %s%sUpdating record %@ with token '%@', remote UID %u, label %@", buf, 0x3Au);
      }
      if (v39) {
        CFRelease(v39);
      }
      if ((VMStoreRecordGetFlags((uint64_t)v38) & 0x40) != 0)
      {
        __int16 v45 = sub_100019A40();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v46 = [(IMAPServiceLibrary *)v130 account];
          uint64_t v47 = *(void *)&v46[OBJC_IVAR___MFAccount_mambaID];
          *(_DWORD *)buf = 136315650;
          uint64_t v132 = v47;
          __int16 v133 = 2080;
          v134 = " ";
          __int16 v135 = 2112;
          *(void *)v136 = v128;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "#I %s%sResetting Detached flag from record with token '%@'", buf, 0x20u);
        }
        sub_1000793D8(v129, (uint64_t)v38, 64);
      }
      unsigned int v48 = sub_10007939C(v129, (uint64_t)v38) & 0xFFFFFFE3;
      if (v114) {
        v48 |= 8u;
      }
      uint64_t v49 = sub_100019A94((a8 & 1 | (4 * ((a8 >> 1) & 1)) | (a8 >> 27) & 0x20 | v48) & ~(a9 & 1 | (4 * ((a9 >> 1) & 1)) | (a9 >> 27) & 0x20));
      sub_1000793E4(v129, v38, v49);
      sub_10007904C(v129, (uint64_t)v38, (uint64_t)v36);
      CFStringRef v50 = [(IMAPServiceLibrary *)v130 account];
      __int16 v51 = [v50 serviceMDN];
      sub_100079238(v129, (uint64_t)v38, (uint64_t)v51);

LABEL_71:
      v91 = [(IMAPServiceLibrary *)v130 account];
      v92 = [v91 accountStore];
      [v92 save];

      [(IMAPServiceLibrary *)v130 mergeRecord:v38];
      v93 = [(IMAPServiceLibrary *)v130 messageWithAccountStoreRecord:v38];
      v94 = v126;
      if (!v126) {
        v94 = objc_opt_new();
      }
      id v126 = v94;
      [v94 addObject:v93];
      if (v120) {
        [v120 setObject:v93 forKey:v127];
      }
      CFRelease(v38);

      goto LABEL_76;
    }
    if (v32 >= (unint64_t)[v113 count])
    {
      unint64_t v54 = (unint64_t)[v127 messageFlags];
    }
    else
    {
      int v52 = [v113 objectAtIndexedSubscript:v32];
      unsigned int v53 = [v52 unsignedIntValue];

      unint64_t v54 = v53;
    }
    int v122 = v111;
    if (((v54 | a8) & v110) != 0) {
      int v122 = (2 * ((v54 | a8) & v110)) & 4 | (v54 | a8) & v110 & 1 | (((v54 | a8) & v110) >> 27) & 0x20 | v111;
    }
    v55 = [(IMAPServiceLibrary *)v130 account];
    v124 = [v55 serviceICC];

    v121 = [v127 headers];
    uint64_t v56 = [v121 firstSenderAddress];
    v117 = [v56 pstnAddress];

    __int16 v57 = v117;
    if (v117)
    {
      v58 = sub_10001FA20(v117, v124);
      if (![v58 length])
      {
        id v59 = v117;

        v58 = v59;
        __int16 v57 = v117;
      }
    }
    else
    {
      v58 = 0;
    }
    v119 = v58;
    uint64_t v60 = CFPhoneNumberCreate();
    __int16 v61 = (const void *)v60;
    if (v57 && sub_10001E948(v60))
    {
      unint64_t v62 = sub_100019A40();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v63 = [(IMAPServiceLibrary *)v130 account];
        uint64_t v64 = *(void *)&v63[OBJC_IVAR___MFAccount_mambaID];
        *(_DWORD *)buf = 136315650;
        uint64_t v132 = v64;
        __int16 v133 = 2080;
        v134 = " ";
        __int16 v135 = 2112;
        *(void *)v136 = v119;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "#I %s%sPrivacy manager reports sender address %@ is blocked; marking record as blocked",
          buf,
          0x20u);
      }
      v122 |= 0x80u;
    }
    if (v61) {
      CFRelease(v61);
    }
    __int16 v65 = sub_100019A40();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      id v66 = [(IMAPServiceLibrary *)v130 account];
      uint64_t v67 = *(void *)&v66[OBJC_IVAR___MFAccount_mambaID];
      v68 = [(IMAPServiceLibrary *)v130 account];
      v69 = [v68 serviceMDN];
      *(_DWORD *)buf = 136315650;
      uint64_t v132 = v67;
      __int16 v133 = 2080;
      v134 = " ";
      __int16 v135 = 2112;
      *(void *)v136 = v69;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "#I %s%sUsing account's service phone number: %@", buf, 0x20u);
    }
    v70 = [(IMAPServiceLibrary *)v130 account];
    v118 = [v70 serviceMDN];

    v71 = v121;
    id v72 = [v121 copyAddressListForReplyTo];
    v115 = v72;
    if (!v72)
    {
      v76 = 0;
      v74 = 0;
      goto LABEL_63;
    }
    v73 = [v72 firstObject];
    v74 = [v73 pstnAddress];

    if (v74)
    {
      v71 = v121;
      v75 = sub_10001FA20(v74, v124);
      if ([v75 length])
      {
        v76 = v75;
        goto LABEL_56;
      }
    }
    v76 = 0;
    v71 = v121;
LABEL_56:
    uint64_t v77 = CFPhoneNumberCreate();
    v78 = (const void *)v77;
    if (v76 && sub_10001E948(v77))
    {
      v79 = sub_100019A40();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        v80 = [(IMAPServiceLibrary *)v130 account];
        uint64_t v81 = *(void *)&v80[OBJC_IVAR___MFAccount_mambaID];
        *(_DWORD *)buf = 136315650;
        uint64_t v132 = v81;
        __int16 v133 = 2080;
        v134 = " ";
        __int16 v135 = 2112;
        *(void *)v136 = v76;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "#I %s%sPrivacy manager reports reply to address %@ is blocked; marking record as blocked",
          buf,
          0x20u);
      }
      v122 |= 0x80u;
      v71 = v121;
    }
    if (v78) {
      CFRelease(v78);
    }
LABEL_63:
    v82 = [v71 firstHeaderForKey:@"x-applevm-deletion-date"];
    if ([v82 length]) {
      id v83 = +[NSDate mf_copyDateInCommonFormatsWithString:v82];
    }
    else {
      id v83 = 0;
    }
    v84 = [v127 dateSent];
    v85 = sub_100019A40();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      v86 = [(IMAPServiceLibrary *)v130 account];
      uint64_t v87 = *(void *)&v86[OBJC_IVAR___MFAccount_mambaID];
      *(_DWORD *)buf = 136317442;
      uint64_t v132 = v87;
      __int16 v133 = 2080;
      v134 = " ";
      __int16 v135 = 1024;
      *(_DWORD *)v136 = v36;
      *(_WORD *)&v136[4] = 2112;
      *(void *)&v136[6] = v84;
      *(_WORD *)&v136[14] = 2112;
      *(void *)&v136[16] = v128;
      *(_WORD *)&v136[24] = 2112;
      *(void *)&v136[26] = v119;
      __int16 v137 = 2112;
      v138 = v76;
      __int16 v139 = 2112;
      id v140 = v83;
      __int16 v141 = 1024;
      int v142 = v122;
      __int16 v143 = 2112;
      v144 = v118;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "#I %s%s===> Creating new record with remoteUID: %d, sentDate: %@, messageID: %@, from: %@, callback: %@, expirationDate: %@, flags: %d, to: %@", buf, 0x5Eu);
    }
    [v84 timeIntervalSince1970];
    double v89 = v88;
    [v83 timeIntervalSince1970];
    LODWORD(v107) = v122;
    id v38 = sub_100079894(v129, (uint64_t)v36, (int)v89, (uint64_t)v128, (uint64_t)v119, (uint64_t)v76, 0);
    v90 = v116;
    if (!v116) {
      v90 = objc_opt_new();
    }
    v116 = v90;
    objc_msgSend(v90, "addObject:", v38, v107, v118);

    if (v38) {
      goto LABEL_71;
    }
LABEL_76:

    ++v32;
  }
  if (v126)
  {
    if (v116)
    {
      id v95 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v116, @"VVAddedRecords", 0);
      v96 = sub_100019A40();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        v97 = [(IMAPServiceLibrary *)v130 account];
        uint64_t v98 = *(void *)&v97[OBJC_IVAR___MFAccount_mambaID];
        *(_DWORD *)buf = 136315650;
        uint64_t v132 = v98;
        __int16 v133 = 2080;
        v134 = " ";
        __int16 v135 = 2112;
        *(void *)v136 = v95;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "#I %s%sPosting kIMAPServiceLibraryRecordsAddedNotification notification %@", buf, 0x20u);
      }
      v99 = +[NSNotificationCenter defaultCenter];
      [v99 postNotificationName:@"kIMAPServiceLibraryRecordsAddedNotification" object:v130 userInfo:v95];

      [(IMAPServiceLibrary *)v130 _postMessagesAdded:v95];
    }
    if (v109) {
      id v100 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v109, 0);
    }
    else {
      id v100 = 0;
    }
    id v101 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v126, @"messages", v100, @"mailboxes", 0);
    v102 = sub_100019A40();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      v103 = [(IMAPServiceLibrary *)v130 account];
      uint64_t v104 = *(void *)&v103[OBJC_IVAR___MFAccount_mambaID];
      *(_DWORD *)buf = 136315650;
      uint64_t v132 = v104;
      __int16 v133 = 2080;
      v134 = " ";
      __int16 v135 = 2112;
      *(void *)v136 = v101;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "#I %s%sPosting MailMessageStoreMessagesAdded notification %@", buf, 0x20u);
    }
    v105 = +[NSNotificationCenter defaultCenter];
    [v105 postNotificationName:MailMessageStoreMessagesAdded object:v130 userInfo:v101];
  }
  return v126;
}

- (void)_postMessagesAdded:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001EA64;
  v6[3] = &unk_1000C1A00;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (BOOL)isMessageContentsLocallyAvailable:(id)a3
{
  id v3 = a3;
  [v3 libraryID];
  uint64_t v4 = VMStoreCopyRecordWithIdentifier();
  id v5 = (const void *)v4;
  if (v4)
  {
    if ((VMStoreRecordGetFlags(v4) & 2) != 0 && (_NSRange v6 = (const void *)VMStoreRecordCopyDataPath()) != 0)
    {
      id v7 = +[NSFileManager defaultManager];
      unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

      CFRelease(v6);
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)setFlagsForMessages:(id)a3 mask:(unint64_t)a4
{
  id v17 = a3;
  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v18 = [v17 allKeys];
  _NSRange v6 = (char *)[v18 count];
  id v7 = sub_100019A40();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v8 = [(IMAPServiceLibrary *)self account];
    uint64_t v9 = *(void *)&v8[OBJC_IVAR___MFAccount_mambaID];
    *(_DWORD *)buf = 136316162;
    uint64_t v21 = v9;
    __int16 v22 = 2080;
    __int16 v23 = " ";
    __int16 v24 = 2112;
    id v25 = v17;
    __int16 v26 = 2048;
    unint64_t v27 = a4;
    __int16 v28 = 2112;
    id v29 = v18;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sSet flags %@ with mask %llu for messages %@", buf, 0x34u);
  }
  if (v6)
  {
    for (CFIndex i = 0; i != v6; ++i)
    {
      CFStringRef v11 = [v18 objectAtIndex:i];
      unint64_t v12 = (unint64_t)[v11 messageFlags];
      uint64_t v13 = [v17 objectForKey:v11];
      unsigned int v14 = [v13 unsignedIntValue];

      if (a4 == 0x1BFDDF7FFFFLL) {
        unint64_t v15 = v14;
      }
      else {
        unint64_t v15 = v14 & a4 | v12 & ~a4;
      }
      id v16 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:v12];
      [v19 setObject:v16 forKey:v11];
      [(IMAPServiceLibrary *)self _setFlags:v15 forMessage:v11 postAndCommit:0];
    }
  }
  VMStoreSave();
  [(IMAPServiceLibrary *)self postFlagsChangedForMessages:v18 flags:0 oldFlagsByMessage:v19];
}

- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = sub_100019A40();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(IMAPServiceLibrary *)self account];
    uint64_t v10 = *(void *)&v9[OBJC_IVAR___MFAccount_mambaID];
    int v12 = 136315906;
    uint64_t v13 = v10;
    __int16 v14 = 2080;
    unint64_t v15 = " ";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%s==== Set flags from dictionary %@ for messages %@", (uint8_t *)&v12, 0x2Au);
  }
  return v7;
}

- (void)setFlags:(unint64_t)a3 forMessage:(id)a4
{
}

- (void)_setFlags:(unint64_t)a3 forMessage:(id)a4 postAndCommit:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v23 = v8;
  if (v5) {
    id v9 = [v8 messageFlags];
  }
  else {
    id v9 = 0;
  }
  [v23 setMessageFlagsWithoutCommitting:a3];
  uint64_t v10 = [v23 messageIDHeader];
  CFStringRef v11 = [v23 messageStore];
  int v12 = [v11 mailboxUid];
  if ([v12 type] == 7) {
    unint64_t v13 = 1;
  }
  else {
    unint64_t v13 = 3;
  }

  CFTypeRef RecordWithTokenInMailbox = VMStoreCopyFirstRecordWithTokenInMailbox(v10, v13);
  if (RecordWithTokenInMailbox)
  {
    unint64_t v15 = [v23 remoteID];
    __int16 v16 = v15;
    if (v15)
    {
      unsigned int v17 = sub_10001B024(v15, 0);
      if (v17 == VMStoreRecordGetRemoteUID((uint64_t)RecordWithTokenInMailbox))
      {
        int v18 = [v23 hasTemporaryUid] ? 32 : 0;
        int Flags = VMStoreRecordGetFlags((uint64_t)RecordWithTokenInMailbox);
        int v19 = (VMStoreRecordGetFlags((uint64_t)RecordWithTokenInMailbox) & 0x40) != 0
            ? a3 & 1 | (4 * ((a3 >> 1) & 1)) & 0xFFFFFFE1 | (a3 >> 27) & 0x20 | v18 & 0xFFFFFFE1
            : a3 & 1 | (4 * ((a3 >> 1) & 1)) | (a3 >> 27) & 0x20 | v18;
        id v20 = [(IMAPServiceLibrary *)self account];
        uint64_t v21 = [v20 serviceLabelID];
        VMStoreRecordSetFlagsFromServer(v21, RecordWithTokenInMailbox, v19 | Flags & 0xFFFFFFDA, 1);

        if (v5) {
          VMStoreSave();
        }
      }
    }
    CFRelease(RecordWithTokenInMailbox);
  }
  if (v5) {
    [(IMAPServiceLibrary *)self postOldFlags:v9 newFlags:a3 forMessage:v23];
  }
}

- (MFLibraryStore)sharedGenericStore
{
  return self->_sharedGenericStore;
}

- (IMAPServiceAccount)account
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_account);
  return (IMAPServiceAccount *)WeakRetained;
}

- (NSMapTable)knownMessages
{
  return self->_knownMessages;
}

- (void)setKnownMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownMessages, 0);
  objc_destroyWeak((id *)&self->_account);
  objc_storeStrong((id *)&self->_sharedGenericStore, 0);
}

@end