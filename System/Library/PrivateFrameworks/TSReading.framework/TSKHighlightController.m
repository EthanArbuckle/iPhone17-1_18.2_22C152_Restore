@interface TSKHighlightController
- (BOOL)drawRoundedRect;
- (CALayer)layer;
- (CGAffineTransform)transform;
- (CGPath)path;
- (CGRect)buildLayersForPath:(CGPath *)a3 withImage:(id)a4;
- (TSUImage)image;
- (double)viewScale;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)createLayerWithZOrder:(double)a3 contentsScaleForLayers:(double)a4;
- (void)dealloc;
- (void)hide;
- (void)reset;
- (void)setCanvasTransform:(CGAffineTransform *)a3 layerTransform:(CGAffineTransform *)a4;
- (void)setImage:(id)a3;
- (void)setPath:(CGPath *)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setViewScale:(double)a3;
@end

@implementation TSKHighlightController

- (void)setPath:(CGPath *)a3
{
  path = self->_path;
  if (path != a3)
  {
    CGPathRelease(path);
    self->_path = CGPathRetain(a3);
  }
}

- (void)dealloc
{
  [(TSKHighlightController *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)TSKHighlightController;
  [(TSKHighlightController *)&v3 dealloc];
}

- (void)reset
{
  self->_containingLayer = 0;
}

- (BOOL)drawRoundedRect
{
  return 0;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3, a4);
}

- (void)hide
{
}

- (void)createLayerWithZOrder:(double)a3 contentsScaleForLayers:(double)a4
{
  if (self->_containingLayer)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSKHighlightController createLayerWithZOrder:contentsScaleForLayers:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKHighlightController.m"), 91, @"Shouldn't be creating _containingLayer again");
    [(TSKHighlightController *)self reset];
  }
  if (a4 <= 0.0) {
    a4 = 1.0;
  }
  v9 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  self->_containingLayer = v9;
  double v10 = *MEMORY[0x263F00148];
  double v11 = *(double *)(MEMORY[0x263F00148] + 8);
  -[CALayer setAnchorPoint:](v9, "setAnchorPoint:", *MEMORY[0x263F00148], v11);
  [(CALayer *)self->_containingLayer setEdgeAntialiasingMask:0];
  [(CALayer *)self->_containingLayer setContentsScale:a4];
  [(CALayer *)self->_containingLayer setZPosition:a3];
  [(CALayer *)self->_containingLayer setDelegate:self];
  v12 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  self->_imageLayer = v12;
  -[CALayer setAnchorPoint:](v12, "setAnchorPoint:", v10, v11);
  [(CALayer *)self->_imageLayer setEdgeAntialiasingMask:0];
  [(CALayer *)self->_imageLayer setContentsScale:a4];
  [(CALayer *)self->_containingLayer addSublayer:self->_imageLayer];
  [(CALayer *)self->_imageLayer setDelegate:self];
  imageLayer = self->_imageLayer;
}

- (CGRect)buildLayersForPath:(CGPath *)a3 withImage:(id)a4
{
  v7 = (double *)MEMORY[0x263F001A8];
  CGSize v8 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->_overallRect.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_overallRect.size = v8;
  [(TSKHighlightController *)self setImage:a4];
  [(TSKHighlightController *)self setPath:a3];
  if (a3)
  {
    BoundingBoCGFloat x = CGPathGetBoundingBox(a3);
    CGRect v35 = CGRectIntegral(BoundingBox);
    long long v9 = *(_OWORD *)&self->_layerTransform.c;
    *(_OWORD *)&v33.a = *(_OWORD *)&self->_layerTransform.a;
    *(_OWORD *)&v33.c = v9;
    *(_OWORD *)&v33.tCGFloat x = *(_OWORD *)&self->_layerTransform.tx;
    CGRect v36 = CGRectApplyAffineTransform(v35, &v33);
    CGFloat x = v36.origin.x;
    CGFloat y = v36.origin.y;
    CGFloat width = v36.size.width;
    CGFloat height = v36.size.height;
    [(TSKHighlightController *)self viewScale];
    if (v14 != 0.0)
    {
      [(TSKHighlightController *)self viewScale];
      CGFloat v16 = v15;
      [(TSKHighlightController *)self viewScale];
      CGAffineTransformMakeScale(&v32, v16, v17);
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      CGRect v38 = CGRectApplyAffineTransform(v37, &v32);
      CGFloat x = v38.origin.x;
      CGFloat y = v38.origin.y;
      CGFloat width = v38.size.width;
      CGFloat height = v38.size.height;
    }
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    self->_overallRect = CGRectIntegral(v39);
    -[CALayer setFrame:](self->_containingLayer, "setFrame:", *v7, v7[1], v7[2], v7[3]);
    double v18 = self->_overallRect.origin.x;
    double v19 = self->_overallRect.origin.y;
    double v20 = self->_overallRect.size.width;
    double v21 = self->_overallRect.size.height;
    [a4 size];
    double v23 = v22;
    double v25 = v24;
    *(float *)&double v22 = (v24 - v21) * 0.5;
    *(float *)&double v24 = (v23 - v20) * 0.5;
    double v26 = v18 - roundf(*(float *)&v24);
    double v27 = v19 - roundf(*(float *)&v22);
    [(CALayer *)self->_imageLayer setContents:[(TSUImage *)self->_image CGImage]];
    -[CALayer setFrame:](self->_imageLayer, "setFrame:", v26, v27, v23, v25);
    [(CALayer *)self->_imageLayer setContentsGravity:*MEMORY[0x263F15E00]];
    [(CALayer *)self->_containingLayer setHidden:0];
  }
  double v28 = self->_overallRect.origin.x;
  double v29 = self->_overallRect.origin.y;
  double v30 = self->_overallRect.size.width;
  double v31 = self->_overallRect.size.height;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_layerTransform.tCGFloat x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_layerTransform.c = v4;
  *(_OWORD *)&self->_layerTransform.a = v3;
  long long v5 = *(_OWORD *)&a3->a;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_canvasTransform.tCGFloat x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_canvasTransform.c = v6;
  *(_OWORD *)&self->_canvasTransform.a = v5;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setCanvasTransform:(CGAffineTransform *)a3 layerTransform:(CGAffineTransform *)a4
{
  long long v4 = *(_OWORD *)&a3->a;
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_canvasTransform.tCGFloat x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_canvasTransform.c = v5;
  *(_OWORD *)&self->_canvasTransform.a = v4;
  long long v6 = *(_OWORD *)&a4->a;
  long long v7 = *(_OWORD *)&a4->c;
  *(_OWORD *)&self->_layerTransform.tCGFloat x = *(_OWORD *)&a4->tx;
  *(_OWORD *)&self->_layerTransform.c = v7;
  *(_OWORD *)&self->_layerTransform.a = v6;
}

- (CALayer)layer
{
  return self->_containingLayer;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (CGPath)path
{
  return self->_path;
}

- (TSUImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

@end