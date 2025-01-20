@interface UIPDFMagnifierController
- (BOOL)isSelectionUniformlyRotated:(double *)a3;
- (BOOL)visible;
- (CGPoint)convertPointToEnlargedSpace:(CGPoint)a3;
- (CGPoint)convertPointToRotatedPage:(CGPoint)a3;
- (CGPoint)convertViewPointToEnlargedSpace:(CGPoint)a3;
- (CGPoint)pointToMagnifyInPDFSpace;
- (CGPoint)viewPointInTextEffectsSpace;
- (CGRect)convertRectToEnlargedSpace:(CGRect)a3;
- (CGRect)convertRectToRotatedPage:(CGRect)a3;
- (UIPDFMagnifierController)init;
- (UIPDFPageView)pageView;
- (id)imageReceived:(id)a3 data:(id)a4;
- (void)_show;
- (void)addBling;
- (void)addTextRangeHandles;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)hide;
- (void)move;
- (void)placeImage;
- (void)setImageContainerMask;
- (void)setImageContainerPositionLoupe;
- (void)setImageContainerPositionMagnifier;
- (void)setLayerPositions;
- (void)setPageView:(id)a3;
- (void)setPosition:(CGPoint)a3 viewPoint:(CGPoint)a4;
- (void)setPower;
- (void)setSelectionPath;
- (void)setSelectionPath:(CGPath *)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5;
- (void)setTextRangeHandlePositions;
- (void)showLoupe;
- (void)showMagnifier;
- (void)tearDownLayers;
@end

@implementation UIPDFMagnifierController

- (UIPDFMagnifierController)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)UIPDFMagnifierController;
  v2 = [(UIPDFMagnifierController *)&v5 init];
  if (v2)
  {
    v2->_textEffectsWindow = (UIWindow *)+[UITextEffectsWindow sharedTextEffectsWindowAboveStatusBar];
    v2->_magnifierSize = (CGSize)xmmword_186B9C400;
    *(_OWORD *)components = xmmword_186B9C4B0;
    long long v7 = unk_186B9C4C0;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v2->_grabberColor = CGColorCreate(DeviceRGB, components);
    CGColorSpaceRelease(DeviceRGB);
    v2->_visible = 0;
  }
  return v2;
}

- (void)dealloc
{
  CGColorRelease(self->_grabberColor);
  [(UIPDFMagnifierController *)self tearDownLayers];
  textEffectsSubView = self->_textEffectsSubView;
  if (textEffectsSubView)
  {
    [(UIView *)textEffectsSubView removeFromSuperview];
  }
  v4.receiver = self;
  v4.super_class = (Class)UIPDFMagnifierController;
  [(UIPDFMagnifierController *)&v4 dealloc];
}

- (void)setPosition:(CGPoint)a3 viewPoint:(CGPoint)a4
{
  self->_touchPoint = a4;
  self->_pointToMagnify = a3;
}

- (void)_show
{
  if (!self->_textEffectsSubView)
  {
    v3 = [UIView alloc];
    [(UIView *)self->_textEffectsWindow bounds];
    objc_super v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
    self->_textEffectsSubView = v4;
    [(UIView *)self->_textEffectsWindow addSubview:v4];
  }
  [(UIPDFMagnifierController *)self placeImage];
  [(UIPDFMagnifierController *)self setImageContainerMask];
  self->_visible = 1;
}

- (void)showLoupe
{
  self->_loupe = 1;
  [(UIPDFMagnifierController *)self _show];
}

- (void)showMagnifier
{
  self->_loupe = 0;
  [(UIPDFMagnifierController *)self _show];
}

- (void)move
{
  if (self->_loupe)
  {
    [(UIPDFMagnifierController *)self setImageContainerPositionLoupe];
  }
  else
  {
    [(UIPDFMagnifierController *)self setImageContainerPositionMagnifier];
    [(UIPDFMagnifierController *)self setTextRangeHandlePositions];
  }
  [(UIPDFMagnifierController *)self setSelectionPath];
  [(UIPDFMagnifierController *)self setLayerPositions];
}

- (void)hide
{
  [(UIPDFMagnifierController *)self tearDownLayers];
  textEffectsSubView = self->_textEffectsSubView;
  if (textEffectsSubView)
  {
    [(UIView *)textEffectsSubView removeFromSuperview];

    self->_textEffectsSubView = 0;
  }
  self->_visible = 0;
}

- (BOOL)visible
{
  return self->_visible;
}

- (UIPDFPageView)pageView
{
  return self->pageView;
}

- (void)setPageView:(id)a3
{
  self->pageView = (UIPDFPageView *)a3;
}

- (void)tearDownLayers
{
  imageLayer = self->_imageLayer;
  if (imageLayer)
  {
    [(CALayer *)imageLayer removeFromSuperlayer];

    self->_imageLayer = 0;
  }
  selectionLayer = self->_selectionLayer;
  if (selectionLayer)
  {
    [(CAShapeLayer *)selectionLayer removeFromSuperlayer];

    self->_selectionLayer = 0;
  }
  imageContainer = self->_imageContainer;
  if (imageContainer)
  {
    [(CALayer *)imageContainer removeFromSuperlayer];

    self->_imageContainer = 0;
  }
  maskLayer = self->_maskLayer;
  if (maskLayer)
  {

    self->_maskLayer = 0;
  }
  loLayer = self->_loLayer;
  if (loLayer)
  {
    [(CALayer *)loLayer removeFromSuperlayer];

    self->_loLayer = 0;
  }
  hiLayer = self->_hiLayer;
  if (hiLayer)
  {
    [(CALayer *)hiLayer removeFromSuperlayer];

    self->_hiLayer = 0;
  }
  leftBar = self->_leftBar;
  if (leftBar)
  {
    [(CALayer *)leftBar removeFromSuperlayer];

    self->_leftBar = 0;
  }
  rightBar = self->_rightBar;
  if (rightBar)
  {
    [(CALayer *)rightBar removeFromSuperlayer];

    self->_rightBar = 0;
  }
  leftGrabber = self->_leftGrabber;
  if (leftGrabber)
  {
    [(CALayer *)leftGrabber removeFromSuperlayer];

    self->_leftGrabber = 0;
  }
  rightGrabber = self->_rightGrabber;
  if (rightGrabber)
  {
    [(CALayer *)rightGrabber removeFromSuperlayer];

    self->_rightGrabber = 0;
  }
}

- (void)setPower
{
  -[UIPDFPageView convertRectFromPDFPageSpace:]([(UIPDFMagnifierController *)self pageView], "convertRectFromPDFPageSpace:", 0.0, 0.0, 1.0, 1.0);
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UIView convertRect:fromView:](self->_textEffectsSubView, "convertRect:fromView:", [(UIPDFMagnifierController *)self pageView], v3, v5, v7, v9);
  double Width = CGRectGetWidth(v17);
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  double v12 = Width / CGRectGetWidth(v18);
  [(UIView *)[(UIPDFMagnifierController *)self pageView] bounds];
  float v14 = v13 / 100.0;
  double v15 = truncf(v14) * -0.253333333 + 3.36;
  if (v15 < 1.84) {
    double v15 = 1.84;
  }
  if (v15 > 2.6) {
    double v15 = 2.6;
  }
  self->_power = v15;
  if (v12 >= v15)
  {
    [(UIPDFMagnifierController *)self hide];
  }
  else
  {
    self->_power = v12 * v15;
  }
}

- (BOOL)isSelectionUniformlyRotated:(double *)a3
{
  double v5 = [[(UIPDFPageView *)[(UIPDFMagnifierController *)self pageView] page] selection];
  uint64_t v6 = [(UIPDFSelection *)v5 numberOfRectangles];
  if (!v6) {
    return v6;
  }
  unint64_t v7 = v6;
  memset(&v18, 0, sizeof(v18));
  memset(v17, 0, sizeof(v17));
  [(UIPDFSelection *)v5 getBounds:v17 transform:&v18 index:0];
  unint64_t pageRotation = self->_pageRotation;
  if (pageRotation)
  {
    CGAffineTransform v16 = v18;
    CPRotationDegreesFromTransform(&v16.a);
    if (vabdd_f64(v9, (double)pageRotation) >= 1.0) {
      goto LABEL_7;
    }
LABEL_6:
    LOBYTE(v6) = 0;
    return v6;
  }
  CGAffineTransform v16 = v18;
  if (CGAffineTransformIsIdentity(&v16)) {
    goto LABEL_6;
  }
LABEL_7:
  if (v7 >= 2)
  {
    for (uint64_t i = 1; i != v7; ++i)
    {
      memset(&v16, 0, sizeof(v16));
      [(UIPDFSelection *)v5 getBounds:v17 transform:&v16 index:i];
      unint64_t pageRotation = self->_pageRotation;
      if (pageRotation)
      {
        CGAffineTransform t1 = v18;
        CPRotationDegreesFromTransform(&t1.a);
        if (vabdd_f64(v11, (double)pageRotation) < 1.0) {
          goto LABEL_6;
        }
      }
      else
      {
        CGAffineTransform t1 = v18;
        CGAffineTransform v14 = v16;
        if (!CGAffineTransformEqualToTransform(&t1, &v14)) {
          goto LABEL_6;
        }
      }
    }
  }
  CGAffineTransform v16 = v18;
  CPRotationDegreesFromTransform(&v16.a);
  *a3 = (v12 - (double)pageRotation) * -3.14159265 / 180.0;
  LOBYTE(v6) = 1;
  return v6;
}

- (CGPoint)convertViewPointToEnlargedSpace:(CGPoint)a3
{
  -[UIPDFPageView convertPointToPDFPageSpace:]([(UIPDFMagnifierController *)self pageView], "convertPointToPDFPageSpace:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  [(CALayer *)self->_imageContainer bounds];
  double enlargementScale = self->_enlargementScale;
  double v9 = v5 * enlargementScale;
  double v10 = CGRectGetHeight(v13) - v7 * enlargementScale;
  double v11 = v9;
  result.y = v10;
  result.x = v11;
  return result;
}

- (CGPoint)convertPointToRotatedPage:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [[(UIPDFPageView *)[(UIPDFMagnifierController *)self pageView] page] cropBox];
  CGFloat v10 = v6;
  CGFloat v11 = v7;
  CGFloat v12 = v8;
  CGFloat v13 = v9;
  unint64_t pageRotation = self->_pageRotation;
  if (pageRotation == 270)
  {
    double y = CGRectGetHeight(*(CGRect *)&v6) - y;
    double v15 = x;
    goto LABEL_9;
  }
  if (pageRotation == 180)
  {
    double x = CGRectGetWidth(*(CGRect *)&v6) - x;
    v18.origin.double x = v10;
    v18.origin.double y = v11;
    v18.size.width = v12;
    v18.size.height = v13;
    double v15 = CGRectGetHeight(v18) - y;
LABEL_8:
    double y = x;
    goto LABEL_9;
  }
  if (pageRotation != 90)
  {
    double v15 = y;
    goto LABEL_8;
  }
  double v15 = CGRectGetWidth(*(CGRect *)&v6) - x;
LABEL_9:
  double v16 = y;
  result.double y = v15;
  result.double x = v16;
  return result;
}

- (CGRect)convertRectToRotatedPage:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [[(UIPDFPageView *)[(UIPDFMagnifierController *)self pageView] page] cropBox];
  CGFloat v12 = v8;
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  unint64_t pageRotation = self->_pageRotation;
  switch(pageRotation)
  {
    case 0x10EuLL:
      double v20 = CGRectGetHeight(*(CGRect *)&v8);
      v27.origin.CGFloat x = x;
      v27.origin.double y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      double y = v20 - CGRectGetMaxY(v27);
      double v19 = width;
      double v18 = x;
      break;
    case 0xB4uLL:
      double v24 = CGRectGetWidth(*(CGRect *)&v8);
      v28.origin.CGFloat x = x;
      v28.origin.double y = y;
      v28.size.CGFloat width = width;
      v28.size.CGFloat height = height;
      double v25 = v24 - CGRectGetMaxX(v28);
      v29.origin.CGFloat x = v12;
      v29.origin.double y = v13;
      v29.size.CGFloat width = v14;
      v29.size.CGFloat height = v15;
      double v21 = CGRectGetHeight(v29);
      v30.origin.CGFloat x = x;
      v30.origin.double y = y;
      v30.size.CGFloat width = width;
      v30.size.CGFloat height = height;
      double v18 = v21 - CGRectGetMaxY(v30);
      double v19 = height;
      CGFloat height = width;
      double y = v25;
      break;
    case 0x5AuLL:
      double v17 = CGRectGetWidth(*(CGRect *)&v8);
      v26.origin.CGFloat x = x;
      v26.origin.double y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      double v18 = v17 - CGRectGetMaxX(v26);
      double v19 = width;
      break;
    default:
      double v19 = height;
      CGFloat height = width;
      double v18 = y;
      double y = x;
      break;
  }
  double v22 = y;
  double v23 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v23;
  result.origin.double y = v18;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)convertRectToEnlargedSpace:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [[(UIPDFPageView *)[(UIPDFMagnifierController *)self pageView] page] cropBox];
  double v9 = x - v8;
  double v11 = y - v10;
  if (self->_pageRotation)
  {
    -[UIPDFMagnifierController convertRectToRotatedPage:](self, "convertRectToRotatedPage:", v9, v11, width, height);
    double v9 = v12;
    double v11 = v13;
    double width = v14;
    double height = v15;
  }
  [(CALayer *)self->_imageContainer bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  memset(&v29, 0, sizeof(v29));
  CGAffineTransformMakeScale(&v29, self->_enlargementScale, -self->_enlargementScale);
  memset(&v28, 0, sizeof(v28));
  v30.origin.double x = v17;
  v30.origin.double y = v19;
  v30.size.double width = v21;
  v30.size.double height = v23;
  CGFloat v24 = CGRectGetHeight(v30);
  CGAffineTransformMakeTranslation(&v28, 0.0, v24);
  CGAffineTransform t1 = v29;
  memset(&v27, 0, sizeof(v27));
  CGAffineTransform v25 = v28;
  CGAffineTransformConcat(&v27, &t1, &v25);
  CGAffineTransform t1 = v27;
  v31.origin.double x = v9;
  v31.origin.double y = v11;
  v31.size.double width = width;
  v31.size.double height = height;
  return CGRectApplyAffineTransform(v31, &t1);
}

- (CGPoint)convertPointToEnlargedSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [[(UIPDFPageView *)[(UIPDFMagnifierController *)self pageView] page] cropBox];
  double v7 = v6;
  double v9 = v8;
  [(CALayer *)self->_imageContainer bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double v18 = x - v7;
  double v19 = y - v9;
  if (self->_pageRotation) {
    -[UIPDFMagnifierController convertPointToRotatedPage:](self, "convertPointToRotatedPage:", v18, v19);
  }
  double v23 = v18;
  double v24 = v19;
  memset(&v29, 0, sizeof(v29));
  CGAffineTransformMakeScale(&v29, self->_enlargementScale, -self->_enlargementScale);
  memset(&v28, 0, sizeof(v28));
  v31.origin.double x = v11;
  v31.origin.double y = v13;
  v31.size.double width = v15;
  v31.size.double height = v17;
  CGFloat Height = CGRectGetHeight(v31);
  CGAffineTransformMakeTranslation(&v28, 0.0, Height);
  CGAffineTransform t1 = v29;
  memset(&v27, 0, sizeof(v27));
  CGAffineTransform t2 = v28;
  CGAffineTransformConcat(&v27, &t1, &t2);
  float64x2_t v21 = vaddq_f64(*(float64x2_t *)&v27.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v27.a, v23), vmulq_n_f64(*(float64x2_t *)&v27.c, v24)));
  double v22 = v21.f64[1];
  result.double x = v21.f64[0];
  result.double y = v22;
  return result;
}

- (CGPoint)viewPointInTextEffectsSpace
{
  textEffectsWindow = self->_textEffectsWindow;
  double v4 = [(UIPDFMagnifierController *)self pageView];
  double x = self->_touchPoint.x;
  double y = self->_touchPoint.y;
  -[UIView convertPoint:fromView:](textEffectsWindow, "convertPoint:fromView:", v4, x, y);
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)pointToMagnifyInPDFSpace
{
  -[UIPDFPageView convertPointToPDFPageSpace:]([(UIPDFMagnifierController *)self pageView], "convertPointToPDFPageSpace:", self->_touchPoint.x, self->_pointToMagnify.y);
  float64_t v18 = v4;
  float64_t v19 = v3;
  double v5 = [[(UIPDFPageView *)[(UIPDFMagnifierController *)self pageView] page] selection];
  v6.f64[0] = v19;
  v6.f64[1] = v18;
  float64x2_t v20 = v6;
  if (v5)
  {
    double v7 = v5;
    if ([(UIPDFSelection *)v5 numberOfRectangles])
    {
      memset(v26, 0, sizeof(v26));
      float64x2_t v24 = 0u;
      float64x2_t v25 = 0u;
      float64x2_t v23 = 0u;
      [(UIPDFSelection *)v7 getBounds:v26 transform:&v23 index:0];
      *(float64x2_t *)&v22.a = v23;
      *(float64x2_t *)&v22.c = v24;
      *(float64x2_t *)&v22.tdouble x = v25;
      if (!CGAffineTransformIsIdentity(&v22))
      {
        -[UIPDFPageView convertPointToPDFPageSpace:]([(UIPDFMagnifierController *)self pageView], "convertPointToPDFPageSpace:", self->_touchPoint.x, self->_touchPoint.y);
        double v9 = v8;
        double v11 = v10;
        -[UIPDFPageView convertPointToPDFPageSpace:]([(UIPDFMagnifierController *)self pageView], "convertPointToPDFPageSpace:", self->_pointToMagnify.x, self->_pointToMagnify.y);
        double v13 = v12;
        double v15 = v14;
        *(float64x2_t *)&v21.a = v23;
        *(float64x2_t *)&v21.c = v24;
        *(float64x2_t *)&v21.tdouble x = v25;
        memset(&v22, 0, sizeof(v22));
        CGAffineTransformInvert(&v22, &v21);
        float64x2_t v20 = vaddq_f64(v25, vaddq_f64(vmulq_n_f64(v23, v22.tx + v9 * v22.a + v11 * v22.c), vmulq_n_f64(v24, v22.ty + v13 * v22.b + v15 * v22.d)));
      }
    }
  }
  double v17 = v20.f64[1];
  double v16 = v20.f64[0];
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (void)setImageContainerPositionMagnifier
{
  [(UIPDFMagnifierController *)self viewPointInTextEffectsSpace];
  double v4 = v3;
  double v6 = v5;
  [[(UIPDFPageView *)[(UIPDFMagnifierController *)self pageView] page] cropBox];
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;
  double MidX = CGRectGetMidX(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v29);
  [(UIPDFMagnifierController *)self pointToMagnifyInPDFSpace];
  double v14 = v13;
  double v16 = v15;
  if (self->_pageRotation)
  {
    -[UIPDFMagnifierController convertPointToRotatedPage:](self, "convertPointToRotatedPage:", MidX, MidY);
    double MidX = v17;
    double MidY = v18;
    -[UIPDFMagnifierController convertPointToRotatedPage:](self, "convertPointToRotatedPage:", v14, v16);
    double v14 = v19;
    double v16 = v20;
  }
  double enlargementScale = self->_enlargementScale;
  float v22 = v4 + (MidX - v14) * enlargementScale;
  double v23 = roundf(v22);
  float v24 = v6 + (v16 - MidY) * enlargementScale + -50.0;
  double v25 = roundf(v24);
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  imageContainer = self->_imageContainer;
  -[CALayer setPosition:](imageContainer, "setPosition:", v23, v25);
}

- (void)setImageContainerPositionLoupe
{
  [(UIPDFMagnifierController *)self viewPointInTextEffectsSpace];
  double v4 = v3;
  double v6 = v5;
  [[(UIPDFPageView *)[(UIPDFMagnifierController *)self pageView] page] cropBox];
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;
  double MidX = CGRectGetMidX(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v29);
  -[UIPDFPageView convertPointToPDFPageSpace:]([(UIPDFMagnifierController *)self pageView], "convertPointToPDFPageSpace:", self->_touchPoint.x, self->_touchPoint.y);
  double v14 = v13;
  double v16 = v15;
  if (self->_pageRotation)
  {
    -[UIPDFMagnifierController convertPointToRotatedPage:](self, "convertPointToRotatedPage:", MidX, MidY);
    double MidX = v17;
    double MidY = v18;
    -[UIPDFMagnifierController convertPointToRotatedPage:](self, "convertPointToRotatedPage:", v14, v16);
    double v14 = v19;
    double v16 = v20;
  }
  double enlargementScale = self->_enlargementScale;
  float v22 = v4 + (MidX - v14) * enlargementScale;
  double v23 = roundf(v22);
  float v24 = v6 + (v16 - MidY) * enlargementScale + -60.0;
  double v25 = roundf(v24);
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  imageContainer = self->_imageContainer;
  -[CALayer setPosition:](imageContainer, "setPosition:", v23, v25);
}

- (void)setLayerPositions
{
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  -[UIView convertPoint:fromView:](self->_textEffectsWindow, "convertPoint:fromView:", [(UIPDFMagnifierController *)self pageView], self->_touchPoint.x, self->_touchPoint.y);
  double v4 = v3;
  double v6 = v5;
  -[CALayer convertPoint:toLayer:]([(UIView *)self->_textEffectsSubView layer], "convertPoint:toLayer:", self->_imageContainer, v3, v5);
  if (self->_loupe) {
    double v9 = 60.0;
  }
  else {
    double v9 = 40.0;
  }
  double v10 = v8 - v9;
  float v11 = v7;
  double v12 = roundf(v11);
  double v13 = -4.0;
  if (!self->_loupe) {
    double v13 = 0.0;
  }
  float v14 = v10;
  -[CALayer setPosition:](self->_maskLayer, "setPosition:", v12, v13 + roundf(v14));
  float v15 = v4;
  float v16 = roundf(v15);
  double v17 = v16;
  float v18 = v6 - v9;
  double v19 = roundf(v18);
  loLayer = self->_loLayer;
  if (loLayer) {
    -[CALayer setPosition:](loLayer, "setPosition:", v16, v19);
  }
  hiLayer = self->_hiLayer;
  -[CALayer setPosition:](hiLayer, "setPosition:", v17, v19);
}

- (void)addBling
{
  [+[UIScreen mainScreen] scale];
  double v4 = v3;
  if (self->_loupe) {
    double v5 = @"kb-loupe-hi.png";
  }
  else {
    double v5 = @"RangedMagnifierGlass_Horizontal_Normal.png";
  }
  id v6 = +[UIImage kitImageNamed:v5];
  [v6 size];
  double v8 = v7;
  [v6 size];
  double v10 = v9;
  float v11 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  self->_hiLayer = v11;
  -[CALayer setBounds:](v11, "setBounds:", 0.0, 0.0, v8, v10);
  -[CALayer setContents:](self->_hiLayer, "setContents:", [v6 CGImage]);
  [(CALayer *)self->_hiLayer setContentsScale:v4];
  double v12 = [(UIView *)self->_textEffectsSubView layer];
  hiLayer = self->_hiLayer;
  imageContainer = self->_imageContainer;
  [(CALayer *)v12 insertSublayer:hiLayer above:imageContainer];
}

- (void)setSelectionPath:(CGPath *)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MaxX = CGRectGetMaxX(a4);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v46);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  double v42 = CGRectGetMaxX(v47);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v48);
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v49);
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  double v14 = CGRectGetMaxY(v50);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  double v15 = CGRectGetMinX(v51);
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  CGFloat v16 = CGRectGetMinY(v52);
  double b = a5->b;
  double c = a5->c;
  double d = a5->d;
  tCGFloat x = a5->tx;
  tCGFloat y = a5->ty;
  double v22 = tx + v42 * a5->a + MaxY * c;
  double v23 = ty + v42 * b + MaxY * d;
  double v24 = tx + MinX * a5->a + v14 * c;
  double v25 = ty + MinX * b + v14 * d;
  double v26 = tx + v15 * a5->a + v16 * c;
  double v27 = ty + v15 * b + v16 * d;
  -[UIPDFMagnifierController convertPointToEnlargedSpace:](self, "convertPointToEnlargedSpace:", tx + MaxX * a5->a + MinY * c, ty + MaxX * b + MinY * d);
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  -[UIPDFMagnifierController convertPointToEnlargedSpace:](self, "convertPointToEnlargedSpace:", v22, v23);
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  -[UIPDFMagnifierController convertPointToEnlargedSpace:](self, "convertPointToEnlargedSpace:", v24, v25);
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  -[UIPDFMagnifierController convertPointToEnlargedSpace:](self, "convertPointToEnlargedSpace:", v26, v27);
  CPSetCGPathPoints4(a3, v29, v31, v33, v35, v37, v39, v40, v41);
  CGPathCloseSubpath(a3);
}

- (void)setSelectionPath
{
  double v3 = [[(UIPDFPageView *)[(UIPDFMagnifierController *)self pageView] page] selection];
  if (v3 && (v4 = v3, (uint64_t v5 = [(UIPDFSelection *)v3 numberOfRectangles]) != 0))
  {
    uint64_t v6 = v5;
    Mutable = CGPathCreateMutable();
    uint64_t v8 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    memset(&v11, 0, sizeof(v11));
    do
    {
      [(UIPDFSelection *)v4 getBounds:&v12 transform:&v11 index:v8];
      CGAffineTransform v10 = v11;
      if (CGAffineTransformIsIdentity(&v10))
      {
        -[UIPDFMagnifierController convertRectToEnlargedSpace:](self, "convertRectToEnlargedSpace:", v12, v13);
        *(CGFloat *)&long long v12 = v15.origin.x;
        *((void *)&v12 + 1) = *(void *)&v15.origin.y;
        *(CGFloat *)&long long v13 = v15.size.width;
        *((void *)&v13 + 1) = *(void *)&v15.size.height;
        CGPathAddRect(Mutable, 0, v15);
      }
      else
      {
        CGAffineTransform v10 = v11;
        -[UIPDFMagnifierController setSelectionPath:bounds:transform:](self, "setSelectionPath:bounds:transform:", Mutable, &v10, v12, v13);
      }
      ++v8;
    }
    while (v6 != v8);
    [(CAShapeLayer *)self->_selectionLayer setPath:Mutable];
    CGPathRelease(Mutable);
  }
  else
  {
    selectionLayer = self->_selectionLayer;
    [(CAShapeLayer *)selectionLayer setPath:0];
  }
}

- (void)placeImage
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(UIPDFMagnifierController *)self setPower];
  -[UIPDFPageView convertRectFromPDFPageSpace:]([(UIPDFMagnifierController *)self pageView], "convertRectFromPDFPageSpace:", 0.0, 0.0, 1.0, 1.0);
  self->_double enlargementScale = self->_power * v3;
  double v4 = [(UIPDFPageView *)[(UIPDFMagnifierController *)self pageView] page];
  [(UIPDFPage *)v4 cropBox];
  double enlargementScale = self->_enlargementScale;
  float v7 = enlargementScale * v6;
  double v8 = roundf(v7);
  *(float *)&double enlargementScale = enlargementScale * v9;
  double v10 = roundf(*(float *)&enlargementScale);
  unint64_t v11 = [(UIPDFPage *)v4 rotation];
  self->_unint64_t pageRotation = v11;
  if (v11 == 270 || v11 == 90)
  {
    double v12 = v8;
  }
  else
  {
    double v12 = v10;
    double v10 = v8;
  }
  long long v13 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  self->_imageContainer = v13;
  -[CALayer setBounds:](v13, "setBounds:", 0.0, 0.0, v10, v12);
  self->_imageLayer = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  [(CALayer *)self->_imageContainer bounds];
  -[CALayer setBounds:](self->_imageLayer, "setBounds:");
  -[CALayer setPosition:](self->_imageLayer, "setPosition:", v10 * 0.5, v12 * 0.5);
  [(CALayer *)self->_imageContainer addSublayer:self->_imageLayer];
  self->_selectionLayer = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
  [(CALayer *)self->_imageLayer bounds];
  -[CAShapeLayer setBounds:](self->_selectionLayer, "setBounds:");
  [(CALayer *)self->_imageLayer position];
  -[CAShapeLayer setPosition:](self->_selectionLayer, "setPosition:");
  long long v18 = xmmword_186B9C4D0;
  long long v19 = unk_186B9C4E0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGRect v15 = CGColorCreate(DeviceRGB, (const CGFloat *)&v18);
  -[CAShapeLayer setFillColor:](self->_selectionLayer, "setFillColor:", v15, v18, v19);
  CGColorRelease(v15);
  CGColorSpaceRelease(DeviceRGB);
  [(CALayer *)self->_imageContainer addSublayer:self->_selectionLayer];
  if (self->_loupe) {
    [(UIPDFMagnifierController *)self setImageContainerPositionLoupe];
  }
  else {
    [(UIPDFMagnifierController *)self setImageContainerPositionMagnifier];
  }
  [+[UIScreen mainScreen] scale];
  double v17 = v16;
  -[CALayer setContentsScale:](self->_imageLayer, "setContentsScale:");
  [(UIPDFPage *)v4 deliverImageWithWidth:(unint64_t)(v10 * v17) height:(unint64_t)(v12 * v17) receiver:self selector:sel_imageReceived_data_ info:self->_imageLayer];
  [(CALayer *)[(UIView *)self->_textEffectsSubView layer] addSublayer:self->_imageContainer];
  [(UIPDFMagnifierController *)self addBling];
  [(UIPDFMagnifierController *)self setSelectionPath];
  if (!self->_loupe) {
    [(UIPDFMagnifierController *)self addTextRangeHandles];
  }
}

- (id)imageReceived:(id)a3 data:(id)a4
{
  if (a3)
  {
    uint64_t v5 = [a3 CGImage];
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [a4 setContents:v5];
    [MEMORY[0x1E4F39CF8] commit];
  }
  else
  {
    [(UIPDFMagnifierController *)self hide];
  }
  return 0;
}

- (void)setImageContainerMask
{
  if (self->_loupe) {
    double v3 = @"kb-loupe-mask.png";
  }
  else {
    double v3 = @"RangedMagnifierMask_Horizontal_Normal.png";
  }
  id v4 = +[UIImage kitImageNamed:v3];
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 CGImage];
  double v10 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  self->_maskLayer = v10;
  -[CALayer setBounds:](v10, "setBounds:", 0.0, 0.0, v6, v8);
  [(CALayer *)self->_maskLayer setContents:v9];
  [v4 scale];
  -[CALayer setContentsScale:](self->_maskLayer, "setContentsScale:");
  if (!self->_loupe)
  {
    CGFloat v15 = 0.0;
    if ([(UIPDFMagnifierController *)self isSelectionUniformlyRotated:&v15])
    {
      memset(&v14, 0, sizeof(v14));
      CATransform3DMakeRotation(&v14, v15, 0.0, 0.0, 1.0);
      CATransform3D v13 = v14;
      [(CALayer *)self->_maskLayer setTransform:&v13];
      CATransform3D v12 = v14;
      [(CALayer *)self->_hiLayer setTransform:&v12];
      CATransform3D v11 = v14;
      [(CALayer *)self->_loLayer setTransform:&v11];
    }
  }
  [(UIPDFMagnifierController *)self setLayerPositions];
  [(CALayer *)self->_imageContainer setMask:self->_maskLayer];
}

- (void)setTextRangeHandlePositions
{
  double v3 = [[(UIPDFPageView *)[(UIPDFMagnifierController *)self pageView] page] selection];
  uint64_t v4 = [(UIPDFSelection *)v3 numberOfRectangles];
  if (v4)
  {
    uint64_t v5 = v4;
    memset(&v47, 0, sizeof(v47));
    memset(&v46, 0, sizeof(v46));
    float64x2_t v44 = 0u;
    float64x2_t v45 = 0u;
    float64x2_t v42 = 0u;
    float64x2_t v43 = 0u;
    float64x2_t v40 = 0u;
    float64x2_t v41 = 0u;
    [(UIPDFSelection *)v3 getBounds:&v47 transform:&v43 index:0];
    [(UIPDFSelection *)v3 getBounds:&v46 transform:&v40 index:v5 - 1];
    *(float64x2_t *)&v39.m11 = v40;
    *(float64x2_t *)&v39.m13 = v41;
    *(float64x2_t *)&v39.m21 = v42;
    if (CGAffineTransformIsIdentity((CGAffineTransform *)&v39))
    {
      -[UIPDFMagnifierController convertRectToEnlargedSpace:](self, "convertRectToEnlargedSpace:", *(_OWORD *)&v47.origin, *(_OWORD *)&v47.size);
      v47.origin.CGFloat x = v6;
      v47.origin.CGFloat y = v7;
      v47.size.CGFloat width = v8;
      v47.size.CGFloat height = v9;
      -[UIPDFMagnifierController convertRectToEnlargedSpace:](self, "convertRectToEnlargedSpace:", *(_OWORD *)&v46.origin, *(_OWORD *)&v46.size);
      CGRect v46 = v48;
      double MaxX = CGRectGetMaxX(v48);
      double MidY = CGRectGetMidY(v46);
      -[CALayer setBounds:](self->_rightBar, "setBounds:", 0.0, 0.0, 2.0, CGRectGetHeight(v46));
      -[CALayer setPosition:](self->_rightBar, "setPosition:", MaxX, MidY);
      double MinX = CGRectGetMinX(v47);
      double v13 = CGRectGetMidY(v47);
      -[CALayer setBounds:](self->_leftBar, "setBounds:", 0.0, 0.0, 2.0, CGRectGetHeight(v47));
      -[CALayer setPosition:](self->_leftBar, "setPosition:", MinX, v13);
    }
    else
    {
      *(float64x2_t *)&v39.m11 = v40;
      *(float64x2_t *)&v39.m13 = v41;
      *(float64x2_t *)&v39.m21 = v42;
      CPRotationDegreesFromTransform(&v39.m11);
      double v15 = (v14 - (double)self->_pageRotation) * 3.14159265;
      memset(&v39, 0, sizeof(v39));
      CATransform3DMakeRotation(&v39, v15 / -180.0, 0.0, 0.0, 1.0);
      double v16 = CGRectGetHeight(v46) * self->_enlargementScale;
      *(double *)&long long v17 = CGRectGetMaxX(v46);
      long long v35 = v17;
      CGFloat y = v46.origin.y;
      *(CGFloat *)&long long v17 = v46.origin.x;
      CGSize size = v46.size;
      float64x2_t v20 = vaddq_f64(v42, vaddq_f64(vmulq_n_f64(v40, *(double *)&v35), vmulq_n_f64(v41, CGRectGetMidY(*(CGRect *)&v17))));
      double v21 = v20.f64[1];
      if (self->_pageRotation) {
        [(UIPDFMagnifierController *)self convertPointToRotatedPage:*(_OWORD *)&v20];
      }
      -[UIPDFMagnifierController convertPointToEnlargedSpace:](self, "convertPointToEnlargedSpace:", v20.f64[0], v21, v35);
      double v23 = v22;
      double v25 = v24;
      -[CALayer setBounds:](self->_rightBar, "setBounds:", 0.0, 0.0, 2.0, v16);
      -[CALayer setPosition:](self->_rightBar, "setPosition:", v23, v25);
      CATransform3D v38 = v39;
      [(CALayer *)self->_rightBar setTransform:&v38];
      *(float64x2_t *)&v37.m11 = v43;
      *(float64x2_t *)&v37.m13 = v44;
      *(float64x2_t *)&v37.m21 = v45;
      CPRotationDegreesFromTransform(&v37.m11);
      CATransform3DMakeRotation(&v37, (v26 - (double)self->_pageRotation) * 3.14159265 / -180.0, 0.0, 0.0, 1.0);
      CATransform3D v39 = v37;
      CGFloat v27 = CGRectGetHeight(v47) * self->_enlargementScale;
      *(double *)&long long v28 = CGRectGetMinX(v47);
      long long v34 = v28;
      [(UIPDFMagnifierController *)self convertPointToEnlargedSpace:vaddq_f64(v45, vaddq_f64(vmulq_n_f64(v43, *(double *)&v28), vmulq_n_f64(v44, CGRectGetMidY(v47))))];
      double v30 = v29;
      double v32 = v31;
      -[CALayer setBounds:](self->_leftBar, "setBounds:", 0.0, 0.0, 2.0, v27);
      -[CALayer setPosition:](self->_leftBar, "setPosition:", v30, v32);
      CATransform3D v36 = v39;
      [(CALayer *)self->_leftBar setTransform:&v36];
    }
    [(CALayer *)self->_rightBar bounds];
    double Height = CGRectGetHeight(v49);
    [(CALayer *)self->_rightGrabber bounds];
    -[CALayer setPosition:](self->_rightGrabber, "setPosition:", 0.0, Height + CGRectGetHeight(v50) * 0.5);
    [(CALayer *)self->_leftGrabber bounds];
    -[CALayer setPosition:](self->_leftGrabber, "setPosition:", 0.0, CGRectGetHeight(v51) * -0.5);
  }
}

- (void)addTextRangeHandles
{
  double v3 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  self->_leftBar = v3;
  [(CALayer *)v3 setBackgroundColor:self->_grabberColor];
  [(CALayer *)self->_imageContainer addSublayer:self->_leftBar];
  uint64_t v4 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  self->_rightBar = v4;
  [(CALayer *)v4 setBackgroundColor:self->_grabberColor];
  [(CALayer *)self->_imageContainer addSublayer:self->_rightBar];
  [+[UIScreen mainScreen] scale];
  double v6 = v5 * 14.0;
  CGFloat v7 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  self->_rightGrabber = v7;
  -[CALayer setBounds:](v7, "setBounds:", 0.0, 0.0, v6, v6);
  [(CALayer *)self->_rightGrabber setDelegate:self];
  [(CALayer *)self->_rightBar addSublayer:self->_rightGrabber];
  CGFloat v8 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  self->_leftGrabber = v8;
  -[CALayer setBounds:](v8, "setBounds:", 0.0, 0.0, v6, v6);
  [(CALayer *)self->_leftGrabber setDelegate:self];
  [(CALayer *)self->_leftBar addSublayer:self->_leftGrabber];
  [(UIPDFMagnifierController *)self setTextRangeHandlePositions];
  [(CALayer *)self->_rightGrabber setNeedsDisplay];
  leftGrabber = self->_leftGrabber;
  [(CALayer *)leftGrabber setNeedsDisplay];
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  [a3 bounds];
  grabberColor = self->_grabberColor;
  CPCGInsetFillEllipseInRect(a4, grabberColor, v6, v7, v8, v9);
}

@end