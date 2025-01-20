@interface _UIContextMenuCellContentView
- (BOOL)_hasTrailingAccessory;
- (BOOL)isEmphasized;
- (BOOL)needsConstraintRebuild;
- (BOOL)needsHoverStyleUpdate;
- (BOOL)shouldHighlightOnHover;
- (CGSize)_maxImageSize;
- (NSLayoutConstraint)nonSymbolImageHeight;
- (NSLayoutConstraint)nonSymbolImageWidth;
- (UIButton)accessoryButton;
- (UIImageView)decorationImageView;
- (UIImageView)emphasizediconImageView;
- (UIImageView)iconImageView;
- (UILabel)emphasizedTitleLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UISPasteVariant)pasteVariant;
- (UIShape)contentShape;
- (UIStackView)labelStackView;
- (UIView)iconView;
- (_UIContextMenuCellContentView)initWithFrame:(CGRect)a3;
- (_UIContextMenuCellLayout)layout;
- (_UISlotView)securePasteButtonSlotView;
- (id)_childIndicatorColorForCurrentState;
- (id)_childIndicatorImage;
- (id)_contentImageViewForImage:(id)a3;
- (id)_decorationSymbolImageConfiguration;
- (id)_iconSymbolConfigurationForCurrentTraitsUsingBoldFont:(BOOL)a3;
- (id)_mixedSelectionImage;
- (id)_primaryCompositingFilterForCurrentTraitsAndState;
- (id)_primaryContentColorForCurrentState;
- (id)_primaryTitleLabel;
- (id)_selectionImage;
- (id)_subtitleLabelFilterForCurrentTraitsAndState;
- (id)_subtitleTextColor;
- (int64_t)_resolvedLineLimit;
- (int64_t)_subtitleLabelRenderingMode;
- (int64_t)focusStyle;
- (int64_t)overrideNumberOfSubtitleLines;
- (int64_t)overrideNumberOfTitleLines;
- (int64_t)selectedIconBehavior;
- (unint64_t)controlState;
- (unint64_t)measuredNumberOfSubTitleLines;
- (unint64_t)measuredNumberOfTitleLines;
- (unint64_t)numberOfTitleLines;
- (unint64_t)options;
- (unsigned)_secureName;
- (void)_createLabelStackViewIfNeeded;
- (void)_hideContents;
- (void)_inheritRelevantPropertiesFromContentView:(id)a3;
- (void)_installSubtitleLabelIfNeeded;
- (void)_installTitleLabelIfNeeded;
- (void)_setDecorationImage:(id)a3;
- (void)_setNeedsConstraintRebuild;
- (void)_updateAppearanceForStateChange;
- (void)_updateAttachedConstraintsForViewHierarchyChange;
- (void)_updateCompositingFiltersForCurrentState;
- (void)_updateForOptionsChangeFromPreviousOptions:(unint64_t)a3;
- (void)_updateHoverStyleIfNeeded;
- (void)_updateIconImageAppearanceForStateChange;
- (void)_updateLabelsForCurrentState;
- (void)_updateSecureView;
- (void)_updateSubtitleLabelNumberOfLines;
- (void)_updateTitleLabelNumberOfLines;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessoryAction:(id)a3;
- (void)setAccessoryButton:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setControlState:(unint64_t)a3;
- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4;
- (void)setDecorationImageView:(id)a3;
- (void)setEmphasizedTitleLabel:(id)a3;
- (void)setEmphasizediconImageView:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsEmphasized:(BOOL)a3;
- (void)setLayoutClass:(Class)a3;
- (void)setNeedsConstraintRebuild:(BOOL)a3;
- (void)setNeedsHoverStyleUpdate:(BOOL)a3;
- (void)setNonSymbolImageHeight:(id)a3;
- (void)setNonSymbolImageWidth:(id)a3;
- (void)setNumberOfTitleLines:(unint64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setOverrideNumberOfSubtitleLines:(int64_t)a3;
- (void)setOverrideNumberOfTitleLines:(int64_t)a3;
- (void)setPasteVariant:(id)a3;
- (void)setSecurePasteButtonSlotView:(id)a3;
- (void)setSelectedIconBehavior:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateConstraints;
@end

@implementation _UIContextMenuCellContentView

- (_UIContextMenuCellContentView)initWithFrame:(CGRect)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_UIContextMenuCellContentView;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    [v5 setAllowsGroupBlending:0];

    v6 = [(UIView *)v4 layer];
    [v6 setAllowsGroupOpacity:0];

    [(UIView *)v4 setTintAdjustmentMode:1];
    [(_UIContextMenuCellContentView *)v4 setOverrideNumberOfTitleLines:-1];
    [(_UIContextMenuCellContentView *)v4 setOverrideNumberOfSubtitleLines:-1];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    id v8 = [(UIView *)v4 registerForTraitChanges:v7 withAction:sel__updateCompositingFiltersForCurrentState];

    uint64_t v13 = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    id v10 = [(UIView *)v4 registerForTraitChanges:v9 withAction:sel__updateLabelsForCurrentState];
  }
  return v4;
}

- (void)setLayoutClass:(Class)a3
{
  v5 = [(_UIContextMenuCellContentView *)self layout];
  v6 = (objc_class *)objc_opt_class();

  if (v6 != a3)
  {
    [(UIView *)self setHoverStyle:0];
    [(_UIContextMenuCellLayout *)self->_layout removeConstraints];
    v7 = (_UIContextMenuCellLayout *)[[a3 alloc] initWithContentView:self];
    layout = self->_layout;
    self->_layout = v7;

    v9 = [(_UIContextMenuCellContentView *)self _iconSymbolConfigurationForCurrentTraitsUsingBoldFont:0];
    id v10 = [(_UIContextMenuCellContentView *)self iconImageView];
    [v10 _setOverridingSymbolConfiguration:v9];

    [(_UIContextMenuCellContentView *)self _setNeedsConstraintRebuild];
    [(_UIContextMenuCellContentView *)self setNeedsHoverStyleUpdate:1];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)_UIContextMenuCellContentView;
  [(UIView *)&v3 didMoveToWindow];
  [(_UIContextMenuCellContentView *)self setNeedsHoverStyleUpdate:1];
  [(_UIContextMenuCellContentView *)self _updateHoverStyleIfNeeded];
}

- (UIView)iconView
{
  objc_super v3 = [(_UIContextMenuCellContentView *)self accessoryButton];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_UIContextMenuCellContentView *)self iconImageView];
  }
  v6 = v5;

  return (UIView *)v6;
}

- (BOOL)shouldHighlightOnHover
{
  v2 = [(_UIContextMenuCellContentView *)self layout];
  objc_super v3 = [v2 hoverStyle];
  BOOL v4 = v3 == 0;

  return v4;
}

- (int64_t)focusStyle
{
  v2 = [(_UIContextMenuCellContentView *)self layout];
  int64_t v3 = [v2 focusStyle];

  return v3;
}

- (UIShape)contentShape
{
  v2 = [(_UIContextMenuCellContentView *)self layout];
  int64_t v3 = [v2 contentShape];

  return (UIShape *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuCellContentView *)self titleLabel];
  v6 = [v5 text];
  char v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42___UIContextMenuCellContentView_setTitle___block_invoke;
    v8[3] = &unk_1E52D9F98;
    id v9 = v4;
    id v10 = self;
    +[UIView performWithoutAnimation:v8];
  }
}

- (void)setAttributedTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuCellContentView *)self titleLabel];
  v6 = [v5 attributedText];
  char v7 = [v4 isEqualToAttributedString:v6];

  if ((v7 & 1) == 0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52___UIContextMenuCellContentView_setAttributedTitle___block_invoke;
    v8[3] = &unk_1E52D9F98;
    id v9 = v4;
    id v10 = self;
    +[UIView performWithoutAnimation:v8];
  }
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuCellContentView *)self subtitleLabel];
  v6 = [v5 text];
  char v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45___UIContextMenuCellContentView_setSubtitle___block_invoke;
    v8[3] = &unk_1E52D9F98;
    id v9 = v4;
    id v10 = self;
    +[UIView performWithoutAnimation:v8];
  }
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuCellContentView *)self iconImageView];
  v6 = [v5 image];
  char v7 = [v4 isEqual:v6];

  if (v7)
  {
    id v8 = [(_UIContextMenuCellContentView *)self iconImageView];

    if (v8) {
      [(_UIContextMenuCellContentView *)self _setNeedsConstraintRebuild];
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42___UIContextMenuCellContentView_setImage___block_invoke;
    v9[3] = &unk_1E52D9F98;
    id v10 = v4;
    v11 = self;
    +[UIView performWithoutAnimation:v9];
  }
}

- (void)setAccessoryAction:(id)a3
{
  id v12 = a3;
  id v4 = [(_UIContextMenuCellContentView *)self accessoryButton];
  if (v12)
  {

    if (!v4)
    {
      id v5 = +[UIButton systemButtonWithPrimaryAction:v12];
      [(_UIContextMenuCellContentView *)self setAccessoryButton:v5];

      v6 = [(_UIContextMenuCellContentView *)self _primaryContentColorForCurrentState];
      char v7 = [(_UIContextMenuCellContentView *)self accessoryButton];
      [v7 setTintColor:v6];

      id v8 = [(_UIContextMenuCellContentView *)self _iconSymbolConfigurationForCurrentTraitsUsingBoldFont:0];
      id v9 = [(_UIContextMenuCellContentView *)self accessoryButton];
      id v10 = [v9 imageView];
      [v10 setPreferredSymbolConfiguration:v8];

      v11 = [(_UIContextMenuCellContentView *)self accessoryButton];
      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    }
  }
  else
  {
    [v4 removeFromSuperview];

    [(_UIContextMenuCellContentView *)self setAccessoryButton:0];
  }
  [(_UIContextMenuCellContentView *)self setImage:0];
  [(_UIContextMenuCellContentView *)self _setNeedsConstraintRebuild];
}

- (void)_setDecorationImage:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuCellContentView *)self decorationImageView];
  v6 = [v5 image];
  char v7 = [v4 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53___UIContextMenuCellContentView__setDecorationImage___block_invoke;
    v8[3] = &unk_1E52D9F98;
    id v9 = v4;
    id v10 = self;
    +[UIView performWithoutAnimation:v8];
  }
}

- (void)_setNeedsConstraintRebuild
{
  [(_UIContextMenuCellContentView *)self setNeedsConstraintRebuild:1];
  [(UIView *)self setNeedsUpdateConstraints];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIContextMenuCellContentView;
  [(UIView *)&v3 layoutSubviews];
  [(_UIContextMenuCellContentView *)self _updateSecureView];
  [(_UIContextMenuCellContentView *)self _updateHoverStyleIfNeeded];
}

- (void)setOptions:(unint64_t)a3
{
  unint64_t options = self->_options;
  if (options != a3)
  {
    self->_unint64_t options = a3;
    [(_UIContextMenuCellContentView *)self _updateForOptionsChangeFromPreviousOptions:options];
  }
}

- (void)_updateForOptionsChangeFromPreviousOptions:(unint64_t)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke;
  aBlock[3] = &unk_1E52FBD68;
  aBlock[4] = self;
  aBlock[5] = a3;
  id v4 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
  int v5 = v4[2](v4, 1);
  if (v5) {
    BOOL v6 = self->_pasteVariant != 0;
  }
  else {
    BOOL v6 = 0;
  }
  int v7 = v4[2](v4, 2);
  if (v4[2](v4, 4))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke_2;
    v12[3] = &unk_1E52D9F70;
    v12[4] = self;
    id v8 = v12;
    goto LABEL_8;
  }
  if (v4[2](v4, 8))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke_3;
    v11[3] = &unk_1E52D9F70;
    v11[4] = self;
    id v8 = v11;
LABEL_8:
    +[UIView performWithoutAnimation:v8];
    BOOL v6 = 1;
    if (![(_UIContextMenuCellContentView *)self _hasTrailingAccessory]) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  [(_UIContextMenuCellContentView *)self _hasTrailingAccessory];
LABEL_11:
  if (v4[2](v4, 16))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke_4;
    v10[3] = &unk_1E52D9F70;
    v10[4] = self;
    +[UIView performWithoutAnimation:v10];
    BOOL v6 = 1;
  }
LABEL_13:
  int v9 = v7 | v5;
  if (v4[2](v4, 64)) {
    [(_UIContextMenuCellContentView *)self setIsEmphasized:([(_UIContextMenuCellContentView *)self options] >> 6) & 1];
  }
  if (v9) {
    [(_UIContextMenuCellContentView *)self _updateAppearanceForStateChange];
  }
  if (v6) {
    [(_UIContextMenuCellContentView *)self _setNeedsConstraintRebuild];
  }
  if (v5)
  {
    [(_UIContextMenuCellContentView *)self setNeedsHoverStyleUpdate:1];
    [(_UIContextMenuCellContentView *)self _updateHoverStyleIfNeeded];
  }
}

- (void)_updateHoverStyleIfNeeded
{
  objc_super v3 = [(UIView *)self window];
  if (v3)
  {
    id v8 = v3;
    if ([(_UIContextMenuCellContentView *)self needsHoverStyleUpdate])
    {
      BOOL v4 = [(_UIContextMenuCellContentView *)self needsConstraintRebuild];

      if (v4) {
        return;
      }
      int v5 = [(_UIContextMenuCellContentView *)self layout];
      id v8 = [v5 hoverStyle];

      [(UIView *)self setHoverStyle:v8];
      BOOL v6 = ([(_UIContextMenuCellContentView *)self options] & 1) == 0;
      int v7 = [(UIView *)self hoverStyle];
      [v7 setEnabled:v6];

      [(_UIContextMenuCellContentView *)self setNeedsHoverStyleUpdate:0];
    }
    objc_super v3 = v8;
  }
}

- (void)setNumberOfTitleLines:(unint64_t)a3
{
  if (self->_numberOfTitleLines != a3)
  {
    self->_numberOfTitleLines = a3;
    [(_UIContextMenuCellContentView *)self _updateTitleLabelNumberOfLines];
    [(_UIContextMenuCellContentView *)self _updateSubtitleLabelNumberOfLines];
  }
}

- (unint64_t)measuredNumberOfTitleLines
{
  v2 = [(_UIContextMenuCellContentView *)self titleLabel];
  unint64_t v3 = [v2 _measuredNumberOfLines];

  return v3;
}

- (unint64_t)measuredNumberOfSubTitleLines
{
  v2 = [(_UIContextMenuCellContentView *)self subtitleLabel];
  unint64_t v3 = [v2 _measuredNumberOfLines];

  return v3;
}

- (void)_inheritRelevantPropertiesFromContentView:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    -[_UIContextMenuCellContentView setOverrideNumberOfTitleLines:](self, "setOverrideNumberOfTitleLines:", [v4 measuredNumberOfTitleLines]);
    uint64_t v5 = [v6 measuredNumberOfSubTitleLines];
  }
  else
  {
    uint64_t v5 = -1;
    [(_UIContextMenuCellContentView *)self setOverrideNumberOfTitleLines:-1];
  }
  [(_UIContextMenuCellContentView *)self setOverrideNumberOfSubtitleLines:v5];
  [(_UIContextMenuCellContentView *)self _updateTitleLabelNumberOfLines];
  [(_UIContextMenuCellContentView *)self _updateSubtitleLabelNumberOfLines];
}

- (void)_hideContents
{
  unint64_t v3 = [(_UIContextMenuCellContentView *)self titleLabel];
  [v3 setAlpha:0.0];

  id v4 = [(_UIContextMenuCellContentView *)self subtitleLabel];
  [v4 setAlpha:0.0];

  uint64_t v5 = [(_UIContextMenuCellContentView *)self decorationImageView];
  [v5 setAlpha:0.0];

  id v6 = [(_UIContextMenuCellContentView *)self iconImageView];
  [v6 setAlpha:0.0];
}

- (void)prepareForReuse
{
  unint64_t v3 = [(_UIContextMenuCellContentView *)self pasteVariant];

  if (v3)
  {
    id v4 = [(_UIContextMenuCellContentView *)self titleLabel];
    [v4 setAlpha:1.0];

    uint64_t v5 = [(_UIContextMenuCellContentView *)self subtitleLabel];
    [v5 setAlpha:1.0];

    id v6 = [(_UIContextMenuCellContentView *)self decorationImageView];
    [v6 setAlpha:1.0];

    int v7 = [(_UIContextMenuCellContentView *)self iconImageView];
    [v7 setAlpha:1.0];

    [(_UIContextMenuCellContentView *)self setPasteVariant:0];
    p_securePasteButtonSlotView = &self->_securePasteButtonSlotView;
    id WeakRetained = objc_loadWeakRetained((id *)p_securePasteButtonSlotView);
    [WeakRetained removeFromSuperview];

    objc_storeWeak((id *)p_securePasteButtonSlotView, 0);
  }
}

- (void)_updateSecureView
{
  if (self->_pasteVariant)
  {
    char v3 = [(_UIContextMenuCellContentView *)self options];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
    uint64_t v5 = WeakRetained;
    if (v3)
    {
      [WeakRetained removeFromSuperview];

      objc_storeWeak((id *)&self->_securePasteButtonSlotView, 0);
    }
    else
    {

      if (v5)
      {
        id v6 = (_UISlotView *)objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
      }
      else
      {
        id v6 = objc_alloc_init(_UISlotView);
        objc_storeWeak((id *)&self->_securePasteButtonSlotView, v6);
      }
      [(UIView *)self bounds];
      double v8 = v7;
      double v10 = v9;
      [(UIView *)self->_labelStackView frame];
      double v12 = v11;
      if ([(UIView *)self _shouldReverseLayoutDirection])
      {
        [(UIView *)self->_labelStackView frame];
        double v14 = v8 - v13;
        [(UIView *)self->_labelStackView frame];
        double v12 = v14 - v15;
      }
      unint64_t v16 = ([(_UIContextMenuCellContentView *)self options] >> 5) & 1;
      v17 = (void *)MEMORY[0x1E4F881E0];
      v18 = [(_UIContextMenuCellContentView *)self pasteVariant];
      uint64_t v19 = [v18 secureName];
      [(UIView *)self->_labelStackView frame];
      double v21 = v20;
      v22 = [(_UIContextMenuCellContentView *)self layout];
      v23 = objc_msgSend(v17, "contextMenuPasteButtonTagWithSecureName:size:titleOrigin:layoutSize:hasTrailingGutter:", v19, objc_msgSend(v22, "layoutSize"), v16, v8 + -2.0, v10 + -2.0, v12, v21);

      objc_initWeak(&location, self);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __50___UIContextMenuCellContentView__updateSecureView__block_invoke;
      v32[3] = &unk_1E52DDC40;
      id v24 = v23;
      id v33 = v24;
      [(_UISlotView *)v6 _setSlotStyleResolver:v32];
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __50___UIContextMenuCellContentView__updateSecureView__block_invoke_2;
      v29 = &unk_1E52DDCB8;
      id v25 = v24;
      id v30 = v25;
      objc_copyWeak(&v31, &location);
      [(_UISlotView *)v6 _setSlotAnyContentProvider:&v26];
      -[_UISlotView _overlayView:centerInView:](v6, "_overlayView:centerInView:", self, self, v26, v27, v28, v29);
      objc_destroyWeak(&v31);

      objc_destroyWeak(&location);
    }
  }
}

- (void)setPasteVariant:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (v5)
  {
    id v6 = [v5 localizedStringForLocalization:0];
    [(_UIContextMenuCellContentView *)self setTitle:v6];

    [(_UIContextMenuCellContentView *)self setSubtitle:0];
    double v7 = [v10 glyph];
    double v8 = +[UIImage systemImageNamed:v7];
    [(_UIContextMenuCellContentView *)self setImage:v8];

    objc_storeStrong((id *)&self->_pasteVariant, a3);
    [(UIView *)self setNeedsLayout];
  }
  else
  {
    pasteVariant = self->_pasteVariant;
    self->_pasteVariant = 0;
  }
}

- (unsigned)_secureName
{
  pasteVariant = self->_pasteVariant;
  if (pasteVariant) {
    LODWORD(pasteVariant) = [(UISPasteVariant *)pasteVariant secureName];
  }
  return pasteVariant;
}

- (void)_createLabelStackViewIfNeeded
{
  char v3 = [(_UIContextMenuCellContentView *)self labelStackView];

  if (!v3)
  {
    id v4 = (UIStackView *)objc_opt_new();
    [(UIStackView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4 setBaselineRelativeArrangement:1];
    [(UIStackView *)v4 setAxis:1];
    [(UIStackView *)v4 setSpacing:20.0];
    id v5 = [(UIView *)v4 layer];
    [v5 setAllowsGroupBlending:0];

    labelStackView = self->_labelStackView;
    self->_labelStackView = v4;

    [(_UIContextMenuCellContentView *)self _setNeedsConstraintRebuild];
  }
}

- (void)_installTitleLabelIfNeeded
{
  char v3 = [(_UIContextMenuCellContentView *)self titleLabel];

  if (!v3)
  {
    id v4 = [(_UIContextMenuCellContentView *)self _primaryTitleLabel];
    titleLabel = self->_titleLabel;
    self->_titleLabel = v4;

    id v7 = [(_UIContextMenuCellContentView *)self labelStackView];
    id v6 = [(_UIContextMenuCellContentView *)self titleLabel];
    [v7 insertArrangedSubview:v6 atIndex:0];
  }
}

- (id)_primaryTitleLabel
{
  char v3 = [UILabel alloc];
  id v4 = -[UILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v4 setAllowsDefaultTighteningForTruncation:1];
  [(UILabel *)v4 setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)v4 setMinimumScaleFactor:0.9];
  LODWORD(v5) = 0.5;
  [(UILabel *)v4 _setHyphenationFactor:v5];
  id v6 = [(UIView *)self traitCollection];
  id v7 = _UIContextMenuGetPlatformMetrics([v6 userInterfaceIdiom]);
  double v8 = [v7 titleFont];
  double v9 = [v8 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v6];

  [(UILabel *)v4 setFont:v9];
  id v10 = [(_UIContextMenuCellContentView *)self _primaryContentColorForCurrentState];
  [(UILabel *)v4 setTextColor:v10];

  double v11 = [(_UIContextMenuCellContentView *)self _primaryCompositingFilterForCurrentTraitsAndState];
  double v12 = [(UIView *)v4 layer];
  [v12 setCompositingFilter:v11];

  return v4;
}

- (void)_installSubtitleLabelIfNeeded
{
  char v3 = [(_UIContextMenuCellContentView *)self subtitleLabel];

  if (!v3)
  {
    id v4 = [UILabel alloc];
    double v5 = -[UILabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5 setAllowsDefaultTighteningForTruncation:1];
    [(UILabel *)v5 setAdjustsFontForContentSizeCategory:1];
    LODWORD(v6) = 0.5;
    [(UILabel *)v5 _setHyphenationFactor:v6];
    id v7 = [(UIView *)self traitCollection];
    double v8 = _UIContextMenuGetPlatformMetrics([v7 userInterfaceIdiom]);
    double v9 = [v8 subtitleFont];
    id v10 = [v9 _fontAdjustedForCurrentContentSizeCategory];

    [(UILabel *)v5 setFont:v10];
    double v11 = [(_UIContextMenuCellContentView *)self _subtitleTextColor];
    [(UILabel *)v5 setTextColor:v11];

    [(UIView *)v5 _setOverrideUserInterfaceRenderingMode:[(_UIContextMenuCellContentView *)self _subtitleLabelRenderingMode]];
    double v12 = [(_UIContextMenuCellContentView *)self _subtitleLabelFilterForCurrentTraitsAndState];
    double v13 = [(UIView *)v5 layer];
    [v13 setCompositingFilter:v12];

    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v5;

    [(_UIContextMenuCellContentView *)self _updateSubtitleLabelNumberOfLines];
    id v16 = [(_UIContextMenuCellContentView *)self labelStackView];
    double v15 = [(_UIContextMenuCellContentView *)self subtitleLabel];
    [v16 addArrangedSubview:v15];
  }
}

- (id)_contentImageViewForImage:(id)a3
{
  id v4 = a3;
  double v5 = [[UIImageView alloc] initWithImage:v4];
  [(UIImageView *)v5 setContentMode:1];
  [(UIImageView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v6 = [(_UIContextMenuCellContentView *)self _primaryContentColorForCurrentState];
  [(UIView *)v5 setTintColor:v6];

  int v7 = [v4 isSymbolImage];
  if (v7)
  {
    double v8 = [(_UIContextMenuCellContentView *)self _primaryCompositingFilterForCurrentTraitsAndState];
  }
  else
  {
    double v8 = 0;
  }
  double v9 = [(UIView *)v5 layer];
  [v9 setCompositingFilter:v8];

  if (v7) {
  return v5;
  }
}

- (void)_updateAttachedConstraintsForViewHierarchyChange
{
  v24[2] = *MEMORY[0x1E4F143B8];
  char v3 = [(_UIContextMenuCellContentView *)self layout];
  [v3 removeConstraints];

  id v4 = [(_UIContextMenuCellContentView *)self nonSymbolImageWidth];
  [v4 setActive:0];

  double v5 = [(_UIContextMenuCellContentView *)self nonSymbolImageHeight];
  [v5 setActive:0];

  double v6 = [(_UIContextMenuCellContentView *)self layout];
  [v6 installConstraints];

  int v7 = [(_UIContextMenuCellContentView *)self iconView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v9 = [(_UIContextMenuCellContentView *)self iconView];
    id v10 = [v9 image];
    char v11 = [v10 isSymbolImage];

    if ((v11 & 1) == 0)
    {
      [(_UIContextMenuCellContentView *)self _maxImageSize];
      double v13 = v12;
      double v15 = v14;
      id v16 = [v9 widthAnchor];
      v17 = [v16 constraintLessThanOrEqualToConstant:v13];
      [(_UIContextMenuCellContentView *)self setNonSymbolImageWidth:v17];

      v18 = [v9 heightAnchor];
      uint64_t v19 = [v18 constraintLessThanOrEqualToConstant:v15];
      [(_UIContextMenuCellContentView *)self setNonSymbolImageHeight:v19];

      double v20 = (void *)MEMORY[0x1E4F5B268];
      double v21 = [(_UIContextMenuCellContentView *)self nonSymbolImageWidth];
      v24[0] = v21;
      v22 = [(_UIContextMenuCellContentView *)self nonSymbolImageHeight];
      v24[1] = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      [v20 activateConstraints:v23];
    }
  }
  [(UIView *)self setNeedsUpdateConstraints];
}

- (void)_updateAppearanceForStateChange
{
  id v21 = [(_UIContextMenuCellContentView *)self _primaryContentColorForCurrentState];
  char v3 = [(_UIContextMenuCellContentView *)self titleLabel];
  [v3 setTextColor:v21];

  id v4 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
  [v4 setTextColor:v21];

  double v5 = [(_UIContextMenuCellContentView *)self _childIndicatorColorForCurrentState];
  double v6 = [(_UIContextMenuCellContentView *)self decorationImageView];
  [v6 setTintColor:v5];

  int v7 = [(_UIContextMenuCellContentView *)self iconImageView];
  [v7 setTintColor:v21];

  [(_UIContextMenuCellContentView *)self _updateIconImageAppearanceForStateChange];
  double v8 = [(_UIContextMenuCellContentView *)self emphasizediconImageView];
  [v8 setTintColor:v21];

  double v9 = [(_UIContextMenuCellContentView *)self accessoryButton];
  id v10 = [v9 imageView];
  [v10 setTintColor:v21];

  char v11 = [(_UIContextMenuCellContentView *)self layout];
  double v12 = [v11 preferredBackgroundColorForCurrentState];

  if (v12)
  {
    [(UIView *)self setBackgroundColor:v12];
  }
  else
  {
    unint64_t v13 = [(_UIContextMenuCellContentView *)self options];
    double v14 = [(UIView *)self traitCollection];
    uint64_t v15 = [v14 userInterfaceIdiom];
    unint64_t v16 = [(_UIContextMenuCellContentView *)self controlState];
    v17 = _UIContextMenuGetPlatformMetrics(v15);
    uint64_t v18 = [v17 itemBackgroundColorProvider];
    uint64_t v19 = (void *)v18;
    if (v18)
    {
      double v20 = (*(void (**)(uint64_t, unint64_t, unint64_t))(v18 + 16))(v18, v16, (v13 >> 1) & 1);
    }
    else
    {
      double v20 = 0;
    }

    [(UIView *)self setBackgroundColor:v20];
  }
}

- (void)_updateIconImageAppearanceForStateChange
{
  id v12 = [(_UIContextMenuCellContentView *)self iconImageView];
  char v3 = [v12 image];
  if ([v3 isSymbolImage])
  {
    id v4 = [(_UIContextMenuCellContentView *)self iconImageView];
    double v5 = [v4 image];
    int v6 = [v5 _isColoredSymbolImage];

    if (!v6) {
      return;
    }
    int v7 = [(UIView *)self traitCollection];
    _UIContextMenuGetPlatformMetrics([v7 userInterfaceIdiom]);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    char v3 = [v12 itemColoredSymbolImageUserInterfaceStyleOverrideProvider];
    if (v3)
    {
      uint64_t v8 = v3[2](v3, [(_UIContextMenuCellContentView *)self controlState], ([(_UIContextMenuCellContentView *)self options] >> 1) & 1);
      double v9 = [(_UIContextMenuCellContentView *)self iconImageView];
      id v10 = -[UIView _internalTraitOverrides](v9);
      char v11 = v10;
      if (v8) {
        [v10 setUserInterfaceStyle:v8];
      }
      else {
        [v10 _removeTraitToken:0x1ED3F5A48];
      }
    }
  }
}

- (void)updateConstraints
{
  if ([(_UIContextMenuCellContentView *)self needsConstraintRebuild])
  {
    [(_UIContextMenuCellContentView *)self setNeedsConstraintRebuild:0];
    [(_UIContextMenuCellContentView *)self _updateAttachedConstraintsForViewHierarchyChange];
    uint64_t v3 = [(_UIContextMenuCellContentView *)self emphasizediconImageView];
    if (v3)
    {
      id v4 = (void *)v3;
      double v5 = [(_UIContextMenuCellContentView *)self emphasizediconImageView];
      int v6 = [v5 window];

      if (!v6)
      {
        int v7 = [(_UIContextMenuCellContentView *)self iconImageView];
        uint64_t v8 = [v7 superview];
        double v9 = [(_UIContextMenuCellContentView *)self emphasizediconImageView];
        id v10 = [(_UIContextMenuCellContentView *)self iconImageView];
        [v8 insertSubview:v9 aboveSubview:v10];
      }
    }
    char v11 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
    id v12 = [v11 leadingAnchor];
    unint64_t v13 = [(_UIContextMenuCellContentView *)self labelStackView];
    double v14 = [v13 leadingAnchor];
    uint64_t v15 = [v12 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    unint64_t v16 = [(_UIContextMenuCellContentView *)self iconImageView];
    v17 = [v16 superview];

    if (v17)
    {
      uint64_t v18 = [(UIView *)self traitCollection];
      uint64_t v19 = _UIContextMenuGetPlatformMetrics([v18 userInterfaceIdiom]);
      [v19 minIntraItemSpacing];
      double v21 = v20;

      v22 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
      v23 = [v22 trailingAnchor];
      id v24 = [(_UIContextMenuCellContentView *)self iconImageView];
      id v25 = [v24 leadingAnchor];
      uint64_t v26 = [v23 constraintEqualToAnchor:v25 constant:-v21];
      [v26 setActive:1];

      uint64_t v27 = [(_UIContextMenuCellContentView *)self emphasizediconImageView];
      v28 = [v27 centerXAnchor];
      v29 = [(_UIContextMenuCellContentView *)self iconImageView];
      id v30 = [v29 centerXAnchor];
      id v31 = [v28 constraintEqualToAnchor:v30];
      [v31 setActive:1];

      v32 = [(_UIContextMenuCellContentView *)self emphasizediconImageView];
      id v33 = [v32 centerYAnchor];
      v34 = [(_UIContextMenuCellContentView *)self iconImageView];
      [v34 centerYAnchor];
    }
    else
    {
      v32 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
      id v33 = [v32 trailingAnchor];
      v34 = [(_UIContextMenuCellContentView *)self labelStackView];
      [v34 trailingAnchor];
    v35 = };
    v36 = [v33 constraintEqualToAnchor:v35];
    [v36 setActive:1];

    v37 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
    v38 = [v37 firstBaselineAnchor];
    v39 = [(_UIContextMenuCellContentView *)self labelStackView];
    v40 = [v39 firstBaselineAnchor];
    v41 = [v38 constraintEqualToAnchor:v40];
    [v41 setActive:1];
  }
  v42 = [(_UIContextMenuCellContentView *)self nonSymbolImageWidth];

  if (v42)
  {
    [(_UIContextMenuCellContentView *)self _maxImageSize];
    double v44 = v43;
    double v46 = v45;
    v47 = [(_UIContextMenuCellContentView *)self nonSymbolImageWidth];
    [v47 setConstant:v44];

    v48 = [(_UIContextMenuCellContentView *)self nonSymbolImageHeight];
    [v48 setConstant:v46];
  }
  v49 = [(_UIContextMenuCellContentView *)self layout];
  [v49 updateConstraints];

  v50.receiver = self;
  v50.super_class = (Class)_UIContextMenuCellContentView;
  [(UIView *)&v50 updateConstraints];
}

- (void)setIsEmphasized:(BOOL)a3
{
  if (self->_isEmphasized != a3)
  {
    self->_isEmphasized = a3;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __49___UIContextMenuCellContentView_setIsEmphasized___block_invoke;
    v48[3] = &unk_1E52D9F70;
    v48[4] = self;
    +[UIView performWithoutAnimation:v48];
    if (self->_isEmphasized) {
      double v4 = 0.0;
    }
    else {
      double v4 = 1.0;
    }
    double v5 = [(_UIContextMenuCellContentView *)self titleLabel];
    [v5 setAlpha:v4];

    if (self->_isEmphasized) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
    int v7 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
    [v7 setAlpha:v6];

    uint64_t v8 = [(_UIContextMenuCellContentView *)self titleLabel];
    uint64_t v9 = [v8 numberOfLines];
    id v10 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
    [v10 setNumberOfLines:v9];

    if (self->_isEmphasized) {
      double v11 = 0.0;
    }
    else {
      double v11 = 1.0;
    }
    id v12 = [(_UIContextMenuCellContentView *)self iconImageView];
    [v12 setAlpha:v11];

    if (self->_isEmphasized) {
      double v13 = 1.0;
    }
    else {
      double v13 = 0.0;
    }
    double v14 = [(_UIContextMenuCellContentView *)self emphasizediconImageView];
    [v14 setAlpha:v13];

    if (([(_UIContextMenuCellContentView *)self options] & 0x10) != 0)
    {
      if (([(_UIContextMenuCellContentView *)self options] & 4) != 0)
      {
        if (self->_isEmphasized) {
          double v18 = 0.0;
        }
        else {
          double v18 = 1.0;
        }
        uint64_t v19 = [(_UIContextMenuCellContentView *)self decorationImageView];
        [v19 setAlpha:v18];
      }
      else
      {
        if (self->_isEmphasized)
        {
          uint64_t v15 = [(UIView *)self superview];
          unint64_t v16 = [v15 layer];
          if ([v16 flipsHorizontalAxis]) {
            double v17 = -1.57079633;
          }
          else {
            double v17 = 1.57079633;
          }
        }
        else
        {
          double v17 = 0.0;
        }
        CGAffineTransformMakeRotation(&v47, v17);
        uint64_t v19 = [(_UIContextMenuCellContentView *)self decorationImageView];
        CGAffineTransform v46 = v47;
        [v19 setTransform:&v46];
      }
    }
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v45.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v45.c = v20;
    *(_OWORD *)&v45.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v44.a = *(_OWORD *)&v45.a;
    *(_OWORD *)&v44.c = v20;
    *(_OWORD *)&v44.tx = *(_OWORD *)&v45.tx;
    double v21 = [(_UIContextMenuCellContentView *)self titleLabel];
    v22 = [(_UIContextMenuCellContentView *)self titleLabel];
    [v22 bounds];
    objc_msgSend(v21, "sizeThatFits:", v23, v24);
    double v26 = v25;

    uint64_t v27 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
    v28 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
    [v28 bounds];
    objc_msgSend(v27, "sizeThatFits:", v29, v30);
    double v32 = v31;

    UIUserInterfaceLayoutDirection v33 = [(UIView *)self effectiveUserInterfaceLayoutDirection];
    if (self->_isEmphasized)
    {
      v34 = [(_UIContextMenuCellContentView *)self titleLabel];
      [v34 bounds];
      double v35 = CGRectGetWidth(v51) * -0.5;
      if (v33 == UIUserInterfaceLayoutDirectionRightToLeft) {
        double v36 = -v35;
      }
      else {
        double v36 = v35;
      }
      memset(&v43, 0, sizeof(v43));
      CGAffineTransformMakeTranslation(&v43, v36, 0.0);
      CGAffineTransform v49 = v43;
      CGAffineTransformScale(&v50, &v49, v32 / v26, 1.0);
      *(_OWORD *)&v43.c = *(_OWORD *)&v50.c;
      *(_OWORD *)&v43.tx = *(_OWORD *)&v50.tx;
      *(_OWORD *)&v43.a = *(_OWORD *)&v50.a;
      CGAffineTransform v49 = v50;
      CGAffineTransformTranslate(&v50, &v49, -v36, 0.0);
      *(_OWORD *)&v43.tx = *(_OWORD *)&v50.tx;
      CGAffineTransform v45 = v50;
    }
    else
    {
      v34 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
      [v34 bounds];
      double v37 = CGRectGetWidth(v52) * -0.5;
      if (v33 == UIUserInterfaceLayoutDirectionRightToLeft) {
        double v38 = -v37;
      }
      else {
        double v38 = v37;
      }
      memset(&v43, 0, sizeof(v43));
      CGAffineTransformMakeTranslation(&v43, v38, 0.0);
      CGAffineTransform v49 = v43;
      CGAffineTransformScale(&v50, &v49, v26 / v32, 1.0);
      *(_OWORD *)&v43.c = *(_OWORD *)&v50.c;
      *(_OWORD *)&v43.tx = *(_OWORD *)&v50.tx;
      *(_OWORD *)&v43.a = *(_OWORD *)&v50.a;
      CGAffineTransform v49 = v50;
      CGAffineTransformTranslate(&v50, &v49, -v38, 0.0);
      *(_OWORD *)&v43.tx = *(_OWORD *)&v50.tx;
      CGAffineTransform v44 = v50;
    }

    v39 = [(_UIContextMenuCellContentView *)self titleLabel];
    CGAffineTransform v42 = v45;
    [v39 setTransform:&v42];

    v40 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
    CGAffineTransform v41 = v44;
    [v40 setTransform:&v41];
  }
}

- (void)setControlState:(unint64_t)a3
{
}

- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a4;
  self->_controlState = a3;
  [(_UIContextMenuCellContentView *)self _updateCompositingFiltersForCurrentState];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74___UIContextMenuCellContentView_setControlState_withAnimationCoordinator___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  int v7 = _Block_copy(aBlock);
  uint64_t v8 = v7;
  if (v6) {
    [v6 addCoordinatedAnimations:v7 completion:0];
  }
  else {
    (*((void (**)(void *))v7 + 2))(v7);
  }
  uint64_t v9 = [(_UIContextMenuCellContentView *)self layout];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(_UIContextMenuCellContentView *)self layout];
    [v11 setControlState:a3 withAnimationCoordinator:v6];
  }
}

- (void)_updateCompositingFiltersForCurrentState
{
  id v25 = [(_UIContextMenuCellContentView *)self _primaryCompositingFilterForCurrentTraitsAndState];
  uint64_t v3 = [(_UIContextMenuCellContentView *)self titleLabel];
  double v4 = [v3 layer];
  [v4 setCompositingFilter:v25];

  double v5 = [(_UIContextMenuCellContentView *)self _subtitleLabelFilterForCurrentTraitsAndState];
  id v6 = [(_UIContextMenuCellContentView *)self subtitleLabel];
  int v7 = [v6 layer];
  [v7 setCompositingFilter:v5];

  uint64_t v8 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
  uint64_t v9 = [v8 layer];
  [v9 setCompositingFilter:v25];

  char v10 = [(_UIContextMenuCellContentView *)self iconImageView];
  double v11 = [v10 image];
  if ([v11 isSymbolImage]) {
    id v12 = v25;
  }
  else {
    id v12 = 0;
  }
  double v13 = [(_UIContextMenuCellContentView *)self iconImageView];
  double v14 = [v13 layer];
  [v14 setCompositingFilter:v12];

  uint64_t v15 = [(_UIContextMenuCellContentView *)self emphasizediconImageView];
  unint64_t v16 = [v15 image];
  if ([v16 isSymbolImage]) {
    id v17 = v25;
  }
  else {
    id v17 = 0;
  }
  double v18 = [(_UIContextMenuCellContentView *)self emphasizediconImageView];
  uint64_t v19 = [v18 layer];
  [v19 setCompositingFilter:v17];

  long long v20 = [(_UIContextMenuCellContentView *)self decorationImageView];
  double v21 = [v20 image];
  if ([v21 isSymbolImage]) {
    id v22 = v25;
  }
  else {
    id v22 = 0;
  }
  double v23 = [(_UIContextMenuCellContentView *)self decorationImageView];
  double v24 = [v23 layer];
  [v24 setCompositingFilter:v22];
}

- (void)_updateLabelsForCurrentState
{
  [(_UIContextMenuCellContentView *)self _updateTitleLabelNumberOfLines];
  [(_UIContextMenuCellContentView *)self _updateSubtitleLabelNumberOfLines];
  uint64_t v3 = [(_UIContextMenuCellContentView *)self _iconSymbolConfigurationForCurrentTraitsUsingBoldFont:0];
  double v4 = [(_UIContextMenuCellContentView *)self iconImageView];
  [v4 _setOverridingSymbolConfiguration:v3];

  [(UIView *)self setNeedsUpdateConstraints];
}

- (id)_primaryCompositingFilterForCurrentTraitsAndState
{
  uint64_t v3 = [(UIView *)self traitCollection];
  double v4 = _UIContextMenuGetPlatformMetrics([v3 userInterfaceIdiom]);

  double v5 = [v4 itemPrimaryCompositingFilterProvider];
  if (v5)
  {
    id v6 = [v4 itemPrimaryCompositingFilterProvider];
    int v7 = [(UIView *)self traitCollection];
    uint64_t v8 = ((void (**)(void, void *, unint64_t))v6)[2](v6, v7, [(_UIContextMenuCellContentView *)self controlState]);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_subtitleLabelFilterForCurrentTraitsAndState
{
  uint64_t v3 = [(UIView *)self traitCollection];
  double v4 = _UIContextMenuGetPlatformMetrics([v3 userInterfaceIdiom]);

  double v5 = [v4 itemSubtitleCompositingFilterProvider];
  if (v5)
  {
    id v6 = [v4 itemSubtitleCompositingFilterProvider];
    int v7 = [(UIView *)self traitCollection];
    uint64_t v8 = ((void (**)(void, void *, unint64_t))v6)[2](v6, v7, [(_UIContextMenuCellContentView *)self controlState]);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (int64_t)_subtitleLabelRenderingMode
{
  v2 = [(UIView *)self traitCollection];
  uint64_t v3 = _UIContextMenuGetPlatformMetrics([v2 userInterfaceIdiom]);

  int64_t v4 = [v3 itemSubtitleRenderingMode];
  return v4;
}

- (void)_updateTitleLabelNumberOfLines
{
  uint64_t v3 = [(_UIContextMenuCellContentView *)self titleLabel];
  if (v3)
  {
    id v13 = v3;
    int64_t v4 = [(_UIContextMenuCellContentView *)self _resolvedLineLimit];
    if (([(_UIContextMenuCellContentView *)self overrideNumberOfTitleLines] & 0x8000000000000000) == 0) {
      int64_t v4 = [(_UIContextMenuCellContentView *)self overrideNumberOfTitleLines];
    }
    [v13 setNumberOfLines:v4];
    [v13 setAdjustsFontSizeToFitWidth:v4 == 1];
    double v5 = [(_UIContextMenuCellContentView *)self layout];
    objc_msgSend(v13, "setTextAlignment:", objc_msgSend(v5, "labelTextAlignment"));

    id v6 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];

    uint64_t v3 = v13;
    if (v6)
    {
      uint64_t v7 = [v13 textAlignment];
      uint64_t v8 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
      [v8 setTextAlignment:v7];

      uint64_t v9 = [v13 numberOfLines];
      char v10 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
      [v10 setNumberOfLines:v9];

      uint64_t v11 = [v13 adjustsFontSizeToFitWidth];
      id v12 = [(_UIContextMenuCellContentView *)self emphasizedTitleLabel];
      [v12 setAdjustsFontSizeToFitWidth:v11];

      uint64_t v3 = v13;
    }
  }
}

- (void)_updateSubtitleLabelNumberOfLines
{
  uint64_t v3 = [(_UIContextMenuCellContentView *)self subtitleLabel];
  if (v3)
  {
    id v5 = v3;
    int64_t v4 = [(_UIContextMenuCellContentView *)self _resolvedLineLimit];
    if (([(_UIContextMenuCellContentView *)self overrideNumberOfSubtitleLines] & 0x8000000000000000) == 0) {
      int64_t v4 = [(_UIContextMenuCellContentView *)self overrideNumberOfSubtitleLines];
    }
    [v5 setNumberOfLines:v4];
    uint64_t v3 = v5;
  }
}

- (int64_t)_resolvedLineLimit
{
  if ([(_UIContextMenuCellContentView *)self numberOfTitleLines] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = [(UIView *)self traitCollection];
    int64_t v4 = [v3 preferredContentSizeCategory];
    int IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v4, v5);

    if (IsAccessibilityContentSizeCategory) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = 2;
    }
  }
  else
  {
    unint64_t v7 = [(_UIContextMenuCellContentView *)self numberOfTitleLines];
  }
  uint64_t v8 = [(_UIContextMenuCellContentView *)self layout];
  unint64_t v9 = [v8 labelMaximumNumberOfLines];

  if (v7 >= v9) {
    return v9;
  }
  else {
    return v7;
  }
}

- (id)_iconSymbolConfigurationForCurrentTraitsUsingBoldFont:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIContextMenuCellContentView *)self layout];
  id v6 = [v5 preferredIconFontUsingBoldFont:v3];

  unint64_t v7 = [(UIView *)self traitCollection];
  uint64_t v8 = [v7 preferredContentSizeCategory];
  int IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v8, v9);

  if (IsAccessibilityContentSizeCategory) {
    +[UIImageSymbolConfiguration configurationWithFont:v6 scale:1];
  }
  else {
  uint64_t v11 = +[UIImageSymbolConfiguration configurationWithFont:v6];
  }

  return v11;
}

- (id)_primaryContentColorForCurrentState
{
  BOOL v3 = [(_UIContextMenuCellContentView *)self layout];
  int64_t v4 = [v3 preferredContentColorForCurrentState];

  if (v4)
  {
    id v5 = v4;
LABEL_8:
    char v10 = v5;
    goto LABEL_9;
  }
  id v6 = [(UIView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ([(_UIContextMenuCellContentView *)self options])
  {
    _UIContextMenuItemPrimaryColor(v7, [(_UIContextMenuCellContentView *)self controlState] | 2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  char v8 = [(_UIContextMenuCellContentView *)self options];
  uint64_t v9 = [(_UIContextMenuCellContentView *)self controlState];
  if ((v8 & 2) != 0)
  {
    double v18 = _UIContextMenuGetPlatformMetrics(v7);
    uint64_t v19 = [v18 itemPrimaryDestructiveColorProvider];
    long long v20 = (void *)v19;
    if (v19)
    {
      char v10 = (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, v9);
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = _UIContextMenuItemPrimaryColor(v7, v9);
    uint64_t v11 = _UIContextMenuGetPlatformMetrics(v7);
    [v11 itemPrimaryAlpha];
    double v13 = v12;

    if (v13 < 1.0)
    {
      [v10 alphaComponent];
      id v15 = [v10 colorWithAlphaComponent:v13 * v14];
      goto LABEL_10;
    }
  }
LABEL_9:
  id v15 = v10;
  char v10 = v15;
LABEL_10:
  unint64_t v16 = v15;

  return v16;
}

- (id)_childIndicatorColorForCurrentState
{
  if (![(_UIContextMenuCellContentView *)self _hasTrailingAccessory]) {
    goto LABEL_3;
  }
  BOOL v3 = [(UIView *)self traitCollection];
  int64_t v4 = _UIContextMenuGetPlatformMetrics([v3 userInterfaceIdiom]);
  id v5 = [v4 trailingAccessoryColor];

  if (!v5)
  {
LABEL_3:
    id v5 = [(_UIContextMenuCellContentView *)self _primaryContentColorForCurrentState];
  }
  return v5;
}

- (id)_subtitleTextColor
{
  v2 = [(UIView *)self traitCollection];
  BOOL v3 = _UIContextMenuGetPlatformMetrics([v2 userInterfaceIdiom]);

  int64_t v4 = [v3 itemSubtitleColor];

  return v4;
}

- (CGSize)_maxImageSize
{
  BOOL v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  id v5 = [(_UIContextMenuCellContentView *)self titleLabel];
  id v6 = [v5 font];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = [(UIView *)self traitCollection];
    char v10 = _UIContextMenuGetPlatformMetrics([v9 userInterfaceIdiom]);
    uint64_t v11 = [v10 titleFont];
    id v8 = [v11 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v9];
  }
  double v12 = _UIContextMenuGetPlatformMetrics(v4);
  [v12 dynamicImageBoxWidth];
  double v14 = v13;

  [v8 _scaledValueForValue:v14];
  UIRoundToViewScale(self);
  double v16 = v15;
  id v17 = _UIContextMenuGetPlatformMetrics(v4);
  [v17 itemTopToFirstBaseline];
  double v19 = v18;

  long long v20 = _UIContextMenuGetPlatformMetrics(v4);
  [v20 itemLastBaselineToBottom];
  double v22 = v21;

  [v8 _scaledValueForValue:v19 + v22];
  UIRoundToViewScale(self);
  double v24 = v23 + -12.0;

  double v25 = v16;
  double v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

- (id)_decorationSymbolImageConfiguration
{
  v2 = [(UIView *)self traitCollection];
  BOOL v3 = _UIContextMenuGetPlatformMetrics([v2 userInterfaceIdiom]);
  uint64_t v4 = [v3 decorationViewSymbolConfiguration];

  return v4;
}

- (id)_selectionImage
{
  v2 = [(_UIContextMenuCellContentView *)self _decorationSymbolImageConfiguration];
  BOOL v3 = +[UIImage systemImageNamed:@"checkmark" withConfiguration:v2];

  return v3;
}

- (id)_mixedSelectionImage
{
  v2 = [(_UIContextMenuCellContentView *)self _decorationSymbolImageConfiguration];
  BOOL v3 = +[UIImage systemImageNamed:@"minus" withConfiguration:v2];

  return v3;
}

- (id)_childIndicatorImage
{
  if (([(_UIContextMenuCellContentView *)self options] & 0x20) != 0) {
    +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleEmphasizedFootnote" scale:1];
  }
  else {
  BOOL v3 = [(_UIContextMenuCellContentView *)self _decorationSymbolImageConfiguration];
  }
  uint64_t v4 = +[UIImage systemImageNamed:@"chevron.forward" withConfiguration:v3];

  return v4;
}

- (BOOL)_hasTrailingAccessory
{
  return (~[(_UIContextMenuCellContentView *)self options] & 0x30) == 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)selectedIconBehavior
{
  return self->_selectedIconBehavior;
}

- (void)setSelectedIconBehavior:(int64_t)a3
{
  self->_selectedIconBehavior = a3;
}

- (unint64_t)numberOfTitleLines
{
  return self->_numberOfTitleLines;
}

- (UIImageView)decorationImageView
{
  return self->_decorationImageView;
}

- (void)setDecorationImageView:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
}

- (UILabel)emphasizedTitleLabel
{
  return self->_emphasizedTitleLabel;
}

- (void)setEmphasizedTitleLabel:(id)a3
{
}

- (UIImageView)emphasizediconImageView
{
  return self->_emphasizediconImageView;
}

- (void)setEmphasizediconImageView:(id)a3
{
}

- (NSLayoutConstraint)nonSymbolImageWidth
{
  return self->_nonSymbolImageWidth;
}

- (void)setNonSymbolImageWidth:(id)a3
{
}

- (NSLayoutConstraint)nonSymbolImageHeight
{
  return self->_nonSymbolImageHeight;
}

- (void)setNonSymbolImageHeight:(id)a3
{
}

- (BOOL)needsHoverStyleUpdate
{
  return self->_needsHoverStyleUpdate;
}

- (void)setNeedsHoverStyleUpdate:(BOOL)a3
{
  self->_needsHoverStyleUpdate = a3;
}

- (BOOL)needsConstraintRebuild
{
  return self->_needsConstraintRebuild;
}

- (void)setNeedsConstraintRebuild:(BOOL)a3
{
  self->_needsConstraintRebuild = a3;
}

- (BOOL)isEmphasized
{
  return self->_isEmphasized;
}

- (unint64_t)controlState
{
  return self->_controlState;
}

- (_UISlotView)securePasteButtonSlotView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
  return (_UISlotView *)WeakRetained;
}

- (void)setSecurePasteButtonSlotView:(id)a3
{
}

- (int64_t)overrideNumberOfTitleLines
{
  return self->_overrideNumberOfTitleLines;
}

- (void)setOverrideNumberOfTitleLines:(int64_t)a3
{
  self->_overrideNumberOfTitleLines = a3;
}

- (int64_t)overrideNumberOfSubtitleLines
{
  return self->_overrideNumberOfSubtitleLines;
}

- (void)setOverrideNumberOfSubtitleLines:(int64_t)a3
{
  self->_overrideNumberOfSubtitleLines = a3;
}

- (_UIContextMenuCellLayout)layout
{
  return self->_layout;
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UISPasteVariant)pasteVariant
{
  return self->_pasteVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteVariant, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_securePasteButtonSlotView);
  objc_storeStrong((id *)&self->_nonSymbolImageHeight, 0);
  objc_storeStrong((id *)&self->_nonSymbolImageWidth, 0);
  objc_storeStrong((id *)&self->_emphasizediconImageView, 0);
  objc_storeStrong((id *)&self->_emphasizedTitleLabel, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_decorationImageView, 0);
}

@end