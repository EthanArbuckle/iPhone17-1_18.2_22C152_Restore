@interface NSIndexSet(Silex)
- (uint64_t)firstRangeAfterIndex:()Silex;
@end

@implementation NSIndexSet(Silex)

- (uint64_t)firstRangeAfterIndex:()Silex
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3010000000;
  v12 = &unk_222C045A1;
  long long v13 = xmmword_222BEF6A0;
  uint64_t v5 = [a1 lastIndex];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__NSIndexSet_Silex__firstRangeAfterIndex___block_invoke;
  v8[3] = &unk_264654040;
  v8[4] = &v9;
  objc_msgSend(a1, "enumerateRangesInRange:options:usingBlock:", a3, v5 - a3 + 1, 0, v8);
  uint64_t v6 = v10[4];
  _Block_object_dispose(&v9, 8);
  return v6;
}

@end