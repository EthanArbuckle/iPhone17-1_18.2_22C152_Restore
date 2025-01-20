@interface ULUpdateConfiguration
+ (BOOL)supportsSecureCoding;
+ (ULUpdateConfiguration)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowLatency;
- (ULUpdateConfiguration)init;
- (ULUpdateConfiguration)initWithCoder:(id)a3;
- (ULUpdateConfiguration)initWithIsLowLatency:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsLowLatency:(BOOL)a3;
@end

@implementation ULUpdateConfiguration

- (ULUpdateConfiguration)initWithIsLowLatency:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ULUpdateConfiguration;
  v4 = [(ULUpdateConfiguration *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ULUpdateConfiguration *)v4 setIsLowLatency:v3];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  BOOL isLowLatency = self->_isLowLatency;

  return (id)[v4 initWithIsLowLatency:isLowLatency];
}

- (void)encodeWithCoder:(id)a3
{
  BOOL v3 = NSNumber;
  BOOL isLowLatency = self->_isLowLatency;
  id v5 = a3;
  id v6 = [v3 numberWithBool:isLowLatency];
  [v5 encodeObject:v6 forKey:@"isLowLatency"];
}

- (ULUpdateConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULUpdateConfiguration;
  id v5 = [(ULUpdateConfiguration *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isLowLatency"];
    objc_super v7 = v6;
    if (v6)
    {
      char v8 = [(ULUpdateConfiguration *)v6 BOOLValue];

      v5->_BOOL isLowLatency = v8;
      objc_super v7 = v5;
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  objc_super v7 = [NSNumber numberWithBool:self->_isLowLatency];
  [v6 appendFormat:@", isLowLatency: %@", v7];

  [v6 appendString:@">"];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(ULUpdateConfiguration *)self isLowLatency];
    char v7 = [v5 isLowLatency];

    char v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_isLowLatency;
}

- (ULUpdateConfiguration)init
{
}

+ (ULUpdateConfiguration)new
{
}

- (BOOL)isLowLatency
{
  return self->_isLowLatency;
}

- (void)setIsLowLatency:(BOOL)a3
{
  self->_BOOL isLowLatency = a3;
}

@end