@interface NSMutableAttributedString(REMCRMergeableStringDocument_Styling)
- (void)rem_setFontHint:()REMCRMergeableStringDocument_Styling isOn:inRange:;
- (void)rem_setUnderline:()REMCRMergeableStringDocument_Styling inRange:;
@end

@implementation NSMutableAttributedString(REMCRMergeableStringDocument_Styling)

- (void)rem_setFontHint:()REMCRMergeableStringDocument_Styling isOn:inRange:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v24.length = [a1 length];
    v24.location = 0;
    v26.location = a5;
    v26.length = a6;
    NSRange v11 = NSIntersectionRange(v24, v26);
    if (v11.length && v11.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      [a1 beginEditing];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __96__NSMutableAttributedString_REMCRMergeableStringDocument_Styling__rem_setFontHint_isOn_inRange___block_invoke;
      v15[3] = &unk_1E61DD098;
      char v16 = a4;
      v15[4] = a1;
      v15[5] = a3;
      objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", v11.location, v11.length, 0x100000, v15);
      [a1 endEditing];
      v12 = +[REMLog crdt];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = NSStringFromRange(v11);
        *(_DWORD *)buf = 134218498;
        v18 = a1;
        __int16 v19 = 2048;
        uint64_t v20 = a3;
        __int16 v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_1B9AA2000, v12, OS_LOG_TYPE_INFO, "Added REMTTFontHint to this NSMutableAttributedString {self: %p, hint: %lu, range: %@}", buf, 0x20u);
      }
    }
  }
  else
  {
    v14 = +[REMLog crdt];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v25.location = a5;
      v25.length = a6;
      -[NSMutableAttributedString(REMCRMergeableStringDocument_Styling) rem_setFontHint:isOn:inRange:]((uint64_t)a1, v25, v14);
    }
  }
}

- (void)rem_setUnderline:()REMCRMergeableStringDocument_Styling inRange:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v21.length = [a1 length];
  v21.location = 0;
  v22.location = a4;
  v22.length = a5;
  NSRange v9 = NSIntersectionRange(v21, v22);
  if (v9.length && v9.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    [a1 beginEditing];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92__NSMutableAttributedString_REMCRMergeableStringDocument_Styling__rem_setUnderline_inRange___block_invoke;
    v12[3] = &unk_1E61DD0C0;
    char v13 = a3;
    v12[4] = a1;
    objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", v9.location, v9.length, 0x100000, v12);
    [a1 endEditing];
    v10 = +[REMLog crdt];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSRange v11 = NSStringFromRange(v9);
      *(_DWORD *)buf = 134218498;
      v15 = a1;
      __int16 v16 = 1024;
      int v17 = a3;
      __int16 v18 = 2112;
      __int16 v19 = v11;
      _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_INFO, "Added REMTTUnderline to this NSMutableAttributedString {self: %p, value: %d, range: %@}", buf, 0x1Cu);
    }
  }
}

- (void)rem_setFontHint:()REMCRMergeableStringDocument_Styling isOn:inRange:.cold.1(uint64_t a1, NSRange range, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromRange(range);
  int v6 = 134218242;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  NSRange v9 = v5;
  _os_log_error_impl(&dword_1B9AA2000, a3, OS_LOG_TYPE_ERROR, "Invalid 0 value provided when trying to -rem_setFontHint:isOn:range: to this NSMutableAttributedString {self: %p, range: %@}", (uint8_t *)&v6, 0x16u);
}

@end