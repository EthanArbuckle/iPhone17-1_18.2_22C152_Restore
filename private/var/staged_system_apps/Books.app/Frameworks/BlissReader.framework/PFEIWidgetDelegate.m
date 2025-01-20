@interface PFEIWidgetDelegate
+ (const)keyXmlAttributeName;
+ (void)delegateMap;
@end

@implementation PFEIWidgetDelegate

+ (void)delegateMap
{
  result = (void *)qword_573388;
  if (!qword_573388)
  {
    objc_sync_enter(a1);
    if (!qword_573388) {
      operator new();
    }
    objc_sync_exit(a1);
    return (void *)qword_573388;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return PFXWidgetConstantDataWidgetType[0];
}

@end