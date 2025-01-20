@interface _UIFlexibleConstantConstraintSet
+ (id)constraintSetWithCollapsableConstantPreferredEqualityConstraint:(id)a3 equalityPriority:(unint64_t)a4;
+ (id)constraintSetWithRequiredEqualityConstraint:(id)a3;
- (BOOL)_equalityConstraintIsRequired;
- (double)equalityConstant;
- (double)maxConstant;
- (double)minConstant;
- (id)_initWithEqualityConstraint:(id)a3 equalityPriority:(unint64_t)a4 prefersMin:(BOOL)a5;
- (id)_otherInequalityConstraint;
- (id)_preferredInequalityConstraint;
- (void)_updateInequalityConstants;
- (void)setEqualityConstant:(double)a3;
- (void)setMaxConstant:(double)a3;
- (void)setMinConstant:(double)a3;
@end

@implementation _UIFlexibleConstantConstraintSet

+ (id)constraintSetWithRequiredEqualityConstraint:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithEqualityConstraint:v4 equalityPriority:1000 prefersMin:0];

  return v5;
}

+ (id)constraintSetWithCollapsableConstantPreferredEqualityConstraint:(id)a3 equalityPriority:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) _initWithEqualityConstraint:v6 equalityPriority:a4 prefersMin:0];

  return v7;
}

- (id)_initWithEqualityConstraint:(id)a3 equalityPriority:(unint64_t)a4 prefersMin:(BOOL)a5
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ([v10 relation])
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"_UIConstantConstraintSet.m", 48, @"Invalid parameter not satisfying: %@", @"cn.relation == NSLayoutRelationEqual" object file lineNumber description];
  }
  if ([v10 isActive])
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"_UIConstantConstraintSet.m", 49, @"Invalid parameter not satisfying: %@", @"cn.active == NO" object file lineNumber description];
  }
  v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v10];
  id v12 = v10;
  *(float *)&double v13 = (float)a4;
  [v12 setPriority:v13];
  if (a4 == 1000)
  {
    v14 = 0;
    v15 = 0;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F5B268];
    v17 = [v12 firstItem];
    uint64_t v18 = [v12 firstAttribute];
    v19 = [v12 secondItem];
    v14 = objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:", v17, v18, 1, v19, objc_msgSend(v12, "secondAttribute"));

    v20 = (void *)MEMORY[0x1E4F5B268];
    v21 = [v12 firstItem];
    uint64_t v22 = [v12 firstAttribute];
    v23 = [v12 secondItem];
    v15 = objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:", v21, v22, -1, v23, objc_msgSend(v12, "secondAttribute"));

    v31[0] = v14;
    v31[1] = v15;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    [v11 addObjectsFromArray:v24];
  }
  v30.receiver = self;
  v30.super_class = (Class)_UIFlexibleConstantConstraintSet;
  v25 = [(_UIConstantConstraintSet *)&v30 initWithConstraints:v11];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_minConstraint, v14);
    objc_storeStrong((id *)&v26->_maxConstraint, v15);
    objc_storeStrong((id *)&v26->_equalityConstraint, a3);
    v26->_equalityConstraintPrefersMin = a5;
    [(_UIFlexibleConstantConstraintSet *)v26 setMinConstant:0.0];
    [(_UIFlexibleConstantConstraintSet *)v26 setMaxConstant:10000.0];
    [(NSLayoutConstraint *)v26->_equalityConstraint constant];
    -[_UIFlexibleConstantConstraintSet setEqualityConstant:](v26, "setEqualityConstant:");
  }

  return v26;
}

- (void)setMinConstant:(double)a3
{
  if (![(_UIFlexibleConstantConstraintSet *)self _equalityConstraintIsRequired]
    && self->_minConstant != a3)
  {
    self->_minConstant = a3;
    minConstraint = self->_minConstraint;
    [(NSLayoutConstraint *)minConstraint setConstant:a3];
  }
}

- (void)setMaxConstant:(double)a3
{
  if (![(_UIFlexibleConstantConstraintSet *)self _equalityConstraintIsRequired]
    && self->_maxConstant != a3)
  {
    self->_maxConstant = a3;
    maxConstraint = self->_maxConstraint;
    [(NSLayoutConstraint *)maxConstraint setConstant:a3];
  }
}

- (void)setEqualityConstant:(double)a3
{
  if (self->_equalityConstant != a3)
  {
    self->_equalityConstant = a3;
    -[NSLayoutConstraint setConstant:](self->_equalityConstraint, "setConstant:");
    [(_UIFlexibleConstantConstraintSet *)self _updateInequalityConstants];
  }
}

- (BOOL)_equalityConstraintIsRequired
{
  [(NSLayoutConstraint *)self->_equalityConstraint priority];
  return v2 == 1000.0;
}

- (void)_updateInequalityConstants
{
  if (![(_UIFlexibleConstantConstraintSet *)self _equalityConstraintIsRequired])
  {
    double equalityConstant = self->_equalityConstant;
    if (self->_equalityConstraintPrefersMin)
    {
      [(_UIFlexibleConstantConstraintSet *)self setMinConstant:equalityConstant];
      double maxConstant = self->_maxConstant;
      if (maxConstant < self->_equalityConstant) {
        double maxConstant = self->_equalityConstant;
      }
      [(_UIFlexibleConstantConstraintSet *)self setMaxConstant:maxConstant];
    }
    else
    {
      [(_UIFlexibleConstantConstraintSet *)self setMaxConstant:equalityConstant];
      double minConstant = self->_minConstant;
      if (minConstant >= self->_equalityConstant) {
        double minConstant = self->_equalityConstant;
      }
      [(_UIFlexibleConstantConstraintSet *)self setMinConstant:minConstant];
    }
  }
}

- (id)_preferredInequalityConstraint
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR____UIFlexibleConstantConstraintSet__minConstraint[!self->_equalityConstraintPrefersMin]));
}

- (id)_otherInequalityConstraint
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR____UIFlexibleConstantConstraintSet__minConstraint[self->_equalityConstraintPrefersMin]));
}

- (double)minConstant
{
  return self->_minConstant;
}

- (double)maxConstant
{
  return self->_maxConstant;
}

- (double)equalityConstant
{
  return self->_equalityConstant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_equalityConstraint, 0);
  objc_storeStrong((id *)&self->_maxConstraint, 0);
  objc_storeStrong((id *)&self->_minConstraint, 0);
}

@end