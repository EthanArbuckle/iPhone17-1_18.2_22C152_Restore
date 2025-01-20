@interface NSString(TSDAdditions)
- (uint64_t)tsdWordCount;
- (unint64_t)endingCharIndexForWordLimit:()TSDAdditions;
@end

@implementation NSString(TSDAdditions)

- (uint64_t)tsdWordCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v2 = [a1 length];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__NSString_TSDAdditions__tsdWordCount__block_invoke;
  v5[3] = &unk_2646B1B80;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 3, v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)endingCharIndexForWordLimit:()TSDAdditions
{
  v13[1] = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  unint64_t v6 = [a1 length];
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v13 - v7;
  objc_msgSend(a1, "getCharacters:range:", (char *)v13 - v7, 0, v6);
  if (!v6) {
    return 0;
  }
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  do
    v10 += [v5 characterIsMember:*(unsigned __int16 *)&v8[2 * v9++]];
  while (v10 < a3 && v9 < v6);
  return v9 - 1;
}

@end