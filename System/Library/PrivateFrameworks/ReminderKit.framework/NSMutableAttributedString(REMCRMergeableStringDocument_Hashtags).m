@interface NSMutableAttributedString(REMCRMergeableStringDocument_Hashtags)
- (unint64_t)rem_removeHashtagInRange:()REMCRMergeableStringDocument_Hashtags;
- (void)rem_addHashtag:()REMCRMergeableStringDocument_Hashtags range:;
@end

@implementation NSMutableAttributedString(REMCRMergeableStringDocument_Hashtags)

- (void)rem_addHashtag:()REMCRMergeableStringDocument_Hashtags range:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    v10 = +[REMLog crdt];
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
    {
      v22.location = a4;
      v22.length = a5;
      -[NSMutableAttributedString(REMCRMergeableStringDocument_Hashtags) rem_addHashtag:range:]((int)a1, v22);
    }
    goto LABEL_12;
  }
  unint64_t v9 = [a1 length];
  if (a4 >= v9) {
    a4 = v9;
  }
  if (a4 + a5 > v9) {
    a5 = v9 - a4;
  }
  if (a5)
  {
    v10 = objc_alloc_init(TTREMHashtag);
    v11 = [v8 objectIdentifier];
    [(TTREMHashtag *)v10 setObjectIdentifier:v11];

    objc_msgSend(a1, "addAttribute:value:range:", @"_TTREMHashtag", v10, a4, a5);
    v12 = +[REMLog crdt];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v21.location = a4;
      v21.length = a5;
      v13 = NSStringFromRange(v21);
      int v14 = 134218498;
      v15 = a1;
      __int16 v16 = 2112;
      v17 = v10;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1B9AA2000, v12, OS_LOG_TYPE_INFO, "Added TTREMHashtag to this NSMutableAttributedString {self: %p, value: %@, range: %@}", (uint8_t *)&v14, 0x20u);
    }
LABEL_12:
  }
}

- (unint64_t)rem_removeHashtagInRange:()REMCRMergeableStringDocument_Hashtags
{
  unint64_t result = [a1 length];
  if (a3 >= result) {
    unint64_t v8 = result;
  }
  else {
    unint64_t v8 = a3;
  }
  if (v8 + a4 <= result) {
    unint64_t v9 = a4;
  }
  else {
    unint64_t v9 = result - v8;
  }
  if (v9)
  {
    return objc_msgSend(a1, "removeAttribute:range:", @"_TTREMHashtag");
  }
  return result;
}

- (void)rem_addHashtag:()REMCRMergeableStringDocument_Hashtags range:.cold.1(int a1, NSRange range)
{
  v2 = NSStringFromRange(range);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "Invalid nil value provided when trying to -rem_addHashtag:range: to this NSMutableAttributedString {self: %p, range: %@}", v5, v6, v7, v8, v9);
}

@end