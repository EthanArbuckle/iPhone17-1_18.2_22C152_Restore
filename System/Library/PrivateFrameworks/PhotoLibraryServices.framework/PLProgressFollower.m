@interface PLProgressFollower
- (NSProgress)outputProgress;
- (NSProgress)sourceProgress;
- (PLProgressFollower)initWithSourceProgress:(id)a3 progressHandler:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setOutputProgress:(id)a3;
@end

@implementation PLProgressFollower

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputProgress, 0);
  objc_storeStrong((id *)&self->_sourceProgress, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

- (void)setOutputProgress:(id)a3
{
}

- (NSProgress)outputProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 32, 1);
}

- (NSProgress)sourceProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 24, 1);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v11;
  os_unfair_lock_lock(&self->_lock);
  v14 = self->_outputProgress;
  v15 = (void (**)(void, void))MEMORY[0x19F38D650](self->_progressHandler);
  BOOL invalidated = self->_invalidated;
  os_unfair_lock_unlock(&self->_lock);
  if (a6 == @"PLProgressFollowerFractionCompletedContext")
  {
    if (!invalidated)
    {
      if (v15)
      {
        ((void (**)(void, id))v15)[2](v15, v13);
      }
      else
      {
        [v13 fractionCompleted];
        [(NSProgress *)v14 setCompletedUnitCount:(uint64_t)(v17 * (double)[(NSProgress *)v14 totalUnitCount])];
      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PLProgressFollower;
    [(PLProgressFollower *)&v18 observeValueForKeyPath:v10 ofObject:v13 change:v12 context:a6];
  }
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PLProgressFollower.m", 47, @"Invalid parameter not satisfying: %@", @"_invalidated" object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)PLProgressFollower;
  [(PLProgressFollower *)&v5 dealloc];
}

- (void)invalidate
{
}

uint64_t __32__PLProgressFollower_invalidate__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) removeObserver:*(void *)(a1 + 32) forKeyPath:@"fractionCompleted" context:@"PLProgressFollowerFractionCompletedContext"];
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  return result;
}

- (PLProgressFollower)initWithSourceProgress:(id)a3 progressHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLProgressFollower;
  v9 = [(PLProgressFollower *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_sourceProgress, a3);
    uint64_t v11 = MEMORY[0x19F38D650](v8);
    id progressHandler = v10->_progressHandler;
    v10->_id progressHandler = (id)v11;

    if (!v8)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v7, "totalUnitCount"));
      outputProgress = v10->_outputProgress;
      v10->_outputProgress = (NSProgress *)v13;

      -[NSProgress setCompletedUnitCount:](v10->_outputProgress, "setCompletedUnitCount:", [v7 completedUnitCount]);
    }
    [(NSProgress *)v10->_sourceProgress addObserver:v10 forKeyPath:@"fractionCompleted" options:1 context:@"PLProgressFollowerFractionCompletedContext"];
  }

  return v10;
}

@end