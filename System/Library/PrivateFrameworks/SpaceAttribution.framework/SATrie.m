@interface SATrie
- (BOOL)isAncestor:(id)a3;
- (BOOL)isOverlapping:(id)a3;
- (BOOL)isSuccessor:(id)a3;
- (SATrie)init;
- (TrieNode)root;
- (id)getAncestorOfPath:(id)a3;
- (id)getPathsComponents:(id)a3;
- (void)clearPaths;
- (void)insertPath:(id)a3;
- (void)setRoot:(id)a3;
@end

@implementation SATrie

- (SATrie)init
{
  v6.receiver = self;
  v6.super_class = (Class)SATrie;
  v2 = [(SATrie *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    root = v2->_root;
    v2->_root = (TrieNode *)v3;
  }
  return v2;
}

- (void)clearPaths
{
  self->_root = 0;
  _objc_release_x1();
}

- (id)getPathsComponents:(id)a3
{
  uint64_t v3 = [a3 componentsSeparatedByString:@"/"];
  id v4 = [v3 mutableCopy];

  [v4 removeObject:&stru_10004D5B8];
  return v4;
}

- (void)insertPath:(id)a3
{
  id v4 = [(SATrie *)self getPathsComponents:a3];
  v5 = self->_root;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      v9 = 0;
      v10 = v5;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v9);
        v12 = [(TrieNode *)v10 children];
        v13 = [v12 objectForKeyedSubscript:v11];

        if (!v13)
        {
          v14 = objc_opt_new();
          v15 = [(TrieNode *)v10 children];
          [v15 setObject:v14 forKeyedSubscript:v11];
        }
        v16 = [(TrieNode *)v10 children];
        v5 = [v16 objectForKeyedSubscript:v11];

        v9 = (char *)v9 + 1;
        v10 = v5;
      }
      while (v7 != v9);
      id v7 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  [(TrieNode *)v5 setIsEndOfPath:1];
}

- (id)getAncestorOfPath:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [(SATrie *)self getPathsComponents:v4];
  id v7 = self->_root;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      uint64_t v11 = 0;
      v12 = v7;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v11);
        v14 = [(TrieNode *)v12 children];
        v15 = [v14 objectForKeyedSubscript:v13];

        if (!v15)
        {
          if ([(TrieNode *)v12 isEndOfPath])
          {
            long long v17 = [v5 componentsJoinedByString:@"/"];
            id v9 = [@"/" stringByAppendingString:v17];
          }
          else
          {
            id v9 = 0;
          }
          id v7 = v12;
          goto LABEL_14;
        }
        [v5 addObject:v13];
        v16 = [(TrieNode *)v12 children];
        id v7 = [v16 objectForKeyedSubscript:v13];

        uint64_t v11 = (char *)v11 + 1;
        v12 = v7;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v9;
}

- (BOOL)isSuccessor:(id)a3
{
  uint64_t v3 = [(SATrie *)self getAncestorOfPath:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isAncestor:(id)a3
{
  BOOL v4 = [(SATrie *)self getPathsComponents:a3];
  v5 = self->_root;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v5;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v10);
        uint64_t v13 = [(TrieNode *)v11 children];
        v14 = [v13 objectForKeyedSubscript:v12];

        if (!v14)
        {
          BOOL v17 = 0;
          v16 = v6;
          goto LABEL_11;
        }
        v15 = [(TrieNode *)v11 children];
        v5 = [v15 objectForKeyedSubscript:v12];

        uint64_t v10 = (char *)v10 + 1;
        uint64_t v11 = v5;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v16 = [(TrieNode *)v5 children];
  BOOL v17 = [v16 count] != 0;
  uint64_t v11 = v5;
LABEL_11:

  return v17;
}

- (BOOL)isOverlapping:(id)a3
{
  id v4 = a3;
  v5 = [(SATrie *)self getPathsComponents:v4];
  id v6 = self->_root;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    char v11 = 1;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v14 = [(TrieNode *)v6 children];
        v15 = [v14 objectForKeyedSubscript:v13];

        if (v15)
        {
          v16 = [(TrieNode *)v6 children];
          uint64_t v17 = [v16 objectForKeyedSubscript:v13];

          id v6 = (TrieNode *)v17;
        }
        else
        {
          if ([(TrieNode *)v6 isEndOfPath])
          {
            BOOL v18 = 1;
            long long v19 = v7;
            goto LABEL_17;
          }
          char v11 = 0;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }

    if ((v11 & 1) == 0)
    {
      BOOL v18 = 0;
      goto LABEL_18;
    }
  }
  else
  {
  }
  long long v19 = [(TrieNode *)v6 children];
  BOOL v18 = [v19 count] != 0;
LABEL_17:

LABEL_18:
  return v18;
}

- (TrieNode)root
{
  return (TrieNode *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRoot:(id)a3
{
}

- (void).cxx_destruct
{
}

@end