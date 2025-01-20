@interface HKSPTask
- (BOOL)isCanceled;
- (HKSPTask)initWithBlock:(id)a3;
- (HKSPTask)initWithBlock:(id)a3 delay:(double)a4;
- (HKSPTask)initWithIdentifier:(id)a3 block:(id)a4;
- (HKSPTask)initWithIdentifier:(id)a3 block:(id)a4 delay:(double)a5;
- (NSString)identifier;
- (double)delay;
- (void)cancel;
- (void)execute;
@end

@implementation HKSPTask

- (NSString)identifier
{
  return self->_identifier;
}

- (double)delay
{
  return self->_delay;
}

- (BOOL)isCanceled
{
  return [(NACancelationToken *)self->_token isCanceled];
}

- (HKSPTask)initWithIdentifier:(id)a3 block:(id)a4 delay:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HKSPTask;
  v10 = [(HKSPTask *)&v21 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_delay = a5;
    v13 = (NACancelationToken *)objc_alloc_init(MEMORY[0x1E4F7A0B8]);
    token = v10->_token;
    v10->_token = v13;

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__HKSPTask_initWithIdentifier_block_delay___block_invoke;
    v19[3] = &unk_1E5D31AD0;
    id v20 = v9;
    uint64_t v15 = MEMORY[0x1AD0DD220](v19);
    id cancelableBlock = v10->_cancelableBlock;
    v10->_id cancelableBlock = (id)v15;

    v17 = v10;
  }

  return v10;
}

- (HKSPTask)initWithBlock:(id)a3 delay:(double)a4
{
  return [(HKSPTask *)self initWithIdentifier:0 block:a3 delay:a4];
}

uint64_t __43__HKSPTask_initWithIdentifier_block_delay___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCanceled];
  if ((result & 1) == 0)
  {
    v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  return result;
}

- (void)execute
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_cancelableBlock, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

- (HKSPTask)initWithBlock:(id)a3
{
  return [(HKSPTask *)self initWithIdentifier:0 block:a3];
}

- (HKSPTask)initWithIdentifier:(id)a3 block:(id)a4
{
  return [(HKSPTask *)self initWithIdentifier:a3 block:a4 delay:0.0];
}

- (void)cancel
{
}

@end