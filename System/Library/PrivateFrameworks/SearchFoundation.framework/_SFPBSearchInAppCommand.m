@interface _SFPBSearchInAppCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)applicationBundleIdentifier;
- (NSString)searchString;
- (_SFPBSearchInAppCommand)initWithDictionary:(id)a3;
- (_SFPBSearchInAppCommand)initWithFacade:(id)a3;
- (_SFPBSearchInAppCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)searchInAppType;
- (unint64_t)hash;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setSearchInAppType:(int)a3;
- (void)setSearchString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBSearchInAppCommand

- (_SFPBSearchInAppCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBSearchInAppCommand *)self init];
  if (v5)
  {
    v6 = [v4 searchString];

    if (v6)
    {
      v7 = [v4 searchString];
      [(_SFPBSearchInAppCommand *)v5 setSearchString:v7];
    }
    v8 = [v4 applicationBundleIdentifier];

    if (v8)
    {
      v9 = [v4 applicationBundleIdentifier];
      [(_SFPBSearchInAppCommand *)v5 setApplicationBundleIdentifier:v9];
    }
    if ([v4 hasSearchInAppType]) {
      -[_SFPBSearchInAppCommand setSearchInAppType:](v5, "setSearchInAppType:", [v4 searchInAppType]);
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

- (int)searchInAppType
{
  return self->_searchInAppType;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (_SFPBSearchInAppCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBSearchInAppCommand;
  v5 = [(_SFPBSearchInAppCommand *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"searchString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBSearchInAppCommand *)v5 setSearchString:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"applicationBundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBSearchInAppCommand *)v5 setApplicationBundleIdentifier:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"searchInAppType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSearchInAppCommand setSearchInAppType:](v5, "setSearchInAppType:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (_SFPBSearchInAppCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBSearchInAppCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBSearchInAppCommand *)self dictionaryRepresentation];
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
  if (self->_applicationBundleIdentifier)
  {
    id v4 = [(_SFPBSearchInAppCommand *)self applicationBundleIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"applicationBundleIdentifier"];
  }
  if (self->_searchInAppType)
  {
    uint64_t v6 = [(_SFPBSearchInAppCommand *)self searchInAppType];
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
    [v3 setObject:v7 forKeyedSubscript:@"searchInAppType"];
  }
  if (self->_searchString)
  {
    v8 = [(_SFPBSearchInAppCommand *)self searchString];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"searchString"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_searchString hash];
  return [(NSString *)self->_applicationBundleIdentifier hash] ^ v3 ^ (2654435761 * self->_searchInAppType);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBSearchInAppCommand *)self searchString];
  uint64_t v6 = [v4 searchString];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBSearchInAppCommand *)self searchString];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBSearchInAppCommand *)self searchString];
    v10 = [v4 searchString];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBSearchInAppCommand *)self applicationBundleIdentifier];
  uint64_t v6 = [v4 applicationBundleIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBSearchInAppCommand *)self applicationBundleIdentifier];
    if (!v12)
    {

LABEL_15:
      int searchInAppType = self->_searchInAppType;
      BOOL v17 = searchInAppType == [v4 searchInAppType];
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(_SFPBSearchInAppCommand *)self applicationBundleIdentifier];
    v15 = [v4 applicationBundleIdentifier];
    int v16 = [v14 isEqual:v15];

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
  id v8 = a3;
  id v4 = [(_SFPBSearchInAppCommand *)self searchString];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBSearchInAppCommand *)self applicationBundleIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  int v6 = [(_SFPBSearchInAppCommand *)self searchInAppType];
  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSearchInAppCommandReadFrom(self, (uint64_t)a3);
}

- (void)setSearchInAppType:(int)a3
{
  self->_int searchInAppType = a3;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  self->_applicationBundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSearchString:(id)a3
{
  self->_searchString = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end