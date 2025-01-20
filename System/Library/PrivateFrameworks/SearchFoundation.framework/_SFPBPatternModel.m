@interface _SFPBPatternModel
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSData)pattern_parameters;
- (NSString)pattern_bundle_id;
- (NSString)pattern_id;
- (NSString)pattern_template_directory;
- (_SFPBPatternModel)initWithDictionary:(id)a3;
- (_SFPBPatternModel)initWithFacade:(id)a3;
- (_SFPBPatternModel)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setPattern_bundle_id:(id)a3;
- (void)setPattern_id:(id)a3;
- (void)setPattern_parameters:(id)a3;
- (void)setPattern_template_directory:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBPatternModel

- (_SFPBPatternModel)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBPatternModel *)self init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "pattern_id");

    if (v6)
    {
      v7 = objc_msgSend(v4, "pattern_id");
      [(_SFPBPatternModel *)v5 setPattern_id:v7];
    }
    v8 = objc_msgSend(v4, "pattern_parameters");

    if (v8)
    {
      v9 = objc_msgSend(v4, "pattern_parameters");
      [(_SFPBPatternModel *)v5 setPattern_parameters:v9];
    }
    v10 = objc_msgSend(v4, "pattern_bundle_id");

    if (v10)
    {
      v11 = objc_msgSend(v4, "pattern_bundle_id");
      [(_SFPBPatternModel *)v5 setPattern_bundle_id:v11];
    }
    v12 = objc_msgSend(v4, "pattern_template_directory");

    if (v12)
    {
      v13 = objc_msgSend(v4, "pattern_template_directory");
      [(_SFPBPatternModel *)v5 setPattern_template_directory:v13];
    }
    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern_template_directory, 0);
  objc_storeStrong((id *)&self->_pattern_bundle_id, 0);
  objc_storeStrong((id *)&self->_pattern_parameters, 0);
  objc_storeStrong((id *)&self->_pattern_id, 0);
}

- (NSString)pattern_template_directory
{
  return self->_pattern_template_directory;
}

- (NSString)pattern_bundle_id
{
  return self->_pattern_bundle_id;
}

- (NSData)pattern_parameters
{
  return self->_pattern_parameters;
}

- (NSString)pattern_id
{
  return self->_pattern_id;
}

- (_SFPBPatternModel)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SFPBPatternModel;
  v5 = [(_SFPBPatternModel *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"patternId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBPatternModel *)v5 setPattern_id:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"patternParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
      [(_SFPBPatternModel *)v5 setPattern_parameters:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"patternBundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBPatternModel *)v5 setPattern_bundle_id:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"patternTemplateDirectory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(_SFPBPatternModel *)v5 setPattern_template_directory:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (_SFPBPatternModel)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBPatternModel *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBPatternModel *)self dictionaryRepresentation];
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
  if (self->_pattern_bundle_id)
  {
    id v4 = [(_SFPBPatternModel *)self pattern_bundle_id];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"patternBundleId"];
  }
  if (self->_pattern_id)
  {
    v6 = [(_SFPBPatternModel *)self pattern_id];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"patternId"];
  }
  if (self->_pattern_parameters)
  {
    v8 = [(_SFPBPatternModel *)self pattern_parameters];
    v9 = [v8 base64EncodedStringWithOptions:0];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"patternParameters"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"patternParameters"];
    }
  }
  if (self->_pattern_template_directory)
  {
    v11 = [(_SFPBPatternModel *)self pattern_template_directory];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"patternTemplateDirectory"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_pattern_id hash];
  uint64_t v4 = [(NSData *)self->_pattern_parameters hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_pattern_bundle_id hash];
  return v4 ^ v5 ^ [(NSString *)self->_pattern_template_directory hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(_SFPBPatternModel *)self pattern_id];
  v6 = objc_msgSend(v4, "pattern_id");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_SFPBPatternModel *)self pattern_id];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBPatternModel *)self pattern_id];
    v10 = objc_msgSend(v4, "pattern_id");
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPatternModel *)self pattern_parameters];
  v6 = objc_msgSend(v4, "pattern_parameters");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_SFPBPatternModel *)self pattern_parameters];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBPatternModel *)self pattern_parameters];
    v15 = objc_msgSend(v4, "pattern_parameters");
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPatternModel *)self pattern_bundle_id];
  v6 = objc_msgSend(v4, "pattern_bundle_id");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_SFPBPatternModel *)self pattern_bundle_id];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBPatternModel *)self pattern_bundle_id];
    v20 = objc_msgSend(v4, "pattern_bundle_id");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPatternModel *)self pattern_template_directory];
  v6 = objc_msgSend(v4, "pattern_template_directory");
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_SFPBPatternModel *)self pattern_template_directory];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_SFPBPatternModel *)self pattern_template_directory];
    v25 = objc_msgSend(v4, "pattern_template_directory");
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_SFPBPatternModel *)self pattern_id];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v5 = [(_SFPBPatternModel *)self pattern_parameters];
  if (v5) {
    PBDataWriterWriteDataField();
  }

  v6 = [(_SFPBPatternModel *)self pattern_bundle_id];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  uint64_t v7 = [(_SFPBPatternModel *)self pattern_template_directory];
  if (v7) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPatternModelReadFrom(self, (uint64_t)a3);
}

- (void)setPattern_template_directory:(id)a3
{
  self->_pattern_template_directory = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPattern_bundle_id:(id)a3
{
  self->_pattern_bundle_id = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPattern_parameters:(id)a3
{
  self->_pattern_parameters = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPattern_id:(id)a3
{
  self->_pattern_id = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end