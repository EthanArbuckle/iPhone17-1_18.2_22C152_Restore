@interface SKUIButtonFooterSettingsHeaderFooterDescriptionView
+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5;
+ (id)_buttonWithButtonElement:(id)a3;
+ (void)requestLayoutForSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)_buttonTapped:(id)a3;
- (void)_reloadWithButtonElement:(id)a3 context:(id)a4;
- (void)layoutSubviews;
- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SKUIButtonFooterSettingsHeaderFooterDescriptionView

+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIButtonFooterSettingsHeaderFooterDescriptionView preferredSizeForSettingsHeaderFooterDescription:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIButtonFooterSettingsHeaderFooterDescriptionView prefetchResourcesForSettingsHeaderFooterDescription:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

+ (void)requestLayoutForSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v5) {
      +[SKUIButtonFooterSettingsHeaderFooterDescriptionView requestLayoutForSettingsHeaderFooterDescription:width:context:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5
{
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        +[SKUIButtonFooterSettingsHeaderFooterDescriptionView sizeThatFitsWidth:settingsHeaderFooterDescription:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v16 = [v7 viewElement];
  v17 = [v16 firstChildForElementType:12];
  v18 = [a1 _buttonWithButtonElement:v17];
  v19 = [v18 titleLabel];
  v20 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  [v19 setFont:v20];
  objc_msgSend(v19, "sizeThatFits:", a3, 1.0);
  double v22 = v21;
  double v24 = v23;
  objc_msgSend(v19, "setFrame:", 0.0, 0.0, v21, v23);
  [v20 _scaledValueForValue:20.0];
  double v26 = v25;
  [v19 _firstLineBaselineFrameOriginY];
  double v28 = v24 + v26 - v27;

  double v29 = v22;
  double v30 = v28;
  result.height = v30;
  result.width = v29;
  return result;
}

- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUIButtonFooterSettingsHeaderFooterDescriptionView reloadWithSettingsHeaderFooterDescription:width:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  v17 = [v7 viewElement];
  viewElement = self->_viewElement;
  self->_viewElement = v17;

  v19 = [(SKUIViewElement *)self->_viewElement firstChildForElementType:12];
  buttonElement = self->_buttonElement;
  self->_buttonElement = v19;

  button = self->_button;
  if (button)
  {
    [(UIButton *)button removeFromSuperview];
    double v22 = self->_button;
    self->_button = 0;
  }
  double v23 = [(id)objc_opt_class() _buttonWithButtonElement:self->_buttonElement];
  double v24 = self->_button;
  self->_button = v23;

  [(UIButton *)self->_button addTarget:self action:sel__buttonTapped_ forControlEvents:64];
  double v25 = [(SKUIButtonViewElement *)self->_buttonElement style];
  double v26 = [v25 ikColor];
  double v27 = [v8 tintColor];

  double v28 = SKUIViewElementPlainColorWithIKColor(v26, v27);

  [(UIButton *)self->_button setTitleColor:v28 forState:0];
  double v29 = self->_button;
  double v30 = [v28 colorWithAlphaComponent:0.2];
  [(UIButton *)v29 setTitleColor:v30 forState:1];

  [(SKUIButtonFooterSettingsHeaderFooterDescriptionView *)self addSubview:self->_button];
  [(SKUIButtonFooterSettingsHeaderFooterDescriptionView *)self setNeedsLayout];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIButtonFooterSettingsHeaderFooterDescriptionView setImage:forArtworkRequest:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

- (void)layoutSubviews
{
}

- (void)_buttonTapped:(id)a3
{
  id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"headerFooterButton", @"identifier", 0);
  [(SKUIButtonViewElement *)self->_buttonElement dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:v4 completionBlock:0];
}

+ (id)_buttonWithButtonElement:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4FB14D0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 buttonText];

  uint64_t v7 = [v6 string];

  [v5 setTitle:v7 forState:0];
  uint64_t v8 = [v5 tintColor];
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
    uint64_t v9 = self->_button;
    self->_button = 0;
  }
  uint64_t v10 = [(id)objc_opt_class() _buttonWithButtonElement:v18];
  uint64_t v11 = self->_button;
  self->_button = v10;

  [(UIButton *)self->_button addTarget:self action:sel__buttonTapped_ forControlEvents:64];
  uint64_t v12 = [v18 style];
  uint64_t v13 = [v12 ikColor];
  uint64_t v14 = [v7 tintColor];

  uint64_t v15 = SKUIViewElementPlainColorWithIKColor(v13, v14);

  [(UIButton *)self->_button setTitleColor:v15 forState:0];
  uint64_t v16 = self->_button;
  v17 = [v15 colorWithAlphaComponent:0.2];
  [(UIButton *)v16 setTitleColor:v17 forState:1];

  [(SKUIButtonFooterSettingsHeaderFooterDescriptionView *)self addSubview:self->_button];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_buttonElement, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

+ (void)preferredSizeForSettingsHeaderFooterDescription:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForSettingsHeaderFooterDescription:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForSettingsHeaderFooterDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 settingsHeaderFooterDescription:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reloadWithSettingsHeaderFooterDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end