@interface _SPBucketSet
- (OS_dispatch_queue)queue;
- (_SPBucketSet)init;
- (int64_t)count;
- (int64_t)valueForKey:(id)a3;
- (void)addValue:(int64_t)a3 forKey:(id)a4;
- (void)dealloc;
- (void)decay:(int64_t)a3;
- (void)removeValueForKey:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setQueue:(id)a3;
@end

@implementation _SPBucketSet

- (void)addValue:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32___SPBucketSet_addValue_forKey___block_invoke;
  block[3] = &unk_2645067E0;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (void)decay:(int64_t)a3
{
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __22___SPBucketSet_decay___block_invoke;
  v5[3] = &unk_2645066B0;
  v5[4] = self;
  v5[5] = a3;
  v4 = _setup_block(v5, 0, 881);
  dispatch_async(queue, v4);
}

- (int64_t)valueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28___SPBucketSet_valueForKey___block_invoke;
  block[3] = &unk_2645067B8;
  id v10 = v4;
  int64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (_SPBucketSet)init
{
  v7.receiver = self;
  v7.super_class = (Class)_SPBucketSet;
  v2 = [(_SPBucketSet *)&v7 init];
  if (v2)
  {
    v2->_members = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], 0);
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.spotlight.index.buckets", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)dealloc
{
  members = self->_members;
  if (members) {
    CFRelease(members);
  }
  v4.receiver = self;
  v4.super_class = (Class)_SPBucketSet;
  [(_SPBucketSet *)&v4 dealloc];
}

- (void)removeValueForKey:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34___SPBucketSet_removeValueForKey___block_invoke;
  v7[3] = &unk_2645065E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
}

@end