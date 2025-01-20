@interface SFCommandValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFCommandValue)initWithCoder:(id)a3;
- (SFCommandValue)initWithProtobuf:(id)a3;
- (SFReferentialCommand)referentialCommand;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setReferentialCommand:(id)a3;
@end

@implementation SFCommandValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)setReferentialCommand:(id)a3
{
}

- (SFReferentialCommand)referentialCommand
{
  return self->_referentialCommand;
}

- (unint64_t)hash
{
  v2 = [(SFCommandValue *)self referentialCommand];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFCommandValue *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFCommandValue *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(SFCommandValue *)self referentialCommand];
    v7 = [(SFCommandValue *)v5 referentialCommand];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFCommandValue *)self referentialCommand];
      if (v8)
      {
        v9 = [(SFCommandValue *)self referentialCommand];
        v10 = [(SFCommandValue *)v5 referentialCommand];
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
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFCommandValue *)self referentialCommand];
  v6 = (void *)[v5 copy];
  [v4 setReferentialCommand:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCommandValue alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCommandValue *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCommandValue alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCommandValue *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBCommandValue alloc] initWithFacade:self];
  v5 = [(_SFPBCommandValue *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCommandValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBCommandValue alloc] initWithData:v5];
  v7 = [(SFCommandValue *)self initWithProtobuf:v6];

  return v7;
}

- (SFCommandValue)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCommandValue;
  v5 = [(SFCommandValue *)&v12 init];
  if (v5)
  {
    v6 = [v4 referentialCommand];

    if (v6)
    {
      v7 = [SFReferentialCommand alloc];
      v8 = [v4 referentialCommand];
      v9 = [(SFReferentialCommand *)v7 initWithProtobuf:v8];
      [(SFCommandValue *)v5 setReferentialCommand:v9];
    }
    v10 = v5;
  }

  return v5;
}

@end