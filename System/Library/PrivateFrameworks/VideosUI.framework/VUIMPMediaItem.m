@interface VUIMPMediaItem
- (MPMediaItem)mediaItem;
- (VUIMPMediaItem)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6;
- (VUIMPMediaItem)initWithMediaLibrary:(id)a3 mediaItem:(id)a4 requestedProperties:(id)a5;
- (VUIMediaEntityAssetController)assetController;
- (id)HLSAudioCapability;
- (id)HLSColorCapability;
- (id)HLSResolution;
- (id)_valueForPropertyDescriptor:(id)a3;
- (id)assetType;
- (id)audioCapability;
- (id)colorCapability;
- (id)contentRating;
- (id)coverArtImageIdentifier;
- (id)credits;
- (id)extrasURL;
- (id)imageLoadParamsWithImageType:(unint64_t)a3;
- (id)isLocal;
- (id)isPlayable;
- (id)playedState;
- (id)previewFrameImageIdentifier;
- (id)rentalExpirationDate;
- (id)resolution;
- (id)seasonCanonicalID;
- (id)seasonIdentifier;
- (id)showCanonicalID;
- (id)showIdentifier;
- (id)studio;
- (void)setAssetController:(id)a3;
- (void)setMediaItem:(id)a3;
@end

@implementation VUIMPMediaItem

- (VUIMPMediaItem)initWithMediaLibrary:(id)a3 mediaItem:(id)a4 requestedProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_9:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaItem" format];
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
  if (!v9) {
    goto LABEL_9;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_10:
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"requestedProperties" format];
LABEL_4:
  v11 = +[VUIMPMediaEntityIdentifier mediaItemIdentifierWithMediaItem:v9];
  if (v11)
  {
    v12 = VUIMPMediaItemKind();
    v16.receiver = self;
    v16.super_class = (Class)VUIMPMediaItem;
    v13 = [(VUIMediaEntity *)&v16 initWithMediaLibrary:v8 identifier:v11 requestedProperties:v10 kind:v12];

    if (v13)
    {
      objc_storeStrong((id *)&v13->_mediaItem, a4);
      [(VUIMediaEntity *)v13 setCachesPropertiesOnFirstAccess:1];
    }
    self = v13;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (VUIMPMediaItem)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6
{
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  id v9 = NSStringFromSelector(a2);
  [v7 raise:v8, @"The %@ initializer is not available.", v9 format];

  return 0;
}

- (id)isLocal
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__VUIMPMediaItem_isLocal__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"isLocal"];
  return v2;
}

id __25__VUIMPMediaItem_isLocal__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_isLocalCheckingSidebandLibrary:", 1);

  return v2;
}

- (id)resolution
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__VUIMPMediaItem_resolution__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"resolution"];
  return v2;
}

id __28__VUIMPMediaItem_resolution__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_resolution");

  return v2;
}

- (id)colorCapability
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__VUIMPMediaItem_colorCapability__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"colorCapability"];
  return v2;
}

id __33__VUIMPMediaItem_colorCapability__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_colorCapability");

  return v2;
}

- (id)audioCapability
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__VUIMPMediaItem_audioCapability__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"audioCapability"];
  return v2;
}

id __33__VUIMPMediaItem_audioCapability__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_audioCapability");

  return v2;
}

- (id)HLSResolution
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__VUIMPMediaItem_HLSResolution__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"HLSResolution"];
  return v2;
}

id __31__VUIMPMediaItem_HLSResolution__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_HLSResolution");

  return v2;
}

- (id)HLSColorCapability
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__VUIMPMediaItem_HLSColorCapability__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"HLSColorCapability"];
  return v2;
}

id __36__VUIMPMediaItem_HLSColorCapability__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_HLSColorCapability");

  return v2;
}

- (id)HLSAudioCapability
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__VUIMPMediaItem_HLSAudioCapability__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"HLSAudioCapability"];
  return v2;
}

id __36__VUIMPMediaItem_HLSAudioCapability__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_HLSAudioCapability");

  return v2;
}

- (id)contentRating
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__VUIMPMediaItem_contentRating__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"contentRating"];
  return v2;
}

id __31__VUIMPMediaItem_contentRating__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_contentRating");

  return v2;
}

- (id)coverArtImageIdentifier
{
  coverArtImageIdentifier = self->_coverArtImageIdentifier;
  if (!coverArtImageIdentifier)
  {
    v4 = [(VUIMPMediaItem *)self mediaItem];
    objc_msgSend(v4, "vui_coverArtImageIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_coverArtImageIdentifier;
    self->_coverArtImageIdentifier = v5;

    coverArtImageIdentifier = self->_coverArtImageIdentifier;
  }
  return coverArtImageIdentifier;
}

- (id)playedState
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__VUIMPMediaItem_playedState__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"playedState"];
  return v2;
}

id __29__VUIMPMediaItem_playedState__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_playedState");

  return v2;
}

- (id)showIdentifier
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__VUIMPMediaItem_showIdentifier__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"showIdentifier"];
  return v2;
}

id __32__VUIMPMediaItem_showIdentifier__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_showIdentifier");

  return v2;
}

- (VUIMediaEntityAssetController)assetController
{
  v3 = [(VUIMediaEntity *)self mediaLibrary];
  uint64_t v4 = [v3 type];

  if (!v4 && !self->_assetController)
  {
    v5 = [VUIUniversalAssetController alloc];
    v6 = [(VUIMPMediaItem *)self mediaItem];
    v7 = [(VUIUniversalAssetController *)v5 initWithMPMediaItem:v6];
    assetController = self->_assetController;
    self->_assetController = v7;
  }
  id v9 = self->_assetController;
  return v9;
}

- (id)_valueForPropertyDescriptor:(id)a3
{
  uint64_t v4 = [a3 sourcePropertyNames];
  v5 = [v4 allObjects];

  if ([v5 count] == 1)
  {
    v6 = [v5 firstObject];
    v7 = [(VUIMPMediaItem *)self mediaItem];
    uint64_t v8 = [v7 valueForProperty:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)assetType
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__VUIMPMediaItem_assetType__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"assetType"];
  return v2;
}

id __27__VUIMPMediaItem_assetType__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_assetType");

  return v2;
}

- (id)isPlayable
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__VUIMPMediaItem_isPlayable__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"isPlayable"];
  return v2;
}

id __28__VUIMPMediaItem_isPlayable__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_isPlayable");

  return v2;
}

- (id)previewFrameImageIdentifier
{
  previewFrameImageIdentifier = self->_previewFrameImageIdentifier;
  if (!previewFrameImageIdentifier)
  {
    uint64_t v4 = [(MPMediaItem *)self->_mediaItem vui_previewFrameImageIdentifier];
    v5 = self->_previewFrameImageIdentifier;
    self->_previewFrameImageIdentifier = v4;

    previewFrameImageIdentifier = self->_previewFrameImageIdentifier;
  }
  return previewFrameImageIdentifier;
}

- (id)extrasURL
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__VUIMPMediaItem_extrasURL__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"extrasURL"];
  return v2;
}

id __27__VUIMPMediaItem_extrasURL__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_extrasURL");

  return v2;
}

- (id)seasonIdentifier
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__VUIMPMediaItem_seasonIdentifier__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"seasonIdentifier"];
  return v2;
}

id __34__VUIMPMediaItem_seasonIdentifier__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_seasonIdentifier");

  return v2;
}

- (id)seasonCanonicalID
{
  return &stru_1F3E921E0;
}

- (id)showCanonicalID
{
  return &stru_1F3E921E0;
}

- (id)studio
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__VUIMPMediaItem_studio__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"studio"];
  return v2;
}

id __24__VUIMPMediaItem_studio__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_studio");

  return v2;
}

- (id)credits
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__VUIMPMediaItem_credits__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"credits"];
  return v2;
}

id __25__VUIMPMediaItem_credits__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_credits");

  return v2;
}

- (id)rentalExpirationDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__VUIMPMediaItem_rentalExpirationDate__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"rentalExpirationDate"];
  return v2;
}

id __38__VUIMPMediaItem_rentalExpirationDate__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItem];
  v2 = objc_msgSend(v1, "vui_rentalExpirationDate");

  return v2;
}

- (id)imageLoadParamsWithImageType:(unint64_t)a3
{
  uint64_t v4 = [(VUIMPMediaItem *)self mediaItem];
  v5 = objc_msgSend(v4, "vui_imageLoadParamsWithImageType:", a3);

  return v5;
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (void)setAssetController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_previewFrameImageIdentifier, 0);
  objc_storeStrong((id *)&self->_coverArtImageIdentifier, 0);
}

@end