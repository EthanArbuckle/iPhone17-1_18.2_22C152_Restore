@interface NSString(HTMLStrings)
- (id)_HTMLTagNameClosing:()HTMLStrings;
- (uint64_t)_HTMLRangeOfLastTagBeforeIndex:()HTMLStrings;
- (uint64_t)ic_HTMLInsertionPoint;
@end

@implementation NSString(HTMLStrings)

- (uint64_t)ic_HTMLInsertionPoint
{
  uint64_t v2 = [a1 length];
  uint64_t v3 = objc_msgSend(a1, "_HTMLRangeOfLastTagBeforeIndex:", objc_msgSend(a1, "length"));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v3;
    v6 = objc_msgSend(a1, "substringWithRange:", v3, v4);
    char v16 = 0;
    v7 = [v6 _HTMLTagNameClosing:&v16];
    v8 = v7;
    if (v16)
    {
      if ([v7 caseInsensitiveCompare:@"html"])
      {
        uint64_t v9 = v5;
        uint64_t v5 = v2;
      }
      else
      {
        uint64_t v10 = [a1 _HTMLRangeOfLastTagBeforeIndex:v5];
        uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v12 = v10;
          v13 = objc_msgSend(a1, "substringWithRange:", v10, v11);

          uint64_t v14 = [v13 _HTMLTagNameClosing:&v16];

          v6 = v13;
          v8 = (void *)v14;
          uint64_t v9 = v12;
        }
      }
      if (v16)
      {
        if ([v8 caseInsensitiveCompare:@"body"]) {
          uint64_t v2 = v5;
        }
        else {
          uint64_t v2 = v9;
        }
      }
      else
      {
        uint64_t v2 = v5;
      }
    }
  }
  return v2;
}

- (uint64_t)_HTMLRangeOfLastTagBeforeIndex:()HTMLStrings
{
  uint64_t v5 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  v6 = (void *)[v5 mutableCopy];
  [v6 addCharactersInString:@">"];
  uint64_t v7 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v6, 4, 0, a3);
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = v7;
    uint64_t v11 = objc_msgSend(a1, "substringWithRange:", v7, v8);
    int v12 = [v11 isEqualToString:@">"];

    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v12)
    {
      uint64_t v13 = objc_msgSend(a1, "rangeOfString:options:range:", @"<", 4, 0, v10);
      if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v9 = v13;
      }
    }
  }

  return v9;
}

- (id)_HTMLTagNameClosing:()HTMLStrings
{
  uint64_t v5 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  v6 = (void *)[v5 mutableCopy];
  [v6 addCharactersInString:@"/>"];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:a1];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__NSString_HTMLStrings___HTMLTagNameClosing___block_invoke;
  aBlock[3] = &unk_2640CE3F8;
  id v8 = v7;
  id v19 = v8;
  uint64_t v9 = (void (**)(void))_Block_copy(aBlock);
  [v8 setCharactersToBeSkipped:0];
  [v8 scanUpToCharactersFromSet:v6 intoString:0];
  [v6 removeCharactersInString:@"/"];
  uint64_t v10 = v9[2](v9);
  int v11 = [v10 hasPrefix:@"/"];

  if (v11)
  {
    if (a3) {
      *a3 = 1;
    }
    [v8 scanUpToCharactersFromSet:v6 intoString:0];
  }
  else if (a3)
  {
    *a3 = 0;
  }
  int v12 = v9[2](v9);
  if (![v12 length]) {
    goto LABEL_11;
  }
  id v13 = 0;
  if (objc_msgSend(v5, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", 0)))
  {
    uint64_t v14 = [v5 invertedSet];
    id v17 = 0;
    char v15 = [v8 scanUpToCharactersFromSet:v14 intoString:&v17];
    id v13 = v17;

    if ((v15 & 1) == 0)
    {

LABEL_11:
      id v13 = 0;
    }
  }

  return v13;
}

@end