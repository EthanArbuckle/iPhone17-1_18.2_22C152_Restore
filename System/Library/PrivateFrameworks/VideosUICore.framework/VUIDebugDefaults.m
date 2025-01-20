@interface VUIDebugDefaults
+ (id)sharedInstance;
- (BOOL)capellaDebuggerEnabled;
- (BOOL)capellaMockedDataEnabled;
- (BOOL)capellaMusicInfoEnabled;
- (BOOL)debugRefreshEventLogEnabled;
- (BOOL)debugUIEnabled;
- (BOOL)enableDemoMode;
- (BOOL)gdprFirstTimeFlowEnabled;
- (BOOL)gdprWhatsNewFlowEnabled;
- (BOOL)hoverEffectDisabled;
- (BOOL)iTunesExtrasSwiftUIMock;
- (BOOL)impressionTrackingDisabled;
- (BOOL)metricsExpandedLoggingEnabled;
- (BOOL)metricsLogLocationAndImpressions;
- (BOOL)metricsLoggingEnabled;
- (BOOL)metricsPageRenderLoggingEnabled;
- (BOOL)pagePerformanceEnabled;
- (BOOL)performanceDebuggerEnabled;
- (BOOL)performanceDebuggerVerboseEnabled;
- (BOOL)playbackOverridesEnabled;
- (BOOL)stackedTextUseTypeAsViewIdEnabled;
- (BOOL)useExperienceControllerForAllContent;
- (VUIDebugDefaults)init;
- (int64_t)overrideLastNLSQueryDate;
- (void)setCapellaDebuggerEnabled:(BOOL)a3;
- (void)setCapellaMockedDataEnabled:(BOOL)a3;
- (void)setCapellaMusicInfoEnabled:(BOOL)a3;
- (void)setDebugRefreshEventLogEnabled:(BOOL)a3;
- (void)setDebugUIEnabled:(BOOL)a3;
- (void)setEnableDemoMode:(BOOL)a3;
- (void)setGdprFirstTimeFlowEnabled:(BOOL)a3;
- (void)setGdprWhatsNewFlowEnabled:(BOOL)a3;
- (void)setHoverEffectDisabled:(BOOL)a3;
- (void)setITunesExtrasSwiftUIMock:(BOOL)a3;
- (void)setImpressionTrackingDisabled:(BOOL)a3;
- (void)setMetricsExpandedLoggingEnabled:(BOOL)a3;
- (void)setMetricsLogLocationAndImpressions:(BOOL)a3;
- (void)setMetricsLoggingEnabled:(BOOL)a3;
- (void)setMetricsPageRenderLoggingEnabled:(BOOL)a3;
- (void)setOverrideLastNLSQueryDate:(int64_t)a3;
- (void)setPagePerformanceEnabled:(BOOL)a3;
- (void)setPerformanceDebuggerEnabled:(BOOL)a3;
- (void)setPerformanceDebuggerVerboseEnabled:(BOOL)a3;
- (void)setPlaybackOverridesEnabled:(BOOL)a3;
- (void)setStackedTextUseTypeAsViewIdEnabled:(BOOL)a3;
- (void)setUseExperienceControllerForAllContent:(BOOL)a3;
@end

@implementation VUIDebugDefaults

- (BOOL)gdprWhatsNewFlowEnabled
{
  return self->_gdprWhatsNewFlowEnabled;
}

- (BOOL)gdprFirstTimeFlowEnabled
{
  return self->_gdprFirstTimeFlowEnabled;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sSharedInstance;
  return v2;
}

- (int64_t)overrideLastNLSQueryDate
{
  return self->_overrideLastNLSQueryDate;
}

- (BOOL)metricsLoggingEnabled
{
  return self->_metricsLoggingEnabled;
}

- (BOOL)metricsExpandedLoggingEnabled
{
  return self->_metricsExpandedLoggingEnabled;
}

- (BOOL)performanceDebuggerVerboseEnabled
{
  return self->_performanceDebuggerVerboseEnabled;
}

- (BOOL)performanceDebuggerEnabled
{
  return self->_performanceDebuggerEnabled;
}

- (BOOL)pagePerformanceEnabled
{
  return self->_pagePerformanceEnabled;
}

- (BOOL)capellaMusicInfoEnabled
{
  return self->_capellaMusicInfoEnabled;
}

- (BOOL)capellaDebuggerEnabled
{
  return self->_capellaDebuggerEnabled;
}

uint64_t __34__VUIDebugDefaults_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIDebugDefaults);
  uint64_t v1 = sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (VUIDebugDefaults)init
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)VUIDebugDefaults;
  v2 = [(VUIDebugDefaults *)&v33 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_debugUIEnabled = [v3 BOOLForKey:@"EnableDebugUI"];

    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_pagePerformanceEnabled = [v4 BOOLForKey:@"EnablePagePerformance"];

    v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_metricsLoggingEnabled = [v5 BOOLForKey:@"EnableMetricsLogging"];

    v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_metricsExpandedLoggingEnabled = [v6 BOOLForKey:@"EnableMetricsExpandedLogging"];

    v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_metricsPageRenderLoggingEnabled = [v7 BOOLForKey:@"EnableMetricsPageRenderLogging"];

    v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_metricsLogLocationAndImpressions = [v8 BOOLForKey:@"EnableMetricsExpandedClickLogging"];

    v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_enableDemoMode = [v9 BOOLForKey:@"EnableDemoMode"];

    v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_gdprFirstTimeFlowEnabled = [v10 BOOLForKey:@"ForceGDPRFirstTimeFlow"];

    v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_gdprWhatsNewFlowEnabled = [v11 BOOLForKey:@"ForceGDPRWhatsNewFlow"];

    v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_debugRefreshEventLogEnabled = [v12 BOOLForKey:@"EnableRefreshEventDebug"];

    v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v14 = [v13 objectForKey:@"PlaybackURLOverrides"];
    v2->_playbackOverridesEnabled = v14 != 0;

    v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_BOOL hoverEffectDisabled = [v15 BOOLForKey:@"hoverEffectDisabled"];

    v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_BOOL impressionTrackingDisabled = [v16 BOOLForKey:@"impressionTrackingDisabled"];

    v17 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_BOOL stackedTextUseTypeAsViewIdEnabled = [v17 BOOLForKey:@"stackedTextUseTypeAsViewIdEnabled"];

    v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_iTunesExtrasSwiftUIMock = [v18 BOOLForKey:@"iTunesExtrasSwiftUIMock"];

    v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_capellaDebuggerEnabled = [v19 BOOLForKey:@"EnableCapellaDebugger"];

    v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_capellaMockedDataEnabled = [v20 BOOLForKey:@"EnableCapellaMockedData"];

    v21 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_capellaMusicInfoEnabled = [v21 BOOLForKey:@"EnableCapellaMusicInfo"];

    v22 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_performanceDebuggerEnabled = [v22 BOOLForKey:@"EnablePerformanceDebugger"];

    v23 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_performanceDebuggerVerboseEnabled = [v23 BOOLForKey:@"EnablePerformanceDebuggerVerbose"];

    v24 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_useExperienceControllerForAllContent = [v24 BOOLForKey:@"UseExperienceControllerForAllContent"];

    v25 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_overrideLastNLSQueryDate = [v25 integerForKey:@"OverrideLastNLSQueryDate"];

    v26 = VUICDefaultLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      BOOL hoverEffectDisabled = v2->_hoverEffectDisabled;
      *(_DWORD *)buf = 67109120;
      BOOL v35 = hoverEffectDisabled;
      _os_log_impl(&dword_1E29E1000, v26, OS_LOG_TYPE_DEFAULT, "DebugDefault:: hoverEffectDisabled: %d", buf, 8u);
    }

    v28 = VUICDefaultLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      BOOL impressionTrackingDisabled = v2->_impressionTrackingDisabled;
      *(_DWORD *)buf = 67109120;
      BOOL v35 = impressionTrackingDisabled;
      _os_log_impl(&dword_1E29E1000, v28, OS_LOG_TYPE_DEFAULT, "DebugDefault:: impressionTrackingDisabled: %d", buf, 8u);
    }

    v30 = VUICDefaultLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      BOOL stackedTextUseTypeAsViewIdEnabled = v2->_stackedTextUseTypeAsViewIdEnabled;
      *(_DWORD *)buf = 67109120;
      BOOL v35 = stackedTextUseTypeAsViewIdEnabled;
      _os_log_impl(&dword_1E29E1000, v30, OS_LOG_TYPE_DEFAULT, "DebugDefault:: stackedTextUseTypeAsViewIdEnabled: %d", buf, 8u);
    }
  }
  return v2;
}

- (BOOL)debugUIEnabled
{
  return self->_debugUIEnabled;
}

- (void)setDebugUIEnabled:(BOOL)a3
{
  self->_debugUIEnabled = a3;
}

- (void)setPagePerformanceEnabled:(BOOL)a3
{
  self->_pagePerformanceEnabled = a3;
}

- (void)setMetricsLoggingEnabled:(BOOL)a3
{
  self->_metricsLoggingEnabled = a3;
}

- (void)setMetricsExpandedLoggingEnabled:(BOOL)a3
{
  self->_metricsExpandedLoggingEnabled = a3;
}

- (BOOL)metricsLogLocationAndImpressions
{
  return self->_metricsLogLocationAndImpressions;
}

- (void)setMetricsLogLocationAndImpressions:(BOOL)a3
{
  self->_metricsLogLocationAndImpressions = a3;
}

- (BOOL)metricsPageRenderLoggingEnabled
{
  return self->_metricsPageRenderLoggingEnabled;
}

- (void)setMetricsPageRenderLoggingEnabled:(BOOL)a3
{
  self->_metricsPageRenderLoggingEnabled = a3;
}

- (BOOL)enableDemoMode
{
  return self->_enableDemoMode;
}

- (void)setEnableDemoMode:(BOOL)a3
{
  self->_enableDemoMode = a3;
}

- (void)setGdprFirstTimeFlowEnabled:(BOOL)a3
{
  self->_gdprFirstTimeFlowEnabled = a3;
}

- (void)setGdprWhatsNewFlowEnabled:(BOOL)a3
{
  self->_gdprWhatsNewFlowEnabled = a3;
}

- (BOOL)debugRefreshEventLogEnabled
{
  return self->_debugRefreshEventLogEnabled;
}

- (void)setDebugRefreshEventLogEnabled:(BOOL)a3
{
  self->_debugRefreshEventLogEnabled = a3;
}

- (BOOL)playbackOverridesEnabled
{
  return self->_playbackOverridesEnabled;
}

- (void)setPlaybackOverridesEnabled:(BOOL)a3
{
  self->_playbackOverridesEnabled = a3;
}

- (BOOL)hoverEffectDisabled
{
  return self->_hoverEffectDisabled;
}

- (void)setHoverEffectDisabled:(BOOL)a3
{
  self->_BOOL hoverEffectDisabled = a3;
}

- (BOOL)impressionTrackingDisabled
{
  return self->_impressionTrackingDisabled;
}

- (void)setImpressionTrackingDisabled:(BOOL)a3
{
  self->_BOOL impressionTrackingDisabled = a3;
}

- (BOOL)stackedTextUseTypeAsViewIdEnabled
{
  return self->_stackedTextUseTypeAsViewIdEnabled;
}

- (void)setStackedTextUseTypeAsViewIdEnabled:(BOOL)a3
{
  self->_BOOL stackedTextUseTypeAsViewIdEnabled = a3;
}

- (BOOL)iTunesExtrasSwiftUIMock
{
  return self->_iTunesExtrasSwiftUIMock;
}

- (void)setITunesExtrasSwiftUIMock:(BOOL)a3
{
  self->_iTunesExtrasSwiftUIMock = a3;
}

- (void)setCapellaDebuggerEnabled:(BOOL)a3
{
  self->_capellaDebuggerEnabled = a3;
}

- (BOOL)capellaMockedDataEnabled
{
  return self->_capellaMockedDataEnabled;
}

- (void)setCapellaMockedDataEnabled:(BOOL)a3
{
  self->_capellaMockedDataEnabled = a3;
}

- (void)setCapellaMusicInfoEnabled:(BOOL)a3
{
  self->_capellaMusicInfoEnabled = a3;
}

- (void)setPerformanceDebuggerEnabled:(BOOL)a3
{
  self->_performanceDebuggerEnabled = a3;
}

- (void)setPerformanceDebuggerVerboseEnabled:(BOOL)a3
{
  self->_performanceDebuggerVerboseEnabled = a3;
}

- (BOOL)useExperienceControllerForAllContent
{
  return self->_useExperienceControllerForAllContent;
}

- (void)setUseExperienceControllerForAllContent:(BOOL)a3
{
  self->_useExperienceControllerForAllContent = a3;
}

- (void)setOverrideLastNLSQueryDate:(int64_t)a3
{
  self->_overrideLastNLSQueryDate = a3;
}

@end