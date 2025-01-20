@interface SFSportsSubscriptionRequestItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)canonicalIdentifier;
- (NSString)leagueIdentifier;
- (NSString)sportIdentifier;
- (SFSportsSubscriptionRequestItem)initWithCoder:(id)a3;
- (SFSportsSubscriptionRequestItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCanonicalIdentifier:(id)a3;
- (void)setLeagueIdentifier:(id)a3;
- (void)setSportIdentifier:(id)a3;
@end

@implementation SFSportsSubscriptionRequestItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leagueIdentifier, 0);
  objc_storeStrong((id *)&self->_sportIdentifier, 0);
  objc_storeStrong((id *)&self->_canonicalIdentifier, 0);
}

- (void)setLeagueIdentifier:(id)a3
{
}

- (NSString)leagueIdentifier
{
  return self->_leagueIdentifier;
}

- (void)setSportIdentifier:(id)a3
{
}

- (NSString)sportIdentifier
{
  return self->_sportIdentifier;
}

- (void)setCanonicalIdentifier:(id)a3
{
}

- (NSString)canonicalIdentifier
{
  return self->_canonicalIdentifier;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)SFSportsSubscriptionRequestItem;
  unint64_t v3 = [(SFDomainSubscriptionRequestItem *)&v11 hash];
  v4 = [(SFSportsSubscriptionRequestItem *)self canonicalIdentifier];
  uint64_t v5 = [v4 hash];
  v6 = [(SFSportsSubscriptionRequestItem *)self sportIdentifier];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFSportsSubscriptionRequestItem *)self leagueIdentifier];
  unint64_t v9 = v7 ^ [v8 hash] ^ v3;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFSportsSubscriptionRequestItem *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFSportsSubscriptionRequestItem *)v5 isMemberOfClass:objc_opt_class()])
    {
      v32.receiver = self;
      v32.super_class = (Class)SFSportsSubscriptionRequestItem;
      if ([(SFDomainSubscriptionRequestItem *)&v32 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFSportsSubscriptionRequestItem *)self canonicalIdentifier];
        v8 = [(SFSportsSubscriptionRequestItem *)v6 canonicalIdentifier];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        unint64_t v9 = [(SFSportsSubscriptionRequestItem *)self canonicalIdentifier];
        if (v9)
        {
          unint64_t v3 = [(SFSportsSubscriptionRequestItem *)self canonicalIdentifier];
          v10 = [(SFSportsSubscriptionRequestItem *)v6 canonicalIdentifier];
          if (![v3 isEqual:v10])
          {
            char v11 = 0;
            goto LABEL_29;
          }
          v31 = v10;
        }
        v12 = [(SFSportsSubscriptionRequestItem *)self sportIdentifier];
        v13 = [(SFSportsSubscriptionRequestItem *)v6 sportIdentifier];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
          goto LABEL_28;
        }
        v15 = [(SFSportsSubscriptionRequestItem *)self sportIdentifier];
        if (v15)
        {
          v25 = v12;
          v16 = [(SFSportsSubscriptionRequestItem *)self sportIdentifier];
          v27 = [(SFSportsSubscriptionRequestItem *)v6 sportIdentifier];
          v28 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            char v11 = 0;
            v12 = v25;
            goto LABEL_26;
          }
          v29 = v15;
          v30 = v3;
          v12 = v25;
        }
        else
        {
          v29 = 0;
          v30 = v3;
        }
        v17 = [(SFSportsSubscriptionRequestItem *)self leagueIdentifier];
        v18 = [(SFSportsSubscriptionRequestItem *)v6 leagueIdentifier];
        if ((v17 == 0) == (v18 != 0))
        {

          char v11 = 0;
          v15 = v29;
          unint64_t v3 = v30;
          if (!v29) {
            goto LABEL_27;
          }
        }
        else
        {
          v24 = v17;
          v26 = v18;
          uint64_t v19 = [(SFSportsSubscriptionRequestItem *)self leagueIdentifier];
          v15 = v29;
          if (v19)
          {
            v23 = (void *)v19;
            v22 = [(SFSportsSubscriptionRequestItem *)self leagueIdentifier];
            v20 = [(SFSportsSubscriptionRequestItem *)v6 leagueIdentifier];
            char v11 = objc_msgSend(v22, "isEqual:");
          }
          else
          {

            char v11 = 1;
          }
          unint64_t v3 = v30;
          if (!v29) {
            goto LABEL_27;
          }
        }
LABEL_26:

LABEL_27:
LABEL_28:
        v10 = v31;
        if (!v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    char v11 = 0;
  }
LABEL_32:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFSportsSubscriptionRequestItem;
  id v4 = [(SFDomainSubscriptionRequestItem *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFSportsSubscriptionRequestItem *)self canonicalIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setCanonicalIdentifier:v6];

  uint64_t v7 = [(SFSportsSubscriptionRequestItem *)self sportIdentifier];
  v8 = (void *)[v7 copy];
  [v4 setSportIdentifier:v8];

  unint64_t v9 = [(SFSportsSubscriptionRequestItem *)self leagueIdentifier];
  v10 = (void *)[v9 copy];
  [v4 setLeagueIdentifier:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBSportsSubscriptionRequestItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBSportsSubscriptionRequestItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBSportsSubscriptionRequestItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBSportsSubscriptionRequestItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBSportsSubscriptionRequestItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBSportsSubscriptionRequestItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFSportsSubscriptionRequestItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBSportsSubscriptionRequestItem alloc] initWithData:v5];
  uint64_t v7 = [(SFSportsSubscriptionRequestItem *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSportsSubscriptionRequestItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFSportsSubscriptionRequestItem;
  uint64_t v5 = [(SFSportsSubscriptionRequestItem *)&v14 init];
  if (v5)
  {
    v6 = [v4 canonicalIdentifier];

    if (v6)
    {
      uint64_t v7 = [v4 canonicalIdentifier];
      [(SFSportsSubscriptionRequestItem *)v5 setCanonicalIdentifier:v7];
    }
    v8 = [v4 sportIdentifier];

    if (v8)
    {
      unint64_t v9 = [v4 sportIdentifier];
      [(SFSportsSubscriptionRequestItem *)v5 setSportIdentifier:v9];
    }
    v10 = [v4 leagueIdentifier];

    if (v10)
    {
      char v11 = [v4 leagueIdentifier];
      [(SFSportsSubscriptionRequestItem *)v5 setLeagueIdentifier:v11];
    }
    objc_super v12 = v5;
  }

  return v5;
}

@end