@interface _UISceneEventResponder
- (_UISceneEventResponder)init;
- (void)_enqueueCommitResponse:(uint64_t)a3 forPhase:;
- (void)enqueuePostCommitResponse:(id)a3;
- (void)enqueuePostSynchronizeResponse:(id)a3;
@end

@implementation _UISceneEventResponder

- (void)enqueuePostSynchronizeResponse:(id)a3
{
}

- (void)_enqueueCommitResponse:(uint64_t)a3 forPhase:
{
  if (a1)
  {
    id v5 = a2;
    if (pthread_main_np() != 1)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:sel__enqueueCommitResponse_forPhase_ object:a1 file:@"_UISceneEventResponder.m" lineNumber:71 description:@"Call must be made on main thread"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
    v6 = [_UISceneEventResponse alloc];
    id v7 = v5;
    if (v6)
    {
      v28.receiver = v6;
      v28.super_class = (Class)_UISceneEventResponse;
      v8 = objc_msgSendSuper2(&v28, sel_init);
      v9 = v8;
      if (v8)
      {
        v10 = (void *)v8[1];
        v8[1] = 0;

        uint64_t v11 = [v7 copy];
        v12 = (void *)v9[2];
        v9[2] = v11;

        *((unsigned char *)v9 + 24) = 0;
      }
    }
    else
    {
      v9 = 0;
    }

    v14 = (id *)(a1 + 24);
    uint64_t v13 = *(void *)(a1 + 24);
    if (v13)
    {
      v15 = (id *)(v13 + 8);
    }
    else
    {
      if (*(void *)(a1 + 16))
      {
        v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:sel__enqueueCommitResponse_forPhase_ object:a1 file:@"_UISceneEventResponder.m" lineNumber:79 description:@"if there's no _last then there can't be a _first either"];
      }
      v15 = (id *)(a1 + 24);
      v14 = (id *)(a1 + 16);
    }
    objc_storeStrong(v15, v9);
    objc_storeStrong(v14, v9);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 12));
    [MEMORY[0x1E4F39CF8] activate];
    v16 = (void *)MEMORY[0x1E4F39CF8];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __58___UISceneEventResponder__enqueueCommitResponse_forPhase___block_invoke;
    v25 = &unk_1E52D9F98;
    uint64_t v26 = a1;
    v17 = v9;
    id v27 = v17;
    if (([v16 addCommitHandler:&v22 forPhase:a3] & 1) == 0)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v20 = [MEMORY[0x1E4F39CF8] currentPhase];
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__enqueueCommitResponse_forPhase_, a1, @"_UISceneEventResponder.m", 88, @"failed to register commit handler for phase = %i (current is %i)", a3, v20, v22, v23, v24, v25, v26);
    }
  }
}

- (_UISceneEventResponder)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UISceneEventResponder;
  v2 = [(_UISceneEventResponder *)&v7 init];
  v3 = v2;
  if (v2)
  {
    dataLock_first = v2->_dataLock_first;
    *(void *)&v2->_sendLock._os_unfair_lock_opaque = 0;
    v2->_dataLock_first = 0;

    dataLock_last = v3->_dataLock_last;
    v3->_dataLock_last = 0;
  }
  return v3;
}

- (void)enqueuePostCommitResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataLock_last, 0);
  objc_storeStrong((id *)&self->_dataLock_first, 0);
}

@end