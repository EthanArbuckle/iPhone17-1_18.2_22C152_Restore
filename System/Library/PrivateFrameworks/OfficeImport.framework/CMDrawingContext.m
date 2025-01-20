@interface CMDrawingContext
- (CGAffineTransform)currentTransform;
- (CGContext)_cgContext;
- (CGRect)_transformRect:(CGRect)a3 withTransform:(id)a4;
- (CGRect)frame;
- (CGRect)pdfFrame;
- (CGRect)transformRectToGroup:(CGRect)a3;
- (CGRect)transformRectToPage:(CGRect)a3;
- (CMDrawableMapper)mapper;
- (CMDrawingContext)initWithFrame:(CGRect)a3;
- (float)currentScaleFactor;
- (id)copyPDF;
- (void)_addTransform:(id)a3;
- (void)_applyTransform:(id)a3;
- (void)_closeContext;
- (void)_copyCGContext;
- (void)_playbackActions;
- (void)_restoreLastTransform;
- (void)addDebugPath:(CGPath *)a3;
- (void)addPath:(CGPath *)a3;
- (void)addTransform:(id)a3;
- (void)dealloc;
- (void)restoreLastTransform;
- (void)setFillColor:(CGColor *)a3;
- (void)setFillImage:(CGImage *)a3;
- (void)setLineDash:(id)a3;
- (void)setLineWidth:(float)a3;
- (void)setMapper:(id)a3;
- (void)setStrokeColor:(CGColor *)a3;
@end

@implementation CMDrawingContext

- (CMDrawingContext)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)CMDrawingContext;
  v7 = [(CMDrawingContext *)&v17 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    v9 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v8;

    *((CGFloat *)v7 + 3) = x;
    *((CGFloat *)v7 + 4) = y;
    v10 = (_OWORD *)MEMORY[0x263F001A8];
    *((CGFloat *)v7 + 5) = width;
    *((CGFloat *)v7 + 6) = height;
    long long v11 = v10[1];
    *(_OWORD *)(v7 + 56) = *v10;
    *(_OWORD *)(v7 + 72) = v11;
    uint64_t v12 = objc_opt_new();
    v13 = (void *)*((void *)v7 + 15);
    *((void *)v7 + 15) = v12;

    uint64_t v14 = [MEMORY[0x263F08680] transform];
    v15 = (void *)*((void *)v7 + 14);
    *((void *)v7 + 14) = v14;
  }
  return (CMDrawingContext *)v7;
}

- (void)setMapper:(id)a3
{
}

- (CGRect)transformRectToPage:(CGRect)a3
{
  -[CMDrawingContext _transformRect:withTransform:](self, "_transformRect:withTransform:", self->_currentTransform, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)_transformRect:(CGRect)a3 withTransform:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  objc_msgSend(v8, "transformPoint:", x, y);
  double v10 = v9;
  double v12 = v11;
  double v13 = x + width;
  double v14 = y + height;
  objc_msgSend(v8, "transformPoint:", x + width, y + height);
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(v8, "transformPoint:", v13, y);
  double v20 = v19;
  double v22 = v21;
  objc_msgSend(v8, "transformPoint:", x, v14);
  if (v16 <= v10) {
    double v25 = v10;
  }
  else {
    double v25 = v16;
  }
  if (v16 >= v10) {
    double v26 = v10;
  }
  else {
    double v26 = v16;
  }
  if (v18 <= v12) {
    double v27 = v12;
  }
  else {
    double v27 = v18;
  }
  if (v18 >= v12) {
    double v28 = v12;
  }
  else {
    double v28 = v18;
  }
  if (v22 > v27) {
    double v27 = v22;
  }
  if (v20 > v25) {
    double v25 = v20;
  }
  if (v22 < v28) {
    double v28 = v22;
  }
  if (v20 < v26) {
    double v26 = v20;
  }
  if (v23 >= v26) {
    double v29 = v26;
  }
  else {
    double v29 = v23;
  }
  if (v24 >= v28) {
    double v30 = v28;
  }
  else {
    double v30 = v24;
  }
  if (v23 <= v25) {
    double v23 = v25;
  }
  if (v24 <= v27) {
    double v24 = v27;
  }
  double v31 = v23 - v29;
  double v32 = v24 - v30;

  double v33 = v29;
  double v34 = v30;
  double v35 = v31;
  double v36 = v32;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (id)copyPDF
{
  id result = (id)[(NSMutableArray *)self->_actions count];
  if (result)
  {
    double v4 = (NSMutableArray *)objc_opt_new();
    transforms = self->_transforms;
    self->_transforms = v4;

    double v6 = [MEMORY[0x263F08680] transform];
    currentTransform = self->_currentTransform;
    self->_currentTransform = v6;

    [(CMDrawingContext *)self _copyCGContext];
    [(CMDrawingContext *)self _playbackActions];
    [(CMDrawingContext *)self _closeContext];
    id result = self->_data;
    self->_data = 0;
  }
  return result;
}

- (void)dealloc
{
  cgContext = self->_cgContext;
  if (cgContext)
  {
    CGContextRelease(cgContext);
    self->_cgContext = 0;
  }
  dataConsumer = self->_dataConsumer;
  if (dataConsumer)
  {
    CGDataConsumerRelease(dataConsumer);
    self->_dataConsumer = 0;
  }
  data = self->_data;
  if (data)
  {
    CFRelease(data);
    self->_data = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CMDrawingContext;
  [(CMDrawingContext *)&v6 dealloc];
}

- (CGAffineTransform)currentTransform
{
  id result = (CGAffineTransform *)self->_currentTransform;
  if (result)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v8 = 0u;
    id result = (CGAffineTransform *)[(CGAffineTransform *)result transformStruct];
    long long v5 = v8;
    long long v6 = v9;
    long long v7 = v10;
  }
  else
  {
    long long v5 = 0uLL;
    long long v6 = 0uLL;
    long long v7 = 0uLL;
  }
  *(_OWORD *)&retstr->a = v5;
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tdouble x = v7;
  return result;
}

- (void)setStrokeColor:(CGColor *)a3
{
  double v4 = [[CMDrawingAction alloc] initWithType:2 andValue:a3];
  -[NSMutableArray addObject:](self->_actions, "addObject:");
}

- (void)setFillColor:(CGColor *)a3
{
  double v4 = [[CMDrawingAction alloc] initWithType:3 andValue:a3];
  -[NSMutableArray addObject:](self->_actions, "addObject:");
}

- (void)addPath:(CGPath *)a3
{
  BoundingBoCGFloat x = CGPathGetBoundingBox(a3);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  if (BoundingBox.size.width == 0.0) {
    double width = 1.0;
  }
  else {
    double width = BoundingBox.size.width;
  }
  if (BoundingBox.size.height == 0.0) {
    double height = 1.0;
  }
  else {
    double height = BoundingBox.size.height;
  }
  if (!CGRectEqualToRect(self->_finalFrame, *MEMORY[0x263F001A8]))
  {
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.double width = width;
    v13.size.double height = height;
    CGRect v12 = CGRectUnion(self->_finalFrame, v13);
    CGFloat x = v12.origin.x;
    CGFloat y = v12.origin.y;
    double width = v12.size.width;
    double height = v12.size.height;
  }
  self->_finalFrame.origin.CGFloat x = x;
  self->_finalFrame.origin.CGFloat y = y;
  self->_finalFrame.size.double width = width;
  self->_finalFrame.size.double height = height;
  long long v9 = [[CMDrawingAction alloc] initWithType:8 andValue:a3];
  -[NSMutableArray addObject:](self->_actions, "addObject:");
}

- (void)_copyCGContext
{
  if (!self->_cgContext)
  {
    Mutable = CFDataCreateMutable(0, 0);
    self->_data = Mutable;
    double v4 = CGDataConsumerCreateWithCFData(Mutable);
    self->_dataConsumer = v4;
    if (v4)
    {
      [(CMDrawingContext *)self pdfFrame];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      v14.origin.CGFloat x = 0.0;
      v14.origin.CGFloat y = 0.0;
      v14.size.double width = v11;
      v14.size.double height = v9;
      cgContext = CGPDFContextCreate(self->_dataConsumer, &v14, 0);
      self->_cgContext = cgContext;
      if (!cgContext)
      {
        CFShow(@"Cannot create PDF context");
        CFRelease(self->_data);
        CFRelease(self->_dataConsumer);
        cgContext = self->_cgContext;
      }
      CGContextBeginPage(cgContext, &v14);
      CGContextSetShouldAntialias(self->_cgContext, 1);
      CGContextTranslateCTM(self->_cgContext, -v6, v8 + v10);
      CGContextScaleCTM(self->_cgContext, 1.0, -1.0);
      [(CMDrawingContext *)self _applyTransform:self->_currentTransform];
    }
    else
    {
      CFShow(@"Cannot create DataConsumer");
      data = self->_data;
      CFRelease(data);
    }
  }
}

- (CGRect)pdfFrame
{
  return CGRectInset(self->_finalFrame, -20.0, -20.0);
}

- (void)_applyTransform:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  if (v4)
  {
    [v4 transformStruct];
    CGFloat v6 = *((double *)&v14 + 1);
    CGFloat v7 = *(double *)&v14;
    CGFloat v8 = *((double *)&v15 + 1);
    CGFloat v9 = *(double *)&v15;
    CGFloat v10 = *((double *)&v16 + 1);
    CGFloat v11 = *(double *)&v16;
  }
  else
  {
    CGFloat v10 = 0.0;
    CGFloat v11 = 0.0;
    CGFloat v8 = 0.0;
    CGFloat v9 = 0.0;
    CGFloat v6 = 0.0;
    CGFloat v7 = 0.0;
  }
  CGContextSaveGState(self->_cgContext);
  cgContext = self->_cgContext;
  v13.a = v7;
  v13.b = v6;
  v13.c = v9;
  v13.d = v8;
  v13.tCGFloat x = v11;
  v13.tCGFloat y = v10;
  CGContextConcatCTM(cgContext, &v13);
}

- (void)_playbackActions
{
  uint64_t v3 = [(NSMutableArray *)self->_actions count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      CGFloat v6 = [(NSMutableArray *)self->_actions objectAtIndex:i];
      switch([v6 type])
      {
        case 0u:
          CGFloat v7 = [v6 value];
          [(CMDrawingContext *)self _addTransform:v7];
          goto LABEL_9;
        case 1u:
          [(CMDrawingContext *)self _restoreLastTransform];
          break;
        case 2u:
          cgContext = self->_cgContext;
          CGFloat v7 = [v6 value];
          CGContextSetStrokeColorWithColor(cgContext, v7);
          goto LABEL_9;
        case 3u:
          CGFloat v9 = self->_cgContext;
          CGFloat v7 = [v6 value];
          CGContextSetFillColorWithColor(v9, v7);
LABEL_9:

          break;
        case 4u:
          self->_fillImage = (CGImage *)[v6 value];
          break;
        case 5u:
          self->_fillImage = 0;
          break;
        case 6u:
          CGFloat v10 = self->_cgContext;
          [v6 floatValue];
          CGContextSetLineWidth(v10, v11);
          break;
        case 7u:
          CGRect v12 = [v6 value];
          size_t v13 = [v12 count];

          if (v13)
          {
            if (8 * v13 / v13 == 8) {
              long long v14 = (CGFloat *)malloc_type_malloc(8 * v13, 0xD809582AuLL);
            }
            else {
              long long v14 = 0;
            }
            for (uint64_t j = 0; j != v13; ++j)
            {
              double v23 = [v6 value];
              double v24 = [v23 objectAtIndex:j];
              [v24 floatValue];
              v14[j] = v25;
            }
          }
          else
          {
            long long v14 = 0;
          }
          CGContextSetLineDash(self->_cgContext, 0.0, v14, v13);
          free(v14);
          break;
        case 8u:
          long long v15 = self->_cgContext;
          if (self->_fillImage)
          {
            CGContextSaveGState(self->_cgContext);
            long long v16 = (const CGPath *)[v6 value];
            BoundingBoCGFloat x = CGPathGetBoundingBox(v16);
            CGFloat x = BoundingBox.origin.x;
            double y = BoundingBox.origin.y;
            CGFloat width = BoundingBox.size.width;
            double height = BoundingBox.size.height;
            CGContextAddPath(self->_cgContext, v16);
            CGContextClip(self->_cgContext);
            CGContextScaleCTM(self->_cgContext, 1.0, -1.0);
            v27.origin.double y = -height - y;
            v27.origin.CGFloat x = x;
            v27.size.CGFloat width = width;
            v27.size.double height = height;
            CGContextDrawImage(self->_cgContext, v27, self->_fillImage);
            CGContextRestoreGState(self->_cgContext);
          }
          else
          {
            double v21 = [v6 value];
            CGContextAddPath(v15, v21);

            CGContextDrawPath(self->_cgContext, kCGPathFillStroke);
          }
          break;
        default:
          break;
      }
    }
  }
}

- (void)_closeContext
{
  cgContext = self->_cgContext;
  if (cgContext)
  {
    CGContextEndPage(cgContext);
    uint64_t v4 = self->_cgContext;
    if (v4)
    {
      CGContextRelease(v4);
      self->_cgContext = 0;
    }
    dataConsumer = self->_dataConsumer;
    if (dataConsumer)
    {
      CGDataConsumerRelease(dataConsumer);
      self->_dataConsumer = 0;
    }
  }
}

- (void)addTransform:(id)a3
{
  id v5 = a3;
  -[CMDrawingContext _addTransform:](self, "_addTransform:");
  uint64_t v4 = [[CMDrawingAction alloc] initWithType:0 andValue:v5];
  [(NSMutableArray *)self->_actions addObject:v4];
}

- (void)_addTransform:(id)a3
{
  id v5 = a3;
  uint64_t v4 = (void *)[(NSAffineTransform *)self->_currentTransform copy];
  [(NSMutableArray *)self->_transforms addObject:v4];
  [(NSAffineTransform *)self->_currentTransform prependTransform:v5];
}

- (void)restoreLastTransform
{
  [(CMDrawingContext *)self _restoreLastTransform];
  uint64_t v3 = [[CMDrawingAction alloc] initWithType:1 andValue:0];
  -[NSMutableArray addObject:](self->_actions, "addObject:");
}

- (void)_restoreLastTransform
{
  uint64_t v3 = [(NSMutableArray *)self->_transforms lastObject];
  currentTransform = self->_currentTransform;
  self->_currentTransform = v3;

  transforms = self->_transforms;
  [(NSMutableArray *)transforms removeLastObject];
}

- (void)setLineWidth:(float)a3
{
  id v5 = [CMDrawingAction alloc];
  *(float *)&double v6 = a3;
  CGFloat v7 = [(CMDrawingAction *)v5 initWithType:6 andFloatValue:v6];
  -[NSMutableArray addObject:](self->_actions, "addObject:");
}

- (void)setLineDash:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [[CMDrawingAction alloc] initWithType:7 andValue:v5];
  [(NSMutableArray *)self->_actions addObject:v4];
}

- (CMDrawableMapper)mapper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapper);
  return (CMDrawableMapper *)WeakRetained;
}

- (void)setFillImage:(CGImage *)a3
{
  id v5 = [CMDrawingAction alloc];
  if (a3) {
    double v6 = [(CMDrawingAction *)v5 initWithType:4 andValue:a3];
  }
  else {
    double v6 = [(CMDrawingAction *)v5 initWithType:5 andValue:0];
  }
  -[NSMutableArray addObject:](self->_actions, "addObject:");
}

- (CGRect)transformRectToGroup:(CGRect)a3
{
  -[CMDrawingContext _transformRect:withTransform:](self, "_transformRect:withTransform:", self->_currentTransform, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v7 = v6 - self->_frame.origin.x;
  double v9 = v8 - self->_frame.origin.y;
  result.size.double height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v9;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGContext)_cgContext
{
  return self->_cgContext;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)currentScaleFactor
{
  currentTransform = self->_currentTransform;
  if (currentTransform) {
    [(NSAffineTransform *)currentTransform transformStruct];
  }
  return sqrt(0.0 * 0.0 + 0.0 * 0.0);
}

- (void)addDebugPath:(CGPath *)a3
{
  BoundingBoCGFloat x = CGPathGetBoundingBox(a3);
  if (BoundingBox.size.width == 0.0) {
    BoundingBox.size.CGFloat width = 1.0;
  }
  if (BoundingBox.size.height == 0.0) {
    BoundingBox.size.CGFloat height = 1.0;
  }
  -[CMDrawingContext _transformRect:withTransform:](self, "_transformRect:withTransform:", self->_currentTransform, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  if (!CGRectEqualToRect(self->_finalFrame, *MEMORY[0x263F001A8]))
  {
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    CGRect v16 = CGRectUnion(self->_finalFrame, v17);
    CGFloat x = v16.origin.x;
    CGFloat y = v16.origin.y;
    CGFloat width = v16.size.width;
    CGFloat height = v16.size.height;
  }
  self->_finalFrame.origin.CGFloat x = x;
  self->_finalFrame.origin.CGFloat y = y;
  self->_finalFrame.size.CGFloat width = width;
  self->_finalFrame.size.CGFloat height = height;
  size_t v13 = [[CMDrawingAction alloc] initWithType:8 andValue:a3];
  -[NSMutableArray addObject:](self->_actions, "addObject:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transforms, 0);
  objc_storeStrong((id *)&self->_currentTransform, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_destroyWeak((id *)&self->_mapper);
}

@end