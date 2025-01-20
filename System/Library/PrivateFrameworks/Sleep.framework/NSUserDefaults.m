@interface NSUserDefaults
@end

@implementation NSUserDefaults

uint64_t __55__NSUserDefaults_HKSPSleep__hksp_analyticsUserDefaults__block_invoke()
{
  qword_1EB538608 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.sleep.analytics"];
  return MEMORY[0x1F41817F8]();
}

void __52__NSUserDefaults_HKSPSleep__hksp_sleepdUserDefaults__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v0 bundleIdentifier];

  if ([v3 isEqualToString:@"com.apple.sleepd"])
  {
    uint64_t v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.sleepd"];
  }
  v2 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = v1;
}

uint64_t __49__NSUserDefaults_HKSPSleep__hksp_saveDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

uint64_t __55__NSUserDefaults_HKSPSleep__hksp_removeObjectsForKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hksp_removeObjectForKey:", a2);
}

uint64_t __54__NSUserDefaults_HKSPSleep__hksp_internalUserDefaults__block_invoke()
{
  qword_1EB5385F8 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.internal.sleep"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __57__NSUserDefaults_HKSPSleep__hksp_springBoardUserDefaults__block_invoke()
{
  qword_1EB538618 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.springboard"];
  return MEMORY[0x1F41817F8]();
}

@end