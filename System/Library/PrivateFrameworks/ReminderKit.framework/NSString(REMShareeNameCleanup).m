@interface NSString(REMShareeNameCleanup)
- (id)rem_tidyFormattedNameString;
@end

@implementation NSString(REMShareeNameCleanup)

- (id)rem_tidyFormattedNameString
{
  v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];

  if ([v3 length]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

@end