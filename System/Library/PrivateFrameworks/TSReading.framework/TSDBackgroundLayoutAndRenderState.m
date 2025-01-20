@interface TSDBackgroundLayoutAndRenderState
- (TSDBackgroundLayoutAndRenderState)initWithDelegate:(id)a3;
- (void)clearDelegate;
- (void)p_didBackgroundLayoutAndRender;
- (void)setNeedsLayoutAndRender;
- (void)setNeedsLayoutForTilingLayers;
@end

@implementation TSDBackgroundLayoutAndRenderState

- (TSDBackgroundLayoutAndRenderState)initWithDelegate:(id)a3
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDBackgroundLayoutAndRenderState initWithDelegate:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 175, @"This operation must only be performed on the main thread.");
  }
  v8.receiver = self;
  v8.super_class = (Class)TSDBackgroundLayoutAndRenderState;
  result = [(TSDBackgroundLayoutAndRenderState *)&v8 init];
  if (result) {
    result->mDelegate = (TSDBackgroundLayoutAndRenderStateDelegate *)a3;
  }
  return result;
}

- (void)clearDelegate
{
  self->mDelegate = 0;
}

- (void)setNeedsLayoutAndRender
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDBackgroundLayoutAndRenderState setNeedsLayoutAndRender]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 191, @"This operation must only be performed on the main thread.");
  }
  objc_sync_enter(self);
  if (!self->mNeedsLayoutAndRender)
  {
    self->mNeedsLayoutAndRender = 1;
    [(TSDBackgroundLayoutAndRenderState *)self setNeedsLayoutForTilingLayers];
  }
  objc_sync_exit(self);
}

- (void)setNeedsLayoutForTilingLayers
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDBackgroundLayoutAndRenderState setNeedsLayoutForTilingLayers]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 203, @"This operation must only be performed on the main thread.");
  }
  objc_sync_enter(self);
  if (self->mNeedsLayoutForTilingLayers)
  {
    objc_sync_exit(self);
  }
  else
  {
    self->mNeedsLayoutForTilingLayers = 1;
    objc_sync_exit(self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __66__TSDBackgroundLayoutAndRenderState_setNeedsLayoutForTilingLayers__block_invoke;
    v5[3] = &unk_2646AF7B8;
    v5[4] = self;
    if ([(TSDBackgroundLayoutAndRenderStateDelegate *)self->mDelegate backgroundLayoutAndRenderState:self shouldDispatchBackgroundWork:v5])[+[TSKThreadDispatcher sharedInstance] dispatch:v5]; {
  }
    }
}

uint64_t __66__TSDBackgroundLayoutAndRenderState_setNeedsLayoutForTilingLayers__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(unsigned char *)(v3 + 16) == 0;
  *(unsigned char *)(v3 + 16) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = 0;
  objc_sync_exit(v2);
  [*(id *)(*(void *)(a1 + 32) + 8) backgroundLayoutAndRenderState:*(void *)(a1 + 32) performWorkInBackgroundTilingOnly:v4];
  v5 = *(void **)(a1 + 32);
  return [v5 performSelectorOnMainThread:sel_p_didBackgroundLayoutAndRender withObject:0 waitUntilDone:0];
}

- (void)p_didBackgroundLayoutAndRender
{
}

@end