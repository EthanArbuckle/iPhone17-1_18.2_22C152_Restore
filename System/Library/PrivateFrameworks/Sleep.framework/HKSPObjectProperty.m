@interface HKSPObjectProperty
@end

@implementation HKSPObjectProperty

NSString *__39___HKSPObjectProperty_encodeWithCoder___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

Class __37___HKSPObjectProperty_initWithCoder___block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

@end