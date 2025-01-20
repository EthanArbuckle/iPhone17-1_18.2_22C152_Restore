@interface PPConnectionsCriteria
+ (BOOL)supportsSecureCoding;
- (NSString)bundleIdentifier;
- (PPConnectionsCriteria)initWithCoder:(id)a3;
- (PPConnectionsCriteria)initWithLocationField:(unsigned __int8)a3 bundleIdentifier:(id)a4;
- (id)description;
- (unsigned)locationField;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setLocationField:(unsigned __int8)a3;
@end

@implementation PPConnectionsCriteria

- (unsigned)locationField
{
  return self->_locationField;
}

- (PPConnectionsCriteria)initWithLocationField:(unsigned __int8)a3 bundleIdentifier:(id)a4
{
  id v7 = a4;
  v8 = [(PPConnectionsCriteria *)self init];
  v9 = v8;
  if (v8)
  {
    v8->_locationField = a3;
    objc_storeStrong((id *)&v8->_bundleIdentifier, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t locationField = self->_locationField;
  id v5 = a3;
  [v5 encodeInteger:locationField forKey:@"locationField"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
}

- (PPConnectionsCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPConnectionsCriteria;
  id v5 = [(PPConnectionsCriteria *)&v9 init];
  if (v5)
  {
    v5->_uint64_t locationField = [v4 decodeIntegerForKey:@"locationField"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setLocationField:(unsigned __int8)a3
{
  self->_uint64_t locationField = a3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPConnectionsCriteria l:%u b:%@>", self->_locationField, self->_bundleIdentifier];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end