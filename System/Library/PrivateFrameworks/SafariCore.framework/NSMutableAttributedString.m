@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

void __102__NSMutableAttributedString_WBSNSMutableAttributedExtras__safari_replaceCharactersWithStringBindings___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) rangeOfString:a2];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    v9 = [WBSPair alloc];
    v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v7, v8);
    v11 = [(WBSPair *)v9 initWithFirst:v12 second:v10];

    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v11, objc_msgSend(*(id *)(a1 + 40), "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, objc_msgSend(*(id *)(a1 + 40), "count"), 1024, &__block_literal_global_26));
  }
}

uint64_t __102__NSMutableAttributedString_WBSNSMutableAttributedExtras__safari_replaceCharactersWithStringBindings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 second];
  unint64_t v6 = [v5 rangeValue];

  uint64_t v7 = [v4 second];

  unint64_t v8 = [v7 rangeValue];
  if (v6 < v8) {
    return 1;
  }
  else {
    return -1;
  }
}

@end