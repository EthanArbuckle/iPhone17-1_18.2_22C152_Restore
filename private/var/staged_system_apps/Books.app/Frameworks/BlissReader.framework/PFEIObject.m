@interface PFEIObject
+ (const)keyXmlAttributeName;
+ (void)delegateMap;
@end

@implementation PFEIObject

+ (void)delegateMap
{
  result = (void *)qword_5737A8;
  if (!qword_5737A8)
  {
    objc_sync_enter(a1);
    if (!qword_5737A8) {
      operator new();
    }
    objc_sync_exit(a1);
    return (void *)qword_5737A8;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return "type";
}

@end