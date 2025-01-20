@interface PHACoreDuetHelper
+ (id)CoreDuetEventQuery;
+ (id)KnowledgeStore;
@end

@implementation PHACoreDuetHelper

+ (id)KnowledgeStore
{
  return (id)[MEMORY[0x1E4F5B560] knowledgeStoreWithDirectReadOnlyAccess];
}

+ (id)CoreDuetEventQuery
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F5B518]);

  return v2;
}

@end