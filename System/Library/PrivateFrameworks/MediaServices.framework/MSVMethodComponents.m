@interface MSVMethodComponents
@end

@implementation MSVMethodComponents

void ___MSVMethodComponents_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v4 = [*(id *)(a1 + 32) lastObject];
    v5 = [v4 stringByAppendingString:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) removeLastObject];
    [*(id *)(a1 + 32) addObject:v5];

    id v3 = v8;
  }
  if ([v3 length])
  {
    char v6 = 1;
    id v7 = v8;
LABEL_5:
    [*(id *)(a1 + 32) addObject:v7];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
    goto LABEL_7;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    char v6 = 0;
    id v7 = *(id *)(a1 + 40);
    goto LABEL_5;
  }
LABEL_7:
}

@end