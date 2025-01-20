@interface SFCardSearchMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsFederatedDomainSearch;
- (BOOL)hasIsServerEntity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFederatedDomainSearch;
- (BOOL)isServerEntity;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)searchQuery;
- (NSString)viewConfigName;
- (SFCardSearchMetadata)initWithCoder:(id)a3;
- (SFCardSearchMetadata)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsFederatedDomainSearch:(BOOL)a3;
- (void)setIsServerEntity:(BOOL)a3;
- (void)setSearchQuery:(id)a3;
- (void)setViewConfigName:(id)a3;
@end

@implementation SFCardSearchMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (void)setViewConfigName:(id)a3
{
}

- (NSString)viewConfigName
{
  return self->_viewConfigName;
}

- (void)setSearchQuery:(id)a3
{
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (BOOL)isServerEntity
{
  return self->_isServerEntity;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SFCardSearchMetadata *)self isServerEntity];
  v4 = [(SFCardSearchMetadata *)self searchQuery];
  uint64_t v5 = [v4 hash];
  v6 = [(SFCardSearchMetadata *)self viewConfigName];
  uint64_t v7 = v5 ^ [v6 hash] ^ v3;
  unint64_t v8 = v7 ^ [(SFCardSearchMetadata *)self isFederatedDomainSearch];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFCardSearchMetadata *)a3;
  if (self == v5)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    if ([(SFCardSearchMetadata *)v5 isMemberOfClass:objc_opt_class()])
    {
      v6 = v5;
      BOOL v7 = [(SFCardSearchMetadata *)self isServerEntity];
      if (v7 != [(SFCardSearchMetadata *)v6 isServerEntity])
      {
        LOBYTE(v8) = 0;
LABEL_27:

        goto LABEL_28;
      }
      v9 = [(SFCardSearchMetadata *)self searchQuery];
      v10 = [(SFCardSearchMetadata *)v6 searchQuery];
      if ((v9 == 0) == (v10 != 0))
      {
        LOBYTE(v8) = 0;
LABEL_26:

        goto LABEL_27;
      }
      v11 = [(SFCardSearchMetadata *)self searchQuery];
      if (v11)
      {
        v12 = [(SFCardSearchMetadata *)self searchQuery];
        uint64_t v3 = [(SFCardSearchMetadata *)v6 searchQuery];
        if (![v12 isEqual:v3])
        {
          LOBYTE(v8) = 0;
          goto LABEL_24;
        }
        v23 = v12;
      }
      v13 = [(SFCardSearchMetadata *)self viewConfigName];
      v14 = [(SFCardSearchMetadata *)v6 viewConfigName];
      v15 = v14;
      if ((v13 == 0) == (v14 != 0))
      {

        LOBYTE(v8) = 0;
        goto LABEL_23;
      }
      v16 = [(SFCardSearchMetadata *)self viewConfigName];
      if (v16)
      {
        v20 = v3;
        v17 = [(SFCardSearchMetadata *)self viewConfigName];
        v21 = [(SFCardSearchMetadata *)v6 viewConfigName];
        v22 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          LOBYTE(v8) = 0;
          uint64_t v3 = v20;
LABEL_21:

LABEL_22:
LABEL_23:
          v12 = v23;
          if (!v11)
          {
LABEL_25:

            goto LABEL_26;
          }
LABEL_24:

          goto LABEL_25;
        }
        uint64_t v3 = v20;
      }
      BOOL v18 = [(SFCardSearchMetadata *)self isFederatedDomainSearch];
      BOOL v8 = v18 ^ [(SFCardSearchMetadata *)v6 isFederatedDomainSearch] ^ 1;
      if (!v16) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    LOBYTE(v8) = 0;
  }
LABEL_28:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsServerEntity:", -[SFCardSearchMetadata isServerEntity](self, "isServerEntity"));
  uint64_t v5 = [(SFCardSearchMetadata *)self searchQuery];
  v6 = (void *)[v5 copy];
  [v4 setSearchQuery:v6];

  BOOL v7 = [(SFCardSearchMetadata *)self viewConfigName];
  BOOL v8 = (void *)[v7 copy];
  [v4 setViewConfigName:v8];

  objc_msgSend(v4, "setIsFederatedDomainSearch:", -[SFCardSearchMetadata isFederatedDomainSearch](self, "isFederatedDomainSearch"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCardSearchMetadata alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBCardSearchMetadata *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCardSearchMetadata alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBCardSearchMetadata *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBCardSearchMetadata alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBCardSearchMetadata *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCardSearchMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBCardSearchMetadata alloc] initWithData:v5];
  BOOL v7 = [(SFCardSearchMetadata *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasIsFederatedDomainSearch
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsFederatedDomainSearch:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isFederatedDomainSearch = a3;
}

- (BOOL)hasIsServerEntity
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsServerEntity:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isServerEntity = a3;
}

- (SFCardSearchMetadata)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCardSearchMetadata;
  uint64_t v5 = [(SFCardSearchMetadata *)&v12 init];
  if (v5)
  {
    if ([v4 isServerEntity]) {
      -[SFCardSearchMetadata setIsServerEntity:](v5, "setIsServerEntity:", [v4 isServerEntity]);
    }
    v6 = [v4 searchQuery];

    if (v6)
    {
      BOOL v7 = [v4 searchQuery];
      [(SFCardSearchMetadata *)v5 setSearchQuery:v7];
    }
    BOOL v8 = [v4 viewConfigName];

    if (v8)
    {
      v9 = [v4 viewConfigName];
      [(SFCardSearchMetadata *)v5 setViewConfigName:v9];
    }
    if ([v4 isFederatedDomainSearch]) {
      -[SFCardSearchMetadata setIsFederatedDomainSearch:](v5, "setIsFederatedDomainSearch:", [v4 isFederatedDomainSearch]);
    }
    v10 = v5;
  }

  return v5;
}

@end