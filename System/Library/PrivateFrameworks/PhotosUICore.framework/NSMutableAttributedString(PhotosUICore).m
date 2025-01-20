@interface NSMutableAttributedString(PhotosUICore)
- (void)px_replaceFontWithFontDescriptor:()PhotosUICore keepingSymbolicTraits:;
- (void)px_replaceOccurrencesOfString:()PhotosUICore withTextAttachmentWithImage:;
@end

@implementation NSMutableAttributedString(PhotosUICore)

- (void)px_replaceFontWithFontDescriptor:()PhotosUICore keepingSymbolicTraits:
{
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4FB06F8];
  uint64_t v8 = [a1 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__NSMutableAttributedString_PhotosUICore__px_replaceFontWithFontDescriptor_keepingSymbolicTraits___block_invoke;
  v10[3] = &unk_1E5DB4580;
  int v13 = a4;
  id v11 = v6;
  v12 = a1;
  id v9 = v6;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0x100000, v10);
}

- (void)px_replaceOccurrencesOfString:()PhotosUICore withTextAttachmentWithImage:
{
  id v26 = a3;
  id v6 = a4;
  uint64_t v7 = [a1 string];
  uint64_t v8 = [v7 rangeOfString:v26];
  uint64_t v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v25 = *MEMORY[0x1E4FB06F8];
    do
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4FB0870]);
      [v11 setImage:v6];
      v12 = objc_msgSend(a1, "attributesAtIndex:longestEffectiveRange:inRange:", v8, 0, v8, v10);
      int v13 = [v12 objectForKeyedSubscript:v25];
      [v6 size];
      if (v13)
      {
        double v15 = v14;
        if (v14 > 0.0)
        {
          [v13 descender];
          double v17 = v16;
          [v13 ascender];
          double v19 = v18 - v17;
          [v6 size];
          objc_msgSend(v11, "setBounds:", 0.0, v17, v20 * (v19 / v15), v19);
        }
      }
      v21 = objc_msgSend(MEMORY[0x1E4F28B18], "attributedStringWithAttachment:", v11, v25);
      objc_msgSend(a1, "replaceCharactersInRange:withAttributedString:", v8, v10, v21);
      v22 = [a1 string];
      v23 = [a1 string];
      uint64_t v8 = objc_msgSend(v22, "rangeOfString:options:range:", v26, 0, v8, objc_msgSend(v23, "length") - v8);
      uint64_t v10 = v24;
    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }
}

@end