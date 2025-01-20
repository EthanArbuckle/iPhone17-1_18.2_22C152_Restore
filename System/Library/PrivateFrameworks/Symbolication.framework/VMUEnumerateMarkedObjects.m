@interface VMUEnumerateMarkedObjects
@end

@implementation VMUEnumerateMarkedObjects

uint64_t ___VMUEnumerateMarkedObjects_block_invoke(uint64_t result)
{
  uint64_t v1 = s_currentMarkingContext;
  if (s_currentMarkingContext)
  {
    uint64_t v2 = result;
    do
    {
      *(_DWORD *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) += *(_DWORD *)(v1 + 28);
      if (*(void *)(v2 + 32))
      {
        unint64_t v3 = *(unsigned int *)(v1 + 20);
        if (v3)
        {
          unint64_t v4 = 0;
          uint64_t v5 = *(unsigned int *)(v1 + 12) + v1;
          do
          {
            if (*(void *)(v5 + 8 * v4))
            {
              result = [*(id *)(v2 + 32) addObject:];
              unint64_t v3 = *(unsigned int *)(v1 + 20);
            }
            ++v4;
          }
          while (v4 < v3);
        }
      }
      uint64_t v1 = *(void *)(v1 + 32);
    }
    while (v1);
  }
  return result;
}

@end