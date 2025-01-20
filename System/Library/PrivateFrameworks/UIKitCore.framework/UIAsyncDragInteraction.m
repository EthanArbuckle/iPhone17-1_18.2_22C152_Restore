@interface UIAsyncDragInteraction
@end

@implementation UIAsyncDragInteraction

uint64_t __57___UIAsyncDragInteraction__prepareForSession_completion___block_invoke(uint64_t a1, void *a2)
{
  [a2 BOOLValue];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

uint64_t __57___UIAsyncDragInteraction__prepareForSession_completion___block_invoke_2()
{
  return MEMORY[0x1E4F1CC28];
}

uint64_t __57___UIAsyncDragInteraction__prepareForSession_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWithInput:MEMORY[0x1E4F1CC38]];
}

uint64_t __71___UIAsyncDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71___UIAsyncDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke_2()
{
  return MEMORY[0x1E4F1CBF0];
}

uint64_t __71___UIAsyncDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performWithInput:a2];
}

@end