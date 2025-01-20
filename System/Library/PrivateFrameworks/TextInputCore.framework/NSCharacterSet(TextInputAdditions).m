@interface NSCharacterSet(TextInputAdditions)
+ (id)pinyinInputCharacterSet;
+ (id)punctuationAndWhitespaceCharacterSet;
@end

@implementation NSCharacterSet(TextInputAdditions)

+ (id)pinyinInputCharacterSet
{
  if (pinyinInputCharacterSet___onceToken != -1) {
    dispatch_once(&pinyinInputCharacterSet___onceToken, &__block_literal_global_2);
  }
  v0 = (void *)pinyinInputCharacterSet___pinyinCharset;

  return v0;
}

+ (id)punctuationAndWhitespaceCharacterSet
{
  if (punctuationAndWhitespaceCharacterSet___onceToken != -1) {
    dispatch_once(&punctuationAndWhitespaceCharacterSet___onceToken, &__block_literal_global_17405);
  }
  v0 = (void *)punctuationAndWhitespaceCharacterSet___punctuationAndWhitespaceCharacterSet;

  return v0;
}

@end