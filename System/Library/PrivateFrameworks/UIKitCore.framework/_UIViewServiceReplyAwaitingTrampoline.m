@interface _UIViewServiceReplyAwaitingTrampoline
- (void)forwardInvocation:(id)a3;
@end

@implementation _UIViewServiceReplyAwaitingTrampoline

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__232;
  v18 = __Block_byref_object_dispose__232;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __59___UIViewServiceReplyAwaitingTrampoline_forwardInvocation___block_invoke;
  v11 = &unk_1E530E2A0;
  v13 = &v14;
  v6 = v5;
  v12 = v6;
  [(_UIViewServiceReplyControlTrampoline *)self _forwardInvocation:v4 withIncomingReplyDispatchBlock:&v8];
  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  if (!dispatch_semaphore_wait(v6, v7)) {
    objc_msgSend((id)v15[5], "invoke", v8, v9, v10, v11);
  }

  _Block_object_dispose(&v14, 8);
}

@end