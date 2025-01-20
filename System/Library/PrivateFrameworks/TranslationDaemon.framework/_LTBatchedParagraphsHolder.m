@interface _LTBatchedParagraphsHolder
- (_LTBatchedParagraphsHolder)init;
- (id)paragraphWithId:(id)a3;
- (id)paragraphs;
- (unint64_t)count;
- (void)completeAllAndCleanWithError:(id)a3;
- (void)insertParagraph:(id)a3 withId:(id)a4;
- (void)removeParagraphWithId:(id)a3;
@end

@implementation _LTBatchedParagraphsHolder

- (_LTBatchedParagraphsHolder)init
{
  v9.receiver = self;
  v9.super_class = (Class)_LTBatchedParagraphsHolder;
  v2 = [(_LTBatchedParagraphsHolder *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    paragraphs = v2->_paragraphs;
    v2->_paragraphs = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    orderedParagraphIds = v2->_orderedParagraphIds;
    v2->_orderedParagraphIds = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_paragraphs count];
}

- (id)paragraphWithId:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_paragraphs objectForKeyedSubscript:a3];
}

- (void)insertParagraph:(id)a3 withId:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_paragraphs objectForKey:v6];

  if (!v7) {
    [(NSMutableArray *)self->_orderedParagraphIds addObject:v6];
  }
  [(NSMutableDictionary *)self->_paragraphs setObject:v8 forKeyedSubscript:v6];
}

- (void)removeParagraphWithId:(id)a3
{
  paragraphs = self->_paragraphs;
  id v5 = a3;
  [(NSMutableDictionary *)paragraphs removeObjectForKey:v5];
  [(NSMutableArray *)self->_orderedParagraphIds removeObject:v5];
}

- (id)paragraphs
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_orderedParagraphIds;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_paragraphs, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        v10 = [v9 requestParagraph];

        if (v10) {
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)completeAllAndCleanWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_paragraphs allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = [v10 completion];

        if (v11)
        {
          long long v12 = [v10 completion];
          ((void (**)(void, void, id))v12)[2](v12, 0, v4);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(NSMutableDictionary *)self->_paragraphs removeAllObjects];
  [(NSMutableArray *)self->_orderedParagraphIds removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedParagraphIds, 0);
  objc_storeStrong((id *)&self->_paragraphs, 0);
}

@end