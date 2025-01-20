@interface RFOptionalBool
+ (BOOL)supportsSecureCoding;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)value;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFOptionalBool)initWithCoder:(id)a3;
- (RFOptionalBool)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(BOOL)a3;
@end

@implementation RFOptionalBool

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)value
{
  return self->_value;
}

- (unint64_t)hash
{
  return [(RFOptionalBool *)self value];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RFOptionalBool *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if ([(RFOptionalBool *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    BOOL v6 = [(RFOptionalBool *)self value];
    BOOL v7 = [(RFOptionalBool *)v5 value];

    char v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setValue:", -[RFOptionalBool value](self, "value"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFOptionalBool alloc] initWithFacade:self];
  v3 = [(_SFPBRFOptionalBool *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFOptionalBool alloc] initWithFacade:self];
  v3 = [(_SFPBRFOptionalBool *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v6 = [[_SFPBRFOptionalBool alloc] initWithFacade:self];
  v5 = [(_SFPBRFOptionalBool *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFOptionalBool)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  BOOL v6 = [[_SFPBRFOptionalBool alloc] initWithData:v5];
  BOOL v7 = [(RFOptionalBool *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_value = a3;
}

- (RFOptionalBool)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RFOptionalBool;
  v5 = [(RFOptionalBool *)&v8 init];
  if (v5)
  {
    if ([v4 value]) {
      -[RFOptionalBool setValue:](v5, "setValue:", [v4 value]);
    }
    BOOL v6 = v5;
  }

  return v5;
}

@end