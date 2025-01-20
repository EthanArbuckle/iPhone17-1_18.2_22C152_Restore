@interface NSNotificationCenter
@end

@implementation NSNotificationCenter

uint64_t __87__NSNotificationCenter_MessageAdditions__mf_addImmediateObserver_selector_name_object___block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 40);
  return [Weak performSelector:v5 withObject:a2];
}

@end