@interface MTTableViewCell
+ (double)rowHeight;
+ (id)defaultCellBackgroundColor;
+ (id)detailFont;
+ (id)detailTextColor;
+ (id)textColor;
+ (id)titleFont;
- (BOOL)_isBackgroundEmphasized;
- (BOOL)_isTextEmphasized;
- (BOOL)isEnabled;
- (BOOL)showsSeparator;
- (MTTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)swipeToDeleteButtonColor;
- (UIView)leftAccessoryView;
- (UIView)leftEditingAccessoryView;
- (UIView)separator;
- (id)deleteButtonBlock;
- (int64_t)cellEmphasis;
- (void)_clearCellEmphasis;
- (void)createSeparator;
- (void)didTransitionToState:(unint64_t)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCellEmphasis:(int64_t)a3;
- (void)setDeleteButtonBlock:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setLeftAccessoryView:(id)a3;
- (void)setLeftEditingAccessoryView:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSeparator:(id)a3;
- (void)setShowsSeparator:(BOOL)a3;
- (void)setSwipeToDeleteButtonColor:(id)a3;
- (void)setupCell;
- (void)updateCellShadows:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation MTTableViewCell

+ (double)rowHeight
{
  return 60.0;
}

+ (id)titleFont
{
  return +[UIFont systemFontOfSize:17.0];
}

+ (id)detailFont
{
  return +[UIFont systemFontOfSize:12.0];
}

+ (id)textColor
{
  return +[UIColor blackColor];
}

+ (id)detailTextColor
{
  return +[UIColor colorWithWhite:0.0 alpha:0.5];
}

+ (id)defaultCellBackgroundColor
{
  return +[UIColor backgroundColor];
}

- (MTTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTTableViewCell;
  v4 = [(MTTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    if (isTV()) {
      char v5 = 1;
    }
    else {
      char v5 = isMac();
    }
    v4->_showsSeparator = v5;
    [(MTTableViewCell *)v4 setupCell];
    v6 = v4;
  }

  return v4;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)MTTableViewCell;
  [(MTTableViewCell *)&v5 prepareForReuse];
  [(MTTableViewCell *)self setDeleteButtonBlock:0];
  [(MTTableViewCell *)self setSwipeToDeleteButtonColor:0];
  [(MTTableViewCell *)self _clearCellEmphasis];
  v3 = [(MTTableViewCell *)self textLabel];
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)setupCell
{
  id v3 = objc_alloc((Class)UIView);
  [(MTTableViewCell *)self bounds];
  id v5 = [v3 initWithFrame:];
  v4 = +[UIColor cellSelectedBackgroundColor];
  [v5 setBackgroundColor:v4];

  [(MTTableViewCell *)self setSelectedBackgroundView:v5];
  if (self->_showsSeparator) {
    [(MTTableViewCell *)self createSeparator];
  }
}

- (void)createSeparator
{
  if (!self->_separator)
  {
    id v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v3 = +[UIColor cellSeparatorColor];
    [v4 setBackgroundColor:v3];

    [(MTTableViewCell *)self setSeparator:v4];
    [(MTTableViewCell *)self addSubview:v4];
  }
}

- (void)setLeftAccessoryView:(id)a3
{
  id v5 = (UIView *)a3;
  leftAccessoryView = self->_leftAccessoryView;
  if (leftAccessoryView != v5)
  {
    v7 = v5;
    [(UIView *)leftAccessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_leftAccessoryView, a3);
    leftAccessoryView = (UIView *)[(MTTableViewCell *)self setNeedsLayout];
    id v5 = v7;
  }

  _objc_release_x1(leftAccessoryView, v5);
}

- (void)setLeftEditingAccessoryView:(id)a3
{
  id v5 = (UIView *)a3;
  leftEditingAccessoryView = self->_leftEditingAccessoryView;
  if (leftEditingAccessoryView != v5)
  {
    v7 = v5;
    [(UIView *)leftEditingAccessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_leftEditingAccessoryView, a3);
    leftEditingAccessoryView = (UIView *)[(MTTableViewCell *)self setNeedsLayout];
    id v5 = v7;
  }

  _objc_release_x1(leftEditingAccessoryView, v5);
}

- (void)setShowsSeparator:(BOOL)a3
{
  if (self->_showsSeparator != a3)
  {
    self->_showsSeparator = a3;
    if (a3)
    {
      [(MTTableViewCell *)self createSeparator];
    }
    else
    {
      [(UIView *)self->_separator removeFromSuperview];
      [(MTTableViewCell *)self setSeparator:0];
    }
  }
}

- (void)_clearCellEmphasis
{
}

- (void)setCellEmphasis:(int64_t)a3
{
  if (self->_cellEmphasis != a3)
  {
    self->_cellEmphasis = a3;
    unsigned __int8 v4 = [(MTTableViewCell *)self _isTextEmphasized];
    unsigned __int8 v5 = [(MTTableViewCell *)self _isBackgroundEmphasized];
    v6 = [(MTTableViewCell *)self textLabel];
    if (v4) {
      +[UIColor cellEmpahsisTextColor];
    }
    else {
    v7 = [(id)objc_opt_class() textColor];
    }
    [v6 setTextColor:v7];

    if (v5) {
      +[UIColor cellEmpahsisBackgroundColor];
    }
    else {
    id v8 = [(id)objc_opt_class() defaultCellBackgroundColor];
    }
    [(MTTableViewCell *)self setBackgroundColor:v8];
  }
}

- (BOOL)_isTextEmphasized
{
  return self->_cellEmphasis != 0;
}

- (BOOL)_isBackgroundEmphasized
{
  return self->_cellEmphasis > 1uLL;
}

- (void)layoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)MTTableViewCell;
  [(MTTableViewCell *)&v49 layoutSubviews];
  if (self->_separator)
  {
    id v3 = [(MTTableViewCell *)self separator];
    [v3 frame];
    CGFloat v5 = v4;

    [(MTTableViewCell *)self bounds];
    double Width = CGRectGetWidth(v50);
    v7 = +[UIScreen mainScreen];
    [v7 scale];
    double v9 = v8;

    CGFloat v10 = 1.0 / v9;
    [(MTTableViewCell *)self bounds];
    double Height = CGRectGetHeight(v51);
    v52.origin.double x = 0.0;
    v52.origin.double y = v5;
    v52.size.width = Width;
    v52.size.height = v10;
    double v12 = Height - CGRectGetHeight(v52);
    [(MTTableViewCell *)self separatorInset];
    double x = v13 + 0.0;
    double y = v12 + v15;
    double v18 = Width - (v13 + v17);
    double v20 = v10 - (v15 + v19);
    v21 = [(MTTableViewCell *)self separator];
    [v21 setFrame:x, y, v18, v20];

    v22 = [(MTTableViewCell *)self separator];
    [(MTTableViewCell *)self bringSubviewToFront:v22];
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double v18 = CGRectZero.size.width;
    double v20 = CGRectZero.size.height;
  }
  BOOL v23 = +[UIView areAnimationsEnabled];
  +[UIView setAnimationsEnabled:0];
  if ([(MTTableViewCell *)self isEditing]
    && ![(MTTableViewCell *)self editingStyle])
  {
    v28 = [(MTTableViewCell *)self leftEditingAccessoryView];

    if (v28)
    {
      v29 = [(MTTableViewCell *)self leftEditingAccessoryView];
      v30 = [v29 superview];

      if (v30 != self)
      {
        uint64_t v27 = [(MTTableViewCell *)self leftEditingAccessoryView];
        goto LABEL_12;
      }
LABEL_13:
      int v33 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    v24 = [(MTTableViewCell *)self leftAccessoryView];

    if (v24)
    {
      v25 = [(MTTableViewCell *)self leftAccessoryView];
      v26 = [v25 superview];

      if (v26 != self)
      {
        uint64_t v27 = [(MTTableViewCell *)self leftAccessoryView];
LABEL_12:
        v31 = (void *)v27;
        v32 = [(MTTableViewCell *)self contentView];
        [(MTTableViewCell *)self insertSubview:v31 belowSubview:v32];

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  int v33 = 0;
LABEL_15:
  if ([(MTTableViewCell *)self isEditing]) {
    [(MTTableViewCell *)self leftEditingAccessoryView];
  }
  else {
  v34 = [(MTTableViewCell *)self leftAccessoryView];
  }
  v35 = [(MTTableViewCell *)self contentView];
  [v35 frame];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double MinY = v42;

  if (self->_separator)
  {
    v53.origin.double x = x;
    v53.origin.double y = y;
    v53.size.width = v18;
    v53.size.height = v20;
    double MinY = CGRectGetMinY(v53);
    v44 = [(MTTableViewCell *)self contentView];
    [v44 setFrame:v37, v39, v41, MinY];
  }
  if (v34)
  {
    [v34 sizeThatFits:v41 MinY];
    IMRectCenteredYInRectScale();
    [v34 setFrame:0];
  }
  +[UIView setAnimationsEnabled:v23];
  if (v33)
  {
    [v34 frame];
    CGFloat MaxX = CGRectGetMaxX(v54);
    double v46 = v37 + MaxX;
    double v47 = v41 - (MaxX + 0.0);
    v48 = [(MTTableViewCell *)self contentView];
    [v48 setFrame:v46, v39 + 0.0, v47, MinY];
  }
}

- (void)updateCellShadows:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10007A250;
    v5[3] = &unk_10054D960;
    v5[4] = self;
    BOOL v6 = a3;
    +[UIView animateWithDuration:0 delay:v5 options:0 animations:0.25 completion:0.0];
  }
  else
  {
    [(MTTableViewCell *)self updateCellShadows:a3];
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[MTTableViewCell updateCellShadows:animated:](self, "updateCellShadows:animated:");
  v7.receiver = self;
  v7.super_class = (Class)MTTableViewCell;
  [(MTTableViewCell *)&v7 setHighlighted:v5 animated:v4];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[MTTableViewCell updateCellShadows:animated:](self, "updateCellShadows:animated:");
  v7.receiver = self;
  v7.super_class = (Class)MTTableViewCell;
  [(MTTableViewCell *)&v7 setSelected:v5 animated:v4];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[MTTableViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  BOOL v4 = [(MTTableViewCell *)self textLabel];
  [v4 setEnabled:self->_enabled];

  BOOL v5 = [(MTTableViewCell *)self detailTextLabel];
  [v5 setEnabled:self->_enabled];

  BOOL v6 = [(MTTableViewCell *)self imageView];
  id v8 = v6;
  double v7 = 0.400000006;
  if (self->_enabled) {
    double v7 = 1.0;
  }
  [v6 setAlpha:v7];
}

- (void)didTransitionToState:(unint64_t)a3
{
  if ((a3 & 1) != 0 && ![(MTTableViewCell *)self editingStyle])
  {
    BOOL v5 = [(MTTableViewCell *)self leftAccessoryView];
  }
  else
  {
    BOOL v5 = [(MTTableViewCell *)self leftEditingAccessoryView];
  }
  BOOL v6 = v5;
  [v5 removeFromSuperview];

  v7.receiver = self;
  v7.super_class = (Class)MTTableViewCell;
  [(MTTableViewCell *)&v7 didTransitionToState:a3];
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (UIView)leftAccessoryView
{
  return self->_leftAccessoryView;
}

- (UIView)leftEditingAccessoryView
{
  return self->_leftEditingAccessoryView;
}

- (BOOL)showsSeparator
{
  return self->_showsSeparator;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)cellEmphasis
{
  return self->_cellEmphasis;
}

- (id)deleteButtonBlock
{
  return self->_deleteButtonBlock;
}

- (void)setDeleteButtonBlock:(id)a3
{
}

- (UIColor)swipeToDeleteButtonColor
{
  return self->_swipeToDeleteButtonColor;
}

- (void)setSwipeToDeleteButtonColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeToDeleteButtonColor, 0);
  objc_storeStrong(&self->_deleteButtonBlock, 0);
  objc_storeStrong((id *)&self->_leftEditingAccessoryView, 0);
  objc_storeStrong((id *)&self->_leftAccessoryView, 0);

  objc_storeStrong((id *)&self->_separator, 0);
}

@end