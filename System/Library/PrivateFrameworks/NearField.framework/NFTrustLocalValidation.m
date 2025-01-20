@interface NFTrustLocalValidation
+ (BOOL)supportsSecureCoding;
+ (id)localValidationWithFaceID;
+ (id)localValidationWithPassCode;
+ (id)localValidationWithTouchID;
+ (id)withPrimitiveLocalValidation:(unsigned __int8)a3;
- (NFTrustLocalValidation)initWithCoder:(id)a3;
- (id)description;
- (unsigned)primitiveLocalValidation;
- (void)encodeWithCoder:(id)a3;
- (void)setPrimitiveLocalValidation:(unsigned __int8)a3;
@end

@implementation NFTrustLocalValidation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustLocalValidation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NFTrustLocalValidation;
  v5 = [(NFTrustObject *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_primitiveLocalValidation = [v4 decodeIntForKey:@"primitiveLocalValidation"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NFTrustLocalValidation primitiveLocalValidation](self, "primitiveLocalValidation"), @"primitiveLocalValidation");
}

+ (id)withPrimitiveLocalValidation:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [NFTrustLocalValidation alloc];
  v5 = v4;
  if (v4) {
    [(NFTrustLocalValidation *)v4 setPrimitiveLocalValidation:v3];
  }
  return v5;
}

+ (id)localValidationWithPassCode
{
  return (id)[a1 withPrimitiveLocalValidation:1];
}

+ (id)localValidationWithTouchID
{
  return (id)[a1 withPrimitiveLocalValidation:2];
}

+ (id)localValidationWithFaceID
{
  return (id)[a1 withPrimitiveLocalValidation:4];
}

- (id)description
{
  int v2 = [(NFTrustLocalValidation *)self primitiveLocalValidation];
  uint64_t v3 = @"PassCode";
  if (v2 == 2) {
    uint64_t v3 = @"TouchID";
  }
  if (v2 == 4) {
    return @"FaceID";
  }
  else {
    return v3;
  }
}

- (unsigned)primitiveLocalValidation
{
  return self->_primitiveLocalValidation;
}

- (void)setPrimitiveLocalValidation:(unsigned __int8)a3
{
  self->_primitiveLocalValidation = a3;
}

@end