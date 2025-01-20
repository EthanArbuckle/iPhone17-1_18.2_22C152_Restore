@interface PFCoalescerActivityToken
- (NSArray)callStackReturnAddresses;
- (NSDate)creationDate;
- (NSString)reason;
- (OS_dispatch_group)group;
- (OS_dispatch_queue)isolationQueue;
- (PFCoalescerActivityToken)initWithDispatchGroup:(id)a3 reason:(id)a4;
- (id)description;
- (void)dealloc;
- (void)endActivity;
- (void)setCallStackReturnAddresses:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setGroup:(id)a3;
- (void)setIsolationQueue:(id)a3;
- (void)setReason:(id)a3;
@end

@implementation PFCoalescerActivityToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_callStackReturnAddresses, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCallStackReturnAddresses:(id)a3
{
}

- (NSArray)callStackReturnAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReason:(id)a3
{
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIsolationQueue:(id)a3
{
}

- (OS_dispatch_queue)isolationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGroup:(id)a3
{
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:self->_creationDate];
  uint64_t v5 = v4;

  v6 = NSString;
  reason = self->_reason;
  v8 = [(NSArray *)self->_callStackReturnAddresses componentsJoinedByString:@" "];
  v9 = [v6 stringWithFormat:@"<PFCoalescerActivityToken %p '%@' age: %.1fs (\n%@\n)>", self, reason, v5, v8];

  return v9;
}

- (void)endActivity
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PFCoalescerActivityToken_endActivity__block_invoke;
  block[3] = &unk_1E62ABFB0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

void __39__PFCoalescerActivityToken_endActivity__block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = 0;
  }
}

- (void)dealloc
{
  [(PFCoalescerActivityToken *)self endActivity];
  v3.receiver = self;
  v3.super_class = (Class)PFCoalescerActivityToken;
  [(PFCoalescerActivityToken *)&v3 dealloc];
}

- (PFCoalescerActivityToken)initWithDispatchGroup:(id)a3 reason:(id)a4
{
  v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PFCoalescerActivityToken;
  v9 = [(PFCoalescerActivityToken *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reason, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("activity token isolation", v11);
    isolationQueue = v10->_isolationQueue;
    v10->_isolationQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_group, a3);
    uint64_t v14 = [MEMORY[0x1E4F29060] callStackReturnAddresses];
    callStackReturnAddresses = v10->_callStackReturnAddresses;
    v10->_callStackReturnAddresses = (NSArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v16;

    dispatch_group_enter(v7);
  }

  return v10;
}

@end