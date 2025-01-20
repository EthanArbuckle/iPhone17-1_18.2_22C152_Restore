@interface TSDRepTileProvider
- (BOOL)canTargetDrawInParallel;
- (BOOL)isTargetOpaque;
- (TSDRepTileProvider)initWithRep:(id)a3;
- (void)beginDrawingOperation;
- (void)drawTargetInLayer:(id)a3 context:(CGContext *)a4;
- (void)endDrawingOperation;
@end

@implementation TSDRepTileProvider

- (TSDRepTileProvider)initWithRep:(id)a3
{
  v5 = (void *)[a3 interactiveCanvasController];
  uint64_t v6 = objc_msgSend(a3, "i_queueForTileProvider");
  uint64_t v7 = objc_msgSend(v5, "i_tileStorage");
  uint64_t v8 = [v5 accessController];

  return [(TSDTileProvider *)self initWithTarget:a3 queue:v6 storage:v7 accessController:v8];
}

- (BOOL)isTargetOpaque
{
  return [self->super.mTarget isOpaque];
}

- (BOOL)canTargetDrawInParallel
{
  return [self->super.mTarget canDrawInParallel];
}

- (void)drawTargetInLayer:(id)a3 context:(CGContext *)a4
{
  mTarget = self->super.mTarget;
  uint64_t v7 = (void *)[mTarget interactiveCanvasController];

  objc_msgSend(v7, "i_drawRepWithReadLock:inContext:forLayer:", mTarget, a4, a3);
}

- (void)beginDrawingOperation
{
}

- (void)endDrawingOperation
{
}

@end