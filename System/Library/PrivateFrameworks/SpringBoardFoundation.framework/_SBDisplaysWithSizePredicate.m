@interface _SBDisplaysWithSizePredicate
+ (id)fromDefaultsKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesDisplay:(id)a3;
- (_SBDisplaysWithSizePredicate)initWithDiagonal:(unint64_t)a3 pixelSize:(CGSize)a4;
- (_SBDisplaysWithSizePredicate)initWithDisplay:(id)a3 useNativeSize:(BOOL)a4;
- (id)defaultsKeyRepresentation;
- (id)description;
- (unint64_t)hash;
@end

@implementation _SBDisplaysWithSizePredicate

- (_SBDisplaysWithSizePredicate)initWithDiagonal:(unint64_t)a3 pixelSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  if (a4.width == *MEMORY[0x1E4F1DB30] && a4.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBDisplayModePredicate.m", 152, @"Invalid parameter not satisfying: %@", @"!CGSizeEqualToSize(pixelSize, CGSizeZero)" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)_SBDisplaysWithSizePredicate;
  result = [(SBDisplayModePredicate *)&v12 _init];
  if (result)
  {
    result->_diagonal = a3;
    result->_nativePixelSize.CGFloat width = width;
    result->_nativePixelSize.CGFloat height = height;
  }
  return result;
}

- (_SBDisplaysWithSizePredicate)initWithDisplay:(id)a3 useNativeSize:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBDisplayModePredicate.m", 163, @"Invalid parameter not satisfying: %@", @"displayConfiguration" object file lineNumber description];
  }
  v8 = [v7 CADisplay];
  v9 = (void *)[v8 immutableCopy];

  [v9 physicalSize];
  long double v11 = v10;
  long double v13 = v12;
  id v14 = objc_alloc_init(MEMORY[0x1E4F39B78]);
  if (v4)
  {
    [v9 nativeSize];
    objc_msgSend(v14, "setResolution:");
  }
  unint64_t v15 = vcvtad_u64_f64(hypot(v11, v13));
  v16 = [v9 preferredModeWithCriteria:v14];
  v17 = -[_SBDisplaysWithSizePredicate initWithDiagonal:pixelSize:](self, "initWithDiagonal:pixelSize:", v15, (double)(unint64_t)[v16 width], (double)(unint64_t)objc_msgSend(v16, "height"));

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  v8 = v7;

  BOOL v9 = v8
    && self->_diagonal == v8[1]
    && self->_nativePixelSize.height == *((double *)v8 + 3)
    && self->_nativePixelSize.width == *((double *)v8 + 2);

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendUnsignedInteger:self->_diagonal];
  id v5 = (id)objc_msgSend(v3, "appendCGSize:", self->_nativePixelSize.width, self->_nativePixelSize.height);
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)matchesDisplay:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBDisplayModePredicate.m", 197, @"Invalid parameter not satisfying: %@", @"displayConfiguration != nil" object file lineNumber description];
  }
  unint64_t v6 = [v5 CADisplay];
  id v7 = [v6 uniqueId];

  if (v7)
  {
    v8 = [v5 CADisplay];
    BOOL v9 = (void *)[v8 immutableCopy];

    id v10 = objc_alloc_init(MEMORY[0x1E4F39B78]);
    long double v11 = [v9 preferredModeWithCriteria:v10];

    [v11 width];
    [v11 height];
    if (BSFloatEqualToFloat() && BSFloatEqualToFloat())
    {
      [v9 physicalSize];
      hypot(v12, v13);
      char v14 = BSFloatEqualToFloat();
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

+ (id)fromDefaultsKey:(id)a3
{
  id v4 = a3;
  id v5 = [NSString stringWithFormat:@"^\\(\\.%@ \\[(\\d+)\\] \\[(\\d+)\\s+(\\d+)\\]\\)$", @"matchingDisplays"];
  unint64_t v6 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v5 options:0 error:0];
  id v7 = objc_msgSend(v6, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 rangeAtIndex:1];
    long double v11 = objc_msgSend(v4, "substringWithRange:", v9, v10);
    uint64_t v12 = [v8 rangeAtIndex:2];
    char v14 = objc_msgSend(v4, "substringWithRange:", v12, v13);
    uint64_t v15 = [v8 rangeAtIndex:3];
    uint64_t v17 = objc_msgSend(v4, "substringWithRange:", v15, v16);
    v18 = (void *)v17;
    if (v11) {
      BOOL v19 = v14 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    BOOL v20 = v19 || v17 == 0;
    if (v20
      || ((double v21 = (double)[v14 integerValue],
           double v22 = (double)[v18 integerValue],
           double v24 = *(double *)(MEMORY[0x1E4F1DB30] + 8),
           *MEMORY[0x1E4F1DB30] == v21)
        ? (BOOL v25 = v24 == v22)
        : (BOOL v25 = 0),
          v25))
    {
      v26 = 0;
    }
    else
    {
      double v23 = *MEMORY[0x1E4F1DB30];
      v26 = objc_msgSend(objc_alloc((Class)a1), "initWithDiagonal:pixelSize:", objc_msgSend(v11, "integerValue", v23, v24), v21, v22);
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)defaultsKeyRepresentation
{
  return (id)[NSString stringWithFormat:@"(.%@ [%lu] [%lu %lu])", @"matchingDisplays", self->_diagonal, (unint64_t)self->_nativePixelSize.width, (unint64_t)self->_nativePixelSize.height];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t diagonal = self->_diagonal;
  unint64_t v6 = BSNSStringFromCGSize();
  id v7 = [v3 stringWithFormat:@"<%@:%p> [diagonal: %lu] [pixelSize: %@]", v4, self, diagonal, v6];

  return v7;
}

@end