@interface NSString
@end

@implementation NSString

void __70__NSString_TRI__triSanitizedPathComponentWithMaxLength_addHash_error___block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.-_"];
  uint64_t v2 = [v1 invertedSet];
  v3 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v2;
}

@end