@interface CollectionsFilterCell
- (CollectionsFilterCell)initWithFrame:(CGRect)a3;
- (CollectionsFilterViewModel)viewModel;
- (UILabel)filterLabel;
- (void)configureWithModel:(id)a3;
- (void)prepareForReuse;
- (void)setFilterLabel;
- (void)setFilterLabel:(id)a3;
- (void)setUpCornerRadius;
- (void)setUpSelectedBorder;
- (void)setUpSelectedShadows;
- (void)setUpUnselectedBorder;
- (void)setUpUnselectedShadows;
- (void)setViewModel:(id)a3;
- (void)setupConstraints;
- (void)setupSelectedBackgroundView;
- (void)setupSubviews;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateUI;
@end

@implementation CollectionsFilterCell

- (CollectionsFilterCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CollectionsFilterCell;
  v3 = -[CollectionsFilterCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(CollectionsFilterCell *)v3 setAccessibilityIdentifier:v5];

    [(CollectionsFilterCell *)v3 setupSubviews];
    [(CollectionsFilterCell *)v3 setupConstraints];
    [(CollectionsFilterCell *)v3 setUpCornerRadius];
  }
  return v3;
}

- (void)configureWithModel:(id)a3
{
  [(CollectionsFilterCell *)self setViewModel:a3];
  [(CollectionsFilterCell *)self updateUI];
  v4 = [(CollectionsFilterCell *)self selectedBackgroundView];
  [v4 setAlpha:0.0];

  id v6 = +[UIColor quaternarySystemFillColor];
  v5 = [(CollectionsFilterCell *)self selectedBackgroundView];
  [v5 setBackgroundColor:v6];
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)CollectionsFilterCell;
  [(CollectionsFilterCell *)&v7 prepareForReuse];
  [(CollectionsFilterCell *)self setViewModel:0];
  v3 = [(CollectionsFilterCell *)self filterLabel];
  [v3 setText:0];

  v4 = [(CollectionsFilterCell *)self filterLabel];
  [v4 setTextColor:0];

  v5 = [(CollectionsFilterCell *)self contentView];
  [v5 setBackgroundColor:0];

  id v6 = [(CollectionsFilterCell *)self selectedBackgroundView];
  [v6 setBackgroundColor:0];
}

- (void)setupSubviews
{
  if (MapsFeature_IsEnabled_Maps269()) {
    [(CollectionsFilterCell *)self setupSelectedBackgroundView];
  }

  [(CollectionsFilterCell *)self setFilterLabel];
}

- (void)setupSelectedBackgroundView
{
  id v3 = objc_alloc_init((Class)UIView);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 _setContinuousCornerRadius:16.0];
  [v3 setAccessibilityIdentifier:@"CollectionsFilterCellBackground"];
  [(CollectionsFilterCell *)self setSelectedBackgroundView:v3];
}

- (void)setFilterLabel
{
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(CollectionsFilterCell *)self setFilterLabel:v3];

  v4 = [(CollectionsFilterCell *)self filterLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(CollectionsFilterCell *)self filterLabel];
  [v5 setTextAlignment:1];

  id v6 = +[UIColor clearColor];
  objc_super v7 = [(CollectionsFilterCell *)self filterLabel];
  [v7 setBackgroundColor:v6];

  v8 = [(CollectionsFilterCell *)self filterLabel];
  [v8 setNumberOfLines:1];

  v9 = [(CollectionsFilterCell *)self filterLabel];
  [v9 setAccessibilityIdentifier:@"CollectionsFilterCellLabel"];

  id v11 = [(CollectionsFilterCell *)self contentView];
  v10 = [(CollectionsFilterCell *)self filterLabel];
  [v11 addSubview:v10];
}

- (void)setupConstraints
{
  id v45 = objc_alloc_init((Class)NSMutableArray);
  if (MapsFeature_IsEnabled_Maps269())
  {
    v43 = [(CollectionsFilterCell *)self selectedBackgroundView];
    v39 = [v43 leadingAnchor];
    v41 = [(CollectionsFilterCell *)self contentView];
    v37 = [v41 leadingAnchor];
    v35 = [v39 constraintEqualToAnchor:v37];
    v47[0] = v35;
    v33 = [(CollectionsFilterCell *)self selectedBackgroundView];
    v29 = [v33 trailingAnchor];
    v31 = [(CollectionsFilterCell *)self contentView];
    v27 = [v31 trailingAnchor];
    v25 = [v29 constraintEqualToAnchor:v27];
    v47[1] = v25;
    v23 = [(CollectionsFilterCell *)self selectedBackgroundView];
    v20 = [v23 topAnchor];
    v21 = [(CollectionsFilterCell *)self contentView];
    id v3 = [v21 topAnchor];
    v4 = [v20 constraintEqualToAnchor:v3];
    v47[2] = v4;
    v5 = [(CollectionsFilterCell *)self selectedBackgroundView];
    id v6 = [v5 bottomAnchor];
    objc_super v7 = [(CollectionsFilterCell *)self contentView];
    v8 = [v7 bottomAnchor];
    v9 = [v6 constraintEqualToAnchor:v8];
    v47[3] = v9;
    v10 = +[NSArray arrayWithObjects:v47 count:4];
    [v45 addObjectsFromArray:v10];
  }
  v44 = [(CollectionsFilterCell *)self filterLabel];
  v40 = [v44 leadingAnchor];
  v42 = [(CollectionsFilterCell *)self contentView];
  v38 = [v42 leadingAnchor];
  v36 = [v40 constraintEqualToAnchor:v38];
  v46[0] = v36;
  v34 = [(CollectionsFilterCell *)self filterLabel];
  v30 = [v34 trailingAnchor];
  v32 = [(CollectionsFilterCell *)self contentView];
  v28 = [v32 trailingAnchor];
  v26 = [v30 constraintEqualToAnchor:v28];
  v46[1] = v26;
  v24 = [(CollectionsFilterCell *)self filterLabel];
  v22 = [v24 topAnchor];
  id v11 = [(CollectionsFilterCell *)self contentView];
  v12 = [v11 topAnchor];
  v13 = [v22 constraintEqualToAnchor:v12];
  v46[2] = v13;
  v14 = [(CollectionsFilterCell *)self filterLabel];
  v15 = [v14 bottomAnchor];
  v16 = [(CollectionsFilterCell *)self contentView];
  v17 = [v16 bottomAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  v46[3] = v18;
  v19 = +[NSArray arrayWithObjects:v46 count:4];
  [v45 addObjectsFromArray:v19];

  +[NSLayoutConstraint activateConstraints:v45];
}

- (void)setUpSelectedShadows
{
  id v3 = [(CollectionsFilterCell *)self layer];
  [v3 setMasksToBounds:0];

  id v4 = +[UIColor blackColor];
  id v5 = [v4 CGColor];
  id v6 = [(CollectionsFilterCell *)self layer];
  [v6 setShadowColor:v5];

  objc_super v7 = [(CollectionsFilterCell *)self layer];
  LODWORD(v8) = 1036831949;
  [v7 setShadowOpacity:v8];

  v9 = [(CollectionsFilterCell *)self layer];
  [v9 setShadowOffset:0.0, 1.0];

  id v10 = [(CollectionsFilterCell *)self layer];
  [v10 setShadowRadius:4.0];
}

- (void)setUpUnselectedShadows
{
  id v3 = [(CollectionsFilterCell *)self layer];
  [v3 setShadowOpacity:0.0];

  id v4 = [(CollectionsFilterCell *)self layer];
  [v4 setShadowRadius:0.0];
}

- (void)setUpCornerRadius
{
  int IsEnabled_Maps269 = MapsFeature_IsEnabled_Maps269();
  id v4 = [(CollectionsFilterCell *)self contentView];
  id v5 = v4;
  if (IsEnabled_Maps269)
  {
    [v4 _setContinuousCornerRadius:16.0];

    id v6 = [(CollectionsFilterCell *)self contentView];
    objc_super v7 = [v6 layer];
    [v7 setMasksToBounds:1];

    if (MapsFeature_IsEnabled_Maps269()) {
      double v8 = 0.5;
    }
    else {
      double v8 = 1.0;
    }
    v9 = [(CollectionsFilterCell *)self contentView];
    id v10 = [v9 layer];
    [v10 setBorderWidth:v8];

    id v14 = +[UIColor lightGrayColor];
    id v11 = [v14 CGColor];
    v12 = [(CollectionsFilterCell *)self contentView];
    v13 = [v12 layer];
    [v13 setBorderColor:v11];
  }
  else
  {
    [v4 _setContinuousCornerRadius:8.0];

    id v14 = [(CollectionsFilterCell *)self contentView];
    v12 = [v14 layer];
    [v12 setMasksToBounds:1];
  }
}

- (void)setUpSelectedBorder
{
  id v6 = +[UIColor clearColor];
  id v3 = [v6 CGColor];
  id v4 = [(CollectionsFilterCell *)self contentView];
  id v5 = [v4 layer];
  [v5 setBorderColor:v3];
}

- (void)setUpUnselectedBorder
{
  if (MapsFeature_IsEnabled_Maps269()) {
    +[UIColor systemGray3Color];
  }
  else {
  id v6 = +[UIColor lightGrayColor];
  }
  id v3 = [v6 CGColor];
  id v4 = [(CollectionsFilterCell *)self contentView];
  id v5 = [v4 layer];
  [v5 setBorderColor:v3];
}

- (void)updateUI
{
  id v3 = [(CollectionsFilterCell *)self viewModel];
  id v4 = [v3 filterTitle];
  id v5 = [(CollectionsFilterCell *)self filterLabel];
  [v5 setText:v4];

  id v6 = [(CollectionsFilterCell *)self viewModel];
  objc_super v7 = [v6 textColor];
  double v8 = [(CollectionsFilterCell *)self filterLabel];
  [v8 setTextColor:v7];

  v9 = [(CollectionsFilterCell *)self viewModel];
  id v10 = [v9 filterFont];
  id v11 = [(CollectionsFilterCell *)self filterLabel];
  [v11 setFont:v10];

  v12 = [(CollectionsFilterCell *)self viewModel];
  v13 = [v12 backgroundColor];
  id v14 = [(CollectionsFilterCell *)self contentView];
  [v14 setBackgroundColor:v13];

  LODWORD(v12) = MapsFeature_IsEnabled_Maps269();
  id v16 = [(CollectionsFilterCell *)self viewModel];
  unsigned int v15 = [v16 isSelected];
  if (v12)
  {
    if (v15) {
      [(CollectionsFilterCell *)self setUpSelectedBorder];
    }
    else {
      [(CollectionsFilterCell *)self setUpUnselectedBorder];
    }
  }
  else if (v15)
  {
    [(CollectionsFilterCell *)self setUpSelectedShadows];
  }
  else
  {
    [(CollectionsFilterCell *)self setUpUnselectedShadows];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CollectionsFilterCell;
  id v4 = a3;
  [(CollectionsFilterCell *)&v10 traitCollectionDidChange:v4];
  id v5 = [(CollectionsFilterCell *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];

  id v7 = [v4 userInterfaceStyle];
  if (v6 != v7)
  {
    double v8 = [(CollectionsFilterCell *)self viewModel];
    v9 = [(CollectionsFilterCell *)self viewModel];
    [v8 modelSelected:[v9 isSelected] isDarkMode:v6 == (id)2];

    [(CollectionsFilterCell *)self updateUI];
  }
}

- (UILabel)filterLabel
{
  return self->_filterLabel;
}

- (void)setFilterLabel:(id)a3
{
}

- (CollectionsFilterViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_storeStrong((id *)&self->_filterLabel, 0);
}

@end