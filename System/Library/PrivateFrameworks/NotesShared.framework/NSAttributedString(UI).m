@interface NSAttributedString(UI)
- (ICTTTextEdit)editAtIndex:()UI;
- (id)editsInRange:()UI;
- (uint64_t)edits;
- (void)enumerateEditsInRange:()UI usingBlock:;
@end

@implementation NSAttributedString(UI)

- (id)editsInRange:()UI
{
  v7 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__NSAttributedString_UI__editsInRange___block_invoke;
  v11[3] = &unk_1E64A79B0;
  id v12 = v7;
  id v8 = v7;
  objc_msgSend(a1, "enumerateEditsInRange:usingBlock:", a3, a4, v11);
  v9 = (void *)[v8 copy];

  return v9;
}

- (ICTTTextEdit)editAtIndex:()UI
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  v3 = [a1 attributesAtIndex:a3 effectiveRange:&v7];
  v4 = [ICTTTextEdit alloc];
  v5 = -[ICTTTextEdit initWithAttributes:range:](v4, "initWithAttributes:range:", v3, v7, v8);

  return v5;
}

- (void)enumerateEditsInRange:()UI usingBlock:
{
  id v8 = a5;
  v15.location = objc_msgSend(a1, "ic_range");
  v15.length = v9;
  v14.location = a3;
  v14.length = a4;
  NSRange v10 = NSIntersectionRange(v14, v15);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__NSAttributedString_UI__enumerateEditsInRange_usingBlock___block_invoke;
  v12[3] = &unk_1E64A7988;
  id v13 = v8;
  id v11 = v8;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", v10.location, v10.length, 0, v12);
}

- (uint64_t)edits
{
  uint64_t v3 = objc_msgSend(a1, "ic_range");
  return objc_msgSend(a1, "editsInRange:", v3, v2);
}

@end