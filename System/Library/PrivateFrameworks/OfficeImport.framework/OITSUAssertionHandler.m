@interface OITSUAssertionHandler
+ (id)p_performBlockIgnoringAssertions:(id)a3 onlyFatal:(BOOL)a4;
+ (id)performBlockIgnoringAssertions:(id)a3;
+ (id)performBlockIgnoringFatalAssertions:(id)a3;
+ (int)_atomicIncrementAssertCount;
+ (void)logBacktrace;
+ (void)logBacktraceWithCallStackSymbols:(id)a3;
@end

@implementation OITSUAssertionHandler

+ (id)performBlockIgnoringAssertions:(id)a3
{
  return (id)objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:", a3, 0);
}

+ (id)performBlockIgnoringFatalAssertions:(id)a3
{
  return (id)objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:", a3, 1);
}

+ (id)p_performBlockIgnoringAssertions:(id)a3 onlyFatal:(BOOL)a4
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  uint64_t v15 = 0;
  uint64_t v4 = _ignoreAssertionsCallback;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__OITSUAssertionHandler_p_performBlockIgnoringAssertions_onlyFatal___block_invoke;
  v8[3] = &unk_264D60BB0;
  BOOL v9 = a4;
  v8[4] = &v10;
  _ignoreAssertionsCallback = (uint64_t)v8;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  _ignoreAssertionsCallback = v4;
  id v5 = (id)v11[5];
  v6 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __68__OITSUAssertionHandler_p_performBlockIgnoringAssertions_onlyFatal___block_invoke(uint64_t a1, void *a2, char a3)
{
  if (TSUDefaultCat_init_token == -1)
  {
    if (a3)
    {
LABEL_3:
      uint64_t v6 = [[NSString alloc] initWithFormat:@"Terminating application due to %@", a2];
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_1);
    if (a3) {
      goto LABEL_3;
    }
  }
  if (*(unsigned char *)(a1 + 40)) {
    return;
  }
  uint64_t v6 = [a2 copy];
LABEL_7:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v6;
}

os_log_t __68__OITSUAssertionHandler_p_performBlockIgnoringAssertions_onlyFatal___block_invoke_2()
{
  os_log_t result = TSULogCreateCategory("TSUDefaultCat");
  TSUDefaultCat_log_t = (uint64_t)result;
  return result;
}

+ (void)logBacktrace
{
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary");
  uint64_t v4 = (void *)[v3 objectForKeyedSubscript:@"logBacktrace_lastStackAddress"];
  id v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "callStackReturnAddresses"), "copy");
  if (v4 && [v4 isEqualToArray:v5])
  {
    [a1 logBacktraceWithCallStackSymbols:&unk_26EC806A8];
  }
  else
  {
    objc_msgSend(a1, "logBacktraceWithCallStackSymbols:", objc_msgSend(MEMORY[0x263F08B88], "callStackSymbols"));
    [v3 setObject:v5 forKeyedSubscript:@"logBacktrace_lastStackAddress"];
  }
}

+ (void)logBacktraceWithCallStackSymbols:(id)a3
{
  if (TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_36);
  }
  [a1 simulateCrashWithMessage:@"+[TSUAssert logBacktrace]"];
}

os_log_t __58__OITSUAssertionHandler_logBacktraceWithCallStackSymbols___block_invoke()
{
  os_log_t result = TSULogCreateCategory("TSUDefaultCat");
  TSUDefaultCat_log_t = (uint64_t)result;
  return result;
}

+ (int)_atomicIncrementAssertCount
{
  return atomic_fetch_add(sAssertionCount, 1u);
}

@end