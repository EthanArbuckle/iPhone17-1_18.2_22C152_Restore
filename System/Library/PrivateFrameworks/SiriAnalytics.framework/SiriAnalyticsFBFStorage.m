@interface SiriAnalyticsFBFStorage
- (SiriAnalyticsFBFStorage)init;
- (SiriAnalyticsFBFStorage)initWithApplicationIdentifier:(id)a3 telemetry:(id)a4;
- (void)store:(id)a3 topic:(id)a4 completion:(id)a5;
@end

@implementation SiriAnalyticsFBFStorage

- (SiriAnalyticsFBFStorage)initWithApplicationIdentifier:(id)a3 telemetry:(id)a4
{
  uint64_t v5 = sub_1A2C0D480();
  uint64_t v7 = v6;
  id v8 = a4;
  return (SiriAnalyticsFBFStorage *)FBFStorageShim.init(applicationIdentifier:telemetry:)(v5, v7, (uint64_t)a4);
}

- (void)store:(id)a3 topic:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1A2C0D480();
  v10 = v9;
  _Block_copy(v7);
  id v11 = a3;
  v12 = self;
  sub_1A2BE9404((uint64_t)v11, v8, v10, (uint64_t)v12, (void (**)(void, void))v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (SiriAnalyticsFBFStorage)init
{
}

- (void).cxx_destruct
{
}

@end