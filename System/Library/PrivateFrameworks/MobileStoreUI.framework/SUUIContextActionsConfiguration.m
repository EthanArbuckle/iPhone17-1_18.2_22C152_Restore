@interface SUUIContextActionsConfiguration
- (SUUIContextActionsConfiguration)initWithDialogTemplate:(id)a3;
- (SUUIContextActionsPresentationSource)presentationSource;
- (SUUIDialogTemplateViewElement)dialogTemplate;
- (id)_resourceImageForImageElement:(id)a3;
- (id)contextActions;
- (void)setDialogTemplate:(id)a3;
- (void)setPresentationSource:(id)a3;
@end

@implementation SUUIContextActionsConfiguration

- (SUUIContextActionsConfiguration)initWithDialogTemplate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIContextActionsConfiguration;
  v6 = [(SUUIContextActionsConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dialogTemplate, a3);
  }

  return v7;
}

- (id)contextActions
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = [(SUUIContextActionsConfiguration *)self dialogTemplate];
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
        v15 = [(SUUIContextActionsConfiguration *)self _resourceImageForImageElement:v14];

        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __49__SUUIContextActionsConfiguration_contextActions__block_invoke;
        v19[3] = &unk_265403B98;
        v19[4] = v10;
        v16 = [MEMORY[0x263F82848] actionWithTitle:v13 resource:v15 handler:v19];
        [v3 addObject:v16];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  v17 = (void *)[v3 copy];
  return v17;
}

uint64_t __49__SUUIContextActionsConfiguration_contextActions__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
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
    uint64_t v6 = SUUIImageWithResourceName(v4);
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

- (SUUIContextActionsPresentationSource)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(id)a3
{
}

- (SUUIDialogTemplateViewElement)dialogTemplate
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

@end