@interface _UIHorizontalIndexTitleBarCell
+ (id)cellFont;
- (BOOL)_isAnotherIndexTitleCellFocused;
- (UILabel)titleLabel;
- (UIView)roundedCornersBackground;
- (_UIFocusFastScrollingIndexBarEntry)entry;
- (_UIHorizontalIndexTitleBarCell)initWithFrame:(CGRect)a3;
- (double)_maxCellWidth;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_updateColors;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setEntry:(id)a3;
- (void)setRoundedCornersBackground:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateForEntry:(id)a3;
@end

@implementation _UIHorizontalIndexTitleBarCell

+ (id)cellFont
{
  if (qword_1EB25CE00 != -1) {
    dispatch_once(&qword_1EB25CE00, &__block_literal_global_218);
  }
  v2 = (void *)_MergedGlobals_3_11;
  return v2;
}

- (_UIHorizontalIndexTitleBarCell)initWithFrame:(CGRect)a3
{
  v30[4] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)_UIHorizontalIndexTitleBarCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    [(UIView *)v3 bounds];
    uint64_t v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    roundedCornersBackground = v3->_roundedCornersBackground;
    v3->_roundedCornersBackground = (UIView *)v5;

    v7 = [(UIView *)v3->_roundedCornersBackground layer];
    [v7 setCornerRadius:10.0];

    v8 = [(UIView *)v3->_roundedCornersBackground layer];
    [v8 setMasksToBounds:1];

    [(UIView *)v3->_roundedCornersBackground setHidden:1];
    [(UIView *)v3->_roundedCornersBackground setAutoresizingMask:18];
    [(UIView *)v3 addSubview:v3->_roundedCornersBackground];
    v9 = [UILabel alloc];
    [(UIView *)v3 bounds];
    uint64_t v10 = -[UILabel initWithFrame:](v9, "initWithFrame:");
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v10;

    v12 = +[UIColor whiteColor];
    [(UILabel *)v3->_titleLabel setTextColor:v12];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    v13 = +[_UIHorizontalIndexTitleBarCell cellFont];
    [(UILabel *)v3->_titleLabel setFont:v13];

    [(UIView *)v3 addSubview:v3->_titleLabel];
    [(UIView *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = (void *)MEMORY[0x1E4F5B268];
    v28 = [(UIView *)v3->_titleLabel leftAnchor];
    v27 = [(UIView *)v3 leftAnchor];
    v26 = [v28 constraintEqualToAnchor:v27 constant:14.0];
    v30[0] = v26;
    v25 = [(UIView *)v3->_titleLabel topAnchor];
    v14 = [(UIView *)v3 topAnchor];
    v15 = [v25 constraintEqualToAnchor:v14];
    v30[1] = v15;
    v16 = [(UIView *)v3->_titleLabel rightAnchor];
    v17 = [(UIView *)v3 rightAnchor];
    v18 = [v16 constraintEqualToAnchor:v17 constant:-14.0];
    v30[2] = v18;
    v19 = [(UIView *)v3->_titleLabel bottomAnchor];
    v20 = [(UIView *)v3 bottomAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v30[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    [v24 activateConstraints:v22];

    [(_UIHorizontalIndexTitleBarCell *)v3 _updateColors];
  }
  return v3;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [(_UIHorizontalIndexTitleBarCell *)self _maxCellWidth];
  double v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)_UIHorizontalIndexTitleBarCell;
  v7 = [(UICollectionReusableView *)&v11 preferredLayoutAttributesFittingAttributes:v4];

  v8 = (void *)[v7 copy];
  [v8 size];
  if (v6 >= v9) {
    double v6 = v9;
  }
  [v8 size];
  [v8 setSize:v6];
  return v8;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)_UIHorizontalIndexTitleBarCell;
  [(UICollectionViewCell *)&v5 prepareForReuse];
  [(_UIHorizontalIndexTitleBarCell *)self setEntry:0];
  v3 = [(_UIHorizontalIndexTitleBarCell *)self titleLabel];
  [v3 setText:0];

  id v4 = [(_UIHorizontalIndexTitleBarCell *)self roundedCornersBackground];
  [v4 setHidden:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIHorizontalIndexTitleBarCell;
  id v4 = a3;
  [(UICollectionViewCell *)&v6 traitCollectionDidChange:v4];
  objc_super v5 = [(UIView *)self traitCollection];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIHorizontalIndexTitleBarCell;
  [(UIView *)&v7 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  BOOL v5 = [(UICollectionViewCell *)self isFocused];
  objc_super v6 = [(_UIHorizontalIndexTitleBarCell *)self roundedCornersBackground];
  [v6 setHidden:!v5];

  [(_UIHorizontalIndexTitleBarCell *)self _updateColors];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIHorizontalIndexTitleBarCell;
  [(UICollectionViewCell *)&v4 setSelected:a3];
  [(_UIHorizontalIndexTitleBarCell *)self _updateColors];
}

- (void)updateForEntry:(id)a3
{
  id v4 = a3;
  [(_UIHorizontalIndexTitleBarCell *)self setEntry:v4];
  id v6 = [v4 title];

  BOOL v5 = [(_UIHorizontalIndexTitleBarCell *)self titleLabel];
  [v5 setText:v6];
}

- (double)_maxCellWidth
{
  uint64_t v3 = [(UICollectionReusableView *)self _collectionView];
  double v4 = 760.0;
  if (v3)
  {
    BOOL v5 = (void *)v3;
    id v6 = [(UICollectionReusableView *)self _collectionView];
    [v6 frame];
    double v8 = v7;

    if (v8 != 0.0)
    {
      double v9 = [(UICollectionReusableView *)self _collectionView];
      [v9 frame];
      double v11 = v10;

      double v4 = v11 * 0.5 + -200.0;
    }
  }
  double result = 200.0;
  if (v4 >= 200.0) {
    return v4;
  }
  return result;
}

- (BOOL)_isAnotherIndexTitleCellFocused
{
  uint64_t v3 = [(UIView *)self _focusSystem];
  double v4 = [v3 _focusedView];

  if (v4)
  {
    objc_opt_class();
    BOOL v5 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && v4 != self)
    {
      id v6 = [(UICollectionReusableView *)v4 _collectionView];
      double v7 = [(UICollectionReusableView *)self _collectionView];
      BOOL v5 = v6 == v7;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_updateColors
{
  uint64_t v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 2)
  {
    double v5 = 1.0;
    id v6 = +[UIColor colorWithWhite:1.0 alpha:0.3];
    double v7 = 0.4;
    double v8 = 1.0;
  }
  else
  {
    double v5 = 0.0;
    id v6 = +[UIColor colorWithWhite:0.0 alpha:0.4];
    double v7 = 0.6;
    double v8 = 0.0;
  }
  double v9 = +[UIColor colorWithWhite:v8 alpha:v7];
  id v14 = +[UIColor colorWithWhite:v5 alpha:1.0];
  [(UIView *)self->_roundedCornersBackground setBackgroundColor:v6];
  if ([(UICollectionViewCell *)self isFocused])
  {
    double v10 = +[UIColor whiteColor];
    double v11 = [(_UIHorizontalIndexTitleBarCell *)self titleLabel];
    [v11 setTextColor:v10];
  }
  else
  {
    if ([(UICollectionViewCell *)self isSelected]
      && ![(_UIHorizontalIndexTitleBarCell *)self _isAnotherIndexTitleCellFocused])
    {
      v12 = [(_UIHorizontalIndexTitleBarCell *)self titleLabel];
      double v10 = v12;
      id v13 = v14;
    }
    else
    {
      v12 = [(_UIHorizontalIndexTitleBarCell *)self titleLabel];
      double v10 = v12;
      id v13 = v9;
    }
    [v12 setTextColor:v13];
  }
}

- (_UIFocusFastScrollingIndexBarEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)roundedCornersBackground
{
  return self->_roundedCornersBackground;
}

- (void)setRoundedCornersBackground:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roundedCornersBackground, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end