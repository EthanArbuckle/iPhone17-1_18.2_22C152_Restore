@interface TSKTintLayer
- (CALayer)contentsLayer;
- (id)contents;
- (void)dealloc;
- (void)layoutSublayers;
- (void)setContents:(id)a3;
- (void)setContentsLayer:(id)a3;
- (void)setNeedsDisplay;
@end

@implementation TSKTintLayer

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKTintLayer;
  [(TSKTintLayer *)&v3 dealloc];
}

- (void)setContentsLayer:(id)a3
{
  contentsLayer = self->_contentsLayer;
  if (contentsLayer) {
    [(TSKTintLayer *)self replaceSublayer:contentsLayer with:a3];
  }
  else {
    [(TSKTintLayer *)self addSublayer:a3];
  }
  self->_contentsLayer = (CALayer *)a3;

  [(TSKTintLayer *)self setNeedsLayout];
}

- (id)contents
{
  return [(CALayer *)self->_contentsLayer contents];
}

- (void)setContents:(id)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKTintLayer setContents:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKTintLayer.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:44 description:@"Don't call -setContents: on TSKTintLayer"];
}

- (void)setNeedsDisplay
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKTintLayer setNeedsDisplay]"];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKTintLayer.m"];

  [v2 handleFailureInFunction:v3 file:v4 lineNumber:49 description:@"Don't call -setNeedsDisplay on TSKTintLayer"];
}

- (void)layoutSublayers
{
  [(TSKTintLayer *)self bounds];
  contentsLayer = self->_contentsLayer;

  -[CALayer setFrame:](contentsLayer, "setFrame:");
}

- (CALayer)contentsLayer
{
  return self->_contentsLayer;
}

@end