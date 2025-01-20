@interface HKSPAccumulator
- (HKSPAccumulator)initWithInterval:(double)a3 updateBlock:(id)a4;
- (HKSPAccumulator)initWithInterval:(double)a3 updateBlock:(id)a4 scheduler:(id)a5;
- (HKSPAccumulator)initWithInterval:(double)a3 updateBlock:(id)a4 scheduler:(id)a5 mutexGenerator:(id)a6;
- (void)accumulateValue:(id)a3;
- (void)accumulateValues:(id)a3;
@end

@implementation HKSPAccumulator

- (HKSPAccumulator)initWithInterval:(double)a3 updateBlock:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F7A0F0];
  id v7 = a4;
  v8 = [v6 hkspMainThreadScheduler];
  v9 = [(HKSPAccumulator *)self initWithInterval:v7 updateBlock:v8 scheduler:a3];

  return v9;
}

- (HKSPAccumulator)initWithInterval:(double)a3 updateBlock:(id)a4 scheduler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = &__block_literal_global_21;
  v11 = [(HKSPAccumulator *)self initWithInterval:v9 updateBlock:v8 scheduler:&__block_literal_global_21 mutexGenerator:a3];

  return v11;
}

- (HKSPAccumulator)initWithInterval:(double)a3 updateBlock:(id)a4 scheduler:(id)a5 mutexGenerator:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HKSPAccumulator;
  v13 = [(HKSPAccumulator *)&v26 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_scheduler, a5);
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    accumulatedValues = v14->_accumulatedValues;
    v14->_accumulatedValues = v15;

    v17 = [HKSPThrottler alloc];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73__HKSPAccumulator_initWithInterval_updateBlock_scheduler_mutexGenerator___block_invoke;
    v23[3] = &unk_1E5D31A80;
    id v25 = v10;
    v18 = v14;
    v24 = v18;
    uint64_t v19 = [(HKSPThrottler *)v17 initWithInterval:v23 executeBlock:v11 scheduler:v12 mutexGenerator:a3];
    throttler = v18->_throttler;
    v18->_throttler = (HKSPThrottler *)v19;

    v21 = v18;
  }

  return v14;
}

uint64_t __73__HKSPAccumulator_initWithInterval_updateBlock_scheduler_mutexGenerator___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v2 removeAllObjects];
}

- (void)accumulateValue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:&v7 count:1];

    -[HKSPAccumulator accumulateValues:](self, "accumulateValues:", v6, v7, v8);
  }
}

- (void)accumulateValues:(id)a3
{
  id v4 = a3;
  scheduler = self->_scheduler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__HKSPAccumulator_accumulateValues___block_invoke;
  v7[3] = &unk_1E5D31AA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NAScheduler *)scheduler performBlock:v7];
}

uint64_t __36__HKSPAccumulator_accumulateValues___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) addObjectsFromArray:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 execute];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedValues, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_throttler, 0);
}

@end