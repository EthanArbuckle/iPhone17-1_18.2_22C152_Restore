@interface IMAPServiceStore
- (BOOL)shouldRetryEmptyBodyDownloadForMessage:(id)a3;
- (IMAPServiceStore)initWithMailboxUid:(id)a3 readOnly:(BOOL)a4;
- (id)newObjectCache;
- (unsigned)connectionBodyDataReadChunkSize:(id)a3;
- (void)_handleFlagsDidChange:(id)a3;
- (void)doCompact;
- (void)messageFlagsDidChange:(id)a3 flags:(id)a4;
- (void)setMailboxUidValidity:(unsigned int)a3;
@end

@implementation IMAPServiceStore

- (IMAPServiceStore)initWithMailboxUid:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMAPServiceStore;
  v7 = [(IMAPServiceStore *)&v14 initWithMailboxUid:v6 readOnly:v4];
  v8 = v7;
  if (v7)
  {
    v9 = [(IMAPServiceStore *)v7 account];
    id v10 = [v9 uidValidityForMailbox:v6];

    *(unsigned char *)&v8->_imapServiceStoreFlags |= 1u;
    [(IMAPServiceStore *)v8 setMailboxUidValidity:v10];
    *(unsigned char *)&v8->_imapServiceStoreFlags &= ~1u;
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v8 selector:"_handleFlagsDidChange:" name:MailMessageStoreMessageFlagsChanged object:0];

    v12 = [(IMAPServiceStore *)v8 account];
    [(IMAPServiceStore *)v8 setDownloadDelegate:v12];
  }
  return v8;
}

- (id)newObjectCache
{
  return 0;
}

- (void)setMailboxUidValidity:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = sub_10002BF54();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IMAPServiceStore *)self mailboxUid];
    id v7 = [v6 mambaID];
    char imapServiceStoreFlags = (char)self->_imapServiceStoreFlags;
    *(_DWORD *)buf = 136315906;
    if (imapServiceStoreFlags) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    id v14 = v7;
    __int16 v15 = 2080;
    v16 = " ";
    __int16 v17 = 1024;
    int v18 = v3;
    __int16 v19 = 2112;
    CFStringRef v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%ssetMailboxUidValidity validity %u settingLocalValidity %@", buf, 0x26u);
  }
  if ((*(unsigned char *)&self->_imapServiceStoreFlags & 1) == 0)
  {
    id v10 = [(IMAPServiceStore *)self account];
    v11 = [(IMAPServiceStore *)self mailboxUid];
    [v10 setUidValidity:v3 forMailbox:v11];
  }
  v12.receiver = self;
  v12.super_class = (Class)IMAPServiceStore;
  [(IMAPServiceStore *)&v12 setMailboxUidValidity:v3];
}

- (unsigned)connectionBodyDataReadChunkSize:(id)a3
{
  uint64_t v3 = [(IMAPServiceStore *)self account];
  unsigned int v4 = [v3 readBufferSize];

  return v4;
}

- (void)doCompact
{
  v5.receiver = self;
  v5.super_class = (Class)IMAPServiceStore;
  [(IMAPServiceStore *)&v5 doCompact];
  uint64_t v3 = *(void **)&self->MFLibraryIMAPStore_opaque[OBJC_IVAR___MFLibraryStore__library];
  unsigned int v4 = [(IMAPServiceStore *)self URLString];
  [v3 compactMailbox:v4];
}

- (BOOL)shouldRetryEmptyBodyDownloadForMessage:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [*(id *)&self->MFLibraryIMAPStore_opaque[OBJC_IVAR___MFLibraryStore__library] copyStoreRecordForMessage:v4];
    id v6 = +[MFActivityMonitor currentTracebleMonitor];
    id v7 = [v6 primaryTarget];

    if (v5 != v7
      || (unsigned int v9 = +[IMAPServiceActivityController remainingBodyRetries]) == 0)
    {
      BOOL v8 = 0;
      if (!v5) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    +[IMAPServiceActivityController setRemainingBodyRetries:v9 - 1];
    BOOL v8 = 1;
    if (v5) {
LABEL_8:
    }
      CFRelease(v5);
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_9:

  return v8;
}

- (void)messageFlagsDidChange:(id)a3 flags:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = sub_10002BF54();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(IMAPServiceStore *)self mailboxUid];
    int v10 = 136315906;
    id v11 = [v9 mambaID];
    __int16 v12 = 2080;
    v13 = " ";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%s======== messageFlagsDidChange: %@, flags: %@", (uint8_t *)&v10, 0x2Au);
  }
}

- (void)_handleFlagsDidChange:(id)a3
{
  id v4 = a3;
  id v5 = sub_10002BF54();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IMAPServiceStore *)self mailboxUid];
    int v7 = 136315650;
    id v8 = [v6 mambaID];
    __int16 v9 = 2080;
    int v10 = " ";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s======== IMAPServiceStore _handleFlagsDidChange: %@", (uint8_t *)&v7, 0x20u);
  }
}

@end