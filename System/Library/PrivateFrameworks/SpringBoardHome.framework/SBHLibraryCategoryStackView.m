@interface SBHLibraryCategoryStackView
- (BOOL)isEditing;
- (BOOL)isHighlighted;
- (BOOL)isInnerIconImageInfoFrozen;
- (BOOL)isOverlapping;
- (CGRect)frameForStackedViewAtIndex:(unint64_t)a3;
- (CGRect)visibleContentFrame;
- (NSArray)innerIcons;
- (NSString)backdropGroupName;
- (NSString)backdropGroupNamespace;
- (NSString)description;
- (SBHLibraryCategoryStackView)initWithFrame:(CGRect)a3;
- (SBIconImageInfo)_innerIconImageInfo;
- (SBIconImageInfo)iconImageInfo;
- (double)_innerIconEdgeSpacingFraction;
- (double)_innerIconInterSpacingFraction;
- (double)alphaForStackedViewAtIndex:(unint64_t)a3;
- (id)_scalingAnimationSettingsForStackedViewAtIndex:(unint64_t)a3 scale:(double *)a4;
- (id)backgroundViewForIndex:(unint64_t)a3 compatibleWithTraitCollection:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)matchingCategoryStackView;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)numberOfCategories;
- (void)_appendConfiguredPodBackgroundView;
- (void)_iconAppearanceDidChange;
- (void)_reconfigurePodBackgroundViews;
- (void)_removeLastPodBackgroundView;
- (void)_resetAllPodBackgroundViews;
- (void)_updateIconImageViewAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)_updateIconImageViewsAnimated:(BOOL)a3;
- (void)_userInterfaceStyleDidChange;
- (void)iconImageCache:(id)a3 didUpdateImageForIcon:(id)a4 imageAppearance:(id)a5;
- (void)layoutSubviews;
- (void)setBackdropGroupName:(id)a3;
- (void)setBackdropGroupNamespace:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setInnerIconImageInfoFrozen:(BOOL)a3;
- (void)setInnerIcons:(id)a3;
- (void)setInnerIcons:(id)a3 animated:(BOOL)a4;
- (void)setNumberOfCategories:(unint64_t)a3;
- (void)setOverlapping:(BOOL)a3;
@end

@implementation SBHLibraryCategoryStackView

- (SBHLibraryCategoryStackView)initWithFrame:(CGRect)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)SBHLibraryCategoryStackView;
  v3 = -[SBHLibraryCategoryStackView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    podBackgroundViews = v3->_podBackgroundViews;
    v3->_podBackgroundViews = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    iconImageViews = v3->_iconImageViews;
    v3->_iconImageViews = (NSMutableArray *)v6;

    for (uint64_t i = 0; i != 4; ++i)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
      v10 = [v9 layer];
      [v10 setAllowsEdgeAntialiasing:1];

      [(NSMutableArray *)v3->_iconImageViews setObject:v9 atIndexedSubscript:i];
    }
    v3->_numberOfCategories = 1;
    objc_storeStrong((id *)&v3->_backdropGroupNamespace, (id)*MEMORY[0x1E4F39DA8]);
    v11 = +[SBHHomeScreenDomain rootSettings];
    v12 = [v11 iconAnimationSettings];
    uint64_t v13 = [v12 libraryIndicatorIconSettings];
    iconSettings = v3->_iconSettings;
    v3->_iconSettings = (SBHLibraryIndicatorIconSettings *)v13;

    [(SBHLibraryCategoryStackView *)v3 _appendConfiguredPodBackgroundView];
    v15 = self;
    v24[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    id v17 = (id)[(SBHLibraryCategoryStackView *)v3 registerForTraitChanges:v16 withAction:sel__userInterfaceStyleDidChange];

    v18 = self;
    v23 = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    id v20 = (id)[(SBHLibraryCategoryStackView *)v3 registerForTraitChanges:v19 withAction:sel__iconAppearanceDidChange];
  }
  return v3;
}

- (id)matchingCategoryStackView
{
  id v3 = objc_alloc((Class)objc_opt_class());
  [(SBHLibraryCategoryStackView *)self bounds];
  uint64_t v4 = (id *)objc_msgSend(v3, "initWithFrame:");
  objc_msgSend(v4, "setNumberOfCategories:", -[SBHLibraryCategoryStackView numberOfCategories](self, "numberOfCategories"));
  [(SBHLibraryCategoryStackView *)self iconImageInfo];
  objc_msgSend(v4, "setIconImageInfo:");
  objc_storeStrong(v4 + 54, self->_iconImageCache);
  v5 = [(SBHLibraryCategoryStackView *)self innerIcons];
  [v4 setInnerIcons:v5];

  uint64_t v6 = [(SBHLibraryCategoryStackView *)self backdropGroupName];
  [v4 setBackdropGroupName:v6];

  v7 = [(SBHLibraryCategoryStackView *)self backdropGroupNamespace];
  [v4 setBackdropGroupNamespace:v7];

  objc_msgSend(v4, "setInnerIconImageInfoFrozen:", -[SBHLibraryCategoryStackView isInnerIconImageInfoFrozen](self, "isInnerIconImageInfoFrozen"));
  return v4;
}

- (void)setNumberOfCategories:(unint64_t)a3
{
  if (self->_numberOfCategories != a3)
  {
    self->_numberOfCategories = a3;
    [(SBHLibraryCategoryStackView *)self setNeedsLayout];
  }
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    [(SBHLibraryCategoryStackView *)self setNeedsLayout];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    iconImageViews = self->_iconImageViews;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __42__SBHLibraryCategoryStackView_setEditing___block_invoke;
    v4[3] = &__block_descriptor_33_e28_v32__0__UIImageView_8Q16_B24l;
    BOOL v5 = a3;
    [(NSMutableArray *)iconImageViews enumerateObjectsUsingBlock:v4];
  }
}

void __42__SBHLibraryCategoryStackView_setEditing___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 layer];
  if (*(unsigned char *)(a1 + 32))
  {
    double v3 = +[SBIconView _jitterXTranslationAnimationWithAmount:0.25];
    double v4 = +[SBIconView _jitterYTranslationAnimationWithAmount:0.25];
    BSDegreesToRadians();
    BOOL v5 = +[SBIconView _jitterRotationAnimationWithAmount:](SBIconView, "_jitterRotationAnimationWithAmount:");
    [v6 addAnimation:v3 forKey:@"SBHIconImageJitterXTranslation"];
    [v6 addAnimation:v4 forKey:@"SBHIconImageJitterYTranslation"];
    [v6 addAnimation:v5 forKey:@"SBHIconImageJitterRotation"];
  }
  else
  {
    [v6 removeAnimationForKey:@"SBHIconImageJitterXTranslation"];
    [v6 removeAnimationForKey:@"SBHIconImageJitterYTranslation"];
    [v6 removeAnimationForKey:@"SBHIconImageJitterRotation"];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    podBackgroundViews = self->_podBackgroundViews;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __46__SBHLibraryCategoryStackView_setHighlighted___block_invoke;
    v4[3] = &unk_1E6AAF7F0;
    void v4[4] = self;
    BOOL v5 = a3;
    [(NSMutableArray *)podBackgroundViews enumerateObjectsUsingBlock:v4];
  }
}

void __46__SBHLibraryCategoryStackView_setHighlighted___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  CGFloat v14 = 1.0;
  id v6 = [*(id *)(a1 + 32) _scalingAnimationSettingsForStackedViewAtIndex:a3 scale:&v14];
  memset(&v13, 0, sizeof(v13));
  if (*(unsigned char *)(a1 + 40))
  {
    CGAffineTransformMakeScale(&v13, v14, v14);
  }
  else
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v13.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v13.c = v7;
    *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  double v8 = (void *)MEMORY[0x1E4FB1EB0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  CGAffineTransform v12 = v13;
  v10[2] = __46__SBHLibraryCategoryStackView_setHighlighted___block_invoke_2;
  v10[3] = &unk_1E6AAFE30;
  id v11 = v5;
  id v9 = v5;
  objc_msgSend(v8, "sb_animateWithSettings:mode:animations:completion:", v6, 3, v10, 0);
}

uint64_t __46__SBHLibraryCategoryStackView_setHighlighted___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

- (void)setOverlapping:(BOOL)a3
{
  if (self->_overlapping != a3)
  {
    self->_overlapping = a3;
    podBackgroundViews = self->_podBackgroundViews;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __46__SBHLibraryCategoryStackView_setOverlapping___block_invoke;
    _OWORD v4[3] = &__block_descriptor_33_e23_v32__0__UIView_8Q16_B24l;
    BOOL v5 = a3;
    [(NSMutableArray *)podBackgroundViews enumerateObjectsUsingBlock:v4];
  }
}

void __46__SBHLibraryCategoryStackView_setOverlapping___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  memset(&v9, 0, sizeof(v9));
  if (*(unsigned char *)(a1 + 32))
  {
    CGAffineTransformMakeScale(&v9, 1.13, 1.13);
  }
  else
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v9.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v9.c = v4;
    *(_OWORD *)&v9.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  id v5 = v3;
  id v6 = [v5 materialView];
  CGAffineTransform v8 = v9;
  [v6 setTransform:&v8];

  long long v7 = [v5 tintingView];

  CGAffineTransform v8 = v9;
  [v7 setTransform:&v8];
}

- (void)setInnerIcons:(id)a3
{
}

- (void)setInnerIcons:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)MEMORY[0x1E4F28D60];
  id v7 = a3;
  unint64_t v8 = [v7 count];
  if (v8 >= 4) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = v8;
  }
  objc_msgSend(v6, "indexSetWithIndexesInRange:", 0, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  double v10 = objc_msgSend(v7, "objectsAtIndexes:");

  if ((BSEqualArrays() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_innerIcons, v10);
    [(SBHLibraryCategoryStackView *)self _updateIconImageViewsAnimated:v4];
  }
}

- (void)setBackdropGroupName:(id)a3
{
  id v5 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backdropGroupName, a3);
    podBackgroundViews = self->_podBackgroundViews;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__SBHLibraryCategoryStackView_setBackdropGroupName___block_invoke;
    v7[3] = &unk_1E6AAFE78;
    id v8 = v5;
    [(NSMutableArray *)podBackgroundViews enumerateObjectsUsingBlock:v7];
  }
}

void __52__SBHLibraryCategoryStackView_setBackdropGroupName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 materialView];
  [v3 setGroupName:*(void *)(a1 + 32)];
}

- (void)setBackdropGroupNamespace:(id)a3
{
  id v5 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backdropGroupNamespace, a3);
    podBackgroundViews = self->_podBackgroundViews;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__SBHLibraryCategoryStackView_setBackdropGroupNamespace___block_invoke;
    v7[3] = &unk_1E6AAFE78;
    id v8 = v5;
    [(NSMutableArray *)podBackgroundViews enumerateObjectsUsingBlock:v7];
  }
}

void __57__SBHLibraryCategoryStackView_setBackdropGroupNamespace___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 materialView];
  BOOL v4 = [v3 layer];

  uint64_t v5 = objc_opt_class();
  id v8 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  [v7 setGroupNamespace:*(void *)(a1 + 32)];
}

- (CGRect)visibleContentFrame
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v2 = self->_podBackgroundViews;
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v10) frame];
        v28.origin.CGFloat x = v11;
        v28.origin.CGFloat y = v12;
        v28.size.CGFloat width = v13;
        v28.size.CGFloat height = v14;
        v25.origin.CGFloat x = x;
        v25.origin.CGFloat y = y;
        v25.size.CGFloat width = width;
        v25.size.CGFloat height = height;
        CGRect v26 = CGRectUnion(v25, v28);
        CGFloat x = v26.origin.x;
        CGFloat y = v26.origin.y;
        CGFloat width = v26.size.width;
        CGFloat height = v26.size.height;
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)frameForStackedViewAtIndex:(unint64_t)a3
{
  [(SBHLibraryCategoryStackView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v12 = [(SBHLibraryCategoryStackView *)self traitCollection];
  [v12 displayScale];

  CGFloat v13 = (id *)MEMORY[0x1E4FB2608];
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] != 1)
  {
    v19.origin.CGFloat x = v5;
    v19.origin.CGFloat y = v7;
    v19.size.CGFloat width = v9;
    v19.size.CGFloat height = v11;
    CGRectGetMinX(v19);
  }
  [*v13 userInterfaceLayoutDirection];
  UIRectIntegralWithScale();
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (double)alphaForStackedViewAtIndex:(unint64_t)a3
{
  double result = 0.0;
  if (self->_numberOfCategories > a3) {
    return 1.0;
  }
  return result;
}

- (id)backgroundViewForIndex:(unint64_t)a3 compatibleWithTraitCollection:(id)a4
{
  v60[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a4 userInterfaceStyle];
  CGFloat v7 = [_SBHLibraryCategoryStackViewBackgroundView alloc];
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CGFloat v12 = -[_SBHLibraryCategoryStackViewBackgroundView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
  CGFloat v13 = [(_SBHLibraryCategoryStackViewBackgroundView *)v12 layer];
  [v13 setAllowsGroupBlending:0];
  double v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v8, v9, v10, v11);
  double v15 = [v14 layer];
  [v14 setAutoresizingMask:18];
  double v16 = (double)a3;
  double v17 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  double v18 = [v17 colorWithAlphaComponent:(double)a3 * -0.075 + 1.0];
  [v14 setBackgroundColor:v18];

  [v15 setAllowsGroupBlending:0];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  CAColorMatrixMakeSaturation();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v50 = 0u;
  CAColorMatrixMakeColorSourceOver();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v45 = 0u;
  CAColorMatrixMakeContrast();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  CAColorMatrixConcat();
  CAColorMatrixConcat();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  objc_msgSend(MEMORY[0x1E4F39BC0], "filterWithType:", *MEMORY[0x1E4F3A350], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
  CGRect v19 = 0);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v20 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v35];
  [v19 setValue:v20 forKey:*MEMORY[0x1E4F3A168]];

  v60[0] = v19;
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
  [v15 setFilters:v21];

  if (self->_numberOfCategories - 2 >= a3)
  {
    long long v22 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:19];
    [v22 setAutoresizingMask:18];
    v23 = [(SBHLibraryCategoryStackView *)self backdropGroupName];
    [v22 setGroupName:v23];

    uint64_t v24 = [v22 layer];
    [v24 setAllowsGroupBlending:0];
    uint64_t v25 = objc_opt_class();
    id v26 = v24;
    if (v25)
    {
      if (objc_opt_isKindOfClass()) {
        v27 = v26;
      }
      else {
        v27 = 0;
      }
    }
    else
    {
      v27 = 0;
    }
    id v28 = v27;

    v29 = [(SBHLibraryCategoryStackView *)self backdropGroupNamespace];
    [v28 setGroupNamespace:v29];

    [(_SBHLibraryCategoryStackViewBackgroundView *)v12 addSubview:v22];
    [(_SBHLibraryCategoryStackViewBackgroundView *)v12 setMaterialView:v22];
    if (v6 != 2)
    {
      uint64_t v30 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
      double v31 = -(v16 + -3.0);
      if (v30 != 1) {
        double v31 = v16 + -3.0;
      }
      objc_msgSend(v13, "setShadowOffset:", v31, 0.0);
      id v32 = [MEMORY[0x1E4FB1618] blackColor];
      objc_msgSend(v13, "setShadowColor:", objc_msgSend(v32, "CGColor"));

      [v13 setShadowRadius:3.0];
      LODWORD(v33) = 1022739087;
      [v13 setShadowOpacity:v33];
      [v13 setShadowPathIsBounds:1];
    }
  }
  [(_SBHLibraryCategoryStackViewBackgroundView *)v12 addSubview:v14];
  [(_SBHLibraryCategoryStackViewBackgroundView *)v12 setTintingView:v14];

  return v12;
}

- (void)layoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)SBHLibraryCategoryStackView;
  [(SBHLibraryCategoryStackView *)&v45 layoutSubviews];
  unint64_t numberOfCategories = self->_numberOfCategories;
  if (numberOfCategories != [(NSMutableArray *)self->_podBackgroundViews count]) {
    [(SBHLibraryCategoryStackView *)self _reconfigurePodBackgroundViews];
  }
  [(SBHLibraryCategoryStackView *)self bounds];
  uint64_t v42 = v6;
  uint64_t v43 = v5;
  double v7 = v4;
  uint64_t v9 = v8;
  if (numberOfCategories)
  {
    uint64_t v10 = 0;
    double continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
    if (v4 >= 1.0) {
      double v12 = v4;
    }
    else {
      double v12 = 1.0;
    }
    do
    {
      CGFloat v13 = [(NSMutableArray *)self->_podBackgroundViews objectAtIndex:v10];
      [(SBHLibraryCategoryStackView *)self frameForStackedViewAtIndex:v10];
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      BSRectWithSize();
      objc_msgSend(v13, "setBounds:");
      UIRectGetCenter();
      objc_msgSend(v13, "setCenter:");
      v46.origin.CGFloat x = v15;
      v46.origin.CGFloat y = v17;
      v46.size.CGFloat width = v19;
      v46.size.CGFloat height = v21;
      [v13 _setContinuousCornerRadius:continuousCornerRadius * (CGRectGetWidth(v46) / v12)];
      [(SBHLibraryCategoryStackView *)self alphaForStackedViewAtIndex:v10];
      objc_msgSend(v13, "setAlpha:");

      ++v10;
    }
    while (numberOfCategories != v10);
  }
  [(SBHLibraryCategoryStackView *)self _innerIconImageInfo];
  double v26 = v25;
  double v27 = v22;
  if (v25 != *MEMORY[0x1E4F1DB30] || v22 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v29 = v23;
    double v30 = v24;
    [(SBHIconImageCache *)self->_iconImageCache iconImageInfo];
    if (!SBIconImageInfoEqualToIconImageInfo(v26, v27, v29, v30, v31, v32, v33, v34)
      && ![(SBHLibraryCategoryStackView *)self isInnerIconImageInfoFrozen])
    {
      long long v35 = [SBHIconImageCache alloc];
      long long v36 = (objc_class *)objc_opt_class();
      long long v37 = NSStringFromClass(v36);
      long long v38 = -[SBHIconImageCache initWithName:iconImageInfo:](v35, "initWithName:iconImageInfo:", v37, v26, v27, v29, v30);
      iconImageCache = self->_iconImageCache;
      self->_iconImageCache = v38;

      [(SBHIconImageCache *)self->_iconImageCache addObserver:self];
      [(SBHLibraryCategoryStackView *)self _updateIconImageViewsAnimated:0];
    }
    [(SBHLibraryCategoryStackView *)self _innerIconEdgeSpacingFraction];
    UIRoundToScale();
    iconImageViews = self->_iconImageViews;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __45__SBHLibraryCategoryStackView_layoutSubviews__block_invoke;
    v44[3] = &__block_descriptor_88_e28_v32__0__UIImageView_8Q16_B24l;
    v44[4] = v41;
    v44[5] = v43;
    v44[6] = v42;
    *(double *)&v44[7] = v7;
    v44[8] = v9;
    *(double *)&v44[9] = v26;
    *(double *)&v44[10] = v27;
    [(NSMutableArray *)iconImageViews enumerateObjectsUsingBlock:v44];
  }
}

void __45__SBHLibraryCategoryStackView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v6 = a2;
  if ((a3 & 1) == ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] != 1)) {
    double v5 = CGRectGetMaxX(*(CGRect *)(a1 + 40)) - *(double *)(a1 + 32) - *(double *)(a1 + 72);
  }
  else {
    double v5 = *(double *)(a1 + 32);
  }
  if (a3 > 1) {
    CGRectGetMaxY(*(CGRect *)(a1 + 40));
  }
  [v6 setFrame:v5];
}

- (void)iconImageCache:(id)a3 didUpdateImageForIcon:(id)a4 imageAppearance:(id)a5
{
  NSUInteger v6 = [(NSArray *)self->_innerIcons indexOfObject:a4];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(SBHLibraryCategoryStackView *)self _updateIconImageViewAtIndex:v6 animated:1];
  }
}

- (void)_reconfigurePodBackgroundViews
{
  unint64_t numberOfCategories = self->_numberOfCategories;
  for (uint64_t i = self->_podBackgroundViews;
        [(NSMutableArray *)i count] > numberOfCategories;
        uint64_t i = self->_podBackgroundViews)
  {
    [(SBHLibraryCategoryStackView *)self _removeLastPodBackgroundView];
  }
  if ([(NSMutableArray *)self->_podBackgroundViews count]) {
    [(SBHLibraryCategoryStackView *)self _removeLastPodBackgroundView];
  }
  while ([(NSMutableArray *)self->_podBackgroundViews count] < numberOfCategories)
    [(SBHLibraryCategoryStackView *)self _appendConfiguredPodBackgroundView];
}

- (void)_appendConfiguredPodBackgroundView
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_podBackgroundViews count];
  double v4 = [(SBHLibraryCategoryStackView *)self traitCollection];
  double v5 = [(SBHLibraryCategoryStackView *)self backgroundViewForIndex:v3 compatibleWithTraitCollection:v4];

  [v5 setAutoresizingMask:18];
  [(SBHLibraryCategoryStackView *)self addSubview:v5];
  [(SBHLibraryCategoryStackView *)self sendSubviewToBack:v5];
  [(NSMutableArray *)self->_podBackgroundViews addObject:v5];
  if ([(NSMutableArray *)self->_podBackgroundViews count] == 1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    NSUInteger v6 = self->_iconImageViews;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v5, "addSubview:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_removeLastPodBackgroundView
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_podBackgroundViews lastObject];
  [(NSMutableArray *)self->_podBackgroundViews removeLastObject];
  [v3 removeFromSuperview];
  if (![(NSMutableArray *)self->_podBackgroundViews count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    double v4 = self->_iconImageViews;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          -[SBHLibraryCategoryStackView addSubview:](self, "addSubview:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_resetAllPodBackgroundViews
{
  for (uint64_t i = self->_podBackgroundViews; [(NSMutableArray *)i count]; uint64_t i = self->_podBackgroundViews)
    [(SBHLibraryCategoryStackView *)self _removeLastPodBackgroundView];
  [(SBHLibraryCategoryStackView *)self setNeedsLayout];
}

- (void)_userInterfaceStyleDidChange
{
  [(SBHLibraryCategoryStackView *)self _resetAllPodBackgroundViews];
  [(SBHLibraryCategoryStackView *)self _updateIconImageViewsAnimated:1];
}

- (void)_iconAppearanceDidChange
{
}

- (double)_innerIconEdgeSpacingFraction
{
  return 0.133333333;
}

- (double)_innerIconInterSpacingFraction
{
  return 0.0666666667;
}

- (SBIconImageInfo)_innerIconImageInfo
{
  [(SBHLibraryCategoryStackView *)self bounds];
  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v8 = self->_iconImageInfo.size.width == *MEMORY[0x1E4F1DB30] && self->_iconImageInfo.size.height == v7;
  if (v8 || (v4 == v6 ? (BOOL v9 = v5 == v7) : (BOOL v9 = 0), v9))
  {
    double v17 = 0.0;
    double v16 = 0.0;
  }
  else
  {
    double scale = self->_iconImageInfo.scale;
    [(SBHLibraryCategoryStackView *)self _innerIconEdgeSpacingFraction];
    [(SBHLibraryCategoryStackView *)self _innerIconInterSpacingFraction];
    UIRoundToScale();
    double v12 = v11;
    UIRoundToScale();
    double v14 = v13;
    UICeilToScale();
    double v16 = v15;
    double v6 = v12;
    double v7 = v14;
    double v17 = scale;
  }
  SBIconImageInfoMake(v6, v7, v17, v16);
  return result;
}

- (void)_updateIconImageViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSMutableArray *)self->_iconImageViews count])
  {
    unint64_t v5 = 0;
    do
      [(SBHLibraryCategoryStackView *)self _updateIconImageViewAtIndex:v5++ animated:v3];
    while (v5 < [(NSMutableArray *)self->_iconImageViews count]);
  }
}

- (void)_updateIconImageViewAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = -[NSMutableArray objectAtIndex:](self->_iconImageViews, "objectAtIndex:");
  if ([(NSArray *)self->_innerIcons count] <= a3)
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = [(NSArray *)self->_innerIcons objectAtIndex:a3];
  }
  BOOL v9 = [(SBHLibraryCategoryStackView *)self traitCollection];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__SBHLibraryCategoryStackView__updateIconImageViewAtIndex_animated___block_invoke;
  aBlock[3] = &unk_1E6AADD48;
  id v10 = v7;
  id v23 = v10;
  id v11 = v8;
  id v24 = v11;
  double v25 = self;
  id v12 = v9;
  id v26 = v12;
  double v13 = (void (**)(void))_Block_copy(aBlock);
  double v14 = v13;
  if (v4)
  {
    double v15 = (void *)MEMORY[0x1E4FB1EB0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__SBHLibraryCategoryStackView__updateIconImageViewAtIndex_animated___block_invoke_2;
    v20[3] = &unk_1E6AAD4C8;
    CGFloat v21 = v13;
    [v15 transitionWithView:v10 duration:5242880 options:v20 animations:0 completion:0.25];
  }
  else
  {
    v13[2](v13);
  }
  double v16 = [v11 nodeIdentifier];
  double v17 = objc_msgSend(NSString, "stringWithFormat:", @"SBHLibraryCategoryStackView-innerIcon-%lu:", a3);
  double v18 = v17;
  if (v11)
  {
    CGFloat v19 = [v17 stringByAppendingString:v16];
    [v10 setAccessibilityIdentifier:v19];
  }
  else
  {
    [v10 setAccessibilityIdentifier:0];
  }
}

void __68__SBHLibraryCategoryStackView__updateIconImageViewAtIndex_animated___block_invoke(void *a1)
{
  long long v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  if (v1)
  {
    id v4 = [*(id *)(a1[6] + 432) imageForIcon:v1 compatibleWithTraitCollection:a1[7] options:0];
    [v2 setImage:v4];
  }
  else
  {
    BOOL v3 = (void *)a1[4];
    objc_msgSend(v3, "setImage:");
  }
}

uint64_t __68__SBHLibraryCategoryStackView__updateIconImageViewAtIndex_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_scalingAnimationSettingsForStackedViewAtIndex:(unint64_t)a3 scale:(double *)a4
{
  double v6 = self->_iconSettings;
  double v7 = v6;
  if (a3 == 1)
  {
    [(SBHLibraryIndicatorIconSettings *)v6 pod2Scale];
    uint64_t v9 = v11;
    uint64_t v10 = [(SBHLibraryIndicatorIconSettings *)v7 pod2AnimationSettings];
  }
  else if (a3)
  {
    if (a3 >= 3) {
      NSLog(&cfstr_NoIndicatorIco.isa, a3);
    }
    [(SBHLibraryIndicatorIconSettings *)v7 pod3Scale];
    uint64_t v9 = v12;
    uint64_t v10 = [(SBHLibraryIndicatorIconSettings *)v7 pod3AnimationSettings];
  }
  else
  {
    [(SBHLibraryIndicatorIconSettings *)v6 pod1Scale];
    uint64_t v9 = v8;
    uint64_t v10 = [(SBHLibraryIndicatorIconSettings *)v7 pod1AnimationSettings];
  }
  double v13 = (void *)v10;
  if (a4) {
    *(void *)a4 = v9;
  }

  return v13;
}

- (NSString)description
{
  return (NSString *)[(SBHLibraryCategoryStackView *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  long long v2 = [(SBHLibraryCategoryStackView *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBHLibraryCategoryStackView *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBHLibraryCategoryStackView *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SBHLibraryCategoryStackView_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AACA90;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __69__SBHLibraryCategoryStackView_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "numberOfCategories"), @"numberOfCategories");
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) innerIcons];
  [v3 appendArraySection:v4 withName:@"innerIcons" skipIfEmpty:0];

  unint64_t v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) backdropGroupName];
  [v5 appendString:v6 withName:@"backdropGroupName"];

  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) backdropGroupNamespace];
  [v7 appendString:v8 withName:@"backdropGroupNamespace"];
}

- (unint64_t)numberOfCategories
{
  return self->_numberOfCategories;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isOverlapping
{
  return self->_overlapping;
}

- (NSArray)innerIcons
{
  return self->_innerIcons;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (NSString)backdropGroupNamespace
{
  return self->_backdropGroupNamespace;
}

- (BOOL)isInnerIconImageInfoFrozen
{
  return self->_innerIconImageInfoFrozen;
}

- (void)setInnerIconImageInfoFrozen:(BOOL)a3
{
  self->_innerIconImageInfoFrozen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropGroupNamespace, 0);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_innerIcons, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_iconSettings, 0);
  objc_storeStrong((id *)&self->_iconImageViews, 0);
  objc_storeStrong((id *)&self->_podBackgroundViews, 0);
}

@end