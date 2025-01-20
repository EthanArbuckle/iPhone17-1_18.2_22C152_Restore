@interface NSMutableURLRequest
@end

@implementation NSMutableURLRequest

void __57__NSMutableURLRequest_ICAdditions__ic_appendHTTPCookies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  if ([v5 length]) {
    [*(id *)(a1 + 32) appendString:@"; "];
  }
  id v8 = (id)[[NSString alloc] initWithFormat:@"%@=%@", v7, v6];

  [*(id *)(a1 + 32) appendString:v8];
}

@end