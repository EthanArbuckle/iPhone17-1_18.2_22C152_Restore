@interface NibTableViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSBundle)bundle;
- (NSString)nibName;
- (NibTableViewCell)initWithNibName:(id)a3 bundle:(id)a4 reuseIdentifier:(id)a5;
- (NibTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)cellContentView;
- (void)setCellContentView:(id)a3;
@end

@implementation NibTableViewCell

- (NibTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return [(NibTableViewCell *)self initWithNibName:0 bundle:0 reuseIdentifier:a4];
}

- (NibTableViewCell)initWithNibName:(id)a3 bundle:(id)a4 reuseIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NibTableViewCell;
  v10 = [(NibTableViewCell *)&v17 initWithStyle:0 reuseIdentifier:a5];
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    nibName = v10->_nibName;
    v10->_nibName = v11;

    objc_storeStrong((id *)&v10->_bundle, a4);
    v13 = [(NibTableViewCell *)v10 bundle];
    v14 = [(NibTableViewCell *)v10 nibName];
    id v15 = [v13 loadNibNamed:v14 owner:v10 options:0];

    [(NibTableViewCell *)v10 cellContentViewDidLoad];
  }

  return v10;
}

- (NSString)nibName
{
  nibName = self->_nibName;
  if (!nibName)
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_nibName;
    self->_nibName = v5;

    nibName = self->_nibName;
  }

  return nibName;
}

- (NSBundle)bundle
{
  bundle = self->_bundle;
  if (!bundle)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = self->_bundle;
    self->_bundle = v4;

    bundle = self->_bundle;
  }

  return bundle;
}

- (void)setCellContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_cellContentView = &self->_cellContentView;
  cellContentView = self->_cellContentView;
  if (cellContentView != v5)
  {
    v24 = v5;
    id v8 = [(UIView *)cellContentView superview];
    id v9 = [(NibTableViewCell *)self contentView];

    if (v8 == v9) {
      [(UIView *)*p_cellContentView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_cellContentView, a3);
    v10 = [(NibTableViewCell *)self contentView];
    [v10 addSubview:*p_cellContentView];

    [(UIView *)*p_cellContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [(UIView *)*p_cellContentView leftAnchor];
    v22 = [(NibTableViewCell *)self leftAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v25[0] = v21;
    v20 = [(UIView *)*p_cellContentView topAnchor];
    v11 = [(NibTableViewCell *)self topAnchor];
    v12 = [v20 constraintEqualToAnchor:v11];
    v25[1] = v12;
    v13 = [(UIView *)*p_cellContentView rightAnchor];
    v14 = [(NibTableViewCell *)self rightAnchor];
    id v15 = [v13 constraintEqualToAnchor:v14];
    v25[2] = v15;
    v16 = [(UIView *)*p_cellContentView bottomAnchor];
    objc_super v17 = [(NibTableViewCell *)self bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v25[3] = v18;
    v19 = +[NSArray arrayWithObjects:v25 count:4];
    +[NSLayoutConstraint activateConstraints:v19];

    [(UIView *)*p_cellContentView setPreservesSuperviewLayoutMargins:1];
    v5 = v24;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = [(NibTableViewCell *)self cellContentView];
  LODWORD(v5) = 1144750080;
  LODWORD(v6) = 1112014848;
  [v4 systemLayoutSizeFittingSize:width withHorizontalFittingPriority:0.0 verticalFittingPriority:v5, v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (UIView)cellContentView
{
  return self->_cellContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellContentView, 0);
  objc_storeStrong((id *)&self->_bundle, 0);

  objc_storeStrong((id *)&self->_nibName, 0);
}

@end