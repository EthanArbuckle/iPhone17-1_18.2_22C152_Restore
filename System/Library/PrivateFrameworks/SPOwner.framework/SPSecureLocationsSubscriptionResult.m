@interface SPSecureLocationsSubscriptionResult
+ (BOOL)supportsSecureCoding;
- (NSArray)locations;
- (SPSecureLocationsSubscriptionResult)init;
- (SPSecureLocationsSubscriptionResult)initWithCoder:(id)a3;
- (SPSecureLocationsSubscriptionResult)initWithExpiryTime:(double)a3 locations:(id)a4;
- (double)expiresIn;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setExpiresIn:(double)a3;
- (void)setLocations:(id)a3;
@end

@implementation SPSecureLocationsSubscriptionResult

- (SPSecureLocationsSubscriptionResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)SPSecureLocationsSubscriptionResult;
  v2 = [(SPSecureLocationsSubscriptionResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    locations = v2->_locations;
    v2->_locations = (NSArray *)MEMORY[0x1E4F1CBF0];

    v3->_expiresIn = 0.0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SPSecureLocationsSubscriptionResult);
  v5 = [(SPSecureLocationsSubscriptionResult *)self locations];
  [(SPSecureLocationsSubscriptionResult *)v4 setLocations:v5];

  [(SPSecureLocationsSubscriptionResult *)self expiresIn];
  -[SPSecureLocationsSubscriptionResult setExpiresIn:](v4, "setExpiresIn:");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  locations = self->_locations;
  id v5 = a3;
  [v5 encodeObject:locations forKey:@"locations"];
  [v5 encodeDouble:@"expiresIn" forKey:self->_expiresIn];
}

- (SPSecureLocationsSubscriptionResult)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"locations"];
  locations = self->_locations;
  self->_locations = v8;

  [v5 decodeDoubleForKey:@"expiresIn"];
  double v11 = v10;

  self->_expiresIn = v11;
  return self;
}

- (SPSecureLocationsSubscriptionResult)initWithExpiryTime:(double)a3 locations:(id)a4
{
  self->_expiresIn = a3;
  return self;
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (double)expiresIn
{
  return self->_expiresIn;
}

- (void)setExpiresIn:(double)a3
{
  self->_expiresIn = a3;
}

- (void).cxx_destruct
{
}

@end