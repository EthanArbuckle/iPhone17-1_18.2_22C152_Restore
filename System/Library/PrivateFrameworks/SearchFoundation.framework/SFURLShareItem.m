@interface SFURLShareItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSURL)urlValue;
- (SFURLShareItem)initWithCoder:(id)a3;
- (SFURLShareItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUrlValue:(id)a3;
@end

@implementation SFURLShareItem

- (SFURLShareItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFURLShareItem;
  v5 = [(SFURLShareItem *)&v11 init];
  if (v5)
  {
    v6 = [v4 urlValue];

    if (v6)
    {
      v7 = [v4 urlValue];
      v8 = _SFPBURLHandwrittenTranslator(v7);
      [(SFURLShareItem *)v5 setUrlValue:v8];
    }
    v9 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setUrlValue:(id)a3
{
}

- (NSURL)urlValue
{
  return self->_urlValue;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFURLShareItem;
  unint64_t v3 = [(SFShareItem *)&v7 hash];
  id v4 = [(SFURLShareItem *)self urlValue];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFURLShareItem *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFURLShareItem *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFURLShareItem,
             [(SFShareItem *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFURLShareItem *)self urlValue];
    objc_super v7 = [(SFURLShareItem *)v5 urlValue];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFURLShareItem *)self urlValue];
      if (v8)
      {
        v9 = [(SFURLShareItem *)self urlValue];
        v10 = [(SFURLShareItem *)v5 urlValue];
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
  v8.super_class = (Class)SFURLShareItem;
  id v4 = [(SFShareItem *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFURLShareItem *)self urlValue];
  v6 = (void *)[v5 copy];
  [v4 setUrlValue:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBURLShareItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBURLShareItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBURLShareItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBURLShareItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBURLShareItem alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBURLShareItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFURLShareItem)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBURLShareItem alloc] initWithData:v5];
  objc_super v7 = [(SFURLShareItem *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end