@interface NSString(TSUNSStringPathExtensions)
- (BOOL)tsu_containsSubstring:()TSUNSStringPathExtensions;
- (BOOL)tsu_isPathCreatedByAppendingPathComponent:()TSUNSStringPathExtensions insideBasePath:;
- (id)tsu_pathToRelativeComponentPath:()TSUNSStringPathExtensions;
- (uint64_t)tsu_range;
- (uint64_t)tsu_rangeOfString:()TSUNSStringPathExtensions options:updatingSearchRange:;
- (void)tsu_enumerateRangesOfCharactersInSet:()TSUNSStringPathExtensions usingBlock:;
@end

@implementation NSString(TSUNSStringPathExtensions)

- (uint64_t)tsu_rangeOfString:()TSUNSStringPathExtensions options:updatingSearchRange:
{
  if (a5)
  {
    uint64_t v9 = *a5;
    uint64_t v10 = a5[1];
    uint64_t result = objc_msgSend(a1, "rangeOfString:options:range:", a3, a4, *a5, v10);
    if (result == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_OWORD *)a5 = NSInvalidRange;
    }
    else if ((a4 & 4) != 0)
    {
      *a5 = v9;
      a5[1] = result - v9;
    }
    else
    {
      *a5 = result + v12;
      a5[1] = v10 + v9 - (result + v12);
    }
  }
  else
  {
    uint64_t v13 = [a3 length];
    return objc_msgSend(a1, "rangeOfString:options:range:", a3, a4, 0, v13);
  }
  return result;
}

- (uint64_t)tsu_range
{
  return 0;
}

- (void)tsu_enumerateRangesOfCharactersInSet:()TSUNSStringPathExtensions usingBlock:
{
  v6 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:a1];
  [v6 setCaseSensitive:1];
  [v6 setCharactersToBeSkipped:0];
  if (([v6 isAtEnd] & 1) == 0)
  {
    do
    {
      uint64_t v7 = [v6 scanLocation];
      if ([v6 scanCharactersFromSet:a3 intoString:0])
      {
        uint64_t v8 = [v6 scanLocation];
        char v9 = 0;
        (*(void (**)(uint64_t, uint64_t, uint64_t, char *))(a4 + 16))(a4, v7, v8 - v7, &v9);
        if (v9) {
          break;
        }
      }
      if (([v6 isAtEnd] & 1) == 0) {
        [v6 scanUpToCharactersFromSet:a3 intoString:0];
      }
    }
    while (![v6 isAtEnd]);
  }
}

- (BOOL)tsu_containsSubstring:()TSUNSStringPathExtensions
{
  return objc_msgSend(a1, "rangeOfString:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)tsu_pathToRelativeComponentPath:()TSUNSStringPathExtensions
{
  if (a3)
  {
    v5 = (void *)[MEMORY[0x263F08850] defaultManager];
    v6 = (void *)[a3 pathComponents];
    unint64_t v7 = [v6 count];
    id v8 = objc_alloc_init(MEMORY[0x263F086B0]);
    if (v7)
    {
      uint64_t v9 = 0;
      unint64_t v10 = v7;
      while (1)
      {
        unint64_t v11 = v10 - 1;
        if (objc_msgSend(v5, "fileExistsAtPath:", objc_msgSend(a1, "stringByAppendingPathComponent:", objc_msgSend(v6, "objectAtIndex:", v10 - 1))))
        {
          uint64_t v12 = a1;
          if (v11 < v7)
          {
            uint64_t v13 = -1;
            uint64_t v12 = a1;
            do
              uint64_t v12 = objc_msgSend(v12, "stringByAppendingPathComponent:", objc_msgSend(v6, "objectAtIndex:", v10 + v13++));
            while (v9 != v13);
          }
          if ([v5 fileExistsAtPath:v12]) {
            break;
          }
        }
        ++v9;
        --v10;
        if (!v11) {
          goto LABEL_10;
        }
      }
      id v14 = v12;
    }
    else
    {
LABEL_10:
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }
  return v14;
}

- (BOOL)tsu_isPathCreatedByAppendingPathComponent:()TSUNSStringPathExtensions insideBasePath:
{
  id v7 = objc_alloc_init(MEMORY[0x263F086B0]);
  id v8 = (void *)[a1 stringByStandardizingPath];
  uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "stringByAppendingPathComponent:", a3), "stringByStandardizingPath"), "pathComponents");
  if (a1 != a4) {
    id v8 = (void *)[a4 stringByStandardizingPath];
  }
  unint64_t v10 = (void *)[v8 pathComponents];
  unint64_t v11 = [v9 count];
  unint64_t v12 = [v10 count];
  if (v12 <= v11)
  {
    uint64_t v14 = 0;
    unint64_t v15 = v12;
    if (v12)
    {
      unsigned int v16 = 1;
      do
      {
        if ((objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v14), "isEqualToString:", objc_msgSend(v9, "objectAtIndex:", v14)) & 1) == 0)break; {
        uint64_t v14 = v16;
        }
      }
      while (v15 > v16++);
    }
    BOOL v13 = v15 == v14;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

@end