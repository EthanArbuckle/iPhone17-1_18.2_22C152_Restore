@interface NSIndexSet(Additions)
- (__CFString)mf_commaSeparatedString;
@end

@implementation NSIndexSet(Additions)

- (__CFString)mf_commaSeparatedString
{
  if (![a1 count]) {
    return &stru_1F265CF90;
  }
  uint64_t v2 = [a1 firstIndex];
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%lu", v2);
  uint64_t v4 = [a1 indexGreaterThanIndex:v2];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v4; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [a1 indexGreaterThanIndex:i])
      objc_msgSend(v3, "appendFormat:", @",%lu", i);
  }
  return (__CFString *)v3;
}

@end