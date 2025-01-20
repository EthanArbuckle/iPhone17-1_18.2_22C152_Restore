@interface RPFileTransferResumeState
- (BOOL)addActiveFile:(id)a3;
- (BOOL)addFinishedFile:(id)a3;
- (BOOL)flushStateFile;
- (BOOL)isEmpty;
- (BOOL)isPlaceholder;
- (BOOL)loadStateFile;
- (BOOL)needsFlushing;
- (BOOL)removeActiveFile:(id)a3;
- (BOOL)removeAllActiveAndFinishedFileItems;
- (BOOL)removeFinishedFile:(id)a3;
- (BOOL)removeStateFile;
- (BOOL)removeUnusableOutputFileItems;
- (BOOL)removeUnusableSourceFileItems;
- (BOOL)scheduleStateFileFlush;
- (LogCategory)ucat;
- (NSString)outputPath;
- (NSString)stateFilePath;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)flushTimer;
- (RPFileTransferResumeState)init;
- (RPFileTransferResumeState)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (RPFileTransferResumeState)initWithDispatchQueue:(id)a3;
- (double)flushInterval;
- (id)activeFileWithFileName:(id)a3;
- (id)activeFiles;
- (id)dictionaryRepresentation;
- (id)finishedFileWithFileName:(id)a3;
- (id)finishedFiles;
- (id)version;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setFlushInterval:(double)a3;
- (void)setFlushTimer:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setNeedsFlushing:(BOOL)a3;
- (void)setOutputPath:(id)a3;
- (void)setStateFilePath:(id)a3;
- (void)setUcat:(LogCategory *)a3;
@end

@implementation RPFileTransferResumeState

- (RPFileTransferResumeState)init
{
  v11.receiver = self;
  v11.super_class = (Class)RPFileTransferResumeState;
  v2 = [(RPFileTransferResumeState *)&v11 init];
  v3 = v2;
  if (v2)
  {
    [(RPFileTransferResumeState *)v2 setIsPlaceholder:0];
    [(RPFileTransferResumeState *)v3 setDispatchQueue:0];
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)v4 setObject:@"1.0" forKey:@"version"];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)v4 setObject:v5 forKey:@"fileInfo"];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v5 setObject:v6 forKey:@"activeFiles"];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v5 setObject:v7 forKey:@"finishedFiles"];
    stateInfo = v3->_stateInfo;
    v3->_stateInfo = v4;

    v9 = v3;
  }

  return v3;
}

- (RPFileTransferResumeState)initWithDispatchQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(RPFileTransferResumeState *)self init];
  id v6 = v5;
  if (v5)
  {
    [(RPFileTransferResumeState *)v5 setDispatchQueue:v4];
    id v7 = v6;
  }

  return v6;
}

- (RPFileTransferResumeState)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RPFileTransferResumeState;
  id v7 = [(RPFileTransferResumeState *)&v18 init];
  v8 = v7;
  if (!v7)
  {
    v16 = 0;
    goto LABEL_9;
  }
  [(RPFileTransferResumeState *)v7 setIsPlaceholder:0];
  [(RPFileTransferResumeState *)v8 setDispatchQueue:0];
  v9 = [v6 objectForKey:@"version"];
  v10 = [v6 objectForKey:@"fileInfo"];
  objc_super v11 = [v10 objectForKey:@"activeFiles"];
  uint64_t v12 = [v10 objectForKey:@"finishedFiles"];
  v13 = (void *)v12;
  if (!v9)
  {
    if (a4) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (!v10)
  {
    if (a4) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (!v11)
  {
    if (a4) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (!v12)
  {
    if (a4)
    {
LABEL_17:
      RPErrorF();
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_18:
    v16 = 0;
    goto LABEL_7;
  }
  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v6];
  stateInfo = v8->_stateInfo;
  v8->_stateInfo = (NSMutableDictionary *)v14;

  v16 = v8;
LABEL_7:

LABEL_9:
  return v16;
}

- (void)dealloc
{
  [(RPFileTransferResumeState *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)RPFileTransferResumeState;
  [(RPFileTransferResumeState *)&v3 dealloc];
}

- (void)invalidate
{
  if ([(RPFileTransferResumeState *)self needsFlushing]) {
    [(RPFileTransferResumeState *)self flushStateFile];
  }
  objc_super v3 = [(RPFileTransferResumeState *)self flushTimer];

  if (v3)
  {
    id v4 = [(RPFileTransferResumeState *)self flushTimer];
    dispatch_source_cancel(v4);

    [(RPFileTransferResumeState *)self setFlushTimer:0];
  }
  [(RPFileTransferResumeState *)self setDispatchQueue:0];
  stateInfo = self->_stateInfo;
  self->_stateInfo = 0;
}

- (id)version
{
  return (id)[(NSMutableDictionary *)self->_stateInfo objectForKey:@"version"];
}

- (id)dictionaryRepresentation
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_stateInfo];
}

- (BOOL)isEmpty
{
  objc_super v3 = [(RPFileTransferResumeState *)self activeFiles];
  id v4 = [(RPFileTransferResumeState *)self finishedFiles];
  BOOL v5 = ![v3 count] && !objc_msgSend(v4, "count");

  return v5;
}

- (id)activeFiles
{
  v2 = [(NSMutableDictionary *)self->_stateInfo objectForKey:@"fileInfo"];
  objc_super v3 = [v2 objectForKey:@"activeFiles"];

  return v3;
}

- (id)finishedFiles
{
  v2 = [(NSMutableDictionary *)self->_stateInfo objectForKey:@"fileInfo"];
  objc_super v3 = [v2 objectForKey:@"finishedFiles"];

  return v3;
}

- (id)activeFileWithFileName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RPFileTransferResumeState *)self activeFiles];
  id v6 = [v5 objectForKey:v4];

  if (v6) {
    id v7 = [[RPFileTransferResumeStateItem alloc] initWithStateDict:v6];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)addActiveFile:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RPFileTransferResumeState *)self activeFiles];
  id v6 = [v4 fileName];
  id v7 = [v5 objectForKey:v6];
  v8 = [v4 fileInfo];

  if (v6 && v8) {
    [v5 setValue:v8 forKey:v6];
  }

  return v7 == 0;
}

- (BOOL)removeActiveFile:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RPFileTransferResumeState *)self activeFiles];
  id v6 = [v4 fileName];

  id v7 = [v5 objectForKey:v6];
  if (v7) {
    [v5 setValue:0 forKey:v6];
  }

  return v7 != 0;
}

- (id)finishedFileWithFileName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RPFileTransferResumeState *)self finishedFiles];
  id v6 = [v5 objectForKey:v4];

  if (v6) {
    id v7 = [[RPFileTransferResumeStateItem alloc] initWithStateDict:v6];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)addFinishedFile:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RPFileTransferResumeState *)self finishedFiles];
  id v6 = [v4 fileName];
  id v7 = [v5 objectForKey:v6];
  v8 = [v4 fileInfo];

  [v8 setValue:0 forKey:@"fileOffset"];
  [v8 setValue:0 forKey:@"bytesWritten"];
  [v5 setValue:v8 forKey:v6];

  return v7 == 0;
}

- (BOOL)removeFinishedFile:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RPFileTransferResumeState *)self finishedFiles];
  id v6 = [v4 fileName];

  id v7 = [v5 objectForKey:v6];
  if (v7) {
    [v5 setValue:0 forKey:v6];
  }

  return v7 != 0;
}

- (BOOL)scheduleStateFileFlush
{
  BOOL v3 = [(RPFileTransferResumeState *)self needsFlushing];
  [(RPFileTransferResumeState *)self setNeedsFlushing:1];
  id v4 = [(RPFileTransferResumeState *)self flushTimer];

  if (!v4)
  {
    BOOL v5 = [(RPFileTransferResumeState *)self dispatchQueue];
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v5);
    [(RPFileTransferResumeState *)self setFlushTimer:v6];

    id v7 = [(RPFileTransferResumeState *)self flushTimer];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __51__RPFileTransferResumeState_scheduleStateFileFlush__block_invoke;
    handler[3] = &unk_1E605B540;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);

    v8 = [(RPFileTransferResumeState *)self flushTimer];
    [(RPFileTransferResumeState *)self flushInterval];
    [(RPFileTransferResumeState *)self flushInterval];
    CUDispatchTimerSet();

    v9 = [(RPFileTransferResumeState *)self flushTimer];
    dispatch_activate(v9);
  }
  return !v3;
}

uint64_t __51__RPFileTransferResumeState_scheduleStateFileFlush__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) needsFlushing];
  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 flushStateFile];
  }
  else
  {
    BOOL v5 = [v3 flushTimer];
    dispatch_source_cancel(v5);

    dispatch_source_t v6 = *(void **)(a1 + 32);
    return [v6 setFlushTimer:0];
  }
}

- (BOOL)flushStateFile
{
  BOOL v3 = [(RPFileTransferResumeState *)self needsFlushing];
  if (v3)
  {
    id v4 = [(RPFileTransferResumeState *)self dictionaryRepresentation];
    BOOL v5 = [(RPFileTransferResumeState *)self stateFilePath];
    char v6 = [v4 writeToFile:v5 atomically:1];

    [(RPFileTransferResumeState *)self setNeedsFlushing:0];
    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)loadStateFile
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [(RPFileTransferResumeState *)self stateFilePath];
  BOOL v5 = [v3 fileURLWithPath:v4];

  char v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = [v5 path];
  int v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    id v17 = 0;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v5 error:&v17];
    id v10 = v17;
    if (v9)
    {
      objc_super v11 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v9];
      stateInfo = self->_stateInfo;
      self->_stateInfo = v11;

      if ([(RPFileTransferResumeState *)self removeUnusableOutputFileItems]) {
        [(RPFileTransferResumeState *)self scheduleStateFileFlush];
      }
    }
    else if (*(int *)[(RPFileTransferResumeState *)self ucat] <= 30 {
           && (*(_DWORD *)[(RPFileTransferResumeState *)self ucat] != -1
    }
            || ([(RPFileTransferResumeState *)self ucat], _LogCategory_Initialize())))
    {
      [(RPFileTransferResumeState *)self ucat];
      v15 = [v5 path];
      LogPrintF();

      [(RPFileTransferResumeState *)self removeAllActiveAndFinishedFileItems];
    }
    else
    {
      [(RPFileTransferResumeState *)self removeAllActiveAndFinishedFileItems];
    }
  }
  return 0;
}

- (BOOL)removeStateFile
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [(RPFileTransferResumeState *)self stateFilePath];
  BOOL v5 = [v3 fileURLWithPath:v4];

  char v6 = [(RPFileTransferResumeState *)self flushTimer];

  if (v6)
  {
    id v7 = [(RPFileTransferResumeState *)self flushTimer];
    dispatch_source_cancel(v7);

    [(RPFileTransferResumeState *)self setFlushTimer:0];
  }
  int v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  v9 = [v5 path];
  int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    objc_super v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v16 = 0;
    char v12 = [v11 removeItemAtURL:v5 error:&v16];
    id v13 = v16;

    if ((v12 & 1) == 0 && *(int *)[(RPFileTransferResumeState *)self ucat] <= 30)
    {
      if (*(_DWORD *)[(RPFileTransferResumeState *)self ucat] != -1
        || ([(RPFileTransferResumeState *)self ucat], _LogCategory_Initialize()))
      {
        [(RPFileTransferResumeState *)self ucat];
        v15 = [v5 path];
        LogPrintF();
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)removeUnusableSourceFileItems
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = [(RPFileTransferResumeState *)self activeFiles];
  BOOL v3 = (void *)[v2 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        int v10 = [v4 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        objc_super v11 = [[RPFileTransferResumeStateItem alloc] initWithStateDict:v10];
        char v12 = [(RPFileTransferResumeStateItem *)v11 itemURL];
        id v13 = [v12 path];

        if (v13 && ![(RPFileTransferResumeStateItem *)v11 sourceFileItemUsable:v13])
        {
          [(RPFileTransferResumeState *)self removeActiveFile:v11];
          char v7 = 1;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)removeUnusableOutputFileItems
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(RPFileTransferResumeState *)self activeFiles];
  id v4 = (void *)[v3 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v15 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = [v5 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        objc_super v11 = [[RPFileTransferResumeStateItem alloc] initWithStateDict:v10];
        char v12 = [(RPFileTransferResumeState *)self outputPath];
        BOOL v13 = [(RPFileTransferResumeStateItem *)v11 outputFileItemUsable:v12];

        if (!v13)
        {
          [(RPFileTransferResumeState *)self removeActiveFile:v11];
          char v15 = 1;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    char v15 = 0;
  }

  return v15 & 1;
}

- (BOOL)removeAllActiveAndFinishedFileItems
{
  int v2 = [(NSMutableDictionary *)self->_stateInfo objectForKey:@"fileInfo"];
  BOOL v3 = [v2 objectForKey:@"activeFiles"];
  uint64_t v4 = [v3 count];
  BOOL v5 = v4 != 0;
  if (v4) {
    [v3 removeAllObjects];
  }
  uint64_t v6 = [v2 objectForKey:@"finishedFiles"];
  if ([v6 count])
  {
    [v6 removeAllObjects];
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (LogCategory)ucat
{
  return self->_ucat;
}

- (void)setUcat:(LogCategory *)a3
{
  self->_ucat = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)outputPath
{
  return self->_outputPath;
}

- (void)setOutputPath:(id)a3
{
}

- (NSString)stateFilePath
{
  return self->_stateFilePath;
}

- (void)setStateFilePath:(id)a3
{
}

- (OS_dispatch_source)flushTimer
{
  return self->_flushTimer;
}

- (void)setFlushTimer:(id)a3
{
}

- (double)flushInterval
{
  return self->_flushInterval;
}

- (void)setFlushInterval:(double)a3
{
  self->_flushInterval = a3;
}

- (BOOL)needsFlushing
{
  return self->_needsFlushing;
}

- (void)setNeedsFlushing:(BOOL)a3
{
  self->_needsFlushing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushTimer, 0);
  objc_storeStrong((id *)&self->_stateFilePath, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_stateInfo, 0);
}

@end