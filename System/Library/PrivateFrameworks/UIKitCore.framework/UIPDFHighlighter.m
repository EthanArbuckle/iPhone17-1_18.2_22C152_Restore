@interface UIPDFHighlighter
- (UIPDFHighlighter)init;
- (double)inset;
- (void)addAnimation:(id)a3;
- (void)addHighlightFor:(id)a3 to:(id)a4 animated:(BOOL)a5;
- (void)addHighlightLayerFor:(id)a3 atIndex:(unint64_t)a4 to:(id)a5 animated:(BOOL)a6;
- (void)addRectPath:(CGPath *)a3 toView:(id)a4 layer:(id)a5 rectangle:(id *)a6 upright:(BOOL)a7;
- (void)clear;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)makeTheBorderPath:(id)a3 layer:(id)a4 rectangle:(id *)a5 upright:(BOOL)a6;
- (void)makeTheClipPath:(id)a3 layer:(id)a4 rectangle:(id *)a5 upright:(BOOL)a6;
- (void)setInset:(double)a3;
- (void)setNeedsDisplay;
- (void)unhide;
@end

@implementation UIPDFHighlighter

- (UIPDFHighlighter)init
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)UIPDFHighlighter;
  v2 = [(UIPDFHighlighter *)&v5 init];
  if (v2)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = xmmword_186B9C430;
    long long v11 = unk_186B9C440;
    *(_OWORD *)v8 = xmmword_186B9C450;
    long long v9 = unk_186B9C460;
    *(_OWORD *)v6 = xmmword_186B9C470;
    long long v7 = unk_186B9C480;
    v2->_highlightColor = CGColorCreate(DeviceRGB, components);
    v2->_borderColor = CGColorCreate(DeviceRGB, v8);
    v2->_whiteColor = CGColorCreate(DeviceRGB, v6);
    CGColorSpaceRelease(DeviceRGB);
    [(UIPDFHighlighter *)v2 setInset:6.0];
    v2->_highLightLayers = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIPDFHighlighter;
  [(UIPDFHighlighter *)&v3 dealloc];
  [(NSMutableArray *)self->_highLightLayers removeAllObjects];

  CGPDFPageRelease(self->_page);
}

- (void)unhide
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  highLightLayers = self->_highLightLayers;
  uint64_t v3 = [(NSMutableArray *)highLightLayers countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(highLightLayers);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) setHidden:0];
      }
      uint64_t v4 = [(NSMutableArray *)highLightLayers countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addRectPath:(CGPath *)a3 toView:(id)a4 layer:(id)a5 rectangle:(id *)a6 upright:(BOOL)a7
{
  BOOL v7 = a7;
  double v11 = a6->var1.x;
  double y = a6->var1.y;
  double v13 = a6->var2.x;
  double v14 = a6->var2.y;
  double v15 = a6->var3.x;
  double v16 = a6->var3.y;
  objc_msgSend(a4, "convertPointFromPDFPageSpace:", a6->var0.x, a6->var0.y);
  double v18 = v17;
  double v20 = v19;
  objc_msgSend(a4, "convertPointFromPDFPageSpace:", v11, y);
  double v22 = v21;
  double v24 = v23;
  objc_msgSend(a4, "convertPointFromPDFPageSpace:", v13, v14);
  double v26 = v25;
  double v28 = v27;
  objc_msgSend(a4, "convertPointFromPDFPageSpace:", v15, v16);
  double v30 = v29;
  double v51 = v31;
  objc_msgSend(a5, "convertPoint:fromLayer:", objc_msgSend(a4, "layer"), v18, v20);
  CGFloat v33 = v32;
  double v35 = v34;
  objc_msgSend(a5, "convertPoint:fromLayer:", objc_msgSend(a4, "layer"), v22, v24);
  CGFloat v37 = v36;
  double v39 = v38;
  objc_msgSend(a5, "convertPoint:fromLayer:", objc_msgSend(a4, "layer"), v26, v28);
  double x = v40;
  CGFloat v42 = v41;
  objc_msgSend(a5, "convertPoint:fromLayer:", objc_msgSend(a4, "layer"), v30, v51);
  CGFloat v44 = v43;
  double v50 = v45;
  if (v7) {
    double v46 = 2.0;
  }
  else {
    double v46 = 0.0;
  }
  CGFloat v52 = v35;
  double v47 = v46 + v35;
  CGPathMoveToPoint(a3, 0, v33, v47);
  double v48 = v39 - v46;
  CGPathAddLineToPoint(a3, 0, v37, v48);
  if (v7)
  {
    CGPathAddArc(a3, 0, v37 + 2.0, v48, 2.0, -3.14159265, 1.57079633, 1);
    CGPathAddLineToPoint(a3, 0, x + -2.0, v42);
    CGPathAddArc(a3, 0, x + -2.0, v42 + -2.0, 2.0, 1.57079633, 0.0, 1);
    CGPathAddLineToPoint(a3, 0, v44, v50 + 2.0);
    CGPathAddArc(a3, 0, v44 + -2.0, v50 + 2.0, 2.0, 0.0, -1.14159265, 1);
    CGPathAddLineToPoint(a3, 0, v33 + 2.0, v52);
    CGPathAddArc(a3, 0, v33 + 2.0, v47, 2.0, -1.57079633, -3.14159265, 1);
  }
  else
  {
    CGPathAddLineToPoint(a3, 0, x, v42);
    CGPathAddLineToPoint(a3, 0, v44, v50 + 0.0);
    CGPathAddLineToPoint(a3, 0, v33 + 0.0, v52);
  }
}

- (void)makeTheClipPath:(id)a3 layer:(id)a4 rectangle:(id *)a5 upright:(BOOL)a6
{
  BOOL v6 = a6;
  Mutable = CGPathCreateMutable();
  [a4 setClipPath:Mutable];
  CGPoint var1 = a5->var1;
  v14[0] = a5->var0;
  v14[1] = var1;
  CGPoint var3 = a5->var3;
  v14[2] = a5->var2;
  v14[3] = var3;
  [(UIPDFHighlighter *)self addRectPath:Mutable toView:a3 layer:a4 rectangle:v14 upright:v6];
  CGPathRelease(Mutable);
}

- (void)makeTheBorderPath:(id)a3 layer:(id)a4 rectangle:(id *)a5 upright:(BOOL)a6
{
  BOOL v6 = a6;
  Mutable = CGPathCreateMutable();
  [a4 setBorderPath:Mutable];
  CGPoint var1 = a5->var1;
  v14[0] = a5->var0;
  v14[1] = var1;
  CGPoint var3 = a5->var3;
  v14[2] = a5->var2;
  v14[3] = var3;
  [(UIPDFHighlighter *)self addRectPath:Mutable toView:a3 layer:a4 rectangle:v14 upright:v6];
  CGPathRelease(Mutable);
}

- (void)addAnimation:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
  uint64_t v5 = (void *)MEMORY[0x1E4F29238];
  [a3 bounds];
  CGRect v9 = CGRectInset(v8, -10.0, -10.0);
  objc_msgSend(v4, "setFromValue:", objc_msgSend(v5, "valueWithCGRect:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height));
  BOOL v6 = (void *)MEMORY[0x1E4F29238];
  [a3 bounds];
  objc_msgSend(v4, "setToValue:", objc_msgSend(v6, "valueWithCGRect:"));
  [v4 setDuration:0.5];
  [a3 addAnimation:v4 forKey:0];
}

- (void)addHighlightLayerFor:(id)a3 atIndex:(unint64_t)a4 to:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  long long v41 = 0u;
  memset(&v40, 0, sizeof(v40));
  [(UIPDFHighlighter *)self inset];
  if (a3)
  {
    [a3 rectangleAtIndex:a4 scale:1.0 inset:-v11];
    long long v39 = 0u;
    memset(&v38, 0, sizeof(v38));
    [(UIPDFHighlighter *)self inset];
    [a3 rectangleAtIndex:a4 scale:1.0 inset:-(v12 + -1.0)];
  }
  else
  {
    long long v41 = 0u;
    memset(&v40, 0, sizeof(v40));
    [(UIPDFHighlighter *)self inset];
    memset(&v38, 0, sizeof(v38));
    long long v39 = 0u;
  }
  self->_enlargeFactor = 1.08;
  double v13 = objc_alloc_init(UIPDFHighlightLayer);
  [(NSMutableArray *)self->_highLightLayers addObject:v13];
  CATransform3DMakeScale(&v37, 1.0, -1.0, 1.0);
  CATransform3D v36 = v37;
  [(UIPDFHighlightLayer *)v13 setTransform:&v36];
  memset(&v35, 0, sizeof(v35));
  memset(&v34, 0, sizeof(v34));
  [a3 getBounds:&v35 transform:&v34 index:a4];
  CGAffineTransform v32 = v34;
  CGRect v42 = CGRectApplyAffineTransform(v35, &v32);
  double x = v42.origin.x;
  double y = v42.origin.y;
  double width = v42.size.width;
  double height = v42.size.height;
  objc_msgSend(a5, "convertRectFromPDFPageSpace:");
  CGFloat v17 = v43.origin.x;
  CGFloat v18 = v43.origin.y;
  CGFloat v19 = v43.size.width;
  CGFloat v20 = v43.size.height;
  double MidX = CGRectGetMidX(v43);
  v44.origin.double x = v17;
  v44.origin.double y = v18;
  v44.size.double width = v19;
  v44.size.double height = v20;
  double MidY = CGRectGetMidY(v44);
  [(UIPDFHighlighter *)self inset];
  CGFloat v24 = -v23;
  [(UIPDFHighlighter *)self inset];
  CGRect v45 = CGRectInset(v35, v24, -v25);
  CGAffineTransform v32 = v34;
  CGRect v46 = CGRectApplyAffineTransform(v45, &v32);
  objc_msgSend(a5, "convertRectFromPDFPageSpace:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
  CGRect v48 = CGRectIntegral(v47);
  -[UIPDFHighlightLayer setBounds:](v13, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v48.size.width, v48.size.height);
  -[UIPDFHighlightLayer setPosition:](v13, "setPosition:", MidX, MidY);
  [(UIPDFHighlightLayer *)v13 setShadowColor:[+[UIColor blackColor] CGColor]];
  -[UIPDFHighlightLayer setShadowOffset:](v13, "setShadowOffset:", 4.0, -4.0);
  LODWORD(v26) = 1061997773;
  [(UIPDFHighlightLayer *)v13 setShadowOpacity:v26];
  [(UIPDFHighlightLayer *)v13 setShadowRadius:3.0];
  [(UIPDFHighlightLayer *)v13 setBackgroundColor:[+[UIColor clearColor] CGColor]];
  [(UIPDFHighlightLayer *)v13 setDelegate:self];
  objc_msgSend((id)objc_msgSend(a5, "layer"), "addSublayer:", v13);
  [(UIPDFHighlightLayer *)v13 setNeedsDisplay];
  CGAffineTransform v32 = v34;
  IsIdentitdouble y = CGAffineTransformIsIdentity(&v32);
  CGAffineTransform v32 = v40;
  long long v33 = v41;
  [(UIPDFHighlighter *)self makeTheClipPath:a5 layer:v13 rectangle:&v32 upright:IsIdentity];
  CGAffineTransform v32 = v34;
  BOOL v28 = CGAffineTransformIsIdentity(&v32);
  CGAffineTransform v32 = v38;
  long long v33 = v39;
  [(UIPDFHighlighter *)self makeTheBorderPath:a5 layer:v13 rectangle:&v32 upright:v28];
  MutableCopyByTransformingPath = CGPathCreateMutableCopyByTransformingPath([(UIPDFHighlightLayer *)v13 clipPath], 0);
  [(UIPDFHighlightLayer *)v13 setShadowPath:MutableCopyByTransformingPath];
  CGPathRelease(MutableCopyByTransformingPath);
  [(UIPDFHighlightLayer *)v13 bounds];
  CGFloat v30 = (CGRectGetWidth(v49) / self->_pdfToViewScale - width * self->_enlargeFactor) * 0.5;
  [(UIPDFHighlightLayer *)v13 bounds];
  -[UIPDFHighlightLayer setOffset:](v13, "setOffset:", v30 - x, (CGRectGetHeight(v50) / self->_pdfToViewScale - height * self->_enlargeFactor) * 0.5 - y);
  if (v6) {
    [(UIPDFHighlighter *)self addAnimation:v13];
  }
}

- (void)addHighlightFor:(id)a3 to:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v9 = [a3 numberOfRectangles];
  if (v9)
  {
    uint64_t v10 = v9;
    double v11 = (CGPDFPage *)objc_msgSend((id)objc_msgSend(a4, "page"), "CGPage");
    self->_page = v11;
    CGPDFPageRetain(v11);
    objc_msgSend(a4, "convertRectFromPDFPageSpace:", 0.0, 0.0, 1.0, 1.0);
    uint64_t v12 = 0;
    self->_pdfToViewScale = v13;
    do
      [(UIPDFHighlighter *)self addHighlightLayerFor:a3 atIndex:v12++ to:a4 animated:v5];
    while (v10 != v12);
  }
}

- (void)setNeedsDisplay
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  highLightLayers = self->_highLightLayers;
  uint64_t v3 = [(NSMutableArray *)highLightLayers countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(highLightLayers);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) setNeedsDisplay];
      }
      uint64_t v4 = [(NSMutableArray *)highLightLayers countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  CGContextSaveGState(a4);
  CGContextAddPath(a4, (CGPathRef)[a3 clipPath]);
  CGContextClip(a4);
  CGContextSetFillColorWithColor(a4, [+[UIColor whiteColor] CGColor]);
  [a3 bounds];
  CGContextFillRect(a4, v11);
  CGContextSaveGState(a4);
  CGContextScaleCTM(a4, self->_pdfToViewScale * self->_enlargeFactor, self->_pdfToViewScale * self->_enlargeFactor);
  [a3 offset];
  CGFloat v8 = v7;
  [a3 offset];
  CGContextTranslateCTM(a4, v8, v9);
  CGContextDrawPDFPage(a4, self->_page);
  CGContextRestoreGState(a4);
  CGContextSetBlendMode(a4, kCGBlendModeMultiply);
  CGContextSetFillColorWithColor(a4, self->_highlightColor);
  [a3 bounds];
  CGRect v13 = CGRectInset(v12, 2.0, 2.0);
  CGContextFillRect(a4, v13);
  CGContextSetStrokeColorWithColor(a4, self->_borderColor);
  CGContextSetBlendMode(a4, kCGBlendModeNormal);
  CGContextAddPath(a4, (CGPathRef)[a3 borderPath]);
  CGContextSetLineWidth(a4, 1.0);
  CGContextStrokePath(a4);
  CGContextRestoreGState(a4);
}

- (void)clear
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  highLightLayers = self->_highLightLayers;
  uint64_t v4 = [(NSMutableArray *)highLightLayers countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(highLightLayers);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) removeFromSuperlayer];
      }
      uint64_t v5 = [(NSMutableArray *)highLightLayers countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->_highLightLayers removeAllObjects];
}

- (double)inset
{
  return self->inset;
}

- (void)setInset:(double)a3
{
  self->inset = a3;
}

@end