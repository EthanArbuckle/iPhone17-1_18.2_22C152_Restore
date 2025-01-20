@interface NSString(Grapheme)
- (id)graphemeArray;
- (id)graphemeAtIndex:()Grapheme;
- (id)splitGraphemeIntoCharacterArray;
- (uint64_t)graphemeCount;
@end

@implementation NSString(Grapheme)

- (uint64_t)graphemeCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v2 = [a1 length];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__NSString_Grapheme__graphemeCount__block_invoke;
  v5[3] = &unk_265559950;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 514, v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)graphemeAtIndex:()Grapheme
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  uint64_t v5 = [a1 length];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__NSString_Grapheme__graphemeAtIndex___block_invoke;
  v8[3] = &unk_265559978;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = v15;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v8);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(v15, 8);
  return v6;
}

- (id)splitGraphemeIntoCharacterArray
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "length"));
  if ([a1 length])
  {
    unint64_t v3 = 0;
    do
    {
      unsigned int v4 = [a1 characterAtIndex:v3];
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v4);
      [v2 addObject:v5];

      ++v3;
    }
    while (v3 < [a1 length]);
  }
  return v2;
}

- (id)graphemeArray
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "graphemeCount"));
  uint64_t v3 = [a1 length];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__NSString_Grapheme__graphemeArray__block_invoke;
  v6[3] = &unk_2655599A0;
  id v4 = v2;
  id v7 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 2, v6);

  return v4;
}

@end