@interface NavBarDateCacheKey
- (BOOL)isEqual:(id)a3;
- (UIFont)font;
- (int64_t)month;
- (int64_t)year;
- (unint64_t)hash;
- (void)setFont:(id)a3;
- (void)setMonth:(int64_t)a3;
- (void)setYear:(int64_t)a3;
@end

@implementation NavBarDateCacheKey

- (BOOL)isEqual:(id)a3
{
  v4 = (NavBarDateCacheKey *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NavBarDateCacheKey;
    if ([(NavBarDateCacheKey *)&v12 isEqual:v4])
    {
      v5 = v4;
      id month = self->_month;
      if (month == (id)[(NavBarDateCacheKey *)v5 month]
        && (id year = self->_year, year == (id)[(NavBarDateCacheKey *)v5 year]))
      {
        font = self->_font;
        v9 = [(NavBarDateCacheKey *)v5 font];
        BOOL v10 = font == v9;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  return self->_month + 100 * self->_year;
}

- (int64_t)month
{
  return self->_month;
}

- (void)setMonth:(int64_t)a3
{
  self->_id month = a3;
}

- (int64_t)year
{
  return self->_year;
}

- (void)setYear:(int64_t)a3
{
  self->_id year = a3;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (void).cxx_destruct
{
}

@end