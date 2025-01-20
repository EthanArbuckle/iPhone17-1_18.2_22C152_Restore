@interface TRICKServerEnvironmentReader
+ (int)currentPopulation;
+ (int)validatedPopulationFromNumber:(int64_t)a3;
+ (int64_t)currentEnvironment;
+ (int64_t)validatedEnvironmentFromNumber:(id)a3;
@end

@implementation TRICKServerEnvironmentReader

+ (int64_t)validatedEnvironmentFromNumber:(id)a3
{
  LODWORD(result) = [a3 unsignedIntValue];
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

+ (int64_t)currentEnvironment
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = [v3 valueForKey:@"com.apple.triald.ck.serverEnvironment"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v5 = [a1 validatedEnvironmentFromNumber:v4];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

+ (int)validatedPopulationFromNumber:(int64_t)a3
{
  if (a3 >= 6) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int)currentPopulation
{
  v3 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19D909000, v3, OS_LOG_TYPE_DEFAULT, "Reading currentPopulation from NSUserDefaults", v8, 2u);
  }

  if (+[TRIProcessInfo hostingProcessIsTriald])
  {
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.triald"];
  }
  int64_t v5 = v4;
  int v6 = objc_msgSend(a1, "validatedPopulationFromNumber:", objc_msgSend(v4, "integerForKey:", @"com.apple.triald.population.override"));

  return v6;
}

@end