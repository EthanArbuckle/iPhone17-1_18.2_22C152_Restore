@interface SKUIShareTemplateURLItemProvider
- (SKUIShareTemplateURLItemProvider)initWithTemplateElement:(id)a3;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)item;
@end

@implementation SKUIShareTemplateURLItemProvider

- (SKUIShareTemplateURLItemProvider)initWithTemplateElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIShareTemplateURLItemProvider initWithTemplateElement:]();
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__85;
  v17 = __Block_byref_object_dispose__85;
  id v18 = 0;
  v6 = [v5 activities];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__SKUIShareTemplateURLItemProvider_initWithTemplateElement___block_invoke;
  v12[3] = &unk_1E6429948;
  v12[4] = &v13;
  [v6 enumerateObjectsUsingBlock:v12];

  uint64_t v7 = v14[5];
  v11.receiver = self;
  v11.super_class = (Class)SKUIShareTemplateURLItemProvider;
  v8 = [(UIActivityItemProvider *)&v11 initWithPlaceholderItem:v7];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_templateElement, a3);
  }
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __60__SKUIShareTemplateURLItemProvider_initWithTemplateElement___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  v6 = [a2 URL];
  if (v6)
  {
    id v10 = v6;
    uint64_t v7 = [v6 URL];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v6 = v10;
    *a4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
  }
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  templateElement = self->_templateElement;
  id v5 = [(UIActivityItemProvider *)self activityType];
  v6 = [(SKUIShareTemplateViewElement *)templateElement activityForUIActivityType:v5];

  uint64_t v7 = [v6 title];
  uint64_t v8 = [v7 text];
  v9 = [v8 string];

  return v9;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  id v10 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__85;
  v25 = __Block_byref_object_dispose__85;
  id v26 = 0;
  templateElement = self->_templateElement;
  v12 = [(UIActivityItemProvider *)self activityType];
  uint64_t v13 = [(SKUIShareTemplateViewElement *)templateElement activityForUIActivityType:v12];

  v14 = [v13 image];
  uint64_t v15 = [v14 URL];
  if (v15)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURL:v15];
    [v16 setITunesStoreRequest:0];
    v17 = [[SKUIStyledImageDataConsumer alloc] initWithViewElement:v14];
    -[SKUIStyledImageDataConsumer setImageSize:](v17, "setImageSize:", width, height);
    [v16 setDataConsumer:v17];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __103__SKUIShareTemplateURLItemProvider_activityViewController_thumbnailImageForActivityType_suggestedSize___block_invoke;
    v20[3] = &unk_1E6424970;
    v20[4] = &v21;
    [v16 setOutputBlock:v20];
    [v16 main];
  }
  id v18 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v18;
}

void __103__SKUIShareTemplateURLItemProvider_activityViewController_thumbnailImageForActivityType_suggestedSize___block_invoke(uint64_t a1, void *a2)
{
}

- (id)item
{
  templateElement = self->_templateElement;
  v3 = [(UIActivityItemProvider *)self activityType];
  v4 = [(SKUIShareTemplateViewElement *)templateElement activityForUIActivityType:v3];

  id v5 = [v4 URL];
  v6 = [v5 URL];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)initWithTemplateElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIShareTemplateURLItemProvider initWithTemplateElement:]";
}

@end