@interface VUITextBadge
+ (id)attributedTextFromString:(id)a3 fontColor:(id)a4 fontSize:(double)a5;
- (CGSize)_textSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)attributedTitle;
- (NSString)title;
- (UIColor)tintColor;
- (UIEdgeInsets)badgeInsets;
- (UIImage)backgroundImage;
- (VUITextBadge)initWithAttributedString:(id)a3 tintColor:(id)a4 cornerRadius:(double)a5;
- (VUITextBadge)initWithFrame:(CGRect)a3;
- (VUITextBadge)initWithTitle:(id)a3 tintColor:(id)a4 fontSize:(double)a5 cornerRadius:(double)a6;
- (double)cornerRadius;
- (double)fontSize;
- (double)strokeSize;
- (int)textBlendMode;
- (unint64_t)badgeStyle;
- (void)drawRect:(CGRect)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBadgeInsets:(UIEdgeInsets)a3;
- (void)setBadgeStyle:(unint64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFontSize:(double)a3;
- (void)setStrokeSize:(double)a3;
- (void)setTextBlendMode:(int)a3;
- (void)setTintColor:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VUITextBadge

- (VUITextBadge)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUITextBadge;
  v3 = -[VUITextBadge initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(VUITextBadge *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (VUITextBadge)initWithAttributedString:(id)a3 tintColor:(id)a4 cornerRadius:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = -[VUITextBadge initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_attributedTitle, a3);
    objc_storeStrong((id *)&v12->_tintColor, a4);
    v12->_cornerRadius = a5;
  }

  return v12;
}

- (VUITextBadge)initWithTitle:(id)a3 tintColor:(id)a4 fontSize:(double)a5 cornerRadius:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = [(id)objc_opt_class() attributedTextFromString:v11 fontColor:v12 fontSize:a5];
  v14 = [(VUITextBadge *)self initWithAttributedString:v13 tintColor:v12 cornerRadius:a6];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_title, a3);
    v14->_fontSize = a5;
    v14->_cornerRadius = a6;
    v14->_strokeSize = 2.0;
    *(_OWORD *)&v14->_badgeInsets.top = kDefaultBadgeInsets;
    *(_OWORD *)&v14->_badgeInsets.bottom = unk_1E38FE620;
  }

  return v14;
}

+ (id)attributedTextFromString:(id)a3 fontColor:(id)a4 fontSize:(double)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4FB06F8];
  v16[0] = *MEMORY[0x1E4FB0700];
  v16[1] = v7;
  v17[0] = a4;
  v8 = (void *)MEMORY[0x1E4FB08E0];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 boldSystemFontOfSize:a5];
  v17[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
  v14 = (void *)[v13 initWithString:v10 attributes:v12];

  return v14;
}

- (void)setTitle:(id)a3
{
  if (self->_title != a3)
  {
    id v4 = a3;
    v5 = (NSString *)[v4 copy];
    title = self->_title;
    self->_title = v5;

    id v7 = [(id)objc_opt_class() attributedTextFromString:v4 fontColor:self->_tintColor fontSize:self->_fontSize];

    [(VUITextBadge *)self setAttributedTitle:v7];
  }
}

- (void)setAttributedTitle:(id)a3
{
  if (self->_attributedTitle != a3)
  {
    id v4 = (NSAttributedString *)[a3 copy];
    attributedTitle = self->_attributedTitle;
    self->_attributedTitle = v4;

    [(VUITextBadge *)self setNeedsDisplay];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(VUITextBadge *)self _textSize];
  double v5 = v4 + self->_badgeInsets.left + self->_badgeInsets.right;
  double v7 = v6 + self->_badgeInsets.top + self->_badgeInsets.bottom;
  result.height = v7;
  result.width = v5;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", 0.0, 0.0, width, height);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundImage)
  {
    CGContextAddPath(CurrentContext, (CGPathRef)[v9 CGPath]);
    CGContextClip(CurrentContext);
    -[UIImage drawAtPoint:](self->_backgroundImage, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  [(UIColor *)self->_tintColor set];
  unint64_t badgeStyle = self->_badgeStyle;
  if (badgeStyle == 1)
  {
    [v9 setLineWidth:self->_strokeSize];
    [v9 stroke];
  }
  else if (badgeStyle == 2)
  {
    [v9 fill];
  }
  CGContextSetBlendMode(CurrentContext, (CGBlendMode)self->_textBlendMode);
  v8 = [(VUITextBadge *)self attributedTitle];
  objc_msgSend(v8, "drawAtPoint:", self->_badgeInsets.left, self->_badgeInsets.top);

  CGContextRestoreGState(CurrentContext);
}

- (CGSize)_textSize
{
  v2 = [(VUITextBadge *)self attributedTitle];
  objc_msgSend(v2, "boundingRectWithSize:options:context:", 33, 0, 1.79769313e308, 1.79769313e308);
  double v4 = v3;
  double v6 = v5;

  double v7 = ceil(v4);
  double v8 = ceil(v6);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (int)textBlendMode
{
  return self->_textBlendMode;
}

- (void)setTextBlendMode:(int)a3
{
  self->_textBlendMode = a3;
}

- (double)strokeSize
{
  return self->_strokeSize;
}

- (void)setStrokeSize:(double)a3
{
  self->_strokeSize = a3;
}

- (UIEdgeInsets)badgeInsets
{
  double top = self->_badgeInsets.top;
  double left = self->_badgeInsets.left;
  double bottom = self->_badgeInsets.bottom;
  double right = self->_badgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBadgeInsets:(UIEdgeInsets)a3
{
  self->_badgeInsets = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (unint64_t)badgeStyle
{
  return self->_badgeStyle;
}

- (void)setBadgeStyle:(unint64_t)a3
{
  self->_unint64_t badgeStyle = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end