@interface NSIndexPath(SCRCIndexPathExtras)
- (id)indexPathByConcatenatingIndexPath:()SCRCIndexPathExtras;
- (id)indexPathByInsertingFirstIndex:()SCRCIndexPathExtras;
- (id)stringValue;
- (uint64_t)initWithString:()SCRCIndexPathExtras;
@end

@implementation NSIndexPath(SCRCIndexPathExtras)

- (uint64_t)initWithString:()SCRCIndexPathExtras
{
  v4 = [a3 stringByReplacingOccurrencesOfString:@"[" withString:&stru_26CC25790];
  v5 = [v4 stringByReplacingOccurrencesOfString:@"]" withString:&stru_26CC25790];

  v6 = [v5 componentsSeparatedByString:@"."];
  uint64_t v7 = [v6 count];
  v8 = malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      v10 = [v6 objectAtIndex:i];
      v8[i] = [v10 integerValue];
    }
  }
  uint64_t v11 = [a1 initWithIndexes:v8 length:v7];
  free(v8);

  return v11;
}

- (id)stringValue
{
  v2 = [MEMORY[0x263F089D8] stringWithString:@"["];
  uint64_t v3 = [a1 length];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v6 = [a1 indexAtPosition:i];
      if ([v2 length] == 1) {
        uint64_t v7 = @"%i";
      }
      else {
        uint64_t v7 = @".%i";
      }
      objc_msgSend(v2, "appendFormat:", v7, v6);
    }
  }
  [v2 appendString:@"]"];
  return v2;
}

- (id)indexPathByInsertingFirstIndex:()SCRCIndexPathExtras
{
  v2 = objc_msgSend(MEMORY[0x263F088C8], "indexPathWithIndex:");
  uint64_t v3 = [v2 indexPathByConcatenatingIndexPath:a1];

  return v3;
}

- (id)indexPathByConcatenatingIndexPath:()SCRCIndexPathExtras
{
  id v4 = a3;
  if ([v4 length])
  {
    if ([a1 length])
    {
      uint64_t v5 = [v4 length];
      uint64_t v6 = [a1 length];
      size_t v7 = 8 * v5;
      v8 = malloc_type_malloc(8 * v5, 0x100004000313F17uLL);
      [v4 getIndexes:v8];
      v9 = malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
      [a1 getIndexes:v9];
      uint64_t v10 = v6 + v5;
      uint64_t v11 = (char *)malloc_type_malloc(8 * (v6 + v5), 0x100004000313F17uLL);
      memcpy(v11, v9, 8 * v6);
      memcpy(&v11[8 * v6], v8, v7);
      v12 = (void *)[objc_alloc(MEMORY[0x263F088C8]) initWithIndexes:v11 length:v10];
      free(v8);
      free(v9);
      free(v11);
      goto LABEL_7;
    }
    id v13 = v4;
  }
  else
  {
    id v13 = a1;
  }
  v12 = v13;
LABEL_7:

  return v12;
}

@end