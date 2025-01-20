@interface VisionCoreE5RTExecutionContextConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)prewireInUseAllocations;
- (OS_dispatch_queue)completionQueue;
- (VisionCoreE5RTExecutionPrewarmedState)prewarmedState;
- (VisionCoreNamedObjects)boundInputObjects;
- (VisionCoreNamedObjects)boundOutputObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBoundInputObjects:(id)a3;
- (void)setBoundOutputObjects:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setPrewarmedState:(id)a3;
- (void)setPrewireInUseAllocations:(BOOL)a3;
@end

@implementation VisionCoreE5RTExecutionContextConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmedState, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_boundOutputObjects, 0);
  objc_storeStrong((id *)&self->_boundInputObjects, 0);
}

- (void)setPrewarmedState:(id)a3
{
}

- (VisionCoreE5RTExecutionPrewarmedState)prewarmedState
{
  return self->_prewarmedState;
}

- (void)setCompletionQueue:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setPrewireInUseAllocations:(BOOL)a3
{
  self->_prewireInUseAllocations = a3;
}

- (BOOL)prewireInUseAllocations
{
  return self->_prewireInUseAllocations;
}

- (void)setBoundOutputObjects:(id)a3
{
}

- (VisionCoreNamedObjects)boundOutputObjects
{
  return self->_boundOutputObjects;
}

- (void)setBoundInputObjects:(id)a3
{
}

- (VisionCoreNamedObjects)boundInputObjects
{
  return self->_boundInputObjects;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    uint64_t v5 = [(VisionCoreNamedObjects *)self->_boundInputObjects copy];
    v6 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v5;

    uint64_t v7 = [(VisionCoreNamedObjects *)self->_boundOutputObjects copy];
    v8 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v7;

    *((unsigned char *)v4 + 32) = self->_prewireInUseAllocations;
    objc_storeStrong((id *)v4 + 3, self->_completionQueue);
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VisionCoreE5RTExecutionContextConfiguration *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v6 = [(VisionCoreE5RTExecutionContextConfiguration *)self boundInputObjects];
      uint64_t v7 = [(VisionCoreE5RTExecutionContextConfiguration *)v5 boundInputObjects];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        int v9 = [v6 isEqual:v7];

        if (!v9) {
          goto LABEL_14;
        }
      }
      v11 = [(VisionCoreE5RTExecutionContextConfiguration *)self boundOutputObjects];
      uint64_t v12 = [(VisionCoreE5RTExecutionContextConfiguration *)v5 boundOutputObjects];
      if (v11 == (void *)v12)
      {
      }
      else
      {
        v13 = (void *)v12;
        int v14 = [v11 isEqual:v12];

        if (!v14) {
          goto LABEL_14;
        }
      }
      BOOL v15 = [(VisionCoreE5RTExecutionContextConfiguration *)self prewireInUseAllocations];
      if (v15 == [(VisionCoreE5RTExecutionContextConfiguration *)v5 prewireInUseAllocations])
      {
        v16 = [(VisionCoreE5RTExecutionContextConfiguration *)self completionQueue];
        v17 = [(VisionCoreE5RTExecutionContextConfiguration *)v5 completionQueue];
        BOOL v10 = v16 == v17;

        goto LABEL_16;
      }
LABEL_14:
      BOOL v10 = 0;
LABEL_16:

      goto LABEL_17;
    }
    BOOL v10 = 0;
  }
LABEL_17:

  return v10;
}

@end