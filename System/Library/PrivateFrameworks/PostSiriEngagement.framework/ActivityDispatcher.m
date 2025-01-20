@interface ActivityDispatcher
+ (id)getErrorFailedCollectors:(id)a3;
+ (id)getErrorNoCollectorDefinitionsToRun;
+ (id)getExecQ;
- (void)runCollectorsDefinedInParameters:(id)a3 completion:(id)a4;
@end

@implementation ActivityDispatcher

+ (id)getExecQ
{
  if (getExecQ_onceToken != -1) {
    dispatch_once(&getExecQ_onceToken, &__block_literal_global);
  }
  v2 = (void *)getExecQ__execQ;
  return v2;
}

void __30__ActivityDispatcher_getExecQ__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_BACKGROUND, -32768);
  dispatch_queue_t v0 = dispatch_queue_create("PSE_BG_Q_for_collectors", v2);
  v1 = (void *)getExecQ__execQ;
  getExecQ__execQ = (uint64_t)v0;
}

+ (id)getErrorNoCollectorDefinitionsToRun
{
  if (getErrorNoCollectorDefinitionsToRun_onceToken != -1) {
    dispatch_once(&getErrorNoCollectorDefinitionsToRun_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)getErrorNoCollectorDefinitionsToRun_kErrorNoCollectorDefinitionsToRun;
  return v2;
}

uint64_t __57__ActivityDispatcher_getErrorNoCollectorDefinitionsToRun__block_invoke()
{
  getErrorNoCollectorDefinitionsToRun_kErrorNoCollectorDefinitionsToRun = [MEMORY[0x263F087E8] errorWithDomain:@"PostSiriEngagement" code:-1 userInfo:&unk_26D851D48];
  return MEMORY[0x270F9A758]();
}

+ (id)getErrorFailedCollectors:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  v9 = @"failed_collectors";
  v10[0] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v3 errorWithDomain:@"PostSiriEngagement" code:-10 userInfo:v6];

  return v7;
}

- (void)runCollectorsDefinedInParameters:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  _Block_copy(v5);
  v9 = self;
  specialized ActivityDispatcher.runCollectorsDefinedIn(parameters:completion:)(v6, v8, v9, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

@end