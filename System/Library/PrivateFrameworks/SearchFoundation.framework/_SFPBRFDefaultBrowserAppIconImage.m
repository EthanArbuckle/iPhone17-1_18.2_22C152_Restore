@interface _SFPBRFDefaultBrowserAppIconImage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFDefaultBrowserAppIconImage)initWithDictionary:(id)a3;
- (_SFPBRFDefaultBrowserAppIconImage)initWithFacade:(id)a3;
- (_SFPBRFDefaultBrowserAppIconImage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)image_style;
- (unint64_t)hash;
- (void)setImage_style:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFDefaultBrowserAppIconImage

- (_SFPBRFDefaultBrowserAppIconImage)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFDefaultBrowserAppIconImage *)self init];
  if (v5)
  {
    if (objc_msgSend(v4, "hasImage_style")) {
      -[_SFPBRFDefaultBrowserAppIconImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    }
    v6 = v5;
  }

  return v5;
}

- (int)image_style
{
  return self->_image_style;
}

- (_SFPBRFDefaultBrowserAppIconImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBRFDefaultBrowserAppIconImage;
  v5 = [(_SFPBRFDefaultBrowserAppIconImage *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"imageStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFDefaultBrowserAppIconImage setImage_style:](v5, "setImage_style:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (_SFPBRFDefaultBrowserAppIconImage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFDefaultBrowserAppIconImage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFDefaultBrowserAppIconImage *)self dictionaryRepresentation];
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
  if (self->_image_style)
  {
    uint64_t v4 = [(_SFPBRFDefaultBrowserAppIconImage *)self image_style];
    if v4 < 0x2A && ((0x3FFDFFFFFFFuLL >> v4))
    {
      v5 = off_1E5A2ED80[v4];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKeyedSubscript:@"imageStyle"];
  }
  return v3;
}

- (unint64_t)hash
{
  return 2654435761 * self->_image_style;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int image_style = self->_image_style;
    BOOL v6 = image_style == objc_msgSend(v4, "image_style");
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_SFPBRFDefaultBrowserAppIconImage *)self image_style]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFDefaultBrowserAppIconImageReadFrom(self, (uint64_t)a3);
}

- (void)setImage_style:(int)a3
{
  self->_int image_style = a3;
}

@end