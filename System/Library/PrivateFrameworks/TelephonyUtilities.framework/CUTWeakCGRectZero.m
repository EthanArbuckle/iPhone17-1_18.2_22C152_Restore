@interface CUTWeakCGRectZero
@end

@implementation CUTWeakCGRectZero

__n128 ____CUTWeakCGRectZero_block_invoke()
{
  uint64_t v0 = CUTWeakLinkSymbol();
  if (v0)
  {
    __n128 result = *(__n128 *)v0;
    long long v2 = *(_OWORD *)(v0 + 16);
    __CUTStaticWeak_CGRectZero = *(_OWORD *)v0;
    *(_OWORD *)&qword_1E940AB40 = v2;
  }
  return result;
}

@end