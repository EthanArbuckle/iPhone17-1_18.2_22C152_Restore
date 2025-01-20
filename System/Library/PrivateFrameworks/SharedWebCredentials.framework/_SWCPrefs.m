@interface _SWCPrefs
+ (_SWCPrefs)sharedPrefs;
- (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)isAppleInternal;
- (BOOL)isFastCheckEnabled;
- (BOOL)verifyExtendedValidation;
- (double)retryIntervalAfterFailure;
- (double)retryIntervalAfterReachLimitWithFailure:(unint64_t)a3;
- (double)retryIntervalAfterSuccess;
- (double)retryIntervalAfterSuccess:(BOOL)a3;
- (id)_init;
- (id)_stringForKey:(id)a3 defaultValue:(id)a4;
- (id)containerURLReturningError:(id *)a3;
- (id)descriptionOfAllPrefs;
- (unint64_t)_recheckFuzzForSuccess:(BOOL)a3;
- (unint64_t)_unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4;
- (unint64_t)_unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4 minimumValue:(unint64_t)a5 maximumValue:(unint64_t)a6;
- (unint64_t)maximumRetryCount;
- (void)_setString:(id)a3 forKey:(id)a4;
@end

@implementation _SWCPrefs

+ (_SWCPrefs)sharedPrefs
{
  if (qword_1EB67B0D8 != -1) {
    dispatch_once(&qword_1EB67B0D8, &__block_literal_global_2);
  }
  v2 = (void *)qword_1EB67B0D0;
  return (_SWCPrefs *)v2;
}

- (id)containerURLReturningError:(id *)a3
{
  if (qword_1EB67B208 && [(_SWCPrefs *)self isAppleInternal])
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [v4 temporaryDirectory];
    v6 = [(id)qword_1EB67B208 UUIDString];
    id v7 = [v5 URLByAppendingPathComponent:v6 isDirectory:1];

    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:0];
  }
  else
  {
    if (qword_1EB67B0F0 != -1) {
      dispatch_once(&qword_1EB67B0F0, &__block_literal_global_3);
    }
    v9 = (void *)qword_1EB67B0E0;
    if (a3 && !qword_1EB67B0E0)
    {
      *a3 = (id) qword_1EB67B0E8;
      v9 = (void *)qword_1EB67B0E0;
    }
    id v7 = v9;
  }
  return v7;
}

- (unint64_t)maximumRetryCount
{
  return [(_SWCPrefs *)self _unsignedIntegerForKey:@"retryMaxCount" defaultValue:8];
}

- (double)retryIntervalAfterReachLimitWithFailure:(unint64_t)a3
{
  double v4 = fmax(exp2((double)(a3 - [(_SWCPrefs *)self maximumRetryCount] + 1)), 1.0);
  [(_SWCPrefs *)self retryIntervalAfterFailure];
  return v5 * v4;
}

- (double)retryIntervalAfterFailure
{
  if (qword_1EB67B100 != -1) {
    dispatch_once(&qword_1EB67B100, &__block_literal_global_23);
  }
  return (double)[(_SWCPrefs *)self _unsignedIntegerForKey:@"recheckFailureDelaySecs" defaultValue:qword_1EB67B0F8 minimumValue:10800 maximumValue:14400];
}

- (double)retryIntervalAfterSuccess
{
  if (qword_1EB67B110 != -1) {
    dispatch_once(&qword_1EB67B110, &__block_literal_global_28);
  }
  return (double)[(_SWCPrefs *)self _unsignedIntegerForKey:@"recheckSuccessDelaySecs" defaultValue:qword_1EB67B108 minimumValue:428400 maximumValue:432000];
}

- (double)retryIntervalAfterSuccess:(BOOL)a3
{
  if (a3) {
    [(_SWCPrefs *)self retryIntervalAfterSuccess];
  }
  else {
    [(_SWCPrefs *)self retryIntervalAfterFailure];
  }
  return result;
}

- (BOOL)verifyExtendedValidation
{
  return [(_SWCPrefs *)self _BOOLForKey:@"extendedValidation" defaultValue:0];
}

- (BOOL)isAppleInternal
{
  if (qword_1EB67B118 != -1) {
    dispatch_once(&qword_1EB67B118, &__block_literal_global_36);
  }
  return _MergedGlobals_2;
}

- (id)descriptionOfAllPrefs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1AD1157F0](self, a2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [&unk_1F03459B0 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(&unk_1F03459B0);
        }
        CFStringRef v7 = *(const __CFString **)(*((void *)&v15 + 1) + 8 * i);
        v8 = (__CFString *)CFPreferencesCopyAppValue(v7, @"com.apple.SharedWebCredentials");
        v9 = v8;
        if (v8) {
          v10 = v8;
        }
        else {
          v10 = @"<not set>";
        }
        [v3 setObject:v10 forKeyedSubscript:v7];
      }
      uint64_t v4 = [&unk_1F03459B0 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_SWCPrefs isAppleInternal](self, "isAppleInternal"));
  [v3 setObject:v11 forKeyedSubscript:@"appleInternal"];

  v12 = (void *)[v3 copy];
  return v12;
}

- (BOOL)isFastCheckEnabled
{
  return ![(_SWCPrefs *)self _BOOLForKey:@"disableFastCheck" defaultValue:0];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_SWCPrefs;
  return [(_SWCPrefs *)&v3 init];
}

- (unint64_t)_recheckFuzzForSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EB67B120 != -1) {
    dispatch_once(&qword_1EB67B120, &__block_literal_global_81);
  }
  return *(void *)&_MergedGlobals_2[8 * v3 + 112];
}

- (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  uint64_t v5 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.SharedWebCredentials");
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (unint64_t)_unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4
{
  return [(_SWCPrefs *)self _unsignedIntegerForKey:a3 defaultValue:a4 minimumValue:0 maximumValue:-1];
}

- (unint64_t)_unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4 minimumValue:(unint64_t)a5 maximumValue:(unint64_t)a6
{
  CFPropertyListRef v9 = CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.SharedWebCredentials");
  if (v9)
  {
    v10 = (void *)v9;
    if (objc_opt_respondsToSelector())
    {
      a4 = [v10 unsignedIntegerValue];
    }
    else if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [v10 integerValue];
      a4 = v13 & ~(v13 >> 63);
    }
    v14 = (void *)CFPreferencesCopyAppValue(@"skipClampingRetryDelaySecs", @"com.apple.SharedWebCredentials");
    if (objc_opt_respondsToSelector()) {
      int v15 = [v14 BOOLValue];
    }
    else {
      int v15 = 0;
    }

    if (a4 >= a6) {
      unint64_t v16 = a6;
    }
    else {
      unint64_t v16 = a4;
    }
    if (v16 <= a5) {
      unint64_t v16 = a5;
    }
    if (v15) {
      return a4;
    }
    else {
      return v16;
    }
  }
  else
  {
    if (a4 >= a6) {
      unint64_t v11 = a6;
    }
    else {
      unint64_t v11 = a4;
    }
    if (v11 <= a5) {
      return a5;
    }
    else {
      return v11;
    }
  }
}

- (id)_stringForKey:(id)a3 defaultValue:(id)a4
{
  id v5 = a4;
  v6 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.SharedWebCredentials");
  CFStringRef v7 = v5;
  if (v6)
  {
    if (_NSIsNSString())
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v6 description];
    }
    CFStringRef v7 = v8;
  }
  return v7;
}

- (void)_setString:(id)a3 forKey:(id)a4
{
}

@end