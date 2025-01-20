@interface SFCopyCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFCopyCommand)initWithCoder:(id)a3;
- (SFCopyCommand)initWithProtobuf:(id)a3;
- (SFCopyItem)copyableItem;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCopyableItem:(id)a3;
@end

@implementation SFCopyCommand

- (void).cxx_destruct
{
}

- (void)setCopyableItem:(id)a3
{
}

- (SFCopyItem)copyableItem
{
  return self->_copyableItem;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFCopyCommand;
  unint64_t v3 = [(SFCommand *)&v7 hash];
  v4 = [(SFCopyCommand *)self copyableItem];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFCopyCommand *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFCopyCommand *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFCopyCommand,
             [(SFCommand *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFCopyCommand *)self copyableItem];
    objc_super v7 = [(SFCopyCommand *)v5 copyableItem];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFCopyCommand *)self copyableItem];
      if (v8)
      {
        v9 = [(SFCopyCommand *)self copyableItem];
        v10 = [(SFCopyCommand *)v5 copyableItem];
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
  v8.super_class = (Class)SFCopyCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFCopyCommand *)self copyableItem];
  v6 = (void *)[v5 copy];
  [v4 setCopyableItem:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCopyCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCopyCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCopyCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCopyCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFCopyCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFCopyCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SFCopyCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 copyableItem];
    [(SFCopyCommand *)v5 setCopyableItem:v9];

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

- (SFCopyCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCopyCommand;
  unint64_t v5 = [(SFCopyCommand *)&v12 init];
  if (v5)
  {
    v6 = [v4 copyableItem];

    if (v6)
    {
      objc_super v7 = [SFCopyItem alloc];
      objc_super v8 = [v4 copyableItem];
      v9 = [(SFCopyItem *)v7 initWithProtobuf:v8];
      [(SFCopyCommand *)v5 setCopyableItem:v9];
    }
    v10 = v5;
  }

  return v5;
}

@end