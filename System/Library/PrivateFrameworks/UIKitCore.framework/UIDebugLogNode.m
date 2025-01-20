@interface UIDebugLogNode
@end

@implementation UIDebugLogNode

uint64_t __113___UIDebugLogNode___genericAppendChildDescription_withPrefix_inheritedTreeStyle_recursionSelector_appendHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isNode];
}

void __73___UIDebugLogNode__appendChildDescription_withPrefix_inheritedTreeStyle___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a2 _stringRepresentation];
  [v6 appendFormat:@"%@%@", v7, v8];
}

void __83___UIDebugLogNode__appendAttributedChildDescription_withPrefix_inheritedTreeStyle___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (objc_class *)MEMORY[0x1E4F28B18];
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  v10 = (void *)[[v6 alloc] initWithString:v8];

  [v7 appendAttributedString:v10];
  id v11 = [v9 _attributedStringRepresentation];

  [v7 appendAttributedString:v11];
}

@end