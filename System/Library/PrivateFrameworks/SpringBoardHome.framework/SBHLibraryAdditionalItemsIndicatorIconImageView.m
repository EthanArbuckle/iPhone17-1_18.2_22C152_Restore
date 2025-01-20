@interface SBHLibraryAdditionalItemsIndicatorIconImageView
+ (BOOL)allowsLayersForMiniIcons;
+ (BOOL)hasCustomJitter;
- (BOOL)hasOpaqueImage;
- (SBHLibraryAdditionalItemsIndicatorIconImageView)initWithFrame:(CGRect)a3;
- (unint64_t)concreteBackgroundStyle;
- (void)_addCustomJitter;
- (void)_addCustomJitterToIconLayers:(id)a3;
- (void)_removeCustomJitter;
- (void)_removeCustomJitterFromIconLayers:(id)a3;
- (void)setJittering:(BOOL)a3;
@end

@implementation SBHLibraryAdditionalItemsIndicatorIconImageView

- (SBHLibraryAdditionalItemsIndicatorIconImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryAdditionalItemsIndicatorIconImageView;
  v3 = -[SBFolderIconImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SBFolderIconImageView *)v3 setPageGridClipsToBounds:0];
  }
  return v4;
}

- (unint64_t)concreteBackgroundStyle
{
  unint64_t result = [(SBFolderIconImageView *)self backgroundStyle];
  if (result <= 1) {
    return 1;
  }
  return result;
}

- (BOOL)hasOpaqueImage
{
  return 0;
}

- (void)setJittering:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBIconImageView *)self isJittering];
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryAdditionalItemsIndicatorIconImageView;
  [(SBIconImageView *)&v6 setJittering:v3];
  if (v5 || !v3)
  {
    if (v5 && !v3) {
      [(SBHLibraryAdditionalItemsIndicatorIconImageView *)self _removeCustomJitter];
    }
  }
  else
  {
    [(SBHLibraryAdditionalItemsIndicatorIconImageView *)self _addCustomJitter];
  }
}

+ (BOOL)hasCustomJitter
{
  if ([a1 allowsLayersForMiniIcons]) {
    return 1;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SBHLibraryAdditionalItemsIndicatorIconImageView;
  return objc_msgSendSuper2(&v4, sel_hasCustomJitter);
}

+ (BOOL)allowsLayersForMiniIcons
{
  return 1;
}

- (void)_addCustomJitter
{
  id v3 = [(SBFolderIconImageView *)self currentPageIconLayers];
  [(SBHLibraryAdditionalItemsIndicatorIconImageView *)self _addCustomJitterToIconLayers:v3];
}

- (void)_addCustomJitterToIconLayers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        v9 = +[SBIconView _jitterXTranslationAnimationWithAmount:0.25];
        [v8 addAnimation:v9 forKey:@"SBFolderIconImageViewJitterXTranslationAnimationKey"];

        v10 = +[SBIconView _jitterXTranslationAnimationWithAmount:0.25];
        [v8 addAnimation:v10 forKey:@"SBFolderIconImageViewJitterYTranslationAnimationKey"];

        BSDegreesToRadians();
        v11 = +[SBIconView _jitterRotationAnimationWithAmount:](SBIconView, "_jitterRotationAnimationWithAmount:");
        [v8 addAnimation:v11 forKey:@"SBFolderIconImageViewJitterRotationAnimationKey"];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_removeCustomJitter
{
  id v3 = [(SBFolderIconImageView *)self currentPageIconLayers];
  [(SBHLibraryAdditionalItemsIndicatorIconImageView *)self _removeCustomJitterFromIconLayers:v3];
}

- (void)_removeCustomJitterFromIconLayers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 removeAnimationForKey:@"SBFolderIconImageViewJitterXTranslationAnimationKey"];
        [v8 removeAnimationForKey:@"SBFolderIconImageViewJitterYTranslationAnimationKey"];
        [v8 removeAnimationForKey:@"SBFolderIconImageViewJitterRotationAnimationKey"];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

@end