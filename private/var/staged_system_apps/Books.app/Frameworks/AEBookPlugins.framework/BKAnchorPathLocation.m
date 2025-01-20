@interface BKAnchorPathLocation
+ (id)deserializeLocationFromDictionary:(id)a3;
- (BKAnchorPathLocation)initWithCoder:(id)a3;
- (BKAnchorPathLocation)initWithLocationDictionary:(id)a3;
- (BKAnchorPathLocation)initWithOrdinal:(int64_t)a3 anchor:(id)a4 andPath:(id)a5;
- (BKAnchorPathLocation)initWithPath:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)path;
- (id)description;
- (id)pathWithAnchor;
- (id)serializeLocationToDictionary;
- (id)stringValue;
- (unint64_t)hash;
- (void)updateOrdinalForBookInfo:(id)a3;
@end

@implementation BKAnchorPathLocation

- (BKAnchorPathLocation)initWithPath:(id)a3
{
  id v4 = a3;
  v5 = [v4 URLFragmentString];
  v6 = [v4 stringByRemovingURLFragment];

  v7 = [(BKAnchorPathLocation *)self initWithOrdinal:-1 anchor:v5 andPath:v6];
  return v7;
}

- (BKAnchorPathLocation)initWithOrdinal:(int64_t)a3 anchor:(id)a4 andPath:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BKAnchorPathLocation;
  v9 = [(BKAnchorLocation *)&v13 initWithOrdinal:a3 andAnchor:a4];
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    path = v9->_path;
    v9->_path = v10;
  }
  return v9;
}

- (BKAnchorPathLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKAnchorPathLocation;
  v5 = [(BKAnchorLocation *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    v7 = (NSString *)[v6 copy];
    path = v5->_path;
    v5->_path = v7;
  }
  return v5;
}

- (BKAnchorPathLocation)initWithLocationDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"super"];
  v11.receiver = self;
  v11.super_class = (Class)BKAnchorPathLocation;
  v6 = [(BKAnchorLocation *)&v11 initWithLocationDictionary:v5];
  if (v6)
  {
    v7 = [v4 objectForKey:@"path"];
    id v8 = (NSString *)[v7 copy];
    path = v6->_path;
    v6->_path = v8;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)BKAnchorPathLocation,
        [(BKAnchorLocation *)&v9 isEqual:v4]))
  {
    v5 = [v4 path];
    v6 = [(BKAnchorPathLocation *)self path];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)BKAnchorPathLocation;
  unint64_t v3 = [(BKAnchorLocation *)&v5 hash];
  return [(NSString *)self->_path hash] ^ v3;
}

- (id)stringValue
{
  v6.receiver = self;
  v6.super_class = (Class)BKAnchorPathLocation;
  unint64_t v3 = [(BKAnchorLocation *)&v6 stringValue];
  id v4 = +[NSString stringWithFormat:@"{ %@, path:%@ }", v3, self->_path];

  return v4;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)BKAnchorPathLocation;
  unint64_t v3 = [(BKAnchorLocation *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"%@, _path:%@", v3, self->_path];

  return v4;
}

- (id)pathWithAnchor
{
  unint64_t v3 = [(BKAnchorPathLocation *)self path];
  id v4 = [v3 mutableCopy];

  objc_super v5 = [(BKAnchorLocation *)self anchor];
  id v6 = [v5 length];

  if (v6)
  {
    unsigned __int8 v7 = [(BKAnchorLocation *)self anchor];
    [v4 appendFormat:@"#%@", v7];
  }
  id v8 = [v4 copy];

  return v8;
}

- (void)updateOrdinalForBookInfo:(id)a3
{
  id v15 = a3;
  id v4 = [v15 documentWithOrdinal:[self ordinal]];
  objc_super v5 = [(BKAnchorPathLocation *)self path];
  id v6 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, v5, &stru_1DF0D8);

  if (!v4
    || ([v4 manifestId],
        unsigned __int8 v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 isEqualToString:v6],
        v7,
        (v8 & 1) == 0))
  {
    objc_super v9 = [v15 databaseKey];
    objc_super v10 = +[NSPredicate predicateWithFormat:@"bookDatabaseKey == %@ AND manifestId == %@", v9, v6];

    objc_super v11 = [v15 managedObjectContext];
    v12 = [v11 entity:@"BKDocument" withPredicate:v10 sortBy:0 ascending:1 fetchLimit:1];

    if ([v12 count])
    {
      objc_super v13 = [v12 objectAtIndex:0];

      v14 = [v13 documentOrdinal];
      -[BKLocation setOrdinal:](self, "setOrdinal:", [v14 integerValue]);

      id v4 = v13;
    }
  }
}

- (id)serializeLocationToDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)BKAnchorPathLocation;
  unint64_t v3 = [(BKAnchorLocation *)&v7 serializeLocationToDictionary];
  id v4 = [(BKAnchorPathLocation *)self path];
  objc_super v5 = +[NSDictionary dictionaryWithObjectsAndKeys:v3, @"super", v4, @"path", @"BKAnchorPathLocation", @"class", 0];

  return v5;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"class"];
  if ([v4 isEqualToString:@"BKAnchorPathLocation"]) {
    objc_super v5 = [[BKAnchorPathLocation alloc] initWithLocationDictionary:v3];
  }
  else {
    objc_super v5 = 0;
  }

  return v5;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

@end