@interface SFCATModel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSData)params;
- (NSDictionary)dictionaryRepresentation;
- (NSString)bundleIdentifier;
- (NSString)catIdentifier;
- (SFCATModel)initWithCoder:(id)a3;
- (SFCATModel)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCatIdentifier:(id)a3;
- (void)setParams:(id)a3;
@end

@implementation SFCATModel

- (SFCATModel)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFCATModel;
  v5 = [(SFCATModel *)&v14 init];
  if (v5)
  {
    v6 = [v4 catIdentifier];

    if (v6)
    {
      v7 = [v4 catIdentifier];
      [(SFCATModel *)v5 setCatIdentifier:v7];
    }
    v8 = [v4 bundleIdentifier];

    if (v8)
    {
      v9 = [v4 bundleIdentifier];
      [(SFCATModel *)v5 setBundleIdentifier:v9];
    }
    v10 = [v4 params];

    if (v10)
    {
      v11 = [v4 params];
      [(SFCATModel *)v5 setParams:v11];
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
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_catIdentifier, 0);
}

- (void)setParams:(id)a3
{
}

- (NSData)params
{
  return self->_params;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setCatIdentifier:(id)a3
{
}

- (NSString)catIdentifier
{
  return self->_catIdentifier;
}

- (unint64_t)hash
{
  v3 = [(SFCATModel *)self catIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(SFCATModel *)self bundleIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFCATModel *)self params];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFCATModel *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFCATModel *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(SFCATModel *)self catIdentifier];
      unint64_t v8 = [(SFCATModel *)v6 catIdentifier];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v9 = [(SFCATModel *)self catIdentifier];
      if (v9)
      {
        v3 = [(SFCATModel *)self catIdentifier];
        v10 = [(SFCATModel *)v6 catIdentifier];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      v12 = [(SFCATModel *)self bundleIdentifier];
      v13 = [(SFCATModel *)v6 bundleIdentifier];
      objc_super v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_27;
      }
      v15 = [(SFCATModel *)self bundleIdentifier];
      if (v15)
      {
        v25 = v12;
        v16 = [(SFCATModel *)self bundleIdentifier];
        v28 = [(SFCATModel *)v6 bundleIdentifier];
        v29 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          char v11 = 0;
          v12 = v25;
          goto LABEL_25;
        }
        v30 = v15;
        v27 = v3;
        v12 = v25;
      }
      else
      {
        v30 = 0;
        v27 = v3;
      }
      v17 = [(SFCATModel *)self params];
      v18 = [(SFCATModel *)v6 params];
      if ((v17 == 0) == (v18 != 0))
      {

        char v11 = 0;
        v3 = v27;
        v15 = v30;
        if (!v30) {
          goto LABEL_26;
        }
      }
      else
      {
        v24 = v17;
        v26 = v18;
        uint64_t v19 = [(SFCATModel *)self params];
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          v22 = [(SFCATModel *)self params];
          v20 = [(SFCATModel *)v6 params];
          char v11 = objc_msgSend(v22, "isEqual:");
        }
        else
        {

          char v11 = 1;
        }
        v3 = v27;
        if (!v30) {
          goto LABEL_26;
        }
      }
LABEL_25:

LABEL_26:
LABEL_27:
      v10 = v31;
      if (!v9)
      {
LABEL_29:

        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    char v11 = 0;
  }
LABEL_31:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFCATModel *)self catIdentifier];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setCatIdentifier:v6];

  v7 = [(SFCATModel *)self bundleIdentifier];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setBundleIdentifier:v8];

  v9 = [(SFCATModel *)self params];
  v10 = (void *)[v9 copy];
  [v4 setParams:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCATModel alloc] initWithFacade:self];
  v3 = [(_SFPBCATModel *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCATModel alloc] initWithFacade:self];
  v3 = [(_SFPBCATModel *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBCATModel alloc] initWithFacade:self];
  v5 = [(_SFPBCATModel *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCATModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBCATModel alloc] initWithData:v5];
  v7 = [(SFCATModel *)self initWithProtobuf:v6];

  return v7;
}

@end