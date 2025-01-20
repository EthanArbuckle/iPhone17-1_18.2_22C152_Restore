@interface SUUISubmitFieldSettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (id)_currentControllerValue;
- (void)_addInputWithElement:(id)a3;
- (void)_addSubmitInputWithElement:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (void)setEnabled:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation SUUISubmitFieldSettingDescriptionView

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUUISubmitFieldSettingDescriptionView;
  -[SUUIFieldSettingDescriptionView setEnabled:](&v7, sel_setEnabled_);
  label = self->_label;
  if (label)
  {
    if (v3) {
      [(SUUISubmitFieldSettingDescriptionView *)self tintColor];
    }
    else {
    v6 = [MEMORY[0x263F825C8] grayColor];
    }
    [(UILabel *)label setTextColor:v6];
  }
}

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  v8 = [v6 viewElement];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__43;
  v10[4] = __Block_byref_object_dispose__43;
  id v11 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __90__SUUISubmitFieldSettingDescriptionView_requestLayoutForSettingDescription_width_context___block_invoke;
  v9[3] = &unk_265400D50;
  v9[4] = v10;
  [v8 enumerateChildrenUsingBlock:v9];
  _Block_object_dispose(v10, 8);
}

void __90__SUUISubmitFieldSettingDescriptionView_requestLayoutForSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v4 = [v5 elementType];
  if ((unint64_t)(v4 - 139) < 2 || v4 == 58) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  objc_storeStrong((id *)&self->_settingDescription, a3);
  id v7 = a3;
  v8 = [v7 viewElement];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__SUUISubmitFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v9[3] = &unk_2654008B8;
  v9[4] = self;
  [v8 enumerateChildrenUsingBlock:v9];
  [(SUUISubmitFieldSettingDescriptionView *)self setNeedsLayout];
}

void __84__SUUISubmitFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 elementType];
  if ((unint64_t)(v3 - 139) < 2 || v3 == 58) {
    [*(id *)(a1 + 32) _addInputWithElement:v4];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SUUISubmitFieldSettingDescriptionView;
  [(SUUISubmitFieldSettingDescriptionView *)&v3 tintColorDidChange];
  [(SUUISubmitFieldSettingDescriptionView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SUUISubmitFieldSettingDescriptionView;
  [(SUUISubmitFieldSettingDescriptionView *)&v18 layoutSubviews];
  [(SUUISettingDescriptionView *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  [(SUUISubmitFieldSettingDescriptionView *)self bounds];
  CGFloat v7 = CGRectGetWidth(v19) - v4 - v6;
  v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [(UILabel *)self->_label setFont:v8];
  [v8 _scaledValueForValue:30.0];
  double v10 = v9;
  [(UILabel *)self->_label _firstBaselineOffsetFromTop];
  double v12 = v10 - v11;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v7, 1.0);
  -[UILabel setFrame:](self->_label, "setFrame:", v4, v12, v7, v13);
  v14 = [(SUUISubmitFieldSettingDescriptionView *)self _currentControllerValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v15 = [v14 BOOLValue];
    label = self->_label;
    if (v15) {
      [(SUUISubmitFieldSettingDescriptionView *)self tintColor];
    }
    else {
    v17 = [MEMORY[0x263F825C8] grayColor];
    }
    [(UILabel *)label setTextColor:v17];
  }
}

- (void)_addInputWithElement:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_inputViewElement, a3);
  if ([v5 isMemberOfClass:objc_opt_class()]) {
    [(SUUISubmitFieldSettingDescriptionView *)self _addSubmitInputWithElement:v5];
  }
}

- (void)_addSubmitInputWithElement:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x263F828E0];
  id v5 = a3;
  double v6 = (UILabel *)objc_alloc_init(v4);
  label = self->_label;
  self->_label = v6;

  v8 = self->_label;
  double v9 = [v5 label];

  [(UILabel *)v8 setText:v9];
  double v10 = self->_label;
  double v11 = [MEMORY[0x263F825C8] grayColor];
  [(UILabel *)v10 setTextColor:v11];

  double v12 = self->_label;
  [(SUUISubmitFieldSettingDescriptionView *)self addSubview:v12];
}

- (id)_currentControllerValue
{
  double v3 = [(SUUIFieldSettingDescription *)self->_settingDescription controller];
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    double v4 = [v3 valueForSettingDescription:self->_settingDescription];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_inputViewElement, 0);
}

@end