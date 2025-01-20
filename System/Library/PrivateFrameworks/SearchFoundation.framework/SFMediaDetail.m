@interface SFMediaDetail
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)title;
- (SFMediaDetail)initWithCoder:(id)a3;
- (SFMediaDetail)initWithProtobuf:(id)a3;
- (SFText)content;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFMediaDetail

- (SFMediaDetail)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFMediaDetail;
  v5 = [(SFMediaDetail *)&v14 init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [v4 title];
      [(SFMediaDetail *)v5 setTitle:v7];
    }
    v8 = [v4 content];

    if (v8)
    {
      v9 = [SFText alloc];
      v10 = [v4 content];
      v11 = [(SFText *)v9 initWithProtobuf:v10];
      [(SFMediaDetail *)v5 setContent:v11];
    }
    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setContent:(id)a3
{
}

- (SFText)content
{
  return self->_content;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)hash
{
  v3 = [(SFMediaDetail *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(SFMediaDetail *)self content];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFMediaDetail *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFMediaDetail *)v5 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v6 = v5;
      v7 = [(SFMediaDetail *)self title];
      v8 = [(SFMediaDetail *)v6 title];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v9 = [(SFMediaDetail *)self title];
      if (v9)
      {
        v3 = [(SFMediaDetail *)self title];
        v10 = [(SFMediaDetail *)v6 title];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      v12 = [(SFMediaDetail *)self content];
      v13 = [(SFMediaDetail *)v6 content];
      objc_super v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
      }
      else
      {
        uint64_t v15 = [(SFMediaDetail *)self content];
        if (v15)
        {
          v16 = (void *)v15;
          v19 = [(SFMediaDetail *)self content];
          [(SFMediaDetail *)v6 content];
          v17 = v20 = v3;
          char v11 = [v19 isEqual:v17];

          v3 = v20;
        }
        else
        {

          char v11 = 1;
        }
      }
      v10 = v21;
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFMediaDetail *)self title];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setTitle:v6];

  v7 = [(SFMediaDetail *)self content];
  v8 = (void *)[v7 copy];
  [v4 setContent:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMediaDetail alloc] initWithFacade:self];
  v3 = [(_SFPBMediaDetail *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMediaDetail alloc] initWithFacade:self];
  v3 = [(_SFPBMediaDetail *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBMediaDetail alloc] initWithFacade:self];
  v5 = [(_SFPBMediaDetail *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFMediaDetail)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBMediaDetail alloc] initWithData:v5];
  v7 = [(SFMediaDetail *)self initWithProtobuf:v6];

  return v7;
}

@end