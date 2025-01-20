@interface SPLocationFetchResult
+ (BOOL)supportsSecureCoding;
- (NSDictionary)locationsByBeaconIdentifier;
- (SPLocationFetchResult)initWithCoder:(id)a3;
- (SPLocationFetchResult)initWithResults:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLocationsByBeaconIdentifier:(id)a3;
@end

@implementation SPLocationFetchResult

- (SPLocationFetchResult)initWithResults:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SPLocationFetchResult;
  v5 = [(SPLocationFetchResult *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SPLocationFetchResult *)v5 setLocationsByBeaconIdentifier:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPLocationFetchResult)initWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:3];
  v7 = objc_msgSend(v4, "setWithArray:", v6, v10, v11);
  objc_super v8 = [v5 decodeObjectOfClasses:v7 forKey:@"locationsByBeaconIdentifier"];

  [(SPLocationFetchResult *)self setLocationsByBeaconIdentifier:v8];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SPLocationFetchResult *)self locationsByBeaconIdentifier];
  [v4 encodeObject:v5 forKey:@"locationsByBeaconIdentifier"];
}

- (NSDictionary)locationsByBeaconIdentifier
{
  return self->_locationsByBeaconIdentifier;
}

- (void)setLocationsByBeaconIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end