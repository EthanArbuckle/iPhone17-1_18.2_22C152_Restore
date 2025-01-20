@interface UIPhysicalButtonContact
@end

@implementation UIPhysicalButtonContact

uint64_t __71___UIPhysicalButtonContact__appendProemDescriptionSansSelfToFormatter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appendFormat:@"{%.*g, %.*g}", 3, *(void *)(*(void *)(a1 + 32) + 40), 3, *(void *)(*(void *)(a1 + 32) + 48)];
}

uint64_t __71___UIPhysicalButtonContact__appendProemDescriptionSansSelfToFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 appendFormat:@"{%.*g, %.*g}", 3, *(void *)(*(void *)(a1 + 32) + 56), 3, *(void *)(*(void *)(a1 + 32) + 64)];
}

uint64_t __67___UIPhysicalButtonContact__appendDebugBodyDescriptionToFormatter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appendFormat:@"{%.*g, %.*g}", 3, *(void *)(*(void *)(a1 + 32) + 40), 3, *(void *)(*(void *)(a1 + 32) + 48)];
}

uint64_t __67___UIPhysicalButtonContact__appendDebugBodyDescriptionToFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 appendFormat:@"{%.*g, %.*g}", 3, *(void *)(*(void *)(a1 + 32) + 56), 3, *(void *)(*(void *)(a1 + 32) + 64)];
}

uint64_t __57___UIPhysicalButtonContact_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return -[_UIPhysicalButtonContact _appendProemDescriptionSansSelfToFormatter:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

void __60___UIPhysicalButtonContact__appendDebugDescriptionToStream___block_invoke_2(uint64_t a1)
{
}

void __66___UIPhysicalButtonContact_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  v2 = (void *)a1[2].i64[0];
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66___UIPhysicalButtonContact_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  int8x16_t v5 = a1[2];
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __66___UIPhysicalButtonContact_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
}

@end