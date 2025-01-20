@interface MDCopyTokensFromString
@end

@implementation MDCopyTokensFromString

uint64_t ____MDCopyTokensFromString_block_invoke()
{
  uint64_t result = _CFBundleGetBundleWithIdentifierAndLibraryName();
  if (result)
  {
    uint64_t v1 = result;
    _locAndToken = (uint64_t)copyNonDefaultLocalizedString(result, @"SEARCH_SYNTAX_AND", @"AND");
    _locOrToken = (uint64_t)copyNonDefaultLocalizedString(v1, @"SEARCH_SYNTAX_OR", @"OR");
    uint64_t result = (uint64_t)copyNonDefaultLocalizedString(v1, @"SEARCH_SYNTAX_NOT", @"NOT");
    _locNotToken = result;
  }
  return result;
}

@end