@interface NSMutableString(PhotosUIFoundation)
- (BOOL)px_removePrefix:()PhotosUIFoundation;
- (BOOL)px_removeSuffix:()PhotosUIFoundation;
@end

@implementation NSMutableString(PhotosUIFoundation)

- (BOOL)px_removeSuffix:()PhotosUIFoundation
{
  uint64_t v5 = [a1 rangeOfString:a3 options:12];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(a1, "deleteCharactersInRange:", v5, v4);
  }
  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)px_removePrefix:()PhotosUIFoundation
{
  uint64_t v5 = [a1 rangeOfString:a3 options:8];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(a1, "deleteCharactersInRange:", v5, v4);
  }
  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

@end