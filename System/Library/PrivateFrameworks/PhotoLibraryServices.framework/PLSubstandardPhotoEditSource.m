@interface PLSubstandardPhotoEditSource
+ (id)_imageWithImage:(id)a3 orientation:(int64_t)a4;
- (PLSubstandardPhotoEditSource)initWithImage:(id)a3 orientation:(int64_t)a4;
- (PLSubstandardPhotoEditSource)initWithImage:(id)a3 orientation:(int64_t)a4 size:(CGSize)a5;
@end

@implementation PLSubstandardPhotoEditSource

- (PLSubstandardPhotoEditSource)initWithImage:(id)a3 orientation:(int64_t)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v9 = +[PLSubstandardPhotoEditSource _imageWithImage:orientation:](PLSubstandardPhotoEditSource, "_imageWithImage:orientation:", a3);
  [v9 extent];
  if (width != v10 || height != v11)
  {
    double v13 = width / v10;
    if (width / v10 < height / v11) {
      double v13 = height / v11;
    }
    CGAffineTransformMakeScale(&v20, v13, v13);
    v14 = [v9 imageByApplyingTransform:&v20];

    [v14 extent];
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.double width = width;
    v22.size.double height = height;
    if (CGRectEqualToRect(v21, v22))
    {
      v9 = v14;
    }
    else
    {
      v15 = [v14 imageByClampingToExtent];

      v9 = objc_msgSend(v15, "imageByCroppingToRect:", 0.0, 0.0, width, height);
    }
  }
  v16 = [getPIPhotoEditHelperClass_84181() imageSourceWithCIImage:v9 orientation:a4];
  v19.receiver = self;
  v19.super_class = (Class)PLSubstandardPhotoEditSource;
  v17 = [(PLEditSource *)&v19 initWithResolvedSource:v16 mediaType:1];

  return v17;
}

- (PLSubstandardPhotoEditSource)initWithImage:(id)a3 orientation:(int64_t)a4
{
  v6 = +[PLSubstandardPhotoEditSource _imageWithImage:orientation:](PLSubstandardPhotoEditSource, "_imageWithImage:orientation:", a3);
  v7 = [getPIPhotoEditHelperClass_84181() imageSourceWithCIImage:v6 orientation:a4];
  v10.receiver = self;
  v10.super_class = (Class)PLSubstandardPhotoEditSource;
  v8 = [(PLEditSource *)&v10 initWithResolvedSource:v7 mediaType:1];

  return v8;
}

+ (id)_imageWithImage:(id)a3 orientation:(int64_t)a4
{
  v5 = [MEMORY[0x1E4F1E050] imageWithCGImage:DCIM_CGImageRefFromPLImage()];
  v6 = v5;
  if (a4 == 8) {
    unsigned int v7 = 6;
  }
  else {
    unsigned int v7 = a4;
  }
  if (a4 == 6) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = v7;
  }
  v9 = [v5 imageByApplyingOrientation:v8];

  return v9;
}

@end