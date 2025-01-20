@interface _ImageAsset
- (BOOL)isEligibleForAutoPlayback;
- (BOOL)isFavorite;
- (BOOL)isInCloud;
- (BOOL)isInSharedLibrary;
- (BOOL)representsBurst;
- (CGRect)acceptableCropRect;
- (CGRect)faceAreaRect;
- (CGRect)preferredCropRect;
- (Class)defaultImageProviderClass;
- (UIImage)image;
- (_ImageAsset)initWithImage:(id)a3;
- (float)audioScore;
- (id)creationDate;
- (id)localCreationDate;
- (int64_t)isContentEqualTo:(id)a3;
- (int64_t)mediaType;
- (int64_t)playbackStyle;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unint64_t)thumbnailIndex;
@end

@implementation _ImageAsset

- (_ImageAsset)initWithImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ImageAsset;
  v6 = [(_ImageAsset *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_image, a3);
  }

  return v7;
}

- (int64_t)playbackStyle
{
  return 1;
}

- (int64_t)isContentEqualTo:(id)a3
{
  return 0;
}

- (unint64_t)thumbnailIndex
{
  return 0;
}

- (BOOL)representsBurst
{
  return 0;
}

- (CGRect)preferredCropRect
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 1.0;
  double v5 = 1.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)pixelWidth
{
  double v2 = [(_ImageAsset *)self image];
  [v2 size];
  unint64_t v4 = (unint64_t)v3;

  return v4;
}

- (unint64_t)pixelHeight
{
  double v2 = [(_ImageAsset *)self image];
  [v2 size];
  unint64_t v4 = (unint64_t)v3;

  return v4;
}

- (int64_t)mediaType
{
  return 1;
}

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (id)localCreationDate
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

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (BOOL)isFavorite
{
  return 0;
}

- (CGRect)faceAreaRect
{
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (Class)defaultImageProviderClass
{
  return 0;
}

- (id)creationDate
{
  return 0;
}

- (float)audioScore
{
  return 0.0;
}

- (CGRect)acceptableCropRect
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 1.0;
  double v5 = 1.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
}

@end