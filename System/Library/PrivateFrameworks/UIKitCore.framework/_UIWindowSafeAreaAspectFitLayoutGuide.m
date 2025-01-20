@interface _UIWindowSafeAreaAspectFitLayoutGuide
- (BOOL)_isSafeAreaAspectFitLayoutGuide;
- (_UIWindowSafeAreaAspectFitLayoutGuide)init;
- (_UIWindowSafeAreaAspectFitLayoutGuide)initWithCoder:(id)a3;
- (double)aspectRatio;
- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4;
- (void)_createOrUpdateHeightConstraintWithConstant:(double)a3 owningView:(id)a4 constraintsToActivate:(id)a5;
- (void)_createOrUpdateLeftConstraintWithConstant:(double)a3 owningView:(id)a4 constraintsToActivate:(id)a5;
- (void)_createOrUpdateTopConstraintWithConstant:(double)a3 owningView:(id)a4 constraintsToActivate:(id)a5;
- (void)_createOrUpdateWidthConstraintWithConstant:(double)a3 owningView:(id)a4 constraintsToActivate:(id)a5;
- (void)_setOwningView:(id)a3;
- (void)_updateLayoutFrameConstraintsIfNeededWithOwningView:(id)a3;
- (void)_updateLayoutFrameInOwningView:(id)a3 fromEngine:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAspectRatio:(double)a3;
@end

@implementation _UIWindowSafeAreaAspectFitLayoutGuide

- (_UIWindowSafeAreaAspectFitLayoutGuide)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIWindowSafeAreaAspectFitLayoutGuide;
  result = [(UILayoutGuide *)&v3 init];
  if (result) {
    result->_aspectRatio = 1.0;
  }
  return result;
}

- (_UIWindowSafeAreaAspectFitLayoutGuide)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIWindowSafeAreaAspectFitLayoutGuide;
  v5 = [(UILayoutGuide *)&v7 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_UIWindowSafeAreaAspectFitLayoutGuideAspectRatio"];
    -[_UIWindowSafeAreaAspectFitLayoutGuide setAspectRatio:](v5, "setAspectRatio:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIWindowSafeAreaAspectFitLayoutGuide;
  id v4 = a3;
  [(UILayoutGuide *)&v5 encodeWithCoder:v4];
  [(_UIWindowSafeAreaAspectFitLayoutGuide *)self aspectRatio];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_UIWindowSafeAreaAspectFitLayoutGuideAspectRatio");
}

- (void)_setOwningView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIWindowSafeAreaAspectFitLayoutGuide;
  id v4 = a3;
  [(UILayoutGuide *)&v5 _setOwningView:v4];
  self->_layoutFrameDirty = 1;
  objc_msgSend(v4, "_addBoundingPathChangeObserver:", self, v5.receiver, v5.super_class);
}

- (void)dealloc
{
  objc_super v3 = [(UILayoutGuide *)self owningView];
  [v3 _removeBoundingPathChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_UIWindowSafeAreaAspectFitLayoutGuide;
  [(UILayoutGuide *)&v4 dealloc];
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  if (!a4)
  {
    self->_layoutFrameDirty = 1;
    id v5 = [(UILayoutGuide *)self owningView];
    [v5 setNeedsLayout];
  }
}

- (void)setAspectRatio:(double)a3
{
  if (a3 <= 0.0)
  {
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_UIWindowSafeAreaAspectFitLayoutGuide.m", 81, @"Invalid parameter not satisfying: %@", @"aspectRatio > 0.0" object file lineNumber description];
  }
  double v5 = fmax(fmin(a3, 100.0), 0.01);
  if (self->_aspectRatio != v5)
  {
    self->_aspectRatio = v5;
    self->_layoutFrameDirty = 1;
    id v8 = [(UILayoutGuide *)self owningView];
    [v8 setNeedsLayout];
  }
}

- (void)_updateLayoutFrameInOwningView:(id)a3 fromEngine:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_layoutFrameDirty) {
    [(_UIWindowSafeAreaAspectFitLayoutGuide *)self _updateLayoutFrameConstraintsIfNeededWithOwningView:v6];
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIWindowSafeAreaAspectFitLayoutGuide;
  [(UILayoutGuide *)&v8 _updateLayoutFrameInOwningView:v6 fromEngine:v7];
  self->_layoutFrameDirty = 0;
}

- (void)_createOrUpdateLeftConstraintWithConstant:(double)a3 owningView:(id)a4 constraintsToActivate:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  leftConstraint = self->_leftConstraint;
  if (leftConstraint && [(NSLayoutConstraint *)leftConstraint isActive])
  {
    [(NSLayoutConstraint *)self->_leftConstraint setConstant:a3];
  }
  else
  {
    v10 = [(UILayoutGuide *)self leftAnchor];
    v11 = [v14 leftAnchor];
    v12 = [v10 constraintEqualToAnchor:v11 constant:a3];
    v13 = self->_leftConstraint;
    self->_leftConstraint = v12;

    [v8 addObject:self->_leftConstraint];
  }
}

- (void)_createOrUpdateTopConstraintWithConstant:(double)a3 owningView:(id)a4 constraintsToActivate:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  topConstraint = self->_topConstraint;
  if (topConstraint && [(NSLayoutConstraint *)topConstraint isActive])
  {
    [(NSLayoutConstraint *)self->_topConstraint setConstant:a3];
  }
  else
  {
    v10 = [(UILayoutGuide *)self topAnchor];
    v11 = [v14 topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11 constant:a3];
    v13 = self->_topConstraint;
    self->_topConstraint = v12;

    [v8 addObject:self->_topConstraint];
  }
}

- (void)_createOrUpdateWidthConstraintWithConstant:(double)a3 owningView:(id)a4 constraintsToActivate:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  widthConstraint = self->_widthConstraint;
  if (widthConstraint && [(NSLayoutConstraint *)widthConstraint isActive])
  {
    [(NSLayoutConstraint *)self->_widthConstraint setConstant:a3];
  }
  else
  {
    v10 = [(UILayoutGuide *)self widthAnchor];
    v11 = [v10 constraintEqualToConstant:a3];
    v12 = self->_widthConstraint;
    self->_widthConstraint = v11;

    [v8 addObject:self->_widthConstraint];
  }
}

- (void)_createOrUpdateHeightConstraintWithConstant:(double)a3 owningView:(id)a4 constraintsToActivate:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  heightConstraint = self->_heightConstraint;
  if (heightConstraint && [(NSLayoutConstraint *)heightConstraint isActive])
  {
    [(NSLayoutConstraint *)self->_heightConstraint setConstant:a3];
  }
  else
  {
    v10 = [(UILayoutGuide *)self heightAnchor];
    v11 = [v10 constraintEqualToConstant:a3];
    v12 = self->_heightConstraint;
    self->_heightConstraint = v11;

    [v8 addObject:self->_heightConstraint];
  }
}

- (void)_updateLayoutFrameConstraintsIfNeededWithOwningView:(id)a3
{
  id v56 = a3;
  [v56 bounds];
  double MidX = CGRectGetMidX(v58);
  [v56 bounds];
  double MidY = CGRectGetMidY(v59);
  double aspectRatio = self->_aspectRatio;
  objc_msgSend(v56, "_largestInscribedRectInBoundingPathWithCenter:aspectRatio:", MidX, MidY, aspectRatio);
  CGFloat x = v7;
  CGFloat y = v9;
  CGFloat width = v11;
  CGFloat height = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v15 = v56;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;
  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  v60.size.CGFloat width = width;
  v60.size.CGFloat height = height;
  if (!CGRectIsNull(v60))
  {
    if (v16)
    {
      v17 = __UIStatusBarManagerForWindow(v16);
      [v17 statusBarHeight];
      double v19 = v18;

      if (v19 > y)
      {
        [v16 _sceneBounds];
        double v21 = _UICGRectInsetZeroClamped(x, y, width, height, 0.0, v19 - v20);
        _UIBoundingPathLargestInscribedRectWithAspectRatioAndCenter(aspectRatio, v21, v22, v23, v24, MidX, MidY);
        CGFloat x = v25;
        CGFloat y = v26;
        CGFloat width = v27;
        CGFloat height = v28;
      }
    }
  }

  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.CGFloat width = width;
  v61.size.CGFloat height = height;
  if (CGRectIsNull(v61))
  {
    [v56 bounds];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    [v56 safeAreaInsets];
    double v41 = v34 - v38 - v40;
    double v42 = v41 * 0.5;
    if (v41 >= 0.0) {
      double v42 = 0.0;
    }
    double v43 = fmax(v41, 0.0);
    double v44 = v36 - v37 - v39;
    if (v44 >= 0.0) {
      double v45 = 0.0;
    }
    else {
      double v45 = v44 * 0.5;
    }
    _UIBoundingPathLargestInscribedRectWithAspectRatioAndCenter(aspectRatio, v30 + v38 + v42, v32 + v37 + v45, v43, fmax(v44, 0.0), MidX, MidY);
    CGFloat x = v62.origin.x;
    CGFloat y = v62.origin.y;
    CGFloat width = v62.size.width;
    CGFloat height = v62.size.height;
    if (CGRectIsNull(v62))
    {
      v46 = [v56 safeAreaLayoutGuide];
      [v46 layoutFrame];
      CGFloat x = v47;
      CGFloat y = v48;
      CGFloat width = v49;
      CGFloat height = v50;
    }
  }
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.CGFloat width = width;
  v63.size.CGFloat height = height;
  CGRect v64 = CGRectInset(v63, ceil(x) - x, ceil(y) - y);
  CGRect v65 = CGRectIntegral(v64);
  CGFloat v51 = v65.origin.x;
  CGFloat v52 = v65.origin.y;
  CGFloat v53 = v65.size.width;
  CGFloat v54 = v65.size.height;
  v55 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  v66.origin.CGFloat x = v51;
  v66.origin.CGFloat y = v52;
  v66.size.CGFloat width = v53;
  v66.size.CGFloat height = v54;
  [(_UIWindowSafeAreaAspectFitLayoutGuide *)self _createOrUpdateLeftConstraintWithConstant:v56 owningView:v55 constraintsToActivate:CGRectGetMinX(v66)];
  v67.origin.CGFloat x = v51;
  v67.origin.CGFloat y = v52;
  v67.size.CGFloat width = v53;
  v67.size.CGFloat height = v54;
  [(_UIWindowSafeAreaAspectFitLayoutGuide *)self _createOrUpdateTopConstraintWithConstant:v56 owningView:v55 constraintsToActivate:CGRectGetMinY(v67)];
  v68.origin.CGFloat x = v51;
  v68.origin.CGFloat y = v52;
  v68.size.CGFloat width = v53;
  v68.size.CGFloat height = v54;
  [(_UIWindowSafeAreaAspectFitLayoutGuide *)self _createOrUpdateWidthConstraintWithConstant:v56 owningView:v55 constraintsToActivate:CGRectGetWidth(v68)];
  v69.origin.CGFloat x = v51;
  v69.origin.CGFloat y = v52;
  v69.size.CGFloat width = v53;
  v69.size.CGFloat height = v54;
  [(_UIWindowSafeAreaAspectFitLayoutGuide *)self _createOrUpdateHeightConstraintWithConstant:v56 owningView:v55 constraintsToActivate:CGRectGetHeight(v69)];
  if ([v55 count]) {
    [MEMORY[0x1E4F5B268] activateConstraints:v55];
  }
}

- (BOOL)_isSafeAreaAspectFitLayoutGuide
{
  return 1;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
}

@end