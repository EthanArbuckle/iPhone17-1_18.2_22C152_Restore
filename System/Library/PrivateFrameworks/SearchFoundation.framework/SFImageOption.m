@interface SFImageOption
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)options;
- (NSString)defaultValue;
- (NSString)name;
- (SFImageOption)initWithCoder:(id)a3;
- (SFImageOption)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setName:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation SFImageOption

- (SFImageOption)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFImageOption;
  v5 = [(SFImageOption *)&v15 init];
  if (v5)
  {
    v6 = [v4 name];

    if (v6)
    {
      v7 = [v4 name];
      [(SFImageOption *)v5 setName:v7];
    }
    v8 = [v4 defaultValue];

    if (v8)
    {
      v9 = [v4 defaultValue];
      [(SFImageOption *)v5 setDefaultValue:v9];
    }
    v10 = [v4 options];

    if (v10)
    {
      v11 = [v4 options];
      v12 = _SFPBStringDictionaryHandwrittenTranslator(v11);
      [(SFImageOption *)v5 setOptions:v12];
    }
    v13 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setDefaultValue:(id)a3
{
}

- (NSString)defaultValue
{
  return self->_defaultValue;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)hash
{
  v3 = [(SFImageOption *)self name];
  uint64_t v4 = [v3 hash];
  v5 = [(SFImageOption *)self defaultValue];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFImageOption *)self options];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFImageOption *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFImageOption *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(SFImageOption *)self name];
      unint64_t v8 = [(SFImageOption *)v6 name];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v9 = [(SFImageOption *)self name];
      if (v9)
      {
        v3 = [(SFImageOption *)self name];
        v10 = [(SFImageOption *)v6 name];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      v12 = [(SFImageOption *)self defaultValue];
      v13 = [(SFImageOption *)v6 defaultValue];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_27;
      }
      objc_super v15 = [(SFImageOption *)self defaultValue];
      if (v15)
      {
        v25 = v12;
        v16 = [(SFImageOption *)self defaultValue];
        v28 = [(SFImageOption *)v6 defaultValue];
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
      v17 = [(SFImageOption *)self options];
      v18 = [(SFImageOption *)v6 options];
      if ((v17 == 0) == (v18 != 0))
      {

        char v11 = 0;
        v3 = v27;
        objc_super v15 = v30;
        if (!v30) {
          goto LABEL_26;
        }
      }
      else
      {
        v24 = v17;
        v26 = v18;
        uint64_t v19 = [(SFImageOption *)self options];
        objc_super v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          v22 = [(SFImageOption *)self options];
          v20 = [(SFImageOption *)v6 options];
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
  v5 = [(SFImageOption *)self name];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setName:v6];

  v7 = [(SFImageOption *)self defaultValue];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setDefaultValue:v8];

  v9 = [(SFImageOption *)self options];
  v10 = (void *)[v9 copy];
  [v4 setOptions:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBImageOption alloc] initWithFacade:self];
  v3 = [(_SFPBImageOption *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBImageOption alloc] initWithFacade:self];
  v3 = [(_SFPBImageOption *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBImageOption alloc] initWithFacade:self];
  v5 = [(_SFPBImageOption *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFImageOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBImageOption alloc] initWithData:v5];
  v7 = [(SFImageOption *)self initWithProtobuf:v6];

  return v7;
}

@end