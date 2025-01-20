@interface PUPosterMediaDisplayAsset
- (BOOL)hasPeopleSceneMidOrGreaterConfidence;
- (BOOL)isEligibleForAutoPlayback;
- (BOOL)isEqual:(id)a3;
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
- (NSDate)localCreationDate;
- (NSString)uuid;
- (PFPosterMedia)posterMedia;
- (PUPosterMediaDisplayAsset)init;
- (PUPosterMediaDisplayAsset)initWithPosterMedia:(id)a3;
- (float)audioScore;
- (int64_t)isContentEqualTo:(id)a3;
- (int64_t)mediaType;
- (int64_t)playbackStyle;
- (unint64_t)hash;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unint64_t)thumbnailIndex;
@end

@implementation PUPosterMediaDisplayAsset

- (void).cxx_destruct
{
}

- (PFPosterMedia)posterMedia
{
  return self->_posterMedia;
}

- (int64_t)isContentEqualTo:(id)a3
{
  return 0;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (int64_t)playbackStyle
{
  return 1;
}

- (CGRect)acceptableCropRect
{
  double v2 = *MEMORY[0x1E4F8A248];
  double v3 = *(double *)(MEMORY[0x1E4F8A248] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F8A248] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F8A248] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (float)audioScore
{
  return 0.0;
}

- (BOOL)isInSharedLibrary
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

- (BOOL)isPartOfStack
{
  return 0;
}

- (BOOL)representsBurst
{
  return 0;
}

- (CGRect)preferredCropRect
{
  double v2 = *MEMORY[0x1E4F8A248];
  double v3 = *(double *)(MEMORY[0x1E4F8A248] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F8A248] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F8A248] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)pixelHeight
{
  return 0;
}

- (unint64_t)pixelWidth
{
  return 0;
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isInCloud
{
  return 0;
}

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (int64_t)mediaType
{
  return 1;
}

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (BOOL)isFavorite
{
  return 0;
}

- (NSDate)localCreationDate
{
  return 0;
}

- (NSDate)creationDate
{
  return 0;
}

- (NSString)uuid
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PUPosterMediaDisplayAsset *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = [(PUPosterMediaDisplayAsset *)self posterMedia];
      v6 = [v5 assetUUID];
      v7 = [(PUPosterMediaDisplayAsset *)v4 posterMedia];
      v8 = [v7 assetUUID];
      if (v6 == v8) {
        char v9 = 1;
      }
      else {
        char v9 = [v6 isEqualToString:v8];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  double v2 = [(PUPosterMediaDisplayAsset *)self posterMedia];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (PUPosterMediaDisplayAsset)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPosterMediaDisplayAsset.m", 30, @"%s is not available as initializer", "-[PUPosterMediaDisplayAsset init]");

  abort();
}

- (PUPosterMediaDisplayAsset)initWithPosterMedia:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPosterMediaDisplayAsset;
  v6 = [(PUPosterMediaDisplayAsset *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_posterMedia, a3);
  }

  return v7;
}

@end