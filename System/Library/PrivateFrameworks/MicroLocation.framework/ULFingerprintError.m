@interface ULFingerprintError
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (ULFingerprintError)init;
- (ULFingerprintError)initWithCoder:(id)a3;
- (ULFingerprintError)initWithFingerprintErrorEnum:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)fingerprintErrorEnum;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFingerprintErrorEnum:(unint64_t)a3;
@end

@implementation ULFingerprintError

- (ULFingerprintError)initWithFingerprintErrorEnum:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ULFingerprintError;
  v4 = [(ULFingerprintError *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ULFingerprintError *)v4 setFingerprintErrorEnum:a3];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = [(ULFingerprintError *)self fingerprintErrorEnum];

  return (id)[v4 initWithFingerprintErrorEnum:v5];
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  unint64_t fingerprintErrorEnum = self->_fingerprintErrorEnum;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedInteger:fingerprintErrorEnum];
  [v5 encodeObject:v6 forKey:@"fingerprintErrorEnum"];
}

- (ULFingerprintError)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULFingerprintError;
  id v5 = [(ULFingerprintError *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fingerprintErrorEnum"];
    objc_super v7 = v6;
    if (v6)
    {
      uint64_t v8 = [(ULFingerprintError *)v6 unsignedIntegerValue];

      v5->_unint64_t fingerprintErrorEnum = v8;
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

  objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ULFingerprintError fingerprintErrorEnum](self, "fingerprintErrorEnum"));
  [v6 appendFormat:@", fingerprintErrorEnum: %@", v7];

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
    unint64_t v6 = [(ULFingerprintError *)self fingerprintErrorEnum];
    uint64_t v7 = [v5 fingerprintErrorEnum];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_fingerprintErrorEnum;
}

- (ULFingerprintError)init
{
}

+ (id)new
{
}

- (unint64_t)fingerprintErrorEnum
{
  return self->_fingerprintErrorEnum;
}

- (void)setFingerprintErrorEnum:(unint64_t)a3
{
  self->_unint64_t fingerprintErrorEnum = a3;
}

@end