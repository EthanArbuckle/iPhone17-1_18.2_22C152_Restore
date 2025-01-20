@interface SFTextCopyItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)copyableString;
- (SFTextCopyItem)initWithCoder:(id)a3;
- (SFTextCopyItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCopyableString:(id)a3;
@end

@implementation SFTextCopyItem

- (SFTextCopyItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFTextCopyItem;
  v5 = [(SFTextCopyItem *)&v10 init];
  if (v5)
  {
    v6 = [v4 copyableString];

    if (v6)
    {
      v7 = [v4 copyableString];
      [(SFTextCopyItem *)v5 setCopyableString:v7];
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setCopyableString:(id)a3
{
}

- (NSString)copyableString
{
  return self->_copyableString;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFTextCopyItem;
  unint64_t v3 = [(SFCopyItem *)&v7 hash];
  id v4 = [(SFTextCopyItem *)self copyableString];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFTextCopyItem *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFTextCopyItem *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFTextCopyItem,
             [(SFCopyItem *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFTextCopyItem *)self copyableString];
    objc_super v7 = [(SFTextCopyItem *)v5 copyableString];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFTextCopyItem *)self copyableString];
      if (v8)
      {
        v9 = [(SFTextCopyItem *)self copyableString];
        objc_super v10 = [(SFTextCopyItem *)v5 copyableString];
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
  v8.super_class = (Class)SFTextCopyItem;
  id v4 = [(SFCopyItem *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFTextCopyItem *)self copyableString];
  v6 = (void *)[v5 copy];
  [v4 setCopyableString:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBTextCopyItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBTextCopyItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBTextCopyItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBTextCopyItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBTextCopyItem alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBTextCopyItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFTextCopyItem)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBTextCopyItem alloc] initWithData:v5];
  objc_super v7 = [(SFTextCopyItem *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end