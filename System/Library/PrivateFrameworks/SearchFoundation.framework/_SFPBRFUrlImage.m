@interface _SFPBRFUrlImage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)dark_mode_url;
- (NSString)url;
- (_SFPBRFAspectRatio)aspect_ratio;
- (_SFPBRFColor)background_color;
- (_SFPBRFSymbolImage)symbol_placeholder_image;
- (_SFPBRFUrlImage)initWithDictionary:(id)a3;
- (_SFPBRFUrlImage)initWithFacade:(id)a3;
- (_SFPBRFUrlImage)initWithJSON:(id)a3;
- (float)inset_padding;
- (id)dictionaryRepresentation;
- (int)corner_rounding_mode;
- (int)image_rendering_mode;
- (int)image_style;
- (int)sizing_mode;
- (unint64_t)hash;
- (unint64_t)whichPlaceholder_Image;
- (void)setAspect_ratio:(id)a3;
- (void)setBackground_color:(id)a3;
- (void)setCorner_rounding_mode:(int)a3;
- (void)setDark_mode_url:(id)a3;
- (void)setImage_rendering_mode:(int)a3;
- (void)setImage_style:(int)a3;
- (void)setInset_padding:(float)a3;
- (void)setSizing_mode:(int)a3;
- (void)setSymbol_placeholder_image:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFUrlImage

- (_SFPBRFUrlImage)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFUrlImage *)self init];
  if (v5)
  {
    v6 = [v4 url];

    if (v6)
    {
      v7 = [v4 url];
      [(_SFPBRFUrlImage *)v5 setUrl:v7];
    }
    v8 = objc_msgSend(v4, "dark_mode_url");

    if (v8)
    {
      v9 = objc_msgSend(v4, "dark_mode_url");
      [(_SFPBRFUrlImage *)v5 setDark_mode_url:v9];
    }
    if (objc_msgSend(v4, "hasSymbol_placeholder_image"))
    {
      v10 = objc_msgSend(v4, "symbol_placeholder_image");

      if (v10)
      {
        v11 = [_SFPBRFSymbolImage alloc];
        v12 = objc_msgSend(v4, "symbol_placeholder_image");
        v13 = [(_SFPBRFSymbolImage *)v11 initWithFacade:v12];
        [(_SFPBRFUrlImage *)v5 setSymbol_placeholder_image:v13];
      }
    }
    if (objc_msgSend(v4, "hasImage_style")) {
      -[_SFPBRFUrlImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    }
    v14 = objc_msgSend(v4, "aspect_ratio");

    if (v14)
    {
      v15 = [_SFPBRFAspectRatio alloc];
      v16 = objc_msgSend(v4, "aspect_ratio");
      v17 = [(_SFPBRFAspectRatio *)v15 initWithFacade:v16];
      [(_SFPBRFUrlImage *)v5 setAspect_ratio:v17];
    }
    if (objc_msgSend(v4, "hasSizing_mode")) {
      -[_SFPBRFUrlImage setSizing_mode:](v5, "setSizing_mode:", objc_msgSend(v4, "sizing_mode"));
    }
    if (objc_msgSend(v4, "hasImage_rendering_mode")) {
      -[_SFPBRFUrlImage setImage_rendering_mode:](v5, "setImage_rendering_mode:", objc_msgSend(v4, "image_rendering_mode"));
    }
    v18 = objc_msgSend(v4, "background_color");

    if (v18)
    {
      v19 = [_SFPBRFColor alloc];
      v20 = objc_msgSend(v4, "background_color");
      v21 = [(_SFPBRFColor *)v19 initWithFacade:v20];
      [(_SFPBRFUrlImage *)v5 setBackground_color:v21];
    }
    if (objc_msgSend(v4, "hasCorner_rounding_mode")) {
      -[_SFPBRFUrlImage setCorner_rounding_mode:](v5, "setCorner_rounding_mode:", objc_msgSend(v4, "corner_rounding_mode"));
    }
    v22 = objc_msgSend(v4, "inset_padding");

    if (v22)
    {
      v23 = objc_msgSend(v4, "inset_padding");
      [v23 floatValue];
      -[_SFPBRFUrlImage setInset_padding:](v5, "setInset_padding:");
    }
    v24 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background_color, 0);
  objc_storeStrong((id *)&self->_aspect_ratio, 0);
  objc_storeStrong((id *)&self->_symbol_placeholder_image, 0);
  objc_storeStrong((id *)&self->_dark_mode_url, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (unint64_t)whichPlaceholder_Image
{
  return self->_whichPlaceholder_Image;
}

- (float)inset_padding
{
  return self->_inset_padding;
}

- (int)corner_rounding_mode
{
  return self->_corner_rounding_mode;
}

- (_SFPBRFColor)background_color
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

- (_SFPBRFAspectRatio)aspect_ratio
{
  return self->_aspect_ratio;
}

- (int)image_style
{
  return self->_image_style;
}

- (NSString)dark_mode_url
{
  return self->_dark_mode_url;
}

- (NSString)url
{
  return self->_url;
}

- (_SFPBRFUrlImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_SFPBRFUrlImage;
  v5 = [(_SFPBRFUrlImage *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBRFUrlImage *)v5 setUrl:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"darkModeUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBRFUrlImage *)v5 setDark_mode_url:v9];
    }
    v23 = v8;
    v24 = v6;
    v10 = [v4 objectForKeyedSubscript:@"symbolPlaceholderImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFSymbolImage alloc] initWithDictionary:v10];
      [(_SFPBRFUrlImage *)v5 setSymbol_placeholder_image:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"imageStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFUrlImage setImage_style:](v5, "setImage_style:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"aspectRatio"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [[_SFPBRFAspectRatio alloc] initWithDictionary:v13];
      [(_SFPBRFUrlImage *)v5 setAspect_ratio:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"sizingMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFUrlImage setSizing_mode:](v5, "setSizing_mode:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"imageRenderingMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFUrlImage setImage_rendering_mode:](v5, "setImage_rendering_mode:", [v16 intValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[_SFPBRFColor alloc] initWithDictionary:v17];
      [(_SFPBRFUrlImage *)v5 setBackground_color:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"cornerRoundingMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFUrlImage setCorner_rounding_mode:](v5, "setCorner_rounding_mode:", [v19 intValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"insetPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v20 floatValue];
      -[_SFPBRFUrlImage setInset_padding:](v5, "setInset_padding:");
    }
    v21 = v5;
  }
  return v5;
}

- (_SFPBRFUrlImage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFUrlImage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFUrlImage *)self dictionaryRepresentation];
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
  if (self->_aspect_ratio)
  {
    id v4 = [(_SFPBRFUrlImage *)self aspect_ratio];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"aspectRatio"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"aspectRatio"];
    }
  }
  if (self->_background_color)
  {
    uint64_t v7 = [(_SFPBRFUrlImage *)self background_color];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"backgroundColor"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"backgroundColor"];
    }
  }
  if (self->_corner_rounding_mode)
  {
    uint64_t v10 = [(_SFPBRFUrlImage *)self corner_rounding_mode];
    if (v10 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E5A2F058[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"cornerRoundingMode"];
  }
  if (self->_dark_mode_url)
  {
    v12 = [(_SFPBRFUrlImage *)self dark_mode_url];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"darkModeUrl"];
  }
  if (self->_image_rendering_mode)
  {
    uint64_t v14 = [(_SFPBRFUrlImage *)self image_rendering_mode];
    if (v14 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E5A2F058[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"imageRenderingMode"];
  }
  if (self->_image_style)
  {
    uint64_t v16 = [(_SFPBRFUrlImage *)self image_style];
    if v16 < 0x2A && ((0x3FFDFFFFFFFuLL >> v16))
    {
      v17 = off_1E5A2ED80[v16];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v17 forKeyedSubscript:@"imageStyle"];
  }
  if (self->_inset_padding != 0.0)
  {
    v18 = NSNumber;
    [(_SFPBRFUrlImage *)self inset_padding];
    v19 = objc_msgSend(v18, "numberWithFloat:");
    [v3 setObject:v19 forKeyedSubscript:@"insetPadding"];
  }
  if (self->_sizing_mode)
  {
    uint64_t v20 = [(_SFPBRFUrlImage *)self sizing_mode];
    if (v20 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v20);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E5A2F058[v20];
    }
    [v3 setObject:v21 forKeyedSubscript:@"sizingMode"];
  }
  if (self->_symbol_placeholder_image)
  {
    v22 = [(_SFPBRFUrlImage *)self symbol_placeholder_image];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"symbolPlaceholderImage"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"symbolPlaceholderImage"];
    }
  }
  if (self->_url)
  {
    objc_super v25 = [(_SFPBRFUrlImage *)self url];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"url"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_url hash];
  NSUInteger v4 = [(NSString *)self->_dark_mode_url hash];
  unint64_t v5 = [(_SFPBRFSymbolImage *)self->_symbol_placeholder_image hash];
  uint64_t image_style = self->_image_style;
  unint64_t v7 = [(_SFPBRFAspectRatio *)self->_aspect_ratio hash];
  uint64_t sizing_mode = self->_sizing_mode;
  uint64_t image_rendering_mode = self->_image_rendering_mode;
  unint64_t v10 = [(_SFPBRFColor *)self->_background_color hash];
  uint64_t corner_rounding_mode = self->_corner_rounding_mode;
  float inset_padding = self->_inset_padding;
  BOOL v13 = inset_padding < 0.0;
  if (inset_padding == 0.0)
  {
    unint64_t v18 = 0;
  }
  else
  {
    double v14 = inset_padding;
    double v15 = -v14;
    if (!v13) {
      double v15 = v14;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v18 += (unint64_t)v17;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v17);
    }
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ (2654435761 * image_style) ^ (2654435761 * sizing_mode) ^ (2654435761
                                                                                          * image_rendering_mode) ^ v10 ^ (2654435761 * corner_rounding_mode) ^ v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  unint64_t v5 = [(_SFPBRFUrlImage *)self url];
  v6 = [v4 url];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v7 = [(_SFPBRFUrlImage *)self url];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFUrlImage *)self url];
    unint64_t v10 = [v4 url];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFUrlImage *)self dark_mode_url];
  v6 = objc_msgSend(v4, "dark_mode_url");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v12 = [(_SFPBRFUrlImage *)self dark_mode_url];
  if (v12)
  {
    BOOL v13 = (void *)v12;
    double v14 = [(_SFPBRFUrlImage *)self dark_mode_url];
    double v15 = objc_msgSend(v4, "dark_mode_url");
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFUrlImage *)self symbol_placeholder_image];
  v6 = objc_msgSend(v4, "symbol_placeholder_image");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v17 = [(_SFPBRFUrlImage *)self symbol_placeholder_image];
  if (v17)
  {
    unint64_t v18 = (void *)v17;
    v19 = [(_SFPBRFUrlImage *)self symbol_placeholder_image];
    uint64_t v20 = objc_msgSend(v4, "symbol_placeholder_image");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  int image_style = self->_image_style;
  if (image_style != objc_msgSend(v4, "image_style")) {
    goto LABEL_30;
  }
  unint64_t v5 = [(_SFPBRFUrlImage *)self aspect_ratio];
  v6 = objc_msgSend(v4, "aspect_ratio");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v23 = [(_SFPBRFUrlImage *)self aspect_ratio];
  if (v23)
  {
    v24 = (void *)v23;
    objc_super v25 = [(_SFPBRFUrlImage *)self aspect_ratio];
    v26 = objc_msgSend(v4, "aspect_ratio");
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  int sizing_mode = self->_sizing_mode;
  if (sizing_mode != objc_msgSend(v4, "sizing_mode")) {
    goto LABEL_30;
  }
  int image_rendering_mode = self->_image_rendering_mode;
  if (image_rendering_mode != objc_msgSend(v4, "image_rendering_mode")) {
    goto LABEL_30;
  }
  unint64_t v5 = [(_SFPBRFUrlImage *)self background_color];
  v6 = objc_msgSend(v4, "background_color");
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v30 = [(_SFPBRFUrlImage *)self background_color];
  if (v30)
  {
    v31 = (void *)v30;
    v32 = [(_SFPBRFUrlImage *)self background_color];
    v33 = objc_msgSend(v4, "background_color");
    int v34 = [v32 isEqual:v33];

    if (!v34) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  int corner_rounding_mode = self->_corner_rounding_mode;
  if (corner_rounding_mode == objc_msgSend(v4, "corner_rounding_mode"))
  {
    float inset_padding = self->_inset_padding;
    objc_msgSend(v4, "inset_padding");
    BOOL v35 = inset_padding == v39;
    goto LABEL_31;
  }
LABEL_30:
  BOOL v35 = 0;
LABEL_31:

  return v35;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_SFPBRFUrlImage *)self url];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  unint64_t v5 = [(_SFPBRFUrlImage *)self dark_mode_url];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  v6 = [(_SFPBRFUrlImage *)self symbol_placeholder_image];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFUrlImage *)self image_style]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(_SFPBRFUrlImage *)self aspect_ratio];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFUrlImage *)self sizing_mode]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRFUrlImage *)self image_rendering_mode]) {
    PBDataWriterWriteInt32Field();
  }
  v8 = [(_SFPBRFUrlImage *)self background_color];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFUrlImage *)self corner_rounding_mode]) {
    PBDataWriterWriteInt32Field();
  }
  [(_SFPBRFUrlImage *)self inset_padding];
  v9 = v11;
  if (v10 != 0.0)
  {
    PBDataWriterWriteFloatField();
    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFUrlImageReadFrom(self, (uint64_t)a3, v3);
}

- (void)setInset_padding:(float)a3
{
  self->_float inset_padding = a3;
}

- (void)setCorner_rounding_mode:(int)a3
{
  self->_int corner_rounding_mode = a3;
}

- (void)setBackground_color:(id)a3
{
}

- (void)setImage_rendering_mode:(int)a3
{
  self->_int image_rendering_mode = a3;
}

- (void)setSizing_mode:(int)a3
{
  self->_int sizing_mode = a3;
}

- (void)setAspect_ratio:(id)a3
{
}

- (void)setImage_style:(int)a3
{
  self->_int image_style = a3;
}

- (_SFPBRFSymbolImage)symbol_placeholder_image
{
  if (self->_whichPlaceholder_Image == 1) {
    v2 = self->_symbol_placeholder_image;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSymbol_placeholder_image:(id)a3
{
  self->_whichPlaceholder_Image = a3 != 0;
  objc_storeStrong((id *)&self->_symbol_placeholder_image, a3);
}

- (void)setDark_mode_url:(id)a3
{
  self->_dark_mode_url = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setUrl:(id)a3
{
  self->_url = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end