@interface PFAIWidgetObject
+ (const)keyXmlAttributeName;
+ (void)delegateMap;
@end

@implementation PFAIWidgetObject

+ (void)delegateMap
{
  result = (void *)qword_573748;
  if (!qword_573748)
  {
    objc_sync_enter(a1);
    if (!qword_573748) {
      operator new();
    }
    objc_sync_exit(a1);
    return (void *)qword_573748;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return PFXWidgetConstantDataWidgetType[0];
}

@end