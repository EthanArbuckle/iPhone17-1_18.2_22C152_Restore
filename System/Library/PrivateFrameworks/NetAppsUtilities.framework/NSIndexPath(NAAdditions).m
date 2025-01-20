@interface NSIndexPath(NAAdditions)
+ (id)na_indexPathForItem:()NAAdditions inSection:;
+ (id)na_indexPathForRow:()NAAdditions inSection:;
- (id)na_indexPathStartingAtPosition:()NAAdditions;
- (uint64_t)na_item;
- (uint64_t)na_row;
- (uint64_t)na_section;
- (void)na_each:()NAAdditions;
@end

@implementation NSIndexPath(NAAdditions)

- (id)na_indexPathStartingAtPosition:()NAAdditions
{
  unint64_t v5 = [a1 length];
  size_t v6 = v5 - a3;
  if (v5 <= a3)
  {
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"position argument is > length" userInfo:0];
    objc_exception_throw(v10);
  }
  v7 = malloc_type_calloc(8uLL, v6, 0x1BC209C3uLL);
  objc_msgSend(a1, "getIndexes:range:", v7, a3, v6);
  v8 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v7 length:v6];
  free(v7);
  return v8;
}

+ (id)na_indexPathForItem:()NAAdditions inSection:
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = a4;
  v6[1] = a3;
  v4 = [(id)objc_opt_class() indexPathWithIndexes:v6 length:2];
  return v4;
}

- (void)na_each:()NAAdditions
{
  v8 = a3;
  size_t v4 = [a1 length];
  unint64_t v5 = (uint64_t *)malloc_type_calloc(8uLL, v4, 0xDC0EA1EAuLL);
  objc_msgSend(a1, "getIndexes:range:", v5, 0, v4);
  if (v4)
  {
    size_t v6 = v5;
    do
    {
      uint64_t v7 = *v6++;
      v8[2](v8, v7);
      --v4;
    }
    while (v4);
  }
  free(v5);
}

+ (id)na_indexPathForRow:()NAAdditions inSection:
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = a4;
  v6[1] = a3;
  size_t v4 = [(id)objc_opt_class() indexPathWithIndexes:v6 length:2];
  return v4;
}

- (uint64_t)na_section
{
  return [a1 indexAtPosition:0];
}

- (uint64_t)na_row
{
  return [a1 indexAtPosition:1];
}

- (uint64_t)na_item
{
  if ((unint64_t)[a1 length] < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [a1 indexAtPosition:1];
}

@end