@interface HKMHValenceSummaryQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange;
- (HKMHValenceSummaryQuery)initWithDayIndexRange:(id)a3 gregorianCalendar:(id)a4 predicate:(id)a5 resultsHandler:(id)a6;
- (NSCalendar)gregorianCalendar;
- (void)client_deliverValenceSummary:(id)a3 queryUUID:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_validate;
@end

@implementation HKMHValenceSummaryQuery

- (HKMHValenceSummaryQuery)initWithDayIndexRange:(id)a3 gregorianCalendar:(id)a4 predicate:(id)a5 resultsHandler:(id)a6
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v12 = a4;
  id v13 = a6;
  v14 = (void *)MEMORY[0x263F0A7C8];
  id v15 = a5;
  v16 = [v14 stateOfMindType];
  v21.receiver = self;
  v21.super_class = (Class)HKMHValenceSummaryQuery;
  v17 = [(HKQuery *)&v21 _initWithObjectType:v16 predicate:v15];

  if (v17)
  {
    v17->_dayIndexRange.start = var0;
    v17->_dayIndexRange.duration = var1;
    objc_storeStrong((id *)&v17->_gregorianCalendar, a4);
    uint64_t v18 = [v13 copy];
    id resultsHandler = v17->_resultsHandler;
    v17->_id resultsHandler = (id)v18;
  }
  return v17;
}

- (void)client_deliverValenceSummary:(id)a3 queryUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HKMHValenceSummaryQuery_client_deliverValenceSummary_queryUUID___block_invoke;
  block[3] = &unk_2653EF1D8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __66__HKMHValenceSummaryQuery_client_deliverValenceSummary_queryUUID___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v4 = v13;
    _os_log_impl(&dword_255F13000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received ValenceSummary", buf, 0xCu);
  }
  v5 = (void *)MEMORY[0x25A29CFD0](*(void *)(*(void *)(a1 + 32) + 152));
  id v6 = v5;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__HKMHValenceSummaryQuery_client_deliverValenceSummary_queryUUID___block_invoke_277;
    v9[3] = &unk_2653EF1B0;
    v9[4] = v7;
    id v11 = v5;
    id v10 = *(id *)(a1 + 48);
    objc_msgSend(v7, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v8, 1, v9);
  }
}

uint64_t __66__HKMHValenceSummaryQuery_client_deliverValenceSummary_queryUUID___block_invoke_277(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_255F13000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Delivering valence summary", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMHValenceSummaryQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setDayIndexRange:", self->_dayIndexRange.start, self->_dayIndexRange.duration, v5.receiver, v5.super_class);
  [v4 setGregorianCalendar:self->_gregorianCalendar];
}

+ (id)clientInterfaceProtocol
{
  return &unk_2704AEA28;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKMHValenceSummaryQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverValenceSummary_queryUUID_, 0, 0);
}

- (void)queue_deliverError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x25A29CFD0](self->_resultsHandler);
  objc_super v6 = [(HKQuery *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__HKMHValenceSummaryQuery_queue_deliverError___block_invoke;
  block[3] = &unk_2653EF1B0;
  id v10 = v4;
  id v11 = v5;
  block[4] = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __46__HKMHValenceSummaryQuery_queue_deliverError___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_255F13000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Throwing error", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)queue_validate
{
  v3.receiver = self;
  v3.super_class = (Class)HKMHValenceSummaryQuery;
  [(HKQuery *)&v3 queue_validate];
  if (!self->_resultsHandler) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F0AC10], @"%@ resultsHandler must not be nil", objc_opt_class() format];
  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMHValenceSummaryQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id resultsHandler = self->_resultsHandler;
  self->_id resultsHandler = 0;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  p_dayIndexRange = &self->_dayIndexRange;
  int64_t start = self->_dayIndexRange.start;
  int64_t duration = p_dayIndexRange->duration;
  result.int64_t var1 = duration;
  result.int64_t var0 = start;
  return result;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
}

@end