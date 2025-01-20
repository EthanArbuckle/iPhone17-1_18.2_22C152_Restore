@interface TLKRichText
- (BOOL)hasContent;
- (BOOL)hasOnlyImage;
- (NSArray)formattedTextItems;
- (id)description;
- (id)filterItemsByType:(unint64_t)a3;
- (id)icons;
- (id)inlineRoundedText;
- (id)stars;
- (id)text;
- (unint64_t)maxLines;
- (void)setFormattedTextItems:(id)a3;
@end

@implementation TLKRichText

- (id)text
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [(TLKRichText *)self formattedTextItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [v9 string];

          if (v10)
          {
            v11 = [v9 string];
            [v3 appendString:v11];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  v17.receiver = self;
  v17.super_class = (Class)TLKRichText;
  v12 = [(TLKMultilineText *)&v17 text];
  v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)[v3 copy];
  }
  v15 = v14;

  return v15;
}

- (NSArray)formattedTextItems
{
  return self->_formattedTextItems;
}

- (BOOL)hasContent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(TLKRichText *)self text];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = [(TLKRichText *)self formattedTextItems];
    uint64_t v5 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) hasContent])
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v5;
}

- (unint64_t)maxLines
{
  v3 = [(TLKRichText *)self stars];
  if ([v3 count])
  {
    unint64_t v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TLKRichText;
    unint64_t v4 = [(TLKMultilineText *)&v6 maxLines];
  }

  return v4;
}

- (id)stars
{
  return [(TLKRichText *)self filterItemsByType:1];
}

- (id)filterItemsByType:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v6 = [(TLKRichText *)self formattedTextItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 _itemType] == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    long long v12 = v5;
  }
  else {
    long long v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (void).cxx_destruct
{
}

- (void)setFormattedTextItems:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_formattedTextItems = &self->_formattedTextItems;
  if (objc_opt_respondsToSelector())
  {
    [(NSArray *)*p_formattedTextItems setObserver:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v7 = *p_formattedTextItems;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            long long v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector()) {
              [v12 setObserver:0];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      id v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_formattedTextItems, a3);
  if (objc_opt_respondsToSelector())
  {
    [(NSArray *)*p_formattedTextItems setObserver:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v13 = *p_formattedTextItems;
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
            if (objc_opt_respondsToSelector()) {
              [v18 setObserver:self];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v15);
      }
    }
  }
  uint64_t v19 = [(TLKObject *)self observer];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    long long v21 = [(TLKObject *)self observer];
    uint64_t v22 = [v21 batchUpdateCount];

    if (!v22)
    {
      uint64_t v23 = [(TLKObject *)self observer];
      [v23 propertiesDidChange];
    }
  }
}

- (BOOL)hasOnlyImage
{
  v3 = [(TLKRichText *)self formattedTextItems];
  if ([v3 count] == 1)
  {
    unint64_t v4 = [(TLKRichText *)self formattedTextItems];
    id v5 = [v4 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v16.receiver = self;
  v16.super_class = (Class)TLKRichText;
  unint64_t v4 = [(TLKMultilineText *)&v16 description];
  [v3 appendString:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(TLKRichText *)self formattedTextItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) description];
        [v3 appendString:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)inlineRoundedText
{
  return [(TLKRichText *)self filterItemsByType:2];
}

- (id)icons
{
  return [(TLKRichText *)self filterItemsByType:3];
}

@end