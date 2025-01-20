@interface BKHUDTrack
- (BKHUDTrack)initWithCoder:(id)a3;
- (BKHUDTrack)initWithFrame:(CGRect)a3;
- (BOOL)hudWidthChangeRequired;
- (BOOL)textSizeValid;
- (CGSize)textSize;
- (UIColor)textColor;
- (UIFont)font;
- (UILabel)textLabel;
- (UIVisualEffectView)visualEffectView;
- (double)_centerX;
- (double)cornerRadius;
- (double)horizontalMargin;
- (double)verticalMargin;
- (double)verticalOffset;
- (float)maximumValue;
- (float)minimumValue;
- (float)value;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)title;
- (void)_invalidateTextSize;
- (void)_setupCommon;
- (void)_updateBubblePosition;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setFont:(id)a3;
- (void)setHorizontalMargin:(double)a3;
- (void)setMaximumValue:(float)a3;
- (void)setMinimumValue:(float)a3;
- (void)setTextColor:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setTextSizeValid:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(float)a3;
- (void)setVerticalMargin:(double)a3;
- (void)setVerticalOffset:(double)a3;
- (void)setVisualEffectView:(id)a3;
@end

@implementation BKHUDTrack

- (id)title
{
  v2 = [(BKHUDTrack *)self textLabel];
  v3 = [v2 text];

  return v3;
}

- (void)setTitle:(id)a3
{
  id v10 = a3;
  if (!v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [(BKHUDTrack *)self textLabel];
    id v5 = [v4 text];
    if (v5 == v10)
    {
    }
    else
    {
      v6 = [(BKHUDTrack *)self textLabel];
      v7 = [v6 text];
      unsigned __int8 v8 = [v7 isEqualToString:v10];

      if ((v8 & 1) == 0)
      {
        v9 = [(BKHUDTrack *)self textLabel];
        [v9 setText:v10];

        [(BKHUDTrack *)self _invalidateTextSize];
        [(BKHUDTrack *)self setNeedsLayout];
      }
    }
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

- (UIFont)font
{
  objc_opt_class();
  v3 = [(BKHUDTrack *)self textLabel];
  v4 = [v3 font];
  id v5 = BUDynamicCast();

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = +[UIFont systemFontOfSize:17.0];
  }
  v7 = v6;

  return (UIFont *)v7;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  id v5 = [(BKHUDTrack *)self textLabel];
  [v5 setFont:v4];

  [(BKHUDTrack *)self _invalidateTextSize];
}

- (UIColor)textColor
{
  v2 = [(BKHUDTrack *)self textLabel];
  v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  id v5 = [(BKHUDTrack *)self textLabel];
  [v5 setTextColor:v4];
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    [(BKHUDTrack *)self setNeedsLayout];
  }
}

- (CGSize)textSize
{
  if (![(BKHUDTrack *)self textSizeValid])
  {
    textLabel = self->_textLabel;
    [(BKHUDTrack *)self bounds];
    -[UILabel sizeThatFits:](textLabel, "sizeThatFits:", v4, v5);
    self->_textSize.double width = v6;
    self->_textSize.double height = v7;
    [(BKHUDTrack *)self setTextSizeValid:1];
  }
  double width = self->_textSize.width;
  double height = self->_textSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BKHUDTrack)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKHUDTrack;
  v3 = -[BKHUDTrack initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(BKHUDTrack *)v3 _setupCommon];
  }
  return v4;
}

- (BKHUDTrack)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKHUDTrack;
  v3 = [(BKHUDTrack *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(BKHUDTrack *)v3 _setupCommon];
  }
  return v4;
}

- (void)dealloc
{
  [(UILabel *)self->_textLabel removeFromSuperview];
  [(UIVisualEffectView *)self->_visualEffectView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)BKHUDTrack;
  [(BKHUDTrack *)&v3 dealloc];
}

- (void)layoutSubviews
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(BKHUDTrack *)self textSize];
  CGRectMakeWithSize();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(BKHUDTrack *)self textLabel];
  [v11 setBounds:v4, v6, v8, v10];

  if ([(BKHUDTrack *)self hudWidthChangeRequired])
  {
    [(BKHUDTrack *)self horizontalMargin];
    double v13 = v8 + v12 * 2.0;
    [(BKHUDTrack *)self verticalMargin];
    double v15 = v10 + v14 * 2.0;
    v16 = [(BKHUDTrack *)self visualEffectView];
    [v16 setBounds:0.0, 0.0, v13, v15];

    [(BKHUDTrack *)self cornerRadius];
    double v18 = v17;
    v19 = [(BKHUDTrack *)self visualEffectView];
    [v19 _setContinuousCornerRadius:v18];
  }
  [(BKHUDTrack *)self _updateBubblePosition];

  +[CATransaction commit];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)hudWidthChangeRequired
{
  [(BKHUDTrack *)self horizontalMargin];
  double v4 = v3 * 2.5;
  [(BKHUDTrack *)self horizontalMargin];
  double v6 = v5 * 1.5;
  double v7 = [(BKHUDTrack *)self visualEffectView];
  [v7 bounds];
  double Width = CGRectGetWidth(v12);
  double v9 = [(BKHUDTrack *)self textLabel];
  [v9 bounds];
  double v10 = Width - CGRectGetWidth(v13);

  return v10 > v4 || v10 < v6;
}

- (double)_centerX
{
  [(BKHUDTrack *)self value];
  if (*(float *)&v3 >= self->_maximumValue) {
    *(float *)&double v3 = self->_maximumValue;
  }
  [(BKHUDTrack *)self setValue:v3];
  [(BKHUDTrack *)self value];
  if (*(float *)&v4 < self->_minimumValue) {
    *(float *)&double v4 = self->_minimumValue;
  }
  [(BKHUDTrack *)self setValue:v4];
  double v5 = 0.0;
  if (self->_maximumValue > self->_minimumValue)
  {
    [(BKHUDTrack *)self value];
    double v5 = (float)((float)(v6 - self->_minimumValue) / (float)(self->_maximumValue - self->_minimumValue));
  }
  [(BKHUDTrack *)self bounds];
  return round(v7 + v5 * v8);
}

- (void)_updateBubblePosition
{
  double v3 = [(BKHUDTrack *)self visualEffectView];
  [v3 bounds];
  if (CGRectIsEmpty(v34))
  {
    [(BKHUDTrack *)self horizontalMargin];
    double v5 = v4;
  }
  else
  {
    float v6 = [(BKHUDTrack *)self visualEffectView];
    [v6 bounds];
    double Width = CGRectGetWidth(v35);
    double v8 = [(BKHUDTrack *)self textLabel];
    [v8 bounds];
    double v5 = (Width - CGRectGetWidth(v36)) * 0.5;
  }
  [(BKHUDTrack *)self _centerX];
  [(BKHUDTrack *)self bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v17 = [(BKHUDTrack *)self visualEffectView];
  [v17 bounds];

  double v18 = [(BKHUDTrack *)self traitCollection];
  [v18 displayScale];
  if (v19 == 0.0)
  {
    v20 = +[UIScreen mainScreen];
    [v20 scale];
  }
  v37.origin.x = v10;
  v37.origin.y = v12;
  v37.size.double width = v14;
  v37.size.double height = v16;
  CGRectGetMidY(v37);
  [(BKHUDTrack *)self verticalOffset];
  CGPointRoundForScale();
  double v22 = v21;
  double v24 = v23;
  [(BKHUDTrack *)self textSize];
  double v26 = v25;
  double v28 = v27;
  [(BKHUDTrack *)self verticalMargin];
  double v30 = round(v29 + -1.0);
  v31 = [(BKHUDTrack *)self visualEffectView];
  [v31 setPosition:v22, v24];

  id v32 = [(BKHUDTrack *)self textLabel];
  [v32 setFrame:round(v5) v30, v26, v28];
}

- (void)_setupCommon
{
  self->_maximumValue = 1.0;
  double v3 = +[UIColor clearColor];
  [(BKHUDTrack *)self setBackgroundColor:v3];

  [(BKHUDTrack *)self setOpaque:0];
  id v4 = objc_alloc((Class)UIVisualEffectView);
  double v5 = +[UIBlurEffect effectWithStyle:2];
  float v6 = (UIVisualEffectView *)[v4 initWithEffect:v5];
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v6;

  [(UIVisualEffectView *)self->_visualEffectView setUserInteractionEnabled:0];
  [(UIVisualEffectView *)self->_visualEffectView setClipsToBounds:1];
  double v8 = (UILabel *)objc_alloc_init((Class)UILabel);
  textLabel = self->_textLabel;
  self->_textLabel = v8;

  CGFloat v10 = +[UIColor whiteColor];
  [(UILabel *)self->_textLabel setTextColor:v10];

  double v11 = +[UIFont systemFontOfSize:17.0];
  [(UILabel *)self->_textLabel setFont:v11];

  [(UILabel *)self->_textLabel setUserInteractionEnabled:0];
  CGFloat v12 = [(UIVisualEffectView *)self->_visualEffectView contentView];
  [v12 addSubview:self->_textLabel];

  [(BKHUDTrack *)self addSubview:self->_visualEffectView];
  self->_horizontalMargin = 20.0;
  self->_verticalMargin = 6.0;
  self->_cornerRadius = 10.0;

  [(BKHUDTrack *)self _updateBubblePosition];
}

- (void)_invalidateTextSize
{
}

- (double)verticalOffset
{
  return self->_verticalOffset;
}

- (void)setVerticalOffset:(double)a3
{
  self->_verticalOffset = a3;
}

- (double)horizontalMargin
{
  return self->_horizontalMargin;
}

- (void)setHorizontalMargin:(double)a3
{
  self->_horizontalMargin = a3;
}

- (double)verticalMargin
{
  return self->_verticalMargin;
}

- (void)setVerticalMargin:(double)a3
{
  self->_verticalMargin = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (float)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(float)a3
{
  self->_minimumValue = a3;
}

- (float)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(float)a3
{
  self->_maximumValue = a3;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (BOOL)textSizeValid
{
  return self->_textSizeValid;
}

- (void)setTextSizeValid:(BOOL)a3
{
  self->_textSizeValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);

  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end