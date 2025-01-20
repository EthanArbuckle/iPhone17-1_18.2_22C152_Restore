@interface TSDSizedImageDescription
- (BOOL)hasBakedMask;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSizedImageDescription:(id)a3;
- (BOOL)isWideGamut;
- (CGSize)size;
- (TSDSizedImageDescription)initWithSize:(CGSize)a3 isWideGamut:(BOOL)a4 hasBakedMask:(BOOL)a5;
- (unint64_t)hash;
@end

@implementation TSDSizedImageDescription

- (TSDSizedImageDescription)initWithSize:(CGSize)a3 isWideGamut:(BOOL)a4 hasBakedMask:(BOOL)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)TSDSizedImageDescription;
  result = [(TSDSizedImageDescription *)&v10 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_isWideGamut = a4;
    result->_hasBakedMask = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);

  if (v6) {
    BOOL v7 = [(TSDSizedImageDescription *)self isEqualToSizedImageDescription:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->_size.width, self->_size.height);
  unint64_t v4 = (unint64_t)[v3 hash] ^ self->_isWideGamut ^ (unint64_t)self->_hasBakedMask;

  return v4;
}

- (BOOL)isEqualToSizedImageDescription:(id)a3
{
  unint64_t v4 = (TSDSizedImageDescription *)a3;
  if (self == v4)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    [(TSDSizedImageDescription *)self size];
    double v6 = v5;
    double v8 = v7;
    [(TSDSizedImageDescription *)v4 size];
    BOOL v11 = v6 == v10 && v8 == v9;
    if (v11
      && (unsigned int v12 = [(TSDSizedImageDescription *)self isWideGamut],
          v12 == [(TSDSizedImageDescription *)v4 isWideGamut]))
    {
      unsigned int v14 = [(TSDSizedImageDescription *)self hasBakedMask];
      unsigned int v13 = v14 ^ [(TSDSizedImageDescription *)v4 hasBakedMask] ^ 1;
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isWideGamut
{
  return self->_isWideGamut;
}

- (BOOL)hasBakedMask
{
  return self->_hasBakedMask;
}

@end