@interface NWNetworkPredictions
+ (BOOL)supportsSecureCoding;
- (NSDate)changePointAt;
- (NWNetworkPredictions)initWithCoder:(id)a3;
- (NWNetworkPredictions)initWithSpec:(id)a3 toQuality:(int64_t)a4 withConfidence:(double)a5 resolutionSeconds:(unsigned int)a6;
- (double)confidence;
- (id)description;
- (int64_t)resolutionSeconds;
- (int64_t)toQuality;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NWNetworkPredictions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NWNetworkPredictions)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NWNetworkPredictions;
  v5 = [(NWNetworkPredictions *)&v11 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x2611E0E10]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changePointAt"];
    changePointAt = v5->_changePointAt;
    v5->_changePointAt = (NSDate *)v7;

    v5->_toQuality = [v4 decodeIntegerForKey:@"toQuality"];
    [v4 decodeDoubleForKey:@"confidence"];
    v5->_confidence = v9;
    v5->_resolutionSeconds = [v4 decodeIntegerForKey:@"resolutionSeconds"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = (void *)MEMORY[0x2611E0E10]();
  v5 = [(NWNetworkPredictions *)self changePointAt];
  [v6 encodeObject:v5 forKey:@"changePointAt"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[NWNetworkPredictions toQuality](self, "toQuality"), @"toQuality");
  [(NWNetworkPredictions *)self confidence];
  objc_msgSend(v6, "encodeDouble:forKey:", @"confidence");
  objc_msgSend(v6, "encodeInteger:forKey:", -[NWNetworkPredictions resolutionSeconds](self, "resolutionSeconds"), @"resolutionSeconds");
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(NWNetworkPredictions *)self changePointAt];
  v5 = [MEMORY[0x263EFF960] currentLocale];
  id v6 = [v4 descriptionWithLocale:v5];
  int64_t v7 = [(NWNetworkPredictions *)self toQuality];
  [(NWNetworkPredictions *)self confidence];
  double v9 = (void *)[v3 initWithFormat:@"pred %p, nextAt:%@, quality:%ld, confidence:%f, resolution:%ld", self, v6, v7, v8, -[NWNetworkPredictions resolutionSeconds](self, "resolutionSeconds")];

  return v9;
}

- (NWNetworkPredictions)initWithSpec:(id)a3 toQuality:(int64_t)a4 withConfidence:(double)a5 resolutionSeconds:(unsigned int)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NWNetworkPredictions;
  v12 = [(NWNetworkPredictions *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_changePointAt, a3);
    v13->_toQuality = a4;
    v13->_confidence = a5;
    v13->_resolutionSeconds = a6;
  }

  return v13;
}

- (NSDate)changePointAt
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)toQuality
{
  return self->_toQuality;
}

- (double)confidence
{
  return self->_confidence;
}

- (int64_t)resolutionSeconds
{
  return self->_resolutionSeconds;
}

- (void).cxx_destruct
{
}

@end