@interface PLAbstractEncodableObject
+ (BOOL)supportsSecureCoding;
- (PLAbstractEncodableObject)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLAbstractEncodableObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PLAbstractEncodableObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PFAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PFAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

@end