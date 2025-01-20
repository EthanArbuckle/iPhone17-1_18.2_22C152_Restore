@interface NSString
@end

@implementation NSString

uint64_t __39__NSString_QueryParser__composedLength__block_invoke(uint64_t result)
{
  return result;
}

uint64_t __38__NSString_MatchScore__composedLength__block_invoke(uint64_t result)
{
  return result;
}

uint64_t __35__NSString_MatchScore__containsCJK__block_invoke()
{
  containsCJK_sRegex = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(\\p{script=Han})|(\\p{script=Hangul})" options:1 error:0];
  return MEMORY[0x1F41817F8]();
}

void __57__NSString_ParsecExtras__prs_normalizedParsecInputString__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([a2 characterIsMember:*(unsigned __int16 *)(a1 + 48)])
  {
    [*(id *)(a1 + 32) appendString:v7];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

@end