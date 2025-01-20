@interface PFAISearchIndexDocument
+ (BOOL)processSearchIndexWithState:(id)a3;
@end

@implementation PFAISearchIndexDocument

+ (BOOL)processSearchIndexWithState:(id)a3
{
  return +[PFAISearchIndexXmlDocument readWithState:a3];
}

@end