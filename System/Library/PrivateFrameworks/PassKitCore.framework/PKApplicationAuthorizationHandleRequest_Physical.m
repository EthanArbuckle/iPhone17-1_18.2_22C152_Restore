@interface PKApplicationAuthorizationHandleRequest_Physical
+ (BOOL)supportsSecureCoding;
+ (id)createForName:(id)a3 externalizedContext:(id)a4;
- (PKApplicationAuthorizationHandleRequest_Physical)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplicationAuthorizationHandleRequest_Physical

+ (id)createForName:(id)a3 externalizedContext:(id)a4
{
  return +[PKApplicationAuthorizationHandleRequest _createForName:context:withType:]((uint64_t)PKApplicationAuthorizationHandleRequest, a3, a4, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationAuthorizationHandleRequest_Physical)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKApplicationAuthorizationHandleRequest_Physical;
  return [(PKApplicationAuthorizationHandleRequest *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKApplicationAuthorizationHandleRequest_Physical;
  [(PKApplicationAuthorizationHandleRequest *)&v3 encodeWithCoder:a3];
}

@end