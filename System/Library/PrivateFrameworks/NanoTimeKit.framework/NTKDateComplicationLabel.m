@interface NTKDateComplicationLabel
- (BOOL)legibilityHidden;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldCancelTouchesInScrollview;
- (BOOL)usesLegibility;
- (CDComplicationDisplayObserver)displayObserver;
- (CGSize)_highlightInset;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKDevice)device;
- (CLKFont)font;
- (NTKDateComplicationLabel)initWithSizeStyle:(int64_t)a3 accentType:(int64_t)a4 forDevice:(id)a5;
- (UIColor)accentColor;
- (UIColor)textColor;
- (UIEdgeInsets)touchEdgeInsets;
- (double)_cornerRadius;
- (double)_firstLineBaselineFrameOriginY;
- (double)_firstLineBaselineOffsetFromBoundsTop;
- (double)_lastLineBaseline;
- (double)_lastLineBaselineFrameOriginY;
- (double)_legibtilityShadowRadius;
- (id)_attributedStringAccentingNumbersInString:(id)a3;
- (int64_t)accentType;
- (int64_t)numberOfLines;
- (int64_t)sizeStyle;
- (int64_t)textAlignment;
- (unint64_t)overrideDateStyle;
- (unint64_t)textLayoutStyle;
- (void)_applyAccentColorAttributes;
- (void)_computeTextColor;
- (void)_invalidateInternalLabelSize;
- (void)_setFirstLineBaselineFrameOriginY:(double)a3;
- (void)_setFont:(id)a3;
- (void)_setLastLineBaselineFrameOriginY:(double)a3;
- (void)_setText:(id)a3;
- (void)_updateTextColor;
- (void)layoutSubviews;
- (void)setAccentColor:(id)a3;
- (void)setDateComplicationText:(id)a3 withDayRange:(_NSRange)a4 forDateStyle:(unint64_t)a5;
- (void)setDisplayObserver:(id)a3;
- (void)setFont:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLegibilityHidden:(BOOL)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setOverrideDateStyle:(unint64_t)a3;
- (void)setShadowColor:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextLayoutStyle:(unint64_t)a3;
- (void)setTouchEdgeInsets:(UIEdgeInsets)a3;
- (void)setUsesLegibility:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NTKDateComplicationLabel

- (NTKDateComplicationLabel)initWithSizeStyle:(int64_t)a3 accentType:(int64_t)a4 forDevice:(id)a5
{
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)NTKDateComplicationLabel;
  v10 = [(NTKDateComplicationLabel *)&v23 init];
  v11 = v10;
  if (v10)
  {
    v10->_frozen = 0;
    v10->_sizeStyle = a3;
    v10->_accentType = a4;
    objc_storeStrong((id *)&v10->_device, a5);
    id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    highlightView = v11->_highlightView;
    v11->_highlightView = (UIView *)v13;

    v15 = v11->_highlightView;
    v16 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.2];
    [(UIView *)v15 setBackgroundColor:v16];

    [(UIView *)v11->_highlightView setUserInteractionEnabled:0];
    [(UIView *)v11->_highlightView setAlpha:0.0];
    v17 = [(UIView *)v11->_highlightView layer];
    [(NTKDateComplicationLabel *)v11 _cornerRadius];
    objc_msgSend(v17, "setCornerRadius:");

    [(NTKDateComplicationLabel *)v11 addSubview:v11->_highlightView];
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    internalLabel = v11->_internalLabel;
    v11->_internalLabel = v18;

    [(UILabel *)v11->_internalLabel setTextAlignment:1];
    v20 = v11->_internalLabel;
    v21 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v20 setTextColor:v21];

    [(NTKDateComplicationLabel *)v11 addSubview:v11->_internalLabel];
    [(NTKDateComplicationLabel *)v11 _computeTextColor];
  }

  return v11;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)NTKDateComplicationLabel;
  [(NTKDateComplicationLabel *)&v17 layoutSubviews];
  [(NTKDateComplicationLabel *)self bounds];
  double x = v3;
  double y = v5;
  double width = v7;
  double height = v9;
  if (self->_usesLegibility)
  {
    [(NTKDateComplicationLabel *)self _legibtilityShadowRadius];
    CGFloat v12 = -v11;
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    CGRect v19 = CGRectInset(v18, v12, v12);
    double x = v19.origin.x;
    double y = v19.origin.y;
    double width = v19.size.width;
    double height = v19.size.height;
  }
  -[UILabel setFrame:](self->_internalLabel, "setFrame:", x, y, width, height);
  [(NTKDateComplicationLabel *)self _highlightInset];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [(NTKDateComplicationLabel *)self bounds];
  CGRect v21 = CGRectInset(v20, v14, v16);
  -[UIView setFrame:](self->_highlightView, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  cachedFittingSizes = self->_cachedFittingSizes;
  CGSize v24 = a3;
  double v7 = [MEMORY[0x1E4F29238] valueWithBytes:&v24 objCType:"{CGSize=dd}"];
  v8 = [(NSMutableDictionary *)cachedFittingSizes objectForKey:v7];

  if (v8)
  {
    [v8 CGSizeValue];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    -[UILabel sizeThatFits:](self->_internalLabel, "sizeThatFits:", width, height);
    double v10 = v13;
    double v12 = v14;
    double v15 = self->_cachedFittingSizes;
    if (!v15)
    {
      CGFloat v16 = [MEMORY[0x1E4F1CA60] dictionary];
      objc_super v17 = self->_cachedFittingSizes;
      self->_cachedFittingSizes = v16;

      double v15 = self->_cachedFittingSizes;
    }
    *(double *)objc_super v23 = v10;
    *(double *)&v23[1] = v12;
    CGRect v18 = [MEMORY[0x1E4F29238] valueWithBytes:v23 objCType:"{CGSize=dd}"];
    *(double *)v22 = width;
    *(double *)&v22[1] = height;
    CGRect v19 = [MEMORY[0x1E4F29238] valueWithBytes:v22 objCType:"{CGSize=dd}"];
    [(NSMutableDictionary *)v15 setObject:v18 forKey:v19];
  }
  double v20 = v10;
  double v21 = v12;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[NTKDateComplicationLabel sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKDateComplicationLabel;
  [(NTKDateComplicationLabel *)&v7 traitCollectionDidChange:v4];
  double v5 = [(NTKDateComplicationLabel *)self traitCollection];
  uint64_t v6 = [v5 legibilityWeight];
  if (v6 != [v4 legibilityWeight])
  {
    [(UILabel *)self->_internalLabel traitCollectionDidChange:v4];
    [(NTKDateComplicationLabel *)self _invalidateInternalLabelSize];
  }
}

- (void)setDateComplicationText:(id)a3 withDayRange:(_NSRange)a4 forDateStyle:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  objc_storeStrong((id *)&self->_currentDateText, a3);
  self->_dayTextRange.NSUInteger location = location;
  self->_dayTextRange.NSUInteger length = length;
  if (!self->_frozen) {
    [(NTKDateComplicationLabel *)self _setText:self->_currentDateText];
  }
}

- (id)_attributedStringAccentingNumbersInString:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v4];
    accentColor = self->_accentColor;
    if (accentColor)
    {
      uint64_t v17 = *MEMORY[0x1E4FB0700];
      v18[0] = accentColor;
      objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      int64_t v8 = [(NTKDateComplicationLabel *)self accentType];
      if (v8 == 1)
      {
        if (self->_dayTextRange.location != 0x7FFFFFFFFFFFFFFFLL && self->_dayTextRange.length) {
          objc_msgSend(v5, "setAttributes:range:", v7);
        }
      }
      else if (!v8 && [v4 length])
      {
        unint64_t v9 = 0;
        do
        {
          unint64_t v10 = [v4 length] - v9;
          double v11 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
          uint64_t v12 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v11, 0, v9, v10);
          uint64_t v14 = v13;

          if (v12 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0) {
            break;
          }
          objc_msgSend(v5, "setAttributes:range:", v7, v12, v14);
          unint64_t v9 = v12 + v14;
        }
        while (v9 < [v4 length]);
      }
    }
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
  id v5 = a3;
  [(NTKDateComplicationLabel *)self _setFont:v5];
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
  [(NTKDateComplicationLabel *)self _computeTextColor];
  [(NTKDateComplicationLabel *)self _updateTextColor];
}

- (int64_t)numberOfLines
{
  return [(UILabel *)self->_internalLabel numberOfLines];
}

- (void)setNumberOfLines:(int64_t)a3
{
}

- (int64_t)textAlignment
{
  return [(UILabel *)self->_internalLabel textAlignment];
}

- (void)setTextAlignment:(int64_t)a3
{
}

- (void)setShadowColor:(id)a3
{
}

- (void)_updateTextColor
{
}

- (void)_computeTextColor
{
}

- (void)setAccentColor:(id)a3
{
  objc_storeStrong((id *)&self->_accentColor, a3);
  [(NTKDateComplicationLabel *)self _applyAccentColorAttributes];
}

- (UIColor)textColor
{
  return [(UILabel *)self->_internalLabel textColor];
}

- (void)setLegibilityHidden:(BOOL)a3
{
  self->_legibilityHidden = a3;
  if (self->_usesLegibility)
  {
    internalLabel = self->_internalLabel;
    double v4 = 0.1;
    if (!a3) {
      double v4 = 0.6;
    }
    id v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:v4];
    [(UILabel *)internalLabel setShadowColor:v5];
  }
}

- (void)setUsesLegibility:(BOOL)a3
{
  if (self->_usesLegibility != a3)
  {
    self->_usesLegibilitdouble y = a3;
    if (a3)
    {
      [(NTKDateComplicationLabel *)self setLegibilityHidden:self->_legibilityHidden];
      -[UILabel setShadowOffset:](self->_internalLabel, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      internalLabel = self->_internalLabel;
      [(NTKDateComplicationLabel *)self _legibtilityShadowRadius];
      -[UILabel setShadowBlur:](internalLabel, "setShadowBlur:");
    }
    else
    {
      [(UILabel *)self->_internalLabel setShadowColor:0];
    }
    [(NTKDateComplicationLabel *)self setNeedsLayout];
  }
}

- (double)_firstLineBaselineOffsetFromBoundsTop
{
  [(UILabel *)self->_internalLabel _firstLineBaselineOffsetFromBoundsTop];
  double v4 = v3;
  [(UILabel *)self->_internalLabel frame];
  return v4 + CGRectGetMinY(v6);
}

- (double)_firstLineBaselineFrameOriginY
{
  [(NTKDateComplicationLabel *)self frame];
  double v4 = v3;
  [(NTKDateComplicationLabel *)self _firstLineBaselineOffsetFromBoundsTop];
  return v5 + v4;
}

- (void)_setFirstLineBaselineFrameOriginY:(double)a3
{
  [(NTKDateComplicationLabel *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(NTKDateComplicationLabel *)self _firstLineBaselineOffsetFromBoundsTop];
  -[NTKDateComplicationLabel setFrame:](self, "setFrame:", v6, a3 - v11, v8, v10);
}

- (double)_lastLineBaseline
{
  [(UILabel *)self->_internalLabel _lastLineBaseline];
  double v4 = v3;
  [(UILabel *)self->_internalLabel frame];
  return v4 + CGRectGetMinY(v6);
}

- (double)_lastLineBaselineFrameOriginY
{
  [(NTKDateComplicationLabel *)self frame];
  double v4 = v3;
  [(NTKDateComplicationLabel *)self _lastLineBaseline];
  return v5 + v4;
}

- (void)_setLastLineBaselineFrameOriginY:(double)a3
{
  [(NTKDateComplicationLabel *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(NTKDateComplicationLabel *)self _lastLineBaseline];
  -[NTKDateComplicationLabel setFrame:](self, "setFrame:", v6, a3 - v11, v8, v10);
}

- (void)_setText:(id)a3
{
  id v4 = [(NTKDateComplicationLabel *)self _attributedStringAccentingNumbersInString:a3];
  [(UILabel *)self->_internalLabel setAttributedText:v4];
  [(NTKDateComplicationLabel *)self _invalidateInternalLabelSize];
}

- (void)_applyAccentColorAttributes
{
  internalLabel = self->_internalLabel;
  id v5 = [(UILabel *)internalLabel text];
  id v4 = [(NTKDateComplicationLabel *)self _attributedStringAccentingNumbersInString:v5];
  [(UILabel *)internalLabel setAttributedText:v4];
}

- (void)_setFont:(id)a3
{
  [(UILabel *)self->_internalLabel setFont:a3];
  [(NTKDateComplicationLabel *)self _invalidateInternalLabelSize];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKDateComplicationLabel;
  -[NTKDateComplicationLabel setHighlighted:](&v8, sel_setHighlighted_);
  double v5 = 0.2;
  double v6 = 0.0;
  if (v3) {
    double v5 = 0.0;
  }
  v7[1] = 3221225472;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[2] = __43__NTKDateComplicationLabel_setHighlighted___block_invoke;
  v7[3] = &unk_1E62C2950;
  if (v3) {
    double v6 = 1.0;
  }
  v7[4] = self;
  *(double *)&v7[5] = v6;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v5];
}

uint64_t __43__NTKDateComplicationLabel_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 480) setAlpha:*(double *)(a1 + 40)];
}

- (void)_invalidateInternalLabelSize
{
  [(NSMutableDictionary *)self->_cachedFittingSizes removeAllObjects];
  [(NTKDateComplicationLabel *)self sizeToFit];
  [(NTKDateComplicationLabel *)self setNeedsLayout];
  id v3 = [(NTKDateComplicationLabel *)self displayObserver];
  [v3 complicationDisplayNeedsResize:self];
}

- (BOOL)shouldCancelTouchesInScrollview
{
  return 1;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(NTKDateComplicationLabel *)self bounds];
  double top = self->_touchEdgeInsets.top;
  double left = self->_touchEdgeInsets.left;
  double v10 = v9 + left;
  double v12 = v11 + top;
  double v14 = v13 - (left + self->_touchEdgeInsets.right);
  double v16 = v15 - (top + self->_touchEdgeInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;
  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

- (double)_cornerRadius
{
  double result = 2.0;
  if (!self->_sizeStyle) {
    return 6.0;
  }
  return result;
}

- (CGSize)_highlightInset
{
  double v2 = 6.5;
  if (self->_sizeStyle) {
    double v2 = 2.0;
  }
  double v3 = -1.0;
  result.double height = v2;
  result.double width = v3;
  return result;
}

- (double)_legibtilityShadowRadius
{
  double result = 5.0;
  if (!self->_sizeStyle) {
    return 10.0;
  }
  return result;
}

- (CDComplicationDisplayObserver)displayObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->displayObserver);
  return (CDComplicationDisplayObserver *)WeakRetained;
}

- (void)setDisplayObserver:(id)a3
{
}

- (unint64_t)textLayoutStyle
{
  return self->textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->textLayoutStyle = a3;
}

- (int64_t)sizeStyle
{
  return self->_sizeStyle;
}

- (int64_t)accentType
{
  return self->_accentType;
}

- (CLKDevice)device
{
  return self->_device;
}

- (CLKFont)font
{
  return self->_font;
}

- (UIColor)accentColor
{
  return self->_accentColor;
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (BOOL)legibilityHidden
{
  return self->_legibilityHidden;
}

- (unint64_t)overrideDateStyle
{
  return self->_overrideDateStyle;
}

- (void)setOverrideDateStyle:(unint64_t)a3
{
  self->_overrideDateStyle = a3;
}

- (UIEdgeInsets)touchEdgeInsets
{
  double top = self->_touchEdgeInsets.top;
  double left = self->_touchEdgeInsets.left;
  double bottom = self->_touchEdgeInsets.bottom;
  double right = self->_touchEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchEdgeInsets:(UIEdgeInsets)a3
{
  self->_touchEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accentColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->displayObserver);
  objc_storeStrong((id *)&self->_computedTextColor, 0);
  objc_storeStrong((id *)&self->_cachedFittingSizes, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_internalLabel, 0);
  objc_storeStrong((id *)&self->_currentDateText, 0);
}

@end