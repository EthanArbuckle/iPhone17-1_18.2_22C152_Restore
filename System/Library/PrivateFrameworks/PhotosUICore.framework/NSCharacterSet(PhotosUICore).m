@interface NSCharacterSet(PhotosUICore)
+ (id)px_breakableWhitespaceCharacterSet;
@end

@implementation NSCharacterSet(PhotosUICore)

+ (id)px_breakableWhitespaceCharacterSet
{
  if (px_breakableWhitespaceCharacterSet_onceToken != -1) {
    dispatch_once(&px_breakableWhitespaceCharacterSet_onceToken, &__block_literal_global_120713);
  }
  v0 = (void *)px_breakableWhitespaceCharacterSet_breakableWhitespaceCharacterSet;
  return v0;
}

@end