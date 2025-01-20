@interface HAPCharacteristicMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualToCharacteristicMetadata:(id)a3;
- (HAPCharacteristicMetadata)initWithCoder:(id)a3;
- (HAPCharacteristicMetadata)initWithConstraints:(id)a3 description:(id)a4 format:(id)a5 units:(id)a6;
- (HAPMetadataConstraints)constraints;
- (NSString)format;
- (NSString)manufacturerDescription;
- (NSString)units;
- (id)_generateValidConstraints:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setFormat:(id)a3;
- (void)setManufacturerDescription:(id)a3;
- (void)setUnits:(id)a3;
@end

@implementation HAPCharacteristicMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAPCharacteristicMetadata)initWithConstraints:(id)a3 description:(id)a4 format:(id)a5 units:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (!v10 && !v11 && !v12 && !v13)
  {
LABEL_12:
    v28 = 0;
    goto LABEL_16;
  }
  uint64_t v15 = [v10 maxLength];
  if (v15)
  {
    v16 = (void *)v15;
    [v10 maxLength];
    id v34 = a5;
    id v17 = v10;
    v18 = self;
    id v19 = v12;
    v20 = v14;
    v22 = id v21 = v11;
    unsigned int v23 = [v22 unsignedIntValue];

    id v11 = v21;
    v14 = v20;
    id v12 = v19;
    self = v18;
    id v10 = v17;
    a5 = v34;

    if (v23 >= 0x101)
    {
      v24 = sub_100083F74();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = sub_100083FD0(0);
        *(_DWORD *)buf = 138543362;
        v37 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@### Value of maxLength exceeds maximum allowed value", buf, 0xCu);
      }
      v26 = sub_100083F74();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = sub_100083FD0(0);
        *(_DWORD *)buf = 138543362;
        v37 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@### Unable to initialize metadata because of invalid arguments", buf, 0xCu);
      }
      goto LABEL_12;
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)HAPCharacteristicMetadata;
  v29 = [(HAPCharacteristicMetadata *)&v35 init];
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_manufacturerDescription, a4);
    objc_storeStrong((id *)&v30->_format, a5);
    objc_storeStrong((id *)&v30->_units, a6);
    uint64_t v31 = [(HAPCharacteristicMetadata *)v30 _generateValidConstraints:v10];
    constraints = v30->_constraints;
    v30->_constraints = (HAPMetadataConstraints *)v31;
  }
  self = v30;
  v28 = self;
LABEL_16:

  return v28;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v10.receiver = self;
  v10.super_class = (Class)HAPCharacteristicMetadata;
  v4 = [(HAPCharacteristicMetadata *)&v10 description];
  [v3 appendFormat:@"%@  ", v4];

  v5 = [(HAPCharacteristicMetadata *)self constraints];
  [v3 appendFormat:@"Constraints: %@  ", v5];

  v6 = [(HAPCharacteristicMetadata *)self manufacturerDescription];
  [v3 appendFormat:@"Description: %@  ", v6];

  v7 = [(HAPCharacteristicMetadata *)self format];
  [v3 appendFormat:@"Format: %@  ", v7];

  v8 = [(HAPCharacteristicMetadata *)self units];
  [v3 appendFormat:@"Units: %@  ", v8];

  return v3;
}

- (id)_generateValidConstraints:(id)a3
{
  v4 = (HAPMetadataConstraints *)a3;
  v5 = [(HAPCharacteristicMetadata *)self format];
  unsigned int v6 = [v5 isEqualToString:@"string"];

  v7 = v4;
  if (v6)
  {
    v7 = v4;
    if (!v4) {
      v7 = objc_alloc_init(HAPMetadataConstraints);
    }
    v8 = [(HAPMetadataConstraints *)v7 maxLength];

    if (!v8)
    {
      v9 = +[NSNumber numberWithUnsignedInteger:64];
      [(HAPMetadataConstraints *)v7 setMaxLength:v9];
    }
  }
  objc_super v10 = [(HAPMetadataConstraints *)v7 minimumValue];
  if (v10) {
    goto LABEL_11;
  }
  objc_super v10 = [(HAPMetadataConstraints *)v7 maximumValue];
  if (v10
    || ([(HAPMetadataConstraints *)v7 stepValue], (objc_super v10 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(HAPMetadataConstraints *)v7 minLength], (objc_super v10 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(HAPMetadataConstraints *)v7 maxLength], (objc_super v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_11:

LABEL_12:
    id v11 = v7;
    goto LABEL_13;
  }
  id v13 = [(HAPMetadataConstraints *)v7 validValues];
  id v14 = [v13 count];

  if (v14) {
    goto LABEL_12;
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (BOOL)isEqualToCharacteristicMetadata:(id)a3
{
  v4 = (HAPCharacteristicMetadata *)a3;
  if (self == v4)
  {
    unsigned __int8 v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    v5 = [(HAPCharacteristicMetadata *)self manufacturerDescription];
    unsigned int v6 = [(HAPCharacteristicMetadata *)v4 manufacturerDescription];
    char v7 = sub_1000830F4((unint64_t)v5, (uint64_t)v6);

    if (v7) {
      goto LABEL_6;
    }
    v8 = [(HAPCharacteristicMetadata *)self format];
    v9 = [(HAPCharacteristicMetadata *)v4 format];
    char v10 = sub_1000830F4((unint64_t)v8, (uint64_t)v9);

    if ((v10 & 1) != 0
      || ([(HAPCharacteristicMetadata *)self units],
          id v11 = objc_claimAutoreleasedReturnValue(),
          [(HAPCharacteristicMetadata *)v4 units],
          id v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = sub_1000830F4((unint64_t)v11, (uint64_t)v12),
          v12,
          v11,
          (v13 & 1) != 0))
    {
LABEL_6:
      unsigned __int8 v14 = 0;
    }
    else
    {
      v16 = [(HAPCharacteristicMetadata *)self constraints];
      uint64_t v17 = [(HAPCharacteristicMetadata *)v4 constraints];
      if (v16 == (void *)v17)
      {
        unsigned __int8 v14 = 1;
        v18 = v16;
      }
      else
      {
        v18 = (void *)v17;
        id v19 = [(HAPCharacteristicMetadata *)self constraints];
        v20 = [(HAPCharacteristicMetadata *)v4 constraints];
        unsigned __int8 v14 = [v19 isEqualToMetadataConstraints:v20];
      }
    }
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  if (v5)
  {
    unsigned int v6 = [(HAPCharacteristicMetadata *)self constraints];
    id v7 = [v6 copyWithZone:a3];
    v8 = (void *)v5[1];
    v5[1] = v7;

    v9 = [(HAPCharacteristicMetadata *)self manufacturerDescription];
    id v10 = [v9 copyWithZone:a3];
    id v11 = (void *)v5[2];
    v5[2] = v10;

    id v12 = [(HAPCharacteristicMetadata *)self format];
    id v13 = [v12 copyWithZone:a3];
    unsigned __int8 v14 = (void *)v5[3];
    v5[3] = v13;

    uint64_t v15 = [(HAPCharacteristicMetadata *)self units];
    id v16 = [v15 copyWithZone:a3];
    uint64_t v17 = (void *)v5[4];
    v5[4] = v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HAPCharacteristicMetadata *)self constraints];
  [v4 encodeObject:v5 forKey:@"MC"];

  unsigned int v6 = [(HAPCharacteristicMetadata *)self manufacturerDescription];
  [v4 encodeObject:v6 forKey:@"MD"];

  id v7 = [(HAPCharacteristicMetadata *)self format];
  [v4 encodeObject:v7 forKey:@"MF"];

  id v8 = [(HAPCharacteristicMetadata *)self units];
  [v4 encodeObject:v8 forKey:@"MU"];
}

- (HAPCharacteristicMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HAPCharacteristicMetadata;
  v5 = [(HAPCharacteristicMetadata *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MC"];
    constraints = v5->_constraints;
    v5->_constraints = (HAPMetadataConstraints *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MD"];
    manufacturerDescription = v5->_manufacturerDescription;
    v5->_manufacturerDescription = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MF"];
    format = v5->_format;
    v5->_format = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MU"];
    units = v5->_units;
    v5->_units = (NSString *)v12;
  }
  return v5;
}

- (HAPMetadataConstraints)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (NSString)manufacturerDescription
{
  return self->_manufacturerDescription;
}

- (void)setManufacturerDescription:(id)a3
{
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (NSString)units
{
  return self->_units;
}

- (void)setUnits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_manufacturerDescription, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end