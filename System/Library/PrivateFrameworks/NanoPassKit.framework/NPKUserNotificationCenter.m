@interface NPKUserNotificationCenter
+ (id)sharedInstance;
- (NPKUserNotificationCenter)init;
- (NPKUserNotificationCenter)initWithNotificationBundleIdentifier:(id)a3;
- (id)_requestWithNotificationIdentifier:(id)a3 title:(id)a4 body:(id)a5 categoryIdentifier:(id)a6 userInfo:(id)a7 wantsBadgedIcon:(BOOL)a8 suppressed:(BOOL)a9;
- (void)_addNotificationWithNotificationIdentifier:(id)a3 title:(id)a4 body:(id)a5 categoryIdentifier:(id)a6 userInfo:(id)a7 wantsBadgedIcon:(BOOL)a8 suppressed:(BOOL)a9 completion:(id)a10;
- (void)_requestNotificationAuthorizationWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_requestNotificationAuthorizationWithPreconditionCheck:(id)a3 completion:(id)a4;
- (void)addNotification:(id)a3 completion:(id)a4;
- (void)fetchAuthorizationStatusWithCompletion:(id)a3;
- (void)requestAuthorizationIfNecessaryForPassesManager:(id)a3 withCompletion:(id)a4;
- (void)requestAuthorizationWithCompletion:(id)a3;
- (void)setNotificationCategoryWithIdentifier:(id)a3 intentIdentifier:(id)a4 actions:(id)a5 options:(unint64_t)a6;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
@end

@implementation NPKUserNotificationCenter

- (NPKUserNotificationCenter)init
{
  return [(NPKUserNotificationCenter *)self initWithNotificationBundleIdentifier:*MEMORY[0x263F5C920]];
}

- (NPKUserNotificationCenter)initWithNotificationBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (![v4 length]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"bundle identifier is missing"];
  }
  v11.receiver = self;
  v11.super_class = (Class)NPKUserNotificationCenter;
  v5 = [(NPKUserNotificationCenter *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:v4];
    notificationCenter = v5->_notificationCenter;
    v5->_notificationCenter = (UNUserNotificationCenter *)v6;

    [(UNUserNotificationCenter *)v5->_notificationCenter setPrivateDelegate:v5];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__NPKUserNotificationCenter_initWithNotificationBundleIdentifier___block_invoke;
    v9[3] = &unk_2644D84B8;
    v10 = v5;
    [(NPKUserNotificationCenter *)v10 fetchAuthorizationStatusWithCompletion:v9];
  }
  return v5;
}

uint64_t __66__NPKUserNotificationCenter_initWithNotificationBundleIdentifier___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(result + 32) + 16) = a2;
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_31);
  }
  v2 = (void *)sharedInstance_notificationCenter;
  return v2;
}

void __43__NPKUserNotificationCenter_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NPKUserNotificationCenter);
  v1 = (void *)sharedInstance_notificationCenter;
  sharedInstance_notificationCenter = (uint64_t)v0;
}

- (void)requestAuthorizationIfNecessaryForPassesManager:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __92__NPKUserNotificationCenter_requestAuthorizationIfNecessaryForPassesManager_withCompletion___block_invoke;
  v8[3] = &unk_2644D84E0;
  id v9 = v6;
  id v7 = v6;
  [(NPKUserNotificationCenter *)self _requestNotificationAuthorizationWithPreconditionCheck:v8 completion:a4];
}

uint64_t __92__NPKUserNotificationCenter_requestAuthorizationIfNecessaryForPassesManager_withCompletion___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) passes];
  uint64_t v2 = [v1 count];
  if (v2 == 1)
  {
    v3 = [v1 firstObject];
    id v4 = [v3 secureElementPass];

    int v5 = [v4 isPeerPaymentPass];
    if ([v4 contactlessActivationState] == 4) {
      uint64_t v6 = v5 ^ 1u;
    }
    else {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = v2 != 0;
  }

  return v6;
}

- (void)requestAuthorizationWithCompletion:(id)a3
{
}

uint64_t __64__NPKUserNotificationCenter_requestAuthorizationWithCompletion___block_invoke()
{
  return 1;
}

- (void)fetchAuthorizationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  notificationCenter = self->_notificationCenter;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__NPKUserNotificationCenter_fetchAuthorizationStatusWithCompletion___block_invoke;
  v7[3] = &unk_2644D8528;
  id v8 = v4;
  id v6 = v4;
  [(UNUserNotificationCenter *)notificationCenter getNotificationSettingsWithCompletionHandler:v7];
}

uint64_t __68__NPKUserNotificationCenter_fetchAuthorizationStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 authorizationStatus];
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = UNAuthorizationStatusString();
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Notification Authorization Status is: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (void)setNotificationCategoryWithIdentifier:(id)a3 intentIdentifier:(id)a4 actions:(id)a5 options:(unint64_t)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)MEMORY[0x263F1DF28];
  v13 = v11;
  if (v11)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x263EFF8C0] array];
    if (v10)
    {
LABEL_3:
      v14 = [v12 categoryWithIdentifier:v18 actions:v13 intentIdentifiers:v10 options:a6];
      if (v11) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  v17 = [MEMORY[0x263EFF8C0] array];
  v14 = [v12 categoryWithIdentifier:v18 actions:v13 intentIdentifiers:v17 options:a6];

  if (!v11) {
LABEL_4:
  }

LABEL_5:
  notificationCenter = self->_notificationCenter;
  v16 = [MEMORY[0x263EFFA08] setWithObject:v14];
  [(UNUserNotificationCenter *)notificationCenter setNotificationCategories:v16];
}

- (void)addNotification:(id)a3 completion:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v6)
  {
    int v9 = [v6 identifier];
    id v10 = [v6 title];
    id v11 = [v6 body];
    v12 = [v6 notificationCategoryIdentifier];
    v13 = [v6 userInfo];
    uint64_t v14 = [v6 wantsBadgedIcon];
    LOBYTE(v17) = [v6 isSuppressed];
    [(NPKUserNotificationCenter *)self _addNotificationWithNotificationIdentifier:v9 title:v10 body:v11 categoryIdentifier:v12 userInfo:v13 wantsBadgedIcon:v14 suppressed:v17 completion:v8];

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08320];
    v19[0] = @"Notification type not supported";
    v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    int v9 = [v15 errorWithDomain:@"NPKUserNotificationsErrorDomain" code:-2001 userInfo:v16];

    ((void (**)(void, void *))v8)[2](v8, v9);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  self->_authorizationStatus = objc_msgSend(a4, "authorizationStatus", a3);
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = UNAuthorizationStatusString();
      int v8 = 138412290;
      int v9 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Notification Authorization Status did change: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_addNotificationWithNotificationIdentifier:(id)a3 title:(id)a4 body:(id)a5 categoryIdentifier:(id)a6 userInfo:(id)a7 wantsBadgedIcon:(BOOL)a8 suppressed:(BOOL)a9 completion:(id)a10
{
  BOOL v10 = a8;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a10;
  LOBYTE(v28) = a9;
  v21 = [(NPKUserNotificationCenter *)self _requestWithNotificationIdentifier:v16 title:v17 body:v18 categoryIdentifier:a6 userInfo:v19 wantsBadgedIcon:v10 suppressed:v28];
  notificationCenter = self->_notificationCenter;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __149__NPKUserNotificationCenter__addNotificationWithNotificationIdentifier_title_body_categoryIdentifier_userInfo_wantsBadgedIcon_suppressed_completion___block_invoke;
  v29[3] = &unk_2644D8550;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v34 = v20;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  [(UNUserNotificationCenter *)notificationCenter addNotificationRequest:v21 withCompletionHandler:v29];
}

void __149__NPKUserNotificationCenter__addNotificationWithNotificationIdentifier_title_body_categoryIdentifier_userInfo_wantsBadgedIcon_suppressed_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[5];
      uint64_t v9 = a1[6];
      uint64_t v10 = a1[7];
      int v12 = 136316418;
      v13 = "-[NPKUserNotificationCenter _addNotificationWithNotificationIdentifier:title:body:categoryIdentifier:userInf"
            "o:wantsBadgedIcon:suppressed:completion:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %s Scheduled notification with notification ID: %@, title: %@, body: %@, userInfo: %@. Error: %@", (uint8_t *)&v12, 0x3Eu);
    }
  }
  uint64_t v11 = a1[8];
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

- (id)_requestWithNotificationIdentifier:(id)a3 title:(id)a4 body:(id)a5 categoryIdentifier:(id)a6 userInfo:(id)a7 wantsBadgedIcon:(BOOL)a8 suppressed:(BOOL)a9
{
  BOOL v9 = a8;
  __int16 v14 = (objc_class *)MEMORY[0x263F1DEF0];
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_alloc_init(v14);
  [v20 setTitle:v18];

  [v20 setBody:v17];
  [v20 setCategoryIdentifier:v16];

  [v20 setUserInfo:v15];
  uint64_t v21 = [MEMORY[0x263EFF910] now];
  [v20 setDate:v21];

  [v20 setShouldShowSubordinateIcon:v9];
  __int16 v22 = [MEMORY[0x263F1DF00] soundWithAlertType:20];
  [v22 setAlertTopic:*MEMORY[0x263F7FCD0]];
  [v20 setSound:v22];
  id v23 = [MEMORY[0x263F1DF40] iconForApplicationIdentifier:@"com.apple.NanoPassbook"];
  [v20 setIcon:v23];

  [v20 setInterruptionLevel:1];
  if (a9) {
    uint64_t v24 = 4;
  }
  else {
    uint64_t v24 = 15;
  }
  id v25 = [MEMORY[0x263F1DF48] requestWithIdentifier:v19 content:v20 trigger:0 destinations:v24];

  return v25;
}

- (void)_requestNotificationAuthorizationWithPreconditionCheck:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = (uint64_t (**)(void))a3;
  id v7 = a4;
  switch(self->_authorizationStatus)
  {
    case 0:
    case 3:
    case 4:
      int v8 = v6[2](v6);
      BOOL v9 = pk_General_log();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (!v8)
      {
        if (!v10) {
          goto LABEL_16;
        }
        v13 = pk_General_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          __int16 v14 = "Notice: Notification Authorization not required; precondition not satisfied.";
          goto LABEL_14;
        }
        goto LABEL_15;
      }
      if (v10)
      {
        uint64_t v11 = pk_General_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = UNAuthorizationStatusString();
          int v20 = 138412290;
          uint64_t v21 = v12;
          _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Notification Authorization status was: %@ Full Authorization being requested", (uint8_t *)&v20, 0xCu);
        }
      }
      [(NPKUserNotificationCenter *)self _requestNotificationAuthorizationWithOptions:7 completion:v7];
      break;
    case 1:
      id v15 = pk_General_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        v13 = pk_General_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          __int16 v14 = "Notice: Notification Authorization already denied";
LABEL_14:
          _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, 2u);
        }
LABEL_15:
      }
LABEL_16:
      if (v7) {
        (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
      }
      break;
    case 2:
      id v17 = pk_General_log();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v18)
      {
        id v19 = pk_General_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Notice: Notification Authorization already authorized", (uint8_t *)&v20, 2u);
        }
      }
      if (v7) {
        (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
      }
      break;
    default:
      break;
  }
}

- (void)_requestNotificationAuthorizationWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  notificationCenter = self->_notificationCenter;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __85__NPKUserNotificationCenter__requestNotificationAuthorizationWithOptions_completion___block_invoke;
  v9[3] = &unk_2644D8578;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(UNUserNotificationCenter *)notificationCenter requestAuthorizationWithOptions:a3 completionHandler:v9];
}

void __85__NPKUserNotificationCenter__requestNotificationAuthorizationWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2) {
    *(void *)(*(void *)(a1 + 32) + 16) = 2;
  }
  id v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = @"NO";
      if (a2) {
        BOOL v9 = @"YES";
      }
      int v15 = 138412546;
      BOOL v16 = v9;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Notification Authorization was granted: %@ error: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  id v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    int v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      UNAuthorizationStatusString();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v15 = 138412290;
      BOOL v16 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Notification Authorization Status is: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);
  }
}

- (void).cxx_destruct
{
}

@end