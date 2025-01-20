@interface NSAttributedString(REMCRMergeableStringDocument_Hashtags)
- (REMTTHashtag)rem_hashtagAtIndex:()REMCRMergeableStringDocument_Hashtags effectiveRange:wantsLongestEffectiveRange:inRange:;
- (uint64_t)rem_hashtagAtIndex:()REMCRMergeableStringDocument_Hashtags effectiveRange:;
- (uint64_t)rem_hashtagAtIndex:()REMCRMergeableStringDocument_Hashtags longestEffectiveRange:inRange:;
- (void)rem_enumerateHashtagInRange:()REMCRMergeableStringDocument_Hashtags options:usingBlock:;
@end

@implementation NSAttributedString(REMCRMergeableStringDocument_Hashtags)

- (uint64_t)rem_hashtagAtIndex:()REMCRMergeableStringDocument_Hashtags effectiveRange:
{
  v7 = [a1 string];
  uint64_t v8 = [v7 length];

  return objc_msgSend(a1, "rem_hashtagAtIndex:effectiveRange:wantsLongestEffectiveRange:inRange:", a3, a4, 0, 0, v8);
}

- (uint64_t)rem_hashtagAtIndex:()REMCRMergeableStringDocument_Hashtags longestEffectiveRange:inRange:
{
  return objc_msgSend(a1, "rem_hashtagAtIndex:effectiveRange:wantsLongestEffectiveRange:inRange:", a3, a4, 1, a5, a6);
}

- (REMTTHashtag)rem_hashtagAtIndex:()REMCRMergeableStringDocument_Hashtags effectiveRange:wantsLongestEffectiveRange:inRange:
{
  if ([a1 length])
  {
    if (a5) {
      objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", @"_TTREMHashtag", a3, a4, a6, a7);
    }
    else {
    v14 = [a1 attribute:@"_TTREMHashtag" atIndex:a3 effectiveRange:a4];
    }
    uint64_t v15 = objc_opt_class();
    v16 = REMDynamicCast(v15, (uint64_t)v14);
    if (v16)
    {
      v17 = [REMTTHashtag alloc];
      v18 = [v16 objectIdentifier];
      v19 = [(REMTTHashtag *)v17 initWithObjectIdentifier:v18];
    }
    else
    {
      if (v14)
      {
        v20 = +[REMLog crdt];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[NSAttributedString(REMCRMergeableStringDocument_Hashtags) rem_hashtagAtIndex:effectiveRange:wantsLongestEffectiveRange:inRange:]((uint64_t)v14, a4);
        }
      }
      v19 = 0;
    }
    v13 = v19;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)rem_enumerateHashtagInRange:()REMCRMergeableStringDocument_Hashtags options:usingBlock:
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __108__NSAttributedString_REMCRMergeableStringDocument_Hashtags__rem_enumerateHashtagInRange_options_usingBlock___block_invoke;
  v12[3] = &unk_1E61DCCA0;
  id v13 = v10;
  id v11 = v10;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", @"_TTREMHashtag", a3, a4, a5, v12);
}

- (void)rem_hashtagAtIndex:()REMCRMergeableStringDocument_Hashtags effectiveRange:wantsLongestEffectiveRange:inRange:.cold.1(uint64_t a1, NSRange *a2)
{
  v2 = NSStringFromRange(*a2);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "Unexpected Class of TTREMHashtagAttributeName objects found {value: %@, range: %@}", v5, v6, v7, v8, v9);
}

@end