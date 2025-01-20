@interface RAPTransitLineTableViewCell
+ (id)measuringCell;
- (RAPTransitLineTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)preferredHeightInTableView:(id)a3;
- (void)alignWithShieldWidth:(double)a3;
- (void)layoutMarginsDidChange;
- (void)setContentsFromTransitLine:(id)a3;
- (void)setImage:(id)a3;
- (void)updateConstraints;
- (void)updateImageConstraints;
@end

@implementation RAPTransitLineTableViewCell

+ (id)measuringCell
{
  if (qword_10160EA60 != -1) {
    dispatch_once(&qword_10160EA60, &stru_1012E7390);
  }
  v3 = NSStringFromClass((Class)a1);
  id v4 = [(id)qword_10160EA58 objectForKeyedSubscript:v3];
  if (!v4)
  {
    id v4 = [objc_alloc((Class)a1) initWithStyle:0 reuseIdentifier:0];
    [(id)qword_10160EA58 setObject:v4 forKeyedSubscript:v3];
  }

  return v4;
}

- (RAPTransitLineTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)RAPTransitLineTableViewCell;
  id v4 = [(RAPTransitLineTableViewCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v4->_imageView;
    v4->_imageView = v5;

    [(UIImageView *)v4->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(RAPTransitLineTableViewCell *)v4 contentView];
    [v7 addSubview:v4->_imageView];

    LODWORD(v8) = 1148829696;
    [(UIImageView *)v4->_imageView setContentCompressionResistancePriority:1 forAxis:v8];
  }
  return v4;
}

- (void)updateConstraints
{
  v16.receiver = self;
  v16.super_class = (Class)RAPTransitLineTableViewCell;
  [(RAPTransitLineTableViewCell *)&v16 updateConstraints];
  if (self->_didSetupConstraints)
  {
    [(RAPTransitLineTableViewCell *)self updateImageConstraints];
  }
  else
  {
    v3 = [(UIImageView *)self->_imageView leadingAnchor];
    id v4 = [(RAPTransitLineTableViewCell *)self contentView];
    v5 = [v4 layoutMarginsGuide];
    v6 = [v5 leadingAnchor];
    v7 = [v3 constraintEqualToAnchor:v6];
    leadingConstraint = self->_leadingConstraint;
    self->_leadingConstraint = v7;

    if (self->_shieldWidth > 0.0) {
      -[RAPTransitLineTableViewCell alignWithShieldWidth:](self, "alignWithShieldWidth:");
    }
    v9 = [(UIImageView *)self->_imageView widthAnchor];
    objc_super v10 = [(UIImageView *)self->_imageView image];
    [v10 size];
    [v9 constraintEqualToConstant:];
    v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    imageViewWidthConstraint = self->_imageViewWidthConstraint;
    self->_imageViewWidthConstraint = v11;

    v13 = +[NSMutableArray arrayWithCapacity:3];
    [v13 addObject:self->_leadingConstraint];
    [v13 addObject:self->_imageViewWidthConstraint];
    v14 = _NSDictionaryOfVariableBindings(@"_imageView", self->_imageView, 0);
    v15 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[_imageView]-|", 0, 0, v14);
    [v13 addObjectsFromArray:v15];

    +[NSLayoutConstraint activateConstraints:v13];
    self->_didSetupConstraints = 1;
  }
}

- (void)layoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)RAPTransitLineTableViewCell;
  [(RAPTransitLineTableViewCell *)&v4 layoutMarginsDidChange];
  [(RAPTransitLineTableViewCell *)self layoutMargins];
  -[RAPTransitLineTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v3 + self->_shieldWidth + 12.0, 0.0, 0.0);
}

- (void)updateImageConstraints
{
  [(NSLayoutConstraint *)self->_imageViewWidthConstraint constant];
  double v4 = v3;
  v5 = [(UIImageView *)self->_imageView image];
  [v5 size];
  double v7 = v6;

  if (v4 != v7)
  {
    id v8 = [(UIImageView *)self->_imageView image];
    [v8 size];
    -[NSLayoutConstraint setConstant:](self->_imageViewWidthConstraint, "setConstant:");
  }
}

- (void)setContentsFromTransitLine:(id)a3
{
  id v19 = a3;
  double v4 = [v19 primaryDescriptionText];
  v5 = [(RAPTransitLineTableViewCell *)self textLabel];
  [v5 setText:v4];

  double v6 = [(RAPTransitLineTableViewCell *)self textLabel];
  [v6 setNumberOfLines:4];

  double v7 = [v19 secondaryDescriptionText];
  id v8 = [(RAPTransitLineTableViewCell *)self detailTextLabel];
  [v8 setText:v7];

  v9 = [(RAPTransitLineTableViewCell *)self detailTextLabel];
  [v9 setNumberOfLines:4];

  objc_super v10 = [(RAPTransitLineTableViewCell *)self window];
  v11 = [v10 screen];
  v12 = v11;
  if (v11)
  {
    [v11 scale];
    double v14 = v13;
  }
  else
  {
    v15 = +[UIScreen mainScreen];
    [v15 scale];
    double v14 = v16;
  }
  v17 = [v19 artwork];
  v18 = +[UIImage _mapkit_transitArtworkImageWithDataSource:v17 size:6 scale:v14];

  [(RAPTransitLineTableViewCell *)self setImage:v18];
  [v18 size];
  -[RAPTransitLineTableViewCell alignWithShieldWidth:](self, "alignWithShieldWidth:");
}

- (void)setImage:(id)a3
{
  [(UIImageView *)self->_imageView setImage:a3];

  [(RAPTransitLineTableViewCell *)self setNeedsUpdateConstraints];
}

- (void)alignWithShieldWidth:(double)a3
{
  self->_shieldWidth = a3;
  id v6 = [(UIImageView *)self->_imageView image];
  [v6 size];
  [(NSLayoutConstraint *)self->_leadingConstraint setConstant:a3 - v5];
}

- (double)preferredHeightInTableView:(id)a3
{
  [a3 bounds];
  double v5 = v4;
  id v6 = [(RAPTransitLineTableViewCell *)self contentView];
  [v6 systemLayoutSizeFittingSize:v5];
  double v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end