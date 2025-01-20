@interface NSCharacterSet(LanguageIdentificationAdditions)
+ (id)vietnameseCharacterSet;
@end

@implementation NSCharacterSet(LanguageIdentificationAdditions)

+ (id)vietnameseCharacterSet
{
  if (vietnameseCharacterSet___onceToken != -1) {
    dispatch_once(&vietnameseCharacterSet___onceToken, &__block_literal_global_48);
  }
  v0 = (void *)vietnameseCharacterSet___vietnameseCharset;
  return v0;
}

@end