@interface _SFPBURL
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)address;
- (_SFPBURL)initWithDictionary:(id)a3;
- (_SFPBURL)initWithJSON:(id)a3;
- (_SFPBURL)initWithNSURL:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAddress:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBURL

- (_SFPBURL)initWithNSURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBURL;
  v5 = [(_SFPBURL *)&v9 init];
  if (v5)
  {
    v6 = [v4 absoluteString];
    [(_SFPBURL *)v5 setAddress:v6];

    v7 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (NSString)address
{
  return self->_address;
}

- (_SFPBURL)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBURL;
  v5 = [(_SFPBURL *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"address"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBURL *)v5 setAddress:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (_SFPBURL)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBURL *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBURL *)self dictionaryRepresentation];
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
  if (self->_address)
  {
    id v4 = [(_SFPBURL *)self address];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"address"];
  }
  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_address hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBURL *)self address];
    v6 = [v4 address];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBURL *)self address];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      objc_super v9 = (void *)v8;
      objc_super v10 = [(_SFPBURL *)self address];
      v11 = [v4 address];
      char v12 = [v10 isEqual:v11];

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
  id v4 = [(_SFPBURL *)self address];
  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBURLReadFrom(self, (uint64_t)a3);
}

- (void)setAddress:(id)a3
{
  self->_address = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end