@interface NIRegionKey
- (BOOL)isEqual:(id)a3;
- (NIRegionKey)initWithName:(id)a3 regionSizeCategory:(int64_t)a4;
- (NSString)regionName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)regionSizeCategory;
- (unint64_t)hash;
@end

@implementation NIRegionKey

- (NIRegionKey)initWithName:(id)a3 regionSizeCategory:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NIRegionKey;
  v8 = [(NIRegionKey *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_regionName, a3);
    v9->_regionSizeCategory = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  regionName = self->_regionName;
  int64_t regionSizeCategory = self->_regionSizeCategory;

  return [v4 initWithName:regionName regionSizeCategory:regionSizeCategory];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NIRegionKey *)v4;
    v6 = v5;
    if (v5 == self)
    {
      unsigned __int8 v9 = 1;
    }
    else
    {
      int64_t regionSizeCategory = (void *)self->_regionSizeCategory;
      if (regionSizeCategory == (void *)[(NIRegionKey *)v5 regionSizeCategory])
      {
        v8 = [(NIRegionKey *)v6 regionName];
        unsigned __int8 v9 = [v8 isEqualToString:self->_regionName];
      }
      else
      {
        unsigned __int8 v9 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  int64_t regionSizeCategory = self->_regionSizeCategory;
  return [(NSString *)self->_regionName hash] ^ regionSizeCategory;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  regionName = self->_regionName;
  v6 = sub_100290610(self->_regionSizeCategory);
  id v7 = +[NSString stringWithFormat:@"(%@: name:%@ regionCategory:%@)", v4, regionName, v6];

  return v7;
}

- (NSString)regionName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)regionSizeCategory
{
  return self->_regionSizeCategory;
}

- (void).cxx_destruct
{
}

@end