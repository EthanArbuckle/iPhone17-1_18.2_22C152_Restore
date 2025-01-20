@interface NSMutableAttributedString(REMTTParagraphStyle)
- (void)rem_addParagraphNamedStyle:()REMTTParagraphStyle inRange:;
- (void)rem_removeParagraphNamedStyleFromRange:()REMTTParagraphStyle;
@end

@implementation NSMutableAttributedString(REMTTParagraphStyle)

- (void)rem_addParagraphNamedStyle:()REMTTParagraphStyle inRange:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = [a1 length];
  if (a4 >= v9) {
    a4 = v9;
  }
  if (a4 + a5 > v9) {
    a5 = v9 - a4;
  }
  if (a5)
  {
    [a1 beginEditing];
    v10 = [[REMTTParagraphStyle alloc] initWithStyle:a3];
    v11 = v10;
    v12 = TTAttributeNameParagraphStyle;
    if (v10)
    {
      v13 = [(REMTTParagraphStyle *)v10 innerStyle];
      objc_msgSend(a1, "addAttribute:value:range:", v12, v13, a4, a5);
    }
    else
    {
      objc_msgSend(a1, "removeAttribute:range:", TTAttributeNameParagraphStyle, a4, a5);
    }
    [a1 endEditing];
    v14 = +[REMLog crdt];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [(REMTTParagraphStyle *)v11 innerStyle];
      v24.location = a4;
      v24.length = a5;
      v16 = NSStringFromRange(v24);
      int v17 = 134218498;
      v18 = a1;
      __int16 v19 = 2112;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_1B9AA2000, v14, OS_LOG_TYPE_INFO, "Added REMTTParagraphStyle to this NSMutableAttributedString {self: %p, paragraphStyle: %@, range: %@}", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (void)rem_removeParagraphNamedStyleFromRange:()REMTTParagraphStyle
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [a1 length];
  if (a3 >= v7) {
    a3 = v7;
  }
  if (a3 + a4 <= v7) {
    NSUInteger v8 = a4;
  }
  else {
    NSUInteger v8 = v7 - a3;
  }
  if (v8)
  {
    objc_msgSend(a1, "removeAttribute:range:", TTAttributeNameParagraphStyle, a3, v8);
    unint64_t v9 = +[REMLog crdt];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16.location = a3;
      v16.length = v8;
      v10 = NSStringFromRange(v16);
      int v11 = 134218242;
      v12 = a1;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1B9AA2000, v9, OS_LOG_TYPE_INFO, "Remove REMTTParagraphStyle from this NSMutableAttributedString {self: %p, range: %@}", (uint8_t *)&v11, 0x16u);
    }
  }
}

@end