@interface NSDictionary
@end

@implementation NSDictionary

void __133__NSDictionary_UIAccessibilityElementTraversal___accessibilityLeafDescendantsWithCount_shouldStopAtRemoteElement_options_treeLogger___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 _accessibilityLeafDescendantsWithCount:0 shouldStopAtRemoteElement:*(unsigned __int8 *)(a1 + 56) options:*(void *)(a1 + 40) treeLogger:*(void *)(a1 + 48)];
  [v2 addObjectsFromArray:v3];
}

@end