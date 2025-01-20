@interface SFShowContactCardCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsSuggestedContact;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuggestedContact;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)contactIdentifier;
- (SFShowContactCardCommand)initWithCoder:(id)a3;
- (SFShowContactCardCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setIsSuggestedContact:(BOOL)a3;
@end

@implementation SFShowContactCardCommand

- (void).cxx_destruct
{
}

- (BOOL)isSuggestedContact
{
  return self->_isSuggestedContact;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)SFShowContactCardCommand;
  unint64_t v3 = [(SFCommand *)&v8 hash];
  v4 = [(SFShowContactCardCommand *)self contactIdentifier];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(SFShowContactCardCommand *)self isSuggestedContact] ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (SFShowContactCardCommand *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(SFShowContactCardCommand *)v6 isMemberOfClass:objc_opt_class()])
    {
      v14.receiver = self;
      v14.super_class = (Class)SFShowContactCardCommand;
      if ([(SFCommand *)&v14 isEqual:v6])
      {
        v7 = v6;
        objc_super v8 = [(SFShowContactCardCommand *)self contactIdentifier];
        v9 = [(SFShowContactCardCommand *)v7 contactIdentifier];
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_14:

          goto LABEL_15;
        }
        v10 = [(SFShowContactCardCommand *)self contactIdentifier];
        if (!v10
          || ([(SFShowContactCardCommand *)self contactIdentifier],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFShowContactCardCommand *)v7 contactIdentifier],
              v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          BOOL v12 = [(SFShowContactCardCommand *)self isSuggestedContact];
          BOOL v11 = v12 ^ [(SFShowContactCardCommand *)v7 isSuggestedContact] ^ 1;
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
  v8.super_class = (Class)SFShowContactCardCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SFShowContactCardCommand *)self contactIdentifier];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setContactIdentifier:v6];

  objc_msgSend(v4, "setIsSuggestedContact:", -[SFShowContactCardCommand isSuggestedContact](self, "isSuggestedContact"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBShowContactCardCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBShowContactCardCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBShowContactCardCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBShowContactCardCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFShowContactCardCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFShowContactCardCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFShowContactCardCommand *)self init];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 contactIdentifier];
    [(SFShowContactCardCommand *)v5 setContactIdentifier:v9];

    [(SFShowContactCardCommand *)v5 setIsSuggestedContact:[(SFCommand *)v8 isSuggestedContact]];
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

- (BOOL)hasIsSuggestedContact
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsSuggestedContact:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isSuggestedContact = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFShowContactCardCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFShowContactCardCommand;
  uint64_t v5 = [(SFShowContactCardCommand *)&v10 init];
  if (v5)
  {
    unint64_t v6 = [v4 contactIdentifier];

    if (v6)
    {
      v7 = [v4 contactIdentifier];
      [(SFShowContactCardCommand *)v5 setContactIdentifier:v7];
    }
    if ([v4 isSuggestedContact]) {
      -[SFShowContactCardCommand setIsSuggestedContact:](v5, "setIsSuggestedContact:", [v4 isSuggestedContact]);
    }
    objc_super v8 = v5;
  }

  return v5;
}

@end