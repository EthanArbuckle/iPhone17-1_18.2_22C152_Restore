@interface NSBundle(NTKAdditions)
- (uint64_t)ntk_localizedMarkdownStringForKey:()NTKAdditions value:table:;
@end

@implementation NSBundle(NTKAdditions)

- (uint64_t)ntk_localizedMarkdownStringForKey:()NTKAdditions value:table:
{
  return [a1 _localizedStringNoCacheNoMarkdownParsingForKey:a3 value:a4 table:a5 localizations:0 actualTableURL:0 formatSpecifierConfiguration:0];
}

@end