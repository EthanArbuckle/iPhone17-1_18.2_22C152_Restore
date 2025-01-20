@interface UMXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (UMXPCServer)init;
- (void)bubbleDidPop;
- (void)deviceLoginSessionStateDidUpdate;
- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7;
- (void)loginUICheckInWithCompletionHandler:(id)a3;
- (void)logoutToLoginSessionWithCompletionHandler:(id)a3;
- (void)personaListDidUpdateCompletionHandler:(id)a3;
- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3;
- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4;
- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4;
- (void)registerCriticalUserSwitchStakeHolder:(id)a3;
- (void)registerUserSwitchStakeHolder:(id)a3;
- (void)registerUserSwitchStakeHolder:(id)a3 completionHandler:(id)a4;
- (void)registerUserSyncStakeholder:(id)a3 withMachServiceName:(id)a4;
- (void)resumeQuotas;
- (void)resumeSync;
- (void)suspendQuotasWithCompletionHandler:(id)a3;
- (void)switchToLoginUserWithCompletionHandler:(id)a3;
- (void)switchToLoginUserWithError:(id)a3 completionHandler:(id)a4;
- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7;
- (void)terminateSyncWithCompletionHandler:(id)a3;
- (void)unregisterStakeHolder:(id)a3 status:(unint64_t)a4 reason:(id)a5;
- (void)uploadContentWithCompletionHandler:(id)a3;
- (void)userInteractionIsEnabled;
- (void)userSwitchTaskListDidUpdate;
- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4;
@end

@implementation UMXPCServer

- (UMXPCServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)UMXPCServer;
  v2 = [(UMXPCServer *)&v10 init];
  if (v2)
  {
    uint64_t v3 = sub_190C4A1D0();
    se = v2->_se;
    v2->_se = (UMSideEffectsProviding *)v3;

    *(_WORD *)&v2->_didBroadcastUploadContent = 0;
    *(_DWORD *)&v2->_currentlyBroadcastingWillSwitchToUser = 0;
    uint64_t v5 = objc_opt_new();
    switchBlockingTasks = v2->_switchBlockingTasks;
    v2->_switchBlockingTasks = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    syncTasks = v2->_syncTasks;
    v2->_syncTasks = (NSMutableArray *)v7;

    v2->_willSwitchToUserAddedTaskCount = 0;
    v2->_interruptionRetryCount = 0;
    if ((sub_190C3AB20() & 1) == 0) {
      sub_190C4DA84((uint64_t)v2);
    }
  }
  return v2;
}

- (void)registerUserSwitchStakeHolder:(id)a3
{
}

- (void)registerUserSwitchStakeHolder:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_190C3AB40();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_190C4DCBC;
  v11[3] = &unk_1E56C63C0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  sub_190C3C78C((uint64_t)v8, self, v11);
}

- (void)registerCriticalUserSwitchStakeHolder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_190C3AB40();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190C4DE9C;
  v7[3] = &unk_1E56C63E8;
  id v8 = v4;
  id v6 = v4;
  sub_190C3C78C((uint64_t)v5, self, v7);
}

- (void)registerUserSyncStakeholder:(id)a3 withMachServiceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_190C3AB40();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_190C4DF98;
  v11[3] = &unk_1E56C6410;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  sub_190C3C78C((uint64_t)v8, self, v11);
}

- (void)unregisterStakeHolder:(id)a3 status:(unint64_t)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_190C3AB40();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_190C4E1D8;
  v13[3] = &unk_1E56C6438;
  id v15 = v9;
  unint64_t v16 = a4;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  sub_190C3C78C((uint64_t)v10, self, v13);
}

- (void)switchToLoginUserWithCompletionHandler:(id)a3
{
}

- (void)switchToLoginUserWithError:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = sub_190C3AB40();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190C4E404;
  v8[3] = &unk_1E56C6460;
  id v9 = v5;
  id v7 = v5;
  sub_190C3C78C((uint64_t)v6, self, v8);
}

- (void)logoutToLoginSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_190C3AB40();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190C4E53C;
  v7[3] = &unk_1E56C6460;
  id v8 = v4;
  id v6 = v4;
  sub_190C3C78C((uint64_t)v5, self, v7);
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 completionHandler:(id)a6
{
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = sub_190C3AB40();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_190C4E718;
  v23[3] = &unk_1E56C6488;
  id v24 = v14;
  id v25 = v12;
  id v26 = v13;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v13;
  id v21 = v12;
  id v22 = v14;
  sub_190C3C78C((uint64_t)v17, self, v23);
}

- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = sub_190C3AB40();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_190C4E980;
  v23[3] = &unk_1E56C6488;
  id v24 = v14;
  id v25 = v12;
  id v26 = v13;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v13;
  id v21 = v12;
  id v22 = v14;
  sub_190C3C78C((uint64_t)v17, self, v23);
}

- (void)loginUICheckInWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_190C3AB40();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190C4EB24;
  v7[3] = &unk_1E56C6460;
  id v8 = v4;
  id v6 = v4;
  sub_190C3C78C((uint64_t)v5, self, v7);
}

- (void)suspendQuotasWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_190C3AB40();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190C4EC5C;
  v7[3] = &unk_1E56C6460;
  id v8 = v4;
  id v6 = v4;
  sub_190C3C78C((uint64_t)v5, self, v7);
}

- (void)resumeQuotas
{
  sub_190C3AB40();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C3C78C((uint64_t)v3, self, &unk_1EE091400);
}

- (void)terminateSyncWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_190C3AB40();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190C4EE50;
  v7[3] = &unk_1E56C6460;
  id v8 = v4;
  id v6 = v4;
  sub_190C3C78C((uint64_t)v5, self, v7);
}

- (void)resumeSync
{
  sub_190C3AB40();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C3C78C((uint64_t)v3, self, &unk_1EE091620);
}

- (void)userInteractionIsEnabled
{
  if (self) {
    self = (UMXPCServer *)self->_xpcConnection;
  }
  objc_msgSend_remoteObjectProxyWithErrorHandler_(self, a2, (uint64_t)&unk_1EE091880);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loginComplete(v4, v2, v3);
}

- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_190C3C52C();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_190C525B4;
  v11[3] = &unk_1E56C6568;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_190C3C78C((uint64_t)v8, self, v11);
}

- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_190C3C52C();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_190C52880;
  v11[3] = &unk_1E56C6568;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_190C3C78C((uint64_t)v8, self, v11);
}

- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_190C3C52C();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_190C52AD8;
  v11[3] = &unk_1E56C6590;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_190C3C78C((uint64_t)v8, self, v11);
}

- (void)userSwitchTaskListDidUpdate
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained(&self->_stakeholder);
  }
  else {
    id WeakRetained = 0;
  }
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = sub_190C3AB40();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_190C52C80;
    v6[3] = &unk_1E56C63E8;
    v6[4] = self;
    sub_190C3C78C((uint64_t)v5, self, v6);
  }
}

- (void)deviceLoginSessionStateDidUpdate
{
  v2 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v2, @"Update LoginSession Type Cache", v3, v4, v5, v6, v7, v8, v9);

  sub_190C44000();
}

- (void)uploadContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_190C3C52C();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190C531E4;
  v7[3] = &unk_1E56C6460;
  id v8 = v4;
  id v6 = v4;
  sub_190C3C78C((uint64_t)v5, self, v7);
}

- (void)bubbleDidPop
{
  sub_190C3C52C();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C3C78C((uint64_t)v3, self, &unk_1EE091860);
}

- (void)personaListDidUpdateCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_190C3C52C();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190C536F4;
  v7[3] = &unk_1E56C6590;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_190C3C78C((uint64_t)v5, self, v7);
}

- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_190C3C52C();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190C538FC;
  v7[3] = &unk_1E56C6590;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_190C3C78C((uint64_t)v5, self, v7);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v6, @"Should accept connection", v7, v8, v9, v10, v11, v12, v23);

  char v13 = sub_190C4A1DC(v5, @"com.apple.mobile.keybagd.bubbled.sync");
  if (v13)
  {
    id v14 = sub_190C3AB40();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_190C53B64;
    v25[3] = &unk_1E56C63E8;
    id v26 = v5;
    sub_190C3C78C((uint64_t)v14, self, v25);
  }
  else
  {
    id v15 = sub_190C3C3A4();
    sub_190C49FC4((uint64_t)v15, @"Connection does not have entitlement", v16, v17, v18, v19, v20, v21, v24);
  }
  return v13;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_personaUpdateCallbackStakeholder);
  objc_storeStrong(&self->_personaRegistrationCompletionHandler, 0);
  objc_destroyWeak(&self->_personaStakeholder);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_syncConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong(&self->_bubblePopHandler, 0);
  objc_storeStrong((id *)&self->_syncTasks, 0);
  objc_storeStrong((id *)&self->_switchBlockingTasks, 0);
  objc_storeStrong(&self->_willSwitchCompletionHandler, 0);
  objc_storeStrong(&self->_uploadContentCompletionHandler, 0);
  objc_storeStrong(&self->_loginUICheckinSessionCompletionHandler, 0);
  objc_storeStrong(&self->_logoutToLoginSessionCompletionHandler, 0);
  objc_storeStrong(&self->_directSwitchCompletionHandler, 0);
  objc_storeStrong(&self->_suspendQuotasCompletionHandler, 0);
  objc_storeStrong(&self->_switchCompletionHandler, 0);
  objc_storeStrong(&self->_registrationCompletionHandler, 0);
  objc_storeStrong(&self->_provisionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_provisionDict, 0);
  objc_storeStrong((id *)&self->_personaProfileDict, 0);
  objc_storeStrong((id *)&self->_preferencesDict, 0);
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_passcodeData, 0);
  objc_storeStrong((id *)&self->_personaSpec, 0);
  objc_storeStrong((id *)&self->_unregistrationReason, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_destroyWeak(&self->_stakeholder);
  objc_storeStrong((id *)&self->_se, 0);
}

@end