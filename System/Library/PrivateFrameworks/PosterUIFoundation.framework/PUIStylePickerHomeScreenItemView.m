@interface PUIStylePickerHomeScreenItemView
+ (CGSize)defaultSizeForIconSize:(CGSize)a3;
+ (id)defaultFont;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGSize)iconSize;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (PUIStylePickerHomeScreenItemView)initWithFrame:(CGRect)a3;
- (PUIStylePickerMicaAssetControlling)assetView;
- (UILabel)label;
- (double)iconContinuousCornerRadius;
- (void)_updateColorsForTraitCollectionAnimated:(BOOL)a3;
- (void)_updateHighlightState:(BOOL)a3;
- (void)_updateLayoutConstraints;
- (void)_userInterfaceStyleDidUpdate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setIconContinousCornerRadius:(double)a3;
- (void)setIconContinuousCornerRadius:(double)a3;
- (void)setIconSize:(CGSize)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PUIStylePickerHomeScreenItemView

+ (id)defaultFont
{
  if (defaultFont_onceToken != -1) {
    dispatch_once(&defaultFont_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)defaultFont_defaultFont;
  return v2;
}

void __47__PUIStylePickerHomeScreenItemView_defaultFont__block_invoke()
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F03AE8];
  v5[0] = @".SFUI-Medium";
  v0 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v1 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithAttributesAndOptions();

  CTFontRef v2 = CTFontCreateWithFontDescriptor(v1, 14.0, 0);
  v3 = (void *)defaultFont_defaultFont;
  defaultFont_defaultFont = (uint64_t)v2;
}

- (PUIStylePickerHomeScreenItemView)initWithFrame:(CGRect)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v48.receiver = self;
  v48.super_class = (Class)PUIStylePickerHomeScreenItemView;
  v3 = -[PUIStylePickerHomeScreenItemView initWithFrame:](&v48, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    [(PUIStylePickerHomeScreenItemView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUIStylePickerHomeScreenItemView *)v4 setAutoresizingMask:0];
    uint64_t v5 = objc_opt_new();
    label = v4->_label;
    v4->_label = (UILabel *)v5;

    v4->_iconSize = (CGSize)vdupq_n_s64(0x4050000000000000uLL);
    v7 = -[_PUIStylePickerMicaAssetView initWithFrame:]([_PUIStylePickerMicaAssetView alloc], "initWithFrame:", 0.0, 0.0, v4->_iconSize.width, v4->_iconSize.height);
    assetView = v4->_assetView;
    v4->_assetView = v7;

    uint64_t v9 = objc_opt_new();
    selectedBorderView = v4->_selectedBorderView;
    v4->_selectedBorderView = (UIView *)v9;

    [(UIView *)v4->_selectedBorderView setUserInteractionEnabled:0];
    [(UIView *)v4->_selectedBorderView setAlpha:0.0];
    v11 = [(UIView *)v4->_selectedBorderView layer];
    [v11 setBorderWidth:3.0];

    [(UIView *)v4->_selectedBorderView _setContinuousCornerRadius:18.0];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v51[0] = v4->_label;
    v51[1] = v4->_assetView;
    v51[2] = v4->_selectedBorderView;
    v12 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v51, 3, 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v45 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
          [(PUIStylePickerHomeScreenItemView *)v4 addSubview:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v14);
    }

    v18 = [(id)objc_opt_class() defaultFont];
    [(UILabel *)v4->_label setFont:v18];
    [(UILabel *)v4->_label setTextAlignment:1];
    [(UILabel *)v4->_label setLineBreakMode:4];
    [(UILabel *)v4->_label setNumberOfLines:2];
    v19 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v20 = [v19 userInterfaceIdiom];

    if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      double v21 = 89.6;
    }
    else
    {
      v22 = [MEMORY[0x263F1C920] mainScreen];
      [v22 bounds];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;

      v54.origin.x = v24;
      v54.origin.y = v26;
      v54.size.width = v28;
      v54.size.height = v30;
      double Width = CGRectGetWidth(v54);
      v55.origin.x = v24;
      v55.origin.y = v26;
      v55.size.width = v28;
      v55.size.height = v30;
      double Height = CGRectGetHeight(v55);
      if (Width < Height) {
        double Height = Width;
      }
      BOOL v33 = Height < 375.0;
      double v21 = 80.0;
      if (v33) {
        double v21 = 73.6;
      }
    }
    [(UILabel *)v4->_label setPreferredMaxLayoutWidth:v21];
    [(PUIStylePickerHomeScreenItemView *)v4 _updateColorsForTraitCollectionAnimated:0];
    v34 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B48]];
    id v35 = [MEMORY[0x263F1C550] blackColor];
    objc_msgSend(v34, "setValue:forKey:", objc_msgSend(v35, "CGColor"), @"inputColor");

    [v34 setName:@"selectionFilter"];
    [v34 setValue:&unk_27081B4A0 forKey:@"inputAmount"];
    v36 = [(_PUIStylePickerMicaAssetView *)v4->_assetView layer];
    v50 = v34;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
    [v36 setFilters:v37];

    v38 = [(_PUIStylePickerMicaAssetView *)v4->_assetView layer];
    [v38 setAllowsGroupOpacity:0];

    v39 = self;
    v49 = v39;
    v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
    uint64_t v41 = [(PUIStylePickerHomeScreenItemView *)v4 registerForTraitChanges:v40 withAction:sel__userInterfaceStyleDidUpdate_];
    traitChangeRegistration = v4->_traitChangeRegistration;
    v4->_traitChangeRegistration = (UITraitChangeRegistration *)v41;
  }
  return v4;
}

- (void)_userInterfaceStyleDidUpdate:(id)a3
{
}

- (void)_updateColorsForTraitCollectionAnimated:(BOOL)a3
{
  BOOL v26 = a3;
  uint64_t v4 = [(PUIStylePickerHomeScreenItemView *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];
  v6 = [MEMORY[0x263F1C550] blackColor];
  v7 = [v6 colorWithAlphaComponent:0.08];

  v8 = [MEMORY[0x263F1C550] blackColor];
  uint64_t v9 = [MEMORY[0x263F1C550] blackColor];
  v10 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D50]];
  if (v5 == 2)
  {
    v11 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v12 = [v11 colorWithAlphaComponent:0.08];

    uint64_t v13 = [MEMORY[0x263F1C550] whiteColor];

    uint64_t v14 = [MEMORY[0x263F1C550] whiteColor];

    uint64_t v15 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];

    v10 = (void *)v15;
    uint64_t v9 = (void *)v14;
    v8 = (void *)v13;
    v7 = (void *)v12;
  }
  BOOL selected = self->_selected;
  v17 = self->_label;
  v18 = self->_selectedBorderView;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __76__PUIStylePickerHomeScreenItemView__updateColorsForTraitCollectionAnimated___block_invoke;
  v27[3] = &unk_2654716C0;
  CGFloat v28 = v18;
  id v19 = v7;
  id v29 = v19;
  id v20 = v10;
  id v30 = v20;
  v31 = v17;
  BOOL v34 = selected;
  id v21 = v8;
  id v32 = v21;
  id v22 = v9;
  id v33 = v22;
  double v23 = v17;
  CGFloat v24 = v18;
  double v25 = (void *)MEMORY[0x25A2F6090](v27);
  if (v26) {
    [MEMORY[0x263F1CB60] animateWithDuration:6 delay:v25 options:0 animations:0.3 completion:0.0];
  }
  else {
    [MEMORY[0x263F1CB60] performWithoutAnimation:v25];
  }
}

uint64_t __76__PUIStylePickerHomeScreenItemView__updateColorsForTraitCollectionAnimated___block_invoke(uint64_t a1)
{
  CTFontRef v2 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(*(id *)(a1 + 40), "CGColor"));

  v3 = [*(id *)(a1 + 32) layer];
  [v3 setCompositingFilter:*(void *)(a1 + 48)];

  uint64_t v4 = [*(id *)(a1 + 56) layer];
  [v4 setCompositingFilter:*(void *)(a1 + 48)];

  uint64_t v5 = *(void **)(a1 + 56);
  if (*(unsigned char *)(a1 + 80))
  {
    [v5 setAlpha:0.65];
    v6 = (void *)(a1 + 64);
    double v7 = 1.0;
  }
  else
  {
    [v5 setAlpha:0.4];
    v6 = (void *)(a1 + 72);
    double v7 = 0.0;
  }
  [*(id *)(a1 + 56) setTextColor:*v6];
  v8 = *(void **)(a1 + 32);
  return [v8 setAlpha:v7];
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUIStylePickerHomeScreenItemView;
  -[PUIStylePickerHomeScreenItemView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3)
  {
    [(PUIStylePickerHomeScreenItemView *)self invalidateIntrinsicContentSize];
    [(PUIStylePickerHomeScreenItemView *)self _updateLayoutConstraints];
  }
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setIconSize:(CGSize)a3
{
  if (self->_iconSize.width != a3.width || self->_iconSize.height != a3.height)
  {
    self->_iconSize = a3;
    -[_PUIStylePickerMicaAssetView setIconSize:](self->_assetView, "setIconSize:");
    [(PUIStylePickerHomeScreenItemView *)self invalidateIntrinsicContentSize];
    [(PUIStylePickerHomeScreenItemView *)self _updateLayoutConstraints];
  }
}

- (void)setIconContinousCornerRadius:(double)a3
{
  if (self->_iconContinuousCornerRadius != a3)
  {
    self->_iconContinuousCornerRadius = a3;
    -[_PUIStylePickerMicaAssetView _setContinuousCornerRadius:](self->_assetView, "_setContinuousCornerRadius:");
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_selected != a3)
  {
    self->_BOOL selected = a3;
    [(PUIStylePickerHomeScreenItemView *)self _updateColorsForTraitCollectionAnimated:a4];
  }
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_highlighted != a3)
  {
    BOOL v4 = a4;
    int v5 = a3;
    v7.receiver = self;
    v7.super_class = (Class)PUIStylePickerHomeScreenItemView;
    -[PUIStylePickerHomeScreenItemView setHighlighted:](&v7, sel_setHighlighted_);
    self->_highlighted = v5;
    [(PUIStylePickerHomeScreenItemView *)self _updateHighlightState:v4 & ~v5];
  }
}

- (void)_updateHighlightState:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(_PUIStylePickerMicaAssetView *)self->_assetView layer];
  if (self->_highlighted) {
    int v5 = &unk_27081B4B0;
  }
  else {
    int v5 = &unk_27081B4A0;
  }
  if (v3)
  {
    v6 = [MEMORY[0x263F15760] animationWithKeyPath:@"filters.selectionFilter.inputAmount"];
    objc_super v7 = [v8 valueForKeyPath:@"filters.selectionFilter.inputAmount"];
    [v6 setFromValue:v7];

    [v6 setToValue:v5];
    [v6 setDuration:0.3];
    [v8 addAnimation:v6 forKey:@"filters.selectionFilter.inputAmount"];
  }
  [v8 setValue:v5 forKeyPath:@"filters.selectionFilter.inputAmount"];
}

+ (CGSize)defaultSizeForIconSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  int v5 = [(id)objc_opt_class() defaultFont];
  [v5 lineHeight];
  double v7 = height + v6 + 7.0;

  double v8 = width;
  double v9 = v7;
  result.double height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(PUIStylePickerHomeScreenItemView *)self iconSize];
  double v3 = v2;
  double v5 = v4;
  double v6 = objc_opt_class();
  objc_msgSend(v6, "defaultSizeForIconSize:", v3, v5);
  result.double height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  [(PUIStylePickerHomeScreenItemView *)self iconSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = objc_opt_class();
  objc_msgSend(v9, "defaultSizeForIconSize:", v6, v8);
  result.double height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)_updateLayoutConstraints
{
  v47[3] = *MEMORY[0x263EF8340];
  if (self->_knownConstraints)
  {
    objc_msgSend(MEMORY[0x263F08938], "deactivateConstraints:");
    knownConstraints = self->_knownConstraints;
    self->_knownConstraints = 0;
  }
  [(PUIStylePickerHomeScreenItemView *)self iconSize];
  double v5 = v4;
  double v7 = v6;
  objc_msgSend((id)objc_opt_class(), "defaultSizeForIconSize:", v4, v6);
  double v9 = v8;
  double v10 = objc_opt_new();
  v47[0] = &unk_27081B4C0;
  v46[0] = @"interitemSpacing";
  v46[1] = @"minAssetViewWidth";
  double v11 = [NSNumber numberWithDouble:v5];
  v47[1] = v11;
  v46[2] = @"minAssetViewHeight";
  uint64_t v12 = [NSNumber numberWithDouble:v7];
  v47[2] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];

  uint64_t v14 = self->_assetView;
  uint64_t v15 = self->_label;
  v16 = self->_selectedBorderView;
  v17 = _NSDictionaryOfVariableBindings(&cfstr_AssetviewLabel.isa, v14, v15, 0);
  v18 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[assetView]-interitemSpacing-[label]|" options:512 metrics:v13 views:v17];
  [v10 addObjectsFromArray:v18];

  long long v45 = (void *)v13;
  id v19 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[assetView]|" options:512 metrics:v13 views:v17];
  [v10 addObjectsFromArray:v19];

  id v20 = [(UILabel *)v15 widthAnchor];
  id v21 = [v20 constraintGreaterThanOrEqualToConstant:v5];
  [v10 addObject:v21];

  id v22 = [(UILabel *)v15 centerXAnchor];
  double v23 = [(PUIStylePickerHomeScreenItemView *)self centerXAnchor];
  CGFloat v24 = [v22 constraintEqualToAnchor:v23];
  [v10 addObject:v24];

  double v25 = [(_PUIStylePickerMicaAssetView *)v14 heightAnchor];
  BOOL v26 = [v25 constraintEqualToConstant:v7];
  [v10 addObject:v26];

  double v27 = [(_PUIStylePickerMicaAssetView *)v14 widthAnchor];
  CGFloat v28 = [v27 constraintEqualToConstant:v5];
  [v10 addObject:v28];

  id v29 = [(PUIStylePickerHomeScreenItemView *)self heightAnchor];
  id v30 = [v29 constraintGreaterThanOrEqualToConstant:v9];
  [v10 addObject:v30];

  v31 = [(PUIStylePickerHomeScreenItemView *)self widthAnchor];
  id v32 = [v31 constraintGreaterThanOrEqualToConstant:v5];
  [v10 addObject:v32];

  id v33 = [(UIView *)v16 heightAnchor];
  BOOL v34 = [v33 constraintGreaterThanOrEqualToConstant:v7 + 10.0];
  [v10 addObject:v34];

  id v35 = [(UIView *)v16 widthAnchor];
  v36 = [v35 constraintGreaterThanOrEqualToConstant:v5 + 10.0];
  [v10 addObject:v36];

  v37 = [(UIView *)v16 centerXAnchor];
  v38 = [(_PUIStylePickerMicaAssetView *)v14 centerXAnchor];
  v39 = [v37 constraintEqualToAnchor:v38];
  [v10 addObject:v39];

  v40 = [(UIView *)v16 centerYAnchor];
  uint64_t v41 = [(_PUIStylePickerMicaAssetView *)v14 centerYAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  [v10 addObject:v42];

  if (![(NSArray *)self->_knownConstraints isEqualToArray:v10])
  {
    [MEMORY[0x263F08938] activateConstraints:v10];
    [(PUIStylePickerHomeScreenItemView *)self invalidateIntrinsicContentSize];
    v43 = (NSArray *)[v10 copy];
    long long v44 = self->_knownConstraints;
    self->_knownConstraints = v43;
  }
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (PUIStylePickerMicaAssetControlling)assetView
{
  return (PUIStylePickerMicaAssetControlling *)self->_assetView;
}

- (double)iconContinuousCornerRadius
{
  return self->_iconContinuousCornerRadius;
}

- (void)setIconContinuousCornerRadius:(double)a3
{
  self->_iconContinuousCornerRadius = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_selectedBorderView, 0);
  objc_storeStrong((id *)&self->_labelAssetViewMarginConstraint, 0);
  objc_storeStrong((id *)&self->_knownConstraints, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
}

@end