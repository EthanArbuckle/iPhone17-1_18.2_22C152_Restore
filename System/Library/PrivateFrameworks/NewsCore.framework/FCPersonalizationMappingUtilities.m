@interface FCPersonalizationMappingUtilities
+ (id)scoredTagsDictionaryFromScoredTags:(id)a3;
@end

@implementation FCPersonalizationMappingUtilities

+ (id)scoredTagsDictionaryFromScoredTags:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "scoredTagIDs");
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCPersonalizationMappingUtilities scoredTagsDictionaryFromScoredTags:]";
    __int16 v9 = 2080;
    v10 = "FCPersonalizationMappingUtilities.m";
    __int16 v11 = 1024;
    int v12 = 17;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionaryFromArray:keyBlock:valueBlock:", v3, &__block_literal_global_134, &__block_literal_global_7_2);

  return v4;
}

uint64_t __72__FCPersonalizationMappingUtilities_scoredTagsDictionaryFromScoredTags___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  [a2 score];
  return objc_msgSend(v2, "numberWithFloat:");
}

uint64_t __72__FCPersonalizationMappingUtilities_scoredTagsDictionaryFromScoredTags___block_invoke(uint64_t a1, void *a2)
{
  return [a2 tagId];
}

@end