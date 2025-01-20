@interface HAPMetadataConstraints
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualToMetadataConstraints:(id)a3;
- (HAPMetadataConstraints)initWithCoder:(id)a3;
- (NSArray)validValues;
- (NSNumber)maxLength;
- (NSNumber)maximumValue;
- (NSNumber)minLength;
- (NSNumber)minimumValue;
- (NSNumber)stepValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxLength:(id)a3;
- (void)setMaximumValue:(id)a3;
- (void)setMinLength:(id)a3;
- (void)setMinimumValue:(id)a3;
- (void)setStepValue:(id)a3;
- (void)setValidValues:(id)a3;
@end

@implementation HAPMetadataConstraints

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithString:@"[ Constraints:"];
  v4 = [(HAPMetadataConstraints *)self minimumValue];

  if (v4)
  {
    v5 = [(HAPMetadataConstraints *)self minimumValue];
    [v5 doubleValue];
    [v3 appendFormat:@"%@%@%.2f", @" ", @"Min: ", v6];

    int v7 = 1;
  }
  else
  {
    int v7 = 0;
  }
  v8 = [(HAPMetadataConstraints *)self maximumValue];

  if (v8)
  {
    ++v7;
    if (v4) {
      CFStringRef v9 = @", ";
    }
    else {
      CFStringRef v9 = @" ";
    }
    v10 = [(HAPMetadataConstraints *)self maximumValue];
    [v10 doubleValue];
    [v3 appendFormat:@"%@%@%.2f", v9, @"Max: ", v11];
  }
  v12 = [(HAPMetadataConstraints *)self stepValue];

  if (v12)
  {
    int v13 = v7 + 1;
    if (v7) {
      CFStringRef v14 = @", ";
    }
    else {
      CFStringRef v14 = @" ";
    }
    v15 = [(HAPMetadataConstraints *)self stepValue];
    [v15 doubleValue];
    [v3 appendFormat:@"%@%@%.2f", v14, @"Step: ", v16];

    int v7 = v13;
  }
  v17 = [(HAPMetadataConstraints *)self minLength];

  if (v17)
  {
    int v18 = v7 + 1;
    if (v7) {
      CFStringRef v19 = @", ";
    }
    else {
      CFStringRef v19 = @" ";
    }
    v20 = [(HAPMetadataConstraints *)self minLength];
    [v3 appendFormat:@"%@%@%u", v19, @"Min length: ", [v20 unsignedIntValue]];

    int v7 = v18;
  }
  v21 = [(HAPMetadataConstraints *)self maxLength];

  if (v21)
  {
    if (v7) {
      CFStringRef v22 = @", ";
    }
    else {
      CFStringRef v22 = @" ";
    }
    v23 = [(HAPMetadataConstraints *)self maxLength];
    [v3 appendFormat:@"%@%@%u", v22, @"Max length: ", [v23 unsignedIntValue]];

    int v7 = 1;
  }
  v24 = [(HAPMetadataConstraints *)self validValues];
  id v25 = [v24 count];

  if (v25)
  {
    if (v7) {
      CFStringRef v26 = @", ";
    }
    else {
      CFStringRef v26 = @" ";
    }
    [v3 appendFormat:@"%@%@", v26, @"Valid Values: "];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v27 = [(HAPMetadataConstraints *)self validValues];
    id v28 = [v27 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v34;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(v27);
          }
          [v3 appendFormat:@"%@, ", *(void *)(*((void *)&v33 + 1) + 8 * i)];
        }
        id v29 = [v27 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v29);
    }
  }
  [v3 appendString:@" ]"];

  return v3;
}

- (BOOL)isEqualToMetadataConstraints:(id)a3
{
  v4 = (HAPMetadataConstraints *)a3;
  if (self == v4)
  {
    char v20 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    v5 = [(HAPMetadataConstraints *)self minimumValue];
    uint64_t v6 = [(HAPMetadataConstraints *)v4 minimumValue];
    char v7 = sub_100083128(v5, v6);

    if (v7) {
      goto LABEL_8;
    }
    v8 = [(HAPMetadataConstraints *)self maximumValue];
    CFStringRef v9 = [(HAPMetadataConstraints *)v4 maximumValue];
    char v10 = sub_100083128(v8, v9);

    if (v10) {
      goto LABEL_8;
    }
    uint64_t v11 = [(HAPMetadataConstraints *)self stepValue];
    v12 = [(HAPMetadataConstraints *)v4 stepValue];
    char v13 = sub_100083128(v11, v12);

    if (v13) {
      goto LABEL_8;
    }
    CFStringRef v14 = [(HAPMetadataConstraints *)self minLength];
    v15 = [(HAPMetadataConstraints *)v4 minLength];
    char v16 = sub_100083128(v14, v15);

    if ((v16 & 1) != 0
      || ([(HAPMetadataConstraints *)self maxLength],
          v17 = objc_claimAutoreleasedReturnValue(),
          [(HAPMetadataConstraints *)v4 maxLength],
          int v18 = objc_claimAutoreleasedReturnValue(),
          char v19 = sub_100083128(v17, v18),
          v18,
          v17,
          (v19 & 1) != 0))
    {
LABEL_8:
      char v20 = 0;
    }
    else
    {
      CFStringRef v22 = [(HAPMetadataConstraints *)self validValues];
      v23 = [(HAPMetadataConstraints *)v4 validValues];
      char v24 = sub_1000831E0((unint64_t)v22, (uint64_t)v23);

      char v20 = v24 ^ 1;
    }
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  if (v5)
  {
    uint64_t v6 = [(HAPMetadataConstraints *)self minimumValue];
    id v7 = [v6 copyWithZone:a3];
    v8 = (void *)v5[1];
    v5[1] = v7;

    CFStringRef v9 = [(HAPMetadataConstraints *)self maximumValue];
    id v10 = [v9 copyWithZone:a3];
    uint64_t v11 = (void *)v5[2];
    v5[2] = v10;

    v12 = [(HAPMetadataConstraints *)self stepValue];
    id v13 = [v12 copyWithZone:a3];
    CFStringRef v14 = (void *)v5[3];
    v5[3] = v13;

    v15 = [(HAPMetadataConstraints *)self minLength];
    id v16 = [v15 copyWithZone:a3];
    v17 = (void *)v5[4];
    v5[4] = v16;

    int v18 = [(HAPMetadataConstraints *)self maxLength];
    id v19 = [v18 copyWithZone:a3];
    char v20 = (void *)v5[5];
    v5[5] = v19;

    v21 = [(HAPMetadataConstraints *)self validValues];
    id v22 = [v21 copyWithZone:a3];
    v23 = (void *)v5[6];
    v5[6] = v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HAPMetadataConstraints *)self minimumValue];
  [v4 encodeObject:v5 forKey:@"CMinV"];

  uint64_t v6 = [(HAPMetadataConstraints *)self maximumValue];
  [v4 encodeObject:v6 forKey:@"CMaxV"];

  id v7 = [(HAPMetadataConstraints *)self stepValue];
  [v4 encodeObject:v7 forKey:@"CSV"];

  v8 = [(HAPMetadataConstraints *)self minLength];
  [v4 encodeObject:v8 forKey:@"CMinL"];

  CFStringRef v9 = [(HAPMetadataConstraints *)self maxLength];
  [v4 encodeObject:v9 forKey:@"CMaxL"];

  id v10 = [(HAPMetadataConstraints *)self validValues];
  [v4 encodeObject:v10 forKey:@"CVV"];
}

- (HAPMetadataConstraints)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HAPMetadataConstraints;
  v5 = [(HAPMetadataConstraints *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMinV"];
    minimumValue = v5->_minimumValue;
    v5->_minimumValue = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMaxV"];
    maximumValue = v5->_maximumValue;
    v5->_maximumValue = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSV"];
    stepValue = v5->_stepValue;
    v5->_stepValue = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMinL"];
    minLength = v5->_minLength;
    v5->_minLength = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMaxL"];
    maxLength = v5->_maxLength;
    v5->_maxLength = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"CVV"];
    validValues = v5->_validValues;
    v5->_validValues = (NSArray *)v16;
  }
  return v5;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(id)a3
{
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(id)a3
{
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (void)setStepValue:(id)a3
{
}

- (NSNumber)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(id)a3
{
}

- (NSNumber)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(id)a3
{
}

- (NSArray)validValues
{
  return self->_validValues;
}

- (void)setValidValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_maxLength, 0);
  objc_storeStrong((id *)&self->_minLength, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);

  objc_storeStrong((id *)&self->_minimumValue, 0);
}

@end