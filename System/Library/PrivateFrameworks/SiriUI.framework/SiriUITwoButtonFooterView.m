@interface SiriUITwoButtonFooterView
+ (double)defaultHeight;
- (SiriUIContentButton)leftButton;
- (SiriUIContentButton)rightButton;
- (SiriUITwoButtonFooterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SiriUITwoButtonFooterView

- (SiriUITwoButtonFooterView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SiriUITwoButtonFooterView;
  v3 = -[SiriUITwoButtonFooterView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(SiriUITwoButtonFooterView *)v3 setBackgroundColor:v4];

    uint64_t v5 = +[SiriUIKeyline verticalKeyline];
    verticalKeyline = v3->_verticalKeyline;
    v3->_verticalKeyline = (SiriUIKeyline *)v5;

    [(SiriUITwoButtonFooterView *)v3 addSubview:v3->_verticalKeyline];
    uint64_t v7 = +[SiriUIKeyline keylineWithKeylineType:2];
    horizontalKeyline = v3->_horizontalKeyline;
    v3->_horizontalKeyline = (SiriUIKeyline *)v7;

    [(SiriUITwoButtonFooterView *)v3 addSubview:v3->_horizontalKeyline];
    [(SiriUITwoButtonFooterView *)v3 prepareForReuse];
  }
  return v3;
}

+ (double)defaultHeight
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 scale];

  return 44.0;
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)SiriUITwoButtonFooterView;
  [(SiriUITwoButtonFooterView *)&v7 prepareForReuse];
  [(SiriUIContentButton *)self->_rightButton removeFromSuperview];
  v3 = +[SiriUIContentButton buttonWithLightWeightFont];
  rightButton = self->_rightButton;
  self->_rightButton = v3;

  [(SiriUITwoButtonFooterView *)self addSubview:self->_rightButton];
  [(SiriUIContentButton *)self->_leftButton removeFromSuperview];
  uint64_t v5 = +[SiriUIContentButton buttonWithLightWeightFont];
  leftButton = self->_leftButton;
  self->_leftButton = v5;

  [(SiriUITwoButtonFooterView *)self addSubview:self->_leftButton];
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)SiriUITwoButtonFooterView;
  [(SiriUITwoButtonFooterView *)&v24 layoutSubviews];
  [(SiriUITwoButtonFooterView *)self bounds];
  double x = v25.origin.x;
  CGFloat y = v25.origin.y;
  double width = v25.size.width;
  double height = v25.size.height;
  double MidX = CGRectGetMidX(v25);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  v26.origin.double x = x;
  v26.origin.CGFloat y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  double MinX = CGRectGetMinX(v26);
  objc_super v10 = [MEMORY[0x263F1C920] mainScreen];
  [v10 scale];
  BOOL v12 = v11 < 2.0;
  double v13 = 0.5;
  if (v12) {
    double v13 = 1.0;
  }
  double v14 = MidX + v13;

  -[SiriUIContentButton setFrame:](self->_leftButton, "setFrame:", MinX, v8, v14, height);
  v27.origin.double x = x;
  v27.origin.CGFloat y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  double v23 = MidX;
  -[SiriUIContentButton setFrame:](self->_rightButton, "setFrame:", MidX, v8, CGRectGetMaxX(v27) - MidX, height);
  -[SiriUIKeyline sizeThatFits:](self->_horizontalKeyline, "sizeThatFits:", width, height);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  -[SiriUIKeyline setFrame:](self->_horizontalKeyline, "setFrame:", x, 0.0, v15, v17);
  v28.origin.CGFloat y = 0.0;
  v28.origin.double x = x;
  v28.size.double width = v16;
  v28.size.double height = v18;
  double MaxY = CGRectGetMaxY(v28);
  -[SiriUIKeyline sizeThatFits:](self->_verticalKeyline, "sizeThatFits:", width, height);
  double v21 = v20;
  v29.origin.double x = x;
  v29.origin.CGFloat y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  double v22 = CGRectGetHeight(v29);
  v30.origin.CGFloat y = 0.0;
  v30.origin.double x = x;
  v30.size.double width = v16;
  v30.size.double height = v18;
  -[SiriUIKeyline setFrame:](self->_verticalKeyline, "setFrame:", v23, MaxY, v21, v22 - CGRectGetMaxY(v30));
}

- (SiriUIContentButton)leftButton
{
  return self->_leftButton;
}

- (SiriUIContentButton)rightButton
{
  return self->_rightButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_horizontalKeyline, 0);
  objc_storeStrong((id *)&self->_verticalKeyline, 0);
}

@end