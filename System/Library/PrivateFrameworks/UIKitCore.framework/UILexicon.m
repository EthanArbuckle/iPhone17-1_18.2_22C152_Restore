@interface UILexicon
+ (id)_lexiconWithTILexicon:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)entries;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation UILexicon

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(UILexicon);
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_entries copyItems:1];
  entries = v4->_entries;
  v4->_entries = (NSArray *)v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v6 = [(UILexicon *)self entries];
    v7 = [v5 entries];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(UILexicon *)self entries];
      v9 = [v5 entries];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (id)_lexiconWithTILexicon:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = objc_msgSend(v3, "entries", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = +[UILexiconEntry _entryWithTILexiconEntry:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        [(NSArray *)v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v11 = objc_alloc_init(UILexicon);
  entries = v11->_entries;
  v11->_entries = v4;

  return v11;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
}

@end