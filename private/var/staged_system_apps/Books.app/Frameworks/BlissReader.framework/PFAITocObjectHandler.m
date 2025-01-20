@interface PFAITocObjectHandler
+ (const)keyXmlAttributeName;
+ (void)delegateMap;
@end

@implementation PFAITocObjectHandler

+ (void)delegateMap
{
  result = (void *)qword_573730;
  if (!qword_573730)
  {
    objc_sync_enter(a1);
    if (!qword_573730) {
      operator new();
    }
    objc_sync_exit(a1);
    return (void *)qword_573730;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return "type";
}

@end