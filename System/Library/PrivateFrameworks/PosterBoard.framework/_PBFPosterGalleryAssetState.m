@interface _PBFPosterGalleryAssetState
+ (id)liveAlwaysPostersPredicate;
- (BOOL)isLiveAlwaysPoster;
- (BOOL)isVisible;
- (BOOL)shouldPrefetch;
- (BOOL)willUseLivePreview;
- (PBFGalleryPosterViewController)livePreviewViewController;
- (PBFPosterGalleryAsset)asset;
- (PBFPosterPreview)preview;
- (PBFPosterSnapshotCollection)snapshotCollection;
- (PRPosterDescriptorGalleryOptions)galleryOptions;
- (_PBFImageView)previewImageView;
- (_PBFPosterGalleryAssetState)initWithPreview:(id)a3;
- (int64_t)livePreviewState;
- (unint64_t)hash;
- (void)setLivePreviewState:(int64_t)a3;
- (void)setLivePreviewViewController:(id)a3;
- (void)setPreviewImageView:(id)a3;
- (void)setShouldPrefetch:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation _PBFPosterGalleryAssetState

+ (id)liveAlwaysPostersPredicate
{
  if (liveAlwaysPostersPredicate_onceToken != -1) {
    dispatch_once(&liveAlwaysPostersPredicate_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)liveAlwaysPostersPredicate_liveAlwaysPostersPredicate;
  return v2;
}

- (_PBFPosterGalleryAssetState)initWithPreview:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_PBFPosterGalleryAssetState;
  v6 = [(_PBFPosterGalleryAssetState *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_preview, a3);
    v8 = [v5 posterDescriptorLookupInfo];
    v9 = NSString;
    v10 = [v8 posterDescriptorExtension];
    uint64_t v11 = [v10 posterExtensionBundleIdentifier];
    v12 = [v8 posterDescriptorPath];
    v13 = [v12 descriptorIdentifier];
    v14 = [v9 stringWithFormat:@"%@:%@", v11, v13];

    v15 = [v5 type];
    LOBYTE(v11) = [v15 isEqual:PBFPreviewTypeHero];

    if ((v11 & 1) == 0)
    {
      if (PRIsLowQualityDevice())
      {
        v7->_willUseLivePreview = 0;
      }
      else
      {
        v16 = [(id)objc_opt_class() liveAlwaysPostersPredicate];
        if ([v5 galleryDisplayStyle] == 1 || (objc_msgSend(v16, "evaluateWithObject:", v14) & 1) != 0)
        {
          v7->_willUseLivePreview = 1;
          uint64_t v17 = [v14 stringByAppendingString:@".live"];

          v14 = (void *)v17;
        }
        else
        {
          v7->_willUseLivePreview = 0;
        }
      }
    }
    v7->_livePreviewState = -1;
    uint64_t v18 = objc_opt_new();
    asset = v7->_asset;
    v7->_asset = (PBFPosterGalleryAsset *)v18;

    v20 = [[PBFPosterSnapshotCollection alloc] initWithUniqueIdentifier:v14];
    snapshotCollection = v7->_snapshotCollection;
    v7->_snapshotCollection = v20;
  }
  return v7;
}

- (PRPosterDescriptorGalleryOptions)galleryOptions
{
  p_galleryOptions = &self->_galleryOptions;
  galleryOptions = self->_galleryOptions;
  if (galleryOptions || self->_galleryOptionsDidFail)
  {
    id v5 = galleryOptions;
    goto LABEL_4;
  }
  v7 = [(PBFPosterPreview *)self->_preview posterDescriptorLookupInfo];
  v8 = [v7 posterDescriptorExtension];
  v9 = [v7 posterDescriptorPath];
  v10 = [v9 descriptorIdentifier];
  uint64_t v11 = [v9 identity];
  uint64_t v12 = [v11 type];

  if (v12 == 2)
  {
    v13 = [v8 posterExtensionInfoPlist];
    objc_msgSend(v13, "pbf_posterBoardPosterDescriptorHeroGalleryOptionsForStaticDescriptorIdentifier:", v10);
    id v5 = (PRPosterDescriptorGalleryOptions *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = [v9 identity];
    uint64_t v15 = [v14 type];

    if (v15 != 1)
    {
LABEL_16:
      id v5 = 0;
      self->_galleryOptionsDidFail = 1;
      goto LABEL_17;
    }
    v13 = [MEMORY[0x1E4F926A8] modelObjectCacheForPath:v9];
    v16 = [v13 galleryOptions];
    uint64_t v17 = v16;
    if (v16)
    {
      uint64_t v18 = v16;
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F926B0] loadPosterDescriptorGalleryOptionsForPath:v9 error:0];
    }
    id v5 = v18;
  }
  if (!v5) {
    goto LABEL_16;
  }
  objc_storeStrong((id *)p_galleryOptions, v5);
LABEL_17:

LABEL_4:
  return v5;
}

- (unint64_t)hash
{
  return [(PBFPosterPreview *)self->_preview hash];
}

- (BOOL)willUseLivePreview
{
  return self->_livePreviewState != 2 && self->_willUseLivePreview;
}

- (PBFPosterPreview)preview
{
  return self->_preview;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setVisible:(BOOL)a3
{
  self->_isVisible = a3;
}

- (BOOL)shouldPrefetch
{
  return self->_shouldPrefetch;
}

- (void)setShouldPrefetch:(BOOL)a3
{
  self->_shouldPrefetch = a3;
}

- (BOOL)isLiveAlwaysPoster
{
  return self->_isLiveAlwaysPoster;
}

- (int64_t)livePreviewState
{
  return self->_livePreviewState;
}

- (void)setLivePreviewState:(int64_t)a3
{
  self->_livePreviewState = a3;
}

- (PBFGalleryPosterViewController)livePreviewViewController
{
  return self->_livePreviewViewController;
}

- (void)setLivePreviewViewController:(id)a3
{
}

- (_PBFImageView)previewImageView
{
  return self->_previewImageView;
}

- (void)setPreviewImageView:(id)a3
{
}

- (PBFPosterGalleryAsset)asset
{
  return self->_asset;
}

- (PBFPosterSnapshotCollection)snapshotCollection
{
  return self->_snapshotCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotCollection, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_previewImageView, 0);
  objc_storeStrong((id *)&self->_livePreviewViewController, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_galleryOptions, 0);
}

@end