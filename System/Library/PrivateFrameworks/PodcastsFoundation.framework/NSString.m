@interface NSString
@end

@implementation NSString

uint64_t __32__NSString_IMAdditions__hasHTML__block_invoke()
{
  v0 = objc_alloc_init(MTSearchTrie);
  v1 = (void *)hasHTML_trie;
  hasHTML_trie = (uint64_t)v0;

  for (uint64_t i = 0; i != 253; ++i)
    uint64_t result = [(id)hasHTML_trie addMatchCandidate:kIMHTMLEntities[i]];
  return result;
}

uint64_t __82__NSString_MTAdditions__stringWithDuration_unitsStyle_includeTimeRemainingPhrase___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v1 = stringWithDuration_unitsStyle_includeTimeRemainingPhrase__formatters;
  stringWithDuration_unitsStyle_includeTimeRemainingPhrase__formatters = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __54__NSString_MTAdditions__cleanedTitleStringWithPrefix___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v24 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] <= *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 24))
  {
    v11 = 0;
  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
    if (v11 && ![v24 caseInsensitiveCompare:v11])
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
      *(void *)(v12 + 32) = a3;
      *(void *)(v12 + 40) = a4;
      goto LABEL_7;
    }
  }
  uint64_t v13 = [*(id *)(a1 + 40) substringFromIndex:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)+ *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32)];
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  v16 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) stringByAppendingString:@"​"];
  v17 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" \n\t,:：–—-"]);;
  uint64_t v18 = [v16 stringByTrimmingCharactersInSet:v17];
  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  uint64_t v21 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "substringToIndex:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "length") - 1);
  uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
  v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;

  *a7 = 1;
LABEL_7:
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

uint64_t __30__NSString_MTAdditions__words__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __37__NSString_MTAdditions__mt_isEnglish__block_invoke()
{
  id v1 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v0 = [v1 firstObject];
  mt_isEnglish_isEnglish = [v0 hasPrefix:@"en"];
}

void __38__NSString_MTAdditions__mt_isJapanese__block_invoke()
{
  id v1 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v0 = [v1 firstObject];
  mt_isJapanese_isJapanese = [v0 hasPrefix:@"ja"];
}

void __52__NSString_IMAdditions__rangeOfSignificantSubstring__block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v10 = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)
    || (v11 = (void *)a1[4],
        id v13 = v10,
        [v10 lowercaseString],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v11) = [v11 containsObject:v12],
        v12,
        id v10 = v13,
        (v11 & 1) == 0))
  {
    *a7 = 1;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
}

void *__87__NSString_IMAdditions__tokenCountWithEnumerationOptions_maxTokenCount_outLimitLength___block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if (++*(void *)(*(void *)(result[4] + 8) + 24) >= result[5])
  {
    *a7 = 1;
    v7 = (void *)result[6];
    if (v7) {
      void *v7 = a5 + a6;
    }
  }
  return result;
}

uint64_t __77__NSString_IMAdditions__stringByTruncatingToLength_options_truncationString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  unint64_t v9 = a3 + a4;
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t result = [*(id *)(a1 + 32) length];
  if (v9 <= v10 - result) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  }
  else {
    *a7 = 1;
  }
  return result;
}

@end