@interface MSConnection
+ (id)sharedConnection;
- (BOOL)dequeueAssetCollectionWithGUIDs:(id)a3 personID:(id)a4 outError:(id *)a5;
- (BOOL)enqueueAssetCollections:(id)a3 personID:(id)a4 outError:(id *)a5;
- (MSConnection)init;
- (id)_machErrorWithUnderlyingError:(id)a3;
- (id)pause;
- (id)serverSideConfigurationForPersonID:(id)a3;
- (void)_waitForMessageToBeSent;
- (void)abortActivitiesForPersonID:(id)a3;
- (void)checkForOutstandingActivities;
- (void)dealloc;
- (void)deleteAssetCollections:(id)a3 personID:(id)a4;
- (void)forgetPersonID:(id)a3;
- (void)handleSubscriptionPushForPersonID:(id)a3;
- (void)pollForSubscriptionUpdatesForPersonID:(id)a3;
- (void)refreshServerSideConfigurationForPersonID:(id)a3;
- (void)resetServerStateForPersonID:(id)a3;
- (void)resume:(id)a3;
@end

@implementation MSConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideConfigQueue, 0);
  objc_storeStrong((id *)&self->_serverSideConfig, 0);

  objc_storeStrong((id *)&self->_center, 0);
}

- (id)_machErrorWithUnderlyingError:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a3;
  v5 = MSMSLocalizedString(@"ERROR_MACH_FAILURE");
  v6 = [v3 MSErrorWithDomain:@"mstreamdErrorDomain" code:1000 description:v5 underlyingError:v4];

  return v6;
}

- (void)resume:(id)a3
{
}

- (id)pause
{
  v2 = [[MSClientSidePauseContext alloc] initWithServer:self->_center];

  return v2;
}

- (void)abortActivitiesForPersonID:(id)a3
{
  id v4 = a3;
  center = self->_center;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __43__MSConnection_abortActivitiesForPersonID___block_invoke;
  v11 = &unk_1E6CFC858;
  id v12 = v4;
  v13 = self;
  id v6 = v4;
  v7 = [(NSXPCConnection *)center remoteObjectProxyWithErrorHandler:&v8];
  objc_msgSend(v7, "abortAllActivityForPersonID:", v6, v8, v9, v10, v11);
  [(MSConnection *)self _waitForMessageToBeSent];
}

void __43__MSConnection_abortActivitiesForPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = [*(id *)(a1 + 40) _machErrorWithUnderlyingError:a2];
    id v6 = [v5 MSVerboseDescription];
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Can't abort activities for personID %@: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)resetServerStateForPersonID:(id)a3
{
  id v4 = a3;
  center = self->_center;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__MSConnection_resetServerStateForPersonID___block_invoke;
  v8[3] = &unk_1E6CFC880;
  id v9 = v4;
  id v6 = v4;
  int v7 = [(NSXPCConnection *)center remoteObjectProxyWithErrorHandler:v8];
  [v7 resetServerStateForPersonID:v6];
  [(MSConnection *)self _waitForMessageToBeSent];
}

void __44__MSConnection_resetServerStateForPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412546;
    uint64_t v6 = v4;
    __int16 v7 = 2114;
    uint64_t v8 = a2;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not reset server state for personID %@: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)refreshServerSideConfigurationForPersonID:(id)a3
{
  id v4 = a3;
  center = self->_center;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__MSConnection_refreshServerSideConfigurationForPersonID___block_invoke;
  v8[3] = &unk_1E6CFC880;
  id v9 = v4;
  id v6 = v4;
  __int16 v7 = [(NSXPCConnection *)center remoteObjectProxyWithErrorHandler:v8];
  [v7 refreshServerSideConfigurationForPersonID:v6];
  [(MSConnection *)self _waitForMessageToBeSent];
}

void __58__MSConnection_refreshServerSideConfigurationForPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412546;
    uint64_t v6 = v4;
    __int16 v7 = 2114;
    uint64_t v8 = a2;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not refresh server side configuration for personID %@: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)serverSideConfigurationForPersonID:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = [(NSMutableDictionary *)self->_serverSideConfig objectForKey:v4];
  int v5 = (void *)v23[5];
  if (!v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    center = self->_center;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__MSConnection_serverSideConfigurationForPersonID___block_invoke;
    v18[3] = &unk_1E6CFC8C8;
    id v8 = v4;
    id v19 = v8;
    v20 = self;
    uint64_t v9 = v6;
    v21 = v9;
    v10 = [(NSXPCConnection *)center remoteObjectProxyWithErrorHandler:v18];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__MSConnection_serverSideConfigurationForPersonID___block_invoke_78;
    v14[3] = &unk_1E6CFC8F0;
    v17 = &v22;
    v14[4] = self;
    id v15 = v8;
    uint64_t v11 = v9;
    v16 = v11;
    [v10 serverSideConfigurationForPersonID:v15 reply:v14];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

    int v5 = (void *)v23[5];
  }
  id v12 = v5;
  _Block_object_dispose(&v22, 8);

  return v12;
}

intptr_t __51__MSConnection_serverSideConfigurationForPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    dispatch_semaphore_t v6 = [*(id *)(a1 + 40) _machErrorWithUnderlyingError:a2];
    __int16 v7 = [v6 MSVerboseDescription];
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Can't retrieve server-side configuration for personID %@. Error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

intptr_t __51__MSConnection_serverSideConfigurationForPersonID___block_invoke_78(void *a1, void *a2)
{
  uint64_t v3 = [a2 objectForKey:@"retval"];
  uint64_t v4 = *(void *)(a1[7] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [*(id *)(a1[4] + 16) setValue:*(void *)(*(void *)(a1[7] + 8) + 40) forKey:a1[5]];
  dispatch_semaphore_t v6 = a1[6];

  return dispatch_semaphore_signal(v6);
}

- (void)forgetPersonID:(id)a3
{
  id v4 = a3;
  center = self->_center;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__MSConnection_forgetPersonID___block_invoke;
  v8[3] = &unk_1E6CFC880;
  id v9 = v4;
  id v6 = v4;
  __int16 v7 = [(NSXPCConnection *)center remoteObjectProxyWithErrorHandler:v8];
  [v7 forgetEverythingForPersonID:v6];
  [(MSConnection *)self _waitForMessageToBeSent];
}

void __31__MSConnection_forgetPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412546;
    uint64_t v6 = v4;
    __int16 v7 = 2114;
    uint64_t v8 = a2;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not send message to forget personID %@: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)handleSubscriptionPushForPersonID:(id)a3
{
  id v4 = a3;
  center = self->_center;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__MSConnection_handleSubscriptionPushForPersonID___block_invoke;
  v8[3] = &unk_1E6CFC880;
  id v9 = v4;
  id v6 = v4;
  __int16 v7 = [(NSXPCConnection *)center remoteObjectProxyWithErrorHandler:v8];
  [v7 pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:v6];
  [(MSConnection *)self _waitForMessageToBeSent];
}

void __50__MSConnection_handleSubscriptionPushForPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412546;
    uint64_t v6 = v4;
    __int16 v7 = 2114;
    uint64_t v8 = a2;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not handle subscription push for personID %@: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)checkForOutstandingActivities
{
  id v3 = [(NSXPCConnection *)self->_center remoteObjectProxyWithErrorHandler:&__block_literal_global_101];
  [v3 retryOutstandingActivities];
  [(MSConnection *)self _waitForMessageToBeSent];
}

void __45__MSConnection_checkForOutstandingActivities__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v3 = 138543362;
    uint64_t v4 = a2;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not checkForOutstandingActivities: %{public}@", (uint8_t *)&v3, 0xCu);
  }
}

- (void)pollForSubscriptionUpdatesForPersonID:(id)a3
{
  id v4 = a3;
  center = self->_center;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__MSConnection_pollForSubscriptionUpdatesForPersonID___block_invoke;
  v8[3] = &unk_1E6CFC880;
  id v9 = v4;
  id v6 = v4;
  __int16 v7 = [(NSXPCConnection *)center remoteObjectProxyWithErrorHandler:v8];
  [v7 pollForSubscriptionUpdatesForPersonID:v6];
  [(MSConnection *)self _waitForMessageToBeSent];
}

void __54__MSConnection_pollForSubscriptionUpdatesForPersonID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412546;
    uint64_t v6 = v4;
    __int16 v7 = 2114;
    uint64_t v8 = a2;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not poll for subscription updates for personID %@: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)deleteAssetCollections:(id)a3 personID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  center = self->_center;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __48__MSConnection_deleteAssetCollections_personID___block_invoke;
  id v15 = &unk_1E6CFC858;
  id v16 = v6;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [(NSXPCConnection *)center remoteObjectProxyWithErrorHandler:&v12];
  objc_msgSend(v11, "deleteAssetCollections:personID:", v10, v9, v12, v13, v14, v15);
  [(MSConnection *)self _waitForMessageToBeSent];
}

void __48__MSConnection_deleteAssetCollections_personID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138543874;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not delete asset collections %{public}@ for personID %@: %{public}@", (uint8_t *)&v6, 0x20u);
  }
}

- (BOOL)dequeueAssetCollectionWithGUIDs:(id)a3 personID:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  center = self->_center;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__MSConnection_dequeueAssetCollectionWithGUIDs_personID_outError___block_invoke;
  v26[3] = &unk_1E6CFC808;
  v30 = &v31;
  v26[4] = self;
  id v12 = v8;
  id v27 = v12;
  id v13 = v9;
  id v28 = v13;
  v14 = v10;
  v29 = v14;
  id v15 = [(NSXPCConnection *)center remoteObjectProxyWithErrorHandler:v26];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __66__MSConnection_dequeueAssetCollectionWithGUIDs_personID_outError___block_invoke_77;
  uint64_t v22 = &unk_1E6CFC830;
  uint64_t v24 = &v31;
  v25 = &v37;
  id v16 = v14;
  v23 = v16;
  [v15 dequeueAssetCollectionWithGUIDs:v12 personID:v13 reply:&v19];
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  if (a5 && v32[5])
  {
    -[MSConnection _machErrorWithUnderlyingError:](self, "_machErrorWithUnderlyingError:", v19, v20, v21, v22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v17 = *((unsigned char *)v38 + 24);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v17;
}

intptr_t __66__MSConnection_dequeueAssetCollectionWithGUIDs_personID_outError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _machErrorWithUnderlyingError:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      int v10 = 138543874;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not dequeue asset collections %{public}@ for personID %@: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

intptr_t __66__MSConnection_dequeueAssetCollectionWithGUIDs_personID_outError___block_invoke_77(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:@"error"];
  uint64_t v5 = *(void *)(a1[5] + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [v3 objectForKey:@"retval"];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v7 BOOLValue];
  uint64_t v8 = a1[4];

  return dispatch_semaphore_signal(v8);
}

- (BOOL)enqueueAssetCollections:(id)a3 personID:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  center = self->_center;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __58__MSConnection_enqueueAssetCollections_personID_outError___block_invoke;
  v26[3] = &unk_1E6CFC808;
  v30 = &v31;
  v26[4] = self;
  id v12 = v8;
  id v27 = v12;
  id v13 = v9;
  id v28 = v13;
  __int16 v14 = v10;
  v29 = v14;
  uint64_t v15 = [(NSXPCConnection *)center remoteObjectProxyWithErrorHandler:v26];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __58__MSConnection_enqueueAssetCollections_personID_outError___block_invoke_75;
  uint64_t v22 = &unk_1E6CFC830;
  uint64_t v24 = &v31;
  v25 = &v37;
  uint64_t v16 = v14;
  v23 = v16;
  [v15 enqueueAssetCollections:v12 personID:v13 reply:&v19];
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  if (a5 && v32[5])
  {
    -[MSConnection _machErrorWithUnderlyingError:](self, "_machErrorWithUnderlyingError:", v19, v20, v21, v22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v17 = *((unsigned char *)v38 + 24);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v17;
}

intptr_t __58__MSConnection_enqueueAssetCollections_personID_outError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _machErrorWithUnderlyingError:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      int v10 = 138543874;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not enqueue asset collections %{public}@ for personID %@: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

intptr_t __58__MSConnection_enqueueAssetCollections_personID_outError___block_invoke_75(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:@"error"];
  uint64_t v5 = *(void *)(a1[5] + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [v3 objectForKey:@"retval"];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v7 BOOLValue];
  uint64_t v8 = a1[4];

  return dispatch_semaphore_signal(v8);
}

- (void)dealloc
{
  notify_cancel(self->_serverSideConfigNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)MSConnection;
  [(MSConnection *)&v3 dealloc];
}

- (MSConnection)init
{
  v14.receiver = self;
  v14.super_class = (Class)MSConnection;
  v2 = [(MSConnection *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mediastream.mstreamd" options:0];
    center = v2->_center;
    v2->_center = (NSXPCConnection *)v3;

    uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F394B3F0];
    [(NSXPCConnection *)v2->_center setRemoteObjectInterface:v5];
    [(NSXPCConnection *)v2->_center resume];
    int v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    serverSideConfig = v2->_serverSideConfig;
    v2->_serverSideConfig = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaStream.MSConnection._serverSideConfigQueue", 0);
    serverSideConfigQueue = v2->_serverSideConfigQueue;
    v2->_serverSideConfigQueue = (OS_dispatch_queue *)v8;

    int v10 = v2->_serverSideConfigQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __20__MSConnection_init__block_invoke;
    handler[3] = &unk_1E6CFC9D8;
    uint64_t v13 = v2;
    notify_register_dispatch("MSServerSideConfigurationDidChangeNotification", &v2->_serverSideConfigNotificationToken, v10, handler);
  }
  return v2;
}

void __20__MSConnection_init__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Sending local notification that server-side config has changed.", v3, 2u);
  }
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MSCServerSideConfigurationDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_waitForMessageToBeSent
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  center = self->_center;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__MSConnection__waitForMessageToBeSent__block_invoke;
  v6[3] = &unk_1E6CFCBF0;
  dispatch_semaphore_t v7 = v3;
  uint64_t v5 = v3;
  [(NSXPCConnection *)center addBarrierBlock:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __39__MSConnection__waitForMessageToBeSent__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)sharedConnection
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MSConnection_sharedConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConnection_once != -1) {
    dispatch_once(&sharedConnection_once, block);
  }
  v2 = (void *)sharedConnection_conn;

  return v2;
}

uint64_t __32__MSConnection_sharedConnection__block_invoke(uint64_t a1)
{
  if (MSMediaStreamInitialize_once != -1) {
    dispatch_once(&MSMediaStreamInitialize_once, &__block_literal_global_231);
  }
  v2 = +[MSMSPlatform thePlatform];
  MSCoreMediaStreamInitialize();

  sharedConnection_conn = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

@end