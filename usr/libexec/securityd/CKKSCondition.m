@interface CKKSCondition
- (CKKSCondition)chain;
- (CKKSCondition)init;
- (OS_dispatch_semaphore)semaphore;
- (id)initToChain:(id)a3;
- (int64_t)wait:(unint64_t)a3;
- (void)fulfill;
- (void)setChain:(id)a3;
- (void)setSemaphore:(id)a3;
@end

@implementation CKKSCondition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chain, 0);

  objc_storeStrong((id *)&self->_semaphore, 0);
}

- (void)setChain:(id)a3
{
}

- (CKKSCondition)chain
{
  return (CKKSCondition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)wait:(unint64_t)a3
{
  v5 = [(CKKSCondition *)self semaphore];
  dispatch_time_t v6 = dispatch_time(0, a3);
  intptr_t v7 = dispatch_semaphore_wait(v5, v6);

  if (!v7)
  {
    v8 = [(CKKSCondition *)self semaphore];
    dispatch_semaphore_signal(v8);
  }
  return v7;
}

- (void)fulfill
{
  v3 = [(CKKSCondition *)self semaphore];
  dispatch_semaphore_signal(v3);

  v4 = [(CKKSCondition *)self chain];
  [v4 fulfill];

  [(CKKSCondition *)self setChain:0];
}

- (id)initToChain:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKKSCondition;
  dispatch_time_t v6 = [(CKKSCondition *)&v10 init];
  if (v6)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    semaphore = v6->_semaphore;
    v6->_semaphore = (OS_dispatch_semaphore *)v7;

    objc_storeStrong((id *)&v6->_chain, a3);
  }

  return v6;
}

- (CKKSCondition)init
{
  return (CKKSCondition *)[(CKKSCondition *)self initToChain:0];
}

@end