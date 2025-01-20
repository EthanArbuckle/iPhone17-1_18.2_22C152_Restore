@interface _SFPBOpenCoreSpotlightItemCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)actionIdentifier;
- (NSString)applicationBundleIdentifier;
- (NSString)coreSpotlightIdentifier;
- (_SFPBOpenCoreSpotlightItemCommand)initWithDictionary:(id)a3;
- (_SFPBOpenCoreSpotlightItemCommand)initWithFacade:(id)a3;
- (_SFPBOpenCoreSpotlightItemCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setActionIdentifier:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setCoreSpotlightIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBOpenCoreSpotlightItemCommand

- (_SFPBOpenCoreSpotlightItemCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBOpenCoreSpotlightItemCommand *)self init];
  if (v5)
  {
    v6 = [v4 coreSpotlightIdentifier];

    if (v6)
    {
      v7 = [v4 coreSpotlightIdentifier];
      [(_SFPBOpenCoreSpotlightItemCommand *)v5 setCoreSpotlightIdentifier:v7];
    }
    v8 = [v4 applicationBundleIdentifier];

    if (v8)
    {
      v9 = [v4 applicationBundleIdentifier];
      [(_SFPBOpenCoreSpotlightItemCommand *)v5 setApplicationBundleIdentifier:v9];
    }
    v10 = [v4 actionIdentifier];

    if (v10)
    {
      v11 = [v4 actionIdentifier];
      [(_SFPBOpenCoreSpotlightItemCommand *)v5 setActionIdentifier:v11];
    }
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (_SFPBOpenCoreSpotlightItemCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBOpenCoreSpotlightItemCommand;
  v5 = [(_SFPBOpenCoreSpotlightItemCommand *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"coreSpotlightIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBOpenCoreSpotlightItemCommand *)v5 setCoreSpotlightIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"applicationBundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBOpenCoreSpotlightItemCommand *)v5 setApplicationBundleIdentifier:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"actionIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBOpenCoreSpotlightItemCommand *)v5 setActionIdentifier:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (_SFPBOpenCoreSpotlightItemCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBOpenCoreSpotlightItemCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBOpenCoreSpotlightItemCommand *)self dictionaryRepresentation];
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
  if (self->_actionIdentifier)
  {
    id v4 = [(_SFPBOpenCoreSpotlightItemCommand *)self actionIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"actionIdentifier"];
  }
  if (self->_applicationBundleIdentifier)
  {
    v6 = [(_SFPBOpenCoreSpotlightItemCommand *)self applicationBundleIdentifier];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"applicationBundleIdentifier"];
  }
  if (self->_coreSpotlightIdentifier)
  {
    v8 = [(_SFPBOpenCoreSpotlightItemCommand *)self coreSpotlightIdentifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"coreSpotlightIdentifier"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_coreSpotlightIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_applicationBundleIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_actionIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBOpenCoreSpotlightItemCommand *)self coreSpotlightIdentifier];
  v6 = [v4 coreSpotlightIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBOpenCoreSpotlightItemCommand *)self coreSpotlightIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBOpenCoreSpotlightItemCommand *)self coreSpotlightIdentifier];
    v10 = [v4 coreSpotlightIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBOpenCoreSpotlightItemCommand *)self applicationBundleIdentifier];
  v6 = [v4 applicationBundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBOpenCoreSpotlightItemCommand *)self applicationBundleIdentifier];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(_SFPBOpenCoreSpotlightItemCommand *)self applicationBundleIdentifier];
    v15 = [v4 applicationBundleIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBOpenCoreSpotlightItemCommand *)self actionIdentifier];
  v6 = [v4 actionIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBOpenCoreSpotlightItemCommand *)self actionIdentifier];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBOpenCoreSpotlightItemCommand *)self actionIdentifier];
    v20 = [v4 actionIdentifier];
    char v21 = [v19 isEqual:v20];

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
  id v7 = a3;
  id v4 = [(_SFPBOpenCoreSpotlightItemCommand *)self coreSpotlightIdentifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBOpenCoreSpotlightItemCommand *)self applicationBundleIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  v6 = [(_SFPBOpenCoreSpotlightItemCommand *)self actionIdentifier];
  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBOpenCoreSpotlightItemCommandReadFrom(self, (uint64_t)a3);
}

- (void)setActionIdentifier:(id)a3
{
  self->_actionIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  self->_applicationBundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
  self->_coreSpotlightIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end