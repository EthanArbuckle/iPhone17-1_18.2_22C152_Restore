@interface WFToolKitTypedValueContent
+ (BOOL)supportsSecureCoding;
- (NSData)encodedTypedValue;
- (NSString)name;
- (WFToolKitTypedValueContent)initWithCoder:(id)a3;
- (WFToolKitTypedValueContent)initWithEncodedTypedValue:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFToolKitTypedValueContent

- (void).cxx_destruct
{
}

- (NSData)encodedTypedValue
{
  return self->_encodedTypedValue;
}

- (NSString)name
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFToolKitTypedValueContent *)self encodedTypedValue];
  [v4 encodeObject:v5 forKey:@"encodedTypedValue"];
}

- (WFToolKitTypedValueContent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encodedTypedValue"];

  if (v5)
  {
    self = [(WFToolKitTypedValueContent *)self initWithEncodedTypedValue:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WFToolKitTypedValueContent)initWithEncodedTypedValue:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFToolKitTypedValueContent;
  id v5 = [(WFToolKitTypedValueContent *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    encodedTypedValue = v5->_encodedTypedValue;
    v5->_encodedTypedValue = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end