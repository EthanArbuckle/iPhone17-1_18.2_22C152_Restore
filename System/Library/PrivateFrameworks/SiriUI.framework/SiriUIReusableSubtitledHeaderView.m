@interface SiriUIReusableSubtitledHeaderView
+ (double)defaultHeight;
- (NSAttributedString)attributedSubtitleText;
- (NSString)subtitleText;
- (SiriUIReusableSubtitledHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)subtitleLabel;
- (double)desiredHeightForWidth:(double)a3;
- (void)_configureSubTitleLabelForBounds:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAttributedSubtitleText:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleText:(id)a3;
@end

@implementation SiriUIReusableSubtitledHeaderView

- (SiriUIReusableSubtitledHeaderView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriUIReusableSubtitledHeaderView;
  v3 = -[SiriUIReusableHeaderView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F74480] labelWithSubtitleFont];
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v4;

    [(SiriUIReusableSubtitledHeaderView *)v3 addSubview:v3->_subtitleLabel];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SiriUIReusableSubtitledHeaderView;
  [(SiriUIReusableHeaderView *)&v3 layoutSubviews];
  [(SiriUIReusableSubtitledHeaderView *)self bounds];
  -[SiriUIReusableSubtitledHeaderView _configureSubTitleLabelForBounds:](self, "_configureSubTitleLabelForBounds:");
}

- (void)setSubtitleText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (objc_class *)MEMORY[0x263F086A0];
    id v5 = a3;
    id v6 = (id)[[v4 alloc] initWithString:v5];
  }
  else
  {
    id v6 = 0;
  }
  [(SiriUIReusableSubtitledHeaderView *)self setAttributedSubtitleText:v6];
}

- (NSString)subtitleText
{
  v2 = [(SiriUIReusableSubtitledHeaderView *)self attributedSubtitleText];
  objc_super v3 = [v2 string];

  return (NSString *)v3;
}

- (void)setAttributedSubtitleText:(id)a3
{
  id v4 = a3;
  id v5 = (NSAttributedString *)[v4 copy];
  attributedSubtitleText = self->_attributedSubtitleText;
  self->_attributedSubtitleText = v5;

  [(UILabel *)self->_subtitleLabel setAttributedText:v4];
  [(SiriUIReusableSubtitledHeaderView *)self setNeedsLayout];
}

- (void)_configureSubTitleLabelForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v6 = a3.size.width - (8.0 + 8.0);
  [(UILabel *)self->_subtitleLabel setNumberOfLines:1];
  objc_super v7 = [(UILabel *)self->_subtitleLabel attributedText];
  id v14 = (id)[v7 mutableCopy];

  if (v14)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F1C350]);
    [v8 setLineSpacing:0.0];
    [v8 setMinimumLineHeight:20.0];
    [v8 setMaximumLineHeight:20.0];
    [v8 setAlignment:1];
    uint64_t v9 = *MEMORY[0x263F1C268];
    v10 = [v14 string];
    objc_msgSend(v14, "addAttribute:value:range:", v9, v8, 0, objc_msgSend(v10, "length"));

    [(UILabel *)self->_subtitleLabel setAttributedText:v14];
  }
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  if (v11 > v6)
  {
    [(UILabel *)self->_subtitleLabel setNumberOfLines:3];
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v6, height - (10.0 + 10.0));
  }
  v16.origin.double y = y + 10.0;
  v16.origin.double x = x + 8.0;
  v16.size.width = v6;
  v16.size.double height = height - (10.0 + 10.0);
  CGRectGetMaxY(v16);
  v12 = [MEMORY[0x263F1C920] mainScreen];
  [v12 scale];

  UIRectCenteredXInRect();
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:");
}

- (double)desiredHeightForWidth:(double)a3
{
  -[SiriUIReusableSubtitledHeaderView _configureSubTitleLabelForBounds:](self, "_configureSubTitleLabelForBounds:", 0.0, 0.0, a3, 1.79769313e308);
  [(UILabel *)self->_subtitleLabel frame];
  double v6 = v5;
  if ([(UILabel *)self->_subtitleLabel numberOfLines] == 1)
  {
    v21.receiver = self;
    v21.super_class = (Class)SiriUIReusableSubtitledHeaderView;
    [(SiriUIReusableHeaderView *)&v21 desiredHeightForWidth:a3];
    double v8 = v7;
    [(id)objc_opt_class() defaultHeight];
    double v10 = v8 + v9;
    +[SiriUIReusableHeaderView defaultHeight];
    return v10 - v11;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SiriUIReusableSubtitledHeaderView;
    [(SiriUIReusableHeaderView *)&v20 desiredHeightForWidth:a3];
    double v14 = v6 + v13;
    v15 = [MEMORY[0x263F1C920] mainScreen];
    [v15 scale];
    BOOL v17 = v16 < 2.0;
    double v18 = 1.5;
    if (v17) {
      double v18 = 2.0;
    }
    double v12 = v14 + v18;
  }
  return v12;
}

+ (double)defaultHeight
{
  return 97.0;
}

- (NSAttributedString)attributedSubtitleText
{
  return self->_attributedSubtitleText;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_attributedSubtitleText, 0);
}

@end