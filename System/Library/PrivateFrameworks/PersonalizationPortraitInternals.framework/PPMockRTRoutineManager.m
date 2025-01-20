@interface PPMockRTRoutineManager
+ (id)defaultManager;
+ (void)initialize;
+ (void)setMockLocationsOfInterest:(id)a3;
- (PPMockRTRoutineManager)init;
- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 withHandler:(id)a5;
@end

@implementation PPMockRTRoutineManager

- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 withHandler:(id)a5
{
  id v5 = a5;
  v6 = (void *)_mockLocationsOfInterest;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__PPMockRTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke;
  v8[3] = &unk_1E65D4C30;
  id v9 = v5;
  id v7 = v5;
  [v6 runWithLockAcquired:v8];
}

uint64_t __94__PPMockRTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PPMockRTRoutineManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPMockRTRoutineManager;
  return [(PPMockRTRoutineManager *)&v3 init];
}

+ (id)defaultManager
{
  v2 = objc_opt_new();
  return v2;
}

+ (void)setMockLocationsOfInterest:(id)a3
{
  id v3 = a3;
  v4 = (void *)_mockLocationsOfInterest;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PPMockRTRoutineManager_setMockLocationsOfInterest___block_invoke;
  v6[3] = &unk_1E65D4C08;
  id v7 = v3;
  id v5 = v3;
  [v4 runWithLockAcquired:v6];
}

void __53__PPMockRTRoutineManager_setMockLocationsOfInterest___block_invoke(uint64_t a1, uint64_t a2)
{
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v6 = (id)objc_opt_new();
    uint64_t v4 = [v3 initWithGuardedData:v6];
    id v5 = (void *)_mockLocationsOfInterest;
    _mockLocationsOfInterest = v4;
  }
}

@end