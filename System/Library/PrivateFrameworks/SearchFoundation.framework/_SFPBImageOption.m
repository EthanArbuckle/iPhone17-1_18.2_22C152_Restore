@interface _SFPBImageOption
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)defaultValue;
- (NSString)name;
- (_SFPBImageOption)initWithDictionary:(id)a3;
- (_SFPBImageOption)initWithFacade:(id)a3;
- (_SFPBImageOption)initWithJSON:(id)a3;
- (_SFPBStringDictionary)options;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setDefaultValue:(id)a3;
- (void)setName:(id)a3;
- (void)setOptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBImageOption

- (_SFPBImageOption)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBImageOption *)self init];
  if (v5)
  {
    v6 = [v4 name];

    if (v6)
    {
      v7 = [v4 name];
      [(_SFPBImageOption *)v5 setName:v7];
    }
    v8 = [v4 defaultValue];

    if (v8)
    {
      v9 = [v4 defaultValue];
      [(_SFPBImageOption *)v5 setDefaultValue:v9];
    }
    v10 = [v4 options];

    if (v10)
    {
      v11 = [_SFPBStringDictionary alloc];
      v12 = [v4 options];
      v13 = [(_SFPBStringDictionary *)v11 initWithNSDictionary:v12];
      [(_SFPBImageOption *)v5 setOptions:v13];
    }
    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (_SFPBStringDictionary)options
{
  return self->_options;
}

- (NSString)defaultValue
{
  return self->_defaultValue;
}

- (NSString)name
{
  return self->_name;
}

- (_SFPBImageOption)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBImageOption;
  v5 = [(_SFPBImageOption *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBImageOption *)v5 setName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"defaultValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBImageOption *)v5 setDefaultValue:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"options"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBStringDictionary alloc] initWithDictionary:v10];
      [(_SFPBImageOption *)v5 setOptions:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (_SFPBImageOption)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBImageOption *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBImageOption *)self dictionaryRepresentation];
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
  if (self->_defaultValue)
  {
    id v4 = [(_SFPBImageOption *)self defaultValue];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"defaultValue"];
  }
  if (self->_name)
  {
    v6 = [(_SFPBImageOption *)self name];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"name"];
  }
  if (self->_options)
  {
    v8 = [(_SFPBImageOption *)self options];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"options"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"options"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_defaultValue hash] ^ v3;
  return v4 ^ [(_SFPBStringDictionary *)self->_options hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBImageOption *)self name];
  v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBImageOption *)self name];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBImageOption *)self name];
    v10 = [v4 name];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBImageOption *)self defaultValue];
  v6 = [v4 defaultValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBImageOption *)self defaultValue];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(_SFPBImageOption *)self defaultValue];
    v15 = [v4 defaultValue];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBImageOption *)self options];
  v6 = [v4 options];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBImageOption *)self options];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBImageOption *)self options];
    v20 = [v4 options];
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
  id v4 = [(_SFPBImageOption *)self name];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBImageOption *)self defaultValue];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  v6 = [(_SFPBImageOption *)self options];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBImageOptionReadFrom(self, (uint64_t)a3);
}

- (void)setOptions:(id)a3
{
}

- (void)setDefaultValue:(id)a3
{
  self->_defaultValue = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end