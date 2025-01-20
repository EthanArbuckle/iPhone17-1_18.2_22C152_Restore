@interface MRCreateSectionsForRequest
@end

@implementation MRCreateSectionsForRequest

void ___onQueue_MRCreateSectionsForRequest_block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) block];
  v2 = (void *)(*((uint64_t (**)(id, void, void))v6 + 2))(v6, 0, *(void *)(a1 + 40));
  if (v2)
  {
    uint64_t v3 = _onClientQueue_MRCreateSectionsForRequest(*(void **)(a1 + 48), v6, *(void **)(a1 + 56), *(void **)(a1 + 40));
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

@end