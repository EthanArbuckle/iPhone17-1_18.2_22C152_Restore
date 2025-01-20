@interface PFAIDiv
+ (Class)blockClass;
+ (void)delegateMap;
@end

@implementation PFAIDiv

+ (void)delegateMap
{
  result = (void *)qword_573738;
  if (!qword_573738)
  {
    objc_sync_enter(a1);
    if (!qword_573738) {
      operator new();
    }
    objc_sync_exit(a1);
    return (void *)qword_573738;
  }
  return result;
}

+ (Class)blockClass
{
  return (Class)objc_opt_class();
}

@end