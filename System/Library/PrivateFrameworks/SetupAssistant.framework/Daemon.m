@interface Daemon
@end

@implementation Daemon

void __Daemon_BYSetupAssistantNeedsToRun_block_invoke()
{
  v0 = +[BYManagedAppleIDBootstrap sharedManager];
  int v1 = [v0 isLoginUser];

  if (v1)
  {
    v2 = _BYLaunchLogSubsystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __Daemon_BYSetupAssistantNeedsToRun_block_invoke_cold_1(v2);
    }
  }
  else
  {
    v3 = +[BYManagedAppleIDBootstrap sharedManager];
    [v3 ingestManagedBuddyData];

    Daemon_BYSetupAssistantNeedsToRun_needsToRun = Internal_BYSetupAssistantNeedsToRun();
    if (+[BYManagedAppleIDBootstrap isFirstTimeLogin])
    {
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x3032000000;
      v6[3] = __Block_byref_object_copy__2;
      v6[4] = __Block_byref_object_dispose__2;
      id v7 = (id)os_transaction_create();
      v4 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __Daemon_BYSetupAssistantNeedsToRun_block_invoke_147;
      block[3] = &unk_1E5D2B9E8;
      block[4] = v6;
      dispatch_async(v4, block);

      _Block_object_dispose(v6, 8);
    }
  }
}

void __Daemon_BYSetupAssistantNeedsToRun_block_invoke_147(uint64_t a1)
{
  v2 = +[BYSilentLoginUpgradeGuarantor sharedInstance];
  [v2 blockUntilSilentLoginUpgradeCompletesForNonLoginUser];

  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void __Daemon_BYSetupAssistantNeedsToRun_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1A7DED000, log, OS_LOG_TYPE_ERROR, "In login window. Nothing to do.", v1, 2u);
}

@end