@interface _SFPBProduct
- (BOOL)buyable;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)productIdentifier;
- (_SFPBProduct)initWithDictionary:(id)a3;
- (_SFPBProduct)initWithFacade:(id)a3;
- (_SFPBProduct)initWithJSON:(id)a3;
- (_SFPBURL)availabilityURL;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAvailabilityURL:(id)a3;
- (void)setBuyable:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBProduct

- (_SFPBProduct)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBProduct *)self init];
  if (v5)
  {
    v6 = [v4 identifier];

    if (v6)
    {
      v7 = [v4 identifier];
      [(_SFPBProduct *)v5 setIdentifier:v7];
    }
    v8 = [v4 productIdentifier];

    if (v8)
    {
      v9 = [v4 productIdentifier];
      [(_SFPBProduct *)v5 setProductIdentifier:v9];
    }
    v10 = [v4 availabilityURL];

    if (v10)
    {
      v11 = [_SFPBURL alloc];
      v12 = [v4 availabilityURL];
      v13 = [(_SFPBURL *)v11 initWithNSURL:v12];
      [(_SFPBProduct *)v5 setAvailabilityURL:v13];
    }
    v14 = [v4 displayName];

    if (v14)
    {
      v15 = [v4 displayName];
      [(_SFPBProduct *)v5 setDisplayName:v15];
    }
    if ([v4 hasBuyable]) {
      -[_SFPBProduct setBuyable:](v5, "setBuyable:", [v4 buyable]);
    }
    v16 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_availabilityURL, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)buyable
{
  return self->_buyable;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (_SFPBURL)availabilityURL
{
  return self->_availabilityURL;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_SFPBProduct)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_SFPBProduct;
  v5 = [(_SFPBProduct *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBProduct *)v5 setIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"productIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBProduct *)v5 setProductIdentifier:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"availabilityURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBURL alloc] initWithDictionary:v10];
      [(_SFPBProduct *)v5 setAvailabilityURL:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"displayName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(_SFPBProduct *)v5 setDisplayName:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"buyable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBProduct setBuyable:](v5, "setBuyable:", [v14 BOOLValue]);
    }
    v15 = v5;
  }
  return v5;
}

- (_SFPBProduct)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBProduct *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBProduct *)self dictionaryRepresentation];
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
  if (self->_availabilityURL)
  {
    id v4 = [(_SFPBProduct *)self availabilityURL];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"availabilityURL"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"availabilityURL"];
    }
  }
  if (self->_buyable)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBProduct buyable](self, "buyable"));
    [v3 setObject:v7 forKeyedSubscript:@"buyable"];
  }
  if (self->_displayName)
  {
    v8 = [(_SFPBProduct *)self displayName];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"displayName"];
  }
  if (self->_identifier)
  {
    v10 = [(_SFPBProduct *)self identifier];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"identifier"];
  }
  if (self->_productIdentifier)
  {
    v12 = [(_SFPBProduct *)self productIdentifier];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"productIdentifier"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_productIdentifier hash];
  unint64_t v5 = [(_SFPBURL *)self->_availabilityURL hash];
  NSUInteger v6 = [(NSString *)self->_displayName hash];
  uint64_t v7 = 2654435761;
  if (!self->_buyable) {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(_SFPBProduct *)self identifier];
  NSUInteger v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_SFPBProduct *)self identifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBProduct *)self identifier];
    v10 = [v4 identifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBProduct *)self productIdentifier];
  NSUInteger v6 = [v4 productIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_SFPBProduct *)self productIdentifier];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBProduct *)self productIdentifier];
    v15 = [v4 productIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBProduct *)self availabilityURL];
  NSUInteger v6 = [v4 availabilityURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_SFPBProduct *)self availabilityURL];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBProduct *)self availabilityURL];
    v20 = [v4 availabilityURL];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBProduct *)self displayName];
  NSUInteger v6 = [v4 displayName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_SFPBProduct *)self displayName];
    if (!v22)
    {

LABEL_25:
      int buyable = self->_buyable;
      BOOL v27 = buyable == [v4 buyable];
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_SFPBProduct *)self displayName];
    v25 = [v4 displayName];
    int v26 = [v24 isEqual:v25];

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
  id v4 = [(_SFPBProduct *)self identifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  unint64_t v5 = [(_SFPBProduct *)self productIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v6 = [(_SFPBProduct *)self availabilityURL];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBProduct *)self displayName];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBProduct *)self buyable]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBProductReadFrom(self, (uint64_t)a3);
}

- (void)setBuyable:(BOOL)a3
{
  self->_int buyable = a3;
}

- (void)setDisplayName:(id)a3
{
  self->_displayName = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setAvailabilityURL:(id)a3
{
}

- (void)setProductIdentifier:(id)a3
{
  self->_productIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end