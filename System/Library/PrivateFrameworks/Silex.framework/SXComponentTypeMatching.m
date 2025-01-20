@interface SXComponentTypeMatching
- (NSMutableArray)descriptions;
- (SXComponentTypeMatching)init;
- (id)match:(id)a3;
- (void)addDescription:(id)a3;
- (void)removeDescription:(id)a3;
@end

@implementation SXComponentTypeMatching

- (SXComponentTypeMatching)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXComponentTypeMatching;
  v2 = [(SXComponentTypeMatching *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    descriptions = v2->_descriptions;
    v2->_descriptions = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)match:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = [(SXComponentTypeMatching *)self descriptions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v6)
  {
    v22 = 0;
    v8 = 0;
    goto LABEL_16;
  }
  uint64_t v7 = v6;
  v22 = 0;
  v8 = 0;
  uint64_t v9 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      v12 = [v4 type];
      v13 = [v11 type];
      int v14 = [v12 isEqualToString:v13];

      if (v14)
      {
        if (![v11 role])
        {
          v16 = v22;
          v22 = v11;
          v17 = v8;
LABEL_11:
          id v18 = v11;

          v8 = v17;
          continue;
        }
        int v15 = [v11 role];
        v16 = v8;
        v17 = v11;
        if (v15 == [v4 role]) {
          goto LABEL_11;
        }
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v7);
LABEL_16:

  if (v8) {
    v19 = v8;
  }
  else {
    v19 = v22;
  }
  id v20 = v19;

  return v20;
}

- (void)addDescription:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SXComponentTypeMatching *)self descriptions];
    [v5 addObject:v4];
  }
}

- (void)removeDescription:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SXComponentTypeMatching *)self descriptions];
    [v5 removeObject:v4];
  }
}

- (NSMutableArray)descriptions
{
  return self->_descriptions;
}

- (void).cxx_destruct
{
}

@end