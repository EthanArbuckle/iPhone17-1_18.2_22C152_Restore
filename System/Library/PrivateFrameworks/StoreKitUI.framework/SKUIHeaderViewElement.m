@interface SKUIHeaderViewElement
- (NSArray)titleLabels;
- (SKUIButtonViewElement)button;
- (SKUIHeaderViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (int64_t)pageComponentType;
@end

@implementation SKUIHeaderViewElement

- (SKUIHeaderViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIHeaderViewElement initWithDOMElement:parent:elementFactory:]();
  }
  uint64_t v11 = objc_opt_class();
  if (v11 == objc_opt_class()
    && ([v8 getAttribute:@"type"],
        v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEqualToString:@"browse"],
        v12,
        v13))
  {
    id v14 = v9;
    id v15 = v14;
    if (v14)
    {
      v16 = v14;
      do
      {
        uint64_t v17 = [v16 parent];

        v16 = (void *)v17;
      }
      while (v17);
    }
    v18 = [(SKUIHeaderViewElement *)[SKUIBrowseHeaderViewElement alloc] initWithDOMElement:v8 parent:v15 elementFactory:v10];
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SKUIHeaderViewElement;
    v18 = [(SKUIViewElement *)&v21 initWithDOMElement:v8 parent:v9 elementFactory:v10];
    self = &v18->super;
  }
  p_super = &v18->super;

  return p_super;
}

- (SKUIButtonViewElement)button
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__41;
  id v9 = __Block_byref_object_dispose__41;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__SKUIHeaderViewElement_button__block_invoke;
  v4[3] = &unk_1E6422498;
  v4[4] = &v5;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUIButtonViewElement *)v2;
}

void __31__SKUIHeaderViewElement_button__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (SKUIIKViewElementTypeIsButton([v6 elementType]))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (NSArray)titleLabels
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__SKUIHeaderViewElement_titleLabels__block_invoke;
  v6[3] = &unk_1E6423570;
  id v4 = v3;
  id v7 = v4;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __36__SKUIHeaderViewElement_titleLabels__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 138) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (int64_t)pageComponentType
{
  return 24;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIHeaderViewElement initWithDOMElement:parent:elementFactory:]";
}

@end