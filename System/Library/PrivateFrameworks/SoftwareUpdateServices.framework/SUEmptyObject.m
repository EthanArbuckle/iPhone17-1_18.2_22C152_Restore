@interface SUEmptyObject
+ (BOOL)supportsSecureCoding;
- (SUEmptyObject)initWithCoder:(id)a3;
@end

@implementation SUEmptyObject

- (SUEmptyObject)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUEmptyObject;
  return [(SUEmptyObject *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end