@interface UMPersonaCallbackListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (UMPersonaCallbackListener)init;
- (void)bubbleDidPop;
- (void)deviceLoginSessionStateDidUpdate;
- (void)personaListDidUpdateCompletionHandler:(id)a3;
- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3;
- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4;
- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4;
- (void)uploadContentWithCompletionHandler:(id)a3;
- (void)userSwitchTaskListDidUpdate;
- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4;
@end

@implementation UMPersonaCallbackListener

- (UMPersonaCallbackListener)init
{
  v8.receiver = self;
  v8.super_class = (Class)UMPersonaCallbackListener;
  v4 = [(UMPersonaCallbackListener *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v2, v3);
    xpcConnections = v4->_xpcConnections;
    v4->_xpcConnections = (NSMutableSet *)v5;
  }
  return v4;
}

- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = sub_190C3C52C();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190C5A558;
  v8[3] = &unk_1E56C66A8;
  id v9 = v5;
  id v7 = v5;
  sub_190C3C78C((uint64_t)v6, self, v8);
}

- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = sub_190C3C52C();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190C5A674;
  v8[3] = &unk_1E56C66A8;
  id v9 = v5;
  id v7 = v5;
  sub_190C3C78C((uint64_t)v6, self, v8);
}

- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = sub_190C3C52C();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190C5A790;
  v8[3] = &unk_1E56C66A8;
  id v9 = v5;
  id v7 = v5;
  sub_190C3C78C((uint64_t)v6, self, v8);
}

- (void)userSwitchTaskListDidUpdate
{
  sub_190C3C52C();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C3C78C((uint64_t)v3, self, &unk_1EE0912C0);
}

- (void)deviceLoginSessionStateDidUpdate
{
  sub_190C3C52C();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C3C78C((uint64_t)v3, self, &unk_1EE0912E0);
}

- (void)uploadContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_190C3C52C();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190C5AA0C;
  v7[3] = &unk_1E56C66A8;
  id v8 = v4;
  id v6 = v4;
  sub_190C3C78C((uint64_t)v5, self, v7);
}

- (void)bubbleDidPop
{
  sub_190C3C52C();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C3C78C((uint64_t)v3, self, &unk_1EE091300);
}

- (void)personaListDidUpdateCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_190C3C52C();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190C5ABD8;
  v7[3] = &unk_1E56C66A8;
  id v8 = v4;
  id v6 = v4;
  sub_190C3C78C((uint64_t)v5, self, v7);
}

- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_190C3C52C();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190C5ACF4;
  v7[3] = &unk_1E56C66F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_190C3C78C((uint64_t)v5, self, v7);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v6, @"Should accept connection for UMPersonaCallbackListener", v7, v8, v9, v10, v11, v12, v16);

  v13 = sub_190C3AB40();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_190C5AF84;
  v17[3] = &unk_1E56C6718;
  id v18 = v5;
  id v14 = v5;
  sub_190C3C78C((uint64_t)v13, self, v17);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_personaUpdateCallbackHandler, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end