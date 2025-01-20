@interface VUIMPMediaCollection
- (MPMediaItemCollection)mediaItemCollection;
- (VUIMPMediaCollection)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6;
- (VUIMPMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 identifier:(id)a5 requestedProperties:(id)a6 kind:(id)a7;
- (id)HLSAudioCapability;
- (id)HLSColorCapability;
- (id)HLSResolution;
- (id)_valueForPropertyDescriptor:(id)a3;
- (id)assetController;
- (id)audioCapability;
- (id)colorCapability;
- (id)contentRating;
- (id)coverArtImageIdentifier;
- (id)imageLoadParamsWithImageType:(unint64_t)a3;
- (id)isLocal;
- (id)playedState;
- (id)resolution;
- (id)showIdentifier;
- (void)setMediaItemCollection:(id)a3;
@end

@implementation VUIMPMediaCollection

- (VUIMPMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 identifier:(id)a5 requestedProperties:(id)a6 kind:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaItemCollection" format];
  if (v14)
  {
LABEL_4:
    if (v15) {
      goto LABEL_5;
    }
LABEL_12:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"requestedProperties" format];
    if (v16) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_11:
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"identifier" format];
  if (!v15) {
    goto LABEL_12;
  }
LABEL_5:
  if (v16) {
    goto LABEL_6;
  }
LABEL_13:
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"kind" format];
LABEL_6:
  v23.receiver = self;
  v23.super_class = (Class)VUIMPMediaCollection;
  v17 = [(VUIMediaEntity *)&v23 initWithMediaLibrary:v12 identifier:v14 requestedProperties:v15 kind:v16];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_mediaItemCollection, a4);
    v19 = [(MPMediaItemCollection *)v18->_mediaItemCollection representativeItem];
    uint64_t v20 = objc_msgSend(v19, "vui_coverArtImageIdentifier");
    coverArtImageIdentifier = v18->_coverArtImageIdentifier;
    v18->_coverArtImageIdentifier = (NSString *)v20;

    [(VUIMediaEntity *)v18 setCachesPropertiesOnFirstAccess:1];
  }

  return v18;
}

- (VUIMPMediaCollection)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6
{
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  v9 = NSStringFromSelector(a2);
  [v7 raise:v8, @"The %@ initializer is not available.", v9 format];

  return 0;
}

- (id)isLocal
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__VUIMPMediaCollection_isLocal__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"isLocal"];
  return v2;
}

id __31__VUIMPMediaCollection_isLocal__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "mediaItemCollection", 0);
  v2 = [v1 items];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "vui_isLocalCheckingSidebandLibrary:", 0);
        char v7 = [v6 BOOLValue];

        if (v7)
        {
          uint64_t v3 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  return v8;
}

- (id)resolution
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__VUIMPMediaCollection_resolution__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"resolution"];
  return v2;
}

id __34__VUIMPMediaCollection_resolution__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItemCollection];
  v2 = [v1 representativeItem];
  uint64_t v3 = objc_msgSend(v2, "vui_resolution");

  return v3;
}

- (id)colorCapability
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__VUIMPMediaCollection_colorCapability__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"colorCapability"];
  return v2;
}

id __39__VUIMPMediaCollection_colorCapability__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItemCollection];
  v2 = [v1 representativeItem];
  uint64_t v3 = objc_msgSend(v2, "vui_colorCapability");

  return v3;
}

- (id)audioCapability
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__VUIMPMediaCollection_audioCapability__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"audioCapability"];
  return v2;
}

id __39__VUIMPMediaCollection_audioCapability__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItemCollection];
  v2 = [v1 representativeItem];
  uint64_t v3 = objc_msgSend(v2, "vui_audioCapability");

  return v3;
}

- (id)HLSResolution
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__VUIMPMediaCollection_HLSResolution__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"HLSResolution"];
  return v2;
}

id __37__VUIMPMediaCollection_HLSResolution__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItemCollection];
  v2 = [v1 representativeItem];
  uint64_t v3 = objc_msgSend(v2, "vui_HLSResolution");

  return v3;
}

- (id)HLSColorCapability
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__VUIMPMediaCollection_HLSColorCapability__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"HLSColorCapability"];
  return v2;
}

id __42__VUIMPMediaCollection_HLSColorCapability__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItemCollection];
  v2 = [v1 representativeItem];
  uint64_t v3 = objc_msgSend(v2, "vui_HLSColorCapability");

  return v3;
}

- (id)HLSAudioCapability
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__VUIMPMediaCollection_HLSAudioCapability__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"HLSAudioCapability"];
  return v2;
}

id __42__VUIMPMediaCollection_HLSAudioCapability__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItemCollection];
  v2 = [v1 representativeItem];
  uint64_t v3 = objc_msgSend(v2, "vui_HLSAudioCapability");

  return v3;
}

- (id)contentRating
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__VUIMPMediaCollection_contentRating__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"contentRating"];
  return v2;
}

id __37__VUIMPMediaCollection_contentRating__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItemCollection];
  v2 = [v1 representativeItem];
  uint64_t v3 = objc_msgSend(v2, "vui_contentRating");

  return v3;
}

- (id)coverArtImageIdentifier
{
  return self->_coverArtImageIdentifier;
}

- (id)playedState
{
  return [(VUIMediaEntity *)self _propertyValueWithBlock:&__block_literal_global_111 forKey:@"playedState"];
}

void *__35__VUIMPMediaCollection_playedState__block_invoke()
{
  return &unk_1F3F3D250;
}

- (id)showIdentifier
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__VUIMPMediaCollection_showIdentifier__block_invoke;
  v4[3] = &unk_1E6DFA650;
  v4[4] = self;
  v2 = [(VUIMediaEntity *)self _propertyValueWithBlock:v4 forKey:@"showIdentifier"];
  return v2;
}

id __38__VUIMPMediaCollection_showIdentifier__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaItemCollection];
  v2 = [v1 representativeItem];
  uint64_t v3 = objc_msgSend(v2, "vui_showIdentifier");

  return v3;
}

- (id)assetController
{
  uint64_t v3 = [(VUIMediaEntity *)self mediaLibrary];
  uint64_t v4 = [v3 type];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = [VUIUniversalCollectionAssetController alloc];
    char v7 = [(VUIMPMediaCollection *)self mediaItemCollection];
    v5 = [(VUIUniversalCollectionAssetController *)v6 initWithMediaItemCollection:v7];
  }
  return v5;
}

- (id)_valueForPropertyDescriptor:(id)a3
{
  uint64_t v4 = [a3 sourcePropertyNames];
  v5 = [v4 allObjects];

  if ([v5 count] == 1)
  {
    v6 = [v5 firstObject];
    char v7 = [(VUIMPMediaCollection *)self mediaItemCollection];
    uint64_t v8 = [v7 representativeItem];
    v9 = [v8 valueForProperty:v6];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)imageLoadParamsWithImageType:(unint64_t)a3
{
  uint64_t v4 = [(VUIMPMediaCollection *)self mediaItemCollection];
  v5 = [v4 representativeItem];
  v6 = objc_msgSend(v5, "vui_imageLoadParamsWithImageType:", a3);

  return v6;
}

- (MPMediaItemCollection)mediaItemCollection
{
  return self->_mediaItemCollection;
}

- (void)setMediaItemCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItemCollection, 0);
  objc_storeStrong((id *)&self->_coverArtImageIdentifier, 0);
}

@end