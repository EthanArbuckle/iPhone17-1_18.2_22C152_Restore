@interface _UICollectionLayoutExtendedAttributesQueryInfo
- (id)description;
@end

@implementation _UICollectionLayoutExtendedAttributesQueryInfo

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromCGRect(self->_queryRect);
  v7 = [NSNumber numberWithInteger:self->_sectionIndex];
  v8 = [v3 stringWithFormat:@"<%@ %p: queryRect=%@ sectionIndex=%@>", v5, self, v6, v7];;

  return v8;
}

@end