@interface SPMacBeaconConfig
+ (BOOL)supportsSecureCoding;
- (NSArray)postInitialDayAdvertisementTimes;
- (SPMacBeaconConfig)initWithCoder:(id)a3;
- (SPMacBeaconConfig)initWithInitialNoBeaconDuration:(double)a3 fastRollAdvertisementDuration:(double)a4 fastRollAdvertisementInterval:(double)a5 slowRollAdvertisementDuration:(double)a6 slowRollNoAdvertisementDuration:(double)a7 noAdvertisementDurationDecayFactor:(double)a8 postInitialDayAdvertisementTimes:(id)a9;
- (double)fastRollAdvertisementDuration;
- (double)fastRollAdvertisementInterval;
- (double)initialNoBeaconDuration;
- (double)noAdvertisementDurationDecayFactor;
- (double)slowRollAdvertisementDuration;
- (double)slowRollNoAdvertisementDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)initFromPrefs;
- (void)encodeWithCoder:(id)a3;
- (void)persistToPrefs;
- (void)setFastRollAdvertisementDuration:(double)a3;
- (void)setFastRollAdvertisementInterval:(double)a3;
- (void)setInitialNoBeaconDuration:(double)a3;
- (void)setNoAdvertisementDurationDecayFactor:(double)a3;
- (void)setPostInitialDayAdvertisementTimes:(id)a3;
- (void)setSlowRollAdvertisementDuration:(double)a3;
- (void)setSlowRollNoAdvertisementDuration:(double)a3;
@end

@implementation SPMacBeaconConfig

- (SPMacBeaconConfig)initWithInitialNoBeaconDuration:(double)a3 fastRollAdvertisementDuration:(double)a4 fastRollAdvertisementInterval:(double)a5 slowRollAdvertisementDuration:(double)a6 slowRollNoAdvertisementDuration:(double)a7 noAdvertisementDurationDecayFactor:(double)a8 postInitialDayAdvertisementTimes:(id)a9
{
  id v16 = a9;
  v22.receiver = self;
  v22.super_class = (Class)SPMacBeaconConfig;
  v17 = [(SPMacBeaconConfig *)&v22 init];
  v18 = v17;
  if (v17)
  {
    v17->_initialNoBeaconDuration = a3;
    v17->_fastRollAdvertisementDuration = a4;
    v17->_fastRollAdvertisementInterval = a5;
    v17->_slowRollAdvertisementDuration = a6;
    v17->_slowRollNoAdvertisementDuration = a7;
    v17->_noAdvertisementDurationDecayFactor = a8;
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v16 copyItems:1];
    postInitialDayAdvertisementTimes = v18->_postInitialDayAdvertisementTimes;
    v18->_postInitialDayAdvertisementTimes = (NSArray *)v19;
  }
  return v18;
}

- (id)initFromPrefs
{
  v8.receiver = self;
  v8.super_class = (Class)SPMacBeaconConfig;
  v2 = [(SPMacBeaconConfig *)&v8 init];
  if (v2)
  {
    v2->_initialNoBeaconDuration = (double)[MEMORY[0x1E4F61550] integerForKey:@"initialNoBeaconDuration" inDomain:@"com.apple.icloud.searchpartyd.mac-beacon"];
    v2->_fastRollAdvertisementDuration = (double)[MEMORY[0x1E4F61550] integerForKey:@"fastRollAdvertisementDuration" inDomain:@"com.apple.icloud.searchpartyd.mac-beacon"];
    v2->_fastRollAdvertisementInterval = (double)[MEMORY[0x1E4F61550] integerForKey:@"fastRollAdvertisementInterval" inDomain:@"com.apple.icloud.searchpartyd.mac-beacon"];
    v2->_slowRollAdvertisementDuration = (double)[MEMORY[0x1E4F61550] integerForKey:@"slowRollAdvertisementDuration" inDomain:@"com.apple.icloud.searchpartyd.mac-beacon"];
    v2->_slowRollNoAdvertisementDuration = (double)[MEMORY[0x1E4F61550] integerForKey:@"slowRollNoAdvertisementDuration" inDomain:@"com.apple.icloud.searchpartyd.mac-beacon"];
    v3 = [MEMORY[0x1E4F61550] stringForKey:@"noAdvertisementDurationDecayFactor" inDomain:@"com.apple.icloud.searchpartyd.mac-beacon"];
    [v3 doubleValue];
    v2->_noAdvertisementDurationDecayFactor = v4;

    uint64_t v5 = [MEMORY[0x1E4F61550] arrayForKey:@"postInitialDayAdvertisementTimes" inDomain:@"com.apple.icloud.searchpartyd.mac-beacon"];
    postInitialDayAdvertisementTimes = v2->_postInitialDayAdvertisementTimes;
    v2->_postInitialDayAdvertisementTimes = (NSArray *)v5;
  }
  return v2;
}

- (void)persistToPrefs
{
  v3 = (void *)MEMORY[0x1E4F61550];
  double v4 = [NSNumber numberWithDouble:self->_initialNoBeaconDuration];
  objc_msgSend(v3, "setInteger:forKey:inDomain:", objc_msgSend(v4, "integerValue"), @"initialNoBeaconDuration", @"com.apple.icloud.searchpartyd.mac-beacon");

  uint64_t v5 = (void *)MEMORY[0x1E4F61550];
  v6 = [NSNumber numberWithDouble:self->_fastRollAdvertisementDuration];
  objc_msgSend(v5, "setInteger:forKey:inDomain:", objc_msgSend(v6, "integerValue"), @"fastRollAdvertisementDuration", @"com.apple.icloud.searchpartyd.mac-beacon");

  v7 = (void *)MEMORY[0x1E4F61550];
  objc_super v8 = [NSNumber numberWithDouble:self->_fastRollAdvertisementInterval];
  objc_msgSend(v7, "setInteger:forKey:inDomain:", objc_msgSend(v8, "integerValue"), @"fastRollAdvertisementInterval", @"com.apple.icloud.searchpartyd.mac-beacon");

  v9 = (void *)MEMORY[0x1E4F61550];
  v10 = [NSNumber numberWithDouble:self->_slowRollAdvertisementDuration];
  objc_msgSend(v9, "setInteger:forKey:inDomain:", objc_msgSend(v10, "integerValue"), @"slowRollAdvertisementDuration", @"com.apple.icloud.searchpartyd.mac-beacon");

  v11 = (void *)MEMORY[0x1E4F61550];
  v12 = [NSNumber numberWithDouble:self->_slowRollNoAdvertisementDuration];
  objc_msgSend(v11, "setInteger:forKey:inDomain:", objc_msgSend(v12, "integerValue"), @"slowRollNoAdvertisementDuration", @"com.apple.icloud.searchpartyd.mac-beacon");

  v13 = (void *)MEMORY[0x1E4F61550];
  v14 = [NSNumber numberWithDouble:self->_noAdvertisementDurationDecayFactor];
  v15 = [v14 stringValue];
  [v13 setString:v15 forKey:@"noAdvertisementDurationDecayFactor" inDomain:@"com.apple.icloud.searchpartyd.mac-beacon"];

  id v16 = (void *)MEMORY[0x1E4F61550];
  postInitialDayAdvertisementTimes = self->_postInitialDayAdvertisementTimes;

  [v16 setArray:postInitialDayAdvertisementTimes forKey:@"postInitialDayAdvertisementTimes" inDomain:@"com.apple.icloud.searchpartyd.mac-beacon"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [SPMacBeaconConfig alloc];
  double initialNoBeaconDuration = self->_initialNoBeaconDuration;
  double fastRollAdvertisementDuration = self->_fastRollAdvertisementDuration;
  double fastRollAdvertisementInterval = self->_fastRollAdvertisementInterval;
  double slowRollAdvertisementDuration = self->_slowRollAdvertisementDuration;
  double slowRollNoAdvertisementDuration = self->_slowRollNoAdvertisementDuration;
  double noAdvertisementDurationDecayFactor = self->_noAdvertisementDurationDecayFactor;
  postInitialDayAdvertisementTimes = self->_postInitialDayAdvertisementTimes;

  return [(SPMacBeaconConfig *)v4 initWithInitialNoBeaconDuration:postInitialDayAdvertisementTimes fastRollAdvertisementDuration:initialNoBeaconDuration fastRollAdvertisementInterval:fastRollAdvertisementDuration slowRollAdvertisementDuration:fastRollAdvertisementInterval slowRollNoAdvertisementDuration:slowRollAdvertisementDuration noAdvertisementDurationDecayFactor:slowRollNoAdvertisementDuration postInitialDayAdvertisementTimes:noAdvertisementDurationDecayFactor];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPMacBeaconConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"initialNoBeaconDuration"];
  self->_double initialNoBeaconDuration = v5;
  [v4 decodeDoubleForKey:@"fastRollAdvertisementDuration"];
  self->_double fastRollAdvertisementDuration = v6;
  [v4 decodeDoubleForKey:@"fastRollAdvertisementInterval"];
  self->_double fastRollAdvertisementInterval = v7;
  [v4 decodeDoubleForKey:@"slowRollAdvertisementDuration"];
  self->_double slowRollAdvertisementDuration = v8;
  [v4 decodeDoubleForKey:@"slowRollNoAdvertisementDuration"];
  self->_double slowRollNoAdvertisementDuration = v9;
  [v4 decodeDoubleForKey:@"noAdvertisementDurationDecayFactor"];
  self->_double noAdvertisementDurationDecayFactor = v10;
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"postInitialDayAdvertisementTimes"];

  postInitialDayAdvertisementTimes = self->_postInitialDayAdvertisementTimes;
  self->_postInitialDayAdvertisementTimes = v14;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  double initialNoBeaconDuration = self->_initialNoBeaconDuration;
  id v5 = a3;
  [v5 encodeDouble:@"initialNoBeaconDuration" forKey:initialNoBeaconDuration];
  [v5 encodeDouble:@"fastRollAdvertisementDuration" forKey:self->_fastRollAdvertisementDuration];
  [v5 encodeDouble:@"fastRollAdvertisementInterval" forKey:self->_fastRollAdvertisementInterval];
  [v5 encodeDouble:@"slowRollAdvertisementDuration" forKey:self->_slowRollAdvertisementDuration];
  [v5 encodeDouble:@"slowRollNoAdvertisementDuration" forKey:self->_slowRollNoAdvertisementDuration];
  [v5 encodeDouble:@"noAdvertisementDurationDecayFactor" forKey:self->_noAdvertisementDurationDecayFactor];
  [v5 encodeObject:self->_postInitialDayAdvertisementTimes forKey:@"postInitialDayAdvertisementTimes"];
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(SPMacBeaconConfig *)self fastRollAdvertisementDuration];
  uint64_t v6 = v5;
  [(SPMacBeaconConfig *)self fastRollAdvertisementInterval];
  uint64_t v8 = v7;
  [(SPMacBeaconConfig *)self slowRollAdvertisementDuration];
  uint64_t v10 = v9;
  [(SPMacBeaconConfig *)self slowRollNoAdvertisementDuration];
  uint64_t v12 = v11;
  [(SPMacBeaconConfig *)self noAdvertisementDurationDecayFactor];
  return (id)[v3 stringWithFormat:@"<%@: %p> fast: [%f: %f], slow: [%f: %f], decay: %f", v4, self, v6, v8, v10, v12, v13];
}

- (double)initialNoBeaconDuration
{
  return self->_initialNoBeaconDuration;
}

- (void)setInitialNoBeaconDuration:(double)a3
{
  self->_double initialNoBeaconDuration = a3;
}

- (double)fastRollAdvertisementDuration
{
  return self->_fastRollAdvertisementDuration;
}

- (void)setFastRollAdvertisementDuration:(double)a3
{
  self->_double fastRollAdvertisementDuration = a3;
}

- (double)fastRollAdvertisementInterval
{
  return self->_fastRollAdvertisementInterval;
}

- (void)setFastRollAdvertisementInterval:(double)a3
{
  self->_double fastRollAdvertisementInterval = a3;
}

- (double)slowRollAdvertisementDuration
{
  return self->_slowRollAdvertisementDuration;
}

- (void)setSlowRollAdvertisementDuration:(double)a3
{
  self->_double slowRollAdvertisementDuration = a3;
}

- (double)slowRollNoAdvertisementDuration
{
  return self->_slowRollNoAdvertisementDuration;
}

- (void)setSlowRollNoAdvertisementDuration:(double)a3
{
  self->_double slowRollNoAdvertisementDuration = a3;
}

- (double)noAdvertisementDurationDecayFactor
{
  return self->_noAdvertisementDurationDecayFactor;
}

- (void)setNoAdvertisementDurationDecayFactor:(double)a3
{
  self->_double noAdvertisementDurationDecayFactor = a3;
}

- (NSArray)postInitialDayAdvertisementTimes
{
  return self->_postInitialDayAdvertisementTimes;
}

- (void)setPostInitialDayAdvertisementTimes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end