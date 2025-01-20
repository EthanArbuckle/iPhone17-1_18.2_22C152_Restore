@interface WBSCyclerSyncReloadOperation
- (void)executeWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCyclerSyncReloadOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  BOOL v7 = +[WBSCyclerConnectionManager shouldTabCyclerSlowDown];
  v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "Sending a syncDidFinish notification to trigger a database reload", buf, 2u);
    }
    v10 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v10 postNotificationName:@"com.apple.SafariTabGroupSync.SyncDidFinish" object:0 userInfo:&unk_1EFC22388];
  }
  else if (v9)
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "Not sending a syncDidFinish notification because shouldTabCyclerSlowDown is off.", v12, 2u);
  }
  v11 = [v6 topLevelItem];

  v5[2](v5, v11);
}

@end