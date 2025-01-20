@interface TISupplementalLexicon(TextInputCore)
- (id)core_searchPrefixSet;
@end

@implementation TISupplementalLexicon(TextInputCore)

- (id)core_searchPrefixSet
{
  if ([a1 searchPrefixes])
  {
    v2 = objc_opt_new();
    if ([a1 searchPrefixes]) {
      [v2 appendString:@"@"];
    }
    if (([a1 searchPrefixes] & 2) != 0) {
      [v2 appendString:@"#"];
    }
    v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end