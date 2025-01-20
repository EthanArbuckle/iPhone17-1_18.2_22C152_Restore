@interface ULConfidenceReason
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (ULConfidenceReason)init;
- (ULConfidenceReason)initWithCoder:(id)a3;
- (ULConfidenceReason)initWithConfidenceReasonEnum:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)confidenceReasonEnum;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidenceReasonEnum:(unint64_t)a3;
@end

@implementation ULConfidenceReason

- (ULConfidenceReason)initWithConfidenceReasonEnum:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ULConfidenceReason;
  v4 = [(ULConfidenceReason *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ULConfidenceReason *)v4 setConfidenceReasonEnum:a3];
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
  unint64_t confidenceReasonEnum = self->_confidenceReasonEnum;

  return (id)[v4 initWithConfidenceReasonEnum:confidenceReasonEnum];
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  unint64_t confidenceReasonEnum = self->_confidenceReasonEnum;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedInteger:confidenceReasonEnum];
  [v5 encodeObject:v6 forKey:@"confidenceReasonEnum"];
}

- (ULConfidenceReason)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULConfidenceReason;
  id v5 = [(ULConfidenceReason *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confidenceReasonEnum"];
    objc_super v7 = v6;
    if (v6)
    {
      uint64_t v8 = [(ULConfidenceReason *)v6 unsignedIntegerValue];

      v5->_unint64_t confidenceReasonEnum = v8;
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

  unint64_t confidenceReasonEnum = self->_confidenceReasonEnum;
  if (confidenceReasonEnum > 7) {
    uint64_t v8 = @"Unknown";
  }
  else {
    uint64_t v8 = off_2653F8058[confidenceReasonEnum];
  }
  [v6 appendFormat:@", confidenceReasonEnum: %@", v8];
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
    unint64_t v6 = [(ULConfidenceReason *)self confidenceReasonEnum];
    uint64_t v7 = [v5 confidenceReasonEnum];

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
  return self->_confidenceReasonEnum;
}

- (ULConfidenceReason)init
{
}

+ (id)new
{
}

- (unint64_t)confidenceReasonEnum
{
  return self->_confidenceReasonEnum;
}

- (void)setConfidenceReasonEnum:(unint64_t)a3
{
  self->_unint64_t confidenceReasonEnum = a3;
}

@end