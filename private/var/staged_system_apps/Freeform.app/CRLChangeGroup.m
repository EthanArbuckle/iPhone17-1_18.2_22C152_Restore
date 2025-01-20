@interface CRLChangeGroup
- (CRLChangeGroup)init;
- (CRLChangeGroup)initWithChangesArray:(id)a3;
- (NSArray)changesArray;
- (id)copyWithZone:(_NSZone *)a3;
- (void)registerChange:(unsigned int)a3 details:(id)a4 forChangeSource:(id)a5;
@end

@implementation CRLChangeGroup

- (CRLChangeGroup)initWithChangesArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLChangeGroup;
  v6 = [(CRLChangeGroup *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_changesArray, a3);
  }

  return v7;
}

- (CRLChangeGroup)init
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(CRLChangeGroup *)self initWithChangesArray:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(NSMutableArray *)self->_changesArray mutableCopy];
  id v6 = [v4 initWithChangesArray:v5];

  return v6;
}

- (NSArray)changesArray
{
  id v2 = [(NSMutableArray *)self->_changesArray copy];

  return (NSArray *)v2;
}

- (void)registerChange:(unsigned int)a3 details:(id)a4 forChangeSource:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v23 = self;
  v10 = self->_changesArray;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    v13 = 0;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v17 = [v16 changeSource];

        if (v17 == v9)
        {
          id v18 = v16;

          v13 = v18;
        }
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  v19 = [[_TtC8Freeform15CRLChangeRecord alloc] initWithKind:v6 details:v8];
  if (v13)
  {
    [v13 i_addChange:v19];
  }
  else
  {
    v20 = [CRLChangeEntry alloc];
    v28 = v19;
    v21 = +[NSArray arrayWithObjects:&v28 count:1];
    v22 = [(CRLChangeEntry *)v20 initWithChangeSource:v9 changes:v21];

    [(NSMutableArray *)v23->_changesArray addObject:v22];
  }
}

- (void).cxx_destruct
{
}

@end