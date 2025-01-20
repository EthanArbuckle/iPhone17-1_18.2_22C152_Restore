@interface ConversationHeaderContentView
- (ConversationHeaderContentView)initWithFrame:(CGRect)a3;
- (UILabel)textLabel;
- (double)contentWidth;
- (double)lastBaselineToBottom;
- (double)topToFirstBaseline;
- (int64_t)_automaticTextAlignmentForText:(id)a3;
- (unint64_t)numberOfLines;
- (unint64_t)textAlignment;
- (void)_createPrimaryViews;
- (void)_updateAnchorPoint;
- (void)_updateTextAlignmentForText:(id)a3;
- (void)layoutMarginsDidChange;
- (void)reflow;
- (void)setBounds:(CGRect)a3;
- (void)setContentWidth:(double)a3;
- (void)setFont:(id)a3;
- (void)setLastBaselineToBottom:(double)a3;
- (void)setNumberOfLines:(unint64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(unint64_t)a3;
- (void)setTextLabel:(id)a3;
- (void)setTopToFirstBaseline:(double)a3;
@end

@implementation ConversationHeaderContentView

- (ConversationHeaderContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ConversationHeaderContentView;
  v3 = -[ConversationHeaderContentView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(ConversationHeaderContentView *)v3 setInsetsLayoutMarginsFromSafeArea:0];
    [(ConversationHeaderContentView *)v4 _createPrimaryViews];
  }
  return v4;
}

- (void)_createPrimaryViews
{
  id v6 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  -[ConversationHeaderContentView setTextLabel:](self, "setTextLabel:");

  id v7 = +[UIColor clearColor];
  v3 = [(ConversationHeaderContentView *)self textLabel];
  [v3 setBackgroundColor:v7];

  id v8 = [(ConversationHeaderContentView *)self textLabel];
  [v8 setLineBreakMode:4];

  id v9 = [(ConversationHeaderContentView *)self textLabel];
  [v9 setNumberOfLines:1];

  id v10 = +[UIColor labelColor];
  v4 = [(ConversationHeaderContentView *)self textLabel];
  [v4 setTextColor:v10];

  uint64_t v5 = MSAccessibilityIdentifierMailMessageViewSubjectLabel;
  id v11 = [(ConversationHeaderContentView *)self textLabel];
  [v11 setAccessibilityIdentifier:v5];

  id v12 = [(ConversationHeaderContentView *)self textLabel];
  -[ConversationHeaderContentView addSubview:](self, "addSubview:");
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = CGRectGetWidth(a3);
  [(ConversationHeaderContentView *)self bounds];
  double v9 = v8 - CGRectGetWidth(v14);
  if (v9 >= 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = -v9;
  }
  v13.receiver = self;
  v13.super_class = (Class)ConversationHeaderContentView;
  -[ConversationHeaderContentView setBounds:](&v13, "setBounds:", x, y, width, height);
  if (v10 > 0.00000011920929)
  {
    id v11 = [(ConversationHeaderContentView *)self textLabel];
    id v12 = [v11 text];
    [(ConversationHeaderContentView *)self _updateTextAlignmentForText:v12];

    [(ConversationHeaderContentView *)self reflow];
  }
}

- (void)layoutMarginsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)ConversationHeaderContentView;
  [(ConversationHeaderContentView *)&v5 layoutMarginsDidChange];
  v3 = [(ConversationHeaderContentView *)self textLabel];
  v4 = [v3 text];
  [(ConversationHeaderContentView *)self _updateTextAlignmentForText:v4];

  [(ConversationHeaderContentView *)self reflow];
}

- (void)_updateTextAlignmentForText:(id)a3
{
  id v9 = a3;
  if ([v9 length])
  {
    unint64_t v4 = [(ConversationHeaderContentView *)self textAlignment] - 1;
    int64_t v5 = v4 >= 4
       ? [(ConversationHeaderContentView *)self _automaticTextAlignmentForText:v9]
       : qword_1005A7D40[v4];
    id v6 = [(ConversationHeaderContentView *)self textLabel];
    id v7 = [v6 textAlignment];

    if (v7 != (id)v5)
    {
      double v8 = [(ConversationHeaderContentView *)self textLabel];
      [v8 setTextAlignment:v5];
    }
  }
}

- (int64_t)_automaticTextAlignmentForText:(id)a3
{
  id v4 = a3;
  NSAttributedStringKey v26 = NSFontAttributeName;
  int64_t v5 = [(ConversationHeaderContentView *)self textLabel];
  id v6 = [v5 font];
  v27 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];

  [v4 sizeWithAttributes:v7];
  double v9 = v8;
  [(ConversationHeaderContentView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(ConversationHeaderContentView *)self layoutMargins];
  CGFloat v19 = v13 + v18;
  CGFloat v22 = v15 - (v20 + v21);
  v28.size.double height = v17 - (v18 + v23);
  v28.origin.double x = v11 + v20;
  v28.origin.double y = v19;
  v28.size.double width = v22;
  if (CGRectGetWidth(v28) - v9 <= 20.0)
  {
    if ([v4 _isNaturallyRTL]) {
      int64_t v24 = 2;
    }
    else {
      int64_t v24 = 0;
    }
  }
  else
  {
    int64_t v24 = 1;
  }

  return v24;
}

- (void)setText:(id)a3
{
  id v5 = a3;
  -[ConversationHeaderContentView _updateTextAlignmentForText:](self, "_updateTextAlignmentForText:");
  id v4 = [(ConversationHeaderContentView *)self textLabel];
  [v4 setText:v5];

  [(ConversationHeaderContentView *)self reflow];
}

- (void)setContentWidth:(double)a3
{
  if (self->_contentWidth != a3)
  {
    self->_contentWidth = a3;
    [(ConversationHeaderContentView *)self reflow];
  }
}

- (void)reflow
{
  v3 = [(ConversationHeaderContentView *)self textLabel];
  id v4 = [v3 text];
  id v5 = [v4 length];

  if (v5)
  {
    [(ConversationHeaderContentView *)self contentWidth];
    double v7 = v6;
    [(ConversationHeaderContentView *)self layoutMargins];
    double v9 = v8;
    [(ConversationHeaderContentView *)self layoutMargins];
    CGFloat v11 = v7 - (v9 + v10);
    double v12 = [(ConversationHeaderContentView *)self textLabel];
    [v12 sizeThatFits:v11];
    double v14 = v13;

    [(ConversationHeaderContentView *)self topToFirstBaseline];
    double v15 = [(ConversationHeaderContentView *)self textLabel];
    [v15 _firstLineBaseline];

    UIRoundToViewScale();
    double v17 = v16;
    [(ConversationHeaderContentView *)self layoutMargins];
    double v19 = v18;
    double v20 = [(ConversationHeaderContentView *)self textLabel];
    [v20 setFrame:v19, v17, v11, v14];

    [(ConversationHeaderContentView *)self lastBaselineToBottom];
    double v21 = [(ConversationHeaderContentView *)self textLabel];
    [v21 _lastLineBaseline];

    UIRoundToViewScale();
    double v23 = v22;
    double y = CGRectZero.origin.y;
    [(ConversationHeaderContentView *)self contentWidth];
    double v26 = v25;
    v28.origin.double x = v19;
    v28.origin.double y = v17;
    v28.size.double width = v11;
    v28.size.double height = v14;
    -[ConversationHeaderContentView setBounds:](self, "setBounds:", CGRectZero.origin.x, y, v26, v23 + CGRectGetMaxY(v28));
    [(ConversationHeaderContentView *)self _updateAnchorPoint];
  }
}

- (void)setFont:(id)a3
{
  id v7 = a3;
  id v4 = [(ConversationHeaderContentView *)self textLabel];
  [v4 setFont:v7];

  id v5 = [(ConversationHeaderContentView *)self textLabel];
  double v6 = [v5 text];
  [(ConversationHeaderContentView *)self _updateTextAlignmentForText:v6];

  [(ConversationHeaderContentView *)self reflow];
}

- (void)setNumberOfLines:(unint64_t)a3
{
  id v4 = [(ConversationHeaderContentView *)self textLabel];
  [v4 setNumberOfLines:a3];
}

- (unint64_t)numberOfLines
{
  v2 = [(ConversationHeaderContentView *)self textLabel];
  id v3 = [v2 numberOfLines];

  return (unint64_t)v3;
}

- (void)_updateAnchorPoint
{
  [(ConversationHeaderContentView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(ConversationHeaderContentView *)self topToFirstBaseline];
  double v12 = v11;
  v17.origin.double x = v4;
  v17.origin.double y = v6;
  v17.size.double width = v8;
  v17.size.double height = v10;
  double v13 = v12 / CGRectGetHeight(v17);
  double v14 = [(ConversationHeaderContentView *)self layer];
  [v14 setAnchorPoint:CGPointZero.x, v13];

  [(ConversationHeaderContentView *)self topToFirstBaseline];
  UIRoundToViewScale();

  -[ConversationHeaderContentView setCenter:](self, "setCenter:", 0.0, v15);
}

- (double)topToFirstBaseline
{
  return self->_topToFirstBaseline;
}

- (void)setTopToFirstBaseline:(double)a3
{
  self->_topToFirstBaseline = a3;
}

- (double)lastBaselineToBottom
{
  return self->_lastBaselineToBottom;
}

- (void)setLastBaselineToBottom:(double)a3
{
  self->_lastBaselineToBottom = a3;
}

- (double)contentWidth
{
  return self->_contentWidth;
}

- (unint64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(unint64_t)a3
{
  self->_textAlignment = a3;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end