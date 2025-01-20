@interface _SFPBUserActivityInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)key;
- (NSString)stringValue;
- (_SFPBURL)urlValue;
- (_SFPBUserActivityInfo)initWithDictionary:(id)a3;
- (_SFPBUserActivityInfo)initWithFacade:(id)a3;
- (_SFPBUserActivityInfo)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)valueType;
- (unint64_t)hash;
- (void)setKey:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setUrlValue:(id)a3;
- (void)setValueType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBUserActivityInfo

- (_SFPBUserActivityInfo)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBUserActivityInfo *)self init];
  if (v5)
  {
    if ([v4 hasValueType]) {
      -[_SFPBUserActivityInfo setValueType:](v5, "setValueType:", [v4 valueType]);
    }
    v6 = [v4 key];

    if (v6)
    {
      v7 = [v4 key];
      [(_SFPBUserActivityInfo *)v5 setKey:v7];
    }
    v8 = [v4 stringValue];

    if (v8)
    {
      v9 = [v4 stringValue];
      [(_SFPBUserActivityInfo *)v5 setStringValue:v9];
    }
    v10 = [v4 urlValue];

    if (v10)
    {
      v11 = [_SFPBURL alloc];
      v12 = [v4 urlValue];
      v13 = [(_SFPBURL *)v11 initWithNSURL:v12];
      [(_SFPBUserActivityInfo *)v5 setUrlValue:v13];
    }
    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (_SFPBURL)urlValue
{
  return self->_urlValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSString)key
{
  return self->_key;
}

- (int)valueType
{
  return self->_valueType;
}

- (_SFPBUserActivityInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBUserActivityInfo;
  v5 = [(_SFPBUserActivityInfo *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"valueType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBUserActivityInfo setValueType:](v5, "setValueType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"key"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(_SFPBUserActivityInfo *)v5 setKey:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"stringValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(_SFPBUserActivityInfo *)v5 setStringValue:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"urlValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[_SFPBURL alloc] initWithDictionary:v11];
      [(_SFPBUserActivityInfo *)v5 setUrlValue:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (_SFPBUserActivityInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBUserActivityInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBUserActivityInfo *)self dictionaryRepresentation];
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
  if (self->_key)
  {
    id v4 = [(_SFPBUserActivityInfo *)self key];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"key"];
  }
  if (self->_stringValue)
  {
    v6 = [(_SFPBUserActivityInfo *)self stringValue];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"stringValue"];
  }
  if (self->_urlValue)
  {
    v8 = [(_SFPBUserActivityInfo *)self urlValue];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"urlValue"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"urlValue"];
    }
  }
  if (self->_valueType)
  {
    uint64_t v11 = [(_SFPBUserActivityInfo *)self valueType];
    if (v11)
    {
      if (v11 == 1)
      {
        v12 = @"1";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = @"0";
    }
    [v3 setObject:v12 forKeyedSubscript:@"valueType"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_valueType;
  NSUInteger v4 = [(NSString *)self->_key hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_stringValue hash];
  return v5 ^ [(_SFPBURL *)self->_urlValue hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  int valueType = self->_valueType;
  if (valueType != [v4 valueType]) {
    goto LABEL_18;
  }
  v6 = [(_SFPBUserActivityInfo *)self key];
  uint64_t v7 = [v4 key];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(_SFPBUserActivityInfo *)self key];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_SFPBUserActivityInfo *)self key];
    uint64_t v11 = [v4 key];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(_SFPBUserActivityInfo *)self stringValue];
  uint64_t v7 = [v4 stringValue];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(_SFPBUserActivityInfo *)self stringValue];
  if (v13)
  {
    v14 = (void *)v13;
    objc_super v15 = [(_SFPBUserActivityInfo *)self stringValue];
    v16 = [v4 stringValue];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(_SFPBUserActivityInfo *)self urlValue];
  uint64_t v7 = [v4 urlValue];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(_SFPBUserActivityInfo *)self urlValue];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(_SFPBUserActivityInfo *)self urlValue];
    v21 = [v4 urlValue];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_SFPBUserActivityInfo *)self valueType]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_SFPBUserActivityInfo *)self key];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v5 = [(_SFPBUserActivityInfo *)self stringValue];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  v6 = [(_SFPBUserActivityInfo *)self urlValue];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBUserActivityInfoReadFrom(self, (uint64_t)a3);
}

- (void)setUrlValue:(id)a3
{
}

- (void)setStringValue:(id)a3
{
  self->_stringValue = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setKey:(id)a3
{
  self->_key = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setValueType:(int)a3
{
  self->_int valueType = a3;
}

@end