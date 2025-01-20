@interface _DASThermalPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)isRestoreInProgressWithContext:(id)a3;
- (BOOL)shouldIgnoreThermalsForActivity:(id)a3 withState:(id)a4;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)restoreInProgressKeyPath;
- (_CDContextualKeyPath)thermalPressureLevelKeyPath;
- (_CDContextualKeyPath)watchThermalPressureLevelKeyPath;
- (_DASThermalPolicy)init;
- (_DASTrialManager)trialManager;
- (double)getScoreForThermalLevel:(int)a3;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int)levelFromTrialLevel:(unsigned int)a3;
- (int)maintenanceInUseMax;
- (int)maintenanceMax;
- (int)maintenanceNWMax;
- (int)maintenanceSignificantInactivityMax;
- (int)maxAllowableThermalPressureForActivity:(id)a3 restoreInProgress:(BOOL)a4 deviceInUse:(BOOL)a5;
- (int)thermalPressureWithState:(id)a3;
- (int)utilityInUseMax;
- (int)utilityMax;
- (int)utilitySignificantInactivityMax;
- (int64_t)getReasonForThermalLevel:(int)a3;
- (void)dasTrialManager:(id)a3 hasUpdatedParametersForNamespace:(id)a4;
- (void)setMaintenanceInUseMax:(int)a3;
- (void)setMaintenanceMax:(int)a3;
- (void)setMaintenanceNWMax:(int)a3;
- (void)setMaintenanceSignificantInactivityMax:(int)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setRestoreInProgressKeyPath:(id)a3;
- (void)setThermalPressureLevelKeyPath:(id)a3;
- (void)setTrialManager:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setUtilityInUseMax:(int)a3;
- (void)setUtilityMax:(int)a3;
- (void)setUtilitySignificantInactivityMax:(int)a3;
- (void)setWatchThermalPressureLevelKeyPath:(id)a3;
- (void)updateSystemConstraintsWithContext:(id)a3;
- (void)updateTrialParameters;
@end

@implementation _DASThermalPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = [a3 schedulingPriority];
  return (unint64_t)v3 < _DASSchedulingPriorityUserInitiated;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (id)initializeTriggers
{
  v10 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_thermalPressureLevelKeyPath];
  v9 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_watchThermalPressureLevelKeyPath];
  id v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_restoreInProgressKeyPath];
  v15[0] = @"identifier";
  v15[1] = @"predicate";
  v16[0] = @"com.apple.duetactivityscheduler.thermalpolicypolicy.thermalpressurechange";
  v16[1] = v10;
  v15[2] = @"deviceSet";
  v15[3] = @"mustWake";
  v16[2] = &off_100186E80;
  v16[3] = &__kCFBooleanTrue;
  v4 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  v17[0] = v4;
  v13[0] = @"identifier";
  v13[1] = @"predicate";
  v14[0] = @"com.apple.duetactivityscheduler.thermalpolicypolicy.watchthermalpressurechange";
  v14[1] = v9;
  v13[2] = @"deviceSet";
  v13[3] = @"mustWake";
  v14[2] = &off_100186E80;
  v14[3] = &__kCFBooleanTrue;
  v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  v17[1] = v5;
  v11[0] = @"identifier";
  v11[1] = @"predicate";
  v12[0] = @"com.apple.duetactivityscheduler.thermalpolicy.restore";
  v12[1] = v3;
  v11[2] = @"deviceSet";
  v11[3] = @"mustWake";
  v12[2] = &off_100186E80;
  v12[3] = &__kCFBooleanTrue;
  v6 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v17[2] = v6;
  v7 = +[NSArray arrayWithObjects:v17 count:3];

  return v7;
}

- (_DASThermalPolicy)init
{
  v16.receiver = self;
  v16.super_class = (Class)_DASThermalPolicy;
  v2 = [(_DASThermalPolicy *)&v16 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Thermal Policy";

    uint64_t v5 = +[_CDContextQueries keyPathForThermalPressureLevel];
    thermalPressureLevelKeyPath = v3->_thermalPressureLevelKeyPath;
    v3->_thermalPressureLevelKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = +[_CDContextQueries keyPathForDefaultPairedDeviceThermalPressureLevel];
    watchThermalPressureLevelKeyPath = v3->_watchThermalPressureLevelKeyPath;
    v3->_watchThermalPressureLevelKeyPath = (_CDContextualKeyPath *)v7;

    uint64_t v9 = +[_CDContextualKeyPath ephemeralKeyPathWithKey:@"/restore/inProgress"];
    restoreInProgressKeyPath = v3->_restoreInProgressKeyPath;
    v3->_restoreInProgressKeyPath = (_CDContextualKeyPath *)v9;

    uint64_t v11 = [(_DASThermalPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v11;

    uint64_t v13 = +[_DASTrialManager sharedInstanceForNamespace:@"COREOS_DAS"];
    trialManager = v3->_trialManager;
    v3->_trialManager = (_DASTrialManager *)v13;

    [(_DASTrialManager *)v3->_trialManager addDelegate:v3];
    [(_DASThermalPolicy *)v3 updateTrialParameters];
  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001C3FF0 != -1) {
    dispatch_once(&qword_1001C3FF0, &stru_1001767A8);
  }
  v2 = (void *)qword_1001C3FF8;

  return v2;
}

- (int)levelFromTrialLevel:(unsigned int)a3
{
  return a3;
}

- (void)dasTrialManager:(id)a3 hasUpdatedParametersForNamespace:(id)a4
{
  if ([a4 isEqualToString:@"COREOS_DAS"])
  {
    [(_DASThermalPolicy *)self updateTrialParameters];
  }
}

- (void)updateTrialParameters
{
  id v3 = [(_DASTrialManager *)self->_trialManager factorWithName:@"PolicyThermalUtilityMaxAllowable"];
  id v4 = [v3 longValue];

  self->_int utilityMax = [(_DASThermalPolicy *)self levelFromTrialLevel:v4];
  uint64_t v5 = +[_DASDaemonLogger logForCategory:@"trial"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int utilityMax = self->_utilityMax;
    int v31 = 138412546;
    CFStringRef v32 = @"PolicyThermalUtilityMaxAllowable";
    __int16 v33 = 1024;
    int v34 = utilityMax;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }

  uint64_t v7 = [(_DASTrialManager *)self->_trialManager factorWithName:@"PolicyThermalUtilityInUseMaxAllowable"];
  id v8 = [v7 longValue];

  self->_int utilityInUseMax = [(_DASThermalPolicy *)self levelFromTrialLevel:v8];
  uint64_t v9 = +[_DASDaemonLogger logForCategory:@"trial"];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int utilityInUseMax = self->_utilityInUseMax;
    int v31 = 138412546;
    CFStringRef v32 = @"PolicyThermalUtilityInUseMaxAllowable";
    __int16 v33 = 1024;
    int v34 = utilityInUseMax;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }

  uint64_t v11 = [(_DASTrialManager *)self->_trialManager factorWithName:@"PolicyThermalUtilityInactivityMaxAllowable"];
  id v12 = [v11 longValue];

  self->_int utilitySignificantInactivityMax = [(_DASThermalPolicy *)self levelFromTrialLevel:v12];
  uint64_t v13 = +[_DASDaemonLogger logForCategory:@"trial"];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int utilitySignificantInactivityMax = self->_utilitySignificantInactivityMax;
    int v31 = 138412546;
    CFStringRef v32 = @"PolicyThermalUtilityInactivityMaxAllowable";
    __int16 v33 = 1024;
    int v34 = utilitySignificantInactivityMax;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }

  v15 = [(_DASTrialManager *)self->_trialManager factorWithName:@"PolicyThermalMaintenanceMaxAllowable"];
  id v16 = [v15 longValue];

  self->_int maintenanceMax = [(_DASThermalPolicy *)self levelFromTrialLevel:v16];
  v17 = +[_DASDaemonLogger logForCategory:@"trial"];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int maintenanceMax = self->_maintenanceMax;
    int v31 = 138412546;
    CFStringRef v32 = @"PolicyThermalMaintenanceMaxAllowable";
    __int16 v33 = 1024;
    int v34 = maintenanceMax;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }

  v19 = [(_DASTrialManager *)self->_trialManager factorWithName:@"PolicyThermalMaintenanceInUseMaxAllowable"];
  id v20 = [v19 longValue];

  self->_int maintenanceInUseMax = [(_DASThermalPolicy *)self levelFromTrialLevel:v20];
  v21 = +[_DASDaemonLogger logForCategory:@"trial"];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int maintenanceInUseMax = self->_maintenanceInUseMax;
    int v31 = 138412546;
    CFStringRef v32 = @"PolicyThermalMaintenanceInUseMaxAllowable";
    __int16 v33 = 1024;
    int v34 = maintenanceInUseMax;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }

  v23 = [(_DASTrialManager *)self->_trialManager factorWithName:@"PolicyThermalMaintenanceInactivityMaxAllowable"];
  id v24 = [v23 longValue];

  self->_int maintenanceSignificantInactivityMax = [(_DASThermalPolicy *)self levelFromTrialLevel:v24];
  v25 = +[_DASDaemonLogger logForCategory:@"trial"];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int maintenanceSignificantInactivityMax = self->_maintenanceSignificantInactivityMax;
    int v31 = 138412546;
    CFStringRef v32 = @"PolicyThermalMaintenanceInactivityMaxAllowable";
    __int16 v33 = 1024;
    int v34 = maintenanceSignificantInactivityMax;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }

  v27 = [(_DASTrialManager *)self->_trialManager factorWithName:@"PolicyThermalMaintenanceNetworkMaxAllowable"];
  id v28 = [v27 longValue];

  self->_int maintenanceNWMax = [(_DASThermalPolicy *)self levelFromTrialLevel:v28];
  v29 = +[_DASDaemonLogger logForCategory:@"trial"];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    int maintenanceNWMax = self->_maintenanceNWMax;
    int v31 = 138412546;
    CFStringRef v32 = @"PolicyThermalMaintenanceNetworkMaxAllowable";
    __int16 v33 = 1024;
    int v34 = maintenanceNWMax;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }
}

- (void)updateSystemConstraintsWithContext:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:self->_thermalPressureLevelKeyPath];
  unsigned int v4 = [v3 unsignedIntValue];

  uint64_t v5 = +[_DASDaemon sharedInstance];
  v6 = v5;
  if (v4)
  {
    [v5 addConstraint:2 forSchedulingPriority:_DASSchedulingPriorityMaintenance];

    uint64_t v7 = +[_DASDaemon sharedInstance];
    uint64_t v8 = _DASSchedulingPriorityUtility;
    id v9 = v7;
    if (v4 >= 0x15)
    {
      [v7 addConstraint:2 forSchedulingPriority:_DASSchedulingPriorityUtility];
      goto LABEL_6;
    }
  }
  else
  {
    [v5 removeConstraint:2 forSchedulingPriority:_DASSchedulingPriorityUtility];

    uint64_t v7 = +[_DASDaemon sharedInstance];
    uint64_t v8 = _DASSchedulingPriorityMaintenance;
    id v9 = v7;
  }
  [v7 removeConstraint:2 forSchedulingPriority:v8];
LABEL_6:
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.thermalpolicypolicy.thermalpressurechange"])
  {
    [(_DASThermalPolicy *)self updateSystemConstraintsWithContext:v7];
    thermalPressureLevelKeyPath = self->_thermalPressureLevelKeyPath;
LABEL_5:
    id v9 = [v7 objectForKeyedSubscript:thermalPressureLevelKeyPath];
    unsigned int v10 = [v9 unsignedIntValue];

    unsigned __int8 v11 = v10 != 0;
    goto LABEL_6;
  }
  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.thermalpolicypolicy.watchthermalpressurechange"])
  {
    thermalPressureLevelKeyPath = self->_watchThermalPressureLevelKeyPath;
    goto LABEL_5;
  }
  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.thermalpolicy.restore"])unsigned __int8 v11 = -[_DASThermalPolicy isRestoreInProgressWithContext:](self, "isRestoreInProgressWithContext:", v7); {
  else
  }
    unsigned __int8 v11 = 0;
LABEL_6:

  return v11;
}

- (BOOL)shouldIgnoreThermalsForActivity:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if (!+[_DASPhotosPolicy isiCPLActivity:a3]) {
    goto LABEL_5;
  }
  id v7 = +[_DASPhotosPolicy keyPathForPhotosBudgetOverride];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  unsigned __int16 v9 = (unsigned __int16)[v8 unsignedIntegerValue];

  unsigned int v10 = [v6 objectForKeyedSubscript:self->_thermalPressureLevelKeyPath];
  unsigned int v11 = [v10 unsignedIntValue];

  if ((v9 & 0x800) == 0) {
    goto LABEL_5;
  }
  if (v11 < 0x15) {
    BOOL v12 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v12 = 0;

  return v12;
}

- (double)getScoreForThermalLevel:(int)a3
{
  double result = 1.0;
  if (a3 <= 29)
  {
    if (a3 == 10)
    {
      return 0.6;
    }
    else if (a3 == 20)
    {
      return 0.2;
    }
  }
  else if (a3 == 30)
  {
    return 0.1;
  }
  else if (a3 == 40 || a3 == 50)
  {
    return 0.0;
  }
  return result;
}

- (int64_t)getReasonForThermalLevel:(int)a3
{
  int64_t result = 1;
  if (a3 <= 29)
  {
    int64_t v4 = 4;
    if (a3 != 20) {
      int64_t v4 = 1;
    }
    if (a3 == 10) {
      return 2;
    }
    else {
      return v4;
    }
  }
  else if (a3 == 30)
  {
    return 8;
  }
  else if (a3 == 40 || a3 == 50)
  {
    return 16;
  }
  return result;
}

- (int)maxAllowableThermalPressureForActivity:(id)a3 restoreInProgress:(BOOL)a4 deviceInUse:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [v8 schedulingPriority];
  if ((unint64_t)v9 >= _DASSchedulingPriorityUserInitiated)
  {
    int utilityInUseMax = 30;
    goto LABEL_8;
  }
  unsigned int v10 = +[_DASInternetSharingPolicy policyInstance];
  unsigned __int8 v11 = [v10 enabled];

  id v12 = [v8 schedulingPriority];
  if ((unint64_t)v12 >= _DASSchedulingPriorityUtility)
  {
    if (v5)
    {
      int utilityInUseMax = self->_utilityInUseMax;
      goto LABEL_8;
    }
    if ((v11 & 1) == 0)
    {
      int utilityInUseMax = self->_utilityMax;
      goto LABEL_8;
    }
    goto LABEL_16;
  }
  if (v6)
  {
    uint64_t v13 = [v8 relatedApplications];
    unsigned int v14 = [v13 containsObject:@"com.apple.icloud.restore"];

    if (v14) {
      int utilityInUseMax = 10;
    }
    else {
      int utilityInUseMax = 0;
    }
    goto LABEL_8;
  }
  if ([v8 requiresNetwork])
  {
    int utilityInUseMax = self->_maintenanceNWMax;
    goto LABEL_8;
  }
  if ([v8 triggersRestart])
  {
LABEL_16:
    int utilityInUseMax = 10;
    goto LABEL_8;
  }
  if (v5)
  {
    int utilityInUseMax = self->_maintenanceInUseMax;
  }
  else if (v11)
  {
    int utilityInUseMax = 0;
  }
  else
  {
    int utilityInUseMax = self->_maintenanceMax;
  }
LABEL_8:

  return utilityInUseMax;
}

- (BOOL)isRestoreInProgressWithContext:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:self->_restoreInProgressKeyPath];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000666BC;
  block[3] = &unk_100175570;
  block[4] = self;
  id v7 = a4;
  id v26 = v7;
  if (qword_1001C4000 != -1) {
    dispatch_once(&qword_1001C4000, block);
  }
  id v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  BOOL v9 = [(_DASThermalPolicy *)self isRestoreInProgressWithContext:v7];
  unsigned int v10 = [(_DASThermalPolicy *)self maxAllowableThermalPressureForActivity:v6 restoreInProgress:v9 deviceInUse:+[_DASDeviceActivityPolicy isDeviceInUse:v7]];
  unsigned __int8 v11 = [v7 objectForKeyedSubscript:self->_thermalPressureLevelKeyPath];
  id v12 = [v11 unsignedIntValue];

  [(_DASPolicyResponseRationale *)v8 setResponseOptions:[(_DASPolicyResponseRationale *)v8 responseOptions] | [(_DASThermalPolicy *)self getReasonForThermalLevel:v12]];
  if (v12 > v10)
  {
    if ([(_DASThermalPolicy *)self shouldIgnoreThermalsForActivity:v6 withState:v7])
    {
      uint64_t v13 = +[NSPredicate predicateWithFormat:@"shouldOverrideModerateThermals == YES"];
      [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v13];

      double v14 = (double)0x384uLL;
      uint64_t v15 = 67;
LABEL_16:
      uint64_t v20 = +[_DASPolicyResponse policyResponseWithDecision:v15 validityDuration:v8 rationale:v14];
      goto LABEL_17;
    }
    v18 = +[NSPredicate predicateWithFormat:@"thermalLevel > %ld", v10];
    [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v18];
    if (v9)
    {
      v21 = +[NSNumber numberWithBool:1];
      v22 = +[NSPredicate predicateWithFormat:@"restoreInProgress == %@", v21];
      [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v22];
    }
LABEL_14:
    v23 = +[_DASPolicyResponse policyResponseWithDecision:100 validityDuration:v8 rationale:(double)0x384uLL];

    goto LABEL_18;
  }
  if ([v6 targetDevice] == (id)1 || objc_msgSend(v6, "targetDevice") == (id)2)
  {
    id v16 = [v7 objectForKeyedSubscript:self->_watchThermalPressureLevelKeyPath];
    unsigned int v17 = [v16 unsignedIntValue];

    if (v17 > v10)
    {
      v18 = +[NSPredicate predicateWithFormat:@"watchThermalLevel >= %ld", v12];
      [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v18];
      goto LABEL_14;
    }
  }
  [(_DASThermalPolicy *)self getScoreForThermalLevel:v12];
  if (v19 <= 0.0)
  {
    uint64_t v15 = 100;
    double v14 = (double)0x384uLL;
    goto LABEL_16;
  }
  uint64_t v20 = +[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", v8);
LABEL_17:
  v23 = (void *)v20;
LABEL_18:

  return v23;
}

- (int)thermalPressureWithState:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:self->_thermalPressureLevelKeyPath];
  int v4 = [v3 unsignedIntValue];

  return v4;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (_CDContextualKeyPath)thermalPressureLevelKeyPath
{
  return self->_thermalPressureLevelKeyPath;
}

- (void)setThermalPressureLevelKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)watchThermalPressureLevelKeyPath
{
  return self->_watchThermalPressureLevelKeyPath;
}

- (void)setWatchThermalPressureLevelKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)restoreInProgressKeyPath
{
  return self->_restoreInProgressKeyPath;
}

- (void)setRestoreInProgressKeyPath:(id)a3
{
}

- (void)setTriggers:(id)a3
{
}

- (_DASTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (int)utilityMax
{
  return self->_utilityMax;
}

- (void)setUtilityMax:(int)a3
{
  self->_int utilityMax = a3;
}

- (int)utilityInUseMax
{
  return self->_utilityInUseMax;
}

- (void)setUtilityInUseMax:(int)a3
{
  self->_int utilityInUseMax = a3;
}

- (int)utilitySignificantInactivityMax
{
  return self->_utilitySignificantInactivityMax;
}

- (void)setUtilitySignificantInactivityMax:(int)a3
{
  self->_int utilitySignificantInactivityMax = a3;
}

- (int)maintenanceMax
{
  return self->_maintenanceMax;
}

- (void)setMaintenanceMax:(int)a3
{
  self->_int maintenanceMax = a3;
}

- (int)maintenanceInUseMax
{
  return self->_maintenanceInUseMax;
}

- (void)setMaintenanceInUseMax:(int)a3
{
  self->_int maintenanceInUseMax = a3;
}

- (int)maintenanceSignificantInactivityMax
{
  return self->_maintenanceSignificantInactivityMax;
}

- (void)setMaintenanceSignificantInactivityMax:(int)a3
{
  self->_int maintenanceSignificantInactivityMax = a3;
}

- (int)maintenanceNWMax
{
  return self->_maintenanceNWMax;
}

- (void)setMaintenanceNWMax:(int)a3
{
  self->_int maintenanceNWMax = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_restoreInProgressKeyPath, 0);
  objc_storeStrong((id *)&self->_watchThermalPressureLevelKeyPath, 0);
  objc_storeStrong((id *)&self->_thermalPressureLevelKeyPath, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end