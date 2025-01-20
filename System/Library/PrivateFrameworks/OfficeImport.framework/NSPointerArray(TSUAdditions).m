@interface NSPointerArray(TSUAdditions)
- (uint64_t)tsu_enumerateNonNullPointersUsingBlock:()TSUAdditions;
- (uint64_t)tsu_indexOfPointer:()TSUAdditions;
- (uint64_t)tsu_insertRange:()TSUAdditions;
@end

@implementation NSPointerArray(TSUAdditions)

- (uint64_t)tsu_enumerateNonNullPointersUsingBlock:()TSUAdditions
{
  char v8 = 0;
  uint64_t result = [a1 count];
  if (result)
  {
    unint64_t v6 = result;
    unint64_t v7 = 1;
    do
    {
      uint64_t result = [a1 pointerAtIndex:v7 - 1];
      if (result) {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, char *))(a3 + 16))(a3, result, v7 - 1, &v8);
      }
      if (v7 >= v6) {
        break;
      }
      ++v7;
    }
    while (!v8);
  }
  return result;
}

- (uint64_t)tsu_insertRange:()TSUAdditions
{
  uint64_t result = [a1 count];
  uint64_t v8 = result - a3;
  if (a4 >= result - a3)
  {
    if (result == a3)
    {
      unint64_t v9 = [a1 count] + a4;
      return [a1 setCount:v9];
    }
    else
    {
      v10 = objc_msgSend(MEMORY[0x263F08A88], "pointerArrayWithPointerFunctions:", objc_msgSend(a1, "pointerFunctions"));
      [v10 setCount:v8];
      uint64_t v11 = 0;
      do
      {
        uint64_t v12 = [a1 pointerAtIndex:a3 + v11];
        if (v12)
        {
          [v10 replacePointerAtIndex:v11 withPointer:v12];
          [a1 replacePointerAtIndex:a3 + v11 withPointer:0];
        }
        ++v11;
      }
      while (v8 != v11);
      objc_msgSend(a1, "setCount:", objc_msgSend(a1, "count") + a4);
      uint64_t v13 = 0;
      uint64_t v14 = [a1 count] - v8;
      do
      {
        uint64_t result = [v10 pointerAtIndex:v13];
        if (result)
        {
          [a1 replacePointerAtIndex:v14 + v13 withPointer:result];
          uint64_t result = [v10 replacePointerAtIndex:v13 withPointer:0];
        }
        ++v13;
      }
      while (v8 != v13);
    }
  }
  else
  {
    for (; a4; --a4)
      uint64_t result = [a1 insertPointer:0 atIndex:a3];
  }
  return result;
}

- (uint64_t)tsu_indexOfPointer:()TSUAdditions
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__NSPointerArray_TSUAdditions__tsu_indexOfPointer___block_invoke;
  v5[3] = &unk_264D61140;
  v5[4] = &v6;
  v5[5] = a3;
  objc_msgSend(a1, "tsu_enumerateNonNullPointersUsingBlock:", v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end