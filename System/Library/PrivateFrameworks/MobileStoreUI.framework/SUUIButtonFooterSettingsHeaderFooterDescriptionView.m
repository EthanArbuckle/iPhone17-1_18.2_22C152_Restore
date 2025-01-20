@interface SUUIButtonFooterSettingsHeaderFooterDescriptionView
+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5;
+ (id)_buttonWithButtonElement:(id)a3;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)_buttonTapped:(id)a3;
- (void)_reloadWithButtonElement:(id)a3 context:(id)a4;
- (void)layoutSubviews;
- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUIButtonFooterSettingsHeaderFooterDescriptionView

+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5
{
  v7 = [a4 viewElement];
  v8 = [v7 firstChildForElementType:12];
  v9 = [a1 _buttonWithButtonElement:v8];
  v10 = [v9 titleLabel];
  v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588]];
  [v10 setFont:v11];
  objc_msgSend(v10, "sizeThatFits:", a3, 1.0);
  double v13 = v12;
  double v15 = v14;
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v12, v14);
  [v11 _scaledValueForValue:20.0];
  double v17 = v16;
  [v10 _firstLineBaselineFrameOriginY];
  double v19 = v15 + v17 - v18;

  double v20 = v13;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a5;
  v8 = [a3 viewElement];
  viewElement = self->_viewElement;
  self->_viewElement = v8;

  v10 = [(SUUIViewElement *)self->_viewElement firstChildForElementType:12];
  buttonElement = self->_buttonElement;
  self->_buttonElement = v10;

  button = self->_button;
  if (button)
  {
    [(UIButton *)button removeFromSuperview];
    double v13 = self->_button;
    self->_button = 0;
  }
  double v14 = [(id)objc_opt_class() _buttonWithButtonElement:self->_buttonElement];
  double v15 = self->_button;
  self->_button = v14;

  [(UIButton *)self->_button addTarget:self action:sel__buttonTapped_ forControlEvents:64];
  id v21 = [(SUUIButtonViewElement *)self->_buttonElement style];
  double v16 = [v21 ikColor];
  double v17 = [v7 tintColor];

  double v18 = SUUIViewElementPlainColorWithIKColor(v16, v17);

  [(UIButton *)self->_button setTitleColor:v18 forState:0];
  double v19 = self->_button;
  double v20 = [v18 colorWithAlphaComponent:0.2];
  [(UIButton *)v19 setTitleColor:v20 forState:1];

  [(SUUIButtonFooterSettingsHeaderFooterDescriptionView *)self addSubview:self->_button];
  [(SUUIButtonFooterSettingsHeaderFooterDescriptionView *)self setNeedsLayout];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)SUUIButtonFooterSettingsHeaderFooterDescriptionView;
  [(SUUIButtonFooterSettingsHeaderFooterDescriptionView *)&v23 layoutSubviews];
  v3 = [(UIButton *)self->_button titleLabel];
  double v4 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588]];
  [v3 setFont:v4];
  [(SUUIButtonFooterSettingsHeaderFooterDescriptionView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(SUUIButtonFooterSettingsHeaderFooterDescriptionView *)self layoutMargins];
  double v14 = v13;
  double v16 = v15;
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  CGFloat v17 = CGRectGetWidth(v24) - v14 - v16;
  objc_msgSend(v3, "sizeThatFits:", v17, 1.0);
  double v19 = v18;
  [v4 _scaledValueForValue:20.0];
  double v21 = v20;
  [v3 _firstBaselineOffsetFromTop];
  -[UIButton setFrame:](self->_button, "setFrame:", v14, v21 - v22, v17, v19);
}

- (void)_buttonTapped:(id)a3
{
  id v4 = (id)objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"headerFooterButton", @"identifier", 0);
  [(SUUIButtonViewElement *)self->_buttonElement dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:v4 completionBlock:0];
}

+ (id)_buttonWithButtonElement:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F824E8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  CGFloat v6 = [v4 buttonText];

  double v7 = [v6 string];

  [v5 setTitle:v7 forState:0];
  CGFloat v8 = [v5 tintColor];
  [v5 setTitleColor:v8 forState:0];

  return v5;
}

- (void)_reloadWithButtonElement:(id)a3 context:(id)a4
{
  id v18 = a3;
  objc_storeStrong((id *)&self->_buttonElement, a3);
  id v7 = a4;
  button = self->_button;
  if (button)
  {
    [(UIButton *)button removeFromSuperview];
    double v9 = self->_button;
    self->_button = 0;
  }
  CGFloat v10 = [(id)objc_opt_class() _buttonWithButtonElement:v18];
  double v11 = self->_button;
  self->_button = v10;

  [(UIButton *)self->_button addTarget:self action:sel__buttonTapped_ forControlEvents:64];
  CGFloat v12 = [v18 style];
  double v13 = [v12 ikColor];
  double v14 = [v7 tintColor];

  double v15 = SUUIViewElementPlainColorWithIKColor(v13, v14);

  [(UIButton *)self->_button setTitleColor:v15 forState:0];
  double v16 = self->_button;
  CGFloat v17 = [v15 colorWithAlphaComponent:0.2];
  [(UIButton *)v16 setTitleColor:v17 forState:1];

  [(SUUIButtonFooterSettingsHeaderFooterDescriptionView *)self addSubview:self->_button];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_buttonElement, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end