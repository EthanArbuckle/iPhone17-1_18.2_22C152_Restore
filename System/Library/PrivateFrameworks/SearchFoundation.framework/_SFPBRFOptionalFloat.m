@interface _SFPBRFOptionalFloat
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFOptionalFloat)initWithDictionary:(id)a3;
- (_SFPBRFOptionalFloat)initWithFacade:(id)a3;
- (_SFPBRFOptionalFloat)initWithJSON:(id)a3;
- (float)value;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setValue:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFOptionalFloat

- (_SFPBRFOptionalFloat)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFOptionalFloat *)self init];
  if (v5)
  {
    v6 = [v4 value];

    if (v6)
    {
      v7 = [v4 value];
      [v7 floatValue];
      -[_SFPBRFOptionalFloat setValue:](v5, "setValue:");
    }
    v8 = v5;
  }

  return v5;
}

- (float)value
{
  return self->_value;
}

- (_SFPBRFOptionalFloat)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBRFOptionalFloat;
  v5 = [(_SFPBRFOptionalFloat *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[_SFPBRFOptionalFloat setValue:](v5, "setValue:");
    }
    v7 = v5;
  }
  return v5;
}

- (_SFPBRFOptionalFloat)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFOptionalFloat *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFOptionalFloat *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_value != 0.0)
  {
    id v4 = NSNumber;
    [(_SFPBRFOptionalFloat *)self value];
    v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"value"];
  }
  return v3;
}

- (unint64_t)hash
{
  float value = self->_value;
  BOOL v3 = value < 0.0;
  if (value == 0.0) {
    return 0;
  }
  double v4 = value;
  double v5 = -v4;
  if (!v3) {
    double v5 = v4;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t result = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      result += (unint64_t)v7;
    }
  }
  else
  {
    result -= (unint64_t)fabs(v7);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    float value = self->_value;
    [v4 value];
    BOOL v7 = value == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  [(_SFPBRFOptionalFloat *)self value];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFOptionalFloatReadFrom(self, (uint64_t)a3, v3);
}

- (void)setValue:(float)a3
{
  self->_float value = a3;
}

@end