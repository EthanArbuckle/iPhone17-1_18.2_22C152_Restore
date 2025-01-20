@interface NSAttributedString(SafariSharedUIExtras)
+ (id)safari_attributedStringWithLinkText:()SafariSharedUIExtras linkUrl:extraTitle:;
- (id)safari_attributedStringByAppendingAttributedString:()SafariSharedUIExtras;
- (id)safari_attributedStringByReplacingAttributeName:()SafariSharedUIExtras withAttributes:;
@end

@implementation NSAttributedString(SafariSharedUIExtras)

+ (id)safari_attributedStringWithLinkText:()SafariSharedUIExtras linkUrl:extraTitle:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  if (v9)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9];
    [v10 appendAttributedString:v12];

    [v10 appendAttributedString:v11];
  }
  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v8)
  {
    uint64_t v17 = *MEMORY[0x1E4F42530];
    v18[0] = v8;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)[v13 initWithString:v7 attributes:v14];
  [v10 appendAttributedString:v15];

  if (v8) {
  [v10 appendAttributedString:v11];
  }

  return v10;
}

- (id)safari_attributedStringByReplacingAttributeName:()SafariSharedUIExtras withAttributes:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[a1 mutableCopy];
  uint64_t v9 = [a1 length];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __107__NSAttributedString_SafariSharedUIExtras__safari_attributedStringByReplacingAttributeName_withAttributes___block_invoke;
  v16[3] = &unk_1E5E43990;
  id v10 = v8;
  id v17 = v10;
  id v18 = v6;
  id v19 = v7;
  id v11 = v7;
  id v12 = v6;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v9, 0, v16);
  id v13 = v19;
  id v14 = v10;

  return v14;
}

- (id)safari_attributedStringByAppendingAttributedString:()SafariSharedUIExtras
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 appendAttributedString:v4];

  id v6 = (void *)[v5 copy];
  return v6;
}

@end