@interface TIDocumentWordsAligned
- (NSMutableArray)inDocumentWordsStack;
- (NSMutableDictionary)leftContextToWordMap;
- (TIDocumentWordsAligned)init;
- (id)_wordsFromContext:(id)a3 shouldDelete:(BOOL)a4;
- (id)deleteWordsUpToContext:(id)a3;
- (id)description;
- (id)lastWord;
- (id)matchingLeftContextToWordMapKey:(id)a3;
- (id)preferredLeftContextToWordMapKeyForLeftContext:(id)a3 andMatchingLeftContext:(id)a4;
- (id)wordsForContext:(id)a3;
- (id)wordsFromContext:(id)a3;
- (unint64_t)wordsCount;
- (void)addToContextMap:(id)a3;
- (void)insertWord:(id)a3 atIndex:(int64_t)a4;
- (void)pushWordToDocument:(id)a3;
- (void)removeFromContextMap:(id)a3;
- (void)replaceLeftContextToWordMapKey:(id)a3 withNewKey:(id)a4;
- (void)setInDocumentWordsStack:(id)a3;
- (void)setLeftContextToWordMap:(id)a3;
@end

@implementation TIDocumentWordsAligned

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftContextToWordMap, 0);

  objc_storeStrong((id *)&self->_inDocumentWordsStack, 0);
}

- (void)setLeftContextToWordMap:(id)a3
{
}

- (NSMutableDictionary)leftContextToWordMap
{
  return self->_leftContextToWordMap;
}

- (void)setInDocumentWordsStack:(id)a3
{
}

- (NSMutableArray)inDocumentWordsStack
{
  return self->_inDocumentWordsStack;
}

- (id)lastWord
{
  v2 = [(TIDocumentWordsAligned *)self inDocumentWordsStack];
  v3 = [v2 lastObject];
  v4 = [v3 acceptedString];

  return v4;
}

- (id)description
{
  v2 = [(TIDocumentWordsAligned *)self inDocumentWordsStack];
  v3 = [v2 componentsJoinedByString:@" "];

  return v3;
}

- (unint64_t)wordsCount
{
  v2 = [(TIDocumentWordsAligned *)self inDocumentWordsStack];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)wordsFromContext:(id)a3
{
  return [(TIDocumentWordsAligned *)self _wordsFromContext:a3 shouldDelete:0];
}

- (id)deleteWordsUpToContext:(id)a3
{
  return [(TIDocumentWordsAligned *)self _wordsFromContext:a3 shouldDelete:1];
}

- (id)_wordsFromContext:(id)a3 shouldDelete:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(TIDocumentWordsAligned *)self inDocumentWordsStack];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    v9 = 0;
    goto LABEL_37;
  }
  v9 = [MEMORY[0x1E4F1CA48] array];
  if (v6)
  {
    v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v37 = [v6 stringByTrimmingCharactersInSet:v10];
  }
  else
  {
    v37 = &stru_1F3F7A998;
  }
  if (v8 >= 1)
  {
    BOOL v35 = v4;
    uint64_t v11 = 0;
    while (1)
    {
      v12 = [(TIDocumentWordsAligned *)self inDocumentWordsStack];
      v13 = [v12 objectAtIndexedSubscript:v11];
      v14 = [v13 documentState];
      v15 = [v14 contextBeforeInput];

      v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v17 = [v15 stringByTrimmingCharactersInSet:v16];

      if (([v17 isEqualToString:v6] & 1) != 0
        || [v17 isEqualToString:v37])
      {
        break;
      }

      if (v8 == ++v11)
      {
        uint64_t v11 = -1;
        goto LABEL_16;
      }
    }
    if (v8 > (int)v11)
    {
      uint64_t v18 = (int)v11;
      do
      {
        v19 = [(TIDocumentWordsAligned *)self inDocumentWordsStack];
        v20 = [v19 objectAtIndexedSubscript:v18];
        [v9 addObject:v20];

        ++v18;
      }
      while (v8 != v18);
    }

LABEL_16:
    if (!v35) {
      goto LABEL_36;
    }
    goto LABEL_19;
  }
  uint64_t v11 = -1;
  if (v4)
  {
LABEL_19:
    id v36 = v6;
    if (v11 != -1)
    {
      v21 = [(TIDocumentWordsAligned *)self inDocumentWordsStack];
      objc_msgSend(v21, "removeObjectsInRange:", v11, v8 - v11);
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v34 = v9;
    id v22 = v9;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v43 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          [v27 setDeleted:1];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          v28 = [v27 allEdits];
          uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v39;
            do
            {
              for (uint64_t j = 0; j != v30; ++j)
              {
                if (*(void *)v39 != v31) {
                  objc_enumerationMutation(v28);
                }
                [*(id *)(*((void *)&v38 + 1) + 8 * j) setDeleted:1];
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }
            while (v30);
          }

          [(TIDocumentWordsAligned *)self removeFromContextMap:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v24);
    }

    v9 = v34;
    id v6 = v36;
  }
LABEL_36:

LABEL_37:

  return v9;
}

- (void)insertWord:(id)a3 atIndex:(int64_t)a4
{
  id v11 = a3;
  id v6 = [(TIDocumentWordsAligned *)self inDocumentWordsStack];
  unint64_t v7 = [v6 count];

  uint64_t v8 = [(TIDocumentWordsAligned *)self inDocumentWordsStack];
  v9 = v8;
  if (v7 <= a4)
  {
    [v8 addObject:v11];

    v10 = [(TIDocumentWordsAligned *)self inDocumentWordsStack];
    objc_msgSend(v11, "setSessionIndex:", objc_msgSend(v10, "count"));
  }
  else
  {
    [v8 insertObject:v11 atIndex:a4];

    [v11 setSessionIndex:a4];
  }
  [(TIDocumentWordsAligned *)self addToContextMap:v11];
}

- (void)replaceLeftContextToWordMapKey:(id)a3 withNewKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (([v11 isEqualToString:v6] & 1) == 0)
  {
    unint64_t v7 = [(TIDocumentWordsAligned *)self leftContextToWordMap];
    uint64_t v8 = [v7 objectForKey:v11];

    v9 = [(TIDocumentWordsAligned *)self leftContextToWordMap];
    [v9 setObject:v8 forKey:v6];

    v10 = [(TIDocumentWordsAligned *)self leftContextToWordMap];
    [v10 removeObjectForKey:v11];
  }
}

- (id)preferredLeftContextToWordMapKeyForLeftContext:(id)a3 andMatchingLeftContext:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = a4;
    unint64_t v8 = [v7 length];
    if (v8 <= [v6 length]) {
      v9 = v6;
    }
    else {
      v9 = v7;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

- (id)matchingLeftContextToWordMapKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(TIDocumentWordsAligned *)self leftContextToWordMap];
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v12 isEqualToString:v4])
        {
          id v15 = v12;

          goto LABEL_21;
        }
        unint64_t v13 = [v12 length];
        if (v13 > [v9 length]
          && (([v12 hasPrefix:v4] & 1) == 0
           && [v12 hasSuffix:v4]
           && (unint64_t)[v4 length] > 0xF
           || ([v4 hasPrefix:v12] & 1) == 0
           && [v4 hasSuffix:v12]
           && (unint64_t)[v12 length] >= 0x10))
        {
          id v14 = v12;

          id v9 = v14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v9 = 0;
  }

  id v9 = v9;
  id v15 = v9;
LABEL_21:

  return v15;
}

- (id)wordsForContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v6 = [v4 stringByTrimmingCharactersInSet:v5];

    uint64_t v7 = [(TIDocumentWordsAligned *)self matchingLeftContextToWordMapKey:v6];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      id v9 = [(TIDocumentWordsAligned *)self preferredLeftContextToWordMapKeyForLeftContext:v6 andMatchingLeftContext:v7];
      [(TIDocumentWordsAligned *)self replaceLeftContextToWordMapKey:v8 withNewKey:v9];
      uint64_t v10 = [(TIDocumentWordsAligned *)self leftContextToWordMap];
      id v11 = [v10 objectForKeyedSubscript:v9];
      v12 = (void *)[v11 copy];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)removeFromContextMap:(id)a3
{
  id v8 = a3;
  id v4 = [v8 trimmedDocumentContextBeforeInput];
  id v5 = [(TIDocumentWordsAligned *)self matchingLeftContextToWordMapKey:v4];
  if (v5)
  {
    id v6 = [(TIDocumentWordsAligned *)self leftContextToWordMap];
    uint64_t v7 = [v6 objectForKeyedSubscript:v5];
    [v7 removeObject:v8];
  }
}

- (void)addToContextMap:(id)a3
{
  id v9 = a3;
  id v4 = [v9 trimmedDocumentContextBeforeInput];
  id v5 = [(TIDocumentWordsAligned *)self matchingLeftContextToWordMapKey:v4];
  if (v5)
  {
    id v6 = [(TIDocumentWordsAligned *)self preferredLeftContextToWordMapKeyForLeftContext:v4 andMatchingLeftContext:v5];
    [(TIDocumentWordsAligned *)self replaceLeftContextToWordMapKey:v5 withNewKey:v6];
    uint64_t v7 = [(TIDocumentWordsAligned *)self leftContextToWordMap];
    id v8 = [v7 objectForKeyedSubscript:v6];
    [v8 addObject:v9];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA48] arrayWithObject:v9];
    uint64_t v7 = [(TIDocumentWordsAligned *)self leftContextToWordMap];
    [v7 setObject:v6 forKeyedSubscript:v4];
  }
}

- (void)pushWordToDocument:(id)a3
{
  id v6 = a3;
  id v4 = [(TIDocumentWordsAligned *)self inDocumentWordsStack];
  objc_msgSend(v6, "setSessionIndex:", objc_msgSend(v4, "count"));

  id v5 = [(TIDocumentWordsAligned *)self inDocumentWordsStack];
  [v5 addObject:v6];

  [(TIDocumentWordsAligned *)self addToContextMap:v6];
}

- (TIDocumentWordsAligned)init
{
  v8.receiver = self;
  v8.super_class = (Class)TIDocumentWordsAligned;
  v2 = [(TIDocumentWordsAligned *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    inDocumentWordsStack = v2->_inDocumentWordsStack;
    v2->_inDocumentWordsStack = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    leftContextToWordMap = v2->_leftContextToWordMap;
    v2->_leftContextToWordMap = (NSMutableDictionary *)v5;
  }
  return v2;
}

@end