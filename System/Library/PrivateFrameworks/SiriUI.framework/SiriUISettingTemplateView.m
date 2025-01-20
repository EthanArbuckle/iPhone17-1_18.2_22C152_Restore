@interface SiriUISettingTemplateView
- (SiriUISettingTemplateView)initWithDataSource:(id)a3;
- (double)desiredHeight;
- (void)layoutSubviews;
- (void)reloadData;
@end

@implementation SiriUISettingTemplateView

- (SiriUISettingTemplateView)initWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SiriUISettingTemplateView;
  v3 = [(SiriUIBaseTemplateView *)&v9 initWithDataSource:a3];
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    textLabel = v3->_textLabel;
    v3->_textLabel = v4;

    v6 = v3->_textLabel;
    v7 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [(UILabel *)v6 setFont:v7];

    [(SiriUISettingTemplateView *)v3 addSubview:v3->_textLabel];
  }
  return v3;
}

- (double)desiredHeight
{
  return 44.0;
}

- (void)reloadData
{
  v6.receiver = self;
  v6.super_class = (Class)SiriUISettingTemplateView;
  [(SiriUIBaseTemplateView *)&v6 reloadData];
  v3 = [(SiriUIBaseTemplateView *)self dataSource];
  textLabel = self->_textLabel;
  v5 = [v3 text];
  [(UILabel *)textLabel setText:v5];

  [(SiriUISettingTemplateView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SiriUISettingTemplateView;
  [(SiriUISettingTemplateView *)&v13 layoutSubviews];
  [(SiriUISettingTemplateView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SiriUIBaseTemplateView *)self templatedSuperview];
  [v11 templatedContentMargins];

  uint64_t v12 = [(SiriUISettingTemplateView *)self semanticContentAttribute];
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v8, v10);
  if (v12 == 4)
  {
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    CGRectGetWidth(v14);
  }
  UIRectCenteredYInRect();
  -[UILabel setFrame:](self->_textLabel, "setFrame:");
}

- (void).cxx_destruct
{
}

@end