@interface UIRTree
@end

@implementation UIRTree

void __23___UIRTree_description__block_invoke(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void *)(v12 + 24);
  *(void *)(v12 + 24) = v13 + 1;
  if (v13) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:@";"];
  }
  v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v16 = [NSNumber numberWithUnsignedInteger:a2];
  v18.origin.x = a3;
  v18.origin.y = a4;
  v18.size.width = a5;
  v18.size.height = a6;
  v15 = NSStringFromCGRect(v18);
  [v14 appendFormat:@"%@:%@", v16, v15];
}

uint64_t __37___UIRTree_enumerateFramesWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  return (*(uint64_t (**)(__n128, double, __n128, double))(*(void *)(a1 + 32) + 16))(*a4, a4->n128_f64[1], a4[1], a4[1].n128_f64[1]);
}

uint64_t __27___UIRTree__frameForIndex___block_invoke(uint64_t result, uint64_t a2, double a3, double a4, double a5, double a6)
{
  if (*(void *)(result + 40) == a2)
  {
    v6 = *(double **)(*(void *)(result + 32) + 8);
    v6[6] = a3;
    v6[7] = a4;
    v6[8] = a5;
    v6[9] = a6;
  }
  return result;
}

@end