@interface NSCharacterSet(ZhuyinAddition)
+ (id)punctuationAndSymbolCharacterSet;
+ (id)zhuyinCharacterSet;
+ (id)zhuyinConsonantCharacterSet;
+ (id)zhuyinMedialCharacterSet;
+ (id)zhuyinPhonemeCharacterSet;
+ (id)zhuyinToneCharacterSet;
+ (id)zhuyinVowelCharacterSet;
@end

@implementation NSCharacterSet(ZhuyinAddition)

+ (id)zhuyinConsonantCharacterSet
{
  if (zhuyinConsonantCharacterSet___onceToken != -1) {
    dispatch_once(&zhuyinConsonantCharacterSet___onceToken, &__block_literal_global_0);
  }
  v0 = (void *)zhuyinConsonantCharacterSet___zhuyinConsonantCharacterSet;
  return v0;
}

+ (id)zhuyinMedialCharacterSet
{
  if (zhuyinMedialCharacterSet___onceToken != -1) {
    dispatch_once(&zhuyinMedialCharacterSet___onceToken, &__block_literal_global_3);
  }
  v0 = (void *)zhuyinMedialCharacterSet___zhuyinMedialCharacterSet;
  return v0;
}

+ (id)zhuyinVowelCharacterSet
{
  if (zhuyinVowelCharacterSet___onceToken != -1) {
    dispatch_once(&zhuyinVowelCharacterSet___onceToken, &__block_literal_global_8);
  }
  v0 = (void *)zhuyinVowelCharacterSet___zhuyinVowelCharacterSet;
  return v0;
}

+ (id)zhuyinPhonemeCharacterSet
{
  if (zhuyinPhonemeCharacterSet___onceToken != -1) {
    dispatch_once(&zhuyinPhonemeCharacterSet___onceToken, &__block_literal_global_13);
  }
  v0 = (void *)zhuyinPhonemeCharacterSet___zhuyinPhonemeCharacterSet;
  return v0;
}

+ (id)zhuyinToneCharacterSet
{
  if (zhuyinToneCharacterSet___onceToken != -1) {
    dispatch_once(&zhuyinToneCharacterSet___onceToken, &__block_literal_global_18);
  }
  v0 = (void *)zhuyinToneCharacterSet___zhuyinToneCharacterSet;
  return v0;
}

+ (id)zhuyinCharacterSet
{
  if (zhuyinCharacterSet___onceToken != -1) {
    dispatch_once(&zhuyinCharacterSet___onceToken, &__block_literal_global_23);
  }
  v0 = (void *)zhuyinCharacterSet___zhuyinCharacterSet;
  return v0;
}

+ (id)punctuationAndSymbolCharacterSet
{
  if (punctuationAndSymbolCharacterSet___onceToken != -1) {
    dispatch_once(&punctuationAndSymbolCharacterSet___onceToken, &__block_literal_global_28);
  }
  v0 = (void *)punctuationAndSymbolCharacterSet___punctuationAndSymbolCharacterSet;
  return v0;
}

@end