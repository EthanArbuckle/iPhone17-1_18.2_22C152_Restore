@interface PFAISearchRefTextDocument
+ (BOOL)processSearchRefTextWithState:(id)a3;
@end

@implementation PFAISearchRefTextDocument

+ (BOOL)processSearchRefTextWithState:(id)a3
{
  return +[PFAISearchRefTextXmlDocument readWithState:a3];
}

@end