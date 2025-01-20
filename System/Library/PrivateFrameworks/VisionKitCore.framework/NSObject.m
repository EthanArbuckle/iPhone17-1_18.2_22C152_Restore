@interface NSObject
@end

@implementation NSObject

void __67__NSObject_VKLoggable__vk_loggingDescriptionFromLoggable_isPretty___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 48)
    && (uint64_t v6 = objc_opt_class(), VKDynamicCast(v6, (uint64_t)v5), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    v9 = *(void **)(a1 + 32);
    v10 = objc_msgSend(v7, "vk_prettyDescriptionWithTabLevel:", 1);
    [v9 appendFormat:@"\t%@ = %@\n", v11, v10];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", *(void *)(a1 + 40), v11, v5);
  }
}

@end