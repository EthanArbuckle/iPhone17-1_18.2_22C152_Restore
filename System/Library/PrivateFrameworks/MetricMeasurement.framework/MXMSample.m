@interface MXMSample
+ (BOOL)supportsSecureCoding;
- (MXMSample)initWithCoder:(id)a3;
- (MXMSample)initWithTag:(id)a3 attributes:(id)a4 doubleValue:(double)a5;
- (MXMSample)initWithTag:(id)a3 attributes:(id)a4 doubleValue:(double)a5 unit:(id)a6;
- (MXMSample)initWithTag:(id)a3 attributes:(id)a4 doubleValue:(double)a5 unit:(id)a6 timestamp:(unint64_t)a7;
- (MXMSample)initWithTag:(id)a3 attributes:(id)a4 pixelBufferValue:(__CVBuffer *)a5;
- (MXMSampleTag)tag;
- (NSData)date;
- (NSMeasurement)asMeasurementValue;
- (NSNumber)asNumberValue;
- (NSSet)attributes;
- (NSString)shortDesc;
- (NSUnit)unit;
- (double)floatValue;
- (id)attributeWithName:(id)a3;
- (id)convertToUnit:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)integerValue;
- (unint64_t)length;
- (unint64_t)timestamp;
- (unint64_t)unsignedValue;
- (unint64_t)valueType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXMSample

- (NSMeasurement)asMeasurementValue
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  v4 = [(MXMSample *)self asNumberValue];
  [v4 doubleValue];
  double v6 = v5;
  v7 = [(MXMSample *)self unit];
  v8 = (void *)[v3 initWithDoubleValue:v7 unit:v6];

  return (NSMeasurement *)v8;
}

- (NSNumber)asNumberValue
{
  unint64_t v3 = [(MXMSample *)self valueType];
  if (v3 == 2)
  {
    double v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MXMSample unsignedValue](self, "unsignedValue"));
  }
  else if (v3 == 1)
  {
    double v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[MXMSample integerValue](self, "integerValue"));
  }
  else if (v3)
  {
    double v5 = 0;
  }
  else
  {
    v4 = NSNumber;
    [(MXMSample *)self floatValue];
    double v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  return (NSNumber *)v5;
}

- (NSString)shortDesc
{
  [(MXMSample *)self floatValue];
  uint64_t v4 = v3;
  double v5 = NSString;
  double v6 = [(MXMSample *)self unit];
  v7 = [v6 symbol];
  v8 = [v5 stringWithFormat:@"%0.3f %@", v4, v7];

  return (NSString *)v8;
}

- (NSUnit)unit
{
  return self->_unit;
}

- (double)floatValue
{
  double result = 0.0;
  if (self->_underlyingValueLength >= 8) {
    return *(double *)[(NSData *)self->_underlyingValue bytes];
  }
  return result;
}

- (int64_t)integerValue
{
  if (self->_underlyingValueLength >= 8) {
    return *(void *)[(NSData *)self->_underlyingValue bytes];
  }
  else {
    return 0;
  }
}

- (unint64_t)unsignedValue
{
  if (self->_underlyingValueLength >= 8) {
    return *(void *)[(NSData *)self->_underlyingValue bytes];
  }
  else {
    return 0;
  }
}

- (id)attributeWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = self->_attributes;
  id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "name", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (MXMSample)initWithTag:(id)a3 attributes:(id)a4 doubleValue:(double)a5
{
  return [(MXMSample *)self initWithTag:a3 attributes:a4 doubleValue:0 unit:a5];
}

- (MXMSample)initWithTag:(id)a3 attributes:(id)a4 doubleValue:(double)a5 unit:(id)a6
{
  return [(MXMSample *)self initWithTag:a3 attributes:a4 doubleValue:a6 unit:0 timestamp:a5];
}

- (MXMSample)initWithTag:(id)a3 attributes:(id)a4 doubleValue:(double)a5 unit:(id)a6 timestamp:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  double v22 = a5;
  id v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MXMSample;
  long long v16 = [(MXMSample *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_unit, a6);
    objc_storeStrong((id *)&v17->_tag, a3);
    objc_storeStrong((id *)&v17->_attributes, a4);
    v17->_underlyingValueLength = 8;
    uint64_t v18 = [MEMORY[0x263EFF8F8] dataWithBytes:&v22 length:8];
    underlyingValue = v17->_underlyingValue;
    v17->_underlyingValue = (NSData *)v18;

    v17->_timestamp = a7;
  }

  return v17;
}

- (MXMSample)initWithTag:(id)a3 attributes:(id)a4 pixelBufferValue:(__CVBuffer *)a5
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  tag = self->_tag;
  id v5 = a3;
  [v5 encodeObject:tag forKey:@"tag"];
  [v5 encodeObject:self->_unit forKey:@"unit"];
  objc_msgSend(v5, "encodeBytes:length:forKey:", -[NSData bytes](self->_underlyingValue, "bytes"), self->_underlyingValueLength, @"underlyingValue");
}

- (MXMSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MXMSample;
  id v5 = [(MXMSample *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tag"];
    tag = v5->_tag;
    v5->_tag = (MXMSampleTag *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unit"];
    unit = v5->_unit;
    v5->_unit = (NSUnit *)v8;

    unint64_t v15 = 0;
    v10 = (void *)MEMORY[0x263EFF8F8];
    uint64_t v11 = [v4 decodeBytesForKey:@"underlyingValue" returnedLength:&v15];
    uint64_t v12 = [v10 dataWithBytes:v11 length:v15];
    underlyingValue = v5->_underlyingValue;
    v5->_underlyingValue = (NSData *)v12;

    v5->_underlyingValueLength = v15;
  }

  return v5;
}

- (id)copy
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MXMSampleTag *)self->_tag domainNameString];
  [(MXMSample *)self floatValue];
  uint64_t v8 = v7;
  v9 = [(NSUnit *)self->_unit symbol];
  v10 = [v3 stringWithFormat:@"<%@: %p '%@' %f %@>", v5, self, v6, v8, v9];

  return v10;
}

- (id)convertToUnit:(id)a3
{
  id v4 = a3;
  id v5 = [(MXMSample *)self unit];

  if (v5)
  {
    uint64_t v6 = [(MXMSample *)self asMeasurementValue];
    uint64_t v7 = [v6 measurementByConvertingToUnit:v4];
    uint64_t v8 = [MXMSample alloc];
    v9 = [(MXMSample *)self tag];
    v10 = [(MXMSample *)self attributes];
    [v7 doubleValue];
    uint64_t v11 = -[MXMSample initWithTag:attributes:doubleValue:unit:](v8, "initWithTag:attributes:doubleValue:unit:", v9, v10, v4);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (NSData)date
{
  return self->_date;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSSet)attributes
{
  return self->_attributes;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (unint64_t)length
{
  return self->_length;
}

- (MXMSampleTag)tag
{
  return self->_tag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_underlyingValue, 0);
  objc_storeStrong((id *)&self->_unit, 0);
}

@end