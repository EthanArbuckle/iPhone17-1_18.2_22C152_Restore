@interface SKUITestDataURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (id)canonicalRequestForRequest:(id)a3;
- (void)startLoading;
@end

@implementation SKUITestDataURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUITestDataURLProtocol canInitWithRequest:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  v12 = (void *)MEMORY[0x1C8749310]();
  v13 = [v3 URL];
  v14 = [v13 scheme];

  LOBYTE(v13) = [v14 isEqualToString:@"x-apple-storekitui-test-data"];

  return (char)v13;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUITestDataURLProtocol canonicalRequestForRequest:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }

  return v3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUITestDataURLProtocol requestIsCacheEquivalent:toRequest:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  return 0;
}

- (void)startLoading
{
}

+ (void)canInitWithRequest:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)canonicalRequestForRequest:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestIsCacheEquivalent:(uint64_t)a3 toRequest:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end