@interface NSLocale
@end

@implementation NSLocale

void __54__NSLocale_PhotosUICore__px_currentCharacterDirection__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v1 = [v0 BOOLForKey:@"NSForceRightToLeftWritingDirection"];

  if (v1)
  {
    px_currentCharacterDirection_currentDirection = 2;
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B50] mainBundle];
    v3 = [v2 preferredLocalizations];
    id v4 = [v3 firstObject];

    px_currentCharacterDirection_currentDirection = [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:v4];
  }
}

uint64_t __56__NSLocale_PhotosUICore__px_currentLeadingTextAlignment__block_invoke()
{
  uint64_t result = objc_msgSend(MEMORY[0x1E4F1CA20], "px_currentCharacterDirection");
  px_currentLeadingTextAlignment_textAlignment = 2 * (result == 2);
  return result;
}

@end