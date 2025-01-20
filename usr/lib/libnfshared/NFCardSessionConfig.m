@interface NFCardSessionConfig
+ (BOOL)supportsSecureCoding;
+ (id)configWithInitialUIText:(id)a3;
- (NFCardSessionConfig)initWithCoder:(id)a3;
- (NSString)initialUIText;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInitialUIText:(id)a3;
@end

@implementation NFCardSessionConfig

+ (id)configWithInitialUIText:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setInitialUIText:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFCardSessionConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFCardSessionConfig;
  v5 = [(NFCardSessionConfig *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initialUIText"];
    initialUIText = v5->_initialUIText;
    v5->_initialUIText = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NFCardSessionConfig *)self initialUIText];
  [v4 encodeObject:v5 forKey:@"initialUIText"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  id v5 = [(NFCardSessionConfig *)self initialUIText];
  [v4 setInitialUIText:v5];

  return v4;
}

- (NSString)initialUIText
{
  return self->_initialUIText;
}

- (void)setInitialUIText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end