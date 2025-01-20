@interface _SFPBAppEntityAnnotation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)entityIdentifer;
- (NSString)typeIdentifer;
- (_SFPBAppEntityAnnotation)initWithDictionary:(id)a3;
- (_SFPBAppEntityAnnotation)initWithFacade:(id)a3;
- (_SFPBAppEntityAnnotation)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setEntityIdentifer:(id)a3;
- (void)setTypeIdentifer:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBAppEntityAnnotation

- (_SFPBAppEntityAnnotation)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBAppEntityAnnotation *)self init];
  if (v5)
  {
    v6 = [v4 typeIdentifer];

    if (v6)
    {
      v7 = [v4 typeIdentifer];
      [(_SFPBAppEntityAnnotation *)v5 setTypeIdentifer:v7];
    }
    v8 = [v4 entityIdentifer];

    if (v8)
    {
      v9 = [v4 entityIdentifer];
      [(_SFPBAppEntityAnnotation *)v5 setEntityIdentifer:v9];
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifer, 0);
  objc_storeStrong((id *)&self->_typeIdentifer, 0);
}

- (NSString)entityIdentifer
{
  return self->_entityIdentifer;
}

- (NSString)typeIdentifer
{
  return self->_typeIdentifer;
}

- (_SFPBAppEntityAnnotation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBAppEntityAnnotation;
  v5 = [(_SFPBAppEntityAnnotation *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"typeIdentifer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBAppEntityAnnotation *)v5 setTypeIdentifer:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"entityIdentifer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBAppEntityAnnotation *)v5 setEntityIdentifer:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBAppEntityAnnotation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBAppEntityAnnotation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBAppEntityAnnotation *)self dictionaryRepresentation];
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
  if (self->_entityIdentifer)
  {
    id v4 = [(_SFPBAppEntityAnnotation *)self entityIdentifer];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"entityIdentifer"];
  }
  if (self->_typeIdentifer)
  {
    v6 = [(_SFPBAppEntityAnnotation *)self typeIdentifer];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"typeIdentifer"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_typeIdentifer hash];
  return [(NSString *)self->_entityIdentifer hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBAppEntityAnnotation *)self typeIdentifer];
  v6 = [v4 typeIdentifer];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBAppEntityAnnotation *)self typeIdentifer];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBAppEntityAnnotation *)self typeIdentifer];
    v10 = [v4 typeIdentifer];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBAppEntityAnnotation *)self entityIdentifer];
  v6 = [v4 entityIdentifer];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBAppEntityAnnotation *)self entityIdentifer];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBAppEntityAnnotation *)self entityIdentifer];
    v15 = [v4 entityIdentifer];
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
  id v4 = [(_SFPBAppEntityAnnotation *)self typeIdentifer];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBAppEntityAnnotation *)self entityIdentifer];
  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAppEntityAnnotationReadFrom(self, (uint64_t)a3);
}

- (void)setEntityIdentifer:(id)a3
{
  self->_entityIdentifer = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setTypeIdentifer:(id)a3
{
  self->_typeIdentifer = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end