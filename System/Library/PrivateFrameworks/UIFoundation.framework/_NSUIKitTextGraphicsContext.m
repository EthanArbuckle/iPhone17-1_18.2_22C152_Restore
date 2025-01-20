@interface _NSUIKitTextGraphicsContext
+ (_NSUIKitTextGraphicsContext)sharedContext;
+ (id)graphicsContextForApplicationFrameworkContext:(int64_t)a3;
- (BOOL)isDrawingToScreen;
- (BOOL)isFlipped;
- (CGContext)CGContext;
- (void)becomeCurrentGraphicsContextDuringBlock:(id)a3;
- (void)restoreGraphicsState;
- (void)saveGraphicsState;
@end

@implementation _NSUIKitTextGraphicsContext

- (CGContext)CGContext
{
  return (CGContext *)softLinkUIGraphicsGetCurrentContext[0]();
}

- (BOOL)isFlipped
{
  return 1;
}

+ (_NSUIKitTextGraphicsContext)sharedContext
{
  if (sharedContext_once != -1) {
    dispatch_once(&sharedContext_once, &__block_literal_global_111);
  }
  return (_NSUIKitTextGraphicsContext *)sharedContext_sharedContext;
}

+ (id)graphicsContextForApplicationFrameworkContext:(int64_t)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = NSStringFromClass((Class)a1);
  [v4 raise:v5, @"+[%@ %@] should not be invoked.", v6, NSStringFromSelector(a2) format];
  return 0;
}

- (BOOL)isDrawingToScreen
{
  return 1;
}

- (void)saveGraphicsState
{
  if (softLinkUIGraphicsGetCurrentContext[0]())
  {
    v2 = (CGContext *)softLinkUIGraphicsGetCurrentContext[0]();
    CGContextSaveGState(v2);
  }
}

- (void)restoreGraphicsState
{
  if (softLinkUIGraphicsGetCurrentContext[0]())
  {
    v2 = (CGContext *)softLinkUIGraphicsGetCurrentContext[0]();
    CGContextRestoreGState(v2);
  }
}

- (void)becomeCurrentGraphicsContextDuringBlock:(id)a3
{
}

@end