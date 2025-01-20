@interface RFImageSource
+ (BOOL)supportsSecureCoding;
- (BOOL)do_not_show_loading_placeholder;
- (BOOL)hasApp_icon;
- (BOOL)hasAvatar;
- (BOOL)hasBadged_image;
- (BOOL)hasDefault_browser_app_icon;
- (BOOL)hasDo_not_show_loading_placeholder;
- (BOOL)hasMonogram;
- (BOOL)hasSymbol;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFAppIconImage)app_icon;
- (RFAvatarImage)avatar;
- (RFBadgedImage)badged_image;
- (RFDefaultBrowserAppIconImage)default_browser_app_icon;
- (RFImageSource)initWithCoder:(id)a3;
- (RFImageSource)initWithProtobuf:(id)a3;
- (RFMonogramImage)monogram;
- (RFSymbolImage)symbol;
- (RFUrlImage)url;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApp_icon:(id)a3;
- (void)setAvatar:(id)a3;
- (void)setBadged_image:(id)a3;
- (void)setDefault_browser_app_icon:(id)a3;
- (void)setDo_not_show_loading_placeholder:(BOOL)a3;
- (void)setMonogram:(id)a3;
- (void)setSymbol:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation RFImageSource

- (RFImageSource)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)RFImageSource;
  v5 = [(RFImageSource *)&v36 init];
  if (v5)
  {
    v6 = [v4 url];

    if (v6)
    {
      v7 = [RFUrlImage alloc];
      v8 = [v4 url];
      v9 = [(RFUrlImage *)v7 initWithProtobuf:v8];
      [(RFImageSource *)v5 setUrl:v9];
    }
    v10 = [v4 symbol];

    if (v10)
    {
      v11 = [RFSymbolImage alloc];
      v12 = [v4 symbol];
      v13 = [(RFSymbolImage *)v11 initWithProtobuf:v12];
      [(RFImageSource *)v5 setSymbol:v13];
    }
    v14 = objc_msgSend(v4, "app_icon");

    if (v14)
    {
      v15 = [RFAppIconImage alloc];
      v16 = objc_msgSend(v4, "app_icon");
      v17 = [(RFAppIconImage *)v15 initWithProtobuf:v16];
      [(RFImageSource *)v5 setApp_icon:v17];
    }
    v18 = [v4 avatar];

    if (v18)
    {
      v19 = [RFAvatarImage alloc];
      v20 = [v4 avatar];
      v21 = [(RFAvatarImage *)v19 initWithProtobuf:v20];
      [(RFImageSource *)v5 setAvatar:v21];
    }
    v22 = [v4 monogram];

    if (v22)
    {
      v23 = [RFMonogramImage alloc];
      v24 = [v4 monogram];
      v25 = [(RFMonogramImage *)v23 initWithProtobuf:v24];
      [(RFImageSource *)v5 setMonogram:v25];
    }
    v26 = objc_msgSend(v4, "badged_image");

    if (v26)
    {
      v27 = [RFBadgedImage alloc];
      v28 = objc_msgSend(v4, "badged_image");
      v29 = [(RFBadgedImage *)v27 initWithProtobuf:v28];
      [(RFImageSource *)v5 setBadged_image:v29];
    }
    v30 = objc_msgSend(v4, "default_browser_app_icon");

    if (v30)
    {
      v31 = [RFDefaultBrowserAppIconImage alloc];
      v32 = objc_msgSend(v4, "default_browser_app_icon");
      v33 = [(RFDefaultBrowserAppIconImage *)v31 initWithProtobuf:v32];
      [(RFImageSource *)v5 setDefault_browser_app_icon:v33];
    }
    if (objc_msgSend(v4, "do_not_show_loading_placeholder")) {
      -[RFImageSource setDo_not_show_loading_placeholder:](v5, "setDo_not_show_loading_placeholder:", objc_msgSend(v4, "do_not_show_loading_placeholder"));
    }
    v34 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_default_browser_app_icon, 0);
  objc_storeStrong((id *)&self->_badged_image, 0);
  objc_storeStrong((id *)&self->_monogram, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_app_icon, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (BOOL)do_not_show_loading_placeholder
{
  return self->_do_not_show_loading_placeholder;
}

- (RFDefaultBrowserAppIconImage)default_browser_app_icon
{
  return self->_default_browser_app_icon;
}

- (RFBadgedImage)badged_image
{
  return self->_badged_image;
}

- (RFMonogramImage)monogram
{
  return self->_monogram;
}

- (RFAvatarImage)avatar
{
  return self->_avatar;
}

- (RFAppIconImage)app_icon
{
  return self->_app_icon;
}

- (RFSymbolImage)symbol
{
  return self->_symbol;
}

- (RFUrlImage)url
{
  return self->_url;
}

- (unint64_t)hash
{
  v3 = [(RFImageSource *)self url];
  uint64_t v4 = [v3 hash];
  v5 = [(RFImageSource *)self symbol];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RFImageSource *)self app_icon];
  uint64_t v8 = [v7 hash];
  v9 = [(RFImageSource *)self avatar];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(RFImageSource *)self monogram];
  uint64_t v12 = [v11 hash];
  v13 = [(RFImageSource *)self badged_image];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(RFImageSource *)self default_browser_app_icon];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  unint64_t v17 = v16 ^ [(RFImageSource *)self do_not_show_loading_placeholder];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RFImageSource *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(RFImageSource *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      uint64_t v6 = [(RFImageSource *)self url];
      v7 = [(RFImageSource *)v5 url];
      if ((v6 == 0) == (v7 != 0))
      {
        LOBYTE(v11) = 0;
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v8 = [(RFImageSource *)self url];
      if (v8)
      {
        v9 = [(RFImageSource *)self url];
        uint64_t v10 = [(RFImageSource *)v5 url];
        if (![v9 isEqual:v10])
        {
          LOBYTE(v11) = 0;
LABEL_24:

          goto LABEL_25;
        }
        v65 = v10;
        v66 = v9;
      }
      uint64_t v12 = [(RFImageSource *)self symbol];
      v13 = [(RFImageSource *)v5 symbol];
      if ((v12 == 0) == (v13 != 0)) {
        goto LABEL_22;
      }
      uint64_t v14 = [(RFImageSource *)self symbol];
      if (v14)
      {
        v15 = [(RFImageSource *)self symbol];
        v62 = [(RFImageSource *)v5 symbol];
        v63 = v15;
        if (![v15 isEqual:v62]) {
          goto LABEL_20;
        }
      }
      v64 = v14;
      uint64_t v16 = [(RFImageSource *)self app_icon];
      unint64_t v17 = [(RFImageSource *)v5 app_icon];
      if ((v16 == 0) == (v17 != 0))
      {

        if (!v14)
        {
LABEL_21:

LABEL_22:
          LOBYTE(v11) = 0;
          if (!v8)
          {
LABEL_25:

            goto LABEL_26;
          }
          goto LABEL_23;
        }
LABEL_20:

        goto LABEL_21;
      }
      v59 = v16;
      v60 = v17;
      v61 = [(RFImageSource *)self app_icon];
      if (v61)
      {
        v18 = [(RFImageSource *)self app_icon];
        [(RFImageSource *)v5 app_icon];
        v58 = v57 = v18;
        if (![v18 isEqual:v58])
        {
LABEL_49:

LABEL_50:
          if (!v14) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
      }
      v20 = [(RFImageSource *)self avatar];
      v21 = [(RFImageSource *)v5 avatar];
      if ((v20 == 0) == (v21 != 0))
      {

        goto LABEL_48;
      }
      v55 = v20;
      v56 = v21;
      v22 = [(RFImageSource *)self avatar];
      if (v22)
      {
        v20 = [(RFImageSource *)self avatar];
        v53 = [(RFImageSource *)v5 avatar];
        if (!objc_msgSend(v20, "isEqual:")) {
          goto LABEL_46;
        }
      }
      v52 = v20;
      v54 = v22;
      v23 = [(RFImageSource *)self monogram];
      v24 = [(RFImageSource *)v5 monogram];
      if ((v23 == 0) == (v24 != 0))
      {

        goto LABEL_45;
      }
      v49 = v23;
      v50 = v24;
      v51 = [(RFImageSource *)self monogram];
      if (v51)
      {
        v25 = [(RFImageSource *)self monogram];
        [(RFImageSource *)v5 monogram];
        v48 = v47 = v25;
        if (![v25 isEqual:v48]) {
          goto LABEL_43;
        }
      }
      v26 = [(RFImageSource *)self badged_image];
      v27 = [(RFImageSource *)v5 badged_image];
      if ((v26 == 0) == (v27 != 0))
      {

        if (!v51)
        {
LABEL_44:

LABEL_45:
          v20 = v52;
          if (!v22)
          {
LABEL_47:

LABEL_48:
            uint64_t v14 = v64;
            if (!v61) {
              goto LABEL_50;
            }
            goto LABEL_49;
          }
LABEL_46:

          goto LABEL_47;
        }
LABEL_43:

        goto LABEL_44;
      }
      v45 = v26;
      v46 = v27;
      v28 = [(RFImageSource *)self badged_image];
      if (v28)
      {
        v29 = [(RFImageSource *)self badged_image];
        [(RFImageSource *)v5 badged_image];
        uint64_t v44 = v42 = v29;
        if (!objc_msgSend(v29, "isEqual:"))
        {
          LOBYTE(v11) = 0;
          v35 = (void *)v44;
LABEL_64:

LABEL_65:
          if (v51)
          {
          }
          if (v54)
          {
          }
          if (v61)
          {
          }
          if (v64)
          {
          }
          if (!v8) {
            goto LABEL_25;
          }
LABEL_23:
          uint64_t v10 = v65;
          v9 = v66;
          goto LABEL_24;
        }
        v43 = v28;
      }
      else
      {
        v43 = 0;
      }
      v30 = [(RFImageSource *)self default_browser_app_icon];
      v31 = [(RFImageSource *)v5 default_browser_app_icon];
      if ((v30 == 0) == (v31 != 0))
      {

        LOBYTE(v11) = 0;
        goto LABEL_63;
      }
      v40 = v30;
      v41 = v31;
      uint64_t v39 = [(RFImageSource *)self default_browser_app_icon];
      if (!v39
        || ([(RFImageSource *)self default_browser_app_icon],
            v32 = objc_claimAutoreleasedReturnValue(),
            [(RFImageSource *)v5 default_browser_app_icon],
            v37 = objc_claimAutoreleasedReturnValue(),
            v38 = v32,
            objc_msgSend(v32, "isEqual:")))
      {
        BOOL v36 = [(RFImageSource *)self do_not_show_loading_placeholder];
        BOOL v11 = v36 ^ [(RFImageSource *)v5 do_not_show_loading_placeholder] ^ 1;
        v34 = (void *)v39;
        if (!v39)
        {
LABEL_62:

LABEL_63:
          v28 = v43;
          v35 = (void *)v44;
          if (!v43) {
            goto LABEL_65;
          }
          goto LABEL_64;
        }
        v33 = v48;
      }
      else
      {
        LOBYTE(v11) = 0;
        v33 = v48;
        v34 = (void *)v39;
      }
      v48 = v33;

      goto LABEL_62;
    }
    LOBYTE(v11) = 0;
  }
LABEL_27:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ([(RFImageSource *)self hasUrl])
  {
    v5 = [(RFImageSource *)self url];
    uint64_t v6 = (void *)[v5 copy];
    [v4 setUrl:v6];
  }
  if ([(RFImageSource *)self hasSymbol])
  {
    v7 = [(RFImageSource *)self symbol];
    uint64_t v8 = (void *)[v7 copy];
    [v4 setSymbol:v8];
  }
  if ([(RFImageSource *)self hasApp_icon])
  {
    v9 = [(RFImageSource *)self app_icon];
    uint64_t v10 = (void *)[v9 copy];
    objc_msgSend(v4, "setApp_icon:", v10);
  }
  if ([(RFImageSource *)self hasAvatar])
  {
    BOOL v11 = [(RFImageSource *)self avatar];
    uint64_t v12 = (void *)[v11 copy];
    [v4 setAvatar:v12];
  }
  if ([(RFImageSource *)self hasMonogram])
  {
    v13 = [(RFImageSource *)self monogram];
    uint64_t v14 = (void *)[v13 copy];
    [v4 setMonogram:v14];
  }
  if ([(RFImageSource *)self hasBadged_image])
  {
    v15 = [(RFImageSource *)self badged_image];
    uint64_t v16 = (void *)[v15 copy];
    objc_msgSend(v4, "setBadged_image:", v16);
  }
  if ([(RFImageSource *)self hasDefault_browser_app_icon])
  {
    unint64_t v17 = [(RFImageSource *)self default_browser_app_icon];
    v18 = (void *)[v17 copy];
    objc_msgSend(v4, "setDefault_browser_app_icon:", v18);
  }
  objc_msgSend(v4, "setDo_not_show_loading_placeholder:", -[RFImageSource do_not_show_loading_placeholder](self, "do_not_show_loading_placeholder"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFImageSource alloc] initWithFacade:self];
  v3 = [(_SFPBRFImageSource *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFImageSource alloc] initWithFacade:self];
  v3 = [(_SFPBRFImageSource *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFImageSource alloc] initWithFacade:self];
  v5 = [(_SFPBRFImageSource *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFImageSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFImageSource alloc] initWithData:v5];
  v7 = [(RFImageSource *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasDo_not_show_loading_placeholder
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setDo_not_show_loading_placeholder:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_do_not_show_loading_placeholder = a3;
}

- (BOOL)hasDefault_browser_app_icon
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setDefault_browser_app_icon:(id)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  objc_storeStrong((id *)&self->_default_browser_app_icon, a3);
  id v11 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  url = self->_url;
  self->_url = 0;

  *(unsigned char *)&self->_has &= ~2u;
  symbol = self->_symbol;
  self->_symbol = 0;

  *(unsigned char *)&self->_has &= ~4u;
  app_icon = self->_app_icon;
  self->_app_icon = 0;

  *(unsigned char *)&self->_has &= ~8u;
  avatar = self->_avatar;
  self->_avatar = 0;

  *(unsigned char *)&self->_has &= ~0x10u;
  monogram = self->_monogram;
  self->_monogram = 0;

  *(unsigned char *)&self->_has &= ~0x20u;
  badged_image = self->_badged_image;
  self->_badged_image = 0;
}

- (BOOL)hasBadged_image
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setBadged_image:(id)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  objc_storeStrong((id *)&self->_badged_image, a3);
  id v11 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  url = self->_url;
  self->_url = 0;

  *(unsigned char *)&self->_has &= ~2u;
  symbol = self->_symbol;
  self->_symbol = 0;

  *(unsigned char *)&self->_has &= ~4u;
  app_icon = self->_app_icon;
  self->_app_icon = 0;

  *(unsigned char *)&self->_has &= ~8u;
  avatar = self->_avatar;
  self->_avatar = 0;

  *(unsigned char *)&self->_has &= ~0x10u;
  monogram = self->_monogram;
  self->_monogram = 0;

  *(unsigned char *)&self->_has &= ~0x40u;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;
}

- (BOOL)hasMonogram
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMonogram:(id)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  objc_storeStrong((id *)&self->_monogram, a3);
  id v11 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  url = self->_url;
  self->_url = 0;

  *(unsigned char *)&self->_has &= ~2u;
  symbol = self->_symbol;
  self->_symbol = 0;

  *(unsigned char *)&self->_has &= ~4u;
  app_icon = self->_app_icon;
  self->_app_icon = 0;

  *(unsigned char *)&self->_has &= ~8u;
  avatar = self->_avatar;
  self->_avatar = 0;

  *(unsigned char *)&self->_has &= ~0x20u;
  badged_image = self->_badged_image;
  self->_badged_image = 0;

  *(unsigned char *)&self->_has &= ~0x40u;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;
}

- (BOOL)hasAvatar
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAvatar:(id)a3
{
  *(unsigned char *)&self->_has |= 8u;
  objc_storeStrong((id *)&self->_avatar, a3);
  id v11 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  url = self->_url;
  self->_url = 0;

  *(unsigned char *)&self->_has &= ~2u;
  symbol = self->_symbol;
  self->_symbol = 0;

  *(unsigned char *)&self->_has &= ~4u;
  app_icon = self->_app_icon;
  self->_app_icon = 0;

  *(unsigned char *)&self->_has &= ~0x10u;
  monogram = self->_monogram;
  self->_monogram = 0;

  *(unsigned char *)&self->_has &= ~0x20u;
  badged_image = self->_badged_image;
  self->_badged_image = 0;

  *(unsigned char *)&self->_has &= ~0x40u;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;
}

- (BOOL)hasApp_icon
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setApp_icon:(id)a3
{
  *(unsigned char *)&self->_has |= 4u;
  objc_storeStrong((id *)&self->_app_icon, a3);
  id v11 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  url = self->_url;
  self->_url = 0;

  *(unsigned char *)&self->_has &= ~2u;
  symbol = self->_symbol;
  self->_symbol = 0;

  *(unsigned char *)&self->_has &= ~8u;
  avatar = self->_avatar;
  self->_avatar = 0;

  *(unsigned char *)&self->_has &= ~0x10u;
  monogram = self->_monogram;
  self->_monogram = 0;

  *(unsigned char *)&self->_has &= ~0x20u;
  badged_image = self->_badged_image;
  self->_badged_image = 0;

  *(unsigned char *)&self->_has &= ~0x40u;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;
}

- (BOOL)hasSymbol
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSymbol:(id)a3
{
  *(unsigned char *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_symbol, a3);
  id v11 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  url = self->_url;
  self->_url = 0;

  *(unsigned char *)&self->_has &= ~4u;
  app_icon = self->_app_icon;
  self->_app_icon = 0;

  *(unsigned char *)&self->_has &= ~8u;
  avatar = self->_avatar;
  self->_avatar = 0;

  *(unsigned char *)&self->_has &= ~0x10u;
  monogram = self->_monogram;
  self->_monogram = 0;

  *(unsigned char *)&self->_has &= ~0x20u;
  badged_image = self->_badged_image;
  self->_badged_image = 0;

  *(unsigned char *)&self->_has &= ~0x40u;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;
}

- (BOOL)hasUrl
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUrl:(id)a3
{
  *(unsigned char *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_url, a3);
  id v11 = a3;
  *(unsigned char *)&self->_has &= ~2u;
  symbol = self->_symbol;
  self->_symbol = 0;

  *(unsigned char *)&self->_has &= ~4u;
  app_icon = self->_app_icon;
  self->_app_icon = 0;

  *(unsigned char *)&self->_has &= ~8u;
  avatar = self->_avatar;
  self->_avatar = 0;

  *(unsigned char *)&self->_has &= ~0x10u;
  monogram = self->_monogram;
  self->_monogram = 0;

  *(unsigned char *)&self->_has &= ~0x20u;
  badged_image = self->_badged_image;
  self->_badged_image = 0;

  *(unsigned char *)&self->_has &= ~0x40u;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;
}

@end