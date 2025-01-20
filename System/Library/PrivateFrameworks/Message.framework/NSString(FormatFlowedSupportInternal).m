@interface NSString(FormatFlowedSupportInternal)
- (uint64_t)mf_lineBreakBeforeIndex:()FormatFlowedSupportInternal withinRange:;
- (uint64_t)mf_nextWordFromIndex:()FormatFlowedSupportInternal forward:;
@end

@implementation NSString(FormatFlowedSupportInternal)

- (uint64_t)mf_lineBreakBeforeIndex:()FormatFlowedSupportInternal withinRange:
{
  CFIndex v6 = [(__CFString *)a1 length] - a4;
  if (CFStringGetCharactersPtr(a1))
  {
    v7 = 0;
  }
  else
  {
    v8 = (UniChar *)malloc_type_malloc(2 * v6, 0x1000040BDFB0063uLL);
    v13.location = a4;
    v13.length = v6;
    CFStringGetCharacters(a1, v13, v8);
    v7 = v8;
  }
  _GetTextBreakLocale();
  ubrk_open();
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  int v11 = ubrk_preceding();
  if (v11 != -1 && v7 != 0) {
    uint64_t v9 = a4 + v11;
  }
  ubrk_close();
  if (v7) {
    free(v7);
  }
  return v9;
}

- (uint64_t)mf_nextWordFromIndex:()FormatFlowedSupportInternal forward:
{
  if (!a4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  CFIndex v6 = a3 + 1;
  CFIndex v7 = [(__CFString *)a1 length] - (a3 + 1);
  if (CFStringGetCharactersPtr(a1))
  {
    v8 = 0;
  }
  else
  {
    v10 = (UniChar *)malloc_type_malloc(2 * v7, 0x1000040BDFB0063uLL);
    v14.location = v6;
    v14.length = v7;
    CFStringGetCharacters(a1, v14, v10);
    v8 = v10;
  }
  _GetTextBreakLocale();
  ubrk_open();
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  int v12 = ubrk_following();
  if (v12 != -1 && v8 != 0) {
    uint64_t v9 = a3 + v12 + 2;
  }
  ubrk_close();
  if (v8) {
    free(v8);
  }
  return v9;
}

@end