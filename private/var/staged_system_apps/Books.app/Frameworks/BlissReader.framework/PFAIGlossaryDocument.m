@interface PFAIGlossaryDocument
+ (BOOL)readWithState:(id)a3;
@end

@implementation PFAIGlossaryDocument

+ (BOOL)readWithState:(id)a3
{
  return +[PFXHtmlDocument readWithState:a3];
}

@end