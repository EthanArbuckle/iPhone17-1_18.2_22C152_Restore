@interface UIGestureRecognizer(TSDGestureDispatcher)
- (BOOL)isDone;
- (__CFString)gestureKind;
- (id)cachedGestureTarget;
- (id)targetRep;
- (uint64_t)boundsLocationForICC:()TSDGestureDispatcher;
- (uint64_t)gestureDelegate;
- (uint64_t)gestureState;
- (uint64_t)naturalLocationForRep:()TSDGestureDispatcher;
- (uint64_t)setGestureDelegate:()TSDGestureDispatcher;
- (uint64_t)unscaledLocationForICC:()TSDGestureDispatcher;
- (void)initWithGestureDispatcher:()TSDGestureDispatcher gestureKind:;
- (void)setCachedGestureTarget:()TSDGestureDispatcher;
- (void)setGestureKind:()TSDGestureDispatcher;
- (void)setTargetRep:()TSDGestureDispatcher;
@end

@implementation UIGestureRecognizer(TSDGestureDispatcher)

- (void)initWithGestureDispatcher:()TSDGestureDispatcher gestureKind:
{
  v6 = (void *)[a1 initWithTarget:a3 action:sel_handleGesture_];
  v7 = v6;
  if (v6)
  {
    [v6 setGestureDelegate:a3];
    [v7 setGestureKind:a4];
  }
  return v7;
}

- (void)setGestureKind:()TSDGestureDispatcher
{
}

- (__CFString)gestureKind
{
  result = (__CFString *)objc_getAssociatedObject(a1, &gestureKindKey);
  if (!result) {
    return @"TSWPUndefinedGestureKind";
  }
  return result;
}

- (void)setCachedGestureTarget:()TSDGestureDispatcher
{
}

- (id)cachedGestureTarget
{
  return objc_getAssociatedObject(a1, &gestureTargetCacheKey);
}

- (void)setTargetRep:()TSDGestureDispatcher
{
}

- (id)targetRep
{
  return objc_getAssociatedObject(a1, &targetRepKey);
}

- (uint64_t)unscaledLocationForICC:()TSDGestureDispatcher
{
  objc_msgSend(a1, "locationInView:", objc_msgSend(a3, "canvasView"));

  return objc_msgSend(a3, "convertBoundsToUnscaledPoint:");
}

- (uint64_t)boundsLocationForICC:()TSDGestureDispatcher
{
  objc_msgSend(a1, "unscaledLocationForICC:");

  return objc_msgSend(a3, "convertUnscaledToBoundsPoint:");
}

- (uint64_t)naturalLocationForRep:()TSDGestureDispatcher
{
  objc_msgSend(a1, "unscaledLocationForICC:", objc_msgSend(a3, "interactiveCanvasController"));

  return objc_msgSend(a3, "convertNaturalPointFromUnscaledCanvas:");
}

- (uint64_t)gestureDelegate
{
  [a1 delegate];

  return TSUProtocolCast();
}

- (uint64_t)setGestureDelegate:()TSDGestureDispatcher
{
  uint64_t v2 = TSUProtocolCast();
  if (!v2)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[UIGestureRecognizer(TSDGestureDispatcher) setGestureDelegate:]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGestureDispatcher.m"), 136, @"invalid nil value for '%s'", "grDelegate");
  }

  return [a1 setDelegate:v2];
}

- (uint64_t)gestureState
{
  return [a1 state];
}

- (BOOL)isDone
{
  return [a1 gestureState] - 3 < 3;
}

@end