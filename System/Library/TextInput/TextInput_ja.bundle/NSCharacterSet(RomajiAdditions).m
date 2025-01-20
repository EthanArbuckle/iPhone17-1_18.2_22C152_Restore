@interface NSCharacterSet(RomajiAdditions)
+ (id)alphabetCharacterSet;
@end

@implementation NSCharacterSet(RomajiAdditions)

+ (id)alphabetCharacterSet
{
  if (alphabetCharacterSet___onceToken != -1) {
    dispatch_once(&alphabetCharacterSet___onceToken, &__block_literal_global);
  }
  v0 = (void *)alphabetCharacterSet___alphabetCharacterSet;
  return v0;
}

@end