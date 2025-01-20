@interface RMEnrollmentController
+ (NSURL)userDefaultsEnrollmentURL;
+ (id)synchronousEnrollmentControllerForManagementEnrollmentType:(int64_t)a3 scope:(int64_t)a4;
- (BOOL)_isDeviceOrSupervisedEnrollment;
- (BOOL)isSynchronous;
- (RMEnrollmentController)initWithEnrollmentType:(int64_t)a3 scope:(int64_t)a4;
- (id)_agentConnection;
- (id)_agentProxyWithErrorHandler:(id)a3;
- (id)_daemonConnection;
- (id)_daemonProxyWithErrorHandler:(id)a3;
- (id)_scopedProxyWithErrorHandler:(id)a3;
- (int64_t)enrollmentType;
- (int64_t)scope;
- (void)_discoverEnrollmentURLForDomain:(id)a3 port:(id)a4 completionHandler:(id)a5;
- (void)_enrollmentURLFromWellKnownURL:(id)a3 completionHandler:(id)a4;
- (void)_unenrollIdentifier:(id)a3 completionHandler:(id)a4;
- (void)deviceChannelEnrollmentExistsWithCompletionHandler:(id)a3;
- (void)discoverEnrollmentURLForUserIdentifier:(id)a3 completionHandler:(id)a4;
- (void)enrollDeviceChannelWithURI:(id)a3 completionHandler:(id)a4;
- (void)enrollUserChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4;
- (void)enrollViaMDMWithEnrollmentType:(int64_t)a3 uri:(id)a4 accountIdentifier:(id)a5 personaIdentifier:(id)a6 completionHandler:(id)a7;
- (void)managementChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4;
- (void)managementChannelWithEnrollmentURL:(id)a3 completionHandler:(id)a4;
- (void)setSynchronous:(BOOL)a3;
- (void)syncWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)unenrollDeviceChannelWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)unenrollUserChannelWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)unenrollViaMDMWithEnrollmentType:(int64_t)a3 identifier:(id)a4 completionHandler:(id)a5;
- (void)updateWithIdentifier:(id)a3 pushMessage:(id)a4 completionHandler:(id)a5;
- (void)updateWithIdentifier:(id)a3 tokensResponse:(id)a4 completionHandler:(id)a5;
@end

@implementation RMEnrollmentController

+ (NSURL)userDefaultsEnrollmentURL
{
  return +[RMFeatureOverrides bootstrapURL];
}

+ (id)synchronousEnrollmentControllerForManagementEnrollmentType:(int64_t)a3 scope:(int64_t)a4
{
  v4 = [[RMEnrollmentController alloc] initWithEnrollmentType:a3 scope:a4];
  [(RMEnrollmentController *)v4 setSynchronous:1];

  return v4;
}

- (RMEnrollmentController)initWithEnrollmentType:(int64_t)a3 scope:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)RMEnrollmentController;
  v6 = [(RMEnrollmentController *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    connectionByServiceName = v6->_connectionByServiceName;
    v6->_connectionByServiceName = (NSMutableDictionary *)v7;

    v6->_enrollmentType = a3;
    v6->_scope = a4;
  }
  return v6;
}

- (void)enrollDeviceChannelWithURI:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v6;
    _os_log_impl(&dword_224784000, v8, OS_LOG_TYPE_DEFAULT, "Starting device channel enrollment for %{public}@", buf, 0xCu);
  }

  if ([(RMEnrollmentController *)self _isDeviceOrSupervisedEnrollment])
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke;
    v17[3] = &unk_2646DD040;
    id v9 = v6;
    id v18 = v9;
    id v10 = v7;
    id v19 = v10;
    v11 = [(RMEnrollmentController *)self _scopedProxyWithErrorHandler:v17];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke_14;
    v14[3] = &unk_2646DD068;
    id v15 = v9;
    id v16 = v10;
    [v11 enrollDeviceChannelWithURI:v15 completionHandler:v14];

    v12 = v18;
  }
  else
  {
    v12 = +[RMErrorUtilities createInternalError];
    v13 = +[RMLog enrollmentController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RMEnrollmentController enrollDeviceChannelWithURI:completionHandler:]();
    }

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[RMLog enrollmentController];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke_14_cold_1();
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_224784000, v8, OS_LOG_TYPE_DEFAULT, "Device channel enrollment for %{public}@ succeeded with identifier: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

- (void)enrollUserChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v6;
    _os_log_impl(&dword_224784000, v8, OS_LOG_TYPE_DEFAULT, "Starting user channel enrollment for account %{public}@", buf, 0xCu);
  }

  if ([(RMEnrollmentController *)self enrollmentType])
  {
    id v9 = +[RMErrorUtilities createInternalError];
    uint64_t v10 = +[RMLog enrollmentController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[RMEnrollmentController enrollUserChannelWithAccountIdentifier:completionHandler:]();
    }

    v7[2](v7, 0, v9);
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke;
    v17[3] = &unk_2646DD040;
    id v11 = v6;
    id v18 = v11;
    uint64_t v12 = v7;
    id v19 = v12;
    __int16 v13 = [(RMEnrollmentController *)self _scopedProxyWithErrorHandler:v17];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke_16;
    v14[3] = &unk_2646DD068;
    id v15 = v11;
    id v16 = v12;
    [v13 enrollUserChannelWithAccountIdentifier:v15 completionHandler:v14];

    id v9 = v18;
  }
}

void __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[RMLog enrollmentController];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke_16_cold_1();
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_224784000, v8, OS_LOG_TYPE_DEFAULT, "User channel enrollment for account %{public}@ succeeded with channel identifier: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

- (void)enrollViaMDMWithEnrollmentType:(int64_t)a3 uri:(id)a4 accountIdentifier:(id)a5 personaIdentifier:(id)a6 completionHandler:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v12;
    _os_log_impl(&dword_224784000, v16, OS_LOG_TYPE_DEFAULT, "Starting DDM enrollment for %{public}@", buf, 0xCu);
  }

  if ([(RMEnrollmentController *)self enrollmentType] == a3)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke;
    v25[3] = &unk_2646DD040;
    id v17 = v12;
    id v26 = v17;
    id v18 = v15;
    id v27 = v18;
    id v19 = [(RMEnrollmentController *)self _scopedProxyWithErrorHandler:v25];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke_17;
    v22[3] = &unk_2646DD068;
    id v23 = v17;
    id v24 = v18;
    [v19 enrollViaMDMWithEnrollmentType:a3 uri:v23 accountIdentifier:v13 personaIdentifier:v14 completionHandler:v22];

    v20 = v26;
  }
  else
  {
    v20 = +[RMErrorUtilities createInternalError];
    id v21 = +[RMLog enrollmentController];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[RMEnrollmentController enrollViaMDMWithEnrollmentType:uri:accountIdentifier:personaIdentifier:completionHandler:]();
    }

    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v20);
  }
}

void __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[RMLog enrollmentController];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke_17_cold_1();
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_224784000, v8, OS_LOG_TYPE_DEFAULT, "DDM channel enrollment for %{public}@ succeeded with identifier: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

- (void)unenrollDeviceChannelWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  v8 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl(&dword_224784000, v8, OS_LOG_TYPE_DEFAULT, "Unenrolling device channel", v11, 2u);
  }

  if ([(RMEnrollmentController *)self _isDeviceOrSupervisedEnrollment])
  {
    [(RMEnrollmentController *)self _unenrollIdentifier:v6 completionHandler:v7];
  }
  else
  {
    id v9 = +[RMErrorUtilities createInternalError];
    uint64_t v10 = +[RMLog enrollmentController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[RMEnrollmentController enrollDeviceChannelWithURI:completionHandler:]();
    }

    v7[2](v7, v9);
  }
}

- (void)unenrollUserChannelWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  v8 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl(&dword_224784000, v8, OS_LOG_TYPE_DEFAULT, "Unenrolling user channel", v11, 2u);
  }

  if ([(RMEnrollmentController *)self enrollmentType])
  {
    id v9 = +[RMErrorUtilities createInternalError];
    uint64_t v10 = +[RMLog enrollmentController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[RMEnrollmentController enrollUserChannelWithAccountIdentifier:completionHandler:]();
    }

    v7[2](v7, v9);
  }
  else
  {
    [(RMEnrollmentController *)self _unenrollIdentifier:v6 completionHandler:v7];
  }
}

- (void)unenrollViaMDMWithEnrollmentType:(int64_t)a3 identifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  uint64_t v10 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v13 = 0;
    _os_log_impl(&dword_224784000, v10, OS_LOG_TYPE_DEFAULT, "Unenrolling DDM channel", v13, 2u);
  }

  if ([(RMEnrollmentController *)self enrollmentType] == a3)
  {
    [(RMEnrollmentController *)self _unenrollIdentifier:v8 completionHandler:v9];
  }
  else
  {
    int v11 = +[RMErrorUtilities createInternalError];
    uint64_t v12 = +[RMLog enrollmentController];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RMEnrollmentController enrollViaMDMWithEnrollmentType:uri:accountIdentifier:personaIdentifier:completionHandler:]();
    }

    v9[2](v9, v11);
  }
}

- (void)_unenrollIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_2646DD040;
  id v8 = v6;
  id v17 = v8;
  id v9 = v7;
  id v18 = v9;
  uint64_t v10 = [(RMEnrollmentController *)self _scopedProxyWithErrorHandler:v16];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke_18;
  v13[3] = &unk_2646DD090;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 unenrollWithIdentifier:v12 completionHandler:v13];
}

void __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[RMLog enrollmentController];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke_18_cold_1();
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_224784000, v6, OS_LOG_TYPE_DEFAULT, "Unenrolled from %{public}@", (uint8_t *)&v9, 0xCu);
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

- (void)deviceChannelEnrollmentExistsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224784000, v5, OS_LOG_TYPE_DEFAULT, "Checking device channel enrollment", buf, 2u);
  }

  if ([(RMEnrollmentController *)self _isDeviceOrSupervisedEnrollment])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke;
    v12[3] = &unk_2646DD0B8;
    id v6 = v4;
    id v13 = v6;
    id v7 = [(RMEnrollmentController *)self _scopedProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke_20;
    v10[3] = &unk_2646DD0E0;
    id v11 = v6;
    [v7 deviceChannelEnrollmentExistsWithCompletionHandler:v10];

    uint64_t v8 = v13;
  }
  else
  {
    uint64_t v8 = +[RMErrorUtilities createInternalError];
    int v9 = +[RMLog enrollmentController];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RMEnrollmentController enrollDeviceChannelWithURI:completionHandler:]();
    }

    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[RMLog enrollmentController];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke_20_cold_1();
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [NSNumber numberWithBool:a2];
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_224784000, v7, OS_LOG_TYPE_DEFAULT, "Device channel enrollment check result: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

- (void)syncWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224784000, v8, OS_LOG_TYPE_DEFAULT, "Syncing management channel", buf, 2u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_2646DD0B8;
  id v9 = v6;
  id v15 = v9;
  int v10 = [(RMEnrollmentController *)self _scopedProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke_22;
  v12[3] = &unk_2646DD0B8;
  id v13 = v9;
  id v11 = v9;
  [v10 syncWithIdentifier:v7 completionHandler:v12];
}

void __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RMLog enrollmentController];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke_22_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_224784000, v5, OS_LOG_TYPE_DEFAULT, "Synced management channel", v7, 2u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)updateWithIdentifier:(id)a3 pushMessage:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224784000, v11, OS_LOG_TYPE_DEFAULT, "Updating management channel with push message", buf, 2u);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke;
  v17[3] = &unk_2646DD0B8;
  id v12 = v8;
  id v18 = v12;
  id v13 = [(RMEnrollmentController *)self _scopedProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke_23;
  v15[3] = &unk_2646DD0B8;
  id v16 = v12;
  id v14 = v12;
  [v13 updateWithIdentifier:v10 pushMessage:v9 completionHandler:v15];
}

void __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RMLog enrollmentController];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke_23_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_224784000, v5, OS_LOG_TYPE_DEFAULT, "Updated management channel with push message", v7, 2u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)updateWithIdentifier:(id)a3 tokensResponse:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224784000, v11, OS_LOG_TYPE_DEFAULT, "Updating management channel with tokens response", buf, 2u);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke;
  v17[3] = &unk_2646DD0B8;
  id v12 = v8;
  id v18 = v12;
  id v13 = [(RMEnrollmentController *)self _scopedProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke_24;
  v15[3] = &unk_2646DD0B8;
  id v16 = v12;
  id v14 = v12;
  [v13 updateWithIdentifier:v10 tokensResponse:v9 completionHandler:v15];
}

void __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RMLog enrollmentController];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke_24_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_224784000, v5, OS_LOG_TYPE_DEFAULT, "Updated management channel with tokens response", v7, 2u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)managementChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224784000, v8, OS_LOG_TYPE_DEFAULT, "Finding management channel via account identifier", buf, 2u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_2646DD0B8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(RMEnrollmentController *)self _scopedProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_25;
  v12[3] = &unk_2646DD108;
  id v13 = v9;
  id v11 = v9;
  [v10 managementChannelWithAccountIdentifier:v7 completionHandler:v12];
}

void __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = +[RMLog enrollmentController];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v8) {
        goto LABEL_10;
      }
      int v12 = 138543362;
      id v13 = v5;
      id v9 = "Found management channel: %{public}@";
      id v10 = v7;
      uint32_t v11 = 12;
    }
    else
    {
      if (!v8) {
        goto LABEL_10;
      }
      LOWORD(v12) = 0;
      id v9 = "Did not find management channel";
      id v10 = v7;
      uint32_t v11 = 2;
    }
    _os_log_impl(&dword_224784000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    goto LABEL_10;
  }
  id v7 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_25_cold_1();
  }
LABEL_10:

  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5);
}

- (void)managementChannelWithEnrollmentURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224784000, v8, OS_LOG_TYPE_DEFAULT, "Finding management channel via enrollment URL", buf, 2u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__RMEnrollmentController_managementChannelWithEnrollmentURL_completionHandler___block_invoke;
  v14[3] = &unk_2646DD0B8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(RMEnrollmentController *)self _scopedProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__RMEnrollmentController_managementChannelWithEnrollmentURL_completionHandler___block_invoke_27;
  v12[3] = &unk_2646DD108;
  id v13 = v9;
  id v11 = v9;
  [v10 managementChannelWithEnrollmentURL:v7 completionHandler:v12];
}

void __79__RMEnrollmentController_managementChannelWithEnrollmentURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__RMEnrollmentController_managementChannelWithEnrollmentURL_completionHandler___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = +[RMLog enrollmentController];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v8) {
        goto LABEL_10;
      }
      int v12 = 138543362;
      id v13 = v5;
      id v9 = "Found management channel: %{public}@";
      id v10 = v7;
      uint32_t v11 = 12;
    }
    else
    {
      if (!v8) {
        goto LABEL_10;
      }
      LOWORD(v12) = 0;
      id v9 = "Did not find management channel";
      id v10 = v7;
      uint32_t v11 = 2;
    }
    _os_log_impl(&dword_224784000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    goto LABEL_10;
  }
  id v7 = +[RMLog enrollmentController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_25_cold_1();
  }
LABEL_10:

  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5);
}

- (id)_scopedProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  if ([(RMEnrollmentController *)self scope] == 1) {
    [(RMEnrollmentController *)self _daemonProxyWithErrorHandler:v4];
  }
  else {
  id v5 = [(RMEnrollmentController *)self _agentProxyWithErrorHandler:v4];
  }

  return v5;
}

- (id)_daemonProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RMEnrollmentController *)self _daemonConnection];
  if ([(RMEnrollmentController *)self isSynchronous]) {
    [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else {
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];
  }

  return v6;
}

- (id)_daemonConnection
{
  id v3 = self->_connectionByServiceName;
  objc_sync_enter(v3);
  id v4 = [(NSMutableDictionary *)self->_connectionByServiceName objectForKeyedSubscript:@"com.apple.remotemanagementd"];
  if (!v4)
  {
    id v4 = +[RMXPCProxy newDaemonConnection];
    [(NSMutableDictionary *)self->_connectionByServiceName setObject:v4 forKeyedSubscript:@"com.apple.remotemanagementd"];
    [v4 resume];
  }
  objc_sync_exit(v3);

  return v4;
}

- (id)_agentProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RMEnrollmentController *)self _agentConnection];
  if ([(RMEnrollmentController *)self isSynchronous]) {
    [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else {
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];
  }

  return v6;
}

- (id)_agentConnection
{
  id v3 = self->_connectionByServiceName;
  objc_sync_enter(v3);
  id v4 = [(NSMutableDictionary *)self->_connectionByServiceName objectForKeyedSubscript:@"com.apple.RemoteManagementAgent"];
  if (!v4)
  {
    id v4 = +[RMXPCProxy newAgentConnection];
    [(NSMutableDictionary *)self->_connectionByServiceName setObject:v4 forKeyedSubscript:@"com.apple.RemoteManagementAgent"];
    [v4 resume];
  }
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)_isDeviceOrSupervisedEnrollment
{
  int64_t v3 = [(RMEnrollmentController *)self enrollmentType];
  if (v3 != 1) {
    LOBYTE(v3) = [(RMEnrollmentController *)self enrollmentType] == 3;
  }
  return v3;
}

- (void)discoverEnrollmentURLForUserIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 componentsSeparatedByString:@"@"];
  if ([v8 count] == 2)
  {
    id v9 = [v8 objectAtIndexedSubscript:1];
    id v10 = [v9 componentsSeparatedByString:@":"];
    if ([v10 count] == 2)
    {
      uint64_t v11 = [v10 objectAtIndexedSubscript:0];

      int v12 = [v10 objectAtIndexedSubscript:1];
      uint64_t v13 = [v12 integerValue];

      if (v13) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 8443;
      }
      id v9 = (void *)v11;
    }
    else
    {
      uint64_t v14 = 8443;
    }
    id v16 = [NSNumber numberWithInteger:v14];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __83__RMEnrollmentController_discoverEnrollmentURLForUserIdentifier_completionHandler___block_invoke;
    v17[3] = &unk_2646DD130;
    id v18 = v7;
    [(RMEnrollmentController *)self _discoverEnrollmentURLForDomain:v9 port:v16 completionHandler:v17];
  }
  else
  {
    id v15 = +[RMLog enrollmentController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RMEnrollmentController discoverEnrollmentURLForUserIdentifier:completionHandler:]();
    }

    id v9 = +[RMErrorUtilities createServiceDiscoveryInvalidUserIdentifierWithReason:v6];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

uint64_t __83__RMEnrollmentController_discoverEnrollmentURLForUserIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_discoverEnrollmentURLForDomain:(id)a3 port:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = (id)objc_opt_new();
  [v12 setScheme:@"https"];
  [v12 setHost:v10];

  [v12 setPort:v9];
  [v12 setPath:@"/.well-known/com.apple.remotemanagement"];
  uint64_t v11 = [v12 URL];
  [(RMEnrollmentController *)self _enrollmentURLFromWellKnownURL:v11 completionHandler:v8];
}

- (void)_enrollmentURLFromWellKnownURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F08BF8] sharedSession];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke;
  uint64_t v14 = &unk_2646DD158;
  id v15 = v5;
  id v16 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = [v7 dataTaskWithURL:v9 completionHandler:&v11];

  objc_msgSend(v10, "resume", v11, v12, v13, v14);
}

void __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = +[RMLog enrollmentController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_4();
    }

    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = [v9 localizedDescription];
    uint64_t v13 = +[RMErrorUtilities createServiceDiscoveryWellKnownFailedWithReason:v12];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v13);
  }
  else if (v7 && v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v25 = 0;
    uint64_t v13 = [MEMORY[0x263F636D0] loadData:v7 serializationType:1 error:&v25];
    id v12 = v25;
    if (v13)
    {
      uint64_t v14 = [v13 responseServers];
      if ([v14 count])
      {
        id v15 = [v14 objectAtIndexedSubscript:0];
        id v16 = [v15 responseBaseURL];

        uint64_t v17 = *(void *)(a1 + 40);
        id v18 = [NSURL URLWithString:v16];
        (*(void (**)(uint64_t, void *, void))(v17 + 16))(v17, v18, 0);
      }
      else
      {
        id v23 = +[RMLog enrollmentController];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_3();
        }

        uint64_t v24 = *(void *)(a1 + 40);
        id v16 = [NSString stringWithFormat:@"Invalid well-known servers response for %@: no servers: %@", *(void *)(a1 + 32), v7];
        id v18 = +[RMErrorUtilities createServiceDiscoveryWellKnownInvalidWithReason:v16];
        (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v18);
      }
    }
    else
    {
      id v21 = +[RMLog enrollmentController];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_2();
      }

      uint64_t v22 = *(void *)(a1 + 40);
      uint64_t v14 = [NSString stringWithFormat:@"Invalid well-known response for %@: JSON error: %@", *(void *)(a1 + 32), v12];
      id v16 = +[RMErrorUtilities createServiceDiscoveryWellKnownInvalidWithReason:v14];
      (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v16);
    }
  }
  else
  {
    id v19 = +[RMLog enrollmentController];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_1();
    }

    uint64_t v20 = *(void *)(a1 + 40);
    id v12 = [NSString stringWithFormat:@"Invalid well-known response for %@: %@", *(void *)(a1 + 32), v8];
    uint64_t v13 = +[RMErrorUtilities createServiceDiscoveryWellKnownInvalidWithReason:v12];
    (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v13);
  }
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (int64_t)enrollmentType
{
  return self->_enrollmentType;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
}

- (void)enrollDeviceChannelWithURI:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_224784000, v0, v1, "Enrollment controller not initialized for device channel", v2, v3, v4, v5, v6);
}

void __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Failed XPC connection while starting device channel enrollment for %{public}@: %{public}@");
}

void __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke_14_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Failed device channel enrollment for %{public}@: %{public}@");
}

- (void)enrollUserChannelWithAccountIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_224784000, v0, v1, "Enrollment controller not initialized for user channel", v2, v3, v4, v5, v6);
}

void __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Failed XPC connection while starting user channel enrollment for account %{public}@: %{public}@");
}

void __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Failed user channel enrollment for account %{public}@: %{public}@");
}

- (void)enrollViaMDMWithEnrollmentType:uri:accountIdentifier:personaIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_224784000, v0, v1, "Enrollment controller not initialized for specified enrollment type", v2, v3, v4, v5, v6);
}

void __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Failed XPC connection while starting DDM channel enrollment for %{public}@: %{public}@");
}

void __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke_17_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Failed DDM channel enrollment for %{public}@: %{public}@");
}

void __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Failed XPC connection while unenrolling from %{public}@: %{public}@");
}

void __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke_18_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Failed to unenroll from %{public}@: %{public}@");
}

void __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed XPC connection while checking device channel enrollment: %{public}@", v2, v3, v4, v5, v6);
}

void __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed device channel enrollment check: %{public}@", v2, v3, v4, v5, v6);
}

void __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed XPC connection while sync'ing: %{public}@", v2, v3, v4, v5, v6);
}

void __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed to sync management channel: %{public}@", v2, v3, v4, v5, v6);
}

void __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed XPC connection while updating with push message: %{public}@", v2, v3, v4, v5, v6);
}

void __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke_23_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed to update management channel with push message: %{public}@", v2, v3, v4, v5, v6);
}

void __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed XPC connection while updating with tokens response: %{public}@", v2, v3, v4, v5, v6);
}

void __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed to update management channel with tokens response: %{public}@", v2, v3, v4, v5, v6);
}

void __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed XPC connection while finding management channel: %{public}@", v2, v3, v4, v5, v6);
}

void __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_25_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed to find management channel: %{public}@", v2, v3, v4, v5, v6);
}

- (void)discoverEnrollmentURLForUserIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "User identifier is wrong format for discovery: %{public}@", v2, v3, v4, v5, v6);
}

void __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Invalid well-known response for %{public}@: %{public}@");
}

void __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Invalid well-known response for %{public}@: JSON error: %{public}@");
}

void __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Invalid well-known servers response for %{public}@: no servers: %{public}@");
}

void __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Well-known request for %{public}@ failed: %{public}@");
}

@end