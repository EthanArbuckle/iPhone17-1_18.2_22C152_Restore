@interface TUIElementVSpacer
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
@end

@implementation TUIElementVSpacer

+ (id)supportedAttributes
{
  return +[TUIAttributeSet supportedAttributesSize];
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

@end