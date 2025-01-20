@interface NSArray(PhotosUIFoundation)
+ (id)px_numbersFrom:()PhotosUIFoundation to:increment:;
+ (uint64_t)px_integersFrom:()PhotosUIFoundation to:;
- (id)px_objectAfterObject:()PhotosUIFoundation;
- (id)px_subarrayAfterIndex:()PhotosUIFoundation;
- (void)px_enumerateObjectsFromIndex:()PhotosUIFoundation usingBlock:;
@end

@implementation NSArray(PhotosUIFoundation)

- (id)px_objectAfterObject:()PhotosUIFoundation
{
  uint64_t v2 = objc_msgSend(a1, "indexOfObject:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v3 = v2 + 1, v2 + 1 >= (unint64_t)[a1 count]))
  {
    v4 = 0;
  }
  else
  {
    v4 = [a1 objectAtIndexedSubscript:v3];
  }

  return v4;
}

- (void)px_enumerateObjectsFromIndex:()PhotosUIFoundation usingBlock:
{
  v6 = a4;
  char v11 = 0;
  uint64_t v7 = [a1 count];
  if (v7)
  {
    unint64_t v8 = v7;
    unint64_t v9 = 1;
    do
    {
      if (a3 >= v8) {
        a3 = 0;
      }
      v10 = [a1 objectAtIndex:a3];
      v6[2](v6, v10, a3, &v11);

      if (v9 >= v8) {
        break;
      }
      ++a3;
      ++v9;
    }
    while (!v11);
  }
}

- (id)px_subarrayAfterIndex:()PhotosUIFoundation
{
  uint64_t v4 = a3 + 1;
  if (a3 + 1 >= (unint64_t)[a1 count])
  {
    v5 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v5 = objc_msgSend(a1, "subarrayWithRange:", v4, objc_msgSend(a1, "count") - v4);
  }

  return v5;
}

+ (uint64_t)px_integersFrom:()PhotosUIFoundation to:
{
  return objc_msgSend(a1, "px_numbersFrom:to:increment:", (double)a3, (double)a4, 1.0);
}

+ (id)px_numbersFrom:()PhotosUIFoundation to:increment:
{
  for (id i = objc_alloc_init(MEMORY[0x263EFF980]); a1 <= a2; a1 = round((a1 + a3) / a3) * a3)
  {
    uint64_t v7 = [NSNumber numberWithDouble:a1];
    [i addObject:v7];
  }

  return i;
}

@end