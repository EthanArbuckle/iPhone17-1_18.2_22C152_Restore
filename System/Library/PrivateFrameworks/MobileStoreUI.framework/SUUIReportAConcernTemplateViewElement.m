@interface SUUIReportAConcernTemplateViewElement
- (NSArray)reasonElements;
- (NSString)reportConcernExplanation;
- (NSURL)reportConcernURL;
- (SUUIReportAConcernTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (int64_t)itemIdentifier;
@end

@implementation SUUIReportAConcernTemplateViewElement

- (SUUIReportAConcernTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIReportAConcernTemplateViewElement;
  v9 = [(SUUIViewElement *)&v17 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"src"];
    uint64_t v11 = [NSURL URLWithString:v10];
    reportConcernURL = v9->_reportConcernURL;
    v9->_reportConcernURL = (NSURL *)v11;

    v13 = [v8 getAttribute:@"data-content-id"];
    v9->_itemIdentifier = [v13 longLongValue];

    uint64_t v14 = [v8 getAttribute:@"data-explanation"];
    reportConcernExplanation = v9->_reportConcernExplanation;
    v9->_reportConcernExplanation = (NSString *)v14;
  }
  return v9;
}

- (NSArray)reasonElements
{
  v3 = [MEMORY[0x263EFF980] array];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SUUIReportAConcernTemplateViewElement_reasonElements__block_invoke;
  v7[3] = &unk_2654008B8;
  id v8 = v3;
  id v4 = v3;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v7];
  v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

void __55__SUUIReportAConcernTemplateViewElement_reasonElements__block_invoke(uint64_t a1, void *a2)
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

@end