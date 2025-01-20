@interface WBSStartPageSectionSupplementaryItemIdentifier
+ (id)identifierForAction:(id)a3;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation WBSStartPageSectionSupplementaryItemIdentifier

+ (id)identifierForAction:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = [v4 identifier];

  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSStartPageSectionSupplementaryItemIdentifier *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSString *)self->_identifier isEqual:v4->_identifier];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end