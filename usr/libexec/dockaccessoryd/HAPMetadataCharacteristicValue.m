@interface HAPMetadataCharacteristicValue
+ (id)initWithDictionary:(id)a3;
- (HAPMetadataCharacteristicValue)initWithMinLength:(id)a3 maxLength:(id)a4;
- (HAPMetadataCharacteristicValue)initWithMinValue:(id)a3 maxValue:(id)a4 stepValue:(id)a5 validValues:(id)a6;
- (NSArray)validValues;
- (NSNumber)maxLength;
- (NSNumber)maxValue;
- (NSNumber)minLength;
- (NSNumber)minValue;
- (NSNumber)stepValue;
- (id)description;
- (id)generateDictionary;
- (void)dump;
- (void)setMaxLength:(id)a3;
- (void)setMaxValue:(id)a3;
- (void)setMinLength:(id)a3;
- (void)setMinValue:(id)a3;
- (void)setStepValue:(id)a3;
@end

@implementation HAPMetadataCharacteristicValue

- (HAPMetadataCharacteristicValue)initWithMinLength:(id)a3 maxLength:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (v7 | v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)HAPMetadataCharacteristicValue;
    v9 = [(HAPMetadataCharacteristicValue *)&v13 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_minLength, a3);
      v11 = (NSNumber *)(id)v8;
      self = (HAPMetadataCharacteristicValue *)v10->_maxLength;
      v10->_maxLength = v11;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HAPMetadataCharacteristicValue)initWithMinValue:(id)a3 maxValue:(id)a4 stepValue:(id)a5 validValues:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11 || v12 || v13)
  {
    v19.receiver = self;
    v19.super_class = (Class)HAPMetadataCharacteristicValue;
    v16 = [(HAPMetadataCharacteristicValue *)&v19 init];
    v15 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_minValue, a3);
      objc_storeStrong((id *)&v15->_maxValue, a4);
      objc_storeStrong((id *)&v15->_stepValue, a5);
      v17 = (NSArray *)v14;
      self = (HAPMetadataCharacteristicValue *)v15->_validValues;
      v15->_validValues = v17;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)initWithDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 hmf_numberForKey:@"MinLength"];
  uint64_t v5 = [v3 hmf_numberForKey:@"MaxLength"];
  if (v4 | v5) {
    v6 = [[HAPMetadataCharacteristicValue alloc] initWithMinLength:v4 maxLength:v5];
  }
  else {
    v6 = 0;
  }
  unint64_t v7 = [v3 hmf_numberForKey:@"MinValue"];
  unint64_t v8 = [v3 hmf_numberForKey:@"MaxValue"];
  v9 = [v3 hmf_numberForKey:@"StepValue"];
  v10 = [v3 hmf_arrayForKey:@"ValidValues"];
  if (v7 || v8 || v9)
  {
    if (v6)
    {
      id v11 = sub_100083F74();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v15 = sub_100083FD0(0);
        [v3 hmf_stringForKey:@"ShortUUID"];
        *(_DWORD *)buf = 138544898;
        v17 = v15;
        uint64_t v19 = v18 = 2112;
        id v12 = (void *)v19;
        __int16 v20 = 2112;
        uint64_t v21 = v4;
        __int16 v22 = 2112;
        uint64_t v23 = v5;
        __int16 v24 = 2112;
        v25 = v7;
        __int16 v26 = 2112;
        uint64_t v27 = v5;
        __int16 v28 = 2112;
        v29 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@Characteristic %@ has both length and value metadata: minLength %@  maxLength %@  minValue %@  maxValue %@  stepValue %@", buf, 0x48u);
      }
    }
    id v13 = [[HAPMetadataCharacteristicValue alloc] initWithMinValue:v7 maxValue:v8 stepValue:v9 validValues:v10];

    v6 = v13;
  }

  return v6;
}

- (id)generateDictionary
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = [(HAPMetadataCharacteristicValue *)self minLength];

  if (v4)
  {
    uint64_t v5 = [(HAPMetadataCharacteristicValue *)self minLength];
    [v3 setObject:v5 forKeyedSubscript:@"MinLength"];
  }
  v6 = [(HAPMetadataCharacteristicValue *)self maxLength];

  if (v6)
  {
    unint64_t v7 = [(HAPMetadataCharacteristicValue *)self maxLength];
    [v3 setObject:v7 forKeyedSubscript:@"MaxLength"];
  }
  unint64_t v8 = [(HAPMetadataCharacteristicValue *)self minValue];

  if (v8)
  {
    v9 = [(HAPMetadataCharacteristicValue *)self minValue];
    [v3 setObject:v9 forKeyedSubscript:@"MinValue"];
  }
  v10 = [(HAPMetadataCharacteristicValue *)self maxValue];

  if (v10)
  {
    id v11 = [(HAPMetadataCharacteristicValue *)self maxValue];
    [v3 setObject:v11 forKeyedSubscript:@"MaxValue"];
  }
  id v12 = [(HAPMetadataCharacteristicValue *)self stepValue];

  if (v12)
  {
    id v13 = [(HAPMetadataCharacteristicValue *)self stepValue];
    [v3 setObject:v13 forKeyedSubscript:@"StepValue"];
  }
  id v14 = [(HAPMetadataCharacteristicValue *)self validValues];
  id v15 = [v14 count];

  if (v15)
  {
    v16 = [(HAPMetadataCharacteristicValue *)self validValues];
    [v3 setObject:v16 forKeyedSubscript:@"ValidValues"];
  }

  return v3;
}

- (id)description
{
  id v3 = +[NSMutableString stringWithFormat:@"ValueMetadata"];
  uint64_t v4 = [(HAPMetadataCharacteristicValue *)self minLength];

  if (v4)
  {
    uint64_t v5 = [(HAPMetadataCharacteristicValue *)self minLength];
    [v3 appendFormat:@"  minLength:%@", v5];
  }
  v6 = [(HAPMetadataCharacteristicValue *)self maxLength];

  if (v6)
  {
    unint64_t v7 = [(HAPMetadataCharacteristicValue *)self maxLength];
    [v3 appendFormat:@"  maxLength:%@", v7];
  }
  unint64_t v8 = [(HAPMetadataCharacteristicValue *)self minValue];

  if (v8)
  {
    v9 = [(HAPMetadataCharacteristicValue *)self minValue];
    [v3 appendFormat:@"  minValue:%@", v9];
  }
  v10 = [(HAPMetadataCharacteristicValue *)self maxValue];

  if (v10)
  {
    id v11 = [(HAPMetadataCharacteristicValue *)self maxValue];
    [v3 appendFormat:@"  maxValue:%@", v11];
  }
  id v12 = [(HAPMetadataCharacteristicValue *)self stepValue];

  if (v12)
  {
    id v13 = [(HAPMetadataCharacteristicValue *)self stepValue];
    [v3 appendFormat:@"  stepValue:%@", v13];
  }
  id v14 = [(HAPMetadataCharacteristicValue *)self validValues];

  if (v14)
  {
    id v15 = [(HAPMetadataCharacteristicValue *)self validValues];
    [v3 appendFormat:@"  validValues:%@", v15];
  }

  return v3;
}

- (void)dump
{
  id v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = sub_100083FD0(0);
    uint64_t v5 = [(HAPMetadataCharacteristicValue *)self description];
    int v6 = 138543618;
    unint64_t v7 = v4;
    __int16 v8 = 2112;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@%@", (uint8_t *)&v6, 0x16u);
  }
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(id)a3
{
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_maxLength, 0);
  objc_storeStrong((id *)&self->_minLength, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);

  objc_storeStrong((id *)&self->_minValue, 0);
}

@end