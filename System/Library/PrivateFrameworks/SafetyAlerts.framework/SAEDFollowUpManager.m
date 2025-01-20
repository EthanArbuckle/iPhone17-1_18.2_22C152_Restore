@interface SAEDFollowUpManager
+ (id)sharedInstance;
- (BOOL)BOOLForDefaultsKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)BOOLOverrideForDefaultsKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)_currentDeviceHasEnhancedDeliverySwitch;
- (BOOL)_isIgneousEnabled;
- (BOOL)_shouldDeferFollowUpForSAReason:(unint64_t)a3;
- (BOOL)_shouldPostFollowUpForCTReason:(unint64_t)a3;
- (BOOL)_shouldPostFollowUpForSAReason:(unint64_t)a3;
- (BOOL)_shouldRetractFollowUpForSAReason:(unint64_t)a3;
- (BOOL)currentLocationInCoveredRegion;
- (BOOL)hasNumberOverrideForDefaultsKey:(id)a3;
- (BOOL)hasValidCurrentLocationInCoveredRegion;
- (BOOL)hasValidLocationServicesEnabled;
- (BOOL)hasValidUptakeCoefficient;
- (BOOL)locationServicesEnabled;
- (BOOL)shouldShowCFUPerUptakeCoefficient;
- (BOOL)userViewedEDSettings;
- (NSUserDefaults)userDefaults;
- (SAEDFollowUpManager)init;
- (float)uptakeCoefficient;
- (id)numberOverrideForDefaultsKey:(id)a3 defaultValue:(id)a4;
- (id)stringForDefaultsKey:(id)a3 defaultValue:(id)a4;
- (unint64_t)_ctSuppressEDFollowUpReason;
- (unint64_t)_saSuppressEDFollowUpReason;
- (unint64_t)ctSuppressEDFollowUpReason;
- (unint64_t)followUpState;
- (unint64_t)saSuppressEDFollowUpReason;
- (unint64_t)uintForDefaultsKey:(id)a3 defaultValue:(unint64_t)a4;
- (void)_addNotificationObservers;
- (void)_evaluateFollowUpStateAsync;
- (void)_evaluateFollowUpState_LOCKED;
- (void)_onCellConfigChanged:(id)a3;
- (void)_postFollowUp;
- (void)_removeNotificationObservers;
- (void)_retractFollowUp;
- (void)dealloc;
- (void)noteUserViewedEDSettings;
- (void)setCtSuppressEDFollowUpReason:(unint64_t)a3;
- (void)setCurrentLocationInCoveredRegion:(BOOL)a3;
- (void)setFollowUpState:(unint64_t)a3;
- (void)setLocationServicesEnabled:(BOOL)a3;
- (void)setSAEWEnabledState:(BOOL)a3;
- (void)setSaSuppressEDFollowUpReason:(unint64_t)a3;
- (void)setUptakeCoefficient:(float)a3;
- (void)setUserViewedEDSettings:(BOOL)a3;
- (void)start;
@end

@implementation SAEDFollowUpManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SAEDFollowUpManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EC061BC8 != -1) {
    dispatch_once(&qword_1EC061BC8, block);
  }
  v2 = (void *)_MergedGlobals;

  return v2;
}

uint64_t __37__SAEDFollowUpManager_sharedInstance__block_invoke()
{
  _MergedGlobals = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

- (SAEDFollowUpManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SAEDFollowUpManager;
  v2 = [(SAEDFollowUpManager *)&v10 init];
  v3 = v2;
  if (v2)
  {
    if ([(SAEDFollowUpManager *)v2 _isIgneousEnabled])
    {
      v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v5 = dispatch_queue_create("com.apple.SAEDFollowUpManager", v4);
      evaluationQueue = v3->_evaluationQueue;
      v3->_evaluationQueue = (OS_dispatch_queue *)v5;
    }
    else
    {
      v7 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v12 = 0;
        __int16 v13 = 2082;
        v14 = "";
        _os_log_impl(&dword_1D1647000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,init,!isIgneousEnabled\"}", buf, 0x12u);
      }
    }
    v8 = [(SAEDFollowUpManager *)v3 userDefaults];
    [v8 removeObjectForKey:@"saEnabledStateDefaultsWrite"];
  }
  return v3;
}

- (void)start
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl(&dword_1D1647000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,start\"}", (uint8_t *)v4, 0x12u);
  }
  if ([(SAEDFollowUpManager *)self _isIgneousEnabled])
  {
    [(SAEDFollowUpManager *)self _addNotificationObservers];
    [(SAEDFollowUpManager *)self _evaluateFollowUpStateAsync];
  }
}

- (void)setSAEWEnabledState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    __int16 v6 = 2082;
    uint64_t v7 = "";
    __int16 v8 = 1025;
    BOOL v9 = v3;
    _os_log_impl(&dword_1D1647000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,setSAEWEnabledState\", \"state\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
}

- (void)dealloc
{
  [(SAEDFollowUpManager *)self _removeNotificationObservers];
  v3.receiver = self;
  v3.super_class = (Class)SAEDFollowUpManager;
  [(SAEDFollowUpManager *)&v3 dealloc];
}

- (BOOL)_isIgneousEnabled
{
  if (!*((unsigned char *)SAPlatformInfo::instance((SAPlatformInfo *)self) + 9)) {
    return 1;
  }

  return [(SAEDFollowUpManager *)self BOOLOverrideForDefaultsKey:@"enhancedDelivery.followUp.override.isIgneousEnabled" defaultValue:1];
}

- (void)_evaluateFollowUpStateAsync
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(SAEDFollowUpManager *)self _isIgneousEnabled])
  {
    evaluationQueue = self->_evaluationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__SAEDFollowUpManager__evaluateFollowUpStateAsync__block_invoke;
    block[3] = &unk_1E68D95C8;
    block[4] = self;
    dispatch_async(evaluationQueue, block);
  }
  else
  {
    v4 = SALogObjectWarning;
    if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      BOOL v9 = "";
      _os_log_impl(&dword_1D1647000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState with !isIgneousEnabled\"}", buf, 0x12u);
    }
  }
}

void __50__SAEDFollowUpManager__evaluateFollowUpStateAsync__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F81C0]();
  objc_msgSend(*(id *)(a1 + 32), "_evaluateFollowUpState_LOCKED");
}

uint64_t __50__SAEDFollowUpManager__evaluateFollowUpStateAsync__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateFollowUpState_LOCKED");
}

- (void)_evaluateFollowUpState_LOCKED
{
  v36[4] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_evaluationQueue);
  uint64_t v3 = [(SAEDFollowUpManager *)self followUpState];
  if ((unint64_t)v3 >= 0x64)
  {
    v4 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v26 = 0;
      __int16 v27 = 2082;
      v28 = "";
      __int16 v29 = 2050;
      uint64_t v30 = v3;
      _os_log_impl(&dword_1D1647000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,followUpState >= SAFollowUpStateRetracted\", \"followUpState\":%{public}lu}", buf, 0x1Cu);
    }
    v36[0] = @"NOP";
    v35[0] = @"action";
    v35[1] = @"startingFollowUpState";
    __int16 v5 = [NSNumber numberWithUnsignedInteger:v3];
    v36[1] = v5;
    v35[2] = @"ctSuppressEDFollowUpReason";
    __int16 v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAEDFollowUpManager ctSuppressEDFollowUpReason](self, "ctSuppressEDFollowUpReason"));
    v36[2] = v6;
    v35[3] = @"saSuppressEDFollowUpReason";
    int v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAEDFollowUpManager saSuppressEDFollowUpReason](self, "saSuppressEDFollowUpReason"));
    v36[3] = v7;
    __int16 v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];

    id v24 = v8;
    AnalyticsSendEventLazy();
    [(SAEDFollowUpManager *)self _retractFollowUp];
    [(SAEDFollowUpManager *)self _removeNotificationObservers];

    return;
  }
  unint64_t v9 = [(SAEDFollowUpManager *)self _ctSuppressEDFollowUpReason];
  BOOL v10 = [(SAEDFollowUpManager *)self _shouldPostFollowUpForCTReason:v9];
  unint64_t v11 = [(SAEDFollowUpManager *)self _saSuppressEDFollowUpReason];
  int v12 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289794;
    int v26 = 0;
    __int16 v27 = 2082;
    v28 = "";
    __int16 v29 = 2050;
    uint64_t v30 = v3;
    __int16 v31 = 2050;
    unint64_t v32 = v9;
    __int16 v33 = 2050;
    unint64_t v34 = v11;
    _os_log_impl(&dword_1D1647000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED\", \"followUpState\":%{public}lu, \"ctSuppressEDFollowUpReason\":%{public}lu, \"saSuppressEDFollowUpReason\":%{public}lu}", buf, 0x30u);
  }
  uint64_t v22 = MEMORY[0x1E4F143A8];
  unint64_t v23 = v11;
  AnalyticsSendEventLazy();
  if (v3 <= 48)
  {
    if (v3 && v3 != 10)
    {
LABEL_16:
      v14 = SALogObjectWarning;
      if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289282;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        __int16 v29 = 2050;
        uint64_t v30 = v3;
        _os_log_impl(&dword_1D1647000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,unexpected followUpState\", \"followUpState\":%{public}lu}", buf, 0x1Cu);
      }
    }
  }
  else if (v3 != 49)
  {
    if (v3 == 50)
    {
      int v18 = !v10 | -[SAEDFollowUpManager _shouldRetractFollowUpForSAReason:](self, "_shouldRetractFollowUpForSAReason:", v11, v22, 3221225472, __52__SAEDFollowUpManager__evaluateFollowUpState_LOCKED__block_invoke_47, &__block_descriptor_56_e19___NSDictionary_8__0l, 50, v9, v11);
      v19 = SALogObjectGeneral;
      BOOL v20 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
      if (v18 == 1)
      {
        if (v20)
        {
          *(_DWORD *)buf = 68289026;
          int v26 = 0;
          __int16 v27 = 2082;
          v28 = "";
          _os_log_impl(&dword_1D1647000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,posted,retracting FollowUp\"}", buf, 0x12u);
        }
        [(SAEDFollowUpManager *)self setCtSuppressEDFollowUpReason:v9];
        [(SAEDFollowUpManager *)self setSaSuppressEDFollowUpReason:v11];
        [(SAEDFollowUpManager *)self _retractFollowUp];
        [(SAEDFollowUpManager *)self _removeNotificationObservers];
      }
      else
      {
        if (v20)
        {
          *(_DWORD *)buf = 68289026;
          int v26 = 0;
          __int16 v27 = 2082;
          v28 = "";
          _os_log_impl(&dword_1D1647000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,posted,leaving posted\"}", buf, 0x12u);
        }
        [(SAEDFollowUpManager *)self setCtSuppressEDFollowUpReason:v9];
        [(SAEDFollowUpManager *)self setSaSuppressEDFollowUpReason:v11];
      }
      return;
    }
    if (v3 == 99)
    {
      __int16 v13 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        _os_log_impl(&dword_1D1647000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,retractingFailed,retracting FollowUp\"}", buf, 0x12u);
      }
      [(SAEDFollowUpManager *)self _retractFollowUp];
      [(SAEDFollowUpManager *)self _removeNotificationObservers];
      return;
    }
    goto LABEL_16;
  }
  if ((v10 & -[SAEDFollowUpManager _shouldPostFollowUpForSAReason:](self, "_shouldPostFollowUpForSAReason:", v11, v22, 3221225472, __52__SAEDFollowUpManager__evaluateFollowUpState_LOCKED__block_invoke_47, &__block_descriptor_56_e19___NSDictionary_8__0l, v3, v9, v11)) == 1)
  {
    uint64_t v15 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v26 = 0;
      __int16 v27 = 2082;
      v28 = "";
      _os_log_impl(&dword_1D1647000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,posting FollowUp\"}", buf, 0x12u);
    }
    [(SAEDFollowUpManager *)self setCtSuppressEDFollowUpReason:v9];
    [(SAEDFollowUpManager *)self setSaSuppressEDFollowUpReason:v11];
    [(SAEDFollowUpManager *)self _postFollowUp];
    return;
  }
  if (v10)
  {
    BOOL v16 = [(SAEDFollowUpManager *)self _shouldDeferFollowUpForSAReason:v11];
    [(SAEDFollowUpManager *)self setCtSuppressEDFollowUpReason:v9];
    [(SAEDFollowUpManager *)self setSaSuppressEDFollowUpReason:v11];
    if (v16)
    {
      v17 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        _os_log_impl(&dword_1D1647000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,deferring FollowUp\"}", buf, 0x12u);
      }
      [(SAEDFollowUpManager *)self setFollowUpState:10];
      return;
    }
  }
  else
  {
    [(SAEDFollowUpManager *)self setCtSuppressEDFollowUpReason:v9];
    [(SAEDFollowUpManager *)self setSaSuppressEDFollowUpReason:v11];
  }
  v21 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v26 = 0;
    __int16 v27 = 2082;
    v28 = "";
    _os_log_impl(&dword_1D1647000, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_evaluateFollowUpState_LOCKED,skipping FollowUp\"}", buf, 0x12u);
  }
  [(SAEDFollowUpManager *)self setFollowUpState:200];
}

id __52__SAEDFollowUpManager__evaluateFollowUpState_LOCKED__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __52__SAEDFollowUpManager__evaluateFollowUpState_LOCKED__block_invoke_47(void *a1)
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"Evaluate";
  v7[0] = @"action";
  v7[1] = @"startingFollowUpState";
  v2 = [NSNumber numberWithUnsignedInteger:a1[4]];
  v8[1] = v2;
  v7[2] = @"ctSuppressEDFollowUpReason";
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1[5]];
  v8[2] = v3;
  v7[3] = @"saSuppressEDFollowUpReason";
  v4 = [NSNumber numberWithUnsignedInteger:a1[6]];
  v8[3] = v4;
  __int16 v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

- (BOOL)_shouldPostFollowUpForCTReason:(unint64_t)a3
{
  return a3 == 0;
}

- (BOOL)_shouldPostFollowUpForSAReason:(unint64_t)a3
{
  return a3 == 0;
}

- (BOOL)_shouldRetractFollowUpForSAReason:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0x2710uLL:
      goto LABEL_4;
    case 0x7530uLL:
      return 1;
    case 0x4E20uLL:
LABEL_4:
      v4 = SALogObjectWarning;
      if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
      {
        v6[0] = 68289282;
        v6[1] = 0;
        __int16 v7 = 2082;
        __int16 v8 = "";
        __int16 v9 = 2050;
        unint64_t v10 = a3;
        _os_log_impl(&dword_1D1647000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_shouldRetractFollowUpForSAReason,very unexpected reason\", \"saSuppressEDFollowUpReason\":%{public}lu}", (uint8_t *)v6, 0x1Cu);
      }
      return 1;
  }
  return 0;
}

- (BOOL)_shouldDeferFollowUpForSAReason:(unint64_t)a3
{
  BOOL result = 1;
  if ((uint64_t)a3 <= 7999)
  {
    if (a3 == 1000 || a3 == 2000) {
      return result;
    }
    return 0;
  }
  if (a3 != 8000 && a3 != 9000) {
    return 0;
  }
  return result;
}

- (NSUserDefaults)userDefaults
{
  if (qword_1EC061BD0 != -1) {
    dispatch_once(&qword_1EC061BD0, &__block_literal_global);
  }
  v2 = (void *)qword_1EC061BD8;

  return (NSUserDefaults *)v2;
}

uint64_t __35__SAEDFollowUpManager_userDefaults__block_invoke()
{
  qword_1EC061BD8 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.safetyalerts"];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)hasNumberOverrideForDefaultsKey:(id)a3
{
  v4 = (SAPlatformInfo *)a3;
  if (!*((unsigned char *)SAPlatformInfo::instance(v4) + 9)) {
    goto LABEL_4;
  }
  uint64_t v5 = [(SAEDFollowUpManager *)self userDefaults];
  __int16 v6 = [(id)v5 objectForKey:v4];

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if (v5) {
    BOOL v7 = 1;
  }
  else {
LABEL_4:
  }
    BOOL v7 = 0;

  return v7;
}

- (id)numberOverrideForDefaultsKey:(id)a3 defaultValue:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (SAPlatformInfo *)a4;
  if (!*((unsigned char *)SAPlatformInfo::instance(v7) + 9)) {
    goto LABEL_6;
  }
  __int16 v8 = [(SAEDFollowUpManager *)self userDefaults];
  __int16 v9 = [v8 objectForKey:v6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    __int16 v9 = v7;
    goto LABEL_7;
  }
  unint64_t v10 = SALogObjectWarning;
  if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68289794;
    v12[1] = 0;
    __int16 v13 = 2082;
    v14 = "";
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    int v18 = v9;
    __int16 v19 = 2114;
    BOOL v20 = v7;
    _os_log_impl(&dword_1D1647000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,numberOverrideForDefaultsKey,#overriding\", \"key\":%{public, location:escape_only}@, \"overrideNumber\":%{public, location:escape_only}@, \"defaultValue\":%{public, location:escape_only}@}", (uint8_t *)v12, 0x30u);
  }
LABEL_7:

  return v9;
}

- (BOOL)BOOLOverrideForDefaultsKey:(id)a3 defaultValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [NSNumber numberWithBool:v4];
  __int16 v8 = [(SAEDFollowUpManager *)self numberOverrideForDefaultsKey:v6 defaultValue:v7];
  char v9 = [v8 BOOLValue];

  return v9;
}

- (BOOL)BOOLForDefaultsKey:(id)a3 defaultValue:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(SAEDFollowUpManager *)self userDefaults];
  __int16 v8 = [v7 objectForKey:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = [v8 BOOLValue];
  }

  return a4;
}

- (unint64_t)uintForDefaultsKey:(id)a3 defaultValue:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(SAEDFollowUpManager *)self userDefaults];
  __int16 v8 = [v7 objectForKey:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = [v8 unsignedIntegerValue];
  }

  return a4;
}

- (id)stringForDefaultsKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(SAEDFollowUpManager *)self userDefaults];
  char v9 = [v8 objectForKey:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v7;
  }
  id v11 = v10;

  return v11;
}

- (unint64_t)followUpState
{
  return [(SAEDFollowUpManager *)self uintForDefaultsKey:@"enhancedDelivery.followUp.state" defaultValue:0];
}

- (void)setFollowUpState:(unint64_t)a3
{
  v15[5] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(SAEDFollowUpManager *)self followUpState];
  id v6 = [(SAEDFollowUpManager *)self userDefaults];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  [v6 setObject:v7 forKey:@"enhancedDelivery.followUp.state"];

  if (v5 != a3)
  {
    v15[0] = @"SetFollowupState";
    v14[0] = @"action";
    v14[1] = @"startingFollowUpState";
    __int16 v8 = [NSNumber numberWithUnsignedInteger:v5];
    v15[1] = v8;
    v14[2] = @"newFollowUpState";
    char v9 = [NSNumber numberWithUnsignedInteger:a3];
    v15[2] = v9;
    v14[3] = @"ctSuppressEDFollowUpReason";
    unint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAEDFollowUpManager ctSuppressEDFollowUpReason](self, "ctSuppressEDFollowUpReason"));
    v15[3] = v10;
    v14[4] = @"saSuppressEDFollowUpReason";
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAEDFollowUpManager saSuppressEDFollowUpReason](self, "saSuppressEDFollowUpReason"));
    v15[4] = v11;
    int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];

    id v13 = v12;
    AnalyticsSendEventLazy();
  }
}

id __40__SAEDFollowUpManager_setFollowUpState___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (unint64_t)ctSuppressEDFollowUpReason
{
  return [(SAEDFollowUpManager *)self uintForDefaultsKey:@"enhancedDelivery.followUp.ctSuppressionReason" defaultValue:0];
}

- (void)setCtSuppressEDFollowUpReason:(unint64_t)a3
{
  id v5 = [(SAEDFollowUpManager *)self userDefaults];
  BOOL v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"enhancedDelivery.followUp.ctSuppressionReason"];
}

- (unint64_t)saSuppressEDFollowUpReason
{
  return [(SAEDFollowUpManager *)self uintForDefaultsKey:@"enhancedDelivery.followUp.saSuppressionReason" defaultValue:0];
}

- (void)setSaSuppressEDFollowUpReason:(unint64_t)a3
{
  id v5 = [(SAEDFollowUpManager *)self userDefaults];
  BOOL v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"enhancedDelivery.followUp.saSuppressionReason"];
}

- (BOOL)userViewedEDSettings
{
  v2 = [(SAEDFollowUpManager *)self userDefaults];
  uint64_t v3 = [v2 objectForKey:@"enhancedDelivery.followUp.settingsViewedDate"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setUserViewedEDSettings:(BOOL)a3
{
  BOOL v3 = a3;
  void v14[5] = *MEMORY[0x1E4F143B8];
  if ([(SAEDFollowUpManager *)self userViewedEDSettings] != a3)
  {
    if (v3)
    {
      id v5 = [MEMORY[0x1E4F1C9C8] date];
    }
    else
    {
      id v5 = 0;
    }
    id v6 = [(SAEDFollowUpManager *)self userDefaults];
    [v6 setObject:v5 forKey:@"enhancedDelivery.followUp.settingsViewedDate"];

    [(SAEDFollowUpManager *)self _evaluateFollowUpStateAsync];
    v14[0] = @"ShowedEDSettings";
    v13[0] = @"action";
    v13[1] = @"userViewedEDSettings";
    id v7 = [NSNumber numberWithBool:v3];
    v14[1] = v7;
    v13[2] = @"startingFollowUpState";
    __int16 v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAEDFollowUpManager followUpState](self, "followUpState"));
    v14[2] = v8;
    v13[3] = @"ctSuppressEDFollowUpReason";
    char v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAEDFollowUpManager ctSuppressEDFollowUpReason](self, "ctSuppressEDFollowUpReason"));
    v14[3] = v9;
    v13[4] = @"saSuppressEDFollowUpReason";
    unint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAEDFollowUpManager saSuppressEDFollowUpReason](self, "saSuppressEDFollowUpReason"));
    v14[4] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

    id v12 = v11;
    AnalyticsSendEventLazy();
  }
}

id __47__SAEDFollowUpManager_setUserViewedEDSettings___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_postFollowUp
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v19 = 0;
    __int16 v20 = 2082;
    uint64_t v21 = "";
    _os_log_impl(&dword_1D1647000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_postFollowUp\"}", buf, 0x12u);
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F5B770]);
  [v4 setUniqueIdentifier:@"com.apple.safetyalerts.enhancedDelivery.onboardPrompt"];
  [v4 setGroupIdentifier:*MEMORY[0x1E4F5B728]];
  [v4 setDisplayStyle:2];
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"SAFETYALERTS_ENHANCED_DELIVERY_FOLLOW_UP_TITLE" value:&stru_1F27FC648 table:@"SAEDFollowUpManager"];
  [v4 setTitle:v6];

  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  __int16 v8 = [v7 localizedStringForKey:@"SAFETYALERTS_ENHANCED_DELIVERY_FOLLOW_UP_BODY_PHONE" value:&stru_1F27FC648 table:@"SAEDFollowUpManager"];
  [v4 setInformativeText:v8];

  char v9 = (void *)MEMORY[0x1E4F5B760];
  unint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"SAFETYALERTS_ENHANCED_DELIVERY_FOLLOW_UP_REDIRECT_ACTION_TITLE" value:&stru_1F27FC648 table:@"SAEDFollowUpManager"];
  id v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=NOTIFICATIONS_ID&path=com.apple.cmas.EmergencyAlerts"];
  id v13 = [v9 actionWithLabel:v11 url:v12];

  __int16 v17 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [v4 setActions:v14];

  __int16 v15 = (void *)[objc_alloc(MEMORY[0x1E4F5B768]) initWithClientIdentifier:@"com.apple.safetyalerts"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __36__SAEDFollowUpManager__postFollowUp__block_invoke;
  v16[3] = &unk_1E68D9680;
  v16[4] = self;
  [v15 postFollowUpItem:v4 completion:v16];
}

void __36__SAEDFollowUpManager__postFollowUp__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SAEDFollowUpManager__postFollowUp__block_invoke_2;
  block[3] = &unk_1E68D9658;
  char v11 = a2;
  block[4] = v6;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __36__SAEDFollowUpManager__postFollowUp__block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F81C0]();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  _DWORD v4[2] = __36__SAEDFollowUpManager__postFollowUp__block_invoke_3;
  v4[3] = &unk_1E68D9658;
  char v6 = *(unsigned char *)(a1 + 48);
  BOOL v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  __36__SAEDFollowUpManager__postFollowUp__block_invoke_3((uint64_t)v4);
}

uint64_t __36__SAEDFollowUpManager__postFollowUp__block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 68289026;
      int v8 = 0;
      __int16 v9 = 2082;
      id v10 = "";
      _os_log_impl(&dword_1D1647000, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_postFollowUp,posted FollowUp successfully\"}", (uint8_t *)&v7, 0x12u);
    }
    uint64_t v3 = 50;
  }
  else
  {
    id v4 = SALogObjectWarning;
    if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 68289282;
      int v8 = 0;
      __int16 v9 = 2082;
      id v10 = "";
      __int16 v11 = 2114;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1D1647000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_postFollowUp,failed to post FollowUp\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
    }
    uint64_t v3 = 49;
  }
  return [*(id *)(a1 + 32) setFollowUpState:v3];
}

- (void)_retractFollowUp
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v14 = 0;
    __int16 v15 = 2082;
    id v16 = "";
    _os_log_impl(&dword_1D1647000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_retractFollowUp\"}", buf, 0x12u);
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F5B768]) initWithClientIdentifier:@"com.apple.safetyalerts"];
  uint64_t v12 = @"com.apple.safetyalerts.enhancedDelivery.onboardPrompt";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SAEDFollowUpManager__retractFollowUp__block_invoke;
  v8[3] = &unk_1E68D96A8;
  id v6 = v4;
  id v9 = v6;
  id v10 = v5;
  __int16 v11 = self;
  id v7 = v5;
  [v6 countOfPendingFollowUpItemsWithCompletion:v8];
}

void __39__SAEDFollowUpManager__retractFollowUp__block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    if (a2)
    {
      __int16 v11 = (void *)a1[4];
      uint64_t v12 = a1[5];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __39__SAEDFollowUpManager__retractFollowUp__block_invoke_92;
      v14[3] = &unk_1E68D9680;
      v14[4] = a1[6];
      [v11 clearPendingFollowUpItemsWithUniqueIdentifiers:v12 completion:v14];
      goto LABEL_9;
    }
    uint64_t v13 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 68289026;
    int v16 = 0;
    __int16 v17 = 2082;
    int v18 = "";
    id v7 = "{\"msg%{public}.0s\":\"#SAEDFollowUp,_retractFollowUp,no pendingFollowUpItems\"}";
    int v8 = v13;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 18;
    goto LABEL_4;
  }
  uint64_t v6 = SALogObjectWarning;
  if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289282;
    int v16 = 0;
    __int16 v17 = 2082;
    int v18 = "";
    __int16 v19 = 2114;
    id v20 = v5;
    id v7 = "{\"msg%{public}.0s\":\"#SAEDFollowUp,_retractFollowUp,error from countOfPendingFollowUpItemsWithCompletion\", \""
         "error\":%{public, location:escape_only}@}";
    int v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 28;
LABEL_4:
    _os_log_impl(&dword_1D1647000, v8, v9, v7, buf, v10);
  }
LABEL_9:
}

void __39__SAEDFollowUpManager__retractFollowUp__block_invoke_92(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SAEDFollowUpManager__retractFollowUp__block_invoke_2;
  block[3] = &unk_1E68D9658;
  char v11 = a2;
  block[4] = v6;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __39__SAEDFollowUpManager__retractFollowUp__block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F81C0]();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  _DWORD v4[2] = __39__SAEDFollowUpManager__retractFollowUp__block_invoke_3;
  v4[3] = &unk_1E68D9658;
  char v6 = *(unsigned char *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  __39__SAEDFollowUpManager__retractFollowUp__block_invoke_3((uint64_t)v4);
}

uint64_t __39__SAEDFollowUpManager__retractFollowUp__block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 68289026;
      int v8 = 0;
      __int16 v9 = 2082;
      id v10 = "";
      _os_log_impl(&dword_1D1647000, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_retractFollowUp,cleared FollowUp successfully\"}", (uint8_t *)&v7, 0x12u);
    }
    uint64_t v3 = 100;
  }
  else
  {
    id v4 = SALogObjectWarning;
    if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 68289282;
      int v8 = 0;
      __int16 v9 = 2082;
      id v10 = "";
      __int16 v11 = 2114;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1D1647000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_retractFollowUp,failed to clear FollowUp\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
    }
    uint64_t v3 = 99;
  }
  return [*(id *)(a1 + 32) setFollowUpState:v3];
}

- (unint64_t)_ctSuppressEDFollowUpReason
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (const void *)_CTServerConnectionCreateOnTargetQueue();
  uint64_t CellBroadcastConfig = _CTServerConnectionGetCellBroadcastConfig();
  uint64_t v5 = SALogObjectWarning;
  if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289538;
    int v20 = 0;
    __int16 v21 = 2082;
    uint64_t v22 = "";
    __int16 v23 = 2050;
    uint64_t v24 = (int)CellBroadcastConfig;
    __int16 v25 = 2050;
    uint64_t v26 = CellBroadcastConfig >> 32;
    _os_log_impl(&dword_1D1647000, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_ctSuppressEDFollowUpReason,_CTServerConnectionGetCellBroadcastConfig error\", \"error.domain\":%{public}ld, \"error.error\":%{public}ld}", buf, 0x26u);
  }
  CFRelease(v3);
  char v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v20 = 0;
    __int16 v21 = 2082;
    uint64_t v22 = "";
    __int16 v23 = 2114;
    uint64_t v24 = 0;
    _os_log_impl(&dword_1D1647000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_ctSuppressEDFollowUpReason,_CTServerConnectionGetCellBroadcastConfig\", \"configDict\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  int v7 = [0 objectForKeyedSubscript:@"EmergencyAlertsPref"];
  uint64_t v8 = [v7 BOOLValue];

  __int16 v9 = [0 objectForKeyedSubscript:@"EnhancedDeliveryAvailability"];
  uint64_t v10 = [v9 BOOLValue];

  __int16 v11 = [0 objectForKeyedSubscript:@"EnhancedDeliveryPref"];
  uint64_t v12 = [v11 BOOLValue];

  if (*((unsigned char *)SAPlatformInfo::instance(v13) + 9))
  {
    LODWORD(v8) = [(SAEDFollowUpManager *)self BOOLOverrideForDefaultsKey:@"enhancedDelivery.followUp.override.emergencyAlertsEnabled" defaultValue:v8];
    LOBYTE(v10) = [(SAEDFollowUpManager *)self BOOLOverrideForDefaultsKey:@"enhancedDelivery.followUp.override.enhancedDeliveryAvailable" defaultValue:v10];
    LODWORD(v12) = [(SAEDFollowUpManager *)self BOOLOverrideForDefaultsKey:@"enhancedDelivery.followUp.override.enhancedDeliveryPrefEnabled" defaultValue:v12];
  }
  if v8 && (v10)
  {
    uint64_t v14 = 300;
    if (!v12) {
      uint64_t v14 = 0;
    }
    uint64_t v15 = v14 | 0xF4240;
    if (v12) {
      unint64_t v16 = v15;
    }
    else {
      unint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v17 = 100;
    if (v8) {
      uint64_t v17 = 200;
    }
    unint64_t v16 = v17 + 1000000;
  }

  return v16;
}

- (unint64_t)_saSuppressEDFollowUpReason
{
  if (![(SAEDFollowUpManager *)self _currentDeviceHasEnhancedDeliverySwitch]) {
    return 20000;
  }
  if ([(SAEDFollowUpManager *)self userViewedEDSettings]) {
    return 30000;
  }
  if (![(SAEDFollowUpManager *)self hasValidLocationServicesEnabled]) {
    return 1000;
  }
  if (![(SAEDFollowUpManager *)self locationServicesEnabled]) {
    return 40000;
  }
  if (![(SAEDFollowUpManager *)self hasValidCurrentLocationInCoveredRegion]) {
    return 2000;
  }
  if (![(SAEDFollowUpManager *)self currentLocationInCoveredRegion]) {
    return 50000;
  }
  if (![(SAEDFollowUpManager *)self hasValidUptakeCoefficient]) {
    return 8000;
  }
  if ([(SAEDFollowUpManager *)self shouldShowCFUPerUptakeCoefficient]) {
    return 0;
  }
  return 9000;
}

- (BOOL)_currentDeviceHasEnhancedDeliverySwitch
{
  return 1;
}

- (void)setCurrentLocationInCoveredRegion:(BOOL)a3
{
  self->_currentLocationInCoveredRegion = a3;
  if (!self->_currentLocationInCoveredRegion_Valid)
  {
    self->_currentLocationInCoveredRegion_Valid = 1;
    [(SAEDFollowUpManager *)self _evaluateFollowUpStateAsync];
  }
}

- (BOOL)currentLocationInCoveredRegion
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SAEDFollowUpManager *)self hasValidCurrentLocationInCoveredRegion];
  if (!v3)
  {
    id v4 = SALogObjectWarning;
    BOOL v3 = os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      v8[0] = 68289026;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      _os_log_impl(&dword_1D1647000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"currentLocationInCoveredRegion + !hasValidCurrentLocationInCoveredRegion\"}", (uint8_t *)v8, 0x12u);
    }
  }
  BOOL currentLocationInCoveredRegion = self->_currentLocationInCoveredRegion;
  BOOL v6 = self->_currentLocationInCoveredRegion;
  if (*((unsigned char *)SAPlatformInfo::instance((SAPlatformInfo *)v3) + 9)) {
    return [(SAEDFollowUpManager *)self BOOLOverrideForDefaultsKey:@"enhancedDelivery.followUp.override.currentLocationInCoveredRegion" defaultValue:currentLocationInCoveredRegion];
  }
  return v6;
}

- (BOOL)hasValidCurrentLocationInCoveredRegion
{
  if (self->_currentLocationInCoveredRegion_Valid) {
    return 1;
  }
  if (!*((unsigned char *)SAPlatformInfo::instance((SAPlatformInfo *)self) + 9)) {
    return 0;
  }

  return [(SAEDFollowUpManager *)self hasNumberOverrideForDefaultsKey:@"enhancedDelivery.followUp.override.currentLocationInCoveredRegion"];
}

- (void)setLocationServicesEnabled:(BOOL)a3
{
  self->_locationServicesEnabled = a3;
  if (!self->_locationServicesEnabled_Valid)
  {
    self->_locationServicesEnabled_Valid = 1;
    [(SAEDFollowUpManager *)self _evaluateFollowUpStateAsync];
  }
}

- (BOOL)locationServicesEnabled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SAEDFollowUpManager *)self hasValidLocationServicesEnabled];
  if (!v3)
  {
    id v4 = SALogObjectWarning;
    BOOL v3 = os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      v8[0] = 68289026;
      v8[1] = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      _os_log_impl(&dword_1D1647000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"locationServicesEnabled + !hasValidLocationServicesEnabled\"}", (uint8_t *)v8, 0x12u);
    }
  }
  BOOL locationServicesEnabled = self->_locationServicesEnabled;
  BOOL v6 = self->_locationServicesEnabled;
  if (*((unsigned char *)SAPlatformInfo::instance((SAPlatformInfo *)v3) + 9)) {
    return [(SAEDFollowUpManager *)self BOOLOverrideForDefaultsKey:@"enhancedDelivery.followUp.override.locationServicesEnabled" defaultValue:locationServicesEnabled];
  }
  return v6;
}

- (BOOL)hasValidLocationServicesEnabled
{
  if (self->_locationServicesEnabled_Valid) {
    return 1;
  }
  if (!*((unsigned char *)SAPlatformInfo::instance((SAPlatformInfo *)self) + 9)) {
    return 0;
  }

  return [(SAEDFollowUpManager *)self hasNumberOverrideForDefaultsKey:@"enhancedDelivery.followUp.override.locationServicesEnabled"];
}

- (void)setUptakeCoefficient:(float)a3
{
  self->_uptakeCoefficient = a3;
  if (!self->_uptakeCoefficient_Valid)
  {
    self->_uptakeCoefficient_Valid = 1;
    [(SAEDFollowUpManager *)self _evaluateFollowUpStateAsync];
  }
}

- (float)uptakeCoefficient
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SAEDFollowUpManager *)self hasValidUptakeCoefficient];
  if (!v3)
  {
    id v4 = SALogObjectWarning;
    BOOL v3 = os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      v11[0] = 68289026;
      v11[1] = 0;
      __int16 v12 = 2082;
      uint64_t v13 = "";
      _os_log_impl(&dword_1D1647000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"uptakeCoefficient + !hasValidUptakeCoefficient\"}", (uint8_t *)v11, 0x12u);
    }
  }
  float uptakeCoefficient = self->_uptakeCoefficient;
  if (*((unsigned char *)SAPlatformInfo::instance((SAPlatformInfo *)v3) + 9))
  {
    *(float *)&double v6 = uptakeCoefficient;
    int v7 = [NSNumber numberWithFloat:v6];
    uint64_t v8 = [(SAEDFollowUpManager *)self numberOverrideForDefaultsKey:@"enhancedDelivery.followUp.override.uptakeCoefficient" defaultValue:v7];
    [v8 floatValue];
    float uptakeCoefficient = v9;
  }
  return uptakeCoefficient;
}

- (BOOL)hasValidUptakeCoefficient
{
  if (self->_uptakeCoefficient_Valid) {
    return 1;
  }
  if (!*((unsigned char *)SAPlatformInfo::instance((SAPlatformInfo *)self) + 9)) {
    return 0;
  }

  return [(SAEDFollowUpManager *)self hasNumberOverrideForDefaultsKey:@"enhancedDelivery.followUp.override.uptakeCoefficient"];
}

- (BOOL)shouldShowCFUPerUptakeCoefficient
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(SAEDFollowUpManager *)self uptakeCoefficient];
  float v4 = v3;
  uint64_t v5 = [(SAEDFollowUpManager *)self userDefaults];
  *(float *)&double v6 = v4;
  int v7 = [NSNumber numberWithFloat:v6];
  [v5 setObject:v7 forKey:@"enhancedDelivery.followUp.lastTestedUptakeCoefficient"];

  float v8 = v4 * 1000000.0;
  float v9 = (float)arc4random_uniform(0xF4240u);
  uint64_t v10 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68290050;
    v12[1] = 0;
    __int16 v13 = 2082;
    uint64_t v14 = "";
    __int16 v15 = 1026;
    BOOL v16 = v8 > v9;
    __int16 v17 = 2050;
    double v18 = v4;
    __int16 v19 = 2050;
    double v20 = v8;
    __int16 v21 = 2050;
    double v22 = v9;
    _os_log_impl(&dword_1D1647000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,shouldShowCFUPerUptakeCoefficient\", \"showCFU\":%{public}hhd, \"uptakeCoefficient\":\"%{public}f\", \"threshold\":\"%{public}f\", \"randomValue\":\"%{public}f\"}", (uint8_t *)v12, 0x36u);
  }
  return v8 > v9;
}

- (void)_onCellConfigChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  float v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    int v7 = "";
    _os_log_impl(&dword_1D1647000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_onCellConfigChanged\"}", (uint8_t *)v5, 0x12u);
  }
  [(SAEDFollowUpManager *)self _evaluateFollowUpStateAsync];
}

- (void)_addNotificationObservers
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  float v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    int v7 = "";
    _os_log_impl(&dword_1D1647000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_addNotificationObservers\"}", (uint8_t *)v5, 0x12u);
  }
  float v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__onCellConfigChanged_ name:*MEMORY[0x1E4F24218] object:0];
}

- (void)_removeNotificationObservers
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  float v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    int v7 = "";
    _os_log_impl(&dword_1D1647000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,_removeNotificationObservers\"}", (uint8_t *)v5, 0x12u);
  }
  float v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F24218] object:0];
}

- (void)noteUserViewedEDSettings
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  float v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl(&dword_1D1647000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAEDFollowUp,noteUserViewedEDSettings\"}", (uint8_t *)v4, 0x12u);
  }
  [(SAEDFollowUpManager *)self setUserViewedEDSettings:1];
}

- (void).cxx_destruct
{
}

@end