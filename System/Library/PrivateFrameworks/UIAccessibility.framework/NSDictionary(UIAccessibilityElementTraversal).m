@interface NSDictionary(UIAccessibilityElementTraversal)
- (id)_accessibilityLeafDescendantsWithCount:()UIAccessibilityElementTraversal shouldStopAtRemoteElement:options:treeLogger:;
@end

@implementation NSDictionary(UIAccessibilityElementTraversal)

- (id)_accessibilityLeafDescendantsWithCount:()UIAccessibilityElementTraversal shouldStopAtRemoteElement:options:treeLogger:
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if (([v9 shouldReturnScannerGroups] & 1) == 0)
  {
    v22 = a1;
    _AXAssert();
  }
  if (objc_msgSend(v9, "shouldReturnScannerGroups", v22))
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    v12 = [a1 objectForKeyedSubscript:@"GroupElements"];
    uint64_t v13 = 2 * ([v9 direction] == 2);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __133__NSDictionary_UIAccessibilityElementTraversal___accessibilityLeafDescendantsWithCount_shouldStopAtRemoteElement_options_treeLogger___block_invoke;
    v23[3] = &unk_1E59B8D30;
    id v14 = v11;
    id v24 = v14;
    char v27 = a4;
    id v25 = v9;
    id v26 = v10;
    [v12 enumerateObjectsWithOptions:v13 usingBlock:v23];
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    [v15 setObject:v14 forKeyedSubscript:@"GroupElements"];
    v16 = [a1 objectForKeyedSubscript:@"GroupTraits"];
    if (v16) {
      [v15 setObject:v16 forKeyedSubscript:@"GroupTraits"];
    }
    v17 = [a1 objectForKeyedSubscript:@"GroupScanBehaviorTraits"];
    [v15 setObject:v17 forKeyedSubscript:@"GroupScanBehaviorTraits"];

    v18 = [a1 objectForKeyedSubscript:@"GroupLabel"];
    if (v18) {
      [v15 setObject:v18 forKeyedSubscript:@"GroupLabel"];
    }
    v19 = [a1 objectForKeyedSubscript:@"GroupIdentifier"];
    if (v19) {
      [v15 setObject:v19 forKeyedSubscript:@"GroupIdentifier"];
    }
    v28[0] = v15;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  }
  else
  {
    id v14 = 0;
    v20 = 0;
  }

  return v20;
}

@end