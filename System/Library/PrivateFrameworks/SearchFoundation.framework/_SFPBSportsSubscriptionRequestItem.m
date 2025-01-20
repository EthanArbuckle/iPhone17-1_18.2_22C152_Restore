@interface _SFPBSportsSubscriptionRequestItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)canonicalIdentifier;
- (NSString)leagueIdentifier;
- (NSString)sportIdentifier;
- (_SFPBSportsSubscriptionRequestItem)initWithDictionary:(id)a3;
- (_SFPBSportsSubscriptionRequestItem)initWithFacade:(id)a3;
- (_SFPBSportsSubscriptionRequestItem)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setCanonicalIdentifier:(id)a3;
- (void)setLeagueIdentifier:(id)a3;
- (void)setSportIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBSportsSubscriptionRequestItem

- (_SFPBSportsSubscriptionRequestItem)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBSportsSubscriptionRequestItem *)self init];
  if (v5)
  {
    v6 = [v4 canonicalIdentifier];

    if (v6)
    {
      v7 = [v4 canonicalIdentifier];
      [(_SFPBSportsSubscriptionRequestItem *)v5 setCanonicalIdentifier:v7];
    }
    v8 = [v4 sportIdentifier];

    if (v8)
    {
      v9 = [v4 sportIdentifier];
      [(_SFPBSportsSubscriptionRequestItem *)v5 setSportIdentifier:v9];
    }
    v10 = [v4 leagueIdentifier];

    if (v10)
    {
      v11 = [v4 leagueIdentifier];
      [(_SFPBSportsSubscriptionRequestItem *)v5 setLeagueIdentifier:v11];
    }
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leagueIdentifier, 0);
  objc_storeStrong((id *)&self->_sportIdentifier, 0);
  objc_storeStrong((id *)&self->_canonicalIdentifier, 0);
}

- (NSString)leagueIdentifier
{
  return self->_leagueIdentifier;
}

- (NSString)sportIdentifier
{
  return self->_sportIdentifier;
}

- (NSString)canonicalIdentifier
{
  return self->_canonicalIdentifier;
}

- (_SFPBSportsSubscriptionRequestItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBSportsSubscriptionRequestItem;
  v5 = [(_SFPBSportsSubscriptionRequestItem *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"canonicalIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBSportsSubscriptionRequestItem *)v5 setCanonicalIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"sportIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBSportsSubscriptionRequestItem *)v5 setSportIdentifier:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"leagueIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBSportsSubscriptionRequestItem *)v5 setLeagueIdentifier:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (_SFPBSportsSubscriptionRequestItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBSportsSubscriptionRequestItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBSportsSubscriptionRequestItem *)self dictionaryRepresentation];
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
  if (self->_canonicalIdentifier)
  {
    id v4 = [(_SFPBSportsSubscriptionRequestItem *)self canonicalIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"canonicalIdentifier"];
  }
  if (self->_leagueIdentifier)
  {
    v6 = [(_SFPBSportsSubscriptionRequestItem *)self leagueIdentifier];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"leagueIdentifier"];
  }
  if (self->_sportIdentifier)
  {
    v8 = [(_SFPBSportsSubscriptionRequestItem *)self sportIdentifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"sportIdentifier"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_canonicalIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_sportIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_leagueIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBSportsSubscriptionRequestItem *)self canonicalIdentifier];
  v6 = [v4 canonicalIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBSportsSubscriptionRequestItem *)self canonicalIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBSportsSubscriptionRequestItem *)self canonicalIdentifier];
    v10 = [v4 canonicalIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBSportsSubscriptionRequestItem *)self sportIdentifier];
  v6 = [v4 sportIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBSportsSubscriptionRequestItem *)self sportIdentifier];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(_SFPBSportsSubscriptionRequestItem *)self sportIdentifier];
    v15 = [v4 sportIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBSportsSubscriptionRequestItem *)self leagueIdentifier];
  v6 = [v4 leagueIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBSportsSubscriptionRequestItem *)self leagueIdentifier];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBSportsSubscriptionRequestItem *)self leagueIdentifier];
    v20 = [v4 leagueIdentifier];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_SFPBSportsSubscriptionRequestItem *)self canonicalIdentifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBSportsSubscriptionRequestItem *)self sportIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  v6 = [(_SFPBSportsSubscriptionRequestItem *)self leagueIdentifier];
  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSportsSubscriptionRequestItemReadFrom(self, (uint64_t)a3);
}

- (void)setLeagueIdentifier:(id)a3
{
  self->_leagueIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSportIdentifier:(id)a3
{
  self->_sportIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCanonicalIdentifier:(id)a3
{
  self->_canonicalIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end