@interface SFSiriWordTimingPlayer
- (NSArray)wordTimings;
- (NSString)text;
- (OS_dispatch_queue)dispatchQueue;
- (SFSiriWordTimingPlayer)init;
- (double)startTime;
- (id)wordHandler;
- (unsigned)flags;
- (void)_processNextWord;
- (void)_processWord;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setStartTime:(double)a3;
- (void)setText:(id)a3;
- (void)setWordHandler:(id)a3;
- (void)setWordTimings:(id)a3;
@end

@implementation SFSiriWordTimingPlayer

- (SFSiriWordTimingPlayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFSiriWordTimingPlayer;
  v2 = [(SFSiriWordTimingPlayer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SFSiriWordTimingPlayer_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__SFSiriWordTimingPlayer_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v2 = *(double **)(a1 + 32);
  if (v2[6] == 0.0)
  {
    *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 48) = CFAbsoluteTimeGetCurrent();
    v2 = *(double **)(a1 + 32);
  }

  return [v2 _processNextWord];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SFSiriWordTimingPlayer_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __36__SFSiriWordTimingPlayer_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = 0;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 64);
  if (v7)
  {
    v8 = NSErrorWithOSStatusF();
    (*(void (**)(uint64_t, void, void, uint64_t, void *))(v7 + 16))(v7, 0, 0, 4, v8);

    uint64_t v6 = *(void *)(a1 + 32);
    v9 = *(void **)(v6 + 64);
  }
  else
  {
    v9 = 0;
  }
  *(void *)(v6 + 64) = 0;
}

- (void)_processNextWord
{
  unint64_t wordIndex = self->_wordIndex;
  if (wordIndex >= [(NSArray *)self->_wordTimings count])
  {
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    timer = self->_timer;
    if (timer)
    {
      v11 = timer;
      dispatch_source_cancel(v11);
      v12 = self->_timer;
      self->_timer = 0;
    }
    id wordHandler = self->_wordHandler;
    if (wordHandler)
    {
      (*((void (**)(id, void, void, uint64_t, void))wordHandler + 2))(wordHandler, 0, 0, 4, 0);
      id wordHandler = self->_wordHandler;
    }
    self->_id wordHandler = 0;
  }
  else
  {
    wordTimings = self->_wordTimings;
    ++self->_wordIndex;
    -[NSArray objectAtIndexedSubscript:](wordTimings, "objectAtIndexedSubscript:");
    v5 = (SFSiriWordTimingInfo *)objc_claimAutoreleasedReturnValue();
    wordInfo = self->_wordInfo;
    self->_wordInfo = v5;

    [(SFSiriWordTimingInfo *)self->_wordInfo timeOffset];
    CFAbsoluteTimeGetCurrent();
    if (self->_timer)
    {
      CUDispatchTimerSet();
    }
    else
    {
      uint64_t v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      v8 = self->_timer;
      self->_timer = v7;

      v9 = self->_timer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __42__SFSiriWordTimingPlayer__processNextWord__block_invoke;
      handler[3] = &unk_1E5BBC870;
      handler[4] = self;
      dispatch_source_set_event_handler(v9, handler);
      CUDispatchTimerSet();
      dispatch_activate((dispatch_object_t)self->_timer);
    }
  }
}

uint64_t __42__SFSiriWordTimingPlayer__processNextWord__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processWord];
}

- (void)_processWord
{
  id v20 = [(SFSiriWordTimingInfo *)self->_wordInfo wordID];
  if (v20)
  {
    id wordHandler = self->_wordHandler;
    if (!wordHandler) {
      goto LABEL_18;
    }
    uint64_t v4 = [(SFSiriWordTimingInfo *)self->_wordInfo localizedText];
    v5 = (void (*)(void *, id, void *, void, void))wordHandler[2];
    uint64_t v6 = wordHandler;
    id v7 = v20;
    v8 = v4;
  }
  else
  {
    unint64_t v9 = [(SFSiriWordTimingInfo *)self->_wordInfo textRange];
    NSUInteger v11 = v10;
    NSUInteger v12 = [(NSString *)self->_text length];
    if (v12 < v9 || v12 - v9 < v11)
    {
      id v14 = self->_wordHandler;
      if (!v14) {
        goto LABEL_18;
      }
      unint64_t v18 = v9;
      NSUInteger v19 = v11;
      NSUInteger v17 = v12;
      uint64_t v4 = NSErrorWithOSStatusF();
      (*((void (**)(id, __CFString *, void, void, void *))v14 + 2))(v14, &stru_1EF9BDC68, 0, 0, v4);
      goto LABEL_17;
    }
    v15 = self->_wordHandler;
    if ((self->_flags & 8) != 0)
    {
      if (!v15) {
        goto LABEL_18;
      }
      uint64_t v16 = [(NSString *)self->_text substringToIndex:v9 + v11];
    }
    else
    {
      if (!v15) {
        goto LABEL_18;
      }
      uint64_t v16 = -[NSString substringWithRange:](self->_text, "substringWithRange:", v9, v11);
    }
    uint64_t v4 = (void *)v16;
    v5 = (void (*)(void *, id, void *, void, void))v15[2];
    uint64_t v6 = v15;
    id v7 = v4;
    v8 = 0;
  }
  v5(v6, v7, v8, 0, 0);
LABEL_17:

LABEL_18:
  [(SFSiriWordTimingPlayer *)self _processNextWord];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (id)wordHandler
{
  return self->_wordHandler;
}

- (void)setWordHandler:(id)a3
{
}

- (NSArray)wordTimings
{
  return self->_wordTimings;
}

- (void)setWordTimings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordTimings, 0);
  objc_storeStrong(&self->_wordHandler, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wordInfo, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end