@interface SFKeyValueTuple
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)key;
- (NSString)value;
- (SFKeyValueTuple)initWithCoder:(id)a3;
- (SFKeyValueTuple)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SFKeyValueTuple

- (SFKeyValueTuple)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFKeyValueTuple;
  v5 = [(SFKeyValueTuple *)&v12 init];
  if (v5)
  {
    v6 = [v4 key];

    if (v6)
    {
      v7 = [v4 key];
      [(SFKeyValueTuple *)v5 setKey:v7];
    }
    v8 = [v4 value];

    if (v8)
    {
      v9 = [v4 value];
      [(SFKeyValueTuple *)v5 setValue:v9];
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
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (unint64_t)hash
{
  v3 = [(SFKeyValueTuple *)self key];
  uint64_t v4 = [v3 hash];
  v5 = [(SFKeyValueTuple *)self value];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFKeyValueTuple *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFKeyValueTuple *)v5 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v6 = v5;
      v7 = [(SFKeyValueTuple *)self key];
      v8 = [(SFKeyValueTuple *)v6 key];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v9 = [(SFKeyValueTuple *)self key];
      if (v9)
      {
        v3 = [(SFKeyValueTuple *)self key];
        v10 = [(SFKeyValueTuple *)v6 key];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      objc_super v12 = [(SFKeyValueTuple *)self value];
      v13 = [(SFKeyValueTuple *)v6 value];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
      }
      else
      {
        uint64_t v15 = [(SFKeyValueTuple *)self value];
        if (v15)
        {
          v16 = (void *)v15;
          v19 = [(SFKeyValueTuple *)self value];
          [(SFKeyValueTuple *)v6 value];
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
  v5 = [(SFKeyValueTuple *)self key];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setKey:v6];

  v7 = [(SFKeyValueTuple *)self value];
  v8 = (void *)[v7 copy];
  [v4 setValue:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBKeyValueTuple alloc] initWithFacade:self];
  v3 = [(_SFPBKeyValueTuple *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBKeyValueTuple alloc] initWithFacade:self];
  v3 = [(_SFPBKeyValueTuple *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBKeyValueTuple alloc] initWithFacade:self];
  v5 = [(_SFPBKeyValueTuple *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFKeyValueTuple)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBKeyValueTuple alloc] initWithData:v5];
  v7 = [(SFKeyValueTuple *)self initWithProtobuf:v6];

  return v7;
}

@end