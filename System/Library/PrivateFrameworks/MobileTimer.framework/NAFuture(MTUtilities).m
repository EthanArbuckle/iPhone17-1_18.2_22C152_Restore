@interface NAFuture(MTUtilities)
- (id)mtFinishWithFuture:()MTUtilities;
- (id)mtSynchronousResult:()MTUtilities;
@end

@implementation NAFuture(MTUtilities)

- (id)mtFinishWithFuture:()MTUtilities
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__NAFuture_MTUtilities__mtFinishWithFuture___block_invoke;
  v4[3] = &unk_1E5916BB0;
  v4[4] = a1;
  return (id)[a3 addCompletionBlock:v4];
}

- (id)mtSynchronousResult:()MTUtilities
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  id v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__NAFuture_MTUtilities__mtSynchronousResult___block_invoke;
  v10[3] = &unk_1E5916E18;
  v12 = &v14;
  uint64_t v13 = a3;
  v6 = v5;
  v11 = v6;
  id v7 = (id)[a1 addCompletionBlock:v10];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

@end