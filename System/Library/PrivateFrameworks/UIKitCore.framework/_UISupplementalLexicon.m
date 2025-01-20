@interface _UISupplementalLexicon
- (NSArray)items;
- (_UISupplementalLexicon)initWithItems:(id)a3;
- (_UISupplementalLexicon)initWithItems:(id)a3 searchPrefixes:(unint64_t)a4;
- (_UISupplementalLexicon)initWithItems:(id)a3 searchPrefixes:(unint64_t)a4 andTISupplementalLexicon:(id)a5;
- (_UISupplementalLexicon)initWithRTISupplementalLexicon:(id)a3;
- (id)description;
- (unint64_t)searchPrefixes;
- (void)dealloc;
@end

@implementation _UISupplementalLexicon

- (_UISupplementalLexicon)initWithItems:(id)a3 searchPrefixes:(unint64_t)a4 andTISupplementalLexicon:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_UISupplementalLexicon;
  v11 = [(_UISupplementalLexicon *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_items, a3);
    v12->_searchPrefixes = a4;
    objc_storeStrong(&v12->_internal, a5);
    v13 = supplementalItemQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80___UISupplementalLexicon_initWithItems_searchPrefixes_andTISupplementalLexicon___block_invoke;
    block[3] = &unk_1E52D9F70;
    id v17 = v9;
    dispatch_sync(v13, block);

    v14 = +[UIKeyboardImpl sharedInstance];
    [v14 addSupplementalLexicon:v12];
  }
  return v12;
}

- (_UISupplementalLexicon)initWithItems:(id)a3 searchPrefixes:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_UISupplementalLexicon;
  v7 = [(_UISupplementalLexicon *)&v25 init];
  if (v7)
  {
    v8 = v7;
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v7->_items, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(v9, "addObject:", *(void *)(*(void *)(*((void *)&v21 + 1) + 8 * v14++) + 8), (void)v21);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    int v15 = [MEMORY[0x1E4FAE430] instancesRespondToSelector:sel_initWithItems_searchPrefixes_];
    id v16 = objc_alloc(MEMORY[0x1E4FAE430]);
    if (v15) {
      uint64_t v17 = [v16 initWithItems:v9 searchPrefixes:a4 & 3];
    }
    else {
      uint64_t v17 = [v16 initWithItems:v9];
    }
    v19 = (void *)v17;
    objc_super v18 = -[_UISupplementalLexicon initWithItems:searchPrefixes:andTISupplementalLexicon:](v8, "initWithItems:searchPrefixes:andTISupplementalLexicon:", v10, a4, v17, (void)v21);
  }
  else
  {
    objc_super v18 = 0;
  }

  return v18;
}

- (_UISupplementalLexicon)initWithItems:(id)a3
{
  return [(_UISupplementalLexicon *)self initWithItems:a3 searchPrefixes:0];
}

- (_UISupplementalLexicon)initWithRTISupplementalLexicon:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UISupplementalLexicon;
  v5 = [(_UISupplementalLexicon *)&v14 init];
  if (v5)
  {
    id v6 = [v4 lexicon];
    id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v8 = [v6 items];
    id v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57___UISupplementalLexicon_initWithRTISupplementalLexicon___block_invoke;
    v12[3] = &unk_1E530DB60;
    id v13 = v9;
    id v10 = v9;
    [v4 enumerateSupplementalItems:v12];
    v5 = -[_UISupplementalLexicon initWithItems:searchPrefixes:andTISupplementalLexicon:](v5, "initWithItems:searchPrefixes:andTISupplementalLexicon:", v10, [v6 searchPrefixes] & 3, v6);
  }
  return v5;
}

- (void)dealloc
{
  v3 = supplementalItemQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33___UISupplementalLexicon_dealloc__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  dispatch_sync(v3, block);

  id v4 = +[UIKeyboardImpl sharedInstance];
  [v4 removeSupplementalLexicon:self];

  v5.receiver = self;
  v5.super_class = (Class)_UISupplementalLexicon;
  [(_UISupplementalLexicon *)&v5 dealloc];
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p; identifier=%llu",
    objc_opt_class(),
    self,
  v3 = [self->_internal identifier]);
  id v4 = v3;
  if (self->_searchPrefixes)
  {
    [v3 appendString:@", searchPrefixesScanSet="];
    unint64_t searchPrefixes = self->_searchPrefixes;
    if (searchPrefixes)
    {
      [v4 appendString:@"@"];
      unint64_t searchPrefixes = self->_searchPrefixes;
    }
    if ((searchPrefixes & 2) != 0) {
      [v4 appendString:@"#"];
    }
  }
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_items, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = self->_items;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) description];
        [v6 addObject:v12];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [v6 componentsJoinedByString:@", "];
  [v4 appendFormat:@", items={ %@ }>", v13];

  return v4;
}

- (NSArray)items
{
  return self->_items;
}

- (unint64_t)searchPrefixes
{
  return self->_searchPrefixes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong(&self->_internal, 0);
}

@end