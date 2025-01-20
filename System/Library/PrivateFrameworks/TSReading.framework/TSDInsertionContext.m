@interface TSDInsertionContext
+ (id)dragInsertionContextWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 fromDragToInsertController:(BOOL)a5 insertWillBeDiscarded:(BOOL)a6;
+ (id)dragInsertionContextWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 shouldEndEditing:(BOOL)a5 fromDragToInsertController:(BOOL)a6 insertWillBeDiscarded:(BOOL)a7;
+ (id)nonInteractiveFloatingInsertionContext;
+ (id)nonInteractiveInsertionContext;
- (BOOL)fromDragToInsertController;
- (BOOL)hasPreferredCenter;
- (BOOL)insertFloating;
- (BOOL)insertFromDrag;
- (BOOL)insertWillBeDiscarded;
- (BOOL)isInteractive;
- (BOOL)isPreferredCenterRequired;
- (BOOL)shouldEndEditing;
- (CGPoint)preferredCenter;
- (TSDInsertionContext)init;
@end

@implementation TSDInsertionContext

+ (id)nonInteractiveInsertionContext
{
  if (nonInteractiveInsertionContext_createNonInteractiveInsertionContextOnce != -1) {
    dispatch_once(&nonInteractiveInsertionContext_createNonInteractiveInsertionContextOnce, &__block_literal_global_53);
  }
  return (id)nonInteractiveInsertionContext_nonInteractiveInsertionContext;
}

TSDNonInteractiveInsertionContext *__53__TSDInsertionContext_nonInteractiveInsertionContext__block_invoke()
{
  result = objc_alloc_init(TSDNonInteractiveInsertionContext);
  nonInteractiveInsertionContext_nonInteractiveInsertionContext = (uint64_t)result;
  return result;
}

+ (id)nonInteractiveFloatingInsertionContext
{
  if (nonInteractiveFloatingInsertionContext_createNonInteractiveFloatingInsertionContextOnce != -1) {
    dispatch_once(&nonInteractiveFloatingInsertionContext_createNonInteractiveFloatingInsertionContextOnce, &__block_literal_global_2_1);
  }
  return (id)nonInteractiveFloatingInsertionContext_nonInteractiveFloatingInsertionContext;
}

TSDNonInteractiveFloatingInsertionContext *__61__TSDInsertionContext_nonInteractiveFloatingInsertionContext__block_invoke()
{
  result = objc_alloc_init(TSDNonInteractiveFloatingInsertionContext);
  nonInteractiveFloatingInsertionContext_nonInteractiveFloatingInsertionContext = (uint64_t)result;
  return result;
}

+ (id)dragInsertionContextWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 fromDragToInsertController:(BOOL)a5 insertWillBeDiscarded:(BOOL)a6
{
  return (id)objc_msgSend(a1, "dragInsertionContextWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertWillBeDiscarded:", a4, 1, a5, a6, a3.x, a3.y);
}

+ (id)dragInsertionContextWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 shouldEndEditing:(BOOL)a5 fromDragToInsertController:(BOOL)a6 insertWillBeDiscarded:(BOOL)a7
{
  v7 = -[TSDDragInsertionContext initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertWillBeDiscarded:]([TSDDragInsertionContext alloc], "initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertWillBeDiscarded:", a4, a5, a6, a7, a3.x, a3.y);

  return v7;
}

- (TSDInsertionContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)TSDInsertionContext;
  v2 = [(TSDInsertionContext *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    if (v3 == objc_opt_class())
    {
      v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSDInsertionContext init]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInsertionContext.m"), 71, @"Cannot instantiate abstract class");

      return 0;
    }
  }
  return v2;
}

- (BOOL)hasPreferredCenter
{
  return 0;
}

- (BOOL)isPreferredCenterRequired
{
  return 0;
}

- (CGPoint)preferredCenter
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)shouldEndEditing
{
  return 1;
}

- (BOOL)insertFloating
{
  return 0;
}

- (BOOL)insertFromDrag
{
  return 0;
}

- (BOOL)fromDragToInsertController
{
  return 0;
}

- (BOOL)insertWillBeDiscarded
{
  return 0;
}

- (BOOL)isInteractive
{
  return 1;
}

@end