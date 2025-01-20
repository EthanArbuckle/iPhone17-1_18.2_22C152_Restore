@interface SUUITextFooterSettingsHeaderFooterDescriptionView
+ (BOOL)prefetchResourcesForSettingsHeaderFooterDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingsHeaderFooterDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingsHeaderFooterDescription:(id)a4 context:(id)a5;
+ (id)_concatenateTextFromLabelElements:(id)a3;
+ (id)_labelElementsFromViewElement:(id)a3;
+ (id)_labelWithLabelElements:(id)a3;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)layoutSubviews;
- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUITextFooterSettingsHeaderFooterDescriptionView

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
  v8 = [(id)objc_opt_class() _labelElementsFromViewElement:v7];
  v9 = [a1 _labelWithLabelElements:v8];
  v10 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588]];
  [v9 setFont:v10];
  objc_msgSend(v9, "sizeThatFits:", a3, 1.0);
  double v12 = v11;
  double v14 = v13;
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v11, v13);
  [v10 _scaledValueForValue:16.0];
  double v16 = v15;
  [v9 _firstLineBaselineFrameOriginY];
  double v18 = v14 + v16 - v17;

  double v19 = v12;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)reloadWithSettingsHeaderFooterDescription:(id)a3 width:(double)a4 context:(id)a5
{
  objc_msgSend(a3, "viewElement", a4);
  v6 = (SUUIViewElement *)objc_claimAutoreleasedReturnValue();
  viewElement = self->_viewElement;
  self->_viewElement = v6;

  id v12 = [(id)objc_opt_class() _labelElementsFromViewElement:self->_viewElement];
  label = self->_label;
  if (label)
  {
    [(UILabel *)label removeFromSuperview];
    v9 = self->_label;
    self->_label = 0;
  }
  v10 = [(id)objc_opt_class() _labelWithLabelElements:v12];
  double v11 = self->_label;
  self->_label = v10;

  [(SUUITextFooterSettingsHeaderFooterDescriptionView *)self addSubview:self->_label];
  [(SUUITextFooterSettingsHeaderFooterDescriptionView *)self setNeedsLayout];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SUUITextFooterSettingsHeaderFooterDescriptionView;
  [(SUUITextFooterSettingsHeaderFooterDescriptionView *)&v22 layoutSubviews];
  v3 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588]];
  [(UILabel *)self->_label setFont:v3];
  [(SUUITextFooterSettingsHeaderFooterDescriptionView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(SUUITextFooterSettingsHeaderFooterDescriptionView *)self layoutMargins];
  double v13 = v12;
  double v15 = v14;
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  CGFloat v16 = CGRectGetWidth(v23) - v13 - v15;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v16, 1.0);
  double v18 = v17;
  [v3 _scaledValueForValue:16.0];
  double v20 = v19;
  [(UILabel *)self->_label _firstBaselineOffsetFromTop];
  -[UILabel setFrame:](self->_label, "setFrame:", v13, v20 - v21, v16, v18);
}

+ (id)_concatenateTextFromLabelElements:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "text", (void)v14);
        CGFloat v11 = [v10 string];

        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  double v12 = [v4 componentsJoinedByString:@"\n"];

  return v12;
}

+ (id)_labelElementsFromViewElement:(id)a3
{
  return (id)[a3 titleLabels];
}

+ (id)_labelWithLabelElements:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F828E0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setNumberOfLines:0];
  uint64_t v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
  [v6 setTextColor:v7];

  uint64_t v8 = [a1 _concatenateTextFromLabelElements:v5];

  [v6 setText:v8];
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end