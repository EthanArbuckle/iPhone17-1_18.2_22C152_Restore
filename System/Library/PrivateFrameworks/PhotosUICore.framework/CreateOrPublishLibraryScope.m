@interface CreateOrPublishLibraryScope
@end

@implementation CreateOrPublishLibraryScope

void ___CreateOrPublishLibraryScope_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = ___CreateOrPublishLibraryScope_block_invoke_2;
    v7[3] = &unk_1E5DD07C0;
    id v6 = v3;
    id v8 = v6;
    [v5 performChanges:v7];
    _FinishAssistantForSharedLibrary(v6, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 72), *(void **)(a1 + 56), *(void **)(a1 + 64));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t ___CreateOrPublishLibraryScope_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSharedLibrary:*(void *)(a1 + 32)];
}

@end