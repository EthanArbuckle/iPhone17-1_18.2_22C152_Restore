@interface SFSportsItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)identifier;
- (SFSportsItem)initWithCoder:(id)a3;
- (SFSportsItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setType:(int)a3;
@end

@implementation SFSportsItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int)type
{
  return self->_type;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SFSportsItem *)self type];
  v4 = [(SFSportsItem *)self identifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFSportsItem *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else if ([(SFSportsItem *)v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t v5 = v4;
    int v6 = [(SFSportsItem *)self type];
    if (v6 == [(SFSportsItem *)v5 type])
    {
      v7 = [(SFSportsItem *)self identifier];
      v8 = [(SFSportsItem *)v5 identifier];
      if ((v7 == 0) == (v8 != 0))
      {
        char v12 = 0;
      }
      else
      {
        v9 = [(SFSportsItem *)self identifier];
        if (v9)
        {
          v10 = [(SFSportsItem *)self identifier];
          v11 = [(SFSportsItem *)v5 identifier];
          char v12 = [v10 isEqual:v11];
        }
        else
        {
          char v12 = 1;
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setType:", -[SFSportsItem type](self, "type"));
  unint64_t v5 = [(SFSportsItem *)self identifier];
  int v6 = (void *)[v5 copy];
  [v4 setIdentifier:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBSportsItem alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBSportsItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBSportsItem alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBSportsItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v6 = [[_SFPBSportsItem alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBSportsItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFSportsItem)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  int v6 = [[_SFPBSportsItem alloc] initWithData:v5];
  v7 = [(SFSportsItem *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (SFSportsItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSportsItem;
  unint64_t v5 = [(SFSportsItem *)&v10 init];
  if (v5)
  {
    if ([v4 type]) {
      -[SFSportsItem setType:](v5, "setType:", [v4 type]);
    }
    int v6 = [v4 identifier];

    if (v6)
    {
      v7 = [v4 identifier];
      [(SFSportsItem *)v5 setIdentifier:v7];
    }
    v8 = v5;
  }

  return v5;
}

@end