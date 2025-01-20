@interface PXStoryChromeButton
+ (BOOL)usesButtonSystem;
+ (CGSize)_sizeForAttributedLabel:(id)a3;
+ (CGSize)sizeWithConfiguration:(id)a3;
+ (id)_createBadgeSystemImageView;
+ (id)_createSystemImageView;
+ (id)_createSystemImageVisualEffectView;
- (BOOL)isHovered;
- (BOOL)isMenuOpen;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)clippingRect;
- (OS_os_log)log;
- (PXStoryChromeButton)initWithFrame:(CGRect)a3;
- (PXStoryChromeButtonConfiguration)userData;
- (PXUpdater)updater;
- (UIContextMenuInteraction)customContextMenuInteraction;
- (UIImage)assetImage;
- (UIImageView)assetImageView;
- (UIImageView)badgeSystemImageView;
- (UIImageView)systemImageView;
- (UILabel)label;
- (UIPointerInteraction)pointerInteraction;
- (UIView)backgroundView;
- (UIVisualEffectView)effectView;
- (UIVisualEffectView)systemImageVisualEffectView;
- (id)_badgeImageWithSystemName:(id)a3;
- (id)_createAssetImageView;
- (id)_createLabel;
- (id)_imageWithSystemName:(id)a3;
- (id)_imageWithSystemName:(id)a3 symbolConfiguration:(id)a4;
- (id)accessibilityLabel;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)imageRequestID;
- (void)_configureActions;
- (void)_configureBackgroundView:(id)a3;
- (void)_configureVisualEffectView:(id)a3;
- (void)_handleImageResult:(id)a3 info:(id)a4 forDisplayAsset:(id)a5 requestID:(int64_t)a6 synchronous:(BOOL)a7;
- (void)_invalidateAppearance;
- (void)_invalidateAssetImage;
- (void)_px_invalidatePointerInteraction;
- (void)_setEffectViewFrame:(CGRect)a3;
- (void)_updateAppearance;
- (void)_updateAssetImage;
- (void)_updateAssetImageView;
- (void)_updateBackgroundView;
- (void)_updateBackgroundViewCornerRadius;
- (void)_updateBadgeSystemImageView;
- (void)_updateEffectViewCornerRadius;
- (void)_updateLabel;
- (void)_updateSystemImageView;
- (void)_updateSystemImageVisualEffectView;
- (void)_updateVisualEffectView;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAlpha:(double)a3;
- (void)setAssetImage:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setClippingRect:(CGRect)a3;
- (void)setCustomContextMenuInteraction:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageRequestID:(int64_t)a3;
- (void)setIsHovered:(BOOL)a3;
- (void)setIsMenuOpen:(BOOL)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXStoryChromeButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_customContextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_assetImage, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_assetImageView, 0);
  objc_storeStrong((id *)&self->_badgeSystemImageView, 0);
  objc_storeStrong((id *)&self->_systemImageVisualEffectView, 0);
  objc_storeStrong((id *)&self->_systemImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setPointerInteraction:(id)a3
{
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (UIContextMenuInteraction)customContextMenuInteraction
{
  return self->_customContextMenuInteraction;
}

- (BOOL)isHovered
{
  return self->_isHovered;
}

- (BOOL)isMenuOpen
{
  return self->_isMenuOpen;
}

- (void)setImageRequestID:(int64_t)a3
{
  self->_imageRequestID = a3;
}

- (int64_t)imageRequestID
{
  return self->_imageRequestID;
}

- (UIImage)assetImage
{
  return self->_assetImage;
}

- (UILabel)label
{
  return self->_label;
}

- (UIImageView)assetImageView
{
  return self->_assetImageView;
}

- (UIImageView)badgeSystemImageView
{
  return self->_badgeSystemImageView;
}

- (UIVisualEffectView)systemImageVisualEffectView
{
  return self->_systemImageVisualEffectView;
}

- (UIImageView)systemImageView
{
  return self->_systemImageView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryChromeButtonConfiguration)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)accessibilityLabel
{
  v2 = [(PXStoryChromeButton *)self userData];
  v3 = [v2 axLabel];

  return v3;
}

- (void)prepareForReuse
{
}

- (void)setUserData:(id)a3
{
  v8 = (PXStoryChromeButtonConfiguration *)a3;
  v4 = self->_userData;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(PXStoryChromeButtonConfiguration *)v8 isEqual:v4];

    if (!v5)
    {
      v6 = (PXStoryChromeButtonConfiguration *)[(PXStoryChromeButtonConfiguration *)v8 copy];
      userData = self->_userData;
      self->_userData = v6;

      [(PXStoryChromeButton *)self _invalidateAssetImage];
      [(PXStoryChromeButton *)self _invalidateAppearance];
      [(PXStoryChromeButton *)self _px_invalidatePointerInteraction];
    }
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryChromeButton;
  [(PXStoryChromeButton *)&v15 didUpdateFocusInContext:v6 withAnimationCoordinator:v7];
  v8 = [v6 nextFocusedView];

  if (v8 == self)
  {
    v10 = v14;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v11 = __72__PXStoryChromeButton_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
    goto LABEL_5;
  }
  v9 = [v6 previouslyFocusedView];

  if (v9 == self)
  {
    v10 = &v12;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v11 = __72__PXStoryChromeButton_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2;
LABEL_5:
    v10[2] = (uint64_t)v11;
    v10[3] = (uint64_t)&unk_1E5DD36F8;
    v10[4] = (uint64_t)self;
    [v7 addCoordinatedAnimations:v12 completion:v13];
  }
}

uint64_t __72__PXStoryChromeButton_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAppearance];
}

uint64_t __72__PXStoryChromeButton_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAppearance];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryChromeButton;
  [(PXStoryChromeButton *)&v7 contextMenuInteraction:a3 willEndForConfiguration:a4 animator:a5];
  id v6 = [(PXStoryChromeButton *)self menu];
  [v6 didClose];

  [(PXStoryChromeButton *)self setIsMenuOpen:0];
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryChromeButton;
  [(PXStoryChromeButton *)&v7 contextMenuInteraction:a3 willDisplayMenuForConfiguration:a4 animator:a5];
  id v6 = [(PXStoryChromeButton *)self menu];
  [v6 willOpen];

  [(PXStoryChromeButton *)self setIsMenuOpen:1];
}

- (void)setCustomContextMenuInteraction:(id)a3
{
  BOOL v5 = (UIContextMenuInteraction *)a3;
  customContextMenuInteraction = self->_customContextMenuInteraction;
  objc_super v7 = v5;
  if (customContextMenuInteraction != v5)
  {
    if (customContextMenuInteraction) {
      -[PXStoryChromeButton removeInteraction:](self, "removeInteraction:");
    }
    objc_storeStrong((id *)&self->_customContextMenuInteraction, a3);
    if (self->_customContextMenuInteraction) {
      -[PXStoryChromeButton addInteraction:](self, "addInteraction:");
    }
  }
}

- (void)_configureActions
{
  id v14 = [(PXStoryChromeButton *)self userData];
  [(PXStoryChromeButton *)self removeTarget:0 action:0 forControlEvents:0x2000];
  uint64_t v3 = [v14 target];
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v5 = [v14 action];

    if (v5)
    {
      id v6 = [v14 target];
      -[PXStoryChromeButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", v6, [v14 action], 0x2000);
    }
  }
  objc_super v7 = [v14 menu];
  [(PXStoryChromeButton *)self setMenu:v7];

  v8 = [(PXStoryChromeButton *)self menu];
  [(PXStoryChromeButton *)self setShowsMenuAsPrimaryAction:v8 != 0];

  v9 = [v14 customContextMenuInteractionDelegate];
  int v10 = [v9 conformsToProtocol:&unk_1F03020B0];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4FB1680]);
    uint64_t v12 = [v14 customContextMenuInteractionDelegate];
    uint64_t v13 = (void *)[v11 initWithDelegate:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }
  [(PXStoryChromeButton *)self setCustomContextMenuInteraction:v13];
}

- (id)_imageWithSystemName:(id)a3 symbolConfiguration:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = objc_msgSend(MEMORY[0x1E4FB1818], "px_systemImageNamed:withConfiguration:", v6, a4);
  if (!v7)
  {
    v8 = [(PXStoryChromeButton *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Unable to find system image for name: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

- (id)_badgeImageWithSystemName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXStoryChromeButton *)self userData];
  id v6 = [v5 spec];
  objc_super v7 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithWeight:", objc_msgSend(v6, "badgeSystemImageWeight"));
  v8 = [v5 badgeSystemImageColors];

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4FB1830];
    int v10 = [v5 badgeSystemImageColors];
    id v11 = [v9 _configurationWithHierarchicalColors:v10];

    uint64_t v12 = [v7 configurationByApplyingConfiguration:v11];

    objc_super v7 = (void *)v12;
  }
  uint64_t v13 = [(PXStoryChromeButton *)self _imageWithSystemName:v4 symbolConfiguration:v7];

  return v13;
}

- (id)_imageWithSystemName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXStoryChromeButton *)self userData];
  id v6 = [v5 spec];
  [v5 preferredSystemImagePointSize];
  double v8 = v7;
  uint64_t v9 = [v5 preferredSystemImageWeight];
  int v10 = [MEMORY[0x1E4FB1830] configurationWithPointSize:v9 weight:-1 scale:v8];
  if ([v5 applyTintColorAsHierarchicalColor])
  {
    id v11 = (void *)MEMORY[0x1E4FB1830];
    uint64_t v12 = [(PXStoryChromeButton *)self tintColor];
    uint64_t v13 = [v11 configurationWithHierarchicalColor:v12];
    uint64_t v14 = [v10 configurationByApplyingConfiguration:v13];

    int v10 = (void *)v14;
  }
  objc_super v15 = [(PXStoryChromeButton *)self _imageWithSystemName:v4 symbolConfiguration:v10];

  return v15;
}

- (void)_updateEffectViewCornerRadius
{
  id v7 = [(PXStoryChromeButton *)self effectView];
  uint64_t v3 = [(PXStoryChromeButton *)self userData];
  uint64_t v4 = [v3 backgroundStyle];
  if ((unint64_t)(v4 - 3) < 2 || v4 == 1)
  {
    [v7 bounds];
    [v7 _setCornerRadius:0 continuous:15 maskedCorners:CGRectGetHeight(v9) * 0.5];
  }
  else if (v4 == 2)
  {
    id v6 = [v3 spec];
    [v6 roundedRectCornerRadius];
    objc_msgSend(v7, "_setCornerRadius:continuous:maskedCorners:", 1, 15);
  }
}

- (void)_configureVisualEffectView:(id)a3
{
  id v4 = a3;
  id v13 = [(PXStoryChromeButton *)self userData];
  uint64_t v5 = [v13 spec];
  if ([v13 hasPrimaryImageContent])
  {
    if ([(PXStoryChromeButton *)self isHighlighted]) {
      uint64_t v6 = [v5 highlightedBlurEffectStyle];
    }
    else {
      uint64_t v6 = [v5 blurEffectStyle];
    }
    uint64_t v7 = v6;
    int v9 = [(PXStoryChromeButton *)self isHighlighted];
    int v10 = @"PXStoryChromeButton";
    if (v9) {
      int v10 = @"PXStoryChromeButton-highlighted";
    }
    double v8 = v10;
  }
  else
  {
    uint64_t v7 = [v5 textOnlyBlurEffectStyle];
    double v8 = @"PXStoryChromeButton-textOnly";
  }
  id v11 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setBackgroundColor:v11];

  uint64_t v12 = [MEMORY[0x1E4FB14C8] effectWithStyle:v7];
  [v4 setEffect:v12];

  [v4 _setGroupName:v8];
  [v4 setUserInteractionEnabled:0];
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  uint64_t v5 = [(PXStoryChromeButton *)self userData];
  [v5 spec];
  objc_claimAutoreleasedReturnValue();
  [(PXStoryChromeButton *)self frame];
  [v5 pointerShapeInsets];
  PXEdgeInsetsInsetRect();
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(PXStoryChromeButton *)self userData];
  [v6 rect];

  [v7 hitTestEdgeOutsets];
  sub_1AB23B20C();
}

- (void)_handleImageResult:(id)a3 info:(id)a4 forDisplayAsset:(id)a5 requestID:(int64_t)a6 synchronous:(BOOL)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a7 || [(PXStoryChromeButton *)self imageRequestID] == a6)
  {
    uint64_t v14 = [(PXStoryChromeButton *)self userData];
    id v15 = [v14 displayAsset];
    if (v15 == v13)
    {
    }
    else
    {
      v16 = v15;
      char v17 = [v13 isEqual:v15];

      if ((v17 & 1) == 0) {
        goto LABEL_8;
      }
    }
    [(PXStoryChromeButton *)self setAssetImage:v18];
  }
LABEL_8:
}

- (void)_updateBackgroundViewCornerRadius
{
  id v8 = [(PXStoryChromeButton *)self backgroundView];
  uint64_t v3 = [v8 layer];
  id v4 = [(PXStoryChromeButton *)self userData];
  uint64_t v5 = [v4 backgroundStyle];
  uint64_t v6 = 0;
  switch(v5)
  {
    case 0:
      goto LABEL_5;
    case 1:
    case 3:
    case 4:
      [v3 setCornerCurve:*MEMORY[0x1E4F39EA8]];
      [v8 bounds];
      [v3 setCornerRadius:CGRectGetHeight(v10) * 0.5];
      goto LABEL_4;
    case 2:
      [v3 setCornerCurve:*MEMORY[0x1E4F39EA8]];
      uint64_t v7 = [v4 spec];
      [v7 roundedRectCornerRadius];
      objc_msgSend(v3, "setCornerRadius:");

LABEL_4:
      uint64_t v6 = 1;
LABEL_5:
      [v3 setShadowPathIsBounds:v6];
      break;
    default:
      break;
  }
}

- (void)_configureBackgroundView:(id)a3
{
  id v13 = a3;
  id v4 = [(PXStoryChromeButton *)self userData];
  uint64_t v5 = [v4 backgroundStyle];
  uint64_t v6 = [v4 spec];
  int v7 = [(PXStoryChromeButton *)self isFocused];
  if (v5 == 4)
  {
    if (v7) {
      [MEMORY[0x1E4FB1618] systemWhiteColor];
    }
    else {
    id v11 = [MEMORY[0x1E4FB1618] clearColor];
    }
    [v13 setBackgroundColor:v11];

    BOOL v12 = [(PXStoryChromeButton *)self isHighlighted] == 0;
    CGRect v10 = v13;
    double v9 = 0.7;
    if (v12) {
      double v9 = 1.0;
    }
  }
  else
  {
    id v8 = [v4 solidBackgroundColor];
    [v13 setBackgroundColor:v8];

    double v9 = 1.0;
    CGRect v10 = v13;
  }
  [v10 setAlpha:v9];
  [v13 setUserInteractionEnabled:0];
}

- (void)setBackgroundView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  int v7 = v5;
  if (backgroundView != v5)
  {
    [(UIView *)backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    if (self->_backgroundView) {
      -[PXStoryChromeButton addSubview:](self, "addSubview:");
    }
  }
}

- (void)_updateBackgroundView
{
  uint64_t v3 = [(PXStoryChromeButton *)self userData];
  uint64_t v4 = [v3 backgroundStyle];

  if ((unint64_t)(v4 - 3) > 1)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = [(PXStoryChromeButton *)self backgroundView];
    if (!v5) {
      id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    }
    id v7 = v5;
    [(PXStoryChromeButton *)self _configureBackgroundView:v5];
    id v6 = v7;
  }
  id v8 = v6;
  [(PXStoryChromeButton *)self setBackgroundView:v6];
}

- (void)_setEffectViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = [(PXStoryChromeButton *)self effectView];
  [v9 frame];
  v12.origin.double x = x;
  v12.origin.double y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  if (!CGRectEqualToRect(v11, v12))
  {
    id v8 = [(PXStoryChromeButton *)self effectView];
    objc_msgSend(v8, "setFrame:", x, y, width, height);

    [(PXStoryChromeButton *)self _updateEffectViewCornerRadius];
  }
}

- (void)setEffectView:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = (UIVisualEffectView *)a3;
  p_effectView = &self->_effectView;
  effectView = self->_effectView;
  if (effectView != v5)
  {
    if (effectView)
    {
      id v8 = [(UIVisualEffectView *)effectView contentView];
      id v9 = [v8 subviews];
      CGRect v10 = (void *)[v9 copy];

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v11);
            }
            [(PXStoryChromeButton *)self addSubview:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
        }
        while (v13);
      }

      [(UIVisualEffectView *)*p_effectView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_effectView, a3);
    if (*p_effectView)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v16 = [(PXStoryChromeButton *)self assetImageView];
      v33[0] = v16;
      char v17 = [(PXStoryChromeButton *)self systemImageView];
      v33[1] = v17;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];

      uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v26 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v25 + 1) + 8 * j);
            v24 = [(UIVisualEffectView *)v5 contentView];
            [v24 addSubview:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v34 count:16];
        }
        while (v20);
      }

      [(PXStoryChromeButton *)self insertSubview:v5 atIndex:0];
    }
    [(PXStoryChromeButton *)self setNeedsLayout];
  }
}

- (void)_updateVisualEffectView
{
  uint64_t v3 = [(PXStoryChromeButton *)self userData];
  if ([v3 backgroundStyle] == 1)
  {
  }
  else
  {
    uint64_t v4 = [(PXStoryChromeButton *)self userData];
    uint64_t v5 = [v4 backgroundStyle];

    if (v5 != 2)
    {
      id v7 = 0;
      goto LABEL_8;
    }
  }
  id v6 = [(PXStoryChromeButton *)self effectView];
  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
  }
  id v8 = v6;
  [(PXStoryChromeButton *)self _configureVisualEffectView:v6];
  id v7 = v8;
LABEL_8:
  id v9 = v7;
  [(PXStoryChromeButton *)self setEffectView:v7];
}

- (void)_updateAssetImageView
{
  id v5 = [(PXStoryChromeButton *)self assetImage];
  uint64_t v3 = [(PXStoryChromeButton *)self assetImageView];
  [v3 setImage:v5];

  uint64_t v4 = [(PXStoryChromeButton *)self assetImageView];
  [v4 setHidden:v5 == 0];
}

- (void)_updateBadgeSystemImageView
{
  uint64_t v3 = [(PXStoryChromeButton *)self userData];
  id v7 = [v3 badgeSystemImageName];

  if (v7)
  {
    uint64_t v4 = [(PXStoryChromeButton *)self _badgeImageWithSystemName:v7];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = [(PXStoryChromeButton *)self badgeSystemImageView];
  [v5 setImage:v4];

  id v6 = [(PXStoryChromeButton *)self badgeSystemImageView];
  [v6 setHidden:v4 == 0];
}

- (void)_updateSystemImageVisualEffectView
{
  uint64_t v3 = [(PXStoryChromeButton *)self userData];
  uint64_t v4 = [v3 spec];
  uint64_t v5 = [v4 systemImageStyle];

  id v6 = [(PXStoryChromeButton *)self systemImageVisualEffectView];
  id v7 = [v6 effect];

  if (v5 == 1)
  {
    if (!v7)
    {
      id v8 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
      id v9 = [(PXStoryChromeButton *)self systemImageVisualEffectView];
      [v9 setEffect:v8];
    }
    CGRect v10 = [(PXStoryChromeButton *)self systemImageVisualEffectView];
    id v11 = [v10 maskView];

    if (!v11)
    {
      uint64_t v12 = [(PXStoryChromeButton *)self systemImageView];
      [v12 removeFromSuperview];

      uint64_t v13 = [(PXStoryChromeButton *)self systemImageVisualEffectView];
      uint64_t v14 = [v13 contentView];
      id v15 = [(PXStoryChromeButton *)self systemImageView];
      [v14 addSubview:v15];

      id v22 = [(PXStoryChromeButton *)self systemImageView];
      v16 = [(PXStoryChromeButton *)self systemImageVisualEffectView];
      [v16 setMaskView:v22];
LABEL_10:
    }
  }
  else
  {
    if (v7)
    {
      char v17 = [(PXStoryChromeButton *)self systemImageVisualEffectView];
      [v17 setEffect:0];
    }
    id v18 = [(PXStoryChromeButton *)self systemImageVisualEffectView];
    uint64_t v19 = [v18 maskView];

    if (v19)
    {
      uint64_t v20 = [(PXStoryChromeButton *)self systemImageVisualEffectView];
      [v20 setMaskView:0];

      uint64_t v21 = [(PXStoryChromeButton *)self systemImageView];
      [v21 removeFromSuperview];

      id v22 = [(PXStoryChromeButton *)self systemImageView];
      v16 = [(PXStoryChromeButton *)self assetImageView];
      [(PXStoryChromeButton *)self insertSubview:v22 aboveSubview:v16];
      goto LABEL_10;
    }
  }
}

- (void)_updateSystemImageView
{
  id v13 = [(PXStoryChromeButton *)self userData];
  uint64_t v3 = [v13 spec];
  uint64_t v4 = [(PXStoryChromeButton *)self userData];
  uint64_t v5 = [v4 systemImageName];

  if (v5)
  {
    id v6 = [(PXStoryChromeButton *)self _imageWithSystemName:v5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [(PXStoryChromeButton *)self systemImageView];
  id v8 = [v13 symbolTransition];

  if (v8)
  {
    id v9 = [v13 symbolTransition];
    [v7 setSymbolImage:v6 withContentTransition:v9];
  }
  else
  {
    [v7 setImage:v6];
  }
  [v7 setHidden:v6 == 0];
  CGRect v10 = [v3 extendedTraitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if ([(PXStoryChromeButton *)self isMenuOpen] && v11 != 5
    || (double v12 = 1.0, [(PXStoryChromeButton *)self isHighlighted])
    && [v3 shouldDimWhenHighlighted])
  {
    double v12 = 0.5;
  }
  [v7 setAlpha:v12];
}

- (void)_updateLabel
{
  id v10 = [(PXStoryChromeButton *)self userData];
  uint64_t v5 = [v10 label];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    v2 = [v10 spec];
    uint64_t v3 = [v2 labelAttributes];
    id v7 = (void *)[v6 initWithString:v5 attributes:v3];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [(PXStoryChromeButton *)self label];
  [v8 setAttributedText:v7];

  if (v5)
  {
  }
  id v9 = [(PXStoryChromeButton *)self label];
  [v9 setHidden:v5 == 0];
}

- (id)_createLabel
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  return v2;
}

- (id)_createAssetImageView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  [v2 setContentMode:2];
  [v2 setUserInteractionEnabled:0];
  uint64_t v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

- (void)setAssetImage:(id)a3
{
  id v7 = (UIImage *)a3;
  uint64_t v5 = self->_assetImage;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(UIImage *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetImage, a3);
      [(PXStoryChromeButton *)self _invalidateAppearance];
    }
  }
}

- (void)_px_invalidatePointerInteraction
{
  id v2 = [(PXStoryChromeButton *)self pointerInteraction];
  [v2 invalidate];
}

- (void)_updateAppearance
{
  uint64_t v3 = [(PXStoryChromeButton *)self userData];
  uint64_t v4 = [v3 spec];
  if (v4)
  {
    -[PXStoryChromeButton setEnabled:](self, "setEnabled:", [v3 enabled]);
    int v5 = [(PXStoryChromeButton *)self isFocused];
    if ([(id)objc_opt_class() usesButtonSystem])
    {
      char v6 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
      id v7 = [v3 label];
      [v6 setTitle:v7];

      id v8 = [v3 systemImageName];
      if (v8)
      {
        id v9 = [(PXStoryChromeButton *)self _imageWithSystemName:v8];
      }
      else
      {
        id v9 = 0;
      }
      [v6 setImage:v9];
      [(PXStoryChromeButton *)self setConfiguration:v6];
      if (v3)
      {
        [v3 transform];
      }
      else
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v30 = 0u;
      }
      v29[0] = v30;
      v29[1] = v31;
      v29[2] = v32;
      [(PXStoryChromeButton *)self setTransform:v29];
      [(PXStoryChromeButton *)self _updateAssetImageView];
    }
    else
    {
      id v10 = [v3 tintColor];
      uint64_t v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        id v12 = [v4 defaultTintColor];
      }
      char v6 = v12;

      if (v5)
      {
        id v13 = [v3 focusedTintColor];
        uint64_t v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [v4 defaultFocusedTintColor];
        }
        id v16 = v15;

        char v6 = v16;
      }
      if (([v3 enabled] & 1) == 0)
      {
        uint64_t v17 = [v6 colorWithAlphaComponent:0.5];

        char v6 = (void *)v17;
      }
      if ([(PXStoryChromeButton *)self isMenuOpen])
      {
        id v18 = [v3 focusedTintColor];
        uint64_t v19 = v18;
        if (v18)
        {
          id v20 = v18;
        }
        else
        {
          id v20 = [v4 defaultFocusedTintColor];
        }
        id v21 = v20;

        char v6 = v21;
      }
      [(PXStoryChromeButton *)self setTintColor:v6];
      id v9 = [(PXStoryChromeButton *)self layer];
      [v4 shadowRadius];
      objc_msgSend(v9, "setShadowRadius:");
      if (v5)
      {
        [v4 focusedShadowOpacity];
        *(float *)&double v22 = v22;
        [v9 setShadowOpacity:v22];
        [v4 focusedShadowOffset];
      }
      else
      {
        [v9 setShadowOpacity:0.0];
        double v23 = *MEMORY[0x1E4F1DB30];
        double v24 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      objc_msgSend(v9, "setShadowOffset:", v23, v24);
      if (v3)
      {
        [v3 transform];
      }
      else
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v26 = 0u;
      }
      v25[0] = v26;
      v25[1] = v27;
      v25[2] = v28;
      [(PXStoryChromeButton *)self setTransform:v25];
      [(PXStoryChromeButton *)self _updateLabel];
      [(PXStoryChromeButton *)self _updateAssetImageView];
      [(PXStoryChromeButton *)self _updateSystemImageView];
      [(PXStoryChromeButton *)self _updateSystemImageVisualEffectView];
      [(PXStoryChromeButton *)self _updateBadgeSystemImageView];
      [(PXStoryChromeButton *)self _updateVisualEffectView];
      [(PXStoryChromeButton *)self _updateBackgroundView];
      [(PXStoryChromeButton *)self _updateEffectViewCornerRadius];
      [(PXStoryChromeButton *)self _updateBackgroundViewCornerRadius];
    }

    [(PXStoryChromeButton *)self _configureActions];
  }
}

- (void)_invalidateAppearance
{
  id v2 = [(PXStoryChromeButton *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAppearance];
}

- (void)_updateAssetImage
{
  uint64_t v3 = [(PXStoryChromeButton *)self userData];
  uint64_t v4 = [v3 displayAsset];
  int v5 = [v3 spec];
  if (v4)
  {
    objc_initWeak(&location, self);
    [v5 defaultImageSize];
    [v5 extendedTraitCollection];
    [(id)objc_claimAutoreleasedReturnValue() displayScale];
    PXSizeScale();
  }
  [(PXStoryChromeButton *)self setAssetImage:0];
}

void __40__PXStoryChromeButton__updateAssetImage__block_invoke(void *a1, void *a2, void *a3)
{
  int v5 = (id *)(a1 + 7);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleImageResult:v7 info:v6 forDisplayAsset:a1[4] requestID:*(void *)(*(void *)(a1[5] + 8) + 24) synchronous:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24)];
}

- (void)_invalidateAssetImage
{
  id v2 = [(PXStoryChromeButton *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAssetImage];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PXStoryChromeButton;
  unsigned __int8 v5 = -[PXStoryChromeButton pointInside:withEvent:](&v12, sel_pointInside_withEvent_, a4);
  [(PXStoryChromeButton *)self bounds];
  if (v5) {
    return 1;
  }
  if (!CGRectIsEmpty(*(CGRect *)&v6))
  {
    [(PXStoryChromeButton *)self userData];
    [(id)objc_claimAutoreleasedReturnValue() hitTestEdgeOutsets];
    sub_1AB23B20C();
  }
  return 0;
}

- (void)setIsHovered:(BOOL)a3
{
  if (self->_isHovered != a3)
  {
    self->_isHovered = a3;
    [(PXStoryChromeButton *)self _invalidateAppearance];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXStoryChromeButton *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXStoryChromeButton;
    [(PXStoryChromeButton *)&v5 setHighlighted:v3];
    [(PXStoryChromeButton *)self _invalidateAppearance];
  }
}

- (void)layoutSubviews
{
  BOOL v3 = [(PXStoryChromeButton *)self updater];
  [v3 updateIfNeeded];

  v14.receiver = self;
  v14.super_class = (Class)PXStoryChromeButton;
  [(PXStoryChromeButton *)&v14 layoutSubviews];
  if (([(id)objc_opt_class() usesButtonSystem] & 1) == 0)
  {
    BOOL v4 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXStoryChromeButton semanticContentAttribute](self, "semanticContentAttribute")) == 1;
    [(PXStoryChromeButton *)self bounds];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__PXStoryChromeButton_layoutSubviews__block_invoke;
    aBlock[3] = &__block_descriptor_65_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    BOOL v13 = v4;
    aBlock[4] = v5;
    aBlock[5] = v6;
    aBlock[6] = v7;
    aBlock[7] = v8;
    id v9 = _Block_copy(aBlock);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__PXStoryChromeButton_layoutSubviews__block_invoke_2;
    v11[3] = &unk_1E5DD1310;
    v11[4] = self;
    v11[5] = v9;
    _Block_copy(v11);
    id v10 = [(PXStoryChromeButton *)self userData];
    [v10 spec];
    objc_claimAutoreleasedReturnValue();
    [v10 contentEdgeInsets];
    PXEdgeInsetsInsetRect();
  }
}

uint64_t __37__PXStoryChromeButton_layoutSubviews__block_invoke(uint64_t result, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  if (*(unsigned char *)(result + 64)) {
    return MEMORY[0x1AD10B740](a2, a3, a4, a5, *(double *)(result + 32), *(double *)(result + 40), *(double *)(result + 48), *(double *)(result + 56));
  }
  return result;
}

void __37__PXStoryChromeButton_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  id v12 = [v11 superview];
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(a3, a4, a5, a6);
  objc_msgSend(v12, "convertRect:fromView:", *(void *)(a1 + 32));
  objc_msgSend(v11, "setFrame:");
}

- (void)setIsMenuOpen:(BOOL)a3
{
  if (self->_isMenuOpen != a3)
  {
    self->_isMenuOpen = a3;
    [(PXStoryChromeButton *)self _invalidateAppearance];
  }
}

- (void)setAlpha:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryChromeButton;
  -[PXStoryChromeButton setAlpha:](&v5, sel_setAlpha_);
  [(PXStoryChromeButton *)self setUserInteractionEnabled:a3 > 0.0];
}

- (PXStoryChromeButton)initWithFrame:(CGRect)a3
{
  v40[4] = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)PXStoryChromeButton;
  BOOL v3 = -[PXStoryChromeButton initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    BOOL v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    id v5 = objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (const char *)[v5 UTF8String];

    os_log_t v7 = os_log_create((const char *)*MEMORY[0x1E4F8C518], v6);
    log = v3->_log;
    v3->_log = (OS_os_log *)v7;

    uint64_t v9 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v3 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v9;

    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateAssetImage];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateAppearance];
    uint64_t v11 = [(PXStoryChromeButton *)v3 _createAssetImageView];
    assetImageView = v3->_assetImageView;
    v3->_assetImageView = (UIImageView *)v11;

    [(PXStoryChromeButton *)v3 addSubview:v3->_assetImageView];
    if ([(id)objc_opt_class() usesButtonSystem])
    {
      BOOL v13 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
      [(PXStoryChromeButton *)v3 setConfiguration:v13];

      [(UIImageView *)v3->_assetImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      v35 = (void *)MEMORY[0x1E4F28DC8];
      objc_super v14 = [(UIImageView *)v3->_assetImageView leadingAnchor];
      id v15 = [(PXStoryChromeButton *)v3 leadingAnchor];
      v38 = [v14 constraintEqualToAnchor:v15];
      v40[0] = v38;
      v37 = [(UIImageView *)v3->_assetImageView trailingAnchor];
      uint64_t v36 = [(PXStoryChromeButton *)v3 trailingAnchor];
      v34 = [v37 constraintEqualToAnchor:v36];
      v40[1] = v34;
      id v16 = [(UIImageView *)v3->_assetImageView topAnchor];
      uint64_t v17 = [(PXStoryChromeButton *)v3 topAnchor];
      id v18 = [v16 constraintEqualToAnchor:v17];
      v40[2] = v18;
      uint64_t v19 = [(UIImageView *)v3->_assetImageView bottomAnchor];
      id v20 = [(PXStoryChromeButton *)v3 bottomAnchor];
      id v21 = [v19 constraintEqualToAnchor:v20];
      v40[3] = v21;
      double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
      [v35 activateConstraints:v22];
    }
    else
    {
      uint64_t v23 = [(id)objc_opt_class() _createSystemImageView];
      systemImageView = v3->_systemImageView;
      v3->_systemImageView = (UIImageView *)v23;

      uint64_t v25 = [(id)objc_opt_class() _createBadgeSystemImageView];
      badgeSystemImageView = v3->_badgeSystemImageView;
      v3->_badgeSystemImageView = (UIImageView *)v25;

      [(PXStoryChromeButton *)v3 addSubview:v3->_systemImageView];
      uint64_t v27 = [(id)objc_opt_class() _createSystemImageVisualEffectView];
      systemImageVisualEffectView = v3->_systemImageVisualEffectView;
      v3->_systemImageVisualEffectView = (UIVisualEffectView *)v27;

      [(PXStoryChromeButton *)v3 addSubview:v3->_systemImageVisualEffectView];
      [(PXStoryChromeButton *)v3 addSubview:v3->_badgeSystemImageView];
      uint64_t v29 = [(PXStoryChromeButton *)v3 _createLabel];
      label = v3->_label;
      v3->_label = (UILabel *)v29;

      [(PXStoryChromeButton *)v3 addSubview:v3->_label];
      objc_super v14 = [(PXStoryChromeButton *)v3 layer];
      [v14 setAllowsGroupOpacity:0];
      id v15 = [MEMORY[0x1E4FB1618] blackColor];
      objc_msgSend(v14, "setShadowColor:", objc_msgSend(v15, "CGColor"));
    }

    long long v31 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
    [(PXStoryChromeButton *)v3 setPointerInteraction:v31];

    long long v32 = [(PXStoryChromeButton *)v3 pointerInteraction];
    [(PXStoryChromeButton *)v3 addInteraction:v32];
  }
  return v3;
}

+ (id)_createBadgeSystemImageView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  [v2 setContentMode:1];
  [v2 setUserInteractionEnabled:0];
  BOOL v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

+ (id)_createSystemImageVisualEffectView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
  [v2 setUserInteractionEnabled:0];
  return v2;
}

+ (id)_createSystemImageView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  [v2 setContentMode:4];
  [v2 setUserInteractionEnabled:0];
  BOOL v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

+ (CGSize)_sizeForAttributedLabel:(id)a3
{
  id v3 = a3;
  if (_sizeForAttributedLabel__onceToken != -1) {
    dispatch_once(&_sizeForAttributedLabel__onceToken, &__block_literal_global_290002);
  }
  BOOL v4 = [(id)_sizeForAttributedLabel__cachedSizes objectForKey:v3];
  id v5 = v4;
  if (!v4)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v10 setAttributedText:v3];
    objc_msgSend(v10, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    PXSizeCeilingToPixel();
  }
  [v4 CGSizeValue];
  double v7 = v6;
  double v9 = v8;

  double v11 = v7;
  double v12 = v9;
  result.double height = v12;
  result.double width = v11;
  return result;
}

void __47__PXStoryChromeButton__sizeForAttributedLabel___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_sizeForAttributedLabel__cachedSizes;
  _sizeForAttributedLabel__cachedSizes = (uint64_t)v0;
}

+ (CGSize)sizeWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 spec];
  double v7 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ([(id)objc_opt_class() usesButtonSystem])
  {
    double v8 = objc_alloc_init(PXStoryChromeButton);
    [(PXStoryChromeButton *)v8 setUserData:v4];
    -[PXStoryChromeButton sizeThatFits:](v8, "sizeThatFits:", v7, v6);
    double v7 = v9;
    double v6 = v10;
  }
  else
  {
    if ([v4 hasPrimaryImageContent])
    {
      [v5 defaultImageSize];
      double v7 = v11;
      double v6 = v12;
    }
    double v8 = [v4 label];
    if (v8)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
      objc_super v14 = [v5 labelAttributes];
      id v15 = (void *)[v13 initWithString:v8 attributes:v14];

      [a1 _sizeForAttributedLabel:v15];
      double v17 = v16;
      double v19 = v18;
      [v5 labelPadding];
      double v7 = v7 + v21 + v17 + v20;
      double v24 = v23 + v19 + v22;
      if (v6 < v24) {
        double v6 = v24;
      }
    }
  }

  [v4 contentEdgeInsets];
  double v27 = v7 + v25 + v26;
  double v30 = v6 + v28 + v29;

  double v31 = v27;
  double v32 = v30;
  result.double height = v32;
  result.double width = v31;
  return result;
}

+ (BOOL)usesButtonSystem
{
  return 0;
}

@end