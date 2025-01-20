@interface UIInterfaceActionSeparatorAttributes
- (BOOL)_hasNonClearBackgroundColor;
- (BOOL)isEqual:(id)a3;
- (NSArray)filters;
- (UIColor)backgroundColor;
- (UIInterfaceActionSeparatorAttributes)init;
- (double)opacity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newSeparatorView;
- (void)setBackgroundColor:(id)a3;
- (void)setFilters:(id)a3;
- (void)setOpacity:(double)a3;
@end

@implementation UIInterfaceActionSeparatorAttributes

- (UIInterfaceActionSeparatorAttributes)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionSeparatorAttributes;
  v2 = [(UIInterfaceActionSeparatorAttributes *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_opacity = -1.0;
    filters = v2->_filters;
    v2->_filters = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(UIInterfaceActionSeparatorAttributes *)self opacity];
  objc_msgSend(v4, "setOpacity:");
  v5 = [(UIInterfaceActionSeparatorAttributes *)self filters];
  [v4 setFilters:v5];

  objc_super v6 = [(UIInterfaceActionSeparatorAttributes *)self backgroundColor];
  [v4 setBackgroundColor:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    [(UIInterfaceActionSeparatorAttributes *)self opacity];
    double v9 = v8;
    [v7 opacity];
    if (v9 != v10)
    {
      char v13 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v11 = [(UIInterfaceActionSeparatorAttributes *)self backgroundColor];
    v12 = [v7 backgroundColor];
    if (v11 == v12
      || ([(UIInterfaceActionSeparatorAttributes *)self backgroundColor],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v7 backgroundColor],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      v14 = [(UIInterfaceActionSeparatorAttributes *)self filters];
      v15 = [v7 filters];
      char v13 = [v14 isEqual:v15];

      if (v11 == v12)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      char v13 = 0;
    }

    goto LABEL_10;
  }
  char v13 = 0;
LABEL_12:

  return v13;
}

- (double)opacity
{
  double result = self->_opacity;
  if (result < 0.0)
  {
    BOOL v3 = [(UIInterfaceActionSeparatorAttributes *)self _hasNonClearBackgroundColor];
    double result = 0.0;
    if (v3) {
      return 1.0;
    }
  }
  return result;
}

- (id)newSeparatorView
{
  BOOL v3 = [_UIInterfaceActionBlendingSeparatorView alloc];
  id v4 = [(UIInterfaceActionSeparatorAttributes *)self filters];
  v5 = [(_UIInterfaceActionBlendingSeparatorView *)v3 initWithTopLevelFilters:v4 compositingColors:MEMORY[0x1E4F1CBF0] compositingFilterModes:MEMORY[0x1E4F1CBF0]];

  id v6 = [(UIInterfaceActionSeparatorAttributes *)self backgroundColor];

  if (v6)
  {
    id v7 = [(UIInterfaceActionSeparatorAttributes *)self backgroundColor];
    [(UIView *)v5 setBackgroundColor:v7];
  }
  [(UIInterfaceActionSeparatorAttributes *)self opacity];
  -[UIView setAlpha:](v5, "setAlpha:");
  return v5;
}

- (BOOL)_hasNonClearBackgroundColor
{
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    BOOL v3 = +[UIColor clearColor];
    LODWORD(backgroundColor) = ![(UIColor *)backgroundColor isEqual:v3];
  }
  return (char)backgroundColor;
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_filters, 0);
}

@end