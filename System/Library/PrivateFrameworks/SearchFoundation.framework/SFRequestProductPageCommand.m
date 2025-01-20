@interface SFRequestProductPageCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)hasItemIdentifier;
- (BOOL)hasVersionIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)distributorBundleIdentifier;
- (SFRequestProductPageCommand)initWithCoder:(id)a3;
- (SFRequestProductPageCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)itemIdentifier;
- (unint64_t)versionIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setDistributorBundleIdentifier:(id)a3;
- (void)setItemIdentifier:(unint64_t)a3;
- (void)setVersionIdentifier:(unint64_t)a3;
@end

@implementation SFRequestProductPageCommand

- (SFRequestProductPageCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFRequestProductPageCommand;
  v5 = [(SFRequestProductPageCommand *)&v10 init];
  if (v5)
  {
    v6 = [v4 distributorBundleIdentifier];

    if (v6)
    {
      v7 = [v4 distributorBundleIdentifier];
      [(SFRequestProductPageCommand *)v5 setDistributorBundleIdentifier:v7];
    }
    if ([v4 itemIdentifier]) {
      -[SFRequestProductPageCommand setItemIdentifier:](v5, "setItemIdentifier:", [v4 itemIdentifier]);
    }
    if ([v4 versionIdentifier]) {
      -[SFRequestProductPageCommand setVersionIdentifier:](v5, "setVersionIdentifier:", [v4 versionIdentifier]);
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (unint64_t)versionIdentifier
{
  return self->_versionIdentifier;
}

- (unint64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setDistributorBundleIdentifier:(id)a3
{
}

- (NSString)distributorBundleIdentifier
{
  return self->_distributorBundleIdentifier;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)SFRequestProductPageCommand;
  unint64_t v3 = [(SFCommand *)&v9 hash];
  id v4 = [(SFRequestProductPageCommand *)self distributorBundleIdentifier];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(SFRequestProductPageCommand *)self itemIdentifier];
  unint64_t v7 = v6 ^ [(SFRequestProductPageCommand *)self versionIdentifier] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (SFRequestProductPageCommand *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFRequestProductPageCommand *)v6 isMemberOfClass:objc_opt_class()])
    {
      v15.receiver = self;
      v15.super_class = (Class)SFRequestProductPageCommand;
      if ([(SFCommand *)&v15 isEqual:v6])
      {
        unint64_t v7 = v6;
        v8 = [(SFRequestProductPageCommand *)self distributorBundleIdentifier];
        objc_super v9 = [(SFRequestProductPageCommand *)v7 distributorBundleIdentifier];
        if ((v8 == 0) == (v9 != 0))
        {
          BOOL v11 = 0;
LABEL_17:

          goto LABEL_18;
        }
        objc_super v10 = [(SFRequestProductPageCommand *)self distributorBundleIdentifier];
        if (!v10
          || ([(SFRequestProductPageCommand *)self distributorBundleIdentifier],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFRequestProductPageCommand *)v7 distributorBundleIdentifier],
              id v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          unint64_t v12 = [(SFRequestProductPageCommand *)self itemIdentifier];
          if (v12 == [(SFRequestProductPageCommand *)v7 itemIdentifier])
          {
            unint64_t v13 = [(SFRequestProductPageCommand *)self versionIdentifier];
            BOOL v11 = v13 == [(SFRequestProductPageCommand *)v7 versionIdentifier];
            if (!v10) {
              goto LABEL_16;
            }
          }
          else
          {
            BOOL v11 = 0;
            if (!v10)
            {
LABEL_16:

              goto LABEL_17;
            }
          }
        }
        else
        {
          BOOL v11 = 0;
        }

        goto LABEL_16;
      }
    }
    BOOL v11 = 0;
  }
LABEL_18:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFRequestProductPageCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SFRequestProductPageCommand *)self distributorBundleIdentifier];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setDistributorBundleIdentifier:v6];

  objc_msgSend(v4, "setItemIdentifier:", -[SFRequestProductPageCommand itemIdentifier](self, "itemIdentifier"));
  objc_msgSend(v4, "setVersionIdentifier:", -[SFRequestProductPageCommand versionIdentifier](self, "versionIdentifier"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRequestProductPageCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRequestProductPageCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRequestProductPageCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRequestProductPageCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFRequestProductPageCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFRequestProductPageCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFRequestProductPageCommand *)self init];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v9 = [(SFCommand *)v8 distributorBundleIdentifier];
    [(SFRequestProductPageCommand *)v5 setDistributorBundleIdentifier:v9];

    [(SFRequestProductPageCommand *)v5 setItemIdentifier:[(SFCommand *)v8 itemIdentifier]];
    [(SFRequestProductPageCommand *)v5 setVersionIdentifier:[(SFCommand *)v8 versionIdentifier]];
    objc_super v10 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v10];

    BOOL v11 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v11];

    unint64_t v12 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v12];

    unint64_t v13 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v13];
  }
  return v5;
}

- (BOOL)hasVersionIdentifier
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setVersionIdentifier:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_versionIdentifier = a3;
}

- (BOOL)hasItemIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setItemIdentifier:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_itemIdentifier = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end