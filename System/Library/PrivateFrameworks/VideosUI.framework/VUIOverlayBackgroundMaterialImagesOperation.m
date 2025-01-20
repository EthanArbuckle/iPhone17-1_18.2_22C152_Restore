@interface VUIOverlayBackgroundMaterialImagesOperation
- (CGSize)resizedBackgroundImageSize;
- (NSArray)overlayMaterialRequests;
- (NSDictionary)overlayMaterialImageByIdentifier;
- (UIImage)resizedSourceBackgroundImage;
- (UIImage)sourceBackgroundImage;
- (VUIOverlayBackgroundMaterialImagesOperation)init;
- (VUIOverlayBackgroundMaterialImagesOperation)initWithSourceBackgroundImage:(id)a3;
- (id)_blurredMaterialImageWithSourceBackgroundImage:(id)a3 forRect:(CGRect)a4 croppedRect:(CGRect)a5;
- (void)main;
- (void)setOverlayMaterialImageByIdentifier:(id)a3;
- (void)setOverlayMaterialRequests:(id)a3;
- (void)setResizedBackgroundImageSize:(CGSize)a3;
- (void)setResizedSourceBackgroundImage:(id)a3;
- (void)setSourceBackgroundImage:(id)a3;
@end

@implementation VUIOverlayBackgroundMaterialImagesOperation

- (VUIOverlayBackgroundMaterialImagesOperation)initWithSourceBackgroundImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIOverlayBackgroundMaterialImagesOperation;
  v6 = [(VUIOverlayBackgroundMaterialImagesOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sourceBackgroundImage, a3);
  }

  return v7;
}

- (VUIOverlayBackgroundMaterialImagesOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (void)main
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (([(VUIOverlayBackgroundMaterialImagesOperation *)self isCancelled] & 1) == 0)
  {
    v3 = [(VUIOverlayBackgroundMaterialImagesOperation *)self sourceBackgroundImage];
    [(VUIOverlayBackgroundMaterialImagesOperation *)self resizedBackgroundImageSize];
    double v5 = fabs(v4);
    [(VUIOverlayBackgroundMaterialImagesOperation *)self resizedBackgroundImageSize];
    double v7 = fabs(v6);
    if (v5 != *MEMORY[0x1E4F1DB30] || v7 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      [v3 size];
      if (v5 != v10 || v7 != v9)
      {
        v41.width = v5;
        v41.height = v7;
        UIGraphicsBeginImageContextWithOptions(v41, 0, 0.0);
        objc_msgSend(v3, "drawInRect:", 0.0, 0.0, v5, v7);
        uint64_t v12 = UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();
        [(VUIOverlayBackgroundMaterialImagesOperation *)self setResizedSourceBackgroundImage:v12];
        v3 = (void *)v12;
      }
    }
    v13 = [(VUIOverlayBackgroundMaterialImagesOperation *)self overlayMaterialRequests];
    if ([v13 count]) {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    else {
      id v14 = 0;
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v21 = objc_msgSend(v20, "identifier", (void)v35);
          [v20 rect];
          double v23 = v22;
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          [v20 croppedRect];
          v34 = -[VUIOverlayBackgroundMaterialImagesOperation _blurredMaterialImageWithSourceBackgroundImage:forRect:croppedRect:](self, "_blurredMaterialImageWithSourceBackgroundImage:forRect:croppedRect:", v3, v23, v25, v27, v29, v30, v31, v32, v33);
          objc_msgSend(v14, "vui_setObjectIfNotNil:forKey:", v34, v21);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v17);
    }

    if (([(VUIOverlayBackgroundMaterialImagesOperation *)self isCancelled] & 1) == 0) {
      [(VUIOverlayBackgroundMaterialImagesOperation *)self setOverlayMaterialImageByIdentifier:v14];
    }
  }
}

- (id)_blurredMaterialImageWithSourceBackgroundImage:(id)a3 forRect:(CGRect)a4 croppedRect:(CGRect)a5
{
  if (!a3) {
    goto LABEL_6;
  }
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v9 = a4.size.width;
  id v10 = a3;
  double v11 = (double)CGImageGetWidth((CGImageRef)[v10 CGImage]) / v9;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGFloat v12 = CGRectGetMinX(v28) * v11;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGFloat v13 = CGRectGetMinY(v29) * v11;
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGFloat v14 = v11 * CGRectGetWidth(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGFloat v15 = v11 * CGRectGetHeight(v31);
  id v16 = v10;
  uint64_t v17 = (CGImage *)[v16 CGImage];

  v32.origin.CGFloat x = v12;
  v32.origin.CGFloat y = v13;
  v32.size.CGFloat width = v14;
  v32.size.CGFloat height = v15;
  CGImageRef v18 = CGImageCreateWithImageInRect(v17, v32);
  if (!v18)
  {
LABEL_6:
    double v25 = 0;
    goto LABEL_10;
  }
  v19 = v18;
  v20 = [MEMORY[0x1E4FB1818] imageWithCGImage:v18];
  v21 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v22 = [v21 userInterfaceIdiom];

  double v23 = [MEMORY[0x1E4FB1FE8] settingsForPrivateStyle:4001];
  if (v22 != 2)
  {
    double v24 = 0.6;
    goto LABEL_8;
  }
  if (!UIAccessibilityIsReduceTransparencyEnabled())
  {
    double v24 = 0.55;
LABEL_8:
    [v23 setColorTintAlpha:v24];
  }
  double v25 = [v20 _applyBackdropViewSettings:v23];
  CGImageRelease(v19);

LABEL_10:
  return v25;
}

- (CGSize)resizedBackgroundImageSize
{
  double width = self->_resizedBackgroundImageSize.width;
  double height = self->_resizedBackgroundImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setResizedBackgroundImageSize:(CGSize)a3
{
  self->_resizedBackgroundImageSize = a3;
}

- (NSArray)overlayMaterialRequests
{
  return self->_overlayMaterialRequests;
}

- (void)setOverlayMaterialRequests:(id)a3
{
}

- (UIImage)resizedSourceBackgroundImage
{
  return self->_resizedSourceBackgroundImage;
}

- (void)setResizedSourceBackgroundImage:(id)a3
{
}

- (NSDictionary)overlayMaterialImageByIdentifier
{
  return self->_overlayMaterialImageByIdentifier;
}

- (void)setOverlayMaterialImageByIdentifier:(id)a3
{
}

- (UIImage)sourceBackgroundImage
{
  return self->_sourceBackgroundImage;
}

- (void)setSourceBackgroundImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBackgroundImage, 0);
  objc_storeStrong((id *)&self->_overlayMaterialImageByIdentifier, 0);
  objc_storeStrong((id *)&self->_resizedSourceBackgroundImage, 0);
  objc_storeStrong((id *)&self->_overlayMaterialRequests, 0);
}

@end