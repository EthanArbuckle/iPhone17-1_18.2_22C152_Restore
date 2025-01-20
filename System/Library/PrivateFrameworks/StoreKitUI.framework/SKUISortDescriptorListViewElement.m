@interface SKUISortDescriptorListViewElement
- (NSArray)sortDescriptorViewElements;
- (void)sortDescriptorViewElements;
@end

@implementation SKUISortDescriptorListViewElement

- (NSArray)sortDescriptorViewElements
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISortDescriptorListViewElement sortDescriptorViewElements]();
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__43;
  v10 = __Block_byref_object_dispose__43;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SKUISortDescriptorListViewElement_sortDescriptorViewElements__block_invoke;
  v5[3] = &unk_1E6422498;
  v5[4] = &v6;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __63__SKUISortDescriptorListViewElement_sortDescriptorViewElements__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 elementType] == 125)
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v3)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v3 addObject:v7];
  }
}

- (void)sortDescriptorViewElements
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISortDescriptorListViewElement sortDescriptorViewElements]";
}

@end