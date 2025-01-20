@interface TSDTileProvider
- ($E59C7DEBCD57E98EE3F0104B12BEB13C)visibleTileRect;
- (BOOL)canTargetDrawInParallel;
- (BOOL)isTargetOpaque;
- (TSDTileProvider)initWithTarget:(id)a3 queue:(id)a4 storage:(id)a5 accessController:(id)a6;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)contentsInRect:(CGRect)a3 contentsScale:(double)a4 forTile:(id)a5 atLocation:(id)a6 takingReadLock:(BOOL)a7;
- (id)p_bucketKey;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)flush;
- (void)provideContentsInRect:(CGRect)a3 contentsScale:(double)a4 forTile:(id)a5 atLocation:(id)a6 inGroup:(id)a7 limitedBySemaphore:(id)a8 takingReadLock:(BOOL)a9 startBlock:(id)a10 completionBlock:(id)a11;
- (void)removeStoredImages;
- (void)setVisibleTileRect:(id *)a3;
@end

@implementation TSDTileProvider

- (TSDTileProvider)initWithTarget:(id)a3 queue:(id)a4 storage:(id)a5 accessController:(id)a6
{
  v16.receiver = self;
  v16.super_class = (Class)TSDTileProvider;
  v10 = [(TSDTileProvider *)&v16 init];
  if (v10)
  {
    v10->mTarget = a3;
    if (!a4)
    {
      v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSDTileProvider initWithTarget:queue:storage:accessController:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTileProvider.m"), 36, @"invalid nil value for '%s'", "queue");
    }
    v10->mQueue = (OS_dispatch_queue *)a4;
    v10->mTileStorage = (TSDTileStorage *)a5;
    if (!a6)
    {
      v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v14 = [NSString stringWithUTF8String:"-[TSDTileProvider initWithTarget:queue:storage:accessController:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTileProvider.m"), 41, @"invalid nil value for '%s'", "accessController");
    }
    v10->mAccessController = (TSKAccessController *)a6;
  }
  return v10;
}

- (void)dealloc
{
  [(TSDTileProvider *)self removeStoredImages];

  v3.receiver = self;
  v3.super_class = (Class)TSDTileProvider;
  [(TSDTileProvider *)&v3 dealloc];
}

- (void)provideContentsInRect:(CGRect)a3 contentsScale:(double)a4 forTile:(id)a5 atLocation:(id)a6 inGroup:(id)a7 limitedBySemaphore:(id)a8 takingReadLock:(BOOL)a9 startBlock:(id)a10 completionBlock:(id)a11
{
  unint64_t var1 = a6.var1;
  unint64_t var0 = a6.var0;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  dispatch_retain((dispatch_object_t)a8);
  mQueue = self->mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __143__TSDTileProvider_provideContentsInRect_contentsScale_forTile_atLocation_inGroup_limitedBySemaphore_takingReadLock_startBlock_completionBlock___block_invoke;
  block[3] = &unk_2646B22E8;
  block[4] = a8;
  block[5] = self;
  *(CGFloat *)&block[9] = x;
  *(CGFloat *)&block[10] = y;
  *(CGFloat *)&block[11] = width;
  *(CGFloat *)&block[12] = height;
  *(double *)&block[13] = a4;
  block[6] = a5;
  block[7] = a10;
  block[14] = var0;
  block[15] = var1;
  BOOL v25 = a9;
  block[8] = a11;
  dispatch_group_async((dispatch_group_t)a7, mQueue, block);
}

void __143__TSDTileProvider_provideContentsInRect_contentsScale_forTile_atLocation_inGroup_limitedBySemaphore_takingReadLock_startBlock_completionBlock___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "contentsInRect:contentsScale:forTile:atLocation:takingReadLock:", *(void *)(a1 + 48), *(void *)(a1 + 112), *(void *)(a1 + 120), *(unsigned __int8 *)(a1 + 128), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  v4 = *(NSObject **)(a1 + 32);

  dispatch_release(v4);
}

- (id)contentsInRect:(CGRect)a3 contentsScale:(double)a4 forTile:(id)a5 atLocation:(id)a6 takingReadLock:(BOOL)a7
{
  BOOL v7 = a7;
  unint64_t var1 = a6.var1;
  unint64_t var0 = a6.var0;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self)
  {
    [(TSDTileProvider *)self visibleTileRect];
    unint64_t v18 = *((void *)&v32 + 1);
    unint64_t v17 = v32;
    unint64_t v19 = *((void *)&v33 + 1);
    unint64_t v20 = v33;
  }
  else
  {
    unint64_t v19 = 0;
    unint64_t v18 = 0;
    unint64_t v20 = 0;
    unint64_t v17 = 0;
    long long v32 = 0u;
    long long v33 = 0u;
  }
  if (v17 > var0 || var0 > v20 || v18 > var1 || var1 > v19) {
    return 0;
  }
  id v25 = [(TSDTileProvider *)self p_bucketKey];
  id v26 = -[TSDTileStorage contentsInRect:contentsScale:forTileAtLocation:inBucket:](self->mTileStorage, "contentsInRect:contentsScale:forTileAtLocation:inBucket:", var0, var1, v25, x, y, width, height, a4);
  id v24 = v26;
  if (!v26)
  {
    [MEMORY[0x263F158F8] begin];
    if (a5)
    {
      [a5 setNeedsDisplay];
      id v24 = a5;
    }
    else
    {
      id v24 = (id)[MEMORY[0x263F157E8] layer];
    }
    [v24 setDelegate:self];
    objc_msgSend(v24, "setBounds:", x, y, width, height);
    double v27 = *MEMORY[0x263F00148];
    double v28 = *(double *)(MEMORY[0x263F00148] + 8);
    objc_msgSend(v24, "setPosition:", *MEMORY[0x263F00148], v28);
    objc_msgSend(v24, "setAnchorPoint:", v27, v28);
    objc_msgSend(v24, "setOpaque:", -[TSDTileProvider isTargetOpaque](self, "isTargetOpaque"));
    [v24 setContentsScale:a4];
    if (v7)
    {
      mAccessController = self->mAccessController;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __82__TSDTileProvider_contentsInRect_contentsScale_forTile_atLocation_takingReadLock___block_invoke;
      v31[3] = &unk_2646AF7B8;
      v31[4] = v24;
      [(TSKAccessController *)mAccessController performRead:v31];
    }
    else
    {
      [v24 display];
    }
    [v24 setDelegate:0];
    [MEMORY[0x263F158F8] commit];
    -[TSDTileStorage storeContents:inRect:contentsScale:forTileAtLocation:inBucket:](self->mTileStorage, "storeContents:inRect:contentsScale:forTileAtLocation:inBucket:", v24, var0, var1, v25, x, y, width, height, a4);
  }
  return v24;
}

uint64_t __82__TSDTileProvider_contentsInRect_contentsScale_forTile_atLocation_takingReadLock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) display];
}

- (void)flush
{
}

- (void)removeStoredImages
{
  mTileStorage = self->mTileStorage;
  id v3 = [(TSDTileProvider *)self p_bucketKey];

  [(TSDTileStorage *)mTileStorage removeImagesInBucket:v3];
}

- (BOOL)isTargetOpaque
{
  return 0;
}

- (BOOL)canTargetDrawInParallel
{
  return 0;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  BOOL v7 = (void *)MEMORY[0x223CB9570](self, a2);
  if (([a3 contentsAreFlipped] & 1) == 0)
  {
    [a3 bounds];
    TSDAffineTransformForFlips(0, 1, (uint64_t)&v12, v8, v9, v10, v11);
    CGContextConcatCTM(a4, &v12);
  }
  [(TSDTileProvider *)self drawTargetInLayer:a3 context:a4];
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3, a4);
}

- (id)p_bucketKey
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
}

- ($E59C7DEBCD57E98EE3F0104B12BEB13C)visibleTileRect
{
  objc_copyStruct(retstr, &self->mVisibleTileRect, 32, 1, 0);
  return result;
}

- (void)setVisibleTileRect:(id *)a3
{
}

@end