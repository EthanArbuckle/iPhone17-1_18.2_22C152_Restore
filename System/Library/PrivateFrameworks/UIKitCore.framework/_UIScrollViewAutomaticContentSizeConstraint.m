@interface _UIScrollViewAutomaticContentSizeConstraint
- (id)description;
@end

@implementation _UIScrollViewAutomaticContentSizeConstraint

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(_UIScrollViewAutomaticContentSizeConstraint *)self firstAttribute];
  v7 = [(_UIScrollViewAutomaticContentSizeConstraint *)self firstItem];
  v8 = v7;
  if (v6 == 101) {
    [v7 _contentWidthVariable];
  }
  else {
  v9 = [v7 _contentHeightVariable];
  }
  [(_UIScrollViewAutomaticContentSizeConstraint *)self constant];
  v11 = [v3 stringWithFormat:@"<%@:%p %@ == %f>", v5, self, v9, v10];

  return v11;
}

@end