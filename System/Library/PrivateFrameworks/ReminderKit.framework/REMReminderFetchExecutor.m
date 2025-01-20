@interface REMReminderFetchExecutor
+ (BOOL)supportsSecureCoding;
- (NSArray)sortDescriptors;
- (REMReminderFetchExecutor)initWithCoder:(id)a3;
- (REMReminderFetchExecutor)initWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(unint64_t)a5;
- (REMReminderPredicateDescriptor)predicateDescriptor;
- (id)description;
- (id)resultsFromFetchResult:(id)a3 inList:(id)a4 error:(id *)a5;
- (id)resultsFromFetchResult:(id)a3 inParentReminder:(id)a4 error:(id *)a5;
- (id)resultsFromFetchResult:(id)a3 inStore:(id)a4 error:(id *)a5;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setPredicateDescriptor:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation REMReminderFetchExecutor

- (REMReminderFetchExecutor)initWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMReminderFetchExecutor;
  v11 = [(REMReminderFetchExecutor *)&v14 init];
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

- (REMReminderFetchExecutor)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REMReminderFetchExecutor;
  v5 = [(_REMFetchExecutor *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicateDescriptor"];
    predicateDescriptor = v5->_predicateDescriptor;
    v5->_predicateDescriptor = (REMReminderPredicateDescriptor *)v6;

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
  v7.receiver = self;
  v7.super_class = (Class)REMReminderFetchExecutor;
  id v4 = a3;
  [(_REMFetchExecutor *)&v7 encodeWithCoder:v4];
  v5 = [(REMReminderFetchExecutor *)self predicateDescriptor];
  [v4 encodeObject:v5 forKey:@"predicateDescriptor"];

  uint64_t v6 = [(REMReminderFetchExecutor *)self sortDescriptors];
  [v4 encodeObject:v6 forKey:@"sortDescriptors"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMReminderFetchExecutor options](self, "options"), @"options");
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMReminderFetchExecutor *)self predicateDescriptor];
  uint64_t v6 = [(REMReminderFetchExecutor *)self sortDescriptors];
  objc_super v7 = [v3 stringWithFormat:@"<%@: %p predicate: %@, sortDescriptors: %@>", v4, self, v5, v6];

  return v7;
}

- (id)resultsFromFetchResult:(id)a3 inStore:(id)a4 error:(id *)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = [v6 fetchedAccountStorages];
  v65 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v64 = v6;
  id v10 = [v6 fetchedAccountStorages];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v82 objects:v90 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v83 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [[REMAccount alloc] initWithStore:v7 storage:*(void *)(*((void *)&v82 + 1) + 8 * i)];
        v16 = [(REMAccount *)v15 objectID];
        [v65 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v82 objects:v90 count:16];
    }
    while (v12);
  }

  id v17 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v18 = [v64 fetchedListStorages];
  v19 = objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v20 = [v64 fetchedListStorages];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v78 objects:v89 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v79;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v79 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v78 + 1) + 8 * j);
        v26 = [v25 accountID];
        v27 = [v65 objectForKeyedSubscript:v26];

        v28 = [[REMList alloc] initWithStore:v7 account:v27 storage:v25];
        v29 = [(REMList *)v28 objectID];
        [v19 setObject:v28 forKeyedSubscript:v29];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v78 objects:v89 count:16];
    }
    while (v22);
  }

  id v30 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v31 = [v64 fetchedReminderStorages];
  v32 = objc_msgSend(v30, "initWithCapacity:", objc_msgSend(v31, "count"));

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v33 = [v64 fetchedReminderStorages];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v74 objects:v88 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v75;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v75 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v74 + 1) + 8 * k);
        v39 = [v38 listID];

        if (v39)
        {
          v40 = [v38 listID];
          v41 = [v19 objectForKeyedSubscript:v40];

          v42 = [[REMReminder alloc] initWithStore:v7 list:v41 storage:v38];
          v43 = [(REMReminder *)v42 objectID];
          [v32 setObject:v42 forKeyedSubscript:v43];
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v74 objects:v88 count:16];
    }
    while (v35);
  }
  v63 = v19;

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v44 = [v32 allValues];
  uint64_t v45 = [v44 countByEnumeratingWithState:&v70 objects:v87 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v71;
    do
    {
      for (uint64_t m = 0; m != v46; ++m)
      {
        if (*(void *)v71 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = *(void **)(*((void *)&v70 + 1) + 8 * m);
        v50 = [v49 storage];
        v51 = [v50 parentReminderID];
        if (v51)
        {
          v52 = [v32 objectForKeyedSubscript:v51];
          [v49 setParentReminder:v52];
        }
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v70 objects:v87 count:16];
    }
    while (v46);
  }

  id v53 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v54 = [v64 requestedObjectIDs];
  v55 = objc_msgSend(v53, "initWithCapacity:", objc_msgSend(v54, "count"));

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v56 = [v64 requestedObjectIDs];
  uint64_t v57 = [v56 countByEnumeratingWithState:&v66 objects:v86 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v67;
    do
    {
      for (uint64_t n = 0; n != v58; ++n)
      {
        if (*(void *)v67 != v59) {
          objc_enumerationMutation(v56);
        }
        v61 = [v32 objectForKeyedSubscript:*(void *)(*((void *)&v66 + 1) + 8 * n)];
        if (v61) {
          [v55 addObject:v61];
        }
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v66 objects:v86 count:16];
    }
    while (v58);
  }

  return v55;
}

- (id)resultsFromFetchResult:(id)a3 inList:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [v6 fetchedReminderStorages];
  id v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v21 = v6;
  uint64_t v11 = [v6 fetchedReminderStorages];
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
        id v17 = [REMReminder alloc];
        v18 = [v7 store];
        v19 = [(REMReminder *)v17 initWithStore:v18 list:v7 storage:v16];

        [v10 addObject:v19];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  return v10;
}

- (id)resultsFromFetchResult:(id)a3 inParentReminder:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [v6 fetchedReminderStorages];
  id v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = [v6 fetchedReminderStorages];
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
        uint64_t v16 = [REMReminder alloc];
        id v17 = [v7 store];
        v18 = [v7 list];
        v19 = [(REMReminder *)v16 initWithStore:v17 list:v18 storage:v15];

        [(REMReminder *)v19 setParentReminder:v7];
        [v10 addObject:v19];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  return v10;
}

- (REMReminderPredicateDescriptor)predicateDescriptor
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