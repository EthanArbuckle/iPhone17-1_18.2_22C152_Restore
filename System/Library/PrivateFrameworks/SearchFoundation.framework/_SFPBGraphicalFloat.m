@interface _SFPBGraphicalFloat
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBGraphicalFloat)initWithCGFloat:(double)a3;
- (_SFPBGraphicalFloat)initWithDictionary:(id)a3;
- (_SFPBGraphicalFloat)initWithJSON:(id)a3;
- (double)doubleValue;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setDoubleValue:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBGraphicalFloat

- (_SFPBGraphicalFloat)initWithCGFloat:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SFPBGraphicalFloat;
  v4 = [(_SFPBGraphicalFloat *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(_SFPBGraphicalFloat *)v4 setDoubleValue:a3];
    v6 = v5;
  }

  return v5;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (_SFPBGraphicalFloat)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBGraphicalFloat;
  v5 = [(_SFPBGraphicalFloat *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"doubleValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[_SFPBGraphicalFloat setDoubleValue:](v5, "setDoubleValue:");
    }
    v7 = v5;
  }
  return v5;
}

- (_SFPBGraphicalFloat)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBGraphicalFloat *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBGraphicalFloat *)self dictionaryRepresentation];
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
  if (self->_doubleValue != 0.0)
  {
    id v4 = NSNumber;
    [(_SFPBGraphicalFloat *)self doubleValue];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"doubleValue"];
  }
  return v3;
}

- (unint64_t)hash
{
  double doubleValue = self->_doubleValue;
  if (doubleValue == 0.0) {
    return 0;
  }
  double v3 = -doubleValue;
  if (doubleValue >= 0.0) {
    double v3 = self->_doubleValue;
  }
  long double v4 = floor(v3 + 0.5);
  double v5 = (v3 - v4) * 1.84467441e19;
  unint64_t result = 2654435761u * (unint64_t)fmod(v4, 1.84467441e19);
  if (v5 >= 0.0)
  {
    if (v5 > 0.0) {
      result += (unint64_t)v5;
    }
  }
  else
  {
    result -= (unint64_t)fabs(v5);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    double doubleValue = self->_doubleValue;
    [v4 doubleValue];
    BOOL v7 = doubleValue == v6;
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
  [(_SFPBGraphicalFloat *)self doubleValue];
  if (v4 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBGraphicalFloatReadFrom(self, (uint64_t)a3);
}

- (void)setDoubleValue:(double)a3
{
  self->_double doubleValue = a3;
}

@end