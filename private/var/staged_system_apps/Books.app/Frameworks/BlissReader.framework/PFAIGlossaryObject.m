@interface PFAIGlossaryObject
+ (const)keyXmlAttributeName;
+ (void)delegateMap;
@end

@implementation PFAIGlossaryObject

+ (void)delegateMap
{
  result = (void *)qword_573770;
  if (!qword_573770)
  {
    objc_sync_enter(a1);
    if (!qword_573770) {
      operator new();
    }
    objc_sync_exit(a1);
    return (void *)qword_573770;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return "type";
}

@end