@interface _SFPBAppIconImage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)bundleIdentifier;
- (_SFPBAppIconImage)initWithDictionary:(id)a3;
- (_SFPBAppIconImage)initWithFacade:(id)a3;
- (_SFPBAppIconImage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)iconType;
- (unint64_t)hash;
- (void)setBundleIdentifier:(id)a3;
- (void)setIconType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBAppIconImage

- (_SFPBAppIconImage)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBAppIconImage *)self init];
  if (v5)
  {
    v6 = [v4 bundleIdentifier];

    if (v6)
    {
      v7 = [v4 bundleIdentifier];
      [(_SFPBAppIconImage *)v5 setBundleIdentifier:v7];
    }
    if ([v4 hasIconType]) {
      -[_SFPBAppIconImage setIconType:](v5, "setIconType:", [v4 iconType]);
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (int)iconType
{
  return self->_iconType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (_SFPBAppIconImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBAppIconImage;
  v5 = [(_SFPBAppIconImage *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBAppIconImage *)v5 setBundleIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"iconType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAppIconImage setIconType:](v5, "setIconType:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBAppIconImage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBAppIconImage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBAppIconImage *)self dictionaryRepresentation];
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
  if (self->_bundleIdentifier)
  {
    id v4 = [(_SFPBAppIconImage *)self bundleIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleIdentifier"];
  }
  if (self->_iconType)
  {
    uint64_t v6 = [(_SFPBAppIconImage *)self iconType];
    if (v6)
    {
      if (v6 == 1)
      {
        uint64_t v7 = @"1";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v7 = @"0";
    }
    [v3 setObject:v7 forKeyedSubscript:@"iconType"];
  }
  return v3;
}

- (unint64_t)hash
{
  return (2654435761 * self->_iconType) ^ [(NSString *)self->_bundleIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBAppIconImage *)self bundleIdentifier];
    uint64_t v6 = [v4 bundleIdentifier];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBAppIconImage *)self bundleIdentifier];
      if (!v8)
      {

LABEL_10:
        int iconType = self->_iconType;
        BOOL v13 = iconType == [v4 iconType];
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_SFPBAppIconImage *)self bundleIdentifier];
      objc_super v11 = [v4 bundleIdentifier];
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
  id v4 = [(_SFPBAppIconImage *)self bundleIdentifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBAppIconImage *)self iconType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAppIconImageReadFrom(self, (uint64_t)a3);
}

- (void)setIconType:(int)a3
{
  self->_int iconType = a3;
}

- (void)setBundleIdentifier:(id)a3
{
  self->_bundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end