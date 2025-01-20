@interface SKUIReportAConcernTemplateViewElement
- (NSArray)reasonElements;
- (NSString)reportConcernExplanation;
- (NSURL)reportConcernURL;
- (SKUIReportAConcernTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (int64_t)itemIdentifier;
@end

@implementation SKUIReportAConcernTemplateViewElement

- (SKUIReportAConcernTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReportAConcernTemplateViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIReportAConcernTemplateViewElement;
  v11 = [(SKUIViewElement *)&v19 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"src"];
    uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
    reportConcernURL = v11->_reportConcernURL;
    v11->_reportConcernURL = (NSURL *)v13;

    v15 = [v8 getAttribute:@"data-content-id"];
    v11->_itemIdentifier = [v15 longLongValue];

    uint64_t v16 = [v8 getAttribute:@"data-explanation"];
    reportConcernExplanation = v11->_reportConcernExplanation;
    v11->_reportConcernExplanation = (NSString *)v16;
  }
  return v11;
}

- (NSArray)reasonElements
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SKUIReportAConcernTemplateViewElement_reasonElements__block_invoke;
  v7[3] = &unk_1E6423570;
  id v8 = v3;
  id v4 = v3;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v7];
  v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

void __55__SKUIReportAConcernTemplateViewElement_reasonElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (NSURL)reportConcernURL
{
  return self->_reportConcernURL;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)reportConcernExplanation
{
  return self->_reportConcernExplanation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportConcernExplanation, 0);

  objc_storeStrong((id *)&self->_reportConcernURL, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIReportAConcernTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end