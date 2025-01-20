@interface IMExpandingLabel
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isExpanded;
- (CGSize)sizeThatFits:(CGSize)a3;
- (IMExpandingLabel)init;
- (IMExpandingLabel)initWithCoder:(id)a3;
- (IMExpandingLabel)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedText;
- (NSAttributedString)showMoreAttributedText;
- (NSString)text;
- (UIColor)showMoreTextColor;
- (UIColor)textColor;
- (UIFont)font;
- (UIFont)showMoreFont;
- (UITextView)textView;
- (id)labelResizedBlock;
- (int64_t)lineBreakMode;
- (int64_t)textAlignment;
- (unint64_t)numberOfLinesWhenCollapsed;
- (void)_IMExpandingLabelComonInit;
- (void)_expand;
- (void)_setTextExclusionPath;
- (void)_updateTextAttributes;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setLabelResizedBlock:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setNumberOfLinesWhenCollapsed:(unint64_t)a3;
- (void)setShowMoreAttributedText:(id)a3;
- (void)setShowMoreFont:(id)a3;
- (void)setShowMoreTextColor:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextView:(id)a3;
@end

@implementation IMExpandingLabel

- (void)_IMExpandingLabelComonInit
{
  self->_numberOfLinesWhenCollapsed = 3;
  self->_textAlignment = 4;
  v3 = +[UIFont systemFontOfSize:12.0];
  font = self->_font;
  self->_font = v3;

  v5 = +[UIColor blackColor];
  textColor = self->_textColor;
  self->_textColor = v5;

  v7 = +[UIColor grayColor];
  showMoreTextColor = self->_showMoreTextColor;
  self->_showMoreTextColor = v7;

  v9 = (NSTextStorage *)objc_alloc_init((Class)NSTextStorage);
  textStorage = self->_textStorage;
  self->_textStorage = v9;

  v11 = (NSLayoutManager *)objc_alloc_init((Class)NSLayoutManager);
  textLayoutManager = self->_textLayoutManager;
  self->_textLayoutManager = v11;

  [(NSTextStorage *)self->_textStorage addLayoutManager:self->_textLayoutManager];
  v13 = [objc_alloc((Class)NSTextContainer) initWithSize:CGSizeZero.width, CGSizeZero.height];
  textContainer = self->_textContainer;
  self->_textContainer = v13;

  [(NSTextContainer *)self->_textContainer setLineBreakMode:4];
  [(NSTextContainer *)self->_textContainer setLineFragmentPadding:0.0];
  [(NSTextContainer *)self->_textContainer setMaximumNumberOfLines:self->_numberOfLinesWhenCollapsed];
  [(NSTextContainer *)self->_textContainer setHeightTracksTextView:1];
  [(NSTextContainer *)self->_textContainer setWidthTracksTextView:1];
  [(NSLayoutManager *)self->_textLayoutManager addTextContainer:self->_textContainer];
  id v15 = objc_alloc((Class)UITextView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v19 = [v15 initWithFrame:self->_textContainer origin:CGRectZero.origin.x y:y width:width height:height];
  textView = self->_textView;
  self->_textView = v19;

  [(UITextView *)self->_textView setScrollEnabled:0];
  [(UITextView *)self->_textView setEditable:0];
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v21 = +[UIColor clearColor];
  [(UITextView *)self->_textView setBackgroundColor:v21];

  [(UITextView *)self->_textView setShowsVerticalScrollIndicator:0];
  [(UITextView *)self->_textView setShowsHorizontalScrollIndicator:0];
  [(IMExpandingLabel *)self addSubview:self->_textView];
  v22 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  showMoreLabel = self->_showMoreLabel;
  self->_showMoreLabel = v22;

  v24 = [(IMExpandingLabel *)self showMoreTextColor];
  [(UILabel *)self->_showMoreLabel setTextColor:v24];

  v25 = +[UIColor clearColor];
  [(UILabel *)self->_showMoreLabel setBackgroundColor:v25];

  [(IMExpandingLabel *)self setShowMoreAttributedText:0];
  [(IMExpandingLabel *)self setShowMoreFont:0];
  [(IMExpandingLabel *)self addSubview:self->_showMoreLabel];
  [(UILabel *)self->_showMoreLabel setUserInteractionEnabled:1];
  v26 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_expand"];
  showMoreTapRecognizer = self->_showMoreTapRecognizer;
  self->_showMoreTapRecognizer = v26;

  [(UITapGestureRecognizer *)self->_showMoreTapRecognizer setDelegate:self];
  v28 = self->_showMoreTapRecognizer;

  [(IMExpandingLabel *)self addGestureRecognizer:v28];
}

- (IMExpandingLabel)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMExpandingLabel;
  v2 = [(IMExpandingLabel *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IMExpandingLabel *)v2 _IMExpandingLabelComonInit];
  }
  return v3;
}

- (IMExpandingLabel)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMExpandingLabel;
  v3 = [(IMExpandingLabel *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(IMExpandingLabel *)v3 _IMExpandingLabelComonInit];
  }
  return v4;
}

- (IMExpandingLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMExpandingLabel;
  v3 = -[IMExpandingLabel initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(IMExpandingLabel *)v3 _IMExpandingLabelComonInit];
  }
  return v4;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  [a3 locationInView:self->_showMoreLabel];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  [(UILabel *)self->_showMoreLabel bounds];
  CGRect v13 = CGRectInset(v12, -20.0, -20.0);
  uint64_t v8 = v5;
  uint64_t v9 = v7;

  return CGRectContainsPoint(v13, *(CGPoint *)&v8);
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(NSTextStorage *)self->_textStorage string];
  if ([v5 isEqualToString:v4]) {
    goto LABEL_4;
  }
  id v6 = [v4 length];

  if (v6)
  {
    uint64_t v7 = +[NSParagraphStyle defaultParagraphStyle];
    id v5 = [v7 mutableCopy];

    [v5 setAlignment:self->_textAlignment];
    v12[0] = NSFontAttributeName;
    uint64_t v8 = [(IMExpandingLabel *)self font];
    v13[0] = v8;
    v12[1] = NSForegroundColorAttributeName;
    uint64_t v9 = [(IMExpandingLabel *)self textColor];
    v12[2] = NSParagraphStyleAttributeName;
    v13[1] = v9;
    v13[2] = v5;
    v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

    id v11 = [objc_alloc((Class)NSAttributedString) initWithString:v4 attributes:v10];
    [(NSTextStorage *)self->_textStorage setAttributedString:v11];
    [(IMExpandingLabel *)self setNeedsLayout];

LABEL_4:
  }
}

- (NSString)text
{
  return (NSString *)[(NSTextStorage *)self->_textStorage string];
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  self->_useAttributedText = [v4 length] != 0;
  if ([v4 length]) {
    [(NSTextStorage *)self->_textStorage setAttributedString:v4];
  }
  else {
    -[NSTextStorage deleteCharactersInRange:](self->_textStorage, "deleteCharactersInRange:", 0, [(NSTextStorage *)self->_textStorage length]);
  }
  [(IMExpandingLabel *)self setNeedsLayout];
}

- (NSAttributedString)attributedText
{
  if (self->_useAttributedText)
  {
    v2 = -[NSTextStorage attributedSubstringFromRange:](self->_textStorage, "attributedSubstringFromRange:", 0, [(NSTextStorage *)self->_textStorage length]);
  }
  else
  {
    v2 = 0;
  }

  return (NSAttributedString *)v2;
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  id v5 = [(IMExpandingLabel *)self font];

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_font, a3);
    [(IMExpandingLabel *)self _updateTextAttributes];
    [(UITextView *)self->_textView setNeedsDisplay];
  }
}

- (void)setTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  p_textColor = &self->_textColor;
  if (self->_textColor != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_textColor, a3);
    [(IMExpandingLabel *)self _updateTextAttributes];
    p_textColor = (UIColor **)[(UITextView *)self->_textView setNeedsDisplay];
    id v5 = v7;
  }

  _objc_release_x1(p_textColor, v5);
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    [(IMExpandingLabel *)self _updateTextAttributes];
    textView = self->_textView;
    [(UITextView *)textView setNeedsDisplay];
  }
}

- (void)setLineBreakMode:(int64_t)a3
{
  if ([(NSTextContainer *)self->_textContainer lineBreakMode] != a3)
  {
    [(NSTextContainer *)self->_textContainer setLineBreakMode:a3];
    textView = self->_textView;
    [(UITextView *)textView setNeedsDisplay];
  }
}

- (int64_t)lineBreakMode
{
  return [(NSTextContainer *)self->_textContainer lineBreakMode];
}

- (void)setNumberOfLinesWhenCollapsed:(unint64_t)a3
{
  if (self->_numberOfLinesWhenCollapsed != a3)
  {
    uint64_t v4 = 3;
    if (a3) {
      uint64_t v4 = a3;
    }
    self->_unint64_t numberOfLinesWhenCollapsed = v4;
    if ([(IMExpandingLabel *)self isExpanded]) {
      unint64_t numberOfLinesWhenCollapsed = 0;
    }
    else {
      unint64_t numberOfLinesWhenCollapsed = self->_numberOfLinesWhenCollapsed;
    }
    [(NSTextContainer *)self->_textContainer setMaximumNumberOfLines:numberOfLinesWhenCollapsed];
    textView = self->_textView;
    [(UITextView *)textView setNeedsDisplay];
  }
}

- (void)_updateTextAttributes
{
  if (!self->_useAttributedText)
  {
    v3 = +[NSParagraphStyle defaultParagraphStyle];
    id v4 = [v3 mutableCopy];

    [v4 setAlignment:self->_textAlignment];
    textStorage = self->_textStorage;
    v9[0] = NSFontAttributeName;
    id v6 = [(IMExpandingLabel *)self font];
    v10[0] = v6;
    v9[1] = NSForegroundColorAttributeName;
    uint64_t v7 = [(IMExpandingLabel *)self textColor];
    v9[2] = NSParagraphStyleAttributeName;
    v10[1] = v7;
    v10[2] = v4;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
    -[NSTextStorage setAttributes:range:](textStorage, "setAttributes:range:", v8, 0, [(NSTextStorage *)self->_textStorage length]);
  }
}

- (void)setShowMoreAttributedText:(id)a3
{
  id v7 = a3;
  id v4 = [(UILabel *)self->_showMoreLabel attributedText];
  if (v4 == v7)
  {
    id v5 = [(UILabel *)self->_showMoreLabel attributedText];
    unsigned __int8 v6 = [v7 isEqualToAttributedString:v5];

    if (v6) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  [(UILabel *)self->_showMoreLabel setAttributedText:v7];
  [(IMExpandingLabel *)self setNeedsLayout];
LABEL_5:
}

- (NSAttributedString)showMoreAttributedText
{
  return [(UILabel *)self->_showMoreLabel attributedText];
}

- (void)setShowMoreFont:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_showMoreLabel font];

  id v5 = v6;
  if (v4 != v6)
  {
    [(UILabel *)self->_showMoreLabel setFont:v6];
    [(IMExpandingLabel *)self setNeedsLayout];
    id v5 = v6;
  }
}

- (UIFont)showMoreFont
{
  return [(UILabel *)self->_showMoreLabel font];
}

- (void)setShowMoreTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  p_showMoreTextColor = &self->_showMoreTextColor;
  if (self->_showMoreTextColor != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_showMoreTextColor, a3);
    id v7 = [(IMExpandingLabel *)self showMoreTextColor];
    [(UILabel *)self->_showMoreLabel setTextColor:v7];

    id v5 = v8;
  }

  _objc_release_x1(p_showMoreTextColor, v5);
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)IMExpandingLabel;
  [(IMExpandingLabel *)&v24 layoutSubviews];
  [(IMExpandingLabel *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(IMExpandingLabel *)self textView];
  [v11 setFrame:v4, v6, v8, v10];

  NSUInteger v12 = [(NSTextContainer *)self->_textContainer maximumNumberOfLines];
  if (v12)
  {
    NSUInteger v13 = v12;
    [(NSTextContainer *)self->_textContainer setMaximumNumberOfLines:0];
    v14 = [(IMExpandingLabel *)self textView];
    [v14 sizeThatFits:v8];
    double v16 = v15;

    BOOL v17 = v16 <= v10;
    [(NSTextContainer *)self->_textContainer setMaximumNumberOfLines:v13];
  }
  else
  {
    BOOL v17 = 1;
  }
  uint64_t v18 = self->_expanded || v17;
  [(UILabel *)self->_showMoreLabel setHidden:v18];
  if (([(UILabel *)self->_showMoreLabel isHidden] & 1) == 0)
  {
    -[UILabel sizeThatFits:](self->_showMoreLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v20 = v19;
    double v22 = v21;
    v25.origin.x = v4;
    v25.origin.double y = v6;
    v25.size.double width = v8;
    v25.size.double height = v10;
    CGFloat v23 = CGRectGetMaxX(v25) - v20;
    v26.origin.x = v4;
    v26.origin.double y = v6;
    v26.size.double width = v8;
    v26.size.double height = v10;
    -[UILabel setFrame:](self->_showMoreLabel, "setFrame:", v23, CGRectGetMaxY(v26) - v22, v20, v22);
  }
  [(IMExpandingLabel *)self _setTextExclusionPath];
  [(UITextView *)self->_textView setNeedsDisplay];
}

- (void)_setTextExclusionPath
{
  if ([(IMExpandingLabel *)self isExpanded]
    || ([(UILabel *)self->_showMoreLabel isHidden] & 1) != 0)
  {
    textContainer = self->_textContainer;
    [(NSTextContainer *)textContainer setExclusionPaths:&__NSArray0__struct];
  }
  else
  {
    [(UILabel *)self->_showMoreLabel frame];
    CGRect v9 = CGRectInset(v8, -5.0, 0.0);
    CGRect v10 = CGRectIntegral(v9);
    double v4 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
    double v6 = v4;
    double v5 = +[NSArray arrayWithObjects:&v6 count:1];
    [(NSTextContainer *)self->_textContainer setExclusionPaths:v5];
  }
}

- (void)_expand
{
  labelResizedBlock = (void (**)(void))self->_labelResizedBlock;
  if (labelResizedBlock) {
    labelResizedBlock[2]();
  }
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
  if (a3) {
    unint64_t numberOfLinesWhenCollapsed = 0;
  }
  else {
    unint64_t numberOfLinesWhenCollapsed = self->_numberOfLinesWhenCollapsed;
  }
  [(NSTextContainer *)self->_textContainer setMaximumNumberOfLines:numberOfLinesWhenCollapsed];
  [(UILabel *)self->_showMoreLabel setHidden:self->_expanded];

  [(IMExpandingLabel *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(IMExpandingLabel *)self textView];
  [v5 sizeThatFits:width, height];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)showMoreTextColor
{
  return self->_showMoreTextColor;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (unint64_t)numberOfLinesWhenCollapsed
{
  return self->_numberOfLinesWhenCollapsed;
}

- (id)labelResizedBlock
{
  return self->_labelResizedBlock;
}

- (void)setLabelResizedBlock:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong(&self->_labelResizedBlock, 0);
  objc_storeStrong((id *)&self->_showMoreTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_showMoreTapRecognizer, 0);
  objc_storeStrong((id *)&self->_showMoreLabel, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);

  objc_storeStrong((id *)&self->_textContainer, 0);
}

@end