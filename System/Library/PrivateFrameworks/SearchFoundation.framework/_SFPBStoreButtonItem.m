@interface _SFPBStoreButtonItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldOpenAppAfterInstallCompletes;
- (NSData)jsonData;
- (NSString)identifier;
- (_SFPBStoreButtonItem)initWithDictionary:(id)a3;
- (_SFPBStoreButtonItem)initWithFacade:(id)a3;
- (_SFPBStoreButtonItem)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)identifierType;
- (unint64_t)hash;
- (unint64_t)uniqueId;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierType:(int)a3;
- (void)setShouldOpenAppAfterInstallCompletes:(BOOL)a3;
- (void)setUniqueId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBStoreButtonItem

- (_SFPBStoreButtonItem)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBStoreButtonItem *)self init];
  if (v5)
  {
    v6 = [v4 identifier];

    if (v6)
    {
      v7 = [v4 identifier];
      [(_SFPBStoreButtonItem *)v5 setIdentifier:v7];
    }
    if ([v4 hasShouldOpenAppAfterInstallCompletes]) {
      -[_SFPBStoreButtonItem setShouldOpenAppAfterInstallCompletes:](v5, "setShouldOpenAppAfterInstallCompletes:", [v4 shouldOpenAppAfterInstallCompletes]);
    }
    if ([v4 hasIdentifierType]) {
      -[_SFPBStoreButtonItem setIdentifierType:](v5, "setIdentifierType:", [v4 identifierType]);
    }
    if ([v4 hasUniqueId]) {
      -[_SFPBStoreButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (int)identifierType
{
  return self->_identifierType;
}

- (BOOL)shouldOpenAppAfterInstallCompletes
{
  return self->_shouldOpenAppAfterInstallCompletes;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_SFPBStoreButtonItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBStoreButtonItem;
  v5 = [(_SFPBStoreButtonItem *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBStoreButtonItem *)v5 setIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"shouldOpenAppAfterInstallCompletes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBStoreButtonItem setShouldOpenAppAfterInstallCompletes:](v5, "setShouldOpenAppAfterInstallCompletes:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"identifierType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBStoreButtonItem setIdentifierType:](v5, "setIdentifierType:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"uniqueId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBStoreButtonItem setUniqueId:](v5, "setUniqueId:", [v10 unsignedLongLongValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (_SFPBStoreButtonItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBStoreButtonItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBStoreButtonItem *)self dictionaryRepresentation];
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
  if (self->_identifier)
  {
    id v4 = [(_SFPBStoreButtonItem *)self identifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"identifier"];
  }
  if (self->_identifierType)
  {
    uint64_t v6 = [(_SFPBStoreButtonItem *)self identifierType];
    if (v6)
    {
      if (v6 == 1)
      {
        uint64_t v7 = @"1";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v7 = @"0";
    }
    [v3 setObject:v7 forKeyedSubscript:@"identifierType"];
  }
  if (self->_shouldOpenAppAfterInstallCompletes)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBStoreButtonItem shouldOpenAppAfterInstallCompletes](self, "shouldOpenAppAfterInstallCompletes"));
    [v3 setObject:v8 forKeyedSubscript:@"shouldOpenAppAfterInstallCompletes"];
  }
  if (self->_uniqueId)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_SFPBStoreButtonItem uniqueId](self, "uniqueId"));
    [v3 setObject:v9 forKeyedSubscript:@"uniqueId"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if (self->_shouldOpenAppAfterInstallCompletes) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ (2654435761 * self->_identifierType) ^ (2654435761u * self->_uniqueId);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  v5 = [(_SFPBStoreButtonItem *)self identifier];
  uint64_t v6 = [v4 identifier];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_11:
    BOOL v16 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = [(_SFPBStoreButtonItem *)self identifier];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_SFPBStoreButtonItem *)self identifier];
    v11 = [v4 identifier];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  int shouldOpenAppAfterInstallCompletes = self->_shouldOpenAppAfterInstallCompletes;
  if (shouldOpenAppAfterInstallCompletes != [v4 shouldOpenAppAfterInstallCompletes]) {
    goto LABEL_11;
  }
  int identifierType = self->_identifierType;
  if (identifierType != [v4 identifierType]) {
    goto LABEL_11;
  }
  unint64_t uniqueId = self->_uniqueId;
  BOOL v16 = uniqueId == [v4 uniqueId];
LABEL_12:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_SFPBStoreButtonItem *)self identifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBStoreButtonItem *)self shouldOpenAppAfterInstallCompletes]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBStoreButtonItem *)self identifierType]) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v5 = [(_SFPBStoreButtonItem *)self uniqueId];
  uint64_t v6 = v7;
  if (v5)
  {
    PBDataWriterWriteUint64Field();
    uint64_t v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBStoreButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_unint64_t uniqueId = a3;
}

- (void)setIdentifierType:(int)a3
{
  self->_int identifierType = a3;
}

- (void)setShouldOpenAppAfterInstallCompletes:(BOOL)a3
{
  self->_int shouldOpenAppAfterInstallCompletes = a3;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end