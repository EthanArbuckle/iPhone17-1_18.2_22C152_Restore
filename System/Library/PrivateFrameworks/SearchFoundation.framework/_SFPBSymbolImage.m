@interface _SFPBSymbolImage
- (BOOL)isEqual:(id)a3;
- (BOOL)punchThroughBackground;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)symbolName;
- (_SFPBSymbolImage)initWithDictionary:(id)a3;
- (_SFPBSymbolImage)initWithFacade:(id)a3;
- (_SFPBSymbolImage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)backgroundColor;
- (int)fillStyle;
- (int)primaryColor;
- (int)secondaryColor;
- (unint64_t)hash;
- (void)setBackgroundColor:(int)a3;
- (void)setFillStyle:(int)a3;
- (void)setPrimaryColor:(int)a3;
- (void)setPunchThroughBackground:(BOOL)a3;
- (void)setSecondaryColor:(int)a3;
- (void)setSymbolName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBSymbolImage

- (_SFPBSymbolImage)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBSymbolImage *)self init];
  if (v5)
  {
    v6 = [v4 symbolName];

    if (v6)
    {
      v7 = [v4 symbolName];
      [(_SFPBSymbolImage *)v5 setSymbolName:v7];
    }
    if ([v4 hasPunchThroughBackground]) {
      -[_SFPBSymbolImage setPunchThroughBackground:](v5, "setPunchThroughBackground:", [v4 punchThroughBackground]);
    }
    if ([v4 hasBackgroundColor]) {
      -[_SFPBSymbolImage setBackgroundColor:](v5, "setBackgroundColor:", [v4 backgroundColor]);
    }
    if ([v4 hasPrimaryColor]) {
      -[_SFPBSymbolImage setPrimaryColor:](v5, "setPrimaryColor:", [v4 primaryColor]);
    }
    if ([v4 hasSecondaryColor]) {
      -[_SFPBSymbolImage setSecondaryColor:](v5, "setSecondaryColor:", [v4 secondaryColor]);
    }
    if ([v4 hasFillStyle]) {
      -[_SFPBSymbolImage setFillStyle:](v5, "setFillStyle:", [v4 fillStyle]);
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (int)fillStyle
{
  return self->_fillStyle;
}

- (int)secondaryColor
{
  return self->_secondaryColor;
}

- (int)primaryColor
{
  return self->_primaryColor;
}

- (int)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)punchThroughBackground
{
  return self->_punchThroughBackground;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (_SFPBSymbolImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBSymbolImage;
  v5 = [(_SFPBSymbolImage *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"symbolName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBSymbolImage *)v5 setSymbolName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"punchThroughBackground"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSymbolImage setPunchThroughBackground:](v5, "setPunchThroughBackground:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSymbolImage setBackgroundColor:](v5, "setBackgroundColor:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"primaryColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSymbolImage setPrimaryColor:](v5, "setPrimaryColor:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"secondaryColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSymbolImage setSecondaryColor:](v5, "setSecondaryColor:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"fillStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSymbolImage setFillStyle:](v5, "setFillStyle:", [v12 intValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (_SFPBSymbolImage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBSymbolImage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBSymbolImage *)self dictionaryRepresentation];
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
  if (self->_backgroundColor)
  {
    uint64_t v4 = [(_SFPBSymbolImage *)self backgroundColor];
    if (v4 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2EF80[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"backgroundColor"];
  }
  if (self->_fillStyle)
  {
    uint64_t v6 = [(_SFPBSymbolImage *)self fillStyle];
    if (v6 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = off_1E5A2F058[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"fillStyle"];
  }
  if (self->_primaryColor)
  {
    uint64_t v8 = [(_SFPBSymbolImage *)self primaryColor];
    if (v8 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E5A2EF80[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"primaryColor"];
  }
  if (self->_punchThroughBackground)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBSymbolImage punchThroughBackground](self, "punchThroughBackground"));
    [v3 setObject:v10 forKeyedSubscript:@"punchThroughBackground"];
  }
  if (self->_secondaryColor)
  {
    uint64_t v11 = [(_SFPBSymbolImage *)self secondaryColor];
    if (v11 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E5A2EF80[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"secondaryColor"];
  }
  if (self->_symbolName)
  {
    v13 = [(_SFPBSymbolImage *)self symbolName];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"symbolName"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_symbolName hash];
  if (self->_punchThroughBackground) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ (2654435761 * self->_backgroundColor) ^ (2654435761 * self->_primaryColor) ^ (2654435761 * self->_secondaryColor) ^ (2654435761 * self->_fillStyle);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  v5 = [(_SFPBSymbolImage *)self symbolName];
  uint64_t v6 = [v4 symbolName];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_13:
    BOOL v18 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = [(_SFPBSymbolImage *)self symbolName];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_SFPBSymbolImage *)self symbolName];
    uint64_t v11 = [v4 symbolName];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  int punchThroughBackground = self->_punchThroughBackground;
  if (punchThroughBackground != [v4 punchThroughBackground]) {
    goto LABEL_13;
  }
  int backgroundColor = self->_backgroundColor;
  if (backgroundColor != [v4 backgroundColor]) {
    goto LABEL_13;
  }
  int primaryColor = self->_primaryColor;
  if (primaryColor != [v4 primaryColor]) {
    goto LABEL_13;
  }
  int secondaryColor = self->_secondaryColor;
  if (secondaryColor != [v4 secondaryColor]) {
    goto LABEL_13;
  }
  int fillStyle = self->_fillStyle;
  BOOL v18 = fillStyle == [v4 fillStyle];
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_SFPBSymbolImage *)self symbolName];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBSymbolImage *)self punchThroughBackground]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBSymbolImage *)self backgroundColor]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBSymbolImage *)self primaryColor]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBSymbolImage *)self secondaryColor]) {
    PBDataWriterWriteInt32Field();
  }
  int v5 = [(_SFPBSymbolImage *)self fillStyle];
  uint64_t v6 = v7;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSymbolImageReadFrom(self, (uint64_t)a3);
}

- (void)setFillStyle:(int)a3
{
  self->_int fillStyle = a3;
}

- (void)setSecondaryColor:(int)a3
{
  self->_int secondaryColor = a3;
}

- (void)setPrimaryColor:(int)a3
{
  self->_int primaryColor = a3;
}

- (void)setBackgroundColor:(int)a3
{
  self->_int backgroundColor = a3;
}

- (void)setPunchThroughBackground:(BOOL)a3
{
  self->_int punchThroughBackground = a3;
}

- (void)setSymbolName:(id)a3
{
  self->_symbolName = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end