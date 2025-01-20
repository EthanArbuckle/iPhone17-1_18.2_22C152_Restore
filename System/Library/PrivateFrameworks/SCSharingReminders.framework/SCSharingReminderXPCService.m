@interface SCSharingReminderXPCService
+ (id)tasks;
- (SCSharingReminderManager)sharingReminderManager;
- (SCSharingReminderXPCClient)serviceClient;
- (SCSharingReminderXPCService)init;
- (SCSharingReminderXPCService)initWithClient:(id)a3;
- (id)interestedEvents;
- (void)fetchStatusWithCompletion:(id)a3;
- (void)handleSignals:(id)a3 completion:(id)a4;
- (void)handleXPCEventWithName:(id)a3;
- (void)postWifiSyncNotificationWithCompletion:(id)a3;
- (void)rejectRequest:(id)a3 withCompletion:(id)a4;
- (void)resetFeatureWithCompletion:(id)a3;
- (void)setReminderDelays:(id)a3 completion:(id)a4;
- (void)setServiceClient:(id)a3;
- (void)setSharingReminderManager:(id)a3;
- (void)userOpenedSafetyCheckWithCompletion:(id)a3;
@end

@implementation SCSharingReminderXPCService

- (SCSharingReminderXPCService)init
{
  v3 = objc_alloc_init(SCSharingReminderXPCClient);
  v4 = [(SCSharingReminderXPCService *)self initWithClient:v3];

  return v4;
}

- (SCSharingReminderXPCService)initWithClient:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCSharingReminderXPCService;
  v5 = [(SCSharingReminderXPCService *)&v8 init];
  if (v5)
  {
    v6 = objc_alloc_init(SCSharingReminderManager);
    [(SCSharingReminderXPCService *)v5 setSharingReminderManager:v6];

    [(SCSharingReminderXPCService *)v5 setServiceClient:v4];
  }

  return v5;
}

+ (id)tasks
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(SCSharingReminderMaintenanceTask);
  v6[0] = v2;
  v3 = objc_alloc_init(SCSharingReminderDeliveryTask);
  v6[1] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)userOpenedSafetyCheckWithCompletion:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(SCSharingReminderXPCService *)self serviceClient];
  if (v4
    && (v5 = (void *)v4,
        [(SCSharingReminderXPCService *)self serviceClient],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 hasAccess],
        v6,
        v5,
        v7))
  {
    objc_super v8 = [(SCSharingReminderXPCService *)self sharingReminderManager];
    [v8 userOpenedSafetyCheckWithCompletion:v9];
  }
  else
  {
    [(SCSharingReminderXPCService *)self rejectRequest:@"userOpenedSafetyCheck" withCompletion:v9];
  }
}

- (void)handleSignals:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(SCSharingReminderXPCService *)self serviceClient];
  if (v7
    && (objc_super v8 = (void *)v7,
        [(SCSharingReminderXPCService *)self serviceClient],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 hasAccess],
        v9,
        v8,
        v10))
  {
    v11 = [(SCSharingReminderXPCService *)self sharingReminderManager];
    [v11 handleSignals:v12 completion:v6];
  }
  else
  {
    [(SCSharingReminderXPCService *)self rejectRequest:@"handleSignals" withCompletion:v6];
  }
}

- (void)fetchStatusWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SCSharingReminderXPCService *)self serviceClient];
  if (v5
    && (id v6 = (void *)v5,
        [(SCSharingReminderXPCService *)self serviceClient],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 hasFeatureAccess],
        v7,
        v6,
        v8))
  {
    id v9 = [(SCSharingReminderXPCService *)self sharingReminderManager];
    [v9 fetchStatusWithCompletion:v4];
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__SCSharingReminderXPCService_fetchStatusWithCompletion___block_invoke;
    v10[3] = &unk_265496FC8;
    id v11 = v4;
    [(SCSharingReminderXPCService *)self rejectRequest:@"fetchStatus" withCompletion:v10];
  }
}

void __57__SCSharingReminderXPCService_fetchStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = *(void *)(a1 + 32);
  char v13 = 0;
  memset(v12, 0, sizeof(v12));
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  (*(void (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, v12, v6, v7, v8, v9, v10, v11);
}

- (void)postWifiSyncNotificationWithCompletion:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(SCSharingReminderXPCService *)self serviceClient];
  if (v4
    && (uint64_t v5 = (void *)v4,
        [(SCSharingReminderXPCService *)self serviceClient],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 hasFeatureAccess],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [(SCSharingReminderXPCService *)self sharingReminderManager];
    [v8 postWifiSyncNotificationWithCompletion:v9];
  }
  else
  {
    [(SCSharingReminderXPCService *)self rejectRequest:@"postWifiSyncNotification" withCompletion:v9];
  }
}

- (void)resetFeatureWithCompletion:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(SCSharingReminderXPCService *)self serviceClient];
  if (v4
    && (uint64_t v5 = (void *)v4,
        [(SCSharingReminderXPCService *)self serviceClient],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 hasFeatureAccess],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [(SCSharingReminderXPCService *)self sharingReminderManager];
    [v8 resetFeatureWithCompletion:v9];
  }
  else
  {
    [(SCSharingReminderXPCService *)self rejectRequest:@"resetFeatureWithCompletion" withCompletion:v9];
  }
}

- (void)setReminderDelays:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(SCSharingReminderXPCService *)self serviceClient];
  if (v7
    && (uint64_t v8 = (void *)v7,
        [(SCSharingReminderXPCService *)self serviceClient],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 hasFeatureAccess],
        v9,
        v8,
        v10))
  {
    uint64_t v11 = [(SCSharingReminderXPCService *)self sharingReminderManager];
    [v11 setReminderDelays:v12 completion:v6];
  }
  else
  {
    [(SCSharingReminderXPCService *)self rejectRequest:@"setReminderDelays" withCompletion:v6];
  }
}

- (void)rejectRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = [(SCSharingReminderXPCService *)self serviceClient];

  id v9 = SCLogger();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v10) {
      -[SCSharingReminderXPCService rejectRequest:withCompletion:]((uint64_t)v6, self, v9);
    }
  }
  else if (v10)
  {
    -[SCSharingReminderXPCService rejectRequest:withCompletion:]((uint64_t)v6, v9);
  }

  uint64_t v11 = +[SCDaemonError errorWithCode:5];
  v7[2](v7, 0, v11);
}

- (id)interestedEvents
{
  return &unk_270903170;
}

- (void)handleXPCEventWithName:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SCSharingReminderXPCService *)self interestedEvents];
  int v6 = [v5 containsObject:v4];

  uint64_t v7 = SCLogger();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_25B654000, v8, OS_LOG_TYPE_INFO, "\"Handling event with name: %@\"", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v8 = [(SCSharingReminderXPCService *)self sharingReminderManager];
    [v8 handleNotificationEventWithName:v4];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[SCSharingReminderXPCService handleXPCEventWithName:]((uint64_t)v4, v8);
  }
}

- (SCSharingReminderManager)sharingReminderManager
{
  return self->_sharingReminderManager;
}

- (void)setSharingReminderManager:(id)a3
{
}

- (SCSharingReminderXPCClient)serviceClient
{
  return self->_serviceClient;
}

- (void)setServiceClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClient, 0);
  objc_storeStrong((id *)&self->_sharingReminderManager, 0);
}

- (void)rejectRequest:(uint64_t)a1 withCompletion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25B654000, a2, OS_LOG_TYPE_ERROR, "@\"Rejecting %@ request, client is nil\"", (uint8_t *)&v2, 0xCu);
}

- (void)rejectRequest:(NSObject *)a3 withCompletion:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 serviceClient];
  int v6 = [v5 name];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_error_impl(&dword_25B654000, a3, OS_LOG_TYPE_ERROR, "@\"Rejecting %@ request from: %@, client is not entitled\"", (uint8_t *)&v7, 0x16u);
}

- (void)handleXPCEventWithName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25B654000, a2, OS_LOG_TYPE_ERROR, "\"Unrecognized Darwin notification: %@\"", (uint8_t *)&v2, 0xCu);
}

@end