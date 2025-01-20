@interface _HDSPBiomeBridge
- (BMBiomeScheduler)scheduler;
- (_HDSPBiomeBridge)init;
- (id)subscribe:(id)a3 callback:(id)a4;
- (void)publish:(id)a3 stream:(id)a4;
@end

@implementation _HDSPBiomeBridge

- (_HDSPBiomeBridge)init
{
  v9.receiver = self;
  v9.super_class = (Class)_HDSPBiomeBridge;
  v2 = [(_HDSPBiomeBridge *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.sleep.HDSPBiomeManager.queue", v3);

    uint64_t v5 = [objc_alloc(MEMORY[0x263F2A758]) initWithIdentifier:@"com.apple.sleepd.biome" targetQueue:v4 waking:1];
    scheduler = v2->_scheduler;
    v2->_scheduler = (BMBiomeScheduler *)v5;

    v7 = v2;
  }

  return v2;
}

- (id)subscribe:(id)a3 callback:(id)a4
{
  id v6 = a4;
  v7 = [a3 subscribeOn:self->_scheduler];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39___HDSPBiomeBridge_subscribe_callback___block_invoke_391;
  v11[3] = &unk_2645DAAC8;
  id v12 = v6;
  id v8 = v6;
  objc_super v9 = [v7 sinkWithCompletion:&__block_literal_global_21 receiveInput:v11];

  return v9;
}

- (void)publish:(id)a3 stream:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    uint64_t v10 = objc_opt_class();
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] publishing event: [%{public}@]", (uint8_t *)&v9, 0x16u);
  }

  id v8 = [v6 source];

  [v8 sendEvent:v5];
}

- (BMBiomeScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
}

@end