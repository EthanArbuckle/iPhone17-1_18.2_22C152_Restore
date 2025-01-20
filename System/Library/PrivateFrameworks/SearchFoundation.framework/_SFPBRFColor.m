@interface _SFPBRFColor
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFColor)initWithDictionary:(id)a3;
- (_SFPBRFColor)initWithFacade:(id)a3;
- (_SFPBRFColor)initWithJSON:(id)a3;
- (_SFPBRFOptionalFloat)alpha;
- (_SFPBRFRGBValue)rgb_value;
- (id)dictionaryRepresentation;
- (int)name;
- (unint64_t)hash;
- (unint64_t)whichValue;
- (void)setAlpha:(id)a3;
- (void)setName:(int)a3;
- (void)setRgb_value:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFColor

- (_SFPBRFColor)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFColor *)self init];
  if (v5)
  {
    if (objc_msgSend(v4, "hasRgb_value"))
    {
      v6 = objc_msgSend(v4, "rgb_value");

      if (v6)
      {
        v7 = [_SFPBRFRGBValue alloc];
        v8 = objc_msgSend(v4, "rgb_value");
        v9 = [(_SFPBRFRGBValue *)v7 initWithFacade:v8];
        [(_SFPBRFColor *)v5 setRgb_value:v9];
      }
    }
    if ([v4 hasName]) {
      -[_SFPBRFColor setName:](v5, "setName:", [v4 name]);
    }
    v10 = [v4 alpha];

    if (v10)
    {
      v11 = [_SFPBRFOptionalFloat alloc];
      v12 = [v4 alpha];
      v13 = [(_SFPBRFOptionalFloat *)v11 initWithFacade:v12];
      [(_SFPBRFColor *)v5 setAlpha:v13];
    }
    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alpha, 0);
  objc_storeStrong((id *)&self->_rgb_value, 0);
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (_SFPBRFOptionalFloat)alpha
{
  return self->_alpha;
}

- (_SFPBRFColor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBRFColor;
  v5 = [(_SFPBRFColor *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"rgbValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFRGBValue alloc] initWithDictionary:v6];
      [(_SFPBRFColor *)v5 setRgb_value:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFColor setName:](v5, "setName:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"alpha"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[_SFPBRFOptionalFloat alloc] initWithDictionary:v9];
      [(_SFPBRFColor *)v5 setAlpha:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (_SFPBRFColor)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFColor *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFColor *)self dictionaryRepresentation];
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
  if (self->_alpha)
  {
    id v4 = [(_SFPBRFColor *)self alpha];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"alpha"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"alpha"];
    }
  }
  if (self->_name)
  {
    uint64_t v7 = [(_SFPBRFColor *)self name];
    if (v7 >= 0x12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E5A2EC40[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"name"];
  }
  if (self->_rgb_value)
  {
    v9 = [(_SFPBRFColor *)self rgb_value];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"rgbValue"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"rgbValue"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFRGBValue *)self->_rgb_value hash];
  uint64_t v4 = 2654435761 * self->_name;
  return v4 ^ v3 ^ [(_SFPBRFOptionalFloat *)self->_alpha hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  v5 = [(_SFPBRFColor *)self rgb_value];
  v6 = objc_msgSend(v4, "rgb_value");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_12;
  }
  uint64_t v7 = [(_SFPBRFColor *)self rgb_value];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFColor *)self rgb_value];
    v10 = objc_msgSend(v4, "rgb_value");
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  int name = self->_name;
  if (name != [v4 name]) {
    goto LABEL_13;
  }
  v5 = [(_SFPBRFColor *)self alpha];
  v6 = [v4 alpha];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v13 = [(_SFPBRFColor *)self alpha];
  if (!v13)
  {

LABEL_16:
    BOOL v18 = 1;
    goto LABEL_14;
  }
  v14 = (void *)v13;
  v15 = [(_SFPBRFColor *)self alpha];
  v16 = [v4 alpha];
  char v17 = [v15 isEqual:v16];

  if (v17) {
    goto LABEL_16;
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_SFPBRFColor *)self rgb_value];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFColor *)self name]) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(_SFPBRFColor *)self alpha];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFColorReadFrom(self, (uint64_t)a3);
}

- (void)setAlpha:(id)a3
{
}

- (int)name
{
  if (self->_whichValue == 2) {
    return self->_name;
  }
  else {
    return 0;
  }
}

- (void)setName:(int)a3
{
  rgb_value = self->_rgb_value;
  self->_rgb_value = 0;

  self->_whichValue = 2;
  self->_int name = a3;
}

- (_SFPBRFRGBValue)rgb_value
{
  if (self->_whichValue == 1) {
    v2 = self->_rgb_value;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRgb_value:(id)a3
{
  self->_int name = 0;
  self->_whichValue = a3 != 0;
  objc_storeStrong((id *)&self->_rgb_value, a3);
}

@end