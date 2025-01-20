@interface TSWPTextMagnifierRanged
- (BOOL)shouldHideCanvasLayer;
- (BOOL)terminalPointPlacedCarefully;
- (BOOL)wasPlacedCarefullyAtTime:(double)a3;
- (CGPoint)animationPoint;
- (CGPoint)magnificationPoint;
- (CGPoint)offset;
- (CGPoint)terminalPoint;
- (NSString)maskImageName;
- (NSString)overlayImageName;
- (NSString)underlayImageName;
- (TSWPRep)target;
- (TSWPTextMagnifierRanged)initWithFrame:(CGRect)a3;
- (double)currentOffset;
- (double)horizontalMovement;
- (double)horizontalMovementAtTime:(double)a3;
- (void)autoscrollWillNotStart;
- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6;
- (void)canvasNeedsDisplay;
- (void)dealloc;
- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4;
- (void)postAutoscrollPoint:(CGPoint)a3;
- (void)setAnimationPoint:(CGPoint)a3;
- (void)setAutoscrollDirections:(int)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMagnificationPoint:(CGPoint)a3;
- (void)setNeedsDisplay;
- (void)setOffset:(CGPoint)a3;
- (void)setTarget:(id)a3;
- (void)stopMagnifying:(BOOL)a3;
- (void)updateFrame;
@end

@implementation TSWPTextMagnifierRanged

- (TSWPTextMagnifierRanged)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)TSWPTextMagnifierRanged;
  v7 = -[TSWPTextMagnifierRanged initWithFrame:](&v10, sel_initWithFrame_);
  if (v7)
  {
    -[TSWPTextMagnifierRanged setBackgroundColor:](v7, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    v7->_weightedPoint = objc_alloc_init(TSWPTextMagnifierTimeWeightedPoint);
    v8 = -[TSWPTextMagnifierRenderer initWithFrame:]([TSWPTextMagnifierRenderer alloc], "initWithFrame:", x, y, width, height);
    v7->_magnifierRenderer = v8;
    [(TSWPTextMagnifierRenderer *)v8 setDelegate:v7];
    [(TSWPTextMagnifierRanged *)v7 addSubview:v7->_magnifierRenderer];
  }
  return v7;
}

- (void)dealloc
{
  [(TSWPTextMagnifierRenderer *)self->_magnifierRenderer setDelegate:0];
  [(TSWPTextMagnifierRenderer *)self->_magnifierRenderer tearDown];

  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierRanged;
  [(TSWPTextMagnifierRanged *)&v3 dealloc];
}

- (double)horizontalMovement
{
  [(TSWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint displacementInInterval:0.5];
  return result;
}

- (double)horizontalMovementAtTime:(double)a3
{
  [(TSWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint distanceCoveredInInterval:3.40282347e38];
  double v5 = v4;
  [(TSWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint displacementInInterval:0.5];
  double v7 = fabs(result);
  double v9 = fabs(v8) * 4.0;
  if (v5 > v7 * 1.5 || v9 > v7 || v7 < 16.0) {
    return 0.0;
  }
  return result;
}

- (BOOL)wasPlacedCarefullyAtTime:(double)a3
{
  [(TSWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint distanceCoveredInInterval:0.5 priorTo:a3];
  return v3 < 10.0;
}

- (double)currentOffset
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSWPTextMagnifierRanged currentOffset]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 97, @"Abstract method");
  return 0.0;
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPTextMagnifierRanged;
  -[TSWPTextMagnifierRanged setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  magnifierRenderer = self->_magnifierRenderer;
  [(TSWPTextMagnifierRanged *)self bounds];
  -[TSWPTextMagnifierRenderer setFrame:](magnifierRenderer, "setFrame:");
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierRanged;
  [(TSWPTextMagnifierRanged *)&v3 setNeedsDisplay];
  [(TSWPTextMagnifierRenderer *)self->_magnifierRenderer setNeedsDisplay];
}

- (void)updateFrame
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSWPTextMagnifierRanged updateFrame]"];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"];

  [v2 handleFailureInFunction:v3 file:v4 lineNumber:115 description:@"Abstract method"];
}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  v6 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a6, a4.x, a4.y, a5.x, a5.y);
  uint64_t v7 = [NSString stringWithUTF8String:"-[TSWPTextMagnifierRanged beginMagnifyingTarget:magnificationPoint:offset:animated:]"];
  uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"];

  [v6 handleFailureInFunction:v7 file:v8 lineNumber:122 description:@"Abstract method"];
}

- (void)stopMagnifying:(BOOL)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPTextMagnifierRanged stopMagnifying:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:127 description:@"Abstract method"];
}

- (void)postAutoscrollPoint:(CGPoint)a3
{
}

- (void)setAutoscrollDirections:(int)a3
{
}

- (void)autoscrollWillNotStart
{
}

- (CGPoint)terminalPoint
{
  [(TSWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint weightedPoint];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)terminalPointPlacedCarefully
{
  BOOL v3 = [(TSWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint historyCovers:0.5];
  [(TSWPTextMagnifierTimeWeightedPoint *)self->_weightedPoint distanceCoveredInInterval:0.5];
  return v4 < 10.0 && v3;
}

- (CGPoint)magnificationPoint
{
  double x = self->_magnificationPoint.x;
  double y = self->_magnificationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[TSWPTextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:");
  if (x != self->_magnificationPoint.x || y != self->_magnificationPoint.y)
  {
    self->_magnificationPoint.double x = x;
    self->_magnificationPoint.double y = y;
    [(TSWPTextMagnifierRanged *)self updateFrame];
    [(TSWPTextMagnifierRenderer *)self->_magnifierRenderer canvasNeedsDisplay];
  }

  -[TSWPTextMagnifierRanged setAnimationPoint:](self, "setAnimationPoint:", x, y);
}

- (NSString)underlayImageName
{
  double v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSWPTextMagnifierRanged underlayImageName]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 180, @"Abstract method");
  return (NSString *)&stru_26D688A48;
}

- (NSString)overlayImageName
{
  double v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSWPTextMagnifierRanged overlayImageName]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 186, @"Abstract method");
  return (NSString *)&stru_26D688A48;
}

- (NSString)maskImageName
{
  double v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSWPTextMagnifierRanged maskImageName]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 192, @"Abstract method");
  return (NSString *)&stru_26D688A48;
}

- (BOOL)shouldHideCanvasLayer
{
  double v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSWPTextMagnifierRanged shouldHideCanvasLayer]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"), 198, @"Abstract method");
  return 1;
}

- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4
{
  double v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPTextMagnifierRanged drawMagnifierClippedCanvasLayer:inContext:]"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextMagnifierRanged.mm"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:204 description:@"Abstract method"];
}

- (void)canvasNeedsDisplay
{
}

- (TSWPRep)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (CGPoint)animationPoint
{
  double x = self->_animationPoint.x;
  double y = self->_animationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnimationPoint:(CGPoint)a3
{
  self->_animationPoint = a3;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

@end