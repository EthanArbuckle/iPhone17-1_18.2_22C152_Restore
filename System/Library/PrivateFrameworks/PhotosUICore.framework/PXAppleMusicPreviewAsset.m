@interface PXAppleMusicPreviewAsset
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)previewClipDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (BOOL)isEqual:(id)a3;
- (Class)audioSessionClass;
- (PXAppleMusicAsset)originalAsset;
- (PXAppleMusicPreviewAsset)initWithOriginalAsset:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (int64_t)catalog;
- (int64_t)px_storyResourceKind;
- (unint64_t)flags;
@end

@implementation PXAppleMusicPreviewAsset

- (int64_t)px_storyResourceKind
{
  return 2;
}

- (void).cxx_destruct
{
}

- (PXAppleMusicAsset)originalAsset
{
  return self->_originalAsset;
}

- (int64_t)catalog
{
  return 3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  return +[PXAppleMusicPreviewAsset previewClipDuration];
}

- (Class)audioSessionClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)flags
{
  v2 = [(PXAppleMusicPreviewAsset *)self originalAsset];
  unint64_t v3 = [v2 flags] & 0xFFFFFFFFFFFFFFFDLL;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXAppleMusicPreviewAsset *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(PXAppleMusicPreviewAsset *)v4 identifier];
      v6 = [(PXAppleMusicPreviewAsset *)self identifier];
      if (v5 == v6) {
        char v7 = 1;
      }
      else {
        char v7 = [v5 isEqual:v6];
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_originalAsset;
}

- (PXAppleMusicPreviewAsset)initWithOriginalAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXAppleMusicPreviewAsset;
  v6 = [(PXAppleMusicPreviewAsset *)&v9 init];
  char v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_originalAsset, a3);
  }

  return v7;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)previewClipDuration
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, 90.0, PXAudioDefaultCMTimeScale);
}

@end