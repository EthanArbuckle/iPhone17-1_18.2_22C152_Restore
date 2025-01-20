@interface SFURLImage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)description;
- (NSURL)darkUrlValue;
- (NSURL)urlValue;
- (SFURLImage)initWithCoder:(id)a3;
- (SFURLImage)initWithProtobuf:(id)a3;
- (SFURLImage)initWithURL:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDarkUrlValue:(id)a3;
- (void)setUrlValue:(id)a3;
@end

@implementation SFURLImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkUrlValue, 0);
  objc_storeStrong((id *)&self->_urlValue, 0);
}

- (void)setDarkUrlValue:(id)a3
{
}

- (NSURL)darkUrlValue
{
  return self->_darkUrlValue;
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
  v9.receiver = self;
  v9.super_class = (Class)SFURLImage;
  unint64_t v3 = [(SFImage *)&v9 hash];
  v4 = [(SFURLImage *)self urlValue];
  uint64_t v5 = [v4 hash];
  v6 = [(SFURLImage *)self darkUrlValue];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFURLImage *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFURLImage *)v5 isMemberOfClass:objc_opt_class()])
    {
      v22.receiver = self;
      v22.super_class = (Class)SFURLImage;
      if ([(SFImage *)&v22 isEqual:v5])
      {
        v6 = v5;
        unint64_t v7 = [(SFURLImage *)self urlValue];
        v8 = [(SFURLImage *)v6 urlValue];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        objc_super v9 = [(SFURLImage *)self urlValue];
        if (v9)
        {
          unint64_t v3 = [(SFURLImage *)self urlValue];
          v10 = [(SFURLImage *)v6 urlValue];
          if (![v3 isEqual:v10])
          {
            char v11 = 0;
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v21 = v10;
        }
        v12 = [(SFURLImage *)self darkUrlValue];
        v13 = [(SFURLImage *)v6 darkUrlValue];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
        }
        else
        {
          uint64_t v15 = [(SFURLImage *)self darkUrlValue];
          if (v15)
          {
            v16 = (void *)v15;
            v19 = [(SFURLImage *)self darkUrlValue];
            [(SFURLImage *)v6 darkUrlValue];
            v17 = v20 = v3;
            char v11 = [v19 isEqual:v17];

            unint64_t v3 = v20;
          }
          else
          {

            char v11 = 1;
          }
        }
        v10 = v21;
        if (!v9) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    char v11 = 0;
  }
LABEL_21:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFURLImage;
  id v4 = [(SFImage *)&v10 copyWithZone:a3];
  uint64_t v5 = [(SFURLImage *)self urlValue];
  v6 = (void *)[v5 copy];
  [v4 setUrlValue:v6];

  unint64_t v7 = [(SFURLImage *)self darkUrlValue];
  v8 = (void *)[v7 copy];
  [v4 setDarkUrlValue:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBURLImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBURLImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBURLImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBURLImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBImage alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFURLImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBImage alloc] initWithData:v5];
  v9.receiver = self;
  v9.super_class = (Class)SFURLImage;
  unint64_t v7 = [(SFImage *)&v9 initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFURLImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFURLImage;
  uint64_t v5 = [(SFURLImage *)&v14 init];
  if (v5)
  {
    v6 = [v4 urlValue];

    if (v6)
    {
      unint64_t v7 = [v4 urlValue];
      v8 = _SFPBURLHandwrittenTranslator(v7);
      [(SFURLImage *)v5 setUrlValue:v8];
    }
    objc_super v9 = [v4 darkUrlValue];

    if (v9)
    {
      objc_super v10 = [v4 darkUrlValue];
      char v11 = _SFPBURLHandwrittenTranslator(v10);
      [(SFURLImage *)v5 setDarkUrlValue:v11];
    }
    v12 = v5;
  }

  return v5;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SFURLImage;
  id v4 = [(SFURLImage *)&v9 description];
  uint64_t v5 = [(SFURLImage *)self urlValue];
  v6 = [v5 absoluteString];
  unint64_t v7 = [v3 stringWithFormat:@"%@ - %@", v4, v6];

  return (NSString *)v7;
}

- (SFURLImage)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFURLImage;
  uint64_t v5 = [(SFURLImage *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(SFURLImage *)v5 setUrlValue:v4];
    unint64_t v7 = v6;
  }

  return v6;
}

@end