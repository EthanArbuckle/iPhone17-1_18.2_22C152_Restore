@interface UIAX
@end

@implementation UIAX

uint64_t ___UIAX_CGPathEnumerateElementsUsingBlock_block_invoke(uint64_t result, int *a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
  int v4 = *(unsigned __int8 *)(v2 + 24);
  uint64_t v3 = v2 + 24;
  if (!v4)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)(result + 32);
    uint64_t v8 = *a2;
    if (v8 > 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = qword_186B924F0[v8];
    }
    result = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, void, uint64_t))(v7 + 16))(v7, v8, *((void *)a2 + 1), v9, *(void *)(*(void *)(*(void *)(v6 + 48) + 8) + 24), v3);
    ++*(void *)(*(void *)(*(void *)(v6 + 48) + 8) + 24);
  }
  return result;
}

@end