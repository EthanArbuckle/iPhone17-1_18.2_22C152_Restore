@interface _TVLabel
- (CGRect)cachedTextRectForBounds;
- (CGRect)previousBounds;
- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4;
- (CGSize)cachedSizeThatFits;
- (CGSize)previousTargetSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)padding;
- (_TVLabel)initWithFrame:(CGRect)a3;
- (int64_t)previousNumberOfLines;
- (void)_clearCachedValues;
- (void)drawTextInRect:(CGRect)a3;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setBaselineAdjustment:(int64_t)a3;
- (void)setCachedSizeThatFits:(CGSize)a3;
- (void)setCachedTextRectForBounds:(CGRect)a3;
- (void)setFont:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPreviousBounds:(CGRect)a3;
- (void)setPreviousNumberOfLines:(int64_t)a3;
- (void)setPreviousTargetSize:(CGSize)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation _TVLabel

- (_TVLabel)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)_TVLabel;
  result = -[_TVLabel initWithFrame:](&v9, sel_initWithFrame_);
  if (result)
  {
    result->_cachedTextRectForBounds.origin.CGFloat x = x;
    result->_cachedTextRectForBounds.origin.CGFloat y = y;
    result->_cachedTextRectForBounds.size.CGFloat width = width;
    result->_cachedTextRectForBounds.size.CGFloat height = height;
    CGSize v8 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    result->_previousBounds.origin = (CGPoint)*MEMORY[0x263F001A8];
    result->_previousBounds.size = v8;
    result->_previousNumberOfLines = 0;
    result->_cachedSizeThatFits.CGFloat width = width;
    result->_cachedSizeThatFits.CGFloat height = height;
    result->_previousTargetSize = (CGSize)*MEMORY[0x263F001B0];
  }
  return result;
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [v4 length];
  uint64_t v6 = *MEMORY[0x263F1C208];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __30___TVLabel_setAttributedText___block_invoke;
  v18[3] = &unk_264BA72F8;
  v18[4] = self;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v18);
  v7 = (void *)[v4 mutableCopy];
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    uint64_t v8 = [v4 length];
    uint64_t v9 = *MEMORY[0x263F1C240];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __30___TVLabel_setAttributedText___block_invoke_3;
    v15[3] = &unk_264BA6B98;
    objc_copyWeak(&v17, &location);
    id v16 = v7;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0, v15);

    objc_destroyWeak(&v17);
  }
  if ([v7 length])
  {
    v10 = [v7 attribute:*MEMORY[0x263F1C268] atIndex:0 effectiveRange:0];
    if (!v10)
    {
      if ([(_TVLabel *)self textAlignment] == 1)
      {
        v11 = [MEMORY[0x263F1C358] defaultParagraphStyle];
        v12 = (void *)[v11 mutableCopy];

        objc_msgSend(v12, "setAlignment:", -[_TVLabel textAlignment](self, "textAlignment"));
        objc_msgSend(v12, "setLineBreakMode:", -[_TVLabel lineBreakMode](self, "lineBreakMode"));
        v10 = (void *)[v12 copy];
      }
      else
      {
        v10 = 0;
      }
    }
    objc_msgSend(v7, "tv_addLanguageAwareness:", v10);
  }
  v13 = (void *)[v7 copy];

  v14.receiver = self;
  v14.super_class = (Class)_TVLabel;
  [(_TVLabel *)&v14 setAttributedText:v13];
  [(_TVLabel *)self _clearCachedValues];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)setTextColor:(id)a3
{
  id v4 = [(_TVLabel *)self _accessibilityHigherContrastTintColorForColor:a3];
  v5.receiver = self;
  v5.super_class = (Class)_TVLabel;
  [(_TVLabel *)&v5 setTextColor:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(_TVLabel *)self attributedText];

  if (v5)
  {
    objc_initWeak(&location, self);
    uint64_t v6 = [(_TVLabel *)self attributedText];
    v7 = [(_TVLabel *)self attributedText];
    uint64_t v8 = [v7 length];
    uint64_t v9 = *MEMORY[0x263F1C208];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __27___TVLabel_setHighlighted___block_invoke;
    v11[3] = &unk_264BA88B8;
    v11[4] = self;
    BOOL v13 = v3;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v10.receiver = self;
  v10.super_class = (Class)_TVLabel;
  [(UIView *)&v10 setHighlighted:v3];
}

- (void)setPadding:(UIEdgeInsets)a3
{
  if (self->_padding.left != a3.left
    || self->_padding.top != a3.top
    || self->_padding.right != a3.right
    || self->_padding.bottom != a3.bottom)
  {
    self->_padding = a3;
    [(_TVLabel *)self _clearCachedValues];
  }
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVLabel;
  [(_TVLabel *)&v4 setText:a3];
  [(_TVLabel *)self _clearCachedValues];
}

- (void)setFont:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVLabel;
  [(_TVLabel *)&v4 setFont:a3];
  [(_TVLabel *)self _clearCachedValues];
}

- (void)setLineBreakMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVLabel;
  [(_TVLabel *)&v4 setLineBreakMode:a3];
  [(_TVLabel *)self _clearCachedValues];
}

- (void)setNumberOfLines:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVLabel;
  [(_TVLabel *)&v4 setNumberOfLines:a3];
  [(_TVLabel *)self _clearCachedValues];
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVLabel;
  [(_TVLabel *)&v4 setAdjustsFontSizeToFitWidth:a3];
  [(_TVLabel *)self _clearCachedValues];
}

- (void)setBaselineAdjustment:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVLabel;
  [(_TVLabel *)&v4 setBaselineAdjustment:a3];
  [(_TVLabel *)self _clearCachedValues];
}

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_TVLabel *)self previousBounds];
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  if (!CGRectEqualToRect(v15, v18)
    || [(_TVLabel *)self previousNumberOfLines] != a4
    || ([(_TVLabel *)self cachedTextRectForBounds],
        CGRectEqualToRect(v16, *MEMORY[0x263F001A8])))
  {
    v14.receiver = self;
    v14.super_class = (Class)_TVLabel;
    -[_TVLabel textRectForBounds:limitedToNumberOfLines:](&v14, sel_textRectForBounds_limitedToNumberOfLines_, a4, x, y, width, height);
    -[_TVLabel setCachedTextRectForBounds:](self, "setCachedTextRectForBounds:");
    -[_TVLabel setPreviousBounds:](self, "setPreviousBounds:", x, y, width, height);
    [(_TVLabel *)self setPreviousNumberOfLines:a4];
  }
  [(_TVLabel *)self cachedTextRectForBounds];
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_TVLabel *)self padding];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = fmax(width - (v8 + v12), 0.0);
  double v15 = fmax(height - (v6 + v10), 0.0);
  [(_TVLabel *)self cachedSizeThatFits];
  double v17 = v16;
  double v19 = v18;
  [(_TVLabel *)self previousTargetSize];
  if (-[UIView tv_shouldReuseCachedSizeThatFits:previousTargetSize:newTargetSize:](self, "tv_shouldReuseCachedSizeThatFits:previousTargetSize:newTargetSize:", v17, v19, v20, v21, v14, v15))
  {
    v31.receiver = self;
    v31.super_class = (Class)_TVLabel;
    -[_TVLabel sizeThatFits:](&v31, sel_sizeThatFits_, v14, v15);
    double v23 = v22;
    *(float *)&double v22 = v22;
    *(float *)&double v24 = v24;
    -[_TVLabel setCachedSizeThatFits:](self, "setCachedSizeThatFits:", ceilf(*(float *)&v22), ceilf(*(float *)&v24));
    if (v14 <= 0.0) {
      double v25 = v14;
    }
    else {
      double v25 = v23;
    }
    -[_TVLabel setPreviousTargetSize:](self, "setPreviousTargetSize:", v25, v15);
  }
  [(_TVLabel *)self cachedSizeThatFits];
  double v27 = v13 + v9 + v26;
  [(_TVLabel *)self cachedSizeThatFits];
  double v29 = v11 + v7 + v28;
  double v30 = v27;
  result.double height = v29;
  result.double width = v30;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(_TVLabel *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(_TVLabel *)self padding];
  v23.origin.CGFloat x = v9 + v16;
  v23.origin.CGFloat y = v11 + v17;
  v23.size.CGFloat width = v13 - (v16 + v18);
  v23.size.CGFloat height = v15 - (v17 + v19);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = CGRectIntersection(v21, v23);
  v20.receiver = self;
  v20.super_class = (Class)_TVLabel;
  -[_TVLabel drawTextInRect:](&v20, sel_drawTextInRect_, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
}

- (void)_clearCachedValues
{
  CGPoint v2 = (CGPoint)*MEMORY[0x263F001A8];
  CGSize v3 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->_cachedTextRectForBounds.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_cachedTextRectForBounds.size = v3;
  self->_previousBounds.origin = v2;
  self->_previousBounds.size = v3;
  self->_previousNumberOfLines = 0;
  CGSize v4 = (CGSize)*MEMORY[0x263F001B0];
  self->_cachedSizeThatFits = (CGSize)*MEMORY[0x263F001B0];
  self->_previousTargetSize = v4;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)cachedTextRectForBounds
{
  double x = self->_cachedTextRectForBounds.origin.x;
  double y = self->_cachedTextRectForBounds.origin.y;
  double width = self->_cachedTextRectForBounds.size.width;
  double height = self->_cachedTextRectForBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedTextRectForBounds:(CGRect)a3
{
  self->_cachedTextRectForBounds = a3;
}

- (CGRect)previousBounds
{
  double x = self->_previousBounds.origin.x;
  double y = self->_previousBounds.origin.y;
  double width = self->_previousBounds.size.width;
  double height = self->_previousBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousBounds:(CGRect)a3
{
  self->_previousBounds = a3;
}

- (int64_t)previousNumberOfLines
{
  return self->_previousNumberOfLines;
}

- (void)setPreviousNumberOfLines:(int64_t)a3
{
  self->_previousNumberOfLines = a3;
}

- (CGSize)cachedSizeThatFits
{
  double width = self->_cachedSizeThatFits.width;
  double height = self->_cachedSizeThatFits.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedSizeThatFits:(CGSize)a3
{
  self->_cachedSizeThatFits = a3;
}

- (CGSize)previousTargetSize
{
  double width = self->_previousTargetSize.width;
  double height = self->_previousTargetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousTargetSize:(CGSize)a3
{
  self->_previousTargetSize = a3;
}

@end