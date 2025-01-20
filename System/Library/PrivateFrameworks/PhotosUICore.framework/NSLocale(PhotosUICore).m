@interface NSLocale(PhotosUICore)
+ (uint64_t)px_currentCharacterDirection;
+ (uint64_t)px_currentLeadingTextAlignment;
@end

@implementation NSLocale(PhotosUICore)

+ (uint64_t)px_currentCharacterDirection
{
  if (px_currentCharacterDirection_onceToken != -1) {
    dispatch_once(&px_currentCharacterDirection_onceToken, &__block_literal_global_244166);
  }
  return px_currentCharacterDirection_currentDirection;
}

+ (uint64_t)px_currentLeadingTextAlignment
{
  if (px_currentLeadingTextAlignment_onceToken != -1) {
    dispatch_once(&px_currentLeadingTextAlignment_onceToken, &__block_literal_global_5_244164);
  }
  return px_currentLeadingTextAlignment_textAlignment;
}

@end