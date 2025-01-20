@interface GenerateQuestionsAction
@end

@implementation GenerateQuestionsAction

void ___GenerateQuestionsAction_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F8B008]];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 BOOLValue];

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end