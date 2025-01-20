@interface _SFPBRFFont_RFSystemFont
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFFont_RFSystemFont)initWithDictionary:(id)a3;
- (_SFPBRFFont_RFSystemFont)initWithFacade:(id)a3;
- (_SFPBRFFont_RFSystemFont)initWithJSON:(id)a3;
- (float)size;
- (id)dictionaryRepresentation;
- (int)weight;
- (unint64_t)hash;
- (void)setSize:(float)a3;
- (void)setWeight:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFFont_RFSystemFont

- (_SFPBRFFont_RFSystemFont)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFFont_RFSystemFont *)self init];
  if (v5)
  {
    v6 = [v4 size];

    if (v6)
    {
      v7 = [v4 size];
      [v7 floatValue];
      -[_SFPBRFFont_RFSystemFont setSize:](v5, "setSize:");
    }
    if ([v4 hasWeight]) {
      -[_SFPBRFFont_RFSystemFont setWeight:](v5, "setWeight:", [v4 weight]);
    }
    v8 = v5;
  }

  return v5;
}

- (int)weight
{
  return self->_weight;
}

- (float)size
{
  return self->_size;
}

- (_SFPBRFFont_RFSystemFont)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBRFFont_RFSystemFont;
  v5 = [(_SFPBRFFont_RFSystemFont *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"size"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[_SFPBRFFont_RFSystemFont setSize:](v5, "setSize:");
    }
    v7 = [v4 objectForKeyedSubscript:@"weight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFFont_RFSystemFont setWeight:](v5, "setWeight:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (_SFPBRFFont_RFSystemFont)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFFont_RFSystemFont *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFFont_RFSystemFont *)self dictionaryRepresentation];
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
  if (self->_size != 0.0)
  {
    id v4 = NSNumber;
    [(_SFPBRFFont_RFSystemFont *)self size];
    v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"size"];
  }
  if (self->_weight)
  {
    uint64_t v6 = [(_SFPBRFFont_RFSystemFont *)self weight];
    if (v6 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = off_1E5A2ED30[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"weight"];
  }
  return v3;
}

- (unint64_t)hash
{
  float size = self->_size;
  BOOL v4 = size < 0.0;
  if (size == 0.0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    double v5 = size;
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
  return (2654435761 * self->_weight) ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (float size = self->_size, [v4 size], size == v6))
  {
    int weight = self->_weight;
    BOOL v7 = weight == [v4 weight];
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
  [(_SFPBRFFont_RFSystemFont *)self size];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_SFPBRFFont_RFSystemFont *)self weight]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFFont_RFSystemFontReadFrom(self, (uint64_t)a3, v3);
}

- (void)setWeight:(int)a3
{
  self->_int weight = a3;
}

- (void)setSize:(float)a3
{
  self->_float size = a3;
}

@end