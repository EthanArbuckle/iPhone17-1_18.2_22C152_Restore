@interface CRLShapeRenderingOperation
- (BOOL)needsPressedStateBackground;
- (CRLShapeRenderingOperation)initWithImageSize:(CGSize)a3 imageScale:(double)a4 shapeType:(int64_t)a5 shapePathSource:(id)a6 angle:(double)a7 editingCoordinator:(id)a8 swatchCacheRenderingContext:(id)a9;
- (CRLSwatchRenderingContext)renderingContext;
- (UIEdgeInsets)swatchEdgeInsets;
- (double)angle;
- (void)doWorkWithReadLock;
@end

@implementation CRLShapeRenderingOperation

- (CRLShapeRenderingOperation)initWithImageSize:(CGSize)a3 imageScale:(double)a4 shapeType:(int64_t)a5 shapePathSource:(id)a6 angle:(double)a7 editingCoordinator:(id)a8 swatchCacheRenderingContext:(id)a9
{
  double height = a3.height;
  double width = a3.width;
  id v18 = a6;
  id v19 = a9;
  v23.receiver = self;
  v23.super_class = (Class)CRLShapeRenderingOperation;
  v20 = -[CRLSwatchRenderingOperation initWithImageSize:imageScale:swatchFrame:editingCoordinator:](&v23, "initWithImageSize:imageScale:swatchFrame:editingCoordinator:", a8, width, height, a4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v21 = v20;
  if (v20)
  {
    v20->_shapeType = a5;
    objc_storeStrong((id *)&v20->_shapePathSource, a6);
    v21->_angle = a7;
    objc_storeStrong((id *)&v21->_swatchRenderingContext, a9);
  }

  return v21;
}

- (UIEdgeInsets)swatchEdgeInsets
{
  v2 = +[CRLSwatchCache swatchCache];
  [v2 shapeSwatchInset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v6;
  double v8 = v4;
  double v9 = v6;
  double v10 = v6;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (BOOL)needsPressedStateBackground
{
  if (self->_shapeType == 3)
  {
    v2 = [(CRLSwatchRenderingOperation *)self view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)doWorkWithReadLock
{
  [(CRLSwatchRenderingContext *)self->_swatchRenderingContext setRendersForWideGamut:[(CRLSwatchRenderingOperation *)self renderForWideGamut]];
  double v3 = +[CRLSwatchCache swatchCache];
  [(CRLSwatchRenderingOperation *)self imageSize];
  double v5 = v4;
  double v7 = v6;
  [(CRLSwatchRenderingOperation *)self imageScale];
  double v9 = v8;
  int64_t shapeType = self->_shapeType;
  shapePathSource = self->_shapePathSource;
  double angle = self->_angle;
  v13 = [(CRLSwatchRenderingOperation *)self editingCoordinator];
  [v3 imageForShapeWithSize:shapeType shapePathSource:shapePathSource imageScale:v13 editingCoordinator:self->_swatchRenderingContext renderingContext:v5 angle:v7];
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if ([(CRLSwatchRenderingOperation *)self deliversImageAutomatically]) {
    -[CRLSwatchRenderingOperation deliverCGImage:](self, "deliverCGImage:", [v14 CGImage]);
  }
  else {
    [(CRLSwatchRenderingOperation *)self provideSwatchForLaterDelivery:v14];
  }
}

- (double)angle
{
  return self->_angle;
}

- (CRLSwatchRenderingContext)renderingContext
{
  return self->_swatchRenderingContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swatchRenderingContext, 0);

  objc_storeStrong((id *)&self->_shapePathSource, 0);
}

@end