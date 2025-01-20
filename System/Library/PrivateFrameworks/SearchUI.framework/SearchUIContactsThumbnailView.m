@interface SearchUIContactsThumbnailView
+ (id)avatarSettings;
+ (void)clearAvatarSettings;
- (BOOL)forcePressViewIsEntireEnclosingCell;
- (BOOL)useCompactDisplay;
- (BOOL)usesCompactWidth;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SFContactImage)contactImage;
- (SearchUIContactsThumbnailView)init;
- (SearchUIRowModel)rowModel;
- (id)singleContactPreviewButtonItemOnRowModel;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setContactImage:(id)a3;
- (void)setContactImage:(id)a3 useCompactDisplay:(BOOL)a4;
- (void)setForcePressViewIsEntireEnclosingCell:(BOOL)a3;
- (void)setRowModel:(id)a3;
- (void)setUseCompactDisplay:(BOOL)a3;
- (void)setUsesCompactWidth:(BOOL)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)updateForcePressView;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIContactsThumbnailView

+ (void)clearAvatarSettings
{
  v2 = (void *)avatarViewControllerSettings;
  avatarViewControllerSettings = 0;
}

+ (id)avatarSettings
{
  v2 = (void *)avatarViewControllerSettings;
  if (!avatarViewControllerSettings)
  {
    v3 = (void *)MEMORY[0x1E4F1BB50];
    v4 = +[SearchUIContactCache sharedCache];
    v5 = [v4 contactStore];
    uint64_t v6 = [v3 settingsWithContactStore:v5];
    v7 = (void *)avatarViewControllerSettings;
    avatarViewControllerSettings = v6;

    v2 = (void *)avatarViewControllerSettings;
  }
  return v2;
}

- (SearchUIContactsThumbnailView)init
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SearchUIContactsThumbnailView_init__block_invoke;
  block[3] = &unk_1E6E72730;
  v2 = self;
  v8 = v2;
  if (init_onceToken != -1) {
    dispatch_once(&init_onceToken, block);
  }
  v3 = [(id)objc_opt_class() avatarSettings];
  v6.receiver = v2;
  v6.super_class = (Class)SearchUIContactsThumbnailView;
  v4 = [(CNAvatarView *)&v6 initWithSettings:v3];

  return v4;
}

void __37__SearchUIContactsThumbnailView_init__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 addObserver:objc_opt_class() selector:sel_clearAvatarSettings name:*MEMORY[0x1E4FB2650] object:0];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIContactsThumbnailView;
  [(SearchUIContactsThumbnailView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(SearchUIContactsThumbnailView *)self tlk_updateWithCurrentAppearance];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIContactsThumbnailView;
  [(CNAvatarView *)&v3 didMoveToWindow];
  [(SearchUIContactsThumbnailView *)self tlk_updateWithCurrentAppearance];
  [(SearchUIContactsThumbnailView *)self updateForcePressView];
}

- (void)tlk_updateForAppearance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIContactsThumbnailView;
  id v4 = a3;
  [(SearchUIContactsThumbnailView *)&v6 tlk_updateForAppearance:v4];
  uint64_t v5 = objc_msgSend(v4, "style", v6.receiver, v6.super_class);

  if (v5 == 1) {
    [MEMORY[0x1E4FAE1A0] enableLightKeylineStroke:1 forView:self];
  }
  else {
    [MEMORY[0x1E4FAE1A0] enableShadow:1 forView:self];
  }
}

- (void)setContactImage:(id)a3 useCompactDisplay:(BOOL)a4
{
  objc_storeStrong((id *)&self->_contactImage, a3);
  self->_useCompactDisplay = a4;
  [(SearchUIContactsThumbnailView *)self invalidateIntrinsicContentSize];
}

- (void)setUsesCompactWidth:(BOOL)a3
{
  if (self->_usesCompactWidth != a3)
  {
    self->_usesCompactWidth = a3;
    [(SearchUIContactsThumbnailView *)self invalidateIntrinsicContentSize];
    [(SearchUIContactsThumbnailView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if ([(SearchUIContactsThumbnailView *)self useCompactDisplay])
  {
    +[SearchUISuggestionImageUtilities maximumSize];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4FAE100], "maxThumbnailSizeIsCompactWidth:", -[SearchUIContactsThumbnailView usesCompactWidth](self, "usesCompactWidth"));
    double v7 = v6;
    v8 = [(SearchUIContactsThumbnailView *)self contactImage];
    [v8 size];
    if (v10 == *MEMORY[0x1E4F1DB30] && v9 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      double v15 = v7;
    }
    else
    {
      v12 = [(SearchUIContactsThumbnailView *)self contactImage];
      [v12 size];
      double v7 = v13;
      double v15 = v14;
    }
    double v4 = v7;
    double v5 = v15;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)updateWithRowModel:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SearchUIContactsThumbnailView *)self setRowModel:v4];
  double v5 = [v4 leadingImage];
  double v6 = [(SearchUIContactsThumbnailView *)self contactImage];
  int v7 = [v5 isEqual:v6];

  int v8 = [v4 useCompactVersionOfUI];
  int v9 = [(SearchUIContactsThumbnailView *)self useCompactDisplay];
  if (!v7 || v8 != v9)
  {
    -[SearchUIContactsThumbnailView setContactImage:useCompactDisplay:](self, "setContactImage:useCompactDisplay:", v5, [v4 useCompactVersionOfUI]);
    if ((v7 & 1) == 0)
    {
      [(CNAvatarView *)self setContacts:MEMORY[0x1E4F1CBF0]];
      double v10 = +[SearchUIContactCache sharedCache];
      v11 = [v5 contactIdentifiers];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __52__SearchUIContactsThumbnailView_updateWithRowModel___block_invoke;
      v43[3] = &unk_1E6E729B0;
      v43[4] = self;
      id v44 = v5;
      [v10 fetchContactsForIdentifiers:v11 completionHandler:v43];
    }
  }
  v38 = v5;
  v12 = [(SearchUIContactsThumbnailView *)self singleContactPreviewButtonItemOnRowModel];
  [(SearchUIContactsThumbnailView *)self setForcePressViewIsEntireEnclosingCell:v12 != 0];
  double v13 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  double v14 = [v12 actionTypesToShow];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(v14);
        }
        unsigned int v19 = [*(id *)(*((void *)&v39 + 1) + 8 * i) intValue] - 1;
        if (v19 <= 3)
        {
          id v20 = **((id **)&unk_1E6E72B08 + (int)v19);
          if (v20)
          {
            v21 = v20;
            [v13 addObject:v20];
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v16);
  }

  v22 = [(SearchUIContactsThumbnailView *)self contactImage];
  int v23 = [v22 threeDTouchEnabled];
  if (v12 || v23) {
    uint64_t v24 = [(SearchUIContactsThumbnailView *)self useCompactDisplay] ^ 1;
  }
  else {
    uint64_t v24 = 0;
  }
  [(CNAvatarView *)self setThreeDTouchEnabled:v24];

  [(SearchUIContactsThumbnailView *)self updateForcePressView];
  if (![v13 count])
  {
    v25 = [v38 badgingImage];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = [v38 badgingImage];
      v27 = [v26 bundleIdentifier];
    }
    else
    {
      v27 = 0;
    }

    v28 = +[SearchUIUtilities bundleIdentifierForApp:10];
    char v29 = [v27 isEqualToString:v28];

    if (v29)
    {
      v30 = (void *)MEMORY[0x1E4F1BAF8];
    }
    else
    {
      v31 = +[SearchUIUtilities bundleIdentifierForApp:8];
      char v32 = [v27 isEqualToString:v31];

      if (v32)
      {
        v30 = (void *)MEMORY[0x1E4F1BB00];
      }
      else
      {
        v33 = +[SearchUIUtilities bundleIdentifierForApp:26];
        int v34 = [v27 isEqualToString:v33];

        v30 = (void *)MEMORY[0x1E4F1BAF0];
        if (v34) {
          v30 = (void *)MEMORY[0x1E4F1BB08];
        }
      }
    }
    [v13 addObject:*v30];
  }
  [(CNAvatarView *)self setActionCategories:v13];
  v35 = [v4 contactIdentifiers];
  BOOL v36 = (unint64_t)[v35 count] < 2;
  v37 = [(SearchUIContactsThumbnailView *)self layer];
  [v37 setShadowPathIsBounds:v36];
}

void __52__SearchUIContactsThumbnailView_updateWithRowModel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SearchUIContactsThumbnailView_updateWithRowModel___block_invoke_2;
  v6[3] = &unk_1E6E72938;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v5 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:v6];
}

void __52__SearchUIContactsThumbnailView_updateWithRowModel___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contactImage];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = *(void **)(a1 + 32);
    [v5 setContacts:v4];
  }
}

- (id)singleContactPreviewButtonItemOnRowModel
{
  v2 = [(SearchUIContactsThumbnailView *)self rowModel];
  int v3 = [v2 cardSection];
  uint64_t v4 = [v3 previewButtonItems];

  if ([v4 count] == 1)
  {
    id v5 = [v4 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v6 = [v4 firstObject];
    }
    else
    {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUIContactsThumbnailView;
  [(CNAvatarView *)&v5 layoutSubviews];
  [(SearchUIContactsThumbnailView *)self bounds];
  CGFloat v3 = CGRectGetWidth(v6) * 0.5;
  uint64_t v4 = [(SearchUIContactsThumbnailView *)self layer];
  [v4 setCornerRadius:v3];
}

- (void)updateForcePressView
{
  if ([(CNAvatarView *)self isThreeDTouchEnabled])
  {
    CGRect v6 = self;
    if ([(SearchUIContactsThumbnailView *)v6 forcePressViewIsEntireEnclosingCell])
    {
      if (v6)
      {
        CGFloat v3 = v6;
        while (1)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          uint64_t v4 = [(SearchUIContactsThumbnailView *)v3 superview];

          CGFloat v3 = (SearchUIContactsThumbnailView *)v4;
          if (!v4) {
            goto LABEL_8;
          }
        }
        objc_super v5 = v3;
      }
      else
      {
LABEL_8:
        objc_super v5 = v6;
      }
    }
    else
    {
      objc_super v5 = v6;
    }
  }
  else
  {
    objc_super v5 = 0;
  }
  id v7 = v5;
  [(CNAvatarView *)self setForcePressView:v5];
}

- (BOOL)usesCompactWidth
{
  return self->_usesCompactWidth;
}

- (SFContactImage)contactImage
{
  return self->_contactImage;
}

- (void)setContactImage:(id)a3
{
}

- (BOOL)useCompactDisplay
{
  return self->_useCompactDisplay;
}

- (void)setUseCompactDisplay:(BOOL)a3
{
  self->_useCompactDisplay = a3;
}

- (BOOL)forcePressViewIsEntireEnclosingCell
{
  return self->_forcePressViewIsEntireEnclosingCell;
}

- (void)setForcePressViewIsEntireEnclosingCell:(BOOL)a3
{
  self->_forcePressViewIsEntireEnclosingCell = a3;
}

- (SearchUIRowModel)rowModel
{
  return self->_rowModel;
}

- (void)setRowModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowModel, 0);
  objc_storeStrong((id *)&self->_contactImage, 0);
}

@end