@interface TIDPBiomeReportingDelegate
+ (id)_BMEventWithKeyboardTokenFrequency:(id)a3 withLocale:(id)a4 withTokenType:(id)a5;
- (BOOL)record:(id)a3;
- (BOOL)recordTokenFrequency:(id)a3 withLocale:(id)a4 withTokenType:(id)a5;
- (TIDPBiomeReportingDelegate)init;
@end

@implementation TIDPBiomeReportingDelegate

- (void).cxx_destruct
{
}

- (BOOL)record:(id)a3
{
  return 0;
}

- (BOOL)recordTokenFrequency:(id)a3 withLocale:(id)a4 withTokenType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _BMEventWithKeyboardTokenFrequency:v10 withLocale:v9 withTokenType:v8];

  [(BMSource *)self->_source sendEvent:v11];
  return 1;
}

- (TIDPBiomeReportingDelegate)init
{
  v10.receiver = self;
  v10.super_class = (Class)TIDPBiomeReportingDelegate;
  v3 = [(TIDPBiomeReportingDelegate *)&v10 init];
  if (v3 == self)
  {
    v4 = BiomeLibrary();
    v5 = [v4 Keyboard];
    v6 = [v5 TokenFrequency];
    v7 = [v6 source];
    source = self->_source;
    self->_source = v7;
  }
  return v3;
}

+ (id)_BMEventWithKeyboardTokenFrequency:(id)a3 withLocale:(id)a4 withTokenType:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v21 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v16 = objc_alloc(MEMORY[0x1E4F4FE90]);
        v17 = [v10 objectForKeyedSubscript:v15];
        v18 = (void *)[v16 initWithToken:v15 count:v17];
        [v9 addObject:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  v19 = (void *)[objc_alloc(MEMORY[0x1E4F4FE88]) initWithTokenFrequencies:v9 locale:v21 tokenType:BMKeyboardTokenFrequencyTokenTypeFromString()];

  return v19;
}

@end