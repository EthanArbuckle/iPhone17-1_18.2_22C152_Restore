@interface PFAITocConfig
+ (BOOL)readWithState:(id)a3;
@end

@implementation PFAITocConfig

+ (BOOL)readWithState:(id)a3
{
  return +[PFXHtmlDocument readWithState:a3];
}

@end