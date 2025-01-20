@interface PXCuratedLibraryOverlayButton
+ (BOOL)usesButtonSystem;
+ (CGSize)_sizeOfTitle:(id)a3 withFont:(id)a4;
+ (CGSize)sizeWithConfiguration:(id)a3;
+ (NSCache)buttonSizeCache;
+ (NSCache)titleSizeCache;
+ (UIColor)defaultTitleColor;
+ (UIFont)defaultTitleFont;
+ (id)iconImageSymbolConfigurationFromConfiguration:(id)a3;
+ (id)roundedCornerMaskImage:(id)a3 size:(CGSize)a4;
+ (void)_getSize:(CGSize *)a3 titleFrame:(CGRect *)a4 captionFrame:(CGRect *)a5 iconFrame:(CGRect *)a6 forConfiguration:(id)a7 title:(id)a8;
- (BOOL)canBecomeFocused;
- (BOOL)isSizeCalculationButton;
- (CGRect)clippingRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)axLabel;
- (NSString)description;
- (PXCuratedLibraryOverlayButton)initWithFrame:(CGRect)a3;
- (PXCuratedLibraryOverlayButtonConfiguration)userData;
- (UIImageView)customIconImageView;
- (UILabel)customCaptionLabel;
- (UILabel)customTitleLabel;
- (UIPointerInteraction)pointerInteraction;
- (UIView)contentView;
- (UIView)customSolidBackgroundView;
- (UIVisualEffectView)effectView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)extendedHitTestInsetsEdges;
- (void)_accessibilitySettingsChanged:(id)a3;
- (void)_performAction:(id)a3;
- (void)_performMenuAction:(id)a3;
- (void)_platformSpecificViewSetup;
- (void)_setupViews;
- (void)_updateBackgroundView;
- (void)_updateButtonSystemWithConfiguration:(id)a3;
- (void)_updateButtonWithConfiguration:(id)a3;
- (void)_updateEffectView;
- (void)_updateEffectViewBackgroundStyle;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)layoutSubviews;
- (void)setAxLabel:(id)a3;
- (void)setClippingRect:(CGRect)a3;
- (void)setContentView:(id)a3;
- (void)setCustomCaptionLabel:(id)a3;
- (void)setCustomIconImageView:(id)a3;
- (void)setCustomSolidBackgroundView:(id)a3;
- (void)setCustomTitleLabel:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setExtendedHitTestInsetsEdges:(unint64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsSizeCalculationButton:(BOOL)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setUserData:(id)a3;
- (void)updateHitTestInsets;
@end

@implementation PXCuratedLibraryOverlayButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axLabel, 0);
  objc_storeStrong((id *)&self->_customCaptionLabel, 0);
  objc_storeStrong((id *)&self->_customTitleLabel, 0);
  objc_storeStrong((id *)&self->_customIconImageView, 0);
  objc_storeStrong((id *)&self->_customSolidBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

- (void)setAxLabel:(id)a3
{
}

- (NSString)axLabel
{
  return self->_axLabel;
}

- (void)setCustomCaptionLabel:(id)a3
{
}

- (UILabel)customCaptionLabel
{
  return self->_customCaptionLabel;
}

- (void)setCustomTitleLabel:(id)a3
{
}

- (UILabel)customTitleLabel
{
  return self->_customTitleLabel;
}

- (void)setCustomIconImageView:(id)a3
{
}

- (UIImageView)customIconImageView
{
  return self->_customIconImageView;
}

- (void)setCustomSolidBackgroundView:(id)a3
{
}

- (UIView)customSolidBackgroundView
{
  return self->_customSolidBackgroundView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setEffectView:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setIsSizeCalculationButton:(BOOL)a3
{
  self->_isSizeCalculationButton = a3;
}

- (BOOL)isSizeCalculationButton
{
  return self->_isSizeCalculationButton;
}

- (void)setPointerInteraction:(id)a3
{
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setExtendedHitTestInsetsEdges:(unint64_t)a3
{
  self->_extendedHitTestInsetsEdges = a3;
}

- (unint64_t)extendedHitTestInsetsEdges
{
  return self->_extendedHitTestInsetsEdges;
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

- (PXCuratedLibraryOverlayButtonConfiguration)userData
{
  return self->_userData;
}

- (void)_updateEffectView
{
  if ([(id)objc_opt_class() usesButtonSystem])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryOverlayButton.m" lineNumber:1646 description:@"Shouldn't be called if button system is used."];
  }
  [(PXCuratedLibraryOverlayButton *)self effectView];
  if (objc_claimAutoreleasedReturnValue())
  {
    v4 = [(PXCuratedLibraryOverlayButton *)self userData];
    [(PXCuratedLibraryOverlayButton *)self _updateEffectViewBackgroundStyle];
    id v5 = v4;
    [v5 segment];
    v6 = [v5 spec];
    [v6 buttonHeight];

    [v5 style];
    v7 = [v5 spec];

    [v7 layoutDirection];
    PXFloatApproximatelyEqualToFloat();
  }
}

- (void)_updateEffectViewBackgroundStyle
{
  if ([(id)objc_opt_class() usesButtonSystem])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryOverlayButton.m" lineNumber:1571 description:@"Shouldn't be called if button system is used."];
  }
  v4 = [(PXCuratedLibraryOverlayButton *)self effectView];
  if (v4)
  {
    id v19 = v4;
    id v5 = [MEMORY[0x1E4FB1618] clearColor];
    v6 = [(PXCuratedLibraryOverlayButton *)self userData];
    uint64_t v7 = [v6 style];

    switch(v7)
    {
      case 0:
      case 6:
      case 10:
        char v8 = 1;
        v9 = @"UIBlurEffectStyleSystemUltraThinMaterial";
        uint64_t v10 = 6;
        break;
      case 1:
      case 7:
      case 9:
      case 11:
        char v8 = 1;
        v9 = @"UIBlurEffectStyleSystemUltraThinMaterialDark";
        uint64_t v10 = 16;
        break;
      case 2:
      case 3:
      case 4:
      case 5:
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryOverlayButton.m" lineNumber:1625 description:@"Code which should be unreachable has been reached"];

        abort();
      case 8:
        char v8 = 1;
        v9 = @"UIBlurEffectStyleSystemThinMaterial";
        uint64_t v10 = 7;
        break;
      case 12:
        uint64_t v11 = [MEMORY[0x1E4FB1618] systemBlueColor];

        char v8 = 1;
        uint64_t v10 = 6;
        id v5 = (void *)v11;
        v9 = @"UIBlurEffectStyleSystemUltraThinMaterial";
        break;
      case 13:
        uint64_t v12 = [MEMORY[0x1E4FB1618] systemBlueColor];

        char v8 = 1;
        uint64_t v10 = 7;
        id v5 = (void *)v12;
        v9 = @"UIBlurEffectStyleSystemThinMaterial";
        break;
      case 14:
        v13 = [(PXCuratedLibraryOverlayButton *)self userData];
        uint64_t v14 = [v13 backgroundColor];

        v9 = 0;
        char v8 = 0;
        uint64_t v10 = 0;
        id v5 = (void *)v14;
        break;
      default:
        v9 = 0;
        uint64_t v10 = 0;
        char v8 = 1;
        break;
    }
    v15 = [(PXCuratedLibraryOverlayButton *)self contentView];
    [v15 setBackgroundColor:v5];

    if (v8)
    {
      v16 = [MEMORY[0x1E4FB14C8] effectWithStyle:v10];
      [v19 setEffect:v16];

      v9 = [NSString stringWithFormat:@"PXCuratedLibraryOverlayButton-%@", v9];
      [v19 _setGroupName:v9];
    }
    else
    {
      [v19 setEffect:0];
    }

    v4 = v19;
  }
}

- (void)_platformSpecificViewSetup
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self];
  [(PXCuratedLibraryOverlayButton *)self addInteraction:v3];
  [(PXCuratedLibraryOverlayButton *)self setPointerInteraction:v3];
}

- (void)_updateBackgroundView
{
  if ([(id)objc_opt_class() usesButtonSystem])
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryOverlayButton.m" lineNumber:1536 description:@"Shouldn't be called if button system is used."];
  }
  v4 = [(PXCuratedLibraryOverlayButton *)self userData];
  unint64_t v5 = [v4 style];

  if (v5 >= 0xF)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"BOOL _PXNeedsEffectViewForStyle(PXCuratedLibraryOverlayButtonStyle)"];
    [v15 handleFailureInFunction:v16 file:@"PXCuratedLibraryOverlayButton.m" lineNumber:101 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  unsigned int v6 = 0x7FC3u >> v5;
  uint64_t v7 = [(PXCuratedLibraryOverlayButton *)self effectView];

  if ((v6 & 1) == 0 || v7)
  {
    if ((v6 & 1) != 0 || !v7) {
      return;
    }
    id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(PXCuratedLibraryOverlayButton *)self bounds];
    id v17 = (id)objc_msgSend(v12, "initWithFrame:");
    [v17 setUserInteractionEnabled:0];
    [v17 setAutoresizingMask:18];
    [(PXCuratedLibraryOverlayButton *)self setContentView:v17];
    [(PXCuratedLibraryOverlayButton *)self addSubview:v17];
    v13 = [(PXCuratedLibraryOverlayButton *)self effectView];
    [v13 removeFromSuperview];

    [(PXCuratedLibraryOverlayButton *)self setEffectView:0];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB1F00]);
    [(PXCuratedLibraryOverlayButton *)self bounds];
    id v17 = (id)objc_msgSend(v8, "initWithFrame:");
    [v17 setUserInteractionEnabled:0];
    [v17 setAutoresizingMask:18];
    [(PXCuratedLibraryOverlayButton *)self setEffectView:v17];
    v9 = [(PXCuratedLibraryOverlayButton *)self contentView];
    uint64_t v10 = [v17 contentView];
    [(PXCuratedLibraryOverlayButton *)self setContentView:v10];

    uint64_t v11 = [(PXCuratedLibraryOverlayButton *)self effectView];
    [(PXCuratedLibraryOverlayButton *)self addSubview:v11];

    [v9 removeFromSuperview];
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  unint64_t v5 = [(PXCuratedLibraryOverlayButton *)self userData];
  uint64_t v6 = [v5 segment];
  uint64_t v7 = [v5 spec];
  [v7 buttonHeight];
  float v9 = v8 * 0.5;

  unint64_t v10 = [v5 style];
  float v11 = 0.0;
  float v12 = 4.0;
  float v13 = 5.0;
  if (((1 << v10) & 0xC0) == 0) {
    float v13 = 0.0;
  }
  if (((1 << v10) & 0x1C00) != 0) {
    float v13 = 0.0;
  }
  else {
    float v12 = v9;
  }
  if (((1 << v10) & 0x3C) != 0)
  {
    float v13 = 0.0;
    float v12 = 0.0;
  }
  if (v10 > 0xC) {
    float v12 = v9;
  }
  else {
    float v11 = v13;
  }
  if (v6 == 2) {
    float v14 = v11;
  }
  else {
    float v14 = v12;
  }
  if (v6 == 1) {
    float v15 = v11;
  }
  else {
    float v15 = v12;
  }
  v16 = [v5 spec];
  uint64_t v17 = [v16 layoutDirection];

  if (v17 == 2) {
    float v18 = v15;
  }
  else {
    float v18 = v14;
  }
  if (v17 != 2) {
    float v14 = v15;
  }
  [(id)objc_opt_class() sizeWithConfiguration:v5];
  v21 = objc_msgSend(MEMORY[0x1E4FB14C0], "px_bezierPathWithRoundedRect:topLeftCornerRadius:topRightCornerRadius:bottomLeftCornerRadius:bottomRightCornerRadius:", 0.0, 0.0, v19, v20, v18, v14, v18, v14);
  id v22 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  [v22 setVisiblePath:v21];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self parameters:v22];
  v24 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v23];
  v25 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v24 shape:0];

  return v25;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  uint64_t v6 = [(PXCuratedLibraryOverlayButton *)self userData];
  uint64_t v7 = [v6 spec];
  char v8 = [v7 isFloating];

  if ((v8 & 1) != 0 || [v6 forcePointerInteractionEnabled])
  {
    float v9 = (void *)MEMORY[0x1E4FB1AD8];
    [(PXCuratedLibraryOverlayButton *)self bounds];
    unint64_t v10 = objc_msgSend(v9, "regionWithRect:identifier:", @"curatedLibraryOverylayButton");
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryOverlayButton;
  [(PXCuratedLibraryOverlayButton *)&v11 contextMenuInteraction:a3 willEndForConfiguration:a4 animator:a5];
  uint64_t v6 = [(PXCuratedLibraryOverlayButton *)self userData];
  uint64_t v7 = [v6 willDismissMenuActionHandler];

  if (v7)
  {
    char v8 = [(PXCuratedLibraryOverlayButton *)self userData];
    float v9 = [v8 willDismissMenuActionHandler];
    v9[2]();
  }
  unint64_t v10 = [(PXCuratedLibraryOverlayButton *)self menu];
  [v10 didClose];
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryOverlayButton;
  [(PXCuratedLibraryOverlayButton *)&v11 contextMenuInteraction:a3 willDisplayMenuForConfiguration:a4 animator:a5];
  uint64_t v6 = [(PXCuratedLibraryOverlayButton *)self userData];
  uint64_t v7 = [v6 willDisplayMenuActionHandler];

  if (v7)
  {
    char v8 = [(PXCuratedLibraryOverlayButton *)self userData];
    float v9 = [v8 willDisplayMenuActionHandler];
    v9[2]();
  }
  unint64_t v10 = [(PXCuratedLibraryOverlayButton *)self menu];
  [v10 willOpen];
}

- (void)_accessibilitySettingsChanged:(id)a3
{
  id v3 = [(PXCuratedLibraryOverlayButton *)self customTitleLabel];
  [v3 _setWantsUnderlineForAccessibilityButtonShapesEnabled:UIAccessibilityButtonShapesEnabled()];
}

- (void)setContentView:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (UIView *)a3;
  if ([(id)objc_opt_class() usesButtonSystem])
  {
    float v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryOverlayButton.m" lineNumber:1453 description:@"Shouldn't be called if button system is used."];
  }
  contentView = self->_contentView;
  if (contentView != v6)
  {
    char v8 = contentView;
    objc_storeStrong((id *)&self->_contentView, a3);
    if (v6 && v8)
    {
      [(UIView *)v8 frame];
      -[UIView setFrame:](v6, "setFrame:");
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      float v9 = [(UIView *)v8 subviews];
      unint64_t v10 = (void *)[v9 copy];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            [(UIView *)v6 addSubview:*(void *)(*((void *)&v16 + 1) + 8 * v14++)];
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v12);
      }

      [(PXCuratedLibraryOverlayButton *)self insertSubview:v6 aboveSubview:v8];
    }
  }
}

- (void)_performMenuAction:(id)a3
{
  id v10 = a3;
  unint64_t v5 = [(PXCuratedLibraryOverlayButton *)self userData];
  uint64_t v6 = [v5 actionPerformer];
  uint64_t v7 = [v5 menuActionHandler];
  char v8 = (void (**)(void))v7;
  if (v6 && v7)
  {
    float v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXCuratedLibraryOverlayButton.m", 1442, @"Invalid parameter not satisfying: %@", @"PX_NAND(actionPerformer, actionHandler)" object file lineNumber description];
  }
  [v6 setSender:v10];
  [v6 performActionWithCompletionHandler:0];
  if (v8) {
    v8[2](v8);
  }
}

- (void)_performAction:(id)a3
{
  id v10 = a3;
  unint64_t v5 = [(PXCuratedLibraryOverlayButton *)self userData];
  uint64_t v6 = [v5 actionPerformer];
  uint64_t v7 = [v5 actionHandler];
  char v8 = (void (**)(void))v7;
  if (v6 && v7)
  {
    float v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXCuratedLibraryOverlayButton.m", 1427, @"Invalid parameter not satisfying: %@", @"PX_NAND(actionPerformer, actionHandler)" object file lineNumber description];
  }
  [v6 setSender:v10];
  [v6 performActionWithCompletionHandler:0];
  if (v8) {
    v8[2](v8);
  }
}

- (void)_updateButtonWithConfiguration:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(id)objc_opt_class() usesButtonSystem])
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryOverlayButton.m" lineNumber:1358 description:@"Shouldn't be called if button system is used."];
  }
  [(PXCuratedLibraryOverlayButton *)self _updateBackgroundView];
  [(PXCuratedLibraryOverlayButton *)self _updateEffectView];
  uint64_t v6 = [(PXCuratedLibraryOverlayButton *)self customIconImageView];
  uint64_t v7 = [v5 tintedIconImage];
  [v6 setImage:v7];

  char v8 = [v5 highlightedIconImage];
  [v6 setHighlightedImage:v8];

  float v9 = [v5 tintColor];
  [v6 setTintColor:v9];

  id v10 = [(PXCuratedLibraryOverlayButton *)self pointerInteraction];
  [v10 invalidate];

  id v11 = v5;
  if (_PXIconImageSymbolConfiguration_onceToken != -1) {
    dispatch_once(&_PXIconImageSymbolConfiguration_onceToken, &__block_literal_global_713);
  }
  uint64_t v12 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v13 = [v12 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v13);

  float v15 = [v11 systemImageName];
  id v16 = objc_alloc((Class)off_1E5DA9660);
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "style"));
  long long v18 = (void *)v17;
  if (v15)
  {
    uint64_t v41 = v17;
    long long v19 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v20 = [v19 preferredContentSizeCategory];
    v42 = v20;
    v43 = v15;
    uint64_t v21 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v22 = 3;
  }
  else
  {
    uint64_t v41 = v17;
    long long v19 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v20 = [v19 preferredContentSizeCategory];
    v42 = v20;
    uint64_t v21 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v22 = 2;
  }
  v23 = [v21 arrayWithObjects:&v41 count:v22];
  v24 = (void *)[v16 initWithObjects:v23];

  v25 = [(id)_PXIconImageSymbolConfiguration_configsCache objectForKey:v24];
  if (!v25)
  {
    switch([v11 style])
    {
      case 0:
      case 1:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 13:
      case 14:
        v26 = (id *)MEMORY[0x1E4FB27B0];
        if (!IsAccessibilityCategory) {
          v26 = (id *)MEMORY[0x1E4FB27D0];
        }
        id v27 = *v26;
        v28 = [v11 spec];
        char v29 = [v28 options];

        v30 = (id *)MEMORY[0x1E4FB28C8];
        if ((v29 & 4) == 0) {
          v30 = (id *)MEMORY[0x1E4FB2948];
        }
        id v31 = *v30;
        v32 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v31, v27, 32770);
        if ((v29 & 4) != 0
          || ([v15 isEqualToString:@"person.fill"] & 1) != 0
          || [v15 isEqualToString:@"person.2.fill"])
        {
          uint64_t v33 = 1;
        }
        else
        {
          uint64_t v33 = 2;
        }
        v34 = (void *)MEMORY[0x1E4FB1830];
        [v32 pointSize];
        v25 = objc_msgSend(v34, "configurationWithPointSize:weight:scale:", 6, v33);

        goto LABEL_28;
      case 2:
      case 3:
        objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB27B8], 4096);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        v35 = (void *)MEMORY[0x1E4FB1830];
        [v27 pointSize];
        v36 = v35;
        uint64_t v37 = 4;
        goto LABEL_27;
      case 4:
      case 5:
        objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB27B8], 4096);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (void *)MEMORY[0x1E4FB1830];
        [v27 pointSize];
        goto LABEL_26;
      case 12:
        v39 = (void *)MEMORY[0x1E4FB27B0];
        if (!IsAccessibilityCategory) {
          v39 = (void *)MEMORY[0x1E4FB27D0];
        }
        objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB2948], *v39, 32770);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (void *)MEMORY[0x1E4FB1830];
        [v27 pointSize];
LABEL_26:
        v36 = v38;
        uint64_t v37 = 6;
LABEL_27:
        v25 = objc_msgSend(v36, "configurationWithPointSize:weight:scale:", v37, 3);
LABEL_28:

        break;
      default:
        v25 = 0;
        break;
    }
    [(id)_PXIconImageSymbolConfiguration_configsCache setObject:v25 forKey:v24];
  }

  [v6 setPreferredSymbolConfiguration:v25];
  [v11 hitTestOutsets];
  sub_1AB23B20C();
}

- (void)_updateButtonSystemWithConfiguration:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([(id)objc_opt_class() usesButtonSystem] & 1) == 0)
  {
    v76 = [MEMORY[0x1E4F28B00] currentHandler];
    [v76 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryOverlayButton.m" lineNumber:1210 description:@"Shouldn't be called if button system is not used."];
  }
  uint64_t v6 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = [v7 segment];
    float v9 = [v7 spec];
    [v9 buttonHeight];
    float v11 = v10 * 0.5;

    unint64_t v12 = [v7 style];
    float v13 = 0.0;
    if (v12 <= 0xC)
    {
      if (((1 << v12) & 0x3C) != 0)
      {
        float v11 = 0.0;
      }
      else if (((1 << v12) & 0x1C00) != 0)
      {
        float v11 = 4.0;
      }
      else if (((1 << v12) & 0xC0) != 0)
      {
        float v13 = 5.0;
      }
    }
    if (v8 == 2) {
      float v14 = v13;
    }
    else {
      float v14 = v11;
    }
    if (v8 == 1) {
      float v11 = v13;
    }
    float v15 = [v7 spec];

    uint64_t v16 = [v15 layoutDirection];
    if (v16 == 2) {
      float v17 = v11;
    }
    else {
      float v17 = v14;
    }
    if (v16 == 2) {
      float v18 = v14;
    }
    else {
      float v18 = v11;
    }
    float v19 = fmaxf(v17, v18);
    [v6 setCornerStyle:4];
    if (v19 == 0.0) {
      objc_msgSend(v6, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
    }
  }
  double v20 = [v5 iconImageWithoutConfiguration];

  if (v20)
  {
    uint64_t v21 = [v5 iconImageWithoutConfiguration];
    [v6 setImage:v21];
  }
  id v22 = v5;
  if (_PXIconImageSymbolConfiguration_onceToken != -1) {
    dispatch_once(&_PXIconImageSymbolConfiguration_onceToken, &__block_literal_global_713);
  }
  v23 = [MEMORY[0x1E4FB1438] sharedApplication];
  v24 = [v23 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v24);

  v25 = [v22 systemImageName];
  id v26 = objc_alloc((Class)off_1E5DA9660);
  uint64_t v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "style"));
  v28 = (void *)v27;
  if (v25)
  {
    uint64_t v82 = v27;
    char v29 = [MEMORY[0x1E4FB1438] sharedApplication];
    v30 = [v29 preferredContentSizeCategory];
    v83 = v30;
    v84 = v25;
    id v31 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v32 = 3;
  }
  else
  {
    uint64_t v82 = v27;
    char v29 = [MEMORY[0x1E4FB1438] sharedApplication];
    v30 = [v29 preferredContentSizeCategory];
    v83 = v30;
    id v31 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v32 = 2;
  }
  uint64_t v33 = [v31 arrayWithObjects:&v82 count:v32];
  v34 = (void *)[v26 initWithObjects:v33];

  v35 = &_px_localizedCapitalizedString__languagesWithCustomCapitalization;
  v36 = [(id)_PXIconImageSymbolConfiguration_configsCache objectForKey:v34];
  unint64_t v37 = 0x1E4FB1000uLL;
  if (!v36)
  {
    switch([v22 style])
    {
      case 0:
      case 1:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 13:
      case 14:
        v38 = (id *)MEMORY[0x1E4FB27B0];
        if (!IsAccessibilityCategory) {
          v38 = (id *)MEMORY[0x1E4FB27D0];
        }
        id v39 = *v38;
        v40 = [v22 spec];
        char v41 = [v40 options];

        v42 = (id *)MEMORY[0x1E4FB28C8];
        if ((v41 & 4) == 0) {
          v42 = (id *)MEMORY[0x1E4FB2948];
        }
        id v43 = *v42;
        uint64_t v44 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v43, v39, 32770);
        if ((v41 & 4) != 0
          || ([v25 isEqualToString:@"person.fill"] & 1) != 0
          || [v25 isEqualToString:@"person.2.fill"])
        {
          uint64_t v45 = 1;
        }
        else
        {
          uint64_t v45 = 2;
        }
        v46 = (void *)MEMORY[0x1E4FB1830];
        [v44 pointSize];
        v36 = objc_msgSend(v46, "configurationWithPointSize:weight:scale:", 6, v45);

        unint64_t v37 = 0x1E4FB1000;
        v35 = &_px_localizedCapitalizedString__languagesWithCustomCapitalization;
        goto LABEL_51;
      case 2:
      case 3:
        objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB27B8], 4096);
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        v47 = (void *)MEMORY[0x1E4FB1830];
        [v39 pointSize];
        v48 = v47;
        uint64_t v49 = 4;
        goto LABEL_50;
      case 4:
      case 5:
        objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB27B8], 4096);
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        v50 = (void *)MEMORY[0x1E4FB1830];
        [v39 pointSize];
        goto LABEL_49;
      case 12:
        v51 = (void *)MEMORY[0x1E4FB27B0];
        if (!IsAccessibilityCategory) {
          v51 = (void *)MEMORY[0x1E4FB27D0];
        }
        objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB2948], *v51, 32770);
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        v50 = (void *)MEMORY[0x1E4FB1830];
        [v39 pointSize];
LABEL_49:
        v48 = v50;
        uint64_t v49 = 6;
LABEL_50:
        v36 = objc_msgSend(v48, "configurationWithPointSize:weight:scale:", v49, 3);
LABEL_51:

        break;
      default:
        v36 = 0;
        break;
    }
    [(id)v35[192] setObject:v36 forKey:v34];
  }

  [v6 setPreferredSymbolConfigurationForImage:v36];
  v52 = [v22 title];

  if (v52)
  {
    v53 = [v22 title];
    [v6 setTitle:v53];

    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __70__PXCuratedLibraryOverlayButton__updateButtonSystemWithConfiguration___block_invoke;
    v80[3] = &unk_1E5DC6F70;
    id v81 = v22;
    [v6 setTitleTextAttributesTransformer:v80];
  }
  v54 = [v22 caption];

  if (v54)
  {
    v55 = [v22 caption];
    [v6 setSubtitle:v55];

    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __70__PXCuratedLibraryOverlayButton__updateButtonSystemWithConfiguration___block_invoke_2;
    v78[3] = &unk_1E5DC6F70;
    id v79 = v22;
    [v6 setSubtitleTextAttributesTransformer:v78];
  }
  v56 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  switch([v22 style])
  {
    case 0:
    case 6:
    case 10:
      uint64_t v58 = [MEMORY[0x1E4FB14C8] effectWithStyle:6];
      uint64_t v57 = 0;
      goto LABEL_62;
    case 1:
    case 7:
    case 9:
    case 11:
      uint64_t v58 = [MEMORY[0x1E4FB14C8] effectWithStyle:16];
      uint64_t v57 = 0;
      v56 = @"UIBlurEffectStyleSystemUltraThinMaterialDark";
      break;
    case 8:
      uint64_t v58 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
      uint64_t v57 = 0;
      goto LABEL_64;
    case 12:
      uint64_t v58 = [MEMORY[0x1E4FB14C8] effectWithStyle:6];
      uint64_t v57 = [MEMORY[0x1E4FB1618] systemBlueColor];
LABEL_62:
      v56 = @"UIBlurEffectStyleSystemUltraThinMaterial";
      break;
    case 13:
      uint64_t v58 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
      uint64_t v57 = [MEMORY[0x1E4FB1618] systemBlueColor];
LABEL_64:
      v56 = @"UIBlurEffectStyleSystemThinMaterial";
      break;
    case 14:
      uint64_t v57 = [v22 backgroundColor];
      v56 = 0;
      uint64_t v58 = 0;
      break;
    default:
      break;
  }
  [v6 setTitleLineBreakMode:2];
  [v6 setSubtitleLineBreakMode:2];
  if (v58)
  {
    v59 = [(PXCuratedLibraryOverlayButton *)self effectView];

    if (v59)
    {
      v60 = [(PXCuratedLibraryOverlayButton *)self effectView];
      [v60 setEffect:v58];
    }
    else
    {
      v60 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v58];
      [(PXCuratedLibraryOverlayButton *)self setEffectView:v60];
    }

    v61 = [(PXCuratedLibraryOverlayButton *)self effectView];
    v62 = [v61 contentView];
    [v62 setBackgroundColor:v57];

    [v61 _setGroupName:v56];
    v63 = [MEMORY[0x1E4FB1618] clearColor];
    v64 = [v6 background];
    [v64 setBackgroundColor:v63];

    v65 = [v6 background];
    [v65 setCustomView:v61];
  }
  else
  {
    if (!v57) {
      goto LABEL_74;
    }
    v61 = [v6 background];
    [v61 setBackgroundColor:v57];
  }

LABEL_74:
  v66 = [*(id *)(v37 + 1080) sharedApplication];
  v67 = [v66 preferredContentSizeCategory];
  BOOL v68 = UIContentSizeCategoryIsAccessibilityCategory(v67);

  if (v68)
  {
    [(PXCuratedLibraryOverlayButton *)self setShowsLargeContentViewer:1];
    id v69 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(PXCuratedLibraryOverlayButton *)self addInteraction:v69];

    v70 = [v22 accessibilityTitle];
    if (v70)
    {
      [(PXCuratedLibraryOverlayButton *)self setLargeContentTitle:v70];
    }
    else
    {
      v71 = [v22 title];
      [(PXCuratedLibraryOverlayButton *)self setLargeContentTitle:v71];
    }
    v72 = [v22 largeContentViewerImage];
    [(PXCuratedLibraryOverlayButton *)self setLargeContentImage:v72];

    [(PXCuratedLibraryOverlayButton *)self setScalesLargeContentImage:1];
  }
  v73 = [v22 accessibilityTitle];
  [(PXCuratedLibraryOverlayButton *)self setAccessibilityLabel:v73];

  v74 = [v22 contentColor];
  [(PXCuratedLibraryOverlayButton *)self setTintColor:v74];

  v75 = [v22 accessibilityTitle];
  [(PXCuratedLibraryOverlayButton *)self setAccessibilityLabel:v75];

  [v22 hitTestOutsets];
  sub_1AB23B20C();
}

id __70__PXCuratedLibraryOverlayButton__updateButtonSystemWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = [*(id *)(a1 + 32) style];
  if (_PXFontForComponent_onceToken != -1) {
    dispatch_once(&_PXFontForComponent_onceToken, &__block_literal_global_732);
  }
  unint64_t v6 = v5 - 2;
  id v7 = objc_alloc((Class)off_1E5DA9660);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", @"_PXOverlayButtonComponentTitle");
  float v9 = [v8 preferredContentSizeCategory];
  v23[1] = v9;
  double v10 = [NSNumber numberWithInteger:(unint64_t)(v5 - 2) < 4];
  v23[2] = v10;
  float v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  unint64_t v12 = (void *)[v7 initWithObjects:v11];

  float v13 = [(id)_PXFontForComponent_fontCache objectForKey:v12];
  if (!v13)
  {
    if (v6 < 4)
    {
      if (([@"_PXOverlayButtonComponentTitle" isEqualToString:@"_PXOverlayButtonComponentTitle"] & 1) == 0&& !objc_msgSend(@"_PXOverlayButtonComponentTitle", "isEqualToString:", @"_PXOverlayButtonComponentCaption"))
      {
        goto LABEL_22;
      }
      float v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB27B8], 4096);
LABEL_17:
      if (v13)
      {
        [(id)_PXFontForComponent_fontCache setObject:v13 forKey:v12];
        goto LABEL_19;
      }
LABEL_22:
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      id v22 = objc_msgSend(NSString, "stringWithUTF8String:", "UIFont *_PXFontForComponent(__strong _PXOverlayButtonComponent, PXCuratedLibraryOverlayButtonStyle)");
      [v21 handleFailureInFunction:v22 file:@"PXCuratedLibraryOverlayButton.m" lineNumber:183 description:@"Unexpected _PXOverlayButtonComponent passed to PXFontForComponent!"];

      abort();
    }
    float v14 = [MEMORY[0x1E4FB1438] sharedApplication];
    float v15 = [v14 preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v15);

    float v17 = (id *)MEMORY[0x1E4FB27B0];
    if (!IsAccessibilityCategory) {
      float v17 = (id *)MEMORY[0x1E4FB27C0];
    }
    id v18 = *v17;
    if ([@"_PXOverlayButtonComponentTitle" isEqualToString:@"_PXOverlayButtonComponentTitle"])
    {
      uint64_t v19 = 2;
    }
    else
    {
      if (![@"_PXOverlayButtonComponentTitle" isEqualToString:@"_PXOverlayButtonComponentCaption"])
      {
        float v13 = 0;
        goto LABEL_16;
      }
      uint64_t v19 = 0;
    }
    float v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28F0], v18, v19);
LABEL_16:

    goto LABEL_17;
  }
LABEL_19:

  [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  return v4;
}

id __70__PXCuratedLibraryOverlayButton__updateButtonSystemWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = [*(id *)(a1 + 32) style];
  if (_PXFontForComponent_onceToken != -1) {
    dispatch_once(&_PXFontForComponent_onceToken, &__block_literal_global_732);
  }
  unint64_t v6 = v5 - 2;
  id v7 = objc_alloc((Class)off_1E5DA9660);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", @"_PXOverlayButtonComponentCaption");
  float v9 = [v8 preferredContentSizeCategory];
  v23[1] = v9;
  double v10 = [NSNumber numberWithInteger:(unint64_t)(v5 - 2) < 4];
  v23[2] = v10;
  float v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  unint64_t v12 = (void *)[v7 initWithObjects:v11];

  float v13 = [(id)_PXFontForComponent_fontCache objectForKey:v12];
  if (!v13)
  {
    if (v6 < 4)
    {
      if (([@"_PXOverlayButtonComponentCaption" isEqualToString:@"_PXOverlayButtonComponentTitle"] & 1) == 0&& !objc_msgSend(@"_PXOverlayButtonComponentCaption", "isEqualToString:", @"_PXOverlayButtonComponentCaption"))
      {
        goto LABEL_22;
      }
      float v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB27B8], 4096);
LABEL_17:
      if (v13)
      {
        [(id)_PXFontForComponent_fontCache setObject:v13 forKey:v12];
        goto LABEL_19;
      }
LABEL_22:
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      id v22 = objc_msgSend(NSString, "stringWithUTF8String:", "UIFont *_PXFontForComponent(__strong _PXOverlayButtonComponent, PXCuratedLibraryOverlayButtonStyle)");
      [v21 handleFailureInFunction:v22 file:@"PXCuratedLibraryOverlayButton.m" lineNumber:183 description:@"Unexpected _PXOverlayButtonComponent passed to PXFontForComponent!"];

      abort();
    }
    float v14 = [MEMORY[0x1E4FB1438] sharedApplication];
    float v15 = [v14 preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v15);

    float v17 = (id *)MEMORY[0x1E4FB27B0];
    if (!IsAccessibilityCategory) {
      float v17 = (id *)MEMORY[0x1E4FB27C0];
    }
    id v18 = *v17;
    if ([@"_PXOverlayButtonComponentCaption" isEqualToString:@"_PXOverlayButtonComponentTitle"])
    {
      uint64_t v19 = 2;
    }
    else
    {
      if (![@"_PXOverlayButtonComponentCaption" isEqualToString:@"_PXOverlayButtonComponentCaption"])
      {
        float v13 = 0;
        goto LABEL_16;
      }
      uint64_t v19 = 0;
    }
    float v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28F0], v18, v19);
LABEL_16:

    goto LABEL_17;
  }
LABEL_19:

  [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  return v4;
}

- (void)_setupViews
{
  if (([(id)objc_opt_class() usesButtonSystem] & 1) == 0)
  {
    id v3 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXCuratedLibraryOverlayButton *)self setBackgroundColor:v3];

    [(PXCuratedLibraryOverlayButton *)self _updateBackgroundView];
    [(PXCuratedLibraryOverlayButton *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    unint64_t v12 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v4, v6, v8, v10);
    [(UIImageView *)v12 setUserInteractionEnabled:0];
    customIconImageView = self->_customIconImageView;
    self->_customIconImageView = v12;
    float v14 = v12;

    float v15 = [(PXCuratedLibraryOverlayButton *)self contentView];
    [v15 addSubview:v14];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__PXCuratedLibraryOverlayButton__setupViews__block_invoke;
    aBlock[3] = &unk_1E5DC18F0;
    *(double *)&aBlock[5] = v5;
    *(double *)&aBlock[6] = v7;
    *(double *)&aBlock[7] = v9;
    *(double *)&aBlock[8] = v11;
    aBlock[4] = self;
    uint64_t v16 = (void (**)(void))_Block_copy(aBlock);
    v16[2]();
    float v17 = (UILabel *)objc_claimAutoreleasedReturnValue();
    customTitleLabel = self->_customTitleLabel;
    self->_customTitleLabel = v17;

    ((void (*)(void (**)(void)))v16[2])(v16);
    uint64_t v19 = (UILabel *)objc_claimAutoreleasedReturnValue();
    customCaptionLabel = self->_customCaptionLabel;
    self->_customCaptionLabel = v19;
  }
  uint64_t v21 = [(PXCuratedLibraryOverlayButton *)self layer];
  [v21 setAllowsGroupOpacity:0];

  [(PXCuratedLibraryOverlayButton *)self _platformSpecificViewSetup];
}

id __44__PXCuratedLibraryOverlayButton__setupViews__block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [v2 setUserInteractionEnabled:0];
  [v2 setLineBreakMode:2];
  [v2 setTextAlignment:1];
  id v3 = [*(id *)(a1 + 32) contentView];
  [v3 addSubview:v2];

  return v2;
}

- (void)updateHitTestInsets
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(id)objc_opt_class() usesButtonSystem])
  {
    v9.receiver = self;
    v9.super_class = (Class)PXCuratedLibraryOverlayButton;
    [(PXCuratedLibraryOverlayButton *)&v9 setHighlighted:v3];
  }
  else if ([(PXCuratedLibraryOverlayButton *)self isHighlighted] != v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)PXCuratedLibraryOverlayButton;
    [(PXCuratedLibraryOverlayButton *)&v8 setHighlighted:v3];
    double v5 = [(PXCuratedLibraryOverlayButton *)self customIconImageView];
    [v5 setHighlighted:v3];

    double v6 = [(PXCuratedLibraryOverlayButton *)self customTitleLabel];
    [v6 setHighlighted:v3];

    double v7 = [(PXCuratedLibraryOverlayButton *)self customCaptionLabel];
    [v7 setHighlighted:v3];
  }
}

- (void)layoutSubviews
{
  if ([(id)objc_opt_class() usesButtonSystem])
  {
    v51.receiver = self;
    v51.super_class = (Class)PXCuratedLibraryOverlayButton;
    [(PXCuratedLibraryOverlayButton *)&v51 layoutSubviews];
  }
  else
  {
    BOOL v3 = [(PXCuratedLibraryOverlayButton *)self userData];
    long long v50 = 0uLL;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v47 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v44 = 0u;
    double v4 = objc_opt_class();
    double v5 = [v3 title];
    [v4 _getSize:&v50 titleFrame:&v48 captionFrame:&v46 iconFrame:&v44 forConfiguration:v3 title:v5];

    [(PXCuratedLibraryOverlayButton *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [(PXCuratedLibraryOverlayButton *)self effectiveUserInterfaceLayoutDirection];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__PXCuratedLibraryOverlayButton_layoutSubviews__block_invoke;
    aBlock[3] = &__block_descriptor_81_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    *(double *)&aBlock[4] = v7;
    *(double *)&aBlock[5] = v9;
    *(double *)&aBlock[6] = v11;
    *(double *)&aBlock[7] = v13;
    long long v42 = v50;
    BOOL v43 = v14 == 1;
    float v15 = (double (**)(void, double, double, double, double))_Block_copy(aBlock);
    uint64_t v16 = [(PXCuratedLibraryOverlayButton *)self contentView];
    objc_msgSend(v16, "setFrame:", v7, v9, v11, v13);

    double v17 = v15[2](v15, *(double *)&v48, *((double *)&v48 + 1), *(double *)&v49, *((double *)&v49 + 1));
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = [(PXCuratedLibraryOverlayButton *)self customTitleLabel];
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    double v25 = v15[2](v15, *(double *)&v46, *((double *)&v46 + 1), *(double *)&v47, *((double *)&v47 + 1));
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    uint64_t v32 = [(PXCuratedLibraryOverlayButton *)self customCaptionLabel];
    objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

    double v33 = v15[2](v15, *(double *)&v44, *((double *)&v44 + 1), *(double *)&v45, *((double *)&v45 + 1));
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    v40 = [(PXCuratedLibraryOverlayButton *)self customIconImageView];
    objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);
  }
}

uint64_t __47__PXCuratedLibraryOverlayButton_layoutSubviews__block_invoke(uint64_t result, double a2, double a3, __n128 a4, __n128 a5)
{
  double v5 = a2 + (*(double *)(result + 48) - *(double *)(result + 64)) * 0.5;
  double v6 = a3 + (*(double *)(result + 56) - *(double *)(result + 72)) * 0.5;
  if (*(unsigned char *)(result + 80)) {
    return MEMORY[0x1AD10B740](v5, v6, a4, a5, *(double *)(result + 32), *(double *)(result + 40));
  }
  return result;
}

- (void)setUserData:(id)a3
{
  double v9 = (PXCuratedLibraryOverlayButtonConfiguration *)a3;
  double v5 = self->_userData;
  if (v5 == v9)
  {
  }
  else
  {
    double v6 = v5;
    BOOL v7 = [(PXCuratedLibraryOverlayButtonConfiguration *)v5 isEqual:v9];

    double v8 = v9;
    if (v7) {
      goto LABEL_10;
    }
    objc_storeStrong((id *)&self->_userData, a3);
    if ([(id)objc_opt_class() usesButtonSystem])
    {
      [(PXCuratedLibraryOverlayButton *)self _updateButtonSystemWithConfiguration:v9];
    }
    else
    {
      if (v9) {
        [(PXCuratedLibraryOverlayButton *)self _updateButtonWithConfiguration:v9];
      }
      [(PXCuratedLibraryOverlayButton *)self setNeedsLayout];
    }
  }
  double v8 = v9;
LABEL_10:
}

- (NSString)description
{
  if ([(id)objc_opt_class() usesButtonSystem])
  {
    v12.receiver = self;
    v12.super_class = (Class)PXCuratedLibraryOverlayButton;
    BOOL v3 = [(PXCuratedLibraryOverlayButton *)&v12 description];
  }
  else
  {
    double v4 = NSString;
    v11.receiver = self;
    v11.super_class = (Class)PXCuratedLibraryOverlayButton;
    double v5 = [(PXCuratedLibraryOverlayButton *)&v11 description];
    double v6 = [(PXCuratedLibraryOverlayButton *)self customIconImageView];
    BOOL v7 = [v6 image];
    double v8 = [(PXCuratedLibraryOverlayButton *)self customTitleLabel];
    double v9 = [v8 text];
    BOOL v3 = [v4 stringWithFormat:@"<%@ icon:%@ title:%@>", v5, v7, v9];
  }
  return (NSString *)v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(PXCuratedLibraryOverlayButton *)self isSizeCalculationButton])
  {
    v14.receiver = self;
    v14.super_class = (Class)PXCuratedLibraryOverlayButton;
    -[PXCuratedLibraryOverlayButton sizeThatFits:](&v14, sel_sizeThatFits_, width, height);
  }
  else
  {
    double v8 = objc_opt_class();
    double v9 = [(PXCuratedLibraryOverlayButton *)self userData];
    [v8 sizeWithConfiguration:v9];
    double v11 = v10;
    double v13 = v12;

    double v6 = v11;
    double v7 = v13;
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (PXCuratedLibraryOverlayButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibraryOverlayButton;
  BOOL v3 = -[PXCuratedLibraryOverlayButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PXCuratedLibraryOverlayButton *)v3 _setupViews];
    [(PXCuratedLibraryOverlayButton *)v4 addTarget:v4 action:sel__performAction_ forControlEvents:64];
    [(PXCuratedLibraryOverlayButton *)v4 addTarget:v4 action:sel__performMenuAction_ forControlEvents:0x4000];
    double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__accessibilitySettingsChanged_ name:*MEMORY[0x1E4FB2428] object:0];
  }
  return v4;
}

+ (UIColor)defaultTitleColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] whiteColor];
}

+ (UIFont)defaultTitleFont
{
  v18[3] = *MEMORY[0x1E4F143B8];
  if (_PXFontForComponent_onceToken != -1) {
    dispatch_once(&_PXFontForComponent_onceToken, &__block_literal_global_732);
  }
  id v2 = objc_alloc((Class)off_1E5DA9660);
  BOOL v3 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", @"_PXOverlayButtonComponentTitle");
  double v4 = [v3 preferredContentSizeCategory];
  v18[1] = v4;
  double v5 = [NSNumber numberWithInteger:0];
  v18[2] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  objc_super v7 = (void *)[v2 initWithObjects:v6];

  double v8 = [(id)_PXFontForComponent_fontCache objectForKey:v7];
  if (!v8)
  {
    double v9 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v10 = [v9 preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v10);

    double v12 = (id *)MEMORY[0x1E4FB27B0];
    if (!IsAccessibilityCategory) {
      double v12 = (id *)MEMORY[0x1E4FB27C0];
    }
    id v13 = *v12;
    if ([@"_PXOverlayButtonComponentTitle" isEqualToString:@"_PXOverlayButtonComponentTitle"])
    {
      uint64_t v14 = 2;
    }
    else
    {
      if (([@"_PXOverlayButtonComponentTitle" isEqualToString:@"_PXOverlayButtonComponentCaption"] & 1) == 0)
      {

        goto LABEL_16;
      }
      uint64_t v14 = 0;
    }
    double v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28F0], v13, v14);

    if (v8)
    {
      [(id)_PXFontForComponent_fontCache setObject:v8 forKey:v7];
      goto LABEL_12;
    }
LABEL_16:
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    double v17 = objc_msgSend(NSString, "stringWithUTF8String:", "UIFont *_PXFontForComponent(__strong _PXOverlayButtonComponent, PXCuratedLibraryOverlayButtonStyle)");
    [v16 handleFailureInFunction:v17 file:@"PXCuratedLibraryOverlayButton.m" lineNumber:183 description:@"Unexpected _PXOverlayButtonComponent passed to PXFontForComponent!"];

    abort();
  }
LABEL_12:

  return (UIFont *)v8;
}

+ (void)_getSize:(CGSize *)a3 titleFrame:(CGRect *)a4 captionFrame:(CGRect *)a5 iconFrame:(CGRect *)a6 forConfiguration:(id)a7 title:(id)a8
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  id v13 = a8;
  if (v12)
  {
    unint64_t v14 = [v12 style];
    if (v14 > 0xE)
    {
      v141 = [MEMORY[0x1E4F28B00] currentHandler];
      v142 = [NSString stringWithUTF8String:"BOOL _PXNeedsEffectViewForStyle(PXCuratedLibraryOverlayButtonStyle)"];
      [v141 handleFailureInFunction:v142 file:@"PXCuratedLibraryOverlayButton.m" lineNumber:101 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    unint64_t v15 = v14;
    id v159 = v13;
    v144 = a6;
    if (((1 << v14) & 0x7FC3) != 0)
    {
      double v17 = *MEMORY[0x1E4F1DB30];
      double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      uint64_t v18 = [v13 length];
      double v19 = 12.0;
      double v160 = v17;
      if (!v18) {
        double v19 = v17;
      }
      double v151 = v19;
      int v153 = 1;
      double v156 = v16;
    }
    else
    {
      int v153 = 0;
      double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v156 = 3.0;
      double v151 = *MEMORY[0x1E4F1DB30];
      double v160 = *MEMORY[0x1E4F1DB30];
    }
    id v24 = v12;
    uint64_t v25 = [v24 segment];
    double v26 = [v24 spec];
    [v26 buttonHeight];
    float v28 = v27 * 0.5;

    unint64_t v29 = [v24 style];
    float v30 = 0.0;
    float v31 = 4.0;
    float v32 = 5.0;
    if (((1 << v29) & 0xC0) == 0) {
      float v32 = 0.0;
    }
    if (((1 << v29) & 0x1C00) != 0) {
      float v32 = 0.0;
    }
    else {
      float v31 = v28;
    }
    if (((1 << v29) & 0x3C) != 0)
    {
      float v32 = 0.0;
      float v31 = 0.0;
    }
    if (v29 > 0xC) {
      float v31 = v28;
    }
    else {
      float v30 = v32;
    }
    if (v25 == 2) {
      float v33 = v30;
    }
    else {
      float v33 = v31;
    }
    if (v25 == 1) {
      float v34 = v30;
    }
    else {
      float v34 = v31;
    }
    double v35 = objc_msgSend(v24, "spec", a3);

    uint64_t v36 = [v35 layoutDirection];
    if (v36 == 2) {
      float v37 = v34;
    }
    else {
      float v37 = v33;
    }
    float v147 = v37;
    if (v36 == 2) {
      float v38 = v33;
    }
    else {
      float v38 = v34;
    }
    float v145 = v38;
    double v39 = [v24 spec];
    [v39 buttonHeight];
    double v41 = v40;

    double v42 = v16;
    double v157 = v160;
    if (!v159)
    {
LABEL_58:
      uint64_t v58 = [v24 caption];
      double v59 = v16;
      double v60 = v160;
      if (!v58)
      {
LABEL_78:
        v78 = [v24 iconImage];
        id v79 = v78;
        if (v78)
        {
          [v78 size];
          double v160 = v80;
          double v16 = v81;
        }
        if (v41 + v156 * -2.0 >= v42) {
          double v82 = v41 + v156 * -2.0;
        }
        else {
          double v82 = v42;
        }
        [v24 imageEdgeInsets];
        double v84 = v83;
        double v86 = v85;
        double v88 = v87;
        double v90 = v89;
        uint64_t v91 = [v24 buttonType];
        double v92 = v82 - (v84 + v88);
        if (v91 == 4) {
          double v92 = 6.0;
        }
        int v93 = v153;
        if (v16 <= 0.0) {
          int v93 = 1;
        }
        if (!v93) {
          double v92 = v16;
        }
        if (v92 > 0.0 && v16 > v92) {
          PXSizeScale();
        }
        if (v82 < v16) {
          double v82 = v16;
        }
        double v95 = (float)(v147 + v145);
        BOOL v96 = v157 > 0.0;
        BOOL v97 = v160 > 0.0;
        BOOL v98 = v96 && v97;
        double v99 = 0.0;
        if (v96 && v97) {
          double v99 = 4.0;
        }
        double v100 = v90 + v160 + v86 + v157 + v151 * 2.0 + v60 + v99;
        if (v100 >= v95) {
          double v101 = -0.0;
        }
        else {
          double v101 = (v95 - v100) * 0.5;
        }
        v165 = 0;
        v166 = (CGRect *)&v165;
        uint64_t v167 = 0x4010000000;
        v168 = &unk_1AB5D584F;
        uint64_t v169 = 0;
        double v170 = v156;
        uint64_t v171 = 0;
        double v172 = v82;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __99__PXCuratedLibraryOverlayButton__getSize_titleFrame_captionFrame_iconFrame_forConfiguration_title___block_invoke;
        aBlock[3] = &unk_1E5DC1880;
        aBlock[4] = &v165;
        v102 = _Block_copy(aBlock);
        v162[0] = MEMORY[0x1E4F143A8];
        v162[1] = 3221225472;
        v162[2] = __99__PXCuratedLibraryOverlayButton__getSize_titleFrame_captionFrame_iconFrame_forConfiguration_title___block_invoke_2;
        v162[3] = &unk_1E5DC18A8;
        v103 = v102;
        id v163 = v103;
        v104 = (void (**)(void, double))_Block_copy(v162);
        v105 = v104;
        double v106 = v151 + v101;
        v107 = v104[2];
        if (v153)
        {
          v107(v104, v151 + v101);
          p_double x = &v144->origin.x;
          CGFloat v109 = v103[2](v103, v60, v59);
          CGFloat v146 = v111;
          CGFloat v148 = v110;
          CGFloat v150 = v112;
          CGFloat v152 = v109;
          if (v60 > 0.0) {
            v166[1].origin.double x = v166[1].origin.x + 2.0;
          }
          CGFloat v113 = v103[2](v103, v157, v82);
          CGFloat v158 = v114;
          CGFloat v116 = v115;
          CGFloat v118 = v117;
          CGFloat v119 = v113;
          if (v98) {
            v105[2](v105, 4.0);
          }
          v105[2](v105, v86);
          double v161 = v103[2](v103, v160, v16);
          uint64_t v154 = v120;
          uint64_t v122 = v121;
          uint64_t v124 = v123;
          v105[2](v105, v90);
          v105[2](v105, v106);
        }
        else
        {
          v107(v104, v151 + v101);
          p_double x = &v144->origin.x;
          v105[2](v105, v86);
          double v161 = v103[2](v103, v160, v16);
          uint64_t v154 = v125;
          uint64_t v122 = v126;
          uint64_t v124 = v127;
          v105[2](v105, v90);
          if (v98) {
            v105[2](v105, 4.0);
          }
          CGFloat v128 = v103[2](v103, v60, v59);
          CGFloat v146 = v130;
          CGFloat v148 = v129;
          CGFloat v150 = v131;
          CGFloat v152 = v128;
          if (v60 > 0.0) {
            v166[1].origin.double x = v166[1].origin.x + 2.0;
          }
          CGFloat v132 = v103[2](v103, v157, v82);
          CGFloat v158 = v133;
          CGFloat v119 = v132;
          CGFloat v118 = v134;
          CGFloat v116 = v135;
          v105[2](v105, v106);
        }
        double MaxX = CGRectGetMaxX(v166[1]);
        if (v143)
        {
          double *v143 = MaxX;
          v143[1] = v82 + v156 * 2.0;
        }
        if (a4)
        {
          a4->origin.double x = v119;
          a4->origin.double y = v118;
          a4->size.double width = v116;
          a4->size.double height = v158;
        }
        if (a5)
        {
          a5->origin.double x = v152;
          a5->origin.double y = v150;
          a5->size.double width = v148;
          a5->size.double height = v146;
        }
        if (p_x)
        {
          *p_double x = v161;
          *((void *)p_x + 1) = v154;
          *((void *)p_x + 2) = v122;
          *((void *)p_x + 3) = v124;
        }

        _Block_object_dispose(&v165, 8);
        id v13 = v159;
        goto LABEL_121;
      }
      if (_PXFontForComponent_onceToken != -1) {
        dispatch_once(&_PXFontForComponent_onceToken, &__block_literal_global_732);
      }
      unint64_t v61 = v15 - 2;
      BOOL v62 = v15 - 2 < 4;
      id v63 = objc_alloc((Class)off_1E5DA9660);
      v165 = @"_PXOverlayButtonComponentCaption";
      v64 = [MEMORY[0x1E4FB1438] sharedApplication];
      v65 = [v64 preferredContentSizeCategory];
      v166 = v65;
      v66 = [NSNumber numberWithInteger:v62];
      uint64_t v167 = (uint64_t)v66;
      v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v165 count:3];
      BOOL v68 = (void *)[v63 initWithObjects:v67];

      id v69 = [(id)_PXFontForComponent_fontCache objectForKey:v68];
      if (v69)
      {
LABEL_77:

        [a1 _sizeOfTitle:v58 withFont:v69];
        double v60 = v76;
        double v59 = v77;

        goto LABEL_78;
      }
      if (v61 < 4)
      {
        if (([@"_PXOverlayButtonComponentCaption" isEqualToString:@"_PXOverlayButtonComponentTitle"] & 1) == 0&& !objc_msgSend(@"_PXOverlayButtonComponentCaption", "isEqualToString:", @"_PXOverlayButtonComponentCaption"))
        {
          goto LABEL_123;
        }
        id v69 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB27B8], 4096);
LABEL_75:
        if (v69)
        {
          [(id)_PXFontForComponent_fontCache setObject:v69 forKey:v68];
          goto LABEL_77;
        }
LABEL_123:
        v139 = [MEMORY[0x1E4F28B00] currentHandler];
        v140 = objc_msgSend(NSString, "stringWithUTF8String:", "UIFont *_PXFontForComponent(__strong _PXOverlayButtonComponent, PXCuratedLibraryOverlayButtonStyle)");
        [v139 handleFailureInFunction:v140 file:@"PXCuratedLibraryOverlayButton.m" lineNumber:183 description:@"Unexpected _PXOverlayButtonComponent passed to PXFontForComponent!"];

        abort();
      }
      v70 = [MEMORY[0x1E4FB1438] sharedApplication];
      v71 = [v70 preferredContentSizeCategory];
      IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v71);

      v73 = (id *)MEMORY[0x1E4FB27B0];
      if (!IsAccessibilityCategory) {
        v73 = (id *)MEMORY[0x1E4FB27C0];
      }
      id v74 = *v73;
      if ([@"_PXOverlayButtonComponentCaption" isEqualToString:@"_PXOverlayButtonComponentTitle"])
      {
        uint64_t v75 = 2;
      }
      else
      {
        if (![@"_PXOverlayButtonComponentCaption" isEqualToString:@"_PXOverlayButtonComponentCaption"])
        {
          id v69 = 0;
          goto LABEL_74;
        }
        uint64_t v75 = 0;
      }
      id v69 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28F0], v74, v75);
LABEL_74:

      goto LABEL_75;
    }
    if (_PXFontForComponent_onceToken != -1) {
      dispatch_once(&_PXFontForComponent_onceToken, &__block_literal_global_732);
    }
    id v43 = objc_alloc((Class)off_1E5DA9660);
    v165 = @"_PXOverlayButtonComponentTitle";
    long long v44 = [MEMORY[0x1E4FB1438] sharedApplication];
    long long v45 = [v44 preferredContentSizeCategory];
    v166 = v45;
    long long v46 = [NSNumber numberWithInteger:v15 - 2 < 4];
    uint64_t v167 = (uint64_t)v46;
    long long v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v165 count:3];
    long long v48 = (void *)[v43 initWithObjects:v47];

    long long v49 = [(id)_PXFontForComponent_fontCache objectForKey:v48];
    if (v49)
    {
LABEL_57:

      [a1 _sizeOfTitle:v159 withFont:v49];
      double v157 = v56;
      double v42 = v57;

      goto LABEL_58;
    }
    if (v15 - 2 < 4)
    {
      if (([@"_PXOverlayButtonComponentTitle" isEqualToString:@"_PXOverlayButtonComponentTitle"] & 1) == 0&& !objc_msgSend(@"_PXOverlayButtonComponentTitle", "isEqualToString:", @"_PXOverlayButtonComponentCaption"))
      {
        goto LABEL_122;
      }
      long long v49 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB27B8], 4096);
LABEL_55:
      if (v49)
      {
        [(id)_PXFontForComponent_fontCache setObject:v49 forKey:v48];
        goto LABEL_57;
      }
LABEL_122:
      v137 = [MEMORY[0x1E4F28B00] currentHandler];
      v138 = objc_msgSend(NSString, "stringWithUTF8String:", "UIFont *_PXFontForComponent(__strong _PXOverlayButtonComponent, PXCuratedLibraryOverlayButtonStyle)");
      [v137 handleFailureInFunction:v138 file:@"PXCuratedLibraryOverlayButton.m" lineNumber:183 description:@"Unexpected _PXOverlayButtonComponent passed to PXFontForComponent!"];

      abort();
    }
    long long v50 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_super v51 = [v50 preferredContentSizeCategory];
    BOOL v52 = UIContentSizeCategoryIsAccessibilityCategory(v51);

    v53 = (id *)MEMORY[0x1E4FB27B0];
    if (!v52) {
      v53 = (id *)MEMORY[0x1E4FB27C0];
    }
    id v54 = *v53;
    if ([@"_PXOverlayButtonComponentTitle" isEqualToString:@"_PXOverlayButtonComponentTitle"])
    {
      uint64_t v55 = 2;
    }
    else
    {
      if (![@"_PXOverlayButtonComponentTitle" isEqualToString:@"_PXOverlayButtonComponentCaption"])
      {
        long long v49 = 0;
        goto LABEL_54;
      }
      uint64_t v55 = 0;
    }
    long long v49 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28F0], v54, v55);
LABEL_54:

    goto LABEL_55;
  }
  if (a3) {
    *a3 = *(CGSize *)MEMORY[0x1E4F1DB30];
  }
  uint64_t v20 = MEMORY[0x1E4F1DB28];
  if (a4)
  {
    CGSize v21 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    a4->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    a4->size = v21;
  }
  if (a5)
  {
    CGSize v22 = *(CGSize *)(v20 + 16);
    a5->origin = *(CGPoint *)v20;
    a5->size = v22;
  }
  if (a6)
  {
    CGSize v23 = *(CGSize *)(v20 + 16);
    a6->origin = *(CGPoint *)v20;
    a6->size = v23;
  }
LABEL_121:
}

double __99__PXCuratedLibraryOverlayButton__getSize_titleFrame_captionFrame_iconFrame_forConfiguration_title___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3)
{
  double MinX = CGRectGetMinX(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  CGFloat v7 = CGRectGetMidY(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32)) + a3 * -0.5;
  v9.origin.double x = MinX;
  v9.origin.double y = v7;
  v9.size.double width = a2;
  v9.size.double height = a3;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectGetMaxX(v9);
  return MinX;
}

uint64_t __99__PXCuratedLibraryOverlayButton__getSize_titleFrame_captionFrame_iconFrame_forConfiguration_title___block_invoke_2(uint64_t a1, __n128 a2)
{
  return (*(uint64_t (**)(__n128, double))(*(void *)(a1 + 32) + 16))(a2, 0.0);
}

+ (id)iconImageSymbolConfigurationFromConfiguration:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_PXIconImageSymbolConfiguration_onceToken != -1) {
    dispatch_once(&_PXIconImageSymbolConfiguration_onceToken, &__block_literal_global_713);
  }
  double v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v5 = [v4 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v5);

  CGFloat v7 = [v3 systemImageName];
  id v8 = objc_alloc((Class)off_1E5DA9660);
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "style"));
  double v10 = (void *)v9;
  if (v7)
  {
    double v11 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", v9);
    id v12 = [v11 preferredContentSizeCategory];
    float v34 = v12;
    double v35 = v7;
    id v13 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v14 = 3;
  }
  else
  {
    double v11 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", v9);
    id v12 = [v11 preferredContentSizeCategory];
    float v34 = v12;
    id v13 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v14 = 2;
  }
  unint64_t v15 = [v13 arrayWithObjects:&v33 count:v14];
  double v16 = (void *)[v8 initWithObjects:v15];

  double v17 = [(id)_PXIconImageSymbolConfiguration_configsCache objectForKey:v16];
  if (!v17)
  {
    switch([v3 style])
    {
      case 0:
      case 1:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 13:
      case 14:
        uint64_t v18 = (id *)MEMORY[0x1E4FB27B0];
        if (!IsAccessibilityCategory) {
          uint64_t v18 = (id *)MEMORY[0x1E4FB27D0];
        }
        id v19 = *v18;
        uint64_t v20 = [v3 spec];
        char v21 = [v20 options];

        CGSize v22 = (id *)MEMORY[0x1E4FB28C8];
        if ((v21 & 4) == 0) {
          CGSize v22 = (id *)MEMORY[0x1E4FB2948];
        }
        id v23 = *v22;
        id v24 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v23, v19, 32770);
        if ((v21 & 4) != 0
          || ([v7 isEqualToString:@"person.fill"] & 1) != 0
          || [v7 isEqualToString:@"person.2.fill"])
        {
          uint64_t v25 = 1;
        }
        else
        {
          uint64_t v25 = 2;
        }
        double v26 = (void *)MEMORY[0x1E4FB1830];
        [v24 pointSize];
        double v17 = objc_msgSend(v26, "configurationWithPointSize:weight:scale:", 6, v25);

        goto LABEL_26;
      case 2:
      case 3:
        objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB27B8], 4096);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        double v27 = (void *)MEMORY[0x1E4FB1830];
        [v19 pointSize];
        float v28 = v27;
        uint64_t v29 = 4;
        goto LABEL_25;
      case 4:
      case 5:
        objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB27B8], 4096);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        float v30 = (void *)MEMORY[0x1E4FB1830];
        [v19 pointSize];
        goto LABEL_24;
      case 12:
        float v31 = (void *)MEMORY[0x1E4FB27B0];
        if (!IsAccessibilityCategory) {
          float v31 = (void *)MEMORY[0x1E4FB27D0];
        }
        objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB2948], *v31, 32770);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        float v30 = (void *)MEMORY[0x1E4FB1830];
        [v19 pointSize];
LABEL_24:
        float v28 = v30;
        uint64_t v29 = 6;
LABEL_25:
        double v17 = objc_msgSend(v28, "configurationWithPointSize:weight:scale:", v29, 3);
LABEL_26:

        break;
      default:
        double v17 = 0;
        break;
    }
    [(id)_PXIconImageSymbolConfiguration_configsCache setObject:v17 forKey:v16];
  }

  return v17;
}

+ (CGSize)sizeWithConfiguration:(id)a3
{
  id v4 = a3;
  double v35 = 0.0;
  double v36 = 0.0;
  double v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  double v6 = [a1 buttonSizeCache];
  CGFloat v7 = [v6 objectForKey:v5];
  if (!v7)
  {
    double v11 = [v4 spec];
    id v12 = [v11 extendedTraitCollection];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if (v13 == 5 && [(id)objc_opt_class() usesButtonSystem])
    {
      uint64_t v14 = objc_alloc_init(PXCuratedLibraryOverlayButton);
      [(PXCuratedLibraryOverlayButton *)v14 setIsSizeCalculationButton:1];
      [(PXCuratedLibraryOverlayButton *)v14 setUserData:v4];
      -[PXCuratedLibraryOverlayButton sizeThatFits:](v14, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v16 = v15;
      double v18 = v17;
      double v35 = v15;
      double v36 = v17;

LABEL_17:
      id v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v16, v18, *(void *)&v35);
      [v6 setObject:v8 forKey:v5];

      goto LABEL_18;
    }
    id v19 = [v4 possibleTitles];
    uint64_t v20 = (void *)[v19 mutableCopy];
    char v21 = v20;
    if (v20) {
      id v22 = v20;
    }
    else {
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    id v23 = v22;

    id v24 = [v4 title];

    if (v24)
    {
      uint64_t v25 = [v4 title];
      [v23 addObject:v25];
    }
    double v26 = [v23 allObjects];
    double v27 = [v26 sortedArrayUsingComparator:&__block_literal_global_487];
    float v28 = [v27 firstObject];

    [a1 _getSize:&v35 titleFrame:0 captionFrame:0 iconFrame:0 forConfiguration:v4 title:v28];
    if ([(id)objc_opt_class() usesButtonSystem])
    {
      uint64_t v29 = [v4 title];
      if (v29)
      {

LABEL_15:
        float v31 = objc_alloc_init(PXCuratedLibraryOverlayButton);
        [(PXCuratedLibraryOverlayButton *)v31 setIsSizeCalculationButton:1];
        [(PXCuratedLibraryOverlayButton *)v31 setUserData:v4];
        -[PXCuratedLibraryOverlayButton sizeThatFits:](v31, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
        double v35 = v32;

        goto LABEL_16;
      }
      float v30 = [v4 caption];

      if (v30) {
        goto LABEL_15;
      }
    }
LABEL_16:

    double v16 = v35;
    double v18 = v36;
    goto LABEL_17;
  }
  id v8 = v7;
  [v7 CGSizeValue];
  double v35 = v9;
  double v36 = v10;
LABEL_18:

  double v33 = v35;
  double v34 = v36;
  result.double height = v34;
  result.double width = v33;
  return result;
}

uint64_t __55__PXCuratedLibraryOverlayButton_sizeWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 sizeWithAttributes:0];
  double v6 = v5;
  [v4 sizeWithAttributes:0];
  double v8 = v7;

  if (v6 > v8) {
    return -1;
  }
  else {
    return v6 < v8;
  }
}

+ (CGSize)_sizeOfTitle:(id)a3 withFont:(id)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [a1 titleSizeCache];
  id v9 = objc_alloc((Class)off_1E5DA9660);
  v25[0] = v6;
  v25[1] = v7;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  double v11 = (void *)[v9 initWithObjects:v10];

  id v12 = [v8 objectForKey:v11];
  if (v12)
  {
    uint64_t v13 = v12;
    [v12 CGSizeValue];
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    uint64_t v23 = *MEMORY[0x1E4FB06F8];
    id v24 = v7;
    double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [v6 sizeWithAttributes:v18];
    double v15 = v19;
    double v17 = v20;

    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v15, v17);
    [v8 setObject:v13 forKey:v11];
  }

  double v21 = v15;
  double v22 = v17;
  result.double height = v22;
  result.double width = v21;
  return result;
}

+ (id)roundedCornerMaskImage:(id)a3 size:(CGSize)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  PXSizeIsEmpty();
}

void __61__PXCuratedLibraryOverlayButton_roundedCornerMaskImage_size___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v1 = (void *)roundedCornerMaskImage_size__cornerMaskCache;
  roundedCornerMaskImage_size__cornerMaskCache = (uint64_t)v0;
}

+ (NSCache)buttonSizeCache
{
  if (buttonSizeCache_onceToken != -1) {
    dispatch_once(&buttonSizeCache_onceToken, &__block_literal_global_477);
  }
  id v2 = (void *)buttonSizeCache_buttonSizeCache;
  return (NSCache *)v2;
}

void __48__PXCuratedLibraryOverlayButton_buttonSizeCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)buttonSizeCache_buttonSizeCache;
  buttonSizeCache_buttonSizeCache = (uint64_t)v0;
}

+ (NSCache)titleSizeCache
{
  if (titleSizeCache_onceToken != -1) {
    dispatch_once(&titleSizeCache_onceToken, &__block_literal_global_475);
  }
  id v2 = (void *)titleSizeCache_titleSizeCache;
  return (NSCache *)v2;
}

void __47__PXCuratedLibraryOverlayButton_titleSizeCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)titleSizeCache_titleSizeCache;
  titleSizeCache_titleSizeCache = (uint64_t)v0;
}

+ (BOOL)usesButtonSystem
{
  return _os_feature_enabled_impl();
}

@end