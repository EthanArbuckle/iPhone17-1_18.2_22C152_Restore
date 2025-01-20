@interface SFCardMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsServerEntity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isServerEntity;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)queryToSearchAcrossAllDomains;
- (SFCardMetadata)initWithCoder:(id)a3;
- (SFCardMetadata)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsServerEntity:(BOOL)a3;
- (void)setQueryToSearchAcrossAllDomains:(id)a3;
@end

@implementation SFCardMetadata

- (SFCardMetadata)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFCardMetadata;
  v5 = [(SFCardMetadata *)&v10 init];
  if (v5)
  {
    if ([v4 isServerEntity]) {
      -[SFCardMetadata setIsServerEntity:](v5, "setIsServerEntity:", [v4 isServerEntity]);
    }
    v6 = [v4 queryToSearchAcrossAllDomains];

    if (v6)
    {
      v7 = [v4 queryToSearchAcrossAllDomains];
      [(SFCardMetadata *)v5 setQueryToSearchAcrossAllDomains:v7];
    }
    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)setQueryToSearchAcrossAllDomains:(id)a3
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

- (unint64_t)hash
{
  uint64_t v3 = [(SFCardMetadata *)self isServerEntity];
  id v4 = [(SFCardMetadata *)self queryToSearchAcrossAllDomains];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFCardMetadata *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if ([(SFCardMetadata *)v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t v5 = v4;
    BOOL v6 = [(SFCardMetadata *)self isServerEntity];
    if (v6 == [(SFCardMetadata *)v5 isServerEntity])
    {
      v8 = [(SFCardMetadata *)self queryToSearchAcrossAllDomains];
      v9 = [(SFCardMetadata *)v5 queryToSearchAcrossAllDomains];
      if ((v8 == 0) == (v9 != 0))
      {
        char v7 = 0;
      }
      else
      {
        objc_super v10 = [(SFCardMetadata *)self queryToSearchAcrossAllDomains];
        if (v10)
        {
          v11 = [(SFCardMetadata *)self queryToSearchAcrossAllDomains];
          v12 = [(SFCardMetadata *)v5 queryToSearchAcrossAllDomains];
          char v7 = [v11 isEqual:v12];
        }
        else
        {
          char v7 = 1;
        }
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsServerEntity:", -[SFCardMetadata isServerEntity](self, "isServerEntity"));
  unint64_t v5 = [(SFCardMetadata *)self queryToSearchAcrossAllDomains];
  BOOL v6 = (void *)[v5 copy];
  [v4 setQueryToSearchAcrossAllDomains:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCardMetadata alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBCardMetadata *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCardMetadata alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBCardMetadata *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v6 = [[_SFPBCardMetadata alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBCardMetadata *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCardMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  BOOL v6 = [[_SFPBCardMetadata alloc] initWithData:v5];
  char v7 = [(SFCardMetadata *)self initWithProtobuf:v6];

  return v7;
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

@end