@interface SBHIconImageAppearanceStore
+ (SBIcon)defaultIcon;
- (BOOL)hasAnyImagesForIcon:(id)a3;
- (NSString)description;
- (id)_cacheKeyForIcon:(id)a3;
- (id)imageForIcon:(id)a3 appearance:(id)a4;
- (id)imageForIcon:(id)a3 appearanceType:(int64_t)a4;
- (id)imageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4;
- (id)imagesForAppearance:(id)a3 createIfNecessary:(BOOL)a4;
- (id)imagesForAppearanceType:(int64_t)a3 createIfNecessary:(BOOL)a4;
- (id)imagesForTraitCollection:(id)a3 createIfNecessary:(BOOL)a4;
- (id)succinctDescription;
- (unint64_t)numberOfCachedImages;
- (unint64_t)numberOfCachedImagesForAppearance:(id)a3;
- (unint64_t)numberOfCachedImagesForAppearanceType:(int64_t)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)enumerateImageCachesUsingBlock:(id)a3;
- (void)enumerateImagesForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateImagesUsingBlock:(id)a3;
- (void)removeAllImages;
- (void)removeAllImagesForAppearance:(id)a3;
- (void)removeAllImagesForAppearancesOtherThanAppearances:(id)a3;
- (void)removeAllImagesForIcon:(id)a3;
- (void)removeAllImagesForIcon:(id)a3 appearance:(id)a4;
- (void)removeAllImagesForIcons:(id)a3;
- (void)removeImageForIcon:(id)a3 appearance:(id)a4;
- (void)removeImageForIcon:(id)a3 traitCollection:(id)a4;
- (void)setImage:(id)a3 forIcon:(id)a4 appearance:(id)a5;
- (void)setImage:(id)a3 forIcon:(id)a4 traitCollection:(id)a5;
@end

@implementation SBHIconImageAppearanceStore

- (id)imageForIcon:(id)a3 appearance:(id)a4
{
  id v6 = a4;
  v7 = [(SBHIconImageAppearanceStore *)self _cacheKeyForIcon:a3];
  v8 = [(SBHIconImageAppearanceStore *)self imagesForAppearance:v6 createIfNecessary:0];
  id v9 = [v8 objectForKey:v7];
  if ([v6 appearanceType] == 2)
  {
    v10 = v9;
    v11 = v10;
    if (v10) {
      v12 = (void *)v10[2];
    }
    else {
      v12 = 0;
    }
    id v13 = v12;
    if (BSEqualObjects())
    {
      if (v11) {
        v14 = (void *)v11[1];
      }
      else {
        v14 = 0;
      }
      id v9 = v14;
    }
    else
    {
      id v9 = 0;
    }
  }
  return v9;
}

- (id)_cacheKeyForIcon:(id)a3
{
  return (id)[a3 iconImageCacheIdentifier];
}

- (id)imagesForAppearanceType:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  switch(a3)
  {
    case 0:
      p_lightImages = &self->_lightImages;
      lightImages = self->_lightImages;
      if (!lightImages) {
        goto LABEL_10;
      }
      goto LABEL_12;
    case 1:
      p_lightImages = &self->_darkImages;
      lightImages = self->_darkImages;
      if (lightImages) {
        goto LABEL_12;
      }
      goto LABEL_10;
    case 2:
      p_lightImages = &self->_tintedImages;
      lightImages = self->_tintedImages;
      if (lightImages) {
        goto LABEL_12;
      }
LABEL_10:
      if (a4)
      {
LABEL_11:
        id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v10 = *p_lightImages;
        *p_lightImages = v9;

        lightImages = *p_lightImages;
      }
LABEL_12:
      v7 = lightImages;
      return v7;
    case 3:
      p_lightImages = &self->_tintableImages;
      lightImages = self->_tintableImages;
      if (lightImages) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = !a4;
      }
      if (!v11) {
        goto LABEL_11;
      }
      goto LABEL_12;
    default:
      v7 = 0;
      return v7;
  }
}

- (id)imagesForAppearance:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [a3 appearanceType];
  return [(SBHIconImageAppearanceStore *)self imagesForAppearanceType:v6 createIfNecessary:v4];
}

- (void)setImage:(id)a3 forIcon:(id)a4 appearance:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  id v9 = [(SBHIconImageAppearanceStore *)self _cacheKeyForIcon:a4];
  v10 = [(SBHIconImageAppearanceStore *)self imagesForAppearance:v8 createIfNecessary:1];
  if ([v8 appearanceType] == 2) {
    BOOL v11 = -[SBHIconImageAppearanceStoreTintedValue initWithValue:imageAppearance:]([SBHIconImageAppearanceStoreTintedValue alloc], v13, v8);
  }
  else {
    BOOL v11 = v13;
  }
  v12 = v11;
  [v10 setObject:v11 forKey:v9];
}

- (void)enumerateImagesForIcon:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v7 = [(SBHIconImageAppearanceStore *)self _cacheKeyForIcon:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SBHIconImageAppearanceStore_enumerateImagesForIcon_usingBlock___block_invoke;
  v10[3] = &unk_1E6AB1140;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(SBHIconImageAppearanceStore *)self enumerateImageCachesUsingBlock:v10];
}

- (void)enumerateImageCachesUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void, void))v4;
  char v10 = 0;
  lightImages = self->_lightImages;
  if (!lightImages
    || ((*((void (**)(id, NSMutableDictionary *, void, char *))v4 + 2))(v4, lightImages, 0, &v10), !v10))
  {
    darkImages = self->_darkImages;
    if (!darkImages
      || (((void (**)(void, NSMutableDictionary *, uint64_t, char *))v5)[2](v5, darkImages, 1, &v10), !v10))
    {
      tintedImages = self->_tintedImages;
      if (!tintedImages
        || (((void (**)(void, NSMutableDictionary *, uint64_t, char *))v5)[2](v5, tintedImages, 2, &v10),
            !v10))
      {
        tintableImages = self->_tintableImages;
        if (tintableImages) {
          ((void (**)(void, NSMutableDictionary *, uint64_t, char *))v5)[2](v5, tintableImages, 3, &v10);
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintableImages, 0);
  objc_storeStrong((id *)&self->_tintedImages, 0);
  objc_storeStrong((id *)&self->_darkImages, 0);
  objc_storeStrong((id *)&self->_lightImages, 0);
}

+ (SBIcon)defaultIcon
{
  if (defaultIcon_onceToken != -1) {
    dispatch_once(&defaultIcon_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)defaultIcon_defaultIcon;
  return (SBIcon *)v2;
}

- (id)imageForIcon:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v6 = a3;
  v7 = objc_msgSend(a4, "sbh_iconImageAppearance");
  id v8 = [(SBHIconImageAppearanceStore *)self imageForIcon:v6 appearance:v7];

  return v8;
}

- (id)imageForIcon:(id)a3 appearanceType:(int64_t)a4
{
  id v6 = [(SBHIconImageAppearanceStore *)self _cacheKeyForIcon:a3];
  v7 = [(SBHIconImageAppearanceStore *)self imagesForAppearanceType:a4 createIfNecessary:0];
  uint64_t v8 = [v7 objectForKey:v6];
  id v9 = (void *)v8;
  if (a4 == 2)
  {
    if (v8) {
      char v10 = *(void **)(v8 + 8);
    }
    else {
      char v10 = 0;
    }
    id v11 = v10;

    id v9 = v11;
  }

  return v9;
}

- (void)setImage:(id)a3 forIcon:(id)a4 traitCollection:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_msgSend(a5, "sbh_iconImageAppearance");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(SBHIconImageAppearanceStore *)self setImage:v9 forIcon:v8 appearance:v10];
}

- (void)removeImageForIcon:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  objc_msgSend(a4, "sbh_iconImageAppearance");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(SBHIconImageAppearanceStore *)self removeImageForIcon:v6 appearance:v7];
}

- (void)removeImageForIcon:(id)a3 appearance:(id)a4
{
  id v6 = a4;
  id v8 = [(SBHIconImageAppearanceStore *)self _cacheKeyForIcon:a3];
  id v7 = [(SBHIconImageAppearanceStore *)self imagesForAppearance:v6 createIfNecessary:0];

  [v7 removeObjectForKey:v8];
}

- (void)removeAllImages
{
}

uint64_t __46__SBHIconImageAppearanceStore_removeAllImages__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (void)removeAllImagesForIcon:(id)a3
{
  id v4 = [(SBHIconImageAppearanceStore *)self _cacheKeyForIcon:a3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SBHIconImageAppearanceStore_removeAllImagesForIcon___block_invoke;
  v6[3] = &unk_1E6AB10A0;
  id v7 = v4;
  id v5 = v4;
  [(SBHIconImageAppearanceStore *)self enumerateImageCachesUsingBlock:v6];
}

uint64_t __54__SBHIconImageAppearanceStore_removeAllImagesForIcon___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:*(void *)(a1 + 32)];
}

- (void)removeAllImagesForIcons:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBHIconImageAppearanceStore *)self removeAllImagesForIcon:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeAllImagesForIcon:(id)a3 appearance:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBHIconImageAppearanceStore *)self _cacheKeyForIcon:a3];
  uint64_t v8 = [v6 appearanceType];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__SBHIconImageAppearanceStore_removeAllImagesForIcon_appearance___block_invoke;
  v11[3] = &unk_1E6AB10C8;
  id v13 = v6;
  uint64_t v14 = v8;
  id v12 = v7;
  id v9 = v6;
  id v10 = v7;
  [(SBHIconImageAppearanceStore *)self enumerateImageCachesUsingBlock:v11];
}

void __65__SBHIconImageAppearanceStore_removeAllImagesForIcon_appearance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3 == 2 || *(void *)(a1 + 48) != a3)
  {
    if (a3 != 2) {
      goto LABEL_11;
    }
    id v10 = v5;
    uint64_t v6 = [v5 objectForKey:*(void *)(a1 + 32)];
    uint64_t v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = *(void **)(v6 + 16);
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;
    if (BSEqualObjects()) {
      [v10 removeObjectForKey:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v10 = v5;
    [v5 removeObjectForKey:*(void *)(a1 + 32)];
  }
  id v5 = v10;
LABEL_11:
}

- (void)removeAllImagesForAppearance:(id)a3
{
  id v3 = [(SBHIconImageAppearanceStore *)self imagesForAppearance:a3 createIfNecessary:0];
  [v3 removeAllObjects];
}

- (void)removeAllImagesForAppearancesOtherThanAppearances:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__SBHIconImageAppearanceStore_removeAllImagesForAppearancesOtherThanAppearances___block_invoke;
  v6[3] = &unk_1E6AB10A0;
  id v7 = v4;
  id v5 = v4;
  [(SBHIconImageAppearanceStore *)self enumerateImageCachesUsingBlock:v6];
}

void __81__SBHIconImageAppearanceStore_removeAllImagesForAppearancesOtherThanAppearances___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a2;
  id v7 = objc_alloc_init(v5);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__SBHIconImageAppearanceStore_removeAllImagesForAppearancesOtherThanAppearances___block_invoke_2;
  v9[3] = &unk_1E6AB10F0;
  uint64_t v12 = a3;
  id v10 = *(id *)(a1 + 32);
  id v11 = v7;
  id v8 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  [v6 removeObjectsForKeys:v8];
}

void __81__SBHIconImageAppearanceStore_removeAllImagesForAppearancesOtherThanAppearances___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = v5;
  if (*(void *)(a1 + 48) == 2)
  {
    if (v5)
    {
      id v7 = *((id *)v5 + 2);
      id v8 = (void *)v6[1];
    }
    else
    {
      id v7 = 0;
      id v8 = 0;
    }
    id v9 = v8;

    id v6 = v9;
  }
  else
  {
    +[SBHIconImageAppearance sharedInstanceForAppearanceType:](SBHIconImageAppearance, "sharedInstanceForAppearanceType:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (([*(id *)(a1 + 32) containsObject:v7] & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v10];
  }
}

- (BOOL)hasAnyImagesForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconImageAppearanceStore *)self _cacheKeyForIcon:v4];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SBHIconImageAppearanceStore_hasAnyImagesForIcon___block_invoke;
  v8[3] = &unk_1E6AB1118;
  id v6 = v5;
  id v9 = v6;
  id v10 = &v11;
  [(SBHIconImageAppearanceStore *)self enumerateImageCachesUsingBlock:v8];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __51__SBHIconImageAppearanceStore_hasAnyImagesForIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 objectForKey:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __65__SBHIconImageAppearanceStore_enumerateImagesForIcon_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 objectForKey:*(void *)(a1 + 32)];
  if (v5)
  {
    id v8 = (id *)v5;
    if (a3 == 2)
    {
      id v6 = *(id *)(v5 + 16);
      id v7 = (id *)v8[1];

      id v8 = v7;
    }
    else
    {
      id v6 = +[SBHIconImageAppearance sharedInstanceForAppearanceType:a3];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)enumerateImagesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SBHIconImageAppearanceStore_enumerateImagesUsingBlock___block_invoke;
  v6[3] = &unk_1E6AB1190;
  id v7 = v4;
  id v5 = v4;
  [(SBHIconImageAppearanceStore *)self enumerateImageCachesUsingBlock:v6];
}

void __57__SBHIconImageAppearanceStore_enumerateImagesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SBHIconImageAppearanceStore_enumerateImagesUsingBlock___block_invoke_2;
  v6[3] = &unk_1E6AB1168;
  uint64_t v8 = a3;
  id v7 = *(id *)(a1 + 32);
  uint64_t v9 = a4;
  [a2 enumerateKeysAndObjectsUsingBlock:v6];
}

void __57__SBHIconImageAppearanceStore_enumerateImagesUsingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (*(void *)(a1 + 40) == 2)
  {
    if (v6)
    {
      id v8 = *((id *)v6 + 2);
      uint64_t v9 = (void *)v7[1];
    }
    else
    {
      id v8 = 0;
      uint64_t v9 = 0;
    }
    id v10 = v9;

    id v7 = v10;
  }
  else
  {
    +[SBHIconImageAppearance sharedInstanceForAppearanceType:](SBHIconImageAppearance, "sharedInstanceForAppearanceType:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)imagesForTraitCollection:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_msgSend(a3, "sbh_iconImageAppearance");
  id v7 = [(SBHIconImageAppearanceStore *)self imagesForAppearance:v6 createIfNecessary:v4];

  return v7;
}

void __42__SBHIconImageAppearanceStore_defaultIcon__block_invoke()
{
  v0 = objc_alloc_init(SBIcon);
  v1 = (void *)defaultIcon_defaultIcon;
  defaultIcon_defaultIcon = (uint64_t)v0;
}

- (unint64_t)numberOfCachedImages
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__SBHIconImageAppearanceStore_numberOfCachedImages__block_invoke;
  v4[3] = &unk_1E6AB11B8;
  v4[4] = &v5;
  [(SBHIconImageAppearanceStore *)self enumerateImageCachesUsingBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __51__SBHIconImageAppearanceStore_numberOfCachedImages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)numberOfCachedImagesForAppearance:(id)a3
{
  id v3 = [(SBHIconImageAppearanceStore *)self imagesForAppearance:a3 createIfNecessary:0];
  unint64_t v4 = [v3 count];

  return v4;
}

- (unint64_t)numberOfCachedImagesForAppearanceType:(int64_t)a3
{
  id v3 = [(SBHIconImageAppearanceStore *)self imagesForAppearanceType:a3 createIfNecessary:0];
  unint64_t v4 = [v3 count];

  return v4;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  id v3 = (void *)MEMORY[0x1E4F4F720];
  unint64_t v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SBHIconImageAppearanceStore_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E6AACA90;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

id __57__SBHIconImageAppearanceStore_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "count"), @"lightImages");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "count"), @"darkImages");
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "count"), @"tintedImages");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "count"), @"tintableImages");
}

@end