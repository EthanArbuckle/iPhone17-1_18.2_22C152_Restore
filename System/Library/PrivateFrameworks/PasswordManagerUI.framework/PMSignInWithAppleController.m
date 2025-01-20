@interface PMSignInWithAppleController
- (void)cancelAppIconRequestBundleID:(id)a3 completion:(id)a4;
- (void)deleteAllItemsFromDepartedGroupWithContext:(id)a3 completion:(id)a4;
- (void)fetchAppIconForBundleID:(id)a3 iconSize:(CGSize)a4 completion:(id)a5;
- (void)leaveGroupWithContext:(id)a3 completion:(id)a4;
- (void)participantRemovedWithContext:(id)a3 participantID:(id)a4 completion:(id)a5;
- (void)performHealthCheckInBackground;
@end

@implementation PMSignInWithAppleController

- (void)leaveGroupWithContext:(id)a3 completion:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F29260];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 leaveGroupWithContext:v7 completion:v6];
}

- (void)deleteAllItemsFromDepartedGroupWithContext:(id)a3 completion:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F29260];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 deleteAllItemsFromDepartedGroupWithContext:v7 completion:v6];
}

- (void)participantRemovedWithContext:(id)a3 participantID:(id)a4 completion:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x263F29260];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v7);
  [v11 participantRemovedWithContext:v10 participantID:v9 completion:v8];
}

- (void)performHealthCheckInBackground
{
  v2 = [MEMORY[0x263F290F0] sharedInstance];
  v3 = [MEMORY[0x263F290F0] sharedInstance];
  v4 = [v3 primaryAuthKitAccount];
  id v7 = [v2 altDSIDForAccount:v4];

  if (v7)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F29268]) initWithAltDSID:v7];
    id v6 = objc_alloc_init(MEMORY[0x263F29260]);
    [v6 performHealthCheckWithContext:v5 completion:&__block_literal_global_0];
  }
}

void __61__PMSignInWithAppleController_performHealthCheckInBackground__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__PMSignInWithAppleController_performHealthCheckInBackground__block_invoke_cold_2((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __61__PMSignInWithAppleController_performHealthCheckInBackground__block_invoke_cold_1(v5);
  }
}

- (void)fetchAppIconForBundleID:(id)a3 iconSize:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = (void *)MEMORY[0x263F29208];
  id v9 = a5;
  id v10 = a3;
  id v12 = [v8 sharedInstance];
  id v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", width, height);
  [v12 appIconForBundleID:v10 size:v11 completion:v9];
}

- (void)cancelAppIconRequestBundleID:(id)a3 completion:(id)a4
{
  v5 = (void *)MEMORY[0x263F29208];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedInstance];
  [v8 cancelAppIconRequestForBundleID:v7 completion:v6];
}

void __61__PMSignInWithAppleController_performHealthCheckInBackground__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_258906000, log, OS_LOG_TYPE_DEBUG, "Sign in with Apple health check completed.", v1, 2u);
}

void __61__PMSignInWithAppleController_performHealthCheckInBackground__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_258906000, a2, OS_LOG_TYPE_ERROR, "Sign in with Apple health check failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end