@interface ML3SortMapFaultingNameOrderDictionaryEnumerator
@end

@implementation ML3SortMapFaultingNameOrderDictionaryEnumerator

void __62___ML3SortMapFaultingNameOrderDictionaryEnumerator_nextObject__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v12 = [v3 stringForColumnIndex:0];
  uint64_t v4 = [v3 int64ForColumnIndex:1];
  int v5 = [v3 intForColumnIndex:2];

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithML3NameOrder:", v4, v5);
  uint64_t v7 = *(void *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  v9 = v12;
  if (!v12)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a1[6] object:a1[4] file:@"ML3SortMap.m" lineNumber:1226 description:@"got nil name from the sort map!"];

    v9 = 0;
  }
  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a1[6] object:a1[4] file:@"ML3SortMap.m" lineNumber:1227 description:@"valueWithML3NameOrder returned nil!"];

    v9 = v12;
  }
}

@end