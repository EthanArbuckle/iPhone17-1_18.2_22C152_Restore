@interface SFCreateContactCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)addToExistingContact;
- (BOOL)hasAddToExistingContact;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFCreateContactCommand)initWithCoder:(id)a3;
- (SFCreateContactCommand)initWithProtobuf:(id)a3;
- (SFPerson)person;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAddToExistingContact:(BOOL)a3;
- (void)setPerson:(id)a3;
@end

@implementation SFCreateContactCommand

- (void).cxx_destruct
{
}

- (BOOL)addToExistingContact
{
  return self->_addToExistingContact;
}

- (void)setPerson:(id)a3
{
}

- (SFPerson)person
{
  return self->_person;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)SFCreateContactCommand;
  unint64_t v3 = [(SFCommand *)&v8 hash];
  v4 = [(SFCreateContactCommand *)self person];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(SFCreateContactCommand *)self addToExistingContact] ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (SFCreateContactCommand *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(SFCreateContactCommand *)v6 isMemberOfClass:objc_opt_class()])
    {
      v14.receiver = self;
      v14.super_class = (Class)SFCreateContactCommand;
      if ([(SFCommand *)&v14 isEqual:v6])
      {
        v7 = v6;
        objc_super v8 = [(SFCreateContactCommand *)self person];
        v9 = [(SFCreateContactCommand *)v7 person];
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_14:

          goto LABEL_15;
        }
        v10 = [(SFCreateContactCommand *)self person];
        if (!v10
          || ([(SFCreateContactCommand *)self person],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFCreateContactCommand *)v7 person],
              v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          BOOL v12 = [(SFCreateContactCommand *)self addToExistingContact];
          BOOL v11 = v12 ^ [(SFCreateContactCommand *)v7 addToExistingContact] ^ 1;
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          LOBYTE(v11) = 0;
        }

        goto LABEL_13;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_15:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFCreateContactCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SFCreateContactCommand *)self person];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setPerson:v6];

  objc_msgSend(v4, "setAddToExistingContact:", -[SFCreateContactCommand addToExistingContact](self, "addToExistingContact"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCreateContactCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCreateContactCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCreateContactCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCreateContactCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFCreateContactCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFCreateContactCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCreateContactCommand *)self init];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 person];
    [(SFCreateContactCommand *)v5 setPerson:v9];

    [(SFCreateContactCommand *)v5 setAddToExistingContact:[(SFCommand *)v8 addToExistingContact]];
    v10 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v10];

    BOOL v11 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v11];

    BOOL v12 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v12];

    v13 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v13];
  }
  return v5;
}

- (BOOL)hasAddToExistingContact
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAddToExistingContact:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_addToExistingContact = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCreateContactCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCreateContactCommand;
  uint64_t v5 = [(SFCreateContactCommand *)&v12 init];
  if (v5)
  {
    unint64_t v6 = [v4 person];

    if (v6)
    {
      v7 = [SFPerson alloc];
      objc_super v8 = [v4 person];
      v9 = [(SFPerson *)v7 initWithProtobuf:v8];
      [(SFCreateContactCommand *)v5 setPerson:v9];
    }
    if ([v4 addToExistingContact]) {
      -[SFCreateContactCommand setAddToExistingContact:](v5, "setAddToExistingContact:", [v4 addToExistingContact]);
    }
    v10 = v5;
  }

  return v5;
}

@end