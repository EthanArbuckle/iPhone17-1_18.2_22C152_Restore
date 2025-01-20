@interface NSCharacterSet(Latex)
+ (id)charactersRequiringExtentionCharacterSet;
@end

@implementation NSCharacterSet(Latex)

+ (id)charactersRequiringExtentionCharacterSet
{
  if (charactersRequiringExtentionCharacterSet_onceToken != -1) {
    dispatch_once(&charactersRequiringExtentionCharacterSet_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)charactersRequiringExtentionCharacterSet_charSet;
  return v0;
}

@end