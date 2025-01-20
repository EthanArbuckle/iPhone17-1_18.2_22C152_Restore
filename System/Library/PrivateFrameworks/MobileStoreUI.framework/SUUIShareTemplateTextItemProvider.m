@interface SUUIShareTemplateTextItemProvider
- (SUUIShareTemplateTextItemProvider)initWithTemplateElement:(id)a3 clientContext:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)item;
@end

@implementation SUUIShareTemplateTextItemProvider

- (SUUIShareTemplateTextItemProvider)initWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIShareTemplateTextItemProvider;
  v9 = [(UIActivityItemProvider *)&v12 initWithPlaceholderItem:&stru_2704F8130];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_templateElement, a3);
  }

  return v10;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  templateElement = self->_templateElement;
  v5 = [(UIActivityItemProvider *)self activityType];
  v6 = [(SUUIShareTemplateViewElement *)templateElement activityForUIActivityType:v5];

  id v7 = [v6 title];
  id v8 = [v7 text];
  v9 = [v8 string];

  return v9;
}

- (id)item
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__14;
  v20 = __Block_byref_object_dispose__14;
  id v21 = 0;
  templateElement = self->_templateElement;
  v4 = [(UIActivityItemProvider *)self activityType];
  v5 = [(SUUIShareTemplateViewElement *)templateElement activityForUIActivityType:v4];

  if (v5)
  {
    v6 = [v5 contentSourceURL];
    if (v6)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v6];
      id v8 = [MEMORY[0x263F7B410] consumer];
      [v7 setDataConsumer:v8];

      v9 = [(SUUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
      [v7 setStoreFrontSuffix:v9];

      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __41__SUUIShareTemplateTextItemProvider_item__block_invoke;
      v15[3] = &unk_265401FF0;
      v15[4] = &v16;
      [v7 setOutputBlock:v15];
      [v7 main];
    }
    else
    {
      id v7 = [v5 message];
      v10 = [v7 text];
      uint64_t v11 = [v10 string];
      objc_super v12 = (void *)v17[5];
      v17[5] = v11;
    }
  }
  id v13 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v13;
}

void __41__SUUIShareTemplateTextItemProvider_item__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = (objc_class *)NSString;
    id v4 = a2;
    uint64_t v5 = [[v3 alloc] initWithData:v4 encoding:4];

    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end