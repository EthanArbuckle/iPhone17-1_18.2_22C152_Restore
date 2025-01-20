@interface _SFPBURLShareItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBURL)urlValue;
- (_SFPBURLShareItem)initWithDictionary:(id)a3;
- (_SFPBURLShareItem)initWithFacade:(id)a3;
- (_SFPBURLShareItem)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setUrlValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBURLShareItem

- (_SFPBURLShareItem)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBURLShareItem *)self init];
  if (v5)
  {
    v6 = [v4 urlValue];

    if (v6)
    {
      v7 = [_SFPBURL alloc];
      v8 = [v4 urlValue];
      v9 = [(_SFPBURL *)v7 initWithNSURL:v8];
      [(_SFPBURLShareItem *)v5 setUrlValue:v9];
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (_SFPBURL)urlValue
{
  return self->_urlValue;
}

- (_SFPBURLShareItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBURLShareItem;
  v5 = [(_SFPBURLShareItem *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"urlValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBURL alloc] initWithDictionary:v6];
      [(_SFPBURLShareItem *)v5 setUrlValue:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (_SFPBURLShareItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBURLShareItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBURLShareItem *)self dictionaryRepresentation];
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
  if (self->_urlValue)
  {
    id v4 = [(_SFPBURLShareItem *)self urlValue];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"urlValue"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"urlValue"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  return [(_SFPBURL *)self->_urlValue hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBURLShareItem *)self urlValue];
    v6 = [v4 urlValue];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBURLShareItem *)self urlValue];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(_SFPBURLShareItem *)self urlValue];
      v11 = [v4 urlValue];
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
  id v4 = [(_SFPBURLShareItem *)self urlValue];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBURLShareItemReadFrom(self, (uint64_t)a3);
}

- (void)setUrlValue:(id)a3
{
}

@end