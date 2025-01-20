@interface SFCapsuleNavigationBarLabelLayoutInfo
- (NSLayoutConstraint)constraintForHorizontalAlignment;
- (SFCapsuleNavigationBarLabelLayoutInfo)initWithView:(id)a3;
- (UIView)view;
- (void)setConstraintForHorizontalAlignment:(id)a3;
@end

@implementation SFCapsuleNavigationBarLabelLayoutInfo

- (SFCapsuleNavigationBarLabelLayoutInfo)initWithView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFCapsuleNavigationBarLabelLayoutInfo;
  v6 = [(SFCapsuleNavigationBarLabelLayoutInfo *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_view, a3);
    v8 = v7;
  }

  return v7;
}

- (NSLayoutConstraint)constraintForHorizontalAlignment
{
  return self->_constraintForHorizontalAlignment;
}

- (UIView)view
{
  return self->_view;
}

- (void)setConstraintForHorizontalAlignment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintForHorizontalAlignment, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

@end