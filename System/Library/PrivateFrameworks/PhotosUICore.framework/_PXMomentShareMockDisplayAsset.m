@interface _PXMomentShareMockDisplayAsset
- (BOOL)hasPeopleSceneMidOrGreaterConfidence;
- (BOOL)isEligibleForAutoPlayback;
- (BOOL)isFavorite;
- (BOOL)isInCloud;
- (BOOL)isInSharedLibrary;
- (BOOL)representsBurst;
- (CGRect)acceptableCropRect;
- (CGRect)faceAreaRect;
- (CGRect)preferredCropRect;
- (Class)defaultImageProviderClass;
- (NSDate)creationDate;
- (NSDate)localCreationDate;
- (NSString)uuid;
- (float)audioScore;
- (int64_t)isContentEqualTo:(id)a3;
- (int64_t)mediaType;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unint64_t)thumbnailIndex;
- (void)setMediaType:(int64_t)a3;
@end

@implementation _PXMomentShareMockDisplayAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->localCreationDate, 0);
  objc_storeStrong((id *)&self->creationDate, 0);
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return self->hasPeopleSceneMidOrGreaterConfidence;
}

- (float)audioScore
{
  return self->audioScore;
}

- (NSDate)localCreationDate
{
  return self->localCreationDate;
}

- (unint64_t)pixelHeight
{
  return self->pixelHeight;
}

- (unint64_t)pixelWidth
{
  return self->pixelWidth;
}

- (BOOL)isEligibleForAutoPlayback
{
  return self->isEligibleForAutoPlayback;
}

- (BOOL)isInSharedLibrary
{
  return self->isInSharedLibrary;
}

- (BOOL)isInCloud
{
  return self->isInCloud;
}

- (BOOL)representsBurst
{
  return self->representsBurst;
}

- (BOOL)isFavorite
{
  return self->favorite;
}

- (NSDate)creationDate
{
  return self->creationDate;
}

- (unint64_t)mediaSubtypes
{
  return self->mediaSubtypes;
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)isContentEqualTo:(id)a3
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

- (Class)defaultImageProviderClass
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXMomentShareStatusMock.m" lineNumber:292 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (NSString)uuid
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXMomentShareStatusMock.m" lineNumber:288 description:@"Code which should be unreachable has been reached"];

  abort();
}

@end