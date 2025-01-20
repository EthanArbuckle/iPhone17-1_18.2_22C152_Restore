@interface NCBadgedIconView
+ (id)brandingBadgeWithImage:(id)a3;
+ (unint64_t)_defaultDirectionForBadgeType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFeaturingSymbol;
- (BOOL)isShadowEnabled;
- (CGRect)_frameForBadgeView:(id)a3 inBounds:(CGRect)a4;
- (CGRect)_frameForBrandingBadgeOfSize:(CGSize)a3 withLocation:(unint64_t)a4 inBounds:(CGRect)a5;
- (CGRect)_frameForBrandingBadgeView:(id)a3 inBounds:(CGRect)a4;
- (CGRect)_frameForIndicatorBadgeOfSize:(CGSize)a3 cornerRadius:(double)a4 withLocation:(unint64_t)a5 inBounds:(CGRect)a6;
- (CGRect)_frameForIndicatorBadgeView:(id)a3 inBounds:(CGRect)a4;
- (NCBadgedIconView)initWithProminentIcons:(id)a3 subordinateIcons:(id)a4 badgeText:(id)a5 compatibleWithInitialTraitCollection:(id)a6;
- (NSArray)badgeViews;
- (NSArray)requiredVisualStyleCategories;
- (SBIconBadgeView)iconBadgeView;
- (UIColor)dominantColor;
- (UIView)iconView;
- (id)_prominentImageView;
- (id)_prominentNonImageView;
- (id)badgeLayoutBlock;
- (id)copyWithBadgeText:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_updateVisibleIcons;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)layoutSubviews;
- (void)setBadgeLayoutBlock:(id)a3;
- (void)setBadgeViews:(id)a3;
- (void)setIconBadgeView:(id)a3;
- (void)setIconView:(id)a3;
- (void)setShadowEnabled:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)updateVisualStylingOfProminentImageViewIfSymbolImageWithStyle:(int64_t)a3 visualStylingProvider:(id)a4 outgoingProvider:(id)a5;
@end

@implementation NCBadgedIconView

- (NCBadgedIconView)initWithProminentIcons:(id)a3 subordinateIcons:(id)a4 badgeText:(id)a5 compatibleWithInitialTraitCollection:(id)a6
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v61 = a5;
  id v13 = a6;
  self->_userInterfaceStyle = 1;
  if ([(SBHIconImageStyleConfiguration *)self->_iconImageStyleConfiguration configurationType] == 3)
  {
    int64_t v14 = 2;
  }
  else
  {
    if ([(SBHIconImageStyleConfiguration *)self->_iconImageStyleConfiguration configurationType]) {
      goto LABEL_6;
    }
    int64_t v14 = [v13 userInterfaceStyle];
  }
  self->_userInterfaceStyle = v14;
LABEL_6:
  v59 = v13;
  objc_msgSend(v13, "sbh_iconImageStyleConfiguration");
  v15 = (SBHIconImageStyleConfiguration *)objc_claimAutoreleasedReturnValue();
  iconImageStyleConfiguration = self->_iconImageStyleConfiguration;
  self->_iconImageStyleConfiguration = v15;

  v17 = [v11 firstObject];
  if (v17)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
    if (v17 == v6) {
      v18 = 0;
    }
    else {
      v18 = v17;
    }
  }
  else
  {
    v18 = 0;
  }
  p_prominentLightIcon = (id *)&self->_prominentLightIcon;
  objc_storeStrong((id *)&self->_prominentLightIcon, v18);
  if (v17) {

  }
  if ((unint64_t)[v11 count] <= 1)
  {

    v21 = 0;
    v22 = 0;
    char v20 = 1;
  }
  else
  {
    char v20 = 1;
    v21 = [v11 objectAtIndexedSubscript:1];

    if (v21)
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      char v20 = 0;
      if (v21 == v17) {
        v22 = 0;
      }
      else {
        v22 = v21;
      }
    }
    else
    {
      v22 = 0;
    }
  }
  objc_storeStrong((id *)&self->_prominentDarkIcon, v22);
  if ((v20 & 1) == 0) {

  }
  objc_storeStrong((id *)&self->_prominentIcon, *p_prominentLightIcon);
  v23 = [v12 firstObject];

  if (v23)
  {
    p_prominentLightIcon = [MEMORY[0x1E4F1CA98] null];
    if (v23 == p_prominentLightIcon) {
      v24 = 0;
    }
    else {
      v24 = v23;
    }
  }
  else
  {
    v24 = 0;
  }
  objc_storeStrong((id *)&self->_subordinateLightIcon, v24);
  if (v23) {

  }
  id v60 = v11;
  if ((unint64_t)[v12 count] <= 1)
  {

    v26 = 0;
    v27 = 0;
    char v25 = 1;
  }
  else
  {
    char v25 = 1;
    v26 = [v12 objectAtIndexedSubscript:1];

    if (v26)
    {
      v23 = [MEMORY[0x1E4F1CA98] null];
      char v25 = 0;
      if (v26 == v23) {
        v27 = 0;
      }
      else {
        v27 = v26;
      }
    }
    else
    {
      v27 = 0;
    }
  }
  objc_storeStrong((id *)&self->_subordinateDarkIcon, v27);
  if ((v25 & 1) == 0) {

  }
  objc_storeStrong((id *)&self->_subordinateIcon, self->_subordinateLightIcon);
  if (self->_prominentIcon || self->_subordinateIcon)
  {
    v62.receiver = self;
    v62.super_class = (Class)NCBadgedIconView;
    v28 = [(NCBadgedIconView *)&v62 init];
    v29 = v28;
    v30 = v60;
    if (v28)
    {
      prominentIcon = v28->_prominentIcon;
      uint64_t v32 = objc_opt_class();
      v33 = prominentIcon;
      if (v32)
      {
        if (objc_opt_isKindOfClass()) {
          v34 = v33;
        }
        else {
          v34 = 0;
        }
      }
      else
      {
        v34 = 0;
      }
      v35 = v34;

      v36 = v29->_prominentIcon;
      uint64_t v37 = objc_opt_class();
      v38 = v36;
      if (v37)
      {
        if (objc_opt_isKindOfClass()) {
          v39 = v38;
        }
        else {
          v39 = 0;
        }
      }
      else
      {
        v39 = 0;
      }
      v40 = v39;

      if (v35)
      {
        [(NCBadgedIconView *)v29 setIconView:v35];
      }
      else if (v40)
      {
        id v41 = objc_alloc_init(MEMORY[0x1E4FB1838]);
        [v41 setContentMode:1];
        if (v29->_userInterfaceStyle == 2)
        {
          prominentDarkIcon = v29->_prominentDarkIcon;
          if (prominentDarkIcon)
          {
            uint64_t v43 = objc_opt_class();
            v44 = prominentDarkIcon;
            uint64_t v45 = v43;
            v46 = v44;
            if (v45)
            {
              if (objc_opt_isKindOfClass()) {
                v47 = v46;
              }
              else {
                v47 = 0;
              }
            }
            else
            {
              v47 = 0;
            }
            v49 = v47;

            v40 = v49;
          }
        }
        [v41 setImage:v40];
        [(NCBadgedIconView *)v29 setIconView:v41];
      }
      if (v12)
      {
        if (v29->_userInterfaceStyle != 2 || (subordinateLightIcon = v29->_subordinateDarkIcon) == 0) {
          subordinateLightIcon = v29->_subordinateLightIcon;
        }
        v51 = subordinateLightIcon;
        v52 = +[NCBadgedIconView brandingBadgeWithImage:v51];
        [v52 setContentMode:1];
        objc_msgSend(v52, "nc_setPlatterSubordinateIconShadowEnabled:", 1);
        v63[0] = v52;
        v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
        [(NCBadgedIconView *)v29 setBadgeViews:v53];

        v30 = v60;
      }
      if ([v61 length])
      {
        v54 = objc_opt_new();
        if (objc_opt_respondsToSelector())
        {
          v55 = _NCNotificationListGroupName();
          [v54 setMaterialGroupNameBase:v55];
        }
        [v54 setStyle:1];
        v56 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:13.0];
        [v54 setOverrideFont:v56];

        [v54 setOverridePaddingFactor:22.0];
        [v54 setOverrideText:v61];
        [v54 updateShadowWithRadius:2.0 alpha:0.25 imageOutset:2.0];
        [(NCBadgedIconView *)v29 addSubview:v54];
        iconBadgeView = v29->_iconBadgeView;
        v29->_iconBadgeView = (SBIconBadgeView *)v54;
      }
    }
    self = v29;
    v48 = self;
  }
  else
  {
    v48 = 0;
    v30 = v60;
  }

  return v48;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NCBadgedIconView *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        NSLog(&cfstr_SomethingSerio.isa);
      }
      v7 = [(NCBadgedIconView *)self _prominentImageView];
      v8 = [v7 image];
      v9 = [(NCBadgedIconView *)v6 _prominentImageView];
      v10 = [v9 image];
      if (BSEqualObjects())
      {
        id v11 = [(NCBadgedIconView *)self _prominentNonImageView];
        id v12 = [(NCBadgedIconView *)v6 _prominentNonImageView];
        if (BSEqualObjects() && BSEqualArrays())
        {
          v18 = [(NCBadgedIconView *)self iconBadgeView];
          v16 = [v18 overrideText];
          v17 = [(NCBadgedIconView *)v6 iconBadgeView];
          id v13 = [v17 overrideText];
          char v14 = BSEqualStrings();
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  return v14;
}

+ (id)brandingBadgeWithImage:(id)a3
{
  id v3 = a3;
  v4 = [[NCImageBrandingBadge alloc] initWithImage:v3];

  return v4;
}

- (void)setIconView:(id)a3
{
  p_iconView = &self->_iconView;
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    [(UIView *)*p_iconView removeFromSuperview];
    objc_storeStrong((id *)&self->_iconView, a3);
    [(NCBadgedIconView *)self insertSubview:*p_iconView atIndex:0];
    [(NCBadgedIconView *)self setNeedsLayout];
  }
}

- (void)setBadgeViews:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    id v6 = self->_badgeViews;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          [v11 setBadgedIconView:0];
          [v11 removeFromSuperview];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v18 + 1) + 8 * j);
          objc_msgSend(v17, "setBadgedIconView:", self, (void)v18);
          [(NCBadgedIconView *)self addSubview:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }

    objc_storeStrong((id *)&self->_badgeViews, a3);
    [(NCBadgedIconView *)self setNeedsLayout];
  }
}

- (void)setShadowEnabled:(BOOL)a3
{
  if (self->_shadowEnabled != a3)
  {
    self->_shadowEnabled = a3;
    id v9 = [(NCBadgedIconView *)self _prominentImageView];
    v4 = [v9 image];
    char v5 = [v4 isSymbolImage];

    if ((v5 & 1) == 0)
    {
      id v6 = [v9 image];
      uint64_t v7 = [(NCBadgedIconView *)self traitCollection];
      uint64_t v8 = objc_msgSend(v6, "mt_imageWithDefaultShadowAttributesForUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
      [v9 setImage:v8];
    }
  }
}

- (BOOL)isFeaturingSymbol
{
  v2 = [(NCBadgedIconView *)self _prominentImageView];
  id v3 = [v2 image];
  char v4 = [v3 isSymbolImage];

  return v4;
}

- (UIColor)dominantColor
{
  v2 = [(NCBadgedIconView *)self _prominentImageView];
  id v3 = [v2 image];

  if (v3)
  {
    char v4 = _NCDominantColorForImage(v3);
  }
  else
  {
    char v4 = 0;
  }

  return (UIColor *)v4;
}

- (void)updateVisualStylingOfProminentImageViewIfSymbolImageWithStyle:(int64_t)a3 visualStylingProvider:(id)a4 outgoingProvider:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  id v9 = [(NCBadgedIconView *)self _prominentImageView];
  if (v9)
  {
    if ([(NCBadgedIconView *)self isFeaturingSymbol]) {
      id v10 = v12;
    }
    else {
      id v10 = 0;
    }
    [(NCBadgedIconView *)self _updateVisualStylingOfView:v9 style:a3 visualStylingProvider:v10 outgoingProvider:v8];
  }
  if (!v12)
  {
    id v11 = [MEMORY[0x1E4FB1618] labelColor];
    [v9 setTintColor:v11];
  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a3;
    [a6 stopAutomaticallyUpdatingView:v10];
    [v9 automaticallyUpdateView:v10 withStyle:a4];
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)NCBadgedIconView;
  [(NCBadgedIconView *)&v8 layoutSubviews];
  [(NCBadgedIconView *)self bounds];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__NCBadgedIconView_layoutSubviews__block_invoke;
  v7[3] = &unk_1E6A923E8;
  v7[4] = self;
  v7[5] = v3;
  v7[6] = v4;
  v7[7] = v5;
  v7[8] = v6;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
}

uint64_t __34__NCBadgedIconView_layoutSubviews__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 488), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 496);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_frameForBadgeView:inBounds:", v7, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), (void)v10);
        objc_msgSend(v7, "setFrame:");
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) _updateVisibleIcons];
  objc_super v8 = *(void **)(*(void *)(a1 + 32) + 504);
  [v8 intrinsicContentSize];
  [*(id *)(a1 + 32) _shouldReverseLayoutDirection];
  SBIconBadgeViewCalculateAccessoryCenter();
  return objc_msgSend(v8, "setCenter:");
}

- (NSArray)requiredVisualStyleCategories
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = self->_badgeViews;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          long long v10 = objc_msgSend(v9, "requiredVisualStyleCategories", (void)v14);
          [v3 addObjectsFromArray:v10];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  long long v11 = [(NCBadgedIconView *)self _prominentImageView];

  if (v11) {
    [v3 addObject:&unk_1F2F84400];
  }
  long long v12 = objc_msgSend(v3, "allObjects", (void)v14);

  return (NSArray *)v12;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(NCBadgedIconView *)self requiredVisualStyleCategories];
  objc_super v8 = [NSNumber numberWithInteger:a4];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v10 = self->_badgeViews;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v15, "setVisualStylingProvider:forCategory:", v6, a4, (void)v18);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  uint64_t v16 = [(NCBadgedIconView *)self _prominentImageView];
  long long v17 = (void *)v16;
  if (a4 == 1 && v16 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v17 setVisualStylingProvider:v6 forCategory:1];
  }
}

- (id)copyWithBadgeText:(id)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  uint64_t v4 = [(NCBadgedIconView *)self _prominentNonImageView];
  prominentLightIcon = self->_prominentLightIcon;
  if (v4) {
    id v6 = (NCProminentIcon *)[(NCProminentIcon *)prominentLightIcon copy];
  }
  else {
    id v6 = prominentLightIcon;
  }
  uint64_t v7 = v6;

  objc_super v8 = [(NCBadgedIconView *)self _prominentNonImageView];
  prominentDarkIcon = self->_prominentDarkIcon;
  if (v8) {
    long long v10 = (NCProminentIcon *)[(NCProminentIcon *)prominentDarkIcon copy];
  }
  else {
    long long v10 = prominentDarkIcon;
  }
  uint64_t v11 = v10;

  uint64_t v12 = self->_subordinateLightIcon;
  uint64_t v13 = self->_subordinateDarkIcon;
  if (v7)
  {
    if (v11)
    {
      v38[0] = v7;
      v38[1] = v11;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    }
    else
    {
      v37[0] = v7;
      long long v15 = [MEMORY[0x1E4F1CA98] null];
      v37[1] = v15;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (v12)
  {
    v36[0] = v12;
    uint64_t v16 = v13;
    if (!v13)
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
    }
    v36[1] = v16;
    long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    if (!v13) {
  }
    }
  else
  {
    long long v17 = 0;
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__11;
  v34 = __Block_byref_object_dispose__11;
  id v35 = 0;
  long long v18 = (void *)MEMORY[0x1E4FB1EB0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __38__NCBadgedIconView_copyWithBadgeText___block_invoke;
  v25[3] = &unk_1E6A941B0;
  v29 = &v30;
  v25[4] = self;
  id v19 = v14;
  id v26 = v19;
  id v20 = v17;
  id v27 = v20;
  id v21 = v24;
  id v28 = v21;
  [v18 performWithoutAnimation:v25];
  id v22 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  return v22;
}

unint64_t __38__NCBadgedIconView_copyWithBadgeText___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)objc_opt_class());
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v7 = [v2 initWithProminentIcons:v5 subordinateIcons:v3 badgeText:v4 compatibleWithInitialTraitCollection:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  long long v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  [*(id *)(a1 + 32) frame];
  objc_msgSend(v10, "setFrame:");
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(*(id *)(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) + 488), "setFrame:");
  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 496) count];
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      uint64_t v13 = [*(id *)(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) + 496) objectAtIndexedSubscript:i];
      uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 496) objectAtIndexedSubscript:i];
      [v14 frame];
      objc_msgSend(v13, "setFrame:");

      unint64_t result = [*(id *)(*(void *)(a1 + 32) + 496) count];
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(SBIconBadgeView *)self->_iconBadgeView overrideText];
  uint64_t v5 = (void *)[v4 copy];

  id v6 = [(NCBadgedIconView *)self copyWithBadgeText:v5];
  return v6;
}

+ (unint64_t)_defaultDirectionForBadgeType:(int64_t)a3
{
  if (a3) {
    return 12;
  }
  else {
    return 9;
  }
}

- (CGRect)_frameForIndicatorBadgeOfSize:(CGSize)a3 cornerRadius:(double)a4 withLocation:(unint64_t)a5 inBounds:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat rect = a6.origin.x;
  unsigned int v9 = a5;
  double v11 = a3.height;
  int v12 = [(NCBadgedIconView *)self _shouldReverseLayoutDirection];
  double v13 = v11 * 0.5;
  if (a4 > 0.0)
  {
    float v14 = a4;
    double v13 = v13 - (sqrtf((float)(v14 * v14) + (float)(v14 * v14)) - a4);
  }
  BSRectWithSize();
  CGFloat v16 = v15;
  CGFloat v32 = v17;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  char v22 = v12 ^ 1;
  if ((v12 ^ 1) & (v9 >> 3)) {
    goto LABEL_7;
  }
  if ((v9 & 2) == 0) {
    char v22 = 1;
  }
  if (v22)
  {
    v39.origin.x = rect;
    CGFloat v23 = y;
    v39.origin.CGFloat y = y;
    CGFloat v24 = width;
    v39.size.CGFloat width = width;
    CGFloat v25 = height;
    v39.size.CGFloat height = height;
    double v27 = CGRectGetMinX(v39) - v13;
    if ((v9 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
LABEL_7:
    v35.origin.x = rect;
    CGFloat v23 = y;
    v35.origin.CGFloat y = y;
    CGFloat v24 = width;
    v35.size.CGFloat width = width;
    CGFloat v25 = height;
    v35.size.CGFloat height = height;
    double v26 = v13 + CGRectGetMaxX(v35);
    v36.origin.x = v16;
    v36.origin.CGFloat y = v32;
    v36.size.CGFloat width = v19;
    v36.size.CGFloat height = v21;
    double v27 = v26 - CGRectGetWidth(v36);
    if ((v9 & 1) == 0)
    {
LABEL_8:
      v37.origin.x = rect;
      v37.origin.CGFloat y = v23;
      v37.size.CGFloat width = v24;
      v37.size.CGFloat height = v25;
      CGRectGetMaxY(v37);
      v38.origin.x = v27;
      v38.origin.CGFloat y = v32;
      v38.size.CGFloat width = v19;
      v38.size.CGFloat height = v21;
      CGRectGetHeight(v38);
      goto LABEL_11;
    }
  }
  v40.origin.x = rect;
  v40.origin.CGFloat y = v23;
  v40.size.CGFloat width = v24;
  v40.size.CGFloat height = v25;
  CGRectGetMinY(v40);
LABEL_11:

  UIRectIntegralWithScale();
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)_frameForIndicatorBadgeView:(id)a3 inBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  objc_msgSend(v9, "sizeThatFits:", width, height);
  double v11 = v10;
  double v13 = v12;
  float v14 = [v9 layer];
  [v14 cornerRadius];
  double v16 = v15 * 0.654165563;
  uint64_t v17 = [v9 badgeLocation];

  -[NCBadgedIconView _frameForIndicatorBadgeOfSize:cornerRadius:withLocation:inBounds:](self, "_frameForIndicatorBadgeOfSize:cornerRadius:withLocation:inBounds:", v17, v11, v13, v16, x, y, width, height);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (CGRect)_frameForBrandingBadgeOfSize:(CGSize)a3 withLocation:(unint64_t)a4 inBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  char v9 = a4;
  int v10 = [(NCBadgedIconView *)self _shouldReverseLayoutDirection];
  BSRectWithSize();
  if ((v9 & 8) != 0 && !v10) {
    goto LABEL_6;
  }
  char v11 = v10 ^ 1;
  if ((v9 & 2) == 0) {
    char v11 = 1;
  }
  if (v11)
  {
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGRectGetMaxX(v22);
  }
  else
  {
LABEL_6:
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRectGetMinX(v21);
  }
  CGFloat v12 = x;
  CGFloat v13 = y;
  CGFloat v14 = width;
  CGFloat v15 = height;
  if ((v9 & 4) != 0) {
    CGRectGetMinY(*(CGRect *)&v12);
  }
  else {
    CGRectGetMaxY(*(CGRect *)&v12);
  }

  UIRectIntegralWithScale();
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)_frameForBrandingBadgeView:(id)a3 inBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v9 = [a3 badgeLocation];

  -[NCBadgedIconView _frameForBrandingBadgeOfSize:withLocation:inBounds:](self, "_frameForBrandingBadgeOfSize:withLocation:inBounds:", v9, 16.0, 16.0, x, y, width, height);
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGRect)_frameForBadgeView:(id)a3 inBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  badgeLayoutBlock = (void (**)(id, id, double, double, double, double))self->_badgeLayoutBlock;
  if (badgeLayoutBlock)
  {
    badgeLayoutBlock[2](badgeLayoutBlock, v9, x, y, width, height);
  }
  else if ([v9 badgeType])
  {
    -[NCBadgedIconView _frameForBrandingBadgeView:inBounds:](self, "_frameForBrandingBadgeView:inBounds:", v9, x, y, width, height);
  }
  else
  {
    -[NCBadgedIconView _frameForIndicatorBadgeView:inBounds:](self, "_frameForIndicatorBadgeView:inBounds:", v9, x, y, width, height);
  }
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;

  double v19 = v15;
  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)_updateVisibleIcons
{
  v36[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NCBadgedIconView *)self traitCollection];
  int64_t v4 = [v3 userInterfaceStyle];

  uint64_t v5 = [(NCBadgedIconView *)self traitCollection];
  id v6 = objc_msgSend(v5, "sbh_iconImageStyleConfiguration");

  if ([v6 configurationType] == 3)
  {
    int64_t v4 = 2;
  }
  else if ([v6 configurationType] == 2 {
         || [v6 configurationType] == 1
  }
         || [v6 configurationType] == 4)
  {
    int64_t v4 = 1;
  }
  if (self->_userInterfaceStyle != v4) {
    self->_userInterfaceStyle = v4;
  }
  objc_storeStrong((id *)&self->_iconImageStyleConfiguration, v6);
  prominentIcon = self->_prominentIcon;
  uint64_t v8 = objc_opt_class();
  id v9 = prominentIcon;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      double v10 = v9;
    }
    else {
      double v10 = 0;
    }
  }
  else
  {
    double v10 = 0;
  }
  double v11 = v10;

  if (v11)
  {
    iconView = self->_iconView;
    uint64_t v13 = objc_opt_class();
    double v14 = iconView;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        double v15 = v14;
      }
      else {
        double v15 = 0;
      }
    }
    else
    {
      double v15 = 0;
    }
    double v17 = v15;

    if (self->_userInterfaceStyle != 2 || (prominentLightIcon = self->_prominentDarkIcon) == 0) {
      prominentLightIcon = self->_prominentLightIcon;
    }
    uint64_t v19 = objc_opt_class();
    double v20 = prominentLightIcon;
    if (v19)
    {
      if (objc_opt_isKindOfClass()) {
        double v21 = v20;
      }
      else {
        double v21 = 0;
      }
    }
    else
    {
      double v21 = 0;
    }
    double v16 = v21;

    [(UIView *)v17 setImage:v16];
    objc_storeStrong((id *)&self->_prominentIcon, v16);
  }
  else
  {
    double v16 = 0;
  }
  double v22 = [(NSArray *)self->_badgeViews firstObject];
  uint64_t v23 = objc_opt_class();
  id v24 = v22;
  if (v23)
  {
    if (objc_opt_isKindOfClass()) {
      double v25 = v24;
    }
    else {
      double v25 = 0;
    }
  }
  else
  {
    double v25 = 0;
  }
  id v26 = v25;

  if (v26)
  {
    if (self->_userInterfaceStyle != 2 || (subordinateLightIcon = self->_subordinateDarkIcon) == 0) {
      subordinateLightIcon = self->_subordinateLightIcon;
    }
    uint64_t v28 = objc_opt_class();
    double v29 = subordinateLightIcon;
    if (v28)
    {
      if (objc_opt_isKindOfClass()) {
        double v30 = v29;
      }
      else {
        double v30 = 0;
      }
    }
    else
    {
      double v30 = 0;
    }
    double v31 = v30;

    CGFloat v32 = +[NCBadgedIconView brandingBadgeWithImage:v31];
    [v32 setContentMode:1];
    objc_msgSend(v32, "nc_setPlatterSubordinateIconShadowEnabled:", 1);
    v36[0] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    [(NCBadgedIconView *)self setBadgeViews:v33];

    subordinateIcon = self->_subordinateIcon;
    self->_subordinateIcon = v31;
    CGRect v35 = v31;
  }
}

- (id)_prominentImageView
{
  iconView = self->_iconView;
  uint64_t v3 = objc_opt_class();
  int64_t v4 = iconView;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_prominentNonImageView
{
  uint64_t v3 = [(NCBadgedIconView *)self _prominentImageView];
  if (v3) {
    iconView = 0;
  }
  else {
    iconView = self->_iconView;
  }
  uint64_t v5 = iconView;

  return v5;
}

- (id)badgeLayoutBlock
{
  return self->_badgeLayoutBlock;
}

- (void)setBadgeLayoutBlock:(id)a3
{
}

- (BOOL)isShadowEnabled
{
  return self->_shadowEnabled;
}

- (UIView)iconView
{
  return self->_iconView;
}

- (NSArray)badgeViews
{
  return self->_badgeViews;
}

- (SBIconBadgeView)iconBadgeView
{
  return self->_iconBadgeView;
}

- (void)setIconBadgeView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconBadgeView, 0);
  objc_storeStrong((id *)&self->_badgeViews, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong(&self->_badgeLayoutBlock, 0);
  objc_storeStrong((id *)&self->_iconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_subordinateDarkIcon, 0);
  objc_storeStrong((id *)&self->_subordinateLightIcon, 0);
  objc_storeStrong((id *)&self->_subordinateIcon, 0);
  objc_storeStrong((id *)&self->_prominentDarkIcon, 0);
  objc_storeStrong((id *)&self->_prominentLightIcon, 0);

  objc_storeStrong((id *)&self->_prominentIcon, 0);
}

@end