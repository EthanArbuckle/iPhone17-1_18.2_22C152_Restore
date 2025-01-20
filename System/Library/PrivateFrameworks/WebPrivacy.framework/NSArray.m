@interface NSArray
@end

@implementation NSArray

void __67__NSArray_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 40) setObject:v3 atIndexedSubscript:*(void *)(a1 + 48)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __67__NSArray_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end