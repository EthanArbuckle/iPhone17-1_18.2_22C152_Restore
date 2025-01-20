@interface TRIMisc
+ (BOOL)convertFromString:(id)a3 usingBase:(int)a4 toI64:(int64_t *)a5;
+ (BOOL)convertFromString:(id)a3 usingBase:(int)a4 toU64:(unint64_t *)a5;
+ (id)bestEffortSymbolicateAddress:(void *)a3;
+ (unint64_t)roundToOneSignificantDigitWithU64:(unint64_t)a3;
+ (unint64_t)unsafeFirstAuthenticationState;
@end

@implementation TRIMisc

+ (unint64_t)unsafeFirstAuthenticationState
{
  int v2 = MKBDeviceUnlockedSinceBoot();
  if (v2 == 1) {
    return 1;
  }
  else {
    return 2 * (v2 != 0);
  }
}

+ (BOOL)convertFromString:(id)a3 usingBase:(int)a4 toU64:(unint64_t *)a5
{
  id v9 = a3;
  v10 = (void *)MEMORY[0x19F3AD060]();
  if (!v9)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"TRIMisc.m", 31, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }
  v11 = [v9 triTrim];

  id v12 = v11;
  v13 = (const char *)[v12 UTF8String];
  if (v13)
  {
    v14 = v13;
    size_t v15 = strlen(v13);
    *__error() = 0;
    __endptr = 0;
    unint64_t v16 = strtoull(v14, &__endptr, a4);
    if (*__error()) {
      BOOL v17 = 0;
    }
    else {
      BOOL v17 = __endptr == &v14[v15];
    }
    BOOL v18 = v17;
    if (a5 && v18) {
      *a5 = v16;
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

+ (BOOL)convertFromString:(id)a3 usingBase:(int)a4 toI64:(int64_t *)a5
{
  id v9 = a3;
  v10 = (void *)MEMORY[0x19F3AD060]();
  if (!v9)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"TRIMisc.m", 58, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }
  v11 = [v9 triTrim];

  id v12 = v11;
  v13 = (const char *)[v12 UTF8String];
  if (v13)
  {
    v14 = v13;
    size_t v15 = strlen(v13);
    *__error() = 0;
    __endptr = 0;
    int64_t v16 = strtoll(v14, &__endptr, a4);
    if (*__error()) {
      BOOL v17 = 0;
    }
    else {
      BOOL v17 = __endptr == &v14[v15];
    }
    BOOL v18 = v17;
    if (a5 && v18) {
      *a5 = v16;
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

+ (unint64_t)roundToOneSignificantDigitWithU64:(unint64_t)a3
{
  unint64_t result = a3;
  if (a3 >= 0xA)
  {
    if (a3 < 0x64)
    {
      uint64_t v6 = 10;
    }
    else
    {
      unint64_t v4 = 1;
      do
      {
        unint64_t v5 = v4;
        v4 *= 10;
      }
      while (a3 / v4 > 0x63);
      uint64_t v6 = 100 * v5;
      LOBYTE(result) = a3 / v4;
    }
    if (result % 0xAu <= 4) {
      uint64_t v7 = result / 0xAu;
    }
    else {
      uint64_t v7 = result / 0xAu + 1;
    }
    return v7 * v6;
  }
  return result;
}

+ (id)bestEffortSymbolicateAddress:(void *)a3
{
  v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p", a3, a3);
  unint64_t v4 = backtrace_symbols(&v12, 1);
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = [[NSString alloc] initWithUTF8String:*v4];
    uint64_t v7 = (void *)v6;
    if (v6) {
      v8 = (void *)v6;
    }
    else {
      v8 = v3;
    }
    id v9 = v8;

    free(v5);
    v3 = v9;
  }
  id v10 = v3;

  return v10;
}

@end