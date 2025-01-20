@interface NSAttributedString(VK)
- (id)vk_attributedStringByReplacingCharactersInSet:()VK withString:;
- (id)vk_attributedStringByReplacingNewlineCharactersWithWhiteSpace;
- (id)vk_attributedSubstringFromVKRange:()VK;
- (uint64_t)vk_range;
- (void)vk_enumerateClampedAttribute:()VK inRange:options:usingBlock:;
- (void)vk_enumerateUnclampedAttribute:()VK inRange:options:usingBlock:;
@end

@implementation NSAttributedString(VK)

- (uint64_t)vk_range
{
  return 0;
}

- (id)vk_attributedSubstringFromVKRange:()VK
{
  id v4 = a3;
  if ([v4 isEmpty])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  }
  else
  {
    if ([v4 containsMultipleRanges])
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      v7 = [v4 rangeArray];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __60__NSAttributedString_VK__vk_attributedSubstringFromVKRange___block_invoke;
      v14[3] = &unk_1E6BF4190;
      id v15 = v6;
      v16 = a1;
      id v17 = v7;
      id v8 = v7;
      id v9 = v6;
      [v8 enumerateObjectsUsingBlock:v14];
      v10 = (void *)[v9 copy];

      goto LABEL_7;
    }
    uint64_t v11 = [v4 nsRange];
    objc_msgSend(a1, "vk_attributedSubstringFromRange:", v11, v12);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v5;
LABEL_7:

  return v10;
}

- (void)vk_enumerateClampedAttribute:()VK inRange:options:usingBlock:
{
  id v12 = a3;
  id v13 = a7;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3010000000;
  v18[3] = &unk_1DB350762;
  v18[4] = a4;
  v18[5] = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__NSAttributedString_VK__vk_enumerateClampedAttribute_inRange_options_usingBlock___block_invoke;
  v15[3] = &unk_1E6BF41B8;
  id v14 = v13;
  id v16 = v14;
  id v17 = v18;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v12, a4, a5, a6, v15);

  _Block_object_dispose(v18, 8);
}

- (void)vk_enumerateUnclampedAttribute:()VK inRange:options:usingBlock:
{
  id v12 = a3;
  id v13 = a7;
  if (a5)
  {
    unint64_t v14 = a4 + ((a5 - 1) & (a6 << 62 >> 63));
    char v21 = 0;
    uint64_t v15 = [a1 length];
    while (1)
    {
      unint64_t v19 = 0;
      uint64_t v20 = 0;
      if ((a6 & 0x100000) != 0) {
        [a1 attribute:v12 atIndex:v14 effectiveRange:&v19];
      }
      else {
      id v16 = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v12, v14, &v19, 0, v15);
      }
      v13[2](v13, v16, v19, v20, &v21);
      if (v21) {
        break;
      }
      if ((a6 & 2) != 0)
      {
        if (v19 <= a4) {
          break;
        }
        unint64_t v14 = v19 - 1;
      }
      else
      {
        uint64_t v17 = [a1 length];
        uint64_t v18 = a5 - v15 + v17;
        if (v17 == v15) {
          unint64_t v14 = v20 + v19;
        }
        else {
          unint64_t v14 = v17 - v15 + v19 + v20;
        }
        if (v17 != v15)
        {
          uint64_t v15 = v17;
          a5 = v18;
        }
        if (v14 >= a5 + a4) {
          break;
        }
      }
    }
  }
}

- (id)vk_attributedStringByReplacingNewlineCharactersWithWhiteSpace
{
  v2 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v3 = objc_msgSend(a1, "vk_attributedStringByReplacingCharactersInSet:withString:", v2, @" ");

  return v3;
}

- (id)vk_attributedStringByReplacingCharactersInSet:()VK withString:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  id v9 = [v8 string];
  uint64_t v10 = [v9 rangeOfCharacterFromSet:v6];

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = (void *)[v8 mutableCopy];
    id v12 = [v11 string];
    uint64_t v13 = [v12 rangeOfCharacterFromSet:v6];
    uint64_t v15 = v14;

    while (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "replaceCharactersInRange:withString:", v13, v15, v7);
      id v16 = [v11 string];
      uint64_t v17 = [v16 length] - v13;

      uint64_t v18 = [v11 string];
      uint64_t v13 = objc_msgSend(v18, "rangeOfCharacterFromSet:options:range:", v6, 2, v13, v17);
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

@end