@interface PFEIContentDocument
+ (BOOL)readWithState:(id)a3;
@end

@implementation PFEIContentDocument

+ (BOOL)readWithState:(id)a3
{
  return +[PFXHtmlDocument readWithState:a3];
}

@end