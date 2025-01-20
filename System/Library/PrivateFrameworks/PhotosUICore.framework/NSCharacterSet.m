@interface NSCharacterSet
@end

@implementation NSCharacterSet

void __66__NSCharacterSet_PhotosUICore__px_breakableWhitespaceCharacterSet__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@" "];
  uint64_t v1 = [v3 copy];
  v2 = (void *)px_breakableWhitespaceCharacterSet_breakableWhitespaceCharacterSet;
  px_breakableWhitespaceCharacterSet_breakableWhitespaceCharacterSet = v1;
}

@end