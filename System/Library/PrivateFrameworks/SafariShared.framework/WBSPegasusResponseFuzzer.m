@interface WBSPegasusResponseFuzzer
+ (WBSPegasusResponseFuzzer)sharedFuzzer;
+ (id)_protectedFields;
- (WBSParsecDSession)parsecSession;
- (WBSPegasusResponseFuzzer)init;
- (WBSPegasusResponseFuzzer)initWithParsecSession:(id)a3 sampleResponsesPlistKey:(id)a4;
- (id)_validPegasusResponseForKey:(id)a3;
- (id)responseForQuery:(id)a3;
- (void)_recordMutatedPegasusResponseJSON;
@end

@implementation WBSPegasusResponseFuzzer

+ (WBSPegasusResponseFuzzer)sharedFuzzer
{
  if (sharedFuzzer_onceToken != -1) {
    dispatch_once(&sharedFuzzer_onceToken, &__block_literal_global_78);
  }
  v2 = (void *)sharedFuzzer_sharedFuzzer;
  return (WBSPegasusResponseFuzzer *)v2;
}

void __40__WBSPegasusResponseFuzzer_sharedFuzzer__block_invoke()
{
  v0 = objc_alloc_init(WBSPegasusResponseFuzzer);
  v1 = (void *)sharedFuzzer_sharedFuzzer;
  sharedFuzzer_sharedFuzzer = (uint64_t)v0;
}

+ (id)_protectedFields
{
  if (_protectedFields_onceToken != -1) {
    dispatch_once(&_protectedFields_onceToken, &__block_literal_global_9_3);
  }
  v2 = (void *)_protectedFields__protectedFields;
  return v2;
}

void __44__WBSPegasusResponseFuzzer__protectedFields__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = [v0 initWithArray:MEMORY[0x1E4F1CBF0]];
  v2 = (void *)_protectedFields__protectedFields;
  _protectedFields__protectedFields = v1;
}

- (WBSPegasusResponseFuzzer)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = objc_msgSend(MEMORY[0x1E4F28F80], "processInfo", 0);
  v4 = [v3 arguments];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v9, "safari_hasPrefix:", @"PegasusResponseFuzzer") & 1) != 0
          || (objc_msgSend(v9, "safari_hasPrefix:", @"PegasusResponseRegression") & 1) != 0)
        {
          v13 = [WBSParsecDSession alloc];
          v11 = +[WBSParsecDSession sharedPARSession];
          v14 = [(WBSParsecDSession *)v13 initWithParsecdSession:v11 skipAutoFillDataUpdates:1];
          v12 = [(WBSPegasusResponseFuzzer *)self initWithParsecSession:v14 sampleResponsesPlistKey:v9];

          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v10 = [WBSParsecDSession alloc];
  v4 = +[WBSParsecDSession sharedPARSession];
  v11 = [(WBSParsecDSession *)v10 initWithParsecdSession:v4 skipAutoFillDataUpdates:1];
  v12 = [(WBSPegasusResponseFuzzer *)self initWithParsecSession:v11 sampleResponsesPlistKey:&stru_1EFBE3CF8];
LABEL_12:

  return v12;
}

- (WBSPegasusResponseFuzzer)initWithParsecSession:(id)a3 sampleResponsesPlistKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSPegasusResponseFuzzer;
  v9 = [(WBSPegasusResponseFuzzer *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parsecSession, a3);
    v10->_indexOfCurrentResponse = 0;
    uint64_t v11 = [(WBSPegasusResponseFuzzer *)v10 _validPegasusResponseForKey:v8];
    validJSONPARResponse = v10->_validJSONPARResponse;
    v10->_validJSONPARResponse = (NSArray *)v11;

    v13 = [WBSJSONMutator alloc];
    v14 = v10->_validJSONPARResponse;
    v15 = +[WBSPegasusResponseFuzzer _protectedFields];
    uint64_t v16 = [(WBSJSONMutator *)v13 initWithSource:v14 protectedFields:v15];
    jsonMutator = v10->_jsonMutator;
    v10->_jsonMutator = (WBSJSONMutator *)v16;

    long long v18 = (void *)MEMORY[0x1E4F5CBB8];
    long long v19 = v10->_validJSONPARResponse;
    v20 = [(WBSParsecDSession *)v10->_parsecSession parsecdSession];
    uint64_t v21 = [v18 responseFromJSON:v19 session:v20];
    currentResponse = v10->_currentResponse;
    v10->_currentResponse = (PARResponse *)v21;

    v10->_shouldAttachMutatedJSONToTestResultKeys = objc_msgSend(v8, "safari_hasPrefix:", @"PegasusResponseFuzzer");
    v23 = v10;
  }

  return v10;
}

- (id)responseForQuery:(id)a3
{
  uint64_t v5 = self->_currentResponse;
  if ([a3 isEqualToString:self->_query])
  {
    if (self->_shouldAttachMutatedJSONToTestResultKeys) {
      [(WBSPegasusResponseFuzzer *)self _recordMutatedPegasusResponseJSON];
    }
    uint64_t v6 = [(WBSJSONMutator *)self->_jsonMutator mutatedJSONProtectingRootObject:1];
    id lastSimulatedJSON = self->_lastSimulatedJSON;
    self->_id lastSimulatedJSON = v6;
    id v8 = v6;

    v9 = (void *)MEMORY[0x1E4F5CBB8];
    v10 = [(WBSParsecDSession *)self->_parsecSession parsecdSession];
    uint64_t v11 = [v9 responseFromJSON:v8 session:v10];
    currentResponse = self->_currentResponse;
    self->_currentResponse = v11;
  }
  return v5;
}

- (void)_recordMutatedPegasusResponseJSON
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Couldn't serialize mutated JSON for logging", v2, v3, v4, v5, v6);
}

- (id)_validPegasusResponseForKey:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  uint8_t v6 = objc_msgSend(v4, "safari_safariSharedBundle");
  id v7 = [v6 URLForResource:@"SafariPegasusResponseFuzzerSampleInputs" withExtension:@"plist"];

  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v7];
  v9 = [v8 objectForKeyedSubscript:v5];

  v10 = [v9 objectForKeyedSubscript:@"query"];
  query = self->_query;
  self->_query = v10;

  v12 = [v9 objectForKeyedSubscript:@"sampleJSON"];
  v13 = [v12 dataUsingEncoding:4];
  if (v13)
  {
    id v21 = 0;
    id v14 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v13 options:0 error:&v21];
    id v15 = v21;
    if (v15)
    {
      uint64_t v16 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[WBSPegasusResponseFuzzer _validPegasusResponseForKey:]();
      }
      long long v17 = 0;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22[0] = v14;
        uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];

        id v14 = (id)v19;
      }
      objc_storeStrong(&self->_lastSimulatedJSON, v14);
      id v14 = v14;
      long long v17 = v14;
    }
  }
  else
  {
    long long v18 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[WBSPegasusResponseFuzzer _validPegasusResponseForKey:]();
    }
    long long v17 = 0;
  }

  return v17;
}

- (WBSParsecDSession)parsecSession
{
  return self->_parsecSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsecSession, 0);
  objc_storeStrong(&self->_lastSimulatedJSON, 0);
  objc_storeStrong((id *)&self->_jsonMutator, 0);
  objc_storeStrong((id *)&self->_currentResponse, 0);
  objc_storeStrong((id *)&self->_validJSONPARResponse, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (void)_validPegasusResponseForKey:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Couldn't retrieve JSON from file while trying to fuzz search results", v2, v3, v4, v5, v6);
}

- (void)_validPegasusResponseForKey:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Couldn't serialize JSON while trying to fuzz search results", v2, v3, v4, v5, v6);
}

@end