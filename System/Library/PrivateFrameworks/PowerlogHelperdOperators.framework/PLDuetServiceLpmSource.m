@interface PLDuetServiceLpmSource
+ (id)entryEventForwardDefinitionLpmSourceInformation;
- (PLDuetServiceLpmSource)init;
- (PLService)duetService;
- (PLXPCListenerOperatorComposition)lpmDisabledXPCListener;
- (PLXPCListenerOperatorComposition)lpmEnabledXPCListener;
- (void)didReceiveLpmSourceInfoWithPayload:(id)a3 withFlag:(signed __int16)a4;
- (void)initOperatorDependanciesLpmSource:(id)a3;
- (void)setDuetService:(id)a3;
- (void)setLpmDisabledXPCListener:(id)a3;
- (void)setLpmEnabledXPCListener:(id)a3;
- (void)stopService;
@end

@implementation PLDuetServiceLpmSource

- (PLDuetServiceLpmSource)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLDuetServiceLpmSource;
    self = [(PLDuetServiceLpmSource *)&v5 init];
    v3 = self;
  }

  return v3;
}

+ (id)entryEventForwardDefinitionLpmSourceInformation
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F4012588;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"Source";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v10[1] = @"LpmEnabled";
  v11[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

- (void)stopService
{
}

- (void)initOperatorDependanciesLpmSource:(id)a3
{
  id v4 = a3;
  if (v4 && !+[PLUtilities isPowerlogHelperd])
  {
    [(PLDuetServiceLpmSource *)self setDuetService:v4];
    id v5 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v6 = [(PLDuetServiceLpmSource *)self duetService];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PLDuetServiceLpmSource_initOperatorDependanciesLpmSource___block_invoke;
    v12[3] = &unk_1E6E47740;
    v12[4] = self;
    v7 = (void *)[v5 initWithOperator:v6 withRegistration:&unk_1F4011A18 withBlock:v12];
    [(PLDuetServiceLpmSource *)self setLpmEnabledXPCListener:v7];

    id v8 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v9 = [(PLDuetServiceLpmSource *)self duetService];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __60__PLDuetServiceLpmSource_initOperatorDependanciesLpmSource___block_invoke_2;
    v11[3] = &unk_1E6E47740;
    v11[4] = self;
    v10 = (void *)[v8 initWithOperator:v9 withRegistration:&unk_1F4011A40 withBlock:v11];
    [(PLDuetServiceLpmSource *)self setLpmDisabledXPCListener:v10];
  }
}

uint64_t __60__PLDuetServiceLpmSource_initOperatorDependanciesLpmSource___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveLpmSourceInfoWithPayload:a5 withFlag:1];
}

uint64_t __60__PLDuetServiceLpmSource_initOperatorDependanciesLpmSource___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveLpmSourceInfoWithPayload:a5 withFlag:0];
}

- (void)didReceiveLpmSourceInfoWithPayload:(id)a3 withFlag:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (v6)
  {
    v7 = [(PLDuetServiceLpmSource *)self duetService];

    if (v7)
    {
      id v8 = PLLogDuetServiceLpmSource();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLDuetServiceLpmSource didReceiveLpmSourceInfoWithPayload:withFlag:]((uint64_t)v6, v8);
      }

      id v9 = objc_alloc(MEMORY[0x1E4F929D0]);
      v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"LpmSourceInformation"];
      v11 = (void *)[v9 initWithEntryKey:v10];

      uint64_t v12 = [v6 objectForKeyedSubscript:@"source"];
      [v11 setObject:v12 forKeyedSubscript:@"Source"];
      v13 = [MEMORY[0x1E4F28ED0] numberWithShort:v4];
      [v11 setObject:v13 forKeyedSubscript:@"LpmEnabled"];

      v14 = [(PLDuetServiceLpmSource *)self duetService];

      if (v14)
      {
        v15 = [(PLDuetServiceLpmSource *)self duetService];
        [v15 logEntry:v11];
      }
      v16 = objc_opt_new();
      if (v4 == 1) {
        v17 = @"lpm.enabledCount.";
      }
      else {
        v17 = @"lpm.disabledCount.";
      }
      if (v4 == 1) {
        v18 = @"enabled";
      }
      else {
        v18 = @"disabled";
      }
      v19 = [@"com.apple.power." stringByAppendingString:v17];
      [v16 setObject:v18 forKeyedSubscript:@"state"];
      MEMORY[0x1E4E7E330]([v19 stringByAppendingString:v12], 1);
      [v16 setObject:v12 forKeyedSubscript:@"source"];
      v21 = v16;
      id v20 = v16;
      AnalyticsSendEventLazy();
    }
  }
}

id __70__PLDuetServiceLpmSource_didReceiveLpmSourceInfoWithPayload_withFlag___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (PLService)duetService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_duetService);
  return (PLService *)WeakRetained;
}

- (void)setDuetService:(id)a3
{
}

- (PLXPCListenerOperatorComposition)lpmEnabledXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLpmEnabledXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)lpmDisabledXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLpmDisabledXPCListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lpmDisabledXPCListener, 0);
  objc_storeStrong((id *)&self->_lpmEnabledXPCListener, 0);
  objc_destroyWeak((id *)&self->_duetService);
}

- (void)didReceiveLpmSourceInfoWithPayload:(uint64_t)a1 withFlag:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "didReceiveLpmSourceInfoWithPayload payload=%@", (uint8_t *)&v2, 0xCu);
}

@end