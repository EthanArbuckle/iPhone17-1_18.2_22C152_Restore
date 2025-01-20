@interface WFDiagnosticsResultItemAWDL
- (BOOL)didPassTest;
- (NSArray)failedTests;
- (NSArray)results;
- (NSString)suggestion;
- (NSString)title;
- (WFDiagnosticsResultItemAWDL)initWithResults:(id)a3;
- (void)setDidPassTest:(BOOL)a3;
- (void)setFailedTests:(id)a3;
- (void)setResults:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation WFDiagnosticsResultItemAWDL

- (WFDiagnosticsResultItemAWDL)initWithResults:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)WFDiagnosticsResultItemAWDL;
  v5 = [(WFDiagnosticsResultItemAWDL *)&v49 init];
  v6 = [v4 awdlDiagnosticsResults];
  [(WFDiagnosticsResultItemAWDL *)v5 setResults:v6];

  v7 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v8 = [(WFDiagnosticsResultItemAWDL *)v5 results];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if ([v14 testID] == 21)
        {
          if (v11)
          {
            v15 = WFLogForCategory(0);
            os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226071000, v15, v16, "Multiple AWDLEnabled results found!", buf, 2u);
            }

            goto LABEL_18;
          }
          unint64_t v11 = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
LABEL_18:

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v17 = [(WFDiagnosticsResultItemAWDL *)v5 results];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    unint64_t v20 = 0;
    uint64_t v21 = *(void *)v41;
    while (2)
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        if ([v23 testID] == 22)
        {
          if (v20)
          {
            v24 = WFLogForCategory(0);
            os_log_type_t v25 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v24 && os_log_type_enabled(v24, v25))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_226071000, v24, v25, "Multiple AWDL real time mode results found!", buf, 2u);
            }

            BOOL v26 = v11 != 0;
            BOOL v27 = 1;
            goto LABEL_36;
          }
          unint64_t v20 = v23;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v50 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v20 = 0;
  }

  BOOL v26 = v11 != 0;
  BOOL v27 = v20 != 0;
  if (v11 | v20)
  {
LABEL_36:
    if ([(id)v11 didPass]) {
      [v7 addObject:&unk_26D9E1EE8];
    }
    if ([(id)v20 didPass]) {
      [v7 addObject:&unk_26D9E1F00];
    }
    objc_storeStrong((id *)&v5->_failedTests, v7);
    if (v26 && v27 && ([(id)v11 didPass] & 1) == 0) {
      uint64_t v28 = [(id)v20 didPass] ^ 1;
    }
    else {
      uint64_t v28 = 0;
    }
    [(WFDiagnosticsResultItemAWDL *)v5 setDidPassTest:v28];
    WFCurrentDeviceCapability();
    int IsChinaDevice = WFCapabilityIsChinaDevice();
    if (![(WFDiagnosticsResultItemAWDL *)v5 didPassTest])
    {
      v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v32 = v31;
      if (IsChinaDevice)
      {
        v33 = [v31 localizedStringForKey:@"kWFLocDiagnosticsAWDLResultTitle_CH" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        [(WFDiagnosticsResultItemAWDL *)v5 setTitle:v33];

        v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v35 = v34;
        v36 = @"kWFLocDiagnosticsAWDLResultDetailDescription_CH";
      }
      else
      {
        v37 = [v31 localizedStringForKey:@"kWFLocDiagnosticsAWDLResultTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        [(WFDiagnosticsResultItemAWDL *)v5 setTitle:v37];

        v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v35 = v34;
        v36 = @"kWFLocDiagnosticsAWDLResultDetailDescription";
      }
      v38 = [v34 localizedStringForKey:v36 value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      [(WFDiagnosticsResultItemAWDL *)v5 setSuggestion:v38];
    }
    v29 = v5;
  }
  else
  {
    unint64_t v20 = 0;
    v29 = 0;
  }

  return v29;
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