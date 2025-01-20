@interface SXTextSourceDefaults
+ (id)defaults;
- (SXTextSourceDefaults)init;
@end

@implementation SXTextSourceDefaults

+ (id)defaults
{
  id v0 = objc_alloc_init((Class)self);
  return v0;
}

- (SXTextSourceDefaults)init
{
  v3.receiver = self;
  v3.super_class = (Class)SXTextSourceDefaults;
  result = [(SXTextSourceDefaults *)&v3 init];
  if (result) {
    result->_fontSize = 18.0;
  }
  return result;
}

@end