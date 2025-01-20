@interface ULServiceQualityInfo
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSArray)serviceQualityReasons;
- (ULServiceQualityInfo)init;
- (ULServiceQualityInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initServiceWithQuality:(unint64_t)a3 andReasons:(id)a4;
- (unint64_t)hash;
- (unint64_t)serviceQuality;
- (void)encodeWithCoder:(id)a3;
- (void)setServiceQuality:(unint64_t)a3;
- (void)setServiceQualityReasons:(id)a3;
@end

@implementation ULServiceQualityInfo

- (id)initServiceWithQuality:(unint64_t)a3 andReasons:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ULServiceQualityInfo;
  v7 = [(ULServiceQualityInfo *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(ULServiceQualityInfo *)v7 setServiceQuality:a3];
    [(ULServiceQualityInfo *)v8 setServiceQualityReasons:v6];
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  unint64_t serviceQuality = self->_serviceQuality;
  v7 = (void *)[(NSArray *)self->_serviceQualityReasons copyWithZone:a3];
  v8 = (void *)[v5 initServiceWithQuality:serviceQuality andReasons:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t serviceQuality = self->_serviceQuality;
  id v7 = a3;
  id v6 = [v4 numberWithUnsignedInteger:serviceQuality];
  [v7 encodeObject:v6 forKey:@"serviceQuality"];

  [v7 encodeObject:self->_serviceQualityReasons forKey:@"serviceQualityReasons"];
}

- (ULServiceQualityInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ULServiceQualityInfo;
  id v5 = [(ULServiceQualityInfo *)&v12 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceQuality"];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [(ULServiceQualityInfo *)v6 unsignedIntegerValue];

      v5->_unint64_t serviceQuality = v8;
      id v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"serviceQualityReasons"];
      if (v7)
      {
        uint64_t v9 = self;

        serviceQualityReasons = v5->_serviceQualityReasons;
        v5->_serviceQualityReasons = (NSArray *)v9;

        id v7 = v5;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  id v7 = ULServiceQualityToString(self->_serviceQuality);
  [v6 appendFormat:@", serviceQuality: %@", v7];

  [v6 appendFormat:@", serviceQualityReasons: %@", self->_serviceQualityReasons];
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
    unint64_t v6 = [(ULServiceQualityInfo *)self serviceQuality];
    if (v6 == [v5 serviceQuality])
    {
      id v7 = [(ULServiceQualityInfo *)self serviceQualityReasons];
      uint64_t v8 = [v5 serviceQualityReasons];
      if ([v7 isEqual:v8])
      {

        char v9 = 1;
      }
      else
      {
        objc_super v10 = [(ULServiceQualityInfo *)self serviceQualityReasons];
        v11 = [v5 serviceQualityReasons];
        BOOL v12 = v10 != v11;

        char v9 = !v12;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (unint64_t)hash
{
  unint64_t serviceQuality = self->_serviceQuality;
  return [(NSArray *)self->_serviceQualityReasons hash] ^ serviceQuality;
}

- (ULServiceQualityInfo)init
{
}

+ (id)new
{
}

- (unint64_t)serviceQuality
{
  return self->_serviceQuality;
}

- (void)setServiceQuality:(unint64_t)a3
{
  self->_unint64_t serviceQuality = a3;
}

- (NSArray)serviceQualityReasons
{
  return self->_serviceQualityReasons;
}

- (void)setServiceQualityReasons:(id)a3
{
}

- (void).cxx_destruct
{
}

@end