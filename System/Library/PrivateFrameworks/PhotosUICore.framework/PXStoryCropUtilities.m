@interface PXStoryCropUtilities
+ (CGRect)suggestedCropWithAspectRatio:(double)a3 forAssetWithSize:(CGSize)a4 faceCount:(int64_t)a5 faceRects:(const CGRect *)a6 featuredFaceCount:(int64_t)a7;
@end

@implementation PXStoryCropUtilities

+ (CGRect)suggestedCropWithAspectRatio:(double)a3 forAssetWithSize:(CGSize)a4 faceCount:(int64_t)a5 faceRects:(const CGRect *)a6 featuredFaceCount:(int64_t)a7
{
  if (a5 <= 0)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4.width, a4.height);
    [v9 handleFailureInMethod:a2, a1, @"PXStoryCropUtilities.m", 22, @"Invalid parameter not satisfying: %@", @"faceCount > 0" object file lineNumber description];
  }
  PXRectWithOriginAndSize();
}

@end