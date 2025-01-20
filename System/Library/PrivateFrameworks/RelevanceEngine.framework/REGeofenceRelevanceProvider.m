@interface REGeofenceRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (CLCircularRegion)region;
- (NSString)bundleIdentifier;
- (REGeofenceRelevanceProvider)init;
- (REGeofenceRelevanceProvider)initWithDictionary:(id)a3;
- (REGeofenceRelevanceProvider)initWithRegion:(id)a3;
- (REGeofenceRelevanceProvider)initWithRegion:(id)a3 bundleIdentifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
@end

@implementation REGeofenceRelevanceProvider

- (REGeofenceRelevanceProvider)init
{
  v3 = objc_opt_new();
  v4 = [(REGeofenceRelevanceProvider *)self initWithRegion:v3];

  return v4;
}

- (REGeofenceRelevanceProvider)initWithRegion:(id)a3
{
  return [(REGeofenceRelevanceProvider *)self initWithRegion:a3 bundleIdentifier:0];
}

- (REGeofenceRelevanceProvider)initWithRegion:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REGeofenceRelevanceProvider;
  v9 = [(RERelevanceProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_region, a3);
    uint64_t v11 = [v8 copy];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;
  }
  return v10;
}

+ (id)relevanceSimulatorID
{
  return @"geofence";
}

- (REGeofenceRelevanceProvider)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"latitude"];
  v6 = [v4 objectForKeyedSubscript:@"longitude"];
  id v7 = [v4 objectForKeyedSubscript:@"radius"];
  id v8 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
  v9 = [v4 objectForKeyedSubscript:@"region_name"];

  v10 = &stru_26CFA57D0;
  if (v9) {
    v10 = v9;
  }
  uint64_t v11 = v10;

  v12 = 0;
  if (v5 && v6)
  {
    [v5 doubleValue];
    double v14 = v13;
    [v6 doubleValue];
    double v16 = v15;
    if (v7)
    {
      [v7 doubleValue];
      double v18 = v17;
    }
    else
    {
      double v18 = 1000.0;
    }
    v19 = objc_msgSend(objc_alloc(MEMORY[0x263F00A28]), "initWithCenter:radius:identifier:", v11, v14, v16, v18);
    self = [(REGeofenceRelevanceProvider *)self initWithRegion:v19 bundleIdentifier:v8];

    v12 = self;
  }

  return v12;
}

- (id)dictionaryEncoding
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = NSNumber;
  [(CLCircularRegion *)self->_region center];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v5 forKeyedSubscript:@"latitude"];

  v6 = NSNumber;
  [(CLCircularRegion *)self->_region center];
  id v8 = [v6 numberWithDouble:v7];
  [v3 setObject:v8 forKeyedSubscript:@"longitude"];

  v9 = NSNumber;
  [(CLCircularRegion *)self->_region radius];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v3 setObject:v10 forKeyedSubscript:@"radius"];

  [v3 setObject:self->_bundleIdentifier forKeyedSubscript:@"bundleIdentifier"];
  uint64_t v11 = [(CLCircularRegion *)self->_region identifier];
  [v3 setObject:v11 forKeyedSubscript:@"region_name"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REGeofenceRelevanceProvider;
  id v4 = [(RERelevanceProvider *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 4, self->_region);
  objc_storeStrong(v4 + 5, self->_bundleIdentifier);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REGeofenceRelevanceProvider *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)REGeofenceRelevanceProvider;
    if ([(RERelevanceProvider *)&v11 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      char v6 = [(CLCircularRegion *)self->_region isEqual:v5->_region];
      bundleIdentifier = self->_bundleIdentifier;
      if (bundleIdentifier == v5->_bundleIdentifier) {
        char v8 = 1;
      }
      else {
        char v8 = -[NSString isEqualToString:](bundleIdentifier, "isEqualToString:");
      }
      char v9 = v6 & v8;
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)_hash
{
  uint64_t v3 = [(CLCircularRegion *)self->_region hash];
  return [(NSString *)self->_bundleIdentifier hash] ^ v3;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)REGeofenceRelevanceProvider;
  uint64_t v3 = [(REGeofenceRelevanceProvider *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" region=%@ bundleIdentifier=%@", self->_region, self->_bundleIdentifier];

  return v4;
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end