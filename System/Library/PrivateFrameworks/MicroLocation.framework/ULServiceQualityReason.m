@interface ULServiceQualityReason
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (ULServiceQualityReason)init;
- (ULServiceQualityReason)initWithCoder:(id)a3;
- (ULServiceQualityReason)initWithQualityReasonEnum:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)qualityReasonEnum;
- (void)encodeWithCoder:(id)a3;
- (void)setQualityReasonEnum:(unint64_t)a3;
@end

@implementation ULServiceQualityReason

- (ULServiceQualityReason)initWithQualityReasonEnum:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ULServiceQualityReason;
  v4 = [(ULServiceQualityReason *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ULServiceQualityReason *)v4 setQualityReasonEnum:a3];
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
  unint64_t qualityReasonEnum = self->_qualityReasonEnum;

  return (id)[v4 initWithQualityReasonEnum:qualityReasonEnum];
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  unint64_t qualityReasonEnum = self->_qualityReasonEnum;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedInteger:qualityReasonEnum];
  [v5 encodeObject:v6 forKey:@"qualityReasonEnum"];
}

- (ULServiceQualityReason)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULServiceQualityReason;
  id v5 = [(ULServiceQualityReason *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"qualityReasonEnum"];
    objc_super v7 = v6;
    if (v6)
    {
      uint64_t v8 = [(ULServiceQualityReason *)v6 unsignedIntegerValue];

      v5->_unint64_t qualityReasonEnum = v8;
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

  unint64_t qualityReasonEnum = self->_qualityReasonEnum;
  if (qualityReasonEnum > 8) {
    uint64_t v8 = @"Unknown";
  }
  else {
    uint64_t v8 = off_2653F8010[qualityReasonEnum];
  }
  [v6 appendFormat:@", qualityReasonEnum: %@", v8];
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
    unint64_t v6 = [(ULServiceQualityReason *)self qualityReasonEnum];
    uint64_t v7 = [v5 qualityReasonEnum];

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
  return self->_qualityReasonEnum;
}

- (ULServiceQualityReason)init
{
}

+ (id)new
{
}

- (unint64_t)qualityReasonEnum
{
  return self->_qualityReasonEnum;
}

- (void)setQualityReasonEnum:(unint64_t)a3
{
  self->_unint64_t qualityReasonEnum = a3;
}

@end