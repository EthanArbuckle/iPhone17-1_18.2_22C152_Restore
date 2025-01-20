@interface HomeResultCacheKey
+ (BOOL)_location:(id)a3 isEquivalentToLocation:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualivantToKey:(id)a3;
- (GEOLocation)location;
- (HomeResultCacheKey)initWithCountryCode:(id)a3 location:(id)a4;
- (NSString)countryCode;
- (id)description;
- (unint64_t)hash;
@end

@implementation HomeResultCacheKey

- (BOOL)isEqual:(id)a3
{
  v4 = (HomeResultCacheKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(HomeResultCacheKey *)v6 countryCode];
    v8 = v7;
    if (v7 == self->_countryCode || -[NSString isEqual:](v7, "isEqual:"))
    {
      v9 = [(HomeResultCacheKey *)v6 location];
      v10 = v9;
      if (v9 == self->_location) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = -[GEOLocation isEqual:](v9, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_countryCode, 0);
}

- (HomeResultCacheKey)initWithCountryCode:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HomeResultCacheKey;
  v8 = [(HomeResultCacheKey *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    countryCode = v8->_countryCode;
    v8->_countryCode = v9;

    objc_storeStrong((id *)&v8->_location, a4);
  }

  return v8;
}

- (BOOL)isEqualivantToKey:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 countryCode];
    id v7 = v6;
    if (v6 == self->_countryCode || -[NSString isEqual:](v6, "isEqual:"))
    {
      v8 = objc_opt_class();
      v9 = [v5 location];
      unsigned __int8 v10 = [v8 _location:v9 isEquivalentToLocation:self->_location];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (GEOLocation)location
{
  return self->_location;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

+ (BOOL)_location:(id)a3 isEquivalentToLocation:(id)a4
{
  if ((a3 == 0) == (a4 != 0)) {
    return 0;
  }
  id v5 = a4;
  [a3 coordinate];
  double v7 = v6;
  double v9 = v8;
  [v5 coordinate];
  double v11 = v10;
  double v13 = v12;

  BOOL v14 = fabs(v9 + 180.0) < 0.00000001;
  BOOL v15 = fabs(v7 + 180.0) < 0.00000001 && v14;
  BOOL v16 = fabs(v13 + 180.0) < 0.00000001;
  if (fabs(v11 + 180.0) >= 0.00000001) {
    BOOL v16 = 0;
  }
  BOOL result = v15 ^ v16 ^ 1;
  if (!v15 && !v16)
  {
    GEOConfigGetDouble();
    double v19 = v18;
    GEOCalculateDistance();
    return v20 < v19;
  }
  return result;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_countryCode hash];
  return (unint64_t)[(GEOLocation *)self->_location hash] ^ v3;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  countryCode = self->_countryCode;
  location = self->_location;
  if (location)
  {
    [(GEOLocation *)location coordinate];
    double v8 = +[NSString stringWithFormat:@"%+.8f, %+.8f", v6, v7];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; countryCode = %@; location = %@>",
      v3,
      self,
      countryCode,
    double v9 = v8);
  }
  else
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; countryCode = %@; location = %@>",
      v3,
      self,
      self->_countryCode,
    double v9 = 0);
  }

  return v9;
}

@end