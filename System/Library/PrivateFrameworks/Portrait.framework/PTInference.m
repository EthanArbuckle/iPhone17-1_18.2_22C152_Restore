@interface PTInference
+ (id)ANEConfigForAsynchronousWork;
+ (id)ANEConfigForSynchronousWork;
+ (int)espressoEngineForPlanPriority:(int)a3;
+ (int)espressoPlanPriorityForAsynchronousWork;
+ (int)espressoPlanPriorityForSynchronousWork;
+ (int)espressoPlanPriorityValidate:(int)a3;
@end

@implementation PTInference

+ (id)ANEConfigForSynchronousWork
{
  uint64_t v3 = [a1 espressoPlanPriorityForSynchronousWork];
  v4 = -[PTInferenceANEConfig initWithEspressoPlanPriority:espressoEngine:]([PTInferenceANEConfig alloc], "initWithEspressoPlanPriority:espressoEngine:", v3, [a1 espressoEngineForPlanPriority:v3]);

  return v4;
}

+ (id)ANEConfigForAsynchronousWork
{
  uint64_t v3 = [a1 espressoPlanPriorityForAsynchronousWork];
  v4 = -[PTInferenceANEConfig initWithEspressoPlanPriority:espressoEngine:]([PTInferenceANEConfig alloc], "initWithEspressoPlanPriority:espressoEngine:", v3, [a1 espressoEngineForPlanPriority:v3]);

  return v4;
}

+ (int)espressoPlanPriorityValidate:(int)a3
{
  int result = a3;
  if (a3 == 1)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    if (+[PTEffectUtil currentProcessIsCameracaptured])
    {
      return 1;
    }
    else
    {
      v6 = _PTLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D0778000, v6, OS_LOG_TYPE_INFO, "Changing espresso plan priority to 1 due to missing entitlements", v7, 2u);
      }

      return 0x2000;
    }
  }
  return result;
}

+ (int)espressoEngineForPlanPriority:(int)a3
{
  if (a3 == 1) {
    return 10006;
  }
  else {
    return 10007;
  }
}

+ (int)espressoPlanPriorityForAsynchronousWork
{
  return [a1 espressoPlanPriorityValidate:0x2000];
}

+ (int)espressoPlanPriorityForSynchronousWork
{
  return [a1 espressoPlanPriorityValidate:1];
}

@end