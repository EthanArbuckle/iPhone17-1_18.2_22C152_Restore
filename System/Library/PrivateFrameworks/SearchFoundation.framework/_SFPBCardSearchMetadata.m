@interface _SFPBCardSearchMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)isFederatedDomainSearch;
- (BOOL)isServerEntity;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)searchQuery;
- (NSString)viewConfigName;
- (_SFPBCardSearchMetadata)initWithDictionary:(id)a3;
- (_SFPBCardSearchMetadata)initWithFacade:(id)a3;
- (_SFPBCardSearchMetadata)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setIsFederatedDomainSearch:(BOOL)a3;
- (void)setIsServerEntity:(BOOL)a3;
- (void)setSearchQuery:(id)a3;
- (void)setViewConfigName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCardSearchMetadata

- (_SFPBCardSearchMetadata)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBCardSearchMetadata *)self init];
  if (v5)
  {
    if ([v4 hasIsServerEntity]) {
      -[_SFPBCardSearchMetadata setIsServerEntity:](v5, "setIsServerEntity:", [v4 isServerEntity]);
    }
    v6 = [v4 searchQuery];

    if (v6)
    {
      v7 = [v4 searchQuery];
      [(_SFPBCardSearchMetadata *)v5 setSearchQuery:v7];
    }
    v8 = [v4 viewConfigName];

    if (v8)
    {
      v9 = [v4 viewConfigName];
      [(_SFPBCardSearchMetadata *)v5 setViewConfigName:v9];
    }
    if ([v4 hasIsFederatedDomainSearch]) {
      -[_SFPBCardSearchMetadata setIsFederatedDomainSearch:](v5, "setIsFederatedDomainSearch:", [v4 isFederatedDomainSearch]);
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConfigName, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
}

- (BOOL)isFederatedDomainSearch
{
  return self->_isFederatedDomainSearch;
}

- (NSString)viewConfigName
{
  return self->_viewConfigName;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (BOOL)isServerEntity
{
  return self->_isServerEntity;
}

- (_SFPBCardSearchMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBCardSearchMetadata;
  v5 = [(_SFPBCardSearchMetadata *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isServerEntity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCardSearchMetadata setIsServerEntity:](v5, "setIsServerEntity:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"searchQuery"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(_SFPBCardSearchMetadata *)v5 setSearchQuery:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"viewConfigName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(_SFPBCardSearchMetadata *)v5 setViewConfigName:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"isFederatedDomainSearch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCardSearchMetadata setIsFederatedDomainSearch:](v5, "setIsFederatedDomainSearch:", [v11 BOOLValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (_SFPBCardSearchMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCardSearchMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCardSearchMetadata *)self dictionaryRepresentation];
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
  if (self->_isFederatedDomainSearch)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCardSearchMetadata isFederatedDomainSearch](self, "isFederatedDomainSearch"));
    [v3 setObject:v4 forKeyedSubscript:@"isFederatedDomainSearch"];
  }
  if (self->_isServerEntity)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCardSearchMetadata isServerEntity](self, "isServerEntity"));
    [v3 setObject:v5 forKeyedSubscript:@"isServerEntity"];
  }
  if (self->_searchQuery)
  {
    v6 = [(_SFPBCardSearchMetadata *)self searchQuery];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"searchQuery"];
  }
  if (self->_viewConfigName)
  {
    v8 = [(_SFPBCardSearchMetadata *)self viewConfigName];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"viewConfigName"];
  }
  return v3;
}

- (unint64_t)hash
{
  if (self->_isServerEntity) {
    uint64_t v3 = 2654435761;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_searchQuery hash];
  NSUInteger v5 = [(NSString *)self->_viewConfigName hash];
  if (self->_isFederatedDomainSearch) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v5 ^ v3 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  int isServerEntity = self->_isServerEntity;
  if (isServerEntity != [v4 isServerEntity]) {
    goto LABEL_13;
  }
  uint64_t v6 = [(_SFPBCardSearchMetadata *)self searchQuery];
  uint64_t v7 = [v4 searchQuery];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(_SFPBCardSearchMetadata *)self searchQuery];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_SFPBCardSearchMetadata *)self searchQuery];
    v11 = [v4 searchQuery];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBCardSearchMetadata *)self viewConfigName];
  uint64_t v7 = [v4 viewConfigName];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(_SFPBCardSearchMetadata *)self viewConfigName];
    if (!v13)
    {

LABEL_16:
      int isFederatedDomainSearch = self->_isFederatedDomainSearch;
      BOOL v18 = isFederatedDomainSearch == [v4 isFederatedDomainSearch];
      goto LABEL_14;
    }
    objc_super v14 = (void *)v13;
    v15 = [(_SFPBCardSearchMetadata *)self viewConfigName];
    v16 = [v4 viewConfigName];
    int v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_12:
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_SFPBCardSearchMetadata *)self isServerEntity]) {
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(_SFPBCardSearchMetadata *)self searchQuery];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v5 = [(_SFPBCardSearchMetadata *)self viewConfigName];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBCardSearchMetadata *)self isFederatedDomainSearch]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCardSearchMetadataReadFrom(self, (uint64_t)a3);
}

- (void)setIsFederatedDomainSearch:(BOOL)a3
{
  self->_int isFederatedDomainSearch = a3;
}

- (void)setViewConfigName:(id)a3
{
  self->_viewConfigName = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSearchQuery:(id)a3
{
  self->_searchQuery = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIsServerEntity:(BOOL)a3
{
  self->_int isServerEntity = a3;
}

@end