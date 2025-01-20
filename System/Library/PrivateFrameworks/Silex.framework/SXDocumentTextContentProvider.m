@interface SXDocumentTextContentProvider
+ (id)sharedQueue;
- (BOOL)classification:(id)a3 isValidForType:(unint64_t)a4;
- (BOOL)contentRelevance:(unint64_t)a3 isValidForType:(unint64_t)a4;
- (SXDocument)document;
- (SXDocumentTextContentProvider)initWithDocument:(id)a3;
- (id)textContentForComponent:(id)a3 withType:(unint64_t)a4;
- (id)textContentForComponents:(id)a3 withType:(unint64_t)a4;
- (void)textContentForType:(unint64_t)a3 onCompletion:(id)a4;
@end

@implementation SXDocumentTextContentProvider

- (SXDocumentTextContentProvider)initWithDocument:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXDocumentTextContentProvider;
  v6 = [(SXDocumentTextContentProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_document, a3);
  }

  return v7;
}

- (void)textContentForType:(unint64_t)a3 onCompletion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    v7 = +[SXDocumentTextContentProvider sharedQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__SXDocumentTextContentProvider_textContentForType_onCompletion___block_invoke;
    v8[3] = &unk_264652FE0;
    objc_copyWeak(v10, &location);
    v10[1] = (id)a3;
    id v9 = v6;
    dispatch_async(v7, v8);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
}

void __65__SXDocumentTextContentProvider_textContentForType_onCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained document];
    id v5 = [v4 components];
    id v6 = [v3 textContentForComponents:v5 withType:*(void *)(a1 + 48)];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__SXDocumentTextContentProvider_textContentForType_onCompletion___block_invoke_2;
    block[3] = &unk_264652F90;
    id v7 = *(id *)(a1 + 32);
    id v12 = v6;
    id v13 = v7;
    id v8 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__SXDocumentTextContentProvider_textContentForType_onCompletion___block_invoke_3;
    v9[3] = &unk_264652FB8;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v9);
    id v8 = v10;
  }
}

void __65__SXDocumentTextContentProvider_textContentForType_onCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __65__SXDocumentTextContentProvider_textContentForType_onCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)textContentForComponents:(id)a3 withType:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263F089D8] string];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = -[SXDocumentTextContentProvider textContentForComponent:withType:](self, "textContentForComponent:withType:", *(void *)(*((void *)&v15 + 1) + 8 * i), a4, (void)v15);
        if ([v13 length])
        {
          if ([v7 length]) {
            [v7 appendString:@"\n"];
          }
          [v7 appendString:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)textContentForComponent:(id)a3 withType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 classification];
  BOOL v8 = [(SXDocumentTextContentProvider *)self classification:v7 isValidForType:a4];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v6;
      if (-[SXDocumentTextContentProvider contentRelevance:isValidForType:](self, "contentRelevance:isValidForType:", [v9 contentRelevance], a4))
      {
        uint64_t v10 = [v9 text];
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v6 components];
      uint64_t v12 = [(SXDocumentTextContentProvider *)self textContentForComponents:v11 withType:a4];

      uint64_t v10 = (void *)v12;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)classification:(id)a3 isValidForType:(unint64_t)a4
{
  return a4 != 1 || objc_msgSend((id)objc_opt_class(), "role", v4, v5) != 8;
}

- (BOOL)contentRelevance:(unint64_t)a3 isValidForType:(unint64_t)a4
{
  return a3 == 2 || a4 != 1;
}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken != -1) {
    dispatch_once(&sharedQueue_onceToken, &__block_literal_global_53);
  }
  id v2 = (void *)sharedQueue_sharedQueue;
  return v2;
}

void __44__SXDocumentTextContentProvider_sharedQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.news.text-providing", v2);
  uint64_t v1 = (void *)sharedQueue_sharedQueue;
  sharedQueue_sharedQueue = (uint64_t)v0;
}

- (SXDocument)document
{
  return self->_document;
}

- (void).cxx_destruct
{
}

@end