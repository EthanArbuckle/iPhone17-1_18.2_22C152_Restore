@interface KCSharingXPCServer
- (KCSharingDaemonGroupManager)groupManager;
- (KCSharingSyncController)syncController;
- (KCSharingXPCServer)initWithConnection:(id)a3 allowedProtocol:(id)a4 groupManager:(id)a5 syncController:(id)a6;
- (NSString)description;
- (NSXPCConnection)connection;
- (Protocol)allowedProtocol;
- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4;
- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)createGroupWithRequest:(id)a3 completion:(id)a4;
- (void)declineInviteForGroupID:(id)a3 completion:(id)a4;
- (void)deleteGroupWithRequest:(id)a3 completion:(id)a4;
- (void)fetchCurrentUserIdentifierWithReply:(id)a3;
- (void)fetchRemoteChangesWithReply:(id)a3;
- (void)getGroupByGroupID:(id)a3 completion:(id)a4;
- (void)getGroupsWithRequest:(id)a3 completion:(id)a4;
- (void)groupInvitationWasCancelled;
- (void)leaveGroupWithRequest:(id)a3 completion:(id)a4;
- (void)performMaintenanceWithCompletion:(id)a3;
- (void)provisionWithReply:(id)a3;
- (void)receivedGroupInvitation:(id)a3;
- (void)resyncWithCompletion:(id)a3;
- (void)saveLocalChangesWithReply:(id)a3;
- (void)setChangeTrackingEnabled:(BOOL)a3 reply:(id)a4;
- (void)updateGroupWithRequest:(id)a3 completion:(id)a4;
- (void)verifyGroupsInSyncWithCompletion:(id)a3;
- (void)wipe:(BOOL)a3 reply:(id)a4;
@end

@implementation KCSharingXPCServer

- (KCSharingSyncController)syncController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncController);

  return (KCSharingSyncController *)WeakRetained;
}

- (void)provisionWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(KCSharingXPCServer *)self syncController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004188;
  v7[3] = &unk_1002FB1E8;
  id v8 = v4;
  id v6 = v4;
  [v5 ensureCurrentUserProvisionedWithCompletion:v7];
}

- (void)fetchCurrentUserIdentifierWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(KCSharingXPCServer *)self syncController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000042D0;
  v7[3] = &unk_1002FB210;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchCurrentUserIdentifierWithReply:v7];
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (a5
    || (v11 = (const char *)[v9 selector],
        (unint64_t)protocol_getMethodDescription(self->_allowedProtocol, v11, 1, 1).name))
  {
    [v10 invoke];
  }
  else
  {
    v12 = KCSharingLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v13 = NSStringFromSelector(v11);
      v14 = NSStringFromProtocol(self->_allowedProtocol);
      int v15 = 138543874;
      v16 = self;
      __int16 v17 = 2114;
      v18 = v13;
      __int16 v19 = 2114;
      v20 = v14;
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%{public}@ tried to call %{public}@ which isn't part of the allowed protocol %{public}@", (uint8_t *)&v15, 0x20u);
    }
    [v8 invalidate];
  }
}

- (KCSharingXPCServer)initWithConnection:(id)a3 allowedProtocol:(id)a4 groupManager:(id)a5 syncController:(id)a6
{
  id v11 = a3;
  v12 = (Protocol *)a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)KCSharingXPCServer;
  int v15 = [(KCSharingXPCServer *)&v25 init];
  p_isa = (id *)&v15->super.isa;
  if (!v15) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v15->_connection, a3);
  objc_storeStrong(p_isa + 2, a4);
  objc_storeStrong(p_isa + 3, a5);
  objc_storeWeak(p_isa + 4, v14);
  if (protocol_isEqual(v12, (Protocol *)&OBJC_PROTOCOL___KCSharingXPCServerProtocol))
  {
    __int16 v17 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___KCSharingXPCServerProtocol];
    uint64_t v18 = KCSharingSetupServerProtocol();
LABEL_6:
    __int16 v19 = (void *)v18;
    [v11 setExportedInterface:v18];

    [v11 setExportedObject:p_isa];
    [v11 setDelegate:p_isa];
    v20 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___KCSharingXPCClientProtocol];
    [v11 setRemoteObjectInterface:v20];

LABEL_7:
    v21 = p_isa;
    goto LABEL_8;
  }
  if (protocol_isEqual(v12, (Protocol *)&OBJC_PROTOCOL___KCSharingInvitationNotificationProtocol))
  {
    __int16 v17 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___KCSharingInvitationNotificationProtocol];
    uint64_t v18 = KCSharingSetupInvitationNotificationProtocol();
    goto LABEL_6;
  }
  v23 = KCSharingLogObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = NSStringFromProtocol(v12);
    *(_DWORD *)buf = 138543362;
    v27 = v24;
    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Rejected unsupported protocol %{public}@", buf, 0xCu);
  }
  v21 = 0;
LABEL_8:

  return v21;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_syncController);
  objc_storeStrong((id *)&self->_groupManager, 0);
  objc_storeStrong((id *)&self->_allowedProtocol, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (KCSharingDaemonGroupManager)groupManager
{
  return self->_groupManager;
}

- (Protocol)allowedProtocol
{
  return self->_allowedProtocol;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)performMaintenanceWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(KCSharingXPCServer *)self syncController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10012F3A4;
  v7[3] = &unk_1002FB1E8;
  id v8 = v4;
  id v6 = v4;
  [v5 performMaintenanceWithCompletion:v7];
}

- (void)verifyGroupsInSyncWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(KCSharingXPCServer *)self syncController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10012F4B0;
  v7[3] = &unk_1002FB288;
  id v8 = v4;
  id v6 = v4;
  [v5 verifyGroupsInSyncWithCompletion:v7];
}

- (void)resyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(KCSharingXPCServer *)self syncController];
  [v5 resyncFromRPC:1 completion:v4];
}

- (void)groupInvitationWasCancelled
{
  v2 = KCSharingLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Sender cancelled a pending invite", v4, 2u);
  }

  v3 = +[KCSharingXPCListenerDelegate sharedInstance];
  [v3 groupsUpdated];
}

- (void)receivedGroupInvitation:(id)a3
{
  id v3 = a3;
  id v4 = KCSharingLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 groupID];
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "received group invite for %@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = +[KCSharingXPCListenerDelegate sharedInstance];
  [v6 groupsUpdated];
}

- (void)wipe:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(KCSharingXPCServer *)self syncController];
  [v7 wipe:v4 completion:v6];
}

- (void)saveLocalChangesWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(KCSharingXPCServer *)self syncController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10012F810;
  v7[3] = &unk_1002FB1E8;
  id v8 = v4;
  id v6 = v4;
  [v5 saveAllOutgoingChangesWithCompletion:v7];
}

- (void)fetchRemoteChangesWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(KCSharingXPCServer *)self syncController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10012F920;
  v7[3] = &unk_1002FB1E8;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchRemoteChangesForZoneIDs:0 completion:v7];
}

- (void)setChangeTrackingEnabled:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void (**)(id, void))a4;
  if (v4) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = 2;
  }
  atomic_store(v6, (unsigned int *)dword_10035CD18);
  id v7 = KCSharingLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = atomic_load_explicit(dword_10035CD18, memory_order_acquire) < 2;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Updated change tracking state=%d", (uint8_t *)v8, 8u);
  }

  v5[2](v5, 0);
}

- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KCSharingXPCServer *)self groupManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10012FB40;
  v10[3] = &unk_100307410;
  id v11 = v6;
  id v9 = v6;
  [v8 checkAvailabilityForHandles:v7 completion:v10];
}

- (void)declineInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KCSharingXPCServer *)self groupManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10012FC84;
  v10[3] = &unk_1002FB238;
  id v11 = v6;
  id v9 = v6;
  [v8 declineInviteForGroupID:v7 completion:v10];
}

- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KCSharingXPCServer *)self groupManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10012FDC8;
  v10[3] = &unk_1002FB238;
  id v11 = v6;
  id v9 = v6;
  [v8 acceptInviteForGroupID:v7 completion:v10];
}

- (void)deleteGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KCSharingXPCServer *)self groupManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10012FF0C;
  v10[3] = &unk_1002FB1E8;
  id v11 = v6;
  id v9 = v6;
  [v8 handleGroupDeleteRequest:v7 completion:v10];
}

- (void)leaveGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KCSharingXPCServer *)self groupManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100130034;
  v10[3] = &unk_1002FB1E8;
  id v11 = v6;
  id v9 = v6;
  [v8 handleGroupLeaveRequest:v7 completion:v10];
}

- (void)updateGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KCSharingXPCServer *)self groupManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10013015C;
  v10[3] = &unk_1002FB238;
  id v11 = v6;
  id v9 = v6;
  [v8 handleGroupUpdateRequest:v7 completion:v10];
}

- (void)createGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KCSharingXPCServer *)self groupManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001302A0;
  v10[3] = &unk_1002FB238;
  id v11 = v6;
  id v9 = v6;
  [v8 handleGroupCreateRequest:v7 completion:v10];
}

- (void)getGroupsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KCSharingXPCServer *)self groupManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001303E4;
  v10[3] = &unk_1002FB260;
  id v11 = v6;
  id v9 = v6;
  [v8 handleGroupFetchRequest:v7 completion:v10];
}

- (void)getGroupByGroupID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KCSharingXPCServer *)self groupManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100130528;
  v10[3] = &unk_1002FB238;
  id v11 = v6;
  id v9 = v6;
  [v8 getGroupByGroupID:v7 completion:v10];
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  id v5 = [(KCSharingXPCServer *)self allowedProtocol];
  id v6 = NSStringFromProtocol(v5);
  id v7 = +[NSString stringWithFormat:@"<%@(%@): %@>", v4, v6, self->_connection];

  return (NSString *)v7;
}

@end