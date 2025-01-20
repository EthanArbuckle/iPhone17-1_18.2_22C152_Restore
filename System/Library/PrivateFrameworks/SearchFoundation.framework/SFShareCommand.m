@interface SFShareCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFShareCommand)initWithCoder:(id)a3;
- (SFShareCommand)initWithProtobuf:(id)a3;
- (SFShareItem)shareItem;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setShareItem:(id)a3;
@end

@implementation SFShareCommand

- (void).cxx_destruct
{
}

- (void)setShareItem:(id)a3
{
}

- (SFShareItem)shareItem
{
  return self->_shareItem;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFShareCommand;
  unint64_t v3 = [(SFCommand *)&v7 hash];
  v4 = [(SFShareCommand *)self shareItem];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFShareCommand *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFShareCommand *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFShareCommand,
             [(SFCommand *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFShareCommand *)self shareItem];
    objc_super v7 = [(SFShareCommand *)v5 shareItem];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFShareCommand *)self shareItem];
      if (v8)
      {
        v9 = [(SFShareCommand *)self shareItem];
        v10 = [(SFShareCommand *)v5 shareItem];
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
  v8.super_class = (Class)SFShareCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFShareCommand *)self shareItem];
  v6 = (void *)[v5 copy];
  [v4 setShareItem:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBShareCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBShareCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBShareCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBShareCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFShareCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFShareCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SFShareCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 shareItem];
    [(SFShareCommand *)v5 setShareItem:v9];

    v10 = [(SFCommand *)v8 commandDetail];
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

- (SFShareCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFShareCommand;
  unint64_t v5 = [(SFShareCommand *)&v12 init];
  if (v5)
  {
    v6 = [v4 shareItem];

    if (v6)
    {
      objc_super v7 = [SFShareItem alloc];
      objc_super v8 = [v4 shareItem];
      v9 = [(SFShareItem *)v7 initWithProtobuf:v8];
      [(SFShareCommand *)v5 setShareItem:v9];
    }
    v10 = v5;
  }

  return v5;
}

@end