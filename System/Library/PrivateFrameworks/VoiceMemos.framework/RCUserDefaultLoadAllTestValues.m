@interface RCUserDefaultLoadAllTestValues
@end

@implementation RCUserDefaultLoadAllTestValues

void ___RCUserDefaultLoadAllTestValues_block_invoke()
{
  id v26 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v0 = [v26 objectForKey:@"RCTestSlowMessageServiceSleepAmount"];

  if (v0)
  {
    v1 = [v26 objectForKey:@"RCTestSlowMessageServiceSleepAmount"];
    [v1 doubleValue];
    _RCTestSlowMessageServiceSleepAmount = v2;
  }
  v3 = [v26 objectForKey:@"RCTestSlowMessageExportSeconds"];

  if (v3)
  {
    v4 = [v26 objectForKey:@"RCTestSlowMessageExportSeconds"];
    [v4 doubleValue];
    _RCTestSlowMessageExportSeconds = v5;
  }
  v6 = [v26 objectForKey:@"RCTestAlwaysShowLockScreenPlugin"];

  if (v6)
  {
    v7 = [v26 objectForKey:@"RCTestAlwaysShowLockScreenPlugin"];
    _RCTestAlwaysShowLockScreenPlugin = [v7 BOOLValue];
  }
  v8 = [v26 objectForKey:@"RCTestResetSyncs"];

  if (v8)
  {
    v9 = [v26 objectForKey:@"RCTestResetSyncs"];
    _RCTestResetSyncs = [v9 BOOLValue];
  }
  v10 = [v26 objectForKey:@"RCTestResetSyncsAlwaysResetSync"];

  if (v10)
  {
    v11 = [v26 objectForKey:@"RCTestResetSyncsAlwaysResetSync"];
    _RCTestResetSyncsAlwaysResetSync = [v11 BOOLValue];
  }
  v12 = [v26 objectForKey:@"RCTestBeginPreviewDelay"];

  if (v12)
  {
    v13 = [v26 objectForKey:@"RCTestBeginPreviewDelay"];
    [v13 doubleValue];
    _RCTestBeginPreviewDelay = v14;
  }
  v15 = [v26 objectForKey:@"RCTestAutoSelectedRecordingIndex"];

  if (v15)
  {
    v16 = [v26 objectForKey:@"RCTestAutoSelectedRecordingIndex"];
    _RCTestAutoSelectedRecordingIndex = [v16 integerValue];
  }
  v17 = [v26 objectForKey:@"RCTestDebugAutolayout"];

  if (v17)
  {
    v18 = [v26 objectForKey:@"RCTestDebugAutolayout"];
    _RCTestDebugAutolayout = [v18 BOOLValue];
  }
  v19 = [v26 objectForKey:@"RCTestDebugAutolayout_Show"];

  if (v19)
  {
    v20 = [v26 objectForKey:@"RCTestDebugAutolayout_Show"];
    _RCTestDebugAutolayout_Show = [v20 BOOLValue];
  }
  v21 = [v26 objectForKey:@"RCTestDebugAutolayout_Logging"];

  if (v21)
  {
    v22 = [v26 objectForKey:@"RCTestDebugAutolayout_Logging"];
    _RCTestDebugAutolayout_Logging = [v22 BOOLValue];
  }
  v23 = [v26 objectForKey:@"RCTestResetNavigationStateThresholdSeconds"];

  if (v23)
  {
    v24 = [v26 objectForKey:@"RCTestResetNavigationStateThresholdSeconds"];
    [v24 doubleValue];
    _RCTestResetNavigationStateThresholdSeconds = v25;
  }
  _RCTestDebugAutolayout_Show = (_RCTestDebugAutolayout_Show | _RCTestDebugAutolayout) != 0;
  _RCTestDebugAutolayout_Logging = (_RCTestDebugAutolayout_Logging | _RCTestDebugAutolayout) != 0;
}

@end