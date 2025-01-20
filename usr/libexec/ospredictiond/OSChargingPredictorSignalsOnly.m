@interface OSChargingPredictorSignalsOnly
- (BOOL)areEntryConditionsMetWithLog:(id)a3;
- (NSString)defaultsDomain;
- (OSChargingPredictorSignalsOnly)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5;
- (OSChargingSignals)chargingSignals;
- (OSIntelligenceTrialManager)trialManager;
- (_CDLocalContext)context;
- (id)chargingDecisionWithLog:(id)a3;
- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3;
- (unint64_t)modelVersion;
- (void)setChargingSignals:(id)a3;
- (void)setContext:(id)a3;
- (void)setDefaultsDomain:(id)a3;
- (void)setTrialManager:(id)a3;
@end

@implementation OSChargingPredictorSignalsOnly

- (OSChargingPredictorSignalsOnly)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5
{
  v8 = (NSString *)a3;
  v9 = (_CDLocalContext *)a4;
  v10 = (OSIntelligenceTrialManager *)a5;
  v21.receiver = self;
  v21.super_class = (Class)OSChargingPredictorSignalsOnly;
  v11 = [(OSChargingPredictorSignalsOnly *)&v21 init];
  defaultsDomain = v11->_defaultsDomain;
  v11->_defaultsDomain = v8;
  v13 = v8;

  context = v11->_context;
  v11->_context = v9;
  v15 = v9;

  trialManager = v11->_trialManager;
  v11->_trialManager = v10;
  v17 = v10;

  uint64_t v18 = +[OSChargingSignals sharedInstance];
  chargingSignals = v11->_chargingSignals;
  v11->_chargingSignals = (OSChargingSignals *)v18;

  return v11;
}

- (id)chargingDecisionWithLog:(id)a3
{
  v4 = a3;
  id v5 = objc_alloc_init((Class)_OSChargingPredictorOutput);
  BOOL v6 = [(OSChargingPredictorSignalsOnly *)self areEntryConditionsMetWithLog:v4];
  BOOL v7 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    double v8 = 1.0;
    if (!v7) {
      goto LABEL_7;
    }
    __int16 v13 = 0;
    v9 = "Entry conditions are met";
    v10 = (uint8_t *)&v13;
  }
  else
  {
    double v8 = 0.0;
    if (!v7) {
      goto LABEL_7;
    }
    LOWORD(v12) = 0;
    v9 = "Entry conditions are not met";
    v10 = (uint8_t *)&v12;
  }
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
LABEL_7:
  [v5 setConfidence:v8, v12];
  [v5 setMeetsSystemConfidenceThreshold:v6];
  [v5 setChargingDuration:0.0];

  return v5;
}

- (BOOL)areEntryConditionsMetWithLog:(id)a3
{
  v4 = a3;
  id v5 = [(OSChargingPredictorSignalsOnly *)self chargingSignals];
  uint64_t v6 = [v5 walletMonitor];
  BOOL v7 = [(id)v6 relevantEventDeadline];

  double v8 = +[NSDate distantFuture];
  LOBYTE(v6) = [v7 isEqualToDate:v8];

  if (v6)
  {
    v9 = [(OSChargingPredictorSignalsOnly *)self chargingSignals];
    uint64_t v10 = [v9 calendarMonitor];
    v11 = [(id)v10 relevantEventDeadline];

    uint64_t v12 = +[NSDate distantFuture];
    LOBYTE(v10) = [v11 isEqualToDate:v12];

    if (v10)
    {
      __int16 v13 = [(OSChargingPredictorSignalsOnly *)self chargingSignals];
      v14 = [v13 locationMonitor];
      unsigned __int8 v15 = [v14 inTypicalLocation];

      if (v15)
      {
        BOOL v16 = 1;
LABEL_12:

        goto LABEL_13;
      }
      BOOL v16 = 0;
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      __int16 v20 = 0;
      v17 = "Not in typical location. Returning NO";
      uint64_t v18 = (uint8_t *)&v20;
    }
    else
    {
      BOOL v16 = 0;
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      __int16 v21 = 0;
      v17 = "Found calendar event. Returning NO";
      uint64_t v18 = (uint8_t *)&v21;
    }
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
    BOOL v16 = 0;
    goto LABEL_12;
  }
  BOOL v16 = 0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found wallet event. Returning NO", buf, 2u);
    BOOL v16 = 0;
  }
LABEL_13:

  return v16;
}

- (unint64_t)modelVersion
{
  return 1;
}

- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3
{
  return 0;
}

- (OSChargingSignals)chargingSignals
{
  return self->_chargingSignals;
}

- (void)setChargingSignals:(id)a3
{
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (OSIntelligenceTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);

  objc_storeStrong((id *)&self->_chargingSignals, 0);
}

@end