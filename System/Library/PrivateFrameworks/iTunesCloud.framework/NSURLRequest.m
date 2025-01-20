@interface NSURLRequest
@end

@implementation NSURLRequest

void __56__NSURLRequest_ICAdditions__ic_valueForHTTPHeaderField___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if (![*(id *)(a1 + 32) caseInsensitiveCompare:a2])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

@end