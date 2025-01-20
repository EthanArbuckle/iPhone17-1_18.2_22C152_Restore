@interface THModelSearchIndexTerm
- (BOOL)containsOccurrenceOfWord:(id)a3;
- (BOOL)p_inflection:(id)a3 matchesWord:(id)a4;
- (NSArray)inflections;
- (NSString)stem;
- (THModelSearchIndexTerm)initWithStem:(id)a3;
- (id)addInflection:(id)a3;
- (void)dealloc;
- (void)enumerateOccurrencesOfWord:(id)a3 withBlock:(id)a4;
- (void)enumerateOccurrencesWithBlock:(id)a3;
@end

@implementation THModelSearchIndexTerm

- (THModelSearchIndexTerm)initWithStem:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THModelSearchIndexTerm;
  v4 = [(THModelSearchIndexTerm *)&v6 init];
  if (v4)
  {
    v4->mInflections = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v4->mStem = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THModelSearchIndexTerm;
  [(THModelSearchIndexTerm *)&v3 dealloc];
}

- (id)addInflection:(id)a3
{
  v4 = [[THModelSearchIndexInflection alloc] initWithInflection:a3];
  [(NSMutableArray *)self->mInflections addObject:v4];
  v5 = v4;
  return v4;
}

- (void)enumerateOccurrencesWithBlock:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  mInflections = self->mInflections;
  id v5 = [(NSMutableArray *)mInflections countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(mInflections);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = (char *)[v9 occurrenceCount];
        v11 = (char *)[v9 occurrences];
        if (v10)
        {
          v12 = v11;
          do
          {
            (*((void (**)(id, void *, char *))a3 + 2))(a3, v9, v12);
            v12 += 24;
            --v10;
          }
          while (v10);
        }
      }
      id v6 = [(NSMutableArray *)mInflections countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (BOOL)p_inflection:(id)a3 matchesWord:(id)a4
{
  if ([a3 isEqualToString:a4]) {
    return 1;
  }
  uint64_t v7 = +[NSString stringWithFormat:@"%@ ", a4];

  return [a3 hasPrefix:v7];
}

- (void)enumerateOccurrencesOfWord:(id)a3 withBlock:(id)a4
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  mInflections = self->mInflections;
  id v8 = [(NSMutableArray *)mInflections countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(mInflections);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (-[THModelSearchIndexTerm p_inflection:matchesWord:](self, "p_inflection:matchesWord:", [v12 inflection], a3))
        {
          long long v13 = (char *)[v12 occurrenceCount];
          long long v14 = (char *)[v12 occurrences];
          if (v13)
          {
            long long v15 = v14;
            do
            {
              (*((void (**)(id, char *))a4 + 2))(a4, v15);
              v15 += 24;
              --v13;
            }
            while (v13);
          }
          return;
        }
      }
      id v9 = [(NSMutableArray *)mInflections countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
}

- (BOOL)containsOccurrenceOfWord:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mInflections = self->mInflections;
  id v6 = [(NSMutableArray *)mInflections countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mInflections);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (-[THModelSearchIndexTerm p_inflection:matchesWord:](self, "p_inflection:matchesWord:", [v10 inflection], a3)&& objc_msgSend(v10, "occurrenceCount"))
        {
          LOBYTE(v6) = 1;
          return (char)v6;
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v6 = [(NSMutableArray *)mInflections countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return (char)v6;
}

- (NSString)stem
{
  return self->mStem;
}

- (NSArray)inflections
{
  return &self->mInflections->super;
}

@end