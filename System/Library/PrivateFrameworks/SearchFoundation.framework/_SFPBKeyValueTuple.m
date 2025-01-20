@interface _SFPBKeyValueTuple
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)key;
- (NSString)value;
- (_SFPBKeyValueTuple)initWithDictionary:(id)a3;
- (_SFPBKeyValueTuple)initWithFacade:(id)a3;
- (_SFPBKeyValueTuple)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBKeyValueTuple

- (_SFPBKeyValueTuple)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBKeyValueTuple *)self init];
  if (v5)
  {
    v6 = [v4 key];

    if (v6)
    {
      v7 = [v4 key];
      [(_SFPBKeyValueTuple *)v5 setKey:v7];
    }
    v8 = [v4 value];

    if (v8)
    {
      v9 = [v4 value];
      [(_SFPBKeyValueTuple *)v5 setValue:v9];
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (NSString)value
{
  return self->_value;
}

- (NSString)key
{
  return self->_key;
}

- (_SFPBKeyValueTuple)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBKeyValueTuple;
  v5 = [(_SFPBKeyValueTuple *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"key"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBKeyValueTuple *)v5 setKey:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBKeyValueTuple *)v5 setValue:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBKeyValueTuple)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBKeyValueTuple *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBKeyValueTuple *)self dictionaryRepresentation];
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
    id v4 = [(_SFPBKeyValueTuple *)self key];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"key"];
  }
  if (self->_value)
  {
    v6 = [(_SFPBKeyValueTuple *)self value];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"value"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  return [(NSString *)self->_value hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBKeyValueTuple *)self key];
  v6 = [v4 key];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBKeyValueTuple *)self key];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBKeyValueTuple *)self key];
    v10 = [v4 key];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBKeyValueTuple *)self value];
  v6 = [v4 value];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBKeyValueTuple *)self value];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBKeyValueTuple *)self value];
    v15 = [v4 value];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_SFPBKeyValueTuple *)self key];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBKeyValueTuple *)self value];
  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBKeyValueTupleReadFrom(self, (uint64_t)a3);
}

- (void)setValue:(id)a3
{
  self->_value = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setKey:(id)a3
{
  self->_key = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end