@interface PKPassPreferencesManager
+ (id)sharedInstance;
- (BOOL)hasDoneExpressUpgrade;
- (__CFString)_cfPreferencesKeyForConstant:(id)a3 passUniqueID:(id)a4;
- (double)_doubleForKey:(id)a3 passUniqueID:(id)a4;
- (double)commutePlanRenewalReminderTimeIntervalForPassWithUniqueID:(id)a3;
- (id)_decimalNumberForKey:(id)a3 passUniqueID:(id)a4;
- (id)_stringForKey:(id)a3 passUniqueID:(id)a4;
- (id)lowBalanceReminderAmountForPassWithUniqueID:(id)a3;
- (void)_removeValueForKey:(id)a3 passUniqueID:(id)a4;
- (void)_setDecimalNumber:(id)a3 forKey:(id)a4 passUniqueID:(id)a5;
- (void)_setDouble:(double)a3 forKey:(id)a4 passUniqueID:(id)a5;
- (void)_setString:(id)a3 forKey:(id)a4 passUniqueID:(id)a5;
- (void)_synchronize;
- (void)removeAllPreferences;
- (void)removeAllPreferencesForPassWithUniqueID:(id)a3;
- (void)setHasDoneExpressUpgrade:(BOOL)a3;
@end

@implementation PKPassPreferencesManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PKPassPreferencesManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_240 != -1) {
    dispatch_once(&_MergedGlobals_240, block);
  }
  v2 = (void *)qword_1EB402F20;
  return v2;
}

void __42__PKPassPreferencesManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB402F20;
  qword_1EB402F20 = (uint64_t)v1;
}

- (void)removeAllPreferencesForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  [(PKPassPreferencesManager *)self _removeValueForKey:@"LowBalanceReminderAmount" passUniqueID:v4];
  [(PKPassPreferencesManager *)self _removeValueForKey:@"LowBalanceReminderCurrency" passUniqueID:v4];
  [(PKPassPreferencesManager *)self _removeValueForKey:@"CommutePlanRenewalReminderInterval" passUniqueID:v4];

  [(PKPassPreferencesManager *)self _synchronize];
}

- (void)removeAllPreferences
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFArrayRef v5 = CFPreferencesCopyKeyList(@"com.apple.PassKit.passes", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  CFArrayRef v6 = v5;
  uint64_t v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        CFPreferencesSetValue(*(CFStringRef *)(*((void *)&v11 + 1) + 8 * v10++), 0, @"com.apple.PassKit.passes", v3, v4);
      }
      while (v8 != v10);
      uint64_t v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(PKPassPreferencesManager *)self _synchronize];
}

- (void)setHasDoneExpressUpgrade:(BOOL)a3
{
  CFStringRef v3 = (const void *)[NSNumber numberWithBool:a3];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(@"PassExpressUpgrade", v3, @"com.apple.PassKit.passes", v4, v5);
}

- (BOOL)hasDoneExpressUpgrade
{
  v2 = (void *)CFPreferencesCopyValue(@"PassExpressUpgrade", @"com.apple.PassKit.passes", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_synchronize
{
  int v2 = CFPreferencesSynchronize(@"com.apple.PassKit.passes", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  _CFPreferencesSetBackupDisabled();
  if (!v2)
  {
    char v3 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CFStringRef v4 = 0;
      _os_log_error_impl(&dword_190E10000, v3, OS_LOG_TYPE_ERROR, "Pass preferences failed to synchronize", v4, 2u);
    }
  }
}

- (void)_setDouble:(double)a3 forKey:(id)a4 passUniqueID:(id)a5
{
  CFArrayRef v6 = [(PKPassPreferencesManager *)self _cfPreferencesKeyForConstant:a4 passUniqueID:a5];
  uint64_t v7 = (const void *)[NSNumber numberWithDouble:a3];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(v6, v7, @"com.apple.PassKit.passes", v8, v9);
}

- (double)_doubleForKey:(id)a3 passUniqueID:(id)a4
{
  CFStringRef v4 = [(PKPassPreferencesManager *)self _cfPreferencesKeyForConstant:a3 passUniqueID:a4];
  CFStringRef v5 = (void *)CFPreferencesCopyValue(v4, @"com.apple.PassKit.passes", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)_setDecimalNumber:(id)a3 forKey:(id)a4 passUniqueID:(id)a5
{
  id v8 = a3;
  CFStringRef v9 = [(PKPassPreferencesManager *)self _cfPreferencesKeyForConstant:a4 passUniqueID:a5];
  uint64_t v10 = NSNumber;
  uint64_t v11 = PKCurrencyDecimalToLegacyStorageInteger(v8, 0);

  id v12 = [v10 numberWithLongLong:v11];
  CFPreferencesSetValue(v9, v12, @"com.apple.PassKit.passes", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
}

- (id)_decimalNumberForKey:(id)a3 passUniqueID:(id)a4
{
  CFStringRef v4 = [(PKPassPreferencesManager *)self _cfPreferencesKeyForConstant:a3 passUniqueID:a4];
  CFStringRef v5 = (void *)CFPreferencesCopyValue(v4, @"com.apple.PassKit.passes", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  double v6 = PKLegacyCurrencyStorageIntegerToDecimal([v5 unsignedLongLongValue], 0);

  return v6;
}

- (void)_setString:(id)a3 forKey:(id)a4 passUniqueID:(id)a5
{
  id value = a3;
  id v8 = [(PKPassPreferencesManager *)self _cfPreferencesKeyForConstant:a4 passUniqueID:a5];
  CFPreferencesSetValue(v8, value, @"com.apple.PassKit.passes", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
}

- (id)_stringForKey:(id)a3 passUniqueID:(id)a4
{
  CFStringRef v4 = [(PKPassPreferencesManager *)self _cfPreferencesKeyForConstant:a3 passUniqueID:a4];
  CFStringRef v5 = (void *)CFPreferencesCopyValue(v4, @"com.apple.PassKit.passes", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  return v5;
}

- (void)_removeValueForKey:(id)a3 passUniqueID:(id)a4
{
  CFStringRef v4 = [(PKPassPreferencesManager *)self _cfPreferencesKeyForConstant:a3 passUniqueID:a4];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(v4, 0, @"com.apple.PassKit.passes", v5, v6);
}

- (__CFString)_cfPreferencesKeyForConstant:(id)a3 passUniqueID:(id)a4
{
  return (__CFString *)[NSString stringWithFormat:@"%@-%@", a4, a3];
}

- (id)lowBalanceReminderAmountForPassWithUniqueID:(id)a3
{
  return [(PKPassPreferencesManager *)self _decimalNumberForKey:@"LowBalanceReminderAmount" passUniqueID:a3];
}

- (double)commutePlanRenewalReminderTimeIntervalForPassWithUniqueID:(id)a3
{
  [(PKPassPreferencesManager *)self _doubleForKey:@"CommutePlanRenewalReminderInterval" passUniqueID:a3];
  return result;
}

@end