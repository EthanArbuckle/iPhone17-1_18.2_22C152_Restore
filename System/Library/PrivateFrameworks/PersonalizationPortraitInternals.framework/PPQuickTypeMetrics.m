@interface PPQuickTypeMetrics
+ (id)instance;
+ (id)trackerForDistribution:(uint64_t)a1 withProperties:(void *)a2;
+ (void)contactMatchesWithContactsCount:(unint64_t)a3 foundInAppsCount:(unint64_t)a4;
+ (void)eventsMatches:(unint64_t)a3;
+ (void)frameworkError:(id)a3 errorCode:(int64_t)a4;
- (PPQuickTypeMetrics)init;
@end

@implementation PPQuickTypeMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsMatches, 0);
  objc_storeStrong((id *)&self->_foundInAppsMatches, 0);
  objc_storeStrong((id *)&self->_contactsMatches, 0);
  objc_storeStrong((id *)&self->_frameworkErrors, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (PPQuickTypeMetrics)init
{
  v24[12] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PPQuickTypeMetrics;
  v2 = [(PPQuickTypeMetrics *)&v22 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, (dispatch_qos_class_t)5u, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.proactive.PersonalizationPortrait.PPQuickTypeMetrics", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)MEMORY[0x1E4F93720];
    v24[0] = @"SG";
    v24[1] = @"CD";
    v24[2] = @"EK";
    v24[3] = @"CN_PS";
    v24[4] = @"CN_DS";
    v24[5] = @"CN_AD";
    v24[6] = @"CN_CS";
    v24[7] = @"CNAC";
    v24[8] = @"GEONoData";
    v24[9] = @"GEOTimeout";
    v24[10] = @"MK";
    v24[11] = @"PB";
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:12];
    v9 = [v7 propertyWithName:@"framework" possibleValues:v8];

    v10 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:", @"errorCode", 0, 0x7FFFFFFFFFFFFFFFLL);
    v23[0] = v9;
    v23[1] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v12 = @"frameworkErrors";
    self;
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"ProactiveExperts" event:@"frameworkErrors" registerProperties:v11];

    frameworkErrors = v2->_frameworkErrors;
    v2->_frameworkErrors = (PETScalarEventTracker *)v13;

    uint64_t v15 = +[PPQuickTypeMetrics trackerForDistribution:withProperties:]((uint64_t)PPQuickTypeMetrics, @"contactsMatches");
    contactsMatches = v2->_contactsMatches;
    v2->_contactsMatches = (PETDistributionEventTracker *)v15;

    uint64_t v17 = +[PPQuickTypeMetrics trackerForDistribution:withProperties:]((uint64_t)PPQuickTypeMetrics, @"foundInAppsMatches");
    foundInAppsMatches = v2->_foundInAppsMatches;
    v2->_foundInAppsMatches = (PETDistributionEventTracker *)v17;

    uint64_t v19 = +[PPQuickTypeMetrics trackerForDistribution:withProperties:]((uint64_t)PPQuickTypeMetrics, @"eventsMatches");
    eventsMatches = v2->_eventsMatches;
    v2->_eventsMatches = (PETDistributionEventTracker *)v19;
  }
  return v2;
}

+ (id)trackerForDistribution:(uint64_t)a1 withProperties:(void *)a2
{
  v3 = (void *)MEMORY[0x1E4F1CBF0];
  id v4 = MEMORY[0x1E4F1CBF0];
  id v5 = a2;
  self;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F93718]) initWithFeatureId:@"ProactiveExperts" event:v5 registerProperties:v3];

  return v6;
}

+ (void)eventsMatches:(unint64_t)a3
{
  id v4 = +[PPQuickTypeMetrics instance]();
  if (v4) {
    id v5 = v4[1];
  }
  else {
    id v5 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__PPQuickTypeMetrics_eventsMatches___block_invoke;
  v7[3] = &unk_1E65DA8A8;
  id v8 = v4;
  unint64_t v9 = a3;
  v6 = v4;
  dispatch_async(v5, v7);
}

+ (id)instance
{
  self;
  if (instance_onceToken != -1) {
    dispatch_once(&instance_onceToken, &__block_literal_global_10115);
  }
  v0 = (void *)instance__instance;
  return v0;
}

uint64_t __36__PPQuickTypeMetrics_eventsMatches___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[5];
  }
  return [v1 trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0] value:(double)*(unint64_t *)(a1 + 40)];
}

uint64_t __30__PPQuickTypeMetrics_instance__block_invoke()
{
  instance__instance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (void)contactMatchesWithContactsCount:(unint64_t)a3 foundInAppsCount:(unint64_t)a4
{
  v6 = +[PPQuickTypeMetrics instance]();
  if (v6) {
    v7 = v6[1];
  }
  else {
    v7 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PPQuickTypeMetrics_contactMatchesWithContactsCount_foundInAppsCount___block_invoke;
  block[3] = &unk_1E65D6F48;
  id v10 = v6;
  unint64_t v11 = a3;
  unint64_t v12 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __71__PPQuickTypeMetrics_contactMatchesWithContactsCount_foundInAppsCount___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    v3 = *(void **)(v2 + 24);
  }
  else {
    v3 = 0;
  }
  [v3 trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0] value:(double)(unint64_t)a1[5]];
  uint64_t v4 = a1[4];
  if (v4) {
    id v5 = *(void **)(v4 + 32);
  }
  else {
    id v5 = 0;
  }
  double v6 = (double)(unint64_t)a1[6];
  uint64_t v7 = MEMORY[0x1E4F1CBF0];
  return [v5 trackEventWithPropertyValues:v7 value:v6];
}

+ (void)frameworkError:(id)a3 errorCode:(int64_t)a4
{
  id v5 = a3;
  double v6 = +[PPQuickTypeMetrics instance]();
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6[1];
  }
  else {
    id v8 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PPQuickTypeMetrics_frameworkError_errorCode___block_invoke;
  block[3] = &unk_1E65DB808;
  id v12 = v6;
  id v13 = v5;
  int64_t v14 = a4;
  id v9 = v5;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __47__PPQuickTypeMetrics_frameworkError_errorCode___block_invoke(void *a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v1 = (void *)a1[4];
  if (v1) {
    v1 = (void *)v1[2];
  }
  uint64_t v2 = a1[6];
  v7[0] = a1[5];
  v3 = NSNumber;
  uint64_t v4 = v1;
  id v5 = [v3 numberWithInteger:v2];
  v7[1] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  [v4 trackEventWithPropertyValues:v6];
}

@end