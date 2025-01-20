@interface BCCountedCFISetEntry
- (BCCFI)cfi;
- (BCCountedCFISetEntry)initWithCFI:(id)a3;
- (double)count;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (void)setCfi:(id)a3;
- (void)setCount:(double)a3;
@end

@implementation BCCountedCFISetEntry

- (BCCountedCFISetEntry)initWithCFI:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCCountedCFISetEntry;
  v6 = [(BCCountedCFISetEntry *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cfi, a3);
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  v4 = (BCCountedCFISetEntry *)a3;
  if (self == v4)
  {
    int64_t v7 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(BCCountedCFISetEntry *)self cfi];
      v6 = [(BCCountedCFISetEntry *)v4 cfi];
      int64_t v7 = (int64_t)[v5 compare:v6];
    }
    else
    {
      int64_t v7 = -1;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(BCCountedCFISetEntry *)self cfi];
  id v6 = [v4 initWithCFI:v5];

  [(BCCountedCFISetEntry *)self count];
  [v6 setCount:];
  return v6;
}

- (id)description
{
  v3 = [(BCCountedCFISetEntry *)self cfi];
  id v4 = [v3 string];
  [(BCCountedCFISetEntry *)self count];
  id v6 = +[NSString stringWithFormat:@"%@ => %.1f", v4, v5];

  return v6;
}

- (BCCFI)cfi
{
  return self->_cfi;
}

- (void)setCfi:(id)a3
{
}

- (double)count
{
  return self->_count;
}

- (void)setCount:(double)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
}

@end