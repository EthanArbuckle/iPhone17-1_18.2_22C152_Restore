@interface IMAPServiceConnection
+ (id)heldConnectionsForCheckingIn;
- (BOOL)changePassword:(id)a3;
- (BOOL)checkIn;
- (IMAPServiceConnection)initWithMambaID:(const char *)a3;
- (id)_headersToFetchIncludingThoseRequiredForRouting:(BOOL)a3 withRecipients:(BOOL)a4;
- (id)searchUIDs:(id)a3 withFlagRequests:(id)a4;
- (void)checkInForcefully;
- (void)checkInToAccount:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation IMAPServiceConnection

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IMAPServiceConnection;
  [(IMAPServiceConnection *)&v2 dealloc];
}

- (id)searchUIDs:(id)a3 withFlagRequests:(id)a4
{
  return 0;
}

- (id)_headersToFetchIncludingThoseRequiredForRouting:(BOOL)a3 withRecipients:(BOOL)a4
{
  +[IMAPServiceConnection mf_lock];
  if (!qword_1000E07F0)
  {
    id v4 = objc_alloc((Class)NSArray);
    id v5 = objc_msgSend(v4, "initWithObjects:", H_DATE, H_SUBJECT, MFMimeHeaderFromKey, H_CONTENT_TYPE, H_MESSAGE_ID, MFMimeHeaderReplyToKey, @"x-applevm-deletion-date", 0);
    v6 = (void *)qword_1000E07F0;
    qword_1000E07F0 = (uint64_t)v5;
  }
  +[IMAPServiceConnection mf_unlock];
  v7 = (void *)qword_1000E07F0;
  return v7;
}

- (IMAPServiceConnection)initWithMambaID:(const char *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IMAPServiceConnection;
  v3 = [(IMAPServiceConnection *)&v7 initWithMambaID:a3];
  if (v3)
  {
    id v4 = (NSLock *)objc_alloc_init((Class)NSLock);
    checkedOutThreadsLock = v3->_checkedOutThreadsLock;
    v3->_checkedOutThreadsLock = v4;
  }
  return v3;
}

- (BOOL)changePassword:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000F758();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IMAPServiceConnection *)self mambaID];
    objc_super v7 = [(IMAPServiceConnection *)self rumbaID];
    *(_DWORD *)buf = 136316162;
    id v22 = v6;
    __int16 v23 = 2080;
    v24 = " ";
    __int16 v25 = 2114;
    v26 = v7;
    __int16 v27 = 2080;
    v28 = " ";
    __int16 v29 = 2112;
    CFStringRef v30 = @"XCHANGEPASSWORD";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s%{public}@%sPerforming custom command %@", buf, 0x34u);
  }
  v20[0] = @"PIN";
  v20[1] = v4;
  v8 = +[NSArray arrayWithObjects:v20 count:2];
  unsigned __int8 v9 = [(IMAPServiceConnection *)self performCustomCommand:@"XCHANGEPASSWORD" withArguments:v8];

  if ((v9 & 1) == 0)
  {
    v10 = +[MFActivityMonitor currentTracebleMonitor];
    v11 = [v10 error];
    if (v11)
    {
      v12 = sub_10000F758();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100080458(self, (uint64_t)v11, v12);
      }

      v13 = [v11 domain];
      if (![v13 isEqualToString:MFMessageErrorDomain]) {
        goto LABEL_14;
      }
      id v14 = [v11 code];

      if (v14 == (id)1033)
      {
        v13 = [v11 localizedDescription];
        if (!v13
          || (pthread_once(&stru_1000DFC08, sub_10000FB90),
              [(id)qword_1000E07F8 objectForKey:v13],
              (v15 = objc_claimAutoreleasedReturnValue()) == 0)
          || (v16 = v15, uint64_t v17 = (uint64_t)[v15 intValue], v16, v17 == -1))
        {
          uint64_t v17 = 1016;
        }
        uint64_t v18 = +[NSError errorWithDomain:kVVErrorDomain code:v17 localizedDescription:v13];

        [v10 setError:v18];
        v11 = (void *)v18;
LABEL_14:
      }
    }
  }
  return v9;
}

+ (id)heldConnectionsForCheckingIn
{
  objc_super v2 = +[NSThread currentThread];
  v3 = [v2 threadDictionary];

  id v4 = [v3 objectForKey:@"_IMAPServiceConnections"];
  if ([v4 count])
  {
    [v3 removeObjectForKey:@"_IMAPServiceConnections"];
  }
  else
  {

    id v4 = 0;
  }

  return v4;
}

- (BOOL)checkIn
{
  v3 = +[NSThread currentThread];
  [(NSLock *)self->_checkedOutThreadsLock lock];
  [(NSMutableSet *)self->_checkedOutThreads removeObject:v3];
  id v4 = [v3 threadDictionary];
  id v5 = [v4 objectForKey:@"_IMAPServiceConnections"];

  [v5 removeObject:self];
  id v6 = [(NSMutableSet *)self->_checkedOutThreads count];
  [(NSLock *)self->_checkedOutThreadsLock unlock];
  if (!v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)IMAPServiceConnection;
    [(IMAPServiceConnection *)&v8 setDelegate:0];
  }

  return v6 == 0;
}

- (void)checkInForcefully
{
  [(NSLock *)self->_checkedOutThreadsLock lock];
  [(NSMutableSet *)self->_checkedOutThreads removeAllObjects];
  [(NSLock *)self->_checkedOutThreadsLock unlock];
  [(IMAPServiceConnection *)self checkIn];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMAPServiceConnection *)self delegate];
  id v6 = (id)v5;
  if (v4 || !v5)
  {
    if (v4)
    {
      [(NSLock *)self->_checkedOutThreadsLock lock];
      checkedOutThreads = self->_checkedOutThreads;
      if (checkedOutThreads)
      {
        if (v6 != v4) {
          [(NSMutableSet *)checkedOutThreads removeAllObjects];
        }
      }
      else
      {
        objc_super v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        unsigned __int8 v9 = self->_checkedOutThreads;
        self->_checkedOutThreads = v8;
      }
      v10 = +[NSThread currentThread];
      [(NSMutableSet *)self->_checkedOutThreads addObject:v10];
      v11 = [v10 threadDictionary];
      id v12 = [v11 objectForKey:@"_IMAPServiceConnections"];
      if (!v12)
      {
        id v12 = objc_alloc_init((Class)NSMutableSet);
        [v11 setObject:v12 forKey:@"_IMAPServiceConnections"];
      }
      [v12 addObject:self];
      [(NSLock *)self->_checkedOutThreadsLock unlock];
      v13.receiver = self;
      v13.super_class = (Class)IMAPServiceConnection;
      [(IMAPServiceConnection *)&v13 setDelegate:v4];
    }
  }
  else
  {
    [(IMAPServiceConnection *)self checkIn];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkedOutThreadsLock, 0);
  objc_storeStrong((id *)&self->_checkedOutThreads, 0);
}

- (void)checkInToAccount:(id)a3
{
}

@end