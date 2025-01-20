@interface _SFPBRFRGBValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFRGBValue)initWithDictionary:(id)a3;
- (_SFPBRFRGBValue)initWithFacade:(id)a3;
- (_SFPBRFRGBValue)initWithJSON:(id)a3;
- (float)blue;
- (float)green;
- (float)red;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setBlue:(float)a3;
- (void)setGreen:(float)a3;
- (void)setRed:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFRGBValue

- (_SFPBRFRGBValue)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFRGBValue *)self init];
  if (v5)
  {
    v6 = [v4 red];

    if (v6)
    {
      v7 = [v4 red];
      [v7 floatValue];
      -[_SFPBRFRGBValue setRed:](v5, "setRed:");
    }
    v8 = [v4 green];

    if (v8)
    {
      v9 = [v4 green];
      [v9 floatValue];
      -[_SFPBRFRGBValue setGreen:](v5, "setGreen:");
    }
    v10 = [v4 blue];

    if (v10)
    {
      v11 = [v4 blue];
      [v11 floatValue];
      -[_SFPBRFRGBValue setBlue:](v5, "setBlue:");
    }
    v12 = v5;
  }

  return v5;
}

- (float)blue
{
  return self->_blue;
}

- (float)green
{
  return self->_green;
}

- (float)red
{
  return self->_red;
}

- (_SFPBRFRGBValue)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBRFRGBValue;
  v5 = [(_SFPBRFRGBValue *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"red"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[_SFPBRFRGBValue setRed:](v5, "setRed:");
    }
    v7 = [v4 objectForKeyedSubscript:@"green"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[_SFPBRFRGBValue setGreen:](v5, "setGreen:");
    }
    v8 = [v4 objectForKeyedSubscript:@"blue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[_SFPBRFRGBValue setBlue:](v5, "setBlue:");
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBRFRGBValue)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFRGBValue *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFRGBValue *)self dictionaryRepresentation];
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
  if (self->_blue != 0.0)
  {
    id v4 = NSNumber;
    [(_SFPBRFRGBValue *)self blue];
    v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"blue"];
  }
  if (self->_green != 0.0)
  {
    v6 = NSNumber;
    [(_SFPBRFRGBValue *)self green];
    uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"green"];
  }
  if (self->_red != 0.0)
  {
    v8 = NSNumber;
    [(_SFPBRFRGBValue *)self red];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"red"];
  }
  return v3;
}

- (unint64_t)hash
{
  float red = self->_red;
  BOOL v4 = red < 0.0;
  if (red == 0.0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    double v5 = red;
    double v6 = -v5;
    if (!v4) {
      double v6 = v5;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v9 += (unint64_t)v8;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v8);
    }
  }
  float green = self->_green;
  BOOL v11 = green < 0.0;
  if (green == 0.0)
  {
    unint64_t v16 = 0;
  }
  else
  {
    double v12 = green;
    double v13 = -v12;
    if (!v11) {
      double v13 = v12;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v16 += (unint64_t)v15;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v15);
    }
  }
  float blue = self->_blue;
  BOOL v18 = blue < 0.0;
  if (blue == 0.0)
  {
    unint64_t v23 = 0;
  }
  else
  {
    double v19 = blue;
    double v20 = -v19;
    if (!v18) {
      double v20 = v19;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v23 += (unint64_t)v22;
      }
    }
    else
    {
      v23 -= (unint64_t)fabs(v22);
    }
  }
  return v16 ^ v9 ^ v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (float red = self->_red, [v4 red], red == v6)
    && (float green = self->_green, [v4 green], green == v8))
  {
    float blue = self->_blue;
    [v4 blue];
    BOOL v9 = blue == v12;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  [(_SFPBRFRGBValue *)self red];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_SFPBRFRGBValue *)self green];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_SFPBRFRGBValue *)self blue];
  float v6 = v8;
  if (v7 != 0.0)
  {
    PBDataWriterWriteFloatField();
    float v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFRGBValueReadFrom(self, (uint64_t)a3, v3);
}

- (void)setBlue:(float)a3
{
  self->_float blue = a3;
}

- (void)setGreen:(float)a3
{
  self->_float green = a3;
}

- (void)setRed:(float)a3
{
  self->_float red = a3;
}

@end