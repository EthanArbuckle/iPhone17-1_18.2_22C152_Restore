@interface REMListFetchExecutor
+ (BOOL)supportsSecureCoding;
- (NSArray)sortDescriptors;
- (REMListFetchExecutor)initWithCoder:(id)a3;
- (REMListFetchExecutor)initWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(unint64_t)a5;
- (REMListPredicateDescriptor)predicateDescriptor;
- (id)description;
- (id)resultsFromFetchResult:(id)a3 inAccount:(id)a4 error:(id *)a5;
- (id)resultsFromFetchResult:(id)a3 inParentList:(id)a4 error:(id *)a5;
- (id)resultsFromFetchResult:(id)a3 inStore:(id)a4 error:(id *)a5;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setPredicateDescriptor:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation REMListFetchExecutor

- (REMListFetchExecutor)initWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMListFetchExecutor;
  v11 = [(REMListFetchExecutor *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_predicateDescriptor, a3);
    objc_storeStrong((id *)&v12->_sortDescriptors, a4);
    v12->_options = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListFetchExecutor)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REMListFetchExecutor;
  v5 = [(_REMFetchExecutor *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicateDescriptor"];
    predicateDescriptor = v5->_predicateDescriptor;
    v5->_predicateDescriptor = (REMListPredicateDescriptor *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"sortDescriptors"];
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v11;

    v5->_options = [v4 decodeIntegerForKey:@"options"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(REMListFetchExecutor *)self predicateDescriptor];
  [v6 encodeObject:v4 forKey:@"predicateDescriptor"];

  v5 = [(REMListFetchExecutor *)self sortDescriptors];
  [v6 encodeObject:v5 forKey:@"sortDescriptors"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[REMListFetchExecutor options](self, "options"), @"options");
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMListFetchExecutor *)self predicateDescriptor];
  id v6 = [(REMListFetchExecutor *)self sortDescriptors];
  v7 = [v3 stringWithFormat:@"<%@: %p predicate: %@, sortDescriptors: %@>", v4, self, v5, v6];

  return v7;
}

- (id)resultsFromFetchResult:(id)a3 inStore:(id)a4 error:(id *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = [v6 fetchedAccountStorages];
  id v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v42 = v6;
  uint64_t v11 = [v6 fetchedAccountStorages];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [[REMAccount alloc] initWithStore:v7 storage:*(void *)(*((void *)&v53 + 1) + 8 * i)];
        v17 = [(REMAccount *)v16 objectID];
        [v10 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v13);
  }

  id v18 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v19 = [v42 fetchedListStorages];
  v20 = objc_msgSend(v18, "initWithCapacity:", objc_msgSend(v19, "count"));

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = [v42 fetchedListStorages];
  uint64_t v21 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v50 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        v26 = [v25 accountID];
        v27 = [v10 objectForKeyedSubscript:v26];

        v28 = [[REMList alloc] initWithStore:v7 account:v27 storage:v25];
        v29 = [(REMList *)v28 objectID];
        [v20 setObject:v28 forKeyedSubscript:v29];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v22);
  }

  id v30 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v31 = [v42 requestedObjectIDs];
  v32 = objc_msgSend(v30, "initWithCapacity:", objc_msgSend(v31, "count"));

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obja = [v42 requestedObjectIDs];
  uint64_t v33 = [obja countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(obja);
        }
        v37 = [v20 objectForKeyedSubscript:*(void *)(*((void *)&v45 + 1) + 8 * k)];
        v38 = [v37 storage];
        v39 = [v38 parentListID];

        if (v39)
        {
          v40 = [v20 objectForKeyedSubscript:v39];
          [v37 setParentList:v40];
        }
        [v32 addObject:v37];
      }
      uint64_t v34 = [obja countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v34);
  }

  return v32;
}

- (id)resultsFromFetchResult:(id)a3 inAccount:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [v6 fetchedListStorages];
  id v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v21 = v6;
  uint64_t v11 = [v6 fetchedListStorages];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v17 = [REMList alloc];
        id v18 = [v7 store];
        v19 = [(REMList *)v17 initWithStore:v18 account:v7 storage:v16];

        [v10 addObject:v19];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  return v10;
}

- (id)resultsFromFetchResult:(id)a3 inParentList:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [v6 fetchedListStorages];
  id v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = [v6 fetchedListStorages];
  uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = [REMList alloc];
        v17 = [v7 store];
        id v18 = [v7 account];
        v19 = [(REMList *)v16 initWithStore:v17 account:v18 storage:v15];

        [(REMList *)v19 setParentList:v7];
        [v10 addObject:v19];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  return v10;
}

- (REMListPredicateDescriptor)predicateDescriptor
{
  return self->_predicateDescriptor;
}

- (void)setPredicateDescriptor:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);

  objc_storeStrong((id *)&self->_predicateDescriptor, 0);
}

@end