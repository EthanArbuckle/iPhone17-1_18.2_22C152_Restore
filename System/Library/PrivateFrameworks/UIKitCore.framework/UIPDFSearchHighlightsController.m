@interface UIPDFSearchHighlightsController
- (BOOL)hasSearchHighlights;
- (CGRect)unionFrom:(unint64_t)a3 to:(unint64_t)a4;
- (UIPDFSearchHighlightsController)initWithPageView:(id)a3;
- (id)hitTest:(CGPoint)a3;
- (unint64_t)indexOfColumnBreakStartingAt:(unint64_t)a3;
- (void)_addAnimation2:(id)a3;
- (void)_addAnimation:(id)a3;
- (void)addLayer:(CGRect)a3 path:(CGPath *)a4 shadowPath:(CGPath *)a5 animated:(BOOL)a6;
- (void)addSearchHighlightForRotatedSelection:(id)a3 animated:(BOOL)a4;
- (void)addSearchHighlightForSelection:(id)a3 animated:(BOOL)a4;
- (void)clearSearchHighlights;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)makeType1Path:(CGPath *)a3 shadowPath:(CGPath *)a4;
- (void)makeType1Shadow:(CGPath *)a3 rect:(CGRect)a4 inset:(CGPoint)a5;
- (void)makeType2Path:(CGPath *)a3 to:(unint64_t)a4 shadowPath:(CGPath *)a5;
- (void)makeType2Shadow:(CGPath *)a3 rect:(CGRect)a4;
- (void)makeType3Path:(CGPath *)a3 from:(unint64_t)a4 to:(unint64_t)a5 shadowPath:(CGPath *)a6;
- (void)makeType4Path:(CGPath *)a3 from:(unint64_t)a4 to:(unint64_t)a5 shadowPath:(CGPath *)a6;
- (void)pageDidRender:(id)a3;
- (void)setNeedsDisplay;
@end

@implementation UIPDFSearchHighlightsController

- (UIPDFSearchHighlightsController)initWithPageView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)UIPDFSearchHighlightsController;
  v4 = [(UIPDFSearchHighlightsController *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_pageView = (UIPDFPageView *)a3;
    v4->_searchHighlightLayers = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = xmmword_186B9C410;
    long long v14 = unk_186B9C420;
    v5->_highlightColor = CGColorCreate(DeviceRGB, components);
    *(_OWORD *)v11 = xmmword_186B9C450;
    long long v12 = unk_186B9C460;
    v5->_borderColor = CGColorCreate(DeviceRGB, v11);
    *(_OWORD *)v9 = xmmword_186B9C450;
    long long v10 = unk_186B9C460;
    v5->_shadowColor = CGColorCreate(DeviceRGB, v9);
    CGColorSpaceRelease(DeviceRGB);
    v5->_pageRendered = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v5, sel_pageDidRender_, @"kUIPDFContentLayerAdded", 0);
  }
  return v5;
}

- (void)dealloc
{
  [(UIPDFSearchHighlightsController *)self clearSearchHighlights];

  CGColorRelease(self->_highlightColor);
  CGColorRelease(self->_shadowColor);
  CGColorRelease(self->_borderColor);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)UIPDFSearchHighlightsController;
  [(UIPDFSearchHighlightsController *)&v3 dealloc];
}

- (void)pageDidRender:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (UIPDFPageView *)[a3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v4 == self->_pageView)
  {
    self->_pageRendered = 1;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    searchHighlightLayers = self->_searchHighlightLayers;
    uint64_t v6 = [(NSMutableArray *)searchHighlightLayers countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(searchHighlightLayers);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setHidden:0];
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)searchHighlightLayers countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)clearSearchHighlights
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  searchHighlightLayers = self->_searchHighlightLayers;
  if (searchHighlightLayers)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v4 = [(NSMutableArray *)searchHighlightLayers countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(searchHighlightLayers);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) removeFromSuperlayer];
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)searchHighlightLayers countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
    [(NSMutableArray *)self->_searchHighlightLayers removeAllObjects];
  }
}

- (BOOL)hasSearchHighlights
{
  searchHighlightLayers = self->_searchHighlightLayers;
  if (searchHighlightLayers) {
    LOBYTE(searchHighlightLayers) = [(NSMutableArray *)searchHighlightLayers count] != 0;
  }
  return (char)searchHighlightLayers;
}

- (id)hitTest:(CGPoint)a3
{
  objc_super v3 = -[CALayer hitTest:]([(UIView *)self->_pageView layer], "hitTest:", a3.x, a3.y);
  return (id)[(CALayer *)v3 valueForKey:@"selection"];
}

- (void)_addAnimation:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
  uint64_t v5 = (void *)MEMORY[0x1E4F29238];
  [a3 bounds];
  CGRect v9 = CGRectInset(v8, -10.0, -10.0);
  objc_msgSend(v4, "setFromValue:", objc_msgSend(v5, "valueWithCGRect:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height));
  uint64_t v6 = (void *)MEMORY[0x1E4F29238];
  [a3 bounds];
  objc_msgSend(v4, "setToValue:", objc_msgSend(v6, "valueWithCGRect:"));
  [v4 setDuration:0.5];
  [a3 addAnimation:v4 forKey:0];
}

- (void)_addAnimation2:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  long long v5 = 0uLL;
  memset(&v8, 0, sizeof(v8));
  if (a3)
  {
    [a3 transform];
    long long v5 = 0uLL;
  }
  *(_OWORD *)&v7.m41 = v5;
  *(_OWORD *)&v7.m43 = v5;
  *(_OWORD *)&v7.m31 = v5;
  *(_OWORD *)&v7.m33 = v5;
  *(_OWORD *)&v7.m21 = v5;
  *(_OWORD *)&v7.m23 = v5;
  *(_OWORD *)&v7.m11 = v5;
  *(_OWORD *)&v7.m13 = v5;
  CATransform3D v6 = v8;
  CATransform3DScale(&v7, &v6, 1.08, 1.08, 1.0);
  CATransform3D v6 = v7;
  objc_msgSend(v4, "setFromValue:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCATransform3D:", &v6));
  CATransform3D v6 = v8;
  objc_msgSend(v4, "setToValue:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCATransform3D:", &v6));
  [v4 setDuration:0.4];
  [a3 addAnimation:v4 forKey:0];
}

- (void)addSearchHighlightForRotatedSelection:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [a3 numberOfRectangles];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    double v10 = 0.5;
    do
    {
      memset(&v29, 0, sizeof(v29));
      memset(&v28, 0, sizeof(v28));
      [a3 getBounds:&v28 transform:&v29 index:v9];
      -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size);
      CGRect v31 = CGRectInset(v30, -2.0, -2.0);
      double x = v31.origin.x;
      double y = v31.origin.y;
      double width = v31.size.width;
      double height = v31.size.height;
      uint64_t v15 = (void *)[MEMORY[0x1E4F39BE8] layer];
      objc_msgSend(v15, "setBounds:", x, y, width, height);
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.double width = width;
      v32.size.double height = height;
      double MidX = CGRectGetMidX(v32);
      v33.origin.double x = x;
      v33.origin.double y = y;
      v33.size.double width = width;
      v33.size.double height = height;
      double MidY = CGRectGetMidY(v33);
      CGAffineTransform v27 = v29;
      if (!CGAffineTransformIsIdentity(&v27))
      {
        CGAffineTransform v27 = v29;
        CPRotationDegreesFromTransform(&v27.a);
        CGAffineTransform v27 = v29;
        CGFloat v19 = v18 * -3.14159265 / 180.0;
        CGRect v34 = CGRectApplyAffineTransform(v28, &v27);
        -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
        CGFloat v20 = v35.origin.x;
        CGFloat v21 = v35.origin.y;
        CGFloat v22 = v35.size.width;
        CGFloat v23 = v35.size.height;
        double MidX = CGRectGetMidX(v35);
        v36.origin.double x = v20;
        v36.origin.double y = v21;
        v36.size.double width = v22;
        v36.size.double height = v23;
        double v10 = 0.5;
        double MidY = CGRectGetMidY(v36);
        CATransform3DMakeRotation(&v26, v19, 0.0, 0.0, 1.0);
        CATransform3D v25 = v26;
        [v15 setTransform:&v25];
      }
      objc_msgSend(v15, "setPosition:", MidX, MidY + v10);
      [v15 setBackgroundColor:self->_highlightColor];
      LODWORD(v24) = 1.0;
      [v15 setOpacity:v24];
      [v15 setCornerRadius:3.0];
      [v15 setBorderWidth:0.0];
      [v15 setHidden:!self->_pageRendered];
      [v15 setValue:a3 forKey:@"selection"];
      [v15 setDelegate:self];
      [v15 setNeedsLayout];
      [v15 setNeedsDisplay];
      [(NSMutableArray *)self->_searchHighlightLayers addObject:v15];
      [(CALayer *)[(UIView *)self->_pageView layer] addSublayer:v15];
      if (v4) {
        [(UIPDFSearchHighlightsController *)self _addAnimation:v15];
      }
      ++v9;
    }
    while (v8 != v9);
  }
}

- (void)addLayer:(CGRect)a3 path:(CGPath *)a4 shadowPath:(CGPath *)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v14 = (void *)[MEMORY[0x1E4F39C88] layer];
  objc_msgSend(v14, "setBounds:", x, y, width, height);
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  double MidX = CGRectGetMidX(v20);
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  objc_msgSend(v14, "setPosition:", MidX, CGRectGetMidY(v21));
  [v14 setFillColor:self->_highlightColor];
  LODWORD(v16) = 0.25;
  [v14 setOpacity:v16];
  [v14 setStrokeColor:self->_borderColor];
  [v14 setValue:self->_selection forKey:@"selection"];
  [v14 setPath:a4];
  [v14 setHidden:!self->_pageRendered];
  if (a5)
  {
    [v14 setShadowPath:a5];
    objc_msgSend(v14, "setShadowOffset:", 5.0, 5.0);
    LODWORD(v17) = 1.0;
    [v14 setShadowOpacity:v17];
    objc_msgSend(v14, "setShadowColor:", -[UIColor CGColor](+[UIColor blackColor](UIColor, "blackColor"), "CGColor"));
  }
  if (v6) {
    [(UIPDFSearchHighlightsController *)self _addAnimation2:v14];
  }
  [(CALayer *)[(UIView *)self->_pageView layer] addSublayer:v14];
  searchHighlightLayers = self->_searchHighlightLayers;
  [(NSMutableArray *)searchHighlightLayers addObject:v14];
}

- (unint64_t)indexOfColumnBreakStartingAt:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_rectangles count];
  unint64_t v6 = v5;
  if (v5 - 1 > a3)
  {
    unint64_t v7 = v5;
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", a3), "CGRectValue");
    double MinY = CGRectGetMinY(v13);
    unint64_t v9 = a3 + 1;
    do
    {
      unint64_t v6 = v9;
      if (v9 >= v7) {
        break;
      }
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", v9), "CGRectValue");
      CGFloat v10 = CGRectGetMinY(v14);
      unint64_t v9 = v6 + 1;
      BOOL v11 = v10 < MinY;
      double MinY = v10;
    }
    while (!v11);
  }
  return v6;
}

- (CGRect)unionFrom:(unint64_t)a3 to:(unint64_t)a4
{
  unint64_t v7 = [(NSMutableArray *)self->_rectangles count];
  if (v7 > a3 && v7 > a4 && a3 <= a4)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", a3), "CGRectValue");
    CGFloat x = v16;
    CGFloat y = v17;
    CGFloat width = v18;
    CGFloat height = v19;
    if (a3 < a4)
    {
      unint64_t v20 = a3 + 1;
      do
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", v20), "CGRectValue");
        v28.origin.CGFloat x = v21;
        v28.origin.CGFloat y = v22;
        v28.size.CGFloat width = v23;
        v28.size.CGFloat height = v24;
        v25.origin.CGFloat x = x;
        v25.origin.CGFloat y = y;
        v25.size.CGFloat width = width;
        v25.size.CGFloat height = height;
        CGRect v26 = CGRectUnion(v25, v28);
        CGFloat x = v26.origin.x;
        CGFloat y = v26.origin.y;
        CGFloat width = v26.size.width;
        CGFloat height = v26.size.height;
        ++v20;
      }
      while (v20 <= a4);
    }
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)makeType1Shadow:(CGPath *)a3 rect:(CGRect)a4 inset:(CGPoint)a5
{
  double x = a5.x;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat v9 = a4.origin.x;
  CGFloat MinX = CGRectGetMinX(a4);
  v17.origin.double x = v9;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v17);
  v18.origin.double x = v9;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v18);
  v19.origin.double x = v9;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v19);
  CGPathMoveToPoint(a3, 0, MinX, MaxY);
  CGPathAddLineToPoint(a3, 0, MinX, MaxY + -5.0);
  CGPathAddLineToPoint(a3, 0, x + -5.0, MaxY + -5.0);
  CGPathAddLineToPoint(a3, 0, x + -5.0, a5.y + -5.0);
  CGPathAddLineToPoint(a3, 0, MaxX + -5.0, a5.y + -5.0);
  CGPathAddLineToPoint(a3, 0, MaxX + -5.0, MinY);
  CGPathAddLineToPoint(a3, 0, MaxX, MinY);
  CGPathAddLineToPoint(a3, 0, MaxX, a5.y);
  CGPathAddLineToPoint(a3, 0, a5.x, a5.y);
  CGPathAddLineToPoint(a3, 0, a5.x, MaxY);
  CGPathCloseSubpath(a3);
}

- (void)makeType2Shadow:(CGPath *)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat MinX = CGRectGetMinX(a4);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v16);
  CGPathMoveToPoint(a3, 0, MinX, MaxY);
  CGPathAddLineToPoint(a3, 0, MinX, MaxY + -5.0);
  CGPathAddLineToPoint(a3, 0, MaxX + -5.0, MaxY + -5.0);
  CGPathAddLineToPoint(a3, 0, MaxX + -5.0, MinY);
  CGPathAddLineToPoint(a3, 0, MaxX, MinY);
  CGPathAddLineToPoint(a3, 0, MaxX, MaxY);
  CGPathCloseSubpath(a3);
}

- (void)makeType1Path:(CGPath *)a3 shadowPath:(CGPath *)a4
{
  uint64_t v7 = [(NSMutableArray *)self->_rectangles count];
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", 0), "CGRectValue");
  CGFloat v9 = v8;
  CGFloat v46 = v8;
  CGFloat v11 = v10;
  CGFloat recta = v10;
  CGFloat v13 = v12;
  CGFloat v33 = v14;
  CGFloat v35 = v12;
  CGFloat v15 = v14;
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", v7 - 1), "CGRectValue");
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  [(UIPDFSearchHighlightsController *)self unionFrom:1 to:v7 - 2];
  v61.origin.double x = v24;
  CGFloat v42 = v25;
  CGFloat v44 = v24;
  v61.origin.double y = v25;
  v61.size.double width = v26;
  CGFloat v37 = v27;
  CGFloat v38 = v26;
  v61.size.double height = v27;
  v51.origin.double x = v9;
  v51.origin.double y = v11;
  v51.size.double width = v13;
  v51.size.double height = v15;
  CGRect v52 = CGRectUnion(v51, v61);
  v62.origin.double x = v17;
  v62.origin.double y = v19;
  v62.size.double width = v21;
  v62.size.double height = v23;
  CGRect v53 = CGRectUnion(v52, v62);
  double x = v53.origin.x;
  double y = v53.origin.y;
  double width = v53.size.width;
  double height = v53.size.height;
  double MinX = CGRectGetMinX(v53);
  v54.origin.double x = v17;
  v54.origin.double y = v19;
  v54.size.double width = v21;
  v54.size.double height = v23;
  double MaxX = CGRectGetMaxX(v54);
  v55.origin.double x = v46;
  v55.origin.double y = recta;
  v55.size.double height = v33;
  v55.size.double width = v35;
  double v36 = CGRectGetMinX(v55);
  v56.origin.double x = x;
  v56.origin.double y = y;
  v56.size.double width = width;
  v56.size.double height = height;
  double v34 = CGRectGetMaxX(v56);
  v57.origin.double x = x;
  v57.origin.double y = y;
  v57.size.double width = width;
  v57.size.double height = height;
  double rect = CGRectGetMinY(v57);
  v58.origin.double x = v44;
  v58.origin.double y = v42;
  v58.size.double width = v38;
  v58.size.double height = v37;
  double MinY = CGRectGetMinY(v58);
  v59.origin.double x = v44;
  v59.origin.double y = v42;
  v59.size.double width = v38;
  v59.size.double height = v37;
  double MaxY = CGRectGetMaxY(v59);
  v60.origin.double x = x;
  v60.origin.double y = y;
  v60.size.double width = width;
  v60.size.double height = height;
  double v43 = CGRectGetMaxY(v60);
  -[UIPDFSearchHighlightsController makeType1Shadow:rect:inset:](self, "makeType1Shadow:rect:inset:", a4, x, y, width, height, MaxX, MaxY);
  double v39 = vabdd_f64(v34, MaxX);
  double v45 = vabdd_f64(MinX, v36);
  if (v45 <= 4.0)
  {
    CGPathMoveToPoint(a3, 0, MinX, MinY);
  }
  else
  {
    CGPathMoveToPoint(a3, 0, MinX + 4.0, MinY);
    CGPathAddArc(a3, 0, v36 + -4.0, MinY + -4.0, 4.0, 1.57079633, 0.0, 1);
  }
  CGPathAddArc(a3, 0, v36 + 4.0, rect + 4.0, 4.0, 3.14159265, -1.57079633, 0);
  CGPathAddArc(a3, 0, v34 + -4.0, rect + 4.0, 4.0, -1.57079633, 0.0, 0);
  if (v39 > 4.0)
  {
    CGPathAddArc(a3, 0, v34 + -4.0, MaxY + -4.0, 4.0, 0.0, 1.57079633, 0);
    CGPathAddArc(a3, 0, MaxX + 4.0, MaxY + 4.0, 4.0, -1.57079633, 3.14159265, 1);
  }
  CGPathAddArc(a3, 0, MaxX + -4.0, v43 + -4.0, 4.0, 0.0, 1.57079633, 0);
  CGPathAddArc(a3, 0, MinX + 4.0, v43 + -4.0, 4.0, 1.57079633, -3.14159265, 0);
  if (v45 > 4.0) {
    CGPathAddArc(a3, 0, MinX + 4.0, MinY + 4.0, 4.0, 3.14159265, -1.57079633, 0);
  }
  CGPathCloseSubpath(a3);
}

- (void)makeType2Path:(CGPath *)a3 to:(unint64_t)a4 shadowPath:(CGPath *)a5
{
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", 0), "CGRectValue");
  CGFloat v10 = v9;
  CGFloat rect_8a = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [(UIPDFSearchHighlightsController *)self unionFrom:1 to:a4];
  v47.origin.CGFloat x = v17;
  CGFloat recta = v17;
  v47.origin.CGFloat y = v18;
  CGFloat v31 = v19;
  CGFloat v32 = v18;
  v47.size.CGFloat width = v19;
  v47.size.CGFloat height = v20;
  CGFloat v30 = v20;
  v39.origin.CGFloat x = v10;
  v39.origin.CGFloat y = v12;
  v39.size.CGFloat width = v14;
  v39.size.CGFloat height = v16;
  CGRect v40 = CGRectUnion(v39, v47);
  CGFloat x = v40.origin.x;
  CGFloat y = v40.origin.y;
  CGFloat width = v40.size.width;
  CGFloat height = v40.size.height;
  -[UIPDFSearchHighlightsController makeType2Shadow:rect:](self, "makeType2Shadow:rect:", a5);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v41);
  v42.origin.CGFloat x = rect_8a;
  v42.origin.CGFloat y = v12;
  v42.size.CGFloat width = v14;
  v42.size.CGFloat height = v16;
  double v26 = CGRectGetMinX(v42);
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double rect_8 = CGRectGetMaxX(v43);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v44);
  v45.origin.CGFloat x = recta;
  v45.size.CGFloat width = v31;
  v45.origin.CGFloat y = v32;
  v45.size.CGFloat height = v30;
  double v27 = CGRectGetMinY(v45);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double rect = CGRectGetMaxY(v46);
  double v28 = vabdd_f64(MinX, v26);
  if (v28 <= 4.0)
  {
    CGPathMoveToPoint(a3, 0, MinX, v27);
    double v29 = MinX + 4.0;
  }
  else
  {
    double v29 = MinX + 4.0;
    CGPathMoveToPoint(a3, 0, v29, v27);
    CGPathAddArc(a3, 0, v26 + -4.0, v27 + -4.0, 4.0, 1.57079633, 0.0, 1);
  }
  CGPathAddArc(a3, 0, v26 + 4.0, MinY + 4.0, 4.0, 3.14159265, -1.57079633, 0);
  CGPathAddArc(a3, 0, rect_8 + -4.0, MinY + 4.0, 4.0, -1.57079633, 0.0, 0);
  CGPathAddArc(a3, 0, rect_8 + -4.0, rect + -4.0, 4.0, 0.0, 1.57079633, 0);
  CGPathAddArc(a3, 0, v29, rect + -4.0, 4.0, 1.57079633, -3.14159265, 0);
  if (v28 > 4.0) {
    CGPathAddArc(a3, 0, v29, v27 + 4.0, 4.0, 3.14159265, -1.57079633, 0);
  }
  CGPathCloseSubpath(a3);
}

- (void)makeType3Path:(CGPath *)a3 from:(unint64_t)a4 to:(unint64_t)a5 shadowPath:(CGPath *)a6
{
  [(UIPDFSearchHighlightsController *)self unionFrom:a4 to:a5];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  -[UIPDFSearchHighlightsController makeType2Shadow:rect:](self, "makeType2Shadow:rect:", a6);
  v26.origin.CGFloat x = v10;
  v26.origin.CGFloat y = v12;
  v26.size.CGFloat width = v14;
  v26.size.CGFloat height = v16;
  double MinX = CGRectGetMinX(v26);
  v27.origin.CGFloat x = v10;
  v27.origin.CGFloat y = v12;
  v27.size.CGFloat width = v14;
  v27.size.CGFloat height = v16;
  double MinY = CGRectGetMinY(v27);
  v28.origin.CGFloat x = v10;
  v28.origin.CGFloat y = v12;
  v28.size.CGFloat width = v14;
  v28.size.CGFloat height = v16;
  double MaxX = CGRectGetMaxX(v28);
  v29.origin.CGFloat x = v10;
  v29.origin.CGFloat y = v12;
  v29.size.CGFloat width = v14;
  v29.size.CGFloat height = v16;
  double v17 = CGRectGetMinY(v29);
  v30.origin.CGFloat x = v10;
  v30.origin.CGFloat y = v12;
  v30.size.CGFloat width = v14;
  v30.size.CGFloat height = v16;
  double v23 = CGRectGetMaxX(v30);
  v31.origin.CGFloat x = v10;
  v31.origin.CGFloat y = v12;
  v31.size.CGFloat width = v14;
  v31.size.CGFloat height = v16;
  double MaxY = CGRectGetMaxY(v31);
  v32.origin.CGFloat x = v10;
  v32.origin.CGFloat y = v12;
  v32.size.CGFloat width = v14;
  v32.size.CGFloat height = v16;
  double v21 = CGRectGetMinX(v32);
  v33.origin.CGFloat x = v10;
  v33.origin.CGFloat y = v12;
  v33.size.CGFloat width = v14;
  v33.size.CGFloat height = v16;
  double v19 = CGRectGetMaxY(v33);
  CGPathMoveToPoint(a3, 0, MinX + 4.0, MinY);
  CGPathAddArc(a3, 0, MaxX + -4.0, v17 + 4.0, 4.0, -1.57079633, 0.0, 0);
  CGPathAddArc(a3, 0, v23 + -4.0, MaxY + -4.0, 4.0, 0.0, 1.57079633, 0);
  CGPathAddArc(a3, 0, v21 + 4.0, v19 + -4.0, 4.0, 1.57079633, -3.14159265, 0);
  CGPathAddArc(a3, 0, MinX + 4.0, MinY + 4.0, 4.0, 3.14159265, -1.57079633, 0);
  CGPathCloseSubpath(a3);
}

- (void)makeType4Path:(CGPath *)a3 from:(unint64_t)a4 to:(unint64_t)a5 shadowPath:(CGPath *)a6
{
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", a5), "CGRectValue");
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [(UIPDFSearchHighlightsController *)self unionFrom:a4 to:a5 - 1];
  CGFloat v39 = v20;
  CGFloat v40 = v19;
  CGFloat v37 = v22;
  CGFloat v38 = v21;
  CGFloat v23 = *MEMORY[0x1E4F1DB20];
  CGFloat v24 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  v43.origin.double x = v12;
  v43.origin.double y = v14;
  v43.size.double width = v16;
  v43.size.double height = v18;
  v52.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB20];
  v52.origin.double y = v24;
  v52.size.double width = v25;
  v52.size.double height = v26;
  if (!CGRectEqualToRect(v43, v52))
  {
    v44.origin.double y = v39;
    v44.origin.double x = v40;
    v44.size.double height = v37;
    v44.size.double width = v38;
    v53.origin.double x = v23;
    v53.origin.double y = v24;
    v53.size.double width = v25;
    v53.size.double height = v26;
    if (!CGRectEqualToRect(v44, v53))
    {
      v45.origin.double x = v12;
      v45.origin.double y = v14;
      v45.size.double width = v16;
      v45.size.double height = v18;
      v54.origin.double y = v39;
      v54.origin.double x = v40;
      v54.size.double height = v37;
      v54.size.double width = v38;
      CGRect v46 = CGRectUnion(v45, v54);
      double x = v46.origin.x;
      double y = v46.origin.y;
      double width = v46.size.width;
      double height = v46.size.height;
      double MinX = CGRectGetMinX(v46);
      v47.origin.double x = v12;
      v47.origin.double y = v14;
      v47.size.double width = v16;
      v47.size.double height = v18;
      double MaxX = CGRectGetMaxX(v47);
      v48.origin.double x = x;
      v48.origin.double y = y;
      v48.size.double width = width;
      v48.size.double height = height;
      double v32 = CGRectGetMaxX(v48);
      v49.origin.double x = x;
      v49.origin.double y = y;
      v49.size.double width = width;
      v49.size.double height = height;
      double MinY = CGRectGetMinY(v49);
      v50.origin.double y = v39;
      v50.origin.double x = v40;
      v50.size.double height = v37;
      v50.size.double width = v38;
      double MaxY = CGRectGetMaxY(v50);
      v51.origin.double x = x;
      v51.origin.double y = y;
      v51.size.double width = width;
      v51.size.double height = height;
      double v41 = CGRectGetMaxY(v51);
      -[UIPDFSearchHighlightsController makeType1Shadow:rect:inset:](self, "makeType1Shadow:rect:inset:", a6, x, y, width, height, MaxX, MaxY);
      CGPathMoveToPoint(a3, 0, MinX + 4.0, MinY);
      CGFloat v35 = MinY + 4.0;
      CGPathAddArc(a3, 0, v32 + -4.0, v35, 4.0, -1.57079633, 0.0, 0);
      CGPathAddArc(a3, 0, v32 + -4.0, MaxY + -4.0, 4.0, 0.0, 1.57079633, 0);
      CGPathAddArc(a3, 0, MaxX + 4.0, MaxY + 4.0, 4.0, -1.57079633, 3.14159265, 1);
      CGPathAddArc(a3, 0, MaxX + -4.0, v41 + -4.0, 4.0, 0.0, 1.57079633, 0);
      CGPathAddArc(a3, 0, MinX + 4.0, v41 + -4.0, 4.0, 1.57079633, -3.14159265, 0);
      CGPathAddArc(a3, 0, MinX + 4.0, v35, 4.0, 3.14159265, -1.57079633, 0);
      CGPathCloseSubpath(a3);
    }
  }
}

- (void)addSearchHighlightForSelection:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [a3 numberOfRectangles];
  if (v7)
  {
    unint64_t v8 = v7;
    long long v34 = 0u;
    long long v35 = 0u;
    memset(&v33, 0, sizeof(v33));
    [a3 getBounds:&v34 transform:&v33 index:0];
    if (v8 >= 3 && (CGAffineTransform v32 = v33, CGAffineTransformIsIdentity(&v32)))
    {
      self->_rectangles = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
      -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", v34, v35);
      *(void *)&long long v34 = v9;
      *((void *)&v34 + 1) = v10;
      *(void *)&long long v35 = v11;
      *((void *)&v35 + 1) = v12;
      -[NSMutableArray addObject:](self->_rectangles, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:"));
      self->_selection = (UIPDFSelection *)a3;
      for (uint64_t i = 1; i != v8; ++i)
      {
        [a3 getBounds:&v34 transform:&v33 index:i];
        -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", v34, v35);
        *(CGFloat *)&long long v34 = v36.origin.x;
        *((void *)&v34 + 1) = *(void *)&v36.origin.y;
        *(CGFloat *)&long long v35 = v36.size.width;
        *((void *)&v35 + 1) = *(void *)&v36.size.height;
        CGRect v37 = CGRectInset(v36, -2.0, -2.0);
        *(CGFloat *)&long long v34 = v37.origin.x;
        *((void *)&v34 + 1) = *(void *)&v37.origin.y;
        *(CGFloat *)&long long v35 = v37.size.width;
        *((void *)&v35 + 1) = *(void *)&v37.size.height;
        -[NSMutableArray addObject:](self->_rectangles, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:"));
      }
      [a3 bounds];
      -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:");
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      unint64_t v22 = [(UIPDFSearchHighlightsController *)self indexOfColumnBreakStartingAt:0];
      Mutable = CGPathCreateMutable();
      CGFloat v24 = CGPathCreateMutable();
      if (v22 == v8)
      {
        [(UIPDFSearchHighlightsController *)self makeType1Path:Mutable shadowPath:v24];
        -[UIPDFSearchHighlightsController addLayer:path:shadowPath:animated:](self, "addLayer:path:shadowPath:animated:", Mutable, v24, v4, v15, v17, v19, v21);
        CGPathRelease(Mutable);
        CGFloat v25 = v24;
      }
      else
      {
        [(UIPDFSearchHighlightsController *)self makeType2Path:Mutable to:v22 - 1 shadowPath:v24];
        -[UIPDFSearchHighlightsController addLayer:path:shadowPath:animated:](self, "addLayer:path:shadowPath:animated:", Mutable, v24, v4, v15, v17, v19, v21);
        CGPathRelease(Mutable);
        CGPathRelease(v24);
        unint64_t v26 = [(UIPDFSearchHighlightsController *)self indexOfColumnBreakStartingAt:v22];
        if (v26 >= v8)
        {
          unint64_t v27 = v22;
        }
        else
        {
          do
          {
            unint64_t v27 = v26;
            CGRect v28 = CGPathCreateMutable();
            CGRect v29 = CGPathCreateMutable();
            [(UIPDFSearchHighlightsController *)self makeType3Path:v28 from:v22 to:v27 - 1 shadowPath:v29];
            -[UIPDFSearchHighlightsController addLayer:path:shadowPath:animated:](self, "addLayer:path:shadowPath:animated:", v28, v29, v4, v15, v17, v19, v21);
            CGPathRelease(v28);
            CGPathRelease(v29);
            unint64_t v26 = [(UIPDFSearchHighlightsController *)self indexOfColumnBreakStartingAt:v27];
            unint64_t v22 = v27;
          }
          while (v26 < v8);
        }
        CGRect v30 = CGPathCreateMutable();
        CGMutablePathRef v31 = CGPathCreateMutable();
        [(UIPDFSearchHighlightsController *)self makeType4Path:v30 from:v27 to:v8 - 1 shadowPath:v31];
        -[UIPDFSearchHighlightsController addLayer:path:shadowPath:animated:](self, "addLayer:path:shadowPath:animated:", v30, v31, v4, v15, v17, v19, v21);
        CGPathRelease(v30);
        CGFloat v25 = v31;
      }
      CGPathRelease(v25);
      [(NSMutableArray *)self->_rectangles removeAllObjects];
    }
    else
    {
      [(UIPDFSearchHighlightsController *)self addSearchHighlightForRotatedSelection:a3 animated:v4];
    }
  }
}

- (void)setNeedsDisplay
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  searchHighlightLayers = self->_searchHighlightLayers;
  uint64_t v3 = [(NSMutableArray *)searchHighlightLayers countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(searchHighlightLayers);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v7 setNeedsLayout];
        [v7 setNeedsDisplay];
      }
      uint64_t v4 = [(NSMutableArray *)searchHighlightLayers countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  uint64_t v4 = [(UIView *)self->_pageView superview];
  if (v4)
  {
    uint64_t v5 = [(UIView *)v4 layer];
    if (v5)
    {
      [(CALayer *)v5 transform];
      [+[UIScreen mainScreen] scale];
      [a3 setContentsScale:v7 * v6];
    }
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v6 = [a3 valueForKey:@"selection"];
  if (v6)
  {
    double v7 = (void *)v6;
    CGContextSetFillColorWithColor(a4, self->_borderColor);
    if ([v7 CGSelection])
    {
      uint64_t Length = CGPDFSelectionGetLength();
      if (Length >= 1)
      {
        uint64_t v9 = Length;
        for (uint64_t i = 0; i != v9; ++i)
        {
          memset(&glyphs[1], 0, 48);
          CGPDFSelectionGetTextMatrixAtIndex();
          CGFontAtIndedouble x = (CGFont *)CGPDFSelectionGetCGFontAtIndex();
          if (CGFontAtIndex)
          {
            CGContextSetFont(a4, CGFontAtIndex);
            CGContextSetFontSize(a4, 1.0);
            glyphs[0] = 0;
            glyphs[0] = CGPDFSelectionGetGlyphAtIndex();
            -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", *(double *)&glyphs[17] + *(double *)&glyphs[1] * 0.0 + *(double *)&glyphs[9] * 0.0, *(double *)&glyphs[21] + *(double *)&glyphs[5] * 0.0 + *(double *)&glyphs[13] * 0.0, 1.0, 1.0);
            CGFloat v13 = v12;
            CGFloat v15 = v14;
            CGAffineTransform v18 = *(CGAffineTransform *)&glyphs[1];
            CGAffineTransformScale(&v19, &v18, v17, -v16);
            *(CGAffineTransform *)&glyphs[1] = v19;
            CGContextSetTextMatrix(a4, &v19);
            if (glyphs[0]) {
              CGContextShowGlyphsAtPoint(a4, v13, v15, glyphs, 1uLL);
            }
          }
        }
      }
    }
  }
}

@end