@interface _SFPBRFMapPoint
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFMapPoint)initWithDictionary:(id)a3;
- (_SFPBRFMapPoint)initWithFacade:(id)a3;
- (_SFPBRFMapPoint)initWithJSON:(id)a3;
- (double)x;
- (double)y;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFMapPoint

- (_SFPBRFMapPoint)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFMapPoint *)self init];
  if (v5)
  {
    if ([v4 hasX])
    {
      [v4 x];
      -[_SFPBRFMapPoint setX:](v5, "setX:");
    }
    if ([v4 hasY])
    {
      [v4 y];
      -[_SFPBRFMapPoint setY:](v5, "setY:");
    }
    v6 = v5;
  }

  return v5;
}

- (double)y
{
  return self->_y;
}

- (double)x
{
  return self->_x;
}

- (_SFPBRFMapPoint)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBRFMapPoint;
  v5 = [(_SFPBRFMapPoint *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"x"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[_SFPBRFMapPoint setX:](v5, "setX:");
    }
    v7 = [v4 objectForKeyedSubscript:@"y"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[_SFPBRFMapPoint setY:](v5, "setY:");
    }
    v8 = v5;
  }
  return v5;
}

- (_SFPBRFMapPoint)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFMapPoint *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFMapPoint *)self dictionaryRepresentation];
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
  if (self->_x != 0.0)
  {
    id v4 = NSNumber;
    [(_SFPBRFMapPoint *)self x];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"x"];
  }
  if (self->_y != 0.0)
  {
    v6 = NSNumber;
    [(_SFPBRFMapPoint *)self y];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"y"];
  }
  return v3;
}

- (unint64_t)hash
{
  double x = self->_x;
  if (x == 0.0)
  {
    unint64_t v7 = 0;
  }
  else
  {
    double v4 = -x;
    if (x >= 0.0) {
      double v4 = self->_x;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0) {
        v7 += (unint64_t)v6;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  double y = self->_y;
  if (y == 0.0)
  {
    unint64_t v12 = 0;
  }
  else
  {
    double v9 = -y;
    if (y >= 0.0) {
      double v9 = self->_y;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v12 += (unint64_t)v11;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v11);
    }
  }
  return v12 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (double x = self->_x, [v4 x], x == v6))
  {
    double y = self->_y;
    [v4 y];
    BOOL v7 = y == v9;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  [(_SFPBRFMapPoint *)self x];
  if (v4 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  [(_SFPBRFMapPoint *)self y];
  if (v5 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFMapPointReadFrom(self, (uint64_t)a3);
}

- (void)setY:(double)a3
{
  self->_double y = a3;
}

- (void)setX:(double)a3
{
  self->_double x = a3;
}

@end