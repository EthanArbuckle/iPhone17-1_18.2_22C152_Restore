@interface UITextPasteItem
- (BOOL)forcesDefaultAttributes;
- (NSArray)supportedPasteConfigurationClasses;
- (NSDictionary)defaultAttributes;
- (NSDictionary)documentOptions;
- (NSItemProvider)itemProvider;
- (UITextPasteCoordinator)coordinator;
- (UITextPasteItem)initWithTextPasteCoordinator:(id)a3;
- (id)attributedStringFromAttributedString:(id)a3 preservingAttributes:(id)a4 addingAttributes:(id)a5;
- (id)localObject;
- (void)setAttachmentResult:(id)a3;
- (void)setAttributedStringResult:(id)a3;
- (void)setDefaultAttributes:(id)a3;
- (void)setDefaultResult;
- (void)setDocumentOptions:(id)a3;
- (void)setForcesDefaultAttributes:(BOOL)a3;
- (void)setItemProvider:(id)a3;
- (void)setLocalObject:(id)a3;
- (void)setNoResult;
- (void)setStringResult:(id)a3;
- (void)setSupportedPasteConfigurationClasses:(id)a3;
@end

@implementation UITextPasteItem

- (UITextPasteItem)initWithTextPasteCoordinator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextPasteItem;
  v6 = [(UITextPasteItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_coordinator, a3);
  }

  return v7;
}

- (void)setStringResult:(id)a3
{
  coordinator = self->_coordinator;
  id v5 = (objc_class *)MEMORY[0x1E4F28B18];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v9 = [(UITextPasteItem *)self defaultAttributes];
  v8 = (void *)[v7 initWithString:v6 attributes:v9];

  [(UITextPasteCoordinator *)coordinator setResult:v8 forItem:self];
}

- (void)setAttributedStringResult:(id)a3
{
}

- (void)setAttachmentResult:(id)a3
{
  coordinator = self->_coordinator;
  id v5 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:a3];
  [(UITextPasteCoordinator *)coordinator setResult:v5 forItem:self];
}

- (void)setNoResult
{
}

- (void)setDefaultResult
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__UITextPasteItem_setDefaultResult__block_invoke;
  aBlock[3] = &unk_1E530B0B8;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  v4 = [(UITextPasteItem *)self localObject];
  if (!v4 || ((*((uint64_t (**)(void *, UITextPasteItem *, void *))v3 + 2))(v3, self, v4) & 1) == 0)
  {
    id v5 = [(UITextPasteItem *)self supportedPasteConfigurationClasses];
    if (v5
      && ([(UITextPasteItem *)self itemProvider],
          id v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 _highestFidelityClassForLoading:v5],
          v6,
          v7))
    {
      v8 = [(UITextPasteItem *)self itemProvider];
      id v9 = [(UITextPasteItem *)self documentOptions];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __35__UITextPasteItem_setDefaultResult__block_invoke_2;
      v11[3] = &unk_1E530B0E0;
      v11[4] = self;
      id v12 = v3;
      id v10 = (id)[v8 _loadObjectOfClass:v7 userInfo:v9 completionHandler:v11];
    }
    else
    {
      [(UITextPasteItem *)self setNoResult];
    }
  }
}

uint64_t __35__UITextPasteItem_setDefaultResult__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 absoluteString];
    [v5 setStringResult:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 setStringResult:v6];
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v5 forcesDefaultAttributes])
      {
        v14[0] = *MEMORY[0x1E4F243C0];
        v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        id v9 = *(void **)(a1 + 32);
        id v10 = [v5 defaultAttributes];
        uint64_t v11 = [v9 attributedStringFromAttributedString:v6 preservingAttributes:v8 addingAttributes:v10];

        id v6 = (id)v11;
      }
      [v5 setAttributedStringResult:v6];
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v12 = 0;
      goto LABEL_11;
    }
    uint64_t v7 = objc_opt_new();
    [v7 setImage:v6];
    [v5 setAttachmentResult:v7];
  }

LABEL_10:
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

void __35__UITextPasteItem_setDefaultResult__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (!v6 || ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) == 0) {
    [*(id *)(a1 + 32) setNoResult];
  }
}

- (id)attributedStringFromAttributedString:(id)a3 preservingAttributes:(id)a4 addingAttributes:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v20 = a5;
  id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v10 = [v7 string];
  uint64_t v11 = (void *)[v9 initWithString:v10];

  uint64_t v12 = [v11 length];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v8;
  uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __94__UITextPasteItem_attributedStringFromAttributedString_preservingAttributes_addingAttributes___block_invoke;
        v22[3] = &unk_1E530B108;
        id v23 = v11;
        uint64_t v24 = v17;
        objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v17, 0, v12, 0, v22);
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  objc_msgSend(v11, "addAttributes:range:", v20, 0, v12);
  v18 = (void *)[v11 copy];

  return v18;
}

uint64_t __94__UITextPasteItem_attributedStringFromAttributedString_preservingAttributes_addingAttributes___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *(void *)(result + 40), a2, a3, a4);
  }
  return result;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (id)localObject
{
  return self->_localObject;
}

- (void)setLocalObject:(id)a3
{
}

- (NSDictionary)defaultAttributes
{
  return self->_defaultAttributes;
}

- (void)setDefaultAttributes:(id)a3
{
}

- (UITextPasteCoordinator)coordinator
{
  return self->_coordinator;
}

- (NSArray)supportedPasteConfigurationClasses
{
  return self->_supportedPasteConfigurationClasses;
}

- (void)setSupportedPasteConfigurationClasses:(id)a3
{
}

- (BOOL)forcesDefaultAttributes
{
  return self->_forcesDefaultAttributes;
}

- (void)setForcesDefaultAttributes:(BOOL)a3
{
  self->_forcesDefaultAttributes = a3;
}

- (NSDictionary)documentOptions
{
  return self->_documentOptions;
}

- (void)setDocumentOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentOptions, 0);
  objc_storeStrong((id *)&self->_supportedPasteConfigurationClasses, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_defaultAttributes, 0);
  objc_storeStrong(&self->_localObject, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end