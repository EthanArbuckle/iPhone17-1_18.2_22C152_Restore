@interface TUIRenderUpdateArrayContainer
- (BOOL)hasDeletesOrInserts;
- (NSArray)deleted;
- (NSArray)inserted;
- (NSDictionary)updated;
- (NSString)description;
- (TUIRenderModelArrayContaining)current;
- (TUIRenderModelArrayContaining)from;
- (TUIRenderModelArrayContaining)to;
- (TUIRenderUpdateArrayContainer)initWithCurrent:(id)a3 from:(id)a4 to:(id)a5 tracker:(id)a6 flags:(unint64_t)a7;
- (TUIRenderUpdateArrayTracker)tracker;
- (id)newCurrentContainerPlusInserted;
- (id)newToContainerPlusDeletedWithInterests:(id)a3 changes:(id *)a4;
- (void)_compute;
@end

@implementation TUIRenderUpdateArrayContainer

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p deleted=%@ inserted=%@ updated=%@>", v4, self, self->_deleted, self->_inserted, self->_updated];

  return (NSString *)v5;
}

- (TUIRenderUpdateArrayContainer)initWithCurrent:(id)a3 from:(id)a4 to:(id)a5 tracker:(id)a6 flags:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)TUIRenderUpdateArrayContainer;
  v17 = [(TUIRenderUpdateArrayContainer *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_current, a3);
    objc_storeStrong((id *)&v18->_from, a4);
    objc_storeStrong((id *)&v18->_to, a5);
    p_tracker = (void **)&v18->_tracker;
    objc_storeStrong((id *)&v18->_tracker, a6);
    v18->_copyingFlags = a7;
    [(TUIRenderUpdateArrayContainer *)v18 _compute];
    if (!v18->_tracker)
    {
      if ([(NSArray *)v18->_deleted count])
      {
        v20 = objc_alloc_init(TUIRenderUpdateArrayTracker);
        v21 = *p_tracker;
        *p_tracker = v20;
      }
    }
  }

  return v18;
}

- (BOOL)hasDeletesOrInserts
{
  if ([(NSArray *)self->_deleted count] || [(NSArray *)self->_inserted count]) {
    return 1;
  }
  v5 = [(TUIRenderUpdateArrayTracker *)self->_tracker deletedModels];
  BOOL v3 = [v5 count] != 0;

  return v3;
}

- (void)_compute
{
  v50 = [(TUIRenderModelArrayContaining *)self->_from identifierToContainedSubmodelMap];
  v52 = [(TUIRenderModelArrayContaining *)self->_current identifierToContainedSubmodelMap];
  BOOL v3 = [(TUIRenderModelArrayContaining *)self->_to identifierToContainedSubmodelMap];
  id v49 = objc_alloc_init((Class)NSMutableSet);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = [(TUIRenderModelArrayContaining *)self->_from containedSubmodels];
  id v4 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
  v46 = v3;
  if (!v4)
  {
    v47 = 0;
    v51 = 0;
    goto LABEL_24;
  }
  id v5 = v4;
  v47 = 0;
  v51 = 0;
  uint64_t v6 = *(void *)v58;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v58 != v6) {
        objc_enumerationMutation(obj);
      }
      v8 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      v9 = [v8 identifier];
      v10 = [v3 objectForKeyedSubscript:v9];

      if (v10)
      {
        if (v8 == v10) {
          goto LABEL_20;
        }
        tracker = self->_tracker;
        v12 = [v8 identifier];
        id v13 = [(TUIRenderUpdateArrayTracker *)tracker submodelTrackerForIdentifier:v12];

        id v14 = [v8 identifier];
        id v15 = [v52 objectForKeyedSubscript:v14];

        id v16 = [v10 computeContainerUpdateCurrent:v15 from:v8 tracker:v13 flags:0];
        if ([v16 hasDeletesOrInserts])
        {
          v17 = self->_tracker;
          v18 = [v8 identifier];
          [(TUIRenderUpdateArrayTracker *)v17 setSubmodelTracker:v13 forIdentifier:v18];

          v19 = v47;
          if (!v47) {
            v19 = objc_opt_new();
          }
          v20 = [v10 identifier];
          v47 = v19;
          [v19 setObject:v16 forKeyedSubscript:v20];

          BOOL v3 = v46;
        }
      }
      else
      {
        if (!v51) {
          v51 = objc_opt_new();
        }
        id v21 = [(TUIRenderModelArrayContaining *)self->_to copySubmodel:v8 forFinalAppearanceWithFlags:self->_copyingFlags];
        v22 = v21;
        if (v21) {
          id v23 = v21;
        }
        else {
          id v23 = [v8 copyForFinalAppearanceWithFlags:self->_copyingFlags];
        }
        id v13 = v23;

        [v51 addObject:v13];
      }

LABEL_20:
    }
    id v5 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
  }
  while (v5);
LABEL_24:

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v24 = [(TUIRenderModelArrayContaining *)self->_to containedSubmodels];
  id v25 = [v24 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v25)
  {
    id v26 = v25;
    v27 = 0;
    uint64_t v28 = *(void *)v54;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v54 != v28) {
          objc_enumerationMutation(v24);
        }
        v30 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
        v31 = [v30 identifier];
        v32 = [v52 objectForKeyedSubscript:v31];
        if (v32)
        {
          v33 = [v50 objectForKeyedSubscript:v31];

          if (!v33) {
            [v49 addObject:v31];
          }
        }
        else
        {
          if (!v27) {
            v27 = objc_opt_new();
          }
          id v34 = [(TUIRenderModelArrayContaining *)self->_to copySubmodel:v30 forInitialAppearanceWithFlags:self->_copyingFlags];
          v35 = v34;
          if (v34) {
            id v36 = v34;
          }
          else {
            id v36 = [v30 copyForInitialAppearanceWithFlags:self->_copyingFlags];
          }
          v37 = v36;

          [v27 addObject:v37];
          [v49 addObject:v31];
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v26);
  }
  else
  {
    v27 = 0;
  }

  v38 = (NSArray *)[v51 copy];
  deleted = self->_deleted;
  self->_deleted = v38;

  v40 = (NSArray *)[v27 copy];
  inserted = self->_inserted;
  self->_inserted = v40;

  v42 = (NSSet *)[v49 copy];
  insertedForAnimations = self->_insertedForAnimations;
  self->_insertedForAnimations = v42;

  v44 = (NSDictionary *)[v47 copy];
  updated = self->_updated;
  self->_updated = v44;
}

- (id)newToContainerPlusDeletedWithInterests:(id)a3 changes:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(TUIRenderModelArrayContaining *)self->_to identifierToContainedSubmodelMap];
  if ([(NSArray *)self->_deleted count])
  {
    v7 = [(TUIRenderUpdateArrayTracker *)self->_tracker addDeletedInterestInDeletedModels:self->_deleted];
    [v5 addObject:v7];
  }
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  id v49 = sub_B0964;
  v50 = sub_B0974;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = (id *)&v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_B0964;
  v44 = sub_B0974;
  id v45 = 0;
  v8 = [(TUIRenderUpdateArrayTracker *)self->_tracker deletedModels];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_B097C;
  v35[3] = &unk_254828;
  id v9 = v6;
  id v36 = v9;
  v37 = self;
  v38 = &v46;
  v39 = &v40;
  [v8 enumerateKeysAndObjectsUsingBlock:v35];

  if ([(NSDictionary *)self->_updated count])
  {
    if (!v41[5])
    {
      v10 = [(TUIRenderModelArrayContaining *)self->_to containedSubmodels];
      id v11 = [v10 mutableCopy];
      v12 = v11;
      if (!v11) {
        v12 = objc_opt_new();
      }
      objc_storeStrong(v41 + 5, v12);
      if (!v11) {
    }
      }
    updated = self->_updated;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_B0AD4;
    v32[3] = &unk_254878;
    id v34 = &v40;
    v32[4] = self;
    id v33 = v5;
    [(NSDictionary *)updated enumerateKeysAndObjectsUsingBlock:v32];
  }
  if (v47[5]) {
    -[TUIRenderUpdateArrayTracker setDeletedModels:](self->_tracker, "setDeletedModels:");
  }
  if (v31)
  {
    id v14 = objc_alloc_init(TUIRenderUpdateChanges);
    [(TUIRenderUpdateChanges *)v14 setInserts:self->_insertedForAnimations];
    id v15 = [(TUIRenderUpdateArrayContainer *)self updated];
    id v16 = [v15 allKeys];
    v17 = +[NSSet setWithArray:v16];

    if (![v17 count])
    {

      v17 = 0;
    }
    [(TUIRenderUpdateChanges *)v14 setUpdates:v17];

    id v18 = [(TUIRenderUpdateArrayContainer *)self deleted];
    id v19 = objc_alloc_init((Class)NSMutableSet);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v20 = v18;
    id v21 = [v20 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v53;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v53 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = [*(id *)(*((void *)&v52 + 1) + 8 * i) identifier];
          if (v24) {
            [v19 addObject:v24];
          }
        }
        id v21 = [v20 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v21);
    }

    if (![v19 count])
    {

      id v19 = 0;
    }

    [(TUIRenderUpdateChanges *)v14 setDeletes:v19];
    id v25 = v14;
    void *v31 = v25;
  }
  to = self->_to;
  if (v41[5]) {
    v27 = (TUIRenderModelArrayContaining *)-[TUIRenderModelArrayContaining copyWithContainedSubmodels:](to, "copyWithContainedSubmodels:");
  }
  else {
    v27 = to;
  }
  uint64_t v28 = v27;

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v28;
}

- (id)newCurrentContainerPlusInserted
{
  BOOL v3 = self->_current;
  if ([(NSArray *)self->_inserted count])
  {
    id v4 = [(TUIRenderModelArrayContaining *)self->_current containedSubmodels];
    id v5 = [v4 mutableCopy];
    uint64_t v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)objc_opt_new();
    }
    id v8 = v7;

    [v8 addObjectsFromArray:self->_inserted];
  }
  else
  {
    id v8 = 0;
  }
  if ([(NSDictionary *)self->_updated count])
  {
    if (!v8)
    {
      id v9 = [(TUIRenderModelArrayContaining *)self->_current containedSubmodels];
      id v10 = [v9 mutableCopy];
      id v11 = v10;
      if (v10) {
        id v12 = v10;
      }
      else {
        id v12 = (id)objc_opt_new();
      }
      id v8 = v12;
    }
    updated = self->_updated;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_B0DC0;
    v16[3] = &unk_2548A0;
    id v8 = v8;
    id v17 = v8;
    id v18 = self;
    [(NSDictionary *)updated enumerateKeysAndObjectsUsingBlock:v16];
  }
  if (v8)
  {
    id v14 = (TUIRenderModelArrayContaining *)[(TUIRenderModelArrayContaining *)self->_current copyWithContainedSubmodels:v8];

    BOOL v3 = v14;
  }

  return v3;
}

- (TUIRenderModelArrayContaining)current
{
  return self->_current;
}

- (TUIRenderModelArrayContaining)from
{
  return self->_from;
}

- (TUIRenderModelArrayContaining)to
{
  return self->_to;
}

- (TUIRenderUpdateArrayTracker)tracker
{
  return self->_tracker;
}

- (NSArray)deleted
{
  return self->_deleted;
}

- (NSArray)inserted
{
  return self->_inserted;
}

- (NSDictionary)updated
{
  return self->_updated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_current, 0);

  objc_storeStrong((id *)&self->_insertedForAnimations, 0);
}

@end