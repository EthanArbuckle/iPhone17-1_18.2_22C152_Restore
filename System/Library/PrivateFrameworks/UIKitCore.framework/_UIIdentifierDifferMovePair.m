@interface _UIIdentifierDifferMovePair
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)initWithFromIndex:(uint64_t)a3 toIndex:;
@end

@implementation _UIIdentifierDifferMovePair

- (void)initWithFromIndex:(uint64_t)a3 toIndex:
{
  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)_UIIdentifierDifferMovePair;
    result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
    {
      result[1] = a2;
      result[2] = a3;
    }
  }
  return result;
}

- (int64_t)compare:(id)a3
{
  v4 = a3;
  if (self)
  {
    unint64_t fromIndex = self->_fromIndex;
    if (v4)
    {
LABEL_3:
      unint64_t v6 = v4[1];
      goto LABEL_4;
    }
  }
  else
  {
    unint64_t fromIndex = 0;
    if (v4) {
      goto LABEL_3;
    }
  }
  unint64_t v6 = 0;
LABEL_4:
  BOOL v7 = fromIndex >= v6;
  BOOL v8 = fromIndex == v6;
  uint64_t v9 = -1;
  if (v7) {
    uint64_t v9 = 1;
  }
  if (v8) {
    int64_t v10 = 0;
  }
  else {
    int64_t v10 = v9;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIIdentifierDifferMovePair *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_fromIndex == self->_fromIndex && v4->_toIndex == self->_toIndex;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = +[_UIIdentifierDifferMovePair allocWithZone:a3];
  if (self) {
    long long v5 = *(_OWORD *)&self->_fromIndex;
  }
  else {
    long long v5 = 0uLL;
  }
  long long v6 = v5;
  if (result)
  {
    v7.receiver = result;
    v7.super_class = (Class)_UIIdentifierDifferMovePair;
    id result = [(_UIIdentifierDifferMovePair *)&v7 init];
    if (result) {
      *(_OWORD *)((char *)result + 8) = v6;
    }
  }
  return result;
}

- (unint64_t)hash
{
  return self->_fromIndex + (self->_toIndex << 32);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  long long v6 = [v3 stringWithFormat:@"<%@: %p; M(%lu -> %lu)>", v5, self, self->_fromIndex, self->_toIndex];

  return v6;
}

@end