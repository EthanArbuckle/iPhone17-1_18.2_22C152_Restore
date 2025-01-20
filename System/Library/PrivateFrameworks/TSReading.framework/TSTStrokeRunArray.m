@interface TSTStrokeRunArray
- (TSTStrokeRunArray)initWithCount:(unsigned int)a3;
- (double)maxWidth;
- (id)description;
- (void)dealloc;
@end

@implementation TSTStrokeRunArray

- (TSTStrokeRunArray)initWithCount:(unsigned int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSTStrokeRunArray;
  v4 = [(TSTStrokeRunArray *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 <= 1) {
      size_t v6 = 1;
    }
    else {
      size_t v6 = a3;
    }
    v4->mCount = a3;
    v4->mAllocCount = v6;
    v4->mStrokes = (TSTStrokeRun *)malloc_type_calloc(0x20uLL, v6, 0x5F09CD24uLL);
    v5->mLastLookup = 0;
    v5->mMaxWidth = 0.0;
    v5->mHasCustomStrokes = 0;
    pthread_rwlock_init(&v5->mRWLock, 0);
  }
  return v5;
}

- (void)dealloc
{
  unsigned int mCount = self->mCount;
  if (mCount)
  {
    unsigned int v4 = mCount - 1;
    uint64_t v5 = mCount - 1;
    do
    {
      if (self->mCount <= v4) {
        size_t v6 = 0;
      }
      else {
        size_t v6 = &self->mStrokes[v5];
      }
      TSTStrokeRunSet(v6, 0, 0, 0, 0, 0);
      --v5;
      --v4;
    }
    while (v4 != -1);
  }
  mStrokes = self->mStrokes;
  if (mStrokes)
  {
    free(mStrokes);
    self->mStrokes = 0;
  }
  *(void *)&self->unsigned int mCount = 0;
  pthread_rwlock_destroy(&self->mRWLock);
  v8.receiver = self;
  v8.super_class = (Class)TSTStrokeRunArray;
  [(TSTStrokeRunArray *)&v8 dealloc];
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  unsigned int v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  if (self->mHasCustomStrokes) {
    size_t v6 = @"YES";
  }
  else {
    size_t v6 = @"NO";
  }
  v7 = (void *)[v3 stringWithFormat:@"<%@ %p count=%u hasCustomStrokes=%@ maxWidth=%f", v5, self, self->mCount, v6, *(void *)&self->mMaxWidth];
  objc_super v8 = v7;
  if (self->mStrokes)
  {
    [v7 appendString:@" strokeRuns={"];
    if (self->mCount)
    {
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      v11 = @"}>";
      do
      {
        v12 = &self->mStrokes[v9];
        uint64_t var0 = v12->var0;
        uint64_t var1 = v12->var1;
        uint64_t v15 = [v12->var2 description];
        if (*((unsigned char *)&self->mStrokes[v9] + 24)) {
          v16 = @"YES";
        }
        else {
          v16 = @"NO";
        }
        if ((*((unsigned char *)&self->mStrokes[v9] + 24) & 2) != 0) {
          v17 = @"YES";
        }
        else {
          v17 = @"NO";
        }
        [v8 appendFormat:@"\n  { start=%u -> stop=%u stroke=%@ valid=%@ custom=%@}", var0, var1, v15, v16, v17];
        ++v10;
        ++v9;
      }
      while (v10 < self->mCount);
    }
    else
    {
      v11 = @"}>";
    }
  }
  else
  {
    v11 = @" strokeRuns={empty}>";
  }
  [v8 appendString:v11];
  return v8;
}

- (double)maxWidth
{
  return self->mMaxWidth;
}

@end