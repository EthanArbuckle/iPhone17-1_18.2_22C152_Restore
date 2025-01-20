@interface NSString(UIWebViewAdditions)
- (id)_uikit_stringByRemovingFirstMatchFromPrefixes:()UIWebViewAdditions;
- (id)_uikit_stringByTrimmingWhitespaceAndNewlines;
- (id)_uikit_stringWithWritingDirection:()UIWebViewAdditions asOverride:;
@end

@implementation NSString(UIWebViewAdditions)

- (id)_uikit_stringByTrimmingWhitespaceAndNewlines
{
  uint64_t v2 = [a1 length];
  if (!v2) {
    goto LABEL_11;
  }
  uint64_t v3 = v2;
  uint64_t v4 = v2 + 1;
  do
  {
    uint64_t v5 = v4 - 1;
    if (v4 == 1)
    {
      uint64_t v7 = 0;
      goto LABEL_10;
    }
    [a1 characterAtIndex:v4 - 2];
    char IsMemberOf = CFUniCharIsMemberOf();
    uint64_t v4 = v5;
  }
  while ((IsMemberOf & 1) != 0);
  uint64_t v7 = 0;
  do
  {
    [a1 characterAtIndex:v7];
    if (!CFUniCharIsMemberOf()) {
      break;
    }
    ++v7;
    --v5;
  }
  while (v5);
LABEL_10:
  if (v3 != v5)
  {
    objc_msgSend(a1, "substringWithRange:", v7, v5);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    id v8 = a1;
  }
  return v8;
}

- (id)_uikit_stringWithWritingDirection:()UIWebViewAdditions asOverride:
{
  uint64_t v7 = [a1 length];
  if (a3 != -1 && v7)
  {
    if (a4)
    {
      LODWORD(v8) = 8237;
      unsigned int v9 = 8238;
LABEL_5:
      if (a3) {
        uint64_t v8 = v9;
      }
      else {
        uint64_t v8 = v8;
      }
      id v10 = [NSString stringWithFormat:@"%C%@%C", v8, a1, 8236];
      goto LABEL_14;
    }
    int v11 = MEMORY[0x18C1094E0]([a1 characterAtIndex:0]);
    if (a3 || v11)
    {
      LODWORD(v8) = 8234;
      unsigned int v9 = 8235;
      if (a3 != 1 || v11 != 1) {
        goto LABEL_5;
      }
    }
  }
  id v10 = a1;
LABEL_14:
  return v10;
}

- (id)_uikit_stringByRemovingFirstMatchFromPrefixes:()UIWebViewAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 length])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(a1, "hasPrefix:", v10, (void)v13))
          {
            objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v10, "length"));
            id v11 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  id v11 = a1;
LABEL_13:

  return v11;
}

@end