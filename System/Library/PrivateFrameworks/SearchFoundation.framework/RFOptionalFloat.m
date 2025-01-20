@interface RFOptionalFloat
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)value;
- (RFOptionalFloat)initWithCoder:(id)a3;
- (RFOptionalFloat)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation RFOptionalFloat

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

- (NSNumber)value
{
  return self->_value;
}

- (unint64_t)hash
{
  v2 = [(RFOptionalFloat *)self value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RFOptionalFloat *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(RFOptionalFloat *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(RFOptionalFloat *)self value];
    v7 = [(RFOptionalFloat *)v5 value];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(RFOptionalFloat *)self value];
      if (v8)
      {
        v9 = [(RFOptionalFloat *)self value];
        v10 = [(RFOptionalFloat *)v5 value];
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
  v5 = [(RFOptionalFloat *)self value];
  v6 = (void *)[v5 copy];
  [v4 setValue:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFOptionalFloat alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFOptionalFloat *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFOptionalFloat alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFOptionalFloat *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBRFOptionalFloat alloc] initWithFacade:self];
  v5 = [(_SFPBRFOptionalFloat *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFOptionalFloat)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBRFOptionalFloat alloc] initWithData:v5];
  v7 = [(RFOptionalFloat *)self initWithProtobuf:v6];

  return v7;
}

- (RFOptionalFloat)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RFOptionalFloat;
  v5 = [(RFOptionalFloat *)&v11 init];
  if (v5)
  {
    [v4 value];
    if (v6 != 0.0)
    {
      v7 = NSNumber;
      [v4 value];
      v8 = objc_msgSend(v7, "numberWithFloat:");
      [(RFOptionalFloat *)v5 setValue:v8];
    }
    v9 = v5;
  }

  return v5;
}

@end