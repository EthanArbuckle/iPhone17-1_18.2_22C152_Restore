@interface SiriUISashHeaderView
+ (double)defaultHeight;
+ (id)elementKind;
+ (id)reuseIdentifier;
- (NSString)titleText;
- (SiriUISashHeaderView)initWithFrame:(CGRect)a3;
- (double)desiredHeightForWidth:(double)a3;
- (void)layoutSubviews;
- (void)setTitleText:(id)a3;
@end

@implementation SiriUISashHeaderView

- (SiriUISashHeaderView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SiriUISashHeaderView;
  v3 = -[SiriUISashHeaderView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = v4;

    v6 = v3->_headerLabel;
    v7 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
    [(UILabel *)v6 setFont:v7];

    v8 = v3->_headerLabel;
    v9 = objc_msgSend(MEMORY[0x263F1C550], "siriui_textColor");
    [(UILabel *)v8 setTextColor:v9];

    [(UILabel *)v3->_headerLabel setTextAlignment:0];
    [(UILabel *)v3->_headerLabel setNumberOfLines:1];
    [(SiriUISashHeaderView *)v3 addSubview:v3->_headerLabel];
  }
  return v3;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SiriUISashHeaderView;
  [(SiriUISashHeaderView *)&v10 layoutSubviews];
  [(SiriUISashHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5 + 16.0;
  double v8 = v7 - (16.0 + 16.0);
  [(UILabel *)self->_headerLabel _setLastLineBaselineFrameOriginY:23.0];
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", v8, v4);
  headerLabel = self->_headerLabel;
  [(UILabel *)headerLabel frame];
  [(UILabel *)headerLabel setFrame:v6];
}

- (double)desiredHeightForWidth:(double)a3
{
  return 36.0;
}

- (void)setTitleText:(id)a3
{
  [(UILabel *)self->_headerLabel setText:a3];
  [(SiriUISashHeaderView *)self setNeedsLayout];
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  double v3 = NSStringFromClass(v2);
  double v4 = [v3 stringByAppendingString:@"ReuseIdentifier"];

  return v4;
}

+ (double)defaultHeight
{
  return 36.0;
}

+ (id)elementKind
{
  return (id)*MEMORY[0x263F1D120];
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end