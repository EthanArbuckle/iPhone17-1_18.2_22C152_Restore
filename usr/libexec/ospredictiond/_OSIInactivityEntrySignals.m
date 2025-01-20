@interface _OSIInactivityEntrySignals
- (BOOL)aodAlreadySuppressedOrOff;
- (BOOL)areInactiveHeuristicsMet;
- (BOOL)areSleepHeuristicsMet;
- (BOOL)canAlwaysReadLux;
- (BOOL)checkInactivitySignalsWithTimeSinceInactive:(double)a3;
- (BOOL)checkSleepSignalsWithTimeSinceInactive:(double)a3 andPredictorType:(id)a4;
- (BOOL)excludeNegativeLux;
- (BOOL)hasRecentPlaybackChange;
- (BOOL)inCar;
- (BOOL)inSleepWindow;
- (BOOL)pluggedIn;
- (BOOL)useSleep;
- (OSIAmbientLightMonitor)lightMonitor;
- (OSIBLSStateMonitor)blsStateMonitor;
- (OSIMediaPlaybackMonitor)mediaPlaybackMonitor;
- (OSIMotionMonitor)motionMonitor;
- (OSISleepScheduleMonitor)sleepScheduleMonitor;
- (OS_os_log)log;
- (TRIClient)trialClient;
- (_OSIInactivityEntrySignals)init;
- (double)bedtimeOffset;
- (double)dynamicMinPctStationaryThresholdSinceWait:(double)a3;
- (double)immediateMinPctStationaryThreshold;
- (double)initialMinPctStationaryThreshold;
- (double)maxPlaybackThreshold;
- (double)minPctStationaryThreshold;
- (double)pctStationary;
- (double)playbackLookbackSeconds;
- (double)secondsSinceWait;
- (double)stationaryLookbackSeconds;
- (double)wakeOffset;
- (id)description;
- (int)dynamicMaxDarkLuxThresholdSinceWait:(double)a3;
- (int)immediateMaxDarkLuxThreshold;
- (int)initialMaxDarkLuxThreshold;
- (int)lux;
- (int)maxDarkLuxThreshold;
- (int)requeryDelta;
- (void)setAodAlreadySuppressedOrOff:(BOOL)a3;
- (void)setAreInactiveHeuristicsMet:(BOOL)a3;
- (void)setAreSleepHeuristicsMet:(BOOL)a3;
- (void)setBedtimeOffset:(double)a3;
- (void)setBlsStateMonitor:(id)a3;
- (void)setCanAlwaysReadLux:(BOOL)a3;
- (void)setExcludeNegativeLux:(BOOL)a3;
- (void)setHasRecentPlaybackChange:(BOOL)a3;
- (void)setImmediateMaxDarkLuxThreshold:(int)a3;
- (void)setImmediateMinPctStationaryThreshold:(double)a3;
- (void)setInCar:(BOOL)a3;
- (void)setInSleepWindow:(BOOL)a3;
- (void)setInitialMaxDarkLuxThreshold:(int)a3;
- (void)setInitialMinPctStationaryThreshold:(double)a3;
- (void)setLightMonitor:(id)a3;
- (void)setLog:(id)a3;
- (void)setLux:(int)a3;
- (void)setMaxDarkLuxThreshold:(int)a3;
- (void)setMaxPlaybackThreshold:(double)a3;
- (void)setMediaPlaybackMonitor:(id)a3;
- (void)setMinPctStationaryThreshold:(double)a3;
- (void)setMotionMonitor:(id)a3;
- (void)setPctStationary:(double)a3;
- (void)setPlaybackLookbackSeconds:(double)a3;
- (void)setPluggedIn:(BOOL)a3;
- (void)setRequeryDelta:(int)a3;
- (void)setSecondsSinceWait:(double)a3;
- (void)setSleepScheduleMonitor:(id)a3;
- (void)setStationaryLookbackSeconds:(double)a3;
- (void)setTrialClient:(id)a3;
- (void)setUseSleep:(BOOL)a3;
- (void)setWakeOffset:(double)a3;
- (void)updateTrialParameters;
@end

@implementation _OSIInactivityEntrySignals

- (_OSIInactivityEntrySignals)init
{
  v23.receiver = self;
  v23.super_class = (Class)_OSIInactivityEntrySignals;
  v2 = [(_OSIInactivityEntrySignals *)&v23 init];
  if (v2)
  {
    v3 = objc_alloc_init(OSIAmbientLightMonitor);
    lightMonitor = v2->_lightMonitor;
    v2->_lightMonitor = v3;

    v5 = objc_alloc_init(OSIMotionMonitor);
    motionMonitor = v2->_motionMonitor;
    v2->_motionMonitor = v5;

    v7 = objc_alloc_init(OSIMediaPlaybackMonitor);
    mediaPlaybackMonitor = v2->_mediaPlaybackMonitor;
    v2->_mediaPlaybackMonitor = v7;

    v9 = objc_alloc_init(OSISleepScheduleMonitor);
    sleepScheduleMonitor = v2->_sleepScheduleMonitor;
    v2->_sleepScheduleMonitor = v9;

    v11 = objc_alloc_init(OSIBLSStateMonitor);
    blsStateMonitor = v2->_blsStateMonitor;
    v2->_blsStateMonitor = v11;

    uint64_t v13 = +[TRIClient clientWithIdentifier:293];
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v13;

    [(_OSIInactivityEntrySignals *)v2 updateTrialParameters];
    objc_initWeak(&location, v2);
    v15 = v2->_trialClient;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000E04C;
    v20[3] = &unk_1000648F0;
    objc_copyWeak(&v21, &location);
    id v16 = [(TRIClient *)v15 addUpdateHandlerForNamespaceName:@"COREOS_PREDICTION_INACTIVITY" usingBlock:v20];
    os_log_t v17 = os_log_create("com.apple.osintelligence", "sleep.signals");
    log = v2->_log;
    v2->_log = (OS_os_log *)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)updateTrialParameters
{
  v3 = [(TRIClient *)self->_trialClient levelForFactor:@"requeryDelta" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  self->_requeryDelta = [v3 longValue];

  v4 = [(TRIClient *)self->_trialClient levelForFactor:@"darkLuxThreshold" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  self->_maxDarkLuxThreshold = [v4 longValue];

  v5 = [(TRIClient *)self->_trialClient levelForFactor:@"signalsNegativeLuxPreventsEngagement" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  self->_excludeNegativeLux = [v5 BOOLeanValue];

  v6 = [(TRIClient *)self->_trialClient levelForFactor:@"immediateDarkLuxThreshold" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  self->_immediateMaxDarkLuxThreshold = [v6 longValue];

  v7 = [(TRIClient *)self->_trialClient levelForFactor:@"initialDarkLuxThreshold" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  self->_initialMaxDarkLuxThreshold = [v7 longValue];

  v8 = [(TRIClient *)self->_trialClient levelForFactor:@"pctStationary" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v8 doubleValue];
  self->_minPctStationaryThreshold = v9;

  v10 = [(TRIClient *)self->_trialClient levelForFactor:@"stationaryLookback" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v10 doubleValue];
  self->_stationaryLookbackSeconds = v11;

  v12 = [(TRIClient *)self->_trialClient levelForFactor:@"immediatePctStationary" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v12 doubleValue];
  self->_immediateMinPctStationaryThreshold = v13;

  v14 = [(TRIClient *)self->_trialClient levelForFactor:@"initialPctStationary" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v14 doubleValue];
  self->_initialMinPctStationaryThreshold = v15;

  id v16 = [(TRIClient *)self->_trialClient levelForFactor:@"playbackThreshold" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v16 doubleValue];
  self->_maxPlaybackThreshold = v17;

  v18 = [(TRIClient *)self->_trialClient levelForFactor:@"playbackLookback" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v18 doubleValue];
  self->_playbackLookbackSeconds = v19;

  v20 = [(TRIClient *)self->_trialClient levelForFactor:@"useSleep" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  self->_useSleep = [v20 BOOLeanValue];

  id v21 = [(TRIClient *)self->_trialClient levelForFactor:@"bedtimeOffset" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v21 doubleValue];
  self->_bedtimeOffset = v22;

  id v24 = [(TRIClient *)self->_trialClient levelForFactor:@"wakeOffset" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v24 doubleValue];
  self->_wakeOffset = v23;
}

- (BOOL)checkSleepSignalsWithTimeSinceInactive:(double)a3 andPredictorType:(id)a4
{
  id v6 = a4;
  v7 = +[NSDate date];
  signed int v8 = [(_OSIInactivityEntrySignals *)self dynamicMaxDarkLuxThresholdSinceWait:a3];
  self->_int lux = [(OSIAmbientLightMonitor *)self->_lightMonitor currentAmbientLightLevel];
  int v9 = MGGetBoolAnswer();
  self->_canAlwaysReadLux = v9;
  if (v9)
  {
    int lux = self->_lux;
    if (lux >= v8 || (int v11 = 1, lux < 0) && self->_excludeNegativeLux)
    {
      log = self->_log;
      int v11 = 0;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = self->_lux;
        int v37 = 67109376;
        *(_DWORD *)v38 = v13;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Restricting entry because lux is %d (>= %d)", (uint8_t *)&v37, 0xEu);
        int v11 = 0;
      }
    }
  }
  else
  {
    int v11 = 1;
  }
  BOOL v14 = [(OSIBLSStateMonitor *)self->_blsStateMonitor aodOffOrSuppressed];
  self->_aodAlreadySuppressedOrOff = v14;
  if (v14)
  {
    double v15 = self->_log;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Restricting entry because already suppressed", (uint8_t *)&v37, 2u);
    }
    [(_OSIInactivityEntrySignals *)self dynamicMinPctStationaryThresholdSinceWait:a3];
    double v17 = v16;
    goto LABEL_14;
  }
  [(_OSIInactivityEntrySignals *)self dynamicMinPctStationaryThresholdSinceWait:a3];
  double v17 = v18;
  if (!v11)
  {
LABEL_14:
    int v20 = 0;
    double v19 = 1.0;
    goto LABEL_15;
  }
  [(OSIMotionMonitor *)self->_motionMonitor percentStationaryOverDuration:self->_stationaryLookbackSeconds];
  int v20 = 1;
LABEL_15:
  self->_double pctStationary = v19;
  BOOL v21 = [(OSIMotionMonitor *)self->_motionMonitor currentlyInCar];
  self->_BOOL inCar = v21;
  if (self->_pctStationary < v17 || v21)
  {
    v26 = self->_log;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
    {
      double pctStationary = self->_pctStationary;
      BOOL inCar = self->_inCar;
      int v37 = 134218496;
      *(double *)v38 = pctStationary;
      *(_WORD *)&v38[8] = 2048;
      double v39 = v17;
      __int16 v40 = 1024;
      BOOL v41 = inCar;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, "Restricting entry because stationary for only %.2f (< %.2f) or Auto=%u", (uint8_t *)&v37, 0x1Cu);
    }
    goto LABEL_24;
  }
  if (!v20)
  {
LABEL_24:
    BOOL v25 = 0;
    self->_hasRecentPlaybackChange = 0;
LABEL_25:
    BOOL v29 = 1;
    goto LABEL_26;
  }
  BOOL v22 = [(OSIMediaPlaybackMonitor *)self->_mediaPlaybackMonitor hasPlaybackStateChangeRecently:self->_playbackLookbackSeconds];
  self->_hasRecentPlaybackChange = v22;
  if (v22)
  {
    double v23 = self->_log;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      double v24 = self->_playbackLookbackSeconds / 60.0;
      int v37 = 134217984;
      *(double *)v38 = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Restricting entry because of recent playback state change in the last %.1f minutes", (uint8_t *)&v37, 0xCu);
    }
    BOOL v25 = 0;
    goto LABEL_25;
  }
  BOOL v29 = [(OSISleepScheduleMonitor *)self->_sleepScheduleMonitor date:v7 inSleepWindowWithSecondsBeforeStart:self->_bedtimeOffset secondsBeforeEnd:self->_wakeOffset];
  BOOL v25 = 1;
LABEL_26:
  self->_inSleepWindow = v29;
  v30 = +[_CDClientContext userContext];
  self->_pluggedIn = +[OSIntelligenceUtilities isPluggedInWithContext:v30];

  if (self->_useSleep
    && !self->_inSleepWindow
    && (([v6 isEqualToString:@"ruleBased"] & 1) != 0
     || [v6 isEqualToString:@"backup"]))
  {
    v36 = self->_log;
    BOOL v25 = 0;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v36, OS_LOG_TYPE_DEFAULT, "Restricting entry because not in scheduled sleep window", (uint8_t *)&v37, 2u);
      BOOL v25 = 0;
    }
  }
  self->_BOOL areSleepHeuristicsMet = v25;
  v31 = self->_log;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = v31;
    v33 = [(_OSIInactivityEntrySignals *)self description];
    int v37 = 138412290;
    *(void *)v38 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v37, 0xCu);
  }
  BOOL areSleepHeuristicsMet = self->_areSleepHeuristicsMet;

  return areSleepHeuristicsMet;
}

- (BOOL)checkInactivitySignalsWithTimeSinceInactive:(double)a3
{
  [(OSIMotionMonitor *)self->_motionMonitor percentStationaryOverDuration:self->_stationaryLookbackSeconds];
  self->_double pctStationary = v5;
  self->_BOOL inCar = [(OSIMotionMonitor *)self->_motionMonitor currentlyInCar];
  self->_BOOL hasRecentPlaybackChange = [(OSIMediaPlaybackMonitor *)self->_mediaPlaybackMonitor hasPlaybackStateChangeRecently:self->_playbackLookbackSeconds];
  [(_OSIInactivityEntrySignals *)self dynamicMinPctStationaryThresholdSinceWait:a3];
  double v7 = v6;
  if (self->_pctStationary < v6 || self->_inCar)
  {
    log = self->_log;
    BOOL v9 = 0;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      double pctStationary = self->_pctStationary;
      BOOL inCar = self->_inCar;
      int v18 = 134218496;
      double v19 = pctStationary;
      __int16 v20 = 2048;
      *(double *)BOOL v21 = v7;
      *(_WORD *)&v21[8] = 1024;
      BOOL v22 = inCar;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Restricting inactivity entry because stationary for only %.2f (< %.2f) or Auto=%u", (uint8_t *)&v18, 0x1Cu);
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }
  if (self->_hasRecentPlaybackChange)
  {
    v12 = self->_log;
    BOOL v9 = 0;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = self->_playbackLookbackSeconds / 60.0;
      int v18 = 134217984;
      double v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "Restricting inactivity entry because of recent playback state change in the last %.1f minutes", (uint8_t *)&v18, 0xCu);
      BOOL v9 = 0;
    }
  }
  self->_areInactiveHeuristicsMet = v9;
  BOOL v14 = self->_log;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = self->_pctStationary;
    BOOL hasRecentPlaybackChange = self->_hasRecentPlaybackChange;
    int v18 = 134218496;
    double v19 = v15;
    __int16 v20 = 1024;
    *(_DWORD *)BOOL v21 = hasRecentPlaybackChange;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Stationary = %.2f. Recent Playback Change = %u. | Heuristics Met = %u", (uint8_t *)&v18, 0x18u);
  }
  return self->_areInactiveHeuristicsMet;
}

- (id)description
{
  return +[NSString stringWithFormat:@"Lux = %d. Stationary = %.2f. Recent Playback Change = %u. In Sleep Window: %u. Suppressed = %u. | Heuristics Met = %u, Plugged In = %u", self->_lux, *(void *)&self->_pctStationary, self->_hasRecentPlaybackChange, self->_inSleepWindow, self->_aodAlreadySuppressedOrOff, self->_areSleepHeuristicsMet, self->_pluggedIn];
}

- (int)dynamicMaxDarkLuxThresholdSinceWait:(double)a3
{
  BOOL v3 = (double)self->_requeryDelta < a3 || a3 < 0.0;
  uint64_t v4 = 36;
  if (v3) {
    uint64_t v4 = 28;
  }
  return *(_DWORD *)((char *)&self->super.isa + v4);
}

- (double)dynamicMinPctStationaryThresholdSinceWait:(double)a3
{
  if (a3 >= 0.0)
  {
    if (a3 >= 15.0)
    {
      uint64_t v3 = 80;
      if ((double)self->_requeryDelta > a3) {
        uint64_t v3 = 104;
      }
    }
    else
    {
      uint64_t v3 = 96;
    }
  }
  else
  {
    uint64_t v3 = 80;
  }
  return *(double *)((char *)&self->super.isa + v3);
}

- (BOOL)areSleepHeuristicsMet
{
  return self->_areSleepHeuristicsMet;
}

- (void)setAreSleepHeuristicsMet:(BOOL)a3
{
  self->_BOOL areSleepHeuristicsMet = a3;
}

- (BOOL)areInactiveHeuristicsMet
{
  return self->_areInactiveHeuristicsMet;
}

- (void)setAreInactiveHeuristicsMet:(BOOL)a3
{
  self->_areInactiveHeuristicsMet = a3;
}

- (double)secondsSinceWait
{
  return self->_secondsSinceWait;
}

- (void)setSecondsSinceWait:(double)a3
{
  self->_secondsSinceWait = a3;
}

- (int)requeryDelta
{
  return self->_requeryDelta;
}

- (void)setRequeryDelta:(int)a3
{
  self->_requeryDelta = a3;
}

- (int)lux
{
  return self->_lux;
}

- (void)setLux:(int)a3
{
  self->_int lux = a3;
}

- (BOOL)canAlwaysReadLux
{
  return self->_canAlwaysReadLux;
}

- (void)setCanAlwaysReadLux:(BOOL)a3
{
  self->_canAlwaysReadLux = a3;
}

- (OSIAmbientLightMonitor)lightMonitor
{
  return self->_lightMonitor;
}

- (void)setLightMonitor:(id)a3
{
}

- (int)maxDarkLuxThreshold
{
  return self->_maxDarkLuxThreshold;
}

- (void)setMaxDarkLuxThreshold:(int)a3
{
  self->_maxDarkLuxThreshold = a3;
}

- (BOOL)excludeNegativeLux
{
  return self->_excludeNegativeLux;
}

- (void)setExcludeNegativeLux:(BOOL)a3
{
  self->_excludeNegativeLux = a3;
}

- (int)immediateMaxDarkLuxThreshold
{
  return self->_immediateMaxDarkLuxThreshold;
}

- (void)setImmediateMaxDarkLuxThreshold:(int)a3
{
  self->_immediateMaxDarkLuxThreshold = a3;
}

- (int)initialMaxDarkLuxThreshold
{
  return self->_initialMaxDarkLuxThreshold;
}

- (void)setInitialMaxDarkLuxThreshold:(int)a3
{
  self->_initialMaxDarkLuxThreshold = a3;
}

- (BOOL)aodAlreadySuppressedOrOff
{
  return self->_aodAlreadySuppressedOrOff;
}

- (void)setAodAlreadySuppressedOrOff:(BOOL)a3
{
  self->_aodAlreadySuppressedOrOff = a3;
}

- (OSIBLSStateMonitor)blsStateMonitor
{
  return self->_blsStateMonitor;
}

- (void)setBlsStateMonitor:(id)a3
{
}

- (double)pctStationary
{
  return self->_pctStationary;
}

- (void)setPctStationary:(double)a3
{
  self->_double pctStationary = a3;
}

- (BOOL)inCar
{
  return self->_inCar;
}

- (void)setInCar:(BOOL)a3
{
  self->_BOOL inCar = a3;
}

- (OSIMotionMonitor)motionMonitor
{
  return self->_motionMonitor;
}

- (void)setMotionMonitor:(id)a3
{
}

- (double)minPctStationaryThreshold
{
  return self->_minPctStationaryThreshold;
}

- (void)setMinPctStationaryThreshold:(double)a3
{
  self->_minPctStationaryThreshold = a3;
}

- (double)stationaryLookbackSeconds
{
  return self->_stationaryLookbackSeconds;
}

- (void)setStationaryLookbackSeconds:(double)a3
{
  self->_stationaryLookbackSeconds = a3;
}

- (double)immediateMinPctStationaryThreshold
{
  return self->_immediateMinPctStationaryThreshold;
}

- (void)setImmediateMinPctStationaryThreshold:(double)a3
{
  self->_immediateMinPctStationaryThreshold = a3;
}

- (double)initialMinPctStationaryThreshold
{
  return self->_initialMinPctStationaryThreshold;
}

- (void)setInitialMinPctStationaryThreshold:(double)a3
{
  self->_initialMinPctStationaryThreshold = a3;
}

- (BOOL)hasRecentPlaybackChange
{
  return self->_hasRecentPlaybackChange;
}

- (void)setHasRecentPlaybackChange:(BOOL)a3
{
  self->_BOOL hasRecentPlaybackChange = a3;
}

- (OSIMediaPlaybackMonitor)mediaPlaybackMonitor
{
  return self->_mediaPlaybackMonitor;
}

- (void)setMediaPlaybackMonitor:(id)a3
{
}

- (double)maxPlaybackThreshold
{
  return self->_maxPlaybackThreshold;
}

- (void)setMaxPlaybackThreshold:(double)a3
{
  self->_maxPlaybackThreshold = a3;
}

- (double)playbackLookbackSeconds
{
  return self->_playbackLookbackSeconds;
}

- (void)setPlaybackLookbackSeconds:(double)a3
{
  self->_playbackLookbackSeconds = a3;
}

- (BOOL)inSleepWindow
{
  return self->_inSleepWindow;
}

- (void)setInSleepWindow:(BOOL)a3
{
  self->_inSleepWindow = a3;
}

- (OSISleepScheduleMonitor)sleepScheduleMonitor
{
  return self->_sleepScheduleMonitor;
}

- (void)setSleepScheduleMonitor:(id)a3
{
}

- (BOOL)useSleep
{
  return self->_useSleep;
}

- (void)setUseSleep:(BOOL)a3
{
  self->_useSleep = a3;
}

- (double)bedtimeOffset
{
  return self->_bedtimeOffset;
}

- (void)setBedtimeOffset:(double)a3
{
  self->_bedtimeOffset = a3;
}

- (double)wakeOffset
{
  return self->_wakeOffset;
}

- (void)setWakeOffset:(double)a3
{
  self->_wakeOffset = a3;
}

- (BOOL)pluggedIn
{
  return self->_pluggedIn;
}

- (void)setPluggedIn:(BOOL)a3
{
  self->_pluggedIn = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_sleepScheduleMonitor, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackMonitor, 0);
  objc_storeStrong((id *)&self->_motionMonitor, 0);
  objc_storeStrong((id *)&self->_blsStateMonitor, 0);

  objc_storeStrong((id *)&self->_lightMonitor, 0);
}

@end