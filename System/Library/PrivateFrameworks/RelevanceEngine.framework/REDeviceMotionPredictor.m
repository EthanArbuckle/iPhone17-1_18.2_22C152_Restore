@interface REDeviceMotionPredictor
+ (id)supportedFeatures;
- (BOOL)isStationary;
- (CMMotionActivityManager)activityManager;
- (id)_init;
- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6;
- (unint64_t)motionType;
- (void)_init;
- (void)_updateWithActivity:(id)a3;
- (void)pause;
- (void)resume;
- (void)setMotionType:(unint64_t)a3;
- (void)setStationary:(BOOL)a3;
@end

@implementation REDeviceMotionPredictor

+ (id)supportedFeatures
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = [REFeatureSet alloc];
  v3 = +[REFeature isStationaryFeature];
  v8[0] = v3;
  v4 = +[REFeature deviceMotionFeature];
  v8[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  v6 = [(REFeatureSet *)v2 initWithFeatures:v5];

  return v6;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)REDeviceMotionPredictor;
  v2 = [(REPredictor *)&v7 _init];
  if (v2)
  {
    if (!CoreMotionLibraryCore()
      || ![getCMMotionActivityManagerClass() isActivityAvailable])
    {
      v5 = RELogForDomain(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[REDeviceMotionPredictor _init](v5);
      }
      goto LABEL_9;
    }
    getCMMotionActivityManagerClass();
    uint64_t v3 = objc_opt_new();
    v4 = (void *)v2[8];
    v2[8] = v3;

    if ([getCMMotionActivityManagerClass() authorizationStatus] != 3)
    {
      v5 = RELogForDomain(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[REDeviceMotionPredictor _init](v5);
      }
LABEL_9:
    }
  }
  return v2;
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v7 = a3;
  v8 = +[REFeature isStationaryFeature];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = +[REFeatureValue featureValueWithBool:[(REDeviceMotionPredictor *)self isStationary]];
LABEL_5:
    v13 = (void *)v10;
    goto LABEL_7;
  }
  v11 = +[REFeature deviceMotionFeature];
  int v12 = [v7 isEqual:v11];

  if (v12)
  {
    uint64_t v10 = +[REFeatureValue featureValueWithInt64:[(REDeviceMotionPredictor *)self motionType]];
    goto LABEL_5;
  }
  v13 = 0;
LABEL_7:

  return v13;
}

- (void)resume
{
  id v3 = objc_alloc_init(MEMORY[0x263F08A48]);
  v4 = [(REPredictor *)self queue];
  [v3 setUnderlyingQueue:v4];

  objc_initWeak(&location, self);
  v5 = [(REPredictor *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __33__REDeviceMotionPredictor_resume__block_invoke;
  v11[3] = &unk_2644BC638;
  objc_copyWeak(&v12, &location);
  v6 = +[REUpNextScheduler schedulerWithQueue:v5 delay:v11 updateBlock:300.0];
  scheduler = self->_scheduler;
  self->_scheduler = v6;

  activityManager = self->_activityManager;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__REDeviceMotionPredictor_resume__block_invoke_2;
  v9[3] = &unk_2644C0578;
  objc_copyWeak(&v10, &location);
  [(CMMotionActivityManager *)activityManager startActivityUpdatesToQueue:v3 withHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __33__REDeviceMotionPredictor_resume__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained _updateWithActivity:WeakRetained[10]];
    WeakRetained = v2;
  }
}

void __33__REDeviceMotionPredictor_resume__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 10, a2);
    [v5[9] schedule];
  }
}

- (void)pause
{
  [(CMMotionActivityManager *)self->_activityManager stopActivityUpdates];
  scheduler = self->_scheduler;
  self->_scheduler = 0;
}

- (void)_updateWithActivity:(id)a3
{
  id v7 = a3;
  int v4 = [(REDeviceMotionPredictor *)self isStationary];
  -[REDeviceMotionPredictor setStationary:](self, "setStationary:", [v7 stationary]);
  if ([v7 walking])
  {
    uint64_t v5 = 1;
  }
  else if ([v7 running])
  {
    uint64_t v5 = 2;
  }
  else if ([v7 automotive])
  {
    uint64_t v5 = 4;
  }
  else if ([v7 cycling])
  {
    uint64_t v5 = 8;
  }
  else
  {
    [v7 unknown];
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(REDeviceMotionPredictor *)self motionType];
  [(REDeviceMotionPredictor *)self setMotionType:v5];
  if (v4 != [v7 stationary] || v6 != v5) {
    [(REPredictor *)self updateObservers];
  }
}

- (CMMotionActivityManager)activityManager
{
  return self->_activityManager;
}

- (BOOL)isStationary
{
  return self->_stationary;
}

- (void)setStationary:(BOOL)a3
{
  self->_stationary = a3;
}

- (unint64_t)motionType
{
  return self->_motionType;
}

- (void)setMotionType:(unint64_t)a3
{
  self->_motionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivity, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

- (void)_init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "Process not entitled for CoreMoiton data", v1, 2u);
}

@end