@interface RDServer
+ (id)sharedBubbleXPCInterface;
+ (id)sharedServer;
+ (id)sharedXPCInterface;
- (BOOL)LogoutToUser:(id)a3;
- (BOOL)anyBubblePopClients;
- (BOOL)inLoginSession;
- (BOOL)inLogoutProcess;
- (BOOL)notifyNextPersonaObserver:(id)a3 withUser:(unsigned int)a4;
- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3;
- (NSMutableDictionary)pidsToClients;
- (NSMutableDictionary)userToSwitchTo;
- (OS_dispatch_source)fastLogoutTimer;
- (OS_dispatch_source)logoutTimer;
- (RDServer)init;
- (id)_allowlistedPreferencesKeys;
- (id)_clientForPID:(int)a3;
- (id)bubbleStakeHolder;
- (id)criticalStakeHolder;
- (id)fetchUserBlockTaskList;
- (id)fetchUserSyncTaskList;
- (int)asidForClient:(id)a3 withAuid:(unsigned int *)a4 withPid:(int)a5;
- (int)switchState;
- (void)StopBubbleWithPID:(int)a3 WithUID:(unsigned int)a4 WithStatus:(unint64_t)a5;
- (void)_broadcastBubbleDidPop;
- (void)_broadcastDeviceLoginSessionStateDidUpdate;
- (void)_broadcastPersonaUpdates:(id)a3 withAuid:(unsigned int)a4;
- (void)_broadcastUserSwitchTaskListDidUpdate;
- (void)_checkIfWeShouldSwitchUser:(BOOL)a3;
- (void)_enumerateClientsWithBlock:(id)a3;
- (void)_reallySwitchUser:(BOOL)a3;
- (void)addBubbleClient:(id)a3;
- (void)addClient:(id)a3;
- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4;
- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5;
- (void)addUserSyncTask:(id)a3 forPID:(int)a4;
- (void)addUserSyncTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5;
- (void)createPersona:(id)a3 passcodeData:(id)a4 forPid:(int)a5 completionHandler:(id)a6;
- (void)createPersona:(id)a3 passcodeData:(id)a4 passcodeDataType:(unint64_t)a5 forPid:(int)a6 completionHandler:(id)a7;
- (void)deletePersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5;
- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 pid:(int)a7 completionHandler:(id)a8;
- (void)disablePersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5;
- (void)fetchAllUsersPersonaListforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)fetchAsidMapforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)fetchBundleIdentifiersForPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5;
- (void)fetchMachServiceNameswithPID:(int)a3 WithUID:(unsigned int)a4 WithCompletionHandler:(id)a5;
- (void)fetchMultiPersonaBundleIdentifiersforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)fetchPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5;
- (void)fetchPersonaListforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)fetchUserSwitchBlockingTaskListWithCompletionHandler:(id)a3;
- (void)loginComplete;
- (void)loginUICheckinForPID:(int)a3 completionHandler:(id)a4;
- (void)logoutToLoginSessionWithPID:(int)a3 completionHandler:(id)a4;
- (void)personaLoginWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6;
- (void)personaLogoutWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6;
- (void)provisionDevice:(id)a3 forPid:(int)a4 completionHandler:(id)a5;
- (void)reengageUserQuotaForPID:(int)a3 completionHandler:(id)a4;
- (void)registerBubblePopStakeholderForPID:(int)a3 completionHandler:(id)a4;
- (void)registerCriticalUserSwitchStakeholderForPID:(int)a3 completionHandler:(id)a4;
- (void)registerUserPersonaObserverForPID:(int)a3 withMachServiceName:(id)a4 completionHandler:(id)a5;
- (void)registerUserPersonaStakeholderForPID:(int)a3 completionHandler:(id)a4;
- (void)registerUserSwitchStakeholderForPID:(int)a3 completionHandler:(id)a4;
- (void)registerUserSyncStakeholderForPID:(int)a3 machServiceName:(id)a4 completionHandler:(id)a5;
- (void)removeBubbleClient:(id)a3;
- (void)removeClient:(id)a3;
- (void)removeMachServiceName:(id)a3 withPID:(int)a4 WithUID:(unsigned int)a5;
- (void)removeUserSwitchBlockingTask:(id)a3 forPID:(int)a4;
- (void)removeUserSwitchBlockingTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5;
- (void)removeUserSyncTask:(id)a3 forPID:(int)a4;
- (void)removeUserSyncTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5;
- (void)resetStateForUserSwitch;
- (void)resumeSyncBubbleForPID:(int)a3 completionHandler:(id)a4;
- (void)setFastLogoutTimer:(id)a3;
- (void)setLogoutTimer:(id)a3;
- (void)setMultiPersonaBundlesIdentifiers:(id)a3 forPid:(int)a4 WithcompletionHandler:(id)a5;
- (void)setPidsToClients:(id)a3;
- (void)setSinglePersonaBundlesIdentifiers:(id)a3 forPersona:(id)a4 forPid:(int)a5 completionHandler:(id)a6;
- (void)setSwitchState:(int)a3;
- (void)setUserToSwitchTo:(id)a3;
- (void)suspendUserQuotaForPID:(int)a3 completionHandler:(id)a4;
- (void)switchToLoginUserWithPID:(int)a3 completionHandler:(id)a4;
- (void)switchToUser:(id)a3;
- (void)switchToUser:(id)a3 passcodeData:(id)a4;
- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 pid:(int)a6 completionHandler:(id)a7;
- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 pid:(int)a7 completionHandler:(id)a8;
- (void)terminateSyncBubbleForPID:(int)a3 completionHandler:(id)a4;
- (void)unregisterStakeholderForPID:(int)a3 status:(unint64_t)a4 reason:(id)a5 completionHandler:(id)a6;
@end

@implementation RDServer

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003DD4;
  block[3] = &unk_1000D4E28;
  block[4] = a1;
  if (qword_1000E3F98 != -1) {
    dispatch_once(&qword_1000E3F98, block);
  }
  v2 = (void *)qword_1000E3F90;

  return v2;
}

+ (id)sharedXPCInterface
{
  if (qword_1000E3FA8 != -1) {
    dispatch_once(&qword_1000E3FA8, &stru_1000D4E68);
  }
  v2 = (void *)qword_1000E3FA0;

  return v2;
}

+ (id)sharedBubbleXPCInterface
{
  if (qword_1000E3FB8 != -1) {
    dispatch_once(&qword_1000E3FB8, &stru_1000D4E88);
  }
  v2 = (void *)qword_1000E3FB0;

  return v2;
}

- (RDServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)RDServer;
  v2 = [(RDServer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    pidsToClients = v2->_pidsToClients;
    v2->_pidsToClients = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3
{
  id v3 = a3;
  v4 = +[NSXPCConnection currentConnection];
  v5 = [v4 valueForEntitlement:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  v5 = qword_1000E4320;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000040F0;
  v7[3] = &unk_1000D4EB0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  v5 = qword_1000E4320;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004258;
  v7[3] = &unk_1000D4EB0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addBubbleClient:(id)a3
{
  id v4 = a3;
  v5 = qword_1000E4320;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000450C;
  v7[3] = &unk_1000D4EB0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeBubbleClient:(id)a3
{
  id v4 = a3;
  v5 = qword_1000E4320;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004674;
  v7[3] = &unk_1000D4EB0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_clientForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(RDServer *)self pidsToClients];
  v5 = +[NSNumber numberWithInt:v3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6) {
    NSLog(@"We do not have a client for pid: %d", v3);
  }

  return v6;
}

- (void)_enumerateClientsWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  [(RDServer *)self pidsToClients];
  unsigned __int8 v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12];
      v4[2](v4, v10, &v16);
      int v11 = v16;

      if (v11) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)criticalStakeHolder
{
  [(RDServer *)self pidsToClients];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  id v4 = 0;
  if (v3)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      id v6 = 0;
      id v7 = v4;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [v2 objectForKeyedSubscript:*(void *)(*((void *)&v9 + 1) + 8 * (void)v6), (void)v9];
        id v4 = (id)objc_claimAutoreleasedReturnValue();

        if ([v4 criticalStakeHolder])
        {
          id v4 = v4;
          id v3 = v4;
          goto LABEL_11;
        }
        id v6 = (char *)v6 + 1;
        id v7 = v4;
      }
      while (v3 != v6);
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)bubbleStakeHolder
{
  [(RDServer *)self pidsToClients];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  id v4 = 0;
  if (v3)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      id v6 = 0;
      id v7 = v4;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [v2 objectForKeyedSubscript:*(void *)(*((void *)&v9 + 1) + 8 * (void)v6), (void)v9];
        id v4 = (id)objc_claimAutoreleasedReturnValue();

        if ([v4 bubbleStakeHolder])
        {
          id v4 = v4;
          id v3 = v4;
          goto LABEL_11;
        }
        id v6 = (char *)v6 + 1;
        id v7 = v4;
      }
      while (v3 != v6);
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)registerUserSwitchStakeholderForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004C5C;
  block[3] = &unk_1000D4ED8;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)registerCriticalUserSwitchStakeholderForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005000;
  block[3] = &unk_1000D4ED8;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)registerBubblePopStakeholderForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000054C0;
  block[3] = &unk_1000D4ED8;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (BOOL)anyBubblePopClients
{
  [(RDServer *)self pidsToClients];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
LABEL_3:
    id v7 = 0;
    id v8 = v5;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v5 = [v2 objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * (void)v7) key:v11];

      unsigned __int8 v9 = [v5 bubblePopstakeholderIsRegistered];
      if (v9) {
        break;
      }
      id v7 = (char *)v7 + 1;
      id v8 = v5;
      if (v4 == v7)
      {
        id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)inLogoutProcess
{
  if (qword_1000E3FD8 != -1) {
    dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
  }
  id v3 = (id)qword_1000E3FD0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = sub_100055404(1);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      v4 &= ~1u;
    }
    if (v4)
    {
      uint64_t v5 = v3;
      [(RDServer *)self switchState];
      uint64_t v6 = (char *)_os_log_send_and_compose_impl();

      if (v6) {
        sub_100055434(v6);
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    free(v6);
  }

  return [(RDServer *)self switchState] != 0;
}

- (void)registerUserSyncStakeholderForPID:(int)a3 machServiceName:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = qword_1000E4320;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005B7C;
  v13[3] = &unk_1000D4F00;
  int v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)unregisterStakeholderForPID:(int)a3 status:(unint64_t)a4 reason:(id)a5 completionHandler:(id)a6
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006078;
  block[3] = &unk_1000D4F28;
  int v7 = a3;
  block[4] = self;
  void block[5] = a4;
  dispatch_async((dispatch_queue_t)qword_1000E4320, block);
}

- (id)_allowlistedPreferencesKeys
{
  if (qword_1000E3FC8 != -1) {
    dispatch_once(&qword_1000E3FC8, &stru_1000D4F48);
  }
  id v2 = (void *)qword_1000E3FC0;

  return v2;
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 pid:(int)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v19 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000067C4;
  block[3] = &unk_1000D4F70;
  int v31 = a7;
  block[4] = self;
  id v26 = v14;
  id v27 = v17;
  id v28 = v15;
  id v29 = v16;
  id v30 = v18;
  id v20 = v16;
  id v21 = v15;
  id v22 = v17;
  id v23 = v18;
  id v24 = v14;
  dispatch_async(v19, block);
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 pid:(int)a6 completionHandler:(id)a7
{
}

- (void)switchToLoginUserWithPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007230;
  block[3] = &unk_1000D4ED8;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)logoutToLoginSessionWithPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000077B4;
  block[3] = &unk_1000D4ED8;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 pid:(int)a7 completionHandler:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (qword_1000E3FD8 != -1) {
    dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
  }
  v19 = (id)qword_1000E3FD0;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v20 = sub_100055404(1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v21 = v20;
    }
    else {
      unsigned int v21 = v20 & 0xFFFFFFFE;
    }
    if (v21)
    {
      id v22 = (const char *)_os_log_send_and_compose_impl();
      id v23 = (char *)v22;
      if (v22) {
        sub_100055434(v22);
      }
    }
    else
    {
      id v23 = 0;
    }
    free(v23);
  }

  [(RDServer *)self switchToUser:v14 passcodeData:v15 context:v16 preferences:v17 pid:v9 completionHandler:v18];
}

- (BOOL)inLoginSession
{
  int v2 = dword_1000E42C8;
  if (qword_1000E3FD8 != -1) {
    dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
  }
  id v3 = (id)qword_1000E3FD0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = sub_100055404(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v5 = v4;
    }
    else {
      unsigned int v5 = v4 & 0xFFFFFFFE;
    }
    if (v5)
    {
      id v6 = (const char *)_os_log_send_and_compose_impl();
      int v7 = (char *)v6;
      if (v6) {
        sub_100055434(v6);
      }
    }
    else
    {
      int v7 = 0;
    }
    free(v7);
  }

  if (v2 == 1)
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    id v8 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = sub_100055404(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v9 & 0xFFFFFFFE;
      }
      if (v10)
      {
LABEL_28:
        long long v13 = (const char *)_os_log_send_and_compose_impl();
        id v14 = (char *)v13;
        if (v13) {
          sub_100055434(v13);
        }
        goto LABEL_31;
      }
LABEL_30:
      id v14 = 0;
LABEL_31:
      free(v14);
    }
  }
  else
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    id v8 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = sub_100055404(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12) {
        goto LABEL_28;
      }
      goto LABEL_30;
    }
  }

  return v2 == 1;
}

- (void)loginComplete
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008320;
  block[3] = &unk_1000D4F98;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_1000E4320, block);
}

- (void)loginUICheckinForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000085DC;
  block[3] = &unk_1000D4ED8;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)terminateSyncBubbleForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008DF4;
  block[3] = &unk_1000D4ED8;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)resumeSyncBubbleForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000091E8;
  block[3] = &unk_1000D4ED8;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)fetchMachServiceNameswithPID:(int)a3 WithUID:(unsigned int)a4 WithCompletionHandler:(id)a5
{
  id v8 = a5;
  unsigned int v9 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009460;
  block[3] = &unk_1000D4FC0;
  int v13 = a3;
  unsigned int v14 = a4;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, block);
}

- (void)removeMachServiceName:(id)a3 withPID:(int)a4 WithUID:(unsigned int)a5
{
  id v8 = a3;
  unsigned int v9 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009774;
  block[3] = &unk_1000D4FE8;
  int v13 = a4;
  unsigned int v14 = a5;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, block);
}

- (void)StopBubbleWithPID:(int)a3 WithUID:(unsigned int)a4 WithStatus:(unint64_t)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009920;
  block[3] = &unk_1000D4F28;
  unsigned int v6 = a4;
  block[4] = self;
  void block[5] = a5;
  dispatch_async((dispatch_queue_t)qword_1000E4320, block);
}

- (void)_broadcastBubbleDidPop
{
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4
{
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  id v74 = a4;
  [(RDServer *)self setUserToSwitchTo:v6];
  [(RDServer *)self setSwitchState:1];
  if (qword_1000E3FD8 != -1) {
    dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
  }
  int v7 = &kUMUserSessionShortNameKey;
  id v8 = (id)qword_1000E3FD0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)v80 = 0;
    unsigned int v9 = sub_100055404(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v10 = v9;
    }
    else {
      unsigned int v10 = v9 & 0xFFFFFFFE;
    }
    if (v10)
    {
      LOWORD(v79[0]) = 0;
      LODWORD(v72) = 2;
      v70 = v79;
      int v11 = (const char *)_os_log_send_and_compose_impl();
      id v12 = (char *)v11;
      if (v11) {
        sub_100055434(v11);
      }
    }
    else
    {
      id v12 = 0;
    }
    free(v12);
  }

  int v13 = [(RDServer *)self fastLogoutTimer];

  if (v13)
  {
    if (qword_1000E3FE8 != -1) {
      dispatch_once(&qword_1000E3FE8, &stru_1000D5298);
    }
    unsigned int v14 = (id)qword_1000E3FE0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v79[0] = 0;
      int v15 = sub_100055404(0);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        v15 &= ~1u;
      }
      if (v15)
      {
        id v16 = v14;
        id v17 = [(RDServer *)self fastLogoutTimer];
        *(_DWORD *)v80 = 134217984;
        *(void *)&v80[4] = v17;
        LODWORD(v72) = 12;
        v70 = v80;
        id v18 = (char *)_os_log_send_and_compose_impl();

        if (v18) {
          sub_100055434(v18);
        }
        int v7 = &kUMUserSessionShortNameKey;
      }
      else
      {
        id v18 = 0;
      }
      free(v18);
    }

    v19 = [(RDServer *)self fastLogoutTimer];
    dispatch_source_cancel(v19);

    [(RDServer *)self setFastLogoutTimer:0];
  }
  unsigned int v20 = [(RDServer *)self pidsToClients];
  if ([v20 count])
  {
    char v21 = _os_feature_enabled_impl();

    if ((v21 & 1) == 0) {
      goto LABEL_89;
    }
  }
  else
  {
  }
  [(RDServer *)self setSwitchState:2];
  if (CFDictionaryContainsKey(v6, @"UserSwitchTaskOpqueData"))
  {
    Value = CFDictionaryGetValue(v6, @"UserSwitchTaskOpqueData");
    CFDataRef v23 = (const __CFData *)CFRetain(Value);
    CFDictionaryRemoveValue(v6, @"UserSwitchTaskOpqueData");
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    id v24 = v7[506];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v79[0] = 0;
      int v25 = sub_100055404(1);
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        v25 &= ~1u;
      }
      if (v25)
      {
        id v26 = v24;
        CFIndex Length = CFDataGetLength(v23);
        *(_DWORD *)v80 = 134217984;
        *(void *)&v80[4] = Length;
        LODWORD(v73) = 12;
        v71 = v80;
        id v28 = (char *)_os_log_send_and_compose_impl();

        if (v28) {
          sub_100055434(v28);
        }
        int v7 = &kUMUserSessionShortNameKey;
      }
      else
      {
        id v28 = 0;
      }
      free(v28);
    }
  }
  else
  {
    CFDataRef v23 = 0;
  }
  if (byte_1000E4312)
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    id v29 = v7[506];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)v80 = 0;
      unsigned int v30 = sub_100055404(1);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v31 = v30;
      }
      else {
        unsigned int v31 = v30 & 0xFFFFFFFE;
      }
      if (v31)
      {
        LOWORD(v79[0]) = 0;
        LODWORD(v73) = 2;
        v71 = v79;
        v32 = (const char *)_os_log_send_and_compose_impl();
        v33 = (char *)v32;
        if (v32) {
          sub_100055434(v32);
        }
      }
      else
      {
        v33 = 0;
      }
      free(v33);
    }

    if (sub_100029254(v6, (uint64_t)v74))
    {
      if (qword_1000E3FD8 != -1) {
        dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
      }
      v34 = v7[506];
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_76;
      }
      *(void *)v80 = 0;
      unsigned int v35 = sub_100055404(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v36 = v35;
      }
      else {
        unsigned int v36 = v35 & 0xFFFFFFFE;
      }
      if (v36)
      {
        LOWORD(v79[0]) = 0;
        LODWORD(v73) = 2;
        v71 = v79;
        goto LABEL_72;
      }
    }
    else
    {
      if (qword_1000E3FD8 != -1) {
        dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
      }
      v34 = v7[506];
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_76;
      }
      *(void *)v80 = 0;
      unsigned int v37 = sub_100055404(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v38 = v37;
      }
      else {
        unsigned int v38 = v37 & 0xFFFFFFFE;
      }
      if (v38)
      {
        LOWORD(v79[0]) = 0;
        LODWORD(v73) = 2;
        v71 = v79;
LABEL_72:
        v39 = (const char *)_os_log_send_and_compose_impl();
        v40 = (char *)v39;
        if (v39) {
          sub_100055434(v39);
        }
        goto LABEL_75;
      }
    }
    v40 = 0;
LABEL_75:
    free(v40);
LABEL_76:
  }
  if (qword_1000E3FD8 != -1) {
    dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
  }
  v41 = v7[506];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)v80 = 0;
    unsigned int v42 = sub_100055404(1);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v43 = v42;
    }
    else {
      unsigned int v43 = v42 & 0xFFFFFFFE;
    }
    if (v43)
    {
      LOWORD(v79[0]) = 0;
      LODWORD(v73) = 2;
      v71 = v79;
      v44 = (const char *)_os_log_send_and_compose_impl();
      v45 = (char *)v44;
      if (v44) {
        sub_100055434(v44);
      }
    }
    else
    {
      v45 = 0;
    }
    free(v45);
  }

  sub_10002F4A8(v6, v23);
LABEL_89:
  v46 = [(RDServer *)self logoutTimer];

  if (v46)
  {
    if (qword_1000E3FE8 != -1) {
      dispatch_once(&qword_1000E3FE8, &stru_1000D5298);
    }
    v47 = (id)qword_1000E3FE0;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v79[0] = 0;
      int v48 = sub_100055404(0);
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
        v48 &= ~1u;
      }
      if (v48)
      {
        v49 = v47;
        v50 = [(RDServer *)self logoutTimer];
        *(_DWORD *)v80 = 134217984;
        *(void *)&v80[4] = v50;
        v51 = (char *)_os_log_send_and_compose_impl();

        if (v51) {
          sub_100055434(v51);
        }
      }
      else
      {
        v51 = 0;
      }
      free(v51);
    }
  }
  else
  {
    dispatch_source_t v52 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_1000E4320);
    [(RDServer *)self setLogoutTimer:v52];

    if (qword_1000E3FE8 != -1) {
      dispatch_once(&qword_1000E3FE8, &stru_1000D5298);
    }
    v53 = (id)qword_1000E3FE0;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v79[0] = 0;
      int v54 = sub_100055404(0);
      if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
        v54 &= ~1u;
      }
      if (v54)
      {
        v55 = v53;
        v56 = [(RDServer *)self logoutTimer];
        *(_DWORD *)v80 = 134217984;
        *(void *)&v80[4] = v56;
        v57 = (char *)_os_log_send_and_compose_impl();

        if (v57) {
          sub_100055434(v57);
        }
      }
      else
      {
        v57 = 0;
      }
      free(v57);
    }

    v58 = [(RDServer *)self logoutTimer];
    dispatch_time_t v59 = dispatch_time(0, 360000000000);
    dispatch_source_set_timer(v58, v59, 0xFFFFFFFFFFFFFFFFLL, 0);

    v60 = [(RDServer *)self logoutTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000A738;
    handler[3] = &unk_1000D4F98;
    handler[4] = self;
    dispatch_source_set_event_handler(v60, handler);

    v47 = [(RDServer *)self logoutTimer];
    dispatch_activate(v47);
  }

  v61 = sub_100018600(qword_1000E4318);
  if (sub_1000192C0((uint64_t)v61))
  {
    v62 = sub_100018600(qword_1000E4318);
    if (sub_10001935C((uint64_t)v62) == 502)
    {

LABEL_125:
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_10000AABC;
      v75[3] = &unk_1000D5050;
      CFDictionaryRef v76 = v6;
      v77 = self;
      [(RDServer *)self _enumerateClientsWithBlock:v75];

      goto LABEL_129;
    }
    int v69 = dword_1000E42C8;

    if (v69 != 1) {
      goto LABEL_125;
    }
  }
  else
  {
    int v63 = dword_1000E42C8;

    if (v63 != 1) {
      goto LABEL_125;
    }
  }
  if (qword_1000E3FD8 != -1) {
    dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
  }
  v64 = v7[506];
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)v80 = 0;
    unsigned int v65 = sub_100055404(1);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v66 = v65;
    }
    else {
      unsigned int v66 = v65 & 0xFFFFFFFE;
    }
    if (v66)
    {
      LOWORD(v79[0]) = 0;
      v67 = (const char *)_os_log_send_and_compose_impl();
      v68 = (char *)v67;
      if (v67) {
        sub_100055434(v67);
      }
    }
    else
    {
      v68 = 0;
    }
    free(v68);
  }

  [(RDServer *)self _reallySwitchUser:0];
LABEL_129:
}

- (void)switchToUser:(id)a3
{
}

- (BOOL)LogoutToUser:(id)a3
{
  id v4 = a3;
  [(RDServer *)self setUserToSwitchTo:0];
  [(RDServer *)self setSwitchState:1];
  if (qword_1000E3FD8 != -1) {
    dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
  }
  unsigned int v5 = (id)qword_1000E3FD0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v52[0] = 0;
    unsigned int v6 = sub_100055404(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v7 = v6;
    }
    else {
      unsigned int v7 = v6 & 0xFFFFFFFE;
    }
    if (v7)
    {
      LOWORD(v51) = 0;
      LODWORD(v46) = 2;
      v45 = &v51;
      id v8 = (const char *)_os_log_send_and_compose_impl();
      unsigned int v9 = (char *)v8;
      if (v8) {
        sub_100055434(v8);
      }
    }
    else
    {
      unsigned int v9 = 0;
    }
    free(v9);
  }

  dword_1000E42C8 = 3;
  unsigned int v10 = [(RDServer *)self fastLogoutTimer];

  if (v10)
  {
    if (qword_1000E3FE8 != -1) {
      dispatch_once(&qword_1000E3FE8, &stru_1000D5298);
    }
    int v11 = (id)qword_1000E3FE0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v51 = 0;
      int v12 = sub_100055404(0);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        v12 &= ~1u;
      }
      if (v12)
      {
        int v13 = v11;
        unsigned int v14 = [(RDServer *)self fastLogoutTimer];
        LODWORD(v52[0]) = 134217984;
        *(void *)((char *)v52 + 4) = v14;
        LODWORD(v46) = 12;
        v45 = v52;
        int v15 = (char *)_os_log_send_and_compose_impl();

        if (v15) {
          sub_100055434(v15);
        }
      }
      else
      {
        int v15 = 0;
      }
      free(v15);
    }

    id v16 = [(RDServer *)self fastLogoutTimer];
    dispatch_source_cancel(v16);

    [(RDServer *)self setFastLogoutTimer:0];
  }
  id v17 = [(RDServer *)self pidsToClients];
  id v18 = [v17 count];

  if (v18)
  {
    v19 = [(RDServer *)self logoutTimer];

    if (v19)
    {
      if (qword_1000E3FE8 != -1) {
        dispatch_once(&qword_1000E3FE8, &stru_1000D5298);
      }
      unsigned int v20 = (id)qword_1000E3FE0;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v51 = 0;
        int v21 = sub_100055404(0);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          v21 &= ~1u;
        }
        if (v21)
        {
          id v22 = v20;
          CFDataRef v23 = [(RDServer *)self logoutTimer];
          LODWORD(v52[0]) = 134217984;
          *(void *)((char *)v52 + 4) = v23;
          id v24 = (char *)_os_log_send_and_compose_impl();

          if (v24) {
            sub_100055434(v24);
          }
        }
        else
        {
          id v24 = 0;
        }
        free(v24);
      }
    }
    else
    {
      dispatch_source_t v30 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_1000E4320);
      [(RDServer *)self setLogoutTimer:v30];

      if (qword_1000E3FE8 != -1) {
        dispatch_once(&qword_1000E3FE8, &stru_1000D5298);
      }
      unsigned int v31 = (id)qword_1000E3FE0;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v51 = 0;
        int v32 = sub_100055404(0);
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
          v32 &= ~1u;
        }
        if (v32)
        {
          v33 = v31;
          v34 = [(RDServer *)self logoutTimer];
          LODWORD(v52[0]) = 134217984;
          *(void *)((char *)v52 + 4) = v34;
          unsigned int v35 = (char *)_os_log_send_and_compose_impl();

          if (v35) {
            sub_100055434(v35);
          }
        }
        else
        {
          unsigned int v35 = 0;
        }
        free(v35);
      }

      v41 = [(RDServer *)self logoutTimer];
      dispatch_time_t v42 = dispatch_time(0, 360000000000);
      dispatch_source_set_timer(v41, v42, 0xFFFFFFFFFFFFFFFFLL, 0);

      unsigned int v43 = [(RDServer *)self logoutTimer];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000B4B4;
      handler[3] = &unk_1000D4F98;
      handler[4] = self;
      dispatch_source_set_event_handler(v43, handler);

      unsigned int v20 = [(RDServer *)self logoutTimer];
      dispatch_activate(v20);
    }

    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10000B7F8;
    v47[3] = &unk_1000D5050;
    id v48 = v4;
    v49 = self;
    [(RDServer *)self _enumerateClientsWithBlock:v47];
  }
  else
  {
    [(RDServer *)self setSwitchState:2];
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    int v25 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v52[0] = 0;
      unsigned int v26 = sub_100055404(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v27 = v26;
      }
      else {
        unsigned int v27 = v26 & 0xFFFFFFFE;
      }
      if (v27)
      {
        LOWORD(v51) = 0;
        id v28 = (const char *)_os_log_send_and_compose_impl();
        id v29 = (char *)v28;
        if (v28) {
          sub_100055434(v28);
        }
      }
      else
      {
        id v29 = 0;
      }
      free(v29);
    }

    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    unsigned int v36 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v52[0] = 0;
      unsigned int v37 = sub_100055404(1);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v38 = v37;
      }
      else {
        unsigned int v38 = v37 & 0xFFFFFFFE;
      }
      if (v38)
      {
        LOWORD(v51) = 0;
        v39 = (const char *)_os_log_send_and_compose_impl();
        v40 = (char *)v39;
        if (v39) {
          sub_100055434(v39);
        }
      }
      else
      {
        v40 = 0;
      }
      free(v40);
    }

    [(RDServer *)self _reallySwitchUser:1];
  }

  return 1;
}

- (void)_checkIfWeShouldSwitchUser:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  if (qword_1000E3FD8 != -1) {
    dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
  }
  unsigned int v5 = (id)qword_1000E3FD0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = 0;
    unsigned int v6 = sub_100055404(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v7 = v6;
    }
    else {
      unsigned int v7 = v6 & 0xFFFFFFFE;
    }
    if (v7)
    {
      id v8 = "FALSE";
      if (v3) {
        id v8 = "TRUE";
      }
      LODWORD(v27[0]) = 136315138;
      *(void *)((char *)v27 + 4) = v8;
      unsigned int v9 = (const char *)_os_log_send_and_compose_impl();
      unsigned int v10 = (char *)v9;
      if (v9) {
        sub_100055434(v9);
      }
    }
    else
    {
      unsigned int v10 = 0;
    }
    free(v10);
  }

  if ([(RDServer *)self switchState] == 1)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000BDE8;
    v21[3] = &unk_1000D5078;
    v21[4] = &v23;
    [(RDServer *)self _enumerateClientsWithBlock:v21];
    if (*((unsigned char *)v24 + 24))
    {
      if (qword_1000E3FD8 != -1) {
        dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
      }
      int v11 = (id)qword_1000E3FD0;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v27[0] = 0;
        unsigned int v12 = sub_100055404(1);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v13 = v12;
        }
        else {
          unsigned int v13 = v12 & 0xFFFFFFFE;
        }
        if (v13)
        {
          LOWORD(v22) = 0;
          unsigned int v14 = (const char *)_os_log_send_and_compose_impl();
          int v15 = (char *)v14;
          if (v14) {
            sub_100055434(v14);
          }
        }
        else
        {
          int v15 = 0;
        }
        free(v15);
      }

      [(RDServer *)self _reallySwitchUser:v3];
    }
  }
  else
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    id v16 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v27[0] = 0;
      unsigned int v17 = sub_100055404(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v18 = v17;
      }
      else {
        unsigned int v18 = v17 & 0xFFFFFFFE;
      }
      if (v18)
      {
        LOWORD(v22) = 0;
        v19 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v20 = (char *)v19;
        if (v19) {
          sub_100055434(v19);
        }
      }
      else
      {
        unsigned int v20 = 0;
      }
      free(v20);
    }
  }
  _Block_object_dispose(&v23, 8);
}

- (void)_reallySwitchUser:(BOOL)a3
{
  BOOL v3 = a3;
  CFDictionaryRef v5 = [(RDServer *)self userToSwitchTo];
  if (qword_1000E3FD8 != -1) {
    dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
  }
  unsigned int v6 = (id)qword_1000E3FD0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v91 = 0;
    unsigned int v7 = sub_100055404(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v8 = v7;
    }
    else {
      unsigned int v8 = v7 & 0xFFFFFFFE;
    }
    if (v8)
    {
      unsigned int v9 = "FALSE";
      if (v3) {
        unsigned int v9 = "TRUE";
      }
      *(_DWORD *)v90 = 136315138;
      *(void *)&v90[4] = v9;
      LODWORD(v86) = 12;
      v85 = (uint64_t *)v90;
      unsigned int v10 = (const char *)_os_log_send_and_compose_impl();
      int v11 = (char *)v10;
      if (v10) {
        sub_100055434(v10);
      }
    }
    else
    {
      int v11 = 0;
    }
    free(v11);
  }

  [(RDServer *)self setSwitchState:2];
  unsigned int v12 = [(RDServer *)self logoutTimer];

  if (v12)
  {
    if (qword_1000E3FE8 != -1) {
      dispatch_once(&qword_1000E3FE8, &stru_1000D5298);
    }
    unsigned int v13 = (id)qword_1000E3FE0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v91 = 0;
      int v14 = sub_100055404(0);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        v14 &= ~1u;
      }
      if (v14)
      {
        int v15 = v13;
        id v16 = [(RDServer *)self logoutTimer];
        *(_DWORD *)v90 = 134217984;
        *(void *)&v90[4] = v16;
        LODWORD(v86) = 12;
        v85 = (uint64_t *)v90;
        unsigned int v17 = (char *)_os_log_send_and_compose_impl();

        if (v17) {
          sub_100055434(v17);
        }
      }
      else
      {
        unsigned int v17 = 0;
      }
      free(v17);
    }

    unsigned int v18 = [(RDServer *)self logoutTimer];
    dispatch_source_cancel(v18);

    [(RDServer *)self setLogoutTimer:0];
  }
  v19 = sub_100018600(qword_1000E4318);
  if (sub_1000192C0((uint64_t)v19))
  {
    unsigned int v20 = sub_100018600(qword_1000E4318);
    int v21 = sub_10001935C((uint64_t)v20);

    if (v21 == 502)
    {
      if (qword_1000E3FD8 != -1) {
        dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
      }
      uint64_t v22 = (id)qword_1000E3FD0;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)v90 = 0;
        unsigned int v23 = sub_100055404(1);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v24 = v23;
        }
        else {
          unsigned int v24 = v23 & 0xFFFFFFFE;
        }
        if (v24)
        {
          LOWORD(v91) = 0;
          LODWORD(v86) = 2;
          v85 = &v91;
          uint64_t v25 = (const char *)_os_log_send_and_compose_impl();
          char v26 = (char *)v25;
          if (v25) {
            sub_100055434(v25);
          }
        }
        else
        {
          char v26 = 0;
        }
        free(v26);
      }

      sub_10001E06C(0, 502);
      goto LABEL_66;
    }
  }
  else
  {
  }
  if ((dword_1000E42C8 & 0xFFFFFFFE) == 2)
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    unsigned int v27 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)v90 = 0;
      unsigned int v28 = sub_100055404(1);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v29 = v28;
      }
      else {
        unsigned int v29 = v28 & 0xFFFFFFFE;
      }
      if (v29)
      {
        LOWORD(v91) = 0;
        LODWORD(v86) = 2;
        v85 = &v91;
        dispatch_source_t v30 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v31 = (char *)v30;
        if (v30) {
          sub_100055434(v30);
        }
      }
      else
      {
        unsigned int v31 = 0;
      }
      free(v31);
    }

    [(RDServer *)self _enumerateClientsWithBlock:&stru_1000D5098];
    sub_1000354C8();
  }
  else
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    int v32 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)v90 = 0;
      unsigned int v33 = sub_100055404(1);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v34 = v33;
      }
      else {
        unsigned int v34 = v33 & 0xFFFFFFFE;
      }
      if (v34)
      {
        LODWORD(v91) = 67109120;
        HIDWORD(v91) = dword_1000E42C8;
        LODWORD(v86) = 8;
        v85 = &v91;
        unsigned int v35 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v36 = (char *)v35;
        if (v35) {
          sub_100055434(v35);
        }
      }
      else
      {
        unsigned int v36 = 0;
      }
      free(v36);
    }
  }
LABEL_66:
  unsigned int v37 = [(RDServer *)self criticalStakeHolder];
  if (!v37)
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    unsigned int v43 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)v90 = 0;
      unsigned int v44 = sub_100055404(1);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v45 = v44;
      }
      else {
        unsigned int v45 = v44 & 0xFFFFFFFE;
      }
      if (v45)
      {
        LOWORD(v91) = 0;
        uint64_t v46 = (const char *)_os_log_send_and_compose_impl();
        v47 = (char *)v46;
        if (v46) {
          sub_100055434(v46);
        }
      }
      else
      {
        v47 = 0;
      }
      free(v47);
    }

    goto LABEL_109;
  }
  if (qword_1000E3FD8 != -1) {
    dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
  }
  unsigned int v38 = (id)qword_1000E3FD0;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)v90 = 0;
    int v39 = sub_100055404(1);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
      v39 &= ~1u;
    }
    if (v39)
    {
      v40 = v38;
      unsigned int v41 = [v37 stakeholderIsRegistered];
      LODWORD(v91) = 67109120;
      HIDWORD(v91) = v41;
      dispatch_time_t v42 = (char *)_os_log_send_and_compose_impl();

      if (v42) {
        sub_100055434(v42);
      }
    }
    else
    {
      dispatch_time_t v42 = 0;
    }
    free(v42);
  }

  if (![v37 stakeholderIsRegistered])
  {
LABEL_109:
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    v58 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)v90 = 0;
      unsigned int v59 = sub_100055404(1);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v60 = v59;
      }
      else {
        unsigned int v60 = v59 & 0xFFFFFFFE;
      }
      if (v60)
      {
        LOWORD(v91) = 0;
        v61 = (const char *)_os_log_send_and_compose_impl();
        v62 = (char *)v61;
        if (v61) {
          sub_100055434(v61);
        }
      }
      else
      {
        v62 = 0;
      }
      free(v62);
    }

    CFDictionaryRef v63 = v5;
    if (v3)
    {
      CFDictionaryRef v63 = (const __CFDictionary *)sub_100019B40(502);
      if (qword_1000E3FD8 != -1) {
        dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
      }
      v64 = (id)qword_1000E3FD0;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)v90 = 0;
        unsigned int v65 = sub_100055404(1);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v66 = v65;
        }
        else {
          unsigned int v66 = v65 & 0xFFFFFFFE;
        }
        if (v66)
        {
          LOWORD(v91) = 0;
          v67 = (const char *)_os_log_send_and_compose_impl();
          v68 = (char *)v67;
          if (v67) {
            sub_100055434(v67);
          }
        }
        else
        {
          v68 = 0;
        }
        free(v68);
      }
    }
    if (v63 && CFDictionaryContainsKey(v63, @"UserSwitchTaskOpqueData"))
    {
      Value = CFDictionaryGetValue(v63, @"UserSwitchTaskOpqueData");
      CFDataRef v70 = (const __CFData *)CFRetain(Value);
      CFDictionaryRemoveValue(v63, @"UserSwitchTaskOpqueData");
    }
    else
    {
      CFDataRef v70 = 0;
    }
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    v71 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)v90 = 0;
      unsigned int v72 = sub_100055404(1);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v73 = v72;
      }
      else {
        unsigned int v73 = v72 & 0xFFFFFFFE;
      }
      if (v73)
      {
        LOWORD(v91) = 0;
        id v74 = (const char *)_os_log_send_and_compose_impl();
        v75 = (char *)v74;
        if (v74) {
          sub_100055434(v74);
        }
      }
      else
      {
        v75 = 0;
      }
      free(v75);
    }

    sub_10002F4A8(v63, v70);
    goto LABEL_149;
  }
  if (v3)
  {
    int v48 = MKBLockDeviceNow();
    if (v48)
    {
      int v49 = v48;
      if (qword_1000E3FD8 != -1) {
        dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
      }
      v50 = (id)qword_1000E3FD0;
      if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_165;
      }
      *(void *)v90 = 0;
      unsigned int v51 = sub_100055404(1);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v52 = v51;
      }
      else {
        unsigned int v52 = v51 & 0xFFFFFFFE;
      }
      if (v52)
      {
        LODWORD(v91) = 67109120;
        HIDWORD(v91) = v49;
        goto LABEL_158;
      }
    }
    else
    {
      if (qword_1000E3FD8 != -1) {
        dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
      }
      v50 = (id)qword_1000E3FD0;
      if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_165;
      }
      *(void *)v90 = 0;
      unsigned int v76 = sub_100055404(1);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v77 = v76;
      }
      else {
        unsigned int v77 = v76 & 0xFFFFFFFE;
      }
      if (v77)
      {
        LOWORD(v91) = 0;
LABEL_158:
        v78 = (const char *)_os_log_send_and_compose_impl();
        v79 = (char *)v78;
        if (v78) {
          sub_100055434(v78);
        }
        goto LABEL_164;
      }
    }
    v79 = 0;
LABEL_164:
    free(v79);
LABEL_165:

    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    v80 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)v90 = 0;
      unsigned int v81 = sub_100055404(1);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v82 = v81;
      }
      else {
        unsigned int v82 = v81 & 0xFFFFFFFE;
      }
      if (v82)
      {
        LOWORD(v91) = 0;
        v83 = (const char *)_os_log_send_and_compose_impl();
        v84 = (char *)v83;
        if (v83) {
          sub_100055434(v83);
        }
      }
      else
      {
        v84 = 0;
      }
      free(v84);
    }

    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_10000D3D0;
    v89[3] = &unk_1000D4F98;
    v89[4] = self;
    [v37 readyToSwitchToLoginSession:0 completionHandler:v89];
    goto LABEL_149;
  }
  if (qword_1000E3FD8 != -1) {
    dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
  }
  v53 = (id)qword_1000E3FD0;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)v90 = 0;
    unsigned int v54 = sub_100055404(1);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v55 = v54;
    }
    else {
      unsigned int v55 = v54 & 0xFFFFFFFE;
    }
    if (v55)
    {
      LOWORD(v91) = 0;
      v56 = (const char *)_os_log_send_and_compose_impl();
      v57 = (char *)v56;
      if (v56) {
        sub_100055434(v56);
      }
    }
    else
    {
      v57 = 0;
    }
    free(v57);
  }

  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_10000DE6C;
  v87[3] = &unk_1000D4F98;
  CFDictionaryRef v88 = v5;
  [v37 readyToSwitchToUser:v88 completionHandler:v87];

LABEL_149:
}

- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4
{
}

- (void)removeUserSwitchBlockingTask:(id)a3 forPID:(int)a4
{
}

- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = qword_1000E4320;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000E174;
  v13[3] = &unk_1000D4F00;
  int v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)removeUserSwitchBlockingTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = qword_1000E4320;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000E50C;
  v13[3] = &unk_1000D4F00;
  int v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)_broadcastUserSwitchTaskListDidUpdate
{
}

- (void)_broadcastDeviceLoginSessionStateDidUpdate
{
}

- (void)fetchUserSwitchBlockingTaskListWithCompletionHandler:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = qword_1000E4320;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EA24;
  v7[3] = &unk_1000D5128;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)fetchUserSyncTaskList
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000EBE4;
  v5[3] = &unk_1000D5100;
  id v3 = (id)objc_opt_new();
  id v6 = v3;
  [(RDServer *)self _enumerateClientsWithBlock:v5];

  return v3;
}

- (id)fetchUserBlockTaskList
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000ECE8;
  v5[3] = &unk_1000D5100;
  id v3 = (id)objc_opt_new();
  id v6 = v3;
  [(RDServer *)self _enumerateClientsWithBlock:v5];

  return v3;
}

- (void)addUserSyncTask:(id)a3 forPID:(int)a4
{
}

- (void)removeUserSyncTask:(id)a3 forPID:(int)a4
{
}

- (void)addUserSyncTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = qword_1000E4320;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000EE24;
  v13[3] = &unk_1000D4F00;
  int v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)removeUserSyncTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = qword_1000E4320;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000F1EC;
  v13[3] = &unk_1000D4F00;
  int v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)suspendUserQuotaForPID:(int)a3 completionHandler:(id)a4
{
  id v4 = a4;
  CFDictionaryRef v5 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F560;
  block[3] = &unk_1000D5150;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)reengageUserQuotaForPID:(int)a3 completionHandler:(id)a4
{
  id v4 = a4;
  CFDictionaryRef v5 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F678;
  block[3] = &unk_1000D5150;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)createPersona:(id)a3 passcodeData:(id)a4 forPid:(int)a5 completionHandler:(id)a6
{
}

- (void)createPersona:(id)a3 passcodeData:(id)a4 passcodeDataType:(unint64_t)a5 forPid:(int)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = +[NSXPCConnection currentConnection];
  unsigned int v16 = [v15 processIdentifier];

  if (v16 != a6)
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    unsigned int v17 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = 0;
      unsigned int v18 = sub_100055404(1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v19 = v18;
      }
      else {
        unsigned int v19 = v18 & 0xFFFFFFFE;
      }
      if (v19)
      {
        v38[0] = 67109376;
        v38[1] = v16;
        __int16 v39 = 1024;
        int v40 = a6;
        LODWORD(v29) = 14;
        unsigned int v28 = v38;
        unsigned int v20 = (const char *)_os_log_send_and_compose_impl();
        int v21 = (char *)v20;
        if (v20) {
          sub_100055434(v20);
        }
      }
      else
      {
        int v21 = 0;
      }
      free(v21);
    }
  }
  uint64_t v22 = +[NSXPCConnection currentConnection];
  int v23 = sub_100046B20((uint64_t)[v22 processIdentifier]);

  unsigned int v24 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F978;
  block[3] = &unk_1000D51A0;
  void block[4] = self;
  id v31 = v12;
  id v33 = v14;
  unint64_t v34 = a5;
  id v32 = v13;
  unsigned int v35 = v16;
  int v36 = v23;
  id v25 = v13;
  id v26 = v12;
  id v27 = v14;
  dispatch_async(v24, block);
}

- (void)deletePersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = +[NSXPCConnection currentConnection];
  unsigned int v11 = [v10 processIdentifier];

  if (v11 != a4)
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    id v12 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = 0;
      unsigned int v13 = sub_100055404(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        v30[0] = 67109376;
        v30[1] = v11;
        __int16 v31 = 1024;
        int v32 = a4;
        LODWORD(v23) = 14;
        uint64_t v22 = v30;
        id v15 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v16 = (char *)v15;
        if (v15) {
          sub_100055434(v15);
        }
      }
      else
      {
        unsigned int v16 = 0;
      }
      free(v16);
    }
  }
  unsigned int v17 = +[NSXPCConnection currentConnection];
  int v18 = sub_100046B20((uint64_t)[v17 processIdentifier]);

  unsigned int v19 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010978;
  block[3] = &unk_1000D51C8;
  void block[4] = self;
  id v25 = v8;
  unsigned int v27 = v11;
  int v28 = v18;
  id v26 = v9;
  id v20 = v9;
  id v21 = v8;
  dispatch_async(v19, block);
}

- (void)disablePersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = +[NSXPCConnection currentConnection];
  unsigned int v11 = [v10 processIdentifier];

  if (v11 != a4)
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    id v12 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = 0;
      unsigned int v13 = sub_100055404(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        v30[0] = 67109376;
        v30[1] = v11;
        __int16 v31 = 1024;
        int v32 = a4;
        LODWORD(v23) = 14;
        uint64_t v22 = v30;
        id v15 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v16 = (char *)v15;
        if (v15) {
          sub_100055434(v15);
        }
      }
      else
      {
        unsigned int v16 = 0;
      }
      free(v16);
    }
  }
  unsigned int v17 = +[NSXPCConnection currentConnection];
  int v18 = sub_100046B20((uint64_t)[v17 processIdentifier]);

  unsigned int v19 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011174;
  block[3] = &unk_1000D51C8;
  void block[4] = self;
  id v25 = v8;
  unsigned int v27 = v11;
  int v28 = v18;
  id v26 = v9;
  id v20 = v9;
  id v21 = v8;
  dispatch_async(v19, block);
}

- (void)fetchPersonaListforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  unsigned int v7 = +[NSXPCConnection currentConnection];
  int v8 = sub_100046B20((uint64_t)[v7 processIdentifier]);

  id v9 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001180C;
  block[3] = &unk_1000D4FC0;
  int v13 = a3;
  int v14 = v8;
  void block[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)fetchAllUsersPersonaListforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  unsigned int v7 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011DCC;
  block[3] = &unk_1000D4ED8;
  int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)fetchAsidMapforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  unsigned int v7 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012338;
  block[3] = &unk_1000D4ED8;
  int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)fetchPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NSXPCConnection currentConnection];
  int v11 = sub_100046B20((uint64_t)[v10 processIdentifier]);

  id v12 = qword_1000E4320;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000127B4;
  v15[3] = &unk_1000D51C8;
  v15[4] = self;
  id v16 = v8;
  int v18 = a4;
  int v19 = v11;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, v15);
}

- (void)setSinglePersonaBundlesIdentifiers:(id)a3 forPersona:(id)a4 forPid:(int)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[NSXPCConnection currentConnection];
  unsigned int v14 = [v13 processIdentifier];

  if (v14 != a5)
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    id v15 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = 0;
      unsigned int v16 = sub_100055404(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        v35[0] = 67109376;
        v35[1] = v14;
        __int16 v36 = 1024;
        int v37 = a5;
        LODWORD(v27) = 14;
        id v26 = v35;
        int v18 = (const char *)_os_log_send_and_compose_impl();
        int v19 = (char *)v18;
        if (v18) {
          sub_100055434(v18);
        }
      }
      else
      {
        int v19 = 0;
      }
      free(v19);
    }
  }
  id v20 = +[NSXPCConnection currentConnection];
  int v21 = sub_100046B20((uint64_t)[v20 processIdentifier]);

  uint64_t v22 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013100;
  block[3] = &unk_1000D51F0;
  void block[4] = self;
  id v29 = v11;
  unsigned int v32 = v14;
  int v33 = v21;
  id v30 = v10;
  id v31 = v12;
  id v23 = v12;
  id v24 = v10;
  id v25 = v11;
  dispatch_async(v22, block);
}

- (void)fetchBundleIdentifiersForPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NSXPCConnection currentConnection];
  int v11 = sub_100046B20((uint64_t)[v10 processIdentifier]);

  id v12 = qword_1000E4320;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000138BC;
  v15[3] = &unk_1000D51C8;
  v15[4] = self;
  id v16 = v8;
  int v18 = a4;
  int v19 = v11;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, v15);
}

- (void)setMultiPersonaBundlesIdentifiers:(id)a3 forPid:(int)a4 WithcompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NSXPCConnection currentConnection];
  unsigned int v11 = [v10 processIdentifier];

  if (v11 != a4)
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    id v12 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = 0;
      unsigned int v13 = sub_100055404(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        v30[0] = 67109376;
        v30[1] = v11;
        __int16 v31 = 1024;
        int v32 = a4;
        LODWORD(v23) = 14;
        uint64_t v22 = v30;
        id v15 = (const char *)_os_log_send_and_compose_impl();
        id v16 = (char *)v15;
        if (v15) {
          sub_100055434(v15);
        }
      }
      else
      {
        id v16 = 0;
      }
      free(v16);
    }
  }
  id v17 = +[NSXPCConnection currentConnection];
  int v18 = sub_100046B20((uint64_t)[v17 processIdentifier]);

  int v19 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000141CC;
  block[3] = &unk_1000D51C8;
  void block[4] = self;
  id v25 = v8;
  unsigned int v27 = v11;
  int v28 = v18;
  id v26 = v9;
  id v20 = v9;
  id v21 = v8;
  dispatch_async(v19, block);
}

- (void)fetchMultiPersonaBundleIdentifiersforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  unsigned int v7 = +[NSXPCConnection currentConnection];
  int v8 = sub_100046B20((uint64_t)[v7 processIdentifier]);

  id v9 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014878;
  block[3] = &unk_1000D4FC0;
  int v13 = a3;
  int v14 = v8;
  void block[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)personaLoginWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(v7, v8);
  }
}

- (void)personaLogoutWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(v7, v8);
  }
}

- (void)_broadcastPersonaUpdates:(id)a3 withAuid:(unsigned int)a4
{
  id v6 = a3;
  if (qword_1000E3FD8 != -1) {
    dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
  }
  id v7 = (id)qword_1000E3FD0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = 0;
    unsigned int v8 = sub_100055404(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v9 = v8;
    }
    else {
      unsigned int v9 = v8 & 0xFFFFFFFE;
    }
    if (v9)
    {
      __int16 v16 = 0;
      id v10 = (const char *)_os_log_send_and_compose_impl();
      unsigned int v11 = (char *)v10;
      if (v10) {
        sub_100055434(v10);
      }
    }
    else
    {
      unsigned int v11 = 0;
    }
    free(v11);
  }

  CFArrayRef v12 = sub_100046A60(v6);
  CFArrayRef v13 = v12;
  if (v12)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000150FC;
    v14[3] = &unk_1000D5218;
    v14[4] = self;
    unsigned int v15 = a4;
    [(__CFArray *)v12 enumerateObjectsUsingBlock:v14];
  }
}

- (BOOL)notifyNextPersonaObserver:(id)a3 withUser:(unsigned int)a4
{
  id v5 = a3;
  if (v5)
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    id v6 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = 0;
      unsigned int v7 = sub_100055404(1);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v8 = v7;
      }
      else {
        unsigned int v8 = v7 & 0xFFFFFFFE;
      }
      if (v8)
      {
        LODWORD(v30[0]) = 138412290;
        *(void *)((char *)v30 + 4) = v5;
        unsigned int v9 = (const char *)_os_log_send_and_compose_impl();
        id v10 = (char *)v9;
        if (v9) {
          sub_100055434(v9);
        }
      }
      else
      {
        id v10 = 0;
      }
      free(v10);
    }

    id v16 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:v5 options:0];
    uint64_t v17 = +[RDClient sharedXPCInterface];
    [v16 setRemoteObjectInterface:v17];

    int v18 = +[RDServer sharedXPCInterface];
    [v16 setExportedInterface:v18];

    [v16 setExportedObject:self];
    [v16 setInterruptionHandler:&stru_1000D5238];
    [v16 setInvalidationHandler:&stru_1000D5258];
    [v16 resume];
    unsigned int v11 = +[RDClient clientWithXPCConnection:v16];
    if (!v11)
    {
      if (qword_1000E3FD8 != -1) {
        dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
      }
      int v19 = (id)qword_1000E3FD0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v30[0] = 0;
        unsigned int v20 = sub_100055404(1);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v21 = v20;
        }
        else {
          unsigned int v21 = v20 & 0xFFFFFFFE;
        }
        if (v21)
        {
          LOWORD(v29) = 0;
          uint64_t v22 = (const char *)_os_log_send_and_compose_impl();
          uint64_t v23 = (char *)v22;
          if (v22) {
            sub_100055434(v22);
          }
        }
        else
        {
          uint64_t v23 = 0;
        }
        free(v23);
      }
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000158EC;
    v26[3] = &unk_1000D4EB0;
    id v27 = v5;
    id v28 = v16;
    id v24 = v16;
    [v11 personaUpdateCallbackForMachServiceCompletionHandler:v26];
  }
  else
  {
    if (qword_1000E3FD8 != -1) {
      dispatch_once(&qword_1000E3FD8, &stru_1000D5278);
    }
    unsigned int v11 = (id)qword_1000E3FD0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v30[0] = 0;
      unsigned int v12 = sub_100055404(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        LOWORD(v29) = 0;
        int v14 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v15 = (char *)v14;
        if (v14) {
          sub_100055434(v14);
        }
      }
      else
      {
        unsigned int v15 = 0;
      }
      free(v15);
    }
  }

  return v5 != 0;
}

- (void)registerUserPersonaStakeholderForPID:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  unsigned int v7 = qword_1000E4320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015AE0;
  block[3] = &unk_1000D4ED8;
  int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)registerUserPersonaObserverForPID:(int)a3 withMachServiceName:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSXPCConnection currentConnection];
  int v11 = sub_100046B20((uint64_t)[v10 processIdentifier]);

  unsigned int v12 = qword_1000E4320;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100016048;
  v15[3] = &unk_1000D51C8;
  v15[4] = self;
  id v16 = v8;
  int v18 = a3;
  int v19 = v11;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, v15);
}

- (int)asidForClient:(id)a3 withAuid:(unsigned int *)a4 withPid:(int)a5
{
  if (a4) {
    *a4 = -1;
  }
  return -1;
}

- (void)provisionDevice:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = qword_1000E4320;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000166D0;
  v13[3] = &unk_1000D4F00;
  int v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)resetStateForUserSwitch
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000E4320);
  [(RDServer *)self setSwitchState:0];
  [(RDServer *)self setUserToSwitchTo:0];
  id v3 = [(RDServer *)self logoutTimer];

  if (v3)
  {
    if (qword_1000E3FE8 != -1) {
      dispatch_once(&qword_1000E3FE8, &stru_1000D5298);
    }
    id v4 = (id)qword_1000E3FE0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = sub_100055404(0);
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        v5 &= ~1u;
      }
      if (v5)
      {
        id v6 = v4;
        unsigned int v7 = [(RDServer *)self logoutTimer];
        int v19 = 134217984;
        unsigned int v20 = v7;
        LODWORD(v18) = 12;
        id v17 = &v19;
        id v8 = (char *)_os_log_send_and_compose_impl();

        if (v8) {
          sub_100055434(v8);
        }
      }
      else
      {
        id v8 = 0;
      }
      free(v8);
    }

    id v9 = [(RDServer *)self logoutTimer];
    dispatch_source_cancel(v9);

    [(RDServer *)self setLogoutTimer:0];
  }
  id v10 = [(RDServer *)self fastLogoutTimer];

  if (v10)
  {
    if (qword_1000E3FE8 != -1) {
      dispatch_once(&qword_1000E3FE8, &stru_1000D5298);
    }
    id v11 = (id)qword_1000E3FE0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = sub_100055404(0);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        v12 &= ~1u;
      }
      if (v12)
      {
        id v13 = v11;
        id v14 = [(RDServer *)self fastLogoutTimer];
        int v19 = 134217984;
        unsigned int v20 = v14;
        id v15 = (char *)_os_log_send_and_compose_impl();

        if (v15) {
          sub_100055434(v15);
        }
      }
      else
      {
        id v15 = 0;
      }
      free(v15);
    }

    int v16 = [(RDServer *)self fastLogoutTimer];
    dispatch_source_cancel(v16);

    [(RDServer *)self setFastLogoutTimer:0];
  }
}

- (NSMutableDictionary)pidsToClients
{
  return self->_pidsToClients;
}

- (void)setPidsToClients:(id)a3
{
}

- (NSMutableDictionary)userToSwitchTo
{
  return self->_userToSwitchTo;
}

- (void)setUserToSwitchTo:(id)a3
{
}

- (int)switchState
{
  return self->_switchState;
}

- (void)setSwitchState:(int)a3
{
  self->_switchState = a3;
}

- (OS_dispatch_source)logoutTimer
{
  return self->_logoutTimer;
}

- (void)setLogoutTimer:(id)a3
{
}

- (OS_dispatch_source)fastLogoutTimer
{
  return self->_fastLogoutTimer;
}

- (void)setFastLogoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastLogoutTimer, 0);
  objc_storeStrong((id *)&self->_logoutTimer, 0);
  objc_storeStrong((id *)&self->_userToSwitchTo, 0);

  objc_storeStrong((id *)&self->_pidsToClients, 0);
}

@end