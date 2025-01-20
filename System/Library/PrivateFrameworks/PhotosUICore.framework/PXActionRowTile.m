@interface PXActionRowTile
- (BOOL)isEnabled;
- (BOOL)showsMenu;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (PXActionRowTile)initWithFrame:(CGRect)a3;
- (PXActionRowTileDelegate)delegate;
- (PXUIWidgetFooterView)_footer;
- (UIButton)_button;
- (int64_t)idiom;
- (void)_setupButton;
- (void)_setupDecoratedButton;
- (void)_updateButtonAction;
- (void)_updateButtonTitle;
- (void)becomeReusable;
- (void)handleButtonTap:(id)a3 forEvent:(id)a4;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdiom:(int64_t)a3;
- (void)setShowsMenu:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)tintColorDidChange;
- (void)widgetFooterView:(id)a3 didSelectDisclosure:(id)a4;
@end

@implementation PXActionRowTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__footer, 0);
  objc_storeStrong((id *)&self->__button, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
}

- (PXUIWidgetFooterView)_footer
{
  return self->__footer;
}

- (UIButton)_button
{
  return self->__button;
}

- (void)setDelegate:(id)a3
{
}

- (PXActionRowTileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXActionRowTileDelegate *)WeakRetained;
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (NSString)title
{
  return self->_title;
}

- (void)widgetFooterView:(id)a3 didSelectDisclosure:(id)a4
{
  id v5 = [(PXActionRowTile *)self delegate];
  objc_msgSend(v5, "actionRowTileSelected:tapPositionInTile:", self, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)handleButtonTap:(id)a3 forEvent:(id)a4
{
  id v5 = [a4 touchesForView:a3];
  id v12 = [v5 anyObject];

  v6 = [(PXActionRowTile *)self view];
  [v12 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  v11 = [(PXActionRowTile *)self delegate];
  objc_msgSend(v11, "actionRowTileSelected:tapPositionInTile:", self, v8, v10);
}

- (void)prepareForReuse
{
  [(PXActionRowTile *)self setHidden:0];
  [(PXUIWidgetFooterView *)self->__footer setHidden:0];
  [(PXActionRowTile *)self setTitle:0];
  [(PXActionRowTile *)self setEnabled:1];
}

- (void)becomeReusable
{
  [(PXActionRowTile *)self setHidden:1];
  footer = self->__footer;
  [(PXUIWidgetFooterView *)footer setHidden:1];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  v6 = [(PXActionRowTile *)self _button];
  double v7 = [v6 titleLabel];
  double v8 = [v7 font];
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v11 = [(PXActionRowTile *)self _footer];
    id v10 = [v11 font];
  }
  if (v10)
  {
    [v10 ascender];
    double v13 = v12;
    [v10 descender];
    double v15 = v13 - v14;
    [v10 _scaledValueForValue:11.5];
    double height = v15 + v16;
  }

  double v17 = width;
  double v18 = height;
  result.double height = v18;
  result.CGFloat width = v17;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXActionRowTile;
  [(PXActionRowTile *)&v3 tintColorDidChange];
  [(PXActionRowTile *)self _updateButtonTitle];
}

- (void)_updateButtonAction
{
  v15[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(PXActionRowTile *)self _button];
  if ([v3 showsMenuAsPrimaryAction])
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E4FB16B8];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __38__PXActionRowTile__updateButtonAction__block_invoke;
    double v12 = &unk_1E5DC4300;
    objc_copyWeak(&v13, &location);
    id v5 = [v4 elementWithUncachedProvider:&v9];
    v6 = (void *)MEMORY[0x1E4FB1970];
    v15[0] = v5;
    double v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 1, v9, v10, v11, v12);
    double v8 = [v6 menuWithChildren:v7];
    [v3 setMenu:v8];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    [v3 setMenu:0];
  }
}

void __38__PXActionRowTile__updateButtonAction__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  objc_super v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [WeakRetained delegate];
  uint64_t v5 = [v4 menuElementsForActionRowTile:WeakRetained];
  v6 = (void *)v5;
  double v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    double v7 = (void *)v5;
  }
  id v8 = v7;

  v3[2](v3, v8);
}

- (void)_updateButtonTitle
{
  v30[2] = *MEMORY[0x1E4F143B8];
  if (self->_idiom == 3)
  {
    id v23 = [(PXActionRowTile *)self title];
    objc_super v3 = [(PXActionRowTile *)self _footer];
    [v3 setDisclosureTitle:v23];
  }
  else
  {
    v4 = [(PXActionRowTile *)self _button];
    uint64_t v5 = [(PXActionRowTile *)self tintColor];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x1E4FB1618] labelColor];
    }
    id v8 = v7;

    uint64_t v9 = [(PXActionRowTile *)self title];
    uint64_t v10 = MEMORY[0x1AD10AAF0](7, 0x8000, 7);
    uint64_t v11 = *MEMORY[0x1E4FB06F8];
    uint64_t v12 = *MEMORY[0x1E4FB0700];
    v29[0] = *MEMORY[0x1E4FB06F8];
    v29[1] = v12;
    v30[0] = v10;
    v30[1] = v8;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    if (v9) {
      double v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9 attributes:v13];
    }
    else {
      double v14 = 0;
    }
    [v4 setAttributedTitle:v14 forState:0];
    v27[1] = v12;
    v28[0] = v10;
    v27[0] = v11;
    id v24 = v8;
    double v15 = [v8 colorWithAlphaComponent:0.5];
    v28[1] = v15;
    double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

    if (v9) {
      double v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9 attributes:v16];
    }
    else {
      double v17 = 0;
    }

    [v4 setAttributedTitle:v17 forState:1];
    v25[1] = v12;
    v26[0] = v10;
    v25[0] = v11;
    double v18 = [MEMORY[0x1E4FB1618] grayColor];
    v26[1] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

    if (v9) {
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9 attributes:v19];
    }
    else {
      v20 = 0;
    }

    [v4 setAttributedTitle:v20 forState:2];
    [v4 setContentHorizontalAlignment:0];
    v21 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    [v4 setBackgroundColor:v21];

    v22 = [v4 layer];
    [v22 setCornerRadius:8.0];
  }
}

- (BOOL)showsMenu
{
  v2 = [(PXActionRowTile *)self _button];
  char v3 = [v2 showsMenuAsPrimaryAction];

  return v3;
}

- (void)setShowsMenu:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PXActionRowTile *)self _button];
  [v5 setShowsMenuAsPrimaryAction:v3];

  [(PXActionRowTile *)self _updateButtonAction];
}

- (BOOL)isEnabled
{
  v2 = [(PXActionRowTile *)self _button];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PXActionRowTile *)self _button];
  [v4 setEnabled:v3];
}

- (void)setTitle:(id)a3
{
  id v8 = (NSString *)a3;
  id v4 = self->_title;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      title = self->_title;
      self->_title = v6;

      [(PXActionRowTile *)self _updateButtonTitle];
    }
  }
}

- (void)_setupDecoratedButton
{
  [(UIButton *)self->__button removeFromSuperview];
  footer = self->__footer;
  if (!footer)
  {
    id v4 = [PXUIWidgetFooterView alloc];
    [(PXActionRowTile *)self bounds];
    char v5 = -[PXUIWidgetFooterView initWithFrame:](v4, "initWithFrame:");
    v6 = self->__footer;
    self->__footer = v5;

    [(PXUIWidgetFooterView *)self->__footer setAutoresizingMask:18];
    footer = self->__footer;
  }
  [(PXUIWidgetFooterView *)footer setLayoutStyle:1];
  [(PXUIWidgetFooterView *)self->__footer setDelegate:self];
  id v7 = self->__footer;
  id v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:36.0];
  [(PXUIWidgetFooterView *)v7 setFont:v8];

  [(PXActionRowTile *)self addSubview:self->__footer];
  [(PXActionRowTile *)self _updateButtonTitle];
}

- (void)_setupButton
{
  [(PXUIWidgetFooterView *)self->__footer removeFromSuperview];
  button = self->__button;
  if (!button)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14D0]);
    [(PXActionRowTile *)self bounds];
    char v5 = (UIButton *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->__button;
    self->__button = v5;

    [(UIButton *)self->__button setAutoresizingMask:18];
    button = self->__button;
  }
  if (objc_msgSend(MEMORY[0x1E4F1CA20], "px_currentCharacterDirection") == 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [(UIButton *)button setContentHorizontalAlignment:v7];
  [(UIButton *)self->__button addTarget:self action:sel_handleButtonTap_forEvent_ forControlEvents:0x2000];
  [(PXActionRowTile *)self addSubview:self->__button];
  [(PXActionRowTile *)self _updateButtonTitle];
}

- (void)setIdiom:(int64_t)a3
{
  if (self->_idiom != a3)
  {
    self->_idiom = a3;
    if (a3 == 3) {
      [(PXActionRowTile *)self _setupDecoratedButton];
    }
    else {
      [(PXActionRowTile *)self _setupButton];
    }
  }
}

- (PXActionRowTile)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXActionRowTile;
  BOOL v3 = -[PXActionRowTile initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(PXActionRowTile *)v3 _setupButton];
  }
  return v4;
}

@end