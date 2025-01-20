@interface NSLayoutConstraint
- (id)mt_copy;
- (id)mt_copyWithDynamicTypeConstant:(id)a3;
- (id)mt_copyWithPriority:(float)a3;
- (id)mt_dynamicTypeConstant;
- (void)mt_setDynamicTypeConstant:(id)a3;
@end

@implementation NSLayoutConstraint

- (id)mt_copy
{
  v3 = [(NSLayoutConstraint *)self firstItem];
  NSLayoutAttribute v4 = [(NSLayoutConstraint *)self firstAttribute];
  NSLayoutRelation v5 = [(NSLayoutConstraint *)self relation];
  v6 = [(NSLayoutConstraint *)self secondItem];
  NSLayoutAttribute v7 = [(NSLayoutConstraint *)self secondAttribute];
  [(NSLayoutConstraint *)self multiplier];
  double v9 = v8;
  [(NSLayoutConstraint *)self constant];
  v11 = +[NSLayoutConstraint constraintWithItem:v3 attribute:v4 relatedBy:v5 toItem:v6 attribute:v7 multiplier:v9 constant:v10];

  v12 = [(NSLayoutConstraint *)self mt_dynamicTypeConstant];
  [v11 mt_setDynamicTypeConstant:v12];

  [(NSLayoutConstraint *)self priority];
  [v11 setPriority:];

  return v11;
}

- (id)mt_copyWithPriority:(float)a3
{
  NSLayoutAttribute v4 = [(NSLayoutConstraint *)self mt_copy];
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];

  return v4;
}

- (id)mt_copyWithDynamicTypeConstant:(id)a3
{
  id v4 = a3;
  double v5 = [(NSLayoutConstraint *)self mt_copy];
  [v5 mt_setDynamicTypeConstant:v4];

  return v5;
}

- (void)mt_setDynamicTypeConstant:(id)a3
{
  id value = a3;
  id v4 = [(NSLayoutConstraint *)self mt_dynamicTypeConstant];
  if (([v4 isEqual:value] & 1) == 0)
  {
    objc_setAssociatedObject(self, &unk_10002AF6C, value, (void *)0x301);
    [value currentConstant];
    -[NSLayoutConstraint setConstant:](self, "setConstant:");
  }
}

- (id)mt_dynamicTypeConstant
{
  return objc_getAssociatedObject(self, &unk_10002AF6C);
}

@end