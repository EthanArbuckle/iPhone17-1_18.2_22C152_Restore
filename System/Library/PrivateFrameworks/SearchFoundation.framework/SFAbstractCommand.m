@interface SFAbstractCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFAbstractCommand)initWithCoder:(id)a3;
- (SFAbstractCommand)initWithProtobuf:(id)a3;
- (SFCommandValue)value;
- (id)copyWithZone:(_NSZone *)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int)a3;
- (void)setValue:(id)a3;
@end

@implementation SFAbstractCommand

- (SFAbstractCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFAbstractCommand;
  v5 = [(SFAbstractCommand *)&v12 init];
  if (v5)
  {
    if ([v4 type]) {
      -[SFAbstractCommand setType:](v5, "setType:", [v4 type]);
    }
    v6 = [v4 value];

    if (v6)
    {
      v7 = [SFCommandValue alloc];
      v8 = [v4 value];
      v9 = [(SFCommandValue *)v7 initWithProtobuf:v8];
      [(SFAbstractCommand *)v5 setValue:v9];
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
}

- (void)setValue:(id)a3
{
}

- (SFCommandValue)value
{
  return self->_value;
}

- (int)type
{
  return self->_type;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SFAbstractCommand *)self type];
  id v4 = [(SFAbstractCommand *)self value];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFAbstractCommand *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else if ([(SFAbstractCommand *)v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t v5 = v4;
    int v6 = [(SFAbstractCommand *)self type];
    if (v6 == [(SFAbstractCommand *)v5 type])
    {
      v7 = [(SFAbstractCommand *)self value];
      v8 = [(SFAbstractCommand *)v5 value];
      if ((v7 == 0) == (v8 != 0))
      {
        char v12 = 0;
      }
      else
      {
        v9 = [(SFAbstractCommand *)self value];
        if (v9)
        {
          v10 = [(SFAbstractCommand *)self value];
          v11 = [(SFAbstractCommand *)v5 value];
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
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setType:", -[SFAbstractCommand type](self, "type"));
  unint64_t v5 = [(SFAbstractCommand *)self value];
  int v6 = (void *)[v5 copy];
  [v4 setValue:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBAbstractCommand alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBAbstractCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBAbstractCommand alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBAbstractCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v6 = [[_SFPBAbstractCommand alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBAbstractCommand *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFAbstractCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  int v6 = [[_SFPBAbstractCommand alloc] initWithData:v5];
  v7 = [(SFAbstractCommand *)self initWithProtobuf:v6];

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

@end