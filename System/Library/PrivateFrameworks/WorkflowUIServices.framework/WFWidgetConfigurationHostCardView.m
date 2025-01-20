@interface WFWidgetConfigurationHostCardView
- (WFWidgetConfigurationHostCardView)initWithRequest:(id)a3;
- (void)showMessage:(id)a3;
- (void)startLoading;
@end

@implementation WFWidgetConfigurationHostCardView

- (void)showMessage:(id)a3
{
  id v7 = objc_alloc_init(MEMORY[0x263F828E0]);
  v4 = WFLocalizedStringFromTable(@"Unable to Load", @"WidgetConfiguration");
  [v7 setText:v4];

  v5 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v7 setFont:v5];

  [v7 setAdjustsFontForContentSizeCategory:1];
  [v7 setNumberOfLines:0];
  [v7 setTextAlignment:1];
  v6 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v7 setTextColor:v6];

  [(WFWidgetConfigurationCardView *)self setContentView:v7 stretchToFit:0];
}

- (void)startLoading
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:101];
  [v3 startAnimating];
  [(WFWidgetConfigurationCardView *)self setContentView:v3 stretchToFit:0];
}

- (WFWidgetConfigurationHostCardView)initWithRequest:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFWidgetConfigurationHostCardView;
  id v3 = [(WFWidgetConfigurationCardView *)&v7 initWithRequest:a3 contentView:0];
  v4 = v3;
  if (v3)
  {
    [(WFWidgetConfigurationHostCardView *)v3 startLoading];
    v5 = v4;
  }

  return v4;
}

@end