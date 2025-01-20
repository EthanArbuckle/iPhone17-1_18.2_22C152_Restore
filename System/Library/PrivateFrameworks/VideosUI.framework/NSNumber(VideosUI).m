@interface NSNumber(VideosUI)
- (id)vui_languageAwareDescription;
@end

@implementation NSNumber(VideosUI)

- (id)vui_languageAwareDescription
{
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  v3 = [a1 descriptionWithLocale:v2];
  v4 = (void *)MEMORY[0x1E4F1CA20];
  v5 = [v2 languageCode];
  uint64_t v6 = [v4 characterDirectionForLanguage:v5];

  if (v6 == 2) {
    v7 = @"\u200F";
  }
  else {
    v7 = @"\u200E";
  }
  v8 = [v3 stringByAppendingString:v7];

  return v8;
}

@end