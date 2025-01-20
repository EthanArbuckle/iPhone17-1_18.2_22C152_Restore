@interface _UIInterfaceActionSeparatorConstraintController
- (BOOL)_isFixedWidth;
- (NSLayoutConstraint)fixedHeightConstraint;
- (NSLayoutConstraint)fixedWidthConstraint;
- (UIInterfaceActionVisualSeparatorDisplaying)separatorView;
- (_UIInterfaceActionSeparatorConstraintController)initWithSeparatorView:(id)a3;
- (double)constantAxisDimension;
- (int64_t)constantSizedAxis;
- (void)_updateConstantSizedConstraints;
- (void)setConstantAxisDimension:(double)a3;
- (void)setConstantSizedAxis:(int64_t)a3;
@end

@implementation _UIInterfaceActionSeparatorConstraintController

- (_UIInterfaceActionSeparatorConstraintController)initWithSeparatorView:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIInterfaceActionSeparatorConstraintController;
  v5 = [(_UIInterfaceActionSeparatorConstraintController *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_separatorView, v4);
    v7 = [v4 widthAnchor];
    uint64_t v8 = [v7 constraintEqualToConstant:0.0];
    fixedWidthConstraint = v6->_fixedWidthConstraint;
    v6->_fixedWidthConstraint = (NSLayoutConstraint *)v8;

    [(NSLayoutConstraint *)v6->_fixedWidthConstraint setIdentifier:@"verticalSeparatorWidth"];
    v10 = [v4 heightAnchor];
    uint64_t v11 = [v10 constraintEqualToConstant:0.0];
    fixedHeightConstraint = v6->_fixedHeightConstraint;
    v6->_fixedHeightConstraint = (NSLayoutConstraint *)v11;

    [(NSLayoutConstraint *)v6->_fixedHeightConstraint setIdentifier:@"horizontalSeparatorHeight"];
    LODWORD(v13) = 1148829696;
    [(NSLayoutConstraint *)v6->_fixedHeightConstraint setPriority:v13];
    v6->_constantSizedAxis = 1;
    v6->_constantAxisDimension = -1.0;
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 setNeedsUpdateConstraints];
    [(_UIInterfaceActionSeparatorConstraintController *)v6 _updateConstantSizedConstraints];
  }

  return v6;
}

- (void)setConstantSizedAxis:(int64_t)a3
{
  if (self->_constantSizedAxis != a3)
  {
    self->_constantSizedAxis = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_separatorView);
    if ([(_UIInterfaceActionSeparatorConstraintController *)self _isFixedWidth]) {
      id v4 = @"separator|";
    }
    else {
      id v4 = @"separator__";
    }
    [WeakRetained _setLayoutDebuggingIdentifier:v4];
    [WeakRetained setNeedsUpdateConstraints];
    [WeakRetained invalidateIntrinsicContentSize];
  }
}

- (void)setConstantAxisDimension:(double)a3
{
  if (self->_constantAxisDimension != a3)
  {
    self->_constantAxisDimension = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_separatorView);
    [WeakRetained setNeedsUpdateConstraints];
  }
}

- (double)constantAxisDimension
{
  double result = self->_constantAxisDimension;
  if (result < 0.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_separatorView);
    id v4 = [WeakRetained traitCollection];
    v5 = [v4 preferredContentSizeCategory];

    if (!UIContentSizeCategoryIsAccessibilityCategory(v5)) {
      objc_msgSend(WeakRetained, "_currentScreenScale", 1.0);
    }
    UIRoundToViewScale(WeakRetained);
    double v7 = v6;

    return v7;
  }
  return result;
}

- (void)_updateConstantSizedConstraints
{
  if ([(_UIInterfaceActionSeparatorConstraintController *)self _isFixedWidth]) {
    uint64_t v3 = 32;
  }
  else {
    uint64_t v3 = 24;
  }
  id v6 = *(id *)((char *)&self->super.isa + v3);
  if ([(_UIInterfaceActionSeparatorConstraintController *)self _isFixedWidth]) {
    uint64_t v4 = 24;
  }
  else {
    uint64_t v4 = 32;
  }
  id v5 = *(id *)((char *)&self->super.isa + v4);
  [v5 setActive:0];
  [(_UIInterfaceActionSeparatorConstraintController *)self constantAxisDimension];
  objc_msgSend(v6, "setConstant:");
  [v6 setActive:1];
}

- (BOOL)_isFixedWidth
{
  return self->_constantSizedAxis == 0;
}

- (UIInterfaceActionVisualSeparatorDisplaying)separatorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_separatorView);
  return (UIInterfaceActionVisualSeparatorDisplaying *)WeakRetained;
}

- (NSLayoutConstraint)fixedHeightConstraint
{
  return self->_fixedHeightConstraint;
}

- (NSLayoutConstraint)fixedWidthConstraint
{
  return self->_fixedWidthConstraint;
}

- (int64_t)constantSizedAxis
{
  return self->_constantSizedAxis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedWidthConstraint, 0);
  objc_storeStrong((id *)&self->_fixedHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_separatorView);
}

@end