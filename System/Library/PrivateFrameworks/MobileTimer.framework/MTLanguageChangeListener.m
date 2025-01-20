@interface MTLanguageChangeListener
+ (id)_languageChangeNotification;
- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4;
- (id)liveDarwinNotifications;
- (void)_handleLanguageChanged;
- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5;
@end

@implementation MTLanguageChangeListener

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  id v5 = a3;
  v6 = [(MTLanguageChangeListener *)self liveDarwinNotifications];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__MTLanguageChangeListener_handlesNotification_ofType___block_invoke;
  v10[3] = &unk_1E5914F20;
  id v11 = v5;
  id v7 = v5;
  char v8 = objc_msgSend(v6, "na_any:", v10);

  return v8;
}

uint64_t __55__MTLanguageChangeListener_handlesNotification_ofType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualToString:a2];
}

+ (id)_languageChangeNotification
{
  return @"com.apple.language.changed";
}

- (void)_handleLanguageChanged
{
  v2 = MTLogForCategory(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "mobiletimerd - System language changed, terminating daemon", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  id v11 = a5;
  id v7 = a3;
  char v8 = [(id)objc_opt_class() _languageChangeNotification];
  int v9 = [v7 isEqualToString:v8];

  if (v9) {
    [(MTLanguageChangeListener *)self _handleLanguageChanged];
  }
  v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    v10 = v11;
  }
}

- (id)liveDarwinNotifications
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _languageChangeNotification];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end