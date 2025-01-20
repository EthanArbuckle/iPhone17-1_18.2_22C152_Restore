@interface NSCompoundPredicate
@end

@implementation NSCompoundPredicate

void __78__NSCompoundPredicate_VideosUICore__vui_predicateWithSubpredicateFilterBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7 != v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  if (v7)
  {
    [*(id *)(a1 + 32) addObject:v7];
    v6 = v7;
  }
}

@end