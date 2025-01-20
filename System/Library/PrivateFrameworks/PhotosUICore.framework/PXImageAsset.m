@interface PXImageAsset
- (BOOL)hasPeopleSceneMidOrGreaterConfidence;
- (BOOL)isEligibleForAutoPlayback;
- (BOOL)isFavorite;
- (BOOL)isInCloud;
- (BOOL)isInSharedLibrary;
- (BOOL)isPartOfStack;
- (BOOL)representsBurst;
- (CGRect)acceptableCropRect;
- (CGRect)faceAreaRect;
- (CGRect)preferredCropRect;
- (Class)defaultImageProviderClass;
- (NSDate)creationDate;
- (NSString)uuid;
- (PXImageAsset)initWithImage:(id)a3;
- (UIImage)image;
- (double)aspectRatio;
- (float)audioScore;
- (int64_t)isContentEqualTo:(id)a3;
- (int64_t)mediaType;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unint64_t)thumbnailIndex;
@end

@implementation PXImageAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (int64_t)isContentEqualTo:(id)a3
{
  if (a3 == self) {
    return 2;
  }
  else {
    return 1;
  }
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
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

- (NSDate)creationDate
{
  return 0;
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

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (int64_t)mediaType
{
  return 1;
}

- (double)aspectRatio
{
  double v2 = [(PXImageAsset *)self image];
  [v2 size];
  double v5 = 1.0;
  if (v3 != 0.0 && v4 != 0.0 && (v3 != *MEMORY[0x1E4F8A250] || v4 != *(double *)(MEMORY[0x1E4F8A250] + 8))) {
    double v5 = fabs(v3 / v4);
  }

  return v5;
}

- (PXImageAsset)initWithImage:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXImageAsset;
  v6 = [(PXImageAsset *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    [v5 size];
    v7->_pixelWidth = (unint64_t)v8;
    [v5 size];
    v7->_pixelHeight = (unint64_t)v9;
    id v10 = [NSString alloc];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "hash"));
    uint64_t v14 = [v10 initWithFormat:@"%@-%@", v12, v13];
    uuid = v7->_uuid;
    v7->_uuid = (NSString *)v14;
  }
  return v7;
}

@end