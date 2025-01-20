@interface TSDFill
- (BOOL)canApplyToCALayer;
- (BOOL)canApplyToCAShapeLayer;
- (BOOL)drawsInOneStep;
- (BOOL)isClear;
- (BOOL)isNearlyWhite;
- (BOOL)isOpaque;
- (BOOL)shouldBeReappliedToCALayer:(id)a3;
- (id)referenceColor;
- (int)fillType;
- (void)addInterest;
- (void)applyToCALayer:(id)a3 withScale:(double)a4;
- (void)applyToCAShapeLayer:(id)a3 withScale:(double)a4;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)removeInterest;
@end

@implementation TSDFill

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v12);
  [(TSDFill *)self paintPath:Mutable inContext:a4];
  CGPathRelease(Mutable);
}

- (BOOL)canApplyToCALayer
{
  return 0;
}

- (BOOL)shouldBeReappliedToCALayer:(id)a3
{
  return 0;
}

- (void)applyToCALayer:(id)a3 withScale:(double)a4
{
  v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDFill applyToCALayer:withScale:]"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFill.m"];
  [v4 handleFailureInFunction:v5 file:v6 lineNumber:79 description:@"called -applyToCALayer:withScale: on a TSDFill that can't"];
}

- (BOOL)canApplyToCAShapeLayer
{
  return 0;
}

- (void)applyToCAShapeLayer:(id)a3 withScale:(double)a4
{
  v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDFill applyToCAShapeLayer:withScale:]"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFill.m"];
  [v4 handleFailureInFunction:v5 file:v6 lineNumber:89 description:@"called -applyToCAShapeLayer:withScale: on a TSDFill that can't"];
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)isNearlyWhite
{
  return 0;
}

- (BOOL)isClear
{
  return 0;
}

- (BOOL)drawsInOneStep
{
  return 0;
}

- (id)referenceColor
{
  return (id)[MEMORY[0x263F7C808] clearColor];
}

- (void)addInterest
{
}

- (void)removeInterest
{
  if (atomic_fetch_add_explicit(&self->mInterest, 0xFFFFFFFF, memory_order_relaxed) == 1) {
    [(TSDFill *)self i_flushCaches];
  }
}

- (int)fillType
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDFill fillType]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFill.m"), 145, @"subclasses must override");
  return 4;
}

@end