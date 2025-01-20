@interface _UICollectionLayoutListSectionData
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _UICollectionLayoutListSectionData

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 != self)
  {
    id v4 = a3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    unint64_t v5 = self ? self->_selectionGrouping : 0;
    if (*((void *)v4 + 2) != v5) {
      goto LABEL_17;
    }
    separatorConfiguration = self->_separatorConfiguration;
    v7 = (UIListSeparatorConfiguration *)*((id *)v4 + 1);
    v8 = separatorConfiguration;
    if (v7 == v8)
    {
    }
    else
    {
      v9 = v8;
      if (!v7 || !v8)
      {

LABEL_17:
        BOOL v11 = 0;
        goto LABEL_18;
      }
      BOOL v10 = [(UIListSeparatorConfiguration *)v7 isEqual:v8];

      if (!v10) {
        goto LABEL_17;
      }
    }
    BOOL v11 = 1;
LABEL_18:

    return v11;
  }
  return 1;
}

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  unint64_t selectionGrouping = self->_selectionGrouping;
  return [(UIListSeparatorConfiguration *)self->_separatorConfiguration hash] ^ selectionGrouping;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p grouping: %lu separatorConfig: %@>", objc_opt_class(), self, self->_selectionGrouping, self->_separatorConfiguration];
}

@end