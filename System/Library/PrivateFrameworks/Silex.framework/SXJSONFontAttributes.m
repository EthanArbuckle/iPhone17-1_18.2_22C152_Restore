@interface SXJSONFontAttributes
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)familyNameWithValue:(id)a3 withType:(int)a4;
- (int64_t)styleWithValue:(id)a3 withType:(int)a4;
- (int64_t)weightWithValue:(id)a3 withType:(int)a4;
- (int64_t)widthWithValue:(id)a3 withType:(int)a4;
- (unint64_t)hash;
@end

@implementation SXJSONFontAttributes

- (int64_t)weightWithValue:(id)a3 withType:(int)a4
{
  if (a3 && a4 == 2) {
    return [a3 integerValue];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)familyNameWithValue:(id)a3 withType:(int)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6 && a4 == 3)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(SXJSONFontAttributes *)self fontFamily];
  }
  v9 = v8;

  return v9;
}

- (int64_t)widthWithValue:(id)a3 withType:(int)a4
{
  id v4 = a3;
  if ([v4 isEqualToString:@"ultra-condensed"])
  {
    int64_t v5 = 2;
  }
  else if ([v4 isEqualToString:@"extra-condensed"])
  {
    int64_t v5 = 4;
  }
  else if ([v4 isEqualToString:@"condensed"])
  {
    int64_t v5 = 5;
  }
  else if ([v4 isEqualToString:@"semi-condensed"])
  {
    int64_t v5 = 6;
  }
  else if ([v4 isEqualToString:@"normal"])
  {
    int64_t v5 = 7;
  }
  else if ([v4 isEqualToString:@"semi-expanded"])
  {
    int64_t v5 = 8;
  }
  else if ([v4 isEqualToString:@"expanded"])
  {
    int64_t v5 = 9;
  }
  else if ([v4 isEqualToString:@"extra-expanded"])
  {
    int64_t v5 = 10;
  }
  else if ([v4 isEqualToString:@"ultra-expanded"])
  {
    int64_t v5 = 11;
  }
  else if ([v4 isEqualToString:@"compressed"])
  {
    int64_t v5 = 3;
  }
  else if ([v4 isEqualToString:@"extra-compressed"])
  {
    int64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"ultra-compressed"])
  {
    int64_t v5 = 0;
  }
  else
  {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (int64_t)styleWithValue:(id)a3 withType:(int)a4
{
  id v4 = a3;
  if ([v4 isEqualToString:@"italic"])
  {
    int64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"oblique"])
  {
    int64_t v5 = 2;
  }
  else if ([v4 isEqualToString:@"normal"])
  {
    int64_t v5 = 0;
  }
  else
  {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = [(SXJSONFontAttributes *)self weight];
  uint64_t v5 = [(SXJSONFontAttributes *)self style];
  uint64_t v6 = [(SXJSONFontAttributes *)self width];
  v7 = [(SXJSONFontAttributes *)self grade];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; weight: %lu; style: %lu; width: %lu; grade: %@>",
    self,
    self,
    v4,
    v5,
    v6,
  id v8 = v7);

  return (NSString *)v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SXJSONFontAttributes *)self weight];
  uint64_t v4 = [(SXJSONFontAttributes *)self width] ^ v3;
  uint64_t v5 = v4 ^ [(SXJSONFontAttributes *)self style];
  uint64_t v6 = [(SXJSONFontAttributes *)self familyName];
  uint64_t v7 = [v6 hash];
  id v8 = [(SXJSONFontAttributes *)self grade];
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SXJSONFontAttributes *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    uint64_t v5 = [(SXJSONFontAttributes *)self weight];
    if (v5 == [(SXJSONFontAttributes *)v4 weight]
      && (uint64_t v6 = [(SXJSONFontAttributes *)self width], v6 == [(SXJSONFontAttributes *)v4 width])
      && (uint64_t v7 = [(SXJSONFontAttributes *)self style], v7 == [(SXJSONFontAttributes *)v4 style]))
    {
      id v8 = [(SXJSONFontAttributes *)self familyName];
      unint64_t v9 = [(SXJSONFontAttributes *)v4 familyName];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(SXJSONObject *)self jsonDictionary];
  uint64_t v6 = [(SXJSONObject *)self specificationVersion];
  uint64_t v7 = (void *)[v4 initWithJSONObject:v5 andVersion:v6];

  return v7;
}

@end