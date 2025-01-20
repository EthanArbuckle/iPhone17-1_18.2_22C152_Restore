@interface PLAppTimeService
+ (id)defaults;
+ (id)entryAggregateDefinitionAppRunTime;
+ (id)entryAggregateDefinitionAppUsageEvents;
+ (id)entryAggregateDefinitionCellularCondition;
+ (id)entryAggregateDefinitionMetrics;
+ (id)entryAggregateDefinitionUsageTime;
+ (id)entryAggregateDefinitions;
+ (void)load;
- (BOOL)deviceIsPluggedIn;
- (BOOL)inCallNow;
- (BOOL)isAPOn;
- (BOOL)lastAirplaneModeStatus;
- (BOOL)lastTelephonyRegistrationStatus;
- (BOOL)musicPlayerForeground;
- (NSArray)lastLayoutEntries;
- (NSDate)firstBGAppTimeSBC;
- (NSDate)lastAPOnTimeSBC;
- (NSDate)lastCallTime;
- (NSDate)lastCellularConditionTime;
- (NSDate)lastNowPlayingTime;
- (NSDate)lastPluggedInTime;
- (NSDate)lastScreenEventAccountingTime;
- (NSDate)lastScreenOnTime;
- (NSDate)lastScreenOnTimeSBC;
- (NSDate)lastStatusBarTime;
- (NSDictionary)backgroundAppToBundleID;
- (NSMutableDictionary)audioPlaybackBundleIDs;
- (NSMutableDictionary)inFlightBundleIDStartTime;
- (NSMutableDictionary)widgetParentBundleIDs;
- (NSMutableSet)PiPModeApps;
- (NSMutableSet)appsOnScreen;
- (NSMutableSet)bundleIDsInBackground;
- (NSMutableSet)coalitionsAppsOnScreen;
- (NSMutableSet)watchkitExtensions;
- (NSSet)excludedBGAppsSet;
- (NSSet)excludedBundleIDsInBackground;
- (NSSet)excludedFGAppsSet;
- (NSString)aggregatedEntryKeyForAppRunTime;
- (NSString)aggregatedEntryKeyForAppUsageEvents;
- (NSString)entryKeyPLCoalitionAgentEventIntervalCoalition;
- (NSString)entryKeyPLScreenStateAgentScreenState;
- (NSString)entryKeyUsageTime;
- (NSString)lastCallBundleID;
- (NSString)nowPlayingBundleID;
- (NSString)statusBarBundleID;
- (PLAppTimeService)init;
- (PLEntryNotificationOperatorComposition)InCallServiceCallback;
- (PLEntryNotificationOperatorComposition)applicationCallback;
- (PLEntryNotificationOperatorComposition)audioCallback;
- (PLEntryNotificationOperatorComposition)backgroundTransferCallback;
- (PLEntryNotificationOperatorComposition)batteryCallback;
- (PLEntryNotificationOperatorComposition)canSleepEntryNotifications;
- (PLEntryNotificationOperatorComposition)cellularConditionCallback;
- (PLEntryNotificationOperatorComposition)coalitionCallback;
- (PLEntryNotificationOperatorComposition)displayCallback;
- (PLEntryNotificationOperatorComposition)notificationCallback;
- (PLEntryNotificationOperatorComposition)nowPlayingCallback;
- (PLEntryNotificationOperatorComposition)pluginCallback;
- (PLEntryNotificationOperatorComposition)screenstateCallback;
- (PLEntryNotificationOperatorComposition)statusBarCallback;
- (PLEntryNotificationOperatorComposition)telephonyRegistrationCallback;
- (PLEntryNotificationOperatorComposition)wakeEntryNotifications;
- (PLEntryNotificationOperatorComposition)widgetCallback;
- (PLNSNotificationOperatorComposition)powerOutCallback;
- (PLTimer)runTimeAggregatorTimer;
- (double)convertCPUTimeToBackgroundTime:(double)a3 withDuration:(double)a4;
- (double)getCPUTime:(id)a3;
- (double)totalAPOnTimeSBC;
- (double)totalBGTimeSBC;
- (double)totalFGTimeSBC;
- (id)backgroundAppToBundleIDmapping;
- (id)buildCallBack:(id)a3 withGroup:(BOOL)a4 withHandler:(id)a5;
- (id)generateExcludedBGBundleIDs;
- (id)getWidgetParentAppForBundleID:(id)a3;
- (id)remapCloudDocsBundleID:(id)a3;
- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4;
- (int)displayState;
- (int64_t)lastSignalBar;
- (void)addAudioAndLocationTimeAtDate:(id)a3;
- (void)addAudioTimeAtDate:(id)a3;
- (void)addAudioTimeAtDate:(id)a3 forBundleID:(id)a4;
- (void)addAudioUseFromforBundleID:(id)a3 AtDate:(id)a4;
- (void)addCarPlayUseFromLayoutEntry:(id)a3 AtDate:(id)a4;
- (void)addCellularConditionTimeAtDate:(id)a3;
- (void)addForegroundTimeAtDate:(id)a3 withNewLayoutElementsArray:(id)a4;
- (void)addNotificationCountFromUserInfo:(id)a3 AtDate:(id)a4;
- (void)addNowPlayingTimeAtDate:(id)a3;
- (void)addStatusBarTimeAtDate:(id)a3;
- (void)addWidgetUseFromUserInfo:(id)a3 AtDate:(id)a4;
- (void)chunkAppsOnScreenAtDate:(id)a3;
- (void)chunkScreenOnAggregationAtDate:(id)a3;
- (void)debugAppTimeService;
- (void)handleApplicationCallback:(id)a3;
- (void)handleAudioCallback:(id)a3;
- (void)handleBackgroundTransferCallback:(id)a3;
- (void)handleBatteryCallback:(id)a3;
- (void)handleCellularConditionCallback:(id)a3;
- (void)handleCoalitionCallback:(id)a3;
- (void)handleCoalitionCallback:(id)a3 withNewCoalitionArray:(id)a4;
- (void)handleDisplayCallback:(id)a3;
- (void)handleInCallServiceCallback:(id)a3;
- (void)handleNotificationCallback:(id)a3;
- (void)handleNowPlayingCallback:(id)a3;
- (void)handlePluginCallback:(id)a3;
- (void)handlePowerOutCallback:(id)a3;
- (void)handleScreenStateCallback:(id)a3;
- (void)handleSleepCallBack:(id)a3;
- (void)handleStatusBarCallback:(id)a3;
- (void)handleTelephonyRegistrationCallback:(id)a3;
- (void)handleWakeCallBack:(id)a3;
- (void)handleWidgetCallback:(id)a3;
- (void)initOperatorDependancies;
- (void)loadWatchKitExtensionsSet;
- (void)logAppUsageEventForKey:(id)a3 withBundleID:(id)a4 withDate:(id)a5;
- (void)periodicUpdateAppRunTimeWithDate:(id)a3;
- (void)resetLayoutElementsPLEntryArray:(id)a3 withNowDate:(id)a4;
- (void)setAggregatedEntryKeyForAppRunTime:(id)a3;
- (void)setAggregatedEntryKeyForAppUsageEvents:(id)a3;
- (void)setApplicationCallback:(id)a3;
- (void)setAppsOnScreen:(id)a3;
- (void)setAudioCallback:(id)a3;
- (void)setAudioPlaybackBundleIDs:(id)a3;
- (void)setBackgroundTransferCallback:(id)a3;
- (void)setBatteryCallback:(id)a3;
- (void)setBundleIDsInBackground:(id)a3;
- (void)setCellularConditionCallback:(id)a3;
- (void)setCoalitionCallback:(id)a3;
- (void)setCoalitionsAppsOnScreen:(id)a3;
- (void)setDeviceIsPluggedIn:(BOOL)a3;
- (void)setDisplayCallback:(id)a3;
- (void)setDisplayState:(int)a3;
- (void)setEntryKeyUsageTime:(id)a3;
- (void)setExcludedBundleIDsInBackground:(id)a3;
- (void)setFirstBGAppTimeSBC:(id)a3;
- (void)setInCallNow:(BOOL)a3;
- (void)setInCallServiceCallback:(id)a3;
- (void)setInFlightBundleIDStartTime:(id)a3;
- (void)setIsAPOn:(BOOL)a3;
- (void)setLastAPOnTimeSBC:(id)a3;
- (void)setLastAirplaneModeStatus:(BOOL)a3;
- (void)setLastCallBundleID:(id)a3;
- (void)setLastCallTime:(id)a3;
- (void)setLastCellularConditionTime:(id)a3;
- (void)setLastLayoutEntries:(id)a3;
- (void)setLastNowPlayingTime:(id)a3;
- (void)setLastPluggedInTime:(id)a3;
- (void)setLastScreenEventAccountingTime:(id)a3;
- (void)setLastScreenOnTime:(id)a3;
- (void)setLastScreenOnTimeSBC:(id)a3;
- (void)setLastSignalBar:(int64_t)a3;
- (void)setLastStatusBarTime:(id)a3;
- (void)setLastTelephonyRegistrationStatus:(BOOL)a3;
- (void)setMusicPlayerForeground:(BOOL)a3;
- (void)setNotificationCallback:(id)a3;
- (void)setNowPlayingBundleID:(id)a3;
- (void)setNowPlayingCallback:(id)a3;
- (void)setPiPModeApps:(id)a3;
- (void)setPluginCallback:(id)a3;
- (void)setPowerOutCallback:(id)a3;
- (void)setRunTimeAggregatorTimer:(id)a3;
- (void)setScreenstateCallback:(id)a3;
- (void)setStatusBarBundleID:(id)a3;
- (void)setStatusBarCallback:(id)a3;
- (void)setTelephonyRegistrationCallback:(id)a3;
- (void)setTotalAPOnTimeSBC:(double)a3;
- (void)setTotalBGTimeSBC:(double)a3;
- (void)setTotalFGTimeSBC:(double)a3;
- (void)setWatchkitExtensions:(id)a3;
- (void)setWidgetCallback:(id)a3;
- (void)setWidgetParentBundleIDs:(id)a3;
- (void)updateAggregationsAtDate:(id)a3 withNewAPState:(BOOL)a4;
- (void)updateAggregationsAtDate:(id)a3 withNewPluggedInState:(BOOL)a4;
- (void)updateAggregationsAtDate:(id)a3 withNewScreenState:(int)a4;
- (void)updateAggregationsAtSBCWithDate:(id)a3 withLongestCoalitionBGTime:(double)a4 withCoalitionLength:(double)a5;
- (void)updateAppRunTimeForBundleId:(id)a3 withAppStateUpdateType:(int)a4 withNowDate:(id)a5;
- (void)updateBackgroundAppsForBundleID:(id)a3 withState:(unsigned int)a4 withDate:(id)a5;
- (void)updateBackgroundTimeForAppStateEntry:(id)a3;
- (void)updateBackgroundTimeInDBForBundleId:(id)a3 withTime:(double)a4 withDate:(id)a5;
- (void)updateCoalitionsAppsOnScreenSet:(id)a3;
- (void)updateInCallServiceTimeAtDate:(id)a3;
- (void)updateInCallServiceTimeInDBForBundleId:(id)a3 withTime:(double)a4 withDate:(id)a5;
- (void)updatePiPModeAppsSet:(id)a3 withAppRole:(id)a4;
- (void)updatePluggedInTimeAtDate:(id)a3 withDiff:(double)a4;
- (void)updatePowerOutTimeInDBForBundleId:(id)a3;
- (void)updateScreenOffTimeAtDate:(id)a3 withDiff:(double)a4;
- (void)updateScreenOnTimeAtDate:(id)a3 withDiff:(double)a4;
- (void)updateScreenOnTimeInDBForBundleId:(id)a3 withTime:(double)a4 withDate:(id)a5;
@end

@implementation PLAppTimeService

uint64_t __56__PLAppTimeService_buildCallBack_withGroup_withHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleScreenStateCallback:a2];
}

- (void)handleBatteryCallback:(id)a3
{
  id v21 = a3;
  v4 = [v21 objectForKeyedSubscript:@"entry"];
  v5 = [v4 objectForKeyedSubscript:@"ExternalConnected"];
  uint64_t v6 = [v5 BOOLValue];

  v7 = [v21 objectForKeyedSubscript:@"entry"];
  v8 = [v7 objectForKeyedSubscript:@"CurrentCapacity"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [v21 objectForKeyedSubscript:@"entry"];
  v12 = [v11 objectForKeyedSubscript:@"MaxCapacity"];
  [v12 doubleValue];
  double v14 = v13;

  double v15 = 0.0;
  if (v14 > 0.0) {
    double v15 = v10 * 100.0 / v14;
  }
  int v16 = [MEMORY[0x1E4F92A88] isPingPongChargingWith:v6 andBatteryLevelPercent:v15];
  v17 = [v21 objectForKeyedSubscript:@"entry"];
  v18 = [v17 objectForKeyedSubscript:@"IsCharging"];
  uint64_t v19 = [v18 BOOLValue] | v16;

  if (v19 != [(PLAppTimeService *)self deviceIsPluggedIn])
  {
    v20 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [(PLAppTimeService *)self addForegroundTimeAtDate:v20 withNewLayoutElementsArray:0];
    [(PLAppTimeService *)self updateInCallServiceTimeAtDate:v20];
    [(PLAppTimeService *)self addAudioTimeAtDate:v20];
    [(PLAppTimeService *)self addNowPlayingTimeAtDate:v20];
    [(PLAppTimeService *)self addStatusBarTimeAtDate:v20];
    [(PLAppTimeService *)self updateAggregationsAtDate:v20 withNewPluggedInState:v19];
  }
  [(PLAppTimeService *)self setDeviceIsPluggedIn:v19];
}

- (void)setDeviceIsPluggedIn:(BOOL)a3
{
  self->_deviceIsPluggedIn = a3;
}

- (void)handleApplicationCallback:(id)a3
{
  id v4 = [a3 objectForKey:@"entry"];
  [(PLAppTimeService *)self updateBackgroundTimeForAppStateEntry:v4];
}

- (void)updateBackgroundAppsForBundleID:(id)a3 withState:(unsigned int)a4 withDate:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0 && v8 && v9)
  {
    if (a4 == 4)
    {
      [(PLAppTimeService *)self addCellularConditionTimeAtDate:v9];
      double v10 = [(PLAppTimeService *)self bundleIDsInBackground];
      uint64_t v11 = [v10 count];

      if (v11)
      {
LABEL_28:
        v37 = [(PLAppTimeService *)self bundleIDsInBackground];
        [v37 addObject:v8];
        goto LABEL_29;
      }
      v12 = [(PLAppTimeService *)self excludedBundleIDsInBackground];
      int v13 = [v12 containsObject:v8];

      if (v13)
      {
        double v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v42 = 138412290;
          *(void *)&v42[4] = v8;
          double v15 = "Ignoring BG bundleID %@";
LABEL_37:
          _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, v15, v42, 0xCu);
        }
      }
      else
      {
        [(PLAppTimeService *)self setFirstBGAppTimeSBC:v9];
        double v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v42 = 138412290;
          *(void *)&v42[4] = v8;
          double v15 = "%@ is first BG'd app, starting BG Timer";
          goto LABEL_37;
        }
      }

      goto LABEL_28;
    }
    int v16 = [(PLAppTimeService *)self bundleIDsInBackground];
    int v17 = [v16 containsObject:v8];

    if (v17) {
      [(PLAppTimeService *)self addCellularConditionTimeAtDate:v9];
    }
    v18 = [(PLAppTimeService *)self bundleIDsInBackground];
    int v19 = [v18 containsObject:v8];

    if (v19)
    {
      v20 = [(PLAppTimeService *)self bundleIDsInBackground];
      [v20 removeObject:v8];

      id v21 = [(PLAppTimeService *)self bundleIDsInBackground];
      uint64_t v22 = [v21 count];

      if (v22 == 1)
      {
        v23 = [(PLAppTimeService *)self bundleIDsInBackground];
        v24 = [v23 anyObject];

        if (v24)
        {
          v25 = [(PLAppTimeService *)self excludedBundleIDsInBackground];
          int v26 = [v25 containsObject:v24];

          if (v26)
          {
            v27 = PLLogCommon();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v42 = 138412290;
              *(void *)&v42[4] = v24;
              _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "Removing %@ from BG set", v42, 0xCu);
            }

            v28 = [(PLAppTimeService *)self bundleIDsInBackground];
            [v28 removeObject:v24];
          }
        }
      }
      v29 = [(PLAppTimeService *)self bundleIDsInBackground];
      uint64_t v30 = [v29 count];

      if (!v30)
      {
        v31 = PLLogCommon();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v42 = 138412290;
          *(void *)&v42[4] = v8;
          _os_log_debug_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEBUG, "%@ is last BG'd app, stopping BG Timer", v42, 0xCu);
        }

        v32 = [(PLAppTimeService *)self firstBGAppTimeSBC];

        if (v32)
        {
          v33 = [(PLAppTimeService *)self firstBGAppTimeSBC];
          [v9 timeIntervalSinceDate:v33];
          double v35 = v34;

          [(PLAppTimeService *)self setFirstBGAppTimeSBC:0];
          if (v35 > 0.0)
          {
            [(PLAppTimeService *)self totalBGTimeSBC];
            [(PLAppTimeService *)self setTotalBGTimeSBC:v35 + v36];
            v37 = PLLogCommon();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              [(PLAppTimeService *)self totalBGTimeSBC];
              *(_DWORD *)v42 = 134217984;
              *(void *)&v42[4] = v38;
              _os_log_debug_impl(&dword_1D2690000, v37, OS_LOG_TYPE_DEBUG, "total BG time since SBC: %f", v42, 0xCu);
            }
            goto LABEL_29;
          }
          v37 = PLLogCommon();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
LABEL_29:

            goto LABEL_30;
          }
          *(_DWORD *)v42 = 134217984;
          *(double *)&v42[4] = v35;
          v39 = "Got a negative BG time: %f";
          v40 = v37;
          uint32_t v41 = 12;
        }
        else
        {
          v37 = PLLogCommon();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            goto LABEL_29;
          }
          *(_WORD *)v42 = 0;
          v39 = "Tried to stop BG time, but no first BG app time SBC!";
          v40 = v37;
          uint32_t v41 = 2;
        }
        _os_log_error_impl(&dword_1D2690000, v40, OS_LOG_TYPE_ERROR, v39, v42, v41);
        goto LABEL_29;
      }
    }
  }
LABEL_30:
}

- (NSMutableSet)bundleIDsInBackground
{
  return (NSMutableSet *)objc_getProperty(self, a2, 456, 1);
}

- (void)handleScreenStateCallback:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v9 = [v4 monotonicDate];
  [(PLAppTimeService *)self addNowPlayingTimeAtDate:v9];
  [(PLAppTimeService *)self addStatusBarTimeAtDate:v9];
  [(PLAppTimeService *)self addCellularConditionTimeAtDate:v9];
  [(PLAppTimeService *)self addAudioTimeAtDate:v9];
  uint64_t v6 = [v5 objectForKey:@"group"];

  v7 = [(PLAppTimeService *)self entryKeyPLScreenStateAgentScreenState];
  id v8 = [v6 objectForKeyedSubscript:v7];

  [(PLAppTimeService *)self addForegroundTimeAtDate:v9 withNewLayoutElementsArray:v8];
  [(PLAppTimeService *)self addCarPlayUseFromLayoutEntry:v8 AtDate:v9];
}

- (NSString)entryKeyPLScreenStateAgentScreenState
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (void)addStatusBarTimeAtDate:(id)a3
{
  id v26 = a3;
  uint64_t v4 = [(PLAppTimeService *)self statusBarBundleID];
  if (!v4) {
    goto LABEL_11;
  }
  id v5 = (void *)v4;
  uint64_t v6 = [(PLAppTimeService *)self appsOnScreen];
  v7 = [(PLAppTimeService *)self statusBarBundleID];
  int v8 = [v6 containsObject:v7];

  if (v8) {
    goto LABEL_11;
  }
  uint64_t v9 = [(PLAppTimeService *)self statusBarBundleID];
  if (v9)
  {
    double v10 = (void *)v9;
    uint64_t v11 = [(PLAppTimeService *)self audioPlaybackBundleIDs];
    if (v11)
    {
      v12 = (void *)v11;
      int v13 = [(PLAppTimeService *)self audioPlaybackBundleIDs];
      double v14 = [(PLAppTimeService *)self statusBarBundleID];
      double v15 = [v13 objectForKey:v14];

      if (v15)
      {
        [(PLAppTimeService *)self addAudioAndLocationTimeAtDate:v26];
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  int v16 = [(PLAppTimeService *)self lastStatusBarTime];
  [v26 timeIntervalSinceDate:v16];
  double v18 = v17;

  if (v18 > 0.0)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F929D0]);
    v20 = [(PLAppTimeService *)self aggregatedEntryKeyForAppRunTime];
    id v21 = (void *)[v19 initWithEntryKey:v20 withDate:v26];

    uint64_t v22 = [(PLAppTimeService *)self statusBarBundleID];
    [v21 setObject:v22 forKeyedSubscript:@"BundleID"];

    v23 = [NSNumber numberWithDouble:v18];
    [v21 setObject:v23 forKeyedSubscript:@"BackgroundLocationTime"];

    if ([(PLAppTimeService *)self deviceIsPluggedIn])
    {
      v24 = [NSNumber numberWithDouble:v18];
      [v21 setObject:v24 forKeyedSubscript:@"BackgroundLocationPluggedInTime"];
    }
    else
    {
      [v21 setObject:&unk_1F29E1C90 forKeyedSubscript:@"BackgroundLocationPluggedInTime"];
    }
    v25 = [(PLAppTimeService *)self lastStatusBarTime];
    [(PLOperator *)self logProportionateAggregateEntry:v21 withStartDate:v25 withEndDate:v26];

    [(PLAppTimeService *)self setLastStatusBarTime:v26];
    goto LABEL_12;
  }
LABEL_11:
  [(PLAppTimeService *)self setLastStatusBarTime:v26];
LABEL_12:
}

- (NSString)statusBarBundleID
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setLastStatusBarTime:(id)a3
{
}

- (void)addNowPlayingTimeAtDate:(id)a3
{
  id v19 = a3;
  uint64_t v4 = [(PLAppTimeService *)self nowPlayingBundleID];
  if (!v4) {
    goto LABEL_6;
  }
  id v5 = (void *)v4;
  uint64_t v6 = [(PLAppTimeService *)self appsOnScreen];
  v7 = [(PLAppTimeService *)self nowPlayingBundleID];
  int v8 = [v6 containsObject:v7];

  if (v8
    || ([(PLAppTimeService *)self lastNowPlayingTime],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v19 timeIntervalSinceDate:v9],
        double v11 = v10,
        v9,
        v11 <= 0.0))
  {
LABEL_6:
    [(PLAppTimeService *)self setLastNowPlayingTime:v19];
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F929D0]);
    int v13 = [(PLAppTimeService *)self aggregatedEntryKeyForAppRunTime];
    double v14 = (void *)[v12 initWithEntryKey:v13 withDate:v19];

    double v15 = [(PLAppTimeService *)self nowPlayingBundleID];
    [v14 setObject:v15 forKeyedSubscript:@"BundleID"];

    int v16 = [NSNumber numberWithDouble:v11];
    [v14 setObject:v16 forKeyedSubscript:@"BackgroundAudioNowPlayingTime"];

    if ([(PLAppTimeService *)self deviceIsPluggedIn])
    {
      double v17 = [NSNumber numberWithDouble:v11];
      [v14 setObject:v17 forKeyedSubscript:@"BackgroundAudioNowPlayingPluggedInTime"];
    }
    else
    {
      [v14 setObject:&unk_1F29E1C90 forKeyedSubscript:@"BackgroundAudioNowPlayingPluggedInTime"];
    }
    double v18 = [(PLAppTimeService *)self lastNowPlayingTime];
    [(PLOperator *)self logProportionateAggregateEntry:v14 withStartDate:v18 withEndDate:v19];

    [(PLAppTimeService *)self setLastNowPlayingTime:v19];
  }
}

- (void)setLastNowPlayingTime:(id)a3
{
}

- (NSString)nowPlayingBundleID
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)addCarPlayUseFromLayoutEntry:(id)a3 AtDate:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&long long v7 = 138412290;
    long long v17 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "objectForKeyedSubscript:", @"Display", v17);
        int v13 = [v12 intValue];

        if (v13 == 3)
        {
          double v14 = [v11 objectForKeyedSubscript:@"bundleID"];
          double v15 = PLLogCommon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v17;
            v23 = v11;
            _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "Added app usage event: Carplay %@", buf, 0xCu);
          }

          int v16 = [v11 entryDate];
          [(PLAppTimeService *)self logAppUsageEventForKey:@"HasCarPlayUsage" withBundleID:v14 withDate:v16];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }
}

- (void)addAudioTimeAtDate:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v6 = [(PLAppTimeService *)self audioPlaybackBundleIDs];
  long long v7 = [v6 allKeys];
  uint64_t v8 = [v5 setWithArray:v7];

  if ([v8 count])
  {
    uint64_t v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v49 = [v8 count];
      _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "audio: found %lu playing", buf, 0xCu);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    double v10 = [(PLAppTimeService *)self appsOnScreen];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v44;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v44 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v43 + 1) + 8 * v14);
          int v16 = [(PLAppTimeService *)self audioPlaybackBundleIDs];
          long long v17 = [v16 objectForKeyedSubscript:v15];

          if (v17)
          {
            long long v18 = [(PLAppTimeService *)self audioPlaybackBundleIDs];
            [v18 setObject:v4 forKeyedSubscript:v15];

            long long v19 = PLLogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v49 = v15;
              _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "audio: reset time for %@ due to being in the fg", buf, 0xCu);
            }
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v12);
    }

    long long v20 = [(PLAppTimeService *)self appsOnScreen];
    [v8 minusSet:v20];

    long long v21 = PLLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      double v35 = [(PLAppTimeService *)self appsOnScreen];
      uint64_t v36 = [v35 count];
      uint64_t v37 = [v8 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v49 = v36;
      __int16 v50 = 2048;
      uint64_t v51 = v37;
      _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "audio: removing from %lu fg, %lu playing in bg", buf, 0x16u);
    }
    uint64_t v22 = [(PLAppTimeService *)self statusBarBundleID];
    if (v22)
    {
      v23 = (void *)v22;
      v24 = [(PLAppTimeService *)self statusBarBundleID];
      int v25 = [v8 containsObject:v24];

      if (v25)
      {
        [(PLAppTimeService *)self addAudioAndLocationTimeAtDate:v4];
        id v26 = PLLogCommon();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v38 = [(PLAppTimeService *)self statusBarBundleID];
          *(_DWORD *)buf = 138412290;
          uint64_t v49 = (uint64_t)v38;
          _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "audio: %@ is using audio+location", buf, 0xCu);
        }
        v27 = [(PLAppTimeService *)self audioPlaybackBundleIDs];
        v28 = [(PLAppTimeService *)self statusBarBundleID];
        [v27 setObject:v4 forKeyedSubscript:v28];

        v29 = [(PLAppTimeService *)self statusBarBundleID];
        [v8 removeObject:v29];
      }
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v30 = v8;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v40 != v33) {
            objc_enumerationMutation(v30);
          }
          [(PLAppTimeService *)self addAudioTimeAtDate:v4 forBundleID:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v32);
    }
  }
}

- (NSMutableDictionary)audioPlaybackBundleIDs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 368, 1);
}

- (void)updateBackgroundTimeForAppStateEntry:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v17 = v4;
    id v5 = [v4 objectForKeyedSubscript:@"Identifier"];
    uint64_t v6 = [v17 objectForKeyedSubscript:@"State"];
    uint64_t v7 = [v6 intValue];

    if (!v5) {
      goto LABEL_17;
    }
    uint64_t v8 = [(PLAppTimeService *)self excludedBGAppsSet];
    if ([v8 containsObject:v5])
    {
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v9 = [(PLAppTimeService *)self backgroundAppToBundleID];
    double v10 = [v9 objectForKey:v5];
    if (v10)
    {

      goto LABEL_16;
    }
    uint64_t v11 = [(PLAppTimeService *)self PiPModeApps];
    char v12 = [v11 containsObject:v5];

    if (v12)
    {
LABEL_17:

      id v4 = v17;
      goto LABEL_18;
    }
    uint64_t v13 = [v17 entryDate];
    [(PLAppTimeService *)self updateBackgroundAppsForBundleID:v5 withState:v7 withDate:v13];

    if ([(NSMutableSet *)self->_watchkitExtensions containsObject:v5])
    {
      if (v7 == 4 || v7 == 8)
      {
        uint64_t v8 = [v17 entryDate];
LABEL_12:
        uint64_t v14 = self;
        uint64_t v15 = v5;
        uint64_t v16 = 0;
LABEL_15:
        [(PLAppTimeService *)v14 updateAppRunTimeForBundleId:v15 withAppStateUpdateType:v16 withNowDate:v8];
        goto LABEL_16;
      }
      uint64_t v8 = [v17 entryDate];
    }
    else
    {
      uint64_t v8 = [v17 entryDate];
      if (v7 == 4) {
        goto LABEL_12;
      }
    }
    uint64_t v14 = self;
    uint64_t v15 = v5;
    uint64_t v16 = 1;
    goto LABEL_15;
  }
LABEL_18:
}

- (NSSet)excludedBGAppsSet
{
  return (NSSet *)objc_getProperty(self, a2, 256, 1);
}

- (NSDictionary)backgroundAppToBundleID
{
  return (NSDictionary *)objc_getProperty(self, a2, 408, 1);
}

- (void)updateAppRunTimeForBundleId:(id)a3 withAppStateUpdateType:(int)a4 withNowDate:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  uint64_t v9 = [(PLAppTimeService *)self inFlightBundleIDStartTime];
  double v10 = [v9 objectForKey:v12];

  if (a4)
  {
    if (!v10) {
      goto LABEL_9;
    }
    [v8 timeIntervalSinceDate:v10];
    -[PLAppTimeService updateBackgroundTimeInDBForBundleId:withTime:withDate:](self, "updateBackgroundTimeInDBForBundleId:withTime:withDate:", v12, v10);
    if (a4 != 2)
    {
      if (a4 != 1) {
        goto LABEL_9;
      }
      uint64_t v11 = [(PLAppTimeService *)self inFlightBundleIDStartTime];
      [v11 removeObjectForKey:v12];
      goto LABEL_8;
    }
  }
  else if (v10)
  {
    goto LABEL_9;
  }
  uint64_t v11 = [(PLAppTimeService *)self inFlightBundleIDStartTime];
  [v11 setObject:v8 forKeyedSubscript:v12];
LABEL_8:

LABEL_9:
}

- (NSMutableDictionary)inFlightBundleIDStartTime
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)updateBackgroundTimeInDBForBundleId:(id)a3 withTime:(double)a4 withDate:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(PLAppTimeService *)self isAPOn];
  if (a4 > 0.0 && v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F929D0]);
    id v12 = [(PLAppTimeService *)self aggregatedEntryKeyForAppRunTime];
    uint64_t v13 = [v11 initWithEntryKey:v12 withDate:v9];

    [v13 setObject:v8 forKeyedSubscript:@"BundleID"];
    uint64_t v14 = [NSNumber numberWithDouble:a4];
    [v13 setObject:v14 forKeyedSubscript:@"BackgroundTime"];

    [v13 setObject:&unk_1F29E1C90 forKeyedSubscript:@"ScreenOnTime"];
    [v13 setObject:&unk_1F29E1C90 forKeyedSubscript:@"ScreenOnPluggedInTime"];
    if ([(PLAppTimeService *)self deviceIsPluggedIn])
    {
      uint64_t v15 = [NSNumber numberWithDouble:a4];
      [v13 setObject:v15 forKeyedSubscript:@"BackgroundPluggedInTime"];
    }
    else
    {
      [v13 setObject:&unk_1F29E1C90 forKeyedSubscript:@"BackgroundPluggedInTime"];
    }
    v24 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v9 sinceDate:a4];
    [(PLOperator *)self logProportionateAggregateEntry:v13 withStartDate:v9 withEndDate:v24];

    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_20;
    }
    uint64_t v25 = objc_opt_class();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __74__PLAppTimeService_updateBackgroundTimeInDBForBundleId_withTime_withDate___block_invoke_446;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v25;
    if (qword_1EBD578B0 != -1) {
      dispatch_once(&qword_1EBD578B0, v35);
    }
    if (!byte_1EBD5781F) {
      goto LABEL_20;
    }
    id v26 = NSString;
    v27 = [v13 objectForKeyedSubscript:@"BundleID"];
    v28 = [v13 objectForKeyedSubscript:@"ScreenOnTime"];
    v29 = [v13 objectForKeyedSubscript:@"BackgroundTime"];
    v23 = [v26 stringWithFormat:@"Added Background %@ %@ %@", v27, v28, v29];

    id v30 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
    uint64_t v32 = [v31 lastPathComponent];
    uint64_t v33 = [NSString stringWithUTF8String:"-[PLAppTimeService updateBackgroundTimeInDBForBundleId:withTime:withDate:]"];
    [v30 logMessage:v23 fromFile:v32 fromFunction:v33 fromLineNumber:1286];

    double v34 = PLLogCommon();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = v23;
      _os_log_debug_impl(&dword_1D2690000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_19:
LABEL_20:

    goto LABEL_21;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PLAppTimeService_updateBackgroundTimeInDBForBundleId_withTime_withDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v16;
    if (qword_1EBD578A8 != -1) {
      dispatch_once(&qword_1EBD578A8, block);
    }
    if (byte_1EBD5781E)
    {
      id v17 = NSString;
      long long v18 = [NSNumber numberWithDouble:a4];
      uint64_t v13 = [v17 stringWithFormat:@"Not adding time for %@, %@ %@", v8, v18, v9];

      long long v19 = (void *)MEMORY[0x1E4F929B8];
      long long v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
      long long v21 = [v20 lastPathComponent];
      uint64_t v22 = [NSString stringWithUTF8String:"-[PLAppTimeService updateBackgroundTimeInDBForBundleId:withTime:withDate:]"];
      [v19 logMessage:v13 fromFile:v21 fromFunction:v22 fromLineNumber:1272];

      v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v13;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_19;
    }
  }
LABEL_21:
}

- (BOOL)isAPOn
{
  return self->_isAPOn;
}

- (NSSet)excludedBundleIDsInBackground
{
  return (NSSet *)objc_getProperty(self, a2, 480, 1);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleApplicationCallback:a2];
}

- (void)updateScreenOnTimeInDBForBundleId:(id)a3 withTime:(double)a4 withDate:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(PLAppTimeService *)self excludedFGAppsSet];
  char v11 = [v10 containsObject:v8];
  if (!v8 || (v11 & 1) != 0 || ![(PLAppTimeService *)self displayState])
  {
LABEL_26:

    goto LABEL_27;
  }

  if (a4 > 0.0)
  {
    if ([v8 isEqualToString:*MEMORY[0x1E4F625B0]])
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v12 = objc_opt_class();
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __72__PLAppTimeService_updateScreenOnTimeInDBForBundleId_withTime_withDate___block_invoke;
        v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v37[4] = v12;
        if (qword_1EBD578C0 != -1) {
          dispatch_once(&qword_1EBD578C0, v37);
        }
        if (byte_1EBD57821)
        {
          uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Lock screen diff was %f", *(void *)&a4);
          uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
          uint64_t v16 = [v15 lastPathComponent];
          id v17 = [NSString stringWithUTF8String:"-[PLAppTimeService updateScreenOnTimeInDBForBundleId:withTime:withDate:]"];
          [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:1365];

          long long v18 = PLLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            double v39 = *(double *)&v13;
            _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      a4 = fmin(a4, 60.0);
    }
    long long v19 = PLLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      double v39 = a4;
      __int16 v40 = 2112;
      id v41 = v8;
      _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "adding timeDifference=%f for bundleID=%@", buf, 0x16u);
    }

    id v20 = objc_alloc(MEMORY[0x1E4F929D0]);
    long long v21 = [(PLAppTimeService *)self aggregatedEntryKeyForAppRunTime];
    BOOL v10 = (void *)[v20 initWithEntryKey:v21 withDate:v9];

    [v10 setObject:v8 forKeyedSubscript:@"BundleID"];
    uint64_t v22 = [NSNumber numberWithDouble:a4];
    [v10 setObject:v22 forKeyedSubscript:@"ScreenOnTime"];

    [v10 setObject:&unk_1F29E1C90 forKeyedSubscript:@"BackgroundTime"];
    [v10 setObject:&unk_1F29E1C90 forKeyedSubscript:@"BackgroundPluggedInTime"];
    if ([(PLAppTimeService *)self deviceIsPluggedIn])
    {
      v23 = [NSNumber numberWithDouble:a4];
      [v10 setObject:v23 forKeyedSubscript:@"ScreenOnPluggedInTime"];
    }
    else
    {
      [v10 setObject:&unk_1F29E1C90 forKeyedSubscript:@"ScreenOnPluggedInTime"];
    }
    v24 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v9 sinceDate:a4];
    [(PLOperator *)self logProportionateAggregateEntry:v10 withStartDate:v9 withEndDate:v24];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v25 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__PLAppTimeService_updateScreenOnTimeInDBForBundleId_withTime_withDate___block_invoke_461;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v25;
      if (qword_1EBD578C8 != -1) {
        dispatch_once(&qword_1EBD578C8, block);
      }
      if (byte_1EBD57822)
      {
        id v26 = NSString;
        v27 = [v10 objectForKeyedSubscript:@"BundleID"];
        v28 = [v10 objectForKeyedSubscript:@"ScreenOnTime"];
        v29 = [v10 objectForKeyedSubscript:@"BackgroundTime"];
        id v30 = [v26 stringWithFormat:@"Added Foreground %@ %@ %@", v27, v28, v29];

        uint64_t v31 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
        uint64_t v33 = [v32 lastPathComponent];
        double v34 = [NSString stringWithUTF8String:"-[PLAppTimeService updateScreenOnTimeInDBForBundleId:withTime:withDate:]"];
        [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:1382];

        double v35 = PLLogCommon();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          double v39 = *(double *)&v30;
          _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    goto LABEL_26;
  }
LABEL_27:
}

- (void)addCellularConditionTimeAtDate:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLAppTimeService *)self lastCellularConditionTime];

  if (v5 && ![(PLAppTimeService *)self lastAirplaneModeStatus])
  {
    if ([(PLAppTimeService *)self lastTelephonyRegistrationStatus])
    {
      int64_t v6 = [(PLAppTimeService *)self lastSignalBar];
      if (v6 == -1) {
        goto LABEL_20;
      }
    }
    else
    {
      int64_t v6 = 0;
    }
    uint64_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"CellularCondition"];
    id v8 = [(PLAppTimeService *)self lastCellularConditionTime];
    [v4 timeIntervalSinceDate:v8];
    double v10 = v9;

    if (v10 <= 0.0)
    {

      goto LABEL_20;
    }
    char v11 = [(PLAppTimeService *)self bundleIDsInBackground];
    uint64_t v12 = (void *)[v11 mutableCopy];

    if ([(PLAppTimeService *)self displayState] == 1
      || [(PLAppTimeService *)self displayState] == 2)
    {
      uint64_t v13 = [(PLAppTimeService *)self appsOnScreen];
      [v12 unionSet:v13];
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withDate:v4];
          [v19 setObject:v18 forKeyedSubscript:@"BundleID"];
          id v20 = [NSNumber numberWithInteger:v6];
          [v19 setObject:v20 forKeyedSubscript:@"SignalBars"];

          long long v21 = [NSNumber numberWithDouble:v10];
          [v19 setObject:v21 forKeyedSubscript:@"CellUsageTime"];

          uint64_t v22 = [(PLAppTimeService *)self lastCellularConditionTime];
          [(PLOperator *)self logProportionateAggregateEntry:v19 withStartDate:v22 withEndDate:v4];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }
  }
  [(PLAppTimeService *)self setLastCellularConditionTime:v4];
LABEL_20:
}

- (NSDate)lastCellularConditionTime
{
  return (NSDate *)objc_getProperty(self, a2, 352, 1);
}

- (int)displayState
{
  return self->_displayState;
}

- (BOOL)lastTelephonyRegistrationStatus
{
  return self->_lastTelephonyRegistrationStatus;
}

- (BOOL)lastAirplaneModeStatus
{
  return self->_lastAirplaneModeStatus;
}

- (void)setLastCellularConditionTime:(id)a3
{
}

- (BOOL)deviceIsPluggedIn
{
  return self->_deviceIsPluggedIn;
}

- (NSString)aggregatedEntryKeyForAppRunTime
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (NSSet)excludedFGAppsSet
{
  return (NSSet *)objc_getProperty(self, a2, 248, 1);
}

- (void)addForegroundTimeAtDate:(id)a3 withNewLayoutElementsArray:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PLAppTimeService *)self lastScreenOnTime];
  double v9 = [(PLAppTimeService *)self lastScreenEventAccountingTime];
  [v8 timeIntervalSinceDate:v9];
  double v11 = v10;

  if (v11 > 0.0)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__PLAppTimeService_addForegroundTimeAtDate_withNewLayoutElementsArray___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v12;
      if (qword_1EBD578B8 != -1) {
        dispatch_once(&qword_1EBD578B8, block);
      }
      if (byte_1EBD57820)
      {
        uint64_t v13 = NSString;
        uint64_t v14 = [(PLAppTimeService *)self lastScreenEventAccountingTime];
        uint64_t v15 = [(PLAppTimeService *)self lastScreenOnTime];
        uint64_t v16 = [v13 stringWithFormat:@"Pulling up last screen on time %@ %@", v14, v15];

        id v17 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
        long long v19 = [v18 lastPathComponent];
        id v20 = [NSString stringWithUTF8String:"-[PLAppTimeService addForegroundTimeAtDate:withNewLayoutElementsArray:]"];
        [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:1324];

        long long v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v16;
          _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v22 = PLLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v57 = [(PLAppTimeService *)self lastScreenOnTime];
      *(_DWORD *)buf = 138412290;
      v69 = v57;
      _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "setting lastScreenEventAccountingTime to self.lastScreenOnTime=%@", buf, 0xCu);
    }
    v23 = [(PLAppTimeService *)self lastScreenOnTime];
    [(PLAppTimeService *)self setLastScreenEventAccountingTime:v23];
  }
  long long v24 = [(PLAppTimeService *)self lastScreenEventAccountingTime];
  [v6 timeIntervalSinceDate:v24];
  double v26 = v25;

  long long v27 = PLLogCommon();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v56 = [(PLAppTimeService *)self lastScreenEventAccountingTime];
    *(_DWORD *)buf = 138412290;
    v69 = v56;
    _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "lastScreenEventAccountingTime=%@", buf, 0xCu);
  }
  v58 = v6;

  self->_musicPlayerForeground = 0;
  if ([v7 count])
  {
    v28 = [(PLAppTimeService *)self PiPModeApps];
    [v28 removeAllObjects];

    uint64_t v29 = [(PLAppTimeService *)self appsOnScreen];
    [v29 removeAllObjects];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v30 = v7;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v64 != v33) {
            objc_enumerationMutation(v30);
          }
          double v35 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          uint64_t v36 = [v35 objectForKeyedSubscript:@"bundleID"];

          if (v36)
          {
            uint64_t v37 = [v35 objectForKeyedSubscript:@"bundleID"];
            uint64_t v38 = [v35 objectForKeyedSubscript:@"AppRole"];
            [(PLAppTimeService *)self updatePiPModeAppsSet:v37 withAppRole:v38];

            double v39 = [(PLAppTimeService *)self appsOnScreen];
            __int16 v40 = [v35 objectForKeyedSubscript:@"bundleID"];
            [v39 addObject:v40];
          }
          else
          {
            double v39 = PLLogCommon();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v69 = v35;
              _os_log_fault_impl(&dword_1D2690000, v39, OS_LOG_TYPE_FAULT, "Failed to retrieve bundle id for app on screen, bundle id is nil for entry %@", buf, 0xCu);
            }
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v32);
    }
  }
  id v41 = [(PLAppTimeService *)self lastLayoutEntries];
  uint64_t v42 = [v41 count];

  if (v42)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v43 = [(PLAppTimeService *)self lastLayoutEntries];
    uint64_t v44 = [v43 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v60 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          uint64_t v49 = [v48 objectForKeyedSubscript:@"bundleID"];
          __int16 v50 = [(PLAppTimeService *)self lastScreenEventAccountingTime];
          [(PLAppTimeService *)self updateScreenOnTimeInDBForBundleId:v49 withTime:v50 withDate:v26];

          uint64_t v51 = [v48 objectForKeyedSubscript:@"bundleID"];
          [(PLAppTimeService *)self updateCoalitionsAppsOnScreenSet:v51];

          v52 = PLLogCommon();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            v55 = [v48 objectForKeyedSubscript:@"bundleID"];
            *(_DWORD *)buf = 138412546;
            v69 = v55;
            __int16 v70 = 2048;
            double v71 = v26;
            _os_log_debug_impl(&dword_1D2690000, v52, OS_LOG_TYPE_DEBUG, "Screen On: Updating On Screen time for %@ with %f added seconds", buf, 0x16u);
          }
          uint64_t v53 = [v48 objectForKeyedSubscript:@"bundleID"];
          int v54 = [v53 isEqualToString:@"com.apple.Music"];

          if (v54) {
            self->_musicPlayerForeground = 1;
          }
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v59 objects:v72 count:16];
      }
      while (v45);
    }
  }
  [(PLAppTimeService *)self resetLayoutElementsPLEntryArray:v7 withNowDate:v58];
}

- (NSMutableSet)appsOnScreen
{
  return (NSMutableSet *)objc_getProperty(self, a2, 288, 1);
}

- (NSDate)lastScreenEventAccountingTime
{
  return (NSDate *)objc_getProperty(self, a2, 216, 1);
}

- (NSArray)lastLayoutEntries
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (NSMutableSet)PiPModeApps
{
  return (NSMutableSet *)objc_getProperty(self, a2, 296, 1);
}

- (void)updatePiPModeAppsSet:(id)a3 withAppRole:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToValue:&unk_1F29E1CA8]
    && ([(NSMutableSet *)self->_PiPModeApps containsObject:v6] & 1) == 0)
  {
    [(NSMutableSet *)self->_PiPModeApps addObject:v6];
  }
}

- (void)updateCoalitionsAppsOnScreenSet:(id)a3
{
  id v5 = a3;
  id v4 = -[NSDictionary objectForKey:](self->_backgroundAppToBundleID, "objectForKey:");

  if (v4 && ([(NSMutableSet *)self->_coalitionsAppsOnScreen containsObject:v5] & 1) == 0) {
    [(NSMutableSet *)self->_coalitionsAppsOnScreen addObject:v5];
  }
}

- (void)resetLayoutElementsPLEntryArray:(id)a3 withNowDate:(id)a4
{
  id v6 = a4;
  if (a3) {
    [(PLAppTimeService *)self setLastLayoutEntries:a3];
  }
  [(PLAppTimeService *)self setLastScreenEventAccountingTime:v6];
}

- (void)setLastScreenEventAccountingTime:(id)a3
{
}

- (void)setLastLayoutEntries:(id)a3
{
}

- (NSDate)lastScreenOnTime
{
  return (NSDate *)objc_getProperty(self, a2, 208, 1);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_5_244(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleBackgroundTransferCallback:a2];
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleBatteryCallback:a2];
}

- (void)handleBackgroundTransferCallback:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (qword_1EBD57878 != -1) {
    dispatch_once(&qword_1EBD57878, &__block_literal_global_4);
  }
  id v5 = [v4 objectForKeyedSubscript:@"entry"];
  unint64_t v6 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1EBD57880 != -1) {
      dispatch_once(&qword_1EBD57880, block);
    }
    if (byte_1EBD57819)
    {
      id v8 = [NSString stringWithFormat:@"entry=%@", v5];
      double v9 = (void *)MEMORY[0x1E4F929B8];
      double v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
      double v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLAppTimeService handleBackgroundTransferCallback:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:1159];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v74 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:@"originatingClientID"];
  if (v14) {
    uint64_t v15 = @"originatingClientID";
  }
  else {
    uint64_t v15 = @"bundleID";
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:v15];

  id v17 = [(PLAppTimeService *)self remapCloudDocsBundleID:v16];

  if (v17)
  {
    uint64_t v18 = [v5 objectForKeyedSubscript:@"taskUUID"];
    if (!v18
      || ([v5 objectForKeyedSubscript:@"state"],
          long long v19 = objc_claimAutoreleasedReturnValue(),
          int v20 = [v19 intValue],
          v19,
          !v20))
    {
LABEL_47:

      goto LABEL_48;
    }
    if (v20 == 1)
    {
      long long v21 = [(PLAppTimeService *)self coalitionsAppsOnScreen];
      char v22 = [v21 containsObject:v17];

      if (v22) {
        goto LABEL_40;
      }
      v23 = [(id)qword_1EBD57870 objectForKeyedSubscript:v17];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v24 = objc_opt_class();
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_415;
        v71[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v71[4] = v24;
        if (qword_1EBD57888 != -1) {
          dispatch_once(&qword_1EBD57888, v71);
        }
        if (byte_1EBD5781A)
        {
          uint64_t v25 = [NSString stringWithFormat:@"Running: backgroundTransferEvent=%@", v23];
          long long v65 = (void *)MEMORY[0x1E4F929B8];
          double v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
          long long v27 = [v26 lastPathComponent];
          v28 = [NSString stringWithUTF8String:"-[PLAppTimeService handleBackgroundTransferCallback:]"];
          [v65 logMessage:v25 fromFile:v27 fromFunction:v28 fromLineNumber:1176];

          uint64_t v29 = (void *)v25;
          id v30 = PLLogCommon();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v74 = v29;
            _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v6 = 0x1E4F92000;
        }
      }
      if (!v23)
      {
        v23 = objc_alloc_init(PLBackgroundTransferEvent);
        uint64_t v31 = [v5 entryDate];
        [(PLBackgroundTransferEvent *)v23 setStartDate:v31];

        [(PLBackgroundTransferEvent *)v23 setBundleID:v17];
        uint64_t v32 = [MEMORY[0x1E4F1CA80] set];
        [(PLBackgroundTransferEvent *)v23 setTaskUUIDs:v32];

        [(id)qword_1EBD57870 setObject:v23 forKeyedSubscript:v17];
      }
      uint64_t v33 = [(PLBackgroundTransferEvent *)v23 taskUUIDs];
      [v33 addObject:v18];
    }
    else
    {
      v23 = [(id)qword_1EBD57870 objectForKeyedSubscript:v17];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v34 = objc_opt_class();
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_422;
        v70[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v70[4] = v34;
        if (qword_1EBD57890 != -1) {
          dispatch_once(&qword_1EBD57890, v70);
        }
        if (byte_1EBD5781B)
        {
          long long v66 = v23;
          double v35 = [NSString stringWithFormat:@"Cancelled, Completed, Failed: backgroundTransferEvent=%@", v23];
          uint64_t v36 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
          uint64_t v38 = [v37 lastPathComponent];
          double v39 = [NSString stringWithUTF8String:"-[PLAppTimeService handleBackgroundTransferCallback:]"];
          [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:1193];

          __int16 v40 = PLLogCommon();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v74 = v35;
            _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v6 = 0x1E4F92000uLL;
          v23 = v66;
        }
      }
      if (!v23) {
        goto LABEL_39;
      }
      id v41 = [(PLBackgroundTransferEvent *)v23 taskUUIDs];
      [v41 removeObject:v18];

      uint64_t v42 = [(PLBackgroundTransferEvent *)v23 taskUUIDs];
      uint64_t v43 = [v42 count];

      if (v43) {
        goto LABEL_39;
      }
      [(id)qword_1EBD57870 removeObjectForKey:v17];
      uint64_t v44 = [(PLAppTimeService *)self coalitionsAppsOnScreen];
      uint64_t v45 = [v44 containsObject:v17];

      if (v45) {
        goto LABEL_39;
      }
      uint64_t v53 = [v5 entryDate];
      int v54 = [(PLBackgroundTransferEvent *)v23 startDate];
      [v53 timeIntervalSinceDate:v54];
      double v56 = v55;

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v57 = objc_opt_class();
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_428;
        v69[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v69[4] = v57;
        if (qword_1EBD57898 != -1) {
          dispatch_once(&qword_1EBD57898, v69);
        }
        if (byte_1EBD5781C)
        {
          uint64_t v58 = objc_msgSend(NSString, "stringWithFormat:", @"duration=%f", *(void *)&v56);
          v67 = (void *)MEMORY[0x1E4F929B8];
          long long v59 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
          long long v60 = [v59 lastPathComponent];
          long long v61 = [NSString stringWithUTF8String:"-[PLAppTimeService handleBackgroundTransferCallback:]"];
          [v67 logMessage:v58 fromFile:v60 fromFunction:v61 fromLineNumber:1205];

          long long v62 = (void *)v58;
          long long v63 = PLLogCommon();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v74 = v62;
            _os_log_debug_impl(&dword_1D2690000, v63, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v6 = 0x1E4F92000;
        }
      }
      uint64_t v33 = [(PLBackgroundTransferEvent *)v23 bundleID];
      long long v64 = [(PLBackgroundTransferEvent *)v23 startDate];
      [(PLAppTimeService *)self updateBackgroundTimeInDBForBundleId:v33 withTime:v64 withDate:fmin(v56, 3600.0)];
    }
LABEL_39:

LABEL_40:
    if ([*(id *)(v6 + 2496) debugEnabled])
    {
      uint64_t v46 = objc_opt_class();
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_434;
      v68[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v68[4] = v46;
      if (qword_1EBD578A0 != -1) {
        dispatch_once(&qword_1EBD578A0, v68);
      }
      if (byte_1EBD5781D)
      {
        v47 = [NSString stringWithFormat:@"bundleIDToBackgroundTransferEvent=%@", qword_1EBD57870];
        v48 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
        __int16 v50 = [v49 lastPathComponent];
        uint64_t v51 = [NSString stringWithUTF8String:"-[PLAppTimeService handleBackgroundTransferCallback:]"];
        [v48 logMessage:v47 fromFile:v50 fromFunction:v51 fromLineNumber:1213];

        v52 = PLLogCommon();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v74 = v47;
          _os_log_debug_impl(&dword_1D2690000, v52, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    goto LABEL_47;
  }
LABEL_48:
}

- (id)remapCloudDocsBundleID:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"com.apple.clouddocs."])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"com.apple.clouddocs.", "length")];
    uint64_t v5 = [v4 rangeOfString:@"."];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = [v4 substringFromIndex:v5 + v6];
      if (v7)
      {
        id v8 = (id)v7;

        goto LABEL_7;
      }
    }
  }
  id v8 = v3;
LABEL_7:

  return v8;
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCoalitionCallback:a2];
}

- (void)handleCoalitionCallback:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v9 = [v4 monotonicDate];
  uint64_t v6 = [v5 objectForKey:@"group"];

  uint64_t v7 = [(PLAppTimeService *)self entryKeyPLCoalitionAgentEventIntervalCoalition];
  id v8 = [v6 objectForKeyedSubscript:v7];

  [(PLAppTimeService *)self handleCoalitionCallback:v9 withNewCoalitionArray:v8];
}

- (void)handleCoalitionCallback:(id)a3 withNewCoalitionArray:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v52 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"Metrics"];
    uint64_t v51 = [MEMORY[0x1E4F1CA48] array];
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v50 = v7;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v53 = 0;
      double v11 = 0;
      uint64_t v55 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v62 != v55) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(MEMORY[0x1E4F92A88], "getIdentifierFromEntry:", v13, v50);
          if (v14)
          {
            uint64_t v15 = (void *)v14;
            double v56 = v11;
            uint64_t v16 = v8;
            id v17 = [v13 objectForKeyedSubscript:@"byteswritten"];
            uint64_t v18 = [v17 intValue];

            long long v19 = [v13 objectForKeyedSubscript:@"bytesread"];
            uint64_t v20 = [v19 intValue];

            if ((int)v20 > 0 || (int)v18 >= 1)
            {
              char v22 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v52 withDate:v6];
              [v22 setObject:v15 forKeyedSubscript:@"BundleId"];
              v23 = [NSNumber numberWithInt:v18];
              [v22 setObject:v23 forKeyedSubscript:@"byteswritten"];

              uint64_t v24 = [NSNumber numberWithInt:v20];
              [v22 setObject:v24 forKeyedSubscript:@"bytesread"];

              [v51 addObject:v22];
            }
            uint64_t v25 = [(NSDictionary *)self->_backgroundAppToBundleID objectForKey:v15];

            if (v25)
            {
              id v26 = [(NSDictionary *)self->_backgroundAppToBundleID objectForKeyedSubscript:v15];

              id v8 = v16;
              if ([(NSMutableSet *)self->_coalitionsAppsOnScreen containsObject:v26])
              {
                double v11 = v56;
              }
              else
              {
                [(PLAppTimeService *)self getCPUTime:v13];
                double v28 = v27;
                uint64_t v29 = [v16 objectForKey:v26];

                if (v29)
                {
                  id v30 = [v16 objectForKeyedSubscript:v26];
                  [v30 doubleValue];
                  double v32 = v31;

                  uint64_t v33 = NSNumber;
                  double v34 = v28 + v32;
                }
                else
                {
                  uint64_t v33 = NSNumber;
                  double v34 = v28;
                }
                double v35 = [v33 numberWithDouble:v34];
                [v16 setObject:v35 forKeyedSubscript:v26];

                double v11 = [v13 entryDate];

                uint64_t v36 = [v13 objectForKeyedSubscript:@"timestampEnd"];

                uint64_t v53 = (void *)v36;
              }
            }
            else
            {
              id v26 = v15;
              id v8 = v16;
              double v11 = v56;
            }
          }
          else
          {
            id v26 = 0;
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v53 = 0;
      double v11 = 0;
    }

    if ([v51 count])
    {
      long long v66 = v52;
      v67 = v51;
      uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      [(PLOperator *)self logEntries:v37 withGroupID:v52];
    }
    double v38 = 0.0;
    double v39 = 0.0;
    if (v11 && v53)
    {
      [v53 timeIntervalSinceDate:v11];
      double v39 = v40;
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v41 = v8;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v58 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void *)(*((void *)&v57 + 1) + 8 * j);
          v47 = objc_msgSend(v41, "objectForKeyedSubscript:", v46, v50);
          [v47 doubleValue];
          -[PLAppTimeService convertCPUTimeToBackgroundTime:withDuration:](self, "convertCPUTimeToBackgroundTime:withDuration:");
          double v49 = v48;

          [(PLAppTimeService *)self updateBackgroundTimeInDBForBundleId:v46 withTime:v11 withDate:v49];
          if (v49 > v38) {
            double v38 = v49;
          }
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v43);
    }

    [(NSMutableSet *)self->_coalitionsAppsOnScreen removeAllObjects];
    [(PLAppTimeService *)self updateAggregationsAtSBCWithDate:v6 withLongestCoalitionBGTime:v38 withCoalitionLength:v39];

    id v7 = v50;
  }
}

- (void)updateAggregationsAtSBCWithDate:(id)a3 withLongestCoalitionBGTime:(double)a4 withCoalitionLength:(double)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    [(PLAppTimeService *)self chunkScreenOnAggregationAtDate:v8];
    uint64_t v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      [(PLAppTimeService *)self totalFGTimeSBC];
      int v39 = 134217984;
      double v40 = v33;
      _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "SBC: FG %f", (uint8_t *)&v39, 0xCu);
    }

    uint64_t v10 = [(PLAppTimeService *)self lastAPOnTimeSBC];

    if (v10)
    {
      double v11 = [(PLAppTimeService *)self lastAPOnTimeSBC];
      [v8 timeIntervalSinceDate:v11];
      double v13 = v12;

      if (v13 > 0.0)
      {
        [(PLAppTimeService *)self setLastAPOnTimeSBC:v8];
        [(PLAppTimeService *)self totalAPOnTimeSBC];
        [(PLAppTimeService *)self setTotalAPOnTimeSBC:v13 + v14];
      }
    }
    uint64_t v15 = PLLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      [(PLAppTimeService *)self totalAPOnTimeSBC];
      int v39 = 134217984;
      double v40 = v34;
      _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "SBC: AP %f", (uint8_t *)&v39, 0xCu);
    }

    uint64_t v16 = [(PLAppTimeService *)self firstBGAppTimeSBC];

    if (v16)
    {
      [v8 timeIntervalSinceDate:self->_firstBGAppTimeSBC];
      if (v17 > 0.0)
      {
        double v18 = v17;
        [(PLAppTimeService *)self setFirstBGAppTimeSBC:v8];
        [(PLAppTimeService *)self totalBGTimeSBC];
        [(PLAppTimeService *)self setTotalBGTimeSBC:v18 + v19];
      }
    }
    uint64_t v20 = PLLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      [(PLAppTimeService *)self totalBGTimeSBC];
      int v39 = 134217984;
      double v40 = v35;
      _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "SBC: BG %f", (uint8_t *)&v39, 0xCu);
    }

    double totalFGTimeSBC = self->_totalFGTimeSBC;
    double v22 = a4 - totalFGTimeSBC;
    if (a4 - totalFGTimeSBC < self->_totalBGTimeSBC - totalFGTimeSBC) {
      double v22 = self->_totalBGTimeSBC - totalFGTimeSBC;
    }
    double v23 = self->_totalAPOnTimeSBC - totalFGTimeSBC;
    if (v22 < v23) {
      double v23 = v22;
    }
    if (v23 >= 0.0) {
      double v24 = v23;
    }
    else {
      double v24 = 0.0;
    }
    uint64_t v25 = PLLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v39) = 0;
      _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "Calculating screen off time from coalitions", (uint8_t *)&v39, 2u);
    }

    id v26 = PLLogCommon();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      int v39 = 134217984;
      double v40 = a5;
      _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "   Coalition interval length       %f", (uint8_t *)&v39, 0xCu);
    }

    double v27 = PLLogCommon();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      int v39 = 134217984;
      double v40 = a4;
      _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "   Longest coalition CPU time:     %f", (uint8_t *)&v39, 0xCu);
    }

    double v28 = PLLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      double v36 = self->_totalFGTimeSBC;
      int v39 = 134217984;
      double v40 = v36;
      _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "   FG since last SBC:              %f", (uint8_t *)&v39, 0xCu);
    }

    uint64_t v29 = PLLogCommon();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      double totalBGTimeSBC = self->_totalBGTimeSBC;
      int v39 = 134217984;
      double v40 = totalBGTimeSBC;
      _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "   BG since last SBC:              %f", (uint8_t *)&v39, 0xCu);
    }

    id v30 = PLLogCommon();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      double totalAPOnTimeSBC = self->_totalAPOnTimeSBC;
      int v39 = 134217984;
      double v40 = totalAPOnTimeSBC;
      _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "   AP On since last SBC:           %f", (uint8_t *)&v39, 0xCu);
    }

    double v31 = PLLogCommon();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      int v39 = 134217984;
      double v40 = v24;
      _os_log_debug_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEBUG, "   Calculated Screen Off Usage:    %f", (uint8_t *)&v39, 0xCu);
    }

    [(PLAppTimeService *)self updateScreenOffTimeAtDate:v8 withDiff:v24];
    double v32 = PLLogCommon();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v39) = 0;
      _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "Resetting SBC AP/FG/BG counters", (uint8_t *)&v39, 2u);
    }

    self->_double totalAPOnTimeSBC = 0.0;
    self->_double totalFGTimeSBC = 0.0;
    self->_double totalBGTimeSBC = 0.0;
  }
}

- (NSDate)lastAPOnTimeSBC
{
  return (NSDate *)objc_getProperty(self, a2, 424, 1);
}

- (double)totalBGTimeSBC
{
  return self->_totalBGTimeSBC;
}

- (double)totalAPOnTimeSBC
{
  return self->_totalAPOnTimeSBC;
}

- (void)setTotalBGTimeSBC:(double)a3
{
  self->_double totalBGTimeSBC = a3;
}

- (void)setTotalAPOnTimeSBC:(double)a3
{
  self->_double totalAPOnTimeSBC = a3;
}

- (void)setLastAPOnTimeSBC:(id)a3
{
}

- (void)setFirstBGAppTimeSBC:(id)a3
{
}

- (NSDate)firstBGAppTimeSBC
{
  return (NSDate *)objc_getProperty(self, a2, 464, 1);
}

- (NSString)entryKeyPLCoalitionAgentEventIntervalCoalition
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (void)chunkScreenOnAggregationAtDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    id v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Chunking screen on aggregation", (uint8_t *)&v13, 2u);
    }

    id v6 = [(PLAppTimeService *)self lastScreenOnTimeSBC];

    if (v6)
    {
      id v7 = [(PLAppTimeService *)self lastScreenOnTimeSBC];
      [v4 timeIntervalSinceDate:v7];
      double v9 = v8;

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        double v11 = [(PLAppTimeService *)self lastScreenOnTimeSBC];
        int v13 = 138412802;
        double v14 = v11;
        __int16 v15 = 2112;
        id v16 = v4;
        __int16 v17 = 2048;
        double v18 = v9;
        _os_log_impl(&dword_1D2690000, v10, OS_LOG_TYPE_INFO, "[%@, %@] : %f", (uint8_t *)&v13, 0x20u);
      }
      if (v9 >= 0.0)
      {
        [(PLAppTimeService *)self setLastScreenOnTimeSBC:v4];
        [(PLAppTimeService *)self totalFGTimeSBC];
        [(PLAppTimeService *)self setTotalFGTimeSBC:v9 + v12];
        [(PLAppTimeService *)self updateScreenOnTimeAtDate:v4 withDiff:v9];
      }
    }
  }
}

- (NSDate)lastScreenOnTimeSBC
{
  return (NSDate *)objc_getProperty(self, a2, 440, 1);
}

- (void)updateScreenOnTimeAtDate:(id)a3 withDiff:(double)a4
{
  id v11 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0 && v11 && a4 >= 0.0)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F929D0]);
    id v7 = [(PLAppTimeService *)self entryKeyUsageTime];
    double v8 = (void *)[v6 initWithEntryKey:v7 withDate:v11];

    double v9 = [NSNumber numberWithDouble:a4];
    [v8 setObject:v9 forKeyedSubscript:@"ScreenOn"];

    [v8 setObject:&unk_1F29E1C90 forKeyedSubscript:@"ScreenOff"];
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v11 sinceDate:-a4];
    [(PLOperator *)self logProportionateAggregateEntry:v8 withStartDate:v10 withEndDate:v11];
  }
  MEMORY[0x1F41817F8]();
}

- (void)updateScreenOffTimeAtDate:(id)a3 withDiff:(double)a4
{
  id v11 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0 && v11 && a4 >= 0.0)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F929D0]);
    id v7 = [(PLAppTimeService *)self entryKeyUsageTime];
    double v8 = (void *)[v6 initWithEntryKey:v7 withDate:v11];

    [v8 setObject:&unk_1F29E1C90 forKeyedSubscript:@"ScreenOn"];
    double v9 = [NSNumber numberWithDouble:a4];
    [v8 setObject:v9 forKeyedSubscript:@"ScreenOff"];

    uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v11 sinceDate:-a4];
    [(PLOperator *)self logProportionateAggregateEntry:v8 withStartDate:v10 withEndDate:v11];
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)entryKeyUsageTime
{
  return (NSString *)objc_getProperty(self, a2, 416, 1);
}

- (double)totalFGTimeSBC
{
  return self->_totalFGTimeSBC;
}

- (void)setTotalFGTimeSBC:(double)a3
{
  self->_double totalFGTimeSBC = a3;
}

- (void)setLastScreenOnTimeSBC:(id)a3
{
}

+ (id)defaults
{
  return &unk_1F29E8B40;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAppTimeService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryAggregateDefinitions
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"AppRunTime";
  id v3 = [a1 entryAggregateDefinitionAppRunTime];
  v11[0] = v3;
  v10[1] = @"UsageTime";
  id v4 = [a1 entryAggregateDefinitionUsageTime];
  v11[1] = v4;
  v10[2] = @"Metrics";
  id v5 = [a1 entryAggregateDefinitionMetrics];
  v11[2] = v5;
  v10[3] = @"CellularCondition";
  id v6 = [a1 entryAggregateDefinitionCellularCondition];
  v11[3] = v6;
  v10[4] = @"AppUsageEvents";
  id v7 = [a1 entryAggregateDefinitionAppUsageEvents];
  v11[4] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

+ (id)entryAggregateDefinitionAppRunTime
{
  v58[4] = *MEMORY[0x1E4F143B8];
  v57[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92BF8];
  v55[0] = *MEMORY[0x1E4F92CD0];
  v55[1] = v2;
  v56[0] = &unk_1F29F0220;
  v56[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F92CF8];
  v55[2] = *MEMORY[0x1E4F92C08];
  v55[3] = v3;
  v56[2] = MEMORY[0x1E4F1CC38];
  v56[3] = &unk_1F29E1C30;
  uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:4];
  v58[0] = v41;
  v57[1] = *MEMORY[0x1E4F92CA8];
  v53[0] = @"BundleID";
  double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v39 = objc_msgSend(v40, "commonTypeDict_StringFormat_withBundleID");
  v54[0] = v39;
  v53[1] = @"ScreenOnTime";
  double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
  v54[1] = v37;
  v53[2] = @"BackgroundTime";
  double v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v35 = objc_msgSend(v36, "commonTypeDict_RealFormat");
  v54[2] = v35;
  v53[3] = @"ScreenOnPluggedInTime";
  double v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
  v54[3] = v33;
  v53[4] = @"BackgroundPluggedInTime";
  double v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v31 = objc_msgSend(v32, "commonTypeDict_RealFormat");
  v54[4] = v31;
  v53[5] = @"BackgroundAudioNowPlayingTime";
  uint64_t v51 = *MEMORY[0x1E4F92D10];
  uint64_t v4 = v51;
  v52 = &unk_1F29E1C48;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  v54[5] = v30;
  v53[6] = @"BackgroundLocationTime";
  uint64_t v49 = v4;
  id v50 = &unk_1F29E1C48;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
  v54[6] = v29;
  v53[7] = @"BackgroundAudioNowPlayingPluggedInTime";
  double v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v27 = objc_msgSend(v28, "commonTypeDict_RealFormat");
  v54[7] = v27;
  v53[8] = @"BackgroundLocationPluggedInTime";
  id v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
  v54[8] = v25;
  v53[9] = @"BackgroundLocationAudioTime";
  double v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v23 = objc_msgSend(v24, "commonTypeDict_RealFormat");
  v54[9] = v23;
  v53[10] = @"BackgroundLocationAudioPluggedInTime";
  double v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
  v54[10] = v21;
  v53[11] = @"BackgroundAudioPlayingTime";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
  v54[11] = v19;
  v53[12] = @"BackgroundAudioPlayingTimePluggedIn";
  double v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  __int16 v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
  v54[12] = v17;
  v53[13] = @"InCallScreenOnTime";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v54[13] = v6;
  v53[14] = @"InCallBackgroundTime";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v54[14] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:15];
  v58[1] = v9;
  v57[2] = *MEMORY[0x1E4F92BE0];
  v47[0] = &unk_1F29F0230;
  uint64_t v45 = *MEMORY[0x1E4F92BD8];
  uint64_t v10 = v45;
  uint64_t v46 = &unk_1F29F0240;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  v47[1] = &unk_1F29F0250;
  v48[0] = v11;
  uint64_t v43 = v10;
  uint64_t v44 = &unk_1F29F0260;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v48[1] = v12;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
  v58[2] = v13;
  v57[3] = *MEMORY[0x1E4F92BF0];
  v42[0] = @"ScreenOnTime";
  v42[1] = @"BackgroundTime";
  v42[2] = @"BackgroundAudioNowPlayingTime";
  v42[3] = @"BackgroundLocationTime";
  v42[4] = @"ScreenOnPluggedInTime";
  v42[5] = @"BackgroundPluggedInTime";
  v42[6] = @"BackgroundAudioNowPlayingPluggedInTime";
  v42[7] = @"BackgroundLocationPluggedInTime";
  v42[8] = @"BackgroundLocationAudioTime";
  v42[9] = @"BackgroundLocationAudioPluggedInTime";
  v42[10] = @"BackgroundAudioPlayingTime";
  v42[11] = @"BackgroundAudioPlayingTimePluggedIn";
  v42[12] = @"InCallScreenOnTime";
  v42[13] = @"InCallBackgroundTime";
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:14];
  v58[3] = v14;
  __int16 v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:4];

  return v15;
}

+ (id)entryAggregateDefinitionMetrics
{
  v25[4] = *MEMORY[0x1E4F143B8];
  v24[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v22[0] = *MEMORY[0x1E4F92CD0];
  v22[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F92CF8];
  v22[2] = *MEMORY[0x1E4F92BF8];
  v22[3] = v3;
  v23[0] = &unk_1F29F0270;
  v23[1] = MEMORY[0x1E4F1CC38];
  v23[2] = MEMORY[0x1E4F1CC38];
  v23[3] = &unk_1F29E1C60;
  v22[4] = *MEMORY[0x1E4F92CF0];
  v23[4] = &unk_1F29F0280;
  __int16 v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];
  v25[0] = v15;
  v24[1] = *MEMORY[0x1E4F92CA8];
  v20[0] = @"BundleId";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v21[0] = v5;
  v20[1] = @"byteswritten";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v21[1] = v7;
  v20[2] = @"bytesread";
  double v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v21[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  v25[1] = v10;
  v24[2] = *MEMORY[0x1E4F92BE0];
  double v18 = &unk_1F29F0230;
  uint64_t v16 = *MEMORY[0x1E4F92BD8];
  __int16 v17 = &unk_1F29F0240;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  uint64_t v19 = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v24[3] = *MEMORY[0x1E4F92BF0];
  v25[2] = v12;
  v25[3] = &unk_1F29ED6D0;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];

  return v13;
}

+ (id)entryAggregateDefinitionCellularCondition
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92BF8];
  v24[0] = *MEMORY[0x1E4F92CD0];
  v24[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F92CF8];
  v24[2] = *MEMORY[0x1E4F92C08];
  v24[3] = v3;
  v25[0] = &unk_1F29F0290;
  v25[1] = MEMORY[0x1E4F1CC38];
  v25[2] = MEMORY[0x1E4F1CC38];
  v25[3] = &unk_1F29E1C60;
  void v24[4] = *MEMORY[0x1E4F92CF0];
  v25[4] = &unk_1F29F0280;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];
  v27[0] = v16;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"BundleID";
  __int16 v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v23[0] = v4;
  v22[1] = @"SignalBars";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v23[1] = v6;
  v22[2] = @"CellUsageTime";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v23[2] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  v27[1] = v9;
  v26[2] = *MEMORY[0x1E4F92BE0];
  uint64_t v20 = &unk_1F29F0230;
  uint64_t v18 = *MEMORY[0x1E4F92BD8];
  uint64_t v19 = &unk_1F29F0240;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  long long v21 = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v27[2] = v11;
  v26[3] = *MEMORY[0x1E4F92BF0];
  __int16 v17 = @"CellUsageTime";
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v27[3] = v12;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

  return v13;
}

+ (id)entryAggregateDefinitionUsageTime
{
  void v26[4] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v25[0] = *MEMORY[0x1E4F92C50];
    uint64_t v3 = *MEMORY[0x1E4F92BF8];
    v23[0] = *MEMORY[0x1E4F92CD0];
    v23[1] = v3;
    v24[0] = &unk_1F29F02A0;
    v24[1] = MEMORY[0x1E4F1CC38];
    __int16 v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v26[0] = v15;
    v25[1] = *MEMORY[0x1E4F92CA8];
    v21[0] = @"ScreenOn";
    double v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v14, "commonTypeDict_IntegerFormat_withUnit_s");
    v22[0] = v4;
    v21[1] = @"ScreenOff";
    id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat_withUnit_s");
    v22[1] = v6;
    v21[2] = @"PluggedIn";
    id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat_withUnit_s");
    v22[2] = v8;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    v26[1] = v9;
    v25[2] = *MEMORY[0x1E4F92BE0];
    uint64_t v19 = &unk_1F29F0230;
    uint64_t v17 = *MEMORY[0x1E4F92BD8];
    uint64_t v18 = &unk_1F29F02B0;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    uint64_t v20 = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v26[2] = v11;
    v25[3] = *MEMORY[0x1E4F92BF0];
    v16[0] = @"ScreenOn";
    v16[1] = @"ScreenOff";
    v16[2] = @"PluggedIn";
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    v26[3] = v12;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
  }
  return v2;
}

+ (id)entryAggregateDefinitionAppUsageEvents
{
  v39[4] = *MEMORY[0x1E4F143B8];
  v38[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v36[0] = *MEMORY[0x1E4F92CD0];
  v36[1] = v2;
  uint64_t v3 = MEMORY[0x1E4F1CC38];
  v37[0] = &unk_1F29F0270;
  v37[1] = MEMORY[0x1E4F1CC38];
  uint64_t v4 = *MEMORY[0x1E4F92CF0];
  v36[2] = *MEMORY[0x1E4F92CF8];
  v36[3] = v4;
  v37[2] = &unk_1F29E1C60;
  v37[3] = &unk_1F29F02C0;
  long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:4];
  v39[0] = v21;
  v38[1] = *MEMORY[0x1E4F92CA8];
  v34[0] = @"BundleID";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_StringFormat_withBundleID");
  v35[0] = v19;
  v34[1] = @"NotificationCount";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v35[1] = v5;
  v34[2] = @"HasWidgetActive";
  uint64_t v7 = *MEMORY[0x1E4F92C98];
  v31[0] = *MEMORY[0x1E4F92D10];
  uint64_t v6 = v31[0];
  v31[1] = v7;
  v33[0] = &unk_1F29E1C78;
  v33[1] = v3;
  uint64_t v32 = *MEMORY[0x1E4F92BE8];
  uint64_t v8 = v32;
  v33[2] = &unk_1F29E1C78;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v31 count:3];
  v35[2] = v9;
  v34[3] = @"HasCarPlayUsage";
  v29[0] = v6;
  v29[1] = v7;
  v30[0] = &unk_1F29E1C78;
  v30[1] = v3;
  v29[2] = v8;
  v30[2] = &unk_1F29E1C78;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  v35[3] = v10;
  v34[4] = @"HasAudioUsage";
  v27[0] = v6;
  v27[1] = v7;
  v28[0] = &unk_1F29E1C78;
  v28[1] = v3;
  v27[2] = v8;
  v28[2] = &unk_1F29E1C78;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v35[4] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:5];
  v39[1] = v12;
  v38[2] = *MEMORY[0x1E4F92BE0];
  uint64_t v25 = &unk_1F29F0250;
  uint64_t v23 = *MEMORY[0x1E4F92BD8];
  double v24 = &unk_1F29F02C0;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v26 = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  v39[2] = v14;
  v38[3] = *MEMORY[0x1E4F92BF0];
  v22[0] = @"NotificationCount";
  v22[1] = @"HasWidgetActive";
  v22[2] = @"HasCarPlayUsage";
  void v22[3] = @"HasAudioUsage";
  __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
  v39[3] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];

  return v16;
}

- (void)loadWatchKitExtensionsSet
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  watchkitExtensions = self->_watchkitExtensions;
  self->_watchkitExtensions = v3;

  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllPlugins"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"PluginType" withValue:@"com.apple.watchkit" withComparisonOperation:0];
  v21[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

  uint64_t v8 = [(PLOperator *)self storage];
  double v9 = [v8 entriesForKey:v5 withComparisons:v7];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "objectForKeyedSubscript:", @"PluginId", (void)v16);
        if (v15) {
          [(NSMutableSet *)self->_watchkitExtensions addObject:v15];
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (PLAppTimeService)init
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) != 0
    || ([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) != 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLAppTimeService;
    self = [(PLOperator *)&v5 init];
    uint64_t v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  if (([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) == 0)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    int v4 = _os_feature_enabled_impl();
    objc_super v5 = (uint64_t *)MEMORY[0x1E4F92D48];
    if (v4)
    {
      uint64_t v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Display"];
      uint64_t v7 = [(PLOperator *)self storage];
      uint64_t v8 = [v7 lastEntryForKey:v6 withFilters:&unk_1F29ED6E8];

      if (v8)
      {
        double v9 = [v8 objectForKeyedSubscript:@"Active"];
        self->_displayState = [v9 intValue];
      }
      else
      {
        self->_displayState = 0;
      }
    }
    else
    {
      self->_displayState = 0;
    }
    self->_deviceIsPluggedIn = 0;
    id v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    lastScreenOnTime = self->_lastScreenOnTime;
    self->_lastScreenOnTime = v10;

    objc_storeStrong((id *)&self->_lastScreenEventAccountingTime, self->_lastScreenOnTime);
    uint64_t v12 = *MEMORY[0x1E4F92D20];
    uint64_t v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"AppRunTime"];
    aggregatedEntryKeyForAppRunTime = self->_aggregatedEntryKeyForAppRunTime;
    self->_aggregatedEntryKeyForAppRunTime = v13;

    __int16 v15 = +[PLOperator entryKeyForType:v12 andName:@"AppUsageEvents"];
    aggregatedEntryKeyForAppUsageEvents = self->_aggregatedEntryKeyForAppUsageEvents;
    self->_aggregatedEntryKeyForAppUsageEvents = v15;

    long long v17 = (NSMutableDictionary *)objc_opt_new();
    widgetParentBundleIDs = self->_widgetParentBundleIDs;
    self->_widgetParentBundleIDs = v17;

    long long v19 = [(PLAppTimeService *)self backgroundAppToBundleIDmapping];
    backgroundAppToBundleID = self->_backgroundAppToBundleID;
    self->_backgroundAppToBundleID = v19;

    long long v21 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.InCallService", 0);
    excludedFGAppsSet = self->_excludedFGAppsSet;
    self->_excludedFGAppsSet = v21;

    uint64_t v23 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.mobilemail", @"com.apple.InCallService", @"com.apple.MobileSMS", @"com.apple.mobileslideshow", @"com.apple.Music", 0);
    excludedBGAppsSet = self->_excludedBGAppsSet;
    self->_excludedBGAppsSet = v23;

    uint64_t v25 = (NSMutableDictionary *)objc_opt_new();
    inFlightBundleIDStartTime = self->_inFlightBundleIDStartTime;
    self->_inFlightBundleIDStartTime = v25;

    self->_inCallNow = 0;
    objc_storeStrong((id *)&self->_lastCallTime, v3);
    lastCallBundleID = self->_lastCallBundleID;
    self->_lastCallBundleID = 0;

    double v28 = (NSMutableSet *)objc_opt_new();
    coalitionsAppsOnScreen = self->_coalitionsAppsOnScreen;
    self->_coalitionsAppsOnScreen = v28;

    id v30 = (NSMutableSet *)objc_opt_new();
    appsOnScreen = self->_appsOnScreen;
    self->_appsOnScreen = v30;

    uint64_t v32 = (NSMutableSet *)objc_opt_new();
    PiPModeApps = self->_PiPModeApps;
    self->_PiPModeApps = v32;

    [(PLAppTimeService *)self loadWatchKitExtensionsSet];
    nowPlayingBundleID = self->_nowPlayingBundleID;
    self->_nowPlayingBundleID = 0;

    statusBarBundleID = self->_statusBarBundleID;
    self->_statusBarBundleID = 0;

    self->_musicPlayerForeground = 0;
    objc_storeStrong((id *)&self->_lastNowPlayingTime, v3);
    objc_storeStrong((id *)&self->_lastStatusBarTime, v3);
    self->_isAPOn = 1;
    lastCellularConditionTime = self->_lastCellularConditionTime;
    self->_lastCellularConditionTime = 0;

    self->_lastSignalBar = -1;
    self->_lastTelephonyRegistrationStatus = 1;
    self->_lastAirplaneModeStatus = 0;
    uint64_t v37 = (NSMutableDictionary *)objc_opt_new();
    audioPlaybackBundleIDs = self->_audioPlaybackBundleIDs;
    self->_audioPlaybackBundleIDs = v37;

    if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
    {
      [(PLAppTimeService *)self setLastAPOnTimeSBC:v3];
      [(PLAppTimeService *)self setTotalBGTimeSBC:0.0];
      [(PLAppTimeService *)self setTotalFGTimeSBC:0.0];
      if (self->_displayState == 1) {
        int v39 = v3;
      }
      else {
        int v39 = 0;
      }
      [(PLAppTimeService *)self setLastScreenOnTimeSBC:v39];
      [(PLAppTimeService *)self setFirstBGAppTimeSBC:0];
      double v40 = objc_opt_new();
      [(PLAppTimeService *)self setBundleIDsInBackground:v40];

      uint64_t v41 = +[PLOperator entryKeyForType:v12 andName:@"UsageTime"];
      entryKeyUsageTime = self->_entryKeyUsageTime;
      self->_entryKeyUsageTime = v41;

      uint64_t v43 = [(PLAppTimeService *)self generateExcludedBGBundleIDs];
      [(PLAppTimeService *)self setExcludedBundleIDsInBackground:v43];

      if (self->_deviceIsPluggedIn) {
        uint64_t v44 = v3;
      }
      else {
        uint64_t v44 = 0;
      }
      [(PLAppTimeService *)self setLastPluggedInTime:v44];
    }
    uint64_t v45 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"CoalitionInterval"];
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke;
    v108[3] = &unk_1E692A808;
    v108[4] = self;
    uint64_t v46 = [(PLAppTimeService *)self buildCallBack:v45 withGroup:1 withHandler:v108];
    [(PLAppTimeService *)self setCoalitionCallback:v46];

    entryKeyPLCoalitionAgentEventIntervalCoalition = self->_entryKeyPLCoalitionAgentEventIntervalCoalition;
    self->_entryKeyPLCoalitionAgentEventIntervalCoalition = v45;
    double v48 = v45;

    uint64_t v49 = *MEMORY[0x1E4F92D30];
    id v50 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ScreenState"];

    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_2;
    v107[3] = &unk_1E692A808;
    v107[4] = self;
    uint64_t v51 = [(PLAppTimeService *)self buildCallBack:v50 withGroup:1 withHandler:v107];
    [(PLAppTimeService *)self setScreenstateCallback:v51];

    entryKeyPLScreenStateAgentScreenState = self->_entryKeyPLScreenStateAgentScreenState;
    self->_entryKeyPLScreenStateAgentScreenState = v50;
    uint64_t v53 = v50;

    int v54 = +[PLOperator entryKeyForType:v49 andName:@"Application"];

    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_3;
    v106[3] = &unk_1E692A808;
    v106[4] = self;
    uint64_t v55 = [(PLAppTimeService *)self buildCallBack:v54 withGroup:0 withHandler:v106];
    [(PLAppTimeService *)self setApplicationCallback:v55];

    double v56 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"Battery"];

    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_4;
    v105[3] = &unk_1E692A808;
    v105[4] = self;
    long long v57 = [(PLAppTimeService *)self buildCallBack:v56 withGroup:0 withHandler:v105];
    [(PLAppTimeService *)self setBatteryCallback:v57];

    if (+[PLDisplayAgent shouldLogDisplay])
    {
      uint64_t v58 = +[PLOperator entryKeyForType:*v5 andName:@"Display"];

      v104[0] = MEMORY[0x1E4F143A8];
      v104[1] = 3221225472;
      v104[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_5;
      v104[3] = &unk_1E692A808;
      v104[4] = self;
      long long v59 = [(PLAppTimeService *)self buildCallBack:v58 withGroup:0 withHandler:v104];
      [(PLAppTimeService *)self setDisplayCallback:v59];

      double v56 = (void *)v58;
    }

    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_6;
    v103[3] = &unk_1E692A808;
    v103[4] = self;
    long long v60 = [(PLAppTimeService *)self buildCallBack:@"PLXPCAgent_EventForward_InCallService" withGroup:0 withHandler:v103];
    [(PLAppTimeService *)self setInCallServiceCallback:v60];

    long long v61 = PLLogCommon();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v61, OS_LOG_TYPE_DEBUG, "Calling power out", buf, 2u);
    }

    id v62 = objc_alloc(MEMORY[0x1E4F92A28]);
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_226;
    v101[3] = &unk_1E692A0F0;
    v101[4] = self;
    long long v63 = (void *)[v62 initWithOperator:self forNotification:@"com.apple.PerfPowerServices.powerOut" withBlock:v101];
    [(PLAppTimeService *)self setPowerOutCallback:v63];

    long long v64 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllPlugins"];
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_228;
    v100[3] = &unk_1E692A808;
    v100[4] = self;
    long long v65 = [(PLAppTimeService *)self buildCallBack:v64 withGroup:0 withHandler:v100];
    [(PLAppTimeService *)self setPluginCallback:v65];

    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_2_232;
    v99[3] = &unk_1E692A808;
    v99[4] = self;
    long long v66 = [(PLAppTimeService *)self buildCallBack:@"PLAudioAgent_EventPoint_AudioApp" withGroup:0 withHandler:v99];
    [(PLAppTimeService *)self setAudioCallback:v66];

    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_3_236;
    v98[3] = &unk_1E692A808;
    v98[4] = self;
    v67 = [(PLAppTimeService *)self buildCallBack:@"PLAudioAgent_EventForward_NowPlaying" withGroup:0 withHandler:v98];
    [(PLAppTimeService *)self setNowPlayingCallback:v67];

    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_4_240;
    v97[3] = &unk_1E692A808;
    v97[4] = self;
    v68 = [(PLAppTimeService *)self buildCallBack:@"PLLocationAgent_EventForward_StatusBar" withGroup:0 withHandler:v97];
    [(PLAppTimeService *)self setStatusBarCallback:v68];

    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_5_244;
    v96[3] = &unk_1E692A808;
    v96[4] = self;
    uint64_t v69 = [(PLAppTimeService *)self buildCallBack:@"PLXPCAgent_EventPoint_BackgroundTransfer" withGroup:0 withHandler:v96];
    [(PLAppTimeService *)self setBackgroundTransferCallback:v69];

    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_6_246;
    v95[3] = &unk_1E692A0F0;
    v95[4] = self;
    __int16 v70 = [MEMORY[0x1E4F929E8] canSleepEntryNotificationWithOperator:self withBlock:v95];
    canSleepEntryNotifications = self->_canSleepEntryNotifications;
    self->_canSleepEntryNotifications = v70;

    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_258;
    v94[3] = &unk_1E692A0F0;
    v94[4] = self;
    v72 = [MEMORY[0x1E4F929E8] wakeEntryNotificationWithOperator:self withBlock:v94];
    wakeEntryNotifications = self->_wakeEntryNotifications;
    self->_wakeEntryNotifications = v72;

    [(PLOperator *)self defaultDoubleForKey:@"RunTimeAggregatorTimerCadence"];
    double v75 = v74;
    id v76 = objc_alloc(MEMORY[0x1E4F92A80]);
    v77 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v75];
    v78 = [(PLOperator *)self workQueue];
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_264;
    v93[3] = &unk_1E692A200;
    v93[4] = self;
    v79 = (PLTimer *)[v76 initWithFireDate:v77 withInterval:1 withTolerance:0 repeats:v78 withUserInfo:v93 withQueue:v75 withBlock:0.0];
    runTimeAggregatorTimer = self->_runTimeAggregatorTimer;
    self->_runTimeAggregatorTimer = v79;

    v81 = [(PLAppTimeService *)self displayCallback];
    [v81 requestEntry];

    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_2_269;
    v92[3] = &unk_1E692A808;
    v92[4] = self;
    v82 = [(PLAppTimeService *)self buildCallBack:@"PLBBAgent_EventPoint_TelephonyActivity" withGroup:0 withHandler:v92];
    [(PLAppTimeService *)self setCellularConditionCallback:v82];

    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_3_273;
    v91[3] = &unk_1E692A808;
    v91[4] = self;
    v83 = [(PLAppTimeService *)self buildCallBack:@"PLBBAgent_EventForward_TelephonyRegistration" withGroup:0 withHandler:v91];
    [(PLAppTimeService *)self setTelephonyRegistrationCallback:v83];

    uint64_t v84 = *v5;
    v85 = +[PLOperator entryKeyForType:*v5 andName:@"SBNotifications"];
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_4_275;
    v90[3] = &unk_1E692A808;
    v90[4] = self;
    v86 = [(PLAppTimeService *)self buildCallBack:v85 withGroup:0 withHandler:v90];
    [(PLAppTimeService *)self setNotificationCallback:v86];

    v87 = +[PLOperator entryKeyForType:v84 andName:@"WidgetUpdates"];

    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __44__PLAppTimeService_initOperatorDependancies__block_invoke_5_276;
    v89[3] = &unk_1E692A808;
    v89[4] = self;
    v88 = [(PLAppTimeService *)self buildCallBack:v87 withGroup:0 withHandler:v89];
    [(PLAppTimeService *)self setWidgetCallback:v88];
  }
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleDisplayCallback:a2];
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleInCallServiceCallback:a2];
}

void __44__PLAppTimeService_initOperatorDependancies__block_invoke_226(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "Calling power out with %@ %@ %@", (uint8_t *)&v11, 0x20u);
  }

  [*(id *)(a1 + 32) handlePowerOutCallback:v7];
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_228(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handlePluginCallback:a2];
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_2_232(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleAudioCallback:a2];
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_3_236(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleNowPlayingCallback:a2];
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_4_240(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleStatusBarCallback:a2];
}

void __44__PLAppTimeService_initOperatorDependancies__block_invoke_6_246(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __44__PLAppTimeService_initOperatorDependancies__block_invoke_7;
    __int16 v15 = &unk_1E692A830;
    id v16 = @"AppTimeService";
    uint64_t v17 = v4;
    if (qword_1EBD57828 != -1) {
      dispatch_once(&qword_1EBD57828, &v12);
    }
    int v5 = _MergedGlobals_1_3;

    if (v5)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Device Going to Sleep", v12, v13, v14, v15);
      id v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLAppTimeService initOperatorDependancies]_block_invoke_6"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:663];

      int v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v19 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "handleSleepCallBack:", v3, v12, v13, v14, v15);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_7(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  _MergedGlobals_1_3 = result;
  return result;
}

void __44__PLAppTimeService_initOperatorDependancies__block_invoke_258(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __44__PLAppTimeService_initOperatorDependancies__block_invoke_2_259;
    __int16 v15 = &unk_1E692A830;
    id v16 = @"AppTimeService";
    uint64_t v17 = v4;
    if (qword_1EBD57830 != -1) {
      dispatch_once(&qword_1EBD57830, &v12);
    }
    int v5 = byte_1EBD57811;

    if (v5)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Device Woke Up", v12, v13, v14, v15);
      id v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLAppTimeService initOperatorDependancies]_block_invoke"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:667];

      int v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v19 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "handleWakeCallBack:", v3, v12, v13, v14, v15);
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_2_259(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  byte_1EBD57811 = result;
  return result;
}

void __44__PLAppTimeService_initOperatorDependancies__block_invoke_264(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [*(id *)(a1 + 32) periodicUpdateAppRunTimeWithDate:v2];
  [*(id *)(a1 + 32) chunkScreenOnAggregationAtDate:v2];
  objc_msgSend(*(id *)(a1 + 32), "updateAggregationsAtDate:withNewPluggedInState:", v2, objc_msgSend(*(id *)(a1 + 32), "deviceIsPluggedIn"));
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_2_269(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCellularConditionCallback:a2];
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_3_273(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleTelephonyRegistrationCallback:a2];
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_4_275(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleNotificationCallback:a2];
}

uint64_t __44__PLAppTimeService_initOperatorDependancies__block_invoke_5_276(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleWidgetCallback:a2];
}

- (id)buildCallBack:(id)a3 withGroup:(BOOL)a4 withHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    id v10 = [NSString stringWithFormat:@"GroupID_%@", v8];
  }
  else
  {
    id v10 = v8;
  }
  int v11 = v10;
  id v12 = objc_alloc(MEMORY[0x1E4F929E8]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__PLAppTimeService_buildCallBack_withGroup_withHandler___block_invoke;
  void v16[3] = &unk_1E692A858;
  id v17 = v9;
  id v13 = v9;
  id v14 = (void *)[v12 initWithOperator:self forEntryKey:v11 withBlock:v16];

  return v14;
}

- (void)debugAppTimeService
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB00]);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = (id)[v3 initWithFireDate:v4 interval:self target:sel_testService selector:0 userInfo:1 repeats:20.0];

  int v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v5 addTimer:v6 forMode:*MEMORY[0x1E4F1C3A0]];
}

- (void)handleWakeCallBack:(id)a3
{
  id v6 = [a3 objectForKey:@"entry"];
  uint64_t v4 = [v6 entryDate];
  [(PLAppTimeService *)self periodicUpdateAppRunTimeWithDate:v4];

  int v5 = [v6 entryDate];
  [(PLAppTimeService *)self updateAggregationsAtDate:v5 withNewAPState:1];

  [(PLAppTimeService *)self setIsAPOn:1];
}

- (void)handleSleepCallBack:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 objectForKey:@"entry"];
  int v5 = [v4 entryDate];
  [(PLAppTimeService *)self periodicUpdateAppRunTimeWithDate:v5];

  id v6 = [v4 entryDate];
  [(PLAppTimeService *)self updateAggregationsAtDate:v6 withNewAPState:0];

  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __int16 v15 = [(PLAppTimeService *)self audioPlaybackBundleIDs];
    int v16 = 134217984;
    uint64_t v17 = [v15 count];
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "audio: removing %lu objects", (uint8_t *)&v16, 0xCu);
  }
  id v8 = [(PLAppTimeService *)self audioPlaybackBundleIDs];
  [v8 removeAllObjects];

  [(PLAppTimeService *)self setIsAPOn:0];
  if ([(PLAppTimeService *)self inCallNow])
  {
    id v9 = [v4 entryDate];
    id v10 = [(PLAppTimeService *)self lastCallTime];
    [v9 timeIntervalSinceDate:v10];
    double v12 = v11;

    id v13 = [(PLAppTimeService *)self lastCallBundleID];
    id v14 = [(PLAppTimeService *)self lastCallTime];
    [(PLAppTimeService *)self updateInCallServiceTimeInDBForBundleId:v13 withTime:v14 withDate:v12];

    [(PLAppTimeService *)self setInCallNow:0];
  }
}

- (void)handleNotificationCallback:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 monotonicDate];
  [(PLAppTimeService *)self addNotificationCountFromUserInfo:v5 AtDate:v6];
}

- (void)handleWidgetCallback:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 monotonicDate];
  [(PLAppTimeService *)self addWidgetUseFromUserInfo:v5 AtDate:v6];
}

- (void)handleDisplayCallback:(id)a3
{
  *(void *)&void v37[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKey:@"entry"];
  id v6 = [v5 objectForKeyedSubscript:@"Active"];
  uint64_t v7 = [v6 intValue];

  if (v7 == 2)
  {
    if (_os_feature_enabled_impl()) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  if ([(PLAppTimeService *)self inCallNow]
    && v7 != [(PLAppTimeService *)self displayState]
    && ([(PLAppTimeService *)self displayState] == 1 || v7 == 1))
  {
    id v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Updating in call service log due to display change", buf, 2u);
    }

    id v9 = [v5 entryDate];
    [(PLAppTimeService *)self updateInCallServiceTimeAtDate:v9];
  }
  id v10 = [v5 objectForKeyedSubscript:@"Block"];
  int v11 = [v10 isEqualToString:@"Backlight"];

  if (v11)
  {
    if (!v7)
    {
      double v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        v37[0] = 0;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "newDisplayState=%d, clearing layouts", buf, 8u);
      }

      id v13 = [v5 entryDate];
      [(PLAppTimeService *)self addCellularConditionTimeAtDate:v13];

      id v14 = [v5 entryDate];
      [(PLAppTimeService *)self addForegroundTimeAtDate:v14 withNewLayoutElementsArray:0];
    }
    __int16 v15 = [v5 entryDate];
    [(PLAppTimeService *)self updateAggregationsAtDate:v15 withNewScreenState:v7];

    if (_os_feature_enabled_impl() && [MEMORY[0x1E4F92A38] hasAOD])
    {
      int v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v29 = [(PLAppTimeService *)self displayState];
        *(_DWORD *)buf = 67109376;
        v37[0] = v29;
        LOWORD(v37[1]) = 1024;
        *(_DWORD *)((char *)&v37[1] + 2) = v7;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "self.displayState=%d, newDisplayState=%d", buf, 0xEu);
      }

      if ([(PLAppTimeService *)self displayState] || (v7 - 1) > 1) {
        goto LABEL_28;
      }
      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        id v30 = [v5 entryDate];
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v37 = v30;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "updating lastScreenOnTime to %@", buf, 0xCu);
      }
    }
    else if ((v7 - 1) > 1)
    {
      goto LABEL_28;
    }
    uint64_t v18 = [v5 entryDate];
    [(PLAppTimeService *)self setLastScreenOnTime:v18];

LABEL_28:
    [(PLAppTimeService *)self setDisplayState:v7];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      double v33 = __42__PLAppTimeService_handleDisplayCallback___block_invoke;
      double v34 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v35 = v19;
      if (qword_1EBD57838 != -1) {
        dispatch_once(&qword_1EBD57838, &block);
      }
      if (byte_1EBD57812)
      {
        uint64_t v20 = NSString;
        long long v21 = [v5 objectForKeyedSubscript:@"Active"];
        double v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLAppTimeService displayState](self, "displayState"));
        uint64_t v23 = [v20 stringWithFormat:@"Got display %@ %@ %@", v4, v21, v22, block, v32, v33, v34, v35];

        double v24 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
        id v26 = [v25 lastPathComponent];
        double v27 = [NSString stringWithUTF8String:"-[PLAppTimeService handleDisplayCallback:]"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:960];

        double v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)uint64_t v37 = v23;
          _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __42__PLAppTimeService_handleDisplayCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57812 = result;
  return result;
}

- (void)handlePowerOutCallback:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Handle power out callback with payload %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [v4 objectForKey:@"time"];
  [(PLAppTimeService *)self updatePowerOutTimeInDBForBundleId:v6];
}

- (void)updatePowerOutTimeInDBForBundleId:(id)a3
{
  id v4 = a3;
  [v4 doubleValue];
  double v6 = v5;
  id v11 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v7 = objc_alloc(MEMORY[0x1E4F929D0]);
  id v8 = [(PLAppTimeService *)self aggregatedEntryKeyForAppRunTime];
  uint64_t v9 = (void *)[v7 initWithEntryKey:v8 withDate:v11];

  [v9 setObject:@"PowerOutAccessories" forKeyedSubscript:@"BundleID"];
  [v9 setObject:&unk_1F29E1C90 forKeyedSubscript:@"ScreenOnTime"];
  [v9 setObject:v4 forKeyedSubscript:@"BackgroundTime"];

  [v9 setObject:&unk_1F29E1C90 forKeyedSubscript:@"BackgroundPluggedInTime"];
  id v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v11 sinceDate:v6];
  [(PLOperator *)self logProportionateAggregateEntry:v9 withStartDate:v11 withEndDate:v10];
}

- (void)handleInCallServiceCallback:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 objectForKey:@"entry"];
  double v6 = [v5 objectForKeyedSubscript:@"status"];
  if ([v6 isEqualToString:@"callStart"])
  {
    [(PLAppTimeService *)self setInCallNow:1];
    id v7 = [v5 entryDate];
    [(PLAppTimeService *)self setLastCallTime:v7];

    id v8 = NSString;
    uint64_t v9 = [v5 objectForKeyedSubscript:@"bundleID"];
    if (v9)
    {
      id v10 = [v5 objectForKeyedSubscript:@"bundleID"];
    }
    else
    {
      id v10 = &stru_1F294E108;
    }
    uint64_t v17 = [v8 stringWithFormat:@"%@", v10];
    [(PLAppTimeService *)self setLastCallBundleID:v17];

    if (v9) {
  }
    }
  else if ([v6 isEqualToString:@"callStop"])
  {
    id v11 = [v5 entryDate];
    double v12 = [(PLAppTimeService *)self lastCallTime];
    [v11 timeIntervalSinceDate:v12];
    double v14 = v13;

    __int16 v15 = [v5 objectForKeyedSubscript:@"bundleID"];
    int v16 = [(PLAppTimeService *)self lastCallTime];
    [(PLAppTimeService *)self updateInCallServiceTimeInDBForBundleId:v15 withTime:v16 withDate:v14];

    [(PLAppTimeService *)self setInCallNow:0];
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v18 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PLAppTimeService_handleInCallServiceCallback___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v18;
    if (qword_1EBD57840 != -1) {
      dispatch_once(&qword_1EBD57840, block);
    }
    if (byte_1EBD57813)
    {
      uint64_t v19 = NSString;
      uint64_t v20 = [v5 objectForKeyedSubscript:@"bundleID"];
      long long v21 = [v5 objectForKeyedSubscript:@"status"];
      double v22 = [v5 objectForKeyedSubscript:@"callType"];
      uint64_t v23 = [v19 stringWithFormat:@"Got InCallService %@ %@ %@ %@", v4, v20, v21, v22];

      double v24 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
      id v26 = [v25 lastPathComponent];
      double v27 = [NSString stringWithUTF8String:"-[PLAppTimeService handleInCallServiceCallback:]"];
      [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:1001];

      double v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v31 = v23;
        _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __48__PLAppTimeService_handleInCallServiceCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57813 = result;
  return result;
}

- (void)handlePluginCallback:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 objectForKey:@"entry"];
  double v6 = [v5 objectForKeyedSubscript:@"PluginType"];
  int v7 = [v6 isEqualToString:@"com.apple.watchkit"];

  if (v7)
  {
    id v8 = [v5 objectForKeyedSubscript:@"PluginId"];

    if (v8)
    {
      watchkitExtensions = self->_watchkitExtensions;
      id v10 = [v5 objectForKeyedSubscript:@"PluginId"];
      [(NSMutableSet *)watchkitExtensions addObject:v10];
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __41__PLAppTimeService_handlePluginCallback___block_invoke;
    long long v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v22 = v11;
    if (qword_1EBD57848 != -1) {
      dispatch_once(&qword_1EBD57848, &block);
    }
    if (byte_1EBD57814)
    {
      double v12 = [NSString stringWithFormat:@"Got Plugin %@", v4, block, v19, v20, v21, v22];
      double v13 = (void *)MEMORY[0x1E4F929B8];
      double v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
      __int16 v15 = [v14 lastPathComponent];
      int v16 = [NSString stringWithUTF8String:"-[PLAppTimeService handlePluginCallback:]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:1015];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v24 = v12;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __41__PLAppTimeService_handlePluginCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57814 = result;
  return result;
}

- (void)handleAudioCallback:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 objectForKey:@"entry"];
  double v6 = [v5 objectForKey:@"ApplicationName"];
  int v7 = [v5 objectForKey:@"Operation"];
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    if ([v7 isEqualToString:@"AudioPlayback_Start"])
    {
      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v6;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "audio: %@ started playing", buf, 0xCu);
      }

      uint64_t v11 = [(PLAppTimeService *)self audioPlaybackBundleIDs];
      double v12 = [v5 entryDate];
      [v11 setObject:v12 forKey:v6];

      double v13 = [v5 entryDate];
      [(PLAppTimeService *)self addAudioTimeAtDate:v13];
    }
    else
    {
      int v14 = [v8 isEqualToString:@"AudioPlayback_Stop"];
      __int16 v15 = PLLogCommon();
      double v13 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v6;
          _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "audio: %@ stopped playing", buf, 0xCu);
        }

        int v16 = [v5 entryDate];
        [(PLAppTimeService *)self addAudioTimeAtDate:v16];

        double v13 = [(PLAppTimeService *)self audioPlaybackBundleIDs];
        [v13 removeObjectForKey:v6];
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = v6;
        __int16 v31 = 2112;
        uint64_t v32 = v8;
        _os_log_error_impl(&dword_1D2690000, v13, OS_LOG_TYPE_ERROR, "audio: unknown operation for %@: %@", buf, 0x16u);
      }
    }

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      id v26 = __40__PLAppTimeService_handleAudioCallback___block_invoke;
      double v27 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v28 = v17;
      if (qword_1EBD57850 != -1) {
        dispatch_once(&qword_1EBD57850, &block);
      }
      if (byte_1EBD57815)
      {
        uint64_t v18 = [NSString stringWithFormat:@"Got Audio callback %@", v4, block, v25, v26, v27, v28];
        uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
        long long v21 = [v20 lastPathComponent];
        uint64_t v22 = [NSString stringWithUTF8String:"-[PLAppTimeService handleAudioCallback:]"];
        [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:1045];

        uint64_t v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v18;
          _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __40__PLAppTimeService_handleAudioCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57815 = result;
  return result;
}

- (void)handleNowPlayingCallback:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:@"entry"];
  double v6 = [v5 objectForKeyedSubscript:@"State"];
  int v7 = [v6 intValue];

  id v8 = [v5 entryDate];
  [(PLAppTimeService *)self addNowPlayingTimeAtDate:v8];

  if (v7 == 1)
  {
    BOOL v9 = [v5 objectForKeyedSubscript:@"BundleID"];
    [(PLAppTimeService *)self setNowPlayingBundleID:v9];
  }
  else
  {
    [(PLAppTimeService *)self setNowPlayingBundleID:0];
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __45__PLAppTimeService_handleNowPlayingCallback___block_invoke;
    uint64_t v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v21 = v10;
    if (qword_1EBD57858 != -1) {
      dispatch_once(&qword_1EBD57858, &block);
    }
    if (byte_1EBD57816)
    {
      uint64_t v11 = [NSString stringWithFormat:@"Got NowPlaying callback %@", v4, block, v18, v19, v20, v21];
      double v12 = (void *)MEMORY[0x1E4F929B8];
      double v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
      int v14 = [v13 lastPathComponent];
      __int16 v15 = [NSString stringWithUTF8String:"-[PLAppTimeService handleNowPlayingCallback:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1059];

      int v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __45__PLAppTimeService_handleNowPlayingCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57816 = result;
  return result;
}

- (void)handleStatusBarCallback:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:@"entry"];
  double v6 = [v5 objectForKeyedSubscript:@"Status"];
  int v7 = [v6 intValue];

  id v8 = [v5 entryDate];
  [(PLAppTimeService *)self addStatusBarTimeAtDate:v8];

  if (v7 == 1)
  {
    BOOL v9 = [v5 objectForKeyedSubscript:@"BundleID"];
    [(PLAppTimeService *)self setStatusBarBundleID:v9];
  }
  else
  {
    [(PLAppTimeService *)self setStatusBarBundleID:0];
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __44__PLAppTimeService_handleStatusBarCallback___block_invoke;
    uint64_t v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v21 = v10;
    if (qword_1EBD57860 != -1) {
      dispatch_once(&qword_1EBD57860, &block);
    }
    if (byte_1EBD57817)
    {
      uint64_t v11 = [NSString stringWithFormat:@"Got NowPlaying callback %@", v4, block, v18, v19, v20, v21];
      double v12 = (void *)MEMORY[0x1E4F929B8];
      double v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
      int v14 = [v13 lastPathComponent];
      __int16 v15 = [NSString stringWithUTF8String:"-[PLAppTimeService handleStatusBarCallback:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1073];

      int v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __44__PLAppTimeService_handleStatusBarCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57817 = result;
  return result;
}

- (void)handleCellularConditionCallback:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:@"entry"];
  double v6 = [v5 objectForKeyedSubscript:@"subsId"];

  if (!v6
    || ([v5 objectForKeyedSubscript:@"subsId"],
        int v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 integerValue],
        v7,
        (v8 & 0xFFFFFFFFFFFFFFFDLL) == 0))
  {
    BOOL v9 = [v5 objectForKeyedSubscript:@"signalBars"];
    uint64_t v10 = [v9 integerValue];

    uint64_t v11 = [v5 objectForKeyedSubscript:@"airplaneMode"];
    uint64_t v12 = [v11 isEqualToString:@"on"];

    if (v10 >= 4) {
      uint64_t v10 = 4;
    }
    if (v10 != [(PLAppTimeService *)self lastSignalBar]
      || v12 != [(PLAppTimeService *)self lastAirplaneModeStatus])
    {
      double v13 = [v5 entryDate];
      [(PLAppTimeService *)self addCellularConditionTimeAtDate:v13];
    }
    [(PLAppTimeService *)self setLastSignalBar:v10];
    [(PLAppTimeService *)self setLastAirplaneModeStatus:v12];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      uint64_t v23 = __52__PLAppTimeService_handleCellularConditionCallback___block_invoke;
      uint64_t v24 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v25 = v14;
      if (qword_1EBD57868 != -1) {
        dispatch_once(&qword_1EBD57868, &block);
      }
      if (byte_1EBD57818)
      {
        __int16 v15 = [NSString stringWithFormat:@"Got CellularCondition callback %@", v4, block, v22, v23, v24, v25];
        int v16 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
        uint64_t v18 = [v17 lastPathComponent];
        uint64_t v19 = [NSString stringWithUTF8String:"-[PLAppTimeService handleCellularConditionCallback:]"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:1104];

        uint64_t v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          double v27 = v15;
          _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __52__PLAppTimeService_handleCellularConditionCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57818 = result;
  return result;
}

- (void)handleTelephonyRegistrationCallback:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"entry"];
  if (v4)
  {
    id v13 = v4;
    double v5 = [v4 objectForKeyedSubscript:@"status"];

    id v4 = v13;
    if (v5)
    {
      double v6 = [v13 objectForKeyedSubscript:@"subsId"];

      id v4 = v13;
      if (!v6
        || ([v13 objectForKeyedSubscript:@"subsId"],
            int v7 = objc_claimAutoreleasedReturnValue(),
            uint64_t v8 = [v7 integerValue],
            v7,
            id v4 = v13,
            (v8 & 0xFFFFFFFFFFFFFFFDLL) == 0))
      {
        BOOL v9 = [v4 objectForKeyedSubscript:@"status"];
        if ([v9 isEqualToString:@"RegisteredHome"])
        {
          uint64_t v10 = 1;
        }
        else
        {
          uint64_t v11 = [v13 objectForKeyedSubscript:@"status"];
          uint64_t v10 = [v11 isEqualToString:@"RegisteredRoaming"];
        }
        if (v10 != [(PLAppTimeService *)self lastTelephonyRegistrationStatus])
        {
          uint64_t v12 = [v13 entryDate];
          [(PLAppTimeService *)self addCellularConditionTimeAtDate:v12];
        }
        [(PLAppTimeService *)self setLastTelephonyRegistrationStatus:v10];
        id v4 = v13;
      }
    }
  }
}

uint64_t __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke()
{
  qword_1EBD57870 = [MEMORY[0x1E4F1CA60] dictionary];
  return MEMORY[0x1F41817F8]();
}

uint64_t __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57819 = result;
  return result;
}

uint64_t __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_415(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5781A = result;
  return result;
}

uint64_t __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_422(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5781B = result;
  return result;
}

uint64_t __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_428(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5781C = result;
  return result;
}

uint64_t __53__PLAppTimeService_handleBackgroundTransferCallback___block_invoke_434(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5781D = result;
  return result;
}

uint64_t __74__PLAppTimeService_updateBackgroundTimeInDBForBundleId_withTime_withDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5781E = result;
  return result;
}

uint64_t __74__PLAppTimeService_updateBackgroundTimeInDBForBundleId_withTime_withDate___block_invoke_446(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5781F = result;
  return result;
}

- (void)periodicUpdateAppRunTimeWithDate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(PLAppTimeService *)self inFlightBundleIDStartTime];
  double v6 = [v5 allKeys];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[PLAppTimeService updateAppRunTimeForBundleId:withAppStateUpdateType:withNowDate:](self, "updateAppRunTimeForBundleId:withAppStateUpdateType:withNowDate:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), 2, v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [(PLAppTimeService *)self chunkAppsOnScreenAtDate:v4];
  [(PLAppTimeService *)self updateInCallServiceTimeAtDate:v4];
  [(PLAppTimeService *)self addAudioTimeAtDate:v4];
  [(PLAppTimeService *)self addNowPlayingTimeAtDate:v4];
  [(PLAppTimeService *)self addStatusBarTimeAtDate:v4];
}

- (void)chunkAppsOnScreenAtDate:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLAppTimeService *)self appsOnScreen];
  if (v5
    && (double v6 = (void *)v5,
        [(PLAppTimeService *)self appsOnScreen],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = [(PLAppTimeService *)self appsOnScreen];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v23;
      *(void *)&long long v11 = 138412546;
      long long v21 = v11;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          int v16 = [(PLAppTimeService *)self lastScreenEventAccountingTime];
          [v4 timeIntervalSinceDate:v16];
          double v18 = v17;

          uint64_t v19 = [(PLAppTimeService *)self lastScreenEventAccountingTime];
          [(PLAppTimeService *)self updateScreenOnTimeInDBForBundleId:v15 withTime:v19 withDate:v18];

          [(PLAppTimeService *)self setLastScreenEventAccountingTime:v4];
          uint64_t v20 = PLLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v21;
            uint64_t v27 = v15;
            __int16 v28 = 2048;
            double v29 = v18;
            _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "Screen On: Periodic Update - Updating On Screen time for %@ with %f added seconds", buf, 0x16u);
          }
        }
        uint64_t v12 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D2690000, v9, OS_LOG_TYPE_FAULT, "Screen On: Tried updating On Screen time, but couldn't retrieve apps on screen", buf, 2u);
    }
  }
}

uint64_t __71__PLAppTimeService_addForegroundTimeAtDate_withNewLayoutElementsArray___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57820 = result;
  return result;
}

uint64_t __72__PLAppTimeService_updateScreenOnTimeInDBForBundleId_withTime_withDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57821 = result;
  return result;
}

uint64_t __72__PLAppTimeService_updateScreenOnTimeInDBForBundleId_withTime_withDate___block_invoke_461(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57822 = result;
  return result;
}

- (double)getCPUTime:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"cpu_time"];
  [v4 doubleValue];
  double v6 = v5;
  id v7 = [v3 objectForKeyedSubscript:@"cpu_time_billed_to_me"];
  [v7 doubleValue];
  double v9 = v6 + v8;
  uint64_t v10 = [v3 objectForKeyedSubscript:@"cpu_time_billed_to_others"];

  [v10 doubleValue];
  double v12 = v9 - v11;

  return v12;
}

- (double)convertCPUTimeToBackgroundTime:(double)a3 withDuration:(double)a4
{
  double result = a3 + a3;
  if (result > a4) {
    double result = a4;
  }
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (void)updateInCallServiceTimeAtDate:(id)a3
{
  id v9 = a3;
  if ([(PLAppTimeService *)self inCallNow])
  {
    id v4 = [(PLAppTimeService *)self lastCallTime];
    [v9 timeIntervalSinceDate:v4];
    double v6 = v5;

    id v7 = [(PLAppTimeService *)self lastCallBundleID];
    double v8 = [(PLAppTimeService *)self lastCallTime];
    [(PLAppTimeService *)self updateInCallServiceTimeInDBForBundleId:v7 withTime:v8 withDate:v6];

    [(PLAppTimeService *)self setLastCallTime:v9];
  }
}

- (void)updateInCallServiceTimeInDBForBundleId:(id)a3 withTime:(double)a4 withDate:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(PLAppTimeService *)self inCallNow];
  if (a4 > 0.0 && v8 != 0 && v10)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F929D0]);
    long long v14 = [(PLAppTimeService *)self aggregatedEntryKeyForAppRunTime];
    uint64_t v15 = (void *)[v13 initWithEntryKey:v14 withDate:v9];

    [v15 setObject:v8 forKeyedSubscript:@"BundleID"];
    int v16 = [(PLAppTimeService *)self displayState];
    double v17 = @"InCallBackgroundTime";
    if (v16 == 1)
    {
      double v17 = @"InCallScreenOnTime";
      double v18 = @"ScreenOnPluggedInTime";
    }
    else
    {
      double v18 = @"BackgroundPluggedInTime";
    }
    uint64_t v19 = v17;
    uint64_t v20 = v18;
    long long v21 = [NSNumber numberWithInt:(int)a4];
    [v15 setObject:v21 forKeyedSubscript:v19];

    if ([(PLAppTimeService *)self deviceIsPluggedIn])
    {
      long long v22 = [NSNumber numberWithInt:(int)a4];
      [v15 setObject:v22 forKeyedSubscript:v20];
    }
    else
    {
      [v15 setObject:&unk_1F29E1C90 forKeyedSubscript:v20];
    }
    long long v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v9 sinceDate:(double)(int)a4];
    [(PLOperator *)self logProportionateAggregateEntry:v15 withStartDate:v9 withEndDate:v23];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v24 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__PLAppTimeService_updateInCallServiceTimeInDBForBundleId_withTime_withDate___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v24;
      if (qword_1EBD578D0 != -1) {
        dispatch_once(&qword_1EBD578D0, block);
      }
      if (byte_1EBD57823)
      {
        long long v25 = NSString;
        uint64_t v26 = [(PLAppTimeService *)self displayState];
        uint64_t v27 = [v15 objectForKeyedSubscript:@"BundleID"];
        __int16 v28 = [v15 objectForKeyedSubscript:v19];
        double v29 = [v15 objectForKeyedSubscript:@"BackgroundTime"];
        id v30 = [v25 stringWithFormat:@"Added InCallService screen state: %d %@ %@ %@", v26, v27, v28, v29];

        uint64_t v31 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAppTimeService.m"];
        uint64_t v33 = [v32 lastPathComponent];
        double v34 = [NSString stringWithUTF8String:"-[PLAppTimeService updateInCallServiceTimeInDBForBundleId:withTime:withDate:]"];
        [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:1537];

        uint64_t v35 = PLLogCommon();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          double v38 = v30;
          _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __77__PLAppTimeService_updateInCallServiceTimeInDBForBundleId_withTime_withDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57823 = result;
  return result;
}

- (void)addAudioTimeAtDate:(id)a3 forBundleID:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PLAppTimeService *)self audioPlaybackBundleIDs];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (!v9)
  {
    uint64_t v15 = PLLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412290;
      double v24 = *(double *)&v7;
      _os_log_error_impl(&dword_1D2690000, v15, OS_LOG_TYPE_ERROR, "audio: missing last info for %@", (uint8_t *)&v23, 0xCu);
    }
    goto LABEL_18;
  }
  [v6 timeIntervalSinceDate:v9];
  double v11 = v10;
  double v12 = [(PLAppTimeService *)self audioPlaybackBundleIDs];
  [v12 setObject:v6 forKeyedSubscript:v7];

  if (v11 > 0.0)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F929D0]);
    long long v14 = [(PLAppTimeService *)self aggregatedEntryKeyForAppRunTime];
    uint64_t v15 = [v13 initWithEntryKey:v14 withDate:v6];

    [v15 setObject:v7 forKeyedSubscript:@"BundleID"];
    if ([v7 isEqualToString:@"com.apple.Music"])
    {
      if ([(PLAppTimeService *)self musicPlayerForeground])
      {
LABEL_18:

        goto LABEL_19;
      }
      int v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 134217984;
        double v24 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "audio: incrementing Music's BG time by %.2f", (uint8_t *)&v23, 0xCu);
      }

      double v17 = [NSNumber numberWithDouble:v11];
      [v15 setObject:v17 forKeyedSubscript:@"BackgroundTime"];

      if ([(PLAppTimeService *)self deviceIsPluggedIn])
      {
        double v18 = [NSNumber numberWithDouble:v11];
        [v15 setObject:v18 forKeyedSubscript:@"BackgroundPluggedInTime"];
      }
      else
      {
        [v15 setObject:&unk_1F29E1C90 forKeyedSubscript:@"BackgroundPluggedInTime"];
      }
    }
    uint64_t v19 = [NSNumber numberWithDouble:v11];
    [v15 setObject:v19 forKeyedSubscript:@"BackgroundAudioPlayingTime"];

    if ([(PLAppTimeService *)self deviceIsPluggedIn])
    {
      uint64_t v20 = [NSNumber numberWithDouble:v11];
      [v15 setObject:v20 forKeyedSubscript:@"BackgroundAudioPlayingTimePluggedIn"];
    }
    else
    {
      [v15 setObject:&unk_1F29E1C90 forKeyedSubscript:@"BackgroundAudioPlayingTimePluggedIn"];
    }
    long long v21 = PLLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      BOOL v22 = [(PLAppTimeService *)self deviceIsPluggedIn];
      int v23 = 138412802;
      double v24 = *(double *)&v7;
      __int16 v25 = 2048;
      double v26 = v11;
      __int16 v27 = 1024;
      BOOL v28 = v22;
      _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "audio: adding to %@ playback time: %.2f pluggedIn:%d", (uint8_t *)&v23, 0x1Cu);
    }

    [(PLOperator *)self logProportionateAggregateEntry:v15 withStartDate:v9 withEndDate:v6];
    [(PLAppTimeService *)self addAudioUseFromforBundleID:v7 AtDate:v6];
    goto LABEL_18;
  }
LABEL_19:
}

- (void)addAudioAndLocationTimeAtDate:(id)a3
{
  id v22 = a3;
  uint64_t v4 = [(PLAppTimeService *)self statusBarBundleID];
  if (v4)
  {
    double v5 = (void *)v4;
    id v6 = [(PLAppTimeService *)self appsOnScreen];
    id v7 = [(PLAppTimeService *)self statusBarBundleID];
    char v8 = [v6 containsObject:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = [(PLAppTimeService *)self audioPlaybackBundleIDs];
      double v10 = [(PLAppTimeService *)self statusBarBundleID];
      double v11 = [v9 objectForKey:v10];

      if (v11)
      {
        double v12 = [(PLAppTimeService *)self lastStatusBarTime];
        id v13 = [v12 laterDate:v11];

        [v22 timeIntervalSinceDate:v13];
        if (v14 > 0.0)
        {
          double v15 = v14;
          id v16 = objc_alloc(MEMORY[0x1E4F929D0]);
          double v17 = [(PLAppTimeService *)self aggregatedEntryKeyForAppRunTime];
          double v18 = (void *)[v16 initWithEntryKey:v17 withDate:v22];

          uint64_t v19 = [(PLAppTimeService *)self statusBarBundleID];
          [v18 setObject:v19 forKeyedSubscript:@"BundleID"];

          uint64_t v20 = [NSNumber numberWithDouble:v15];
          [v18 setObject:v20 forKeyedSubscript:@"BackgroundLocationAudioTime"];

          if ([(PLAppTimeService *)self deviceIsPluggedIn])
          {
            long long v21 = [NSNumber numberWithDouble:v15];
            [v18 setObject:v21 forKeyedSubscript:@"BackgroundLocationAudioPluggedInTime"];
          }
          else
          {
            [v18 setObject:&unk_1F29E1C90 forKeyedSubscript:@"BackgroundLocationAudioPluggedInTime"];
          }
          [(PLOperator *)self logProportionateAggregateEntry:v18 withStartDate:v13 withEndDate:v22];
        }
      }
    }
  }
}

- (void)addNotificationCountFromUserInfo:(id)a3 AtDate:(id)a4
{
  double v5 = objc_msgSend(a3, "objectForKey:", @"entry", a4);
  id v6 = [v5 objectForKeyedSubscript:@"NotificationBundleID"];
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v9 = 0;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Added app usage event: Notification", v9, 2u);
  }

  char v8 = [v5 entryDate];
  [(PLAppTimeService *)self logAppUsageEventForKey:@"NotificationCount" withBundleID:v6 withDate:v8];
}

- (void)addWidgetUseFromUserInfo:(id)a3 AtDate:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v5 = objc_msgSend(a3, "objectForKey:", @"entry", a4);
  id v6 = [v5 objectForKeyedSubscript:@"bundleID"];
  id v7 = [(PLAppTimeService *)self getWidgetParentAppForBundleID:v6];

  if (v7)
  {
    char v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      double v11 = v7;
      _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Added app usage event: Widget for bundleid  %@", (uint8_t *)&v10, 0xCu);
    }

    id v9 = [v5 entryDate];
    [(PLAppTimeService *)self logAppUsageEventForKey:@"HasWidgetActive" withBundleID:v7 withDate:v9];
  }
}

- (id)getWidgetParentAppForBundleID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  double v5 = [(PLAppTimeService *)self widgetParentBundleIDs];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    char v8 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"PluginId" withValue:v4 withComparisonOperation:0];
    int v10 = [MEMORY[0x1E4F92AD0] sharedCore];
    double v11 = [v10 storage];
    double v18 = v8;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    id v13 = [v11 entriesForKey:@"PLApplicationAgent_EventNone_AllPlugins" withComparisons:v12];

    if ([v13 count])
    {
      double v14 = [v13 firstObject];
      id v9 = [v14 objectForKeyedSubscript:@"PluginParentApp"];
      double v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v14;
        _os_log_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEFAULT, "Added app usage event queryResult= %@", buf, 0xCu);
      }

      if (v9)
      {
        [(NSMutableDictionary *)self->_widgetParentBundleIDs setObject:v9 forKeyedSubscript:v4];
LABEL_14:

        goto LABEL_15;
      }
    }
    double v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v4;
      _os_log_error_impl(&dword_1D2690000, v14, OS_LOG_TYPE_ERROR, "App usage event: unable to find widget's parent id for %@", buf, 0xCu);
    }
    id v9 = 0;
    goto LABEL_14;
  }
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    double v17 = [(NSMutableDictionary *)self->_widgetParentBundleIDs objectForKeyedSubscript:v4];
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v17;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Added app usage event cached widget =%@", buf, 0xCu);
  }
  char v8 = [(PLAppTimeService *)self widgetParentBundleIDs];
  id v9 = [v8 objectForKeyedSubscript:v4];
LABEL_15:

  return v9;
}

- (void)addAudioUseFromforBundleID:(id)a3 AtDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v9 = 0;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Added app usage event: Audio", v9, 2u);
  }

  [(PLAppTimeService *)self logAppUsageEventForKey:@"HasAudioUsage" withBundleID:v7 withDate:v6];
}

- (void)logAppUsageEventForKey:(id)a3 withBundleID:(id)a4 withDate:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    double v11 = [objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:self->_aggregatedEntryKeyForAppUsageEvents withDate:v10];
    [v11 setObject:v9 forKeyedSubscript:@"BundleID"];
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v8];
    [(PLOperator *)self logEntry:v11];
    uint64_t v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      double v14 = v11;
      _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "App usage event: adding %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    double v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "App usage event: unable to log nil bundle id", (uint8_t *)&v13, 2u);
    }
  }
}

- (id)backgroundAppToBundleIDmapping
{
  backgroundAppToBundleID = self->_backgroundAppToBundleID;
  if (!backgroundAppToBundleID)
  {
    self->_backgroundAppToBundleID = (NSDictionary *)&unk_1F29E8B68;
    backgroundAppToBundleID = self->_backgroundAppToBundleID;
  }
  return backgroundAppToBundleID;
}

- (void)updateAggregationsAtDate:(id)a3 withNewScreenState:(int)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [MEMORY[0x1E4F92A38] isHomePod];
  if (v6 && (v7 & 1) == 0)
  {
    if ([(PLAppTimeService *)self displayState] == a4)
    {
      id v8 = PLLogCommon();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
LABEL_10:

        goto LABEL_11;
      }
      LOWORD(v19) = 0;
      id v9 = "No screen state change!";
LABEL_6:
      _os_log_impl(&dword_1D2690000, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v19, 2u);
      goto LABEL_10;
    }
    if (a4 == 1)
    {
      [(PLAppTimeService *)self setLastScreenOnTimeSBC:v6];
      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 138412290;
        id v20 = v6;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Starting FG interval at %@", (uint8_t *)&v19, 0xCu);
      }
      goto LABEL_10;
    }
    id v10 = [(PLAppTimeService *)self lastScreenOnTimeSBC];

    if (!v10)
    {
      id v8 = PLLogCommon();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
      LOWORD(v19) = 0;
      id v9 = "Screen turning off, but no open screen interval";
      goto LABEL_6;
    }
    double v11 = [(PLAppTimeService *)self lastScreenOnTimeSBC];
    [v6 timeIntervalSinceDate:v11];
    double v13 = v12;

    double v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      double v17 = [(PLAppTimeService *)self lastScreenOnTimeSBC];
      int v19 = 138412802;
      id v20 = v17;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2048;
      double v24 = v13;
      _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "Stopping FG interval [%@, %@] : %f", (uint8_t *)&v19, 0x20u);
    }
    [(PLAppTimeService *)self setLastScreenOnTimeSBC:0];
    if (v13 >= 0.0)
    {
      [(PLAppTimeService *)self totalFGTimeSBC];
      [(PLAppTimeService *)self setTotalFGTimeSBC:v13 + v15];
      id v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        [(PLAppTimeService *)self totalFGTimeSBC];
        int v19 = 134217984;
        id v20 = v18;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "New FG time since SBC: %f", (uint8_t *)&v19, 0xCu);
      }

      [(PLAppTimeService *)self updateScreenOnTimeAtDate:v6 withDiff:v13];
    }
  }
LABEL_11:
}

- (void)updateAggregationsAtDate:(id)a3 withNewAPState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [MEMORY[0x1E4F92A38] isHomePod];
  if (!v6 || (v7 & 1) != 0) {
    goto LABEL_33;
  }
  if (self->_isAPOn == v4)
  {
    id v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v35) = 0;
      _os_log_error_impl(&dword_1D2690000, v8, OS_LOG_TYPE_ERROR, "No AP state change!", (uint8_t *)&v35, 2u);
    }
    goto LABEL_32;
  }
  if (v4)
  {
    [(PLAppTimeService *)self setLastAPOnTimeSBC:v6];
    id v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v35 = 138412290;
      id v36 = v6;
      id v9 = "Starting APOn interval at %@";
LABEL_31:
      _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v35, 0xCu);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  id v10 = [(PLAppTimeService *)self lastScreenOnTimeSBC];

  if (v10)
  {
    double v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v35) = 0;
      _os_log_error_impl(&dword_1D2690000, v11, OS_LOG_TYPE_ERROR, "Screen on interval is open, but AP is going down!", (uint8_t *)&v35, 2u);
    }

    double v12 = [(PLAppTimeService *)self lastScreenOnTimeSBC];
    [v6 timeIntervalSinceDate:v12];
    double v14 = v13;

    [(PLAppTimeService *)self setLastScreenOnTimeSBC:0];
    if (v14 >= 0.0)
    {
      [(PLAppTimeService *)self totalFGTimeSBC];
      [(PLAppTimeService *)self setTotalFGTimeSBC:v14 + v15];
      id v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        [(PLAppTimeService *)self totalFGTimeSBC];
        int v35 = 134217984;
        id v36 = v34;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "New FG time since SBC: %f", (uint8_t *)&v35, 0xCu);
      }

      [(PLAppTimeService *)self updateScreenOnTimeAtDate:v6 withDiff:v14];
    }
  }
  double v17 = [(PLAppTimeService *)self lastAPOnTimeSBC];

  if (!v17)
  {
    id v22 = PLLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v35) = 0;
      _os_log_error_impl(&dword_1D2690000, v22, OS_LOG_TYPE_ERROR, "AP is going down, but AP interval isn't open", (uint8_t *)&v35, 2u);
    }
    goto LABEL_24;
  }
  [v6 timeIntervalSinceDate:self->_lastAPOnTimeSBC];
  double v19 = v18;
  id v20 = PLLogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = [(PLAppTimeService *)self lastAPOnTimeSBC];
    int v35 = 138412802;
    id v36 = v32;
    __int16 v37 = 2112;
    id v38 = v6;
    __int16 v39 = 2048;
    double v40 = v19;
    _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "Stopping AP interval [%@, %@] : %f", (uint8_t *)&v35, 0x20u);
  }
  [(PLAppTimeService *)self setLastAPOnTimeSBC:0];
  if (v19 > 0.0)
  {
    [(PLAppTimeService *)self totalAPOnTimeSBC];
    [(PLAppTimeService *)self setTotalAPOnTimeSBC:v19 + v21];
    id v22 = PLLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      [(PLAppTimeService *)self totalAPOnTimeSBC];
      int v35 = 134217984;
      id v36 = v23;
      _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "New AP time since SBC: %f", (uint8_t *)&v35, 0xCu);
    }
LABEL_24:
  }
  double v24 = [(PLAppTimeService *)self firstBGAppTimeSBC];

  if (v24)
  {
    uint64_t v25 = [(PLAppTimeService *)self firstBGAppTimeSBC];
    [v6 timeIntervalSinceDate:v25];
    double v27 = v26;

    BOOL v28 = PLLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = [(PLAppTimeService *)self firstBGAppTimeSBC];
      int v35 = 138412802;
      id v36 = v33;
      __int16 v37 = 2112;
      id v38 = v6;
      __int16 v39 = 2048;
      double v40 = v27;
      _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "Stopping BG interval [%@, %@] : %f", (uint8_t *)&v35, 0x20u);
    }
    [(PLAppTimeService *)self setFirstBGAppTimeSBC:0];
    if (v27 > 0.0)
    {
      [(PLAppTimeService *)self totalBGTimeSBC];
      [(PLAppTimeService *)self setTotalBGTimeSBC:v27 + v29];
      [(PLAppTimeService *)self addCellularConditionTimeAtDate:v6];
      id v30 = [(PLAppTimeService *)self bundleIDsInBackground];
      [v30 removeAllObjects];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        [(PLAppTimeService *)self totalBGTimeSBC];
        int v35 = 134217984;
        id v36 = v31;
        id v9 = "New BG time since SBC: %f";
        goto LABEL_31;
      }
LABEL_32:
    }
  }
LABEL_33:
}

- (void)updateAggregationsAtDate:(id)a3 withNewPluggedInState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_deviceIsPluggedIn != v4)
  {
    if (v4)
    {
      double v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v22) = 0;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "starting plugged in interval", (uint8_t *)&v22, 2u);
      }

      goto LABEL_13;
    }
    double v17 = [(PLAppTimeService *)self lastPluggedInTime];

    if (v17)
    {
      double v18 = [(PLAppTimeService *)self lastPluggedInTime];
      [v6 timeIntervalSinceDate:v18];
      double v20 = v19;

      [(PLAppTimeService *)self updatePluggedInTimeAtDate:v6 withDiff:v20];
      double v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        int v22 = 134217984;
        double v23 = v20;
        _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "stopping plugged in interval %.2fs since last update", (uint8_t *)&v22, 0xCu);
      }

      double v14 = self;
      id v15 = 0;
      goto LABEL_20;
    }
    id v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_error_impl(&dword_1D2690000, v16, OS_LOG_TYPE_ERROR, "unplugged without plugged in start", (uint8_t *)&v22, 2u);
    }
LABEL_23:

    goto LABEL_24;
  }
  char v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v22) = 0;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "periodic plugged in update", (uint8_t *)&v22, 2u);
  }

  if (!v4)
  {
    id v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v22) = 0;
      _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "device is not plugged in", (uint8_t *)&v22, 2u);
    }
    goto LABEL_23;
  }
  id v8 = [(PLAppTimeService *)self lastPluggedInTime];

  if (v8)
  {
    id v9 = [(PLAppTimeService *)self lastPluggedInTime];
    [v6 timeIntervalSinceDate:v9];
    double v11 = v10;

    double v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v22 = 134217984;
      double v23 = v11;
      _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "device has been plugged in for %.2fs since last update", (uint8_t *)&v22, 0xCu);
    }

    [(PLAppTimeService *)self updatePluggedInTimeAtDate:v6 withDiff:v11];
  }
LABEL_13:
  double v14 = self;
  id v15 = v6;
LABEL_20:
  [(PLAppTimeService *)v14 setLastPluggedInTime:v15];
LABEL_24:
}

- (void)updatePluggedInTimeAtDate:(id)a3 withDiff:(double)a4
{
  if (a3 && a4 >= 0.0)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F929D0];
    id v7 = a3;
    id v8 = [v6 alloc];
    id v9 = [(PLAppTimeService *)self entryKeyUsageTime];
    id v12 = (id)[v8 initWithEntryKey:v9 withDate:v7];

    double v10 = [NSNumber numberWithDouble:a4];
    [v12 setObject:v10 forKeyedSubscript:@"PluggedIn"];

    double v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v7 sinceDate:-a4];
    [(PLOperator *)self logProportionateAggregateEntry:v12 withStartDate:v11 withEndDate:v7];
  }
}

- (id)generateExcludedBGBundleIDs
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    id v2 = 0;
  }
  else
  {
    id v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.Bridge", @"com.apple.CloudKit.ShareBear", @"com.apple.PassbookUIService", 0);
  }
  return v2;
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  uint64_t v4 = *MEMORY[0x1E4F92D20];
  id v5 = a3;
  id v6 = +[PLOperator entryKeyForType:v4 andName:@"AppRunTime"];
  LODWORD(v4) = [v5 isEqualToString:v6];

  if (v4)
  {
    id v7 = NSString;
    id v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    id v9 = [v8 dateByAddingTimeInterval:-1209600.0];
    [v9 timeIntervalSince1970];
    uint64_t v11 = v10;
    id v12 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    double v13 = [v12 dateByAddingTimeInterval:-1209600.0];
    [v13 timeIntervalSince1970];
    uint64_t v15 = v14;
    id v16 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    double v17 = [v16 dateByAddingTimeInterval:-2592000.0];
    [v17 timeIntervalSince1970];
    double v19 = objc_msgSend(v7, "stringWithFormat:", @"(timeInterval = %f AND timestamp < %f) OR (timeInterval = %f AND timestamp < %f AND (BundleID NOT IN (SELECT N.Name FROM PLAccountingOperator_Aggregate_RootNodeEnergy RNE JOIN PLAccountingOperator_EventNone_Nodes N WHERE N.ID = RNE.NodeID AND RNE.timeInterval = 86400.0 AND RNE.Energy > %f GROUP BY RNE.NodeID))) OR (timeInterval = %f AND timestamp < %f)", 0x40AC200000000000, v11, 0x40F5180000000000, v15, 0x40F86A0000000000, 0x40F5180000000000, v18);
  }
  else
  {
    double v19 = 0;
  }
  return v19;
}

- (PLEntryNotificationOperatorComposition)coalitionCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCoalitionCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)screenstateCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setScreenstateCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)applicationCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setApplicationCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBatteryCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)displayCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisplayCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)InCallServiceCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInCallServiceCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)pluginCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPluginCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)audioCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAudioCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)nowPlayingCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNowPlayingCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)statusBarCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setStatusBarCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)backgroundTransferCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBackgroundTransferCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)cellularConditionCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCellularConditionCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)telephonyRegistrationCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTelephonyRegistrationCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)notificationCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setNotificationCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)widgetCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setWidgetCallback:(id)a3
{
}

- (PLNSNotificationOperatorComposition)powerOutCallback
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setPowerOutCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)canSleepEntryNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (PLEntryNotificationOperatorComposition)wakeEntryNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDisplayState:(int)a3
{
  self->_displayState = a3;
}

- (void)setIsAPOn:(BOOL)a3
{
  self->_isAPOn = a3;
}

- (void)setLastScreenOnTime:(id)a3
{
}

- (void)setInFlightBundleIDStartTime:(id)a3
{
}

- (PLTimer)runTimeAggregatorTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRunTimeAggregatorTimer:(id)a3
{
}

- (BOOL)inCallNow
{
  return self->_inCallNow;
}

- (void)setInCallNow:(BOOL)a3
{
  self->_inCallNow = a3;
}

- (NSDate)lastCallTime
{
  return (NSDate *)objc_getProperty(self, a2, 264, 1);
}

- (void)setLastCallTime:(id)a3
{
}

- (NSString)lastCallBundleID
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setLastCallBundleID:(id)a3
{
}

- (NSMutableSet)coalitionsAppsOnScreen
{
  return (NSMutableSet *)objc_getProperty(self, a2, 280, 1);
}

- (void)setCoalitionsAppsOnScreen:(id)a3
{
}

- (void)setAppsOnScreen:(id)a3
{
}

- (void)setPiPModeApps:(id)a3
{
}

- (NSMutableSet)watchkitExtensions
{
  return (NSMutableSet *)objc_getProperty(self, a2, 304, 1);
}

- (void)setWatchkitExtensions:(id)a3
{
}

- (NSMutableDictionary)widgetParentBundleIDs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 312, 1);
}

- (void)setWidgetParentBundleIDs:(id)a3
{
}

- (void)setNowPlayingBundleID:(id)a3
{
}

- (void)setStatusBarBundleID:(id)a3
{
}

- (BOOL)musicPlayerForeground
{
  return self->_musicPlayerForeground;
}

- (void)setMusicPlayerForeground:(BOOL)a3
{
  self->_musicPlayerForeground = a3;
}

- (NSDate)lastNowPlayingTime
{
  return (NSDate *)objc_getProperty(self, a2, 336, 1);
}

- (NSDate)lastStatusBarTime
{
  return (NSDate *)objc_getProperty(self, a2, 344, 1);
}

- (int64_t)lastSignalBar
{
  return self->_lastSignalBar;
}

- (void)setLastSignalBar:(int64_t)a3
{
  self->_lastSignalBar = a3;
}

- (void)setLastTelephonyRegistrationStatus:(BOOL)a3
{
  self->_lastTelephonyRegistrationStatus = a3;
}

- (void)setLastAirplaneModeStatus:(BOOL)a3
{
  self->_lastAirplaneModeStatus = a3;
}

- (void)setAudioPlaybackBundleIDs:(id)a3
{
}

- (void)setAggregatedEntryKeyForAppRunTime:(id)a3
{
}

- (NSString)aggregatedEntryKeyForAppUsageEvents
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setAggregatedEntryKeyForAppUsageEvents:(id)a3
{
}

- (void)setEntryKeyUsageTime:(id)a3
{
}

- (void)setBundleIDsInBackground:(id)a3
{
}

- (void)setExcludedBundleIDsInBackground:(id)a3
{
}

- (NSDate)lastPluggedInTime
{
  return (NSDate *)objc_getProperty(self, a2, 488, 1);
}

- (void)setLastPluggedInTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPluggedInTime, 0);
  objc_storeStrong((id *)&self->_excludedBundleIDsInBackground, 0);
  objc_storeStrong((id *)&self->_firstBGAppTimeSBC, 0);
  objc_storeStrong((id *)&self->_bundleIDsInBackground, 0);
  objc_storeStrong((id *)&self->_lastScreenOnTimeSBC, 0);
  objc_storeStrong((id *)&self->_lastAPOnTimeSBC, 0);
  objc_storeStrong((id *)&self->_entryKeyUsageTime, 0);
  objc_storeStrong((id *)&self->_backgroundAppToBundleID, 0);
  objc_storeStrong((id *)&self->_entryKeyPLCoalitionAgentEventIntervalCoalition, 0);
  objc_storeStrong((id *)&self->_entryKeyPLScreenStateAgentScreenState, 0);
  objc_storeStrong((id *)&self->_aggregatedEntryKeyForAppUsageEvents, 0);
  objc_storeStrong((id *)&self->_aggregatedEntryKeyForAppRunTime, 0);
  objc_storeStrong((id *)&self->_audioPlaybackBundleIDs, 0);
  objc_storeStrong((id *)&self->_lastCellularConditionTime, 0);
  objc_storeStrong((id *)&self->_lastStatusBarTime, 0);
  objc_storeStrong((id *)&self->_lastNowPlayingTime, 0);
  objc_storeStrong((id *)&self->_statusBarBundleID, 0);
  objc_storeStrong((id *)&self->_nowPlayingBundleID, 0);
  objc_storeStrong((id *)&self->_widgetParentBundleIDs, 0);
  objc_storeStrong((id *)&self->_watchkitExtensions, 0);
  objc_storeStrong((id *)&self->_PiPModeApps, 0);
  objc_storeStrong((id *)&self->_appsOnScreen, 0);
  objc_storeStrong((id *)&self->_coalitionsAppsOnScreen, 0);
  objc_storeStrong((id *)&self->_lastCallBundleID, 0);
  objc_storeStrong((id *)&self->_lastCallTime, 0);
  objc_storeStrong((id *)&self->_excludedBGAppsSet, 0);
  objc_storeStrong((id *)&self->_excludedFGAppsSet, 0);
  objc_storeStrong((id *)&self->_lastLayoutEntries, 0);
  objc_storeStrong((id *)&self->_runTimeAggregatorTimer, 0);
  objc_storeStrong((id *)&self->_inFlightBundleIDStartTime, 0);
  objc_storeStrong((id *)&self->_lastScreenEventAccountingTime, 0);
  objc_storeStrong((id *)&self->_lastScreenOnTime, 0);
  objc_storeStrong((id *)&self->_wakeEntryNotifications, 0);
  objc_storeStrong((id *)&self->_canSleepEntryNotifications, 0);
  objc_storeStrong((id *)&self->_powerOutCallback, 0);
  objc_storeStrong((id *)&self->_widgetCallback, 0);
  objc_storeStrong((id *)&self->_notificationCallback, 0);
  objc_storeStrong((id *)&self->_telephonyRegistrationCallback, 0);
  objc_storeStrong((id *)&self->_cellularConditionCallback, 0);
  objc_storeStrong((id *)&self->_backgroundTransferCallback, 0);
  objc_storeStrong((id *)&self->_statusBarCallback, 0);
  objc_storeStrong((id *)&self->_nowPlayingCallback, 0);
  objc_storeStrong((id *)&self->_audioCallback, 0);
  objc_storeStrong((id *)&self->_pluginCallback, 0);
  objc_storeStrong((id *)&self->_InCallServiceCallback, 0);
  objc_storeStrong((id *)&self->_displayCallback, 0);
  objc_storeStrong((id *)&self->_batteryCallback, 0);
  objc_storeStrong((id *)&self->_applicationCallback, 0);
  objc_storeStrong((id *)&self->_screenstateCallback, 0);
  objc_storeStrong((id *)&self->_coalitionCallback, 0);
}

@end