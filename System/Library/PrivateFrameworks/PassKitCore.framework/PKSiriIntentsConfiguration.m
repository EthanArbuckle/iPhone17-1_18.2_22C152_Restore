@interface PKSiriIntentsConfiguration
+ (BOOL)supportsSecureCoding;
- (NSArray)supportedCarKeyIntents;
- (PKSiriIntentsConfiguration)initWithCoder:(id)a3;
- (PKSiriIntentsConfiguration)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSupportedCarKeyIntents:(id)a3;
@end

@implementation PKSiriIntentsConfiguration

- (PKSiriIntentsConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSiriIntentsConfiguration;
  v5 = [(PKSiriIntentsConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKArrayContaining:objc_opt_class() forKey:@"vehicleFunctions"];
    supportedCarKeyIntents = v5->_supportedCarKeyIntents;
    v5->_supportedCarKeyIntents = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSiriIntentsConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKSiriIntentsConfiguration;
  v5 = [(PKSiriIntentsConfiguration *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"vehicleFunctions"];
    supportedCarKeyIntents = v5->_supportedCarKeyIntents;
    v5->_supportedCarKeyIntents = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[PKSiriIntentsConfiguration allocWithZone:a3];
  objc_storeStrong((id *)&v4->_supportedCarKeyIntents, self->_supportedCarKeyIntents);
  return v4;
}

- (NSArray)supportedCarKeyIntents
{
  return self->_supportedCarKeyIntents;
}

- (void)setSupportedCarKeyIntents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end