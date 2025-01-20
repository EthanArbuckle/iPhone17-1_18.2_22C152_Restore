@interface PXFlexMusicArtworkAsset
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
- (PXFlexMusicArtworkAsset)init;
- (PXFlexMusicArtworkAsset)initWithAudioAsset:(id)a3;
- (PXFlexMusicAsset)audioAsset;
- (float)audioScore;
- (int64_t)isContentEqualTo:(id)a3;
- (int64_t)mediaType;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unint64_t)thumbnailIndex;
@end

@implementation PXFlexMusicArtworkAsset

- (void).cxx_destruct
{
}

- (PXFlexMusicAsset)audioAsset
{
  return self->_audioAsset;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isPartOfStack
{
  return 0;
}

- (BOOL)representsBurst
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

- (int64_t)isContentEqualTo:(id)a3
{
  return [a3 isEqual:self];
}

- (NSDate)localCreationDate
{
  return 0;
}

- (BOOL)isFavorite
{
  return 0;
}

- (float)audioScore
{
  return 0.0;
}

- (BOOL)isEligibleForAutoPlayback
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

- (unint64_t)pixelHeight
{
  return 0;
}

- (unint64_t)pixelWidth
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

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [v4 audioAsset];
    v6 = [(PXFlexMusicArtworkAsset *)self audioAsset];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)uuid
{
  double v2 = [(PXFlexMusicArtworkAsset *)self audioAsset];
  double v3 = [v2 identifier];

  return (NSString *)v3;
}

- (PXFlexMusicArtworkAsset)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFlexMusicArtworkAsset.m", 26, @"%s is not available as initializer", "-[PXFlexMusicArtworkAsset init]");

  abort();
}

- (PXFlexMusicArtworkAsset)initWithAudioAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFlexMusicArtworkAsset;
  v6 = [(PXFlexMusicArtworkAsset *)&v9 init];
  char v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_audioAsset, a3);
  }

  return v7;
}

@end