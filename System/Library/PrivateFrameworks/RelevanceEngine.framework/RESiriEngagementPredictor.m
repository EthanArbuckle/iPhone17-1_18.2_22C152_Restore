@interface RESiriEngagementPredictor
+ (id)supportedFeatures;
- (NSString)lastSiriDomain;
- (float)siriInfluence;
- (id)_init;
- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6;
- (void)siriServer:(id)a3 receivedCompletedRequestDomain:(id)a4;
@end

@implementation RESiriEngagementPredictor

+ (id)supportedFeatures
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [REFeatureSet alloc];
  v3 = +[REFeature siriDomainFeature];
  v7[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [(REFeatureSet *)v2 initWithFeatures:v4];

  return v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)RESiriEngagementPredictor;
  return [(REPredictor *)&v3 _init];
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  lastSiriDomain = self->_lastSiriDomain;
  v8 = objc_msgSend(a4, "bundleIdentifier", a3);
  LODWORD(lastSiriDomain) = [(NSString *)lastSiriDomain isEqualToString:v8];

  double siriInfluence = 0.0;
  if (lastSiriDomain) {
    double siriInfluence = self->_siriInfluence;
  }
  v10 = +[REFeatureValue featureValueWithDouble:siriInfluence];
  return v10;
}

- (void)siriServer:(id)a3 receivedCompletedRequestDomain:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __71__RESiriEngagementPredictor_siriServer_receivedCompletedRequestDomain___block_invoke;
  v7[3] = &unk_2644BC688;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(REPredictor *)self onQueue:v7];
}

void __71__RESiriEngagementPredictor_siriServer_receivedCompletedRequestDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 64);
  if (v3)
  {
    [v3 invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 72), *(id *)(a1 + 40));
  *(_DWORD *)(*(void *)(a1 + 32) + 80) = 1065353216;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v6 = objc_alloc(MEMORY[0x263F08798]);
  v7 = [MEMORY[0x263EFF910] date];
  id v8 = (void *)[v6 initWithStartDate:v7 duration:1800.0];

  v9 = [*(id *)(a1 + 32) queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__RESiriEngagementPredictor_siriServer_receivedCompletedRequestDomain___block_invoke_2;
  v15[3] = &unk_2644BE580;
  objc_copyWeak(&v18, &location);
  id v10 = v8;
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = v10;
  uint64_t v17 = v11;
  uint64_t v12 = +[REUpNextTimer timerWithFireInterval:v10 atRate:v9 queue:v15 block:60.0];
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 64);
  *(void *)(v13 + 64) = v12;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __71__RESiriEngagementPredictor_siriServer_receivedCompletedRequestDomain___block_invoke_2(id *a1)
{
  WeakRetained = (float *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v2 = [MEMORY[0x263EFF910] date];
    objc_super v3 = [a1[4] startDate];
    [v3 timeIntervalSinceReferenceDate];
    double v5 = v4;

    id v6 = [a1[4] endDate];
    [v6 timeIntervalSinceReferenceDate];
    double v8 = v7;

    [v2 timeIntervalSinceReferenceDate];
    float v10 = REPercentThroughRange(v9, v5, v8) * -0.189999998 / 60.0;
    WeakRetained[20] = expf(v10) * 0.34;
    [a1[5] updateObservers];
  }
}

- (NSString)lastSiriDomain
{
  return self->_lastSiriDomain;
}

- (float)siriInfluence
{
  return self->_siriInfluence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSiriDomain, 0);
  objc_storeStrong((id *)&self->_siriDecayTimer, 0);
}

@end