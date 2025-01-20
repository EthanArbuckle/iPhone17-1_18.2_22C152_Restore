@interface _UIKBRTFingerDetectionFingerFeedbackView
- (BOOL)unknownSeen;
- (UILabel)fingerLabel;
- (_UIKBRTFingerDetectionFingerCircleView)fingerDot;
- (_UIKBRTFingerDetectionFingerFeedbackView)initWithFrame:(CGRect)a3;
- (double)radius;
- (void)centerOn:(CGPoint)a3 withRadius:(double)a4 andIdentifier:(unint64_t)a5;
- (void)layoutSubviews;
- (void)setFingerDot:(id)a3;
- (void)setFingerLabel:(id)a3;
- (void)setNeedsDisplay;
- (void)setUnknownSeen:(BOOL)a3;
@end

@implementation _UIKBRTFingerDetectionFingerFeedbackView

- (_UIKBRTFingerDetectionFingerFeedbackView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKBRTFingerDetectionFingerFeedbackView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(UIView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (UILabel)fingerLabel
{
  fingerLabel = self->_fingerLabel;
  if (!fingerLabel)
  {
    v4 = [UILabel alloc];
    v5 = -[UILabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    objc_super v6 = self->_fingerLabel;
    self->_fingerLabel = v5;

    v7 = +[UIColor colorWithWhite:1.0 alpha:0.6];
    [(UIView *)self->_fingerLabel setBackgroundColor:v7];

    [(UIView *)self addSubview:self->_fingerLabel];
    fingerLabel = self->_fingerLabel;
  }
  return fingerLabel;
}

- (_UIKBRTFingerDetectionFingerCircleView)fingerDot
{
  fingerDot = self->_fingerDot;
  if (!fingerDot)
  {
    v4 = [_UIKBRTFingerDetectionFingerCircleView alloc];
    v5 = -[_UIKBRTFingerDetectionFingerCircleView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    objc_super v6 = self->_fingerDot;
    self->_fingerDot = v5;

    v7 = +[UIColor purpleColor];
    [(UIView *)self->_fingerDot setBackgroundColor:v7];

    [(UIView *)self addSubview:self->_fingerDot];
    fingerDot = self->_fingerDot;
  }
  return fingerDot;
}

- (double)radius
{
  return self->_radiusInt * 1.25;
}

- (void)layoutSubviews
{
  [(UIView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  v11 = [(_UIKBRTFingerDetectionFingerFeedbackView *)self fingerLabel];
  [v11 frame];
  double v13 = v12;

  float v14 = (v8 - v13) * 0.5;
  double v15 = floorf(v14);
  v16 = [(_UIKBRTFingerDetectionFingerFeedbackView *)self fingerLabel];
  [v16 intrinsicContentSize];
  *(float *)&double v17 = v17;
  double v18 = ceilf(*(float *)&v17);
  *(float *)&double v17 = v19;
  double v20 = ceilf(*(float *)&v17);

  v21 = [(_UIKBRTFingerDetectionFingerFeedbackView *)self fingerLabel];
  objc_msgSend(v21, "setFrame:", v15, 0.0, v18, v20);

  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  double MidX = CGRectGetMidX(v29);
  [(_UIKBRTFingerDetectionFingerFeedbackView *)self radius];
  double v24 = MidX - v23;
  [(_UIKBRTFingerDetectionFingerFeedbackView *)self radius];
  double v26 = v25 + v25;
  id v27 = [(_UIKBRTFingerDetectionFingerFeedbackView *)self fingerDot];
  objc_msgSend(v27, "setFrame:", v24, v20 + 0.0, v26, v26);
}

- (void)centerOn:(CGPoint)a3 withRadius:(double)a4 andIdentifier:(unint64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  if (qword_1EB25D1A0 != -1) {
    dispatch_once(&qword_1EB25D1A0, &__block_literal_global_294_0);
  }
  CGFloat v10 = NSString;
  v11 = (void *)qword_1EB25D198;
  double v12 = [NSNumber numberWithUnsignedInteger:a5];
  double v13 = [v11 objectForKey:v12];
  id v32 = [v10 stringWithFormat:@" %@ ", v13];

  p_framelocation = &self->_framelocation;
  BOOL v15 = x == self->_framelocation.x && y == self->_framelocation.y;
  if (!v15
    || self->_radiusInt != a4
    || ([(_UIKBRTFingerDetectionFingerFeedbackView *)self fingerLabel],
        v16 = objc_claimAutoreleasedReturnValue(),
        [v16 text],
        double v17 = objc_claimAutoreleasedReturnValue(),
        char v18 = [v17 isEqualToString:v32],
        v17,
        v16,
        (v18 & 1) == 0))
  {
    p_framelocation->double x = x;
    self->_framelocation.double y = y;
    self->_radiusInt = a4;
    double v19 = [(_UIKBRTFingerDetectionFingerFeedbackView *)self fingerLabel];
    [v19 setText:v32];

    double v20 = [(_UIKBRTFingerDetectionFingerFeedbackView *)self fingerLabel];
    [v20 intrinsicContentSize];
    *(float *)&double v21 = v21;
    double v22 = ceilf(*(float *)&v21);
    *(float *)&double v21 = v23;
    double v24 = ceilf(*(float *)&v21);

    [(_UIKBRTFingerDetectionFingerFeedbackView *)self radius];
    double v26 = v25 + 1.0;
    float v27 = (v22 + 1.0) * 0.5;
    float v28 = floorf(v27);
    if (v26 >= v28)
    {
      float v29 = v26;
      float v30 = v29;
    }
    else
    {
      float v30 = v28;
    }
    double v31 = ceilf(v30);
    -[UIView setFrame:](self, "setFrame:", p_framelocation->x - v31, self->_framelocation.y - v31 - v24, v31 + v31, v31 + v31 + v24);
    [(UIView *)self setNeedsLayout];
    [(_UIKBRTFingerDetectionFingerFeedbackView *)self setNeedsDisplay];
  }
}

- (void)setUnknownSeen:(BOOL)a3
{
  if (self->_unknownSeen != a3)
  {
    self->_unknownSeen = a3;
    if (a3) {
      +[UIColor redColor];
    }
    else {
    CGFloat v4 = +[UIColor purpleColor];
    }
    double v5 = [(_UIKBRTFingerDetectionFingerFeedbackView *)self fingerDot];
    [v5 setBackgroundColor:v4];

    [(_UIKBRTFingerDetectionFingerFeedbackView *)self setNeedsDisplay];
  }
}

- (void)setNeedsDisplay
{
  v4.receiver = self;
  v4.super_class = (Class)_UIKBRTFingerDetectionFingerFeedbackView;
  [(UIView *)&v4 setNeedsDisplay];
  double v3 = [(_UIKBRTFingerDetectionFingerFeedbackView *)self fingerDot];
  [v3 setNeedsDisplay];
}

- (void)setFingerLabel:(id)a3
{
}

- (void)setFingerDot:(id)a3
{
}

- (BOOL)unknownSeen
{
  return self->_unknownSeen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerDot, 0);
  objc_storeStrong((id *)&self->_fingerLabel, 0);
}

@end