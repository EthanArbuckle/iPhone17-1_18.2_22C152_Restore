@interface CRLImageRenderingOperation
- (CRLImageRenderingOperation)initWithImageSize:(CGSize)a3 imageScale:(double)a4 swatchFrame:(CGRect)a5 imageInfo:(id)a6 editingCoordinator:(id)a7;
- (void)doWorkWithReadLock;
@end

@implementation CRLImageRenderingOperation

- (CRLImageRenderingOperation)initWithImageSize:(CGSize)a3 imageScale:(double)a4 swatchFrame:(CGRect)a5 imageInfo:(id)a6 editingCoordinator:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v14 = a3.height;
  double v15 = a3.width;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CRLImageRenderingOperation;
  v18 = -[CRLSwatchRenderingOperation initWithImageSize:imageScale:swatchFrame:editingCoordinator:](&v21, "initWithImageSize:imageScale:swatchFrame:editingCoordinator:", a7, v15, v14, a4, x, y, width, height);
  v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_imageInfo, a6);
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
  imageInfo = self->_imageInfo;
  v11 = [(CRLSwatchRenderingOperation *)self editingCoordinator];
  [v3 imageForImageWithSize:imageInfo imageScale:v11 imageInfo:v5 editingCoordinator:[self renderForWideGamut] renderForWideGamut:v7 v9];
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  -[CRLSwatchRenderingOperation deliverCGImage:](self, "deliverCGImage:", [v12 CGImage]);
}

- (void).cxx_destruct
{
}

@end