@interface SPLocationProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (SPHandle)provider;
- (SPLocationProvider)initWithCoder:(id)a3;
- (SPLocationProvider)initWithTimestamp:(id)a3 provider:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProvider:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation SPLocationProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPLocationProvider)initWithTimestamp:(id)a3 provider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPLocationProvider;
  v9 = [(SPLocationProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timestamp, a3);
    objc_storeStrong((id *)&v10->_provider, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SPLocationProvider *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SPLocationProvider *)self timestamp];
      id v7 = [(SPLocationProvider *)v5 timestamp];
      if ([v6 isEqualToDate:v7])
      {
        id v8 = [(SPLocationProvider *)self provider];
        v9 = [(SPLocationProvider *)v5 provider];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPLocationProvider alloc];
  v5 = [(SPLocationProvider *)self timestamp];
  v6 = [(SPLocationProvider *)self provider];
  id v7 = [(SPLocationProvider *)v4 initWithTimestamp:v5 provider:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeObject:timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_provider forKey:@"provider"];
}

- (SPLocationProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SPLocationProvider;
  id v5 = [(SPLocationProvider *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provider"];
    provider = v5->_provider;
    v5->_provider = (SPHandle *)v8;
  }
  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(SPLocationProvider *)self provider];
  id v5 = [v4 destination];
  uint64_t v6 = [(SPLocationProvider *)self timestamp];
  id v7 = [v6 description];
  uint64_t v8 = (void *)[v3 initWithFormat:@"Location Provider: %@, timestamp: %@", v5, v7];

  return v8;
}

- (id)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SPLocationProvider *)self provider];
  uint64_t v6 = [v5 destination];
  id v7 = [(SPLocationProvider *)self timestamp];
  uint64_t v8 = [v7 description];
  v9 = [v3 stringWithFormat:@"<%@: %p %@:%@>", v4, self, v6, v8];

  return v9;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (SPHandle)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end