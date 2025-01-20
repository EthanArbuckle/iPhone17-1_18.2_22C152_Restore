@interface PFAssertionPolicyLog
- (void)notifyAssertion:(id)a3;
@end

@implementation PFAssertionPolicyLog

- (void)notifyAssertion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v4 = a3;
    v5 = [v4 prettyMethodName];
    v6 = [v4 fileName];
    uint64_t v7 = [v4 lineNumber];
    v8 = [v4 message];
    v9 = [v4 backtrace];

    v10 = [v9 componentsJoinedByString:@"\n"];
    int v11 = 138413314;
    v12 = v5;
    __int16 v13 = 2112;
    v14 = v6;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_error_impl(&dword_1BC3A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure in %@, %@:%lu\nMessage: %@\nBacktrace:\n%@", (uint8_t *)&v11, 0x34u);
  }
}

@end