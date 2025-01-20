@interface AMSBagValue(MTAdditions)
- (id)asyncValuePromise;
- (id)asyncValuePromiseOnQueue:()MTAdditions;
- (uint64_t)unsafeSnapshotSyncValue;
- (void)asyncValueOnQueue:()MTAdditions withCompletion:;
- (void)asyncValueWithCompletion:()MTAdditions;
@end

@implementation AMSBagValue(MTAdditions)

- (uint64_t)unsafeSnapshotSyncValue
{
  return [a1 valueWithError:0];
}

- (void)asyncValueWithCompletion:()MTAdditions
{
  dispatch_get_global_queue(0, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [a1 asyncValueOnQueue:v5 withCompletion:a3];
}

- (void)asyncValueOnQueue:()MTAdditions withCompletion:
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__AMSBagValue_MTAdditions__asyncValueOnQueue_withCompletion___block_invoke;
  v8[3] = &unk_1E5E61408;
  v8[4] = a1;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(a3, v8);
}

- (id)asyncValuePromise
{
  v2 = dispatch_get_global_queue(0, 0);
  v3 = [a1 asyncValuePromiseOnQueue:v2];

  return v3;
}

- (id)asyncValuePromiseOnQueue:()MTAdditions
{
  v4 = (objc_class *)MEMORY[0x1E4F4DDD0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__AMSBagValue_MTAdditions__asyncValuePromiseOnQueue___block_invoke;
  v11[3] = &unk_1E5E615A8;
  v11[4] = a1;
  id v7 = v6;
  id v12 = v7;
  dispatch_async(v5, v11);

  v8 = v12;
  id v9 = v7;

  return v9;
}

@end