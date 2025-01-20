@interface SXTextSelectionManager
- (NSHashTable)textSelecting;
- (NSString)selectedText;
- (SXTextSelectionManager)init;
- (void)addTextSelecting:(id)a3;
- (void)clearSelection;
@end

@implementation SXTextSelectionManager

- (SXTextSelectionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXTextSelectionManager;
  v2 = [(SXTextSelectionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    textSelecting = v2->_textSelecting;
    v2->_textSelecting = (NSHashTable *)v3;
  }
  return v2;
}

- (NSString)selectedText
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(SXTextSelectionManager *)self textSelecting];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_super v6 = [*(id *)(*((void *)&v8 + 1) + 8 * i) selectedText];
        if (v6)
        {
          id v3 = v6;

          v2 = v3;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (NSString *)v3;
}

- (void)addTextSelecting:(id)a3
{
  id v4 = a3;
  id v5 = [(SXTextSelectionManager *)self textSelecting];
  [v5 addObject:v4];
}

- (void)clearSelection
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(SXTextSelectionManager *)self textSelecting];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) endSelection];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSHashTable)textSelecting
{
  return self->_textSelecting;
}

- (void).cxx_destruct
{
}

@end