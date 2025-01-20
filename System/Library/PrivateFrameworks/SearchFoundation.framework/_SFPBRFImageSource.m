@interface _SFPBRFImageSource
- (BOOL)do_not_show_loading_placeholder;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFAppIconImage)app_icon;
- (_SFPBRFAvatarImage)avatar;
- (_SFPBRFBadgedImage)badged_image;
- (_SFPBRFDefaultBrowserAppIconImage)default_browser_app_icon;
- (_SFPBRFImageSource)initWithDictionary:(id)a3;
- (_SFPBRFImageSource)initWithFacade:(id)a3;
- (_SFPBRFImageSource)initWithJSON:(id)a3;
- (_SFPBRFMonogramImage)monogram;
- (_SFPBRFSymbolImage)symbol;
- (_SFPBRFUrlImage)url;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)whichValue;
- (void)setApp_icon:(id)a3;
- (void)setAvatar:(id)a3;
- (void)setBadged_image:(id)a3;
- (void)setDefault_browser_app_icon:(id)a3;
- (void)setDo_not_show_loading_placeholder:(BOOL)a3;
- (void)setMonogram:(id)a3;
- (void)setSymbol:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFImageSource

- (_SFPBRFImageSource)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFImageSource *)self init];
  if (v5)
  {
    if ([v4 hasUrl])
    {
      v6 = [v4 url];

      if (v6)
      {
        v7 = [_SFPBRFUrlImage alloc];
        v8 = [v4 url];
        v9 = [(_SFPBRFUrlImage *)v7 initWithFacade:v8];
        [(_SFPBRFImageSource *)v5 setUrl:v9];
      }
    }
    if ([v4 hasSymbol])
    {
      v10 = [v4 symbol];

      if (v10)
      {
        v11 = [_SFPBRFSymbolImage alloc];
        v12 = [v4 symbol];
        v13 = [(_SFPBRFSymbolImage *)v11 initWithFacade:v12];
        [(_SFPBRFImageSource *)v5 setSymbol:v13];
      }
    }
    if (objc_msgSend(v4, "hasApp_icon"))
    {
      v14 = objc_msgSend(v4, "app_icon");

      if (v14)
      {
        v15 = [_SFPBRFAppIconImage alloc];
        v16 = objc_msgSend(v4, "app_icon");
        v17 = [(_SFPBRFAppIconImage *)v15 initWithFacade:v16];
        [(_SFPBRFImageSource *)v5 setApp_icon:v17];
      }
    }
    if ([v4 hasAvatar])
    {
      v18 = [v4 avatar];

      if (v18)
      {
        v19 = [_SFPBRFAvatarImage alloc];
        v20 = [v4 avatar];
        v21 = [(_SFPBRFAvatarImage *)v19 initWithFacade:v20];
        [(_SFPBRFImageSource *)v5 setAvatar:v21];
      }
    }
    if ([v4 hasMonogram])
    {
      v22 = [v4 monogram];

      if (v22)
      {
        v23 = [_SFPBRFMonogramImage alloc];
        v24 = [v4 monogram];
        v25 = [(_SFPBRFMonogramImage *)v23 initWithFacade:v24];
        [(_SFPBRFImageSource *)v5 setMonogram:v25];
      }
    }
    if (objc_msgSend(v4, "hasBadged_image"))
    {
      v26 = objc_msgSend(v4, "badged_image");

      if (v26)
      {
        v27 = [_SFPBRFBadgedImage alloc];
        v28 = objc_msgSend(v4, "badged_image");
        v29 = [(_SFPBRFBadgedImage *)v27 initWithFacade:v28];
        [(_SFPBRFImageSource *)v5 setBadged_image:v29];
      }
    }
    if (objc_msgSend(v4, "hasDefault_browser_app_icon"))
    {
      v30 = objc_msgSend(v4, "default_browser_app_icon");

      if (v30)
      {
        v31 = [_SFPBRFDefaultBrowserAppIconImage alloc];
        v32 = objc_msgSend(v4, "default_browser_app_icon");
        v33 = [(_SFPBRFDefaultBrowserAppIconImage *)v31 initWithFacade:v32];
        [(_SFPBRFImageSource *)v5 setDefault_browser_app_icon:v33];
      }
    }
    if (objc_msgSend(v4, "hasDo_not_show_loading_placeholder")) {
      -[_SFPBRFImageSource setDo_not_show_loading_placeholder:](v5, "setDo_not_show_loading_placeholder:", objc_msgSend(v4, "do_not_show_loading_placeholder"));
    }
    v34 = v5;
  }

  return v5;
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

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (BOOL)do_not_show_loading_placeholder
{
  return self->_do_not_show_loading_placeholder;
}

- (_SFPBRFImageSource)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_SFPBRFImageSource;
  v5 = [(_SFPBRFImageSource *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFUrlImage alloc] initWithDictionary:v6];
      [(_SFPBRFImageSource *)v5 setUrl:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"symbol"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFSymbolImage alloc] initWithDictionary:v8];
      [(_SFPBRFImageSource *)v5 setSymbol:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"appIcon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFAppIconImage alloc] initWithDictionary:v10];
      [(_SFPBRFImageSource *)v5 setApp_icon:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"avatar"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBRFAvatarImage alloc] initWithDictionary:v12];
      [(_SFPBRFImageSource *)v5 setAvatar:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"monogram"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[_SFPBRFMonogramImage alloc] initWithDictionary:v14];
      [(_SFPBRFImageSource *)v5 setMonogram:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"badgedImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[_SFPBRFBadgedImage alloc] initWithDictionary:v16];
      [(_SFPBRFImageSource *)v5 setBadged_image:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"defaultBrowserAppIcon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[_SFPBRFDefaultBrowserAppIconImage alloc] initWithDictionary:v18];
      [(_SFPBRFImageSource *)v5 setDefault_browser_app_icon:v19];
    }
    v20 = [v4 objectForKeyedSubscript:@"doNotShowLoadingPlaceholder"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFImageSource setDo_not_show_loading_placeholder:](v5, "setDo_not_show_loading_placeholder:", [v20 BOOLValue]);
    }
    v21 = v5;
  }
  return v5;
}

- (_SFPBRFImageSource)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFImageSource *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFImageSource *)self dictionaryRepresentation];
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
  if (self->_app_icon)
  {
    id v4 = [(_SFPBRFImageSource *)self app_icon];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"appIcon"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"appIcon"];
    }
  }
  if (self->_avatar)
  {
    uint64_t v7 = [(_SFPBRFImageSource *)self avatar];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"avatar"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"avatar"];
    }
  }
  if (self->_badged_image)
  {
    v10 = [(_SFPBRFImageSource *)self badged_image];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"badgedImage"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"badgedImage"];
    }
  }
  if (self->_default_browser_app_icon)
  {
    v13 = [(_SFPBRFImageSource *)self default_browser_app_icon];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"defaultBrowserAppIcon"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"defaultBrowserAppIcon"];
    }
  }
  if (self->_do_not_show_loading_placeholder)
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFImageSource do_not_show_loading_placeholder](self, "do_not_show_loading_placeholder"));
    [v3 setObject:v16 forKeyedSubscript:@"doNotShowLoadingPlaceholder"];
  }
  if (self->_monogram)
  {
    v17 = [(_SFPBRFImageSource *)self monogram];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"monogram"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"monogram"];
    }
  }
  if (self->_symbol)
  {
    v20 = [(_SFPBRFImageSource *)self symbol];
    v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"symbol"];
    }
    else
    {
      v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"symbol"];
    }
  }
  if (self->_url)
  {
    objc_super v23 = [(_SFPBRFImageSource *)self url];
    v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"url"];
    }
    else
    {
      v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"url"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFUrlImage *)self->_url hash];
  unint64_t v4 = [(_SFPBRFSymbolImage *)self->_symbol hash];
  unint64_t v5 = [(_SFPBRFAppIconImage *)self->_app_icon hash];
  unint64_t v6 = [(_SFPBRFAvatarImage *)self->_avatar hash];
  unint64_t v7 = [(_SFPBRFMonogramImage *)self->_monogram hash];
  unint64_t v8 = [(_SFPBRFBadgedImage *)self->_badged_image hash];
  unint64_t v9 = [(_SFPBRFDefaultBrowserAppIconImage *)self->_default_browser_app_icon hash];
  uint64_t v10 = 2654435761;
  if (!self->_do_not_show_loading_placeholder) {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  unint64_t v5 = [(_SFPBRFImageSource *)self url];
  unint64_t v6 = [v4 url];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(_SFPBRFImageSource *)self url];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBRFImageSource *)self url];
    uint64_t v10 = [v4 url];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFImageSource *)self symbol];
  unint64_t v6 = [v4 symbol];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(_SFPBRFImageSource *)self symbol];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBRFImageSource *)self symbol];
    v15 = [v4 symbol];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFImageSource *)self app_icon];
  unint64_t v6 = objc_msgSend(v4, "app_icon");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v17 = [(_SFPBRFImageSource *)self app_icon];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBRFImageSource *)self app_icon];
    v20 = objc_msgSend(v4, "app_icon");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFImageSource *)self avatar];
  unint64_t v6 = [v4 avatar];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v22 = [(_SFPBRFImageSource *)self avatar];
  if (v22)
  {
    objc_super v23 = (void *)v22;
    v24 = [(_SFPBRFImageSource *)self avatar];
    v25 = [v4 avatar];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFImageSource *)self monogram];
  unint64_t v6 = [v4 monogram];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v27 = [(_SFPBRFImageSource *)self monogram];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBRFImageSource *)self monogram];
    v30 = [v4 monogram];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFImageSource *)self badged_image];
  unint64_t v6 = objc_msgSend(v4, "badged_image");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v32 = [(_SFPBRFImageSource *)self badged_image];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_SFPBRFImageSource *)self badged_image];
    v35 = objc_msgSend(v4, "badged_image");
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFImageSource *)self default_browser_app_icon];
  unint64_t v6 = objc_msgSend(v4, "default_browser_app_icon");
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v37 = [(_SFPBRFImageSource *)self default_browser_app_icon];
    if (!v37)
    {

LABEL_40:
      int do_not_show_loading_placeholder = self->_do_not_show_loading_placeholder;
      BOOL v42 = do_not_show_loading_placeholder == objc_msgSend(v4, "do_not_show_loading_placeholder");
      goto LABEL_38;
    }
    v38 = (void *)v37;
    v39 = [(_SFPBRFImageSource *)self default_browser_app_icon];
    v40 = objc_msgSend(v4, "default_browser_app_icon");
    int v41 = [v39 isEqual:v40];

    if (v41) {
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
  }
LABEL_37:
  BOOL v42 = 0;
LABEL_38:

  return v42;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_SFPBRFImageSource *)self url];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v5 = [(_SFPBRFImageSource *)self symbol];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBRFImageSource *)self app_icon];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFImageSource *)self avatar];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v8 = [(_SFPBRFImageSource *)self monogram];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v9 = [(_SFPBRFImageSource *)self badged_image];
  if (v9) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v10 = [(_SFPBRFImageSource *)self default_browser_app_icon];
  if (v10) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFImageSource *)self do_not_show_loading_placeholder]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFImageSourceReadFrom(self, (uint64_t)a3);
}

- (void)setDo_not_show_loading_placeholder:(BOOL)a3
{
  self->_int do_not_show_loading_placeholder = a3;
}

- (_SFPBRFDefaultBrowserAppIconImage)default_browser_app_icon
{
  if (self->_whichValue == 7) {
    v2 = self->_default_browser_app_icon;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDefault_browser_app_icon:(id)a3
{
  id v4 = (_SFPBRFDefaultBrowserAppIconImage *)a3;
  url = self->_url;
  self->_url = 0;

  symbol = self->_symbol;
  self->_symbol = 0;

  app_icon = self->_app_icon;
  self->_app_icon = 0;

  avatar = self->_avatar;
  self->_avatar = 0;

  monogram = self->_monogram;
  self->_monogram = 0;

  badged_image = self->_badged_image;
  self->_badged_image = 0;

  unint64_t v11 = 7;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_whichValue = v11;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = v4;
}

- (_SFPBRFBadgedImage)badged_image
{
  if (self->_whichValue == 6) {
    v2 = self->_badged_image;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setBadged_image:(id)a3
{
  id v4 = (_SFPBRFBadgedImage *)a3;
  url = self->_url;
  self->_url = 0;

  symbol = self->_symbol;
  self->_symbol = 0;

  app_icon = self->_app_icon;
  self->_app_icon = 0;

  avatar = self->_avatar;
  self->_avatar = 0;

  monogram = self->_monogram;
  self->_monogram = 0;

  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

  unint64_t v11 = 6;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_whichValue = v11;
  badged_image = self->_badged_image;
  self->_badged_image = v4;
}

- (_SFPBRFMonogramImage)monogram
{
  if (self->_whichValue == 5) {
    v2 = self->_monogram;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMonogram:(id)a3
{
  id v4 = (_SFPBRFMonogramImage *)a3;
  url = self->_url;
  self->_url = 0;

  symbol = self->_symbol;
  self->_symbol = 0;

  app_icon = self->_app_icon;
  self->_app_icon = 0;

  avatar = self->_avatar;
  self->_avatar = 0;

  badged_image = self->_badged_image;
  self->_badged_image = 0;

  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

  unint64_t v11 = 5;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_whichValue = v11;
  monogram = self->_monogram;
  self->_monogram = v4;
}

- (_SFPBRFAvatarImage)avatar
{
  if (self->_whichValue == 4) {
    v2 = self->_avatar;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAvatar:(id)a3
{
  id v4 = (_SFPBRFAvatarImage *)a3;
  url = self->_url;
  self->_url = 0;

  symbol = self->_symbol;
  self->_symbol = 0;

  app_icon = self->_app_icon;
  self->_app_icon = 0;

  monogram = self->_monogram;
  self->_monogram = 0;

  badged_image = self->_badged_image;
  self->_badged_image = 0;

  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

  self->_whichValue = 4 * (v4 != 0);
  avatar = self->_avatar;
  self->_avatar = v4;
}

- (_SFPBRFAppIconImage)app_icon
{
  if (self->_whichValue == 3) {
    v2 = self->_app_icon;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setApp_icon:(id)a3
{
  id v4 = (_SFPBRFAppIconImage *)a3;
  url = self->_url;
  self->_url = 0;

  symbol = self->_symbol;
  self->_symbol = 0;

  avatar = self->_avatar;
  self->_avatar = 0;

  monogram = self->_monogram;
  self->_monogram = 0;

  badged_image = self->_badged_image;
  self->_badged_image = 0;

  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

  unint64_t v11 = 3;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_whichValue = v11;
  app_icon = self->_app_icon;
  self->_app_icon = v4;
}

- (_SFPBRFSymbolImage)symbol
{
  if (self->_whichValue == 2) {
    v2 = self->_symbol;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSymbol:(id)a3
{
  id v4 = (_SFPBRFSymbolImage *)a3;
  url = self->_url;
  self->_url = 0;

  app_icon = self->_app_icon;
  self->_app_icon = 0;

  avatar = self->_avatar;
  self->_avatar = 0;

  monogram = self->_monogram;
  self->_monogram = 0;

  badged_image = self->_badged_image;
  self->_badged_image = 0;

  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

  self->_whichValue = 2 * (v4 != 0);
  symbol = self->_symbol;
  self->_symbol = v4;
}

- (_SFPBRFUrlImage)url
{
  if (self->_whichValue == 1) {
    v2 = self->_url;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUrl:(id)a3
{
  id v4 = (_SFPBRFUrlImage *)a3;
  symbol = self->_symbol;
  self->_symbol = 0;

  app_icon = self->_app_icon;
  self->_app_icon = 0;

  avatar = self->_avatar;
  self->_avatar = 0;

  monogram = self->_monogram;
  self->_monogram = 0;

  badged_image = self->_badged_image;
  self->_badged_image = 0;

  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

  self->_whichValue = v4 != 0;
  url = self->_url;
  self->_url = v4;
}

@end