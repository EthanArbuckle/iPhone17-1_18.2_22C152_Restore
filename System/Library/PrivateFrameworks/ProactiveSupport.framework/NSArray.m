@interface NSArray
@end

@implementation NSArray

uint64_t __53__NSArray__PASAdditions___pas_filteredArrayWithTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__NSArray__PASAdditions___pas_mappedArrayWithTransform___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __49__NSArray__PASAdditions___pas_proxyArrayReversed__block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void *)(v4 + 8);
  if (v3 > a2) {
    uint64_t v5 = ~a2;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = [v2 objectAtIndexedSubscript:v3 + v5];

  return v6;
}

uint64_t __49__NSArray__PASAdditions___pas_proxyArrayReversed__block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

id __56__NSArray__PASAdditions___pas_proxyArrayRevivingStrings__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 conformsToProtocol:&unk_1EF685E50] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"NSArray+_PASAdditions.m", 445, @"Invalid parameter not satisfying: %@", @"[distilledString conformsToProtocol:@protocol(_PASDistilledString)]" object file lineNumber description];
  }
  uint64_t v4 = objc_msgSend(v3, "_pas_revivedString");

  return v4;
}

id __58__NSArray__PASAdditions___pas_proxyArrayDistillingStrings__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"NSArray+_PASAdditions.m", 437, @"Invalid parameter not satisfying: %@", @"[string isKindOfClass:[NSString class]]" object file lineNumber description];
  }
  uint64_t v4 = objc_msgSend(v3, "_pas_distilledString");

  return v4;
}

id __57__NSArray__PASAdditions___pas_proxyArrayWithRepetitions___block_invoke(void *a1, unint64_t a2)
{
  unint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = (void *)a1[4];
  if (v3 * v2 <= a2) {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v5 = a2 % v2;
  }
  v6 = [v4 objectAtIndexedSubscript:v5];

  return v6;
}

uint64_t __57__NSArray__PASAdditions___pas_proxyArrayWithRepetitions___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 40) * *(void *)(a1 + 32);
}

id __58__NSArray__PASAdditions___pas_proxyArrayByAppendingArray___block_invoke(void *a1, unint64_t a2)
{
  unint64_t v2 = a1[6];
  uint64_t v3 = a2 - v2;
  if (a2 >= v2)
  {
    uint64_t v4 = (void *)a1[5];
  }
  else
  {
    uint64_t v4 = (void *)a1[4];
    uint64_t v3 = a2;
  }
  uint64_t v5 = [v4 objectAtIndexedSubscript:v3];

  return v5;
}

uint64_t __58__NSArray__PASAdditions___pas_proxyArrayByAppendingArray___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 40) + *(void *)(a1 + 32);
}

id __53__NSArray__PASAdditions___pas_proxyArrayWithMapping___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v4 = (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

uint64_t __53__NSArray__PASAdditions___pas_proxyArrayWithMapping___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) count];
}

id __62__NSArray__PASAdditions___pas_proxyArrayWithObjectsAtIndexes___block_invoke(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 48) <= a2) {
    uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v3 = *(void *)([*(id *)(a1 + 32) bytes] + 8 * a2);
  }
  uint64_t v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v3];

  return v4;
}

uint64_t __62__NSArray__PASAdditions___pas_proxyArrayWithObjectsAtIndexes___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

id __54__NSArray__PASAdditions___pas_proxySubarrayWithRange___block_invoke(void *a1, unint64_t a2)
{
  if (a1[6] <= a2)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v2 = a1[5] + a2;
    uint64_t v3 = (void *)a1[4];
  }
  uint64_t v4 = [v3 objectAtIndexedSubscript:v2];

  return v4;
}

uint64_t __54__NSArray__PASAdditions___pas_proxySubarrayWithRange___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

id __61__NSArray__PASAdditions___pas_proxyComponentsJoinedByString___block_invoke(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 48) <= a2) {
    __assert_rtn("-[NSArray(_PASAdditions) _pas_proxyComponentsJoinedByString:]_block_invoke", "NSArray+_PASAdditions.m", 228, "index < countWithSeparators");
  }
  if (a2)
  {
    id v2 = *(id *)(a1 + 40);
  }
  else
  {
    id v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2 >> 1];
  }

  return v2;
}

uint64_t __61__NSArray__PASAdditions___pas_proxyComponentsJoinedByString___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

unint64_t __53__NSArray__PASAdditions___pas_shuffledArrayUsingRng___block_invoke(uint64_t a1, unint64_t a2)
{
  return [*(id *)(a1 + 32) next] % a2;
}

uint64_t __53__NSArray__PASAdditions___pas_shuffledArrayUsingRng___block_invoke_2(int a1, uint32_t __upper_bound)
{
  return arc4random_uniform(__upper_bound);
}

uint64_t __69__NSArray__PASAdditions___pas_rightFoldWithInitialObject_accumulate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__NSArray__PASAdditions___pas_leftFoldWithInitialObject_accumulate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __64__NSArray__PASAdditions___pas_proxyArrayWithObject_repetitions___block_invoke(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 40) <= a2)
  {
    id result = (id)objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Index %tu out of range", a2, 0);
    __break(1u);
  }
  else
  {
    id v2 = *(void **)(a1 + 32);
    return v2;
  }
  return result;
}

uint64_t __64__NSArray__PASAdditions___pas_proxyArrayWithObject_repetitions___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

@end