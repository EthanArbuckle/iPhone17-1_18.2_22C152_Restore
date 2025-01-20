@interface _SFPBRFAppIconImage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)application_bundle_identifier;
- (_SFPBRFAppIconImage)initWithDictionary:(id)a3;
- (_SFPBRFAppIconImage)initWithFacade:(id)a3;
- (_SFPBRFAppIconImage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)image_style;
- (unint64_t)hash;
- (void)setApplication_bundle_identifier:(id)a3;
- (void)setImage_style:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFAppIconImage

- (_SFPBRFAppIconImage)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFAppIconImage *)self init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "application_bundle_identifier");

    if (v6)
    {
      v7 = objc_msgSend(v4, "application_bundle_identifier");
      [(_SFPBRFAppIconImage *)v5 setApplication_bundle_identifier:v7];
    }
    if (objc_msgSend(v4, "hasImage_style")) {
      -[_SFPBRFAppIconImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (int)image_style
{
  return self->_image_style;
}

- (NSString)application_bundle_identifier
{
  return self->_application_bundle_identifier;
}

- (_SFPBRFAppIconImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBRFAppIconImage;
  v5 = [(_SFPBRFAppIconImage *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"applicationBundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBRFAppIconImage *)v5 setApplication_bundle_identifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"imageStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFAppIconImage setImage_style:](v5, "setImage_style:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBRFAppIconImage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFAppIconImage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFAppIconImage *)self dictionaryRepresentation];
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
  if (self->_application_bundle_identifier)
  {
    id v4 = [(_SFPBRFAppIconImage *)self application_bundle_identifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"applicationBundleIdentifier"];
  }
  if (self->_image_style)
  {
    uint64_t v6 = [(_SFPBRFAppIconImage *)self image_style];
    if v6 < 0x2A && ((0x3FFDFFFFFFFuLL >> v6))
    {
      uint64_t v7 = off_1E5A2ED80[v6];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v7 forKeyedSubscript:@"imageStyle"];
  }
  return v3;
}

- (unint64_t)hash
{
  return (2654435761 * self->_image_style) ^ [(NSString *)self->_application_bundle_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBRFAppIconImage *)self application_bundle_identifier];
    uint64_t v6 = objc_msgSend(v4, "application_bundle_identifier");
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBRFAppIconImage *)self application_bundle_identifier];
      if (!v8)
      {

LABEL_10:
        int image_style = self->_image_style;
        BOOL v13 = image_style == objc_msgSend(v4, "image_style");
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_SFPBRFAppIconImage *)self application_bundle_identifier];
      objc_super v11 = objc_msgSend(v4, "application_bundle_identifier");
      int v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(_SFPBRFAppIconImage *)self application_bundle_identifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBRFAppIconImage *)self image_style]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFAppIconImageReadFrom(self, (uint64_t)a3);
}

- (void)setImage_style:(int)a3
{
  self->_int image_style = a3;
}

- (void)setApplication_bundle_identifier:(id)a3
{
  self->_application_bundle_identifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end