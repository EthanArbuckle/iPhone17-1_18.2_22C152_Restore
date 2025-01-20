@interface _UIDragBadge
- (CGPoint)anchorPointForAlignment;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (UIImageView)_imageView;
- (UILabel)_label;
- (_UIDragBadge)initWithCoder:(id)a3;
- (_UIDragBadge)initWithFrame:(CGRect)a3;
- (int64_t)itemCount;
- (int64_t)style;
- (void)_updateForStyle;
- (void)_updateLabelTextFromItemCount;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setItemCount:(int64_t)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation _UIDragBadge

- (_UIDragBadge)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDragBadge;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    CommonInit_0(v3);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDragBadge;
  id v4 = a3;
  [(UIView *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_itemCount, @"UIDragBadgeItemCount", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_style forKey:@"UIDragBadgeStyle"];
}

- (_UIDragBadge)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIDragBadge;
  objc_super v5 = [(UIView *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_itemCount = [v4 decodeIntegerForKey:@"UIDragBadgeItemCount"];
    v5->_style = [v4 decodeIntegerForKey:@"UIDragBadgeStyle"];
    CommonInit_0(v5);
  }

  return v5;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setItemCount:(int64_t)a3
{
  if (self->_itemCount != a3)
  {
    self->_itemCount = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_updateLabelTextFromItemCount
{
  if (qword_1EB25C8E0 != -1) {
    dispatch_once(&qword_1EB25C8E0, &__block_literal_global_174);
  }
  if (self->_itemCount >= 2)
  {
    v3 = (void *)_MergedGlobals_5_6;
    id v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    id v10 = [v3 stringFromNumber:v4];

    objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", 0, objc_msgSend(v10, "length"));
    unint64_t v6 = v5;
    [(UILabel *)self->_label setText:v10];
    if (v6 <= 1)
    {
      if (qword_1EB25C900 == -1)
      {
        objc_super v7 = &qword_1EB25C8F8;
        goto LABEL_10;
      }
      objc_super v7 = &qword_1EB25C8F8;
      v8 = &qword_1EB25C900;
      v9 = &__block_literal_global_52_0;
    }
    else
    {
      if (qword_1EB25C910 == -1)
      {
        objc_super v7 = &qword_1EB25C908;
LABEL_10:
        [(UILabel *)self->_label setFont:*v7];

        return;
      }
      objc_super v7 = &qword_1EB25C908;
      v8 = &qword_1EB25C910;
      v9 = &__block_literal_global_54;
    }
    dispatch_once(v8, v9);
    goto LABEL_10;
  }
}

- (void)_updateForStyle
{
  int64_t style = self->_style;
  if (style == 2)
  {
    int v6 = _AXDarkenSystemColors();
    v2 = +[UIColor systemGrayColor];
    if (v6)
    {
      uint64_t v7 = +[UIColor _accessibilityDarkenedColorForColor:v2];

      v2 = (void *)v7;
    }
  }
  else
  {
    if (style == 1)
    {
      if (_AXDarkenSystemColors()) {
        +[UIColor systemDarkGreenColor];
      }
      else {
        +[UIColor systemGreenColor];
      }
    }
    else
    {
      if (style) {
        goto LABEL_13;
      }
      if (_AXDarkenSystemColors()) {
        +[UIColor systemDarkBlueColor];
      }
      else {
        +[UIColor systemBlueColor];
      }
    uint64_t v5 = };
    v2 = (void *)v5;
  }
LABEL_13:
  [(UIView *)self setBackgroundColor:v2];

  v8 = [(UIView *)self layer];
  [v8 setBorderWidth:1.0];

  id v9 = +[UIColor whiteColor];
  uint64_t v10 = [v9 CGColor];
  v11 = [(UIView *)self layer];
  [v11 setBorderColor:v10];

  int64_t v12 = self->_style;
  id v13 = [(UIView *)self traitCollection];
  if (v12 == 1)
  {
    v14 = @"plus";
    goto LABEL_17;
  }
  if (v12 == 2)
  {
    v14 = @"nosign";
LABEL_17:
    v15 = +[UIImage systemImageNamed:v14 compatibleWithTraitCollection:v13];
    goto LABEL_19;
  }
  v15 = 0;
LABEL_19:

  [(UIImageView *)self->_imageView setImage:v15];
  [(UIView *)self->_imageView sizeToFit];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)layoutSubviews
{
  [(_UIDragBadge *)self _updateForStyle];
  if (self->_itemCount < 2)
  {
    [(UIView *)self->_label setHidden:1];
    [(UIView *)self->_imageView setAlpha:1.0];
    [(UIView *)self bounds];
    -[UIImageView setCenter:](self->_imageView, "setCenter:", v12 + v11 * 0.5, v14 + v13 * 0.5);
    if (self->_style) {
      double v15 = 1.0;
    }
    else {
      double v15 = 0.0;
    }
    imageView = self;
  }
  else
  {
    [(_UIDragBadge *)self _updateLabelTextFromItemCount];
    [(UIView *)self->_label setHidden:0];
    [(UIView *)self setAlpha:1.0];
    if (self->_style)
    {
      UIUserInterfaceLayoutDirection v3 = [(UIView *)self effectiveUserInterfaceLayoutDirection];
      memset(&slice, 0, sizeof(slice));
      BOOL v4 = v3 != UIUserInterfaceLayoutDirectionLeftToRight;
      BOOL v5 = v3 == UIUserInterfaceLayoutDirectionLeftToRight;
      memset(&remainder, 0, sizeof(remainder));
      memset(&v18, 0, sizeof(v18));
      [(UIView *)self bounds];
      CGRectDivide(v22, &slice, &remainder, 25.0, (CGRectEdge)(2 * v4));
      memset(&v17, 0, sizeof(v17));
      CGRectDivide(remainder, &v17, &v18, 6.0, (CGRectEdge)(2 * v5));
      -[UILabel setFrame:](self->_label, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
      [(UIView *)self->_imageView setAlpha:1.0];
      __asm { FMOV            V2.2D, #0.5 }
      [(UIImageView *)self->_imageView setCenter:vaddq_f64((float64x2_t)slice.origin, vmulq_f64((float64x2_t)slice.size, _Q2))];
      return;
    }
    [(UIView *)self bounds];
    CGRect v24 = CGRectInset(v23, 6.0, 0.0);
    -[UILabel setFrame:](self->_label, "setFrame:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    imageView = self->_imageView;
    double v15 = 0.0;
  }
  [imageView setAlpha:v15];
}

- (CGPoint)anchorPointForAlignment
{
  int64_t itemCount = self->_itemCount;
  if (itemCount > 9 || ((v3 = 0.5, itemCount >= 2) ? (BOOL v4 = self->_style == 0) : (BOOL v4 = 1), !v4))
  {
    -[_UIDragBadge _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v3 = -12.5 / v5 + 1.0;
  }
  double v6 = 0.5;
  result.y = v6;
  result.x = v3;
  return result;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double v3 = 25.0;
  if (self->_itemCount >= 2)
  {
    -[UIView systemLayoutSizeFittingSize:](self->_label, "systemLayoutSizeFittingSize:", a3.width, a3.height, 25.0);
    double v6 = 31.0;
    if (!self->_style) {
      double v6 = 12.0;
    }
    double v7 = v5 + v6;
    if (v7 >= 25.0) {
      double v3 = v7;
    }
    else {
      double v3 = 25.0;
    }
  }
  double v8 = 25.0;
  double v9 = v3;
  result.height = v8;
  result.width = v9;
  return result;
}

- (UILabel)_label
{
  return self->_label;
}

- (UIImageView)_imageView
{
  return self->_imageView;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)itemCount
{
  return self->_itemCount;
}

@end