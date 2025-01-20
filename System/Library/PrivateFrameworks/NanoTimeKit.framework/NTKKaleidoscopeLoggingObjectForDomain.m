@interface NTKKaleidoscopeLoggingObjectForDomain
@end

@implementation NTKKaleidoscopeLoggingObjectForDomain

void ___NTKKaleidoscopeLoggingObjectForDomain_block_invoke(uint64_t a1)
{
  v2 = [NSString stringWithCString:*(void *)(a1 + 40) encoding:4];
  v3 = [v2 substringFromIndex:objc_msgSend(@"NTKKaleidoscopeLoggingDomain", "length")];

  id v7 = v3;
  os_log_t v4 = os_log_create("com.apple.NanoTimeKit.Kaleidoscope", (const char *)[v7 cStringUsingEncoding:4]);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = (void *)_NTKKaleidoscopeLoggingObjectForDomain___logObjects[v5];
  _NTKKaleidoscopeLoggingObjectForDomain___logObjects[v5] = v4;
}

@end