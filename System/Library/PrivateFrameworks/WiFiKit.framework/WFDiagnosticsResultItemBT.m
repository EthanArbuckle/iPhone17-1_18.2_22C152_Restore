@interface WFDiagnosticsResultItemBT
- (BOOL)didPassTest;
- (NSArray)failedTests;
- (NSArray)results;
- (NSString)suggestion;
- (NSString)title;
- (WFDiagnosticsResultItemBT)initWithResults:(id)a3;
- (void)setDidPassTest:(BOOL)a3;
- (void)setFailedTests:(id)a3;
- (void)setResults:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation WFDiagnosticsResultItemBT

- (WFDiagnosticsResultItemBT)initWithResults:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WFDiagnosticsResultItemBT;
  v5 = [(WFDiagnosticsResultItemBT *)&v32 init];
  v6 = [v4 btDiagnosticsResults];
  [(WFDiagnosticsResultItemBT *)v5 setResults:v6];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v7 = [(WFDiagnosticsResultItemBT *)v5 results];
  v8 = (WFDiagnosticsResultItemBT *)[v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    id v9 = 0;
    uint64_t v10 = *(void *)v29;
    while (2)
    {
      for (i = 0; i != v8; i = (WFDiagnosticsResultItemBT *)((char *)i + 1))
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v12 testID] == 19)
        {
          if (v9)
          {
            v13 = WFLogForCategory(0);
            os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
            {
              *(_WORD *)v27 = 0;
              _os_log_impl(&dword_226071000, v13, v14, "Multiple BTConnected results found!", v27, 2u);
            }

            goto LABEL_18;
          }
          id v9 = v12;
        }
      }
      v8 = (WFDiagnosticsResultItemBT *)[v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
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
    v15 = [v9 info];
    v16 = [v15 objectForKey:@"BTConnectedCount"];
    -[WFDiagnosticsResultItemBT setDidPassTest:](v5, "setDidPassTest:", (int)[v16 intValue] < 5);

    failedTests = v5->_failedTests;
    v5->_failedTests = (NSArray *)MEMORY[0x263EFFA68];

    WFCurrentDeviceCapability();
    int IsChinaDevice = WFCapabilityIsChinaDevice();
    if (![(WFDiagnosticsResultItemBT *)v5 didPassTest])
    {
      v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v20 = [v19 localizedStringForKey:@"kWFLocDiagnosticsBTResultTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      [(WFDiagnosticsResultItemBT *)v5 setTitle:v20];

      v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v22 = v21;
      if (IsChinaDevice) {
        v23 = @"kWFLocDiagnosticsBTResultDetailDescription_CH";
      }
      else {
        v23 = @"kWFLocDiagnosticsBTResultDetailDescription";
      }
      v24 = [v21 localizedStringForKey:v23 value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      [(WFDiagnosticsResultItemBT *)v5 setSuggestion:v24];

      v25 = v5->_failedTests;
      v5->_failedTests = (NSArray *)&unk_26D9E2260;
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