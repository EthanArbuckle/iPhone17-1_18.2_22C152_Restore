@interface SFStoreButtonItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIdentifierType;
- (BOOL)hasShouldOpenAppAfterInstallCompletes;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldOpenAppAfterInstallCompletes;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)identifier;
- (SFStoreButtonItem)initWithCoder:(id)a3;
- (SFStoreButtonItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)identifierType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierType:(int)a3;
- (void)setShouldOpenAppAfterInstallCompletes:(BOOL)a3;
@end

@implementation SFStoreButtonItem

- (SFStoreButtonItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFStoreButtonItem;
  v5 = [(SFStoreButtonItem *)&v10 init];
  if (v5)
  {
    v6 = [v4 identifier];

    if (v6)
    {
      v7 = [v4 identifier];
      [(SFStoreButtonItem *)v5 setIdentifier:v7];
    }
    if ([v4 shouldOpenAppAfterInstallCompletes]) {
      -[SFStoreButtonItem setShouldOpenAppAfterInstallCompletes:](v5, "setShouldOpenAppAfterInstallCompletes:", [v4 shouldOpenAppAfterInstallCompletes]);
    }
    if ([v4 identifierType]) {
      -[SFStoreButtonItem setIdentifierType:](v5, "setIdentifierType:", [v4 identifierType]);
    }
    if ([v4 uniqueId]) {
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (int)identifierType
{
  return self->_identifierType;
}

- (BOOL)shouldOpenAppAfterInstallCompletes
{
  return self->_shouldOpenAppAfterInstallCompletes;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)SFStoreButtonItem;
  unint64_t v3 = [(SFButtonItem *)&v10 hash];
  id v4 = [(SFStoreButtonItem *)self identifier];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v5 ^ [(SFStoreButtonItem *)self shouldOpenAppAfterInstallCompletes];
  uint64_t v7 = v6 ^ [(SFStoreButtonItem *)self identifierType];
  unint64_t v8 = v7 ^ [(SFButtonItem *)self uniqueId] ^ v3;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SFStoreButtonItem *)a3;
  if (self == v6)
  {
    BOOL v12 = 1;
  }
  else
  {
    if ([(SFStoreButtonItem *)v6 isMemberOfClass:objc_opt_class()])
    {
      v17.receiver = self;
      v17.super_class = (Class)SFStoreButtonItem;
      if ([(SFButtonItem *)&v17 isEqual:v6])
      {
        uint64_t v7 = v6;
        unint64_t v8 = [(SFStoreButtonItem *)self identifier];
        v9 = [(SFStoreButtonItem *)v7 identifier];
        if ((v8 == 0) == (v9 != 0))
        {
          BOOL v12 = 0;
LABEL_18:

          goto LABEL_19;
        }
        objc_super v10 = [(SFStoreButtonItem *)self identifier];
        if (!v10
          || ([(SFStoreButtonItem *)self identifier],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFStoreButtonItem *)v7 identifier],
              id v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          BOOL v13 = [(SFStoreButtonItem *)self shouldOpenAppAfterInstallCompletes];
          if (v13 == [(SFStoreButtonItem *)v7 shouldOpenAppAfterInstallCompletes]
            && (int v14 = [(SFStoreButtonItem *)self identifierType],
                v14 == [(SFStoreButtonItem *)v7 identifierType]))
          {
            unint64_t v15 = [(SFButtonItem *)self uniqueId];
            BOOL v11 = v15 == [(SFButtonItem *)v7 uniqueId];
            BOOL v12 = v11;
            if (!v10) {
              goto LABEL_17;
            }
          }
          else
          {
            BOOL v11 = 0;
            BOOL v12 = 0;
            if (!v10)
            {
LABEL_17:

              goto LABEL_18;
            }
          }
        }
        else
        {
          BOOL v11 = 0;
        }

        BOOL v12 = v11;
        goto LABEL_17;
      }
    }
    BOOL v12 = 0;
  }
LABEL_19:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFStoreButtonItem;
  id v4 = [(SFButtonItem *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SFStoreButtonItem *)self identifier];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setIdentifier:v6];

  objc_msgSend(v4, "setShouldOpenAppAfterInstallCompletes:", -[SFStoreButtonItem shouldOpenAppAfterInstallCompletes](self, "shouldOpenAppAfterInstallCompletes"));
  objc_msgSend(v4, "setIdentifierType:", -[SFStoreButtonItem identifierType](self, "identifierType"));
  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBStoreButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBStoreButtonItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBStoreButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBStoreButtonItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBStoreButtonItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBStoreButtonItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFStoreButtonItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBStoreButtonItem alloc] initWithData:v5];
  uint64_t v7 = [(SFStoreButtonItem *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasIdentifierType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIdentifierType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_identifierType = a3;
}

- (BOOL)hasShouldOpenAppAfterInstallCompletes
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setShouldOpenAppAfterInstallCompletes:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shouldOpenAppAfterInstallCompletes = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end