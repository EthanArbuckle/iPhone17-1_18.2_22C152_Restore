@interface RFUrlImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCorner_rounding_mode;
- (BOOL)hasImage_rendering_mode;
- (BOOL)hasImage_style;
- (BOOL)hasSizing_mode;
- (BOOL)hasSymbol_placeholder_image;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)inset_padding;
- (NSString)dark_mode_url;
- (NSString)url;
- (RFAspectRatio)aspect_ratio;
- (RFColor)background_color;
- (RFSymbolImage)symbol_placeholder_image;
- (RFUrlImage)initWithCoder:(id)a3;
- (RFUrlImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)corner_rounding_mode;
- (int)image_rendering_mode;
- (int)image_style;
- (int)sizing_mode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAspect_ratio:(id)a3;
- (void)setBackground_color:(id)a3;
- (void)setCorner_rounding_mode:(int)a3;
- (void)setDark_mode_url:(id)a3;
- (void)setImage_rendering_mode:(int)a3;
- (void)setImage_style:(int)a3;
- (void)setInset_padding:(id)a3;
- (void)setSizing_mode:(int)a3;
- (void)setSymbol_placeholder_image:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation RFUrlImage

- (RFUrlImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)RFUrlImage;
  v5 = [(RFUrlImage *)&v27 init];
  if (v5)
  {
    v6 = [v4 url];

    if (v6)
    {
      v7 = [v4 url];
      [(RFUrlImage *)v5 setUrl:v7];
    }
    v8 = objc_msgSend(v4, "dark_mode_url");

    if (v8)
    {
      v9 = objc_msgSend(v4, "dark_mode_url");
      [(RFUrlImage *)v5 setDark_mode_url:v9];
    }
    v10 = objc_msgSend(v4, "symbol_placeholder_image");

    if (v10)
    {
      v11 = [RFSymbolImage alloc];
      v12 = objc_msgSend(v4, "symbol_placeholder_image");
      v13 = [(RFSymbolImage *)v11 initWithProtobuf:v12];
      [(RFUrlImage *)v5 setSymbol_placeholder_image:v13];
    }
    if (objc_msgSend(v4, "image_style")) {
      -[RFUrlImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    }
    v14 = objc_msgSend(v4, "aspect_ratio");

    if (v14)
    {
      v15 = [RFAspectRatio alloc];
      v16 = objc_msgSend(v4, "aspect_ratio");
      v17 = [(RFAspectRatio *)v15 initWithProtobuf:v16];
      [(RFUrlImage *)v5 setAspect_ratio:v17];
    }
    if (objc_msgSend(v4, "sizing_mode")) {
      -[RFUrlImage setSizing_mode:](v5, "setSizing_mode:", objc_msgSend(v4, "sizing_mode"));
    }
    if (objc_msgSend(v4, "image_rendering_mode")) {
      -[RFUrlImage setImage_rendering_mode:](v5, "setImage_rendering_mode:", objc_msgSend(v4, "image_rendering_mode"));
    }
    v18 = objc_msgSend(v4, "background_color");

    if (v18)
    {
      v19 = [RFColor alloc];
      v20 = objc_msgSend(v4, "background_color");
      v21 = [(RFColor *)v19 initWithProtobuf:v20];
      [(RFUrlImage *)v5 setBackground_color:v21];
    }
    if (objc_msgSend(v4, "corner_rounding_mode")) {
      -[RFUrlImage setCorner_rounding_mode:](v5, "setCorner_rounding_mode:", objc_msgSend(v4, "corner_rounding_mode"));
    }
    objc_msgSend(v4, "inset_padding");
    if (v22 != 0.0)
    {
      v23 = NSNumber;
      objc_msgSend(v4, "inset_padding");
      v24 = objc_msgSend(v23, "numberWithFloat:");
      [(RFUrlImage *)v5 setInset_padding:v24];
    }
    v25 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inset_padding, 0);
  objc_storeStrong((id *)&self->_background_color, 0);
  objc_storeStrong((id *)&self->_aspect_ratio, 0);
  objc_storeStrong((id *)&self->_symbol_placeholder_image, 0);
  objc_storeStrong((id *)&self->_dark_mode_url, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setInset_padding:(id)a3
{
}

- (NSNumber)inset_padding
{
  return self->_inset_padding;
}

- (int)corner_rounding_mode
{
  return self->_corner_rounding_mode;
}

- (void)setBackground_color:(id)a3
{
}

- (RFColor)background_color
{
  return self->_background_color;
}

- (int)image_rendering_mode
{
  return self->_image_rendering_mode;
}

- (int)sizing_mode
{
  return self->_sizing_mode;
}

- (void)setAspect_ratio:(id)a3
{
}

- (RFAspectRatio)aspect_ratio
{
  return self->_aspect_ratio;
}

- (int)image_style
{
  return self->_image_style;
}

- (RFSymbolImage)symbol_placeholder_image
{
  return self->_symbol_placeholder_image;
}

- (void)setDark_mode_url:(id)a3
{
}

- (NSString)dark_mode_url
{
  return self->_dark_mode_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (unint64_t)hash
{
  v3 = [(RFUrlImage *)self url];
  uint64_t v4 = [v3 hash];
  v5 = [(RFUrlImage *)self dark_mode_url];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RFUrlImage *)self symbol_placeholder_image];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = v6 ^ v8 ^ [(RFUrlImage *)self image_style];
  v10 = [(RFUrlImage *)self aspect_ratio];
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v11 ^ [(RFUrlImage *)self sizing_mode];
  uint64_t v13 = v9 ^ v12 ^ [(RFUrlImage *)self image_rendering_mode];
  v14 = [(RFUrlImage *)self background_color];
  uint64_t v15 = [v14 hash];
  uint64_t v16 = v15 ^ [(RFUrlImage *)self corner_rounding_mode];
  v17 = [(RFUrlImage *)self inset_padding];
  unint64_t v18 = v13 ^ v16 ^ [v17 hash];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RFUrlImage *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    if ([(RFUrlImage *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      uint64_t v6 = [(RFUrlImage *)self url];
      v7 = [(RFUrlImage *)v5 url];
      if ((v6 == 0) == (v7 != 0))
      {
        char v10 = 0;
LABEL_39:

        goto LABEL_40;
      }
      uint64_t v8 = [(RFUrlImage *)self url];
      if (v8)
      {
        uint64_t v9 = [(RFUrlImage *)self url];
        v62 = [(RFUrlImage *)v5 url];
        if (!objc_msgSend(v9, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_37;
        }
        v60 = v9;
      }
      v61 = [(RFUrlImage *)self dark_mode_url];
      uint64_t v11 = [(RFUrlImage *)v5 dark_mode_url];
      if ((v61 == 0) == (v11 != 0)) {
        goto LABEL_35;
      }
      uint64_t v12 = [(RFUrlImage *)self dark_mode_url];
      if (v12)
      {
        uint64_t v13 = [(RFUrlImage *)self dark_mode_url];
        v14 = [(RFUrlImage *)v5 dark_mode_url];
        if (([v13 isEqual:v14] & 1) == 0)
        {

LABEL_34:
LABEL_35:

          char v10 = 0;
          goto LABEL_36;
        }
        v59 = v14;
        v57 = v13;
        v58 = v7;
        uint64_t v15 = v62;
        uint64_t v16 = v12;
      }
      else
      {
        v58 = v7;
        uint64_t v15 = v62;
        uint64_t v16 = 0;
      }
      v62 = v15;
      v17 = [(RFUrlImage *)self symbol_placeholder_image];
      unint64_t v18 = [(RFUrlImage *)v5 symbol_placeholder_image];
      uint64_t v12 = v16;
      v7 = v58;
      v19 = v59;
      if ((v17 == 0) != (v18 != 0))
      {
        id v56 = v18;
        v54 = v17;
        v55 = [(RFUrlImage *)self symbol_placeholder_image];
        if (v55)
        {
          v20 = [(RFUrlImage *)self symbol_placeholder_image];
          v51 = [(RFUrlImage *)v5 symbol_placeholder_image];
          v52 = v20;
          if (!objc_msgSend(v20, "isEqual:"))
          {
            char v10 = 0;
            v26 = v55;
            goto LABEL_55;
          }
          v53 = v12;
          v19 = v59;
        }
        else
        {
          v53 = v12;
        }
        int v21 = [(RFUrlImage *)self image_style];
        if (v21 != [(RFUrlImage *)v5 image_style])
        {
          v59 = v19;
          char v10 = 0;
          uint64_t v12 = v53;
          goto LABEL_54;
        }
        float v22 = [(RFUrlImage *)self aspect_ratio];
        v23 = [(RFUrlImage *)v5 aspect_ratio];
        if ((v22 == 0) != (v23 != 0))
        {
          v50 = v23;
          uint64_t v24 = [(RFUrlImage *)self aspect_ratio];
          v59 = v19;
          v49 = v22;
          if (v24)
          {
            v25 = [(RFUrlImage *)self aspect_ratio];
            v46 = [(RFUrlImage *)v5 aspect_ratio];
            v47 = v25;
            if (!objc_msgSend(v25, "isEqual:"))
            {
              char v10 = 0;
              v33 = (void *)v24;
              uint64_t v12 = v53;
              v17 = v54;
              goto LABEL_52;
            }
            v48 = (void *)v24;
          }
          else
          {
            v48 = 0;
          }
          int v28 = [(RFUrlImage *)self sizing_mode];
          if (v28 == [(RFUrlImage *)v5 sizing_mode])
          {
            int v29 = [(RFUrlImage *)self image_rendering_mode];
            if (v29 == [(RFUrlImage *)v5 image_rendering_mode])
            {
              v30 = [(RFUrlImage *)self background_color];
              v31 = [(RFUrlImage *)v5 background_color];
              if ((v30 == 0) != (v31 != 0))
              {
                v43 = v31;
                v44 = v30;
                v45 = [(RFUrlImage *)self background_color];
                if (v45)
                {
                  v32 = [(RFUrlImage *)self background_color];
                  v41 = [(RFUrlImage *)v5 background_color];
                  v42 = v32;
                  if (!objc_msgSend(v32, "isEqual:"))
                  {
                    char v10 = 0;
                    uint64_t v12 = v53;
                    v17 = v54;
                    goto LABEL_68;
                  }
                }
                int v34 = [(RFUrlImage *)self corner_rounding_mode];
                if (v34 == [(RFUrlImage *)v5 corner_rounding_mode])
                {
                  v35 = [(RFUrlImage *)self inset_padding];
                  v40 = [(RFUrlImage *)v5 inset_padding];
                  if ((v35 == 0) != (v40 != 0))
                  {
                    uint64_t v36 = [(RFUrlImage *)self inset_padding];
                    if (v36)
                    {
                      v37 = (void *)v36;
                      v38 = [(RFUrlImage *)self inset_padding];
                      v39 = [(RFUrlImage *)v5 inset_padding];
                      char v10 = [v38 isEqual:v39];
                    }
                    else
                    {

                      char v10 = 1;
                    }
                    uint64_t v12 = v53;
                    v7 = v58;
LABEL_67:
                    v17 = v54;
                    if (!v45)
                    {
LABEL_69:

LABEL_51:
                      v33 = v48;
                      if (!v48)
                      {
LABEL_53:

LABEL_54:
                        v26 = v55;
                        if (!v55)
                        {
LABEL_56:

                          if (v12)
                          {
                          }
LABEL_36:
                          uint64_t v9 = v60;
                          if (!v8)
                          {
LABEL_38:

                            goto LABEL_39;
                          }
LABEL_37:

                          goto LABEL_38;
                        }
LABEL_55:

                        goto LABEL_56;
                      }
LABEL_52:

                      goto LABEL_53;
                    }
LABEL_68:

                    goto LABEL_69;
                  }
                }
                char v10 = 0;
                uint64_t v12 = v53;
                goto LABEL_67;
              }
            }
          }
          char v10 = 0;
          uint64_t v12 = v53;
          v17 = v54;
          goto LABEL_51;
        }

        uint64_t v12 = v53;
        if (v55)
        {
        }
        v17 = v54;
        unint64_t v18 = v56;
      }

      if (v12)
      {
      }
      goto LABEL_34;
    }
    char v10 = 0;
  }
LABEL_40:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(RFUrlImage *)self url];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setUrl:v6];

  v7 = [(RFUrlImage *)self dark_mode_url];
  uint64_t v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setDark_mode_url:", v8);

  if ([(RFUrlImage *)self hasSymbol_placeholder_image])
  {
    uint64_t v9 = [(RFUrlImage *)self symbol_placeholder_image];
    char v10 = (void *)[v9 copy];
    objc_msgSend(v4, "setSymbol_placeholder_image:", v10);
  }
  objc_msgSend(v4, "setImage_style:", -[RFUrlImage image_style](self, "image_style"));
  uint64_t v11 = [(RFUrlImage *)self aspect_ratio];
  uint64_t v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setAspect_ratio:", v12);

  objc_msgSend(v4, "setSizing_mode:", -[RFUrlImage sizing_mode](self, "sizing_mode"));
  objc_msgSend(v4, "setImage_rendering_mode:", -[RFUrlImage image_rendering_mode](self, "image_rendering_mode"));
  uint64_t v13 = [(RFUrlImage *)self background_color];
  v14 = (void *)[v13 copy];
  objc_msgSend(v4, "setBackground_color:", v14);

  objc_msgSend(v4, "setCorner_rounding_mode:", -[RFUrlImage corner_rounding_mode](self, "corner_rounding_mode"));
  uint64_t v15 = [(RFUrlImage *)self inset_padding];
  uint64_t v16 = (void *)[v15 copy];
  objc_msgSend(v4, "setInset_padding:", v16);

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFUrlImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFUrlImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFUrlImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFUrlImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFUrlImage alloc] initWithFacade:self];
  v5 = [(_SFPBRFUrlImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFUrlImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFUrlImage alloc] initWithData:v5];
  v7 = [(RFUrlImage *)self initWithProtobuf:v6];

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

- (BOOL)hasImage_rendering_mode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setImage_rendering_mode:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_image_rendering_mode = a3;
}

- (BOOL)hasSizing_mode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSizing_mode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sizing_mode = a3;
}

- (BOOL)hasImage_style
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setImage_style:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_image_style = a3;
}

- (BOOL)hasSymbol_placeholder_image
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSymbol_placeholder_image:(id)a3
{
  *(unsigned char *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_symbol_placeholder_image, a3);
}

@end