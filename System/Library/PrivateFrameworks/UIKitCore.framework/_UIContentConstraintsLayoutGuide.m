@interface _UIContentConstraintsLayoutGuide
- (BOOL)wantsMaximumSizeConstraintsActive;
- (BOOL)wantsMinimumSizeConstraintsActive;
- (CGSize)maximumSize;
- (CGSize)minimumSize;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)maximumHeightConstraint;
- (NSLayoutConstraint)maximumWidthConstraint;
- (NSLayoutConstraint)minimumHeightConstraint;
- (NSLayoutConstraint)minimumWidthConstraint;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (UIEdgeInsets)edgeInsets;
- (_UIContentConstraintsLayoutGuide)init;
- (id)_allMarginConstraints;
- (id)_allSizeConstraints;
- (void)_clearConstraints;
- (void)_setAllMarginConstraintsActive:(BOOL)a3;
- (void)_setAllSizeConstraintsActive:(BOOL)a3;
- (void)_updateAllMarginConstraintConstants;
- (void)_updateAllSizeConstraints;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setMaximumSize:(CGSize)a3;
- (void)setMinimumSize:(CGSize)a3;
- (void)setOwningView:(id)a3;
@end

@implementation _UIContentConstraintsLayoutGuide

- (_UIContentConstraintsLayoutGuide)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIContentConstraintsLayoutGuide;
  result = [(UILayoutGuide *)&v3 init];
  if (result)
  {
    result->_maximumSize = (CGSize)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    result->_minimumSize = (CGSize)*MEMORY[0x1E4F1DB30];
  }
  return result;
}

- (void)setOwningView:(id)a3
{
  id v4 = a3;
  id v5 = [(UILayoutGuide *)self owningView];

  if (v5 != v4)
  {
    [(_UIContentConstraintsLayoutGuide *)self _clearConstraints];
    v40.receiver = self;
    v40.super_class = (Class)_UIContentConstraintsLayoutGuide;
    [(UILayoutGuide *)&v40 setOwningView:v4];
    if (v4)
    {
      v6 = [(UILayoutGuide *)self leadingAnchor];
      v7 = [v4 leadingAnchor];
      v8 = [v6 constraintEqualToAnchor:v7 constant:0.0];
      leadingConstraint = self->_leadingConstraint;
      self->_leadingConstraint = v8;

      v10 = [(UILayoutGuide *)self trailingAnchor];
      v11 = [v4 trailingAnchor];
      v12 = [v10 constraintEqualToAnchor:v11 constant:0.0];
      trailingConstraint = self->_trailingConstraint;
      self->_trailingConstraint = v12;

      v14 = [(UILayoutGuide *)self topAnchor];
      v15 = [v4 topAnchor];
      v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];
      topConstraint = self->_topConstraint;
      self->_topConstraint = v16;

      LODWORD(v18) = 1144750080;
      [(NSLayoutConstraint *)self->_topConstraint setPriority:v18];
      v19 = [(UILayoutGuide *)self bottomAnchor];
      v20 = [v4 bottomAnchor];
      v21 = [v19 constraintEqualToAnchor:v20 constant:0.0];
      bottomConstraint = self->_bottomConstraint;
      self->_bottomConstraint = v21;

      LODWORD(v23) = 1144750080;
      [(NSLayoutConstraint *)self->_bottomConstraint setPriority:v23];
      v24 = [(UILayoutGuide *)self widthAnchor];
      v25 = [v24 constraintLessThanOrEqualToConstant:0.0];
      maximumWidthConstraint = self->_maximumWidthConstraint;
      self->_maximumWidthConstraint = v25;

      v27 = [(UILayoutGuide *)self heightAnchor];
      v28 = [v27 constraintLessThanOrEqualToConstant:0.0];
      maximumHeightConstraint = self->_maximumHeightConstraint;
      self->_maximumHeightConstraint = v28;

      v30 = [(UILayoutGuide *)self widthAnchor];
      v31 = [v30 constraintGreaterThanOrEqualToConstant:0.0];
      minimumWidthConstraint = self->_minimumWidthConstraint;
      self->_minimumWidthConstraint = v31;

      v33 = [(UILayoutGuide *)self heightAnchor];
      v34 = [v33 constraintGreaterThanOrEqualToConstant:0.0];
      minimumHeightConstraint = self->_minimumHeightConstraint;
      self->_minimumHeightConstraint = v34;

      LODWORD(v36) = 1148829696;
      [(NSLayoutConstraint *)self->_maximumWidthConstraint setPriority:v36];
      LODWORD(v37) = 1148829696;
      [(NSLayoutConstraint *)self->_maximumHeightConstraint setPriority:v37];
      LODWORD(v38) = 1148829696;
      [(NSLayoutConstraint *)self->_minimumWidthConstraint setPriority:v38];
      LODWORD(v39) = 1148829696;
      [(NSLayoutConstraint *)self->_minimumHeightConstraint setPriority:v39];
      [(_UIContentConstraintsLayoutGuide *)self _updateAllMarginConstraintConstants];
      [(_UIContentConstraintsLayoutGuide *)self _setAllMarginConstraintsActive:1];
      [(_UIContentConstraintsLayoutGuide *)self _updateAllSizeConstraints];
      [(_UIContentConstraintsLayoutGuide *)self _setAllSizeConstraintsActive:1];
    }
  }
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    [(_UIContentConstraintsLayoutGuide *)self _updateAllMarginConstraintConstants];
  }
}

- (void)setMaximumSize:(CGSize)a3
{
  if (fabs(a3.width) >= 0.5) {
    double width = a3.width;
  }
  else {
    double width = 1.79769313e308;
  }
  if (fabs(a3.height) >= 0.5) {
    double height = a3.height;
  }
  else {
    double height = 1.79769313e308;
  }
  [(_UIContentConstraintsLayoutGuide *)self maximumSize];
  if (width != v7 || height != v6)
  {
    self->_maximumSize.double width = width;
    self->_maximumSize.double height = height;
    [(_UIContentConstraintsLayoutGuide *)self _updateAllSizeConstraints];
  }
}

- (void)setMinimumSize:(CGSize)a3
{
  if (fabs(a3.width) >= 0.5) {
    double width = a3.width;
  }
  else {
    double width = 0.0;
  }
  if (fabs(a3.height) >= 0.5) {
    double height = a3.height;
  }
  else {
    double height = 0.0;
  }
  [(_UIContentConstraintsLayoutGuide *)self minimumSize];
  if (width != v7 || height != v6)
  {
    self->_minimumSize.double width = width;
    self->_minimumSize.double height = height;
    [(_UIContentConstraintsLayoutGuide *)self _updateAllSizeConstraints];
  }
}

- (id)_allMarginConstraints
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_leadingConstraint, self->_trailingConstraint, self->_topConstraint, self->_bottomConstraint, 0);
}

- (id)_allSizeConstraints
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_maximumWidthConstraint, self->_maximumHeightConstraint, self->_minimumWidthConstraint, self->_minimumHeightConstraint, 0);
}

- (void)_setAllMarginConstraintsActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F5B268];
  id v5 = [(_UIContentConstraintsLayoutGuide *)self _allMarginConstraints];
  if (v3) {
    [v4 activateConstraints:v5];
  }
  else {
    [v4 deactivateConstraints:v5];
  }
}

- (void)_setAllSizeConstraintsActive:(BOOL)a3
{
  self->_wantsMaximumSizeConstraintsActive = a3;
  self->_wantsMinimumSizeConstraintsActive = a3;
  [(_UIContentConstraintsLayoutGuide *)self _updateAllSizeConstraints];
}

- (void)_updateAllMarginConstraintConstants
{
  p_edgeInsets = &self->_edgeInsets;
  [(NSLayoutConstraint *)self->_leadingConstraint setConstant:self->_edgeInsets.left];
  [(NSLayoutConstraint *)self->_trailingConstraint setConstant:-p_edgeInsets->right];
  [(NSLayoutConstraint *)self->_topConstraint setConstant:p_edgeInsets->top];
  double v4 = -p_edgeInsets->bottom;
  bottomConstraint = self->_bottomConstraint;
  [(NSLayoutConstraint *)bottomConstraint setConstant:v4];
}

- (void)_updateAllSizeConstraints
{
  id v10 = [MEMORY[0x1E4F1CA48] array];
  if (self->_maximumSize.width < 1.79769313e308)
  {
    -[NSLayoutConstraint setConstant:](self->_maximumWidthConstraint, "setConstant:");
    if (self->_wantsMaximumSizeConstraintsActive) {
      [v10 addObject:self->_maximumWidthConstraint];
    }
  }
  if (self->_maximumSize.height < 1.79769313e308)
  {
    -[NSLayoutConstraint setConstant:](self->_maximumHeightConstraint, "setConstant:");
    if (self->_wantsMaximumSizeConstraintsActive) {
      [v10 addObject:self->_maximumHeightConstraint];
    }
  }
  if (self->_minimumSize.width > 0.00000011920929)
  {
    -[NSLayoutConstraint setConstant:](self->_minimumWidthConstraint, "setConstant:");
    if (self->_wantsMinimumSizeConstraintsActive) {
      [v10 addObject:self->_minimumWidthConstraint];
    }
  }
  if (self->_minimumSize.height > 0.00000011920929)
  {
    -[NSLayoutConstraint setConstant:](self->_minimumHeightConstraint, "setConstant:");
    if (self->_wantsMinimumSizeConstraintsActive) {
      [v10 addObject:self->_minimumHeightConstraint];
    }
  }
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", self->_maximumWidthConstraint, self->_maximumHeightConstraint, self->_minimumWidthConstraint, self->_minimumHeightConstraint, 0);
  [v3 removeObjectsInArray:v10];
  double v4 = (void *)MEMORY[0x1E4F5B268];
  double v6 = _UIConstraintsBySortingConstraintsForInsertionPerformance(v10, v5);
  [v4 activateConstraints:v6];

  double v7 = (void *)MEMORY[0x1E4F5B268];
  v9 = _UIConstraintsBySortingConstraintsForInsertionPerformance(v3, v8);
  [v7 deactivateConstraints:v9];
}

- (void)_clearConstraints
{
  [(_UIContentConstraintsLayoutGuide *)self _setAllMarginConstraintsActive:0];
  leadingConstraint = self->_leadingConstraint;
  self->_leadingConstraint = 0;

  trailingConstraint = self->_trailingConstraint;
  self->_trailingConstraint = 0;

  topConstraint = self->_topConstraint;
  self->_topConstraint = 0;

  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = 0;

  [(_UIContentConstraintsLayoutGuide *)self _setAllSizeConstraintsActive:0];
  maximumWidthConstraint = self->_maximumWidthConstraint;
  self->_maximumWidthConstraint = 0;

  maximumHeightConstraint = self->_maximumHeightConstraint;
  self->_maximumHeightConstraint = 0;

  minimumWidthConstraint = self->_minimumWidthConstraint;
  self->_minimumWidthConstraint = 0;

  minimumHeightConstraint = self->_minimumHeightConstraint;
  self->_minimumHeightConstraint = 0;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)maximumSize
{
  double width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)minimumSize
{
  double width = self->_minimumSize.width;
  double height = self->_minimumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (BOOL)wantsMaximumSizeConstraintsActive
{
  return self->_wantsMaximumSizeConstraintsActive;
}

- (NSLayoutConstraint)maximumWidthConstraint
{
  return self->_maximumWidthConstraint;
}

- (NSLayoutConstraint)maximumHeightConstraint
{
  return self->_maximumHeightConstraint;
}

- (BOOL)wantsMinimumSizeConstraintsActive
{
  return self->_wantsMinimumSizeConstraintsActive;
}

- (NSLayoutConstraint)minimumWidthConstraint
{
  return self->_minimumWidthConstraint;
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_minimumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_maximumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_maximumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
}

@end