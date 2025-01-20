@interface SKUIContextActionsConfiguration
- (SKUIContextActionsConfiguration)initWithDialogTemplate:(id)a3;
- (SKUIContextActionsPresentationSource)presentationSource;
- (SKUIDialogTemplateViewElement)dialogTemplate;
- (id)_resourceImageForImageElement:(id)a3;
- (id)contextActions;
- (void)setDialogTemplate:(id)a3;
- (void)setPresentationSource:(id)a3;
@end

@implementation SKUIContextActionsConfiguration

- (SKUIContextActionsConfiguration)initWithDialogTemplate:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContextActionsConfiguration initWithDialogTemplate:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIContextActionsConfiguration;
  v6 = [(SKUIContextActionsConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dialogTemplate, a3);
  }

  return v7;
}

- (id)contextActions
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = [(SKUIContextActionsConfiguration *)self dialogTemplate];
  id v5 = [v4 buttons];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v11 = [v10 buttonText];
        v12 = [v11 attributedStringWithDefaultFont:0 foregroundColor:0 style:0];
        v13 = [v12 string];

        v14 = [v10 buttonImage];
        v15 = [(SKUIContextActionsConfiguration *)self _resourceImageForImageElement:v14];

        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __49__SKUIContextActionsConfiguration_contextActions__block_invoke;
        v19[3] = &unk_1E6428E78;
        v19[4] = v10;
        v16 = [MEMORY[0x1E4FB1858] actionWithTitle:v13 resource:v15 handler:v19];
        [v3 addObject:v16];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  v17 = (void *)[v3 copy];

  return v17;
}

uint64_t __49__SKUIContextActionsConfiguration_contextActions__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  *a3 = 1;
  return result;
}

- (id)_resourceImageForImageElement:(id)a3
{
  id v3 = a3;
  v4 = [v3 resourceName];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = SKUIImageWithResourceName(v4);
    uint64_t v7 = [v3 style];
    uint64_t v8 = [v7 imageMaskColor];

    if (v8)
    {
      objc_super v9 = [v8 color];

      if (v9)
      {
        v10 = [v8 color];
        uint64_t v11 = [v6 _flatImageWithColor:v10];

        uint64_t v6 = (void *)v11;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (SKUIContextActionsPresentationSource)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(id)a3
{
}

- (SKUIDialogTemplateViewElement)dialogTemplate
{
  return self->_dialogTemplate;
}

- (void)setDialogTemplate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogTemplate, 0);

  objc_storeStrong((id *)&self->_presentationSource, 0);
}

- (void)initWithDialogTemplate:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIContextActionsConfiguration initWithDialogTemplate:]";
}

@end