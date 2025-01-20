@interface RFSymbolImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCorner_rounding_mode;
- (BOOL)hasImage_style;
- (BOOL)hasPunches_through_background;
- (BOOL)hasSymbol_rendering_mode;
- (BOOL)hasVibrancy;
- (BOOL)isEqual:(id)a3;
- (BOOL)punches_through_background;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (RFColor)background_color;
- (RFColor)primary_color;
- (RFColor)secondary_color;
- (RFSymbolImage)initWithCoder:(id)a3;
- (RFSymbolImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)corner_rounding_mode;
- (int)image_style;
- (int)symbol_rendering_mode;
- (int)vibrancy;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBackground_color:(id)a3;
- (void)setCorner_rounding_mode:(int)a3;
- (void)setImage_style:(int)a3;
- (void)setName:(id)a3;
- (void)setPrimary_color:(id)a3;
- (void)setPunches_through_background:(BOOL)a3;
- (void)setSecondary_color:(id)a3;
- (void)setSymbol_rendering_mode:(int)a3;
- (void)setVibrancy:(int)a3;
@end

@implementation RFSymbolImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background_color, 0);
  objc_storeStrong((id *)&self->_secondary_color, 0);
  objc_storeStrong((id *)&self->_primary_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (int)corner_rounding_mode
{
  return self->_corner_rounding_mode;
}

- (int)vibrancy
{
  return self->_vibrancy;
}

- (BOOL)punches_through_background
{
  return self->_punches_through_background;
}

- (void)setBackground_color:(id)a3
{
}

- (RFColor)background_color
{
  return self->_background_color;
}

- (int)symbol_rendering_mode
{
  return self->_symbol_rendering_mode;
}

- (int)image_style
{
  return self->_image_style;
}

- (void)setSecondary_color:(id)a3
{
}

- (RFColor)secondary_color
{
  return self->_secondary_color;
}

- (void)setPrimary_color:(id)a3
{
}

- (RFColor)primary_color
{
  return self->_primary_color;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)hash
{
  v3 = [(RFSymbolImage *)self name];
  uint64_t v4 = [v3 hash];
  v5 = [(RFSymbolImage *)self primary_color];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RFSymbolImage *)self secondary_color];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = v6 ^ v8 ^ [(RFSymbolImage *)self image_style];
  uint64_t v10 = [(RFSymbolImage *)self symbol_rendering_mode];
  v11 = [(RFSymbolImage *)self background_color];
  uint64_t v12 = v10 ^ [v11 hash];
  uint64_t v13 = v9 ^ v12 ^ [(RFSymbolImage *)self punches_through_background];
  uint64_t v14 = [(RFSymbolImage *)self vibrancy];
  unint64_t v15 = v13 ^ v14 ^ [(RFSymbolImage *)self corner_rounding_mode];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RFSymbolImage *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(RFSymbolImage *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(RFSymbolImage *)self name];
      uint64_t v8 = [(RFSymbolImage *)v6 name];
      if ((v7 == 0) == (v8 != 0))
      {
        BOOL v11 = 0;
LABEL_43:

        goto LABEL_44;
      }
      uint64_t v9 = [(RFSymbolImage *)self name];
      if (v9)
      {
        uint64_t v10 = [(RFSymbolImage *)self name];
        v3 = [(RFSymbolImage *)v6 name];
        if (![v10 isEqual:v3])
        {
          BOOL v11 = 0;
          goto LABEL_41;
        }
        v46 = v10;
      }
      uint64_t v12 = [(RFSymbolImage *)self primary_color];
      v47 = [(RFSymbolImage *)v6 primary_color];
      if ((v12 == 0) != (v47 != 0))
      {
        uint64_t v13 = [(RFSymbolImage *)self primary_color];
        if (v13)
        {
          uint64_t v14 = [(RFSymbolImage *)self primary_color];
          v41 = [(RFSymbolImage *)v6 primary_color];
          v42 = v14;
          if (!objc_msgSend(v14, "isEqual:"))
          {
            BOOL v11 = 0;
            goto LABEL_38;
          }
          v43 = v12;
          v44 = v3;
          unint64_t v15 = v13;
        }
        else
        {
          v43 = v12;
          v44 = v3;
          unint64_t v15 = 0;
        }
        v16 = [(RFSymbolImage *)self secondary_color];
        v17 = [(RFSymbolImage *)v6 secondary_color];
        if ((v16 == 0) != (v17 != 0))
        {
          v39 = v17;
          [(RFSymbolImage *)self secondary_color];
          v38 = uint64_t v13 = v15;
          v40 = v16;
          if (v38)
          {
            v18 = [(RFSymbolImage *)self secondary_color];
            v35 = [(RFSymbolImage *)v6 secondary_color];
            v36 = v18;
            v3 = v44;
            if (!objc_msgSend(v18, "isEqual:"))
            {
              BOOL v11 = 0;
              uint64_t v12 = v43;
              v25 = (void *)v38;
LABEL_36:

LABEL_37:
              if (!v13)
              {
LABEL_39:

LABEL_40:
                uint64_t v10 = v46;
                if (!v9)
                {
LABEL_42:

                  goto LABEL_43;
                }
LABEL_41:

                goto LABEL_42;
              }
LABEL_38:

              goto LABEL_39;
            }
            v37 = v13;
          }
          else
          {
            v37 = v15;
            v3 = v44;
          }
          uint64_t v12 = v43;
          int v19 = [(RFSymbolImage *)self image_style];
          if (v19 == [(RFSymbolImage *)v6 image_style])
          {
            int v20 = [(RFSymbolImage *)self symbol_rendering_mode];
            if (v20 == [(RFSymbolImage *)v6 symbol_rendering_mode])
            {
              v21 = [(RFSymbolImage *)self background_color];
              v22 = [(RFSymbolImage *)v6 background_color];
              if ((v21 == 0) != (v22 != 0))
              {
                v45 = v22;
                v23 = [(RFSymbolImage *)self background_color];
                if (v23)
                {
                  v32 = v21;
                  v24 = [(RFSymbolImage *)self background_color];
                  [(RFSymbolImage *)v6 background_color];
                  v34 = v43 = v24;
                  if (!objc_msgSend(v24, "isEqual:"))
                  {
                    BOOL v11 = 0;
                    v21 = v32;
                    goto LABEL_53;
                  }
                  v33 = v23;
                  v21 = v32;
                }
                else
                {
                  v33 = 0;
                }
                BOOL v27 = [(RFSymbolImage *)self punches_through_background];
                if (v27 == [(RFSymbolImage *)v6 punches_through_background]
                  && (int v28 = [(RFSymbolImage *)self vibrancy], v28 == [(RFSymbolImage *)v6 vibrancy]))
                {
                  int v29 = [(RFSymbolImage *)self corner_rounding_mode];
                  BOOL v11 = v29 == [(RFSymbolImage *)v6 corner_rounding_mode];
                  BOOL v30 = v11;
                }
                else
                {
                  BOOL v11 = 0;
                  BOOL v30 = 0;
                }
                v23 = v33;
                if (!v33)
                {
                  v31 = v45;
                  BOOL v11 = v30;
LABEL_54:

LABEL_35:
                  uint64_t v13 = v37;
                  v25 = (void *)v38;
                  if (!v38) {
                    goto LABEL_37;
                  }
                  goto LABEL_36;
                }
LABEL_53:

                v31 = v45;
                goto LABEL_54;
              }
            }
          }
          BOOL v11 = 0;
          goto LABEL_35;
        }

        if (v15)
        {
        }
        uint64_t v12 = v43;
        v3 = v44;
      }

      BOOL v11 = 0;
      goto LABEL_40;
    }
    BOOL v11 = 0;
  }
LABEL_44:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(RFSymbolImage *)self name];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setName:v6];

  v7 = [(RFSymbolImage *)self primary_color];
  uint64_t v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setPrimary_color:", v8);

  uint64_t v9 = [(RFSymbolImage *)self secondary_color];
  uint64_t v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setSecondary_color:", v10);

  objc_msgSend(v4, "setImage_style:", -[RFSymbolImage image_style](self, "image_style"));
  objc_msgSend(v4, "setSymbol_rendering_mode:", -[RFSymbolImage symbol_rendering_mode](self, "symbol_rendering_mode"));
  BOOL v11 = [(RFSymbolImage *)self background_color];
  uint64_t v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setBackground_color:", v12);

  objc_msgSend(v4, "setPunches_through_background:", -[RFSymbolImage punches_through_background](self, "punches_through_background"));
  objc_msgSend(v4, "setVibrancy:", -[RFSymbolImage vibrancy](self, "vibrancy"));
  objc_msgSend(v4, "setCorner_rounding_mode:", -[RFSymbolImage corner_rounding_mode](self, "corner_rounding_mode"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFSymbolImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFSymbolImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFSymbolImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFSymbolImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFSymbolImage alloc] initWithFacade:self];
  v5 = [(_SFPBRFSymbolImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFSymbolImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFSymbolImage alloc] initWithData:v5];
  v7 = [(RFSymbolImage *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasCorner_rounding_mode
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCorner_rounding_mode:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_corner_rounding_mode = a3;
}

- (BOOL)hasVibrancy
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setVibrancy:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_vibrancy = a3;
}

- (BOOL)hasPunches_through_background
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPunches_through_background:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_punches_through_background = a3;
}

- (BOOL)hasSymbol_rendering_mode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSymbol_rendering_mode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_symbol_rendering_mode = a3;
}

- (BOOL)hasImage_style
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setImage_style:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_image_style = a3;
}

- (RFSymbolImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RFSymbolImage;
  v5 = [(RFSymbolImage *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];

    if (v6)
    {
      v7 = [v4 name];
      [(RFSymbolImage *)v5 setName:v7];
    }
    uint64_t v8 = objc_msgSend(v4, "primary_color");

    if (v8)
    {
      uint64_t v9 = [RFColor alloc];
      uint64_t v10 = objc_msgSend(v4, "primary_color");
      BOOL v11 = [(RFColor *)v9 initWithProtobuf:v10];
      [(RFSymbolImage *)v5 setPrimary_color:v11];
    }
    uint64_t v12 = objc_msgSend(v4, "secondary_color");

    if (v12)
    {
      uint64_t v13 = [RFColor alloc];
      uint64_t v14 = objc_msgSend(v4, "secondary_color");
      unint64_t v15 = [(RFColor *)v13 initWithProtobuf:v14];
      [(RFSymbolImage *)v5 setSecondary_color:v15];
    }
    if (objc_msgSend(v4, "image_style")) {
      -[RFSymbolImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    }
    if (objc_msgSend(v4, "symbol_rendering_mode")) {
      -[RFSymbolImage setSymbol_rendering_mode:](v5, "setSymbol_rendering_mode:", objc_msgSend(v4, "symbol_rendering_mode"));
    }
    v16 = objc_msgSend(v4, "background_color");

    if (v16)
    {
      v17 = [RFColor alloc];
      v18 = objc_msgSend(v4, "background_color");
      int v19 = [(RFColor *)v17 initWithProtobuf:v18];
      [(RFSymbolImage *)v5 setBackground_color:v19];
    }
    if (objc_msgSend(v4, "punches_through_background")) {
      -[RFSymbolImage setPunches_through_background:](v5, "setPunches_through_background:", objc_msgSend(v4, "punches_through_background"));
    }
    if ([v4 vibrancy]) {
      -[RFSymbolImage setVibrancy:](v5, "setVibrancy:", [v4 vibrancy]);
    }
    if (objc_msgSend(v4, "corner_rounding_mode")) {
      -[RFSymbolImage setCorner_rounding_mode:](v5, "setCorner_rounding_mode:", objc_msgSend(v4, "corner_rounding_mode"));
    }
    int v20 = v5;
  }

  return v5;
}

@end