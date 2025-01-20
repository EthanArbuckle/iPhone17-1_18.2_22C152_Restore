@interface HKSPThrottler
- (HKSPThrottler)initWithInterval:(double)a3 executeBlock:(id)a4;
- (HKSPThrottler)initWithInterval:(double)a3 executeBlock:(id)a4 scheduler:(id)a5;
- (HKSPThrottler)initWithInterval:(double)a3 executeBlock:(id)a4 scheduler:(id)a5 mutexGenerator:(id)a6;
- (void)execute;
@end

@implementation HKSPThrottler

- (void)execute
{
}

- (HKSPThrottler)initWithInterval:(double)a3 executeBlock:(id)a4 scheduler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = &__block_literal_global_21;
  v11 = [(HKSPThrottler *)self initWithInterval:v9 executeBlock:v8 scheduler:&__block_literal_global_21 mutexGenerator:a3];

  return v11;
}

- (HKSPThrottler)initWithInterval:(double)a3 executeBlock:(id)a4 scheduler:(id)a5 mutexGenerator:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HKSPThrottler;
  v13 = [(HKSPThrottler *)&v22 init];
  if (v13)
  {
    v14 = [[HKSPLimitingScheduler alloc] initWithScheduler:v11 mutexGenerator:v12];
    backingScheduler = v13->_backingScheduler;
    v13->_backingScheduler = v14;

    v16 = [HKSPTask alloc];
    v17 = [(HKSPThrottler *)v13 description];
    uint64_t v18 = [(HKSPTask *)v16 initWithIdentifier:v17 block:v10 delay:a3];
    task = v13->_task;
    v13->_task = (HKSPTask *)v18;

    v20 = v13;
  }

  return v13;
}

- (HKSPThrottler)initWithInterval:(double)a3 executeBlock:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F7A0F0];
  id v7 = a4;
  id v8 = [v6 hkspMainThreadScheduler];
  id v9 = [(HKSPThrottler *)self initWithInterval:v7 executeBlock:v8 scheduler:a3];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingScheduler, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end