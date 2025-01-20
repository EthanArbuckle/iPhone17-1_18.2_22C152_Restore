@interface SUUISuggestedHandlesSettingsHeaderFooterDescriptionView
+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5;
+ (id)_helpLabelWithDescription:(id)a3 forWidth:(double)a4;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)_buttonAction:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUISuggestedHandlesSettingsHeaderFooterDescriptionView

+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5
{
  id v7 = a4;
  v8 = [v7 suggestedHandles];
  unint64_t v9 = [v8 count];

  uint64_t v10 = *MEMORY[0x263F83600];
  v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83600]];
  [v11 _scaledValueForValue:30.0];
  double v13 = v12;
  v14 = [MEMORY[0x263F81708] preferredFontForTextStyle:v10];
  [v14 _scaledValueForValue:22.0];
  double v16 = v15;
  v17 = [a1 _helpLabelWithDescription:v7 forWidth:a3];

  [v17 _firstLineBaselineFrameOriginY];
  double v19 = v16 - v18;
  [v17 _lastLineBaselineFrameOriginY];
  double v21 = v19 + v20 + v13 * (double)v9;

  double v22 = a3;
  double v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  p_description = &self->_description;
  objc_storeStrong((id *)&self->_description, a3);
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() _helpLabelWithDescription:*p_description forWidth:a4];
  label = self->_label;
  self->_label = v10;

  [(SUUISuggestedHandlesSettingsHeaderFooterDescriptionView *)self addSubview:self->_label];
  double v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  buttons = self->_buttons;
  self->_buttons = v12;

  v14 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83600]];
  double v15 = [(SUUISuggestedHandlesSettingsHeaderFooterDescription *)*p_description suggestedHandles];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __115__SUUISuggestedHandlesSettingsHeaderFooterDescriptionView_reloadWithSettingsHeaderFooterDescription_width_context___block_invoke;
  v17[3] = &unk_2654061A8;
  id v18 = v14;
  double v19 = self;
  id v16 = v14;
  [v15 enumerateObjectsUsingBlock:v17];
}

void __115__SUUISuggestedHandlesSettingsHeaderFooterDescriptionView_reloadWithSettingsHeaderFooterDescription_width_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = (void *)MEMORY[0x263F824E8];
  id v6 = a2;
  id v11 = [v5 buttonWithType:1];
  id v7 = [NSString stringWithFormat:@"@%@", v6];

  [v11 setTitle:v7 forState:0];
  v8 = [MEMORY[0x263F825C8] systemPinkColor];
  [v11 setTitleColor:v8 forState:0];

  id v9 = [v11 titleLabel];
  [v9 setFont:*(void *)(a1 + 32)];

  uint64_t v10 = [v11 titleLabel];
  [v10 setTextAlignment:0];

  [v11 setTag:a3];
  [v11 addTarget:*(void *)(a1 + 40) action:sel__buttonAction_ forControlEvents:64];
  [*(id *)(*(void *)(a1 + 40) + 408) addObject:v11];
  [*(id *)(a1 + 40) addSubview:v11];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)SUUISuggestedHandlesSettingsHeaderFooterDescriptionView;
  [(SUUISuggestedHandlesSettingsHeaderFooterDescriptionView *)&v34 layoutSubviews];
  [(SUUISuggestedHandlesSettingsHeaderFooterDescriptionView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SUUISuggestedHandlesSettingsHeaderFooterDescriptionView *)self layoutMargins];
  uint64_t v29 = v12;
  uint64_t v30 = v11;
  double v14 = v13;
  double v16 = v15;
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  CGFloat v17 = CGRectGetWidth(v35) - v14 - v16;
  uint64_t v18 = *MEMORY[0x263F83600];
  double v19 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83600]];
  [v19 _scaledValueForValue:22.0];
  double v21 = v20;
  [(UILabel *)self->_label _firstBaselineOffsetFromTop];
  double v23 = v21 - v22;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v17, 1.0);
  -[UILabel setFrame:](self->_label, "setFrame:", v14, v23, v17, v24);
  v25 = [MEMORY[0x263F81708] preferredFontForTextStyle:v18];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  uint64_t v33 = 0;
  [(UILabel *)self->_label _lastLineBaselineFrameOriginY];
  uint64_t v33 = v26;
  [v25 _scaledValueForValue:30.0];
  buttons = self->_buttons;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __73__SUUISuggestedHandlesSettingsHeaderFooterDescriptionView_layoutSubviews__block_invoke;
  v31[3] = &unk_265406CC0;
  v31[4] = v32;
  v31[5] = v28;
  *(CGFloat *)&v31[6] = v4;
  *(CGFloat *)&v31[7] = v6;
  *(CGFloat *)&v31[8] = v8;
  *(CGFloat *)&v31[9] = v10;
  v31[10] = v30;
  *(double *)&v31[11] = v14;
  v31[12] = v29;
  *(double *)&v31[13] = v16;
  [(NSMutableArray *)buttons enumerateObjectsUsingBlock:v31];
  _Block_object_dispose(v32, 8);
}

void __73__SUUISuggestedHandlesSettingsHeaderFooterDescriptionView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(a1 + 40)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  id v3 = a2;
  id v8 = [v3 titleLabel];
  [v8 _firstBaselineOffsetFromTop];
  double v5 = v4;
  objc_msgSend(v3, "sizeThatFits:", CGRectGetWidth(*(CGRect *)(a1 + 48)), 1.0);
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 88), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) - v5, v6, v7);
}

- (void)_buttonAction:(id)a3
{
  uint64_t v4 = [a3 tag];
  description = self->_description;
  [(SUUISuggestedHandlesSettingsHeaderFooterDescription *)description selectedHandleAtIndex:v4];
}

+ (id)_helpLabelWithDescription:(id)a3 forWidth:(double)a4
{
  double v5 = (objc_class *)MEMORY[0x263F828E0];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  id v8 = [v6 helpText];

  [v7 setText:v8];
  [v7 setNumberOfLines:0];
  double v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83600]];
  [v7 setFont:v9];
  CGFloat v10 = [MEMORY[0x263F825C8] systemGrayColor];
  [v7 setColor:v10];

  objc_msgSend(v7, "sizeThatFits:", a4, 1.0);
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, a4, v11);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end