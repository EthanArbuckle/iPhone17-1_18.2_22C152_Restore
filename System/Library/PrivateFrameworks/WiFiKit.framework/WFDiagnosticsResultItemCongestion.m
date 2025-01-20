@interface WFDiagnosticsResultItemCongestion
- (BOOL)didPassTest;
- (NSArray)failedTests;
- (NSArray)results;
- (NSString)suggestion;
- (NSString)title;
- (WFDiagnosticsResultItemCongestion)initWithResults:(id)a3;
- (void)setDidPassTest:(BOOL)a3;
- (void)setFailedTests:(id)a3;
- (void)setResults:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation WFDiagnosticsResultItemCongestion

- (WFDiagnosticsResultItemCongestion)initWithResults:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WFDiagnosticsResultItemCongestion;
  v5 = [(WFDiagnosticsResultItemCongestion *)&v30 init];
  v6 = [v4 congestionDiagnosticsResults];
  [(WFDiagnosticsResultItemCongestion *)v5 setResults:v6];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v7 = [(WFDiagnosticsResultItemCongestion *)v5 results];
  v8 = (WFDiagnosticsResultItemCongestion *)[v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    id v9 = 0;
    uint64_t v10 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v8; i = (WFDiagnosticsResultItemCongestion *)((char *)i + 1))
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v12 testID] == 24)
        {
          if (v9)
          {
            v13 = WFLogForCategory(0);
            os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
            {
              *(_WORD *)v25 = 0;
              _os_log_impl(&dword_226071000, v13, v14, "Multiple channel congestion results found!", v25, 2u);
            }

            goto LABEL_18;
          }
          id v9 = v12;
        }
      }
      v8 = (WFDiagnosticsResultItemCongestion *)[v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    if (!v9)
    {
      v8 = 0;
      goto LABEL_26;
    }
LABEL_18:
    -[WFDiagnosticsResultItemCongestion setDidPassTest:](v5, "setDidPassTest:", [v9 didPass]);
    failedTests = v5->_failedTests;
    v5->_failedTests = (NSArray *)MEMORY[0x263EFFA68];

    WFCurrentDeviceCapability();
    int IsChinaDevice = WFCapabilityIsChinaDevice();
    if (![(WFDiagnosticsResultItemCongestion *)v5 didPassTest])
    {
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v18 = v17;
      if (IsChinaDevice) {
        v19 = @"kWFLocDiagnosticsCongestionResultTitle_CH";
      }
      else {
        v19 = @"kWFLocDiagnosticsCongestionResultTitle";
      }
      v20 = [v17 localizedStringForKey:v19 value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      [(WFDiagnosticsResultItemCongestion *)v5 setTitle:v20];

      v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"kWFLocDiagnosticsCongestionResultDetailDescription" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      [(WFDiagnosticsResultItemCongestion *)v5 setSuggestion:v22];

      v23 = v5->_failedTests;
      v5->_failedTests = (NSArray *)&unk_26D9E21A0;
    }
    v8 = v5;
  }
  else
  {
    id v9 = v7;
  }

LABEL_26:
  return v8;
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

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
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
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end