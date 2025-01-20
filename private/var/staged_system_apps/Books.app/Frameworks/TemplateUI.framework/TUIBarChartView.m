@interface TUIBarChartView
+ (id)renderModelWithIdentifier:(id)a3 title:(id)a4 footer:(id)a5 columns:(int64_t)a6 cornerRadius:(double)a7 progress:(double)a8 spacing:(double)a9 color:(id)a10 backgroundColor:(id)a11 shadowColor:(id)a12;
- (BOOL)clipsToBounds;
- (NSString)chartType;
- (NSString)footer;
- (NSString)title;
- (UIColor)backgroundColor;
- (UIColor)color;
- (UIColor)shadowColor;
- (_TUIBarChartRenderModel)renderModel;
- (double)calculatedInsetForFooterText;
- (double)calculatedInsetForTitleText;
- (double)cornerRadius;
- (double)progress;
- (double)spacing;
- (int64_t)columns;
- (void)_configureWithModel:(id)a3;
- (void)_setupBarChartBars;
- (void)_setupTextFields;
- (void)applyLayoutAttributes:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCalculatedInsetForFooterText:(double)a3;
- (void)setCalculatedInsetForTitleText:(double)a3;
- (void)setChartType:(id)a3;
- (void)setColor:(id)a3;
- (void)setColumns:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFooter:(id)a3;
- (void)setProgress:(double)a3;
- (void)setRenderModel:(id)a3;
- (void)setShadowColor:(id)a3;
- (void)setSpacing:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation TUIBarChartView

+ (id)renderModelWithIdentifier:(id)a3 title:(id)a4 footer:(id)a5 columns:(int64_t)a6 cornerRadius:(double)a7 progress:(double)a8 spacing:(double)a9 color:(id)a10 backgroundColor:(id)a11 shadowColor:(id)a12
{
  id v21 = a12;
  id v22 = a11;
  id v23 = a10;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  v27 = objc_alloc_init(_TUIBarChartRenderModel);
  [(_TUIBarChartRenderModel *)v27 setTitle:v25];

  [(_TUIBarChartRenderModel *)v27 setFooter:v24];
  [(_TUIBarChartRenderModel *)v27 setColumns:a6];
  [(_TUIBarChartRenderModel *)v27 setCornerRadius:a7];
  [(_TUIBarChartRenderModel *)v27 setProgress:a8];
  [(_TUIBarChartRenderModel *)v27 setSpacing:a9];
  [(_TUIBarChartRenderModel *)v27 setColor:v23];

  [(_TUIBarChartRenderModel *)v27 setBackgroundColor:v22];
  [(_TUIBarChartRenderModel *)v27 setShadowColor:v21];

  v28 = [[TUIRenderModelView alloc] initWithReuseIdentifier:@"TUIReuseIdentifierBarChartView" identifier:v26 submodel:v27];

  return v28;
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TUIBarChartView;
  id v4 = a3;
  [(TUIReusableBaseView *)&v7 applyLayoutAttributes:v4];
  v5 = [v4 renderModel];

  v6 = [v5 submodel];
  [(TUIBarChartView *)self _configureWithModel:v6];
}

- (void)_configureWithModel:(id)a3
{
  id v19 = a3;
  p_renderModel = &self->_renderModel;
  objc_storeStrong((id *)&self->_renderModel, a3);
  v6 = [(_TUIBarChartRenderModel *)self->_renderModel title];
  title = self->_title;
  self->_title = v6;

  v8 = [(_TUIBarChartRenderModel *)self->_renderModel footer];
  footer = self->_footer;
  self->_footer = v8;

  self->_columns = (int64_t)[v19 columns];
  [v19 cornerRadius];
  self->_cornerRadius = v10;
  [v19 progress];
  self->_progress = v11;
  [v19 spacing];
  self->_spacing = v12;
  v13 = [(_TUIBarChartRenderModel *)self->_renderModel color];
  v14 = v13;
  if (!v13)
  {
    v14 = +[UIColor redColor];
  }
  objc_storeStrong((id *)&self->_color, v14);
  if (!v13) {

  }
  v15 = [(_TUIBarChartRenderModel *)*p_renderModel color];
  v16 = v15;
  if (!v15)
  {
    v16 = +[UIColor whiteColor];
  }
  objc_storeStrong((id *)&self->_backgroundColor, v16);
  if (!v15) {

  }
  v17 = [(_TUIBarChartRenderModel *)*p_renderModel color];
  v18 = v17;
  if (!v17)
  {
    v18 = +[UIColor yellowColor];
  }
  objc_storeStrong((id *)&self->_shadowColor, v18);
  if (!v17) {

  }
  [(TUIBarChartView *)self _setupTextFields];
  [(TUIBarChartView *)self _setupBarChartBars];
}

- (void)_setupTextFields
{
  v3 = [(TUIBarChartView *)self title];
  id v4 = [v3 length];

  if (v4)
  {
    [(TUIBarChartView *)self setCalculatedInsetForTitleText:20.0];
    [(TUIBarChartView *)self bounds];
    id v6 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 0.0, v5, 20.0];
    objc_super v7 = [(TUIBarChartView *)self title];
    v8 = [v7 uppercaseString];
    [v6 setText:v8];

    v9 = +[UIFont boldSystemFontOfSize:12.0];
    [v6 setFont:v9];

    [v6 setNumberOfLines:1];
    [v6 setClipsToBounds:1];
    double v10 = +[UIColor clearColor];
    [v6 setBackgroundColor:v10];

    double v11 = +[UIColor blackColor];
    [v6 setTextColor:v11];

    [v6 setTextAlignment:1];
    [(TUIBarChartView *)self addSubview:v6];
  }
  double v12 = [(TUIBarChartView *)self footer];
  id v13 = [v12 length];

  if (v13)
  {
    [(TUIBarChartView *)self setCalculatedInsetForFooterText:20.0];
    [(TUIBarChartView *)self bounds];
    double v15 = v14 + -20.0;
    [(TUIBarChartView *)self bounds];
    id v22 = [objc_alloc((Class)UILabel) initWithFrame:0.0, v15, v16, 20.0];
    v17 = [(TUIBarChartView *)self footer];
    v18 = [v17 uppercaseString];
    [v22 setText:v18];

    id v19 = +[UIFont systemFontOfSize:12.0];
    [v22 setFont:v19];

    [v22 setNumberOfLines:1];
    [v22 setClipsToBounds:1];
    v20 = +[UIColor clearColor];
    [v22 setBackgroundColor:v20];

    id v21 = +[UIColor grayColor];
    [v22 setTextColor:v21];

    [v22 setTextAlignment:1];
    [(TUIBarChartView *)self addSubview:v22];
  }
}

- (void)_setupBarChartBars
{
  [(TUIBarChartView *)self spacing];
  double v3 = 6.0;
  if (v4 > 0.0)
  {
    [(TUIBarChartView *)self spacing];
    double v3 = v5;
  }
  [(TUIBarChartView *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  [(TUIBarChartView *)self calculatedInsetForTitleText];
  double v15 = v14;
  [(TUIBarChartView *)self calculatedInsetForFooterText];
  double v17 = v13 - (v15 + v16);
  uint64_t v18 = [(TUIBarChartView *)self columns];
  v32.origin.x = v7;
  v32.origin.y = v9;
  v32.size.width = v11;
  v32.size.height = v17;
  double v19 = (CGRectGetWidth(v32) - (double)(v18 - 1) * v3) / (double)v18;
  if (v18 <= 1) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v18;
  }
  double v21 = 0.0;
  do
  {
    [(TUIBarChartView *)self calculatedInsetForTitleText];
    double v23 = v22;
    double v24 = (double)arc4random_uniform(0x65u) / -100.0;
    v33.origin.x = v21;
    v33.origin.y = v23;
    v33.size.width = v19;
    v33.size.height = v17;
    CGFloat Height = CGRectGetHeight(v33);
    CGFloat v26 = Height + Height * v24;
    v27 = +[CALayer layer];
    [v27 setBounds:v21, v23, v19, v17];
    [v27 setFrame:v21, v23, v19, v17];
    [v27 setBorderColor:[self->_color CGColor]];
    id v28 = [(UIColor *)self->_color colorWithAlphaComponent:0.1];
    objc_msgSend(v27, "setBackgroundColor:", objc_msgSend(v28, "CGColor"));

    [v27 setCornerRadius:self->_cornerRadius];
    [v27 setMasksToBounds:1];
    v29 = [(TUIBarChartView *)self layer];
    [v29 addSublayer:v27];

    v30 = +[CALayer layer];
    double v31 = v23 + v26;
    [v30 setBounds:v21, v31, v19, v17];
    [v30 setFrame:v21, v31, v19, v17];
    [v30 setBorderColor:[self->_color CGColor]];
    [v30 setBackgroundColor:[v27 borderColor]];
    [v30 setCornerRadius:self->_cornerRadius];
    [v30 setMasksToBounds:1];
    [v27 addSublayer:v30];

    double v21 = v3 + v19 + v21;
    --v20;
  }
  while (v20);
}

- (BOOL)clipsToBounds
{
  return 1;
}

- (_TUIBarChartRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
}

- (NSString)chartType
{
  return self->_chartType;
}

- (void)setChartType:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (int64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(int64_t)a3
{
  self->_columns = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
}

- (double)calculatedInsetForTitleText
{
  return self->_calculatedInsetForTitleText;
}

- (void)setCalculatedInsetForTitleText:(double)a3
{
  self->_calculatedInsetForTitleText = a3;
}

- (double)calculatedInsetForFooterText
{
  return self->_calculatedInsetForFooterText;
}

- (void)setCalculatedInsetForFooterText:(double)a3
{
  self->_calculatedInsetForFooterText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_chartType, 0);

  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end