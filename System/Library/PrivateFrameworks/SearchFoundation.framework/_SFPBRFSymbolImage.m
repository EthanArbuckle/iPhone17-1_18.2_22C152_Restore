@interface _SFPBRFSymbolImage
- (BOOL)isEqual:(id)a3;
- (BOOL)punches_through_background;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)name;
- (_SFPBRFColor)background_color;
- (_SFPBRFColor)primary_color;
- (_SFPBRFColor)secondary_color;
- (_SFPBRFSymbolImage)initWithDictionary:(id)a3;
- (_SFPBRFSymbolImage)initWithFacade:(id)a3;
- (_SFPBRFSymbolImage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)corner_rounding_mode;
- (int)image_style;
- (int)symbol_rendering_mode;
- (int)vibrancy;
- (unint64_t)hash;
- (void)setBackground_color:(id)a3;
- (void)setCorner_rounding_mode:(int)a3;
- (void)setImage_style:(int)a3;
- (void)setName:(id)a3;
- (void)setPrimary_color:(id)a3;
- (void)setPunches_through_background:(BOOL)a3;
- (void)setSecondary_color:(id)a3;
- (void)setSymbol_rendering_mode:(int)a3;
- (void)setVibrancy:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFSymbolImage

- (_SFPBRFSymbolImage)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFSymbolImage *)self init];
  if (v5)
  {
    v6 = [v4 name];

    if (v6)
    {
      v7 = [v4 name];
      [(_SFPBRFSymbolImage *)v5 setName:v7];
    }
    v8 = objc_msgSend(v4, "primary_color");

    if (v8)
    {
      v9 = [_SFPBRFColor alloc];
      v10 = objc_msgSend(v4, "primary_color");
      v11 = [(_SFPBRFColor *)v9 initWithFacade:v10];
      [(_SFPBRFSymbolImage *)v5 setPrimary_color:v11];
    }
    v12 = objc_msgSend(v4, "secondary_color");

    if (v12)
    {
      v13 = [_SFPBRFColor alloc];
      v14 = objc_msgSend(v4, "secondary_color");
      v15 = [(_SFPBRFColor *)v13 initWithFacade:v14];
      [(_SFPBRFSymbolImage *)v5 setSecondary_color:v15];
    }
    if (objc_msgSend(v4, "hasImage_style")) {
      -[_SFPBRFSymbolImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    }
    if (objc_msgSend(v4, "hasSymbol_rendering_mode")) {
      -[_SFPBRFSymbolImage setSymbol_rendering_mode:](v5, "setSymbol_rendering_mode:", objc_msgSend(v4, "symbol_rendering_mode"));
    }
    v16 = objc_msgSend(v4, "background_color");

    if (v16)
    {
      v17 = [_SFPBRFColor alloc];
      v18 = objc_msgSend(v4, "background_color");
      v19 = [(_SFPBRFColor *)v17 initWithFacade:v18];
      [(_SFPBRFSymbolImage *)v5 setBackground_color:v19];
    }
    if (objc_msgSend(v4, "hasPunches_through_background")) {
      -[_SFPBRFSymbolImage setPunches_through_background:](v5, "setPunches_through_background:", objc_msgSend(v4, "punches_through_background"));
    }
    if ([v4 hasVibrancy]) {
      -[_SFPBRFSymbolImage setVibrancy:](v5, "setVibrancy:", [v4 vibrancy]);
    }
    if (objc_msgSend(v4, "hasCorner_rounding_mode")) {
      -[_SFPBRFSymbolImage setCorner_rounding_mode:](v5, "setCorner_rounding_mode:", objc_msgSend(v4, "corner_rounding_mode"));
    }
    v20 = v5;
  }

  return v5;
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

- (_SFPBRFColor)background_color
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

- (_SFPBRFColor)secondary_color
{
  return self->_secondary_color;
}

- (_SFPBRFColor)primary_color
{
  return self->_primary_color;
}

- (NSString)name
{
  return self->_name;
}

- (_SFPBRFSymbolImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_SFPBRFSymbolImage;
  v5 = [(_SFPBRFSymbolImage *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBRFSymbolImage *)v5 setName:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"primaryColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFColor alloc] initWithDictionary:v8];
      [(_SFPBRFSymbolImage *)v5 setPrimary_color:v9];
    }
    v10 = objc_msgSend(v4, "objectForKeyedSubscript:", @"secondaryColor", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFColor alloc] initWithDictionary:v10];
      [(_SFPBRFSymbolImage *)v5 setSecondary_color:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"imageStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFSymbolImage setImage_style:](v5, "setImage_style:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"symbolRenderingMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFSymbolImage setSymbol_rendering_mode:](v5, "setSymbol_rendering_mode:", [v13 intValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[_SFPBRFColor alloc] initWithDictionary:v14];
      [(_SFPBRFSymbolImage *)v5 setBackground_color:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchesThroughBackground"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFSymbolImage setPunches_through_background:](v5, "setPunches_through_background:", [v16 BOOLValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"vibrancy"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFSymbolImage setVibrancy:](v5, "setVibrancy:", [v17 intValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"cornerRoundingMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFSymbolImage setCorner_rounding_mode:](v5, "setCorner_rounding_mode:", [v18 intValue]);
    }
    v19 = v5;
  }
  return v5;
}

- (_SFPBRFSymbolImage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFSymbolImage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFSymbolImage *)self dictionaryRepresentation];
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
  if (self->_background_color)
  {
    id v4 = [(_SFPBRFSymbolImage *)self background_color];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"backgroundColor"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"backgroundColor"];
    }
  }
  if (self->_corner_rounding_mode)
  {
    uint64_t v7 = [(_SFPBRFSymbolImage *)self corner_rounding_mode];
    if (v7 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E5A2F058[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"cornerRoundingMode"];
  }
  if (self->_image_style)
  {
    uint64_t v9 = [(_SFPBRFSymbolImage *)self image_style];
    if v9 < 0x2A && ((0x3FFDFFFFFFFuLL >> v9))
    {
      v10 = off_1E5A2ED80[v9];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v10 forKeyedSubscript:@"imageStyle"];
  }
  if (self->_name)
  {
    v11 = [(_SFPBRFSymbolImage *)self name];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"name"];
  }
  if (self->_primary_color)
  {
    v13 = [(_SFPBRFSymbolImage *)self primary_color];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"primaryColor"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"primaryColor"];
    }
  }
  if (self->_punches_through_background)
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFSymbolImage punches_through_background](self, "punches_through_background"));
    [v3 setObject:v16 forKeyedSubscript:@"punchesThroughBackground"];
  }
  if (self->_secondary_color)
  {
    v17 = [(_SFPBRFSymbolImage *)self secondary_color];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"secondaryColor"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"secondaryColor"];
    }
  }
  if (self->_symbol_rendering_mode)
  {
    uint64_t v20 = [(_SFPBRFSymbolImage *)self symbol_rendering_mode];
    if (v20 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v20);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E5A2EF58[v20];
    }
    [v3 setObject:v21 forKeyedSubscript:@"symbolRenderingMode"];
  }
  if (self->_vibrancy)
  {
    uint64_t v22 = [(_SFPBRFSymbolImage *)self vibrancy];
    if (v22 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E5A2F058[v22];
    }
    [v3 setObject:v23 forKeyedSubscript:@"vibrancy"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  unint64_t v4 = [(_SFPBRFColor *)self->_primary_color hash];
  unint64_t v5 = [(_SFPBRFColor *)self->_secondary_color hash];
  uint64_t v6 = 2654435761 * self->_image_style;
  uint64_t v7 = 2654435761 * self->_symbol_rendering_mode;
  unint64_t v8 = [(_SFPBRFColor *)self->_background_color hash];
  if (self->_punches_through_background) {
    uint64_t v9 = 2654435761;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ (2654435761 * self->_vibrancy) ^ (2654435761
                                                                              * self->_corner_rounding_mode);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  unint64_t v5 = [(_SFPBRFSymbolImage *)self name];
  uint64_t v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v7 = [(_SFPBRFSymbolImage *)self name];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRFSymbolImage *)self name];
    v10 = [v4 name];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSymbolImage *)self primary_color];
  uint64_t v6 = objc_msgSend(v4, "primary_color");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v12 = [(_SFPBRFSymbolImage *)self primary_color];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBRFSymbolImage *)self primary_color];
    v15 = objc_msgSend(v4, "primary_color");
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSymbolImage *)self secondary_color];
  uint64_t v6 = objc_msgSend(v4, "secondary_color");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v17 = [(_SFPBRFSymbolImage *)self secondary_color];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBRFSymbolImage *)self secondary_color];
    uint64_t v20 = objc_msgSend(v4, "secondary_color");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  int image_style = self->_image_style;
  if (image_style != objc_msgSend(v4, "image_style")) {
    goto LABEL_24;
  }
  int symbol_rendering_mode = self->_symbol_rendering_mode;
  if (symbol_rendering_mode != objc_msgSend(v4, "symbol_rendering_mode")) {
    goto LABEL_24;
  }
  unint64_t v5 = [(_SFPBRFSymbolImage *)self background_color];
  uint64_t v6 = objc_msgSend(v4, "background_color");
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v24 = [(_SFPBRFSymbolImage *)self background_color];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_SFPBRFSymbolImage *)self background_color];
    v27 = objc_msgSend(v4, "background_color");
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  int punches_through_background = self->_punches_through_background;
  if (punches_through_background == objc_msgSend(v4, "punches_through_background"))
  {
    int vibrancy = self->_vibrancy;
    if (vibrancy == [v4 vibrancy])
    {
      int corner_rounding_mode = self->_corner_rounding_mode;
      BOOL v29 = corner_rounding_mode == objc_msgSend(v4, "corner_rounding_mode");
      goto LABEL_25;
    }
  }
LABEL_24:
  BOOL v29 = 0;
LABEL_25:

  return v29;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_SFPBRFSymbolImage *)self name];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  unint64_t v5 = [(_SFPBRFSymbolImage *)self primary_color];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBRFSymbolImage *)self secondary_color];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFSymbolImage *)self image_style]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRFSymbolImage *)self symbol_rendering_mode]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(_SFPBRFSymbolImage *)self background_color];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFSymbolImage *)self punches_through_background]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBRFSymbolImage *)self vibrancy]) {
    PBDataWriterWriteInt32Field();
  }
  int v8 = [(_SFPBRFSymbolImage *)self corner_rounding_mode];
  uint64_t v9 = v10;
  if (v8)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSymbolImageReadFrom(self, (uint64_t)a3);
}

- (void)setCorner_rounding_mode:(int)a3
{
  self->_int corner_rounding_mode = a3;
}

- (void)setVibrancy:(int)a3
{
  self->_int vibrancy = a3;
}

- (void)setPunches_through_background:(BOOL)a3
{
  self->_int punches_through_background = a3;
}

- (void)setBackground_color:(id)a3
{
}

- (void)setSymbol_rendering_mode:(int)a3
{
  self->_int symbol_rendering_mode = a3;
}

- (void)setImage_style:(int)a3
{
  self->_int image_style = a3;
}

- (void)setSecondary_color:(id)a3
{
}

- (void)setPrimary_color:(id)a3
{
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end