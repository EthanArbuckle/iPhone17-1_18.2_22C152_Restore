@interface PKApplicationAuthorizationHandleRequest_Virtual
+ (BOOL)supportsSecureCoding;
+ (id)createForName:(id)a3 externalizedContext:(id)a4;
- (PKApplicationAuthorizationHandleRequest_Virtual)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplicationAuthorizationHandleRequest_Virtual

+ (id)createForName:(id)a3 externalizedContext:(id)a4
{
  return +[PKApplicationAuthorizationHandleRequest _createForName:context:withType:]((uint64_t)PKApplicationAuthorizationHandleRequest, a3, a4, 1uLL);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationAuthorizationHandleRequest_Virtual)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKApplicationAuthorizationHandleRequest_Virtual;
  return [(PKApplicationAuthorizationHandleRequest *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKApplicationAuthorizationHandleRequest_Virtual;
  [(PKApplicationAuthorizationHandleRequest *)&v3 encodeWithCoder:a3];
}

@end