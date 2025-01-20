@interface TSDSwatchRenderingOperation
- (BOOL)needsPressedStateBackground;
- (CGImage)deliveredImage;
- (CGImage)p_newSwatchPressedStateBackgroundFromCGImage:(CGImage *)a3;
- (CGRect)swatchFrame;
- (CGSize)imageSize;
- (NSString)identifier;
- (TSDSwatchRenderingOperation)initWithPreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 documentRoot:(id)a7;
- (TSSPreset)preset;
- (UIEdgeInsets)swatchEdgeInsets;
- (UIView)view;
- (double)imageScale;
- (unint64_t)insertPopoverPageNumber;
- (unint64_t)insertPopoverPageType;
- (void)dealloc;
- (void)deliverCGImage:(CGImage *)a3;
- (void)doWorkWithReadLock;
- (void)main;
- (void)p_animateSwatchIn;
- (void)p_deliverResultOnMainThread:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInsertPopoverPageNumber:(unint64_t)a3;
- (void)setInsertPopoverPageType:(unint64_t)a3;
- (void)setView:(id)a3;
@end

@implementation TSDSwatchRenderingOperation

- (TSDSwatchRenderingOperation)initWithPreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 documentRoot:(id)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  CGFloat v13 = a4.height;
  CGFloat v14 = a4.width;
  v18.receiver = self;
  v18.super_class = (Class)TSDSwatchRenderingOperation;
  v16 = [(TSDSwatchRenderingOperation *)&v18 init];
  if (v16)
  {
    v16->mPreset = (TSSPreset *)a3;
    v16->mImageSize.CGFloat width = v14;
    v16->mImageSize.CGFloat height = v13;
    v16->mImageScale = a5;
    v16->mSwatchFrame.origin.CGFloat x = x;
    v16->mSwatchFrame.origin.CGFloat y = y;
    v16->mSwatchFrame.size.CGFloat width = width;
    v16->mSwatchFrame.size.CGFloat height = height;
    v16->mDocumentRoot = (TSKDocumentRoot *)a7;
  }
  return v16;
}

- (void)dealloc
{
  CGImageRelease(self->mDeliveredImage);
  v3.receiver = self;
  v3.super_class = (Class)TSDSwatchRenderingOperation;
  [(TSDSwatchRenderingOperation *)&v3 dealloc];
}

- (void)p_animateSwatchIn
{
  if (self->mView)
  {
    if (([(TSDSwatchRenderingOperation *)self isCancelled] & 1) == 0)
    {
      objc_super v3 = [(UIView *)self->mView layer];
      if (![(CALayer *)v3 valueForKey:TSDSwatchRenderingOperationLayerKey]
        || (TSDSwatchRenderingOperation *)[(CALayer *)v3 valueForKey:TSDSwatchRenderingOperationLayerKey] == self)
      {
        [(CALayer *)v3 addRotateInAnimationWithDuration:0.3 delay:0.0];
        [(CALayer *)v3 setValue:0 forKey:TSDSwatchRenderingOperationLayerKey];
      }
    }
    mView = self->mView;
    [(UIView *)mView setHidden:0];
  }
}

- (CGImage)p_newSwatchPressedStateBackgroundFromCGImage:(CGImage *)a3
{
  size_t Width = CGImageGetWidth(a3);
  CGImageGetHeight(a3);
  double v6 = TSDRectWithSize();
  double v10 = TSDMultiplyRectScalar(v6, v7, v8, v9, self->mImageScale);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = TSDBitmapContextCreate(3, (double)Width);
  CGContextSetFillColorWithColor(v17, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithWhite:alpha:", 0.1, 0.3), "CGColor"));
  [(TSDSwatchRenderingOperation *)self swatchEdgeInsets];
  CGFloat v19 = v12 + v18;
  CGFloat v22 = v14 - (v20 + v21);
  v26.size.CGFloat height = v16 - (v18 + v23);
  v26.origin.CGFloat x = v10 + v20;
  v26.origin.CGFloat y = v19;
  v26.size.CGFloat width = v22;
  CGContextFillRect(v17, v26);
  Image = CGBitmapContextCreateImage(v17);
  CGContextRelease(v17);
  return Image;
}

- (void)p_deliverResultOnMainThread:(id)a3
{
  if (!self->mView) {
    return;
  }
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v5 = [(UIView *)self->mView layer];
  objc_opt_class();
  double v6 = (void *)TSUDynamicCast();
  if (v6)
  {
    CGFloat v7 = v6;
    objc_msgSend(v6, "setImage:forState:", objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:scale:orientation:", objc_msgSend(a3, "foreground"), 0, self->mImageScale), 0);
    if ([(TSDSwatchRenderingOperation *)self needsPressedStateBackground])
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:scale:orientation:", objc_msgSend(a3, "background"), 0, self->mImageScale);
      CGFloat v9 = v7;
LABEL_9:
      [v9 setBackgroundImage:v8 forState:1];
      goto LABEL_10;
    }
    if ([v7 backgroundImageForState:1])
    {
      CGFloat v9 = v7;
      uint64_t v8 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    [(CALayer *)v5 setContentsScale:self->mImageScale];
    -[CALayer setContents:](v5, "setContents:", [a3 foreground]);
  }
LABEL_10:
  [(CALayer *)v5 setShouldRasterize:1];
  [(CALayer *)v5 setRasterizationScale:self->mImageScale];
  [MEMORY[0x263F158F8] flush];
  [MEMORY[0x263F158F8] commit];

  [(TSDSwatchRenderingOperation *)self p_animateSwatchIn];
}

- (void)deliverCGImage:(CGImage *)a3
{
  if ([(TSDSwatchRenderingOperation *)self needsPressedStateBackground])
  {
    v5 = [(TSDSwatchRenderingOperation *)self p_newSwatchPressedStateBackgroundFromCGImage:a3];
    double v6 = +[TSDSwatchRenderingResult renderingResultWithForeground:a3 background:v5];
    if (v5) {
      CGImageRelease(v5);
    }
  }
  else
  {
    double v6 = +[TSDSwatchRenderingResult renderingResultWithForeground:a3 background:0];
  }
  self->mDeliveredImage = CGImageRetain(a3);
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(TSDSwatchRenderingOperation *)self p_deliverResultOnMainThread:v6];
  }
  else
  {
    [(TSDSwatchRenderingOperation *)self performSelectorOnMainThread:sel_p_deliverResultOnMainThread_ withObject:v6 waitUntilDone:0];
  }
}

- (CGImage)deliveredImage
{
  return self->mDeliveredImage;
}

- (BOOL)needsPressedStateBackground
{
  return 0;
}

- (UIEdgeInsets)swatchEdgeInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)doWorkWithReadLock
{
  double v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDSwatchRenderingOperation doWorkWithReadLock]"];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSwatchRenderingOperation.m"];

  [v2 handleFailureInFunction:v3 file:v4 lineNumber:271 description:@"Subclasses must override"];
}

- (void)main
{
  uint64_t v3 = [(TSKDocumentRoot *)self->mDocumentRoot accessController];

  [(TSKAccessController *)v3 performRead:sel_doWorkWithReadLock withTarget:self argument:0];
}

- (UIView)view
{
  return (UIView *)objc_getProperty(self, a2, 248, 1);
}

- (void)setView:(id)a3
{
}

- (TSSPreset)preset
{
  return self->mPreset;
}

- (CGSize)imageSize
{
  objc_copyStruct(v4, &self->mImageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (double)imageScale
{
  return self->mImageScale;
}

- (CGRect)swatchFrame
{
  objc_copyStruct(v6, &self->mSwatchFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (unint64_t)insertPopoverPageType
{
  return self->mInsertPopoverPageType;
}

- (void)setInsertPopoverPageType:(unint64_t)a3
{
  self->mInsertPopoverPageType = a3;
}

- (unint64_t)insertPopoverPageNumber
{
  return self->mInsertPopoverPageNumber;
}

- (void)setInsertPopoverPageNumber:(unint64_t)a3
{
  self->mInsertPopoverPageNumber = a3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (void)setIdentifier:(id)a3
{
}

@end