@interface _UISearchBarSearchFieldBackgroundView
- (BOOL)backgroundContainer;
- (BOOL)showingCursor;
- (BOOL)showingTouch;
- (_UISearchBarSearchFieldBackgroundView)initWithFrame:(CGRect)a3 active:(BOOL)a4;
- (_UISearchBarSearchFieldBackgroundView)initWithFrame:(CGRect)a3 active:(BOOL)a4 updateView:(BOOL)a5;
- (id)_automaticFillColorForActive:(BOOL)a3;
- (id)_fillColor:(BOOL)a3;
- (id)_strokeColor:(BOOL)a3;
- (id)_ultralightFillColorForOverlayFilter:(BOOL)a3 active:(BOOL)a4;
- (int64_t)barStyle;
- (unint64_t)searchBarStyle;
- (void)layoutSubviews;
- (void)setBackgroundContainer:(BOOL)a3;
- (void)setBarStyle:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setSearchBarStyle:(unint64_t)a3;
- (void)setShowingCursor:(BOOL)a3;
- (void)setShowingTouch:(BOOL)a3;
@end

@implementation _UISearchBarSearchFieldBackgroundView

- (void)layoutSubviews
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)_UISearchBarSearchFieldBackgroundView;
  [(_UITextFieldRoundedRectBackgroundViewNeue *)&v21 layoutSubviews];
  if (self->_backgroundContainer)
  {
    [(UIView *)self bounds];
    double x = v24.origin.x;
    double y = v24.origin.y;
    double width = v24.size.width;
    double height = v24.size.height;
    double MidX = CGRectGetMidX(v24);
    v25.origin.double x = x;
    v25.origin.double y = y;
    v25.size.double width = width;
    v25.size.double height = height;
    double MidY = CGRectGetMidY(v25);
    v9 = [(UIView *)self subviews];
    v10 = (void *)[v9 copy];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_msgSend(v16, "setCenter:", MidX, MidY, (void)v17);
          objc_msgSend(v16, "setBounds:", x, y, width, height);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v13);
    }
  }
}

- (_UISearchBarSearchFieldBackgroundView)initWithFrame:(CGRect)a3 active:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UISearchBarSearchFieldBackgroundView;
  return (_UISearchBarSearchFieldBackgroundView *)-[_UITextFieldRoundedRectBackgroundViewNeue _initWithFrame:active:usesSinglePixelLineWidth:](&v5, sel__initWithFrame_active_usesSinglePixelLineWidth_, a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setSearchBarStyle:(unint64_t)a3
{
  if (self->_searchBarStyle != a3)
  {
    self->_searchBarStyle = a3;
    [(_UITextFieldRoundedRectBackgroundViewNeue *)self updateView];
  }
}

- (void)setCornerRadius:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)_UISearchBarSearchFieldBackgroundView;
  -[_UITextFieldRoundedRectBackgroundViewNeue setCornerRadius:](&v15, sel_setCornerRadius_);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v5 = [(UIView *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 setCornerRadius:a3];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)_strokeColor:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UISearchBarSearchFieldBackgroundView *)self barStyle])
  {
    objc_super v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UISearchBarSearchFieldBackgroundView;
    objc_super v5 = [(_UITextFieldRoundedRectBackgroundViewNeue *)&v7 _strokeColor:v3];
  }
  return v5;
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (id)_fillColor:(BOOL)a3
{
  if (self->_backgroundContainer) {
    goto LABEL_2;
  }
  BOOL v4 = a3;
  uint64_t v6 = [(UIView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 3)
  {
    uint64_t v8 = +[UIColor _carSystemQuaternaryColor];
LABEL_35:
    BOOL v3 = (void *)v8;
    goto LABEL_36;
  }
  uint64_t v9 = [(_UISearchBarSearchFieldBackgroundView *)self searchBarStyle];
  if (v9 > 2009)
  {
    switch(v9)
    {
      case 2010:
        long long v18 = [(UIView *)self layer];
        long long v19 = [v18 compositingFilter];
        long long v20 = [v19 type];
        objc_super v21 = v20;
        uint64_t v22 = *MEMORY[0x1E4F3A2C8];
        goto LABEL_17;
      case 2020:
        BOOL v10 = !v4;
        double v11 = 0.063;
        double v12 = 0.18;
        goto LABEL_19;
      case 2030:
        long long v13 = [(UIView *)self layer];
        long long v14 = [v13 compositingFilter];
        objc_super v15 = [v14 type];
        int v16 = [v15 isEqualToString:*MEMORY[0x1E4F3A2C8]];

        if (v16)
        {
          double v17 = 0.182;
          double v12 = 0.52;
        }
        else
        {
          double v17 = 0.014;
          double v12 = 0.04;
        }
        if (!v4) {
          double v12 = v17;
        }
        double v24 = 1.0;
        goto LABEL_34;
    }
LABEL_23:
    if ([(_UISearchBarSearchFieldBackgroundView *)self barStyle])
    {
      if ([(_UISearchBarSearchFieldBackgroundView *)self barStyle] == 4)
      {
LABEL_2:
        BOOL v3 = 0;
        goto LABEL_36;
      }
      BOOL v25 = !v4;
      double v26 = 0.105;
      double v27 = 0.3;
      goto LABEL_49;
    }
    BOOL v29 = UISearchBarUsesModernAppearance();
    long long v18 = [(UIView *)self layer];
    long long v19 = [v18 compositingFilter];
    long long v20 = [v19 type];
    objc_super v21 = v20;
    if (!v29)
    {
      int v32 = [v20 isEqualToString:*MEMORY[0x1E4F3A008]];

      BOOL v25 = !v4;
      if (v32)
      {
        double v12 = 1.0;
        if (!v4) {
          double v12 = 0.35;
        }
        double v24 = 0.48;
        goto LABEL_34;
      }
      double v26 = 0.035;
      double v27 = 0.1;
LABEL_49:
      if (v25) {
        double v33 = v26;
      }
      else {
        double v33 = v27;
      }
      uint64_t v8 = +[UIColor colorWithRed:0.203921569 green:0.223529412 blue:0.31372549 alpha:v33];
      goto LABEL_35;
    }
    uint64_t v22 = *MEMORY[0x1E4F3A2C8];
LABEL_17:
    int v23 = [v20 isEqualToString:v22];

    uint64_t v8 = [(_UISearchBarSearchFieldBackgroundView *)self _ultralightFillColorForOverlayFilter:v23 != 0 active:v4];
    goto LABEL_35;
  }
  if ((unint64_t)v9 >= 2)
  {
    if (v9 == 2005)
    {
      uint64_t v8 = [(_UISearchBarSearchFieldBackgroundView *)self _automaticFillColorForActive:v4];
      goto LABEL_35;
    }
    goto LABEL_23;
  }
  if ([(_UISearchBarSearchFieldBackgroundView *)self barStyle])
  {
    BOOL v10 = !v4;
    double v11 = 0.105;
    double v12 = 0.3;
LABEL_19:
    if (v10) {
      double v12 = v11;
    }
    double v24 = 0.0;
LABEL_34:
    uint64_t v8 = +[UIColor colorWithWhite:v24 alpha:v12];
    goto LABEL_35;
  }
  if (dyld_program_sdk_at_least())
  {
    if (v4) {
      +[UIColor tertiarySystemFillColor];
    }
    else {
    uint64_t v8 = +[UIColor _searchFieldDisabledBackgroundColor];
    }
    goto LABEL_35;
  }
  v30 = +[UIColor _textFieldBackgroundColor];
  BOOL v3 = v30;
  if (!v4)
  {
    uint64_t v31 = [v30 colorWithAlphaComponent:0.35];

    BOOL v3 = (void *)v31;
  }
LABEL_36:
  return v3;
}

- (unint64_t)searchBarStyle
{
  return self->_searchBarStyle;
}

- (id)_automaticFillColorForActive:(BOOL)a3
{
  if (a3)
  {
    if ([(_UISearchBarSearchFieldBackgroundView *)self showingTouch])
    {
      BOOL v4 = +[UIColor systemFillColor];
    }
    else
    {
      if ([(_UISearchBarSearchFieldBackgroundView *)self showingCursor]) {
        +[UIColor secondarySystemFillColor];
      }
      else {
      BOOL v4 = +[UIColor tertiarySystemFillColor];
      }
    }
  }
  else
  {
    BOOL v4 = +[UIColor _searchFieldDisabledBackgroundColor];
  }
  return v4;
}

- (BOOL)showingTouch
{
  return self->_showingTouch;
}

- (BOOL)showingCursor
{
  return self->_showingCursor;
}

- (void)setBackgroundContainer:(BOOL)a3
{
  if (self->_backgroundContainer != a3)
  {
    self->_backgroundContainer = a3;
    [(_UITextFieldRoundedRectBackgroundViewNeue *)self updateView];
  }
}

- (void)setBarStyle:(int64_t)a3
{
  if (self->_barStyle != a3)
  {
    self->_barStyle = a3;
    [(_UITextFieldRoundedRectBackgroundViewNeue *)self updateView];
  }
}

- (_UISearchBarSearchFieldBackgroundView)initWithFrame:(CGRect)a3 active:(BOOL)a4 updateView:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)_UISearchBarSearchFieldBackgroundView;
  return (_UISearchBarSearchFieldBackgroundView *)-[_UITextFieldRoundedRectBackgroundViewNeue _initWithFrame:active:usesSinglePixelLineWidth:updateView:](&v6, sel__initWithFrame_active_usesSinglePixelLineWidth_updateView_, a4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setShowingTouch:(BOOL)a3
{
  if (self->_showingTouch != a3)
  {
    self->_showingTouch = a3;
    [(_UITextFieldRoundedRectBackgroundViewNeue *)self updateView];
  }
}

- (void)setShowingCursor:(BOOL)a3
{
  if (self->_showingCursor != a3)
  {
    self->_showingCursor = a3;
    [(_UITextFieldRoundedRectBackgroundViewNeue *)self updateView];
  }
}

- (id)_ultralightFillColorForOverlayFilter:(BOOL)a3 active:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v6 = [(_UISearchBarSearchFieldBackgroundView *)self showingTouch];
  double v7 = 0.72;
  if (v6) {
    double v7 = 0.8;
  }
  double v8 = 0.05;
  if (v6) {
    double v8 = 0.16;
  }
  if (!v5) {
    double v7 = v8;
  }
  double v9 = 0.35;
  if (v4) {
    double v9 = 1.0;
  }
  return +[UIColor colorWithRed:0.0 green:0.0274509804 blue:0.0980392157 alpha:v9 * v7];
}

- (BOOL)backgroundContainer
{
  return self->_backgroundContainer;
}

@end