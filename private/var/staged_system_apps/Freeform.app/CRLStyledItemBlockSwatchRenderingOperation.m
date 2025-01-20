@interface CRLStyledItemBlockSwatchRenderingOperation
- (CRLStyledItemBlockSwatchRenderingOperation)initWithImageSize:(CGSize)a3 imageScale:(double)a4 swatchFrame:(CGRect)a5 editingCoordinator:(id)a6 styledInfoAspectRatio:(CGSize)a7 swatchInfoBlock:(id)a8;
- (void)doWorkWithReadLock;
@end

@implementation CRLStyledItemBlockSwatchRenderingOperation

- (CRLStyledItemBlockSwatchRenderingOperation)initWithImageSize:(CGSize)a3 imageScale:(double)a4 swatchFrame:(CGRect)a5 editingCoordinator:(id)a6 styledInfoAspectRatio:(CGSize)a7 swatchInfoBlock:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v14 = a3.height;
  double v15 = a3.width;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)CRLStyledItemBlockSwatchRenderingOperation;
  v18 = -[CRLSwatchRenderingOperation initWithImageSize:imageScale:swatchFrame:editingCoordinator:](&v23, "initWithImageSize:imageScale:swatchFrame:editingCoordinator:", a6, v15, v14, a4, x, y, width, height);
  v19 = v18;
  if (v18)
  {
    v18->_styledInfoAspectRatio = a7;
    id v20 = [v17 copy];
    id swatchInfoBlock = v19->_swatchInfoBlock;
    v19->_id swatchInfoBlock = v20;
  }
  return v19;
}

- (void)doWorkWithReadLock
{
  v3 = +[CRLSwatchCache swatchCache];
  [(CRLSwatchRenderingOperation *)self imageSize];
  double v5 = v4;
  double v7 = v6;
  [(CRLSwatchRenderingOperation *)self imageScale];
  double v9 = v8;
  v10 = [(CRLSwatchRenderingOperation *)self editingCoordinator];
  [v3 imageForStyledItemWithSize:v10 imageScale:-[CRLSwatchRenderingOperation renderForWideGamut](self, "renderForWideGamut") editingCoordinator:self->_swatchInfoBlock renderForWideGamut:v5 styledInfoAspectRatio:v7 usingSwatchInfoFromBlock:self->_styledInfoAspectRatio.width, self->_styledInfoAspectRatio.height];
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  -[CRLSwatchRenderingOperation deliverCGImage:](self, "deliverCGImage:", [v11 CGImage]);
}

- (void).cxx_destruct
{
}

@end