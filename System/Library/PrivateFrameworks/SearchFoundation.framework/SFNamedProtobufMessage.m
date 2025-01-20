@interface SFNamedProtobufMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSData)protobufMessageData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)protobufMessageName;
- (SFNamedProtobufMessage)initWithCoder:(id)a3;
- (SFNamedProtobufMessage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setProtobufMessageData:(id)a3;
- (void)setProtobufMessageName:(id)a3;
@end

@implementation SFNamedProtobufMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protobufMessageName, 0);
  objc_storeStrong((id *)&self->_protobufMessageData, 0);
}

- (void)setProtobufMessageName:(id)a3
{
}

- (NSString)protobufMessageName
{
  return self->_protobufMessageName;
}

- (void)setProtobufMessageData:(id)a3
{
}

- (NSData)protobufMessageData
{
  return self->_protobufMessageData;
}

- (unint64_t)hash
{
  v3 = [(SFNamedProtobufMessage *)self protobufMessageData];
  uint64_t v4 = [v3 hash];
  v5 = [(SFNamedProtobufMessage *)self protobufMessageName];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFNamedProtobufMessage *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFNamedProtobufMessage *)v5 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v6 = v5;
      v7 = [(SFNamedProtobufMessage *)self protobufMessageData];
      v8 = [(SFNamedProtobufMessage *)v6 protobufMessageData];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v9 = [(SFNamedProtobufMessage *)self protobufMessageData];
      if (v9)
      {
        v3 = [(SFNamedProtobufMessage *)self protobufMessageData];
        v10 = [(SFNamedProtobufMessage *)v6 protobufMessageData];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      v12 = [(SFNamedProtobufMessage *)self protobufMessageName];
      v13 = [(SFNamedProtobufMessage *)v6 protobufMessageName];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
      }
      else
      {
        uint64_t v15 = [(SFNamedProtobufMessage *)self protobufMessageName];
        if (v15)
        {
          v16 = (void *)v15;
          v19 = [(SFNamedProtobufMessage *)self protobufMessageName];
          [(SFNamedProtobufMessage *)v6 protobufMessageName];
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
  v5 = [(SFNamedProtobufMessage *)self protobufMessageData];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setProtobufMessageData:v6];

  v7 = [(SFNamedProtobufMessage *)self protobufMessageName];
  v8 = (void *)[v7 copy];
  [v4 setProtobufMessageName:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBNamedProtobufMessage alloc] initWithFacade:self];
  v3 = [(_SFPBNamedProtobufMessage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBNamedProtobufMessage alloc] initWithFacade:self];
  v3 = [(_SFPBNamedProtobufMessage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBNamedProtobufMessage alloc] initWithFacade:self];
  v5 = [(_SFPBNamedProtobufMessage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFNamedProtobufMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBNamedProtobufMessage alloc] initWithData:v5];
  v7 = [(SFNamedProtobufMessage *)self initWithProtobuf:v6];

  return v7;
}

- (SFNamedProtobufMessage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFNamedProtobufMessage;
  v5 = [(SFNamedProtobufMessage *)&v12 init];
  if (v5)
  {
    unint64_t v6 = [v4 protobufMessageData];

    if (v6)
    {
      v7 = [v4 protobufMessageData];
      [(SFNamedProtobufMessage *)v5 setProtobufMessageData:v7];
    }
    v8 = [v4 protobufMessageName];

    if (v8)
    {
      v9 = [v4 protobufMessageName];
      [(SFNamedProtobufMessage *)v5 setProtobufMessageName:v9];
    }
    v10 = v5;
  }

  return v5;
}

@end