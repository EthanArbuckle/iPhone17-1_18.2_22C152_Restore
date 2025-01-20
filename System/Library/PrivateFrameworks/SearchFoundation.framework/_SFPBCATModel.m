@interface _SFPBCATModel
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSData)params;
- (NSString)bundleIdentifier;
- (NSString)catIdentifier;
- (_SFPBCATModel)initWithDictionary:(id)a3;
- (_SFPBCATModel)initWithFacade:(id)a3;
- (_SFPBCATModel)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setBundleIdentifier:(id)a3;
- (void)setCatIdentifier:(id)a3;
- (void)setParams:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCATModel

- (_SFPBCATModel)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBCATModel *)self init];
  if (v5)
  {
    v6 = [v4 catIdentifier];

    if (v6)
    {
      v7 = [v4 catIdentifier];
      [(_SFPBCATModel *)v5 setCatIdentifier:v7];
    }
    v8 = [v4 bundleIdentifier];

    if (v8)
    {
      v9 = [v4 bundleIdentifier];
      [(_SFPBCATModel *)v5 setBundleIdentifier:v9];
    }
    v10 = [v4 params];

    if (v10)
    {
      v11 = [v4 params];
      [(_SFPBCATModel *)v5 setParams:v11];
    }
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_catIdentifier, 0);
}

- (NSData)params
{
  return self->_params;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)catIdentifier
{
  return self->_catIdentifier;
}

- (_SFPBCATModel)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBCATModel;
  v5 = [(_SFPBCATModel *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"catIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBCATModel *)v5 setCatIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBCATModel *)v5 setBundleIdentifier:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"params"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
      [(_SFPBCATModel *)v5 setParams:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (_SFPBCATModel)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCATModel *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCATModel *)self dictionaryRepresentation];
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
    id v4 = [(_SFPBCATModel *)self bundleIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleIdentifier"];
  }
  if (self->_catIdentifier)
  {
    v6 = [(_SFPBCATModel *)self catIdentifier];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"catIdentifier"];
  }
  if (self->_params)
  {
    v8 = [(_SFPBCATModel *)self params];
    v9 = [v8 base64EncodedStringWithOptions:0];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"params"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"params"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_catIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_bundleIdentifier hash] ^ v3;
  return v4 ^ [(NSData *)self->_params hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBCATModel *)self catIdentifier];
  v6 = [v4 catIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBCATModel *)self catIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBCATModel *)self catIdentifier];
    v10 = [v4 catIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBCATModel *)self bundleIdentifier];
  v6 = [v4 bundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBCATModel *)self bundleIdentifier];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(_SFPBCATModel *)self bundleIdentifier];
    v15 = [v4 bundleIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBCATModel *)self params];
  v6 = [v4 params];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBCATModel *)self params];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBCATModel *)self params];
    v20 = [v4 params];
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
  id v4 = [(_SFPBCATModel *)self catIdentifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBCATModel *)self bundleIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  v6 = [(_SFPBCATModel *)self params];
  if (v6) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCATModelReadFrom(self, (uint64_t)a3);
}

- (void)setParams:(id)a3
{
  self->_params = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setBundleIdentifier:(id)a3
{
  self->_bundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCatIdentifier:(id)a3
{
  self->_catIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end