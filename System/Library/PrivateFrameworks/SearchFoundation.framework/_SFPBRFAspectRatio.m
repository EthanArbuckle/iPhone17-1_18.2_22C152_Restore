@interface _SFPBRFAspectRatio
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFAspectRatio)initWithDictionary:(id)a3;
- (_SFPBRFAspectRatio)initWithFacade:(id)a3;
- (_SFPBRFAspectRatio)initWithJSON:(id)a3;
- (float)height;
- (float)width;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setHeight:(float)a3;
- (void)setWidth:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFAspectRatio

- (_SFPBRFAspectRatio)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFAspectRatio *)self init];
  if (v5)
  {
    v6 = [v4 width];

    if (v6)
    {
      v7 = [v4 width];
      [v7 floatValue];
      -[_SFPBRFAspectRatio setWidth:](v5, "setWidth:");
    }
    v8 = [v4 height];

    if (v8)
    {
      v9 = [v4 height];
      [v9 floatValue];
      -[_SFPBRFAspectRatio setHeight:](v5, "setHeight:");
    }
    v10 = v5;
  }

  return v5;
}

- (float)height
{
  return self->_height;
}

- (float)width
{
  return self->_width;
}

- (_SFPBRFAspectRatio)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBRFAspectRatio;
  v5 = [(_SFPBRFAspectRatio *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"width"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[_SFPBRFAspectRatio setWidth:](v5, "setWidth:");
    }
    v7 = [v4 objectForKeyedSubscript:@"height"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[_SFPBRFAspectRatio setHeight:](v5, "setHeight:");
    }
    v8 = v5;
  }
  return v5;
}

- (_SFPBRFAspectRatio)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFAspectRatio *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFAspectRatio *)self dictionaryRepresentation];
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
  if (self->_height != 0.0)
  {
    id v4 = NSNumber;
    [(_SFPBRFAspectRatio *)self height];
    v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"height"];
  }
  if (self->_width != 0.0)
  {
    v6 = NSNumber;
    [(_SFPBRFAspectRatio *)self width];
    uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"width"];
  }
  return v3;
}

- (unint64_t)hash
{
  float width = self->_width;
  BOOL v4 = width < 0.0;
  if (width == 0.0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    double v5 = width;
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
  float height = self->_height;
  BOOL v11 = height < 0.0;
  if (height == 0.0)
  {
    unint64_t v16 = 0;
  }
  else
  {
    double v12 = height;
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
  return v16 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (float width = self->_width, [v4 width], width == v6))
  {
    float height = self->_height;
    [v4 height];
    BOOL v7 = height == v9;
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
  [(_SFPBRFAspectRatio *)self width];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_SFPBRFAspectRatio *)self height];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFAspectRatioReadFrom(self, (uint64_t)a3, v3);
}

- (void)setHeight:(float)a3
{
  self->_float height = a3;
}

- (void)setWidth:(float)a3
{
  self->_float width = a3;
}

@end