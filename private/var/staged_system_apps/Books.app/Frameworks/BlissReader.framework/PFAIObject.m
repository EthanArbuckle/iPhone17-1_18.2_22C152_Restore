@interface PFAIObject
+ (const)keyXmlAttributeName;
+ (void)delegateMap;
@end

@implementation PFAIObject

+ (void)delegateMap
{
  result = (void *)qword_573740;
  if (!qword_573740)
  {
    objc_sync_enter(a1);
    if (!qword_573740) {
      operator new();
    }
    objc_sync_exit(a1);
    return (void *)qword_573740;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return "type";
}

@end