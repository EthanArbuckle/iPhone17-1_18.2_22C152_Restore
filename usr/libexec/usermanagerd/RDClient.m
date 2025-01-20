@interface RDClient
+ (RDClient)clientWithXPCConnection:(id)a3;
+ (id)sharedBubbleXPCInterface;
+ (id)sharedXPCInterface;
- ($115C4C562B26FF47E01F9F4EA65B5887)currentAuditToken;
- (BOOL)bubblePopstakeholderIsRegistered;
- (BOOL)bubbleStakeHolder;
- (BOOL)criticalStakeHolder;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasUserSwitchTasks;
- (BOOL)hasUserSyncTasks;
- (BOOL)personaStakeHolderIsRegistered;
- (BOOL)removeUserSwitchTask:(id)a3;
- (BOOL)removeUserSyncTask:(id)a3;
- (BOOL)stakeholderIsRegistered;
- (BOOL)wasToldWillSwitchUser;
- (NSMutableArray)userSwitchTasks;
- (NSMutableArray)userSyncTasks;
- (NSString)machServiceName;
- (NSXPCConnection)syncXPCConnection;
- (NSXPCConnection)xpcConnection;
- (RDClient)init;
- (id)proxy;
- (id)syncProxy;
- (id)taskDictionaryInArray:(id)a3 withUUIDString:(id)a4;
- (int)pid;
- (int)switchStakeHolderKind;
- (void)addUserSwitchTask:(id)a3;
- (void)addUserSyncTask:(id)a3;
- (void)bubbleDidPop;
- (void)bubbleShouldPop;
- (void)clearTaskLists;
- (void)deviceLoginSessionStateDidUpdate;
- (void)personaListDidUpdateCompletionHandler:(id)a3;
- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3;
- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4;
- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4;
- (void)setBubblePopstakeholderIsRegistered:(BOOL)a3;
- (void)setBubbleStakeHolder:(BOOL)a3;
- (void)setCriticalStakeHolder:(BOOL)a3;
- (void)setMachServiceName:(id)a3;
- (void)setPersonaStakeHolderIsRegistered:(BOOL)a3;
- (void)setStakeholderIsRegistered:(BOOL)a3;
- (void)setSwitchStakeHolderKind:(int)a3;
- (void)setSyncXPCConnection:(id)a3;
- (void)setUserSwitchTasks:(id)a3;
- (void)setUserSyncTasks:(id)a3;
- (void)setWasToldWillSwitchUser:(BOOL)a3;
- (void)setXpcConnection:(id)a3;
- (void)uploadContentWithCompletionHandler:(id)a3;
- (void)userSwitchTaskListDidUpdate;
- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4;
@end

@implementation RDClient

+ (RDClient)clientWithXPCConnection:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = v4;
  if (v4) {
    [v4 setXpcConnection:v3];
  }

  return (RDClient *)v5;
}

+ (id)sharedXPCInterface
{
  if (qword_1000E4098 != -1) {
    dispatch_once(&qword_1000E4098, &stru_1000D55F8);
  }
  v2 = (void *)qword_1000E4090;

  return v2;
}

+ (id)sharedBubbleXPCInterface
{
  if (qword_1000E40A8 != -1) {
    dispatch_once(&qword_1000E40A8, &stru_1000D5618);
  }
  v2 = (void *)qword_1000E40A0;

  return v2;
}

- (RDClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)RDClient;
  v2 = [(RDClient *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    userSwitchTasks = v2->_userSwitchTasks;
    v2->_userSwitchTasks = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    userSyncTasks = v2->_userSyncTasks;
    v2->_userSyncTasks = (NSMutableArray *)v5;
  }
  return v2;
}

- (int)pid
{
  v2 = [(RDClient *)self xpcConnection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (BOOL)hasEntitlement:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = [(RDClient *)self xpcConnection];
  v6 = [v5 valueForEntitlement:v4];

  BOOL v7 = 0;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue]) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)currentAuditToken
{
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  id v4 = [(RDClient *)self xpcConnection];
  if (v4)
  {
    v6 = v4;
    [v4 auditToken];
    id v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (id)proxy
{
  int v3 = [(RDClient *)self xpcConnection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100053F18;
  v6[3] = &unk_1000D5640;
  v6[4] = self;
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  return v4;
}

- (id)syncProxy
{
  int v3 = [(RDClient *)self xpcConnection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100054010;
  v6[3] = &unk_1000D5640;
  v6[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v6];

  return v4;
}

- (void)addUserSwitchTask:(id)a3
{
  id v4 = a3;
  id v5 = [(RDClient *)self userSwitchTasks];
  [v5 addObject:v4];
}

- (id)taskDictionaryInArray:(id)a3 withUUIDString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12 = [v11 objectForKeyedSubscript:kUMUserSwitchTaskUUIDKey];
        if ([v6 isEqualToString:v12])
        {
          id v8 = v11;

          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (BOOL)removeUserSwitchTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:kUMUserSwitchTaskUUIDKey];
  id v6 = [(RDClient *)self userSwitchTasks];
  id v7 = [(RDClient *)self taskDictionaryInArray:v6 withUUIDString:v5];

  if (v7)
  {
    id v8 = [(RDClient *)self userSwitchTasks];
    [v8 removeObject:v7];
  }
  else
  {
    NSLog(@"Client %@ does not have user switch task %@", self, v4);
  }

  return v7 != 0;
}

- (BOOL)hasUserSwitchTasks
{
  v2 = [(RDClient *)self userSwitchTasks];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)addUserSyncTask:(id)a3
{
  id v4 = a3;
  id v5 = [(RDClient *)self userSyncTasks];
  [v5 addObject:v4];
}

- (BOOL)removeUserSyncTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:kUMUserSwitchTaskUUIDKey];
  id v6 = [(RDClient *)self userSyncTasks];
  id v7 = [(RDClient *)self taskDictionaryInArray:v6 withUUIDString:v5];

  if (v7)
  {
    id v8 = [(RDClient *)self userSyncTasks];
    [v8 removeObject:v4];
  }
  else
  {
    NSLog(@"Client %@ does not have user sync task %@", self, v4);
  }

  return v7 != 0;
}

- (BOOL)hasUserSyncTasks
{
  v2 = [(RDClient *)self userSyncTasks];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = self;
  id v8 = a3;
  uint64_t v9 = [(RDClient *)v7 proxy];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100054584;
  v12[3] = &unk_1000D5128;
  v13 = v7;
  id v14 = v6;
  id v10 = v6;
  v11 = v7;
  [v9 willSwitchToUser:v8 completionHandler:v12];
}

- (void)personaListDidUpdateCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(RDClient *)v5 proxy];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000547C8;
  v9[3] = &unk_1000D5128;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 personaListDidUpdateCompletionHandler:v9];
}

- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if (qword_1000E40B8 != -1) {
    dispatch_once(&qword_1000E40B8, &stru_1000D5660);
  }
  id v6 = (id)qword_1000E40B0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = 0;
    int v7 = sub_100055404(1);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      v7 &= ~1u;
    }
    if (v7)
    {
      id v8 = v6;
      int v17 = 67109120;
      unsigned int v18 = [(RDClient *)v5 pid];
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();

      if (v9) {
        sub_100055434(v9);
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    free(v9);
  }

  id v10 = [(RDClient *)v5 syncProxy];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100054B2C;
  v13[3] = &unk_1000D5128;
  id v14 = v5;
  id v15 = v4;
  id v11 = v4;
  v12 = v5;
  [v10 personaUpdateCallbackForMachServiceCompletionHandler:v13];
}

- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  if (qword_1000E40B8 != -1) {
    dispatch_once(&qword_1000E40B8, &stru_1000D5660);
  }
  uint64_t v9 = (id)qword_1000E40B0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = sub_100055404(1);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      v10 &= ~1u;
    }
    if (v10)
    {
      id v11 = v9;
      [(RDClient *)v8 pid];
      v12 = (char *)_os_log_send_and_compose_impl();

      if (v12) {
        sub_100055434(v12);
      }
    }
    else
    {
      v12 = 0;
    }
    free(v12);
  }

  v13 = [(RDClient *)v8 proxy];
  [v13 readyToSwitchToUser:v6 completionHandler:v7];
}

- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  if (qword_1000E40B8 != -1) {
    dispatch_once(&qword_1000E40B8, &stru_1000D5660);
  }
  uint64_t v9 = (id)qword_1000E40B0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = sub_100055404(1);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      v10 &= ~1u;
    }
    if (v10)
    {
      id v11 = v9;
      [(RDClient *)v8 pid];
      v12 = (char *)_os_log_send_and_compose_impl();

      if (v12) {
        sub_100055434(v12);
      }
    }
    else
    {
      v12 = 0;
    }
    free(v12);
  }

  v13 = [(RDClient *)v8 proxy];
  [v13 readyToSwitchToLoginSession:v6 completionHandler:v7];
}

- (void)userSwitchTaskListDidUpdate
{
  id v2 = [(RDClient *)self proxy];
  [v2 userSwitchTaskListDidUpdate];
}

- (void)deviceLoginSessionStateDidUpdate
{
  id v2 = [(RDClient *)self proxy];
  [v2 deviceLoginSessionStateDidUpdate];
}

- (void)uploadContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  NSLog(@"BD: CLIENT IS ABOUT TO SEND UPLOAD CONTENT...");
  id v5 = [(RDClient *)self proxy];
  [v5 uploadContentWithCompletionHandler:v4];
}

- (void)bubbleDidPop
{
  id v2 = [(RDClient *)self proxy];
  [v2 bubbleDidPop];
}

- (void)bubbleShouldPop
{
  if (qword_1000E40B8 != -1) {
    dispatch_once(&qword_1000E40B8, &stru_1000D5660);
  }
  BOOL v3 = (id)qword_1000E40B0;
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
      id v7 = (char *)v6;
      if (v6) {
        sub_100055434(v6);
      }
    }
    else
    {
      id v7 = 0;
    }
    free(v7);
  }

  id v8 = [(RDClient *)self proxy];
  [v8 bubbleShouldPop];
}

- (void)clearTaskLists
{
  BOOL v3 = [(RDClient *)self userSwitchTasks];
  [v3 removeAllObjects];

  id v4 = [(RDClient *)self userSyncTasks];
  [v4 removeAllObjects];
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (BOOL)stakeholderIsRegistered
{
  return self->_stakeholderIsRegistered;
}

- (void)setStakeholderIsRegistered:(BOOL)a3
{
  self->_stakeholderIsRegistered = a3;
}

- (BOOL)wasToldWillSwitchUser
{
  return self->_wasToldWillSwitchUser;
}

- (void)setWasToldWillSwitchUser:(BOOL)a3
{
  self->_wasToldWillSwitchUser = a3;
}

- (BOOL)criticalStakeHolder
{
  return self->_criticalStakeHolder;
}

- (void)setCriticalStakeHolder:(BOOL)a3
{
  self->_criticalStakeHolder = a3;
}

- (BOOL)bubbleStakeHolder
{
  return self->_bubbleStakeHolder;
}

- (void)setBubbleStakeHolder:(BOOL)a3
{
  self->_bubbleStakeHolder = a3;
}

- (BOOL)bubblePopstakeholderIsRegistered
{
  return self->_bubblePopstakeholderIsRegistered;
}

- (void)setBubblePopstakeholderIsRegistered:(BOOL)a3
{
  self->_bubblePopstakeholderIsRegistered = a3;
}

- (int)switchStakeHolderKind
{
  return self->_switchStakeHolderKind;
}

- (void)setSwitchStakeHolderKind:(int)a3
{
  self->_switchStakeHolderKind = a3;
}

- (BOOL)personaStakeHolderIsRegistered
{
  return self->_personaStakeHolderIsRegistered;
}

- (void)setPersonaStakeHolderIsRegistered:(BOOL)a3
{
  self->_personaStakeHolderIsRegistered = a3;
}

- (NSMutableArray)userSwitchTasks
{
  return self->_userSwitchTasks;
}

- (void)setUserSwitchTasks:(id)a3
{
}

- (NSMutableArray)userSyncTasks
{
  return self->_userSyncTasks;
}

- (void)setUserSyncTasks:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCConnection)syncXPCConnection
{
  return self->_syncXPCConnection;
}

- (void)setSyncXPCConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncXPCConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_userSyncTasks, 0);
  objc_storeStrong((id *)&self->_userSwitchTasks, 0);

  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end