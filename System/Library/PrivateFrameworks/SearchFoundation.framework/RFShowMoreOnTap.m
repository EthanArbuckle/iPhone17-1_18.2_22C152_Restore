@interface RFShowMoreOnTap
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)affordanceLabel;
- (RFShowMoreOnTap)initWithCoder:(id)a3;
- (RFShowMoreOnTap)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAffordanceLabel:(id)a3;
@end

@implementation RFShowMoreOnTap

- (RFShowMoreOnTap)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RFShowMoreOnTap;
  v5 = [(RFShowMoreOnTap *)&v10 init];
  if (v5)
  {
    v6 = [v4 affordanceLabel];

    if (v6)
    {
      v7 = [v4 affordanceLabel];
      [(RFShowMoreOnTap *)v5 setAffordanceLabel:v7];
    }
    v8 = v5;
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

- (void)setAffordanceLabel:(id)a3
{
}

- (NSString)affordanceLabel
{
  return self->_affordanceLabel;
}

- (unint64_t)hash
{
  v2 = [(RFShowMoreOnTap *)self affordanceLabel];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RFShowMoreOnTap *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(RFShowMoreOnTap *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(RFShowMoreOnTap *)self affordanceLabel];
    v7 = [(RFShowMoreOnTap *)v5 affordanceLabel];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(RFShowMoreOnTap *)self affordanceLabel];
      if (v8)
      {
        v9 = [(RFShowMoreOnTap *)self affordanceLabel];
        objc_super v10 = [(RFShowMoreOnTap *)v5 affordanceLabel];
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
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(RFShowMoreOnTap *)self affordanceLabel];
  v6 = (void *)[v5 copy];
  [v4 setAffordanceLabel:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFShowMoreOnTap alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFShowMoreOnTap *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFShowMoreOnTap alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFShowMoreOnTap *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBRFShowMoreOnTap alloc] initWithFacade:self];
  v5 = [(_SFPBRFShowMoreOnTap *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFShowMoreOnTap)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBRFShowMoreOnTap alloc] initWithData:v5];
  v7 = [(RFShowMoreOnTap *)self initWithProtobuf:v6];

  return v7;
}

@end