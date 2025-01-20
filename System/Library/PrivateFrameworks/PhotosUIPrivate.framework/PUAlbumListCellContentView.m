@interface PUAlbumListCellContentView
- (BOOL)_showsTitleAndSubtitle;
- (BOOL)combinesPhotoDecorations;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isEditing;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)shouldCenterTextHorizontally;
- (BOOL)showsCheckmarkView;
- (BOOL)showsDeleteButtonWhenEditing;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)topInsetEnabled;
- (BOOL)usesLabelForTitle;
- (CGPoint)_deleteButtonCenter;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)subtitle;
- (NSString)title;
- (PUAlbumListCellContentView)initWithFrame:(CGRect)a3;
- (PUAlbumListCellDelegate)delegate;
- (PUStackView)stackView;
- (PXFocusInfo)focusInfo;
- (PXUIButton)_deleteButton;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (UILabel)_subtitleLabel;
- (UILabel)_titleLabel;
- (UITextField)_titleTextField;
- (UIView)checkmarkView;
- (UIView)customImageView;
- (UIView)springLoadingTargetView;
- (double)_titleFieldAlpha;
- (double)xInset;
- (int64_t)_titleTextFieldClearButtonModeForLayout:(int64_t)a3;
- (int64_t)layout;
- (unint64_t)editCapabilities;
- (void)_deleteAction:(id)a3;
- (void)_setDeleteButton:(id)a3;
- (void)_setShowsTitleAndSubtitle:(BOOL)a3;
- (void)_setStackView:(id)a3;
- (void)_setSubtitleLabel:(id)a3;
- (void)_setTitleLabel:(id)a3;
- (void)_setTitleTextField:(id)a3;
- (void)_updateCheckmarkView;
- (void)_updateDeleteButtonAnimated:(BOOL)a3;
- (void)_updateStackViewAnimated:(BOOL)a3;
- (void)_updateSubtitleLabelAnimated:(BOOL)a3;
- (void)_updateSubtitleLabelStyle;
- (void)_updateSubviewOrdering;
- (void)_updateTitleFieldAnimated:(BOOL)a3;
- (void)_updateTitleStyle;
- (void)cancelPerformRetitleAction;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCheckmarkView:(id)a3;
- (void)setCombinesPhotoDecorations:(BOOL)a3;
- (void)setCustomImageView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditCapabilities:(unint64_t)a3;
- (void)setEditCapabilities:(unint64_t)a3 animated:(BOOL)a4;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setLayout:(int64_t)a3;
- (void)setShouldCenterTextHorizontally:(BOOL)a3;
- (void)setShowsCheckmarkView:(BOOL)a3;
- (void)setShowsDeleteButtonWhenEditing:(BOOL)a3;
- (void)setShowsTitle:(BOOL)a3 animated:(BOOL)a4;
- (void)setSubtitle:(id)a3;
- (void)setSubtitle:(id)a3 animated:(BOOL)a4;
- (void)setSubtitleFont:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTopInsetEnabled:(BOOL)a3;
- (void)setUsesLabelForTitle:(BOOL)a3;
- (void)setXInset:(double)a3;
- (void)startPerformRetitleAction;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation PUAlbumListCellContentView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__deleteButton, 0);
  objc_storeStrong((id *)&self->__subtitleLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->__titleTextField, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_customImageView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)usesLabelForTitle
{
  return self->_usesLabelForTitle;
}

- (void)_setDeleteButton:(id)a3
{
}

- (PXUIButton)_deleteButton
{
  return self->__deleteButton;
}

- (void)_setSubtitleLabel:(id)a3
{
}

- (UILabel)_subtitleLabel
{
  return self->__subtitleLabel;
}

- (void)_setTitleLabel:(id)a3
{
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (void)_setTitleTextField:(id)a3
{
}

- (UITextField)_titleTextField
{
  return self->__titleTextField;
}

- (void)_setShowsTitleAndSubtitle:(BOOL)a3
{
  self->__showsTitleAndSubtitle = a3;
}

- (BOOL)_showsTitleAndSubtitle
{
  return self->__showsTitleAndSubtitle;
}

- (void)setCheckmarkView:(id)a3
{
}

- (UIView)checkmarkView
{
  return self->_checkmarkView;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (BOOL)showsDeleteButtonWhenEditing
{
  return self->_showsDeleteButtonWhenEditing;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (unint64_t)editCapabilities
{
  return self->_editCapabilities;
}

- (int64_t)layout
{
  return self->_layout;
}

- (double)xInset
{
  return self->_xInset;
}

- (BOOL)shouldCenterTextHorizontally
{
  return self->_shouldCenterTextHorizontally;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (UIView)customImageView
{
  return self->_customImageView;
}

- (BOOL)showsCheckmarkView
{
  return self->_showsCheckmarkView;
}

- (void)setTopInsetEnabled:(BOOL)a3
{
  self->_topInsetEnabled = a3;
}

- (BOOL)topInsetEnabled
{
  return self->_topInsetEnabled;
}

- (BOOL)combinesPhotoDecorations
{
  return self->_combinesPhotoDecorations;
}

- (void)_setStackView:(id)a3
{
}

- (PUStackView)stackView
{
  return self->_stackView;
}

- (void)setDelegate:(id)a3
{
}

- (PUAlbumListCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUAlbumListCellDelegate *)WeakRetained;
}

- (void)_updateSubtitleLabelStyle
{
  id v8 = [(PUAlbumListCellContentView *)self _subtitleLabel];
  int64_t layout = self->_layout;
  BOOL v4 = [(PUAlbumListCellContentView *)self shouldCenterTextHorizontally];
  if (v8)
  {
    if (v4) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 4;
    }
    [v8 setTextAlignment:v5];
    v6 = [(PUAlbumListCellContentView *)self subtitleFont];
    [v8 setFont:v6];

    v7 = +[PUInterfaceManager currentTheme];
    [v7 configureAlbumListSubtitleLabel:v8 asOpaque:layout == 0];

    [v8 setAdjustsFontSizeToFitWidth:0];
    [v8 _setWantsContentAwareTypesettingLanguage:1];
    [v8 setNeedsLayout];
  }
}

- (void)_updateTitleStyle
{
  v2 = self;
  id v10 = [(PUAlbumListCellContentView *)self _titleTextField];
  v3 = [(PUAlbumListCellContentView *)v2 _titleLabel];
  int64_t layout = v2->_layout;
  if ([(PUAlbumListCellContentView *)v2 shouldCenterTextHorizontally]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 4;
  }
  if (v10)
  {
    [v10 setTextAlignment:v5];
    objc_msgSend(v10, "setClearButtonMode:", -[PUAlbumListCellContentView _titleTextFieldClearButtonModeForLayout:](v2, "_titleTextFieldClearButtonModeForLayout:", v2->_layout));
    v6 = [(PUAlbumListCellContentView *)v2 titleFont];
    [v10 setFont:v6];

    v7 = +[PUInterfaceManager currentTheme];
    [v7 configureAlbumListTitleTextField:v10 asOpaque:layout == 0];

    [v10 setAdjustsFontSizeToFitWidth:0];
    [v10 setContentVerticalAlignment:3];
  }
  else
  {
    if (!v3) {
      goto LABEL_9;
    }
    [(PUAlbumListCellContentView *)v3 setTextAlignment:v5];
    id v8 = [(PUAlbumListCellContentView *)v2 titleFont];
    [(PUAlbumListCellContentView *)v3 setFont:v8];

    v9 = +[PUInterfaceManager currentTheme];
    [v9 configureAlbumListTitleLabel:v3 asOpaque:layout == 0];

    [(PUAlbumListCellContentView *)v3 setAdjustsFontSizeToFitWidth:0];
    [(PUAlbumListCellContentView *)v3 _setWantsContentAwareTypesettingLanguage:1];
    v2 = v3;
  }
  [(PUAlbumListCellContentView *)v2 setNeedsLayout];
LABEL_9:
}

- (void)_deleteAction:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAlbumListCellContentView *)self delegate];
  [v5 albumListCellContentView:self performDeleteAction:v4];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = [a3 view];
  id v5 = [(PUAlbumListCellContentView *)self _titleLabel];

  if (v4 == v5)
  {
    LODWORD(v6) = [(PUAlbumListCellContentView *)self isEditing];
    if (v6) {
      return ([(PUAlbumListCellContentView *)self editCapabilities] >> 1) & 1;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v8 = a3;
  [(PUAlbumListCellContentView *)self setUsesLabelForTitle:1];
  id v4 = [(PUAlbumListCellContentView *)self title];
  id v5 = [v8 text];
  if ([v5 length] && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    [(PUAlbumListCellContentView *)self setTitle:v5];
  }
  else
  {
    id v6 = v4;

    [v8 setText:v6];
    id v5 = v6;
  }
  v7 = [(PUAlbumListCellContentView *)self delegate];
  [v7 albumListCellContentView:self didEndRetitlingFromTitle:v4 toTitle:v5];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  if ((unint64_t)(self->_layout - 1) <= 1) {
    [(PUAlbumListCellContentView *)self setNeedsLayout];
  }
  return 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = [(PUAlbumListCellContentView *)self delegate];
  id v5 = v4;
  if (self->_enabled && (self->_editCapabilities & 2) != 0) {
    char v6 = [v4 albumListCellContentViewShouldBeginRetitling:self];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)setUsesLabelForTitle:(BOOL)a3
{
  if (self->_usesLabelForTitle != a3)
  {
    self->_usesLabelForTitle = a3;
    [(PUAlbumListCellContentView *)self _updateTitleFieldAnimated:0];
    [(PUAlbumListCellContentView *)self layoutIfNeeded];
  }
}

- (void)setCombinesPhotoDecorations:(BOOL)a3
{
  if (self->_combinesPhotoDecorations != a3)
  {
    BOOL v3 = a3;
    self->_combinesPhotoDecorations = a3;
    id v4 = [(PUAlbumListCellContentView *)self stackView];
    [v4 setCombinesPhotoDecorations:v3];
  }
}

- (void)cancelPerformRetitleAction
{
  BOOL v3 = [(PUAlbumListCellContentView *)self _titleTextField];
  id v4 = [(PUAlbumListCellContentView *)self title];
  [v3 setText:v4];

  id v5 = [(PUAlbumListCellContentView *)self _titleTextField];
  [v5 resignFirstResponder];
}

- (void)startPerformRetitleAction
{
  [(PUAlbumListCellContentView *)self setUsesLabelForTitle:0];
  BOOL v3 = [(PUAlbumListCellContentView *)self _titleTextField];
  [v3 becomeFirstResponder];

  id v4 = [(PUAlbumListCellContentView *)self _titleTextField];
  [v4 selectAll];
}

- (void)_updateSubtitleLabelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUAlbumListCellContentView *)self subtitle];
  uint64_t v6 = [v5 length];
  v7 = [(PUAlbumListCellContentView *)self _subtitleLabel];
  id v8 = v7;
  if (!v6 || v7)
  {
    if (!v6)
    {
      [v7 removeFromSuperview];
      [(PUAlbumListCellContentView *)self _setSubtitleLabel:0];
    }
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(PUAlbumListCellContentView *)self addSubview:v8];
    [(PUAlbumListCellContentView *)self _setSubtitleLabel:v8];
    [(PUAlbumListCellContentView *)self _updateSubtitleLabelStyle];
    [(PUAlbumListCellContentView *)self _updateSubviewOrdering];
  }
  [v8 setText:v5];
  [(PUAlbumListCellContentView *)self setNeedsLayout];
  [(PUAlbumListCellContentView *)self _titleFieldAlpha];
  double v10 = v9;
  int v11 = [v5 isEqualToString:@" "];
  double v12 = 1.0;
  double v13 = 0.0;
  if (v11) {
    double v12 = 0.0;
  }
  if (v10 >= v12) {
    double v10 = v12;
  }
  if (v3)
  {
    [v8 alpha];
    if (v10 == v14) {
      double v13 = 0.0;
    }
    else {
      double v13 = 0.3;
    }
  }
  v15 = (void *)MEMORY[0x1E4FB1EB0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__PUAlbumListCellContentView__updateSubtitleLabelAnimated___block_invoke;
  v17[3] = &unk_1E5F2E0A8;
  id v18 = v8;
  double v19 = v10;
  id v16 = v8;
  objc_msgSend(v15, "pu_animateWithDuration:animations:", v17, v13);
}

uint64_t __59__PUAlbumListCellContentView__updateSubtitleLabelAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)_updateTitleFieldAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUAlbumListCellContentView *)self title];
  uint64_t v6 = [v5 length];
  id v7 = [(PUAlbumListCellContentView *)self _titleTextField];
  id v8 = [(PUAlbumListCellContentView *)self _titleLabel];
  BOOL v9 = [(PUAlbumListCellContentView *)self usesLabelForTitle];
  if (v6)
  {
    if (v9)
    {
      [v7 removeFromSuperview];
      if (!v8)
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
        [v8 setUserInteractionEnabled:1];
        double v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleLabelTap_];
        [v10 setDelegate:self];
        [v8 addGestureRecognizer:v10];
        [(PUAlbumListCellContentView *)self _setTitleLabel:v8];
        [(PUAlbumListCellContentView *)self _updateTitleStyle];
        [(PUAlbumListCellContentView *)self _updateSubviewOrdering];
      }
      int v11 = [v8 superview];

      if (v11 != self) {
        [(PUAlbumListCellContentView *)self addSubview:v8];
      }
      goto LABEL_8;
    }
    [v8 removeFromSuperview];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4FB1D70]);
      [v7 setDelegate:self];
      [(PUAlbumListCellContentView *)self _setTitleTextField:v7];
      [(PUAlbumListCellContentView *)self _updateTitleStyle];
      [(PUAlbumListCellContentView *)self _updateSubviewOrdering];
    }
    double v13 = [v7 superview];

    if (v13 != self) {
      [(PUAlbumListCellContentView *)self addSubview:v7];
    }
  }
  else if (v9)
  {
LABEL_8:
    double v12 = v8;
    goto LABEL_14;
  }
  double v12 = v7;
LABEL_14:
  [v12 setText:v5];
  [(PUAlbumListCellContentView *)self setNeedsLayout];
  [(PUAlbumListCellContentView *)self _titleFieldAlpha];
  BOOL v15 = !v3;
  id v16 = (void *)MEMORY[0x1E4FB1EB0];
  v20[1] = 3221225472;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[2] = __56__PUAlbumListCellContentView__updateTitleFieldAnimated___block_invoke;
  v20[3] = &unk_1E5F2D2C8;
  if (v15) {
    double v17 = 0.0;
  }
  else {
    double v17 = 0.3;
  }
  uint64_t v23 = v14;
  id v21 = v7;
  id v22 = v8;
  id v18 = v8;
  id v19 = v7;
  objc_msgSend(v16, "pu_animateWithEnforcedDuration:animations:completion:", v20, 0, v17);
}

uint64_t __56__PUAlbumListCellContentView__updateTitleFieldAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  return [v2 setAlpha:v3];
}

- (double)_titleFieldAlpha
{
  BOOL enabled = self->_enabled;
  unint64_t editCapabilities = self->_editCapabilities;
  BOOL v5 = [(PUAlbumListCellContentView *)self _showsTitleAndSubtitle];
  if (!enabled || (self->_editing ? (BOOL v6 = (editCapabilities & 2) == 0) : (BOOL v6 = 0), v6))
  {
    id v8 = +[PUInterfaceManager currentTheme];
    [v8 albumListDisabledAlbumTitleAlpha];
    double v10 = v9;

    return v10;
  }
  else
  {
    double result = 0.0;
    if (v5) {
      return 1.0;
    }
  }
  return result;
}

- (int64_t)_titleTextFieldClearButtonModeForLayout:(int64_t)a3
{
  return a3 == 0;
}

- (void)_updateStackViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[PUInterfaceManager currentTheme];
  BOOL v6 = v5;
  BOOL editing = self->_editing;
  if (self->_editing) {
    BOOL editing = (self->_editCapabilities & 4) == 0;
  }
  BOOL v8 = self->_enabled && !editing;
  double v9 = 1.0;
  if (!v8)
  {
    [v5 albumListDisabledAlbumStackViewAlpha];
    double v9 = v10;
  }
  int v11 = [(PUAlbumListCellContentView *)self stackView];
  double v12 = [(PUAlbumListCellContentView *)self customImageView];
  [v11 setHidden:v12 != 0];
  double v13 = [v11 layer];
  [v13 setAllowsGroupOpacity:v9 < 1.0];

  BOOL v8 = !v3;
  uint64_t v14 = (void *)MEMORY[0x1E4FB1EB0];
  v18[1] = 3221225472;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[2] = __55__PUAlbumListCellContentView__updateStackViewAnimated___block_invoke;
  v18[3] = &unk_1E5F2D2C8;
  if (v8) {
    double v15 = 0.0;
  }
  else {
    double v15 = 0.3;
  }
  double v21 = v9;
  id v19 = v11;
  id v20 = v12;
  id v16 = v12;
  id v17 = v11;
  objc_msgSend(v14, "pu_animateWithDuration:animations:completion:", v18, 0, v15);
}

uint64_t __55__PUAlbumListCellContentView__updateStackViewAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setItemAlpha:*(double *)(a1 + 48)];
  v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  return [v2 setAlpha:v3];
}

- (void)_updateDeleteButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = !self->_editing || (self->_editCapabilities & 1) == 0;
  BOOL v6 = [(PUAlbumListCellContentView *)self showsDeleteButtonWhenEditing];
  if (v3) {
    double v7 = 0.3;
  }
  else {
    double v7 = 0.0;
  }
  BOOL v8 = [(PUAlbumListCellContentView *)self _deleteButton];
  id v9 = v8;
  if (v5 || !v6)
  {
    if (!v8) {
      return;
    }
    v33 = (void *)MEMORY[0x1E4FB1EB0];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke_3;
    v39[3] = &unk_1E5F2ED10;
    v31 = &v40;
    id v40 = v8;
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke_4;
    v37 = &unk_1E5F2CEE8;
    id v38 = v40;
    id v32 = v40;
    objc_msgSend(v33, "pu_animateWithDuration:animations:completion:", v39, &v34, v7);
    -[PUAlbumListCellContentView _setDeleteButton:](self, "_setDeleteButton:", 0, v34, v35, v36, v37);
  }
  else
  {
    if (!v8)
    {
      double v10 = [MEMORY[0x1E4F90850] buttonWithType:0];
      [v10 addTarget:self action:sel__deleteAction_ forControlEvents:64];
      int v11 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
      double v12 = [MEMORY[0x1E4FB1830] configurationPreferringMulticolor];
      double v13 = [v11 configurationByApplyingConfiguration:v12];

      uint64_t v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"minus.circle.fill"];
      double v15 = [v14 imageByApplyingSymbolConfiguration:v13];

      [v10 setImage:v15 forState:0];
      [(PUAlbumListCellContentView *)self _deleteButtonCenter];
      uint64_t v17 = v16;
      uint64_t v19 = v18;
      id v20 = (void *)MEMORY[0x1E4FB1EB0];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke;
      v43[3] = &unk_1E5F2A1D0;
      id v9 = v10;
      id v44 = v9;
      uint64_t v45 = v17;
      uint64_t v46 = v19;
      [v20 performWithoutAnimation:v43];
      PXEdgeInsetsMake();
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      v29 = objc_msgSend(v9, "px_configuration");
      objc_msgSend(v29, "setHitTestOutset:", v22, v24, v26, v28);

      [(PUAlbumListCellContentView *)self addSubview:v9];
      [(PUAlbumListCellContentView *)self setNeedsLayout];
      [(PUAlbumListCellContentView *)self _setDeleteButton:v9];
      [(PUAlbumListCellContentView *)self _updateSubviewOrdering];
    }
    v30 = (void *)MEMORY[0x1E4FB1EB0];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke_2;
    v41[3] = &unk_1E5F2ED10;
    v31 = &v42;
    id v42 = v9;
    id v32 = v9;
    objc_msgSend(v30, "pu_animateWithDuration:animations:", v41, v7);
  }
}

uint64_t __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) sizeToFit];
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  return [v2 setAlpha:0.0];
}

uint64_t __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_updateSubviewOrdering
{
  BOOL v3 = [(PUAlbumListCellContentView *)self stackView];
  [(PUAlbumListCellContentView *)self bringSubviewToFront:v3];

  id v4 = [(PUAlbumListCellContentView *)self customImageView];
  [(PUAlbumListCellContentView *)self bringSubviewToFront:v4];

  BOOL v5 = [(PUAlbumListCellContentView *)self _deleteButton];
  [(PUAlbumListCellContentView *)self bringSubviewToFront:v5];

  BOOL v6 = [(PUAlbumListCellContentView *)self _subtitleLabel];
  [(PUAlbumListCellContentView *)self bringSubviewToFront:v6];

  double v7 = [(PUAlbumListCellContentView *)self _titleTextField];
  [(PUAlbumListCellContentView *)self bringSubviewToFront:v7];

  BOOL v8 = [(PUAlbumListCellContentView *)self _titleLabel];
  [(PUAlbumListCellContentView *)self bringSubviewToFront:v8];

  id v9 = [(PUAlbumListCellContentView *)self checkmarkView];

  if (v9)
  {
    id v10 = [(PUAlbumListCellContentView *)self checkmarkView];
    [(PUAlbumListCellContentView *)self bringSubviewToFront:v10];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUAlbumListCellContentView *)self isHighlighted] != a3)
  {
    self->_highlighted = v3;
    id v5 = [(PUAlbumListCellContentView *)self stackView];
    [v5 setHighlighted:v3];
  }
}

- (void)_updateCheckmarkView
{
  BOOL v3 = [(PUAlbumListCellContentView *)self showsCheckmarkView];
  id v4 = [(PUAlbumListCellContentView *)self checkmarkView];
  id v7 = v4;
  if (v3)
  {

    if (v7) {
      return;
    }
    id v5 = (void *)MEMORY[0x1E4FB1EB0];
    BOOL v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
    objc_msgSend(v5, "px_circularGlyphViewWithName:backgroundColor:", @"checkmark.circle", v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    [v7 setUserInteractionEnabled:0];
    [(PUAlbumListCellContentView *)self addSubview:v7];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUAlbumListCellContentView *)self setCheckmarkView:v7];
    [(PUAlbumListCellContentView *)self setNeedsLayout];
    [(PUAlbumListCellContentView *)self _updateSubviewOrdering];
  }
  else
  {
    [v4 removeFromSuperview];
  }
}

- (void)setShowsCheckmarkView:(BOOL)a3
{
  if (self->_showsCheckmarkView != a3)
  {
    self->_showsCheckmarkView = a3;
    [(PUAlbumListCellContentView *)self _updateCheckmarkView];
  }
}

- (void)setShowsDeleteButtonWhenEditing:(BOOL)a3
{
  if (self->_showsDeleteButtonWhenEditing != a3)
  {
    self->_showsDeleteButtonWhenEditing = a3;
    [(PUAlbumListCellContentView *)self _updateDeleteButtonAnimated:0];
  }
}

- (void)setEditCapabilities:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_editCapabilities != a3)
  {
    BOOL v4 = a4;
    self->_unint64_t editCapabilities = a3;
    [(PUAlbumListCellContentView *)self _updateDeleteButtonAnimated:a4];
    [(PUAlbumListCellContentView *)self _updateStackViewAnimated:v4];
    [(PUAlbumListCellContentView *)self _updateTitleFieldAnimated:v4];
    [(PUAlbumListCellContentView *)self _updateSubtitleLabelAnimated:v4];
  }
}

- (void)setEditCapabilities:(unint64_t)a3
{
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_enabled != a3)
  {
    BOOL v4 = a4;
    self->_BOOL enabled = a3;
    [(PUAlbumListCellContentView *)self _updateStackViewAnimated:a4];
    [(PUAlbumListCellContentView *)self _updateTitleFieldAnimated:v4];
    [(PUAlbumListCellContentView *)self _updateSubtitleLabelAnimated:v4];
  }
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    self->_BOOL editing = a3;
    if (a4) {
      double v6 = 0.3;
    }
    else {
      double v6 = 0.0;
    }
    id v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v7 beginIgnoringInteractionEvents];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__PUAlbumListCellContentView_setEditing_animated___block_invoke;
    v8[3] = &unk_1E5F2E120;
    v8[4] = self;
    BOOL v9 = a4;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "pu_animateWithEnforcedDuration:animations:completion:", v8, &__block_literal_global_7382, v6);
  }
}

uint64_t __50__PUAlbumListCellContentView_setEditing_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateStackViewAnimated:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateDeleteButtonAnimated:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateTitleFieldAnimated:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateSubtitleLabelAnimated:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

void __50__PUAlbumListCellContentView_setEditing_animated___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v0 endIgnoringInteractionEvents];
}

- (void)setEditing:(BOOL)a3
{
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_int64_t layout = a3;
    [(PUAlbumListCellContentView *)self _updateTitleFieldAnimated:0];
    [(PUAlbumListCellContentView *)self _updateSubtitleLabelAnimated:0];
    [(PUAlbumListCellContentView *)self setNeedsLayout];
  }
}

- (void)setXInset:(double)a3
{
  if (self->_xInset != a3)
  {
    self->_xInset = a3;
    [(PUAlbumListCellContentView *)self setNeedsLayout];
  }
}

- (void)setSubtitleFont:(id)a3
{
  id v5 = (UIFont *)a3;
  if (self->_subtitleFont != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_subtitleFont, a3);
    [(PUAlbumListCellContentView *)self _updateSubtitleLabelStyle];
    id v5 = v6;
  }
}

- (void)setTitleFont:(id)a3
{
  id v5 = (UIFont *)a3;
  if (self->_titleFont != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_titleFont, a3);
    [(PUAlbumListCellContentView *)self _updateTitleStyle];
    id v5 = v6;
  }
}

- (void)setSubtitle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (NSString *)a3;
  id v7 = v6;
  if (self->_subtitle != v6)
  {
    int v11 = v6;
    BOOL v8 = -[NSString isEqualToString:](v6, "isEqualToString:");
    id v7 = v11;
    if (!v8)
    {
      BOOL v9 = (NSString *)[(NSString *)v11 copy];
      subtitle = self->_subtitle;
      self->_subtitle = v9;

      [(PUAlbumListCellContentView *)self _updateSubtitleLabelAnimated:v4];
      id v7 = v11;
    }
  }
}

- (void)setSubtitle:(id)a3
{
}

- (void)setTitle:(id)a3
{
  BOOL v4 = (NSString *)a3;
  id v5 = v4;
  if (self->_title != v4)
  {
    BOOL v9 = v4;
    BOOL v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    id v5 = v9;
    if (!v6)
    {
      id v7 = (NSString *)[(NSString *)v9 copy];
      title = self->_title;
      self->_title = v7;

      [(PUAlbumListCellContentView *)self _updateTitleFieldAnimated:0];
      id v5 = v9;
    }
  }
}

- (void)setShouldCenterTextHorizontally:(BOOL)a3
{
  if (self->_shouldCenterTextHorizontally != a3)
  {
    self->_shouldCenterTextHorizontally = a3;
    [(PUAlbumListCellContentView *)self _updateTitleStyle];
  }
}

- (void)setCustomImageView:(id)a3
{
  id v5 = (UIView *)a3;
  customImageView = self->_customImageView;
  if (customImageView != v5)
  {
    id v7 = v5;
    [(UIView *)customImageView removeFromSuperview];
    objc_storeStrong((id *)&self->_customImageView, a3);
    if (self->_customImageView)
    {
      -[PUAlbumListCellContentView addSubview:](self, "addSubview:");
      [(PUAlbumListCellContentView *)self _updateSubviewOrdering];
    }
    [(PUAlbumListCellContentView *)self _updateStackViewAnimated:0];
    [(PUAlbumListCellContentView *)self setNeedsLayout];
    id v5 = v7;
  }
}

- (UIView)springLoadingTargetView
{
  BOOL v3 = [(PUAlbumListCellContentView *)self customImageView];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(PUAlbumListCellContentView *)self stackView];
    id v7 = (void *)v6;
    if (v6) {
      BOOL v8 = (PUAlbumListCellContentView *)v6;
    }
    else {
      BOOL v8 = self;
    }
    id v5 = v8;
  }
  return (UIView *)v5;
}

- (void)prepareForReuse
{
  id v2 = [(PUAlbumListCellContentView *)self stackView];
  [v2 prepareForReuse];
}

- (void)setShowsTitle:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(PUAlbumListCellContentView *)self _showsTitleAndSubtitle] != a3)
  {
    [(PUAlbumListCellContentView *)self _setShowsTitleAndSubtitle:v5];
    [(PUAlbumListCellContentView *)self _updateTitleFieldAnimated:v4];
    [(PUAlbumListCellContentView *)self _updateSubtitleLabelAnimated:v4];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v7 = [v6 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(v7) && !self->_layout)
  {
    double v13 = [(PUAlbumListCellContentView *)self _subtitleLabel];
    objc_msgSend(v13, "sizeThatFits:", width, height);
    double v15 = v14;

    uint64_t v16 = [(PUAlbumListCellContentView *)self _titleTextField];
    uint64_t v17 = [(PUAlbumListCellContentView *)self _titleLabel];
    uint64_t v18 = v16;
    if (v16 || (uint64_t v18 = v17) != 0)
    {
      objc_msgSend(v18, "sizeThatFits:", width, height);
      double v15 = v15 + v19;
    }
    id v20 = [(PUAlbumListCellContentView *)self stackView];
    [v20 frame];
    double v22 = v21;

    if (v15 >= v22) {
      double v23 = v15;
    }
    else {
      double v23 = v22;
    }
    double v10 = v23 + 20.0;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)PUAlbumListCellContentView;
    -[PUAlbumListCellContentView sizeThatFits:](&v24, sel_sizeThatFits_, width, height);
    double width = v8;
    double v10 = v9;
  }

  double v11 = width;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (PXFocusInfo)focusInfo
{
  id v2 = [(PUAlbumListCellContentView *)self stackView];
  BOOL v3 = (void *)MEMORY[0x1E4F90220];
  [v2 cornerRadius];
  BOOL v4 = objc_msgSend(v3, "focusInfoWithView:cornerRadius:cornerCurve:", v2, *MEMORY[0x1E4F39EA0]);

  return (PXFocusInfo *)v4;
}

- (void)layoutSubviews
{
  *(void *)&v143.origin.y = self;
  *(void *)&v143.size.double width = PUAlbumListCellContentView;
  [(CGFloat *)(objc_super *)&v143.origin.y layoutSubviews];
  [(PUAlbumListCellContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v126 = v7;
  double v9 = v8;
  double v10 = [(PUAlbumListCellContentView *)self _subtitleLabel];
  uint64_t v11 = [(PUAlbumListCellContentView *)self _titleTextField];
  uint64_t v12 = [(PUAlbumListCellContentView *)self _titleLabel];
  uint64_t v13 = [(PUAlbumListCellContentView *)self _deleteButton];
  double v14 = [(PUAlbumListCellContentView *)self stackView];
  uint64_t v15 = [(PUAlbumListCellContentView *)self customImageView];
  v134 = (void *)v15;
  if (v15 && (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v17 = *(double *)(MEMORY[0x1E4FB2E10] + 8);
    uint64_t v118 = *MEMORY[0x1E4FB2E10];
    [v16 collageSize];
    double v19 = v18;
    double v138 = v20;
  }
  else
  {
    [v14 stackSize];
    double v19 = v21;
    double v138 = v22;
    [v14 stackOffset];
    uint64_t v118 = v23;
    double v17 = v24;
  }
  double v131 = v19;
  CGFloat v122 = v4;
  CGFloat v123 = v6;
  if (v10) {
    int v120 = [v10 isHidden] ^ 1;
  }
  else {
    int v120 = 0;
  }
  double v25 = (double *)MEMORY[0x1E4F1DB28];
  CGFloat v26 = *MEMORY[0x1E4F1DB28];
  if (v11) {
    double v27 = (void *)v11;
  }
  else {
    double v27 = (void *)v12;
  }
  double v28 = *MEMORY[0x1E4F1DB30];
  double v29 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  objc_msgSend(v27, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v29, v118);
  CGFloat v128 = v30;
  objc_msgSend(v10, "sizeThatFits:", v28, v29);
  double v32 = v31;
  v33 = +[PUInterfaceManager currentTheme];
  uint64_t v34 = [v33 albumListTitleLabelFont];
  rect = v33;
  uint64_t v35 = [v33 albumListSubtitleLabelFont];
  [v34 ascender];
  double v37 = v36;
  [v34 descender];
  double v39 = v38;
  [v35 ascender];
  double v41 = v40;
  v142 = v35;
  [v35 descender];
  double v43 = v42;
  BOOL v125 = [(PUAlbumListCellContentView *)self shouldCenterTextHorizontally];
  int v124 = [(PUAlbumListCellContentView *)self _shouldReverseLayoutDirection];
  id v44 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v45 = [v44 preferredContentSizeCategory];

  v133 = v45;
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v45);
  uint64_t v47 = v12;
  int64_t layout = self->_layout;
  double v137 = v17;
  v143.origin.double x = v26;
  if ((unint64_t)(layout - 1) < 2)
  {
    double v121 = v32;
    double v127 = 0.0;
    double v49 = 0.0;
    v50 = (void *)v47;
    v51 = (void *)v13;
    v52 = v14;
    v53 = v134;
    if (v11 | v47)
    {
      PXVisionScaledFloat();
      objc_msgSend(v34, "_scaledValueForValue:useLanguageAwareScaling:", 1);
      double v55 = v54 - v37;
      if (PUMainScreenScale_onceToken != -1) {
        dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
      }
      double v49 = round(*(double *)&PUMainScreenScale_screenScale * v55) / *(double *)&PUMainScreenScale_screenScale;
    }
    v56 = [(PUAlbumListCellContentView *)self _subtitleLabel];

    if (v56)
    {
      [v142 _scaledValueForValue:1 useLanguageAwareScaling:20.0];
      double v58 = v43 + v39 + v57 - v41;
      if (PUMainScreenScale_onceToken != -1) {
        dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
      }
      double v127 = round(*(double *)&PUMainScreenScale_screenScale * v58) / *(double *)&PUMainScreenScale_screenScale;
    }
    v144.origin.double x = v122;
    v144.origin.y = v123;
    v144.size.double width = v126;
    v144.size.double height = v9;
    double v59 = CGRectGetMidX(v144) + v131 * -0.5;
    if ([(PUAlbumListCellContentView *)self topInsetEnabled])
    {
      double v60 = 10.0;
      if (layout == 2) {
        double v60 = 8.0;
      }
      [v34 _scaledValueForValue:1 useLanguageAwareScaling:v60];
    }
    else
    {
      v146.origin.double x = v122;
      v146.origin.y = v123;
      v146.size.double width = v126;
      v146.size.double height = v9;
      double MinX = CGRectGetMinX(v146);
    }
    v147.origin.y = MinX;
    v75 = rect;
    v147.origin.double x = v59;
    double recta = v147.origin.y;
    v147.size.double width = v131;
    v147.size.double height = v138;
    double v79 = v49 + v137 + CGRectGetMaxY(v147);
    if (v125)
    {
      double v80 = v131;
      double v81 = v131;
      double x = v143.origin.x;
    }
    else
    {
      objc_msgSend(v10, "sizeThatFits:", v131, v138);
      if (v131 >= v86) {
        double v80 = v86;
      }
      else {
        double v80 = v131;
      }
      if (v124)
      {
        v148.origin.double x = v59;
        v148.origin.y = recta;
        v148.size.double width = v131;
        v148.size.double height = v138;
        double v81 = v131;
        double x = CGRectGetMaxX(v148) - v80;
      }
      else
      {
        double v81 = v131;
        double x = v59;
      }
    }
    CGFloat v84 = v81;
    double v74 = v59;
    goto LABEL_65;
  }
  v50 = (void *)v47;
  double v140 = v25[1];
  CGFloat v135 = v25[2];
  if (layout)
  {
    CGFloat v83 = v25[3];
    double x = v26;
    double v72 = 0.0;
    CGFloat v132 = v83;
    double v81 = v25[2];
    double v79 = v25[1];
    CGFloat v84 = 0.0;
    CGFloat v85 = 0.0;
    double v74 = 0.0;
    v51 = (void *)v13;
    v52 = v14;
    v53 = v134;
    v75 = rect;
    goto LABEL_66;
  }
  BOOL v62 = IsAccessibilityCategory;
  double v121 = v32;
  if (v11 | v47) {
    char v63 = IsAccessibilityCategory;
  }
  else {
    char v63 = 1;
  }
  double v127 = 0.0;
  if (v11 | v47) {
    double v64 = 10.0;
  }
  else {
    double v64 = 0.0;
  }
  if ((v63 & 1) == 0)
  {
    double v65 = 48.0;
    if (v120) {
      double v65 = 40.0;
    }
    [v34 _scaledValueForValue:1 useLanguageAwareScaling:v65];
    double v67 = v66 - v37;
    if (PUMainScreenScale_onceToken != -1) {
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
    }
    double v64 = round(*(double *)&PUMainScreenScale_screenScale * v67) / *(double *)&PUMainScreenScale_screenScale;
  }
  v68 = [(PUAlbumListCellContentView *)self _subtitleLabel];

  if (v68)
  {
    [v142 _scaledValueForValue:1 useLanguageAwareScaling:20.0];
    double v70 = v39 + v69 - v41;
    if (v62) {
      double v71 = 0.0;
    }
    else {
      double v71 = v70;
    }
    if (PUMainScreenScale_onceToken != -1) {
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
    }
    double v127 = round(*(double *)&PUMainScreenScale_screenScale * v71) / *(double *)&PUMainScreenScale_screenScale;
  }
  double v72 = fmax(v131, 70.0) + 16.0;
  [(PUAlbumListCellContentView *)self xInset];
  double v74 = v73;
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  v51 = (void *)v13;
  v75 = rect;
  double v76 = round(*(double *)&PUMainScreenScale_screenScale * ((v9 - v72) * 0.5));
  double v77 = v76 / *(double *)&PUMainScreenScale_screenScale;
  v52 = v14;
  double recta = v76 / *(double *)&PUMainScreenScale_screenScale;
  if ((v125 | v124 ^ 1) == 1)
  {
    v145.origin.double x = v74;
    v145.origin.y = v76 / *(double *)&PUMainScreenScale_screenScale;
    v145.size.double width = v72;
    v145.size.double height = v72;
    double v78 = v126 - CGRectGetMaxX(v145);
  }
  else
  {
    v149.origin.double x = v122;
    v149.origin.y = v123;
    v149.size.double width = v126;
    v149.size.double height = v9;
    double MaxX = CGRectGetMaxX(v149);
    v150.origin.double x = v74;
    v150.origin.y = v77;
    v150.size.double width = v72;
    v150.size.double height = v72;
    double v88 = MaxX - CGRectGetWidth(v150);
    v151.origin.double x = v74;
    v151.origin.y = v77;
    v151.size.double width = v72;
    v151.size.double height = v72;
    double v74 = v88 - CGRectGetMinX(v151);
    v152.origin.double x = v74;
    v152.origin.y = v77;
    v152.size.double width = v72;
    v152.size.double height = v72;
    double v78 = CGRectGetMinX(v152);
  }
  v53 = v134;
  CGFloat v83 = v128;
  double v81 = v78 + -8.0 + -4.0;
  double v89 = v74;
  double v90 = recta;
  double v91 = v72;
  double v92 = v72;
  if (v124)
  {
    CGFloat v93 = CGRectGetMinX(*(CGRect *)&v89) + -8.0;
    v153.origin.double x = v143.origin.x;
    v153.origin.y = v140;
    v153.size.double width = v81;
    v153.size.double height = v128;
    double x = v93 - CGRectGetWidth(v153);
  }
  else
  {
    double x = CGRectGetMaxX(*(CGRect *)&v89) + 8.0;
  }
  double v79 = v119 + v64;
  if (v120)
  {
    CGFloat v84 = v72;
    double v59 = x;
    double v80 = v81;
    double v138 = v84;
LABEL_65:
    v154.origin.double x = v59;
    v154.origin.y = v79;
    v154.size.double width = v81;
    CGFloat v83 = v128;
    v154.size.double height = v128;
    CGFloat v132 = v121;
    double v140 = v127 + CGRectGetMaxY(v154);
    CGFloat v135 = v80;
    v143.origin.double x = x;
    double x = v59;
    double v72 = v138;
    CGFloat v85 = recta;
    goto LABEL_66;
  }
  CGFloat v84 = v72;
  CGFloat v85 = recta;
  CGFloat v132 = 0.0;
LABEL_66:
  double v94 = PURoundRectToPixel(v74, v85, v84, v72);
  double v96 = v95;
  double v98 = v97;
  double v100 = v99;
  double v101 = PUExtendRectToPixel(x, v79, v81, v83);
  double v103 = v102;
  double v105 = v104;
  double v107 = v106;
  v143.origin.double x = PUExtendRectToPixel(v143.origin.x, v140, v135, v132);
  double v139 = v109;
  double v141 = v108;
  double v136 = v110;
  objc_msgSend(v52, "setFrame:", v94, v96, v98, v100);
  objc_msgSend(v53, "setFrame:", v94, v96, v98, v100);
  objc_msgSend((id)v11, "setFrame:", v101, v103, v105, v107);
  objc_msgSend(v50, "setFrame:", v101, v103, v105, v107);
  objc_msgSend(v10, "setFrame:", v143.origin.x, v141, v139, v136);
  [(PUAlbumListCellContentView *)self _deleteButtonCenter];
  objc_msgSend(v51, "setCenter:");
  v111 = [(PUAlbumListCellContentView *)self checkmarkView];
  if (v111)
  {
    v155.origin.double x = v94;
    v155.origin.y = v96;
    v155.size.double width = v98;
    v155.size.double height = v100;
    CGFloat v112 = v137 + CGRectGetMaxY(v155) - v96;
    [v111 bounds];
    double v114 = v113;
    double v116 = v115;
    v156.origin.double x = v94;
    v156.origin.y = v96;
    v156.size.double width = v98;
    v156.size.double height = v112;
    CGFloat v117 = CGRectGetMaxX(v156) - v114 + -3.5;
    v157.origin.double x = v94;
    v157.origin.y = v96;
    v157.size.double width = v98;
    v157.size.double height = v112;
    objc_msgSend(v111, "setFrame:", v117, CGRectGetMaxY(v157) - v116 + -3.5, v114, v116);
  }
}

- (CGPoint)_deleteButtonCenter
{
  double v3 = [(PUAlbumListCellContentView *)self stackView];
  [v3 topLeftCornerOfFrontStackItem];
  -[PUAlbumListCellContentView convertPoint:fromView:](self, "convertPoint:fromView:", v3);
  double v5 = v4 + 2.0;
  double v7 = v6 + 3.0;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.double x = v8;
  return result;
}

- (PUAlbumListCellContentView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUAlbumListCellContentView;
  double v3 = -[PUAlbumListCellContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_BOOL enabled = 1;
    v3->__showsTitleAndSubtitle = 1;
    v3->_usesLabelForTitle = 1;
    double v5 = [PUStackView alloc];
    [(PUAlbumListCellContentView *)v4 bounds];
    double v6 = -[PUStackView initWithFrame:](v5, "initWithFrame:");
    [(PUAlbumListCellContentView *)v4 addSubview:v6];
    [(PUAlbumListCellContentView *)v4 _setStackView:v6];
    [(PUAlbumListCellContentView *)v4 setOpaque:0];
  }
  return v4;
}

@end