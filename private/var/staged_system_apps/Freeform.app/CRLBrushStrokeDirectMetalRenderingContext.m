@interface CRLBrushStrokeDirectMetalRenderingContext
- (CAMetalDrawable)metalDrawable;
- (CGAffineTransform)transform;
- (CGColorSpace)destinationColorSpaceOverride;
- (CGRect)frame;
- (CRLBrushStrokeDirectMetalRenderingContext)initWithMetalDrawable:(id)a3 frame:(CGRect)a4 transform:(CGAffineTransform *)a5 contentsScale:(double)a6 destinationColorSpaceOverride:(CGColorSpace *)a7 metalDeviceOverride:(id)a8;
- (MTLDevice)metalDeviceOverride;
- (double)contentsScale;
- (void)dealloc;
@end

@implementation CRLBrushStrokeDirectMetalRenderingContext

- (CRLBrushStrokeDirectMetalRenderingContext)initWithMetalDrawable:(id)a3 frame:(CGRect)a4 transform:(CGAffineTransform *)a5 contentsScale:(double)a6 destinationColorSpaceOverride:(CGColorSpace *)a7 metalDeviceOverride:(id)a8
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v18 = a3;
  id v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CRLBrushStrokeDirectMetalRenderingContext;
  v20 = [(CRLBrushStrokeDirectMetalRenderingContext *)&v25 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_metalDrawable, a3);
    v21->_frame.origin.CGFloat x = x;
    v21->_frame.origin.CGFloat y = y;
    v21->_frame.size.CGFloat width = width;
    v21->_frame.size.CGFloat height = height;
    long long v22 = *(_OWORD *)&a5->a;
    long long v23 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v21->_transform.tCGFloat x = *(_OWORD *)&a5->tx;
    *(_OWORD *)&v21->_transform.c = v23;
    *(_OWORD *)&v21->_transform.a = v22;
    v21->_contentsScale = a6;
    v21->_destinationColorSpaceOverride = CGColorSpaceRetain(a7);
    objc_storeStrong((id *)&v21->_metalDeviceOverride, a8);
  }

  return v21;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_destinationColorSpaceOverride);
  v3.receiver = self;
  v3.super_class = (Class)CRLBrushStrokeDirectMetalRenderingContext;
  [(CRLBrushStrokeDirectMetalRenderingContext *)&v3 dealloc];
}

- (CAMetalDrawable)metalDrawable
{
  return self->_metalDrawable;
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

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[2].b;
  return self;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (CGColorSpace)destinationColorSpaceOverride
{
  return self->_destinationColorSpaceOverride;
}

- (MTLDevice)metalDeviceOverride
{
  return self->_metalDeviceOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDeviceOverride, 0);

  objc_storeStrong((id *)&self->_metalDrawable, 0);
}

@end