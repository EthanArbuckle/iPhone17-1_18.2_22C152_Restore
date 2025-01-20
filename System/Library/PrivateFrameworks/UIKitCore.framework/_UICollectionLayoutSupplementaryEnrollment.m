@interface _UICollectionLayoutSupplementaryEnrollment
- (id)description;
@end

@implementation _UICollectionLayoutSupplementaryEnrollment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p: elementKind=%@; identifier=%@",
    v5,
    self,
    self->_kind,
  v6 = self->_enrollmentIdentifier);

  return v6;
}

@end