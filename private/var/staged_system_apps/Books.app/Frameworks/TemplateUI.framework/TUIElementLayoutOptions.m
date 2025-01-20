@interface TUIElementLayoutOptions
+ (Class)objectClass;
+ (unint64_t)definesScopes;
@end

@implementation TUIElementLayoutOptions

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

@end