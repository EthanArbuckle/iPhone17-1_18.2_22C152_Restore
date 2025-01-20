@interface _UICollectionLayoutAuxillaryKey
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _UICollectionLayoutAuxillaryKey

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  elementKind = self->_elementKind;
  v7 = [NSNumber numberWithInteger:self->_index];
  v8 = [NSNumber numberWithInteger:self->_auxillaryKind];
  v9 = [NSNumber numberWithBool:self->_isSupplementary];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p elementKind=%@; index=%@; auxillaryKind=%@; isSup=%@>",
    v5,
    self,
    elementKind,
    v7,
    v8,
  v10 = v9);

  return v10;
}

- (unint64_t)hash
{
  return self->_index + [(NSString *)self->_elementKind hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_UICollectionLayoutAuxillaryKey allocWithZone:a3];
  if (v4)
  {
    elementKind = self->_elementKind;
    int64_t index = self->_index;
    int64_t auxillaryKind = self->_auxillaryKind;
    BOOL isSupplementary = self->_isSupplementary;
    if (![(NSString *)elementKind length])
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel_initWithElementKind_index_auxillaryKind_isSupplementary_, v4, @"_UICollectionLayoutHelpers.m", 1909, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
    }
    v13.receiver = v4;
    v13.super_class = (Class)_UICollectionLayoutAuxillaryKey;
    v4 = [(_UICollectionLayoutAuxillaryKey *)&v13 init];
    if (v4)
    {
      uint64_t v9 = [(NSString *)elementKind copy];
      v10 = v4->_elementKind;
      v4->_elementKind = (NSString *)v9;

      v4->_int64_t index = index;
      v4->_int64_t auxillaryKind = auxillaryKind;
      v4->_BOOL isSupplementary = isSupplementary;
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 != self)
  {
    if (self->_index == *((void *)a3 + 3)) {
      return [(NSString *)self->_elementKind isEqualToString:*((void *)a3 + 2)];
    }
    return 0;
  }
  return 1;
}

- (void).cxx_destruct
{
}

@end