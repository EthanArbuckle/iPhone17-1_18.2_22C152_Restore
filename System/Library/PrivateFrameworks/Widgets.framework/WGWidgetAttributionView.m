@interface WGWidgetAttributionView
+ (id)widgetAttributionIDsInOrder;
+ (void)requestAttributedStringForIdentifier:(id)a3 withHandler:(id)a4;
- (UIColor)legibilityTextColor;
- (WGWidgetAttributionView)initWithWidgetAttributedString:(id)a3;
- (id)_attributionBackgroundColor;
- (id)_attributionFont;
- (id)_paragraphStyle;
- (void)_configureAttributedString;
- (void)layoutSubviews;
- (void)setLegibilityTextColor:(id)a3;
@end

@implementation WGWidgetAttributionView

+ (void)requestAttributedStringForIdentifier:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"com.apple.weather.WeatherAppTodayWidget"])
  {
    if (v6)
    {
      v7 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76__WGWidgetAttributionView_requestAttributedStringForIdentifier_withHandler___block_invoke;
      block[3] = &unk_2646768C8;
      id v13 = v6;
      dispatch_async(v7, block);

      v8 = v13;
LABEL_7:
    }
  }
  else if ([v5 isEqualToString:@"com.apple.stocks.widget"])
  {
    if (v6)
    {
      v9 = dispatch_get_global_queue(25, 0);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __76__WGWidgetAttributionView_requestAttributedStringForIdentifier_withHandler___block_invoke_2;
      v10[3] = &unk_2646768C8;
      id v11 = v6;
      dispatch_async(v9, v10);

      v8 = v11;
      goto LABEL_7;
    }
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __76__WGWidgetAttributionView_requestAttributedStringForIdentifier_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  WAAttributionString();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __76__WGWidgetAttributionView_requestAttributedStringForIdentifier_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  StocksAttributionString();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (id)widgetAttributionIDsInOrder
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"com.apple.weather.WeatherAppTodayWidget";
  v4[1] = @"com.apple.stocks.widget";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

- (WGWidgetAttributionView)initWithWidgetAttributedString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WGWidgetAttributionView;
  id v5 = [(WGWidgetAttributionView *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v4];
    widgetAttributedString = v5->_widgetAttributedString;
    v5->_widgetAttributedString = (NSMutableAttributedString *)v6;

    [(WGWidgetAttributionView *)v5 _configureAttributedString];
    v8 = [(WGWidgetAttributionView *)v5 _attributionBackgroundColor];
    [(WGWidgetAttributionView *)v5 setBackgroundColor:v8];

    [(WGWidgetAttributionView *)v5 setOpaque:0];
    [(WGWidgetAttributionView *)v5 setEditable:0];
  }

  return v5;
}

- (id)_attributionFont
{
  id v2 = [MEMORY[0x263F29D38] preferredFontProvider];
  v3 = [v2 preferredFontForTextStyle:*MEMORY[0x263F1D278] hiFontStyle:1];

  return v3;
}

- (id)_attributionBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] clearColor];
}

- (id)_paragraphStyle
{
  id v2 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v2 setAlignment:1];
  return v2;
}

- (void)_configureAttributedString
{
  v21[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSMutableAttributedString *)self->_widgetAttributedString length];
  uint64_t v4 = *MEMORY[0x263F1C240];
  -[NSMutableAttributedString removeAttribute:range:](self->_widgetAttributedString, "removeAttribute:range:", *MEMORY[0x263F1C240], 0, v3);
  uint64_t v5 = *MEMORY[0x263F1C238];
  -[NSMutableAttributedString removeAttribute:range:](self->_widgetAttributedString, "removeAttribute:range:", *MEMORY[0x263F1C238], 0, v3);
  widgetAttributedString = self->_widgetAttributedString;
  v7 = [(WGWidgetAttributionView *)self _attributionFont];
  -[NSMutableAttributedString addAttribute:value:range:](widgetAttributedString, "addAttribute:value:range:", v5, v7, 0, v3);

  v8 = self->_widgetAttributedString;
  uint64_t v9 = *MEMORY[0x263F1C268];
  objc_super v10 = [(WGWidgetAttributionView *)self _paragraphStyle];
  -[NSMutableAttributedString addAttribute:value:range:](v8, "addAttribute:value:range:", v9, v10, 0, v3);

  id v11 = [(WGWidgetAttributionView *)self legibilityTextColor];

  if (v11)
  {
    v12 = self->_widgetAttributedString;
    id v13 = [(WGWidgetAttributionView *)self legibilityTextColor];
    -[NSMutableAttributedString addAttribute:value:range:](v12, "addAttribute:value:range:", v4, v13, 0, v3);

    v20[0] = v4;
    v14 = [(WGWidgetAttributionView *)self legibilityTextColor];
    uint64_t v15 = *MEMORY[0x263F1C2D8];
    v21[0] = v14;
    v21[1] = &unk_26D5D4ED0;
    uint64_t v16 = *MEMORY[0x263F1C2D0];
    v20[1] = v15;
    v20[2] = v16;
    v17 = [(WGWidgetAttributionView *)self legibilityTextColor];
    v18 = [v17 colorWithAlphaComponent:0.4];
    v21[2] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    [(WGWidgetAttributionView *)self setLinkTextAttributes:v19];
  }
  [(WGWidgetAttributionView *)self setAttributedText:self->_widgetAttributedString];
  [(WGWidgetAttributionView *)self invalidateIntrinsicContentSize];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WGWidgetAttributionView;
  [(WGWidgetAttributionView *)&v3 layoutSubviews];
  [(WGWidgetAttributionView *)self _configureAttributedString];
  [(WGWidgetAttributionView *)self sizeToFit];
}

- (void)setLegibilityTextColor:(id)a3
{
  uint64_t v4 = (UIColor *)[a3 copy];
  legibilityTextColor = self->_legibilityTextColor;
  self->_legibilityTextColor = v4;

  [(WGWidgetAttributionView *)self setNeedsLayout];
}

- (UIColor)legibilityTextColor
{
  return self->_legibilityTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilityTextColor, 0);
  objc_storeStrong((id *)&self->_widgetAttributedString, 0);
}

@end