@interface CIImage(PhotosUIFoundation)
- (id)px_imageByApplyingAlpha:()PhotosUIFoundation;
- (id)px_imageByApplyingScale:()PhotosUIFoundation;
@end

@implementation CIImage(PhotosUIFoundation)

- (id)px_imageByApplyingScale:()PhotosUIFoundation
{
  [a1 extent];
  double v5 = v4;
  double v7 = v6;
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v14, v4 * -0.5, v6 * -0.5);
  CGAffineTransformMakeScale(&t2, a2, a2);
  CGAffineTransform t1 = v14;
  CGAffineTransformConcat(&v13, &t1, &t2);
  CGAffineTransform v14 = v13;
  CGAffineTransformMakeTranslation(&v10, v5 * a2 * 0.5, v7 * a2 * 0.5);
  CGAffineTransform t1 = v14;
  CGAffineTransformConcat(&v13, &t1, &v10);
  CGAffineTransform v14 = v13;
  v8 = [a1 imageByApplyingTransform:&v13];

  return v8;
}

- (id)px_imageByApplyingAlpha:()PhotosUIFoundation
{
  v8[4] = *MEMORY[0x263EF8340];
  double v4 = [MEMORY[0x263F00640] colorMatrixFilter];
  memset(v8, 0, 24);
  *(double *)&v8[3] = a2;
  [v4 setDefaults];
  double v5 = [MEMORY[0x263F00680] vectorWithValues:v8 count:4];
  [v4 setAVector:v5];

  [v4 setInputImage:a1];
  double v6 = [v4 outputImage];

  return v6;
}

@end