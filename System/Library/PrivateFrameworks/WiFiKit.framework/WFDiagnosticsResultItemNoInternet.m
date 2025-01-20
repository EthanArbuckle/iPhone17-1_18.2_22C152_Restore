@interface WFDiagnosticsResultItemNoInternet
- (BOOL)didPassTest;
- (NSArray)failedTests;
- (NSArray)results;
- (NSString)suggestion;
- (NSString)title;
- (WFDiagnosticsResultItemNoInternet)initWithResults:(id)a3;
- (void)setDidPassTest:(BOOL)a3;
- (void)setFailedTests:(id)a3;
- (void)setResults:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation WFDiagnosticsResultItemNoInternet

- (WFDiagnosticsResultItemNoInternet)initWithResults:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WFDiagnosticsResultItemNoInternet;
  v5 = [(WFDiagnosticsResultItemNoInternet *)&v25 init];
  v6 = [v4 noInternetDiagnosticsResults];
  [(WFDiagnosticsResultItemNoInternet *)v5 setResults:v6];

  v7 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v8 = [(WFDiagnosticsResultItemNoInternet *)v5 results];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = 0;
    uint64_t v12 = *(void *)v22;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
      if ([v14 testID] == 11)
      {
        if (v11)
        {
          v15 = WFLogForCategory(0);
          os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl(&dword_226071000, v15, v16, "Multiple RetrieveAppleDisallowCellular results found!", v20, 2u);
          }

          goto LABEL_18;
        }
        v11 = v14;
      }
      if (v10 == ++v13)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v10) {
          goto LABEL_3;
        }

        if (!v11) {
          goto LABEL_22;
        }
LABEL_18:
        if (([v11 didPass] & 1) == 0) {
          [v7 addObject:&unk_26D9E1FD8];
        }
        objc_storeStrong((id *)&v5->_failedTests, v7);
        [(WFDiagnosticsResultItemNoInternet *)v5 setDidPassTest:[v11 didPass]];
        v17 = v5;
        goto LABEL_27;
      }
    }
  }

LABEL_22:
  v11 = WFLogForCategory(0);
  os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
  v17 = 0;
  if (WFCurrentLogLevel() && v11)
  {
    if (os_log_type_enabled(v11, v18))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_226071000, v11, v18, "No Internet tests didn't have complete test results!", v20, 2u);
    }
    v17 = 0;
  }
LABEL_27:

  return v17;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
}

- (BOOL)didPassTest
{
  return self->_didPassTest;
}

- (void)setDidPassTest:(BOOL)a3
{
  self->_didPassTest = a3;
}

- (NSArray)failedTests
{
  return self->_failedTests;
}

- (void)setFailedTests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedTests, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end