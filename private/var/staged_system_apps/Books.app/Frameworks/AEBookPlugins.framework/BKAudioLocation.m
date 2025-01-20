@interface BKAudioLocation
+ (id)deserializeLocationFromDictionary:(id)a3;
- (BKAudioLocation)initWithLocationDictionary:(id)a3;
- (BKAudioLocation)initWithOrdinal:(int64_t)a3 offset:(double)a4;
- (BOOL)isEqual:(id)a3;
- (double)offset;
- (id)description;
- (id)serializeLocationToDictionary;
- (id)stringValue;
- (unint64_t)hash;
- (void)setOffset:(double)a3;
@end

@implementation BKAudioLocation

- (BKAudioLocation)initWithOrdinal:(int64_t)a3 offset:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BKAudioLocation;
  result = [(BKLocation *)&v6 initWithOrdinal:a3];
  if (result) {
    result->_offset = a4;
  }
  return result;
}

- (BKAudioLocation)initWithLocationDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"super"];
  v10.receiver = self;
  v10.super_class = (Class)BKAudioLocation;
  objc_super v6 = [(BKLocation *)&v10 initWithLocationDictionary:v5];
  if (v6)
  {
    v7 = [v4 objectForKey:@"offset"];
    [v7 doubleValue];
    v6->_offset = v8;
  }
  return v6;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)BKAudioLocation;
  unint64_t v3 = [(BKLocation *)&v7 hash];
  id v4 = +[NSNumber numberWithDouble:self->_offset];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v8.receiver = self,
        v8.super_class = (Class)BKAudioLocation,
        [(BKLocation *)&v8 isEqual:v4]))
  {
    [v4 offset];
    BOOL v6 = v5 == self->_offset;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)stringValue
{
  v6.receiver = self;
  v6.super_class = (Class)BKAudioLocation;
  unint64_t v3 = [(BKLocation *)&v6 stringValue];
  id v4 = +[NSString stringWithFormat:@"{ %@, offset:%f }", v3, *(void *)&self->_offset];

  return v4;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)BKAudioLocation;
  unint64_t v3 = [(BKLocation *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"%@, offset:%f", v3, *(void *)&self->_offset];

  return v4;
}

- (id)serializeLocationToDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)BKAudioLocation;
  unint64_t v3 = [(BKLocation *)&v7 serializeLocationToDictionary];
  id v4 = +[NSNumber numberWithDouble:self->_offset];
  double v5 = +[NSDictionary dictionaryWithObjectsAndKeys:v3, @"super", v4, @"offset", @"BKAudioLocation", @"class", 0];

  return v5;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"class"];
  if ([v4 isEqualToString:@"BKAudioLocation"]) {
    double v5 = [[BKAudioLocation alloc] initWithLocationDictionary:v3];
  }
  else {
    double v5 = 0;
  }

  return v5;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

@end