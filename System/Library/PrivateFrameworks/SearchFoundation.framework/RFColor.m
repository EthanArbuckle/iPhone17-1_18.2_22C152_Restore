@interface RFColor
+ (BOOL)supportsSecureCoding;
- (BOOL)hasName;
- (BOOL)hasRgb_value;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFColor)initWithCoder:(id)a3;
- (RFColor)initWithProtobuf:(id)a3;
- (RFOptionalFloat)alpha;
- (RFRGBValue)rgb_value;
- (id)copyWithZone:(_NSZone *)a3;
- (int)name;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlpha:(id)a3;
- (void)setName:(int)a3;
- (void)setRgb_value:(id)a3;
@end

@implementation RFColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alpha, 0);
  objc_storeStrong((id *)&self->_rgb_value, 0);
}

- (void)setAlpha:(id)a3
{
}

- (RFOptionalFloat)alpha
{
  return self->_alpha;
}

- (int)name
{
  return self->_name;
}

- (RFRGBValue)rgb_value
{
  return self->_rgb_value;
}

- (unint64_t)hash
{
  v3 = [(RFColor *)self rgb_value];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = v4 ^ [(RFColor *)self name];
  v6 = [(RFColor *)self alpha];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RFColor *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFColor *)v5 isMemberOfClass:objc_opt_class()])
    {
      v6 = v5;
      unint64_t v7 = [(RFColor *)self rgb_value];
      v8 = [(RFColor *)v6 rgb_value];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v9 = [(RFColor *)self rgb_value];
      if (v9)
      {
        v10 = [(RFColor *)self rgb_value];
        v3 = [(RFColor *)v6 rgb_value];
        if (![v10 isEqual:v3])
        {
          char v11 = 0;
          goto LABEL_18;
        }
        v21 = v10;
      }
      int v12 = [(RFColor *)self name];
      if (v12 == [(RFColor *)v6 name])
      {
        v13 = [(RFColor *)self alpha];
        v14 = [(RFColor *)v6 alpha];
        v15 = v14;
        if ((v13 == 0) != (v14 != 0))
        {
          uint64_t v16 = [(RFColor *)self alpha];
          if (v16)
          {
            v17 = (void *)v16;
            v20 = [(RFColor *)self alpha];
            v19 = [(RFColor *)v6 alpha];
            char v11 = [v20 isEqual:v19];
          }
          else
          {

            char v11 = 1;
          }
LABEL_17:
          v10 = v21;
          if (!v9)
          {
LABEL_19:

            goto LABEL_20;
          }
LABEL_18:

          goto LABEL_19;
        }
      }
      char v11 = 0;
      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_21:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ([(RFColor *)self hasRgb_value])
  {
    uint64_t v5 = [(RFColor *)self rgb_value];
    v6 = (void *)[v5 copy];
    objc_msgSend(v4, "setRgb_value:", v6);
  }
  if ([(RFColor *)self hasName]) {
    objc_msgSend(v4, "setName:", -[RFColor name](self, "name"));
  }
  unint64_t v7 = [(RFColor *)self alpha];
  v8 = (void *)[v7 copy];
  [v4 setAlpha:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFColor alloc] initWithFacade:self];
  v3 = [(_SFPBRFColor *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFColor alloc] initWithFacade:self];
  v3 = [(_SFPBRFColor *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBRFColor alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBRFColor *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFColor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBRFColor alloc] initWithData:v5];
  unint64_t v7 = [(RFColor *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasName
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setName:(int)a3
{
  char has = (char)self->_has;
  self->_name = a3;
  *(unsigned char *)&self->_char has = has & 0xFC | 2;
  self->_rgb_value = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)hasRgb_value
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRgb_value:(id)a3
{
  *(unsigned char *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_rgb_value, a3);
  *(unsigned char *)&self->_has &= ~2u;
  self->_name = 0;
}

- (RFColor)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFColor;
  uint64_t v5 = [(RFColor *)&v16 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "rgb_value");

    if (v6)
    {
      unint64_t v7 = [RFRGBValue alloc];
      v8 = objc_msgSend(v4, "rgb_value");
      v9 = [(RFRGBValue *)v7 initWithProtobuf:v8];
      [(RFColor *)v5 setRgb_value:v9];
    }
    if ([v4 name]) {
      -[RFColor setName:](v5, "setName:", [v4 name]);
    }
    v10 = [v4 alpha];

    if (v10)
    {
      char v11 = [RFOptionalFloat alloc];
      int v12 = [v4 alpha];
      v13 = [(RFOptionalFloat *)v11 initWithProtobuf:v12];
      [(RFColor *)v5 setAlpha:v13];
    }
    v14 = v5;
  }

  return v5;
}

@end