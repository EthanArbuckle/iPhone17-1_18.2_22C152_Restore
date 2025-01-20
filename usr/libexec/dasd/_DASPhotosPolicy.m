@interface _DASPhotosPolicy
+ (BOOL)isActivity:(id)a3 consideredNonDiscretionary:(id)a4;
+ (BOOL)isCMMActivity:(id)a3;
+ (BOOL)isPhotosForegroundWithContext:(id)a3;
+ (BOOL)isPhotosMessagesAppForegroundWithContext:(id)a3;
+ (BOOL)isPhotosSyncActivity:(id)a3;
+ (BOOL)isPhotosSyncOverriddenWithContext:(id)a3;
+ (BOOL)isiCPLActivity:(id)a3;
+ (BOOL)shouldOverrideForIntentSync:(unint64_t)a3 activity:(id)a4;
+ (id)keyPathForBlockedStartDate;
+ (id)keyPathForPhotosBudgetOverride;
+ (id)keyPathForPhotosIsBlocked;
+ (id)keyPathForPhotosIsUnBlocked;
+ (id)keyPathForSignificantWorkRemaining;
+ (id)photosFocalAppStateChangedPredicate;
+ (id)policyInstance;
+ (void)initialize;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)haveSignificantWorkRemaining:(id)a3;
- (BOOL)intentSyncIsEngaged;
- (BOOL)isDataBudgetAvailableForPhotos:(id)a3;
- (BOOL)isEnergyBudgetAvailableForPhotos:(id)a3;
- (BOOL)isLowPowerModeOverriddenForPhotos:(id)a3;
- (BOOL)photosIsForeground;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldOverrideAll:(id)a3;
- (BOOL)shouldOverrideBudgets:(id)a3;
- (BOOL)shouldOverrideSignificantWork:(id)a3;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASPhotosPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setIntentSyncIsEngaged:(BOOL)a3;
- (void)setPhotosIsForeground:(BOOL)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASPhotosPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() isiCPLActivity:v3]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [(id)objc_opt_class() isCMMActivity:v3];
  }

  return v4;
}

+ (BOOL)isCMMActivity:(id)a3
{
  id v3 = a3;
  if ([v3 requiresNetwork]
    && ([v3 requestsApplicationLaunch] & 1) == 0)
  {
    v5 = [v3 relatedApplications];
    unsigned __int8 v4 = [v5 containsObject:@"com.apple.mobileslideshow.PhotosMessagesApp"];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (BOOL)isPhotosSyncActivity:(id)a3
{
  id v3 = [a3 name];
  unsigned __int8 v4 = [v3 containsString:@"com.apple.cloudphotod.sync.discretionary"];

  return v4;
}

+ (BOOL)isiCPLActivity:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 name];
  unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.dasd.DataCollection.PoliciesBlockingCriteria"];

  if (v5)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    v7 = [v3 name];
    if ([v7 containsString:@"com.apple.cloudphotod.sync.discretionary"])
    {
      unsigned __int8 v6 = 1;
    }
    else
    {
      v8 = [v3 name];
      if ([v8 containsString:@"com.apple.KeyValueService.Production.Private.sync"] & 1) != 0|| !objc_msgSend(v3, "requiresNetwork")|| (objc_msgSend(v3, "requestsApplicationLaunch"))
      {
        unsigned __int8 v6 = 0;
      }
      else
      {
        v10 = [v3 relatedApplications];
        if ([v10 containsObject:@"com.apple.mobileslideshow"])
        {
          unsigned __int8 v6 = 1;
        }
        else
        {
          v11 = [v3 relatedApplications];
          unsigned __int8 v6 = [v11 containsObject:@"com.apple.mobileslideshow.PhotosMessagesApp"];
        }
      }
    }
  }

  return v6;
}

+ (id)photosFocalAppStateChangedPredicate
{
  v2 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
  id v3 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
  unsigned __int8 v4 = +[_CDContextQueries appUsageBundleID];
  unsigned __int8 v5 = +[_CDContextualPredicate predicateForKeyPath:v2, @"ANY SELF.%@.value.%K == %@", v3, v4, @"com.apple.mobileslideshow" withFormat];

  return v5;
}

+ (void)initialize
{
  uint64_t v2 = +[_CDContextualKeyPath keyPathWithKey:@"/app/photos/significantWork"];
  id v3 = (void *)qword_1001C3F80;
  qword_1001C3F80 = v2;

  uint64_t v4 = +[_CDContextualKeyPath keyPathWithKey:@"/app/photos/budgetOverride"];
  unsigned __int8 v5 = (void *)qword_1001C3F88;
  qword_1001C3F88 = v4;

  uint64_t v6 = +[_CDContextualKeyPath keyPathWithKey:@"/app/photos/isBlocked"];
  v7 = (void *)qword_1001C3F90;
  qword_1001C3F90 = v6;

  uint64_t v8 = +[_CDContextualKeyPath keyPathWithKey:@"/app/photos/isBlocked/start"];
  v9 = (void *)qword_1001C3F98;
  qword_1001C3F98 = v8;

  qword_1001C3FA0 = +[_CDContextualKeyPath keyPathWithKey:@"/app/photos/isUnBlocked"];

  _objc_release_x1();
}

- (id)initializeTriggers
{
  v9 = +[_CDContextualPredicate predicateForChangeAtKeyPath:qword_1001C3F80];
  uint64_t v8 = +[_CDContextualPredicate predicateForChangeAtKeyPath:qword_1001C3F88];
  uint64_t v2 = [(id)objc_opt_class() photosFocalAppStateChangedPredicate];
  v14[0] = @"identifier";
  v14[1] = @"predicate";
  v15[0] = @"com.apple.dueatctivityscheduler.photospolicy.photoswork";
  v15[1] = v9;
  v14[2] = @"deviceSet";
  v14[3] = @"mustWake";
  v15[2] = &off_100186E20;
  v15[3] = &__kCFBooleanTrue;
  id v3 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  v16[0] = v3;
  v12[0] = @"identifier";
  v12[1] = @"predicate";
  v13[0] = @"com.apple.duetactivityscheduler.photospolicy.budgetOverride";
  v13[1] = v8;
  v12[2] = @"deviceSet";
  v12[3] = @"mustWake";
  v13[2] = &off_100186E20;
  v13[3] = &__kCFBooleanTrue;
  v12[4] = @"qualityOfService";
  v13[4] = &off_100186E38;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
  v16[1] = v4;
  v10[0] = @"identifier";
  v10[1] = @"predicate";
  v11[0] = @"com.apple.duetactivityscheduler.photospolicy.appchanged";
  v11[1] = v2;
  v10[2] = @"deviceSet";
  v10[3] = @"mustWake";
  v11[2] = &off_100186E20;
  v11[3] = &__kCFBooleanTrue;
  unsigned __int8 v5 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  v16[2] = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:v16 count:3];

  return v6;
}

- (_DASPhotosPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASPhotosPolicy;
  uint64_t v2 = [(_DASPhotosPolicy *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Photos Policy";

    uint64_t v5 = [(_DASPhotosPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060E2C;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3FA8 != -1) {
    dispatch_once(&qword_1001C3FA8, block);
  }
  uint64_t v2 = (void *)qword_1001C3FB0;

  return v2;
}

+ (id)keyPathForSignificantWorkRemaining
{
  return (id)qword_1001C3F80;
}

+ (id)keyPathForPhotosBudgetOverride
{
  return (id)qword_1001C3F88;
}

+ (id)keyPathForPhotosIsBlocked
{
  return (id)qword_1001C3F90;
}

+ (id)keyPathForBlockedStartDate
{
  return (id)qword_1001C3F98;
}

+ (id)keyPathForPhotosIsUnBlocked
{
  return (id)qword_1001C3FA0;
}

+ (BOOL)shouldOverrideForIntentSync:(unint64_t)a3 activity:(id)a4
{
  id v5 = a4;
  id v6 = [v5 uploadSize];
  if (v6 == (id)_DASActivityTransferSizeZero || (unint64_t)[v5 uploadSize] > 0x19000)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 0;
    if (a3 && (a3 & 0xFFFFFFFFFFFFFAFDLL) == 0)
    {
      id v9 = v5;
      objc_sync_enter(v9);
      v10 = [v9 policyResponseMetadata];
      v11 = +[_DASNetworkQualityPolicy policyInstance];
      v12 = [v11 policyName];
      v13 = [v10 objectForKeyedSubscript:v12];
      id v14 = [v13 reason];

      objc_sync_exit(v9);
      BOOL v7 = (a3 & 0x100) == 0 || v14 == (id)4;
    }
  }

  return v7;
}

- (BOOL)haveSignificantWorkRemaining:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:qword_1001C3F80];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)shouldOverrideBudgets:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:qword_1001C3F88];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)shouldOverrideSignificantWork:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[_DASPhotosPolicy keyPathForPhotosBudgetOverride];
  id v5 = [v3 objectForKeyedSubscript:v4];

  unint64_t v6 = (unint64_t)[v5 unsignedIntegerValue];
  return (v6 >> 2) & 1;
}

- (BOOL)shouldOverrideAll:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[_DASPhotosPolicy keyPathForPhotosBudgetOverride];
  id v5 = [v3 objectForKeyedSubscript:v4];

  unint64_t v6 = (unint64_t)[v5 unsignedIntegerValue];
  return (v6 >> 14) & 1;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.photospolicy.appchanged"])
  {
    unsigned __int8 v8 = +[_DASPhotosPolicy isPhotosForegroundWithContext:v7];
  }
  else if ([v6 isEqualToString:@"com.apple.dueatctivityscheduler.photospolicy.photoswork"])
  {
    unsigned __int8 v8 = [(_DASPhotosPolicy *)self haveSignificantWorkRemaining:v7];
  }
  else
  {
    if (![v6 isEqualToString:@"com.apple.duetactivityscheduler.photospolicy.budgetOverride"])
    {
      char v9 = 0;
      goto LABEL_8;
    }
    unsigned __int8 v8 = [(_DASPhotosPolicy *)self shouldOverrideBudgets:v7];
  }
  char v9 = v8 ^ 1;
LABEL_8:

  return v9;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

+ (BOOL)isPhotosForegroundWithContext:(id)a3
{
  id v3 = +[_DASApplicationPolicy focalApplicationsWithContext:a3];
  unsigned __int8 v4 = [v3 containsObject:@"com.apple.mobileslideshow"];

  return v4;
}

+ (BOOL)isPhotosMessagesAppForegroundWithContext:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:qword_1001C3F88];
  unint64_t v4 = ((unint64_t)[v3 unsignedIntegerValue] >> 3) & 1;

  return v4;
}

+ (BOOL)isActivity:(id)a3 consideredNonDiscretionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = +[_DASPhotosPolicy isiCPLActivity:v5]
    && (+[_DASPhotosPolicy isPhotosSyncOverriddenWithContext:](_DASPhotosPolicy, "isPhotosSyncOverriddenWithContext:", v6)|| +[_DASPhotosPolicy isPhotosForegroundWithContext:](_DASPhotosPolicy, "isPhotosForegroundWithContext:", v6))|| +[_DASPhotosPolicy isCMMActivity:](_DASPhotosPolicy, "isCMMActivity:", v5)&& +[_DASPhotosPolicy isPhotosMessagesAppForegroundWithContext:v6];

  return v7;
}

- (BOOL)isLowPowerModeOverriddenForPhotos:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[_DASPhotosPolicy keyPathForPhotosBudgetOverride];
  id v5 = [v3 objectForKeyedSubscript:v4];

  unint64_t v6 = (unint64_t)[v5 unsignedIntegerValue];
  return (v6 >> 5) & 1;
}

- (BOOL)isDataBudgetAvailableForPhotos:(id)a3
{
  id v3 = a3;
  if (+[_DASDataBudgetPolicy isBudgetAvailable:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = +[_DASPhotosPolicy keyPathForPhotosBudgetOverride];
    unint64_t v6 = [v3 objectForKeyedSubscript:v5];
    unsigned __int8 v7 = [v6 unsignedIntegerValue];

    BOOL v4 = v7 & 1;
  }

  return v4;
}

- (BOOL)isEnergyBudgetAvailableForPhotos:(id)a3
{
  id v3 = a3;
  if (+[_DASEnergyBudgetPolicy isBudgetAvailable:v3])
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = +[_DASPhotosPolicy keyPathForPhotosBudgetOverride];
    unint64_t v6 = [v3 objectForKeyedSubscript:v5];
    unint64_t v7 = (unint64_t)[v6 unsignedIntegerValue];

    BOOL v4 = (v7 >> 1) & 1;
  }

  return v4;
}

+ (BOOL)isPhotosSyncOverriddenWithContext:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_DASPhotosPolicy keyPathForPhotosBudgetOverride];
  id v5 = [v3 objectForKeyedSubscript:v4];

  unint64_t v6 = (unint64_t)[v5 unsignedIntegerValue];
  return (v6 >> 14) & 1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Photos Policy"];
  if (+[_DASPhotosPolicy isiCPLActivity:v6]
    && (+[_DASLowPowerModePolicy policyInstance],
        char v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 isLowPowerModePolicyEnforced:v7],
        v9,
        v10))
  {
    BOOL v11 = [(_DASPhotosPolicy *)self isLowPowerModeOverriddenForPhotos:v7];
    v12 = +[NSNumber numberWithBool:v11];
    v13 = +[NSPredicate predicateWithFormat:@"isLowPowerModeOverriddenForPhotos == %@", v12];
    [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v13];

    if (!v11)
    {
      [(_DASPolicyResponseRationale *)v8 setResponseOptions:(unint64_t)[(_DASPolicyResponseRationale *)v8 responseOptions] | 1];
      goto LABEL_17;
    }
    uint64_t v14 = 67;
  }
  else
  {
    uint64_t v14 = 0;
  }
  BOOL v15 = [(_DASPhotosPolicy *)self isDataBudgetAvailableForPhotos:v7];
  BOOL v16 = [(_DASPhotosPolicy *)self isEnergyBudgetAvailableForPhotos:v7];
  if (+[_DASPhotosPolicy isCMMActivity:v6])
  {
    BOOL v17 = +[_DASPhotosPolicy isPhotosMessagesAppForegroundWithContext:v7];
    uint64_t v32 = v14;
    id v33 = v6;
    BOOL v18 = v17;
    v19 = +[NSNumber numberWithBool:v17];
    v20 = +[NSNumber numberWithBool:v15];
    v21 = +[NSNumber numberWithBool:v16];
    v22 = +[NSPredicate predicateWithFormat:@"isCMMActivity == 1 && isPhotosMessagesAppForeground == %@ && isDataBudgetAvailable == %@ && isEnergyBudgetAvailable == %@", v19, v20, v21];
    [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v22];

    uint64_t v14 = v32;
    BOOL v23 = v18 && v15 && v16;
    id v6 = v33;
    if (v23)
    {
LABEL_14:
      uint64_t v14 = 67;
      goto LABEL_18;
    }
  }
  unsigned int v24 = [(_DASPhotosPolicy *)self shouldOverrideSignificantWork:v7];
  unsigned __int8 v25 = +[_DASSystemContext isPluggedIn:v7];
  if (![(_DASPhotosPolicy *)self haveSignificantWorkRemaining:v7] || (v25 & 1) != 0)
  {
LABEL_12:
    if (![(_DASPhotosPolicy *)self shouldOverrideAll:v7]) {
      goto LABEL_18;
    }
    v28 = +[NSPredicate predicateWithFormat:@"shouldOverrideAll == 1"];
    [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v28];

    goto LABEL_14;
  }
  if (v24)
  {
    v26 = +[NSNumber numberWithBool:1];
    v27 = +[NSPredicate predicateWithFormat:@"shouldOverrideSignificantWork == %@", v26];
    [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v27];

    goto LABEL_12;
  }
  [(_DASPolicyResponseRationale *)v8 setResponseOptions:(unint64_t)[(_DASPolicyResponseRationale *)v8 responseOptions] | 2];
  v29 = +[NSPredicate predicateWithFormat:@"significantWorkRemaining == 1 && pluggedIn == 0"];
  [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v29];

LABEL_17:
  uint64_t v14 = 33;
LABEL_18:
  v30 = +[_DASPolicyResponse policyResponseWithDecision:v14 validityDuration:v8 rationale:(double)0x384uLL];

  return v30;
}

- (BOOL)intentSyncIsEngaged
{
  return self->_intentSyncIsEngaged;
}

- (void)setIntentSyncIsEngaged:(BOOL)a3
{
  self->_intentSyncIsEngaged = a3;
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

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (BOOL)photosIsForeground
{
  return self->_photosIsForeground;
}

- (void)setPhotosIsForeground:(BOOL)a3
{
  self->_photosIsForeground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end