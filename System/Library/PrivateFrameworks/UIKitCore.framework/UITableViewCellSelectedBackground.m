@interface UITableViewCellSelectedBackground
- (BOOL)isMultiselect;
- (NSArray)selectionEffects;
- (UIColor)multiselectBackgroundColor;
- (UIColor)noneStyleBackgroundColor;
- (UIColor)selectionTintColor;
- (int64_t)selectionStyle;
- (void)layoutSubviews;
- (void)setMultiselect:(BOOL)a3;
- (void)setMultiselectBackgroundColor:(id)a3;
- (void)setNoneStyleBackgroundColor:(id)a3;
- (void)setSelectionEffects:(id)a3;
- (void)setSelectionStyle:(int64_t)a3;
- (void)setSelectionTintColor:(id)a3;
- (void)tintColorDidChange;
- (void)updateBackgroundColor;
@end

@implementation UITableViewCellSelectedBackground

- (void)setSelectionTintColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_selectionTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectionTintColor, a3);
    [(UITableViewCellSelectedBackground *)self updateBackgroundColor];
    v5 = v6;
  }
}

- (void)setSelectionStyle:(int64_t)a3
{
  if (self->_selectionStyle != a3)
  {
    self->_selectionStyle = a3;
    [(UITableViewCellSelectedBackground *)self setSelectionTintColor:0];
    [(UITableViewCellSelectedBackground *)self updateBackgroundColor];
  }
}

- (void)setSelectionEffects:(id)a3
{
  id v4 = a3;
  selectionEffectsView = self->_selectionEffectsView;
  id v10 = v4;
  if (v4)
  {
    if (!selectionEffectsView)
    {
      v6 = [UIVisualEffectView alloc];
      [(UIView *)self bounds];
      v7 = -[UIVisualEffectView initWithFrame:](v6, "initWithFrame:");
      v8 = self->_selectionEffectsView;
      self->_selectionEffectsView = v7;

      [(UIView *)self addSubview:self->_selectionEffectsView];
      id v4 = v10;
      selectionEffectsView = self->_selectionEffectsView;
    }
    [(UIVisualEffectView *)selectionEffectsView setBackgroundEffects:v4];
  }
  else
  {
    [(UIView *)selectionEffectsView removeFromSuperview];
    v9 = self->_selectionEffectsView;
    self->_selectionEffectsView = 0;
  }
  [(UITableViewCellSelectedBackground *)self updateBackgroundColor];
}

- (void)updateBackgroundColor
{
  if (self->_selectionEffectsView)
  {
    [(UIView *)self setBackgroundColor:0];
    return;
  }
  if (!self->_multiselect)
  {
    if (!self->_selectionStyle)
    {
      uint64_t v3 = 448;
      goto LABEL_7;
    }
    v5 = [(UIView *)self traitCollection];
    if ([v5 userInterfaceIdiom] == 3)
    {
      int64_t selectionStyle = self->_selectionStyle;
      if (selectionStyle == 1)
      {

LABEL_18:
        id v4 = [(UIView *)self tintColor];
        goto LABEL_8;
      }

      if (selectionStyle == 3) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    uint64_t v3 = 440;
    goto LABEL_7;
  }
  uint64_t v3 = 432;
LABEL_7:
  id v4 = *(id *)((char *)&self->super.super.super.isa + v3);
LABEL_8:
  id v7 = v4;
  [(UIView *)self setBackgroundColor:v4];
}

- (void)setNoneStyleBackgroundColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_noneStyleBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_noneStyleBackgroundColor, a3);
    [(UITableViewCellSelectedBackground *)self updateBackgroundColor];
    v5 = v6;
  }
}

- (void)setMultiselect:(BOOL)a3
{
  if (self->_multiselect != a3)
  {
    self->_multiselect = a3;
    [(UITableViewCellSelectedBackground *)self updateBackgroundColor];
  }
}

- (NSArray)selectionEffects
{
  return [(UIVisualEffectView *)self->_selectionEffectsView backgroundEffects];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellSelectedBackground;
  [(UIView *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_selectionEffectsView, "setFrame:");
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellSelectedBackground;
  [(UIView *)&v3 tintColorDidChange];
  [(UITableViewCellSelectedBackground *)self updateBackgroundColor];
}

- (int64_t)selectionStyle
{
  return self->_selectionStyle;
}

- (UIColor)multiselectBackgroundColor
{
  return self->_multiselectBackgroundColor;
}

- (void)setMultiselectBackgroundColor:(id)a3
{
}

- (BOOL)isMultiselect
{
  return self->_multiselect;
}

- (UIColor)selectionTintColor
{
  return self->_selectionTintColor;
}

- (UIColor)noneStyleBackgroundColor
{
  return self->_noneStyleBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noneStyleBackgroundColor, 0);
  objc_storeStrong((id *)&self->_selectionTintColor, 0);
  objc_storeStrong((id *)&self->_multiselectBackgroundColor, 0);
  objc_storeStrong((id *)&self->_selectionEffectsView, 0);
}

@end