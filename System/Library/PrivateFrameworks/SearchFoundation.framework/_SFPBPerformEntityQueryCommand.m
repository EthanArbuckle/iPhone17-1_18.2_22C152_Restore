@interface _SFPBPerformEntityQueryCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)entityIdentifier;
- (NSString)searchString;
- (NSString)tokenString;
- (_SFPBColor)entityBackgroundColor;
- (_SFPBDrillDownMetadata)drilldownMetadata;
- (_SFPBDrillDownMetadata)metadata;
- (_SFPBImage)tokenImage;
- (_SFPBPerformEntityQueryCommand)initWithDictionary:(id)a3;
- (_SFPBPerformEntityQueryCommand)initWithFacade:(id)a3;
- (_SFPBPerformEntityQueryCommand)initWithJSON:(id)a3;
- (_SFPBSymbolImage)symbolImage;
- (id)dictionaryRepresentation;
- (int)entityType;
- (unint64_t)hash;
- (void)setDrilldownMetadata:(id)a3;
- (void)setEntityBackgroundColor:(id)a3;
- (void)setEntityIdentifier:(id)a3;
- (void)setEntityType:(int)a3;
- (void)setMetadata:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSymbolImage:(id)a3;
- (void)setTokenImage:(id)a3;
- (void)setTokenString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBPerformEntityQueryCommand

- (_SFPBPerformEntityQueryCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBPerformEntityQueryCommand *)self init];
  if (v5)
  {
    v6 = [v4 searchString];

    if (v6)
    {
      v7 = [v4 searchString];
      [(_SFPBPerformEntityQueryCommand *)v5 setSearchString:v7];
    }
    v8 = [v4 tokenString];

    if (v8)
    {
      v9 = [v4 tokenString];
      [(_SFPBPerformEntityQueryCommand *)v5 setTokenString:v9];
    }
    v10 = [v4 symbolImage];

    if (v10)
    {
      v11 = [_SFPBSymbolImage alloc];
      v12 = [v4 symbolImage];
      v13 = [(_SFPBSymbolImage *)v11 initWithFacade:v12];
      [(_SFPBPerformEntityQueryCommand *)v5 setSymbolImage:v13];
    }
    if ([v4 hasEntityType]) {
      -[_SFPBPerformEntityQueryCommand setEntityType:](v5, "setEntityType:", [v4 entityType]);
    }
    v14 = [v4 entityIdentifier];

    if (v14)
    {
      v15 = [v4 entityIdentifier];
      [(_SFPBPerformEntityQueryCommand *)v5 setEntityIdentifier:v15];
    }
    v16 = [v4 entityBackgroundColor];

    if (v16)
    {
      v17 = [_SFPBColor alloc];
      v18 = [v4 entityBackgroundColor];
      v19 = [(_SFPBColor *)v17 initWithFacade:v18];
      [(_SFPBPerformEntityQueryCommand *)v5 setEntityBackgroundColor:v19];
    }
    v20 = [v4 metadata];

    if (v20)
    {
      v21 = [_SFPBDrillDownMetadata alloc];
      v22 = [v4 metadata];
      v23 = [(_SFPBDrillDownMetadata *)v21 initWithFacade:v22];
      [(_SFPBPerformEntityQueryCommand *)v5 setMetadata:v23];
    }
    v24 = [v4 drilldownMetadata];

    if (v24)
    {
      v25 = [_SFPBDrillDownMetadata alloc];
      v26 = [v4 drilldownMetadata];
      v27 = [(_SFPBDrillDownMetadata *)v25 initWithFacade:v26];
      [(_SFPBPerformEntityQueryCommand *)v5 setDrilldownMetadata:v27];
    }
    v28 = [v4 tokenImage];

    if (v28)
    {
      v29 = [_SFPBImage alloc];
      v30 = [v4 tokenImage];
      v31 = [(_SFPBImage *)v29 initWithFacade:v30];
      [(_SFPBPerformEntityQueryCommand *)v5 setTokenImage:v31];
    }
    v32 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenImage, 0);
  objc_storeStrong((id *)&self->_drilldownMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_entityBackgroundColor, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_tokenString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

- (_SFPBImage)tokenImage
{
  return self->_tokenImage;
}

- (_SFPBDrillDownMetadata)drilldownMetadata
{
  return self->_drilldownMetadata;
}

- (_SFPBDrillDownMetadata)metadata
{
  return self->_metadata;
}

- (_SFPBColor)entityBackgroundColor
{
  return self->_entityBackgroundColor;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (int)entityType
{
  return self->_entityType;
}

- (_SFPBSymbolImage)symbolImage
{
  return self->_symbolImage;
}

- (NSString)tokenString
{
  return self->_tokenString;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (_SFPBPerformEntityQueryCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_SFPBPerformEntityQueryCommand;
  v5 = [(_SFPBPerformEntityQueryCommand *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"searchString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBPerformEntityQueryCommand *)v5 setSearchString:v7];
    }
    v26 = v6;
    v8 = [v4 objectForKeyedSubscript:@"tokenString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBPerformEntityQueryCommand *)v5 setTokenString:v9];
    }
    v25 = v8;
    v10 = [v4 objectForKeyedSubscript:@"symbolImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBSymbolImage alloc] initWithDictionary:v10];
      [(_SFPBPerformEntityQueryCommand *)v5 setSymbolImage:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"entityType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPerformEntityQueryCommand setEntityType:](v5, "setEntityType:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"entityIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (void *)[v13 copy];
      [(_SFPBPerformEntityQueryCommand *)v5 setEntityIdentifier:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"entityBackgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[_SFPBColor alloc] initWithDictionary:v15];
      [(_SFPBPerformEntityQueryCommand *)v5 setEntityBackgroundColor:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"metadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[_SFPBDrillDownMetadata alloc] initWithDictionary:v17];
      [(_SFPBPerformEntityQueryCommand *)v5 setMetadata:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"drilldownMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[_SFPBDrillDownMetadata alloc] initWithDictionary:v19];
      [(_SFPBPerformEntityQueryCommand *)v5 setDrilldownMetadata:v20];
    }
    v21 = [v4 objectForKeyedSubscript:@"tokenImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[_SFPBImage alloc] initWithDictionary:v21];
      [(_SFPBPerformEntityQueryCommand *)v5 setTokenImage:v22];
    }
    v23 = v5;
  }
  return v5;
}

- (_SFPBPerformEntityQueryCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBPerformEntityQueryCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBPerformEntityQueryCommand *)self dictionaryRepresentation];
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
  if (self->_drilldownMetadata)
  {
    id v4 = [(_SFPBPerformEntityQueryCommand *)self drilldownMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"drilldownMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"drilldownMetadata"];
    }
  }
  if (self->_entityBackgroundColor)
  {
    uint64_t v7 = [(_SFPBPerformEntityQueryCommand *)self entityBackgroundColor];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"entityBackgroundColor"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"entityBackgroundColor"];
    }
  }
  if (self->_entityIdentifier)
  {
    v10 = [(_SFPBPerformEntityQueryCommand *)self entityIdentifier];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"entityIdentifier"];
  }
  if (self->_entityType)
  {
    uint64_t v12 = [(_SFPBPerformEntityQueryCommand *)self entityType];
    if (v12 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E5A2F090[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"entityType"];
  }
  if (self->_metadata)
  {
    v14 = [(_SFPBPerformEntityQueryCommand *)self metadata];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"metadata"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"metadata"];
    }
  }
  if (self->_searchString)
  {
    v17 = [(_SFPBPerformEntityQueryCommand *)self searchString];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"searchString"];
  }
  if (self->_symbolImage)
  {
    v19 = [(_SFPBPerformEntityQueryCommand *)self symbolImage];
    v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"symbolImage"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"symbolImage"];
    }
  }
  if (self->_tokenImage)
  {
    v22 = [(_SFPBPerformEntityQueryCommand *)self tokenImage];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"tokenImage"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"tokenImage"];
    }
  }
  if (self->_tokenString)
  {
    v25 = [(_SFPBPerformEntityQueryCommand *)self tokenString];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"tokenString"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_searchString hash];
  NSUInteger v4 = [(NSString *)self->_tokenString hash];
  unint64_t v5 = [(_SFPBSymbolImage *)self->_symbolImage hash];
  uint64_t v6 = 2654435761 * self->_entityType;
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_entityIdentifier hash];
  unint64_t v8 = v7 ^ [(_SFPBColor *)self->_entityBackgroundColor hash] ^ v6;
  unint64_t v9 = [(_SFPBDrillDownMetadata *)self->_metadata hash];
  unint64_t v10 = v9 ^ [(_SFPBDrillDownMetadata *)self->_drilldownMetadata hash];
  return v8 ^ v10 ^ [(_SFPBImage *)self->_tokenImage hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  unint64_t v5 = [(_SFPBPerformEntityQueryCommand *)self searchString];
  uint64_t v6 = [v4 searchString];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v7 = [(_SFPBPerformEntityQueryCommand *)self searchString];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBPerformEntityQueryCommand *)self searchString];
    unint64_t v10 = [v4 searchString];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBPerformEntityQueryCommand *)self tokenString];
  uint64_t v6 = [v4 tokenString];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v12 = [(_SFPBPerformEntityQueryCommand *)self tokenString];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBPerformEntityQueryCommand *)self tokenString];
    v15 = [v4 tokenString];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBPerformEntityQueryCommand *)self symbolImage];
  uint64_t v6 = [v4 symbolImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v17 = [(_SFPBPerformEntityQueryCommand *)self symbolImage];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBPerformEntityQueryCommand *)self symbolImage];
    v20 = [v4 symbolImage];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  int entityType = self->_entityType;
  if (entityType != [v4 entityType]) {
    goto LABEL_43;
  }
  unint64_t v5 = [(_SFPBPerformEntityQueryCommand *)self entityIdentifier];
  uint64_t v6 = [v4 entityIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v23 = [(_SFPBPerformEntityQueryCommand *)self entityIdentifier];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(_SFPBPerformEntityQueryCommand *)self entityIdentifier];
    v26 = [v4 entityIdentifier];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBPerformEntityQueryCommand *)self entityBackgroundColor];
  uint64_t v6 = [v4 entityBackgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v28 = [(_SFPBPerformEntityQueryCommand *)self entityBackgroundColor];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(_SFPBPerformEntityQueryCommand *)self entityBackgroundColor];
    v31 = [v4 entityBackgroundColor];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBPerformEntityQueryCommand *)self metadata];
  uint64_t v6 = [v4 metadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v33 = [(_SFPBPerformEntityQueryCommand *)self metadata];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(_SFPBPerformEntityQueryCommand *)self metadata];
    v36 = [v4 metadata];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBPerformEntityQueryCommand *)self drilldownMetadata];
  uint64_t v6 = [v4 drilldownMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v38 = [(_SFPBPerformEntityQueryCommand *)self drilldownMetadata];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(_SFPBPerformEntityQueryCommand *)self drilldownMetadata];
    v41 = [v4 drilldownMetadata];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBPerformEntityQueryCommand *)self tokenImage];
  uint64_t v6 = [v4 tokenImage];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_42:

    goto LABEL_43;
  }
  uint64_t v43 = [(_SFPBPerformEntityQueryCommand *)self tokenImage];
  if (!v43)
  {

LABEL_46:
    BOOL v48 = 1;
    goto LABEL_44;
  }
  v44 = (void *)v43;
  v45 = [(_SFPBPerformEntityQueryCommand *)self tokenImage];
  v46 = [v4 tokenImage];
  char v47 = [v45 isEqual:v46];

  if (v47) {
    goto LABEL_46;
  }
LABEL_43:
  BOOL v48 = 0;
LABEL_44:

  return v48;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(_SFPBPerformEntityQueryCommand *)self searchString];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  unint64_t v5 = [(_SFPBPerformEntityQueryCommand *)self tokenString];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  uint64_t v6 = [(_SFPBPerformEntityQueryCommand *)self symbolImage];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBPerformEntityQueryCommand *)self entityType]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(_SFPBPerformEntityQueryCommand *)self entityIdentifier];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  unint64_t v8 = [(_SFPBPerformEntityQueryCommand *)self entityBackgroundColor];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v9 = [(_SFPBPerformEntityQueryCommand *)self metadata];
  if (v9) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v10 = [(_SFPBPerformEntityQueryCommand *)self drilldownMetadata];
  if (v10) {
    PBDataWriterWriteSubmessage();
  }

  int v11 = [(_SFPBPerformEntityQueryCommand *)self tokenImage];
  if (v11) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPerformEntityQueryCommandReadFrom(self, (uint64_t)a3);
}

- (void)setTokenImage:(id)a3
{
}

- (void)setDrilldownMetadata:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (void)setEntityBackgroundColor:(id)a3
{
}

- (void)setEntityIdentifier:(id)a3
{
  self->_entityIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setEntityType:(int)a3
{
  self->_int entityType = a3;
}

- (void)setSymbolImage:(id)a3
{
}

- (void)setTokenString:(id)a3
{
  self->_tokenString = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSearchString:(id)a3
{
  self->_searchString = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end