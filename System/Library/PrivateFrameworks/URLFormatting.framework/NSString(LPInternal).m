@interface NSString(LPInternal)
+ (void)_lp_reverseEnumerateComponents:()LPInternal usingBlock:;
- (BOOL)_lp_hasCaseInsensitiveSubstring:()LPInternal startingAt:;
- (id)_lp_highLevelDomainFromComponents:()LPInternal indexOfFirstHighLevelDomainComponent:indexOfFirstTopLevelDomainComponent:;
- (id)_lp_simplifiedUserVisibleURLStringWithSimplifications:()LPInternal forDisplayOnly:;
- (uint64_t)_lp_lengthOfDeepSubdomainsFromComponents:()LPInternal;
@end

@implementation NSString(LPInternal)

- (id)_lp_highLevelDomainFromComponents:()LPInternal indexOfFirstHighLevelDomainComponent:indexOfFirstTopLevelDomainComponent:
{
  id v8 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v9 = [v8 count];
  v10 = objc_opt_class();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __131__NSString_LPInternal___lp_highLevelDomainFromComponents_indexOfFirstHighLevelDomainComponent_indexOfFirstTopLevelDomainComponent___block_invoke;
  v14[3] = &unk_2641960A8;
  v14[6] = a4;
  v14[7] = v9;
  v14[8] = a5;
  v14[4] = &v15;
  v14[5] = &v21;
  objc_msgSend(v10, "_lp_reverseEnumerateComponents:usingBlock:", v8, v14);
  if (*((unsigned char *)v22 + 24))
  {
    uint64_t v11 = [(id)v16[5] length];
    if (v11 != [a1 length]) {
      a1 = (void *)v16[5];
    }
    id v12 = a1;
  }
  else
  {
    id v12 = 0;
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

+ (void)_lp_reverseEnumerateComponents:()LPInternal usingBlock:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = a4;
  char v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v14 = v5;
  v7 = [v5 reverseObjectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = 0;
    v10 = 0;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
      if (v10)
      {
        [v10 insertString:@"." atIndex:0];
      }
      else
      {
        v10 = [MEMORY[0x263F089D8] stringWithCapacity:16];
      }
      [v10 insertString:v13 atIndex:0];
      v6[2](v6, v10, v9 + v12, &v19);
      if (v19) {
        break;
      }
      if (v8 == ++v12)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
        v9 += v12;
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    v10 = 0;
  }
}

- (BOOL)_lp_hasCaseInsensitiveSubstring:()LPInternal startingAt:
{
  id v6 = a3;
  if (v6) {
    BOOL v7 = objc_msgSend(a1, "rangeOfString:options:range:", v6, 9, a4, objc_msgSend(a1, "length") - a4) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (uint64_t)_lp_lengthOfDeepSubdomainsFromComponents:()LPInternal
{
  id v4 = a3;
  unint64_t v12 = 0;
  id v5 = objc_msgSend(a1, "_lp_highLevelDomainFromComponents:indexOfFirstHighLevelDomainComponent:indexOfFirstTopLevelDomainComponent:", v4, &v12, 0);

  uint64_t v6 = 0;
  if (v5 && v12 >= 2)
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    unsigned int v8 = 1;
    do
    {
      uint64_t v9 = [v4 objectAtIndexedSubscript:v7];
      v6 += [v9 length] + 1;

      uint64_t v7 = v8;
    }
    while (v12 - 1 > v8++);
  }

  return v6;
}

- (id)_lp_simplifiedUserVisibleURLStringWithSimplifications:()LPInternal forDisplayOnly:
{
  id v5 = a1;
  id v6 = (id)[v5 copy];
  uint64_t v8 = [v6 rangeOfString:@"://" options:2];
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
  uint64_t v10 = v7;
  {
    v53 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-."];
    hostAndPortRangeFromUserTypedString(NSString *)::nonSchemeCharacters = [v53 invertedSet];
  }
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", hostAndPortRangeFromUserTypedString(NSString *)::nonSchemeCharacters, 2, 0, v8) != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_12:
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v11 = [v6 length];
    {
      uint64_t v12 = hostAndPortRangeFromUserTypedString(NSString *)::hostTerminators;
    }
    else
    {
      uint64_t v12 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"/?#"];
      hostAndPortRangeFromUserTypedString(NSString *)::hostTerminators = v12;
    }
    uint64_t v9 = v8 + v10;
    uint64_t v13 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v12, 2, v8 + v10, v11 - (v8 + v10));
    if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v11 = v13;
    }
    uint64_t v14 = objc_msgSend(v6, "rangeOfString:options:range:", @"@", 6, v8 + v10, v11 - v9);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = v14 + v15;
    }
    uint64_t v16 = v11 - v9;
  }

  int v17 = objc_msgSend(v6, "_lp_hasCaseInsensitivePrefix:", @"http://");
  int v19 = objc_msgSend(v6, "_lp_hasCaseInsensitivePrefix:", @"https://");
  int v20 = v17 | v19;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((v20 & (a3 >> 5)) == 1)
    {
      uint64_t v21 = objc_msgSend(v5, "rangeOfString:options:range:", @":", 4, v9, v16);
      uint64_t v22 = v21;
      if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v23 = v9 + v16 - v21;
        if (objc_msgSend(v5, "rangeOfString:options:range:", @"]", 0, v21, v23) == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v24 = objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", v22, v9 + v16 - v22, &stru_26C3C6F50);

          v16 -= v23;
          id v6 = (id)v24;
        }
      }
    }
    if ((v20 & (a3 >> 4)) == 1)
    {
      uint64_t v25 = [v6 substringToIndex:v16 + v9];

      id v6 = (id)v25;
    }
    if ((a3 & 0x400) != 0)
    {
      uint64_t v18 = [v6 rangeOfString:@"#"];
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v26 = [v6 substringToIndex:v18];

        id v6 = (id)v26;
      }
    }
    if ((a3 & 4) != 0)
    {
      id v54 = v5;
      uint64_t v27 = [v6 rangeOfString:@"#"];
      if (v27 == [v6 length] - 1)
      {
        uint64_t v28 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);

        id v6 = (id)v28;
      }
      id v6 = v6;
      uint64_t v29 = [v6 rangeOfString:@"#"];
      v30 = v6;
      if (v29 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v31 = [v6 substringToIndex:v29];

        v30 = (void *)v31;
      }
      if ([v30 hasSuffix:@"?"])
      {
        uint64_t v32 = objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v30, "length") - 1, 1, &stru_26C3C6F50);

        id v6 = (id)v32;
      }
      v33 = [v6 substringFromIndex:v16 + v9];
      if (([v33 hasPrefix:@"/#"] & 1) != 0
        || ([v33 hasPrefix:@"/?"] & 1) != 0
        || [v33 isEqualToString:@"/"])
      {
        uint64_t v34 = objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", v16 + v9, 1, &stru_26C3C6F50);

        id v6 = (id)v34;
      }

      id v5 = v54;
    }
  }
  if ((a3 & v17) == 1)
  {
    if (((v9 != 0x7FFFFFFFFFFFFFFFLL) & (a3 >> 7) & v20) != 0) {
      uint64_t v35 = v9;
    }
    else {
      uint64_t v35 = 7;
    }
  }
  else
  {
    int v40 = 8;
    if (!v19) {
      int v40 = 0;
    }
    uint64_t v41 = (4 * a3) & v40;
    int v42 = v19 ^ 1;
    if ((a3 & 2) == 0) {
      int v42 = 1;
    }
    int v43 = (v9 != 0x7FFFFFFFFFFFFFFFLL) & (a3 >> 7) & v20;
    if (v43) {
      uint64_t v35 = v9;
    }
    else {
      uint64_t v35 = v41;
    }
    if (v43 == 1 && v42)
    {
      uint64_t v44 = [v6 rangeOfString:@"://"];
      uint64_t v18 = v44 + v45;
      if (v9 == v44 + v45)
      {
        uint64_t v35 = 0;
      }
      else
      {
        uint64_t v48 = objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", v18, v9 - (v44 + v45), &stru_26C3C6F50);

        uint64_t v35 = 0;
        id v6 = (id)v48;
      }
    }
  }
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    int v36 = 0;
  }
  else {
    int v36 = v20;
  }
  if ((a3 & 0x348) != 0 && v36)
  {
    v37 = objc_msgSend(v6, "substringWithRange:", v9, v16);
    v38 = [v37 componentsSeparatedByString:@"."];
    if ((a3 & 0x100) != 0)
    {
      uint64_t v39 = objc_msgSend(v37, "_lp_lengthOfDeepSubdomainsFromComponents:", v38);
      if ((a3 & 8) == 0) {
        goto LABEL_61;
      }
    }
    else
    {
      uint64_t v39 = 0;
      if ((a3 & 8) == 0) {
        goto LABEL_61;
      }
    }
    if (objc_msgSend(v37, "_lp_hasCaseInsensitiveSubstring:startingAt:", @"www.", v39))
    {
      v39 += 4;
LABEL_67:
      if (v39)
      {
        v46 = objc_msgSend(v37, "_lp_highLevelDomainFromHost");
        char v47 = [v37 isEqualToString:v46];

        if ((v47 & 1) == 0)
        {
          if (v35 && v9 == v35)
          {
            uint64_t v35 = v39 + v9;
          }
          else
          {
            uint64_t v49 = objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", v9, v39, &stru_26C3C6F50);

            id v6 = (id)v49;
          }
        }
      }

      goto LABEL_75;
    }
LABEL_61:
    if ((a3 & 0x40) != 0
      && objc_msgSend(v37, "_lp_hasCaseInsensitiveSubstring:startingAt:", @"m.", v39))
    {
      v39 += 2;
    }
    else if ((a3 & 0x200) != 0 {
           && objc_msgSend(v37, "_lp_hasCaseInsensitiveSubstring:startingAt:", @"mobile.", v39))
    }
    {
      v39 += 7;
    }
    goto LABEL_67;
  }
LABEL_75:
  if (v35)
  {
    uint64_t v50 = [v6 substringFromIndex:v35];

    id v6 = (id)v50;
  }
  if (a4)
  {
    uint64_t v51 = objc_msgSend(v6, "_lp_stringForcingLeftToRightDirection", v18);

    id v6 = (id)v51;
  }

  return v6;
}

@end