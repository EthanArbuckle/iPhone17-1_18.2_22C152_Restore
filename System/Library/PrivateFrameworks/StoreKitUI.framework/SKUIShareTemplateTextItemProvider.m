@interface SKUIShareTemplateTextItemProvider
- (SKUIShareTemplateTextItemProvider)initWithTemplateElement:(id)a3 clientContext:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)item;
@end

@implementation SKUIShareTemplateTextItemProvider

- (SKUIShareTemplateTextItemProvider)initWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIShareTemplateTextItemProvider initWithTemplateElement:clientContext:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIShareTemplateTextItemProvider;
  v9 = [(UIActivityItemProvider *)&v12 initWithPlaceholderItem:&stru_1F1C879E8];
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
  v6 = [(SKUIShareTemplateViewElement *)templateElement activityForUIActivityType:v5];

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
  v19 = __Block_byref_object_copy__47;
  v20 = __Block_byref_object_dispose__47;
  id v21 = 0;
  templateElement = self->_templateElement;
  v4 = [(UIActivityItemProvider *)self activityType];
  v5 = [(SKUIShareTemplateViewElement *)templateElement activityForUIActivityType:v4];

  if (v5)
  {
    v6 = [v5 contentSourceURL];
    if (v6)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURL:v6];
      id v8 = [MEMORY[0x1E4FA8380] consumer];
      [v7 setDataConsumer:v8];

      v9 = [(SKUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
      [v7 setStoreFrontSuffix:v9];

      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __41__SKUIShareTemplateTextItemProvider_item__block_invoke;
      v15[3] = &unk_1E64274D8;
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

void __41__SKUIShareTemplateTextItemProvider_item__block_invoke(uint64_t a1, void *a2)
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

- (void)initWithTemplateElement:clientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIShareTemplateTextItemProvider initWithTemplateElement:clientContext:]";
}

@end