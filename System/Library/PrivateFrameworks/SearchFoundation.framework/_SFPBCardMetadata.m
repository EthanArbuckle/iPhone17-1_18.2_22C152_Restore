@interface _SFPBCardMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)isServerEntity;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)queryToSearchAcrossAllDomains;
- (_SFPBCardMetadata)initWithDictionary:(id)a3;
- (_SFPBCardMetadata)initWithFacade:(id)a3;
- (_SFPBCardMetadata)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setIsServerEntity:(BOOL)a3;
- (void)setQueryToSearchAcrossAllDomains:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCardMetadata

- (_SFPBCardMetadata)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBCardMetadata *)self init];
  if (v5)
  {
    if ([v4 hasIsServerEntity]) {
      -[_SFPBCardMetadata setIsServerEntity:](v5, "setIsServerEntity:", [v4 isServerEntity]);
    }
    v6 = [v4 queryToSearchAcrossAllDomains];

    if (v6)
    {
      v7 = [v4 queryToSearchAcrossAllDomains];
      [(_SFPBCardMetadata *)v5 setQueryToSearchAcrossAllDomains:v7];
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (NSString)queryToSearchAcrossAllDomains
{
  return self->_queryToSearchAcrossAllDomains;
}

- (BOOL)isServerEntity
{
  return self->_isServerEntity;
}

- (_SFPBCardMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBCardMetadata;
  v5 = [(_SFPBCardMetadata *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isServerEntity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCardMetadata setIsServerEntity:](v5, "setIsServerEntity:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"queryToSearchAcrossAllDomains"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(_SFPBCardMetadata *)v5 setQueryToSearchAcrossAllDomains:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBCardMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCardMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCardMetadata *)self dictionaryRepresentation];
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
  if (self->_isServerEntity)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCardMetadata isServerEntity](self, "isServerEntity"));
    [v3 setObject:v4 forKeyedSubscript:@"isServerEntity"];
  }
  if (self->_queryToSearchAcrossAllDomains)
  {
    v5 = [(_SFPBCardMetadata *)self queryToSearchAcrossAllDomains];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"queryToSearchAcrossAllDomains"];
  }
  return v3;
}

- (unint64_t)hash
{
  if (self->_isServerEntity) {
    uint64_t v2 = 2654435761;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_queryToSearchAcrossAllDomains hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int isServerEntity = self->_isServerEntity;
    if (isServerEntity == [v4 isServerEntity])
    {
      v6 = [(_SFPBCardMetadata *)self queryToSearchAcrossAllDomains];
      uint64_t v7 = [v4 queryToSearchAcrossAllDomains];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(_SFPBCardMetadata *)self queryToSearchAcrossAllDomains];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        objc_super v11 = [(_SFPBCardMetadata *)self queryToSearchAcrossAllDomains];
        v12 = [v4 queryToSearchAcrossAllDomains];
        char v13 = [v11 isEqual:v12];

        if (v13) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
  }
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ([(_SFPBCardMetadata *)self isServerEntity]) {
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(_SFPBCardMetadata *)self queryToSearchAcrossAllDomains];
  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCardMetadataReadFrom(self, (uint64_t)a3);
}

- (void)setQueryToSearchAcrossAllDomains:(id)a3
{
  self->_queryToSearchAcrossAllDomains = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIsServerEntity:(BOOL)a3
{
  self->_int isServerEntity = a3;
}

@end