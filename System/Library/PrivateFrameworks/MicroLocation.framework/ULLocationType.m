@interface ULLocationType
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (ULLocationType)init;
- (ULLocationType)initWithCoder:(id)a3;
- (ULLocationType)initWithLocationTypeEnum:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)locationType;
- (void)encodeWithCoder:(id)a3;
- (void)setLocationType:(unint64_t)a3;
@end

@implementation ULLocationType

- (ULLocationType)initWithLocationTypeEnum:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ULLocationType;
  v4 = [(ULLocationType *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ULLocationType *)v4 setLocationType:a3];
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
  unint64_t locationType = self->_locationType;

  return (id)[v4 initWithLocationTypeEnum:locationType];
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  unint64_t locationType = self->_locationType;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedInteger:locationType];
  [v5 encodeObject:v6 forKey:@"locationType"];
}

- (ULLocationType)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULLocationType;
  id v5 = [(ULLocationType *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationType"];
    objc_super v7 = v6;
    if (v6)
    {
      unint64_t v8 = [(ULLocationType *)v6 unsignedIntValue];

      v5->_unint64_t locationType = v8;
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

  int64_t locationType = self->_locationType;
  if (locationType > 1)
  {
    if (locationType != 2)
    {
      if (locationType == 30)
      {
        unint64_t v8 = @"Other";
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    unint64_t v8 = @"Custom";
  }
  else
  {
    if (locationType)
    {
      if (locationType == 1)
      {
        unint64_t v8 = @"Work";
        goto LABEL_11;
      }
LABEL_8:
      unint64_t v8 = @"Unknown";
      goto LABEL_11;
    }
    unint64_t v8 = @"Home";
  }
LABEL_11:
  [v6 appendFormat:@", locationType: %@", v8];
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
    unint64_t v6 = [(ULLocationType *)self locationType];
    uint64_t v7 = [v5 locationType];

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
  return self->_locationType;
}

- (ULLocationType)init
{
}

+ (id)new
{
}

- (unint64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(unint64_t)a3
{
  self->_int64_t locationType = a3;
}

@end