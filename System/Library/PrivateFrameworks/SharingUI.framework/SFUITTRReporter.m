@interface SFUITTRReporter
+ (id)reporterForPeopleSuggestions;
- (SFUITTRReport)internalReport;
- (SFUITTRReporter)initWithReport:(id)a3;
- (id)_createSchemeURL;
- (void)report;
@end

@implementation SFUITTRReporter

+ (id)reporterForPeopleSuggestions
{
  v3 = +[SFUITTRReport peopleSuggestionReport];
  v4 = (void *)[objc_alloc((Class)a1) initWithReport:v3];

  return v4;
}

- (SFUITTRReporter)initWithReport:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFUITTRReporter;
  v6 = [(SFUITTRReporter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internalReport, a3);
  }

  return v7;
}

- (void)report
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21DB23000, log, OS_LOG_TYPE_ERROR, "TTR: failed getting a scheme url to report.", v1, 2u);
}

void __25__SFUITTRReporter_report__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = sharing_ui_log();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __25__SFUITTRReporter_report__block_invoke_cold_1(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_21DB23000, v6, OS_LOG_TYPE_DEFAULT, "TTR: succeeded opening shemeURL:%@", (uint8_t *)&v8, 0xCu);
  }
}

- (id)_createSchemeURL
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(SFUITTRReporter *)self internalReport];
  id v5 = [v4 title];

  if (v5)
  {
    v6 = [MEMORY[0x263F08BD0] queryItemWithName:@"Title" value:v5];
    [v3 addObject:v6];
  }
  uint64_t v7 = [(SFUITTRReporter *)self internalReport];
  int v8 = [v7 desc];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F08BD0] queryItemWithName:@"Description" value:v8];
    [v3 addObject:v9];
  }
  uint64_t v10 = (void *)MEMORY[0x263F08BD0];
  v11 = [(SFUITTRReporter *)self internalReport];
  v12 = [v11 component];
  v13 = [v12 identifier];
  v14 = [v10 queryItemWithName:@"ComponentID" value:v13];

  v15 = (void *)MEMORY[0x263F08BD0];
  v16 = [(SFUITTRReporter *)self internalReport];
  v17 = [v16 component];
  v18 = [v17 name];
  v19 = [v15 queryItemWithName:@"ComponentName" value:v18];

  v20 = (void *)MEMORY[0x263F08BD0];
  v21 = [(SFUITTRReporter *)self internalReport];
  v22 = [v21 component];
  v23 = [v22 version];
  v24 = [v20 queryItemWithName:@"ComponentVersion" value:v23];

  [v3 addObject:v14];
  [v3 addObject:v19];
  [v3 addObject:v24];
  v25 = [MEMORY[0x263F08BA0] componentsWithString:@"tap-to-radar://new"];
  [v25 setQueryItems:v3];
  v26 = [v25 URL];

  return v26;
}

- (SFUITTRReport)internalReport
{
  return self->_internalReport;
}

- (void).cxx_destruct
{
}

void __25__SFUITTRReporter_report__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21DB23000, log, OS_LOG_TYPE_ERROR, "TTR: failed opening shemeURL:%@ error:%@", (uint8_t *)&v4, 0x16u);
}

@end