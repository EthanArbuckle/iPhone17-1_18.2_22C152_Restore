@interface IMAPServiceGreetingStore
- (BOOL)canPerformOfflineAppend;
- (IMAPServiceGreetingStore)initWithMailboxUid:(id)a3 readOnly:(BOOL)a4;
- (id)candidateGreetingMessage;
- (unsigned)appendActiveGreeting:(id)a3;
- (void)_applyFlags:(id)a3 state:(BOOL)a4 toUidRange:(id)a5 except:(unsigned int)a6 closeWhenFinished:(BOOL)a7 usingConnection:(id)a8;
- (void)_removeActiveGreetingFlagFromAllUidsExcept:(unsigned int)a3 isLast:(BOOL)a4 usingConnection:(id)a5;
- (void)makeGreetingActive:(id)a3;
- (void)removeActiveGreetingFlagFromAllUids;
- (void)removeActiveGreetingFlagFromAllUidsExceptLast:(unsigned int)a3;
- (void)setLibrary:(id)a3;
@end

@implementation IMAPServiceGreetingStore

- (IMAPServiceGreetingStore)initWithMailboxUid:(id)a3 readOnly:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IMAPServiceGreetingStore;
  v4 = [(IMAPServiceStore *)&v7 initWithMailboxUid:a3 readOnly:a4];
  if (v4)
  {
    v5 = objc_alloc_init(IMAPServiceGreetingLibrary);
    [(IMAPServiceGreetingStore *)v4 setLibrary:v5];
  }
  return v4;
}

- (void)setLibrary:(id)a3
{
  id v4 = a3;
  v5 = sub_100032AFC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(IMAPServiceGreetingStore *)self mailboxUid];
    *(_DWORD *)buf = 136315394;
    id v9 = [v6 mambaID];
    __int16 v10 = 2080;
    v11 = " ";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sIMAPServiceGreetingStore::setLibrary", buf, 0x16u);
  }
  if (!v4 || !*(void *)&self->super.MFLibraryIMAPStore_opaque[OBJC_IVAR___MFLibraryStore__library])
  {
    v7.receiver = self;
    v7.super_class = (Class)IMAPServiceGreetingStore;
    [(IMAPServiceGreetingStore *)&v7 setLibrary:v4];
  }
}

- (void)_applyFlags:(id)a3 state:(BOOL)a4 toUidRange:(id)a5 except:(unsigned int)a6 closeWhenFinished:(BOOL)a7 usingConnection:(id)a8
{
  BOOL v9 = a7;
  BOOL v12 = a4;
  id v26 = a3;
  id v14 = a8;
  v15 = v14;
  if (!v14
    && ([*(id *)&self->super.MFLibraryIMAPStore_opaque[OBJC_IVAR___MFMailMessageStore__account] connectionForStore:self delegate:self options:1], (v15 = objc_claimAutoreleasedReturnValue()) == 0)|| !objc_msgSend(v15, "isValid"))
  {
    v19 = +[MFActivityMonitor currentTracebleMonitor];
    v20 = [v19 error];

    if (v20)
    {
      v21 = 0;
    }
    else
    {
      v21 = +[NSError errorWithDomain:kVVErrorDomain code:1023 localizedDescription:@"Could not establish IMAP connection."];
    }

    if (!v21) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (a6)
  {
    id v16 = [objc_alloc((Class)NSIndexSet) initWithIndex:a6];
    v17 = [v15 messageSetForRange:a5 butNotNumbers:v16];
    unsigned __int8 v18 = [v15 storeFlags:v26 state:v12 forMessageSet:v17];

    if ((v18 & 1) == 0) {
      goto LABEL_24;
    }
  }
  else
  {
    if (a5.var0 == a5.var1)
    {
      id v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%u", a5);
      id v23 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v22, 0);
      unsigned __int8 v24 = [v15 storeFlags:v26 state:v12 forUids:v23];

      v21 = 0;
      if (v24)
      {
        if (v9) {
          goto LABEL_25;
        }
        goto LABEL_15;
      }
LABEL_24:
      v21 = +[NSError errorWithDomain:kVVErrorDomain code:1016 localizedDescription:@"Error issuing UID STORE for greeting flag."];
      if (v9) {
        goto LABEL_25;
      }
LABEL_15:
      if (!v14) {
        goto LABEL_26;
      }
LABEL_16:
      if (!v21) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    if (([v15 storeFlags:v26 state:v12 forRange:a5] & 1) == 0) {
      goto LABEL_24;
    }
  }
  v21 = 0;
  if (!v9) {
    goto LABEL_15;
  }
LABEL_25:
  [v15 close];
  if (v14) {
    goto LABEL_16;
  }
LABEL_26:
  [*(id *)&self->super.MFLibraryIMAPStore_opaque[OBJC_IVAR___MFMailMessageStore__account] checkInConnection:v15];
  if (v21)
  {
LABEL_17:
    v25 = +[MFActivityMonitor currentTracebleMonitor];
    [v25 setError:v21];
  }
LABEL_18:
}

- (void)removeActiveGreetingFlagFromAllUids
{
  id v3 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"$AppleVM-ActiveGreeting", 0);
  [(IMAPServiceGreetingStore *)self _applyFlags:v3 state:0 toUidRange:0xFFFFFFFF00000001 except:0 closeWhenFinished:1 usingConnection:0];
}

- (void)_removeActiveGreetingFlagFromAllUidsExcept:(unsigned int)a3 isLast:(BOOL)a4 usingConnection:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = v8;
  if (!v8)
  {
    id v8 = [*(id *)&self->super.MFLibraryIMAPStore_opaque[OBJC_IVAR___MFMailMessageStore__account] connectionForStore:self delegate:self options:1];
    if (!v8)
    {
      int v11 = 0;
      id v18 = 0;
      goto LABEL_9;
    }
  }
  id v18 = v8;
  if (![v8 isValid])
  {
    int v11 = 1;
LABEL_9:
    id v12 = +[NSError errorWithDomain:kVVErrorDomain code:1008 localizedDescription:@"Candidate greeting doesn't have a valid remote UID"];
    v13 = +[MFActivityMonitor currentTracebleMonitor];
    [v13 setError:v12];
    goto LABEL_21;
  }
  if (v6)
  {
    if (v5)
    {
      unint64_t v10 = (v6 - 1);
LABEL_12:
      if (v6 == 1 && v10 < 2)
      {
        int v11 = 1;
        if (v9) {
          goto LABEL_24;
        }
        goto LABEL_22;
      }
      goto LABEL_17;
    }
    uint64_t v14 = *(void *)&self->super.MFLibraryIMAPStore_opaque[OBJC_IVAR___MFLibraryIMAPStore__serverUidNext];
    if (v14)
    {
      unint64_t v10 = sub_100019990(v14 - 1);
      goto LABEL_12;
    }
  }
  unint64_t v10 = 0xFFFFFFFFLL;
LABEL_17:
  id v12 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"$AppleVM-ActiveGreeting", 0);
  int v11 = 1;
  uint64_t v15 = (v10 << 32) | 1;
  [(IMAPServiceGreetingStore *)self _applyFlags:v12 state:0 toUidRange:v15 except:v6 closeWhenFinished:0 usingConnection:v18];
  v13 = +[MFActivityMonitor currentTracebleMonitor];
  if (([v13 shouldCancel] & 1) == 0)
  {
    id v16 = [v13 error];

    if (v16)
    {
      int v11 = 1;
    }
    else
    {
      v17 = MFCreateArrayForMessageFlags();
      int v11 = 1;
      [(IMAPServiceGreetingStore *)self _applyFlags:v17 state:1 toUidRange:v15 except:v6 closeWhenFinished:1 usingConnection:v18];
    }
  }
LABEL_21:

  if (v9) {
    goto LABEL_24;
  }
LABEL_22:
  if (v11) {
    [*(id *)&self->super.MFLibraryIMAPStore_opaque[OBJC_IVAR___MFMailMessageStore__account] checkInConnection:v18];
  }
LABEL_24:
}

- (void)removeActiveGreetingFlagFromAllUidsExceptLast:(unsigned int)a3
{
}

- (BOOL)canPerformOfflineAppend
{
  return 0;
}

- (unsigned)appendActiveGreeting:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v4, 0);

  id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
  id v7 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"$AppleVM-ActiveGreeting", 0);
  id v8 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v7, 0);
  id v9 = objc_alloc((Class)NSArray);
  unint64_t v10 = +[NSNumber numberWithUnsignedInt:1];
  id v11 = objc_msgSend(v9, "initWithObjects:", v10, 0);

  if ([(IMAPServiceGreetingStore *)self appendMessages:v5 unsuccessfulOnes:0 newMessageIDs:v6 newMessages:0 flagsToSet:v11 customIMAPFlagsToSet:v8] != (id)1)
  {
    id v12 = +[MFActivityMonitor currentTracebleMonitor];
    v13 = [v12 error];

    if (!v13)
    {
      uint64_t v14 = [(IMAPServiceGreetingStore *)self account];
      unsigned int v15 = [v14 isOffline];

      id v16 = sub_100032AFC();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v17)
        {
          id v18 = [(IMAPServiceGreetingStore *)self mailboxUid];
          *(_DWORD *)buf = 136315650;
          id v27 = [v18 mambaID];
          __int16 v28 = 2080;
          v29 = " ";
          __int16 v30 = 2112;
          v31 = self;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#W %s%sCould not append greeting for offline service %@", buf, 0x20u);
        }
        v19 = +[VMAWDReporter sharedInstance];
        [v19 reportCustomGreetingFailedWithReason:1];
        uint64_t v20 = 1023;
      }
      else
      {
        if (v17)
        {
          v21 = [(IMAPServiceGreetingStore *)self mailboxUid];
          *(_DWORD *)buf = 136315650;
          id v27 = [v21 mambaID];
          __int16 v28 = 2080;
          v29 = " ";
          __int16 v30 = 2112;
          v31 = self;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#W %s%sCould not append greeting for service %@", buf, 0x20u);
        }
        v19 = +[VMAWDReporter sharedInstance];
        [v19 reportCustomGreetingFailedWithReason:0];
        uint64_t v20 = 1036;
      }

      id v22 = +[NSError errorWithDomain:kVVErrorDomain code:v20 localizedDescription:@"Error appending greeting."];
      [v12 setError:v22];
    }
  }
  id v23 = [v6 lastObject];
  unsigned int v24 = [v23 intValue];

  return v24;
}

- (id)candidateGreetingMessage
{
  [(IMAPServiceGreetingStore *)self mf_lock];
  id v3 = *(id *)&self->super.MFLibraryIMAPStore_opaque[OBJC_IVAR___MFLibraryStore__library];
  [v3 resetMessages];
  id v23 = self;
  [(IMAPServiceGreetingStore *)self fetchMobileSynchronously:0x7FFFFFFFFFFFFFFFLL];
  id v4 = [v3 messages];
  id v5 = (char *)[v4 count];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    id v8 = 0;
    id v9 = 0;
    double v10 = 2.22507386e-308;
    do
    {
      id v11 = [v4 objectAtIndex:v8];
      if (([v11 messageFlags] & 2) != 0)
      {
        id v15 = v9;
      }
      else
      {
        [v11 dateSentAsTimeIntervalSince1970];
        double v13 = v12;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [v11 customFlags];
          id v15 = [v14 containsObject:@"$AppleVM-ActiveGreeting"];
        }
        else
        {
          id v15 = 0;
        }
        if (!((v13 < v10) | (v9 ^ v15) & 1)
          || ((v15 ^ 1 | v9) & 1) == 0)
        {
          id v16 = v11;

          double v10 = v13;
          id v7 = v16;
        }
      }

      ++v8;
      id v9 = v15;
    }
    while (v6 != v8);
  }
  else
  {
    LOBYTE(v15) = 0;
    id v7 = 0;
  }
  BOOL v17 = [(IMAPServiceGreetingStore *)v23 account];
  id v18 = [v17 service];
  v19 = v18;
  if (v15) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = 0;
  }
  [v18 _setActiveGreetingType:v20];

  [v3 resetMessages];
  [(IMAPServiceGreetingStore *)v23 mf_unlock];
  id v21 = v7;

  return v21;
}

- (void)makeGreetingActive:(id)a3
{
  id v4 = a3;
  id v5 = +[MFActivityMonitor currentTracebleMonitor];
  id v6 = [v4 remoteID];

  id v7 = [v6 intValue];
  if (!v7)
  {
    id v15 = +[NSError errorWithDomain:kVVErrorDomain code:1008 localizedDescription:@"Candidate greeting doesn't have a valid remote UID"];
    if (!v15) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v8 = OBJC_IVAR___MFMailMessageStore__account;
  id v9 = [*(id *)&self->super.MFLibraryIMAPStore_opaque[OBJC_IVAR___MFMailMessageStore__account] connectionForStore:self delegate:self options:1];
  if (v9)
  {
    double v10 = sub_100032AFC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(IMAPServiceGreetingStore *)self mailboxUid];
      *(_DWORD *)buf = 136315906;
      id v19 = [v11 mambaID];
      __int16 v20 = 2080;
      id v21 = " ";
      __int16 v22 = 2112;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2112;
      v25 = v9;
      id v12 = v23;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ make greeting active for connection %@", buf, 0x2Au);
    }
    double v13 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"$AppleVM-ActiveGreeting", 0);
    [(IMAPServiceGreetingStore *)self _applyFlags:v13 state:1 toUidRange:v7 | ((unint64_t)v7 << 32) except:0 closeWhenFinished:0 usingConnection:v9];
    if (([v5 shouldCancel] & 1) == 0)
    {
      uint64_t v14 = [v5 error];

      if (!v14) {
        [(IMAPServiceGreetingStore *)self _removeActiveGreetingFlagFromAllUidsExcept:v7 isLast:0 usingConnection:v9];
      }
    }
    [*(id *)&self->super.MFLibraryIMAPStore_opaque[v8] checkInConnection:v9];
    id v15 = 0;
  }
  else
  {
    id v15 = +[NSError errorWithDomain:kVVErrorDomain code:1023 localizedDescription:@"Could not establish IMAP connection."];
    double v13 = sub_100032AFC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(IMAPServiceGreetingStore *)self mailboxUid];
      *(_DWORD *)buf = 136315906;
      id v19 = [v16 mambaID];
      __int16 v20 = 2080;
      id v21 = " ";
      __int16 v22 = 2112;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2112;
      v25 = 0;
      id v17 = v23;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#W %s%s%@ could not make greeting active for connection %@", buf, 0x2Au);
    }
  }

  if (v15) {
LABEL_14:
  }
    [v5 setError:v15];
LABEL_15:
}

@end