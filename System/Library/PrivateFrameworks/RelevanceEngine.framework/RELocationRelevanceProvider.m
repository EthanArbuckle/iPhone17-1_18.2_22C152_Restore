@interface RELocationRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (CLLocation)location;
- (NSString)bundleIdentifier;
- (RELocationRelevanceProvider)initWithDictionary:(id)a3;
- (RELocationRelevanceProvider)initWithLocation:(id)a3 radius:(double)a4;
- (RELocationRelevanceProvider)initWithLocation:(id)a3 radius:(double)a4 accuracy:(double)a5;
- (RELocationRelevanceProvider)initWithLocationType:(unint64_t)a3;
- (RELocationRelevanceProvider)providerWithBundleIdentifier:(id)a3;
- (double)accuracy;
- (double)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
- (unint64_t)type;
@end

@implementation RELocationRelevanceProvider

- (RELocationRelevanceProvider)initWithLocationType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RELocationRelevanceProvider;
  v4 = [(RERelevanceProvider *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    uint64_t v6 = [objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:37.3353672 longitude:-122.011737];
    location = v5->_location;
    v5->_location = (CLLocation *)v6;

    v5->_radius = 1000.0;
    v5->_accuracy = *(double *)&kDefaultAccuracyScaleFactor * 1000.0;
  }
  return v5;
}

- (RELocationRelevanceProvider)initWithLocation:(id)a3 radius:(double)a4
{
  return [(RELocationRelevanceProvider *)self initWithLocation:a3 radius:a4 accuracy:*(double *)&kDefaultAccuracyScaleFactor * a4];
}

- (RELocationRelevanceProvider)initWithLocation:(id)a3 radius:(double)a4 accuracy:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RELocationRelevanceProvider;
  v10 = [(RERelevanceProvider *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = 0;
    objc_storeStrong((id *)&v10->_location, a3);
    v11->_radius = a4;
    v11->_accuracy = a5;
  }

  return v11;
}

- (RELocationRelevanceProvider)providerWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(RELocationRelevanceProvider *)self copy];
  uint64_t v6 = [v4 copy];

  v7 = (void *)v5[8];
  v5[8] = v6;

  return (RELocationRelevanceProvider *)v5;
}

+ (id)relevanceSimulatorID
{
  return @"location";
}

- (RELocationRelevanceProvider)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"type"];
  uint64_t v6 = v5;
  if (v5 && [v5 integerValue])
  {
    self = -[RELocationRelevanceProvider initWithLocationType:](self, "initWithLocationType:", [v6 integerValue]);
    v7 = self;
  }
  else
  {
    v8 = [v4 objectForKeyedSubscript:@"lat"];
    id v9 = [v4 objectForKeyedSubscript:@"long"];
    v10 = [v4 objectForKeyedSubscript:@"radius"];
    v11 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
    v7 = 0;
    if (v8 && v9)
    {
      id v12 = objc_alloc(MEMORY[0x263F00A50]);
      [v8 doubleValue];
      double v14 = v13;
      [v9 doubleValue];
      v16 = (void *)[v12 initWithLatitude:v14 longitude:v15];
      if (v10)
      {
        [v10 doubleValue];
        double v18 = v17;
      }
      else
      {
        double v18 = 1000.0;
      }
      v19 = [v4 objectForKeyedSubscript:@"accuracy"];
      v20 = v19;
      if (v19)
      {
        [v19 doubleValue];
        v22 = [(RELocationRelevanceProvider *)self initWithLocation:v16 radius:v18 accuracy:v21];
      }
      else
      {
        v22 = [(RELocationRelevanceProvider *)self initWithLocation:v16 radius:v18];
      }
      self = v22;
      objc_storeStrong((id *)&self->_bundleIdentifier, v11);

      v7 = self;
    }
  }
  return v7;
}

- (id)dictionaryEncoding
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = NSNumber;
  [(CLLocation *)self->_location coordinate];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v5 forKeyedSubscript:@"lat"];

  uint64_t v6 = NSNumber;
  [(CLLocation *)self->_location coordinate];
  v8 = [v6 numberWithDouble:v7];
  [v3 setObject:v8 forKeyedSubscript:@"long"];

  id v9 = [NSNumber numberWithDouble:self->_radius];
  [v3 setObject:v9 forKeyedSubscript:@"radius"];

  [v3 setObject:self->_bundleIdentifier forKeyedSubscript:@"bundleIdentifier"];
  float v10 = self->_radius * *(double *)&kDefaultAccuracyScaleFactor;
  float accuracy = self->_accuracy;
  if (vabds_f32(v10, accuracy) >= 0.00000011921)
  {
    id v12 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v3 setObject:v12 forKeyedSubscript:@"accuracy"];
  }
  if (self->_type)
  {
    double v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v13 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RELocationRelevanceProvider;
  id v4 = [(RERelevanceProvider *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 5, self->_location);
  v4[6] = *(id *)&self->_radius;
  v4[7] = *(id *)&self->_accuracy;
  v4[4] = self->_type;
  objc_storeStrong(v4 + 8, self->_bundleIdentifier);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RELocationRelevanceProvider *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)RELocationRelevanceProvider;
    if ([(RERelevanceProvider *)&v21 isEqual:v4])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = v4;
        unint64_t type = self->_type;
        if (type == v5->_type)
        {
          if (type)
          {
            char v7 = 1;
LABEL_25:

            goto LABEL_26;
          }
          location = self->_location;
          id v9 = v5->_location;
          BOOL v10 = ((unint64_t)location | (unint64_t)v9) == 0;
          if (location) {
            BOOL v11 = v9 == 0;
          }
          else {
            BOOL v11 = 1;
          }
          if (!v11)
          {
            [(CLLocation *)location coordinate];
            double v13 = v12;
            [(CLLocation *)v5->_location coordinate];
            if (v13 == v14)
            {
              [(CLLocation *)self->_location coordinate];
              double v16 = v15;
              [(CLLocation *)v5->_location coordinate];
              BOOL v10 = v16 == v17;
            }
            else
            {
              BOOL v10 = 0;
            }
          }
          bundleIdentifier = self->_bundleIdentifier;
          if (bundleIdentifier == v5->_bundleIdentifier) {
            char v7 = 1;
          }
          else {
            char v7 = -[NSString isEqualToString:](bundleIdentifier, "isEqualToString:");
          }
          BOOL v19 = self->_radius == v5->_radius && v10;
          if (v19 && self->_accuracy == v5->_accuracy) {
            goto LABEL_25;
          }
        }
        char v7 = 0;
        goto LABEL_25;
      }
    }
    char v7 = 0;
  }
LABEL_26:

  return v7;
}

- (unint64_t)_hash
{
  uint64_t v3 = [(CLLocation *)self->_location hash];
  id v4 = [NSNumber numberWithDouble:self->_radius];
  uint64_t v5 = [v4 hash] ^ v3;
  objc_super v6 = [NSNumber numberWithDouble:self->_accuracy];
  uint64_t v7 = [v6 hash];
  v8 = [NSNumber numberWithUnsignedInteger:self->_type];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  NSUInteger v10 = v9 ^ [(NSString *)self->_bundleIdentifier hash];

  return v10;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)RELocationRelevanceProvider;
  uint64_t v3 = [(RELocationRelevanceProvider *)&v9 description];
  unint64_t type = self->_type;
  if (type > 4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = off_2644C0908[type];
  }
  objc_super v6 = [(CLLocation *)self->_location description];
  uint64_t v7 = [v3 stringByAppendingFormat:@" type=%@, location=%@, radius=%f, accuracy=%f, bundleIdentifier=%@", v5, v6, *(void *)&self->_radius, *(void *)&self->_accuracy, self->_bundleIdentifier];

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (CLLocation)location
{
  return self->_location;
}

- (double)radius
{
  return self->_radius;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end