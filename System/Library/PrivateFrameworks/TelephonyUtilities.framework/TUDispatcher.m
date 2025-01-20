@interface TUDispatcher
+ (id)dispatcherWithIdentifier:(id)a3;
+ (id)dispatcherWithQueue:(id)a3;
- (OS_dispatch_queue)dispatchQueue;
- (TUDispatcher)init;
- (TUDispatcher)initWithIdentifier:(id)a3;
- (TUDispatcher)initWithQueue:(id)a3;
- (id)qosUserInteractiveDispatchBlockForBlock:(id)a3;
- (void)boostQualityOfService;
- (void)dispatchAsynchronousBlock:(id)a3;
- (void)dispatchSynchronousBlock:(id)a3;
@end

@implementation TUDispatcher

- (void)dispatchSynchronousBlock:(id)a3
{
  id v4 = a3;
  v5 = [(TUDispatcher *)self dispatchQueue];
  dispatch_sync(v5, v4);
}

- (void)dispatchAsynchronousBlock:(id)a3
{
  id v4 = a3;
  v5 = [(TUDispatcher *)self dispatchQueue];
  dispatch_async(v5, v4);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

+ (id)dispatcherWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:v3];

  return v4;
}

- (TUDispatcher)initWithIdentifier:(id)a3
{
  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v6 = dispatch_queue_create((const char *)[a3 UTF8String], v5);
  v7 = [(TUDispatcher *)self initWithQueue:v6];

  return v7;
}

- (TUDispatcher)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUDispatcher;
  dispatch_queue_t v6 = [(TUDispatcher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
  }

  return v7;
}

+ (id)dispatcherWithQueue:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithQueue:v3];

  return v4;
}

- (TUDispatcher)init
{
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is not available for use. To create an object instance use the designated initializer.", "-[TUDispatcher init]");
  NSLog(&cfstr_TuassertionFai.isa, v4);

  if (_TUAssertShouldCrashApplication())
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUDispatcher.m", 49, @"%s is not available for use. To create an object instance use the designated initializer.", "-[TUDispatcher init]");
  }
  return 0;
}

- (void)boostQualityOfService
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__TUDispatcher_boostQualityOfService__block_invoke;
  aBlock[3] = &unk_1E58E5BE0;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  id v4 = [(TUDispatcher *)self dispatchQueue];
  id v5 = [(TUDispatcher *)self qosUserInteractiveDispatchBlockForBlock:v3];
  dispatch_async(v4, v5);
}

void __37__TUDispatcher_boostQualityOfService__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__TUDispatcher_boostQualityOfService__block_invoke_2;
  block[3] = &unk_1E58E5BE0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __37__TUDispatcher_boostQualityOfService__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"TUDispatcherDidFinishBoostQualityOfServiceNotification" object:*(void *)(a1 + 32)];
}

- (id)qosUserInteractiveDispatchBlockForBlock:(id)a3
{
  dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, a3);

  return v3;
}

- (void).cxx_destruct
{
}

@end