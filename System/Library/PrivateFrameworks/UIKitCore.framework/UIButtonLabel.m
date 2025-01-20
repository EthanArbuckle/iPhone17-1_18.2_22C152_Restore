@interface UIButtonLabel
- (BOOL)_fontIsDefaultForIdiom;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_textColorFollowsTintColor;
- (CGSize)intrinsicContentSize;
- (CGSize)shadowOffset;
- (double)_paddingForBaselineSpacingFromEdge:(int)a3 toNeighborEdge:(int)a4;
- (id)_initWithFrame:(CGRect)a3 button:(id)a4;
- (void)_contentDidChange:(int64_t)a3 fromContent:(id)a4;
- (void)_internallySetNumberOfLines:(int64_t)a3;
- (void)_setFont:(id)a3 isDefaultForIdiom:(BOOL)a4;
- (void)_setWantsAutolayout;
- (void)setFont:(id)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setReverseShadow:(BOOL)a3;
- (void)setShadowOffset:(CGSize)a3;
@end

@implementation UIButtonLabel

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"contents"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIButtonLabel;
    BOOL v5 = [(UIView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)_setWantsAutolayout
{
  v3.receiver = self;
  v3.super_class = (Class)UIButtonLabel;
  [(UIView *)&v3 _setWantsAutolayout];
  [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)setFont:(id)a3
{
}

- (void)setReverseShadow:(BOOL)a3
{
  if (self->_reverseShadow != a3)
  {
    self->_reverseShadow = a3;
    v7.receiver = self;
    v7.super_class = (Class)UIButtonLabel;
    [(UILabel *)&v7 shadowOffset];
    v6.receiver = self;
    v6.super_class = (Class)UIButtonLabel;
    -[UILabel setShadowOffset:](&v6, sel_setShadowOffset_, -v4, -v5);
  }
}

- (BOOL)_textColorFollowsTintColor
{
  p_button = &self->_button;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  int v5 = [WeakRetained _isModernButton];

  if (v5)
  {
    char v17 = 0;
    id v6 = objc_loadWeakRetained((id *)p_button);
    id v7 = (id)objc_msgSend(v6, "_titleColorForState:suppressTintColorFollowing:", objc_msgSend(v6, "state"), &v17);

    LOBYTE(v8) = 0;
    if (!v17)
    {
      id v9 = objc_loadWeakRetained((id *)p_button);
      v10 = objc_msgSend(v9, "_contentForState:", objc_msgSend(v9, "state"));
      v11 = [v10 titleColor];
      if (v11)
      {
        LOBYTE(v8) = 0;
      }
      else
      {
        id v12 = objc_loadWeakRetained((id *)p_button);
        v13 = [v12 _contentForState:0];
        v14 = [v13 titleColor];
        LOBYTE(v8) = v14 == 0;
      }
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)UIButtonLabel;
    return [(UILabel *)&v16 _textColorFollowsTintColor];
  }
  return v8;
}

- (BOOL)_fontIsDefaultForIdiom
{
  return self->_fontIsDefaultForIdiom;
}

- (void)_contentDidChange:(int64_t)a3 fromContent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)UIButtonLabel;
  id v6 = a4;
  [(UILabel *)&v12 _contentDidChange:a3 fromContent:v6];
  NSLineBreakMode v7 = [(UILabel *)self lineBreakMode];
  BOOL v8 = [v6 paragraphStyle];

  uint64_t v9 = [v8 lineBreakMode];
  if ((a3 & 0x8000) != 0 && v7 != v9) {
    [(UIButtonLabel *)self _internallySetNumberOfLines:(unint64_t)v7 > NSLineBreakByCharWrapping];
  }
  int v10 = dyld_program_sdk_at_least();
  if ((a3 & 0x4000) != 0 && v10)
  {
    v11 = [(UIView *)self superview];
    if (objc_opt_respondsToSelector()) {
      [v11 _titleViewLabelMetricsChanged];
    }
  }
}

- (void)_internallySetNumberOfLines:(int64_t)a3
{
  if (!self->_externallySetNumberOfLines)
  {
    v3.receiver = self;
    v3.super_class = (Class)UIButtonLabel;
    [(UILabel *)&v3 setNumberOfLines:a3];
  }
}

- (void)_setFont:(id)a3 isDefaultForIdiom:(BOOL)a4
{
  self->_fontIsDefaultForIdiom = a4;
  v4.receiver = self;
  v4.super_class = (Class)UIButtonLabel;
  [(UILabel *)&v4 setFont:a3];
}

- (CGSize)intrinsicContentSize
{
  v14.receiver = self;
  v14.super_class = (Class)UIButtonLabel;
  [(UILabel *)&v14 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  NSLineBreakMode v7 = [(UILabel *)self text];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    uint64_t v9 = [(UILabel *)self font];
    int v10 = v9;
    if (!v9)
    {
      int v10 = +[UILabel defaultFont];
    }
    objc_msgSend(@"X", "_legacy_sizeWithFont:forWidth:lineBreakMode:", v10, -[UILabel lineBreakMode](self, "lineBreakMode"), 3.40282347e38);
    double v6 = v11;
    if (!v9) {

    }
    double v4 = 0.0;
  }
  double v12 = v4;
  double v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  double v3 = -a3.width;
  double v4 = -a3.height;
  if (self->_reverseShadow)
  {
    a3.width = -a3.width;
    a3.height = -a3.height;
  }
  v5.receiver = self;
  v5.super_class = (Class)UIButtonLabel;
  -[UILabel setShadowOffset:](&v5, sel_setShadowOffset_, a3.width, a3.height, v3, v4);
}

- (id)_initWithFrame:(CGRect)a3 button:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIButtonLabel;
  int v10 = -[UILabel initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  double v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_button, v9);
    double v12 = v11;
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_externallySetNumberOfLines = 1;
  v3.receiver = self;
  v3.super_class = (Class)UIButtonLabel;
  [(UILabel *)&v3 setNumberOfLines:a3];
}

- (CGSize)shadowOffset
{
  v5.receiver = self;
  v5.super_class = (Class)UIButtonLabel;
  [(UILabel *)&v5 shadowOffset];
  if (self->_reverseShadow)
  {
    double v4 = -v4;
    double v3 = -v3;
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (double)_paddingForBaselineSpacingFromEdge:(int)a3 toNeighborEdge:(int)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UIButtonLabel;
  [(UIView *)&v5 _paddingForBaselineSpacingFromEdge:*(void *)&a3 toNeighborEdge:*(void *)&a4];
  return result;
}

@end