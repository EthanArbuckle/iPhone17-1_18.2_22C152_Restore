@interface BKAnchorLocation
+ (BOOL)supportsSecureCoding;
+ (id)deserializeLocationFromDictionary:(id)a3;
- (BKAnchorLocation)initWithCoder:(id)a3;
- (BKAnchorLocation)initWithLocationDictionary:(id)a3;
- (BKAnchorLocation)initWithOrdinal:(int64_t)a3 andAnchor:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)anchor;
- (NSString)description;
- (id)serializeLocationToDictionary;
- (id)stringValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKAnchorLocation

- (BKAnchorLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKAnchorLocation;
  v5 = [(BKLocation *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anchor"];
    v7 = (NSString *)[v6 copy];
    anchor = v5->_anchor;
    v5->_anchor = v7;
  }
  return v5;
}

- (BKAnchorLocation)initWithLocationDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"super"];
  v11.receiver = self;
  v11.super_class = (Class)BKAnchorLocation;
  v6 = [(BKLocation *)&v11 initWithLocationDictionary:v5];
  if (v6)
  {
    v7 = [v4 objectForKey:@"anchor"];
    v8 = (NSString *)[v7 copy];
    anchor = v6->_anchor;
    v6->_anchor = v8;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)BKAnchorLocation,
        [(BKLocation *)&v9 isEqual:v4]))
  {
    v5 = [v4 anchor];
    v6 = [(BKAnchorLocation *)self anchor];
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
  v5.super_class = (Class)BKAnchorLocation;
  unint64_t v3 = [(BKLocation *)&v5 hash];
  return [(NSString *)self->_anchor hash] ^ v3;
}

- (id)serializeLocationToDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)BKAnchorLocation;
  unint64_t v3 = [(BKLocation *)&v7 serializeLocationToDictionary];
  id v4 = [(BKAnchorLocation *)self anchor];
  objc_super v5 = +[NSDictionary dictionaryWithObjectsAndKeys:v3, @"super", v4, @"anchor", @"BKAnchorLocation", @"class", 0];

  return v5;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"class"];
  if ([v4 isEqualToString:@"BKAnchorLocation"]) {
    objc_super v5 = [[BKAnchorLocation alloc] initWithLocationDictionary:v3];
  }
  else {
    objc_super v5 = 0;
  }

  return v5;
}

- (BKAnchorLocation)initWithOrdinal:(int64_t)a3 andAnchor:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BKAnchorLocation;
  objc_super v7 = [(BKLocation *)&v11 initWithOrdinal:a3];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    anchor = v7->_anchor;
    v7->_anchor = v8;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKAnchorLocation;
  id v4 = a3;
  [(BKLocation *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_anchor forKey:@"anchor"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)stringValue
{
  v6.receiver = self;
  v6.super_class = (Class)BKAnchorLocation;
  id v3 = [(BKLocation *)&v6 stringValue];
  id v4 = +[NSString stringWithFormat:@"{ %@, anchor:%@ }", v3, self->_anchor];

  return v4;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)BKAnchorLocation;
  id v3 = [(BKLocation *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"%@, _anchor:%@", v3, self->_anchor];

  return (NSString *)v4;
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void).cxx_destruct
{
}

@end