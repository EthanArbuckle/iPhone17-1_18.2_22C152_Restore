@interface VUIContentRatingTextBadgeView
+ (CGSize)_badgeSizeForAttributedRatingText:(id)a3;
+ (UIEdgeInsets)_paddingEdgeInsets;
+ (id)_attributedRatingTextForText:(id)a3 color:(id)a4;
+ (id)_badgeImageWithAttributedRatingText:(id)a3 andColor:(id)a4;
+ (void)_drawBadgeWithAttributedRatingText:(id)a3 inContext:(CGContext *)a4 rect:(CGRect)a5 color:(id)a6;
- (CGSize)_intrinsicContentSize;
- (NSAttributedString)contentRatingAttributedText;
- (NSString)contentRatingText;
- (UILayoutGuide)contentGuide;
- (VUIContentRatingTextBadgeView)initWithBaselineOffsetFromBottom:(double)a3;
- (VUIContentRatingTextBadgeView)initWithFrame:(CGRect)a3;
- (id)firstBaselineAnchor;
- (void)_updateContentRatingAttributedText:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)setContentGuide:(id)a3;
- (void)setContentRatingAttributedText:(id)a3;
- (void)tintColorDidChange;
@end

@implementation VUIContentRatingTextBadgeView

- (VUIContentRatingTextBadgeView)initWithBaselineOffsetFromBottom:(double)a3
{
  v4 = -[VUIContentRatingTextBadgeView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v4)
  {
    v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
    contentGuide = v4->_contentGuide;
    v4->_contentGuide = v5;

    [(VUIContentRatingTextBadgeView *)v4 addLayoutGuide:v4->_contentGuide];
    v7 = [(UILayoutGuide *)v4->_contentGuide bottomAnchor];
    v8 = [(VUIContentRatingTextBadgeView *)v4 bottomAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 constant:-a3];
    [v9 setActive:1];

    v10 = [(UILayoutGuide *)v4->_contentGuide topAnchor];
    v11 = [(VUIContentRatingTextBadgeView *)v4 topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    v13 = [(UILayoutGuide *)v4->_contentGuide leadingAnchor];
    v14 = [(VUIContentRatingTextBadgeView *)v4 leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    v16 = [(UILayoutGuide *)v4->_contentGuide trailingAnchor];
    v17 = [(VUIContentRatingTextBadgeView *)v4 trailingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [v18 setActive:1];
  }
  return v4;
}

- (VUIContentRatingTextBadgeView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUIContentRatingTextBadgeView;
  v3 = -[VUIContentRatingTextBadgeView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIView *)v3 setVuiBackgroundColor:v4];
  }
  return v3;
}

- (NSString)contentRatingText
{
  v2 = [(VUIContentRatingTextBadgeView *)self contentRatingAttributedText];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (void)setContentRatingAttributedText:(id)a3
{
  if (self->_contentRatingAttributedText != a3)
  {
    v4 = (NSAttributedString *)[a3 copy];
    contentRatingAttributedText = self->_contentRatingAttributedText;
    self->_contentRatingAttributedText = v4;

    [(VUIContentRatingTextBadgeView *)self invalidateIntrinsicContentSize];
    [(UIView *)self vui_setNeedsLayout];
  }
}

+ (id)_badgeImageWithAttributedRatingText:(id)a3 andColor:(id)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    objc_super v6 = [a1 _attributedRatingTextForText:v5 color:0];
    [a1 _badgeSizeForAttributedRatingText:v6];
    double v8 = v7;
    double v10 = v9;
    v11 = [MEMORY[0x1E4F42D90] mainScreen];
    [v11 scale];
    CGFloat v13 = v12;
    v18.width = v8;
    v18.height = v10;
    UIGraphicsBeginImageContextWithOptions(v18, 0, v13);

    objc_msgSend(a1, "_drawBadgeWithAttributedRatingText:inContext:rect:color:", v6, UIGraphicsGetCurrentContext(), 0, 0.0, 0.0, v8, v10);
    v14 = UIGraphicsGetImageFromCurrentImageContext();
    v15 = [v14 imageWithRenderingMode:2];

    UIGraphicsEndImageContext();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  double v9 = objc_opt_class();
  double v10 = [(VUIContentRatingTextBadgeView *)self contentRatingAttributedText];
  v11 = [(VUIContentRatingTextBadgeView *)self tintColor];
  objc_msgSend(v9, "_drawBadgeWithAttributedRatingText:inContext:rect:color:", v10, CurrentContext, v11, x, y, width, height);

  CGContextRestoreGState(CurrentContext);
}

- (id)firstBaselineAnchor
{
  v3 = [(VUIContentRatingTextBadgeView *)self contentGuide];
  v4 = v3;
  if (!v3) {
    v3 = self;
  }
  id v5 = [v3 bottomAnchor];

  return v5;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)VUIContentRatingTextBadgeView;
  [(VUIContentRatingTextBadgeView *)&v4 tintColorDidChange];
  v3 = [(VUIContentRatingTextBadgeView *)self contentRatingText];
  [(VUIContentRatingTextBadgeView *)self _updateContentRatingAttributedText:v3];

  [(VUIContentRatingTextBadgeView *)self setNeedsDisplay];
}

- (void)_updateContentRatingAttributedText:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  objc_super v6 = [(VUIContentRatingTextBadgeView *)self tintColor];
  id v7 = [v5 _attributedRatingTextForText:v4 color:v6];

  [(VUIContentRatingTextBadgeView *)self setContentRatingAttributedText:v7];
}

- (CGSize)_intrinsicContentSize
{
  v3 = objc_opt_class();
  id v4 = [(VUIContentRatingTextBadgeView *)self contentRatingAttributedText];
  [v3 _badgeSizeForAttributedRatingText:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

+ (id)_attributedRatingTextForText:(id)a3 color:(id)a4
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    if (!v6)
    {
      id v6 = [MEMORY[0x1E4F428B8] blackColor];
    }
    double v7 = [MEMORY[0x1E4F42A30] systemFontOfSize:18.0 weight:0.4];
    double v8 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
    double v9 = (void *)[v8 mutableCopy];

    [v9 setLineBreakMode:4];
    [v9 setAlignment:1];
    uint64_t v10 = *MEMORY[0x1E4F42508];
    v14[0] = *MEMORY[0x1E4F42510];
    v14[1] = v10;
    v15[0] = v6;
    v15[1] = v7;
    v14[2] = *MEMORY[0x1E4F42540];
    v15[2] = v9;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v11];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

+ (CGSize)_badgeSizeForAttributedRatingText:(id)a3
{
  id v4 = a3;
  id v5 = [v4 string];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    [a1 _paddingEdgeInsets];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v15 = [MEMORY[0x1E4F42D90] mainScreen];
    objc_msgSend(v15, "vui_bounds");
    double v17 = v16;

    objc_msgSend(v4, "boundingRectWithSize:options:context:", 2, 0, v17, 0.0);
    CGRect v24 = CGRectIntegral(v23);
    double v18 = v14 + v10 + v24.size.width;
    double v19 = v12 + v8 + v24.size.height;
  }
  else
  {
    double v18 = *MEMORY[0x1E4F1DB30];
    double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v20 = v18;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

+ (void)_drawBadgeWithAttributedRatingText:(id)a3 inContext:(CGContext *)a4 rect:(CGRect)a5 color:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v17 = a6;
  id v12 = a3;
  [a1 _paddingEdgeInsets];
  objc_msgSend(v12, "drawAtPoint:", x + v13, y + v14);

  v15 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", x + 1.0, y + 1.0, width + -2.0, height + -2.0, 6.0);
  double v16 = v17;
  if (!v17)
  {
    double v16 = [MEMORY[0x1E4F428B8] blackColor];
  }
  id v18 = v16;
  [v16 set];
  [v15 setLineWidth:2.0];
  [v15 stroke];
}

+ (UIEdgeInsets)_paddingEdgeInsets
{
  double v2 = 2.0;
  double v3 = 4.0;
  double v4 = 2.0;
  double v5 = 4.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (NSAttributedString)contentRatingAttributedText
{
  return self->_contentRatingAttributedText;
}

- (UILayoutGuide)contentGuide
{
  return self->_contentGuide;
}

- (void)setContentGuide:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentGuide, 0);
  objc_storeStrong((id *)&self->_contentRatingAttributedText, 0);
}

@end