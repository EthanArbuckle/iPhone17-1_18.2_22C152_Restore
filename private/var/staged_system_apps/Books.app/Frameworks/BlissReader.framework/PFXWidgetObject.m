@interface PFXWidgetObject
+ (const)keyXmlAttributeName;
+ (void)delegateMap;
@end

@implementation PFXWidgetObject

+ (void)delegateMap
{
  result = (void *)qword_573790;
  if (!qword_573790)
  {
    objc_sync_enter(a1);
    if (!qword_573790) {
      operator new();
    }
    objc_sync_exit(a1);
    return (void *)qword_573790;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return PFXWidgetConstantDataWidgetType[0];
}

@end