@interface WFWidgetConfigurationAttributionYahooFinanceLogoAttachment
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (WFWidgetConfigurationAttributionYahooFinanceLogoAttachment)init;
- (id)accessibilityLabel;
@end

@implementation WFWidgetConfigurationAttributionYahooFinanceLogoAttachment

- (id)accessibilityLabel
{
  return sub_100019F54(@"Yahoo Finance");
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double v7 = ceil(a4.size.height * 26.0 / 30.0);
  v8 = [(WFWidgetConfigurationAttributionYahooFinanceLogoAttachment *)self image];
  [v8 size];
  double v10 = v9;
  v11 = [(WFWidgetConfigurationAttributionYahooFinanceLogoAttachment *)self image];
  [v11 size];
  double v13 = v7 * (v10 / v12);

  double v14 = -ceil(v7 * 0.21);
  double v15 = 0.0;
  double v16 = v13;
  double v17 = v7;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (WFWidgetConfigurationAttributionYahooFinanceLogoAttachment)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFWidgetConfigurationAttributionYahooFinanceLogoAttachment;
  v2 = [(WFWidgetConfigurationAttributionYahooFinanceLogoAttachment *)&v7 initWithData:0 ofType:0];
  if (v2)
  {
    v3 = +[UIImage imageNamed:@"YahooFinance"];
    v4 = [v3 imageWithRenderingMode:2];

    [(WFWidgetConfigurationAttributionYahooFinanceLogoAttachment *)v2 setImage:v4];
    v5 = v2;
  }
  return v2;
}

@end