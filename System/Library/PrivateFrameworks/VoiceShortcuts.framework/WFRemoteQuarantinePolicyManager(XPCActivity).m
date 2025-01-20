@interface WFRemoteQuarantinePolicyManager(XPCActivity)
- (void)scheduleRegularPolicyUpdatesWithDatabaseProvider:()XPCActivity;
@end

@implementation WFRemoteQuarantinePolicyManager(XPCActivity)

- (void)scheduleRegularPolicyUpdatesWithDatabaseProvider:()XPCActivity
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getWFGeneralLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFRemoteQuarantinePolicyManager(XPCActivity) scheduleRegularPolicyUpdatesWithDatabaseProvider:]";
    __int16 v13 = 2112;
    v14 = @"com.apple.siriactionsd.RemoteQuarantineUpdate";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEBUG, "%s Scheduling remote quarantine bundle update activity: (%@)", buf, 0x16u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__WFRemoteQuarantinePolicyManager_XPCActivity__scheduleRegularPolicyUpdatesWithDatabaseProvider___block_invoke;
  v8[3] = &unk_1E6540DE8;
  id v9 = v4;
  uint64_t v10 = a1;
  id v6 = v4;
  id v7 = +[WFXPCActivityScheduler activatedSchedulerWithActivityIdentifier:@"com.apple.siriactionsd.RemoteQuarantineUpdate" runHandler:v8];
}

@end