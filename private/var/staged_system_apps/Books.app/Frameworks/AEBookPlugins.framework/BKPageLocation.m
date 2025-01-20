@interface BKPageLocation
+ (BOOL)supportsSecureCoding;
+ (id)deserializeLocationFromDictionary:(id)a3;
- (BKPageLocation)initWithCoder:(id)a3;
- (BKPageLocation)initWithLocationDictionary:(id)a3;
- (BKPageLocation)initWithOrdinal:(int64_t)a3 andOffset:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeLocationToDictionary;
- (id)stringValue;
- (unint64_t)hash;
- (unint64_t)pageOffset;
- (void)encodeWithCoder:(id)a3;
- (void)setPageOffset:(unint64_t)a3;
@end

@implementation BKPageLocation

- (BKPageLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKPageLocation;
  v5 = [(BKLocation *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_pageOffset = (unint64_t)[v4 decodeIntegerForKey:@"pageOffset"];
  }

  return v5;
}

- (BKPageLocation)initWithLocationDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"super"];
  v9.receiver = self;
  v9.super_class = (Class)BKPageLocation;
  v6 = [(BKLocation *)&v9 initWithLocationDictionary:v5];
  if (v6)
  {
    objc_super v7 = [v4 objectForKey:@"pageOffset"];
    v6->_pageOffset = (int)[v7 intValue];
  }
  return v6;
}

- (BKPageLocation)initWithOrdinal:(int64_t)a3 andOffset:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BKPageLocation;
  result = [(BKLocation *)&v6 initWithOrdinal:a3];
  if (result) {
    result->_pageOffset = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v8.receiver = self,
        v8.super_class = (Class)BKPageLocation,
        [(BKLocation *)&v8 isEqual:v4]))
  {
    id v5 = [v4 pageOffset];
    BOOL v6 = v5 == (id)[(BKPageLocation *)self pageOffset];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)BKPageLocation;
  return self->_pageOffset ^ [(BKLocation *)&v3 hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKPageLocation;
  id v4 = [(BKLocation *)&v6 copyWithZone:a3];
  [v4 setPageOffset:[self pageOffset]];
  return v4;
}

- (id)serializeLocationToDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)BKPageLocation;
  objc_super v3 = [(BKLocation *)&v7 serializeLocationToDictionary];
  id v4 = +[NSNumber numberWithUnsignedInteger:[(BKPageLocation *)self pageOffset]];
  id v5 = +[NSDictionary dictionaryWithObjectsAndKeys:v3, @"super", v4, @"pageOffset", @"BKPageLocation", @"class", 0];

  return v5;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"class"];
  if ([v4 isEqualToString:@"BKPageLocation"]) {
    id v5 = [[BKPageLocation alloc] initWithLocationDictionary:v3];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKPageLocation;
  id v4 = a3;
  [(BKLocation *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:self->_pageOffset forKey:@"pageOffset"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)stringValue
{
  v6.receiver = self;
  v6.super_class = (Class)BKPageLocation;
  id v3 = [(BKLocation *)&v6 stringValue];
  id v4 = +[NSString stringWithFormat:@"{ %@, pageOffset:%lu }", v3, self->_pageOffset];

  return v4;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)BKPageLocation;
  id v3 = [(BKLocation *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"%@, _pageOffset:%lu", v3, self->_pageOffset];

  return (NSString *)v4;
}

- (unint64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(unint64_t)a3
{
  self->_pageOffset = a3;
}

@end