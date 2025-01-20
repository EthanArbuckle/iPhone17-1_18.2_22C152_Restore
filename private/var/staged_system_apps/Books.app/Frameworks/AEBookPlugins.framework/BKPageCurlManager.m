@interface BKPageCurlManager
- (BKPageCurlConfiguration)pageCurlConfiguration;
- (BKPageCurlManager)init;
- (BKPageCurlManager)initWithContext:(id)a3;
- (BKPageCurlManagerDelegate)delegate;
- (BOOL)killACurl:(BOOL)a3;
- (IMFrameEnvironment)configurationContext;
- (UIColor)backColor;
- (UIColor)pageColor;
- (id)beginManualCurl:(BOOL)a3 atLocation:(CGPoint)a4 inPage:(id)a5 fromPages:(id)a6 backPage:(id)a7 inContainer:(id)a8;
- (id)enqueuePageCurlWithType:(int)a3;
- (id)pageCurls;
- (int64_t)numberOfQueuedCurls;
- (int64_t)spineLocation;
- (void)_startQueuedCurls;
- (void)cancelManualCurl:(id)a3;
- (void)curlPages:(id)a3 backPage:(id)a4 inContainer:(id)a5;
- (void)curlPages:(id)a3 backPage:(id)a4 inContainer:(id)a5 curlPage:(BOOL)a6;
- (void)curlPages:(id)a3 backPages:(id)a4 inContainer:(id)a5;
- (void)curlPages:(id)a3 backPages:(id)a4 inContainer:(id)a5 curlPage:(BOOL)a6;
- (void)dealloc;
- (void)finishManualCurl:(id)a3;
- (void)killAllCurls;
- (void)pageCurl:(id)a3 finished:(BOOL)a4;
- (void)setBackColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPageColor:(id)a3;
- (void)setPageCurlConfiguration:(id)a3;
- (void)setSpineLocation:(int64_t)a3;
- (void)unCurlPages:(id)a3 backPages:(id)a4 inContainer:(id)a5;
- (void)uncurlPages:(id)a3 backPage:(id)a4 inContainer:(id)a5;
- (void)updateManualCurl:(id)a3 toLocation:(CGPoint)a4;
@end

@implementation BKPageCurlManager

- (BKPageCurlManager)init
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = NSStringFromSelector("initWithContext:");
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"Please use the designated initializer -[%@ %@]", v4, v5);

  return 0;
}

- (BKPageCurlManager)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKPageCurlManager;
  v5 = [(BKPageCurlManager *)&v9 init];
  if (v5)
  {
    v6 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:10];
    queue = v5->_queue;
    v5->_queue = v6;

    v5->_spineLocation = 1;
    objc_storeWeak((id *)&v5->_configurationContext, v4);
  }

  return v5;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_queue makeObjectsPerformSelector:"setDelegate:" withObject:0];
  [(BKPageCurlManager *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)BKPageCurlManager;
  [(BKPageCurlManager *)&v3 dealloc];
}

- (BKPageCurlConfiguration)pageCurlConfiguration
{
  pageCurlConfiguration = self->_pageCurlConfiguration;
  if (!pageCurlConfiguration)
  {
    id v4 = [BKPageCurlConfiguration alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_configurationContext);
    v6 = [(BKPageCurlConfiguration *)v4 initWithContext:WeakRetained];
    v7 = self->_pageCurlConfiguration;
    self->_pageCurlConfiguration = v6;

    pageCurlConfiguration = self->_pageCurlConfiguration;
  }

  return pageCurlConfiguration;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v19 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v19);
  char v6 = objc_opt_respondsToSelector();

  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | v6 & 1;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    char v8 = 2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFD | v8;

  id v9 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    char v10 = 4;
  }
  else {
    char v10 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFB | v10;

  id v11 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    char v12 = 8;
  }
  else {
    char v12 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xF7 | v12;

  id v13 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    char v14 = 16;
  }
  else {
    char v14 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xEF | v14;

  id v15 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    char v16 = 32;
  }
  else {
    char v16 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xDF | v16;

  id v17 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    char v18 = 64;
  }
  else {
    char v18 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xBF | v18;
}

- (id)enqueuePageCurlWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc_init(BKPageCurl);
  [(BKPageCurl *)v5 setType:v3];
  [(BKPageCurl *)v5 setDelegate:self];
  char v6 = [(BKPageCurlManager *)self pageColor];
  [(BKPageCurl *)v5 setPageColor:v6];

  v7 = [(BKPageCurlManager *)self backColor];
  [(BKPageCurl *)v5 setBackColor:v7];

  [(BKPageCurl *)v5 setSpineLocation:[(BKPageCurlManager *)self spineLocation]];
  char v8 = [(BKPageCurlManager *)self pageCurlConfiguration];
  [(BKPageCurl *)v5 setConfiguration:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(BKPageCurlManager *)self delegate];
    [v11 pageCurlManagerStabilizationFactor];
    -[BKPageCurl setStabilization:](v5, "setStabilization:");
  }
  [(NSMutableArray *)self->_queue addObject:v5];

  return v5;
}

- (id)pageCurls
{
  return self->_queue;
}

- (int64_t)numberOfQueuedCurls
{
  return (int64_t)[(NSMutableArray *)self->_queue count];
}

- (void)_startQueuedCurls
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = self->_queue;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (void)v16))
        {
          if ([v9 type] != 1 || v6 > 3) {
            goto LABEL_25;
          }
        }
        else if (v6 > 3)
        {
          goto LABEL_25;
        }
        id v11 = (char *)[v9 state];
        if (!v11)
        {
          char v12 = [(BKPageCurlManager *)self delegate];
          [v12 pageCurlManager:self willBeginCurl:v9];

          char delegateFlags = (char)self->_delegateFlags;
          if (delegateFlags)
          {
            char v14 = [(BKPageCurlManager *)self delegate];
            [v14 pageCurlManager:self delayForCurl:v9];
            [v9 setDelay:];

            char delegateFlags = (char)self->_delegateFlags;
          }
          if ((delegateFlags & 2) != 0)
          {
            id v15 = [(BKPageCurlManager *)self delegate];
            [v15 pageCurlManager:self durationForCurl:v9];
            [v9 setDuration:];
          }
          [v9 startAutoCurl];
LABEL_22:
          ++v6;
          continue;
        }
        if (v11 == (unsigned char *)&dword_0 + 1) {
          goto LABEL_22;
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
LABEL_25:
}

- (BOOL)killACurl:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*(unsigned char *)&self->_delegateFlags & 0x20) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned int v6 = [WeakRetained pageCurlManagerShouldKillLastOpposingCurl:self];

    if (!v6) {
      return 0;
    }
  }
  queue = self->_queue;
  char v8 = +[NSPredicate predicateWithFormat:@"type == %d", v3];
  id v9 = [(NSMutableArray *)queue filteredArrayUsingPredicate:v8];

  id v10 = [v9 count];
  BOOL v11 = v10 != 0;
  if (v10)
  {
    char v12 = [v9 lastObject];
    [v12 killCurl];
  }
  return v11;
}

- (void)curlPages:(id)a3 backPages:(id)a4 inContainer:(id)a5 curlPage:(BOOL)a6
{
  if (a6) {
    [(BKPageCurlManager *)self curlPages:a3 backPages:a4 inContainer:a5];
  }
  else {
    [(BKPageCurlManager *)self unCurlPages:a3 backPages:a4 inContainer:a5];
  }
}

- (void)curlPages:(id)a3 backPages:(id)a4 inContainer:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v14 count];
  if (v9
    && v10
    && [v8 count]
    && (unint64_t)[v8 count] >= 2
    && ![(BKPageCurlManager *)self killACurl:1])
  {
    BOOL v11 = +[AETestDriver shared];
    [v11 postEvent:kBETestDriverPageTurnSetupEnd sender:self];

    char v12 = +[AETestDriver shared];
    [v12 postEvent:kBETestDriverPageTurnAnimationStart sender:self];

    id v13 = [(BKPageCurlManager *)self enqueuePageCurlWithType:0];
    [v13 setExistingPages:v14];
    [v13 setBackPages:v8];
    [v13 setContainer:v9];
    if ((unint64_t)[v14 count] >= 2) {
      [v13 setSpineLocation:2];
    }
    [(BKPageCurlManager *)self _startQueuedCurls];
  }
}

- (void)unCurlPages:(id)a3 backPages:(id)a4 inContainer:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v14 count];
  if (v9
    && v10
    && [v8 count]
    && (unint64_t)[v8 count] >= 2
    && ![(BKPageCurlManager *)self killACurl:0])
  {
    BOOL v11 = +[AETestDriver shared];
    [v11 postEvent:kBETestDriverPageTurnSetupEnd sender:self];

    char v12 = +[AETestDriver shared];
    [v12 postEvent:kBETestDriverPageTurnAnimationStart sender:self];

    id v13 = [(BKPageCurlManager *)self enqueuePageCurlWithType:1];
    [v13 setExistingPages:v14];
    [v13 setBackPages:v8];
    [v13 setContainer:v9];
    if ((unint64_t)[v14 count] >= 2) {
      [v13 setSpineLocation:2];
    }
    [(BKPageCurlManager *)self _startQueuedCurls];
  }
}

- (void)curlPages:(id)a3 backPage:(id)a4 inContainer:(id)a5 curlPage:(BOOL)a6
{
  if (a6) {
    [(BKPageCurlManager *)self curlPages:a3 backPage:a4 inContainer:a5];
  }
  else {
    [(BKPageCurlManager *)self uncurlPages:a3 backPage:a4 inContainer:a5];
  }
}

- (void)curlPages:(id)a3 backPage:(id)a4 inContainer:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v14 count];
  if (v9 && v10 && ![(BKPageCurlManager *)self killACurl:1])
  {
    BOOL v11 = +[AETestDriver shared];
    [v11 postEvent:kBETestDriverPageTurnSetupEnd sender:self];

    char v12 = +[AETestDriver shared];
    [v12 postEvent:kBETestDriverPageTurnAnimationStart sender:self];

    id v13 = [(BKPageCurlManager *)self enqueuePageCurlWithType:0];
    [v13 setExistingPages:v14];
    [v13 setBackPage:v8];
    [v13 setContainer:v9];
    if ((unint64_t)[v14 count] >= 2) {
      [v13 setSpineLocation:2];
    }
    [(BKPageCurlManager *)self _startQueuedCurls];
  }
}

- (void)uncurlPages:(id)a3 backPage:(id)a4 inContainer:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v14 count];
  if (v9 && v10 && ![(BKPageCurlManager *)self killACurl:0])
  {
    BOOL v11 = +[AETestDriver shared];
    [v11 postEvent:kBETestDriverPageTurnSetupEnd sender:self];

    char v12 = +[AETestDriver shared];
    [v12 postEvent:kBETestDriverPageTurnAnimationStart sender:self];

    id v13 = [(BKPageCurlManager *)self enqueuePageCurlWithType:1];
    [v13 setExistingPages:v14];
    [v13 setBackPage:v8];
    [v13 setContainer:v9];
    if ((unint64_t)[v14 count] >= 2) {
      [v13 setSpineLocation:2];
    }
    [(BKPageCurlManager *)self _startQueuedCurls];
  }
}

- (id)beginManualCurl:(BOOL)a3 atLocation:(CGPoint)a4 inPage:(id)a5 fromPages:(id)a6 backPage:(id)a7 inContainer:(id)a8
{
  double y = a4.y;
  double x = a4.x;
  BOOL v13 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v15)
  {
    id v19 = [v16 count];
    v20 = 0;
    if (v18 && v19)
    {
      if (v13) {
        uint64_t v21 = 2;
      }
      else {
        uint64_t v21 = 3;
      }
      v20 = [(BKPageCurlManager *)self enqueuePageCurlWithType:v21];
      v22 = +[NSArray arrayWithObject:v15];
      [v20 setCurlPages:v22];

      [v20 setExistingPages:v16];
      [v20 setBackPage:v17];
      [v20 setContainer:v18];
      if ((unint64_t)[v16 count] >= 2) {
        [v20 setSpineLocation:2];
      }
      v23 = [(BKPageCurlManager *)self delegate];
      [v23 pageCurlManager:self willBeginCurl:v20];

      [v20 beginManualCurlAtLocation:x, y];
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)updateManualCurl:(id)a3 toLocation:(CGPoint)a4
{
}

- (void)finishManualCurl:(id)a3
{
}

- (void)cancelManualCurl:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_delegateFlags & 0x40) != 0)
  {
    id v4 = [(BKPageCurlManager *)self delegate];
    [v4 pageCurlManager:self willCancelCurl:v5];
  }
  [v5 cancelManualCurl];
}

- (void)pageCurl:(id)a3 finished:(BOOL)a4
{
  id v5 = [(NSMutableArray *)self->_queue copy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = kBETestDriverPageTurnAnimationEnd;
    uint64_t v10 = kBETestDriverPageTurnEnd;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(obj);
      }
      char v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
      if ((uint64_t)[v12 state] < 2) {
        break;
      }
      BOOL v13 = +[AETestDriver shared];
      [v13 postEvent:v9 sender:self];

      id v14 = +[AETestDriver shared];
      [v14 postEvent:v10 sender:self];

      [(NSMutableArray *)self->_queue removeObject:v12];
      [v12 setDelegate:0];
      BOOL v15 = [v12 state] == (char *)&dword_0 + 2 || [v12 state] == &dword_4;
      id v16 = [(BKPageCurlManager *)self delegate];
      [v16 pageCurlManager:self didFinishCurl:v12 transitionCompleted:v15];

      if ((*(unsigned char *)&self->_delegateFlags & 0x10) != 0
        && ([(BKPageCurlManager *)self delegate],
            id v17 = objc_claimAutoreleasedReturnValue(),
            unsigned int v18 = [v17 pageCurlManagerRemovesViews:self],
            v17,
            !v18))
      {
        [v12 cleanup];
      }
      else
      {
        [v12 fullCleanup];
      }
      if (v7 == (id)++v11)
      {
        id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  [(BKPageCurlManager *)self _startQueuedCurls];
}

- (void)killAllCurls
{
  id v3 = [(NSMutableArray *)self->_queue copy];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 killCurl:v10];
        [v9 setDelegate:0];
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_queue removeAllObjects];
}

- (int64_t)spineLocation
{
  return self->_spineLocation;
}

- (void)setSpineLocation:(int64_t)a3
{
  self->_spineLocation = a3;
}

- (BKPageCurlManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKPageCurlManagerDelegate *)WeakRetained;
}

- (UIColor)pageColor
{
  return self->_pageColor;
}

- (void)setPageColor:(id)a3
{
}

- (UIColor)backColor
{
  return self->_backColor;
}

- (void)setBackColor:(id)a3
{
}

- (void)setPageCurlConfiguration:(id)a3
{
}

- (IMFrameEnvironment)configurationContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configurationContext);

  return (IMFrameEnvironment *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_configurationContext);
  objc_storeStrong((id *)&self->_pageCurlConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backColor, 0);
  objc_storeStrong((id *)&self->_pageColor, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end