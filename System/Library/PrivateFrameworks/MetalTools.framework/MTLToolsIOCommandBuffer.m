@interface MTLToolsIOCommandBuffer
- (BOOL)isCommitted;
- (MTLToolsIOCommandBuffer)initWithBaseObject:(id)a3 parent:(id)a4;
- (NSError)error;
- (NSString)label;
- (id).cxx_construct;
- (int64_t)status;
- (unint64_t)globalTraceObjectID;
- (void)addBarrier;
- (void)addCompletedHandler:(id)a3;
- (void)barrier;
- (void)commit;
- (void)copyStatusToBuffer:(id)a3 offset:(unint64_t)a4;
- (void)dealloc;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4;
- (void)enqueue;
- (void)invokeCompletedHandlers;
- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 handle:(id)a6 handleOffset:(unint64_t)a7;
- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7;
- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6;
- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 dstOrigin:(id *)a9 handle:(id)a10 handleOffset:(unint64_t)a11;
- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11;
- (void)popDebugGroup;
- (void)preCommit;
- (void)pushDebugGroup:(id)a3;
- (void)setLabel:(id)a3;
- (void)signalEvent:(id)a3 value:(unint64_t)a4;
- (void)tryCancel;
- (void)waitForEvent:(id)a3 value:(unint64_t)a4;
- (void)waitUntilCompleted;
@end

@implementation MTLToolsIOCommandBuffer

- (NSString)label
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 label];
}

- (void)setLabel:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setLabel:a3];
}

- (NSError)error
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSError *)[v2 error];
}

- (void)pushDebugGroup:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 pushDebugGroup:a3];
}

- (void)popDebugGroup
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 popDebugGroup];
}

- (MTLToolsIOCommandBuffer)initWithBaseObject:(id)a3 parent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLToolsIOCommandBuffer;
  result = [(MTLToolsObject *)&v5 initWithBaseObject:a3 parent:a4];
  if (result) {
    *((_DWORD *)result + 9) = 0;
  }
  return result;
}

- (void)dealloc
{
  if (!*((unsigned char *)self + 64)) {
    [(MTLToolsIOCommandBuffer *)self invokeCompletedHandlers];
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsIOCommandBuffer;
  [(MTLToolsObject *)&v3 dealloc];
}

- (BOOL)isCommitted
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isCommitted];
}

- (void)addCompletedHandler:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addCompletedHandler:", &__block_literal_global_4);
  objc_super v5 = _Block_copy(a3);
  v6 = (os_unfair_lock_s *)((char *)self + 36);
  os_unfair_lock_lock((os_unfair_lock_t)self + 9);
  v7 = (void **)((char *)self + 40);
  v8 = v7[1];
  unint64_t v9 = (unint64_t)v7[2];
  if ((unint64_t)v8 >= v9)
  {
    uint64_t v11 = ((char *)v8 - (unsigned char *)*v7) >> 3;
    if ((unint64_t)(v11 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v9 - (void)*v7;
    uint64_t v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v7 + 2), v14);
    }
    else {
      v15 = 0;
    }
    v16 = &v15[8 * v11];
    v17 = &v15[8 * v14];
    *(void *)v16 = v5;
    v10 = v16 + 8;
    v19 = (char *)*v7;
    v18 = (char *)v7[1];
    if (v18 != *v7)
    {
      do
      {
        uint64_t v20 = *((void *)v18 - 1);
        v18 -= 8;
        *((void *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      v18 = (char *)*v7;
    }
    *v7 = v16;
    v7[1] = v10;
    v7[2] = v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    void *v8 = v5;
    v10 = v8 + 1;
  }
  v7[1] = v10;

  os_unfair_lock_unlock(v6);
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 encodeWaitForEvent:v7 value:a4];
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 encodeSignalEvent:v7 value:a4];
}

- (void)waitForEvent:(id)a3 value:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 encodeWaitForEvent:v7 value:a4];
}

- (void)signalEvent:(id)a3 value:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 encodeSignalEvent:v7 value:a4];
}

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 handle:(id)a6 handleOffset:(unint64_t)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  uint64_t v14 = [a6 baseObject];

  [v12 loadBuffer:v13 offset:a4 size:a5 sourceHandle:v14 sourceHandleOffset:a7];
}

- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];

  [v10 loadBytes:a3 size:a4 sourceHandle:a5 sourceHandleOffset:a6];
}

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  uint64_t v14 = [a6 baseObject];

  [v12 loadBuffer:v13 offset:a4 size:a5 sourceHandle:v14 sourceHandleOffset:a7];
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11
{
  id v17 = [(MTLToolsObject *)self baseObject];
  uint64_t v18 = [a3 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v19 = *a9;
  objc_msgSend(v17, "loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:", v18, a4, a5, &v20, a7, a8, &v19, objc_msgSend(a10, "baseObject"), a11);
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 dstOrigin:(id *)a9 handle:(id)a10 handleOffset:(unint64_t)a11
{
  id v17 = [(MTLToolsObject *)self baseObject];
  uint64_t v18 = [a3 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v19 = *a9;
  objc_msgSend(v17, "loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:", v18, a4, a5, &v20, a7, a8, &v19, objc_msgSend(a10, "baseObject"), a11);
}

- (void)copyStatusToBuffer:(id)a3 offset:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 copyStatusToBuffer:v7 offset:a4];
}

- (void)commit
{
  [(MTLToolsIOCommandBuffer *)self preCommit];
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 commit];
}

- (void)waitUntilCompleted
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 waitUntilCompleted];
}

- (void)tryCancel
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 tryCancel];
}

- (void)barrier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 addBarrier];
}

- (void)addBarrier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 addBarrier];
}

- (void)enqueue
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 enqueue];
}

- (int64_t)status
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 status];
}

- (unint64_t)globalTraceObjectID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 globalTraceObjectID];
}

- (void)invokeCompletedHandlers
{
  *((unsigned char *)self + 64) = 1;
  id v3 = (os_unfair_lock_s *)((char *)self + 36);
  os_unfair_lock_lock((os_unfair_lock_t)self + 9);
  id v4 = (void (***)(void, void))*((void *)self + 5);
  objc_super v5 = (void (***)(void, void))*((void *)self + 6);
  if (v4 != v5)
  {
    do
    {
      id v6 = *v4++;
      ((void (**)(void, MTLToolsIOCommandBuffer *))v6)[2](v6, self);
      _Block_release(v6);
    }
    while (v4 != v5);
    id v4 = (void (***)(void, void))*((void *)self + 5);
  }
  *((void *)self + 6) = v4;

  os_unfair_lock_unlock(v3);
}

- (void)preCommit
{
  id v2 = (void *)*((void *)self + 2);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__MTLToolsIOCommandBuffer_preCommit__block_invoke;
  v3[3] = &unk_264E142B8;
  v3[4] = self;
  [v2 addCompletedHandler:v3];
}

uint64_t __36__MTLToolsIOCommandBuffer_preCommit__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeCompletedHandlers];
}

- (void).cxx_destruct
{
  id v2 = (char *)self + 40;
  id v3 = (void *)*((void *)self + 5);
  if (v3)
  {
    *((void *)v2 + 1) = v3;
    operator delete(v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end