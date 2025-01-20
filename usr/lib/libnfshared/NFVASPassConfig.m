@interface NFVASPassConfig
+ (BOOL)supportsSecureCoding;
+ (id)passConfigWithMode:(int64_t)a3 passIdentifier:(id)a4;
- (NFVASPassConfig)initWithCoder:(id)a3;
- (NSString)passIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)vasMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFVASPassConfig

+ (id)passConfigWithMode:(int64_t)a3 passIdentifier:(id)a4
{
  id v5 = a4;
  v6 = objc_opt_new();
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    v8 = (void *)v6[2];
    v6[2] = v7;

    v6[1] = a3;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  passIdentifier = self->_passIdentifier;
  id v5 = a3;
  [v5 encodeObject:passIdentifier forKey:@"passIdentifier"];
  [v5 encodeInteger:self->_vasMode forKey:@"vasMode"];
}

- (NFVASPassConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFVASPassConfig;
  id v5 = [(NFVASPassConfig *)&v9 init];
  if (v5)
  {
    v5->_vasMode = [v4 decodeIntegerForKey:@"vasMode"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passIdentifier"];
    passIdentifier = v5->_passIdentifier;
    v5->_passIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_new();
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_passIdentifier copyWithZone:a3];
    uint64_t v7 = (void *)v5[2];
    v5[2] = v6;

    v5[1] = self->_vasMode;
  }
  return v5;
}

- (int64_t)vasMode
{
  return self->_vasMode;
}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (void).cxx_destruct
{
}

@end