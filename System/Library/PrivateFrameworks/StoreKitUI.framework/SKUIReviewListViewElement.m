@interface SKUIReviewListViewElement
- (NSArray)items;
- (int64_t)pageComponentType;
- (void)items;
- (void)pageComponentType;
@end

@implementation SKUIReviewListViewElement

- (NSArray)items
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReviewListViewElement items]();
  }
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__SKUIReviewListViewElement_items__block_invoke;
  v6[3] = &unk_1E6423570;
  id v4 = v3;
  id v7 = v4;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __34__SKUIReviewListViewElement_items__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 103 || objc_msgSend(v3, "elementType") == 102) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (int64_t)pageComponentType
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReviewListViewElement pageComponentType]();
  }
  return 21;
}

- (void)items
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIReviewListViewElement items]";
}

- (void)pageComponentType
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIReviewListViewElement pageComponentType]";
}

@end