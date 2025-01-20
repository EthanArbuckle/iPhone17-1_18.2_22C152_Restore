@interface SBHIconStylePreviewManager
- (BOOL)canTintIconSpecially:(id)a3;
- (BOOL)isGeneratingTintedImages;
- (NSArray)additionalIconViews;
- (NSArray)iconListViews;
- (NSArray)tintableIcons;
- (NSArray)traitOverridableObjects;
- (SBFolderIconImageCache)folderIconImageCache;
- (SBHIconImageCache)iconImageCache;
- (SBHIconImageStyleConfiguration)delayedTintStyleConfiguration;
- (SBHIconImageStyleConfiguration)imageStyleConfiguration;
- (SBHIconStylePreviewManager)initWithTraitOverridableObjects:(id)a3 iconListViews:(id)a4 additionalIconViews:(id)a5 iconImageCache:(id)a6 folderIconImageCache:(id)a7;
- (id)allIconViews;
- (int64_t)configurationUserInterfaceStyle;
- (int64_t)userInterfaceStyleForAdditionalViewsOverrideForStyleConfiguration:(id)a3;
- (void)addObserver:(id)a3;
- (void)applyImageStyleConfigurationToIconViews:(id)a3;
- (void)informObserversOfPreviewGenerationWithDuration:(double)a3;
- (void)pausePreviewing;
- (void)prepare;
- (void)removeObserver:(id)a3;
- (void)setDelayedTintStyleConfiguration:(id)a3;
- (void)setGeneratingTintedImages:(BOOL)a3;
- (void)setImageStyleConfiguration:(id)a3;
- (void)setTintableIcons:(id)a3;
- (void)setTraitOverridableObjects:(id)a3;
- (void)updateUIWithDelayedTintColorIfNecessary;
- (void)updateUIWithImageStyleConfiguration:(id)a3;
- (void)updateUIWithTintedImageStyleConfiguration:(id)a3;
@end

@implementation SBHIconStylePreviewManager

- (SBHIconStylePreviewManager)initWithTraitOverridableObjects:(id)a3 iconListViews:(id)a4 additionalIconViews:(id)a5 iconImageCache:(id)a6 folderIconImageCache:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)SBHIconStylePreviewManager;
  v17 = [(SBHIconStylePreviewManager *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    traitOverridableObjects = v17->_traitOverridableObjects;
    v17->_traitOverridableObjects = (NSArray *)v18;

    uint64_t v20 = [v13 copy];
    iconListViews = v17->_iconListViews;
    v17->_iconListViews = (NSArray *)v20;

    uint64_t v22 = [v14 copy];
    additionalIconViews = v17->_additionalIconViews;
    v17->_additionalIconViews = (NSArray *)v22;

    objc_storeStrong((id *)&v17->_iconImageCache, a6);
    objc_storeStrong((id *)&v17->_folderIconImageCache, a7);
    [(SBHIconStylePreviewManager *)v17 prepare];
  }

  return v17;
}

- (void)prepare
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v14 = [(SBHIconStylePreviewManager *)self allIconViews];
  v3 = objc_msgSend(v14, "bs_compactMap:", &__block_literal_global_32);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([(SBHIconStylePreviewManager *)self canTintIconSpecially:v10])
        {
          [v4 addObject:v10];
        }
        else if ([v10 isFolderIcon])
        {
          v11 = [v10 folder];
          id v12 = [v11 firstList];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __37__SBHIconStylePreviewManager_prepare__block_invoke_2;
          v15[3] = &unk_1E6AAF238;
          v15[4] = self;
          id v13 = [v12 directlyContainedIconsPassingTest:v15];
          [v4 addObjectsFromArray:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  [(SBHIconStylePreviewManager *)self setTintableIcons:v4];
}

uint64_t __37__SBHIconStylePreviewManager_prepare__block_invoke(uint64_t a1, void *a2)
{
  return [a2 icon];
}

uint64_t __37__SBHIconStylePreviewManager_prepare__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) canTintIconSpecially:a2];
}

- (BOOL)canTintIconSpecially:(id)a3
{
  id v3 = a3;
  id v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v6 = 0;
  }
  else if ([v3 isApplicationIcon])
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v3 isBookmarkIcon];
  }

  return v6;
}

- (void)updateUIWithTintedImageStyleConfiguration:(id)a3
{
  id v4 = a3;
  if ([(SBHIconStylePreviewManager *)self isGeneratingTintedImages])
  {
    [(SBHIconStylePreviewManager *)self setDelayedTintStyleConfiguration:v4];
  }
  else
  {
    [(SBHIconStylePreviewManager *)self setGeneratingTintedImages:1];
    uint64_t v5 = mach_continuous_time();
    char v6 = [(SBHIconStylePreviewManager *)self tintableIcons];
    uint64_t v7 = [(SBHIconStylePreviewManager *)self iconImageCache];
    uint64_t v8 = objc_msgSend(v4, "iconImageAppearanceWithUserInterfaceStyle:", -[SBHIconStylePreviewManager configurationUserInterfaceStyle](self, "configurationUserInterfaceStyle"));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__SBHIconStylePreviewManager_updateUIWithTintedImageStyleConfiguration___block_invoke;
    v10[3] = &unk_1E6AAFFD8;
    v10[4] = self;
    uint64_t v12 = v5;
    id v11 = v4;
    id v9 = (id)[v7 cacheImagesForIcons:v6 imageAppearance:v8 priority:4 reason:@"SBHIconStylePreviewManager tint images" options:0 completionHandler:v10];
  }
}

uint64_t __72__SBHIconStylePreviewManager_updateUIWithTintedImageStyleConfiguration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setGeneratingTintedImages:0];
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  objc_msgSend(*(id *)(a1 + 32), "informObserversOfPreviewGenerationWithDuration:");
  [*(id *)(a1 + 32) applyImageStyleConfigurationToIconViews:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 updateUIWithDelayedTintColorIfNecessary];
}

- (void)updateUIWithDelayedTintColorIfNecessary
{
  id v3 = [(SBHIconStylePreviewManager *)self delayedTintStyleConfiguration];
  if (v3)
  {
    [(SBHIconStylePreviewManager *)self setDelayedTintStyleConfiguration:0];
    [(SBHIconStylePreviewManager *)self updateUIWithTintedImageStyleConfiguration:v3];
  }
}

- (void)applyImageStyleConfigurationToIconViews:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(SBHIconStylePreviewManager *)self traitOverridableObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) traitOverrides];
        id v11 = self;
        [v10 setObject:v4 forTrait:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)updateUIWithImageStyleConfiguration:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [v5 configurationType];
  if (v4 >= 4)
  {
    if (v4 == 4) {
      [(SBHIconStylePreviewManager *)self updateUIWithTintedImageStyleConfiguration:v5];
    }
  }
  else
  {
    [(SBHIconStylePreviewManager *)self updateUIWithNonTintedImageStyleConfiguration:v5];
  }
}

- (void)setImageStyleConfiguration:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    unint64_t v4 = (SBHIconImageStyleConfiguration *)[v6 copy];
    imageStyleConfiguration = self->_imageStyleConfiguration;
    self->_imageStyleConfiguration = v4;

    if (v6) {
      [(SBHIconStylePreviewManager *)self updateUIWithImageStyleConfiguration:v6];
    }
    else {
      [(SBHIconStylePreviewManager *)self pausePreviewing];
    }
  }
}

- (void)pausePreviewing
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SBHIconStylePreviewManager *)self traitOverridableObjects];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) traitOverrides];
        uint64_t v8 = self;
        [v7 removeTrait:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (id)allIconViews
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(SBHIconStylePreviewManager *)self iconListViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __42__SBHIconStylePreviewManager_allIconViews__block_invoke;
        v12[3] = &unk_1E6AAD830;
        id v13 = v3;
        [v9 enumerateDisplayedIconViewsUsingBlock:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  long long v10 = [(SBHIconStylePreviewManager *)self additionalIconViews];
  [v3 addObjectsFromArray:v10];

  return v3;
}

uint64_t __42__SBHIconStylePreviewManager_allIconViews__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (int64_t)configurationUserInterfaceStyle
{
  v2 = [(SBHIconStylePreviewManager *)self iconListViews];
  id v3 = [v2 firstObject];
  id v4 = [v3 traitCollection];
  int64_t v5 = [v4 userInterfaceStyle];

  return v5;
}

- (int64_t)userInterfaceStyleForAdditionalViewsOverrideForStyleConfiguration:(id)a3
{
  id v4 = a3;
  int64_t v5 = objc_msgSend(v4, "iconImageAppearanceWithUserInterfaceStyle:", -[SBHIconStylePreviewManager configurationUserInterfaceStyle](self, "configurationUserInterfaceStyle"));

  int64_t v6 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_userInterfaceStyleForIconImageAppearance:", v5);
  return v6;
}

- (void)informObserversOfPreviewGenerationWithDuration:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 stylePreviewManager:self didGeneratePreviewsInDuration:a3];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (NSArray)traitOverridableObjects
{
  return self->_traitOverridableObjects;
}

- (void)setTraitOverridableObjects:(id)a3
{
}

- (NSArray)iconListViews
{
  return self->_iconListViews;
}

- (NSArray)additionalIconViews
{
  return self->_additionalIconViews;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (SBHIconImageStyleConfiguration)imageStyleConfiguration
{
  return self->_imageStyleConfiguration;
}

- (NSArray)tintableIcons
{
  return self->_tintableIcons;
}

- (void)setTintableIcons:(id)a3
{
}

- (BOOL)isGeneratingTintedImages
{
  return self->_generatingTintedImages;
}

- (void)setGeneratingTintedImages:(BOOL)a3
{
  self->_generatingTintedImages = a3;
}

- (SBHIconImageStyleConfiguration)delayedTintStyleConfiguration
{
  return self->_delayedTintStyleConfiguration;
}

- (void)setDelayedTintStyleConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedTintStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_tintableIcons, 0);
  objc_storeStrong((id *)&self->_imageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_additionalIconViews, 0);
  objc_storeStrong((id *)&self->_iconListViews, 0);
  objc_storeStrong((id *)&self->_traitOverridableObjects, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end