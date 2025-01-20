@interface SFAppEntityAnnotation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)entityIdentifer;
- (NSString)typeIdentifer;
- (SFAppEntityAnnotation)initWithCoder:(id)a3;
- (SFAppEntityAnnotation)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEntityIdentifer:(id)a3;
- (void)setTypeIdentifer:(id)a3;
@end

@implementation SFAppEntityAnnotation

- (SFAppEntityAnnotation)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFAppEntityAnnotation;
  v5 = [(SFAppEntityAnnotation *)&v12 init];
  if (v5)
  {
    v6 = [v4 typeIdentifer];

    if (v6)
    {
      v7 = [v4 typeIdentifer];
      [(SFAppEntityAnnotation *)v5 setTypeIdentifer:v7];
    }
    v8 = [v4 entityIdentifer];

    if (v8)
    {
      v9 = [v4 entityIdentifer];
      [(SFAppEntityAnnotation *)v5 setEntityIdentifer:v9];
    }
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifer, 0);
  objc_storeStrong((id *)&self->_typeIdentifer, 0);
}

- (void)setEntityIdentifer:(id)a3
{
}

- (NSString)entityIdentifer
{
  return self->_entityIdentifer;
}

- (void)setTypeIdentifer:(id)a3
{
}

- (NSString)typeIdentifer
{
  return self->_typeIdentifer;
}

- (unint64_t)hash
{
  v3 = [(SFAppEntityAnnotation *)self typeIdentifer];
  uint64_t v4 = [v3 hash];
  v5 = [(SFAppEntityAnnotation *)self entityIdentifer];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFAppEntityAnnotation *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFAppEntityAnnotation *)v5 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v6 = v5;
      v7 = [(SFAppEntityAnnotation *)self typeIdentifer];
      v8 = [(SFAppEntityAnnotation *)v6 typeIdentifer];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v9 = [(SFAppEntityAnnotation *)self typeIdentifer];
      if (v9)
      {
        v3 = [(SFAppEntityAnnotation *)self typeIdentifer];
        v10 = [(SFAppEntityAnnotation *)v6 typeIdentifer];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      objc_super v12 = [(SFAppEntityAnnotation *)self entityIdentifer];
      v13 = [(SFAppEntityAnnotation *)v6 entityIdentifer];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
      }
      else
      {
        uint64_t v15 = [(SFAppEntityAnnotation *)self entityIdentifer];
        if (v15)
        {
          v16 = (void *)v15;
          v19 = [(SFAppEntityAnnotation *)self entityIdentifer];
          [(SFAppEntityAnnotation *)v6 entityIdentifer];
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
  v5 = [(SFAppEntityAnnotation *)self typeIdentifer];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setTypeIdentifer:v6];

  v7 = [(SFAppEntityAnnotation *)self entityIdentifer];
  v8 = (void *)[v7 copy];
  [v4 setEntityIdentifer:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBAppEntityAnnotation alloc] initWithFacade:self];
  v3 = [(_SFPBAppEntityAnnotation *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBAppEntityAnnotation alloc] initWithFacade:self];
  v3 = [(_SFPBAppEntityAnnotation *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBAppEntityAnnotation alloc] initWithFacade:self];
  v5 = [(_SFPBAppEntityAnnotation *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFAppEntityAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBAppEntityAnnotation alloc] initWithData:v5];
  v7 = [(SFAppEntityAnnotation *)self initWithProtobuf:v6];

  return v7;
}

@end