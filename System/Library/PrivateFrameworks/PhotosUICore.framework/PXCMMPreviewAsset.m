@interface PXCMMPreviewAsset
- (BOOL)hasPeopleSceneMidOrGreaterConfidence;
- (BOOL)isEligibleForAutoPlayback;
- (BOOL)isFavorite;
- (BOOL)isInCloud;
- (BOOL)isInSharedLibrary;
- (BOOL)isPartOfStack;
- (BOOL)isPreviewImageDataAvailable;
- (BOOL)representsBurst;
- (CGRect)acceptableCropRect;
- (CGRect)bestCropRectForAspectRatio:(double)a3;
- (CGRect)bestCropRectForAspectRatio:(double)a3 verticalContentMode:(int64_t)a4 cropMode:(int64_t)a5;
- (CGRect)faceAreaRect;
- (CGRect)preferredCropRect;
- (CGSize)size;
- (Class)defaultImageProviderClass;
- (NSData)previewImageData;
- (NSDate)creationDate;
- (NSString)uuid;
- (PHAsset)underlyingAsset;
- (PHMomentShare)momentShare;
- (PXCMMPreviewAsset)init;
- (PXCMMPreviewAsset)initWithMomentShare:(id)a3 underlyingAsset:(id)a4;
- (UIImage)previewImage;
- (double)aspectRatio;
- (float)audioScore;
- (int64_t)isContentEqualTo:(id)a3;
- (int64_t)mediaType;
- (int64_t)playbackStyle;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unint64_t)thumbnailIndex;
- (unsigned)playbackVariation;
@end

@implementation PXCMMPreviewAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAsset, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
}

- (PHAsset)underlyingAsset
{
  return self->_underlyingAsset;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3 verticalContentMode:(int64_t)a4 cropMode:(int64_t)a5
{
}

- (double)aspectRatio
{
  [(PXCMMPreviewAsset *)self size];
  double result = v2 / v3;
  if (v3 <= 0.0) {
    return 1.0;
  }
  return result;
}

- (CGSize)size
{
  underlyingAsset = self->_underlyingAsset;
  if (underlyingAsset)
  {
    double v4 = (double)[(PHAsset *)underlyingAsset pixelWidth];
    double v5 = (double)[(PHAsset *)self->_underlyingAsset pixelHeight];
    double v6 = v4;
  }
  else
  {
    v7 = [(PXCMMPreviewAsset *)self previewImage];
    [v7 size];
    double v9 = v8;
    double v11 = v10;

    double v6 = v9;
    double v5 = v11;
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
  [(PXCMMPreviewAsset *)self bestCropRectForAspectRatio:0 verticalContentMode:3 cropMode:a3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIImage)previewImage
{
  if (!self->_cachedImage && [(PXCMMPreviewAsset *)self isPreviewImageDataAvailable])
  {
    double v3 = [(PXCMMPreviewAsset *)self previewImageData];
    double v4 = (UIImage *)DCIM_newPLImageWithData();
    cachedImage = self->_cachedImage;
    self->_cachedImage = v4;
  }
  double v6 = self->_cachedImage;
  return v6;
}

- (NSData)previewImageData
{
  double v3 = [(PHMomentShare *)self->_momentShare preview];
  double v4 = [v3 previewImageData];
  double v5 = [v4 firstObject];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    double v8 = [(PHMomentShare *)self->_momentShare preview];
    id v7 = [v8 thumbnailImageData];
  }
  return (NSData *)v7;
}

- (BOOL)isPreviewImageDataAvailable
{
  double v3 = [(PHMomentShare *)self->_momentShare preview];
  double v4 = [v3 thumbnailImageData];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    double v6 = [(PHMomentShare *)self->_momentShare preview];
    id v7 = [v6 previewImageData];
    double v8 = [v7 firstObject];
    BOOL v5 = v8 != 0;
  }
  return v5;
}

- (int64_t)isContentEqualTo:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v5 = [(PHMomentShare *)self->_momentShare preview];
    double v6 = [v4 momentShare];
    id v7 = [v6 preview];
    int v8 = [v5 isEqual:v7];

    if (v8) {
      int64_t v9 = 2;
    }
    else {
      int64_t v9 = 1;
    }
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (CGRect)faceAreaRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)acceptableCropRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)preferredCropRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)pixelHeight
{
  [(PXCMMPreviewAsset *)self size];
  return (unint64_t)v2;
}

- (unint64_t)pixelWidth
{
  [(PXCMMPreviewAsset *)self size];
  return (unint64_t)v2;
}

- (float)audioScore
{
  return 0.0;
}

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (BOOL)isInSharedLibrary
{
  return 0;
}

- (BOOL)isInCloud
{
  return 0;
}

- (BOOL)isPartOfStack
{
  return 0;
}

- (BOOL)representsBurst
{
  return 0;
}

- (BOOL)isFavorite
{
  return 0;
}

- (unsigned)playbackVariation
{
  return 0;
}

- (int64_t)playbackStyle
{
  return 1;
}

- (NSDate)creationDate
{
  return 0;
}

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (int64_t)mediaType
{
  return 1;
}

- (NSString)uuid
{
  double v2 = [(PXCMMPreviewAsset *)self underlyingAsset];
  double v3 = [v2 uuid];

  return (NSString *)v3;
}

- (PXCMMPreviewAsset)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMPreviewAsset.m", 32, @"%s is not available as initializer", "-[PXCMMPreviewAsset init]");

  abort();
}

- (PXCMMPreviewAsset)initWithMomentShare:(id)a3 underlyingAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXCMMPreviewAsset;
  int64_t v9 = [(PXCMMPreviewAsset *)&v12 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_momentShare, a3);
    objc_storeStrong((id *)&v10->_underlyingAsset, a4);
  }

  return v10;
}

@end