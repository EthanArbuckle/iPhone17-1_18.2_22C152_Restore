@interface _UITextFieldEditingProcessor
- (_UITextFieldEditingProcessorDelegate)delegate;
- (id)beginEditingWithTextStorage:(id)a3;
- (id)overridingEditingAttributesForAttributes:(id)a3 withOverrides:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation _UITextFieldEditingProcessor

- (id)beginEditingWithTextStorage:(id)a3
{
  id v4 = a3;
  v5 = [(_UITextFieldEditingProcessor *)self delegate];
  v6 = [v5 editingProcessorOverridingEditingAttributes:self];

  v7 = [v6 allKeys];
  if ([v6 count])
  {
    v8 = [[_UITextFieldEditingToken alloc] initWithTextStorage:v4 attributeNames:v7];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60___UITextFieldEditingProcessor_beginEditingWithTextStorage___block_invoke;
    v11[3] = &unk_1E530B2E0;
    v11[4] = self;
    v11[5] = v6;
    v11[6] = v8;
    [v4 coordinateAccess:v11];
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)overridingEditingAttributesForAttributes:(id)a3 withOverrides:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *(void *)off_1E52D2048;
  uint64_t v8 = [v6 objectForKeyedSubscript:*(void *)off_1E52D2048];
  uint64_t v9 = *(void *)off_1E52D2040;
  uint64_t v10 = [v6 objectForKeyedSubscript:*(void *)off_1E52D2040];
  if (v8 | v10)
  {
    v25 = v5;
    v11 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v24 = v6;
    v12 = [v6 allKeys];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (!v8
            || (char v18 = [*(id *)(*((void *)&v26 + 1) + 8 * i) isEqualToString:v7],
                uint64_t v19 = v8,
                (v18 & 1) == 0))
          {
            if (!v10) {
              continue;
            }
            int v20 = [v17 isEqualToString:v9];
            uint64_t v19 = v10;
            if (!v20) {
              continue;
            }
          }
          [v11 setObject:v19 forKeyedSubscript:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v14);
    }

    id v5 = v25;
    if (v25)
    {
      v21 = [v25 objectForKeyedSubscript:@"_UILastStoredDefaultTextAttributesName"];

      if (!v21) {
        [v11 setObject:v25 forKeyedSubscript:@"_UILastStoredDefaultTextAttributesName"];
      }
    }
    v22 = (void *)[v11 copy];

    id v6 = v24;
  }
  else
  {
    v22 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v22;
}

- (_UITextFieldEditingProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITextFieldEditingProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end