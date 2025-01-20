@interface MapsScrollableStackView
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (MapsScrollableStackView)initWithArrangedSubviews:(id)a3;
- (NSArray)arrangedSubviews;
- (double)spacing;
- (float)fittingSizePriority;
- (id)_constraints;
- (int64_t)alignment;
- (int64_t)axis;
- (int64_t)distribution;
- (void)_setupViewsWithSubviews:(id)a3;
- (void)_updateConstraintConstants;
- (void)_updateOrientationWithNewAxis:(int64_t)a3;
- (void)addArrangedSubview:(id)a3;
- (void)adjustedContentInsetDidChange;
- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4;
- (void)removeArrangedSubview:(id)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setAxis:(int64_t)a3;
- (void)setCustomSpacing:(double)a3 afterView:(id)a4;
- (void)setDistribution:(int64_t)a3;
- (void)setFittingSizePriority:(float)a3;
- (void)setSpacing:(double)a3;
@end

@implementation MapsScrollableStackView

- (MapsScrollableStackView)initWithArrangedSubviews:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MapsScrollableStackView;
  v5 = -[MapsScrollableStackView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5) {
    [(MapsScrollableStackView *)v5 _setupViewsWithSubviews:v4];
  }

  return v6;
}

- (void)_setupViewsWithSubviews:(id)a3
{
  id v4 = a3;
  [(MapsScrollableStackView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  double leading = NSDirectionalEdgeInsetsZero.leading;
  double bottom = NSDirectionalEdgeInsetsZero.bottom;
  double trailing = NSDirectionalEdgeInsetsZero.trailing;
  -[MapsScrollableStackView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", NSDirectionalEdgeInsetsZero.top, leading, bottom, trailing);
  [(MapsScrollableStackView *)self setScrollEnabled:1];
  objc_super v8 = (UIStackView *)[objc_alloc((Class)UIStackView) initWithArrangedSubviews:v4];

  stackView = self->_stackView;
  self->_stackView = v8;

  [(UIStackView *)self->_stackView setSpacing:0.0];
  -[UIStackView setDirectionalLayoutMargins:](self->_stackView, "setDirectionalLayoutMargins:", NSDirectionalEdgeInsetsZero.top, leading, bottom, trailing);
  [(UIStackView *)self->_stackView setPreservesSuperviewLayoutMargins:1];
  [(MapsScrollableStackView *)self addSubview:self->_stackView];
  id v10 = [objc_alloc((Class)MUEdgeLayout) initWithItem:self->_stackView container:self];
  [v10 activate];

  [(MapsScrollableStackView *)self _updateOrientationWithNewAxis:1];
}

- (int64_t)alignment
{
  return [(UIStackView *)self->_stackView alignment];
}

- (void)setAlignment:(int64_t)a3
{
  if ([(UIStackView *)self->_stackView alignment] != a3)
  {
    stackView = self->_stackView;
    [(UIStackView *)stackView setAlignment:a3];
  }
}

- (int64_t)distribution
{
  return [(UIStackView *)self->_stackView distribution];
}

- (void)setDistribution:(int64_t)a3
{
  if ([(UIStackView *)self->_stackView distribution] != a3)
  {
    stackView = self->_stackView;
    [(UIStackView *)stackView setDistribution:a3];
  }
}

- (int64_t)axis
{
  return [(UIStackView *)self->_stackView axis];
}

- (void)setAxis:(int64_t)a3
{
  if ([(MapsScrollableStackView *)self axis] != a3)
  {
    [(MapsScrollableStackView *)self _updateOrientationWithNewAxis:a3];
  }
}

- (void)setSpacing:(double)a3
{
  [(MapsScrollableStackView *)self spacing];
  if (v5 != a3)
  {
    stackView = self->_stackView;
    [(UIStackView *)stackView setSpacing:a3];
  }
}

- (double)spacing
{
  [(UIStackView *)self->_stackView spacing];
  return result;
}

- (void)addArrangedSubview:(id)a3
{
}

- (void)setCustomSpacing:(double)a3 afterView:(id)a4
{
}

- (void)removeArrangedSubview:(id)a3
{
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
}

- (NSArray)arrangedSubviews
{
  return [(UIStackView *)self->_stackView arrangedSubviews];
}

- (void)setFittingSizePriority:(float)a3
{
  if (self->_fittingSizePriority != a3)
  {
    self->_fittingSizePriority = a3;
    int64_t v4 = [(MapsScrollableStackView *)self axis];
    [(MapsScrollableStackView *)self _updateOrientationWithNewAxis:v4];
  }
}

- (void)adjustedContentInsetDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MapsScrollableStackView;
  [(MapsScrollableStackView *)&v3 adjustedContentInsetDidChange];
  [(MapsScrollableStackView *)self _updateConstraintConstants];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  -[UIStackView systemLayoutSizeFittingSize:](self->_stackView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateOrientationWithNewAxis:(int64_t)a3
{
  double v5 = [(MapsScrollableStackView *)self _constraints];
  +[NSLayoutConstraint deactivateConstraints:v5];

  distributionConstraint = self->_distributionConstraint;
  self->_distributionConstraint = 0;

  alignmentConstraint = self->_alignmentConstraint;
  self->_alignmentConstraint = 0;

  [(UIStackView *)self->_stackView setAxis:a3];
  int64_t v8 = [(MapsScrollableStackView *)self axis];
  if (v8 == 1)
  {
    if (self->_fittingSizePriority > 0.0)
    {
      v16 = [(UIStackView *)self->_stackView heightAnchor];
      v17 = [(MapsScrollableStackView *)self heightAnchor];
      v18 = [v16 constraintEqualToAnchor:v17];
      v19 = self->_distributionConstraint;
      self->_distributionConstraint = v18;

      *(float *)&double v20 = self->_fittingSizePriority;
      [(NSLayoutConstraint *)self->_distributionConstraint setPriority:v20];
    }
    v14 = [(UIStackView *)self->_stackView widthAnchor];
    uint64_t v15 = [(MapsScrollableStackView *)self widthAnchor];
  }
  else
  {
    if (v8) {
      goto LABEL_10;
    }
    if (self->_fittingSizePriority > 0.0)
    {
      v9 = [(UIStackView *)self->_stackView widthAnchor];
      id v10 = [(MapsScrollableStackView *)self widthAnchor];
      v11 = [v9 constraintEqualToAnchor:v10];
      v12 = self->_distributionConstraint;
      self->_distributionConstraint = v11;

      *(float *)&double v13 = self->_fittingSizePriority;
      [(NSLayoutConstraint *)self->_distributionConstraint setPriority:v13];
    }
    v14 = [(UIStackView *)self->_stackView heightAnchor];
    uint64_t v15 = [(MapsScrollableStackView *)self heightAnchor];
  }
  v21 = (void *)v15;
  v22 = [v14 constraintEqualToAnchor:v15];
  v23 = self->_alignmentConstraint;
  self->_alignmentConstraint = v22;

LABEL_10:
  [(MapsScrollableStackView *)self _updateConstraintConstants];
  id v24 = [(MapsScrollableStackView *)self _constraints];
  +[NSLayoutConstraint activateConstraints:v24];
}

- (id)_constraints
{
  double v3 = +[NSMutableArray array];
  double v4 = v3;
  if (self->_distributionConstraint) {
    [v3 addObject:];
  }
  if (self->_alignmentConstraint) {
    [v4 addObject:];
  }
  id v5 = [v4 copy];

  return v5;
}

- (void)_updateConstraintConstants
{
  [(MapsScrollableStackView *)self adjustedContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int64_t v11 = [(MapsScrollableStackView *)self axis];
  double v12 = 0.0;
  double v13 = v4 + v8;
  if (v11) {
    double v14 = 0.0;
  }
  else {
    double v14 = v6 + v10;
  }
  if (!v11) {
    double v12 = v4 + v8;
  }
  if (v11 == 1)
  {
    double v15 = v6 + v10;
  }
  else
  {
    double v13 = v14;
    double v15 = v12;
  }
  [(NSLayoutConstraint *)self->_distributionConstraint setConstant:-v13];
  alignmentConstraint = self->_alignmentConstraint;

  [(NSLayoutConstraint *)alignmentConstraint setConstant:-v15];
}

- (float)fittingSizePriority
{
  return self->_fittingSizePriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignmentConstraint, 0);
  objc_storeStrong((id *)&self->_distributionConstraint, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end