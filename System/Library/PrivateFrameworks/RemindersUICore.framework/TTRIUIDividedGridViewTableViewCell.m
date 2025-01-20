@interface TTRIUIDividedGridViewTableViewCell
- (BOOL)_isWiderThanMaximum;
- (BOOL)drawBottomDivider;
- (BOOL)drawsTopDivider;
- (CGRect)_separatorFrame;
- (TTRIDividedGridViewController)gridViewController;
- (TTRIUIDividedGridViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 gridViewType:(int64_t)a5 buttonTitles:(id)a6 buttonAccessibilityLabels:(id)a7 cellBackgroundColor:(id)a8;
- (TTRIUIDividedGridViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 gridViewType:(int64_t)a5 buttonTitles:(id)a6 cellBackgroundColor:(id)a7;
- (UIView)bottomDivider;
- (UIView)topDivider;
- (void)commonInit;
- (void)layoutSubviews;
- (void)setBottomDivider:(id)a3;
- (void)setDrawBottomDivider:(BOOL)a3;
- (void)setDrawsTopDivider:(BOOL)a3;
- (void)setGridViewController:(id)a3;
- (void)setTopDivider:(id)a3;
@end

@implementation TTRIUIDividedGridViewTableViewCell

- (TTRIUIDividedGridViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 gridViewType:(int64_t)a5 buttonTitles:(id)a6 cellBackgroundColor:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)TTRIUIDividedGridViewTableViewCell;
  v14 = [(TTRIUIDividedGridViewTableViewCell *)&v18 initWithStyle:a3 reuseIdentifier:a4];
  if (v14)
  {
    v15 = [[TTRIDividedGridViewController alloc] initWithType:a5 buttonTitles:v12 cellBackgroundColor:v13];
    gridViewController = v14->_gridViewController;
    v14->_gridViewController = v15;

    [(TTRIUIDividedGridViewTableViewCell *)v14 commonInit];
  }

  return v14;
}

- (TTRIUIDividedGridViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 gridViewType:(int64_t)a5 buttonTitles:(id)a6 buttonAccessibilityLabels:(id)a7 cellBackgroundColor:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)TTRIUIDividedGridViewTableViewCell;
  v17 = [(TTRIUIDividedGridViewTableViewCell *)&v21 initWithStyle:a3 reuseIdentifier:a4];
  if (v17)
  {
    objc_super v18 = [[TTRIDividedGridViewController alloc] initWithType:a5 buttonTitles:v14 buttonAccessibilityLabels:v15 cellBackgroundColor:v16];
    gridViewController = v17->_gridViewController;
    v17->_gridViewController = v18;

    [(TTRIUIDividedGridViewTableViewCell *)v17 commonInit];
  }

  return v17;
}

- (void)commonInit
{
  v39[2] = *MEMORY[0x1E4F143B8];
  v3 = [(TTRIDividedGridViewController *)self->_gridViewController view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TTRIUIDividedGridViewTableViewCell *)self addSubview:v3];
  v4 = [(TTRIUIDividedGridViewTableViewCell *)self safeAreaLayoutGuide];
  v5 = [v4 leadingAnchor];
  v6 = [v3 leadingAnchor];
  v7 = [v5 constraintEqualToAnchor:v6 constant:0.5];
  [(TTRIUIDividedGridViewTableViewCell *)self addConstraint:v7];

  v8 = [(TTRIUIDividedGridViewTableViewCell *)self safeAreaLayoutGuide];
  v9 = [v8 trailingAnchor];
  v10 = [v3 trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:0.5];

  v36 = v11;
  LODWORD(v12) = 1148829696;
  [v11 setPriority:v12];
  [(TTRIUIDividedGridViewTableViewCell *)self addConstraint:v11];
  id v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:7 relatedBy:-1 toItem:0 attribute:0 multiplier:1.0 constant:100000.0];
  [(TTRIUIDividedGridViewTableViewCell *)self addConstraint:v13];

  id v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:8 relatedBy:1 toItem:v3 attribute:8 multiplier:1.0 constant:0.0];
  LODWORD(v15) = 1148829696;
  [v14 setPriority:v15];
  v35 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:0.0];
  v39[0] = v14;
  v39[1] = v35;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  [(TTRIUIDividedGridViewTableViewCell *)self addConstraints:v16];

  v17 = objc_opt_new();
  objc_super v18 = +[TTRIDividedGridViewController dividerColor];
  [v17 setBackgroundColor:v18];

  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TTRIUIDividedGridViewTableViewCell *)self addSubview:v17];
  v19 = objc_opt_new();
  v20 = +[TTRIDividedGridViewController dividerColor];
  [v19 setBackgroundColor:v20];

  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TTRIUIDividedGridViewTableViewCell *)self addSubview:v19];
  v37[0] = @"height";
  objc_super v21 = NSNumber;
  v22 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v22 scale];
  v24 = [v21 numberWithDouble:1.0 / v23];
  v37[1] = @"negativeHeight";
  v38[0] = v24;
  v25 = NSNumber;
  v26 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v26 scale];
  v28 = [v25 numberWithDouble:-1.0 / v27];
  v38[1] = v28;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];

  v30 = _NSDictionaryOfVariableBindings(&cfstr_TopdividerBott.isa, v17, v19, v3, 0);
  v31 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[topDivider]|" options:0 metrics:v29 views:v30];
  [(TTRIUIDividedGridViewTableViewCell *)self addConstraints:v31];

  v32 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[bottomDivider]|" options:0 metrics:v29 views:v30];
  [(TTRIUIDividedGridViewTableViewCell *)self addConstraints:v32];

  v33 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[topDivider(==height)]-(negativeHeight)-[gridView]-(negativeHeight)-[bottomDivider(==height)]" options:0 metrics:v29 views:v30];
  [(TTRIUIDividedGridViewTableViewCell *)self addConstraints:v33];

  [(TTRIUIDividedGridViewTableViewCell *)self setTopDivider:v17];
  [(TTRIUIDividedGridViewTableViewCell *)self setBottomDivider:v19];
  v34 = [(TTRIUIDividedGridViewTableViewCell *)self contentView];
  [(TTRIUIDividedGridViewTableViewCell *)self sendSubviewToBack:v34];
}

- (void)layoutSubviews
{
  [(TTRIUIDividedGridViewTableViewCell *)self safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  [(TTRIUIDividedGridViewTableViewCell *)self bounds];
  double Width = CGRectGetWidth(v13);
  BOOL v8 = [(TTRIUIDividedGridViewTableViewCell *)self _isWiderThanMaximum];
  v9 = [(TTRIUIDividedGridViewTableViewCell *)self gridViewController];
  v10 = v9;
  if (v8) {
    double v11 = 100000.0;
  }
  else {
    double v11 = Width - v4 - v6;
  }
  [v9 setPreferredWidth:v11];

  [(TTRIUIDividedGridViewTableViewCell *)self setDrawBottomDivider:v8];
}

- (BOOL)_isWiderThanMaximum
{
  [(TTRIUIDividedGridViewTableViewCell *)self bounds];
  return CGRectGetWidth(v3) > 100000.0;
}

- (BOOL)drawBottomDivider
{
  v2 = [(TTRIUIDividedGridViewTableViewCell *)self bottomDivider];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setDrawBottomDivider:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(TTRIUIDividedGridViewTableViewCell *)self bottomDivider];
  [v4 setHidden:v3];
}

- (BOOL)drawsTopDivider
{
  v2 = [(TTRIUIDividedGridViewTableViewCell *)self topDivider];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setDrawsTopDivider:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(TTRIUIDividedGridViewTableViewCell *)self topDivider];
  [v4 setHidden:v3];
}

- (CGRect)_separatorFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (TTRIDividedGridViewController)gridViewController
{
  return (TTRIDividedGridViewController *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setGridViewController:(id)a3
{
}

- (UIView)topDivider
{
  return self->_topDivider;
}

- (void)setTopDivider:(id)a3
{
}

- (UIView)bottomDivider
{
  return self->_bottomDivider;
}

- (void)setBottomDivider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomDivider, 0);
  objc_storeStrong((id *)&self->_topDivider, 0);

  objc_storeStrong((id *)&self->_gridViewController, 0);
}

@end