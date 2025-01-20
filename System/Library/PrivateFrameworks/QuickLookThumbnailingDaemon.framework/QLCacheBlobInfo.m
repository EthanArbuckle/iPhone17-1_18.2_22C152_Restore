@interface QLCacheBlobInfo
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)location;
- (void)setLength:(unint64_t)a3;
- (void)setLocation:(unint64_t)a3;
@end

@implementation QLCacheBlobInfo

- (void)setLocation:(unint64_t)a3
{
  self->location = a3;
}

- (void)setLength:(unint64_t)a3
{
  self->length = a3;
}

- (unint64_t)length
{
  return self->length;
}

- (unint64_t)location
{
  return self->location;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %llu %llu>", objc_opt_class(), -[QLCacheBlobInfo location](self, "location"), -[QLCacheBlobInfo length](self, "length")];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 location];
    if (v6 == [(QLCacheBlobInfo *)self location])
    {
      uint64_t v7 = [v5 length];
      BOOL v8 = v7 == [(QLCacheBlobInfo *)self length];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->length ^ self->location;
}

@end