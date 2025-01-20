@interface SKUIRowViewElement
- (NSArray)columns;
- (NSString)type;
- (SKUIRowViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (int64_t)pageComponentType;
@end

@implementation SKUIRowViewElement

- (SKUIRowViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIRowViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIRowViewElement;
  v11 = [(SKUIViewElement *)&v15 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    uint64_t v12 = [v8 getAttribute:@"type"];
    type = v11->_type;
    v11->_type = (NSString *)v12;
  }
  return v11;
}

- (NSArray)columns
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__SKUIRowViewElement_columns__block_invoke;
  v6[3] = &unk_1E6423570;
  id v4 = v3;
  id v7 = v4;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __29__SKUIRowViewElement_columns__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 21) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (int64_t)pageComponentType
{
  return 3;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRowViewElement initWithDOMElement:parent:elementFactory:]";
}

@end