@interface _SFPBAppLink
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)title;
- (_SFPBAppLink)initWithDictionary:(id)a3;
- (_SFPBAppLink)initWithFacade:(id)a3;
- (_SFPBAppLink)initWithJSON:(id)a3;
- (_SFPBImage)image;
- (_SFPBPunchout)appPunchout;
- (id)dictionaryRepresentation;
- (int)imageAlign;
- (unint64_t)hash;
- (void)setAppPunchout:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageAlign:(int)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBAppLink

- (_SFPBAppLink)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBAppLink *)self init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [v4 title];
      [(_SFPBAppLink *)v5 setTitle:v7];
    }
    v8 = [v4 appPunchout];

    if (v8)
    {
      v9 = [_SFPBPunchout alloc];
      v10 = [v4 appPunchout];
      v11 = [(_SFPBPunchout *)v9 initWithFacade:v10];
      [(_SFPBAppLink *)v5 setAppPunchout:v11];
    }
    v12 = [v4 image];

    if (v12)
    {
      v13 = [_SFPBImage alloc];
      v14 = [v4 image];
      v15 = [(_SFPBImage *)v13 initWithFacade:v14];
      [(_SFPBAppLink *)v5 setImage:v15];
    }
    if ([v4 hasImageAlign]) {
      -[_SFPBAppLink setImageAlign:](v5, "setImageAlign:", [v4 imageAlign]);
    }
    v16 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_appPunchout, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (int)imageAlign
{
  return self->_imageAlign;
}

- (_SFPBImage)image
{
  return self->_image;
}

- (_SFPBPunchout)appPunchout
{
  return self->_appPunchout;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBAppLink)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBAppLink;
  v5 = [(_SFPBAppLink *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBAppLink *)v5 setTitle:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"appPunchout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBPunchout alloc] initWithDictionary:v8];
      [(_SFPBAppLink *)v5 setAppPunchout:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"image"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBImage alloc] initWithDictionary:v10];
      [(_SFPBAppLink *)v5 setImage:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"imageAlign"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAppLink setImageAlign:](v5, "setImageAlign:", [v12 intValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (_SFPBAppLink)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBAppLink *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBAppLink *)self dictionaryRepresentation];
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
  if (self->_appPunchout)
  {
    id v4 = [(_SFPBAppLink *)self appPunchout];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"appPunchout"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"appPunchout"];
    }
  }
  if (self->_image)
  {
    uint64_t v7 = [(_SFPBAppLink *)self image];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"image"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"image"];
    }
  }
  if (self->_imageAlign)
  {
    uint64_t v10 = [(_SFPBAppLink *)self imageAlign];
    if (v10 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E5A2EF58[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"imageAlign"];
  }
  if (self->_title)
  {
    v12 = [(_SFPBAppLink *)self title];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"title"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  unint64_t v4 = [(_SFPBPunchout *)self->_appPunchout hash];
  return v4 ^ v3 ^ [(_SFPBImage *)self->_image hash] ^ (2654435761 * self->_imageAlign);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBAppLink *)self title];
  v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBAppLink *)self title];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBAppLink *)self title];
    uint64_t v10 = [v4 title];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBAppLink *)self appPunchout];
  v6 = [v4 appPunchout];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBAppLink *)self appPunchout];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBAppLink *)self appPunchout];
    objc_super v15 = [v4 appPunchout];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBAppLink *)self image];
  v6 = [v4 image];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBAppLink *)self image];
    if (!v17)
    {

LABEL_20:
      int imageAlign = self->_imageAlign;
      BOOL v22 = imageAlign == [v4 imageAlign];
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBAppLink *)self image];
    v20 = [v4 image];
    int v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_SFPBAppLink *)self title];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBAppLink *)self appPunchout];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  v6 = [(_SFPBAppLink *)self image];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  int v7 = [(_SFPBAppLink *)self imageAlign];
  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteInt32Field();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAppLinkReadFrom(self, (uint64_t)a3);
}

- (void)setImageAlign:(int)a3
{
  self->_int imageAlign = a3;
}

- (void)setImage:(id)a3
{
}

- (void)setAppPunchout:(id)a3
{
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end