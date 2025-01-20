@interface SKUIShareTemplateImageItemProvider
- (SKUIShareTemplateImageItemProvider)initWithTemplateElement:(id)a3;
- (id)item;
@end

@implementation SKUIShareTemplateImageItemProvider

- (SKUIShareTemplateImageItemProvider)initWithTemplateElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIShareTemplateImageItemProvider initWithTemplateElement:]();
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1818]);
  v10.receiver = self;
  v10.super_class = (Class)SKUIShareTemplateImageItemProvider;
  v7 = [(UIActivityItemProvider *)&v10 initWithPlaceholderItem:v6];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_templateElement, a3);
  }

  return v8;
}

- (id)item
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  v16 = __Block_byref_object_dispose__20;
  id v17 = 0;
  v3 = [(UIActivityItemProvider *)self activityType];
  if ([MEMORY[0x1E4F42710] activityTypeShouldProvideImage:v3])
  {
    v4 = [(SKUIShareTemplateViewElement *)self->_templateElement activityForUIActivityType:v3];
    id v5 = [v4 image];
    id v6 = [v5 URL];
    if (v6)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURL:v6];
      [v7 setITunesStoreRequest:0];
      v8 = [[SKUIStyledImageDataConsumer alloc] initWithViewElement:v5];
      -[SKUIStyledImageDataConsumer setImageSize:](v8, "setImageSize:", 100.0, 100.0);
      [v7 setDataConsumer:v8];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __42__SKUIShareTemplateImageItemProvider_item__block_invoke;
      v11[3] = &unk_1E6424970;
      v11[4] = &v12;
      [v7 setOutputBlock:v11];
      [v7 main];
    }
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v9;
}

void __42__SKUIShareTemplateImageItemProvider_item__block_invoke(uint64_t a1, void *a2)
{
}

- (void).cxx_destruct
{
}

- (void)initWithTemplateElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIShareTemplateImageItemProvider initWithTemplateElement:]";
}

@end