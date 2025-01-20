@interface NSString(TSKSearch)
+ (uint64_t)regexStringForSearchString:()TSKSearch options:;
- (id)stringByCapitalizingToMatchString:()TSKSearch range:searchOptions:;
- (id)stringByReplacingOccurrencesOfString:()TSKSearch withString:searchOptions:range:replacementCount:;
- (uint64_t)rangeOfString:()TSKSearch searchOptions:updatingSearchRange:;
@end

@implementation NSString(TSKSearch)

+ (uint64_t)regexStringForSearchString:()TSKSearch options:
{
  v6 = (void *)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"*?+[(){}^$|\\./"];
  v7 = (void *)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"\"“”"];
  v8 = (void *)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"'‘’"];
  v9 = (void *)[MEMORY[0x263F089D8] string];
  if ([a3 length])
  {
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = [a3 characterAtIndex:v10];
      if (![v6 characterIsMember:v11]) {
        break;
      }
      objc_msgSend(v9, "appendFormat:", @"\\%C", v11);
LABEL_12:
      if (++v10 >= (unint64_t)[a3 length]) {
        goto LABEL_13;
      }
    }
    if ((a4 & 0x10) != 0)
    {
      if ([v7 characterIsMember:v11])
      {
        v12 = v9;
        v13 = @"[\"“”]";
LABEL_11:
        objc_msgSend(v12, "appendFormat:", v13, v25);
        goto LABEL_12;
      }
      if ([v8 characterIsMember:v11])
      {
        v12 = v9;
        v13 = @"['‘’]";
        goto LABEL_11;
      }
    }
    uint64_t v25 = v11;
    v12 = v9;
    v13 = @"%C";
    goto LABEL_11;
  }
  if ((a4 & 8) == 0) {
    return (uint64_t)v9;
  }
  uint64_t v14 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\b" options:0 error:0];
  if (!v14) {
    return (uint64_t)v9;
  }
LABEL_13:
  v15 = (void *)v14;
  uint64_t v16 = objc_msgSend(a3, "tsu_range");
  v18 = objc_msgSend(v15, "matchesInString:options:range:", a3, 0, v16, v17);
  if ([v18 count])
  {
    uint64_t v19 = objc_msgSend((id)objc_msgSend(v18, "objectAtIndex:", 0), "range");
    if (!(v19 | v20)) {
      v9 = (void *)[MEMORY[0x263F089D8] stringWithFormat:@"\\b%@", v9];
    }
  }
  if ([v18 count]
    && (uint64_t v21 = objc_msgSend((id)objc_msgSend(v18, "lastObject"), "range"), v23 = v22, v21 == objc_msgSend(a3, "length"))
    && !v23)
  {
    return [MEMORY[0x263F089D8] stringWithFormat:@"%@\\b", v9];
  }
  else
  {
    return (uint64_t)v9;
  }
}

- (uint64_t)rangeOfString:()TSKSearch searchOptions:updatingSearchRange:
{
  v6 = a1;
  uint64_t v7 = a4 & 1;
  if ((a4 & 4) != 0)
  {
    uint64_t v9 = v7 | 4;
  }
  else
  {
    uint64_t v8 = v7 | 0x400;
    a3 = [(id)objc_opt_class() regexStringForSearchString:a3 options:a4];
    a1 = v6;
    uint64_t v9 = v8;
  }

  return objc_msgSend(a1, "tsu_rangeOfString:options:updatingSearchRange:", a3, v9, a5);
}

- (id)stringByCapitalizingToMatchString:()TSKSearch range:searchOptions:
{
  id v11 = a1;
  unint64_t v12 = [a1 length];
  if ((a6 & 1) != 0 && v12 >= 2 && a5 >= 2)
  {
    v13 = (void *)[MEMORY[0x263F08708] lowercaseLetterCharacterSet];
    uint64_t v14 = (void *)[MEMORY[0x263F08708] uppercaseLetterCharacterSet];
    uint64_t v15 = [a1 characterAtIndex:0];
    uint64_t v16 = [a3 characterAtIndex:a4];
    if ([v13 characterIsMember:v15])
    {
      if ([v14 characterIsMember:v16])
      {
        uint64_t v17 = objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", 0, 1), "capitalizedString");
        if ([v17 length])
        {
          id v11 = (id)[a1 mutableCopy];
          objc_msgSend(v11, "replaceCharactersInRange:withString:", 0, 1, v17);
        }
      }
    }
  }
  return v11;
}

- (id)stringByReplacingOccurrencesOfString:()TSKSearch withString:searchOptions:range:replacementCount:
{
  id v13 = a1;
  id v14 = v13;
  uint64_t v24 = a6;
  uint64_t v25 = a7;
  uint64_t v15 = 0;
  if (a7)
  {
    a7 = 0;
    id v16 = v13;
    do
    {
      uint64_t v17 = [v16 rangeOfString:a3 searchOptions:a5 updatingSearchRange:&v24];
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v19 = v17;
        uint64_t v20 = v18;
        if (!a7)
        {
          id v16 = (id)[v16 mutableCopy];
          a7 = v16;
        }
        objc_msgSend(a7, "replaceCharactersInRange:withString:", v19, v20, objc_msgSend(a4, "stringByCapitalizingToMatchString:range:searchOptions:", v16, v19, v20, a5));
        ++v15;
        uint64_t v21 = [a4 length];
        v24 += v21 - v20;
      }
    }
    while (v25);
  }
  if (a8) {
    *a8 = v15;
  }
  if (a7) {
    return a7;
  }
  else {
    return v14;
  }
}

@end