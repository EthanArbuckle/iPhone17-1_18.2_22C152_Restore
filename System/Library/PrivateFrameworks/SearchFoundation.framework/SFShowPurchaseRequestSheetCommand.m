@interface SFShowPurchaseRequestSheetCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)requestIdentifier;
- (SFShowPurchaseRequestSheetCommand)initWithCoder:(id)a3;
- (SFShowPurchaseRequestSheetCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation SFShowPurchaseRequestSheetCommand

- (SFShowPurchaseRequestSheetCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFShowPurchaseRequestSheetCommand;
  v5 = [(SFShowPurchaseRequestSheetCommand *)&v10 init];
  if (v5)
  {
    v6 = [v4 requestIdentifier];

    if (v6)
    {
      v7 = [v4 requestIdentifier];
      [(SFShowPurchaseRequestSheetCommand *)v5 setRequestIdentifier:v7];
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFShowPurchaseRequestSheetCommand;
  unint64_t v3 = [(SFCommand *)&v7 hash];
  id v4 = [(SFShowPurchaseRequestSheetCommand *)self requestIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFShowPurchaseRequestSheetCommand *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFShowPurchaseRequestSheetCommand *)v4 isMemberOfClass:objc_opt_class()]&& (v13.receiver = self, v13.super_class = (Class)SFShowPurchaseRequestSheetCommand, [(SFCommand *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFShowPurchaseRequestSheetCommand *)self requestIdentifier];
    objc_super v7 = [(SFShowPurchaseRequestSheetCommand *)v5 requestIdentifier];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFShowPurchaseRequestSheetCommand *)self requestIdentifier];
      if (v8)
      {
        v9 = [(SFShowPurchaseRequestSheetCommand *)self requestIdentifier];
        objc_super v10 = [(SFShowPurchaseRequestSheetCommand *)v5 requestIdentifier];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 1;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFShowPurchaseRequestSheetCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFShowPurchaseRequestSheetCommand *)self requestIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setRequestIdentifier:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBShowPurchaseRequestSheetCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBShowPurchaseRequestSheetCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBShowPurchaseRequestSheetCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBShowPurchaseRequestSheetCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFShowPurchaseRequestSheetCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFShowPurchaseRequestSheetCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SFShowPurchaseRequestSheetCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 requestIdentifier];
    [(SFShowPurchaseRequestSheetCommand *)v5 setRequestIdentifier:v9];

    objc_super v10 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v10];

    char v11 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v11];

    v12 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v12];

    objc_super v13 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v13];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end