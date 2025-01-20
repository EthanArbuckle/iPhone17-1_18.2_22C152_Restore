@interface PowerUIIntelligenceManager
- (NSDictionary)lastPluginPredictionInfo;
- (NSString)defaultsDomain;
- (OS_os_log)log;
- (PowerUIIntelligenceManager)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5;
- (PowerUITrialManager)trialManager;
- (_CDContext)context;
- (_OSChargingPredictor)chargingPredictor;
- (id)queryPredictedPlugoutDate;
- (id)ttrURLforBadPredictionsWithStateDictionary:(id)a3;
- (void)handleCallback;
- (void)postAnalyticsEventForNewEventTypeWithPredictedDurationMinutes:(int64_t)a3 andActualDurationMinutes:(int64_t)a4 andConfidence:(double)a5 didMeetThreshold:(int)a6 andWasWireless:(BOOL)a7 andPredictionScheme:(id)a8;
- (void)postAnalyticsEventForOldEventTypeWithPredictedDurationMinutes:(int64_t)a3 andActualDurationMinutes:(int64_t)a4;
- (void)postPluginNotificationWithPredictorOutput:(id)a3 andError:(id)a4 andState:(id)a5;
- (void)removePluginNotification;
- (void)setChargingPredictor:(id)a3;
- (void)setContext:(id)a3;
- (void)setDefaultsDomain:(id)a3;
- (void)setLastPluginPredictionInfo:(id)a3;
- (void)setLog:(id)a3;
- (void)setTrialManager:(id)a3;
@end

@implementation PowerUIIntelligenceManager

- (PowerUIIntelligenceManager)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PowerUIIntelligenceManager;
  v12 = [(PowerUIIntelligenceManager *)&v21 init];
  if (v12)
  {
    os_log_t v13 = os_log_create("com.apple.powerui.smartcharging.intelligence", "manager");
    log = v12->_log;
    v12->_log = (OS_os_log *)v13;

    objc_storeStrong((id *)&v12->_context, a4);
    objc_storeStrong((id *)&v12->_trialManager, a5);
    uint64_t v15 = [MEMORY[0x263F5B668] predictor];
    chargingPredictor = v12->_chargingPredictor;
    v12->_chargingPredictor = (_OSChargingPredictor *)v15;

    objc_storeStrong((id *)&v12->_defaultsDomain, a3);
    lastPluginPredictionInfo = v12->_lastPluginPredictionInfo;
    v12->_lastPluginPredictionInfo = 0;

    v18 = v12->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_22135E000, v18, OS_LOG_TYPE_DEFAULT, "Init powerui intelligence manager", v20, 2u);
    }
  }

  return v12;
}

- (id)queryPredictedPlugoutDate
{
  v2 = objc_opt_new();
  return v2;
}

- (void)handleCallback
{
  v91[3] = *MEMORY[0x263EF8340];
  v3 = [(PowerUIIntelligenceManager *)self context];
  v4 = [MEMORY[0x263F351D0] keyPathForBatteryStateDataDictionary];
  v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    v6 = [(PowerUIIntelligenceManager *)self context];
    BOOL v7 = +[PowerUISmartChargeUtilities isPluggedInWithContext:v6];

    if (+[PowerUISmartChargeUtilities isiPhone]
      && +[PowerUISmartChargeUtilities isInternalBuild])
    {
      v8 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"chargingIntelligenceNotificationEnabled" inDomain:self->_defaultsDomain];
      int v9 = [v8 BOOLValue];
    }
    else
    {
      int v9 = 0;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v84 = v7;
      *(_WORD *)&v84[4] = 1024;
      *(_DWORD *)&v84[6] = v9;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Handling callback in intelligence manager isPluggedIn: %d, notificationsEnabled: %d", buf, 0xEu);
    }
    if (v7)
    {
      chargingPredictor = self->_chargingPredictor;
      id v82 = 0;
      v12 = [(_OSChargingPredictor *)chargingPredictor chargePredictionOutputOfScheme:1 withError:&v82];
      id v13 = v82;
      v14 = self->_chargingPredictor;
      id v81 = v13;
      uint64_t v15 = [(_OSChargingPredictor *)v14 chargePredictionOutputOfScheme:0 withError:&v81];
      v16 = (NSDictionary *)v81;

      if (v9) {
        [(PowerUIIntelligenceManager *)self postPluginNotificationWithPredictorOutput:v12 andError:v16 andState:v5];
      }
      v77 = v16;
      v76 = +[PowerUISmartChargeUtilities lastPluggedInDate];
      v90[0] = @"predictedDurationSeconds";
      v17 = NSNumber;
      [v15 chargingDuration];
      v18 = objc_msgSend(v17, "numberWithDouble:");
      v91[0] = v18;
      v90[1] = @"confidence";
      v19 = NSNumber;
      [v15 confidence];
      v20 = objc_msgSend(v19, "numberWithDouble:");
      v91[1] = v20;
      v90[2] = @"meetsThreshold";
      objc_super v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "meetsSystemConfidenceThreshold"));
      v91[2] = v21;
      v22 = [NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:3];

      v88[0] = @"predictedDurationSeconds";
      v23 = NSNumber;
      [v12 chargingDuration];
      v24 = objc_msgSend(v23, "numberWithDouble:");
      v89[0] = v24;
      v88[1] = @"confidence";
      v25 = NSNumber;
      [v12 confidence];
      v26 = objc_msgSend(v25, "numberWithDouble:");
      v89[1] = v26;
      v88[2] = @"meetsThreshold";
      v79 = v12;
      v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "meetsSystemConfidenceThreshold"));
      v89[2] = v27;
      v28 = [NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:3];

      v86[0] = @"classicPredictionInfo";
      v86[1] = @"onPluginPredictionInfo";
      v87[0] = v22;
      v87[1] = v28;
      v87[2] = v76;
      v86[2] = @"pluginDate";
      v86[3] = @"isWireless";
      v29 = NSNumber;
      v30 = [(PowerUIIntelligenceManager *)self context];
      v31 = objc_msgSend(v29, "numberWithBool:", +[PowerUISmartChargeUtilities deviceConnectedToWirelessChargerWithContext:](PowerUISmartChargeUtilities, "deviceConnectedToWirelessChargerWithContext:", v30));
      v87[3] = v31;
      v32 = [NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:4];

      objc_storeStrong((id *)&self->_lastPluginPredictionInfo, v32);
      +[PowerUISmartChargeUtilities setDict:v32 forPreferenceKey:@"intelligence-manager-predictions" inDomain:self->_defaultsDomain];
      v33 = self->_log;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v84 = v32;
        _os_log_impl(&dword_22135E000, v33, OS_LOG_TYPE_INFO, "Wrote prediction information %@ to defaults", buf, 0xCu);
      }

      v34 = v79;
      v35 = v77;
      goto LABEL_26;
    }
    [(PowerUIIntelligenceManager *)self removePluginNotification];
    lastPluginPredictionInfo = self->_lastPluginPredictionInfo;
    if (lastPluginPredictionInfo)
    {
      v35 = lastPluginPredictionInfo;
      [(NSDictionary *)self->_lastPluginPredictionInfo objectForKeyedSubscript:@"pluginDate"];
    }
    else
    {
      v35 = +[PowerUISmartChargeUtilities readDictForPreferenceKey:@"intelligence-manager-predictions" inDomain:self->_defaultsDomain];
      +[PowerUISmartChargeUtilities lastPluggedInDate];
    v34 = };
    +[PowerUISmartChargeUtilities setDict:MEMORY[0x263EFFA78] forPreferenceKey:@"intelligence-manager-predictions" inDomain:self->_defaultsDomain];
    v37 = self->_lastPluginPredictionInfo;
    self->_lastPluginPredictionInfo = 0;

    if (v35 && [(NSDictionary *)v35 count] && v34)
    {
      v38 = [(NSDictionary *)v35 objectForKeyedSubscript:@"pluginDate"];
      [v34 timeIntervalSinceDate:v38];
      double v40 = fabs(v39);

      if (v40 <= 300.0)
      {
        uint64_t v46 = [(NSDictionary *)v35 objectForKey:@"classicPredictionInfo"];
        if (v46)
        {
          v47 = (void *)v46;
          v48 = [(NSDictionary *)v35 objectForKey:@"onPluginPredictionInfo"];

          if (v48)
          {
            v49 = [MEMORY[0x263EFF910] now];
            [v49 timeIntervalSinceDate:v34];
            uint64_t v78 = (uint64_t)(v50 / 60.0);

            v51 = self->_log;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v84 = v34;
              _os_log_impl(&dword_22135E000, v51, OS_LOG_TYPE_INFO, "Logging metrics for charge session started at %@", buf, 0xCu);
            }
            v80 = v5;
            v52 = v35;
            v53 = [(NSDictionary *)v35 objectForKeyedSubscript:@"classicPredictionInfo"];
            v54 = self->_log;
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22135E000, v54, OS_LOG_TYPE_DEFAULT, "Posting metrics from classic predictions", buf, 2u);
            }
            v55 = [v53 objectForKeyedSubscript:@"predictedDurationSeconds"];
            uint64_t v56 = [v55 integerValue] / 60;

            v57 = [v53 objectForKeyedSubscript:@"confidence"];
            [v57 doubleValue];
            double v59 = v58;
            v60 = [v53 objectForKeyedSubscript:@"meetsThreshold"];
            uint64_t v61 = [v60 integerValue];
            v62 = [(NSDictionary *)v52 objectForKeyedSubscript:@"isWireless"];
            -[PowerUIIntelligenceManager postAnalyticsEventForNewEventTypeWithPredictedDurationMinutes:andActualDurationMinutes:andConfidence:didMeetThreshold:andWasWireless:andPredictionScheme:](self, "postAnalyticsEventForNewEventTypeWithPredictedDurationMinutes:andActualDurationMinutes:andConfidence:didMeetThreshold:andWasWireless:andPredictionScheme:", v56, v78, v61, [v62 BOOLValue], @"classic", v59);

            v63 = [(NSDictionary *)v52 objectForKeyedSubscript:@"onPluginPredictionInfo"];
            v64 = self->_log;
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22135E000, v64, OS_LOG_TYPE_DEFAULT, "Posting metrics from on plugin predictions", buf, 2u);
            }
            v65 = [v63 objectForKeyedSubscript:@"predictedDurationSeconds"];
            uint64_t v66 = [v65 integerValue] / 60;

            [(PowerUIIntelligenceManager *)self postAnalyticsEventForOldEventTypeWithPredictedDurationMinutes:v66 andActualDurationMinutes:v78];
            v67 = [v63 objectForKeyedSubscript:@"confidence"];
            [v67 doubleValue];
            double v69 = v68;
            v70 = [v63 objectForKeyedSubscript:@"meetsThreshold"];
            uint64_t v71 = [v70 integerValue];
            v72 = [(NSDictionary *)v52 objectForKeyedSubscript:@"isWireless"];
            uint64_t v73 = [v72 BOOLValue];
            uint64_t v74 = v66;
            v35 = v52;
            [(PowerUIIntelligenceManager *)self postAnalyticsEventForNewEventTypeWithPredictedDurationMinutes:v74 andActualDurationMinutes:v78 andConfidence:v71 didMeetThreshold:v73 andWasWireless:@"onplugin" andPredictionScheme:v69];

            v5 = v80;
            goto LABEL_26;
          }
        }
        v75 = self->_log;
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v84 = v35;
          v42 = "Corrupted saved prediction doesn't contain classic/plugin prediction info %@";
          v43 = v75;
          uint32_t v44 = 12;
          goto LABEL_25;
        }
      }
      else
      {
        v41 = self->_log;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v84 = v35;
          *(_WORD *)&v84[8] = 2112;
          v85 = v34;
          v42 = "Can't retrieve information on plugin that matches the saved prediction, \n"
                " saved info: %@ \n"
                " biome info %@";
          v43 = v41;
          uint32_t v44 = 22;
LABEL_25:
          _os_log_impl(&dword_22135E000, v43, OS_LOG_TYPE_DEFAULT, v42, buf, v44);
        }
      }
    }
    else
    {
      v45 = self->_log;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v42 = "Prediction for previous plugin not found";
        v43 = v45;
        uint32_t v44 = 2;
        goto LABEL_25;
      }
    }
LABEL_26:
  }
}

- (void)postAnalyticsEventForOldEventTypeWithPredictedDurationMinutes:(int64_t)a3 andActualDurationMinutes:(int64_t)a4
{
}

id __117__PowerUIIntelligenceManager_postAnalyticsEventForOldEventTypeWithPredictedDurationMinutes_andActualDurationMinutes___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  *(float *)&double v3 = (float)*(uint64_t *)(a1 + 40) / 60.0;
  v4 = [NSNumber numberWithFloat:v3];
  [v2 setObject:v4 forKeyedSubscript:@"actualDuration"];

  *(float *)&double v5 = (float)*(uint64_t *)(a1 + 48) / 60.0;
  v6 = [NSNumber numberWithFloat:v5];
  [v2 setObject:v6 forKeyedSubscript:@"predictedDuration"];

  *(float *)&double v7 = (float)(uint64_t)(*(void *)(a1 + 48) - *(void *)(a1 + 40)) / 60.0;
  v8 = [NSNumber numberWithFloat:v7];
  [v2 setObject:v8 forKeyedSubscript:@"durationDelta"];

  int v9 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    v12 = v2;
    __int16 v13 = 2112;
    v14 = @"com.apple.smartcharging.plugoutpredictions";
    _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "Logged %@ to %@ event in CA", (uint8_t *)&v11, 0x16u);
  }

  return v2;
}

- (void)postAnalyticsEventForNewEventTypeWithPredictedDurationMinutes:(int64_t)a3 andActualDurationMinutes:(int64_t)a4 andConfidence:(double)a5 didMeetThreshold:(int)a6 andWasWireless:(BOOL)a7 andPredictionScheme:(id)a8
{
  id v9 = a8;
  id v8 = v9;
  AnalyticsSendEventLazy();
}

id __183__PowerUIIntelligenceManager_postAnalyticsEventForNewEventTypeWithPredictedDurationMinutes_andActualDurationMinutes_andConfidence_didMeetThreshold_andWasWireless_andPredictionScheme___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  double v3 = [NSNumber numberWithInt:(30 * ((int)*(void *)(a1 + 48) / 30))];
  [v2 setObject:v3 forKeyedSubscript:@"actualDuration"];

  v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v2 setObject:v4 forKeyedSubscript:@"actualDurationTrueValue"];

  double v5 = [NSNumber numberWithInt:(30 * ((int)*(void *)(a1 + 56) / 30))];
  [v2 setObject:v5 forKeyedSubscript:@"predictedDuration"];

  v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v2 setObject:v6 forKeyedSubscript:@"predictedDurationTrueValue"];

  uint64_t v7 = *(void *)(a1 + 56) - *(void *)(a1 + 48);
  id v8 = [NSNumber numberWithInt:(15 * ((int)v7 / 15))];
  [v2 setObject:v8 forKeyedSubscript:@"durationDelta"];

  id v9 = [NSNumber numberWithInt:v7];
  [v2 setObject:v9 forKeyedSubscript:@"durationDeltaTrueValue"];

  LODWORD(v10) = vcvtmd_s64_f64(*(double *)(a1 + 64) * 10.0);
  int v11 = [NSNumber numberWithInt:v10];
  [v2 setObject:v11 forKeyedSubscript:@"confidenceTrueValue"];

  LODWORD(v12) = vcvtmd_s64_f64(*(double *)(a1 + 64) * 10.0);
  __int16 v13 = [NSNumber numberWithInt:v12];
  [v2 setObject:v13 forKeyedSubscript:@"confidence"];

  v14 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  [v2 setObject:v14 forKeyedSubscript:@"meetsThreshold"];

  uint64_t v15 = [NSString stringWithFormat:@"obc-v1-isWireless=%d-%@", *(unsigned __int8 *)(a1 + 76), *(void *)(a1 + 32)];
  [v2 setObject:v15 forKeyedSubscript:@"modelInfo"];

  v16 = [*(id *)(a1 + 40) log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v2;
    __int16 v20 = 2112;
    objc_super v21 = @"com.apple.smartcharging.plugoutpredictions.discrete.v2";
    _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "Logged %@ to %@ event in CA", buf, 0x16u);
  }

  return v2;
}

- (void)postPluginNotificationWithPredictorOutput:(id)a3 andError:(id)a4 andState:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    if (v9)
    {
      int v11 = [NSString stringWithFormat:@"Prediction failed, please file a radar by tapping the notification"];
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = log;
        v14 = [v9 localizedDescription];
        int v23 = 138412290;
        v24 = v14;
        _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_DEFAULT, "Error querying the predictor %@", (uint8_t *)&v23, 0xCu);
      }
      uint64_t v15 = +[PowerUINotificationManager sharedInstance];
      v16 = [(PowerUIIntelligenceManager *)self ttrURLforBadPredictionsWithStateDictionary:v10];
      v17 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:30.0];
      id v18 = (id)[v15 postInternalChargingIntelligenceNotificationWithChargingStatus:1 information:v11 url:v16 validUntil:v17];
    }
    else
    {
      int v11 = +[PowerUINotificationManager sharedInstance];
      [v8 chargingDuration];
      double v20 = v19;
      [v8 confidence];
      [v11 postInternalChargeDurationNotificationWithDuration:v20 withConfidence:v21];
    }

    uint64_t v22 = self->_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_DEFAULT, "Posted plugin notification ", (uint8_t *)&v23, 2u);
    }
  }
}

- (void)removePluginNotification
{
  if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    double v3 = +[PowerUINotificationManager sharedInstance];
    [v3 cancelNotificationRequestWithIdentifier:@"charging-intelligence-notification"];

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Removed plugin notification", v5, 2u);
    }
  }
}

- (id)ttrURLforBadPredictionsWithStateDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  context = self->_context;
  id v5 = a3;
  int64_t v6 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:context];
  uint64_t v7 = NSString;
  id v8 = [NSNumber numberWithInteger:v6];
  id v9 = [MEMORY[0x263EFF910] now];
  id v10 = +[PowerUISmartChargeUtilities timeStringFromDate:v9];
  int v11 = [v7 stringWithFormat:@"tap-to-radar://new?Title=Duration Predictor Failure (Unplugged at %@ percent)&Classification=Serious Bug&ComponentID=971083&ComponentName=PowerUI&ComponentVersion=all&Reproducible=Sometimes&Description=PLEASE ANSWER THESE QUESTIONS TO AID DEBUGGING:\n\n* Why did you unplug your device at %@?\n* Do you usually leave your device charged for a while at this time?\n* Is this your regular carry device? \n\n\n DebugInfo:\n %@", v8, v10, v5];

  uint64_t v12 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  __int16 v13 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];

  v14 = [NSURL URLWithString:v13];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v14;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "TTR URL is %@", buf, 0xCu);
  }

  return v14;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
}

- (PowerUITrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (_OSChargingPredictor)chargingPredictor
{
  return self->_chargingPredictor;
}

- (void)setChargingPredictor:(id)a3
{
}

- (NSDictionary)lastPluginPredictionInfo
{
  return self->_lastPluginPredictionInfo;
}

- (void)setLastPluginPredictionInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPluginPredictionInfo, 0);
  objc_storeStrong((id *)&self->_chargingPredictor, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end