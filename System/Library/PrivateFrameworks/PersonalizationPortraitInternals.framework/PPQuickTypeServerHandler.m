@interface PPQuickTypeServerHandler
- (PPQuickTypeServerHandler)init;
- (void)hibernateWithCompletion:(id)a3;
- (void)quickTypeItemsWithLanguageModelingTokens:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 bundleIdentifier:(id)a6 limit:(unint64_t)a7 completion:(id)a8;
- (void)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)recentQuickTypeItemsForRecipients:(id)a3 completion:(id)a4;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)warmUpWithCompletion:(id)a3;
@end

@implementation PPQuickTypeServerHandler

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPQuickTypeServer: registerFeedback", v9, 2u);
  }

  v8 = +[PPLocalQuickTypeBroker sharedInstance];
  [v8 registerFeedback:v6 completion:v5];
}

- (void)hibernateWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPQuickTypeServer: hibernate", v6, 2u);
  }

  id v5 = +[PPLocalQuickTypeBroker sharedInstance];
  [v5 hibernateWithCompletion:v3];
}

- (void)warmUpWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPQuickTypeServer: warmUp", v6, 2u);
  }

  id v5 = +[PPLocalQuickTypeBroker sharedInstance];
  [v5 warmUpWithCompletion:v3];
}

- (void)recentQuickTypeItemsForRecipients:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPQuickTypeServer: recentQuickTypeItemsForRecipients", v9, 2u);
  }

  v8 = +[PPLocalQuickTypeBroker sharedInstance];
  [v8 recentQuickTypeItemsForRecipients:v6 completion:v5];
}

- (void)quickTypeItemsWithLanguageModelingTokens:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 bundleIdentifier:(id)a6 limit:(unint64_t)a7 completion:(id)a8
{
  id v13 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPQuickTypeServer: quickTypeItemsWithLanguageModelingTokens", v20, 2u);
  }

  v19 = +[PPLocalQuickTypeBroker sharedInstance];
  [v19 quickTypeItemsWithLanguageModelingTokens:v17 localeIdentifier:v16 recipients:v15 bundleIdentifier:v14 limit:a7 completion:v13];
}

- (void)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPQuickTypeServer: quickTypeItemsWithQuery", v11, 2u);
  }

  v10 = +[PPLocalQuickTypeBroker sharedInstance];
  [v10 quickTypeItemsWithQuery:v8 limit:a4 completion:v7];
}

- (PPQuickTypeServerHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPQuickTypeServerHandler;
  return [(PPQuickTypeServerHandler *)&v3 init];
}

@end