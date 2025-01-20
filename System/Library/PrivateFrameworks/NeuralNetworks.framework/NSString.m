@interface NSString
@end

@implementation NSString

void __46__NSString_SNN__initWithOwnedCXXStringNoCopy___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v1 + 48);
  v2 = (void *)(v1 + 48);
  uint64_t v3 = v4;
  void *v2 = 0;
  if (v4) {
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)v2, v3);
  }
}

@end