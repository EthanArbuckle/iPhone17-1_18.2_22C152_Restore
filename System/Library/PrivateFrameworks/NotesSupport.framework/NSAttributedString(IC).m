@interface NSAttributedString(IC)
+ (id)ic_emptyAttributedString;
- (id)ic_attributedStringByAppendingAttributedString:()IC;
- (id)ic_attributedStringByAppendingString:()IC;
- (id)ic_attributedStringByPrependingAttributedString:()IC;
- (id)ic_attributedStringByPrependingString:()IC;
- (id)ic_attributedStringByRemovingAllAttributesExcept:()IC;
- (id)ic_attributedStringByReplacingCharactersInSet:()IC withString:;
- (id)ic_attributedStringByReplacingNewlineCharactersWithWhiteSpace;
- (id)ic_attributedStringByTrimmingCharactersInSet:()IC;
- (id)ic_attributedStringWithOnlyAdaptiveImageAttributeIfNecessary;
- (id)ic_attributedSubstringFromRange:()IC;
- (id)ic_componentRangesSeparatedByPredicate:()IC inRange:;
- (uint64_t)ic_containsAttribute:()IC inRange:;
- (uint64_t)ic_enclosingRangeContainingCharactersInSet:()IC forRange:;
- (uint64_t)ic_range;
- (uint64_t)ic_rangeByTrimmingCharactersInSet:()IC inRange:;
- (uint64_t)ic_whitespaceAndNewlineCoalescedAttributedString;
- (void)ic_enumerateAttributesInClampedRange:()IC options:usingBlock:;
- (void)ic_enumerateClampedAttribute:()IC inRange:options:usingBlock:;
- (void)ic_enumerateUnclampedAttribute:()IC inRange:options:usingBlock:;
@end

@implementation NSAttributedString(IC)

- (uint64_t)ic_enclosingRangeContainingCharactersInSet:()IC forRange:
{
  id v8 = a3;
  v9 = [a1 string];
  uint64_t v10 = a4 + a5;
  while (1)
  {
    uint64_t v11 = a4;
    if (!a4) {
      break;
    }
    uint64_t v12 = a5;
    --a4;
    if (v11 - 1 < (unint64_t)[v9 length])
    {
      ++a5;
      if (objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v11 - 1))) {
        continue;
      }
    }
    goto LABEL_7;
  }
  uint64_t v12 = v10;
  do
  {
LABEL_7:
    if (v11 + v12 >= (unint64_t)[v9 length]) {
      break;
    }
    ++v12;
  }
  while ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:")) & 1) != 0);

  return v11;
}

- (void)ic_enumerateClampedAttribute:()IC inRange:options:usingBlock:
{
  id v12 = a3;
  id v13 = a7;
  v22.location = objc_msgSend(a1, "ic_range");
  v22.length = v14;
  v21.location = a4;
  v21.length = a5;
  NSRange v15 = NSIntersectionRange(v21, v22);
  if (v15.length)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x4012000000;
    v19[3] = __Block_byref_object_copy__7;
    v19[4] = __Block_byref_object_dispose__7;
    v19[5] = &unk_20C2C2E5B;
    NSRange v20 = v15;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __82__NSAttributedString_IC__ic_enumerateClampedAttribute_inRange_options_usingBlock___block_invoke;
    v16[3] = &unk_2640CE030;
    id v17 = v13;
    v18 = v19;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v12, v15.location, v15.length, a6, v16);

    _Block_object_dispose(v19, 8);
  }
}

- (void)ic_enumerateUnclampedAttribute:()IC inRange:options:usingBlock:
{
  id v12 = a3;
  id v13 = a7;
  v29.location = objc_msgSend(a1, "ic_range");
  v29.NSUInteger length = v14;
  v28.location = a4;
  v28.NSUInteger length = a5;
  NSRange v15 = NSIntersectionRange(v28, v29);
  NSUInteger length = v15.length;
  if (v15.length)
  {
    char v27 = 0;
    uint64_t v17 = [a1 length];
    NSUInteger v18 = v15.location + ((v15.length - 1) & (a6 << 62 >> 63));
    if ((a6 & 0x100000) != 0) {
      goto LABEL_4;
    }
LABEL_3:
    for (uint64_t i = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v12, v18, &v25, 0, v17);
    {
      NSRange v20 = (void *)i;
      v13[2](v13, i, v25, v26, &v27);
      if (v27) {
        break;
      }
      if ((a6 & 2) != 0)
      {
        if (v25 <= v15.location) {
          break;
        }
        NSUInteger v18 = v25 - 1;
      }
      else
      {
        uint64_t v21 = [a1 length];
        NSUInteger v22 = v21 - v17 + v25 + v26;
        NSUInteger v23 = length - v17 + v21;
        BOOL v24 = v21 == v17;
        if (v21 == v17)
        {
          NSUInteger v18 = v26 + v25;
        }
        else
        {
          uint64_t v17 = v21;
          NSUInteger v18 = v22;
        }
        if (!v24) {
          NSUInteger length = v23;
        }
        if (v18 >= length + v15.location) {
          break;
        }
      }

      if ((a6 & 0x100000) == 0) {
        goto LABEL_3;
      }
LABEL_4:
      [a1 attribute:v12 atIndex:v18 effectiveRange:&v25];
    }
  }
}

- (uint64_t)ic_range
{
  return 0;
}

- (id)ic_attributedStringByAppendingString:()IC
{
  v4 = objc_msgSend(a3, "ic_attributedString");
  v5 = objc_msgSend(a1, "ic_attributedStringByAppendingAttributedString:", v4);

  return v5;
}

- (id)ic_attributedStringByAppendingAttributedString:()IC
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:a1];
  [v5 appendAttributedString:v4];
  v6 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithAttributedString:v5];

  return v6;
}

- (id)ic_attributedStringByPrependingString:()IC
{
  id v4 = objc_msgSend(a3, "ic_attributedString");
  v5 = objc_msgSend(a1, "ic_attributedStringByPrependingAttributedString:", v4);

  return v5;
}

- (id)ic_attributedStringByPrependingAttributedString:()IC
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v4];
  [v5 appendAttributedString:a1];
  v6 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithAttributedString:v5];

  return v6;
}

- (id)ic_componentRangesSeparatedByPredicate:()IC inRange:
{
  id v8 = a3;
  v9 = [a1 string];
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  uint64_t v11 = a4 + a5;
  if (a4 < a4 + a5)
  {
    uint64_t v12 = 0;
    uint64_t v13 = a4;
    do
    {
      if (v8[2](v8, v13, [v9 characterAtIndex:v13]))
      {
        if (v12)
        {
          NSUInteger v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a4, v12);
          [v10 addObject:v14];
        }
        uint64_t v12 = 0;
        a4 = ++v13;
      }
      else
      {
        ++v12;
        ++v13;
      }
    }
    while (v13 != v11);
    if (v12)
    {
      NSRange v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a4, v12);
      [v10 addObject:v15];
    }
  }

  return v10;
}

- (uint64_t)ic_rangeByTrimmingCharactersInSet:()IC inRange:
{
  id v8 = a3;
  v9 = [a1 string];
  unint64_t v10 = a4 + a5;
  if (a4 < a4 + a5 && a5)
  {
    uint64_t v11 = a4;
    while ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v11)) & 1) != 0)
    {
      uint64_t v12 = 0;
      if (++v11 < v10)
      {
        if (--a5) {
          continue;
        }
      }
      goto LABEL_11;
    }
    uint64_t v12 = a5;
LABEL_11:
    unint64_t v10 = v12 + v11;
    a5 = v12;
    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v11 = a4;
    if (!a5)
    {
LABEL_18:
      if (!a5) {
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_20;
    }
  }
  if (v10 <= a4) {
    goto LABEL_18;
  }
  uint64_t v13 = a5 - 1;
  while ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v10 - 1)) & 1) != 0)
  {
    uint64_t v14 = v13 - 1;
    if (v13)
    {
      unint64_t v10 = --a5 + v11;
      unint64_t v15 = v11 + v13--;
      if (v15 > a4) {
        continue;
      }
    }
    a5 = v14 + 1;
    goto LABEL_18;
  }
LABEL_20:

  return v11;
}

- (id)ic_attributedSubstringFromRange:()IC
{
  v7 = [a1 string];
  uint64_t v8 = objc_msgSend(v7, "rangeOfComposedCharacterSequencesForRange:", a3, a4);
  unint64_t v10 = objc_msgSend(a1, "attributedSubstringFromRange:", v8, v9);

  return v10;
}

- (void)ic_enumerateAttributesInClampedRange:()IC options:usingBlock:
{
  id v10 = a6;
  v19.location = objc_msgSend(a1, "ic_range");
  v19.NSUInteger length = v11;
  v18.location = a3;
  v18.NSUInteger length = a4;
  NSRange v12 = NSIntersectionRange(v18, v19);
  if (v12.length)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x4012000000;
    v16[3] = __Block_byref_object_copy__7;
    void v16[4] = __Block_byref_object_dispose__7;
    v16[5] = &unk_20C2C2E5B;
    NSRange v17 = v12;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __82__NSAttributedString_IC__ic_enumerateAttributesInClampedRange_options_usingBlock___block_invoke;
    v13[3] = &unk_2640CE008;
    id v14 = v10;
    unint64_t v15 = v16;
    objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", v12.location, v12.length, a5, v13);

    _Block_object_dispose(v16, 8);
  }
}

- (id)ic_attributedStringByReplacingNewlineCharactersWithWhiteSpace
{
  v2 = [MEMORY[0x263F08708] newlineCharacterSet];
  v3 = objc_msgSend(a1, "ic_attributedStringByReplacingCharactersInSet:withString:", v2, @" ");

  return v3;
}

- (id)ic_attributedStringByReplacingCharactersInSet:()IC withString:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  uint64_t v9 = [v8 string];
  uint64_t v10 = [v9 rangeOfCharacterFromSet:v6];

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v11 = (void *)[v8 mutableCopy];
    NSRange v12 = [v11 string];
    uint64_t v13 = [v12 rangeOfCharacterFromSet:v6];
    uint64_t v15 = v14;

    while (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "replaceCharactersInRange:withString:", v13, v15, v7);
      v16 = [v11 string];
      uint64_t v17 = [v16 length];

      NSRange v18 = [v11 string];
      uint64_t v13 = objc_msgSend(v18, "rangeOfCharacterFromSet:options:range:", v6, 2, v13, v17 - v13);
      uint64_t v15 = v19;
    }
    if (v11)
    {
      uint64_t v20 = [v11 copy];

      id v8 = (id)v20;
    }
  }

  return v8;
}

- (uint64_t)ic_containsAttribute:()IC inRange:
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__NSAttributedString_IC__ic_containsAttribute_inRange___block_invoke;
  v7[3] = &unk_2640CE058;
  v7[4] = &v8;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", a3, a4, a5, 0x100000, v7);
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)ic_attributedStringWithOnlyAdaptiveImageAttributeIfNecessary
{
  uint64_t v2 = *MEMORY[0x263F82238];
  uint64_t v3 = objc_msgSend(a1, "ic_range");
  if (objc_msgSend(a1, "ic_containsAttribute:inRange:", v2, v3, v4))
  {
    id v5 = objc_alloc(MEMORY[0x263F089B8]);
    id v6 = [a1 string];
    id v7 = (void *)[v5 initWithString:v6];

    uint64_t v8 = objc_msgSend(a1, "ic_range");
    uint64_t v10 = v9;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __86__NSAttributedString_IC__ic_attributedStringWithOnlyAdaptiveImageAttributeIfNecessary__block_invoke;
    v14[3] = &unk_2640CE080;
    id v11 = v7;
    id v15 = v11;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v2, v8, v10, 0, v14);
    NSRange v12 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithAttributedString:v11];
  }
  else
  {
    NSRange v12 = 0;
  }
  return v12;
}

- (id)ic_attributedStringByRemovingAllAttributesExcept:()IC
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  uint64_t v6 = objc_msgSend(a1, "ic_range");
  uint64_t v8 = v7;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __75__NSAttributedString_IC__ic_attributedStringByRemovingAllAttributesExcept___block_invoke;
  uint64_t v17 = &unk_2640CE0A8;
  id v9 = v4;
  id v19 = v9;
  id v10 = v5;
  id v18 = v10;
  objc_msgSend(v10, "enumerateAttributesInRange:options:usingBlock:", v6, v8, 0, &v14);
  id v11 = objc_alloc(MEMORY[0x263F086A0]);
  NSRange v12 = objc_msgSend(v11, "initWithAttributedString:", v10, v14, v15, v16, v17);

  return v12;
}

- (id)ic_attributedStringByTrimmingCharactersInSet:()IC
{
  id v4 = a3;
  id v5 = [a1 string];
  for (unint64_t i = 0;
        i < [a1 length]
     && objc_msgSend(v4, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", i));
  if ([a1 length] == i)
  {
    uint64_t v7 = objc_opt_new();
  }
  else
  {
    uint64_t v8 = [a1 length];
    unint64_t v9 = v8 - i;
    unint64_t v10 = v8 - 1;
    do
    {
      unint64_t v11 = v9;
      if (v10 <= i) {
        break;
      }
      char v12 = objc_msgSend(v4, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", v10));
      unint64_t v9 = v11 - 1;
      --v10;
    }
    while ((v12 & 1) != 0);
    uint64_t v7 = objc_msgSend(a1, "attributedSubstringFromRange:", i, v11);
  }
  uint64_t v13 = (void *)v7;

  return v13;
}

- (uint64_t)ic_whitespaceAndNewlineCoalescedAttributedString
{
  if (-[NSAttributedString(IC) ic_whitespaceAndNewlineCoalescedAttributedString]::onceToken != -1) {
    dispatch_once(&-[NSAttributedString(IC) ic_whitespaceAndNewlineCoalescedAttributedString]::onceToken, &__block_literal_global_22);
  }
  uint64_t v2 = (void *)-[NSAttributedString(IC) ic_whitespaceAndNewlineCoalescedAttributedString]::regex;
  uint64_t v4 = objc_msgSend(a1, "ic_range");
  return objc_msgSend(v2, "ic_attributedStringByReplacingMatchesInAttributedString:options:range:withTemplate:", a1, 0, v4, v3, @" ");
}

+ (id)ic_emptyAttributedString
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_26C13B138];
  return v0;
}

@end